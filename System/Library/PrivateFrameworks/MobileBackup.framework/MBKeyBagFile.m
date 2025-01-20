@interface MBKeyBagFile
+ (BOOL)decryptFileWithPath:(id)a3 keybag:(id)a4 encryptionKey:(id)a5 size:(unint64_t)a6 error:(id *)a7;
+ (BOOL)validateWrappedKey:(id)a3 withKeyBag:(id)a4 forPath:(id)a5 error:(id *)a6;
+ (const)keyBagUUIDForEncryptionKey:(id)a3;
+ (id)keybagFileWithPath:(id)a3 error:(id *)a4;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4;
- (MBKeyBagFile)initWithHandle:(_mkbbackupref *)a3;
- (id)encryptionKeyWithError:(id *)a3;
- (id)updatedEncryptionKeyForCurrentKey:(id)a3 withError:(id *)a4;
- (int)readWithBytes:(void *)a3 count:(unsigned int)a4 offset:(unint64_t)a5 error:(id *)a6;
- (unint64_t)size;
- (void)dealloc;
@end

@implementation MBKeyBagFile

+ (BOOL)decryptFileWithPath:(id)a3 keybag:(id)a4 encryptionKey:(id)a5 size:(unint64_t)a6 error:(id *)a7
{
  if (!a4) {
    __assert_rtn("+[MBKeyBagFile decryptFileWithPath:keybag:encryptionKey:size:error:]", "MBKeyBagFile.m", 34, "keybag");
  }
  return [a4 decryptFileWithPath:a3 encryptionKey:a5 size:a6 error:a7];
}

+ (id)keybagFileWithPath:(id)a3 error:(id *)a4
{
  [a3 fileSystemRepresentation];
  uint64_t v6 = MKBBackupOpen();
  uint64_t v7 = v6;
  if (v6 == -2)
  {
    v10 = MBGetDefaultLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    int v16 = -2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
    goto LABEL_10;
  }
  if (v6)
  {
    v11 = MBGetDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
LABEL_10:
    _MBLog();
LABEL_11:
    if (!a4) {
      return 0;
    }
    id v12 = +[MBKeyBag errorWithReturnCode:v7 path:a3 description:@"MKBBackupOpen error"];
    id result = 0;
    *a4 = v12;
    return result;
  }
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = a3;
    __int16 v15 = 1024;
    int v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
    _MBLog();
  }
  return [[MBKeyBagFile alloc] initWithHandle:0];
}

- (MBKeyBagFile)initWithHandle:(_mkbbackupref *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MBKeyBagFile;
  id result = [(MBKeyBagFile *)&v5 init];
  if (result) {
    result->_handle = a3;
  }
  return result;
}

- (unint64_t)size
{
  return _MKBBackupSize(self->_handle, a2);
}

- (void)dealloc
{
  if (self->_handle) {
    [(MBKeyBagFile *)self closeWithError:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)MBKeyBagFile;
  [(MBKeyBagFile *)&v3 dealloc];
}

- (id)encryptionKeyWithError:(id *)a3
{
  uint64_t v5 = MKBBackupCopyKeyWithError();
  uint64_t v6 = v5;
  if (v5 == -2)
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218498;
      __int16 v15 = handle;
      __int16 v16 = 1024;
      int v17 = -2;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBBackupCopyKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
LABEL_10:
      _MBLog();
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = self->_handle;
        *(_DWORD *)buf = 134218240;
        __int16 v15 = v8;
        __int16 v16 = 1024;
        int v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MKBBackupCopyKeyWithError(%p) success: %d", buf, 0x12u);
        _MBLog();
      }
      return 0;
    }
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = self->_handle;
      *(_DWORD *)buf = 134218498;
      __int16 v15 = v13;
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBBackupCopyKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
      goto LABEL_10;
    }
  }
  if (a3) {
    *a3 = +[MBKeyBag errorWithReturnCode:v6 description:@"MKBBackupCopyKey error"];
  }
  return 0;
}

- (id)updatedEncryptionKeyForCurrentKey:(id)a3 withError:(id *)a4
{
  id v4 = a3;
  if (!a3) {
    return v4;
  }
  uint64_t updated = MKBBackupUpdateKeyWithError();
  uint64_t v8 = updated;
  if (updated == -2)
  {
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      handle = self->_handle;
      *(_DWORD *)buf = 134218498;
      int v17 = handle;
      __int16 v18 = 1024;
      int v19 = -2;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "MKBBackupUpdateKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
LABEL_11:
      _MBLog();
    }
  }
  else
  {
    if (!updated)
    {
      v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = self->_handle;
        *(_DWORD *)buf = 134218240;
        int v17 = v10;
        __int16 v18 = 1024;
        int v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MKBBackupUpdateKeyWithError(%p) success: %d", buf, 0x12u);
        _MBLog();
      }
      return v4;
    }
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = self->_handle;
      *(_DWORD *)buf = 134218498;
      int v17 = v14;
      __int16 v18 = 1024;
      int v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "MKBBackupUpdateKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
      goto LABEL_11;
    }
  }
  if (a4) {
    *a4 = +[MBKeyBag errorWithReturnCode:v8 description:@"MKBBackupUpdateKey error"];
  }
  return 0;
}

- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4
{
  uint64_t v6 = MKBBackupValidateKey();
  if (v6)
  {
    uint64_t v7 = MBGetDefaultLog();
    uint64_t v8 = v7;
    if (v6 == -2)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      handle = self->_handle;
      *(_DWORD *)buf = 134218240;
      __int16 v15 = handle;
      __int16 v16 = 1024;
      int v17 = -2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MKBBackupValidateKey(%p): %d", buf, 0x12u);
    }
    else
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      id v12 = self->_handle;
      *(_DWORD *)buf = 134218240;
      __int16 v15 = v12;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBBackupValidateKey(%p): %d", buf, 0x12u);
    }
    _MBLog();
LABEL_10:
    if (a4) {
      *a4 = +[MBKeyBag errorWithReturnCode:v6 description:@"MKBBackupValidateKey error"];
    }
    return v6 == 0;
  }
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self->_handle;
    *(_DWORD *)buf = 134218240;
    __int16 v15 = v11;
    __int16 v16 = 1024;
    int v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBBackupValidateKey(%p): %d", buf, 0x12u);
    _MBLog();
  }
  return v6 == 0;
}

+ (BOOL)validateWrappedKey:(id)a3 withKeyBag:(id)a4 forPath:(id)a5 error:(id *)a6
{
  if (!a4) {
    __assert_rtn("+[MBKeyBagFile validateWrappedKey:withKeyBag:forPath:error:]", "MBKeyBagFile.m", 137, "keybag");
  }
  return _objc_msgSend(a4, "validateWrappedKey:error:", a3, a6, a5);
}

- (int)readWithBytes:(void *)a3 count:(unsigned int)a4 offset:(unint64_t)a5 error:(id *)a6
{
  uint64_t v11 = MKBBackupPread();
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    handle = self->_handle;
    *(_DWORD *)buf = 134219008;
    __int16 v16 = handle;
    __int16 v17 = 2048;
    __int16 v18 = a3;
    __int16 v19 = 1024;
    unsigned int v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MKBBackupPread(%p, %p, %u, %llu): %ld", buf, 0x30u);
    _MBLog();
  }
  if (v11 < 0)
  {
    LODWORD(v11) = -1;
    if (a6) {
      *a6 = +[MBKeyBag errorWithReturnCode:0xFFFFFFFFLL description:@"MKBBackupPread error"];
    }
  }
  return v11;
}

- (BOOL)closeWithError:(id *)a3
{
  handle = self->_handle;
  uint64_t v5 = MKBBackupClose();
  uint64_t v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v9 = handle;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "MKBBackupClose(%p): %d", buf, 0x12u);
    _MBLog();
  }
  if (a3 && v5) {
    *a3 = +[MBKeyBag errorWithReturnCode:v5 description:@"MKBBackupClose error"];
  }
  return v5 == 0;
}

+ (const)keyBagUUIDForEncryptionKey:(id)a3
{
  if ((unint64_t)[a3 length] < 0x10) {
    return 0;
  }
  return (const char *)[a3 bytes];
}

@end