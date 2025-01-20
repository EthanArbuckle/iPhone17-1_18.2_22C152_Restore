@interface UINSURLRequestImageLoader
@end

@implementation UINSURLRequestImageLoader

void __48___UINSURLRequestImageLoader__really_loadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    v9 = +[UIImage imageWithData:a2];
    if (v9)
    {
      v10 = v9;
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v9);
    }
    else
    {
      v14 = _UIImageLoadingLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 32);
        int v24 = 134218243;
        uint64_t v25 = v23;
        __int16 v26 = 2113;
        id v27 = v7;
        _os_log_error_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Image loader %p could not create image from URL response: %{private}@", (uint8_t *)&v24, 0x16u);
      }

      uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:0];
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = *(void **)(v16 + 24);
      *(void *)(v16 + 24) = v15;

      v10 = 0;
    }
  }
  else
  {
    v11 = _UIImageLoadingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = [v8 domain];
      uint64_t v20 = [v8 code];
      v21 = [*(id *)(*(void *)(a1 + 32) + 48) HTTPMethod];
      v22 = [*(id *)(*(void *)(a1 + 32) + 48) URL];
      int v24 = 134219011;
      uint64_t v25 = v18;
      __int16 v26 = 2114;
      id v27 = v19;
      __int16 v28 = 2048;
      uint64_t v29 = v20;
      __int16 v30 = 2113;
      v31 = v21;
      __int16 v32 = 2113;
      v33 = v22;
      _os_log_error_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Image loader %p received error: domain=%{public}@ code=%ld request=%{private}@ %{private}@", (uint8_t *)&v24, 0x34u);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v8;
    v10 = *(void **)(v12 + 24);
    *(void *)(v12 + 24) = v13;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end