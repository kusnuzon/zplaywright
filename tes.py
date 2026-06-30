import asyncio
from playwright.async_api import async_playwright

async def main():
    print("Memulai tes...")
    try:
        async with async_playwright() as p:
            browser = await p.chromium.launch(
                executable_path="/data/data/com.termux/files/usr/bin/chromium-browser",
                headless=True,
                args=["--no-sandbox", "--disable-gpu"]
            )
            page = await browser.new_page()
            await page.goto("https://example.com")
            print("SUKSES! Judul halaman:", await page.title())
            await browser.close()
    except Exception as e:
        print("GAGAL! Errornya:", e)

asyncio.run(main())
