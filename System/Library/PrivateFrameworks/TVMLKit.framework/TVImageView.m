@interface TVImageView
@end

@implementation TVImageView

void __26___TVImageView__loadImage__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    [v7 setEnableCache:1];
    v10 = [v7 uiImage];
  }
  else
  {
    if (a4)
    {
      v11 = TVMLKitImageLogObject;
      if (os_log_type_enabled((os_log_t)TVMLKitImageLogObject, OS_LOG_TYPE_ERROR)) {
        __26___TVImageView__loadImage__block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v8, v11);
      }
    }
    v10 = 0;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __26___TVImageView__loadImage__block_invoke_17;
  v16[3] = &unk_264BA7658;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  id v12 = WeakRetained;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  char v21 = a4;
  id v14 = v8;
  id v19 = v14;
  v15 = (void (**)(void))MEMORY[0x230FC9DC0](v16);
  if ([MEMORY[0x263F08B88] isMainThread]) {
    v15[2](v15);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v15);
  }

  objc_destroyWeak(&v20);
}

void __26___TVImageView__loadImage__block_invoke_17(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v3 = [WeakRetained imageProxy];
    int v4 = [v3 isEqual:*(void *)(a1 + 32)];

    id WeakRetained = v8;
    if (v4)
    {
      if (*(void *)(a1 + 40) && *(unsigned char *)(a1 + 64))
      {
        objc_msgSend(v8, "_setImage:");
        v5 = [MEMORY[0x263F08A00] defaultCenter];
        [v5 postNotificationName:@"TVMLImageViewImageDidLoadNotification" object:v8];
      }
      [v8 setImageLoaded:*(unsigned __int8 *)(a1 + 64)];
      v6 = [v8 completion];

      id WeakRetained = v8;
      if (v6)
      {
        id v7 = [v8 completion];
        v7[2](v7, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

        id WeakRetained = v8;
        if (*(unsigned char *)(a1 + 64))
        {
          [v8 setCompletion:0];
          id WeakRetained = v8;
        }
      }
    }
  }
}

void __26___TVImageView__loadImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (id)WeakRetained[70] == v2)
  {
    v3 = [WeakRetained completion];
    v3[2](v3, 0, 0, 1);

    [WeakRetained setCompletion:0];
    [WeakRetained setImageLoaded:0];
  }
}

void __26___TVImageView__loadImage__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_230B4C000, log, OS_LOG_TYPE_ERROR, "%@ was unable to load image: %@", (uint8_t *)&v3, 0x16u);
}

@end