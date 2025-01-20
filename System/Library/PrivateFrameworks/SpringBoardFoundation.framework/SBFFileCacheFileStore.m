@interface SBFFileCacheFileStore
- (NSString)description;
- (NSURL)directoryURL;
- (SBFFileCacheFileStore)init;
- (SBFFileCacheFileStore)initWithDirectoryURL:(id)a3;
- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4;
- (id)fileURLForFileNamed:(id)a3;
- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4;
- (void)fileCache:(id)a3 storeFileWrapper:(id)a4;
- (void)removeAllFileWrappersForFileCache:(id)a3;
@end

@implementation SBFFileCacheFileStore

- (SBFFileCacheFileStore)initWithDirectoryURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFFileCacheFileStore;
  v5 = [(SBFFileCacheFileStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    directoryURL = v5->_directoryURL;
    v5->_directoryURL = (NSURL *)v6;
  }
  return v5;
}

- (SBFFileCacheFileStore)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't directly init this class" userInfo:0];
  objc_exception_throw(v2);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(SBFFileCacheFileStore *)self directoryURL];
  id v5 = (id)[v3 appendObject:v4 withName:@"directoryURL"];

  uint64_t v6 = [v3 build];

  return (NSString *)v6;
}

- (id)fileURLForFileNamed:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFFileCacheFileStore *)self directoryURL];
  uint64_t v6 = [v5 URLByAppendingPathComponent:v4];

  return v6;
}

- (void)fileCache:(id)a3 storeFileWrapper:(id)a4
{
  id v7 = a4;
  id v5 = [v7 filename];
  if (!v5)
  {
    id v5 = [v7 preferredFilename];
  }
  uint64_t v6 = [(SBFFileCacheFileStore *)self fileURLForFileNamed:v5];
  [v7 writeToURL:v6 options:1 originalContentsURL:0 error:0];
}

- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4
{
  id v4 = [(SBFFileCacheFileStore *)self fileURLForFileNamed:a4];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v4 options:0 error:0];

  return v5;
}

- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4
{
  id v5 = [(SBFFileCacheFileStore *)self fileURLForFileNamed:a4];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v4 removeItemAtURL:v5 error:0];
}

- (void)removeAllFileWrappersForFileCache:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(SBFFileCacheFileStore *)self directoryURL];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:4 error:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 removeItemAtURL:*(void *)(*((void *)&v10 + 1) + 8 * v9++) error:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void).cxx_destruct
{
}

@end