@interface MBFileManagerDelegate
- (BOOL)fileManager:(id)a3 shouldCopyItemAtPath:(id)a4 toPath:(id)a5;
- (id)shouldCopyItemAtPathToPath;
- (void)setShouldCopyItemAtPathToPath:(id)a3;
@end

@implementation MBFileManagerDelegate

- (BOOL)fileManager:(id)a3 shouldCopyItemAtPath:(id)a4 toPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(MBFileManagerDelegate *)self shouldCopyItemAtPathToPath];
  char v10 = ((uint64_t (**)(void, id, id))v9)[2](v9, v8, v7);

  return v10;
}

- (id)shouldCopyItemAtPathToPath
{
  return self->_shouldCopyItemAtPathToPath;
}

- (void)setShouldCopyItemAtPathToPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end