@interface PLExclusiveFileLock
- (BOOL)isLocked;
- (PLExclusiveFileLock)init;
- (PLExclusiveFileLock)initWithURL:(id)a3;
- (PLExclusiveFileLock)lockWithError:(id *)a3;
- (id)lockData;
- (id)lockFailure;
- (void)dealloc;
- (void)unlock;
@end

@implementation PLExclusiveFileLock

- (void).cxx_destruct
{
}

- (id)lockFailure
{
  v54[3] = *MEMORY[0x1E4F143B8];
  uint64_t v41 = 0;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:self->_url options:0 error:&v41];
  if (!v3)
  {
    v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28A50];
    v53[0] = *MEMORY[0x1E4F28228];
    v53[1] = v17;
    v54[0] = @"error reading lock information";
    v54[1] = v41;
    v53[2] = *MEMORY[0x1E4F289D0];
    v54[2] = self->_url;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
    v18 = [v16 errorWithDomain:@"com.apple.photos.error" code:46010 userInfo:v5];
    goto LABEL_22;
  }
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v41];
  if (!v4)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28A50];
    v51[0] = *MEMORY[0x1E4F28228];
    v51[1] = v20;
    v52[0] = @"error reading lock information";
    v52[1] = v41;
    v51[2] = *MEMORY[0x1E4F289D0];
    v52[2] = self->_url;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:3];
    v18 = [v19 errorWithDomain:@"com.apple.photos.error" code:46010 userInfo:v21];

    v5 = 0;
    goto LABEL_22;
  }
  v5 = v4;
  v6 = [v4 objectForKeyedSubscript:@"pid"];
  uint64_t v7 = [v6 intValue];

  v8 = [v5 objectForKeyedSubscript:@"hostuuid"];
  char v9 = [v8 isEqualToString:qword_1E93E76D8];

  if (v9)
  {
    if (!v7)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F289D0];
      v47[0] = *MEMORY[0x1E4F28228];
      v47[1] = v29;
      url = self->_url;
      v48[0] = @"locked by unknown process";
      v48[1] = url;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = v48;
      v15 = v47;
      goto LABEL_14;
    }
    if (v7 == getpid())
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F289D0];
      v45[0] = *MEMORY[0x1E4F28228];
      v45[1] = v11;
      v12 = self->_url;
      v46[0] = @"locked by this process";
      v46[1] = v12;
      v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = v46;
      v15 = v45;
LABEL_14:
      v31 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:2];
      v18 = [v10 errorWithDomain:@"com.apple.photos.error" code:46010 userInfo:v31];

      goto LABEL_22;
    }
    uint64_t v32 = [v5 objectForKeyedSubscript:@"processname"];
    v33 = (void *)v32;
    v34 = @"hostname";
    if (v32) {
      v34 = (__CFString *)v32;
    }
    v25 = v34;

    v28 = (void *)[[NSString alloc] initWithFormat:@"locked by process %@(%d)", v25, v7];
    memset(buffer, 0, sizeof(buffer));
    pid_t v35 = getpid();
    if (proc_pidinfo(v35, 13, 1uLL, buffer, 64) && HIDWORD(buffer[0]) == 5)
    {
      uint64_t v36 = [[NSString alloc] initWithFormat:@"locked by zombie process %@(%d)", v25, v7];

      v28 = (void *)v36;
    }
    v37 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28588];
    v42[0] = *MEMORY[0x1E4F28228];
    v42[1] = v38;
    v43[0] = @"locked by another process";
    v43[1] = v28;
    v42[2] = *MEMORY[0x1E4F289D0];
    v43[2] = self->_url;
    v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
    v18 = [v37 errorWithDomain:@"com.apple.photos.error" code:46010 userInfo:v39];
  }
  else
  {
    uint64_t v22 = [v5 objectForKeyedSubscript:@"hostname"];
    v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = @"unknown";
    }
    v25 = [@"locked by host " stringByAppendingString:v24];

    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28588];
    v49[0] = *MEMORY[0x1E4F28228];
    v49[1] = v27;
    v50[0] = @"locked by remote host";
    v50[1] = v25;
    v49[2] = *MEMORY[0x1E4F289D0];
    v50[2] = self->_url;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
    v18 = [v26 errorWithDomain:@"com.apple.photos.error" code:46010 userInfo:v28];
  }

LABEL_22:
  return v18;
}

- (id)lockData
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v15[0] = qword_1E93E76D8;
  v14[0] = @"hostuuid";
  v14[1] = @"hostname";
  v2 = [NSString stringWithUTF8String:&unk_1E93E75D4];
  v15[1] = v2;
  v14[2] = @"pid";
  v3 = [MEMORY[0x1E4F28ED0] numberWithInt:processInfo];
  v15[2] = v3;
  v14[3] = @"processname";
  v4 = [NSString stringWithUTF8String:&unk_1E93E75B4];
  v15[3] = v4;
  v14[4] = @"uid";
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:getuid()];
  v15[4] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];

  id v11 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:100 options:0 error:&v11];
  id v8 = v11;
  if (!v7)
  {
    char v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "error serializing lock info: %@", buf, 0xCu);
    }
  }
  return v7;
}

- (void)unlock
{
  if ((self->_fd & 0x80000000) == 0)
  {
    id v3 = [(NSURL *)self->_url path];
    unlink((const char *)[v3 fileSystemRepresentation]);

    close(self->_fd);
    self->_fd = -1;
  }
}

- (PLExclusiveFileLock)lockWithError:(id *)a3
{
  id v3 = a3;
  v24[2] = *MEMORY[0x1E4F143B8];
  if (self->_fd == -1)
  {
    if (a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  v21 = [(NSURL *)self->_url path];
  [v20 handleFailureInMethod:a2, self, @"PLExclusiveFileLock.m", 83, @"already locked: %@", v21 object file lineNumber description];

  if (!v3)
  {
LABEL_3:
    uint64_t v22 = 0;
    id v3 = (id *)&v22;
  }
LABEL_4:
  if (lockWithError__onceToken != -1) {
    dispatch_once(&lockWithError__onceToken, &__block_literal_global_6685);
  }
  id v5 = [(NSURL *)self->_url path];
  self->_int fd = open((const char *)[v5 fileSystemRepresentation], 1573, 420);

  if (self->_fd == -1)
  {
    int v10 = *__error();
    if (v10 == 35 || v10 == 16)
    {
      id v11 = [(PLExclusiveFileLock *)self lockFailure];
      result = 0;
      id *v3 = v11;
    }
    else if (v10 == 4)
    {
      return [(PLExclusiveFileLock *)self lockWithError:v3];
    }
    else
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v13 = *MEMORY[0x1E4F28798];
      uint64_t v14 = *__error();
      v23[0] = *MEMORY[0x1E4F28228];
      v15 = NSString;
      v16 = __error();
      uint64_t v17 = [v15 stringWithUTF8String:strerror(*v16)];
      v23[1] = *MEMORY[0x1E4F289D0];
      v24[0] = v17;
      v24[1] = self->_url;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      id *v3 = [v12 errorWithDomain:v13 code:v14 userInfo:v18];

      return 0;
    }
  }
  else
  {
    v6 = [(PLExclusiveFileLock *)self lockData];
    int fd = self->_fd;
    id v8 = v6;
    write(fd, (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    fsync(self->_fd);

    return (PLExclusiveFileLock *)1;
  }
  return result;
}

void __37__PLExclusiveFileLock_lockWithError___block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  pid_t v0 = getpid();
  proc_name(v0, &unk_1E93E75B4, 0x20u);
  gethostname(byte_1E93E75D4, 0xFFuLL);
  processInfo = v0;
  memset(v4, 0, sizeof(v4));
  v3.tv_sec = 0;
  v3.tv_nsec = 0;
  gethostuuid(v4, &v3);
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v4];
  uint64_t v2 = [v1 UUIDString];

  qword_1E93E76D8 = v2;
}

- (BOOL)isLocked
{
  return self->_fd >= 0;
}

- (void)dealloc
{
  if (self->_fd != -1)
  {
    uuid_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [(NSURL *)self->_url path];
    [v4 handleFailureInMethod:a2, self, @"PLExclusiveFileLock.m", 73, @"deallocated while locked: %@", v5 object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)PLExclusiveFileLock;
  [(PLExclusiveFileLock *)&v6 dealloc];
}

- (PLExclusiveFileLock)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLExclusiveFileLock;
  objc_super v6 = [(PLExclusiveFileLock *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_int fd = -1;
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (PLExclusiveFileLock)init
{
  return 0;
}

@end