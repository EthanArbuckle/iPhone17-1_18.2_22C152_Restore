@interface TRIFileBackedMutableStringArray
+ (id)arrayFromDirectory:(id)a3;
- (BOOL)addString:(id)a3;
- (BOOL)enumerateStringsWithBlock:(id)a3;
- (TRIFileBackedMutableStringArray)init;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation TRIFileBackedMutableStringArray

- (TRIFileBackedMutableStringArray)init
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)TRIFileBackedMutableStringArray;
  v2 = [(TRIFileBackedMutableStringArray *)&v19 init];
  v3 = v2;
  if (!v2)
  {
LABEL_8:
    v11 = v3;
    goto LABEL_12;
  }
  v2->_fd = -1;
  v2->_count = 0;
  v4 = NSTemporaryDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"TRIFileBackedMutableStringArray-"];

  id v18 = 0;
  v6 = [MEMORY[0x1E4F93B30] mkstempWithPrefix:v5 error:&v18];
  id v7 = v18;
  if (v6)
  {
    id v8 = [v6 path];
    int v9 = unlink((const char *)[v8 fileSystemRepresentation]);

    if (v9)
    {
      v10 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = [v6 path];
        v15 = __error();
        v16 = strerror(*v15);
        int v17 = *__error();
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        __int16 v22 = 2080;
        v23 = v16;
        __int16 v24 = 1024;
        int v25 = v17;
        _os_log_error_impl(&dword_19D909000, v10, OS_LOG_TYPE_ERROR, "Failed to unlink tempfile \"%@\": %s (%d)", buf, 0x1Cu);
      }
    }
    v3->_fd = [v6 fd];

    goto LABEL_8;
  }
  v12 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    __int16 v22 = 2112;
    v23 = (char *)v7;
    _os_log_error_impl(&dword_19D909000, v12, OS_LOG_TYPE_ERROR, "Failed to create tempfile \"%@XXXXXX\" for TRIFileBackedMutableStringArray: %@", buf, 0x16u);
  }

  v11 = 0;
LABEL_12:

  return v11;
}

- (void)dealloc
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    close(fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFileBackedMutableStringArray;
  [(TRIFileBackedMutableStringArray *)&v4 dealloc];
}

+ (id)arrayFromDirectory:(id)a3
{
  id v5 = a3;
  v6 = objc_opt_new();
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    int v9 = [v7 enumeratorAtURL:v8 includingPropertiesForKeys:0 options:1 errorHandler:0];

    v10 = (void *)MEMORY[0x19F3AD060]();
    uint64_t v11 = [v9 nextObject];
    if (v11)
    {
      v12 = (void *)v11;
      while (1)
      {
        v13 = [v12 path];
        if (!v13)
        {
          v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, a1, @"TRIFileBackedMutableStringArray.m", 73, @"Expression was unexpectedly nil/false: %@", @"url.path" object file lineNumber description];
        }
        int v14 = [v6 addString:v13];

        if (!v14) {
          break;
        }
        v10 = (void *)MEMORY[0x19F3AD060]();
        v12 = [v9 nextObject];
        if (!v12) {
          goto LABEL_8;
        }
      }
      id v16 = 0;
    }
    else
    {
LABEL_8:
      id v16 = v6;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)addString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F3AD060]();
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];
  if (v7)
  {
    id v8 = (const char *)v7;
    int v9 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:self->_fd closeOnDealloc:0];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 length:strlen(v8) + 1 freeWhenDone:0];
    id v15 = 0;
    char v11 = [v9 writeData:v10 error:&v15];
    id v12 = v15;
    if (v11)
    {
      ++self->_count;
    }
    else
    {
      v13 = TRILogCategory_ClientFramework();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v12;
        _os_log_error_impl(&dword_19D909000, v13, OS_LOG_TYPE_ERROR, "Failed to append string to TRIFileBackedMutableStringArray: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    int v9 = TRILogCategory_ClientFramework();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_error_impl(&dword_19D909000, v9, OS_LOG_TYPE_ERROR, "Failed to add non-UTF-8 string to TRIFileBackedMutableStringArray: %@", buf, 0xCu);
    }
    char v11 = 0;
  }

  return v11;
}

- (BOOL)enumerateStringsWithBlock:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, stat *))a3;
  memset(&v35, 0, sizeof(v35));
  if (!fstat(self->_fd, &v35))
  {
    size_t st_size = v35.st_size;
    if (v35.st_size)
    {
      int v9 = (char *)mmap(0, v35.st_size, 1, 1, self->_fd, 0);
      if (v9 == (char *)-1)
      {
        id v6 = TRILogCategory_ClientFramework();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          goto LABEL_3;
        }
        objc_super v19 = __error();
        v20 = strerror(*v19);
        int v21 = *__error();
        v35.st_dev = 136315394;
        *(void *)&v35.st_mode = v20;
        WORD2(v35.st_ino) = 1024;
        *(_DWORD *)((char *)&v35.st_ino + 6) = v21;
        __int16 v22 = "Failed to mmap() tempfile: %s (%d)";
        v23 = (uint8_t *)&v35;
LABEL_21:
        _os_log_error_impl(&dword_19D909000, v6, OS_LOG_TYPE_ERROR, v22, v23, 0x12u);
        goto LABEL_3;
      }
      v10 = v9;
      char v11 = &v9[st_size];
      id v12 = v9;
      do
      {
        if (v12 >= v11) {
          break;
        }
        v13 = (char *)memchr(v12, 0, v11 - v12);
        if (!v13) {
          break;
        }
        int v14 = v13;
        LOBYTE(v35.st_dev) = 0;
        id v15 = (void *)MEMORY[0x19F3AD060]();
        id v16 = (void *)[[NSString alloc] initWithUTF8String:v12];
        if (!v16)
        {
          v30 = [MEMORY[0x1E4F28B00] currentHandler];
          [v30 handleFailureInMethod:a2 object:self file:@"TRIFileBackedMutableStringArray.m" lineNumber:151 description:@"String somehow did not survive round-trip to UTF-8."];
        }
        v5[2](v5, v16, &v35);

        id v12 = v14 + 1;
      }
      while (!LOBYTE(v35.st_dev));
      if (munmap(v10, st_size))
      {
        id v17 = TRILogCategory_ClientFramework();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v27 = __error();
          v28 = strerror(*v27);
          int v29 = *__error();
          v35.st_dev = 136315394;
          *(void *)&v35.st_mode = v28;
          WORD2(v35.st_ino) = 1024;
          *(_DWORD *)((char *)&v35.st_ino + 6) = v29;
          _os_log_error_impl(&dword_19D909000, v17, OS_LOG_TYPE_ERROR, "Failed to munmap TRIFileBackedMutableStringArray buffer: %s (%d)", (uint8_t *)&v35, 0x12u);
        }
      }
    }
    BOOL v7 = 1;
    goto LABEL_17;
  }
  id v6 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = __error();
    int v25 = strerror(*v24);
    int v26 = *__error();
    *(_DWORD *)buf = 136315394;
    v32 = v25;
    __int16 v33 = 1024;
    int v34 = v26;
    __int16 v22 = "Failed to stat tempfile for TRIFileBackedMutableStringArray enumeration: %s (%d)";
    v23 = buf;
    goto LABEL_21;
  }
LABEL_3:

  BOOL v7 = 0;
LABEL_17:

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

@end