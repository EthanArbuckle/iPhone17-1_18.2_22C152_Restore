@interface OISFUDataRepresentation
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
- (id)sha1Hash;
- (int64_t)compare:(id)a3;
- (int64_t)dataLength;
- (unint64_t)hash;
- (unint64_t)readIntoData:(id)a3;
- (unsigned)uint32Hash;
@end

@implementation OISFUDataRepresentation

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OISFUDataRepresentation dataLength]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"], 60, 0, "Abstract method.");
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  uint64_t v2 = [NSString stringWithUTF8String:"-[OISFUDataRepresentation inputStream]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"], 73, 0, "Abstract method.");
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (id)bufferedInputStream
{
  uint64_t v2 = [[OISFUBufferedInputStream alloc] initWithStream:[(OISFUDataRepresentation *)self inputStream] dataLength:[(OISFUDataRepresentation *)self dataLength]];
  return v2;
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  v3 = [[OISFUBufferedInputStream alloc] initWithStream:[(OISFUDataRepresentation *)self inputStream] bufferSize:a3];
  return v3;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  context = (void *)MEMORY[0x23EC9A170](self, a2);
  if (initMultiThreadedLibXMLUse_once != -1) {
    dispatch_once(&initMultiThreadedLibXMLUse_once, &__block_literal_global_13);
  }
  id v3 = [(OISFUDataRepresentation *)self bufferedInputStream];
  chunk = 0;
  unint64_t v4 = [v3 readToOwnBuffer:&chunk size:-1];
  int v5 = v4;
  if (v4 >> 31)
  {
    uint64_t v6 = [NSString stringWithUTF8String:"-[OISFUDataRepresentation xmlDocument]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"], 107, 0, "overflow in xmlDocument");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(0, 0, chunk, v5, 0);
  if (!PushParserCtxt) {
    [MEMORY[0x263EFF940] raise:@"SFUDataRepresentationError" format:@"xmlCreatePushParserCtxt() failed"];
  }
  while (1)
  {
    unint64_t v8 = [v3 readToOwnBuffer:&chunk size:-1];
    int v9 = v8;
    if (!v8) {
      break;
    }
    if (v8 >> 31)
    {
      uint64_t v10 = [NSString stringWithUTF8String:"-[OISFUDataRepresentation xmlDocument]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"], 120, 0, "overflow in xmlDocument");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v11 = xmlParseChunk(PushParserCtxt, chunk, v9, 0);
    if (v11) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v11);
    }
  }
  uint64_t v12 = xmlParseChunk(PushParserCtxt, chunk, 0, 1);
  if (v12) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v12);
  }
  myDoc = PushParserCtxt->myDoc;
  if (!PushParserCtxt->wellFormed) {
    [MEMORY[0x263EFF940] raise:@"SFUDataRepresentationError" format:@"XML document is not well formed."];
  }
  xmlFreeParserCtxt(PushParserCtxt);
  [v3 close];
  return myDoc;
}

- (_xmlTextReader)xmlReader
{
  return [(OISFUDataRepresentation *)self xmlReaderWithReadCallback:SFUXmlReaderIORead];
}

- (_xmlTextReader)xmlReaderWithReadCallback:(void *)a3
{
  id v4 = [(OISFUDataRepresentation *)self inputStream];
  return xmlReaderForIO((xmlInputReadCallback)a3, (xmlInputCloseCallback)SFUXmlReaderIOClose, v4, 0, 0, 0);
}

- (_xmlTextReader)xmlReaderForGzippedData
{
  return [(OISFUDataRepresentation *)self xmlReaderForGzippedDataWithInputStream:0];
}

- (_xmlTextReader)xmlReaderForGzippedDataWithInputStream:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(OISFUDataRepresentation *)self inputStream];
  if ([v4 readToBuffer:v10 size:10] != 10) {
    return 0;
  }
  char v5 = v11;
  if ((v11 & 4) != 0)
  {
    unsigned __int16 v9 = 0;
    if ([v4 readToBuffer:&v9 size:2] != 2) {
      return 0;
    }
    if (v9)
    {
      int v8 = 0;
      while ([v4 readToBuffer:v10 size:1] == 1)
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
    while ([v4 readToBuffer:v10 size:1] == 1)
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
    while ([v4 readToBuffer:v10 size:1] == 1)
    {
      if (!v10[0]) {
        goto LABEL_11;
      }
    }
    return 0;
  }
LABEL_11:
  if ((v5 & 2) != 0 && [v4 readToBuffer:v10 size:2] != 2) {
    return 0;
  }
  uint64_t v6 = [[OISFUZipInflateInputStream alloc] initWithInput:v4];
  if (a3) {
    *a3 = v6;
  }
  return xmlReaderForIO((xmlInputReadCallback)SFUXmlReaderIORead, (xmlInputCloseCallback)SFUXmlReaderIOClose, v6, 0, 0, 0);
}

- (CGDataProvider)cgDataProvider
{
  id v2 = [(OISFUDataRepresentation *)self inputStream];
  if (([v2 canSeek] & 1) == 0)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUDataRepresentation cgDataProvider]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUDataRepresentation.m"], 244, 0, "Need a seekable input stream for -cgDataProvider");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return CGDataProviderCreateSequential(v2, &SFUCGDataProviderCallbacks);
}

- (unint64_t)readIntoData:(id)a3
{
  uint64_t v5 = [a3 length];
  id v6 = [(OISFUDataRepresentation *)self bufferedInputStream];
  for (uint64_t i = 0; ; [a3 appendBytes:i length:v7])
  {
    uint64_t v7 = [v6 readToOwnBuffer:&i size:-1];
    if (!v7) {
      break;
    }
  }
  [v6 close];
  return [a3 length] - v5;
}

- (unint64_t)hash
{
  return [(OISFUDataRepresentation *)self uint32Hash];
}

- (unsigned)uint32Hash
{
  if (!self->mHasHash && [(OISFUDataRepresentation *)self isReadable])
  {
    objc_sync_enter(self);
    if (!self->mHasHash && [(OISFUDataRepresentation *)self isReadable])
    {
      uint64_t v3 = (void *)MEMORY[0x23EC9A170]();
      int64_t v4 = [(OISFUDataRepresentation *)self dataLength];
      id v5 = [(OISFUDataRepresentation *)self inputStream];
      id v6 = (char *)malloc_type_malloc(0x1008uLL, 0x39413CC6uLL);
      if (!v6) {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF570] format:@"Failed to allocate hash buffer for SFEData"];
      }
      uint64_t v7 = [v5 readToBuffer:v6 size:4096];
      *(void *)&v6[v7] = v4;
      self->mHash = SFUHash(v6, v7 + 8);
      free(v6);
      __dmb(0xBu);
      self->mHasHash = 1;
    }
    objc_sync_exit(self);
  }
  return self->mHash;
}

- (id)sha1Hash
{
  if (!self->mHasSha1Hash && [(OISFUDataRepresentation *)self isReadable])
  {
    objc_sync_enter(self);
    if (!self->mHasSha1Hash && [(OISFUDataRepresentation *)self isReadable])
    {
      uint64_t v3 = (void *)MEMORY[0x23EC9A170]();
      self->mSha1Hash = (NSData *)+[OISFUCryptoUtils sha1HashFromStorage:self];
      __dmb(0xBu);
      self->mHasSha1Hash = 1;
    }
    objc_sync_exit(self);
  }
  return self->mSha1Hash;
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
  uint64_t v5 = [(OISFUDataRepresentation *)self dataLength];
  if (v5 != [a3 dataLength]) {
    return 0;
  }
  if ([(OISFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 1;
  }
  if (!-[OISFUDataRepresentation isReadable](self, "isReadable") || ![a3 isReadable]) {
    return 0;
  }
  uint64_t v7 = (void *)MEMORY[0x23EC9A170]();
  id v8 = [(OISFUDataRepresentation *)self bufferedInputStream];
  uint64_t v9 = [a3 bufferedInputStream];
  v19 = 0;
  v20 = 0;
  if (v5 < 1)
  {
LABEL_20:
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v10 = (void *)v9;
    char v11 = 0;
    uint64_t v12 = 0;
    v13 = 0;
    v14 = 0;
    while (1)
    {
      if (v12 == v14)
      {
        uint64_t v15 = [v8 readToOwnBuffer:&v20 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        v14 = &v20[v15];
      }
      if (v11 == v13)
      {
        uint64_t v16 = [v10 readToOwnBuffer:&v19 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        v13 = &v19[v16];
      }
      size_t v17 = v14 - v12 >= v13 - v11 ? v13 - v11 : v14 - v12;
      if (!v17 || memcmp(v12, v11, v17)) {
        break;
      }
      v12 += v17;
      v11 += v17;
      v19 = v11;
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
  uint64_t v5 = [(OISFUDataRepresentation *)self dataLength];
  uint64_t v6 = [a3 dataLength];
  if (v5 < v6) {
    return -1;
  }
  if (v5 > v6) {
    return 1;
  }
  if ([(OISFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 0;
  }
  uint64_t v9 = (void *)MEMORY[0x23EC9A170]();
  id v10 = [(OISFUDataRepresentation *)self bufferedInputStream];
  uint64_t v11 = [a3 bufferedInputStream];
  v21 = 0;
  v22 = 0;
  if (v5 < 1)
  {
LABEL_26:
    int64_t v7 = 0;
  }
  else
  {
    uint64_t v12 = (void *)v11;
    v13 = 0;
    v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int64_t v7 = 1;
    while (1)
    {
      if (v14 == v16)
      {
        uint64_t v17 = [v10 readToOwnBuffer:&v22 size:-1];
        v13 = v21;
        v14 = v22;
        uint64_t v16 = &v22[v17];
      }
      if (v13 == v15)
      {
        uint64_t v18 = [v12 readToOwnBuffer:&v21 size:-1];
        v13 = v21;
        v14 = v22;
        uint64_t v15 = &v21[v18];
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
      v21 = v13;
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