import requests
import pandas as pd

url = "https://dummyjson.com/products?limit=100"

print("Fetching data from E-commerce Server...")
response = requests.get(url)

if response.status_code == 200:
    data = response.json()

    df = pd.DataFrame(data['products'])

    print(f"We fetched {len(df)} products from the E-commerce Server.")

    print(df[['title', 'brand', 'price', 'stock']].head())

    df.to_csv('products.csv', index=False)
    print("Data saved to products.csv")

else:
    print(f"Failed to fetch data. Error: {response.status_code}")
