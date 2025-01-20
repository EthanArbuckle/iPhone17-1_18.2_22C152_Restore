@interface SFUZipArchiveOutputStream
+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3;
- (BOOL)canRemoveEntryWithName:(id)a3;
- (SFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5;
- (SFUZipArchiveOutputStream)initWithPath:(id)a3;
- (SFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5;
- (id)beginUncompressedUnknownSizeEntryWithName:(id)a3;
- (id)entriesAtPath:(id)a3;
- (id)entryNames;
- (unint64_t)freeBytes;
- (unint64_t)writeLocalFileHeaderForEntry:(id)a3;
- (unsigned)crc32ForEntry:(id)a3;
- (void)beginEntryWithName:(id)a3 isCompressed:(BOOL)a4 uncompressedSize:(unint64_t)a5;
- (void)beginUnknownSizeEntryWithName:(id)a3 isCompressed:(BOOL)a4;
- (void)close;
- (void)coalesceAndTruncateFreeSpace;
- (void)dealloc;
- (void)finishEntry;
- (void)flush;
- (void)moveToPath:(id)a3;
- (void)removeEntryWithName:(id)a3;
- (void)reset;
- (void)setCrc32ForCurrentEntry:(unsigned int)a3;
- (void)setEncryptedDocumentUuid:(id)a3;
- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)writeCentralFileHeaderUsingEntry:(id)a3 isFirstEntry:(BOOL)a4;
- (void)writeEndOfCentralDirectoryWithOffset:(int64_t)a3;
- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3;
- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3;
@end

@implementation SFUZipArchiveOutputStream

+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3
{
  v3 = (const char *)[a3 UTF8String];
  if (v3) {
    v3 = (const char *)strlen(v3);
  }
  return (unint64_t)(v3 + 30);
}

- (SFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  v8 = [(SFUZipArchiveOutputStream *)self init];
  if (v8)
  {
    v8->mOutputStream = (SFUMoveableFileOutputStream *)a3;
    v8->mCryptoKey = (SFUCryptoKey *)a4;
    v8->mPassphraseHint = (NSData *)+[SFUCryptoUtils encodePassphraseHint:a5];
    v8->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v8->mFreeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v9 = (char *)malloc_type_malloc(0x38uLL, 0xA9B0C0A4uLL);
    v8->mBuffer = v9;
    if (!v9) {
      +[SFUZipException raise:@"SFUZipOutputError", @"Initialization error. Could not allocate record buffer of size: %zu", 56 format];
    }
  }
  return v8;
}

- (SFUZipArchiveOutputStream)initWithPath:(id)a3
{
  return [(SFUZipArchiveOutputStream *)self initWithPath:a3 cryptoKey:0 passphraseHint:0];
}

- (SFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  v8 = [[SFUMoveableFileOutputStream alloc] initWithPath:a3];
  return [(SFUZipArchiveOutputStream *)self initWithOutputStream:v8 cryptoKey:a4 passphraseHint:a5];
}

- (void)dealloc
{
  free(self->mBuffer);
  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchiveOutputStream;
  [(SFUZipArchiveOutputStream *)&v3 dealloc];
}

- (void)beginEntryWithName:(id)a3 isCompressed:(BOOL)a4 uncompressedSize:(unint64_t)a5
{
  BOOL v6 = a4;
  if (!self->mOutputStream)
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 177, @"Zip output stream is closed.");
  }
  [(SFUZipArchiveOutputStream *)self finishEntry];
  if (self->mCryptoKey) {
    a5 = +[SFUCryptoOutputStream encodedLengthForDataLength:key:](SFUCryptoOutputStream, "encodedLengthForDataLength:key:", a5);
  }
  v11 = objc_alloc_init(SFUZipOutputEntry);
  self->mCurrentEntry = v11;
  [(NSMutableArray *)self->mEntries addObject:v11];

  v12 = (const char *)[a3 UTF8String];
  self->mCurrentEntry->name = (NSString *)[a3 copy];
  if (v12) {
    size_t v13 = strlen(v12);
  }
  else {
    size_t v13 = 0;
  }
  self->mCurrentEntry->utf8NameLength = v13;
  self->mCurrentEntry->isCompressed = v6;
  self->mCurrentEntry->isEncrypted = self->mCryptoKey != 0;
  self->mCurrentEntry->time = SFUZipCurrentDosTime();
  self->mCurrentEntry->is64Bit = a5 > 0xFFC2F6FF;
  if (!v6 && [(SFUMoveableFileOutputStream *)self->mOutputStream canSeek])
  {
    mCurrentEntry = self->mCurrentEntry;
    uint64_t v15 = mCurrentEntry->utf8NameLength + 30;
    uint64_t v16 = mCurrentEntry->is64Bit ? 20 : 0;
    uint64_t v17 = v15 + v16;
    if (!__CFADD__(a5, v15 + v16))
    {
      uint64_t v18 = [(NSMutableArray *)self->mFreeList count];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = 0;
        v21 = 0;
        unint64_t v22 = v17 + a5;
        do
        {
          uint64_t v23 = [(NSMutableArray *)self->mFreeList objectAtIndex:v20];
          unint64_t v24 = *(void *)(v23 + 16);
          if (v24 == v22)
          {
            v21 = (void *)v23;
            goto LABEL_25;
          }
          if (v24 >= v22 + 47 && (!v21 || v24 < v21[2])) {
            v21 = (void *)v23;
          }
          ++v20;
        }
        while (v19 != v20);
        if (!v21) {
          goto LABEL_26;
        }
LABEL_25:
        [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v21[1] whence:0];
        self->mCurrentFreeSpace = (SFUZipFreeSpaceEntry *)v21;
      }
    }
  }
LABEL_26:
  v25 = self->mCurrentEntry;
  if (!self->mCurrentFreeSpace) {
    self->mLastEntryInFile = v25;
  }
  self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                            + [(SFUZipArchiveOutputStream *)self writeLocalFileHeaderForEntry:v25];
  self->mCurrentEntry->crc = crc32(0, 0, 0);
  if (!self->mCurrentEntry->isEncrypted)
  {
    v26 = self->mOutputStream;
    if (v6) {
      goto LABEL_30;
    }
LABEL_34:
    self->mEntryOutputStream = (SFUOutputStream *)v26;
    return;
  }
  v26 = [[SFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:self->mOutputStream key:self->mCryptoKey computeCrc32:1];
  if (!v6) {
    goto LABEL_34;
  }
LABEL_30:
  v27 = v26;
  self->mEntryOutputStream = (SFUOutputStream *)[[SFUZipDeflateOutputStream alloc] initWithOutputStream:v26];
}

- (void)beginUnknownSizeEntryWithName:(id)a3 isCompressed:(BOOL)a4
{
}

- (id)beginUncompressedUnknownSizeEntryWithName:(id)a3
{
  [(SFUZipArchiveOutputStream *)self beginUnknownSizeEntryWithName:a3 isCompressed:0];
  self->mCurrentEntry->isWrittenDirectlyToFile = 1;
  v4 = [[SFUOffsetOutputStream alloc] initWithOutputStream:self->mEntryOutputStream];
  if (self->mCurrentEntry->isEncrypted)
  {
    v5 = [[SFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:v4 key:self->mCryptoKey computeCrc32:1];

    v4 = v5;
  }
  return v4;
}

- (void)setCrc32ForCurrentEntry:(unsigned int)a3
{
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry)
  {
    if (mCurrentEntry->isWrittenDirectlyToFile) {
      mCurrentEntry->crc = a3;
    }
  }
}

- (void)writeBuffer:(const char *)a3 size:(unint64_t)a4
{
  if (self->mCurrentEntry)
  {
    if (!self->mOutputStream)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream writeBuffer:size:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 326, @"Zip output stream is closed.");
    }
    [(SFUOutputStream *)self->mEntryOutputStream writeBuffer:a3 size:a4];
    self->mCurrentEntry->uncompressedSize += a4;
    mCurrentEntry = self->mCurrentEntry;
    if (!mCurrentEntry->isEncrypted)
    {
      if (a4 >= 0xFFFFFFFF)
      {
        id v10 = +[TSUAssertionHandler currentHandler];
        uint64_t v11 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream writeBuffer:size:]"];
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 337, @"overflow in writeBuffer:");
        mCurrentEntry = self->mCurrentEntry;
      }
      self->mCurrentEntry->crc = crc32(mCurrentEntry->crc, (const Bytef *)a3, a4);
    }
  }
  else
  {
    +[SFUZipException raise:@"SFUZipOutputError" format:@"-writeBuffer:size: called when current entry is nil"];
  }
}

- (BOOL)canRemoveEntryWithName:(id)a3
{
  uint64_t v5 = [(NSMutableArray *)self->mEntries count];
  if (!v5) {
    goto LABEL_14;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  do
  {
    uint64_t v8 = [(NSMutableArray *)self->mEntries objectAtIndex:v7];
    if ([*(id *)(v8 + 8) isEqualToString:a3]) {
      id v9 = (SFUZipOutputEntry *)v8;
    }
    else {
      id v9 = 0;
    }
    ++v7;
    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v7 >= v6;
    }
  }
  while (!v10);
  if (v9) {
    return v9 == self->mLastEntryInFile || v9->compressedSize + v9->utf8NameLength > 0x10;
  }
LABEL_14:
  id v12 = +[TSUAssertionHandler currentHandler];
  uint64_t v13 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream canRemoveEntryWithName:]"];
  [v12 handleFailureInFunction:v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 357, @"Can't find entry named: %@", a3 file lineNumber description];
  return 0;
}

- (void)removeEntryWithName:(id)a3
{
  if (!self->mOutputStream)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream removeEntryWithName:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 366, @"Zip output stream is closed.");
  }
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry && [(NSString *)mCurrentEntry->name isEqualToString:a3])
  {
    uint64_t v8 = self->mCurrentEntry;
    [(SFUZipArchiveOutputStream *)self finishEntry];
  }
  else
  {
    uint64_t v9 = [(NSMutableArray *)self->mEntries count];
    if (!v9)
    {
LABEL_19:
      id v17 = +[TSUAssertionHandler currentHandler];
      uint64_t v18 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream removeEntryWithName:]"];
      [v17 handleFailureInFunction:v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 388, @"Can't find entry named: %@", a3 file lineNumber description];
      return;
    }
    unint64_t v10 = v9;
    unint64_t v11 = 0;
    do
    {
      uint64_t v8 = (SFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v11];
      if (![(NSString *)v8->name isEqualToString:a3]) {
        uint64_t v8 = 0;
      }
      ++v11;
      if (v8) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v11 >= v10;
      }
    }
    while (!v12);
  }
  if (!v8) {
    goto LABEL_19;
  }
  uint64_t v13 = v8;
  [(NSMutableArray *)self->mEntries removeObject:v8];
  if (v8 == self->mLastEntryInFile)
  {
    int64_t v19 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
    [(SFUMoveableFileOutputStream *)self->mOutputStream truncateToLength:v8->offset];
    if (v19 < (int64_t)v8->offset) {
      [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v19 whence:0];
    }
    self->mLastEntryInFile = 0;
    uint64_t v20 = [(NSMutableArray *)self->mEntries count];
    if (!self->mLastEntryInFile && v20)
    {
      uint64_t v21 = v20 - 1;
      while (1)
      {
        unint64_t v22 = (SFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v21];
        if (v22->compressedSize + v22->compressedDataOffset == v8->offset) {
          break;
        }
        BOOL v12 = v21-- != 0;
        char v23 = v12;
        if (self->mLastEntryInFile || (v23 & 1) == 0) {
          return;
        }
      }
      self->mLastEntryInFile = v22;
    }
  }
  else
  {
    v14 = objc_alloc_init(SFUZipFreeSpaceEntry);
    uint64_t v15 = v14;
    v14->offset = v8->offset;
    unint64_t v16 = v8->compressedDataOffset - v8->offset + v8->compressedSize;
    v14->length = v16;
    if (v16 >= 0x2F)
    {
      [(NSMutableArray *)self->mFreeList addObject:v14];

      self->mFreeBytes += v15->length;
    }
    else
    {

      +[SFUZipException raise:@"SFUZipOutputError", @"Removing entry named %@ produced free space that is too small.", a3 format];
    }
  }
}

- (void)setEncryptedDocumentUuid:(id)a3
{
  if (!self->mOutputStream) {
    +[SFUZipException raise:@"SFUZipOutputError" format:@"Tried to set encrypted document UUID after writing finished."];
  }
  id v5 = a3;

  self->mEncryptedDocumentUuid = (NSData *)a3;
}

- (void)close
{
  if (!self->mOutputStream)
  {
    id v3 = +[TSUAssertionHandler currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream close]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 462, @"Zip output stream is closed.");
  }
  [(SFUZipArchiveOutputStream *)self finishEntry];
  uint64_t v5 = [(NSMutableArray *)self->mFreeList count];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = malloc_type_calloc(1uLL, 0x40000uLL, 0x8D123391uLL);
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = [(NSMutableArray *)self->mFreeList objectAtIndex:v8];
      [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:*(void *)(v9 + 8) whence:0];
      unint64_t v10 = objc_alloc_init(SFUZipOutputEntry);
      self->mCurrentEntry = v10;
      [(NSMutableArray *)self->mEntries addObject:v10];

      unint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @".iWTrash/%08X", ++v8);
      BOOL v12 = (const char *)[v11 UTF8String];
      self->mCurrentEntry->name = (NSString *)[v11 copy];
      if (v12) {
        size_t v13 = strlen(v12);
      }
      else {
        size_t v13 = 0;
      }
      self->mCurrentEntry->utf8NameLength = v13;
      self->mCurrentEntry->isCompressed = 0;
      self->mCurrentEntry->isEncrypted = 0;
      self->mCurrentEntry->time = SFUZipCurrentDosTime();
      self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                                + [(SFUZipArchiveOutputStream *)self writeLocalFileHeaderForEntry:self->mCurrentEntry];
      self->mCurrentEntry->crc = crc32(0, 0, 0);
      self->mEntryOutputStream = (SFUOutputStream *)self->mOutputStream;
      for (unint64_t i = *(void *)(v9 + 16) - self->mCurrentEntry->compressedDataOffset + self->mCurrentEntry->offset; i; i -= v15)
      {
        if (i >= 0x40000) {
          uint64_t v15 = 0x40000;
        }
        else {
          uint64_t v15 = i;
        }
        [(SFUZipArchiveOutputStream *)self writeBuffer:v7 size:v15];
      }
      [(SFUZipArchiveOutputStream *)self finishEntry];
    }
    while (v8 != v6);
    if (v7) {
      free(v7);
    }
  }
  int64_t v16 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
  [(NSMutableArray *)self->mEntries sortUsingSelector:sel_compareByOffset_];
  id v17 = (void *)[(NSMutableArray *)self->mEntries objectEnumerator];
  uint64_t v18 = [v17 nextObject];
  if (v18) {
    [(SFUZipArchiveOutputStream *)self writeCentralFileHeaderUsingEntry:v18 isFirstEntry:1];
  }
  uint64_t v19 = [v17 nextObject];
  if (v19)
  {
    uint64_t v20 = v19;
    do
    {
      [(SFUZipArchiveOutputStream *)self writeCentralFileHeaderUsingEntry:v20 isFirstEntry:0];
      uint64_t v20 = [v17 nextObject];
    }
    while (v20);
  }
  [(SFUZipArchiveOutputStream *)self writeEndOfCentralDirectoryWithOffset:v16];

  self->mOutputStream = 0;
}

- (void)moveToPath:(id)a3
{
  if (!self->mOutputStream)
  {
    id v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream moveToPath:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 545, @"Zip output stream is closed.");
  }
  [(SFUZipArchiveOutputStream *)self finishEntry];
  id v7 = [(SFUMoveableFileOutputStream *)self->mOutputStream path];
  if (![(SFUMoveableFileOutputStream *)self->mOutputStream moveToPath:a3]) {
    +[SFUZipException raise:@"SFUZipOutputError", @"Could not move output stream from %@ to %@", v7, a3 format];
  }
}

- (id)entryNames
{
  uint64_t v3 = [(NSMutableArray *)self->mEntries count];
  uint64_t v4 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v3];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
      objc_msgSend(v4, "addObject:", *(void *)(-[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", i) + 8));
  }
  return v4;
}

- (id)entriesAtPath:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableArray count](self->mEntries, "count"));
  uint64_t v6 = [[SFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
  id v7 = (void *)[(NSMutableArray *)self->mEntries objectEnumerator];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      unint64_t v10 = [[SFUZipEntry alloc] initWithDataRepresentation:v6 compressionMethod:*(unsigned __int8 *)(v9 + 24) compressedSize:*(void *)(v9 + 32) uncompressedSize:*(void *)(v9 + 40) offset:*(void *)(v9 + 48) crc:*(unsigned int *)(v9 + 64)];
      unint64_t v11 = v10;
      if (*(unsigned char *)(v9 + 25)) {
        [(SFUZipEntry *)v10 setCryptoKey:self->mCryptoKey];
      }
      [v5 setObject:v11 forKey:*(void *)(v9 + 8)];

      uint64_t v9 = [v7 nextObject];
    }
    while (v9);
  }

  return v5;
}

- (void)flush
{
}

- (unint64_t)freeBytes
{
  return self->mFreeBytes;
}

- (void)reset
{
  [(NSMutableArray *)self->mEntries removeAllObjects];
  [(NSMutableArray *)self->mFreeList removeAllObjects];
  self->mCurrentEntry = 0;
  self->mLastEntryInFile = 0;
  self->mCurrentFreeSpace = 0;
  self->mFreeBytes = 0;

  self->mEntryOutputStream = 0;
  mOutputStream = self->mOutputStream;
  [(SFUMoveableFileOutputStream *)mOutputStream truncateToLength:0];
}

- (unsigned)crc32ForEntry:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mEntries = self->mEntries;
  uint64_t v6 = [(NSMutableArray *)mEntries countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mEntries);
        }
        unint64_t v10 = *(SFUZipOutputEntry **)(*((void *)&v12 + 1) + 8 * v9);
        if ([(NSString *)v10->name isEqualToString:a3])
        {
          if (v10 == self->mCurrentEntry) {
            LODWORD(v6) = 0;
          }
          else {
            LODWORD(v6) = v10->crc;
          }
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [(NSMutableArray *)mEntries countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (void)finishEntry
{
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry)
  {
    mEntryOutputStream = self->mEntryOutputStream;
    if (mCurrentEntry->isCompressed)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream(Private) finishEntry]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 676, @"Wrong output stream for compressed entry.");
      }
      mEntryOutputStream = (SFUOutputStream *)[(SFUOutputStream *)self->mEntryOutputStream closeLocalStream];
      mCurrentEntry = self->mCurrentEntry;
    }
    if (mCurrentEntry->isEncrypted)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = +[TSUAssertionHandler currentHandler];
        uint64_t v8 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream(Private) finishEntry]"];
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 687, @"Wrong output stream type for encrypted entry.");
      }
      [(SFUOutputStream *)mEntryOutputStream closeLocalStream];
      self->mCurrentEntry->crc = [(SFUOutputStream *)mEntryOutputStream crc32];
    }

    self->mEntryOutputStream = 0;
    self->mCurrentEntry->unint64_t compressedSize = [(SFUMoveableFileOutputStream *)self->mOutputStream offset]
                                        - self->mCurrentEntry->compressedDataOffset;
    uint64_t v9 = self->mCurrentEntry;
    if (v9->isWrittenDirectlyToFile)
    {
      v9->ununint64_t compressedSize = v9->compressedSize;
      if (!self->mCurrentEntry->crc)
      {
        if (![(SFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
          +[SFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but output stream cannot be seeked for CRC calculation."];
        }
        if (![(SFUMoveableFileOutputStream *)self->mOutputStream canCreateInputStream]) {
          +[SFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but output stream cannot be read for CRC calculation."];
        }
        unint64_t v10 = [[SFUBufferedInputStream alloc] initWithStream:[(SFUMoveableFileOutputStream *)self->mOutputStream inputStream]];
        if (![(SFUBufferedInputStream *)v10 canSeek])
        {
          [(SFUBufferedInputStream *)v10 close];

          +[SFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but input stream cannot be seeked for CRC calculation."];
          unint64_t v10 = 0;
        }
        [(SFUBufferedInputStream *)v10 seekToOffset:self->mCurrentEntry->compressedDataOffset];
        buf = 0;
        uint64_t v11 = [(SFUBufferedInputStream *)v10 readToOwnBuffer:&buf size:0xFFFFFFFFLL];
        if (v11)
        {
          LODWORD(v12) = v11;
          do
          {
            self->mCurrentEntry->crc = crc32(self->mCurrentEntry->crc, buf, v12);
            buf = 0;
            uint64_t v12 = [(SFUBufferedInputStream *)v10 readToOwnBuffer:&buf size:0xFFFFFFFFLL];
          }
          while (v12);
        }
        [(SFUBufferedInputStream *)v10 close];
      }
    }
    if (![(SFUMoveableFileOutputStream *)self->mOutputStream canSeek])
    {
      mBuffer = self->mBuffer;
      *(_DWORD *)mBuffer = *(_DWORD *)"PK\a\b";
      *((_DWORD *)mBuffer + 1) = self->mCurrentEntry->crc;
      uint64_t v20 = self->mCurrentEntry;
      BOOL is64Bit = v20->is64Bit;
      unint64_t compressedSize = v20->compressedSize;
      if (is64Bit)
      {
        *((void *)mBuffer + 1) = compressedSize;
        *((void *)mBuffer + 2) = self->mCurrentEntry->uncompressedSize;
        uint64_t v23 = 24;
      }
      else
      {
        *((_DWORD *)mBuffer + 2) = compressedSize;
        *((_DWORD *)mBuffer + 3) = self->mCurrentEntry->uncompressedSize;
        uint64_t v23 = 16;
      }
      [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:&mBuffer[v23] - self->mBuffer];
      goto LABEL_50;
    }
    if (self->mCurrentFreeSpace)
    {
      int64_t v13 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
      long long v14 = self->mCurrentEntry;
      unint64_t v15 = v13 - v14->offset;
      mCurrentFreeSpace = self->mCurrentFreeSpace;
      unint64_t length = mCurrentFreeSpace->length;
      if (v15 > length)
      {
        +[SFUZipException raise:@"SFUZipOutputError", @"Wrote more bytes than we had allocated for file %@", v14->name format];
        mCurrentFreeSpace = self->mCurrentFreeSpace;
        unint64_t length = mCurrentFreeSpace->length;
      }
      unint64_t v18 = length - v15;
      if ((uint64_t)(length - v15) < 1)
      {
        -[NSMutableArray removeObject:](self->mFreeList, "removeObject:");
      }
      else
      {
        if (v18 < 0x2F)
        {
          +[SFUZipException raise:@"SFUZipOutputError", @"Wrote more bytes than we had allocated for file %@", self->mCurrentEntry->name format];
          mCurrentFreeSpace = self->mCurrentFreeSpace;
        }
        mCurrentFreeSpace->offset += v15;
        self->mCurrentFreeSpace->unint64_t length = v18;
      }
      unint64_t v24 = self->mCurrentFreeSpace;
      self->mFreeBytes -= v15;

      self->mCurrentFreeSpace = 0;
    }
    v25 = self->mBuffer;
    v26 = self->mCurrentEntry;
    unint64_t v28 = v26->compressedSize;
    ununint64_t compressedSize = v26->uncompressedSize;
    *(_DWORD *)v25 = v26->crc;
    unint64_t v29 = HIDWORD(v28);
    if (HIDWORD(v28)) {
      int v30 = -1;
    }
    else {
      int v30 = self->mCurrentEntry->compressedSize;
    }
    *((_DWORD *)v25 + 1) = v30;
    unint64_t v31 = HIDWORD(uncompressedSize);
    if (HIDWORD(uncompressedSize))
    {
      *((_DWORD *)v25 + 2) = -1;
      [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:self->mCurrentEntry->offset + 14 whence:0];
      [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:12];
    }
    else
    {
      *((_DWORD *)v25 + 2) = self->mCurrentEntry->uncompressedSize;
      [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:self->mCurrentEntry->offset + 14 whence:0];
      [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:12];
      if (!v29)
      {
LABEL_49:
        [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:0 whence:2];
LABEL_50:
        self->mCurrentEntry = 0;
        [(SFUZipArchiveOutputStream *)self coalesceAndTruncateFreeSpace];
        return;
      }
    }
    v32 = self->mCurrentEntry;
    if (!v32->is64Bit)
    {
      id v33 = +[TSUAssertionHandler currentHandler];
      uint64_t v34 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream(Private) finishEntry]"];
      [v33 handleFailureInFunction:v34, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 810, @"Wrote a zip entry that needs 64 bit sizes, but didn't create 64 bit field." file lineNumber description];
      v32 = self->mCurrentEntry;
    }
    v35 = self->mBuffer;
    if (v31)
    {
      *(void *)v35 = v32->uncompressedSize;
      v35 += 8;
      v32 = self->mCurrentEntry;
    }
    if (v29)
    {
      *(void *)v35 = v32->compressedSize;
      v35 += 8;
      v32 = self->mCurrentEntry;
    }
    [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v32->offset + v32->utf8NameLength + 34 whence:0];
    [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:v35 - self->mBuffer];
    goto LABEL_49;
  }
}

- (void)coalesceAndTruncateFreeSpace
{
  if (!self->mCurrentEntry
    || (id v3 = +[TSUAssertionHandler currentHandler],
        uint64_t v4 = [NSString stringWithUTF8String:"-[SFUZipArchiveOutputStream(Private) coalesceAndTruncateFreeSpace]"], objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchiveOutputStream.m"), 863, @"-coalesceAndTruncateFreeSpace should not be called while an entry is being written to"), !self->mCurrentEntry))
  {
    if ([(SFUMoveableFileOutputStream *)self->mOutputStream canSeek]
      && [(NSMutableArray *)self->mFreeList count])
    {
      [(NSMutableArray *)self->mFreeList sortUsingSelector:sel_compareByOffset_];
      unint64_t v5 = [(NSMutableArray *)self->mFreeList count];
      if (v5 >= 2)
      {
        unint64_t v6 = v5;
        id v7 = 0;
        for (uint64_t i = 1; i != v6; ++i)
        {
          uint64_t v9 = [(NSMutableArray *)self->mFreeList objectAtIndex:i];
          if (v7
            && (uint64_t v10 = [(NSMutableArray *)v7 lastObject]) != 0
            && (uint64_t v11 = *(void *)(v10 + 16), *(void *)(v9 + 8) - v11 == *(void *)(v10 + 8)))
          {
            *(void *)(v10 + 16) = *(void *)(v9 + 16) + v11;
          }
          else
          {
            uint64_t v12 = [(NSMutableArray *)self->mFreeList objectAtIndex:i - 1];
            uint64_t v13 = *(void *)(v12 + 16);
            if (*(void *)(v9 + 8) - v13 == *(void *)(v12 + 8))
            {
              uint64_t v14 = v12;
              if (!v7)
              {
                id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
                uint64_t v13 = *(void *)(v14 + 16);
              }
              *(void *)(v14 + 16) = v13 + *(void *)(v9 + 16);
              [(NSMutableArray *)v7 addObject:v14];
            }
          }
        }
        if (v7)
        {

          self->mFreeList = v7;
        }
      }
      [(SFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:0 whence:2];
      int64_t v15 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
      uint64_t v16 = [(NSMutableArray *)self->mFreeList lastObject];
      if (v15 - *(void *)(v16 + 16) == *(void *)(v16 + 8))
      {
        uint64_t v17 = v16;
        -[SFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:");
        self->mFreeBytes -= *(void *)(v17 + 16);
        [(NSMutableArray *)self->mFreeList removeLastObject];
        if (!self->mLastEntryInFile)
        {
          uint64_t v18 = [(NSMutableArray *)self->mEntries count];
          if (!self->mLastEntryInFile)
          {
            if (v18)
            {
              uint64_t v19 = v18 - 1;
              while (1)
              {
                uint64_t v20 = (SFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v19];
                if (v20->compressedSize + v20->compressedDataOffset == *(void *)(v17 + 8)) {
                  break;
                }
                BOOL v22 = v19-- != 0;
                if (self->mLastEntryInFile || !v22) {
                  return;
                }
              }
              self->mLastEntryInFile = v20;
            }
          }
        }
      }
    }
  }
}

- (unint64_t)writeLocalFileHeaderForEntry:(id)a3
{
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 67324752;
  *((_WORD *)mBuffer + 2) = 20;
  if ([(SFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
    __int16 v6 = 0;
  }
  else {
    __int16 v6 = 8;
  }
  *((_WORD *)mBuffer + 3) = v6;
  if (*((unsigned char *)a3 + 24)) {
    __int16 v7 = 25452;
  }
  else {
    __int16 v7 = 25451;
  }
  if (*((unsigned char *)a3 + 25)) {
    __int16 v8 = v7;
  }
  else {
    __int16 v8 = 8 * *((unsigned __int8 *)a3 + 24);
  }
  *((_WORD *)mBuffer + 4) = v8;
  *(_DWORD *)(mBuffer + 10) = *((_DWORD *)a3 + 7);
  *(void *)(mBuffer + 14) = 0;
  *(_DWORD *)(mBuffer + 22) = 0;
  unint64_t v9 = *((void *)a3 + 2);
  if (v9 >= 0x10000)
  {
    +[SFUZipException raise:@"SFUZipOutputError", @"File name %@ is too long", *((void *)a3 + 1) format];
    unint64_t v9 = *((void *)a3 + 2);
  }
  if (v9 >= 0xFFFF) {
    LOWORD(v9) = -1;
  }
  *((_WORD *)mBuffer + 13) = v9;
  if (*((unsigned char *)a3 + 69)) {
    unsigned __int16 v10 = 20;
  }
  else {
    unsigned __int16 v10 = 0;
  }
  *((_WORD *)mBuffer + 14) = v10;
  *((void *)a3 + 6) = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
  [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:30];
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [*((id *)a3 + 1) UTF8String], *((void *)a3 + 2));
  if (*((unsigned char *)a3 + 69))
  {
    uint64_t v11 = self->mBuffer;
    *(_DWORD *)uint64_t v11 = 1048577;
    *(void *)(v11 + 12) = 0;
    *(void *)(v11 + 4) = 0;
    [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:20];
  }
  return v10 + 30 + *((void *)a3 + 2);
}

- (void)writeCentralFileHeaderUsingEntry:(id)a3 isFirstEntry:(BOOL)a4
{
  BOOL v41 = a4;
  mBuffer = self->mBuffer;
  unint64_t v7 = *((void *)a3 + 4);
  unint64_t v8 = *((void *)a3 + 5);
  unint64_t v9 = *((void *)a3 + 2);
  unint64_t v10 = *((void *)a3 + 6);
  *(_DWORD *)mBuffer = 33639248;
  *((_DWORD *)mBuffer + 1) = 1310782;
  if ([(SFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
    __int16 v11 = 0;
  }
  else {
    __int16 v11 = 8;
  }
  *((_WORD *)mBuffer + 4) = v11;
  if (*((unsigned char *)a3 + 24)) {
    __int16 v12 = 25452;
  }
  else {
    __int16 v12 = 25451;
  }
  if (*((unsigned char *)a3 + 25)) {
    __int16 v13 = v12;
  }
  else {
    __int16 v13 = 8 * *((unsigned __int8 *)a3 + 24);
  }
  *((_WORD *)mBuffer + 5) = v13;
  *((_DWORD *)mBuffer + 3) = *((_DWORD *)a3 + 7);
  *((_DWORD *)mBuffer + 4) = *((_DWORD *)a3 + 16);
  unint64_t v14 = HIDWORD(v7);
  if (HIDWORD(v7)) {
    int v15 = -1;
  }
  else {
    int v15 = *((_DWORD *)a3 + 8);
  }
  *((_DWORD *)mBuffer + 5) = v15;
  unint64_t v16 = HIDWORD(v8);
  if (HIDWORD(v8)) {
    int v17 = -1;
  }
  else {
    int v17 = *((_DWORD *)a3 + 10);
  }
  *((_DWORD *)mBuffer + 6) = v17;
  if (v9 >> 16) {
    __int16 v18 = -1;
  }
  else {
    __int16 v18 = *((_WORD *)a3 + 8);
  }
  *((_WORD *)mBuffer + 14) = v18;
  unint64_t v19 = (v8 | v7 | v10) >> 32;
  BOOL v20 = v19 != 0;
  unint64_t v21 = HIDWORD(v10);
  int v22 = 8 * (v16 != 0);
  if (v14) {
    v22 += 8;
  }
  if (v21) {
    v22 += 8;
  }
  if (v19) {
    int v23 = v22 | 4;
  }
  else {
    int v23 = 0;
  }
  if (v19) {
    __int16 v24 = v22;
  }
  else {
    __int16 v24 = 0;
  }
  __int16 v40 = v24;
  if (self->mCryptoKey && v41)
  {
    id v25 = +[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:](SFUCryptoUtils, "generatePassphraseVerifierForKey:verifierVersion:");
    v23 += [v25 length] + 8;
    mPassphraseHint = self->mPassphraseHint;
    v38 = mPassphraseHint;
    if (mPassphraseHint) {
      v23 += [(NSData *)mPassphraseHint length] + 8;
    }
    mEncryptedDocumentUuid = self->mEncryptedDocumentUuid;
    if (mEncryptedDocumentUuid)
    {
      unint64_t v28 = self->mEncryptedDocumentUuid;
      LOWORD(v23) = v23 + [(NSData *)mEncryptedDocumentUuid length] + 8;
      goto LABEL_37;
    }
  }
  else
  {
    id v25 = 0;
    v38 = 0;
  }
  unint64_t v28 = 0;
LABEL_37:
  *((_WORD *)mBuffer + 15) = v23;
  *((_DWORD *)mBuffer + 8) = 0;
  *((_WORD *)mBuffer + 18) = 0;
  *(_DWORD *)(mBuffer + 38) = 0;
  if (v21) {
    int v29 = -1;
  }
  else {
    int v29 = *((_DWORD *)a3 + 12);
  }
  *(_DWORD *)(mBuffer + 42) = v29;
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 46, v38);
  -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [*((id *)a3 + 1) UTF8String], *((void *)a3 + 2));
  if (!v20) {
    goto LABEL_49;
  }
  int v30 = self->mBuffer;
  *(_WORD *)int v30 = 1;
  *((_WORD *)v30 + 1) = v40;
  if (v16)
  {
    *(void *)(v30 + 4) = *((void *)a3 + 5);
    unint64_t v31 = v30 + 12;
    if (!v14) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  unint64_t v31 = v30 + 4;
  if (v14)
  {
LABEL_45:
    *(void *)unint64_t v31 = *((void *)a3 + 4);
    v31 += 8;
  }
LABEL_46:
  if (v21)
  {
    *(void *)unint64_t v31 = *((void *)a3 + 6);
    v31 += 8;
  }
  [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:v31 - self->mBuffer];
LABEL_49:
  if (self->mCryptoKey && v41)
  {
    v32 = self->mBuffer;
    *(_WORD *)v32 = 25453;
    *((_WORD *)v32 + 1) = [v25 length] + 4;
    *((_DWORD *)v32 + 1) = 1987082089;
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
    -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [v25 bytes], objc_msgSend(v25, "length"));
    if (v39)
    {
      id v33 = self->mBuffer;
      *(_WORD *)id v33 = 25454;
      *((_WORD *)v33 + 1) = [v39 length] + 4;
      *((_DWORD *)v33 + 1) = 1752201065;
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [v39 bytes], objc_msgSend(v39, "length"));
    }
    if (v28)
    {
      uint64_t v34 = self->mBuffer;
      *(_WORD *)uint64_t v34 = 25455;
      *((_WORD *)v34 + 1) = [(NSData *)v28 length] + 4;
      *((_DWORD *)v34 + 1) = *(_DWORD *)"iwuu";
      -[SFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      mOutputStream = self->mOutputStream;
      uint64_t v36 = [(NSData *)v28 bytes];
      uint64_t v37 = [(NSData *)v28 length];
      [(SFUMoveableFileOutputStream *)mOutputStream writeBuffer:v36 size:v37];
    }
  }
}

- (void)writeEndOfCentralDirectoryWithOffset:(int64_t)a3
{
  unint64_t v5 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset] - a3;
  unint64_t v6 = [(NSMutableArray *)self->mEntries count];
  unint64_t v7 = v6;
  if (a3 > 0xFFFFFFFFLL || (!(v6 >> 16) ? (BOOL v8 = HIDWORD(v5) == 0) : (BOOL v8 = 0), !v8))
  {
    int64_t v9 = [(SFUMoveableFileOutputStream *)self->mOutputStream offset];
    [(SFUZipArchiveOutputStream *)self writeZip64EndOfCentralDirectoryWithOffset:a3];
    [(SFUZipArchiveOutputStream *)self writeZip64EndOfCentralDirectoryLocatorWithOffset:v9];
  }
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 101010256;
  *((_DWORD *)mBuffer + 1) = 0;
  __int16 v11 = -1;
  if (v7 < 0xFFFF) {
    __int16 v11 = v7;
  }
  *((_WORD *)mBuffer + 4) = v11;
  *((_WORD *)mBuffer + 5) = v11;
  int v12 = -1;
  if (a3 > 0xFFFFFFFFLL) {
    int v13 = -1;
  }
  else {
    int v13 = v5;
  }
  if (a3 < 0xFFFFFFFFLL) {
    int v12 = a3;
  }
  *((_DWORD *)mBuffer + 3) = v13;
  *((_DWORD *)mBuffer + 4) = v12;
  *((_WORD *)mBuffer + 10) = 0;
  mOutputStream = self->mOutputStream;
  int v15 = self->mBuffer;
  [(SFUMoveableFileOutputStream *)mOutputStream writeBuffer:v15 size:22];
}

- (void)writeZip64EndOfCentralDirectoryWithOffset:(int64_t)a3
{
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 101075792;
  *(void *)(mBuffer + 4) = 44;
  *((void *)mBuffer + 2) = 0;
  *((_DWORD *)mBuffer + 3) = 1310782;
  uint64_t v6 = [(NSMutableArray *)self->mEntries count];
  *((void *)mBuffer + 3) = v6;
  *((void *)mBuffer + 4) = v6;
  *((void *)mBuffer + 5) = [(SFUMoveableFileOutputStream *)self->mOutputStream offset] - a3;
  *((void *)mBuffer + 6) = a3;
  mOutputStream = self->mOutputStream;
  BOOL v8 = self->mBuffer;
  [(SFUMoveableFileOutputStream *)mOutputStream writeBuffer:v8 size:56];
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 117853008;
  *((_DWORD *)mBuffer + 1) = 0;
  *((void *)mBuffer + 1) = a3;
  *((_DWORD *)mBuffer + 4) = 1;
  [(SFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:20];
}

@end