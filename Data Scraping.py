import requests
from bs4 import BeautifulSoup


url = 'https://www.youtube.com/results?search_query=data+scraping+with+python'
response = requests.get(url)


soup = BeautifulSoup(response.text, 'html.parser')


headers = soup.find_all('a')

for header in headers:
    print(header.get_text())
