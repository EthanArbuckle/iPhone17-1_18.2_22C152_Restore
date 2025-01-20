@interface OISFUZipEntry
- (BOOL)isBackedByFile;
- (BOOL)isCompressed;
- (BOOL)isEncrypted;
- (BOOL)isReadable;
- (OISFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8;
- (id)backingFilePath;
- (id)data;
- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4;
- (id)inputStream;
- (int64_t)dataLength;
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

@implementation OISFUZipEntry

- (id)initFromCentralFileHeader:(const char *)a3 dataRepresentation:(id)a4
{
  v6 = [(OISFUZipEntry *)self init];
  if (v6)
  {
    v6->mArchiveDataRepresentation = (SFUZipArchiveDataRepresentation *)a4;
    if (*((_WORD *)a3 + 2)) {
      +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Encrypted files are not supported"];
    }
    [(OISFUZipEntry *)v6 setCompressionFlags:*((unsigned __int16 *)a3 + 3)];
    v6->mCrc = *((_DWORD *)a3 + 3);
    v6->mCompressedSize = *((unsigned int *)a3 + 4);
    v6->mUncompressedSize = *((unsigned int *)a3 + 5);
    if (*((_WORD *)a3 + 15)) {
      +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"No multi-disk support"];
    }
    v6->mOffset = *(unsigned int *)(a3 + 38);
  }
  return v6;
}

- (OISFUZipEntry)initWithDataRepresentation:(id)a3 compressionMethod:(int)a4 compressedSize:(unint64_t)a5 uncompressedSize:(unint64_t)a6 offset:(unint64_t)a7 crc:(unsigned int)a8
{
  v14 = [(OISFUZipEntry *)self init];
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
  v3.super_class = (Class)OISFUZipEntry;
  [(OISFUZipEntry *)&v3 dealloc];
}

- (BOOL)isReadable
{
  int v3 = [(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation isReadable];
  if (v3) {
    LOBYTE(v3) = [(OISFUZipEntry *)self dataOffset] != 0;
  }
  return v3;
}

- (int64_t)dataLength
{
  return self->mUncompressedSize;
}

- (id)inputStream
{
  int v3 = [(OISFUZipEntry *)self dataOffset];
  if (!v3) {
    return v3;
  }
  if (self->mCryptoKey)
  {
    int v3 = (char *)[(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation inputStreamWithOffset:v3 length:self->mCompressedSize];
    v4 = [[OISFUCryptoInputStream alloc] initForDecryptionWithInputStream:v3 key:self->mCryptoKey];
    v5 = v4;
    int mCompressionMethod = self->mCompressionMethod;
    if (mCompressionMethod == 1)
    {
      v11 = [[OISFUZipInflateInputStream alloc] initWithInput:v4];

      return v11;
    }
    if (!mCompressionMethod) {
      goto LABEL_14;
    }
    uint64_t v12 = [NSString stringWithUTF8String:"-[OISFUZipEntry inputStream]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"], 145, 0, "Bad compression method.");
    +[OITSUAssertionHandler logBacktraceThrottled];

    return v3;
  }
  int v7 = self->mCompressionMethod;
  if (v7 == 1)
  {
    v4 = [[OISFUZipInflateInputStream alloc] initWithOffset:v3 end:&v3[self->mCompressedSize] uncompressedSize:self->mUncompressedSize crc:self->mCrc dataRepresentation:self->mArchiveDataRepresentation];
LABEL_14:
    return v4;
  }
  if (v7)
  {
    uint64_t v13 = [NSString stringWithUTF8String:"-[OISFUZipEntry inputStream]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"], 158, 0, "Bad compression method.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  mArchiveDataRepresentation = self->mArchiveDataRepresentation;
  int64_t v9 = [(OISFUZipEntry *)self dataLength];
  return (id)[(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation inputStreamWithOffset:v3 length:v9];
}

- (id)data
{
  int64_t v3 = [(OISFUZipEntry *)self dataLength];
  if (v3 < 0) {
    +[OISFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  uint64_t v4 = [MEMORY[0x263EFF990] dataWithLength:v3];
  v5 = (void *)v4;
  if (!v4) {
    uint64_t v4 = +[OISFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  v6 = (void *)MEMORY[0x23EC9A170](v4);
  if (objc_msgSend(-[OISFUZipEntry inputStream](self, "inputStream"), "readToBuffer:size:", objc_msgSend(v5, "mutableBytes"), v3) != v3)+[OISFUZipException raise:format:](OISFUZipException, "raise:format:", @"SFUZipEntryError", @"Couldn't read data with size: %qu", v3); {
  return v5;
  }
}

- (void)copyToFile:(id)a3
{
  v5 = (void *)MEMORY[0x23EC9A170](self, a2);
  unlink((const char *)[a3 fileSystemRepresentation]);
  v6 = SFUFileOpen(a3, "w");
  id v7 = [(OISFUDataRepresentation *)self bufferedInputStream];
  while (1)
  {
    __ptr = 0;
    size_t v8 = [v7 readToOwnBuffer:&__ptr size:-1];
    if (!v8) {
      break;
    }
    if (fwrite(__ptr, 1uLL, v8, v6) != v8) {
      objc_msgSend(MEMORY[0x263EFF940], "sfu_errnoRaise:format:", @"SFUFileWriteError", @"Could not write");
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
  if ([(OISFUZipEntry *)self isBackedByFile])
  {
    mArchiveDataRepresentation = self->mArchiveDataRepresentation;
    return (id)[(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation path];
  }
  else
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUZipEntry backingFilePath]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"], 231, 0, "-[SFUZipEntry backingFilePath] called on an entry that is not backed by file.");
    +[OITSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
}

- (unint64_t)backingFileDataOffset
{
  if ([(OISFUZipEntry *)self isBackedByFile])
  {
    return [(OISFUZipEntry *)self dataOffset];
  }
  else
  {
    uint64_t v4 = [NSString stringWithUTF8String:"-[OISFUZipEntry backingFileDataOffset]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"], 240, 0, "-[SFUZipEntry backingFileDataOffset] called on an entry that is not backed by file.");
    +[OITSUAssertionHandler logBacktraceThrottled];
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
      +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 uncompressed size"];
    }
    id v7 = a3 + 8;
    self->mUncompressedSize = *(void *)a3;
  }
  size_t v8 = &a3[a4];
  if (self->mCompressedSize == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 compressed size"];
    }
    self->mCompressedSize = *(void *)v7;
    v7 += 8;
  }
  if (self->mOffset == 0xFFFFFFFF)
  {
    if (v7 + 8 > v8) {
      +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Not enough room for Zip64 offset"];
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
  +[OISFUZipException raise:@"SFUZipCentralFileHeaderError" format:@"Unsupported compression method"];
}

- (void)setCryptoKey:(id)a3
{
  id v5 = a3;

  self->mCryptoKey = (OISFUCryptoKey *)a3;
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
    uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUZipEntry setDataLength:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipEntry.m"], 298, 0, "Tried to call -setDataLength: on an unencrypted zip entry.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (unint64_t)dataOffset
{
  if (!self->mHasDataOffset)
  {
    objc_sync_enter(self);
    if (!self->mHasDataOffset)
    {
      uint64_t v3 = (void *)[(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation bufferedInputStreamWithOffset:self->mOffset length:30];
      v10 = 0;
      if ([v3 readToOwnBuffer:&v10 size:30] != 30) {
        +[OISFUZipException raise:@"SFUZipEntryError" format:@"Could not read local header."];
      }
      uint64_t v4 = v10;
      int v5 = *v10++;
      if (v5 != 67324752)
      {
        __dmb(0xBu);
        self->mHasDataOffset = 1;
        [v3 close];
        objc_sync_exit(self);
        return 0;
      }
      uint64_t v6 = *((unsigned __int16 *)v4 + 13);
      uint64_t v7 = *((unsigned __int16 *)v4 + 14);
      unint64_t mOffset = self->mOffset;
      v10 = (int *)((char *)v4 + 30);
      self->mDataOffset = v6 + v7 + 30 + mOffset;
      __dmb(0xBu);
      self->mHasDataOffset = 1;
      [v3 close];
    }
    objc_sync_exit(self);
  }
  return self->mDataOffset;
}

- (unint64_t)calculateEncodedLength
{
  if (!self->mHasEncodedLength)
  {
    objc_sync_enter(self);
    if (!self->mHasEncodedLength)
    {
      if (self->mCryptoKey) {
        unint64_t mUncompressedSize = +[OISFUCryptoOutputStream encodedLengthForDataLength:key:](OISFUCryptoOutputStream, "encodedLengthForDataLength:key:", self->mUncompressedSize);
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