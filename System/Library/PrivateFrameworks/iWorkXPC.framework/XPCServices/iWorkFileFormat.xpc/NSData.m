@interface NSData
+ (id)tsp_dataFromDispatchData:(id)a3;
+ (id)tsp_dataWithContentsOfURL:(id)a3 decryptionKey:(id)a4;
+ (id)tsp_dataWithTranscoder:(id)a3;
+ (id)tsu_dataWithInputStream:(id)a3 error:(id *)a4;
+ (id)tsu_decodeFromHexidecimalString:(id)a3;
- (BOOL)tsp_writeToURL:(id)a3 encryptionKey:(id)a4;
- (id)tsp_dataWithDecryptionKey:(id)a3;
- (id)tsp_dataWithEncryptionKey:(id)a3;
- (id)tsp_dispatchData;
- (id)tsp_dispatchDataWithApplier:(id)a3;
- (id)tsu_compressWithAlgorithm:(int)a3 operation:(int)a4;
- (id)tsu_encodeToHexidecimalString;
- (id)tsu_md5Hash;
- (void)tsp_splitDataWithMaxSize:(unint64_t)a3 subdataHandlerBlock:(id)a4;
- (void)tsu_getMD5Hash:(char *)a3;
@end

@implementation NSData

- (BOOL)tsp_writeToURL:(id)a3 encryptionKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[TSUFileIOChannel alloc] initForStreamWritingURL:v6 error:0];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  BOOL v27 = v8 != 0;
  if (v8)
  {
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    v10 = [TSPComponentWriteChannelAdapter alloc];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_10005358C;
    v21 = &unk_1001C9338;
    v23 = &v24;
    v11 = v9;
    v22 = v11;
    v12 = [(TSPComponentWriteChannelAdapter *)v10 initWithChannel:v8 handler:&v18];
    *((unsigned char *)v25 + 24) = v12 != 0;
    if (v12)
    {
      v13 = [TSPCryptoComponentWriteChannel alloc];
      v14 = -[TSPCryptoComponentWriteChannel initWithWriteChannel:encryptionInfo:](v13, "initWithWriteChannel:encryptionInfo:", v12, v7, v18, v19, v20, v21);
      *((unsigned char *)v25 + 24) = v14 != 0;
      if (v14)
      {
        v15 = [(NSData *)self tsp_dispatchData];
        [(TSPCryptoComponentWriteChannel *)v14 writeData:v15];

        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        [(TSPCryptoComponentWriteChannel *)v14 close];
      }
    }
    [(TSPComponentWriteChannelAdapter *)v12 close];

    BOOL v16 = *((unsigned char *)v25 + 24) != 0;
  }
  else
  {
    BOOL v16 = 0;
  }
  _Block_object_dispose(&v24, 8);

  return v16;
}

+ (id)tsp_dataWithTranscoder:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100053744;
  v14 = sub_100053754;
  id v15 = 0;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableData);
    v5 = (void *)v11[5];
    v11[5] = (uint64_t)v4;

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10005375C;
    v9[3] = &unk_1001C9360;
    v9[4] = &v10;
    [v3 readWithHandlerAndWait:v9];
    [v3 close];
    id v6 = (void *)v11[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  return v7;
}

+ (id)tsp_dataWithContentsOfURL:(id)a3 decryptionKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [[TSUFileIOChannel alloc] initForReadingURL:v5 error:0];
  if (v7)
  {
    id v8 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v7 decryptionInfo:v6 encryptionInfo:0];
    dispatch_semaphore_t v9 = +[NSData tsp_dataWithTranscoder:v8];
  }
  else
  {
    dispatch_semaphore_t v9 = 0;
  }

  return v9;
}

- (id)tsp_dataWithDecryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = [[TSPMemoryReadChannel alloc] initWithNSData:self];
  if (v5)
  {
    id v6 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v5 decryptionInfo:v4 encryptionInfo:0];
    id v7 = +[NSData tsp_dataWithTranscoder:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tsp_dataWithEncryptionKey:(id)a3
{
  id v4 = a3;
  id v5 = [[TSPMemoryReadChannel alloc] initWithNSData:self];
  if (v5)
  {
    id v6 = [[TSPCryptoTranscodeReadChannel alloc] initWithReadChannel:v5 decryptionInfo:0 encryptionInfo:v4];
    id v7 = +[NSData tsp_dataWithTranscoder:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)tsp_dispatchData
{
  return [(NSData *)self tsp_dispatchDataWithApplier:0];
}

- (id)tsp_dispatchDataWithApplier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_100053744;
  v18 = sub_100053754;
  id v5 = &_dispatch_data_empty;
  id v19 = &_dispatch_data_empty;
  dispatch_get_global_queue(0, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100053C24;
  v10[3] = &unk_1001C93B0;
  v10[4] = self;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v4;
  v13 = &v14;
  id v6 = v4;
  id v7 = v11;
  [(NSData *)self enumerateByteRangesUsingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)tsp_dataFromDispatchData:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)tsp_splitDataWithMaxSize:(unint64_t)a3 subdataHandlerBlock:(id)a4
{
  id v6 = (void (**)(id, void *, uint64_t, char *))a4;
  if (a3)
  {
    char v18 = 0;
    NSUInteger v7 = [(NSData *)self length];
    if (v7 > a3)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      *(void *)&long long v8 = 134217984;
      long long v17 = v8;
      while (1)
      {
        if (!v7) {
          goto LABEL_23;
        }
        unint64_t v12 = v7 >= a3 ? a3 : v7;
        v13 = -[NSData subdataWithRange:](self, "subdataWithRange:", v9, v12, v17);
        if (!v13) {
          break;
        }
        v6[2](v6, v13, v10++, &v18);
        if (v18) {
          goto LABEL_15;
        }
        v9 += v12;
        v7 -= v12;
        char v14 = 1;
LABEL_16:

        if ((v14 & 1) == 0) {
          goto LABEL_23;
        }
      }
      if (TSUDefaultCat_init_token != -1) {
        dispatch_once(&TSUDefaultCat_init_token, &stru_1001C93F0);
      }
      id v15 = TSUDefaultCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v17;
        NSUInteger v20 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not create split data with remaining size %zu", buf, 0xCu);
      }
LABEL_15:
      char v14 = 0;
      goto LABEL_16;
    }
    v6[2](v6, self, 0, &v18);
  }
  else
  {
    if (TSUDefaultCat_init_token != -1) {
      dispatch_once(&TSUDefaultCat_init_token, &stru_1001C93D0);
    }
    uint64_t v16 = TSUDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100163EDC(v16);
    }
  }
LABEL_23:
}

- (id)tsu_encodeToHexidecimalString
{
  id v3 = [(NSData *)self length];
  if (v3)
  {
    NSUInteger v4 = [(NSData *)self length];
    id v5 = [(NSData *)self bytes];
    uint64_t v6 = 2 * v4;
    id v3 = (char *)malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    if (v3)
    {
      if (v4)
      {
        NSUInteger v7 = v3 + 1;
        do
        {
          unsigned int v9 = *v5++;
          char v8 = v9;
          int v10 = (v9 >> 4) + 55;
          int v11 = (v9 >> 4) | 0x30;
          if (v9 > 0x9F) {
            LOBYTE(v11) = v10;
          }
          *(v7 - 1) = v11;
          if ((v8 & 0xFu) <= 9) {
            char v12 = v8 & 0xF | 0x30;
          }
          else {
            char v12 = (v8 & 0xF) + 55;
          }
          *NSUInteger v7 = v12;
          v7 += 2;
          --v4;
        }
        while (v4);
      }
      id v3 = (char *)[objc_alloc((Class)NSString) initWithBytesNoCopy:v3 length:v6 encoding:1 freeWhenDone:1];
    }
  }
  return v3;
}

- (void)tsu_getMD5Hash:(char *)a3
{
  memset(&v9, 0, sizeof(v9));
  CC_MD5_Init(&v9);
  NSUInteger v5 = [(NSData *)self length];
  uint64_t v6 = [(NSData *)self bytes];
  if (v5)
  {
    NSUInteger v7 = v6;
    do
    {
      if (v5 >= 0xFFFFFFFF) {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v8 = v5;
      }
      CC_MD5_Update(&v9, v7, v8);
      v7 += v8;
      v5 -= v8;
    }
    while (v5);
  }
  CC_MD5_Final((unsigned __int8 *)a3, &v9);
}

- (id)tsu_md5Hash
{
  id v3 = [objc_alloc((Class)NSMutableData) initWithLength:16];
  -[NSData tsu_getMD5Hash:](self, "tsu_getMD5Hash:", [v3 mutableBytes]);
  return v3;
}

+ (id)tsu_decodeFromHexidecimalString:(id)a3
{
  id v3 = a3;
  if (![v3 length] || (objc_msgSend(v3, "length") & 1) != 0)
  {
    id v16 = 0;
  }
  else
  {
    unint64_t v4 = (unint64_t)[v3 length];
    NSUInteger v5 = malloc_type_calloc(2 * v4, 1uLL, 0x100004077774924uLL);
    uint64_t v6 = v5;
    unint64_t v7 = v4 >> 1;
    if (v4 >= 2)
    {
      if (v7 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v4 >> 1;
      }
      uint64_t v9 = 1;
      int v10 = v5;
      do
      {
        unsigned int v11 = [v3 characterAtIndex:v9 - 1];
        if (v11 <= 0x39) {
          char v12 = 0;
        }
        else {
          char v12 = 57;
        }
        char v13 = v12 + v11;
        unsigned int v14 = [v3 characterAtIndex:v9];
        if (v14 <= 0x39) {
          char v15 = -48;
        }
        else {
          char v15 = -55;
        }
        *v10++ = v15 + v14 + 16 * v13;
        v9 += 2;
        --v8;
      }
      while (v8);
    }
    id v16 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v6 length:v7 freeWhenDone:1];
  }

  return v16;
}

+ (id)tsu_dataWithInputStream:(id)a3 error:(id *)a4
{
  id v4 = a3;
  [v4 open];
  id v5 = objc_alloc_init((Class)NSMutableData);
  uint64_t v6 = (uint64_t)[v4 read:v9 maxLength:1024];
  if (v6 >= 1)
  {
    for (id i = (id)v6; (uint64_t)i > 0; id i = [v4 read:v9 maxLength:1024])
      [v5 appendBytes:v9 length:i];
  }

  return v5;
}

- (id)tsu_compressWithAlgorithm:(int)a3 operation:(int)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = sub_1000B780C;
  char v12 = &unk_1001CED18;
  unsigned int v14 = &v15;
  id v5 = [[TSUStreamDataCompression alloc] initWithAlgorithm:*(void *)&a3 operation:*(void *)&a4];
  char v13 = v5;
  [(NSData *)self enumerateByteRangesUsingBlock:&v9];
  if (*((unsigned char *)v16 + 24))
  {
    unsigned int v6 = [(TSUStreamCompression *)v5 didFinishProcessing];
    *((unsigned char *)v16 + 24) = v6;
    if (v6)
    {
      unint64_t v7 = [(TSUStreamDataCompression *)v5 outputData];
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  else
  {
    unint64_t v7 = 0;
    *((unsigned char *)v16 + 24) = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

@end