@interface MBManifestDBUploadHelper
- (MBEncryptedFileHandle)fileHandle;
- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (void)setFileHandle:(id)a3;
@end

@implementation MBManifestDBUploadHelper

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return self->_fileHandle;
}

- (MBEncryptedFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end