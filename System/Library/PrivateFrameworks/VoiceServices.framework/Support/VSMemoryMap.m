@interface VSMemoryMap
- (BOOL)mmap;
- (NSString)filePath;
- (VSMemoryMap)initWithFilePath:(id)a3;
- (int)fd;
- (unint64_t)fileSize;
- (void)dealloc;
- (void)madvise;
- (void)mappedData;
@end

@implementation VSMemoryMap

- (void).cxx_destruct
{
}

- (int)fd
{
  return self->_fd;
}

- (void)mappedData
{
  return self->_mappedData;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)madvise
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unint64_t fileSize = self->_fileSize;
  if (fileSize)
  {
    v7[0] = 0;
    v7[1] = fileSize;
    fcntl(self->_fd, 44, v7);
    v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      filePath = self->_filePath;
      unint64_t v6 = self->_fileSize;
      *(_DWORD *)buf = 138412546;
      v9 = filePath;
      __int16 v10 = 2048;
      unint64_t v11 = v6;
      _os_log_debug_impl(&dword_226CB1000, v4, OS_LOG_TYPE_DEBUG, "fcntl called on file '%@', size: %lu", buf, 0x16u);
    }
  }
}

- (BOOL)mmap
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(NSString *)self->_filePath UTF8String];
  int v4 = open(v3, 0);
  self->_fd = v4;
  if (v4 <= 0)
  {
    v5 = VSGetLogDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      v21.st_dev = 136315394;
      *(void *)&v21.st_mode = v3;
      WORD2(v21.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v21.st_ino + 6) = (__darwin_ino64_t)v16;
      v8 = "Unable to open file '%s', error: %s";
      v9 = &v21;
      goto LABEL_14;
    }
  }
  else
  {
    memset(&v21, 0, sizeof(v21));
    if (fstat(v4, &v21))
    {
      close(self->_fd);
      v5 = VSGetLogDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        unint64_t v6 = __error();
        v7 = strerror(*v6);
        int v17 = 136315394;
        v18 = v3;
        __int16 v19 = 2080;
        v20 = v7;
        v8 = "Unable to get size of file '%s', error: %s";
LABEL_5:
        v9 = (stat *)&v17;
LABEL_14:
        _os_log_error_impl(&dword_226CB1000, v5, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 0x16u);
      }
    }
    else
    {
      size_t st_size = v21.st_size;
      self->_unint64_t fileSize = v21.st_size;
      uint64_t v12 = mmap(0, st_size, 1, 1, self->_fd, 0);
      if (v12 != (void *)-1)
      {
        self->_mappedData = v12;
        return 1;
      }
      v5 = VSGetLogDefault();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13 = __error();
        v14 = strerror(*v13);
        int v17 = 136315394;
        v18 = v3;
        __int16 v19 = 2080;
        v20 = v14;
        v8 = "Unable to mmap '%s', error: %s";
        goto LABEL_5;
      }
    }
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (madvise(self->_mappedData, self->_fileSize, 4))
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      filePath = self->_filePath;
      unint64_t v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 138412546;
      v13 = filePath;
      __int16 v14 = 2080;
      v15 = v7;
      _os_log_error_impl(&dword_226CB1000, v3, OS_LOG_TYPE_ERROR, "Unable to madvise file '%@' MADV_DONTNEED, error: %s", buf, 0x16u);
    }
  }
  if (munmap(self->_mappedData, self->_fileSize))
  {
    int v4 = VSGetLogDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = self->_filePath;
      v9 = __error();
      __int16 v10 = strerror(*v9);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      __int16 v14 = 2080;
      v15 = v10;
      _os_log_error_impl(&dword_226CB1000, v4, OS_LOG_TYPE_ERROR, "Unable to munmap file '%@', error: %s", buf, 0x16u);
    }
  }
  close(self->_fd);
  v11.receiver = self;
  v11.super_class = (Class)VSMemoryMap;
  [(VSMemoryMap *)&v11 dealloc];
}

- (VSMemoryMap)initWithFilePath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSMemoryMap;
  unint64_t v6 = [(VSMemoryMap *)&v10 init];
  v7 = v6;
  if (!v6
    || (v6->_mappedData = 0, objc_storeStrong((id *)&v6->_filePath, a3), v8 = 0, [(VSMemoryMap *)v7 mmap]))
  {
    v8 = v7;
  }

  return v8;
}

@end