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

@implementation SFUDataRepresentation

- (BOOL)isReadable
{
  return 1;
}

- (int64_t)dataLength
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[SFUDataRepresentation dataLength]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 48, @"Abstract method.");
  return 0;
}

- (BOOL)isEncrypted
{
  return 0;
}

- (id)inputStream
{
  id v2 = +[TSUAssertionHandler currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[SFUDataRepresentation inputStream]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 64, @"Abstract method.");
  return 0;
}

- (id)bufferedInputStream
{
  id v2 = [[SFUBufferedInputStream alloc] initWithStream:[(SFUDataRepresentation *)self inputStream] dataLength:[(SFUDataRepresentation *)self dataLength]];
  return v2;
}

- (id)bufferedInputStreamWithBufferSize:(unint64_t)a3
{
  uint64_t v3 = [[SFUBufferedInputStream alloc] initWithStream:[(SFUDataRepresentation *)self inputStream] bufferSize:a3];
  return v3;
}

- (BOOL)hasSameLocationAs:(id)a3
{
  return 0;
}

- (_xmlDoc)xmlDocument
{
  id v17 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v3 = [(SFUDataRepresentation *)self bufferedInputStream];
  chunk = 0;
  unint64_t v4 = [v3 readToOwnBuffer:&chunk size:-1];
  int v5 = v4;
  if (v4 >> 31)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SFUDataRepresentation xmlDocument]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 101, @"overflow in xmlDocument");
  }
  xmlParserCtxtPtr PushParserCtxt = xmlCreatePushParserCtxt(0, 0, chunk, v5, 0);
  if (!PushParserCtxt) {
    [MEMORY[0x263EFF940] raise:@"SFUDataRepresentationError" format:@"xmlCreatePushParserCtxt() failed"];
  }
  while (1)
  {
    unint64_t v9 = [v3 readToOwnBuffer:&chunk size:-1];
    int v10 = v9;
    if (!v9) {
      break;
    }
    if (v9 >> 31)
    {
      id v11 = +[TSUAssertionHandler currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"-[SFUDataRepresentation xmlDocument]"];
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 117, @"overflow in xmlDocument");
    }
    uint64_t v13 = xmlParseChunk(PushParserCtxt, chunk, v10, 0);
    if (v13) {
      objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v13);
    }
  }
  uint64_t v14 = xmlParseChunk(PushParserCtxt, chunk, 0, 1);
  if (v14) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", @"SFUDataRepresentationError", @"xmlParseChunk() failed: %d", v14);
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
  id v2 = [(SFUDataRepresentation *)self inputStream];
  return xmlReaderForIO((xmlInputReadCallback)SFUXmlReaderIORead, (xmlInputCloseCallback)SFUXmlReaderIOClose, v2, 0, 0, 2048);
}

- (_xmlTextReader)xmlReaderForGzippedData
{
  return [(SFUDataRepresentation *)self xmlReaderForGzippedDataWithInputStream:0];
}

- (_xmlTextReader)xmlReaderForGzippedDataWithInputStream:(id *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(SFUDataRepresentation *)self inputStream];
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
  id v6 = [[SFUZipInflateInputStream alloc] initWithInput:v4];
  if (a3) {
    *a3 = v6;
  }
  return xmlReaderForIO((xmlInputReadCallback)SFUXmlReaderIORead, (xmlInputCloseCallback)SFUXmlReaderIOClose, v6, 0, 0, 2048);
}

- (CGDataProvider)cgDataProvider
{
  id v2 = [(SFUDataRepresentation *)self inputStream];
  if (([v2 canSeek] & 1) == 0)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SFUDataRepresentation cgDataProvider]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUDataRepresentation.m"), 260, @"Need a seekable input stream for -cgDataProvider");
  }
  return CGDataProviderCreateSequential(v2, &SFUCGDataProviderCallbacks);
}

- (unint64_t)readIntoData:(id)a3
{
  uint64_t v5 = [a3 length];
  id v6 = [(SFUDataRepresentation *)self bufferedInputStream];
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
  return [(SFUDataRepresentation *)self uint32Hash];
}

- (unsigned)uint32Hash
{
  if (!self->mHasHash && [(SFUDataRepresentation *)self isReadable])
  {
    objc_sync_enter(self);
    if (!self->mHasHash && [(SFUDataRepresentation *)self isReadable])
    {
      id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
      int64_t v4 = [(SFUDataRepresentation *)self dataLength];
      id v5 = [(SFUDataRepresentation *)self inputStream];
      id v6 = (char *)malloc_type_malloc(0x1008uLL, 0x92B331D3uLL);
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
  if (!self->mHasSha1Hash && [(SFUDataRepresentation *)self isReadable])
  {
    objc_sync_enter(self);
    if (!self->mHasSha1Hash && [(SFUDataRepresentation *)self isReadable])
    {
      id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
      self->mSha1Hash = (NSData *)+[SFUCryptoUtils sha1HashFromStorage:self];
      [v3 drain];
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
  uint64_t v5 = [(SFUDataRepresentation *)self dataLength];
  if (v5 != [a3 dataLength]) {
    return 0;
  }
  if ([(SFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 1;
  }
  if (!-[SFUDataRepresentation isReadable](self, "isReadable") || ![a3 isReadable]) {
    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v8 = [(SFUDataRepresentation *)self bufferedInputStream];
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
    int v10 = (void *)v9;
    char v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    while (1)
    {
      if (v12 == v14)
      {
        uint64_t v15 = [v8 readToOwnBuffer:&v20 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        uint64_t v14 = &v20[v15];
      }
      if (v11 == v13)
      {
        uint64_t v16 = [v10 readToOwnBuffer:&v19 size:-1];
        char v11 = v19;
        uint64_t v12 = v20;
        uint64_t v13 = &v19[v16];
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
  uint64_t v5 = [(SFUDataRepresentation *)self dataLength];
  uint64_t v6 = [a3 dataLength];
  if (v5 < v6) {
    return -1;
  }
  if (v5 > v6) {
    return 1;
  }
  if ([(SFUDataRepresentation *)self hasSameLocationAs:a3]) {
    return 0;
  }
  id v9 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v10 = [(SFUDataRepresentation *)self bufferedInputStream];
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
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    int64_t v7 = 1;
    while (1)
    {
      if (v14 == v16)
      {
        uint64_t v17 = [v10 readToOwnBuffer:&v22 size:-1];
        uint64_t v13 = v21;
        uint64_t v14 = v22;
        uint64_t v16 = &v22[v17];
      }
      if (v13 == v15)
      {
        uint64_t v18 = [v12 readToOwnBuffer:&v21 size:-1];
        uint64_t v13 = v21;
        uint64_t v14 = v22;
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
  objc_msgSend(v9, "drain", v21, v22);
  return v7;
}

@end