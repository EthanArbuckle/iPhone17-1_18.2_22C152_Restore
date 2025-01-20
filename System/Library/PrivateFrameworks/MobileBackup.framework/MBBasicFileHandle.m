@interface MBBasicFileHandle
+ (id)basicFileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4;
- (MBBasicFileHandle)initWithPath:(id)a3 fd:(int)a4;
- (id)encryptionKeyWithError:(id *)a3;
- (id)path;
- (int)fd;
- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MBBasicFileHandle

+ (id)basicFileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  int v7 = a5;
  uint64_t v10 = open((const char *)[a3 fileSystemRepresentation], a4, a5);
  if ((v10 & 0x80000000) != 0)
  {
    int v13 = *__error();
    if (a6) {
      *a6 = +[MBError posixErrorWithPath:a3 format:@"open error"];
    }
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      id v16 = a3;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "open failed at %@, flags:0x%x, mode:0%o: %{errno}d", buf, 0x1Eu);
      _MBLog();
    }
    if (v13 == 1) {
      MBDiagnoseiTunesBackupFileAtPath(a3);
    }
    return 0;
  }
  else
  {
    v11 = [[MBBasicFileHandle alloc] initWithPath:a3 fd:v10];
    return v11;
  }
}

- (MBBasicFileHandle)initWithPath:(id)a3 fd:(int)a4
{
  int v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Opened file at %@", buf, 0xCu);
    id v10 = a3;
    _MBLog();
  }
  v11.receiver = self;
  v11.super_class = (Class)MBBasicFileHandle;
  v8 = [(MBBasicFileHandle *)&v11 init];
  if (v8)
  {
    v8->_path = (NSString *)a3;
    v8->_fd = a4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBBasicFileHandle;
  [(MBBasicFileHandle *)&v3 dealloc];
}

- (id)path
{
  return self->_path;
}

- (int)fd
{
  return self->_fd;
}

- (id)encryptionKeyWithError:(id *)a3
{
  if (a3) {
    *a3 = +[MBError errorWithCode:4 format:@"File has no encryption key"];
  }
  return 0;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  int v5 = fstat(self->_fd, a3);
  int v6 = v5;
  if (a4 && v5) {
    *a4 = +[MBError posixErrorWithFormat:@"fstat error"];
  }
  return v6 == 0;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (IsDatalessFault(self->_fd)) {
    return 0;
  }
  int64_t result = read(self->_fd, a3, a4);
  if (result < 0)
  {
    if (a5) {
      *a5 = +[MBError posixErrorWithFormat:@"read error"];
    }
    return -1;
  }
  return result;
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t result = write(self->_fd, a3, a4);
  if (result < 0)
  {
    if (a5) {
      *a5 = +[MBError posixErrorWithFormat:@"write error"];
    }
    return -1;
  }
  return result;
}

- (BOOL)closeWithError:(id *)a3
{
  int v5 = close(self->_fd);
  if (v5)
  {
    if (a3) {
      *a3 = +[MBError posixErrorWithFormat:@"close error"];
    }
  }
  else
  {
    int v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      path = self->_path;
      *(_DWORD *)buf = 138412290;
      id v10 = path;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Closed file at %@", buf, 0xCu);
      _MBLog();
    }
  }
  return v5 == 0;
}

@end