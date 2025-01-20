@interface MBEncryptionKeyReader
+ (id)encryptionKeyReaderForFileAtPath:(id)a3 error:(id *)a4;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)validateEncryptionKey:(id)a3 error:(id *)a4;
- (MBEncryptionKeyReader)initWithHandle:(_mkbbackupref *)a3;
- (id)encryptionKeyWithError:(id *)a3;
- (id)updatedEncryptionKeyForCurrentKey:(id)a3 withError:(id *)a4;
- (void)dealloc;
@end

@implementation MBEncryptionKeyReader

+ (id)encryptionKeyReaderForFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  [v5 fileSystemRepresentation];
  uint64_t v6 = MKBBackupOpen();
  uint64_t v7 = v6;
  if (v6 == -2)
  {
    v10 = MBGetDefaultLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 1024;
    int v15 = -2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
    goto LABEL_10;
  }
  if (v6)
  {
    v10 = MBGetDefaultLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 1024;
    int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
LABEL_10:
    _MBLog();
LABEL_11:

    if (a4)
    {
      +[MBKeyBag errorWithReturnCode:v7 path:v5 description:@"MKBBackupOpen error"];
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    goto LABEL_14;
  }
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = v5;
    __int16 v14 = 1024;
    int v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "MKBBackupOpen(\"%@\"): %d", buf, 0x12u);
    _MBLog();
  }

  v9 = [[MBEncryptionKeyReader alloc] initWithHandle:0];
LABEL_14:

  return v9;
}

- (MBEncryptionKeyReader)initWithHandle:(_mkbbackupref *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MBEncryptionKeyReader;
  result = [(MBEncryptionKeyReader *)&v5 init];
  if (result) {
    result->_handle = a3;
  }
  return result;
}

- (void)dealloc
{
  if (self->_handle) {
    [(MBEncryptionKeyReader *)self closeWithError:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)MBEncryptionKeyReader;
  [(MBEncryptionKeyReader *)&v3 dealloc];
}

- (id)encryptionKeyWithError:(id *)a3
{
  uint64_t v5 = MKBBackupCopyKeyWithError();
  uint64_t v6 = v5;
  if (v5 == -2)
  {
    v9 = MBGetDefaultLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_11;
    }
    handle = self->_handle;
    *(_DWORD *)buf = 134218498;
    __int16 v14 = handle;
    __int16 v15 = 1024;
    int v16 = -2;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MKBBackupCopyKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
    goto LABEL_10;
  }
  if (!v5)
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = self->_handle;
      *(_DWORD *)buf = 134218240;
      __int16 v14 = v8;
      __int16 v15 = 1024;
      int v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "MKBBackupCopyKeyWithError(%p) success: %d", buf, 0x12u);
      _MBLog();
    }

    goto LABEL_13;
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v11 = self->_handle;
    *(_DWORD *)buf = 134218498;
    __int16 v14 = v11;
    __int16 v15 = 1024;
    int v16 = v6;
    __int16 v17 = 2112;
    uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "MKBBackupCopyKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
LABEL_10:
    _MBLog();
  }
LABEL_11:

  if (a3)
  {
    *a3 = +[MBKeyBag errorWithReturnCode:v6 description:@"MKBBackupCopyKey error"];
  }
LABEL_13:
  return 0;
}

- (id)updatedEncryptionKeyForCurrentKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!v6)
  {
LABEL_14:
    id v11 = 0;
    goto LABEL_15;
  }
  uint64_t updated = MKBBackupUpdateKeyWithError();
  uint64_t v8 = updated;
  if (updated == -2)
  {
    v12 = MBGetDefaultLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_12;
    }
    handle = self->_handle;
    *(_DWORD *)buf = 134218498;
    __int16 v17 = handle;
    __int16 v18 = 1024;
    int v19 = -2;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "MKBBackupUpdateKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
    goto LABEL_11;
  }
  if (updated)
  {
    v12 = MBGetDefaultLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v14 = self->_handle;
    *(_DWORD *)buf = 134218498;
    __int16 v17 = v14;
    __int16 v18 = 1024;
    int v19 = v8;
    __int16 v20 = 2112;
    uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "MKBBackupUpdateKeyWithError(%p) failed: %d %@", buf, 0x1Cu);
LABEL_11:
    _MBLog();
LABEL_12:

    if (a4)
    {
      *a4 = +[MBKeyBag errorWithReturnCode:v8 description:@"MKBBackupUpdateKey error"];
    }
    goto LABEL_14;
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self->_handle;
    *(_DWORD *)buf = 134218240;
    __int16 v17 = v10;
    __int16 v18 = 1024;
    int v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MKBBackupUpdateKeyWithError(%p) success: %d", buf, 0x12u);
    _MBLog();
  }

  id v11 = v6;
LABEL_15:

  return v11;
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
        goto LABEL_11;
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
        goto LABEL_11;
      }
      v12 = self->_handle;
      *(_DWORD *)buf = 134218240;
      __int16 v15 = v12;
      __int16 v16 = 1024;
      int v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MKBBackupValidateKey(%p): %d", buf, 0x12u);
    }
    _MBLog();
LABEL_11:

    if (a4)
    {
      *a4 = +[MBKeyBag errorWithReturnCode:v6 description:@"MKBBackupValidateKey error"];
    }
    return v6 == 0;
  }
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = self->_handle;
    *(_DWORD *)buf = 134218240;
    __int16 v15 = v11;
    __int16 v16 = 1024;
    int v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "MKBBackupValidateKey(%p): %d", buf, 0x12u);
    _MBLog();
  }

  return v6 == 0;
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

  if (a3 && v5)
  {
    *a3 = +[MBKeyBag errorWithReturnCode:v5 description:@"MKBBackupClose error"];
  }
  return v5 == 0;
}

@end