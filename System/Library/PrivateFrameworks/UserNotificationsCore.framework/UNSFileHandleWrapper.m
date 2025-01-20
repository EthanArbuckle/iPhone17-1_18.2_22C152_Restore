@interface UNSFileHandleWrapper
- (NSFileHandle)fileHandle;
- (NSString)path;
- (void)setFileHandle:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation UNSFileHandleWrapper

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end