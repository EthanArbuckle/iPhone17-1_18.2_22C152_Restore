@interface _PASDeviceIdentifier
- (NSUUID)UUID;
- (_PASDeviceIdentifier)initWithBasePath:(id)a3;
- (void)reset;
@end

@implementation _PASDeviceIdentifier

- (void).cxx_destruct
{
}

- (void)reset
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (unlink([(NSString *)self->_path UTF8String])
    && *__error() != 2
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    path = self->_path;
    int v4 = *__error();
    v5 = __error();
    v6 = strerror(*v5);
    int v7 = 138412802;
    v8 = path;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2080;
    v12 = v6;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unlinking %@: [%i] %s", (uint8_t *)&v7, 0x1Cu);
  }
}

- (NSUUID)UUID
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = open([(NSString *)self->_path UTF8String], 0);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = v3;
    if (read(v3, __buf, 0x10uLL) == 16)
    {
      id v5 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:__buf];
      close(v4);
      if (v5) {
        goto LABEL_20;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        path = self->_path;
        *(_DWORD *)buf = 138412290;
        v22 = path;
        _os_log_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Removing truncated device id file: %@", buf, 0xCu);
      }
      unlink([(NSString *)self->_path UTF8String]);
      close(v4);
    }
    goto LABEL_12;
  }
  if (*__error() == 2)
  {
LABEL_12:
    int v7 = [MEMORY[0x1E4F29128] UUID];
    [v7 getUUIDBytes:__buf];
    int v8 = open([(NSString *)self->_path UTF8String], 2561, 384);
    if (v8 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = self->_path;
        int v14 = *__error();
        v15 = __error();
        v16 = strerror(*v15);
        *(_DWORD *)buf = 138412802;
        v22 = v13;
        __int16 v23 = 1024;
        int v24 = v14;
        __int16 v25 = 2080;
        v26 = v16;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error writing device identifier file %@: [%i] %s", buf, 0x1Cu);
      }

      id v5 = 0;
    }
    else
    {
      int v9 = v8;
      write(v8, __buf, 0x10uLL);
      close(v9);
      int v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:self->_path];
      if ([v10 length] == 16)
      {
        [v10 getBytes:__buf length:16];
        __int16 v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:__buf];
      }
      else
      {
        __int16 v11 = 0;
      }

      id v5 = v11;
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v17 = self->_path;
    int v18 = *__error();
    v19 = __error();
    v20 = strerror(*v19);
    *(_DWORD *)buf = 138412802;
    v22 = v17;
    __int16 v23 = 1024;
    int v24 = v18;
    __int16 v25 = 2080;
    v26 = v20;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error opening device identifier file %@: [%i] %s", buf, 0x1Cu);
  }
  id v5 = [MEMORY[0x1E4F29128] UUID];
LABEL_20:

  return (NSUUID *)v5;
}

- (_PASDeviceIdentifier)initWithBasePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PASDeviceIdentifier;
  id v5 = [(_PASDeviceIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"%@.%u.uuid", v4, getuid()];
    path = v5->_path;
    v5->_path = (NSString *)v6;
  }
  return v5;
}

@end