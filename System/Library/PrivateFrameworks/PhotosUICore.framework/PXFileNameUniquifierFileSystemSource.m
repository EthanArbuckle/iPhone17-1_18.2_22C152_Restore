@interface PXFileNameUniquifierFileSystemSource
- (BOOL)fileExistsAtPath:(id)a3;
- (NSFileManager)fileManager;
- (PXFileNameUniquifierFileSystemSource)init;
@end

@implementation PXFileNameUniquifierFileSystemSource

- (void).cxx_destruct
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4 = a3;
  v5 = [(PXFileNameUniquifierFileSystemSource *)self fileManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (PXFileNameUniquifierFileSystemSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXFileNameUniquifierFileSystemSource;
  v2 = [(PXFileNameUniquifierFileSystemSource *)&v6 init];
  if (v2)
  {
    v3 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fileManager = v2->_fileManager;
    v2->_fileManager = v3;
  }
  return v2;
}

@end