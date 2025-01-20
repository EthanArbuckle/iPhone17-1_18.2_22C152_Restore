@interface MBEncryptedFileHandle
+ (id)encryptedFileHandleForBackupWithPath:(id)a3 keybag:(id)a4 error:(id *)a5;
+ (id)encryptedFileHandleForRestoreWithPath:(id)a3 keybag:(id)a4 key:(id)a5 error:(id *)a6;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4;
- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4;
- (MBEncryptedFileHandle)initWithPath:(id)a3 keybag:(id)a4 file:(_mkbfileref *)a5 restore:(BOOL)a6;
- (id)encryptionKeyWithError:(id *)a3;
- (id)path;
- (int)fd;
- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)dealloc;
@end

@implementation MBEncryptedFileHandle

+ (id)encryptedFileHandleForBackupWithPath:(id)a3 keybag:(id)a4 error:(id *)a5
{
  if (!a4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"MBEncryptedFileHandle.m" lineNumber:43 description:@"No keybag for backing up encrypted file"];
  }
  uint64_t v8 = MKBFileOpenForBackup();
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = a3;
    __int16 v14 = 1024;
    int v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MKBFileOpenForBackup(\"%@\", ...): %d", buf, 0x12u);
    _MBLog();
  }
  if (!v8) {
    return [[MBEncryptedFileHandle alloc] initWithPath:a3 keybag:a4 file:0 restore:0];
  }
  if (a5) {
    *a5 = +[MBKeyBag errorWithReturnCode:v8 path:a3 description:@"Error opening encrypted file for backup"];
  }
  if (v8 >= 0xFFFFFFFE)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = a3;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "MKBFileOpenForBackup failed at %@: %d", buf, 0x12u);
      _MBLog();
    }
    sub_100013254(a3);
  }
  return 0;
}

+ (id)encryptedFileHandleForRestoreWithPath:(id)a3 keybag:(id)a4 key:(id)a5 error:(id *)a6
{
  if (a4)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:a1 file:@"MBEncryptedFileHandle.m" lineNumber:61 description:@"No keybag for restoring encrypted file"];
    if (a5) {
      goto LABEL_3;
    }
  }
  [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, a1, @"MBEncryptedFileHandle.m", 62, @"No encrypted file key for restoring file: %@", a3 object file lineNumber description];
LABEL_3:
  id result = [a4 encryptedFileForRestoreWithPath:a3 key:a5 error:a6];
  if (result)
  {
    id v13 = [[MBEncryptedFileHandle alloc] initWithPath:a3 keybag:a4 file:result restore:1];
    return v13;
  }
  return result;
}

- (MBEncryptedFileHandle)initWithPath:(id)a3 keybag:(id)a4 file:(_mkbfileref *)a5 restore:(BOOL)a6
{
  v13.receiver = self;
  v13.super_class = (Class)MBEncryptedFileHandle;
  v10 = [(MBEncryptedFileHandle *)&v13 init];
  if (v10)
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Opened encrypted file at %@", buf, 0xCu);
      _MBLog();
    }
    v10->_path = (NSString *)a3;
    v10->_keybag = (MBKeyBag *)a4;
    v10->_file = a5;
    v10->_buffer = (NSMutableData *)[objc_alloc((Class)NSMutableData) initWithCapacity:0];
    v10->_restore = a6;
  }
  return v10;
}

- (void)dealloc
{
  if (self->_file) {
    MKBFileClose();
  }

  v3.receiver = self;
  v3.super_class = (Class)MBEncryptedFileHandle;
  [(MBEncryptedFileHandle *)&v3 dealloc];
}

- (id)path
{
  return self->_path;
}

- (int)fd
{
  return _MKBFileGetFD(self->_file, a2);
}

- (id)encryptionKeyWithError:(id *)a3
{
  if (!self->_keybag) {
    sub_10009A578();
  }
  file = self->_file;
  path = self->_path;
  keybag = self->_keybag;

  return [(MBKeyBag *)keybag encryptionKeyForFile:file path:path error:a3];
}

- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4
{
  if (!self->_keybag) {
    sub_10009A5A4();
  }
  file = self->_file;
  path = self->_path;
  keybag = self->_keybag;

  return [(MBKeyBag *)keybag validateEncryptionKey:a3 file:file path:path error:a4];
}

- (BOOL)closeWithError:(id *)a3
{
  if (self->_restore)
  {
    uint64_t v5 = MKBFileWrite();
    v6 = MBGetDefaultLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 < 0)
    {
      if (v7)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MKBFileWrite(0): %zd", buf, 0xCu);
        _MBLog();
      }
      if (a3)
      {
        id v9 = +[MBError posixErrorWithFormat:@"MKBFileWrite error"];
        goto LABEL_15;
      }
      return 0;
    }
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MKBFileWrite(0): %{bytes}zd", buf, 0xCu);
      _MBLog();
    }
  }
  uint64_t v8 = MKBFileClose();
  self->_file = 0;
  if (v8)
  {
    if (a3)
    {
      id v9 = +[MBKeyBag errorWithReturnCode:v8 description:@"MKBFileClose error"];
LABEL_15:
      objc_super v13 = v9;
      BOOL result = 0;
      *a3 = v13;
      return result;
    }
    return 0;
  }
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    path = self->_path;
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = (uint64_t)path;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Closed encrypted file at %@", buf, 0xCu);
    _MBLog();
  }
  return 1;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  int v5 = fstat([(MBEncryptedFileHandle *)self fd], a3);
  int v6 = v5;
  if (a4 && v5) {
    *a4 = +[MBError posixErrorWithFormat:@"fstat error"];
  }
  return v6 == 0;
}

- (int64_t)readWithBytes:(void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (self->_restore) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBEncryptedFileHandle.m" lineNumber:143 description:@"Can't read from restore file"];
  }
  if (sub_10007B4A4([(MBEncryptedFileHandle *)self fd]))
  {
    int64_t v8 = 0;
    goto LABEL_10;
  }
  if (![(MBKeyBag *)self->_keybag isOTA] && a4 <= 0xF)
  {
    if (!a5) {
      return -1;
    }
    id v9 = +[MBError errorWithCode:100 format:@"Buffer for reading from encrypted file too small"];
LABEL_16:
    *a5 = v9;
    return -1;
  }
  int64_t v8 = MKBFileRead();
  if (v8 < 0)
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v14 = a4;
      __int16 v15 = 2048;
      int64_t v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBFileRead(%{bytes}lu): %zd", buf, 0x16u);
      _MBLog();
    }
    if (!a5) {
      return -1;
    }
    id v9 = (MBError *)+[MBError posixErrorWithFormat:@"MKBFileRead error"];
    goto LABEL_16;
  }
LABEL_10:
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v14 = a4;
    __int16 v15 = 2048;
    int64_t v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBFileRead(%{bytes}lu): %{bytes}zd", buf, 0x16u);
    _MBLog();
  }
  return v8;
}

- (int64_t)writeWithBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (!self->_restore) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBEncryptedFileHandle.m" lineNumber:171 description:@"Can't write to backup file"];
  }
  if ([(MBKeyBag *)self->_keybag isOTA])
  {
    uint64_t v9 = MKBFileWrite();
    v10 = MBGetDefaultLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134218240;
        unint64_t v19 = a4;
        __int16 v20 = 2048;
        uint64_t v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %{bytes}zd", buf, 0x16u);
LABEL_20:
        _MBLog();
        return a4;
      }
      return a4;
    }
    if (v11)
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = a4;
      __int16 v20 = 2048;
      uint64_t v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %zd", buf, 0x16u);
LABEL_23:
      _MBLog();
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if ([(NSMutableData *)self->_buffer length])
  {
    NSUInteger v12 = [(NSMutableData *)self->_buffer length];
    if (16 - v12 < a4) {
      a4 = 16 - v12;
    }
    [(NSMutableData *)self->_buffer appendBytes:a3 length:a4];
    if ([(NSMutableData *)self->_buffer length] < 0x10) {
      return a4;
    }
    [(NSMutableData *)self->_buffer mutableBytes];
    [(NSMutableData *)self->_buffer length];
    uint64_t v13 = MKBFileWrite();
    [(NSMutableData *)self->_buffer setLength:0];
    if ((v13 & 0x8000000000000000) == 0) {
      return a4;
    }
    goto LABEL_24;
  }
  if ((a4 & 0xF) != 0) {
    [(NSMutableData *)self->_buffer appendBytes:(char *)a3 + (a4 & 0xFFFFFFFFFFFFFFF0) length:a4 & 0xF];
  }
  uint64_t v14 = MKBFileWrite();
  __int16 v15 = MBGetDefaultLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if (v14 < 0)
  {
    if (v16)
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v19 = a4 & 0xFFFFFFFFFFFFFFF0;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %zd", buf, 0x16u);
      goto LABEL_23;
    }
LABEL_24:
    if (a5) {
      *a5 = +[MBError posixErrorWithFormat:@"MKBFileWrite error"];
    }
    return -1;
  }
  if (v16)
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v19 = a4 & 0xFFFFFFFFFFFFFFF0;
    __int16 v20 = 2048;
    uint64_t v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "MKBFileWrite(%{bytes}lu): %{bytes}zd", buf, 0x16u);
    goto LABEL_20;
  }
  return a4;
}

@end