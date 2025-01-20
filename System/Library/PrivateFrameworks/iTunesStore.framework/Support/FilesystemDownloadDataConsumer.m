@interface FilesystemDownloadDataConsumer
- (BOOL)_checkHashForByteCount:(int64_t)a3;
- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4;
- (BOOL)_openFile;
- (BOOL)consumeData:(id)a3 error:(id *)a4;
- (BOOL)finish:(id *)a3;
- (BOOL)hasConsumedData;
- (FilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5;
- (unint64_t)diskUsage;
- (unint64_t)resumptionOffset;
- (void)_truncateToSize:(int64_t)a3;
- (void)dealloc;
- (void)reset;
- (void)suspend;
- (void)truncate;
@end

@implementation FilesystemDownloadDataConsumer

- (FilesystemDownloadDataConsumer)initWithPath:(id)a3 MD5Hashes:(id)a4 numberOfBytesToHash:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FilesystemDownloadDataConsumer;
  v10 = [(FilesystemDownloadDataConsumer *)&v16 init];
  if (v10)
  {
    id v11 = [v9 copy];
    v12 = *(void **)(v10 + 25);
    *(void *)(v10 + 25) = v11;

    *(void *)(v10 + 129) = a5;
    id v13 = [v8 copy];
    v14 = *(void **)(v10 + 137);
    *(void *)(v10 + 137) = v13;

    [v10 _openFile];
    if (*(_DWORD *)(v10 + 17) == -1)
    {

      v10 = 0;
    }
  }

  return (FilesystemDownloadDataConsumer *)v10;
}

- (void)dealloc
{
  int v3 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v3 != -1) {
    close(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)FilesystemDownloadDataConsumer;
  [(FilesystemDownloadDataConsumer *)&v4 dealloc];
}

- (BOOL)consumeData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1)
  {
    int v10 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
    id v11 = v6;
    ssize_t v12 = write(v10, [v11 bytes], (size_t)objc_msgSend(v11, "length"));
    if (v12 < 0)
    {
      id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      BOOL v8 = 0;
    }
    else
    {
      id v9 = 0;
      *(void *)(&self->super._overrideProgress + 1) += v12;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v12;
      BOOL v8 = 1;
    }
  }
  else
  {
    id v16 = 0;
    BOOL v8 = [(FilesystemDownloadDataConsumer *)self _hashAndWriteData:v6 error:&v16];
    id v9 = v16;
  }
  if (BYTE5(self->_bytesWritten)) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = *(void *)(&self->super._overrideProgress + 1) > 0;
  }
  BYTE5(self->_bytesWritten) = v13;
  if (a4) {
    char v14 = v8;
  }
  else {
    char v14 = 1;
  }
  if ((v14 & 1) == 0) {
    *a4 = v9;
  }

  return v8;
}

- (unint64_t)diskUsage
{
  return *(void *)(&self->super._overrideProgress + 1);
}

- (BOOL)finish:(id *)a3
{
  if (*(_DWORD *)((char *)&self->_bytesWritten + 1) == -1)
  {
    id v5 = 0;
    BOOL v6 = 1;
  }
  else
  {
    if (*(uint64_t *)((char *)&self->_md5Context.num + 1) < 1
      || *(int64_t *)((char *)&self->_resumptionOffset + 1) >= *(void *)(&self->super._overrideProgress + 1)
      || -[FilesystemDownloadDataConsumer _checkHashForByteCount:](self, "_checkHashForByteCount:"))
    {
      id v5 = 0;
      BOOL v6 = 1;
    }
    else
    {
      ISError();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [(FilesystemDownloadDataConsumer *)self _truncateToSize:*(unint64_t *)((char *)&self->_resumptionOffset + 1)];
      BOOL v6 = 0;
    }
    close(*(_DWORD *)((char *)&self->_bytesWritten + 1));
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
    if (a3 && !v6)
    {
      id v5 = v5;
      BOOL v6 = 0;
      *a3 = v5;
    }
  }

  return v6;
}

- (void)reset
{
  BYTE5(self->_bytesWritten) = *(NSString **)((char *)&self->_path + 1) != 0;
}

- (void)suspend
{
  int v3 = *(_DWORD *)((char *)&self->_bytesWritten + 1);
  if (v3 != -1)
  {
    close(v3);
    *(_DWORD *)((char *)&self->_bytesWritten + 1) = -1;
  }
}

- (void)truncate
{
}

- (BOOL)_checkHashForByteCount:(int64_t)a3
{
  CC_MD5_Final(md, (CC_MD5_CTX *)((char *)&self->_hashes + 1));
  id v5 = ISStringFromDigest();
  float v6 = (double)a3 / (double)*(uint64_t *)((char *)&self->_md5Context.num + 1);
  unint64_t v7 = (uint64_t)(float)(ceilf(v6) + -1.0);
  if ((unint64_t)[*(id *)((char *)&self->_fd + 1) count] <= v7)
  {
    BOOL v8 = +[SSLogConfig sharedDaemonConfig];
    if (!v8)
    {
      BOOL v8 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v9 = v18 | 2;
    }
    else {
      int v9 = v18;
    }
    int v10 = [v8 OSLogObject];
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      v19 = objc_opt_class();
      uint64_t v20 = *(void *)((char *)&self->_md5Context.num + 1);
      *(_DWORD *)v25 = 138413058;
      *(void *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v7;
      *(_WORD *)&v25[22] = 2048;
      int64_t v26 = a3;
      *(_WORD *)v27 = 2048;
      *(void *)&v27[2] = v20;
      id v21 = v19;
      LODWORD(v24) = 42;
      v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
        LOBYTE(v9) = 0;
        goto LABEL_25;
      }
      int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v25, v24, *(void *)v25, *(_OWORD *)&v25[8], v26, *(void *)v27, *(void *)&v27[8]);
      free(v22);
      SSFileLog();
      LOBYTE(v9) = 0;
    }
    goto LABEL_24;
  }
  BOOL v8 = [*(id *)((char *)&self->_fd + 1) objectAtIndex:v7];
  LOBYTE(v9) = [v5 isEqualToString:v8];
  if ((v9 & 1) == 0)
  {
    int v10 = +[SSLogConfig sharedDaemonConfig];
    if (!v10)
    {
      int v10 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [v10 shouldLog];
    if ([v10 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    BOOL v13 = [v10 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      v12 &= 2u;
    }
    if (v12)
    {
      char v14 = objc_opt_class();
      unint64_t v15 = *(void *)((char *)&self->_md5Context.num + 1) * v7;
      *(_DWORD *)v25 = 138413314;
      *(void *)&v25[4] = v14;
      *(_WORD *)&v25[12] = 2048;
      *(void *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2048;
      int64_t v26 = a3;
      *(_WORD *)v27 = 2112;
      *(void *)&v27[2] = v5;
      *(_WORD *)&v27[10] = 2112;
      *(void *)&v27[12] = v8;
      id v16 = v14;
      LODWORD(v24) = 52;
      v17 = (void *)_os_log_send_and_compose_impl();

      if (!v17)
      {
LABEL_24:

        goto LABEL_25;
      }
      BOOL v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, v25, v24, *(_OWORD *)v25, *(void *)&v25[16], v26, *(_OWORD *)v27, *(void *)&v27[16]);
      free(v17);
      SSFileLog();
    }

    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (BOOL)_hashAndWriteData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = *(void *)(&self->super._overrideProgress + 1);
  uint64_t v8 = *(void *)((char *)&self->_md5Context.num + 1);
  uint64_t v9 = (uint64_t)[v6 length];
  if (v9 < 1)
  {
LABEL_13:
    id v16 = 0;
    BOOL v17 = 1;
    goto LABEL_19;
  }
  uint64_t v10 = v9;
  v19 = a4;
  uint64_t v11 = 0;
  uint64_t v12 = v7 % v8;
  while (1)
  {
    uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    uint64_t v14 = v13 - v12 >= v10 - v11 ? v10 - v11 : v13 - v12;
    if (v14 >= 1)
    {
      CC_MD5_Update((CC_MD5_CTX *)((char *)&self->_hashes + 1), (char *)[v6 bytes] + v11, v14);
      uint64_t v13 = *(void *)((char *)&self->_md5Context.num + 1);
    }
    if (v14 + v12 == v13) {
      break;
    }
LABEL_11:
    ssize_t v15 = write(*(_DWORD *)((char *)&self->_bytesWritten + 1), (char *)[v6 bytes] + v11, v14);
    if (v15 < v14)
    {
      ISError();
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    uint64_t v12 = 0;
    v11 += v14;
    *(void *)(&self->super._overrideProgress + 1) += v15;
    if (v11 >= v10) {
      goto LABEL_13;
    }
  }
  if ([(FilesystemDownloadDataConsumer *)self _checkHashForByteCount:*(void *)(&self->super._overrideProgress + 1) + v14])
  {
    CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
    *(unint64_t *)((char *)&self->_resumptionOffset + 1) += v13;
    goto LABEL_11;
  }
  ISError();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [(FilesystemDownloadDataConsumer *)self _truncateToSize:*(unint64_t *)((char *)&self->_resumptionOffset + 1)];
LABEL_16:
  if (v19)
  {
    id v16 = v16;
    BOOL v17 = 0;
    id *v19 = v16;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)_openFile
{
  int v3 = (const char *)[*(id *)((char *)&self->_numberOfBytesToHash + 1) fileSystemRepresentation];
  int v4 = open(v3, 522, 420);
  *(_DWORD *)((char *)&self->_bytesWritten + 1) = v4;
  if (v4 == -1) {
    return 0;
  }
  fcntl(v4, 48, 1);
  fcntl(*(_DWORD *)((char *)&self->_bytesWritten + 1), 76, 1);
  CC_MD5_Init((CC_MD5_CTX *)((char *)&self->_hashes + 1));
  memset(&v18, 0, sizeof(v18));
  if (stat(v3, &v18) != -1)
  {
    st_size = (NSString *)v18.st_size;
    *(void *)(&self->super._overrideProgress + 1) = v18.st_size;
    *(NSString **)((char *)&self->_path + 1) = st_size;
  }
  uint64_t v6 = *(void *)((char *)&self->_md5Context.num + 1);
  if (v6 >= 1)
  {
    unint64_t v7 = *(unint64_t *)((char *)&self->_path + 1);
    if (v7)
    {
      off_t v8 = v7 / v6 * v6;
      *(unint64_t *)((char *)&self->_resumptionOffset + 1) = v8;
      if ((NSString *)v8 != *(NSString **)((char *)&self->_path + 1))
      {
        if (lseek(*(_DWORD *)((char *)&self->_bytesWritten + 1), v8, 0) == -1) {
          goto LABEL_21;
        }
        uint64_t v9 = *(unint64_t *)((char *)&self->_resumptionOffset + 1);
        uint64_t v10 = *(uint64_t *)((char *)&self->_path + 1) - v9;
        uint64_t v11 = v10 >= 0x4000 ? (NSString *)0x4000 : (NSString *)(*(char **)((char *)&self->_path + 1) - v9);
        uint64_t v12 = malloc_type_malloc((size_t)v11, 0x100004077774924uLL);
        if (!v12) {
          goto LABEL_21;
        }
        uint64_t v13 = v12;
        if (v10 < 1)
        {
          uint64_t i = 0;
        }
        else
        {
          for (uint64_t i = 0; i < v10; i += v16)
          {
            ssize_t v15 = read(*(_DWORD *)((char *)&self->_bytesWritten + 1), v13, (size_t)v11);
            if (!v15) {
              break;
            }
            ssize_t v16 = v15;
            if (!CC_MD5_Update((CC_MD5_CTX *)((char *)&self->_hashes + 1), v13, v15)) {
              break;
            }
          }
        }
        free(v13);
        if (i != v10) {
LABEL_21:
        }
          [(FilesystemDownloadDataConsumer *)self _truncateToSize:0];
      }
    }
  }
  return *(_DWORD *)((char *)&self->_bytesWritten + 1) != -1;
}

- (void)_truncateToSize:(int64_t)a3
{
  *(void *)(&self->super._overrideProgress + 1) = a3;
  BYTE5(self->_bytesWritten) = a3 > 0;
  *(NSString **)((char *)&self->_path + 1) = (NSString *)a3;
  *(unint64_t *)((char *)&self->_resumptionOffset + 1) = a3;
}

- (BOOL)hasConsumedData
{
  return BYTE5(self->_bytesWritten);
}

- (unint64_t)resumptionOffset
{
  return *(unint64_t *)((char *)&self->_path + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_numberOfBytesToHash + 1), 0);

  objc_storeStrong((id *)((char *)&self->_fd + 1), 0);
}

@end