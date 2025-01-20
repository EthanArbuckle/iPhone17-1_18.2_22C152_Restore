@interface ICQUIImageLoader
+ (BOOL)_hasURLForScale:(double)a3 inImageURL:(id)a4;
+ (id)_scaledImageURL:(id)a3;
+ (id)fetchIconForAssetID:(id)a3;
+ (id)fetchIconForBundleID:(id)a3;
+ (void)fetchIconFromIconSpecification:(id)a3 completion:(id)a4;
+ (void)fetchIconFromImageURL:(id)a3 completion:(id)a4;
+ (void)loadImageWithURL:(id)a3 completion:(id)a4;
@end

@implementation ICQUIImageLoader

+ (void)loadImageWithURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [a1 _scaledImageURL:a3];
  v8 = [MEMORY[0x263F08BD8] requestWithURL:v7 cachePolicy:0 timeoutInterval:30.0];
  v9 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  v10 = [MEMORY[0x263F08B98] sharedURLCache];
  [v9 setURLCache:v10];

  v11 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v9];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke;
  v16[3] = &unk_264922390;
  id v17 = v11;
  id v18 = v8;
  id v19 = v6;
  id v12 = v6;
  id v13 = v8;
  id v14 = v11;
  v15 = [v14 dataTaskWithRequest:v13 completionHandler:v16];
  [v15 resume];
}

void __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = _ICQGetLogSystem();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Successfully retrieved image for async image view", v15, 2u);
    }

    id v12 = (void *)[objc_alloc(MEMORY[0x263F086F8]) initWithResponse:v8 data:v7];
    id v13 = [*(id *)(a1 + 32) configuration];
    id v14 = [v13 URLCache];
    [v14 storeCachedResponse:v12 forRequest:*(void *)(a1 + 40)];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke_cold_1(v9, v11);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

+ (void)fetchIconFromIconSpecification:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [v6 imageURL];
  id v9 = [v6 assetID];
  v10 = [v6 bundleID];
  +[_ICQUIHelperFunctions highestScreenScale];
  int v11 = objc_msgSend(a1, "_hasURLForScale:inImageURL:", v8);
  if (v10 || v9 || v11)
  {
    id v12 = [v6 assetID];
    id v13 = [a1 fetchIconForAssetID:v12];

    if (v13)
    {
      id v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        id v19 = v9;
        _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Fetched icon from assets catalog for asset ID %@", (uint8_t *)&v18, 0xCu);
      }

      v7[2](v7, v13);
    }
    else
    {
      v15 = [a1 fetchIconForBundleID:v10];
      v16 = _ICQGetLogSystem();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v17)
        {
          int v18 = 138412290;
          id v19 = v10;
          _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "Fetched icon from IconServices for bundleID %@", (uint8_t *)&v18, 0xCu);
        }

        v7[2](v7, v15);
      }
      else
      {
        if (v17)
        {
          int v18 = 138412290;
          id v19 = v8;
          _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "Fetching remote icon asset from URL %@", (uint8_t *)&v18, 0xCu);
        }

        [a1 fetchIconFromImageURL:v8 completion:v7];
      }
    }
  }
  else
  {
    v7[2](v7, 0);
  }
}

+ (id)fetchIconForAssetID:(id)a3
{
  if (a3)
  {
    v4 = objc_msgSend(MEMORY[0x263F827E8], "icqBundleImageNamed:");
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)fetchIconForBundleID:(id)a3
{
  if (a3)
  {
    v4 = +[_ICQUIHelperFunctions appIconWithSize:120.0 forBundleID:120.0];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)fetchIconFromImageURL:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke;
  v7[3] = &unk_2649223E0;
  id v8 = v5;
  id v6 = v5;
  +[ICQUIImageLoader loadImageWithURL:a3 completion:v7];
}

void __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke_2;
  v5[3] = &unk_2649223B8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __53__ICQUIImageLoader_fetchIconFromImageURL_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x263F827E8], "imageWithData:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v4);
  }
  else
  {
    v2 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v3 = *(void *)(a1 + 40);
    v2(v3, 0);
  }
}

+ (id)_scaledImageURL:(id)a3
{
  id v3 = a3;
  +[_ICQUIHelperFunctions highestScreenScale];
  if ((int)v4 < 3)
  {
    if ((int)v4 == 2) {
      [v3 URL2x];
    }
    else {
    uint64_t v5 = [v3 URL1x];
    }
  }
  else
  {
    uint64_t v5 = [v3 URL3x];
  }
  id v6 = (void *)v5;

  return v6;
}

+ (BOOL)_hasURLForScale:(double)a3 inImageURL:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3 == 1.0)
  {
    id v7 = [v5 URL1x];
  }
  else if (a3 == 2.0)
  {
    id v7 = [v5 URL2x];
  }
  else
  {
    if (a3 != 3.0)
    {
      BOOL v8 = 0;
      goto LABEL_8;
    }
    id v7 = [v5 URL3x];
  }
  BOOL v8 = v7 != 0;

LABEL_8:
  return v8;
}

void __48__ICQUIImageLoader_loadImageWithURL_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Error retrieving image from url: %@", (uint8_t *)&v4, 0xCu);
}

@end