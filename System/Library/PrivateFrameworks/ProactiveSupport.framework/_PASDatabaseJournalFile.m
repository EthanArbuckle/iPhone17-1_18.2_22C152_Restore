@interface _PASDatabaseJournalFile
- (BOOL)isAlive;
- (BOOL)isFullyRead;
- (_PASDatabaseJournalFile)initWithPath:(id)a3;
- (id)description;
- (id)read;
- (unint64_t)length;
- (void)clear;
- (void)dealloc;
- (void)destroy;
- (void)destroyAndUnlinkIfEmpty;
- (void)unlink;
- (void)write:(id)a3;
@end

@implementation _PASDatabaseJournalFile

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, self->_path];

  return v6;
}

- (void)unlink
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_dead)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"_PASDatabaseJournalFile.m", 199, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
  if (unlink([(NSString *)self->_path UTF8String]))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      int v5 = *__error();
      v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 138412802;
      v11 = path;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2080;
      v15 = v7;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not remove %@: errno=%i: %s", buf, 0x1Cu);
    }
  }
  else
  {
    self->_dead = 1;
  }
}

- (void)clear
{
  if (self->_dead)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"_PASDatabaseJournalFile.m", 188, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  if (self->_len)
  {
    lseek(self->_fd, 0, 0);
    ftruncate(self->_fd, 0);
    self->_len = 0;
    self->_readCursor = 0;
  }
}

- (id)read
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!self->_len || [(_PASDatabaseJournalFile *)self isFullyRead])
  {
    v4 = 0;
    goto LABEL_24;
  }
  if (self->_dead)
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"_PASDatabaseJournalFile.m", 128, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  if (!self->_written) {
    fcntl(self->_fd, 48, 1);
  }
  int v39 = 0;
  uint64_t __buf = 0;
  unint64_t v5 = pread(self->_fd, &__buf, 0xCuLL, self->_readCursor);
  unint64_t v6 = self->_readCursor + 12;
  self->_readCursor = v6;
  if (v5 <= 0xB)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      int v8 = *__error();
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 138412802;
      *(void *)v41 = path;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v8;
      LOWORD(v42[1]) = 2080;
      *(void *)((char *)&v42[1] + 2) = v10;
      v11 = MEMORY[0x1E4F14500];
      __int16 v12 = "Could not read from journal file %@: errno=%i: %s";
      uint32_t v13 = 28;
LABEL_20:
      _os_log_error_impl(&dword_1A32C4000, v11, OS_LOG_TYPE_ERROR, v12, buf, v13);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (self->_len - v6 >= HIDWORD(__buf))
  {
    int v15 = __buf;
    if (__buf != -1347426410)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v30 = self->_path;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v41 = -1347426410;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = v15;
        LOWORD(v42[0]) = 2112;
        *(void *)((char *)v42 + 2) = v30;
        v11 = MEMORY[0x1E4F14500];
        __int16 v12 = "Journal file has invalid magic number: expected 0x%x, got 0x%x: %@";
        uint32_t v13 = 24;
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    id v16 = objc_alloc(MEMORY[0x1E4F1CA58]);
    v17 = (void *)[v16 initWithLength:HIDWORD(__buf)];
    int fd = self->_fd;
    id v19 = v17;
    v20 = (void *)[v19 mutableBytes];
    ssize_t v21 = pread(fd, v20, HIDWORD(__buf), self->_readCursor);
    ssize_t v22 = HIDWORD(__buf);
    self->_readCursor += HIDWORD(__buf);
    if (v21 >= v22)
    {
      id v32 = v19;
      v33 = (const Bytef *)[v32 bytes];
      int v34 = adler32(0, v33, HIDWORD(__buf));
      int v35 = v39;
      if (v39 == v34)
      {
        id v19 = v32;
        v4 = v19;
        goto LABEL_23;
      }
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_30;
      }
      v36 = self->_path;
      *(_DWORD *)buf = 138412802;
      *(void *)v41 = v36;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v34;
      LOWORD(v42[1]) = 1024;
      *(_DWORD *)((char *)&v42[1] + 2) = v35;
      v27 = MEMORY[0x1E4F14500];
      v28 = "Journal file checksum mismatch: %@: %u / %u";
      uint32_t v29 = 24;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
LABEL_30:
        self->_readCursor -= HIDWORD(__buf);
        goto LABEL_22;
      }
      v23 = self->_path;
      int v24 = *__error();
      v25 = __error();
      v26 = strerror(*v25);
      *(_DWORD *)buf = 138412802;
      *(void *)v41 = v23;
      *(_WORD *)&v41[8] = 1024;
      v42[0] = v24;
      LOWORD(v42[1]) = 2080;
      *(void *)((char *)&v42[1] + 2) = v26;
      v27 = MEMORY[0x1E4F14500];
      v28 = "Could not read from journal file %@: errno=%i: %s";
      uint32_t v29 = 28;
    }
    _os_log_error_impl(&dword_1A32C4000, v27, OS_LOG_TYPE_ERROR, v28, buf, v29);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = self->_path;
    *(_DWORD *)buf = 138412290;
    *(void *)v41 = v14;
    v11 = MEMORY[0x1E4F14500];
    __int16 v12 = "Journal file truncated: %@";
    uint32_t v13 = 12;
    goto LABEL_20;
  }
LABEL_21:
  id v19 = 0;
LABEL_22:
  self->_readCursor -= 12;
  [(_PASDatabaseJournalFile *)self destroy];
  v4 = 0;
LABEL_23:

LABEL_24:

  return v4;
}

- (unint64_t)length
{
  return self->_len;
}

- (BOOL)isAlive
{
  return !self->_dead;
}

- (BOOL)isFullyRead
{
  return self->_len <= self->_readCursor || self->_dead;
}

- (void)write:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((unint64_t)[v5 length] >> 32)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_PASDatabaseJournalFile.m", 86, @"Invalid parameter not satisfying: %@", @"data.length <= UINT32_MAX" object file lineNumber description];
  }
  if (self->_dead)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"_PASDatabaseJournalFile.m", 87, @"Invalid parameter not satisfying: %@", @"!_dead" object file lineNumber description];
  }
  id v6 = v5;
  int v7 = adler32(0, (const Bytef *)[v6 bytes], objc_msgSend(v6, "length"));
  v20[0] = -1347426410;
  v20[1] = [v6 length];
  v20[2] = v7;
  v28.iov_base = v20;
  v28.iov_len = 12;
  id v8 = v6;
  uint64_t v29 = [v8 bytes];
  uint64_t v9 = [v8 length];

  uint64_t v30 = v9;
  if (writev(self->_fd, &v28, 2) < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      path = self->_path;
      int v15 = *__error();
      id v16 = __error();
      v17 = strerror(*v16);
      v27.st_dev = 138412802;
      *(void *)&v27.st_mode = path;
      WORD2(v27.st_ino) = 1024;
      *(_DWORD *)((char *)&v27.st_ino + 6) = v15;
      HIWORD(v27.st_uid) = 2080;
      *(void *)&v27.st_gid = v17;
      _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not write to journal file %@: errno=%i: %s", (uint8_t *)&v27, 0x1Cu);
    }
  }
  else
  {
    memset(&v27, 0, sizeof(v27));
    if (fstat(self->_fd, &v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v10 = self->_path;
        int v11 = *__error();
        __int16 v12 = __error();
        uint32_t v13 = strerror(*v12);
        *(_DWORD *)buf = 138412802;
        ssize_t v22 = v10;
        __int16 v23 = 1024;
        int v24 = v11;
        __int16 v25 = 2080;
        v26 = v13;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
      }
      close(self->_fd);
      self->_int fd = -1;
    }
    self->_len = v27.st_size;
    self->_written = 1;
  }
}

- (void)dealloc
{
  [(_PASDatabaseJournalFile *)self destroy];
  v3.receiver = self;
  v3.super_class = (Class)_PASDatabaseJournalFile;
  [(_PASDatabaseJournalFile *)&v3 dealloc];
}

- (void)destroyAndUnlinkIfEmpty
{
  if (!self->_len) {
    [(_PASDatabaseJournalFile *)self unlink];
  }

  [(_PASDatabaseJournalFile *)self destroy];
}

- (void)destroy
{
  int fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_int fd = -1;
  }
  self->_dead = 1;
}

- (_PASDatabaseJournalFile)initWithPath:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_PASDatabaseJournalFile;
  id v6 = [(_PASDatabaseJournalFile *)&v20 init];
  int v7 = v6;
  if (!v6) {
    goto LABEL_11;
  }
  p_path = &v6->_path;
  objc_storeStrong((id *)&v6->_path, a3);
  int v9 = open_dprotected_np((const char *)[v5 UTF8String], 522, 2, 0, 384);
  v7->_int fd = v9;
  if ((v9 & 0x80000000) == 0)
  {
    memset(&v27, 0, sizeof(v27));
    if (fstat(v9, &v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        __int16 v12 = *p_path;
        int v13 = *__error();
        __int16 v14 = __error();
        int v15 = strerror(*v14);
        *(_DWORD *)buf = 138412802;
        ssize_t v22 = v12;
        __int16 v23 = 1024;
        int v24 = v13;
        __int16 v25 = 2080;
        v26 = v15;
        _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not fstat %@: errno=%i: %s", buf, 0x1Cu);
      }
      close(v7->_fd);
      v10 = 0;
      v7->_int fd = -1;
      goto LABEL_12;
    }
    v7->_len = v27.st_size;
LABEL_11:
    v10 = v7;
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v16 = *p_path;
    int v17 = *__error();
    v18 = __error();
    id v19 = strerror(*v18);
    v27.st_dev = 138412802;
    *(void *)&v27.st_mode = v16;
    WORD2(v27.st_ino) = 1024;
    *(_DWORD *)((char *)&v27.st_ino + 6) = v17;
    HIWORD(v27.st_uid) = 2080;
    *(void *)&v27.st_gid = v19;
    _os_log_error_impl(&dword_1A32C4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not open %@: errno=%i: %s", (uint8_t *)&v27, 0x1Cu);
  }
  v10 = 0;
LABEL_12:

  return v10;
}

@end