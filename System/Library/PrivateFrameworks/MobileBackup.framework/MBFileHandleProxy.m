@interface MBFileHandleProxy
- (BOOL)closeWithError:(id *)a3;
- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4;
- (MBFileHandle)fileHandle;
- (MBFileHandleProxy)initWithFileHandle:(id)a3;
- (id)encryptionKeyWithError:(id *)a3;
- (id)path;
- (int)fd;
- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MBFileHandleProxy

- (MBFileHandleProxy)initWithFileHandle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBFileHandleProxy;
  v4 = [(MBFileHandleProxy *)&v6 init];
  if (v4) {
    v4->_fileHandle = (MBFileHandle *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBFileHandleProxy;
  [(MBFileHandleProxy *)&v3 dealloc];
}

- (id)path
{
  return [(MBFileHandle *)self->_fileHandle path];
}

- (int)fd
{
  return [(MBFileHandle *)self->_fileHandle fd];
}

- (id)encryptionKeyWithError:(id *)a3
{
  return [(MBFileHandle *)self->_fileHandle encryptionKeyWithError:a3];
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  return [(MBFileHandle *)self->_fileHandle statWithBuffer:a3 error:a4];
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  return [(MBFileHandle *)self->_fileHandle readWithBytes:a3 length:a4 error:a5];
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  return [(MBFileHandle *)self->_fileHandle writeWithBytes:a3 length:a4 error:a5];
}

- (BOOL)closeWithError:(id *)a3
{
  return [(MBFileHandle *)self->_fileHandle closeWithError:a3];
}

- (MBFileHandle)fileHandle
{
  return self->_fileHandle;
}

@end