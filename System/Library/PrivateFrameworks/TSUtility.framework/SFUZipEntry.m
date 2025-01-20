@interface SFUZipEntry
- (BOOL)hasSameLocationAs:(id)a3;
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
  int v3 = [(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation isReadable];
  if (v3) {
    LOBYTE(v3) = [(SFUZipEntry *)self dataOffset] != 0;
  }
  return v3;
}

- (int64_t)dataLength
{
  return self->mUncompressedSize;
}

- (id)inputStream
{
  int v3 = [(SFUZipEntry *)self dataOffset];
  if (!v3) {
    return v3;
  }
  if (self->mCryptoKey)
  {
    int v3 = (char *)[(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation inputStreamWithOffset:v3 length:self->mCompressedSize];
    v4 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v3 key:self->mCryptoKey];
    v5 = v4;
    int mCompressionMethod = self->mCompressionMethod;
    if (mCompressionMethod == 1)
    {
      v11 = [[SFUZipInflateInputStream alloc] initWithInput:v4];

      return v11;
    }
    if (!mCompressionMethod) {
      goto LABEL_14;
    }
    id v12 = +[TSUAssertionHandler currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[SFUZipEntry inputStream]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 162, @"Bad compression method.");
    return v3;
  }
  int v7 = self->mCompressionMethod;
  if (v7 == 1)
  {
    v4 = [[SFUZipInflateInputStream alloc] initWithOffset:v3 end:&v3[self->mCompressedSize] uncompressedSize:self->mUncompressedSize crc:self->mCrc dataRepresentation:self->mArchiveDataRepresentation];
LABEL_14:
    return v4;
  }
  if (v7)
  {
    id v14 = +[TSUAssertionHandler currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[SFUZipEntry inputStream]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 178, @"Bad compression method.");
    return 0;
  }
  mArchiveDataRepresentation = self->mArchiveDataRepresentation;
  int64_t v9 = [(SFUZipEntry *)self dataLength];
  return (id)[(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation inputStreamWithOffset:v3 length:v9];
}

- (id)data
{
  int64_t v3 = [(SFUZipEntry *)self dataLength];
  if (v3 < 0) {
    +[SFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  v4 = (void *)[MEMORY[0x263EFF990] dataWithLength:v3];
  if (!v4) {
    +[SFUZipException raise:@"SFUZipEntryError", @"Couldn't allocate NSMutableData with size: %qu", v3 format];
  }
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (objc_msgSend(-[SFUZipEntry inputStream](self, "inputStream"), "readToBuffer:size:", objc_msgSend(v4, "mutableBytes"), v3) != v3)+[SFUZipException raise:format:](SFUZipException, "raise:format:", @"SFUZipEntryError", @"Couldn't read data with size: %qu", v3); {

  }
  return v4;
}

- (void)copyToFile:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263F086B0]);
  unlink((const char *)[a3 fileSystemRepresentation]);
  v6 = SFUFileOpen(a3, "w");
  id v7 = [(SFUDataRepresentation *)self bufferedInputStream];
  while (1)
  {
    __ptr = 0;
    size_t v8 = [v7 readToOwnBuffer:&__ptr size:-1];
    if (!v8) {
      break;
    }
    if (fwrite(__ptr, 1uLL, v8, v6) != v8) {
      [MEMORY[0x263EFF940] errnoRaise:@"SFUFileWriteError" format:@"Could not write"];
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
    return (id)[(SFUZipArchiveDataRepresentation *)mArchiveDataRepresentation path];
  }
  else
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUZipEntry backingFilePath]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 269, @"-[SFUZipEntry backingFilePath] called on an entry that is not backed by file.");
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
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SFUZipEntry backingFileDataOffset]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"), 280, @"-[SFUZipEntry backingFileDataOffset] called on an entry that is not backed by file.");
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
  size_t v8 = &a3[a4];
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
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SFUZipEntry setDataLength:]"];
    uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipEntry.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:355 description:@"Tried to call -setDataLength: on an unencrypted zip entry."];
  }
}

- (BOOL)hasSameLocationAs:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    int v5 = [(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation hasSameLocationAs:*((void *)a3 + 4)];
    if (!v5) {
      return v5;
    }
    unint64_t v6 = [(SFUZipEntry *)self dataOffset];
    if (v6 != [a3 dataOffset])
    {
LABEL_6:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = self->mUncompressedSize == *((void *)a3 + 7);
  }
  return v5;
}

- (unint64_t)dataOffset
{
  if (!self->mHasDataOffset)
  {
    objc_sync_enter(self);
    if (!self->mHasDataOffset)
    {
      id v3 = (void *)[(SFUZipArchiveDataRepresentation *)self->mArchiveDataRepresentation bufferedInputStreamWithOffset:self->mOffset length:30];
      v10 = 0;
      if ([v3 readToOwnBuffer:&v10 size:30] != 30) {
        +[SFUZipException raise:@"SFUZipEntryError" format:@"Could not read local header."];
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