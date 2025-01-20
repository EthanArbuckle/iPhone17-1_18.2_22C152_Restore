@interface PLFilesystemIterator
- (BOOL)continueAfterError;
- (NSError)error;
- (PLFilesystemIterator)initWithFilePath:(id)a3;
- (void)setContinueAfterError:(BOOL)a3;
- (void)visitURLsLoadingPropertiesForKeys:(id)a3 withBlock:(id)a4;
@end

@implementation PLFilesystemIterator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setContinueAfterError:(BOOL)a3
{
  self->_continueAfterError = a3;
}

- (BOOL)continueAfterError
{
  return self->_continueAfterError;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 32, 1);
}

- (void)visitURLsLoadingPropertiesForKeys:(id)a3 withBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (uint64_t (**)(id, void))a4;
  BOOL v8 = [(PLFilesystemIterator *)self continueAfterError];
  char v33 = 0;
  if ([(NSFileManager *)self->_fileManager fileExistsAtPath:self->_path isDirectory:&v33])
  {
    v9 = (void *)MEMORY[0x19F38F510]();
    path = self->_path;
    if (v33)
    {
      fileManager = self->_fileManager;
      v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:path];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __68__PLFilesystemIterator_visitURLsLoadingPropertiesForKeys_withBlock___block_invoke;
      v31[3] = &unk_1E589F210;
      v31[4] = self;
      BOOL v32 = v8;
      v13 = [(NSFileManager *)fileManager enumeratorAtURL:v12 includingPropertiesForKeys:v6 options:0 errorHandler:v31];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
LABEL_5:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x19F38F510](v15);
          LODWORD(v19) = v7[2](v7, v19);
          if (!v19) {
            break;
          }
          if (v16 == ++v18)
          {
            uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
            uint64_t v16 = v15;
            if (v15) {
              goto LABEL_5;
            }
            break;
          }
        }
      }
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:path];
      ((uint64_t (**)(id, id))v7)[2](v7, v14);
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28798];
    v23 = self->_path;
    uint64_t v34 = *MEMORY[0x1E4F28328];
    v35 = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v25 = [v21 errorWithDomain:v22 code:2 userInfo:v24];
    error = self->_error;
    self->_error = v25;
  }
}

uint64_t __68__PLFilesystemIterator_visitURLsLoadingPropertiesForKeys_withBlock___block_invoke(uint64_t a1, int a2, id obj)
{
  return *(unsigned __int8 *)(a1 + 40);
}

- (PLFilesystemIterator)initWithFilePath:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLFilesystemIterator.m", 16, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLFilesystemIterator;
  v7 = [(PLFilesystemIterator *)&v13 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_path, a3);
    v9 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fileManager = v8->_fileManager;
    v8->_fileManager = v9;
  }
  return v8;
}

@end