@interface ISHashedDownloadProvider
- (BOOL)_checkHashForByteCount:(int64_t)a3;
- (BOOL)_openFile;
- (BOOL)_truncateToSize:(int64_t)a3;
- (BOOL)_writeDataWithHashing:(id)a3 returningError:(id *)a4;
- (BOOL)_writeDataWithoutHashing:(id)a3 returningError:(id *)a4;
- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4;
- (BOOL)isStream;
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (BOOL)shouldResumeFromLocalBytes;
- (ISHashError)lastHashError;
- (ISHashedDownloadProvider)init;
- (NSArray)hashes;
- (NSString)localFilePath;
- (id)closeStream;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_verifiedBytesByInitializingHashForFileSize:(int64_t)a3;
- (int64_t)numberOfBytesToHash;
- (int64_t)streamedBytes;
- (int64_t)validatedBytes;
- (void)_closeFile;
- (void)dealloc;
- (void)resetStream;
- (void)setHashes:(id)a3;
- (void)setLastHashError:(id)a3;
- (void)setLocalFilePath:(id)a3;
- (void)setNumberOfBytesToHash:(int64_t)a3;
- (void)setShouldResumeFromLocalBytes:(BOOL)a3;
- (void)setStreamedBytes:(int64_t)a3;
- (void)setValidatedBytes:(int64_t)a3;
- (void)setup;
@end

@implementation ISHashedDownloadProvider

- (ISHashedDownloadProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISHashedDownloadProvider;
  v2 = [(ISDataProvider *)&v5 init];
  v3 = v2;
  if (v2)
  {
    CC_MD5_Init(&v2->_md5Context);
    v3->_fileDescriptor = -1;
    v3->_shouldResumeFromLocalBytes = 1;
  }
  return v3;
}

- (void)dealloc
{
  [(ISHashedDownloadProvider *)self _closeFile];

  v3.receiver = self;
  v3.super_class = (Class)ISHashedDownloadProvider;
  [(ISHashedDownloadProvider *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ISHashedDownloadProvider;
  objc_super v5 = -[ISDataProvider copyWithZone:](&v7, sel_copyWithZone_);
  v5[15] = [(NSArray *)[(ISHashedDownloadProvider *)self hashes] copyWithZone:a3];
  v5[17] = [(NSString *)[(ISHashedDownloadProvider *)self localFilePath] copyWithZone:a3];
  v5[30] = [(ISHashedDownloadProvider *)self numberOfBytesToHash];
  return v5;
}

- (BOOL)canStreamContentLength:(int64_t)a3 error:(id *)a4
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__5;
  v18 = __Block_byref_object_dispose__5;
  uint64_t v19 = 0;
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v7 = [NSURL fileURLWithPath:self->_localFilePath];
    v8 = dispatch_semaphore_create(0);
    v9 = +[ISDevice sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __57__ISHashedDownloadProvider_canStreamContentLength_error___block_invoke;
    v13[3] = &unk_264261118;
    v13[5] = v8;
    v13[6] = &v14;
    v13[7] = &v20;
    v13[8] = a3;
    v13[4] = self;
    [(ISDevice *)v9 requestFreeSpace:a3 atPath:v7 withOptions:0 completionBlock:v13];
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v8);
    id v10 = (id)v15[5];
  }
  if (a4) {
    *a4 = (id)v15[5];
  }
  char v11 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  return v11;
}

intptr_t __57__ISHashedDownloadProvider_canStreamContentLength_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    v8 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v8) {
      v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v9 = [v8 shouldLog];
    if ([v8 shouldLogToDisk]) {
      int v10 = v9 | 2;
    }
    else {
      int v10 = v9;
    }
    if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v10 &= 2u;
    }
    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 64);
      int v17 = 138413058;
      uint64_t v18 = v11;
      __int16 v19 = 2048;
      uint64_t v20 = v12;
      __int16 v21 = 2048;
      uint64_t v22 = a3;
      __int16 v23 = 2112;
      uint64_t v24 = a4;
      LODWORD(v16) = 42;
      uint64_t v13 = _os_log_send_and_compose_impl();
      if (v13)
      {
        uint64_t v14 = (void *)v13;
        objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v17, v16);
        free(v14);
        SSFileLog();
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = SSGetNotEnoughDiskSpaceErrorWithCount();
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)SSErrorBySettingUserInfoValue();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)closeStream
{
  [(ISHashedDownloadProvider *)self _closeFile];
  v4.receiver = self;
  v4.super_class = (Class)ISHashedDownloadProvider;
  return [(ISDataProvider *)&v4 closeStream];
}

- (BOOL)isStream
{
  return 1;
}

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v17 = 0;
  if ((self->_fileDescriptor & 0x80000000) == 0)
  {
    if ([(ISHashedDownloadProvider *)self numberOfBytesToHash])
    {
      BOOL result = [(ISHashedDownloadProvider *)self _writeDataWithHashing:a3 returningError:&v17];
      if (!a4) {
        return result;
      }
    }
    else
    {
      BOOL result = [(ISHashedDownloadProvider *)self _writeDataWithoutHashing:a3 returningError:&v17];
      if (!a4) {
        return result;
      }
    }
    goto LABEL_16;
  }
  v8 = objc_msgSend(MEMORY[0x263F7B1F8], "sharediTunesStoreConfig", a3);
  if (!v8) {
    v8 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v9 = [v8 shouldLog];
  if ([v8 shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  if (!os_log_type_enabled((os_log_t)[v8 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (v10)
  {
    uint64_t v11 = objc_opt_class();
    int fileDescriptor = self->_fileDescriptor;
    int v18 = 138412802;
    uint64_t v19 = v11;
    __int16 v20 = 1024;
    int v21 = fileDescriptor;
    __int16 v22 = 2112;
    __int16 v23 = [(ISHashedDownloadProvider *)self localFilePath];
    LODWORD(v16) = 28;
    uint64_t v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v18, v16);
      free(v14);
      SSFileLog();
    }
  }
  uint64_t v15 = ISError(7, 0, 0);
  BOOL result = 0;
  int v17 = (void *)v15;
  if (a4) {
LABEL_16:
  }
    *a4 = v17;
  return result;
}

- (void)resetStream
{
  if ([(ISHashedDownloadProvider *)self _openFile]) {
    [(ISHashedDownloadProvider *)self _truncateToSize:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)ISHashedDownloadProvider;
  [(ISDataProvider *)&v3 resetStream];
}

- (void)setup
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [(ISHashedDownloadProvider *)self _openFile];
  uint64_t v3 = [(ISHashedDownloadProvider *)self streamedBytes];
  if (v3 >= 1)
  {
    uint64_t v4 = v3;
    objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v5) {
      objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v22 = 138412546;
      uint64_t v23 = objc_opt_class();
      __int16 v24 = 2048;
      uint64_t v25 = v4;
      LODWORD(v20) = 22;
      int v18 = &v22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        int v9 = (void *)v8;
        uint64_t v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v22, v20);
        free(v9);
        int v18 = (int *)v10;
        SSFileLog();
      }
    }
    if ([(ISHashedDownloadProvider *)self shouldResumeFromLocalBytes])
    {
      if ([(ISHashedDownloadProvider *)self numberOfBytesToHash] >= 1
        && ![(ISHashedDownloadProvider *)self validatedBytes])
      {
        [(ISHashedDownloadProvider *)self setValidatedBytes:[(ISHashedDownloadProvider *)self _verifiedBytesByInitializingHashForFileSize:v4]];
      }
    }
    else
    {
      uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
      if (!v11) {
        uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      }
      int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
        v13 &= 2u;
      }
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        int v22 = 138412290;
        uint64_t v23 = v14;
        LODWORD(v20) = 12;
        uint64_t v19 = &v22;
        uint64_t v15 = _os_log_send_and_compose_impl();
        if (v15)
        {
          uint64_t v16 = (void *)v15;
          uint64_t v17 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v22, v20);
          free(v16);
          uint64_t v19 = (int *)v17;
          SSFileLog();
        }
      }
      -[ISHashedDownloadProvider _truncateToSize:](self, "_truncateToSize:", 0, v19);
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)ISHashedDownloadProvider;
  [(ISDataProvider *)&v21 setup];
}

- (BOOL)_checkHashForByteCount:(int64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  CC_MD5_Final(md, &self->_md5Context);
  objc_super v5 = ISStringFromDigest(md, 0x10u);
  uint64_t v6 = [(ISHashedDownloadProvider *)self numberOfBytesToHash];
  float v7 = (double)a3 / (double)v6;
  uint64_t v8 = (uint64_t)(float)(ceilf(v7) + -1.0);
  id v9 = [(NSArray *)[(ISHashedDownloadProvider *)self hashes] objectAtIndex:v8];
  char v10 = [v5 isEqualToString:v9];
  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
    if (!v11) {
      uint64_t v11 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    }
    int v12 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v13 = v12 | 2;
    }
    else {
      int v13 = v12;
    }
    if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_ERROR)) {
      v13 &= 2u;
    }
    if (v13)
    {
      int v20 = 138413314;
      uint64_t v14 = v6 * v8;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2048;
      int64_t v25 = a3;
      __int16 v26 = 2112;
      v27 = v5;
      __int16 v28 = 2112;
      id v29 = v9;
      LODWORD(v19) = 52;
      uint64_t v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        uint64_t v16 = (void *)v15;
        objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v20, v19);
        free(v16);
        SSFileLog();
      }
    }
    else
    {
      uint64_t v14 = v6 * v8;
    }
    uint64_t v17 = objc_alloc_init(ISHashError);
    [(ISHashError *)v17 setActualHashString:v5];
    [(ISHashError *)v17 setExpectedHashString:v9];
    [(ISHashError *)v17 setRangeEnd:a3];
    [(ISHashError *)v17 setRangeStart:v14];
    [(ISHashedDownloadProvider *)self setLastHashError:v17];
  }
  return v10;
}

- (void)_closeFile
{
  int fileDescriptor = self->_fileDescriptor;
  if (fileDescriptor != -1)
  {
    close(fileDescriptor);
    self->_int fileDescriptor = -1;
  }
}

- (BOOL)_openFile
{
  if (self->_fileDescriptor != -1) {
    return 1;
  }
  uint64_t v4 = [(NSString *)[(ISHashedDownloadProvider *)self localFilePath] fileSystemRepresentation];
  memset(&v8, 0, sizeof(v8));
  if (stat(v4, &v8) == -1) {
    off_t st_size = 0;
  }
  else {
    off_t st_size = v8.st_size;
  }
  if (st_size <= 0) {
    int v6 = open(v4, 1538, 420);
  }
  else {
    int v6 = open(v4, 522, 420);
  }
  self->_int fileDescriptor = v6;
  BOOL v2 = v6 != -1;
  if (v6 != -1)
  {
    fcntl(v6, 48, 1);
    fcntl(self->_fileDescriptor, 68, 1);
    fcntl(self->_fileDescriptor, 76, 1);
    [(ISHashedDownloadProvider *)self setStreamedBytes:st_size];
  }
  return v2;
}

- (BOOL)_truncateToSize:(int64_t)a3
{
  int fileDescriptor = self->_fileDescriptor;
  BOOL v6 = fileDescriptor < 0 || ftruncate(fileDescriptor, a3) == 0;
  [(ISHashedDownloadProvider *)self setStreamedBytes:a3];
  CC_MD5_Init(&self->_md5Context);
  return v6;
}

- (int64_t)_verifiedBytesByInitializingHashForFileSize:(int64_t)a3
{
  int64_t v5 = [(ISHashedDownloadProvider *)self numberOfBytesToHash];
  off_t v6 = 0;
  if (a3)
  {
    if (v5)
    {
      off_t v6 = a3 / v5 * v5;
      int64_t v7 = a3 % v5;
      if (a3 % v5)
      {
        if (lseek(self->_fileDescriptor, v6, 0) == -1) {
          goto LABEL_17;
        }
        size_t v8 = v7 >= 4096 ? 4096 : v7;
        id v9 = malloc_type_malloc(v8, 0x100004077774924uLL);
        if (!v9) {
          goto LABEL_17;
        }
        char v10 = v9;
        CC_MD5_Init(&self->_md5Context);
        if (v7 < 1)
        {
          int64_t i = 0;
        }
        else
        {
          for (int64_t i = 0; i < v7; i += v13)
          {
            ssize_t v12 = read(self->_fileDescriptor, v10, v8);
            if (!v12) {
              break;
            }
            ssize_t v13 = v12;
            if (!CC_MD5_Update(&self->_md5Context, v10, v12)) {
              break;
            }
          }
        }
        free(v10);
        if (i != v7)
        {
LABEL_17:
          [(ISHashedDownloadProvider *)self _truncateToSize:0];
          return 0;
        }
      }
    }
  }
  return v6;
}

- (BOOL)_writeDataWithHashing:(id)a3 returningError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  int64_t v7 = [(ISDataProvider *)self contentLength];
  uint64_t v8 = [(ISHashedDownloadProvider *)self streamedBytes];
  int64_t v32 = [(ISHashedDownloadProvider *)self validatedBytes];
  int64_t v9 = [(ISHashedDownloadProvider *)self numberOfBytesToHash];
  uint64_t v10 = [a3 length];
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    uint64_t v31 = a4;
    uint64_t v12 = 0;
    uint64_t v13 = v8 % v9;
    while (1)
    {
      if (v9 - v13 >= v11 - v12) {
        uint64_t v14 = v11 - v12;
      }
      else {
        uint64_t v14 = v9 - v13;
      }
      if (v14 >= 1) {
        CC_MD5_Update(&self->_md5Context, (const void *)([a3 bytes] + v12), v14);
      }
      uint64_t v15 = v14 + v13;
      if (v15 == v9 || v14 + v8 == v7)
      {
        if (!-[ISHashedDownloadProvider _checkHashForByteCount:](self, "_checkHashForByteCount:"))
        {
          uint64_t v19 = (void *)ISError(8, 0, 0);
          int64_t v27 = v32;
          [(ISHashedDownloadProvider *)self _truncateToSize:v32];
          a4 = v31;
          goto LABEL_33;
        }
        CC_MD5_Init(&self->_md5Context);
        v32 += v15;
      }
      ssize_t v17 = write(self->_fileDescriptor, (const void *)([a3 bytes] + v12), v14);
      ssize_t v18 = v17;
      if (v17 < v14)
      {
        int v20 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
        if (!v20) {
          int v20 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
        }
        int v21 = [v20 shouldLog];
        if ([v20 shouldLogToDisk]) {
          int v22 = v21 | 2;
        }
        else {
          int v22 = v21;
        }
        if (os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_ERROR)) {
          int v23 = v22;
        }
        else {
          int v23 = v22 & 2;
        }
        if (v23)
        {
          int v33 = 138412802;
          uint64_t v34 = objc_opt_class();
          __int16 v35 = 2048;
          ssize_t v36 = v18;
          __int16 v37 = 2048;
          uint64_t v38 = v14;
          LODWORD(v30) = 32;
          id v29 = &v33;
          uint64_t v24 = _os_log_send_and_compose_impl();
          if (v24)
          {
            int64_t v25 = (void *)v24;
            uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v33, v30);
            free(v25);
            id v29 = (int *)v26;
            SSFileLog();
          }
        }
        uint64_t v19 = (void *)ISError(7, 0, 0);
        goto LABEL_31;
      }
      uint64_t v13 = 0;
      v12 += v14;
      v8 += v17;
      if (v12 >= v11)
      {
        uint64_t v19 = 0;
LABEL_31:
        a4 = v31;
        goto LABEL_32;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_32:
  int64_t v27 = v32;
LABEL_33:
  -[ISHashedDownloadProvider setStreamedBytes:](self, "setStreamedBytes:", v8, v29);
  [(ISHashedDownloadProvider *)self setValidatedBytes:v27];
  if (a4) {
    *a4 = v19;
  }
  return v19 == 0;
}

- (BOOL)_writeDataWithoutHashing:(id)a3 returningError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  size_t v7 = [a3 length];
  ssize_t v8 = write(self->_fileDescriptor, (const void *)[a3 bytes], v7);
  if (v8 == v7)
  {
    [(ISHashedDownloadProvider *)self setStreamedBytes:[(ISHashedDownloadProvider *)self streamedBytes] + v7];
    [(ISHashedDownloadProvider *)self setValidatedBytes:[(ISHashedDownloadProvider *)self validatedBytes] + v7];
    int64_t v9 = 0;
    if (!a4) {
      return v8 == v7;
    }
    goto LABEL_15;
  }
  uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharediTunesStoreConfig];
  if (!v10) {
    uint64_t v10 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  }
  int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_ERROR)) {
    v12 &= 2u;
  }
  if (v12)
  {
    int v17 = 138412802;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2048;
    size_t v20 = v7;
    __int16 v21 = 2048;
    ssize_t v22 = v8;
    LODWORD(v16) = 32;
    uint64_t v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v17, v16);
      free(v14);
      SSFileLog();
    }
  }
  int64_t v9 = (void *)ISError(7, 0, 0);
  if (a4) {
LABEL_15:
  }
    *a4 = v9;
  return v8 == v7;
}

- (NSArray)hashes
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHashes:(id)a3
{
}

- (ISHashError)lastHashError
{
  return (ISHashError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastHashError:(id)a3
{
}

- (NSString)localFilePath
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setLocalFilePath:(id)a3
{
}

- (int64_t)numberOfBytesToHash
{
  return self->_numberOfBytesToHash;
}

- (void)setNumberOfBytesToHash:(int64_t)a3
{
  self->_numberOfBytesToHash = a3;
}

- (BOOL)shouldResumeFromLocalBytes
{
  return self->_shouldResumeFromLocalBytes;
}

- (void)setShouldResumeFromLocalBytes:(BOOL)a3
{
  self->_shouldResumeFromLocalBytes = a3;
}

- (int64_t)streamedBytes
{
  return self->_totalBytesWritten;
}

- (void)setStreamedBytes:(int64_t)a3
{
  self->_totalBytesWritten = a3;
}

- (int64_t)validatedBytes
{
  return self->_validatedBytes;
}

- (void)setValidatedBytes:(int64_t)a3
{
  self->_validatedBytes = a3;
}

@end