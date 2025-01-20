@interface NTKGreenfieldService
+ (id)_unzipWatchfaceFromURL:(id)a3;
- (void)removeFileAtPath:(id)a3 withSandboxExtension:(char *)a4 completionBlock:(id)a5;
- (void)unzipWatchfaceFromURL:(id)a3 withSandboxExtension:(char *)a4 writeSandboxExtension:(char *)a5 completionBlock:(id)a6;
@end

@implementation NTKGreenfieldService

- (void)unzipWatchfaceFromURL:(id)a3 withSandboxExtension:(char *)a4 writeSandboxExtension:(char *)a5 completionBlock:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a6;
  v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v7;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "decodeWatchFaceFromUrl XPC service started with url: %@", buf, 0xCu);
  }

  uint64_t v10 = sandbox_extension_consume();
  uint64_t v11 = sandbox_extension_consume();
  if (v10 == -1 || v11 == -1)
  {
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"Could not consume sandboxExtension. Extension is %lld", v10);
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v12);
    v8[2](v8, 0, v13);
LABEL_13:

    goto LABEL_14;
  }
  v12 = [(id)objc_opt_class() _unzipWatchfaceFromURL:v7];
  if (!v12)
  {
    v16 = NSString;
    v17 = [v7 absoluteURL];
    v13 = [v16 stringWithFormat:@"GreenfieldService failed to extract from url: %@", v17];

    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 4;
    goto LABEL_12;
  }
  if (sandbox_extension_release() == -1 || sandbox_extension_release() == -1)
  {
    v13 = objc_msgSend(NSString, "stringWithFormat:", @"Could not release extension Extension is %lld", v10);
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = 3;
LABEL_12:
    v18 = objc_msgSend(v14, "greenfield_decodeWatchFaceErrorWithCode:message:", v15, v13);
    v8[2](v8, 0, v18);

    goto LABEL_13;
  }
  ((void (**)(id, void *, void *))v8)[2](v8, v12, 0);
LABEL_14:
}

+ (id)_unzipWatchfaceFromURL:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  v18[0] = &v17;
  v18[1] = 0x3032000000;
  v18[2] = __Block_byref_object_copy__33;
  v18[3] = __Block_byref_object_dispose__33;
  id v19 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke;
  v13[3] = &unk_1E62C60D0;
  uint64_t v15 = &v17;
  id v16 = 0;
  v6 = v5;
  v14 = v6;
  [v4 coordinateReadingItemAtURL:v3 options:1 error:&v16 byAccessor:v13];
  id v7 = v16;
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v6, v8);
  if (v7 || (uint64_t v11 = *(void **)(v18[0] + 40)) == 0)
  {
    v9 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[NTKGreenfieldService _unzipWatchfaceFromURL:v9];
    }

    id v10 = 0;
  }
  else
  {
    id v10 = v11;
  }

  _Block_object_dispose(&v17, 8);
  return v10;
}

void __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 startAccessingSecurityScopedResource];
  uint64_t v5 = [(id)objc_opt_class() unzipWatchFaceFileAtUrl:v3];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (v4) {
LABEL_3:
    }
      [v3 stopAccessingSecurityScopedResource];
  }
  else
  {
    dispatch_time_t v8 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke_cold_1((uint64_t)v3, v8);
    }

    if (v4) {
      goto LABEL_3;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeFileAtPath:(id)a3 withSandboxExtension:(char *)a4 completionBlock:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  dispatch_time_t v8 = (void (**)(id, void *))a5;
  uint64_t v9 = sandbox_extension_consume();
  id v10 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2080;
    id v19 = a4;
    _os_log_impl(&dword_1BC5A9000, v10, OS_LOG_TYPE_DEFAULT, "NTKGreenfieldService did start to remove files at path:%@  with sandbox extension:%s.", buf, 0x16u);
  }

  if (v9 == -1)
  {
    id v12 = [NSString stringWithFormat:@"NTKGreenfieldService remove files at path failed to consume sandbox extension:%s, handle is:%lld.", a4, -1];
    v13 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v12);
    v8[2](v8, v13);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    [v11 removeItemAtPath:v7 error:&v15];
    id v12 = v15;

    if (v12)
    {
      [NSString stringWithFormat:@"NTKGreenfieldService remove files at path failed to remove item at path:%@.", v7];
    }
    else
    {
      if (sandbox_extension_release() != -1)
      {
        v8[2](v8, 0);
        goto LABEL_9;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"NTKGreenfieldService remove files at path failed to release extension handle:%lld.", v9);
    v13 = };
    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "greenfield_decodeWatchFaceErrorWithCode:message:", 2, v13);
    v8[2](v8, v14);
  }
LABEL_9:
}

+ (void)_unzipWatchfaceFromURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(*(void *)a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Failed to read the file: readingError: %@ unizippedDataPath: %@", (uint8_t *)&v4, 0x16u);
}

void __47__NTKGreenfieldService__unzipWatchfaceFromURL___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Failed to unzip watch face file from url: %@", (uint8_t *)&v2, 0xCu);
}

@end