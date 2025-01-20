@interface PETReservoirSamplingLogStoreFile
- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)headerMap:(unint64_t *)a3;
- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3;
- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4;
- (BOOL)attemptToRecreate;
- (BOOL)changeLength:(unint64_t)a3;
- (BOOL)lock;
- (PETReservoirSamplingLogStoreFile)initWithPath:(id)a3;
- (unint64_t)currentLength;
- (void)_unmap;
- (void)dealloc;
- (void)unlock;
@end

@implementation PETReservoirSamplingLogStoreFile

- (void).cxx_destruct
{
}

- (BOOL)attemptToRecreate
{
  *(void *)&v24[13] = *MEMORY[0x1E4F143B8];
  path = self->_path;
  id v20 = 0;
  v4 = [MEMORY[0x1E4F93B30] mkstempWithPrefix:path error:&v20];
  id v5 = v20;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v19 = self->_path;
      *(_DWORD *)buf = 138412546;
      v22 = v19;
      __int16 v23 = 2112;
      *(void *)v24 = v5;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not create tempfile with prefix %@: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  id v6 = [v4 path];
  v7 = (const std::__fs::filesystem::path *)[v6 fileSystemRepresentation];
  v8 = [(NSString *)self->_path fileSystemRepresentation];
  rename(v7, v8, v9);
  LODWORD(v7) = v10;

  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v15 = [(NSString *)self->_path fileSystemRepresentation];
      int v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      *(_DWORD *)buf = 136315650;
      v22 = (void *)v15;
      __int16 v23 = 1024;
      *(_DWORD *)v24 = v16;
      v24[2] = 2080;
      *(void *)&v24[3] = v18;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not overwrite %s: [%i] %s", buf, 0x1Cu);
    }
    id v11 = [v4 path];
    unlink((const char *)[v11 fileSystemRepresentation]);

    close([v4 fd]);
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_12;
  }
  [(PETReservoirSamplingLogStoreFile *)self _unmap];
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  self->_int fd = [v4 fd];
  BOOL v12 = 1;
LABEL_12:

  return v12;
}

- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (lseek(self->_fd, 0, 2) == -1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = *__error();
    BOOL v12 = __error();
    v13 = strerror(*v12);
    int v20 = 67109378;
    int v21 = v11;
    __int16 v22 = 2080;
    __int16 v23 = v13;
    v14 = MEMORY[0x1E4F14500];
    v15 = "Could not seek to eof: [%i] %s";
LABEL_14:
    _os_log_error_impl(&dword_190C01000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v20, 0x12u);
    goto LABEL_7;
  }
  int fd = self->_fd;
  id v8 = v6;
  ssize_t v9 = write(fd, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  if (v9 == [v8 length])
  {
    BOOL v10 = 1;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v17 = *__error();
    v18 = __error();
    v19 = strerror(*v18);
    int v20 = 67109378;
    int v21 = v17;
    __int16 v22 = 2080;
    __int16 v23 = v19;
    v14 = MEMORY[0x1E4F14500];
    v15 = "Could not write: [%i] %s";
    goto LABEL_14;
  }
LABEL_7:
  BOOL v10 = 0;
LABEL_8:
  if (!self->_ptr) {
    [(PETReservoirSamplingLogStoreFile *)self remap:0];
  }
  if (a4) {
    *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self->_ptr;
  }

  return v10;
}

- (BOOL)changeLength:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = ftruncate(self->_fd, a3);
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = *__error();
    id v6 = __error();
    v7 = strerror(*v6);
    v8[0] = 67109378;
    v8[1] = v5;
    __int16 v9 = 2080;
    BOOL v10 = v7;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not change file size: [%i] %s", (uint8_t *)v8, 0x12u);
  }
  return v3 == 0;
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)headerMap:(unint64_t *)a3
{
  result = ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)self->_ptr;
  if (!result) {
    return [(PETReservoirSamplingLogStoreFile *)self remap:a3];
  }
  if (a3) {
    *a3 = self->_mapLen;
  }
  return result;
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(PETReservoirSamplingLogStoreFile *)self _unmap];
  unint64_t v5 = [(PETReservoirSamplingLogStoreFile *)self currentLength];
  self->_mapLen = v5;
  result = ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)mmap(0, v5, 3, 1, self->_fd, 0);
  if (result == ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)-1)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v7 = *__error();
      id v8 = __error();
      __int16 v9 = strerror(*v8);
      v10[0] = 67109378;
      v10[1] = v7;
      __int16 v11 = 2080;
      BOOL v12 = v9;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not map header: [%i] %s", (uint8_t *)v10, 0x12u);
    }
    result = 0;
  }
  self->_ptr = result;
  if (a3) {
    *a3 = self->_mapLen;
  }
  return result;
}

- (void)_unmap
{
  p_ptr = &self->_ptr;
  ptr = self->_ptr;
  if (ptr)
  {
    munmap(ptr, self->_mapLen);
    *p_ptr = 0;
    p_ptr[1] = 0;
  }
}

- (unint64_t)currentLength
{
  memset(&v3, 0, sizeof(v3));
  if (fstat(self->_fd, &v3)) {
    return 0;
  }
  else {
    return v3.st_size;
  }
}

- (void)unlock
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0) {
    flock(fd, 8);
  }
}

- (BOOL)lock
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int fd = self->_fd;
  if (fd < 0 || !flock(fd, 2))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v3)
    {
      int v4 = *__error();
      unint64_t v5 = __error();
      id v6 = strerror(*v5);
      v8[0] = 67109378;
      v8[1] = v4;
      __int16 v9 = 2080;
      BOOL v10 = v6;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not lock file: [%i] %s", (uint8_t *)v8, 0x12u);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  [(PETReservoirSamplingLogStoreFile *)self _unmap];
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  v4.receiver = self;
  v4.super_class = (Class)PETReservoirSamplingLogStoreFile;
  [(PETReservoirSamplingLogStoreFile *)&v4 dealloc];
}

- (PETReservoirSamplingLogStoreFile)initWithPath:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PETReservoirSamplingLogStoreFile;
  unint64_t v5 = [(PETReservoirSamplingLogStoreFile *)&v15 init];
  if (v5
    && (uint64_t v6 = [v4 copy],
        path = v5->_path,
        v5->_path = (NSString *)v6,
        path,
        id v8 = v4,
        int v9 = open((const char *)[v8 fileSystemRepresentation], 514, 384),
        v5->_int fd = v9,
        v9 < 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v12 = *__error();
      uint64_t v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 138412802;
      id v17 = v8;
      __int16 v18 = 1024;
      int v19 = v12;
      __int16 v20 = 2080;
      int v21 = v14;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not open sampled log at %@: [%i] %s", buf, 0x1Cu);
    }
    BOOL v10 = 0;
  }
  else
  {
    BOOL v10 = v5;
  }

  return v10;
}

@end