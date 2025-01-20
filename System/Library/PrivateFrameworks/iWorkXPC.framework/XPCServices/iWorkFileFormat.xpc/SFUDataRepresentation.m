@interface SFUDataRepresentation
- (BOOL)hasSameLocationAs:(id)a3;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReadable;
- (CGDataProvider)cgDataProvider;
- (_xmlDoc)xmlDocument;
- (_xmlTextReader)xmlReader;
- (_xmlTextReader)xmlReaderForGzippedData;
- (_xmlTextReader)xmlReaderForGzippedDataWithInputStream:(id *)a3;
- (_xmlTextReader)xmlReaderWithReadCallback:(void *)a3;
- (id)bufferedInputStream;
- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3;
- (id)inputStream;
- (int64_t)compare:(id)a3;
- (int64_t)dataLength;
- (unint64_t)hash;
- (unint64_t)readIntoData:(id)a3;
- (unsigned)uint32Hash;
@end

@implementation SFUDataRepresentation

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEEE0);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016AF88();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUDataRepresentation *)NSString dataLength], 47, 0, "Abstract method."");
  +[TSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  if (TSUAssertCat_init_token != -1) {
    dispatch_once(&TSUAssertCat_init_token, &stru_1001CEF00);
  }
  if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10016B010();
  }
  +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUDataRepresentation *)NSString inputStream], 60, 0, "Abstract method."");
  +[TSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (id)bufferedInputStream
{
  v2 = [[SFUBufferedInputStream alloc] initWithStream:[(SFUDataRepresentation *)self inputStream] dataLength:[(SFUDataRepresentation *)self dataLength]];
  return v2;
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  v3 = [[SFUBufferedInputStream alloc] initWithStream:[(SFUDataRepresentation *)self inputStream] bufferSize:a3];
  return v3;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  id v3 = [(SFUDataRepresentation *)self bufferedInputStream];
  chunk = 0;
  unint64_t v4 = (unint64_t)[v3 readToOwnBuffer:&chunk size:-1];
  int v5 = v4;
  if (v4 >> 31)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEF20);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016B098();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUDataRepresentation *)NSString xmlDocument], 92, 0, "overflow in xmlDocument"");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(0, 0, chunk, v5, 0);
  if (!PushParserCtxt) {
    +[NSException raise:@"SFUDataRepresentationError" format:@"xmlCreatePushParserCtxt() failed"];
  }
  while (1)
  {
    unint64_t v7 = (unint64_t)[v3 readToOwnBuffer:&chunk size:-1];
    int v8 = v7;
    if (!v7) {
      break;
    }
    if (v7 >> 31)
    {
      unsigned int v9 = +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CEF40);
      }
      v10 = TSUAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        unsigned int v18 = v9;
        __int16 v19 = 2082;
        v20 = "-[SFUDataRepresentation xmlDocument]";
        __int16 v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUDataRepresentation.m";
        __int16 v23 = 1024;
        int v24 = 105;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d overflow in xmlDocument", buf, 0x22u);
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUDataRepresentation *)NSString xmlDocument], 105, 0, "overflow in xmlDocument"");
      +[TSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v11 = xmlParseChunk(PushParserCtxt, chunk, v8, 0);
    if (v11) {
      +[NSException raise:@"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v11 format];
    }
  }
  uint64_t v12 = xmlParseChunk(PushParserCtxt, chunk, 0, 1);
  if (v12) {
    +[NSException raise:@"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v12 format];
  }
  myDoc = PushParserCtxt->myDoc;
  if (!PushParserCtxt->wellFormed) {
    +[NSException raise:@"SFUDataRepresentationError" format:@"XML document is not well formed."];
  }
  xmlFreeParserCtxt(PushParserCtxt);
  [v3 close];
  return myDoc;
}

- (_xmlTextReader)xmlReader
{
  return [(SFUDataRepresentation *)self xmlReaderWithReadCallback:sub_1000BAC64];
}

- (_xmlTextReader)xmlReaderWithReadCallback:(void *)a3
{
  id v4 = [(SFUDataRepresentation *)self inputStream];
  return xmlReaderForIO((xmlInputReadCallback)a3, (xmlInputCloseCallback)sub_1000BAE14, v4, 0, 0, 0);
}

- (_xmlTextReader)xmlReaderForGzippedData
{
  return [(SFUDataRepresentation *)self xmlReaderForGzippedDataWithInputStream:0];
}

- (_xmlTextReader)xmlReaderForGzippedDataWithInputStream:(id *)a3
{
  id v4 = [(SFUDataRepresentation *)self inputStream];
  if ([v4 readToBuffer:v10 size:10] != (id)10) {
    return 0;
  }
  char v5 = v11;
  if ((v11 & 4) != 0)
  {
    unsigned __int16 v9 = 0;
    if ([v4 readToBuffer:&v9 size:2] != (id)2) {
      return 0;
    }
    if (v9)
    {
      int v8 = 0;
      while ([v4 readToBuffer:v10 size:1] == (id)1)
      {
        if (++v8 >= v9) {
          goto LABEL_3;
        }
      }
      return 0;
    }
  }
LABEL_3:
  if ((v5 & 8) != 0)
  {
    v10[0] = 1;
    while ([v4 readToBuffer:v10 size:1] == (id)1)
    {
      if (!v10[0]) {
        goto LABEL_7;
      }
    }
    return 0;
  }
LABEL_7:
  if ((v5 & 0x10) != 0)
  {
    v10[0] = 1;
    while ([v4 readToBuffer:v10 size:1] == (id)1)
    {
      if (!v10[0]) {
        goto LABEL_11;
      }
    }
    return 0;
  }
LABEL_11:
  if ((v5 & 2) != 0 && [v4 readToBuffer:v10 size:2] != (id)2) {
    return 0;
  }
  v6 = [[SFUZipInflateInputStream alloc] initWithInput:v4];
  if (a3) {
    *a3 = v6;
  }
  return xmlReaderForIO((xmlInputReadCallback)sub_1000BAC64, (xmlInputCloseCallback)sub_1000BAE14, v6, 0, 0, 0);
}

- (CGDataProvider)cgDataProvider
{
  id v2 = [(SFUDataRepresentation *)self inputStream];
  if (([v2 canSeek] & 1) == 0)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEF60);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016B1A8();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUDataRepresentation *)NSString cgDataProvider], 229, 0, "Need a seekable input stream for -cgDataProvider"");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  return CGDataProviderCreateSequential(v2, (const CGDataProviderSequentialCallbacks *)&unk_1001CEF80);
}

- (unint64_t)readIntoData:(id)a3
{
  char v5 = [a3 length];
  id v6 = [(SFUDataRepresentation *)self bufferedInputStream];
  for (uint64_t i = 0; ; [a3 appendBytes:i length:v7])
  {
    id v7 = [v6 readToOwnBuffer:&i size:-1];
    if (!v7) {
      break;
    }
  }
  [v6 close];
  return (unsigned char *)[a3 length] - v5;
}

- (unint64_t)hash
{
  return [(SFUDataRepresentation *)self uint32Hash];
}

- (unsigned)uint32Hash
{
  if (!self->mHasHash && [(SFUDataRepresentation *)self isReadable])
  {
    objc_sync_enter(self);
    if (!self->mHasHash && [(SFUDataRepresentation *)self isReadable])
    {
      int64_t v4 = [(SFUDataRepresentation *)self dataLength];
      id v5 = [(SFUDataRepresentation *)self inputStream];
      id v6 = (char *)malloc_type_malloc(0x1008uLL, 0xDD5B720BuLL);
      if (!v6) {
        +[NSException raise:NSMallocException format:@"Failed to allocate hash buffer for SFEData"];
      }
      id v7 = (char *)[v5 readToBuffer:v6 size:4096];
      *(void *)&v7[(void)v6] = v4;
      self->mHash = SFUHash(v6, (uint64_t)(v7 + 8));
      free(v6);
      __dmb(0xBu);
      self->mHasHash = 1;
    }
    objc_sync_exit(self);
  }
  return self->mHash;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(SFUDataRepresentation *)self dataLength];
  if ((id)v5 != [a3 dataLength]) {
    return 0;
  }
  if ([(SFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 1;
  }
  if (!-[SFUDataRepresentation isReadable](self, "isReadable") || ![a3 isReadable]) {
    return 0;
  }
  id v8 = [(SFUDataRepresentation *)self bufferedInputStream];
  id v9 = [a3 bufferedInputStream];
  __int16 v19 = 0;
  v20 = 0;
  if (v5 < 1)
  {
LABEL_20:
    BOOL v6 = 1;
  }
  else
  {
    v10 = v9;
    char v11 = 0;
    uint64_t v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (v12 == v14)
      {
        v15 = (char *)[v8 readToOwnBuffer:&v20 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        v14 = &v15[(void)v20];
      }
      if (v11 == v13)
      {
        v16 = (char *)[v10 readToOwnBuffer:&v19 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        v13 = &v16[(void)v19];
      }
      size_t v17 = v14 - v12 >= v13 - v11 ? v13 - v11 : v14 - v12;
      if (!v17 || memcmp(v12, v11, v17)) {
        break;
      }
      v12 += v17;
      v11 += v17;
      __int16 v19 = v11;
      v20 = v12;
      v5 -= v17;
      if (v5 <= 0) {
        goto LABEL_20;
      }
    }
    BOOL v6 = 0;
  }
  return v6;
}

- (int64_t)compare:(id)a3
{
  if (self == a3) {
    return 0;
  }
  uint64_t v5 = [(SFUDataRepresentation *)self dataLength];
  id v6 = [a3 dataLength];
  if (v5 < (uint64_t)v6) {
    return -1;
  }
  if (v5 > (uint64_t)v6) {
    return 1;
  }
  if ([(SFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 0;
  }
  id v10 = [(SFUDataRepresentation *)self bufferedInputStream];
  id v11 = [a3 bufferedInputStream];
  __int16 v21 = 0;
  v22 = 0;
  if (v5 < 1)
  {
LABEL_26:
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v12 = v11;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    int64_t v7 = 1;
    while (1)
    {
      if (v14 == v16)
      {
        size_t v17 = (char *)[v10 readToOwnBuffer:&v22 size:-1];
        v13 = v21;
        v14 = v22;
        v16 = &v17[(void)v22];
      }
      if (v13 == v15)
      {
        unsigned int v18 = (char *)[v12 readToOwnBuffer:&v21 size:-1];
        v13 = v21;
        v14 = v22;
        v15 = &v18[(void)v21];
      }
      if (v16 == v14 && v15 != v13) {
        break;
      }
      if (v16 != v14 && v15 == v13) {
        goto LABEL_28;
      }
      if (v16 - v14 >= (unint64_t)(v15 - v13)) {
        size_t v19 = v15 - v13;
      }
      else {
        size_t v19 = v16 - v14;
      }
      if (!v19) {
        goto LABEL_26;
      }
      int v20 = memcmp(v14, v13, v19);
      if (v20 < 0) {
        break;
      }
      if (v20) {
        goto LABEL_28;
      }
      v14 += v19;
      v13 += v19;
      __int16 v21 = v13;
      v22 = v14;
      v5 -= v19;
      if (v5 <= 0) {
        goto LABEL_26;
      }
    }
    int64_t v7 = -1;
  }
LABEL_28:
  return v7;
}

@end