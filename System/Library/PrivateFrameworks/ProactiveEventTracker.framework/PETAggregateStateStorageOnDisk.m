@interface PETAggregateStateStorageOnDisk
- (BOOL)resetLocked;
- (PETAggregateStateStorageOnDisk)initWithPath:(id)a3;
- (unint64_t)_reserveCapacity:(unsigned int)a3;
- (void)_die;
- (void)_remapWithFlock:(BOOL)a3;
- (void)dealloc;
- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4;
- (void)reset;
- (void)saveCorruptState;
@end

@implementation PETAggregateStateStorageOnDisk

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  v7 = (uint64_t (**)(id, uint64_t, uint64_t, uint64_t, unsigned char *))a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PETAggregateStateStorage.m", 301, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_dead);
  if ((v8 & 1) == 0)
  {
    pthread_mutex_lock(&self->_localLock);
    if (!flock(self->_fd, 2))
    {
      if (a3)
      {
        unint64_t v10 = [(PETAggregateStateStorageOnDisk *)self _reserveCapacity:a3];
        unsigned __int8 v11 = atomic_load((unsigned __int8 *)&self->_dead);
        if (v11) {
          goto LABEL_5;
        }
        uint64_t v12 = v10;
      }
      else
      {
        uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      bytes = (unsigned int *)self->_bytes;
      uint64_t v14 = bytes[2];
      if (self->_mappedLen == v14) {
        goto LABEL_15;
      }
      [(PETAggregateStateStorageOnDisk *)self _remapWithFlock:0];
      if (self->_mappedLen != v14) {
        goto LABEL_6;
      }
      unsigned __int8 v16 = atomic_load((unsigned __int8 *)&self->_dead);
      if ((v16 & 1) == 0)
      {
        bytes = (unsigned int *)self->_bytes;
        if (bytes)
        {
LABEL_15:
          char v18 = 0;
          char v15 = v7[2](v7, (uint64_t)(bytes + 3), bytes[1] - 12, v12, &v18);
          if (a3 && (v15 & 1) == 0) {
            *((_DWORD *)self->_bytes + 1) -= a3;
          }
          if (!v18 || [(PETAggregateStateStorageOnDisk *)self resetLocked]) {
            goto LABEL_6;
          }
        }
      }
    }
LABEL_5:
    [(PETAggregateStateStorageOnDisk *)self _die];
LABEL_6:
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0) {
      flock(fd, 8);
    }
    pthread_mutex_unlock(&self->_localLock);
  }
}

- (unint64_t)_reserveCapacity:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  bytes = self->_bytes;
  uint64_t v4 = bytes[1];
  int v5 = v4 + a3;
  if (v4 + a3 > bytes[2])
  {
    if (ftruncate(self->_fd, (v5 + 4095) & 0xFFFFF000))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v8 = *__error();
        v9 = __error();
        unint64_t v10 = strerror(*v9);
        v11[0] = 67109378;
        v11[1] = v8;
        __int16 v12 = 2080;
        v13 = v10;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not resize aggregate storage: [%i] %s", (uint8_t *)v11, 0x12u);
      }
      atomic_store(1u, (unsigned __int8 *)&self->_dead);
    }
    bytes = self->_bytes;
    bytes[2] = (v5 + 4095) & 0xFFFFF000;
  }
  bytes[1] = v5;
  return v4 - 12;
}

- (void).cxx_destruct
{
}

- (void)saveCorruptState
{
  id v4 = [(NSString *)self->_path stringByAppendingPathExtension:@"corrupt"];
  if (v4)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 copyItemAtPath:self->_path toPath:v4 error:0];
  }
}

- (void)reset
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_dead);
  if ((v2 & 1) == 0)
  {
    p_localLock = &self->_localLock;
    pthread_mutex_lock(&self->_localLock);
    if (flock(self->_fd, 2)) {
      [(PETAggregateStateStorageOnDisk *)self _die];
    }
    else {
      [(PETAggregateStateStorageOnDisk *)self resetLocked];
    }
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0) {
      flock(fd, 8);
    }
    pthread_mutex_unlock(p_localLock);
  }
}

- (BOOL)resetLocked
{
  if (!self->_mappedLen) {
    return 1;
  }
  memset((char *)self->_bytes + 12, 255, 0x400uLL);
  bytes = self->_bytes;
  *(void *)bytes = 0x40CCC4DA157;
  bytes[2] = 4096;
  if (!ftruncate(self->_fd, 4096))
  {
    if (self->_mappedLen == *((_DWORD *)self->_bytes + 2)) {
      return 1;
    }
    [(PETAggregateStateStorageOnDisk *)self _remapWithFlock:0];
    unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_dead);
    if ((v5 & 1) == 0) {
      return 1;
    }
  }
  [(PETAggregateStateStorageOnDisk *)self _die];
  return 0;
}

- (void)_die
{
  atomic_store(1u, (unsigned __int8 *)&self->_dead);
  self->_bytes = 0;
  self->_mappedLen = 0;
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
}

- (void)_remapWithFlock:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_dead);
  if (v3) {
    return;
  }
  BOOL v4 = a3;
  if (a3 && flock(self->_fd, 2)) {
    goto LABEL_7;
  }
  bytes = self->_bytes;
  if (bytes)
  {
    if (munmap(bytes, self->_mappedLen)) {
      goto LABEL_7;
    }
  }
  memset(&v21, 0, sizeof(v21));
  if (fstat(self->_fd, &v21)) {
    goto LABEL_7;
  }
  off_t st_size = v21.st_size;
  self->_unint64_t mappedLen = v21.st_size;
  size_t v9 = st_size;
  if (!st_size)
  {
    *(void *)__buf = 0x40CCC4DA157;
    *(_DWORD *)&__buf[8] = 4096;
    if (pwrite(self->_fd, __buf, 0xCuLL, 0) == -1 || ftruncate(self->_fd, 4096)) {
      goto LABEL_7;
    }
    size_t v9 = 4096;
    self->_unint64_t mappedLen = 4096;
  }
  unint64_t v10 = (int *)mmap(0, v9, 3, 513, self->_fd, 0);
  self->_bytes = v10;
  if (v10 != (int *)-1)
  {
    unsigned __int8 v11 = v10;
    int v12 = *v10;
    if (*v10 != -867327657)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)__buf = 138412802;
        *(void *)&__buf[4] = path;
        *(_WORD *)&__buf[12] = 1024;
        *(_DWORD *)&__buf[14] = v12;
        __int16 v23 = 1024;
        int v24 = -867327657;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Aggregate storage file %@ has wrong magic number: got %x, expected %x", __buf, 0x18u);
      }
      [(PETAggregateStateStorageOnDisk *)self saveCorruptState];
      if (![(PETAggregateStateStorageOnDisk *)self resetLocked]) {
        goto LABEL_7;
      }
      unsigned __int8 v11 = self->_bytes;
    }
    unint64_t v13 = v11[2];
    unint64_t mappedLen = self->_mappedLen;
    if (mappedLen >= v13 && v11[1] <= v13) {
      goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v18 = self->_path;
      int v19 = v11[1];
      *(_DWORD *)__buf = 138413058;
      *(void *)&__buf[4] = v18;
      *(_WORD *)&__buf[12] = 1024;
      *(_DWORD *)&__buf[14] = v19;
      __int16 v23 = 1024;
      int v24 = v13;
      __int16 v25 = 2048;
      unint64_t v26 = mappedLen;
      _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Aggregate storage file %@ claims size %u, capacity %u, but is only %lu bytes", __buf, 0x22u);
    }
    [(PETAggregateStateStorageOnDisk *)self saveCorruptState];
    if ([(PETAggregateStateStorageOnDisk *)self resetLocked])
    {
LABEL_26:
      if (!st_size) {
        memset((char *)self->_bytes + 12, 255, 0x400uLL);
      }
      goto LABEL_10;
    }
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v15 = *__error();
    unsigned __int8 v16 = __error();
    v17 = strerror(*v16);
    *(_DWORD *)__buf = 67109378;
    *(_DWORD *)&__buf[4] = v15;
    *(_WORD *)&__buf[8] = 2080;
    *(void *)&__buf[10] = v17;
    _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Aggregate storage remap failed: [%i] %s", __buf, 0x12u);
  }
  [(PETAggregateStateStorageOnDisk *)self _die];
LABEL_10:
  if (v4)
  {
    int fd = self->_fd;
    if ((fd & 0x80000000) == 0) {
      flock(fd, 8);
    }
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_localLock);
  bytes = self->_bytes;
  if (bytes) {
    munmap(bytes, self->_mappedLen);
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    flock(fd, 8);
    close(self->_fd);
  }
  v5.receiver = self;
  v5.super_class = (Class)PETAggregateStateStorageOnDisk;
  [(PETAggregateStateStorageOnDisk *)&v5 dealloc];
}

- (PETAggregateStateStorageOnDisk)initWithPath:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    stat v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PETAggregateStateStorage.m", 172, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)PETAggregateStateStorageOnDisk;
  v7 = [(PETAggregateStateStorageOnDisk *)&v23 init];
  int v8 = v7;
  if (!v7) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v7->_path, a3);
  id v9 = v6;
  int v10 = open((const char *)[v9 fileSystemRepresentation], 514, 384);
  v8->_int fd = v10;
  if (v10 < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      unsigned __int8 v11 = 0;
      goto LABEL_12;
    }
    int v12 = *__error();
    unint64_t v13 = __error();
    uint64_t v14 = strerror(*v13);
    *(_DWORD *)buf = 138412802;
    id v25 = v9;
    __int16 v26 = 1024;
    int v27 = v12;
    __int16 v28 = 2080;
    v29 = v14;
    int v15 = MEMORY[0x1E4F14500];
    unsigned __int8 v16 = "Could not open aggregate storage at %@: [%i] %s";
LABEL_14:
    _os_log_error_impl(&dword_190C01000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0x1Cu);
    goto LABEL_11;
  }
  char value = -1;
  if (fsetxattr(v10, "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0) < 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v18 = *__error();
    int v19 = __error();
    v20 = strerror(*v19);
    *(_DWORD *)buf = 138412802;
    id v25 = v9;
    __int16 v26 = 1024;
    int v27 = v18;
    __int16 v28 = 2080;
    v29 = v20;
    int v15 = MEMORY[0x1E4F14500];
    unsigned __int8 v16 = "Could not set RunningBoard file lock exception attribute at %@: [%i] %s";
    goto LABEL_14;
  }
  pthread_mutex_init(&v8->_localLock, 0);
  [(PETAggregateStateStorageOnDisk *)v8 _remapWithFlock:1];
LABEL_7:
  unsigned __int8 v11 = v8;
LABEL_12:

  return v11;
}

@end