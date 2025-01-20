@interface CreateGetPropertyBlock
@end

@implementation CreateGetPropertyBlock

id __mt_CreateGetPropertyBlock_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v23 = 0;
  id v24 = 0;
  char v5 = [v4 getProperty:v3 property:&v24 options:0 error:&v23];
  id v6 = v24;
  id v7 = v23;
  uint64_t v8 = *(void *)(a1 + 40);
  if (v5)
  {
    if (v8)
    {
      if (*(unsigned char *)(v8 + 133)) {
        mt_CachePropertiesForDevice(v8);
      }
      v9 = MTLoggingFramework();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      int v10 = [v6 length];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 64);
      *(_DWORD *)buf = 138543874;
      id v26 = v3;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v10;
      *(_WORD *)&v28[4] = 2048;
      *(void *)&v28[6] = v11;
      v12 = "Getting property '%{public}@' from bootloader: %u bytes (deviceID 0x%llX)";
      v13 = v9;
      uint32_t v14 = 28;
    }
    else
    {
      v9 = MTLoggingFramework();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
      int v20 = [v6 length];
      *(_DWORD *)buf = 138543618;
      id v26 = v3;
      __int16 v27 = 1024;
      *(_DWORD *)v28 = v20;
      v12 = "Getting property '%{public}@' from bootloader: %u bytes";
      v13 = v9;
      uint32_t v14 = 18;
    }
    _os_log_impl(&dword_2262CF000, v13, OS_LOG_TYPE_DEBUG, v12, buf, v14);
LABEL_8:

    id v15 = v6;
    goto LABEL_16;
  }
  if (v8)
  {
    if (*(unsigned char *)(v8 + 133)) {
      mt_CachePropertiesForDevice(v8);
    }
    v16 = MTLoggingFramework();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [v7 localizedDescription];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 64);
      *(_DWORD *)buf = 138543874;
      id v26 = v3;
      __int16 v27 = 2114;
      *(void *)v28 = v17;
      *(_WORD *)&v28[8] = 2048;
      *(void *)&v28[10] = v18;
      _os_log_impl(&dword_2262CF000, v16, OS_LOG_TYPE_ERROR, "Error getting property '%{public}@' from bootloader: %{public}@ (deviceID 0x%llX)", buf, 0x20u);
    }
  }
  else
  {
    v21 = MTLoggingFramework();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [v7 localizedDescription];
      *(_DWORD *)buf = 138543618;
      id v26 = v3;
      __int16 v27 = 2114;
      *(void *)v28 = v22;
      _os_log_impl(&dword_2262CF000, v21, OS_LOG_TYPE_ERROR, "Error getting property '%{public}@' from bootloader: %{public}@", buf, 0x16u);
    }
  }
  id v15 = 0;
LABEL_16:

  return v15;
}

@end