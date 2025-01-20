@interface SFUZipEntry
- (BOOL)isBackedByFile;
- (BOOL)isCompressed;
- (BOOL)isEncrypted;
- (BOOL)isReadable;
- (SFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8;
- (id)backingFilePath;
- (id)data;
- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4;
- (id)inputStream;
- (int64_t)dataLength;
- (int64_t)encodedLength;
- (unint64_t)backingFileDataOffset;
- (unint64_t)calculateEncodedLength;
- (unint64_t)dataOffset;
- (unsigned)crc;
- (void)copyToFile:(id)a3;
- (void)dealloc;
- (void)readZip64ExtraField:(const char *)a3 size:(unint64_t)a4;
- (void)setCompressionFlags:(unsigned __int16)a3;
- (void)setCryptoKey:(id)a3;
- (void)setDataLength:(int64_t)a3;
@end

@implementation SFUZipEntry

- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4
{
  v6 = [(SFUZipEntry *)self init];
  if (v6)
  {
    v6->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a4;
    if (*((_WORD *)a3 + 2)) {
      +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Encrypted files are not supported"];
    }
    [(SFUZipEntry *)v6 setCompressionFlags:*((unsigned __int16 *)a3 + 3)];
    v6->mCrc = *((_DWORD *)a3 + 3);
    v6->mCompressedSize = *((unsigned int *)a3 + 4);
    v6->mUncompressedSize = *((unsigned int *)a3 + 5);
    if (*((_WORD *)a3 + 15)) {
      +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"No multi-disk support"];
    }
    v6->mOffset = *(unsigned int *)(a3 + 38);
  }
  return v6;
}

- (SFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8
{
  v14 = [(SFUZipEntry *)self init];
  if (v14)
  {
    v14->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a3;
    v14->mCompressionMethod = a4;
    v14->mCompressedSize = a5;
    v14->mUncompressedSize = a6;
    v14->mOffset = a7;
    v14->mCrc = a8;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipEntry;
  [(SFUZipEntry *)&v3 dealloc];
}

- (BOOL)isReadable
{
  unsigned int v3 = [(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation isReadable];
  if (v3) {
    LOBYTE(v3) = [(SFUZipEntry *)self dataOffset] != 0;
  }
  return v3;
}

- (int64_t)dataLength
{
  return self->mUncompressedSize;
}

- (int64_t)encodedLength
{
  return [(SFUZipEntry *)self calculateEncodedLength];
}

- (id)inputStream
{
  unsigned int v3 = [(SFUZipEntry *)self dataOffset];
  if (!v3) {
    return v3;
  }
  if (self->mCryptoKey)
  {
    unsigned int v3 = (SFUZipInflateInputStream *)[(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation inputStreamWithOffset:v3 length:self->mCompressedSize];
    v4 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v3 key:self->mCryptoKey];
    v5 = v4;
    int mCompressionMethod = self->mCompressionMethod;
    if (mCompressionMethod == 1)
    {
      unsigned int v3 = [[SFUZipInflateInputStream alloc] initWithInput:v4];
    }
    else
    {
      if (!mCompressionMethod) {
        goto LABEL_19;
      }
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CD298);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100166CD4();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUZipEntry *)NSString inputStream], 141, 0, "Bad compression method."");
      +[TSUAssertionHandler logBacktraceThrottled];
    }

    return v3;
  }
  int v7 = self->mCompressionMethod;
  if (v7 == 1)
  {
    v4 = [[SFUZipInflateInputStream alloc] initWithOffset:v3 end:(char *)v3 + self->mCompressedSize uncompressedSize:self->mUncompressedSize crc:self->mCrc dataRepresentation:self->mArchiveDataRepresentation];
LABEL_19:
    return v4;
  }
  if (v7)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD2B8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166C4C();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUZipEntry *)NSString inputStream], 154, 0, "Bad compression method."");
    +[TSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  mArchiveDataRepresentation = self->mArchiveDataRepresentation;
  int64_t v9 = [(SFUZipEntry *)self dataLength];
  return [(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation inputStreamWithOffset:v3 length:v9];
}

- (id)data
{
  int64_t v3 = [(SFUZipEntry *)self dataLength];
  if (v3 < 0) {
    +[SFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  v4 = +[NSMutableData dataWithLength:v3];
  if (!v4) {
    +[SFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  if (objc_msgSend(-[SFUZipEntry inputStream](self, "inputStream"), "readToBuffer:size:", -[NSMutableData mutableBytes](v4, "mutableBytes"), v3) != (id)v3)+[SFUZipException raise:format:](SFUZipException, "raise:format:", @"SFUZipEntryError", @"Couldn't read data with size: %qu", v3); {
  return v4;
  }
}

- (void)copyToFile:(id)a3
{
  unlink((const char *)[a3 fileSystemRepresentation]);
  v6 = SFUFileOpen(a3, "w");
  id v7 = [(SFUDataRepresentation *)self bufferedInputStream];
  while (1)
  {
    __ptr = 0;
    id v8 = [v7 readToOwnBuffer:&__ptr size:-1];
    if (!v8) {
      break;
    }
    if ((id)fwrite(__ptr, 1uLL, (size_t)v8, v6) != v8) {
      +[NSException sfu_errnoRaise:@"SFUFileWriteError" format:@"Could not write"];
    }
  }
  [v7 close];
  fclose(v6);
}

- (BOOL)isCompressed
{
  return self->mCompressionMethod != 0;
}

- (BOOL)isEncrypted
{
  return self->mCryptoKey != 0;
}

- (BOOL)isBackedByFile
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)backingFilePath
{
  if ([(SFUZipEntry *)self isBackedByFile])
  {
    mArchiveDataRepresentation = self->mArchiveDataRepresentation;
    return [(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation path];
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD2D8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166D5C();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipEntry backingFilePath]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipEntry.m"), 227, 0, "-[SFUZipEntry backingFilePath] called on an entry that is not backed by file.");
    +[TSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
}

- (unint64_t)backingFileDataOffset
{
  if ([(SFUZipEntry *)self isBackedByFile])
  {
    return [(SFUZipEntry *)self dataOffset];
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD2F8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166DE4();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipEntry backingFileDataOffset]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipEntry.m"), 236, 0, "-[SFUZipEntry backingFileDataOffset] called on an entry that is not backed by file.");
    +[TSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
}

- (unsigned)crc
{
  return self->mCrc;
}

- (void)readZip64ExtraField:(const char *)a3 size:(unint64_t)a4
{
  id v7 = a3;
  if (self->mUncompressedSize == 0xFFFFFFFF)
  {
    if ((uint64_t)a4 <= 7) {
      +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 uncompressed size"];
    }
    id v7 = a3 + 8;
    self->mUncompressedSize = *(void *)a3;
  }
  id v8 = &a3[a4];
  if (self->mCompressedSize == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 compressed size"];
    }
    self->mCompressedSize = *(void *)v7;
    v7 += 8;
  }
  if (self->mOffset == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 offset"];
    }
    self->mOffset = *(void *)v7;
  }
}

- (void)setCompressionFlags:(unsigned __int16)a3
{
  if ((int)a3 <= 25450)
  {
    if (a3)
    {
      if (a3 != 8) {
        goto LABEL_9;
      }
LABEL_8:
      self->int mCompressionMethod = 1;
      return;
    }
    goto LABEL_7;
  }
  if (a3 == 25452) {
    goto LABEL_8;
  }
  if (a3 == 25451)
  {
LABEL_7:
    self->int mCompressionMethod = 0;
    return;
  }
LABEL_9:
  +[SFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Unsupported compression method"];
}

- (void)setCryptoKey:(id)a3
{
  id v5 = a3;

  self->mCryptoKey = (SFUCryptoKey *)a3;
}

- (void)setDataLength:(int64_t)a3
{
  if (self->mCryptoKey)
  {
    self->mHasEncodedLength = 0;
    self->mUncompressedSize = a3;
  }
  else
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CD318);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100166E6C();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "[(SFUZipEntry *)NSString setDataLength:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipEntry.m"], 294, 0, "Tried to call -setDataLength: on an unencrypted zip entry."");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
}

- (unint64_t)dataOffset
{
  if (self->mHasDataOffset) {
    return self->mDataOffset;
  }
  objc_sync_enter(self);
  if (self->mHasDataOffset)
  {
LABEL_7:
    objc_sync_exit(self);
    return self->mDataOffset;
  }
  id v3 = [(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation bufferedInputStreamWithOffset:self->mOffset length:30];
  v11 = 0;
  if ([v3 readToOwnBuffer:&v11 size:30] != (id)30) {
    +[SFUZipException raise:@"SFUZipEntryError" format:@"Could not read local header."];
  }
  v4 = v11;
  int v5 = *v11++;
  if (v5 == 67324752)
  {
    uint64_t v6 = *((unsigned __int16 *)v4 + 13);
    uint64_t v7 = *((unsigned __int16 *)v4 + 14);
    unint64_t mOffset = self->mOffset;
    v11 = (int *)((char *)v4 + 30);
    self->mDataOffset = v6 + v7 + 30 + mOffset;
    __dmb(0xBu);
    self->mHasDataOffset = 1;
    [v3 close];
    goto LABEL_7;
  }
  if (TSUErrorCat_init_token != -1) {
    dispatch_once(&TSUErrorCat_init_token, &stru_1001CD338);
  }
  v10 = TSUErrorCat_log_t;
  if (os_log_type_enabled((os_log_t)TSUErrorCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_100166EF4(v10);
  }
  __dmb(0xBu);
  self->mHasDataOffset = 1;
  [v3 close];
  objc_sync_exit(self);
  return 0;
}

- (unint64_t)calculateEncodedLength
{
  if (!self->mHasEncodedLength)
  {
    objc_sync_enter(self);
    if (!self->mHasEncodedLength)
    {
      if (self->mCryptoKey) {
        unint64_t mUncompressedSize = +[SFUCryptoOutputStream encodedLengthForDataLength:key:](SFUCryptoOutputStream, "encodedLengthForDataLength:key:", self->mUncompressedSize);
      }
      else {
        unint64_t mUncompressedSize = self->mUncompressedSize;
      }
      self->mEncodedLength = mUncompressedSize;
      __dmb(0xBu);
      self->mHasEncodedLength = 1;
    }
    objc_sync_exit(self);
  }
  return self->mEncodedLength;
}

@end