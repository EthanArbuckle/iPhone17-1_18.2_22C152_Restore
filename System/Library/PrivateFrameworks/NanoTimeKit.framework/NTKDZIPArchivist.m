@interface NTKDZIPArchivist
+ (id)sharedArchivist;
- (BOOL)zippedDataForPath:(id)a3 toZipFile:(id)a4;
- (NTKDZIPArchivist)init;
- (id)zippedDataForPath:(id)a3;
- (void)unzipFile:(id)a3 toPath:(id)a4 completionHandler:(id)a5;
@end

@implementation NTKDZIPArchivist

+ (id)sharedArchivist
{
  if (sharedArchivist_onceToken != -1) {
    dispatch_once(&sharedArchivist_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)sharedArchivist_archivist;
  return v2;
}

void __35__NTKDZIPArchivist_sharedArchivist__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedArchivist_archivist;
  sharedArchivist_archivist = v0;
}

- (NTKDZIPArchivist)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKDZIPArchivist;
  v2 = [(NTKDZIPArchivist *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntkd.zip-archivist", 0);
    unzipQueue = v2->_unzipQueue;
    v2->_unzipQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)unzipFile:(id)a3 toPath:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unzipQueue = self->_unzipQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke;
  block[3] = &unk_1E62C0098;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(unzipQueue, block);
}

uint64_t __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v34 = 0;
  [v5 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v34];
  id v6 = v34;
  if (v6)
  {
    v7 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_4();
    }
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v9 = [v3 cStringUsingEncoding:4];
  if (!v9)
  {
    v7 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_1(v7, v20, v21, v22, v23, v24, v25, v26);
    }
    goto LABEL_4;
  }
  int v10 = v9;
  v11 = (const char *)[v4 cStringUsingEncoding:4];
  if (!v11)
  {
    v7 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_2(v7, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_4;
  }
  uint64_t v12 = (uint64_t)v11;
  __s1[1024] = 0;
  if (realpath_DARWIN_EXTSN(v11, __s1) == __s1)
  {
    extract_zip(v10, __s1);
  }
  else
  {
    id v13 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
LABEL_5:

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)zippedDataForPath:(id)a3
{
  id v4 = a3;
  v5 = NSTemporaryDirectory();
  id v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  id v8 = [v5 stringByAppendingPathComponent:v7];

  LODWORD(self) = [(NTKDZIPArchivist *)self zippedDataForPath:v4 toZipFile:v8];
  if (self)
  {
    id v14 = 0;
    uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:1 error:&v14];
    id v10 = v14;
    if (v10)
    {
      v11 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[NTKDZIPArchivist zippedDataForPath:]();
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v12 removeItemAtPath:v8 error:0];

  return v9;
}

- (BOOL)zippedDataForPath:(id)a3 toZipFile:(id)a4
{
  if (a3)
  {
    return _createArchive(a3, a4);
  }
  else
  {
    id v6 = _NTKLoggingObjectForDomain(1, (uint64_t)"NTKLoggingDomainDaemon");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKDZIPArchivist zippedDataForPath:toZipFile:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    return 0;
  }
}

- (void).cxx_destruct
{
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__NTKDZIPArchivist_unzipFile_toPath_completionHandler___block_invoke_cold_4()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1BC5A9000, v2, OS_LOG_TYPE_ERROR, "%s: cannot create new directory %@ for unzipping archive %@", (uint8_t *)v3, 0x20u);
}

- (void)zippedDataForPath:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1(&dword_1BC5A9000, v0, v1, "%s: cannot read data from temp file %@", v2, v3, v4, v5, 2u);
}

- (void)zippedDataForPath:(uint64_t)a3 toZipFile:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end