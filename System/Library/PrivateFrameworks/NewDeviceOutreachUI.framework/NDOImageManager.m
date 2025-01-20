@interface NDOImageManager
+ (NDOImageManager)sharedManager;
- (NSCache)imageCache;
- (id)fetchImageWithURLString:(id)a3 completion:(id)a4;
- (id)initPrivate;
- (void)resetCache;
- (void)setImageCache:(id)a3;
@end

@implementation NDOImageManager

+ (NDOImageManager)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__NDOImageManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, block);
  }
  v2 = (void *)sharedManager_shared;
  return (NDOImageManager *)v2;
}

uint64_t __32__NDOImageManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_shared = [objc_alloc(*(Class *)(a1 + 32)) initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)NDOImageManager;
  v2 = [(NDOImageManager *)&v6 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    imageCache = v2->_imageCache;
    v2->_imageCache = v3;
  }
  return v2;
}

- (void)resetCache
{
}

- (id)fetchImageWithURLString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(NDOImageManager *)self imageCache];
  v9 = [v8 objectForKey:v6];

  if (v9)
  {
    v7[2](v7, v9, 0);
    v10 = 0;
  }
  else
  {
    v11 = [NSURL URLWithString:v6];
    if (v11)
    {
      v12 = [MEMORY[0x263F08BF8] sharedSession];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke;
      v19[3] = &unk_264D49640;
      v21 = v7;
      v19[4] = self;
      id v20 = v6;
      v10 = [v12 dataTaskWithURL:v11 completionHandler:v19];

      [v10 resume];
      v13 = v21;
    }
    else
    {
      v14 = _NDOLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[NDOImageManager fetchImageWithURLString:completion:]();
      }

      v15 = (void *)MEMORY[0x263F087E8];
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 bundleIdentifier];
      v13 = [v15 errorWithDomain:v17 code:0 userInfo:0];

      ((void (**)(id, void *, void *))v7)[2](v7, 0, v13);
      v10 = 0;
    }
  }
  return v10;
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v41[2] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = _NDOLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_3();
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_5;
    block[3] = &unk_264D49618;
    id v39 = *(id *)(a1 + 48);
    id v38 = v9;
    dispatch_async(MEMORY[0x263EF83A0], block);

    id v11 = v39;
  }
  else if (v7)
  {
    id v11 = [MEMORY[0x263F827E8] imageWithData:v7];
    if (v11)
    {
      v12 = [*(id *)(a1 + 32) imageCache];
      [v12 setObject:v11 forKey:*(void *)(a1 + 40)];

      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_2;
      v28[3] = &unk_264D49618;
      id v30 = *(id *)(a1 + 48);
      id v29 = v11;
      dispatch_async(MEMORY[0x263EF83A0], v28);

      v13 = v30;
    }
    else
    {
      id v20 = _NDOLogSystem();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_2();
      }

      v40[0] = @"data";
      v40[1] = @"response";
      v41[0] = v7;
      v21 = v8;
      if (!v8)
      {
        v21 = [MEMORY[0x263EFF9D0] null];
      }
      v41[1] = v21;
      v13 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
      if (!v8) {

      }
      v22 = (void *)MEMORY[0x263F087E8];
      v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v24 = [v23 bundleIdentifier];
      v25 = [v22 errorWithDomain:v24 code:2 userInfo:v13];

      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_14;
      v31[3] = &unk_264D49618;
      id v26 = *(id *)(a1 + 48);
      id v32 = v25;
      id v33 = v26;
      id v27 = v25;
      dispatch_async(MEMORY[0x263EF83A0], v31);
    }
  }
  else
  {
    v14 = _NDOLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_1();
    }

    v15 = (void *)MEMORY[0x263F087E8];
    v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v17 = [v16 bundleIdentifier];
    v18 = [v15 errorWithDomain:v17 code:1 userInfo:0];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_6;
    v34[3] = &unk_264D49618;
    id v19 = *(id *)(a1 + 48);
    id v35 = v18;
    id v36 = v19;
    id v11 = v18;
    dispatch_async(MEMORY[0x263EF83A0], v34);
  }
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (NSCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchImageWithURLString:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_238845000, v0, v1, "Image url conversion", v2, v3, v4, v5, v6);
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_238845000, v0, v1, "data error", v2, v3, v4, v5, v6);
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_238845000, v0, v1, "no image error", v2, v3, v4, v5, v6);
}

void __54__NDOImageManager_fetchImageWithURLString_completion___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_238845000, v0, v1, "task error", v2, v3, v4, v5, v6);
}

@end