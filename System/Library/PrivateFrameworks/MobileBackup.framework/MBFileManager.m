@interface MBFileManager
+ (id)defaultManager;
- (BOOL)copyPath:(id)a3 toPath:(id)a4;
- (BOOL)createDirectoryAtPath:(id)a3 attributes:(id)a4;
- (BOOL)fileExistsAtPath:(id)a3;
- (BOOL)movePath:(id)a3 toPath:(id)a4;
- (BOOL)removeFileAtPath:(id)a3;
- (id)directoryContentsAtPath:(id)a3;
- (id)fileAttributesAtPath:(id)a3 traverseLink:(BOOL)a4;
@end

@implementation MBFileManager

+ (id)defaultManager
{
  id result = (id)_MBFileManager;
  if (!_MBFileManager)
  {
    id result = objc_alloc_init(MBFileManager);
    _MBFileManager = (uint64_t)result;
  }
  return result;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return [v4 fileExistsAtPath:a3];
}

- (BOOL)removeFileAtPath:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return [v4 removeItemAtPath:a3 error:0];
}

- (BOOL)copyPath:(id)a3 toPath:(id)a4
{
  v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return [v6 copyItemAtPath:a3 toPath:a4 error:0];
}

- (BOOL)movePath:(id)a3 toPath:(id)a4
{
  v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return [v6 moveItemAtPath:a3 toPath:a4 error:0];
}

- (id)directoryContentsAtPath:(id)a3
{
  v4 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return (id)[v4 contentsOfDirectoryAtPath:a3 error:0];
}

- (id)fileAttributesAtPath:(id)a3 traverseLink:(BOOL)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", a3, a4);
  return (id)[v5 attributesOfItemAtPath:a3 error:0];
}

- (BOOL)createDirectoryAtPath:(id)a3 attributes:(id)a4
{
  v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  return [v6 createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:a4 error:0];
}

@end