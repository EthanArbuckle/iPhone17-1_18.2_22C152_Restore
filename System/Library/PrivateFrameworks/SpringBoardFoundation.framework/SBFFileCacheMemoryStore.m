@interface SBFFileCacheMemoryStore
- (NSString)description;
- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4;
- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4;
- (void)fileCache:(id)a3 storeFileWrapper:(id)a4;
- (void)removeAllFileWrappersForFileCache:(id)a3;
@end

@implementation SBFFileCacheMemoryStore

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_fileWrappers withName:@"fileWrappers"];
  v5 = [v3 build];

  return (NSString *)v5;
}

- (void)fileCache:(id)a3 storeFileWrapper:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBFFileCache.m", 423, @"Invalid parameter not satisfying: %@", @"fileWrapper" object file lineNumber description];
  }
  v8 = [v7 filename];
  if (!v8)
  {
    v8 = [v7 preferredFilename];
  }
  fileWrappers = self->_fileWrappers;
  if (!fileWrappers)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11 = self->_fileWrappers;
    self->_fileWrappers = v10;

    fileWrappers = self->_fileWrappers;
  }
  [(NSMutableDictionary *)fileWrappers setObject:v7 forKey:v8];
}

- (id)fileCache:(id)a3 loadFileWrapperNamed:(id)a4
{
  return (id)[(NSMutableDictionary *)self->_fileWrappers objectForKey:a4];
}

- (void)fileCache:(id)a3 removeFileWrapperNamed:(id)a4
{
}

- (void)removeAllFileWrappersForFileCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end