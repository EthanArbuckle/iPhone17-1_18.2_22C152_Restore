@interface OISFUZipArchiveOutputStream
+ (BOOL)createZipWithItemsAtPath:(id)a3 zippedPath:(id)a4 rootPathComponentName:(id)a5;
+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3;
- (BOOL)canRemoveEntryWithName:(id)a3;
- (OISFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5;
- (OISFUZipArchiveOutputStream)initWithPath:(id)a3;
- (OISFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5;
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

@implementation OISFUZipArchiveOutputStream

+ (unint64_t)approximateBytesForEntryHeaderWithName:(id)a3
{
  if (a3) {
    size_t v3 = strlen((const char *)[a3 UTF8String]);
  }
  else {
    size_t v3 = 0;
  }
  return v3 + 30;
}

- (OISFUZipArchiveOutputStream)initWithOutputStream:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  v8 = [(OISFUZipArchiveOutputStream *)self init];
  if (v8)
  {
    v8->mOutputStream = (OISFUMoveableFileOutputStream *)a3;
    v8->mCryptoKey = (OISFUCryptoKey *)a4;
    v8->mPassphraseHint = (NSData *)+[OISFUCryptoUtils encodePassphraseHint:a5];
    v8->mEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v8->mFreeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v9 = (char *)malloc_type_malloc(*(size_t *)"8", 0x1BD1FD26uLL);
    v8->mBuffer = v9;
    if (!v9) {
      +[OISFUZipException raise:@"SFUZipOutputError", @"Initialization error. Could not allocate record buffer of size: %zu", *(void *)"8" format];
    }
  }
  return v8;
}

- (OISFUZipArchiveOutputStream)initWithPath:(id)a3
{
  return [(OISFUZipArchiveOutputStream *)self initWithPath:a3 cryptoKey:0 passphraseHint:0];
}

- (OISFUZipArchiveOutputStream)initWithPath:(id)a3 cryptoKey:(id)a4 passphraseHint:(id)a5
{
  v8 = [[OISFUMoveableFileOutputStream alloc] initWithPath:a3];
  return [(OISFUZipArchiveOutputStream *)self initWithOutputStream:v8 cryptoKey:a4 passphraseHint:a5];
}

- (void)dealloc
{
  free(self->mBuffer);
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipArchiveOutputStream;
  [(OISFUZipArchiveOutputStream *)&v3 dealloc];
}

+ (BOOL)createZipWithItemsAtPath:(id)a3 zippedPath:(id)a4 rootPathComponentName:(id)a5
{
  v40[2] = *MEMORY[0x263EF8340];
  v7 = [[OISFUZipArchiveOutputStream alloc] initWithPath:a4];
  v30 = (void *)[MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = objc_msgSend(NSURL, "tsu_fileURLWithPath:", a3);
  uint64_t v9 = *MEMORY[0x263EFF758];
  uint64_t v10 = *MEMORY[0x263EFF688];
  v40[0] = *MEMORY[0x263EFF758];
  v40[1] = v10;
  uint64_t v28 = v10;
  v11 = objc_msgSend(v30, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v40, 2), 0, 0);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v12)
  {
    LOBYTE(v16) = 1;
    goto LABEL_28;
  }
  id obj = v11;
  uint64_t v13 = *(void *)v36;
  id v27 = a3;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v35 + 1) + 8 * v14);
      id v33 = 0;
      id v34 = 0;
      if ([v15 getResourceValue:&v34 forKey:v9 error:0]) {
        int v16 = [v15 getResourceValue:&v33 forKey:v28 error:0];
      }
      else {
        int v16 = 0;
      }
      if (a5) {
        uint64_t v17 = objc_msgSend(a5, "stringByAppendingPathComponent:", objc_msgSend(v34, "tsu_stringWithPathRelativeTo:", a3));
      }
      else {
        uint64_t v17 = objc_msgSend(v34, "tsu_stringWithPathRelativeTo:", objc_msgSend(a3, "stringByDeletingLastPathComponent"));
      }
      uint64_t v18 = v17;
      if ((v16 & 1) == 0)
      {
        LOBYTE(v16) = 0;
        goto LABEL_28;
      }
      char v32 = 0;
      if (([v30 fileExistsAtPath:v34 isDirectory:&v32] & 1) == 0)
      {
        uint64_t v23 = [NSString stringWithUTF8String:"+[OISFUZipArchiveOutputStream createZipWithItemsAtPath:zippedPath:rootPathComponentName:]"];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v23, v24, 181, 0, "Trying to add file that doesn't exist: %@", v34 file lineNumber isFatal description];
        +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_19:
        LOBYTE(v16) = 1;
        goto LABEL_20;
      }
      if (v32) {
        goto LABEL_19;
      }
      -[OISFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:](v7, "beginEntryWithName:isCompressed:uncompressedSize:", v18, 0, [v33 unsignedLongLongValue]);
      v19 = [OISFUFileDataRepresentation alloc];
      v20 = [(OISFUFileDataRepresentation *)v19 initWithPath:v34];
      id v21 = [(OISFUDataRepresentation *)v20 bufferedInputStream];
      while (1)
      {
        uint64_t v31 = 0;
        uint64_t v22 = [v21 readToOwnBuffer:&v31 size:0xFFFFFFFFLL];
        if (!v22) {
          break;
        }
        [(OISFUZipArchiveOutputStream *)v7 writeBuffer:v31 size:v22];
      }
      [v21 close];

      a3 = v27;
      if (!v16) {
        goto LABEL_28;
      }
LABEL_20:
      ++v14;
    }
    while (v14 != v12);
    uint64_t v25 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    uint64_t v12 = v25;
  }
  while (v25);
LABEL_28:
  [(OISFUZipArchiveOutputStream *)v7 close];

  return v16;
}

- (void)beginEntryWithName:(id)a3 isCompressed:(BOOL)a4 uncompressedSize:(unint64_t)a5
{
  BOOL v6 = a4;
  if (!self->mOutputStream)
  {
    uint64_t v9 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream beginEntryWithName:isCompressed:uncompressedSize:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 232, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [(OISFUZipArchiveOutputStream *)self finishEntry];
  if (self->mCryptoKey) {
    a5 = +[OISFUCryptoOutputStream encodedLengthForDataLength:key:](OISFUCryptoOutputStream, "encodedLengthForDataLength:key:", a5);
  }
  uint64_t v10 = objc_alloc_init(OISFUZipOutputEntry);
  self->mCurrentEntry = v10;
  [(NSMutableArray *)self->mEntries addObject:v10];

  self->mCurrentEntry->name = (NSString *)[a3 copy];
  self->mCurrentEntry->utf8NameLength = strlen((const char *)[a3 UTF8String]);
  self->mCurrentEntry->isCompressed = v6;
  self->mCurrentEntry->isEncrypted = self->mCryptoKey != 0;
  self->mCurrentEntry->time = SFUZipCurrentDosTime();
  self->mCurrentEntry->is64Bit = a5 > 0xFFC2F6FF;
  if (!v6 && [(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek])
  {
    mCurrentEntry = self->mCurrentEntry;
    uint64_t v12 = mCurrentEntry->utf8NameLength + 30;
    uint64_t v13 = mCurrentEntry->is64Bit ? 20 : 0;
    uint64_t v14 = v12 + v13;
    if (!__CFADD__(a5, v12 + v13))
    {
      uint64_t v15 = [(NSMutableArray *)self->mFreeList count];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        unint64_t v19 = v14 + a5;
        do
        {
          uint64_t v20 = [(NSMutableArray *)self->mFreeList objectAtIndex:v17];
          unint64_t v21 = *(void *)(v20 + 16);
          if (v21 == v19)
          {
            uint64_t v18 = (void *)v20;
            goto LABEL_22;
          }
          if (v21 >= v19 + 47 && (!v18 || v21 < v18[2])) {
            uint64_t v18 = (void *)v20;
          }
          ++v17;
        }
        while (v16 != v17);
        if (!v18) {
          goto LABEL_23;
        }
LABEL_22:
        [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v18[1] whence:0];
        self->mCurrentFreeSpace = (OISFUZipFreeSpaceEntry *)v18;
      }
    }
  }
LABEL_23:
  uint64_t v22 = self->mCurrentEntry;
  if (!self->mCurrentFreeSpace) {
    self->mLastEntryInFile = v22;
  }
  self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                            + [(OISFUZipArchiveOutputStream *)self writeLocalFileHeaderForEntry:v22];
  self->mCurrentEntry->crc = crc32(0, 0, 0);
  if (!self->mCurrentEntry->isEncrypted)
  {
    uint64_t v23 = self->mOutputStream;
    if (v6) {
      goto LABEL_27;
    }
LABEL_31:
    self->mEntryOutputStream = (SFUOutputStream *)v23;
    return;
  }
  uint64_t v23 = [[OISFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:self->mOutputStream key:self->mCryptoKey computeCrc32:1];
  if (!v6) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t v24 = v23;
  self->mEntryOutputStream = (SFUOutputStream *)[[OISFUZipDeflateOutputStream alloc] initWithOutputStream:v23];
}

- (void)beginUnknownSizeEntryWithName:(id)a3 isCompressed:(BOOL)a4
{
}

- (id)beginUncompressedUnknownSizeEntryWithName:(id)a3
{
  [(OISFUZipArchiveOutputStream *)self beginUnknownSizeEntryWithName:a3 isCompressed:0];
  self->mCurrentEntry->isWrittenDirectlyToFile = 1;
  v4 = [[OISFUOffsetOutputStream alloc] initWithOutputStream:self->mEntryOutputStream];
  if (self->mCurrentEntry->isEncrypted)
  {
    v5 = [[OISFUCryptoOutputStream alloc] initForEncryptionWithOutputStream:v4 key:self->mCryptoKey computeCrc32:1];

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
      uint64_t v7 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream writeBuffer:size:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 355, 0, "Zip output stream is closed.");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    [(SFUOutputStream *)self->mEntryOutputStream writeBuffer:a3 size:a4];
    self->mCurrentEntry->uncompressedSize += a4;
    mCurrentEntry = self->mCurrentEntry;
    if (!mCurrentEntry->isEncrypted)
    {
      if (a4 >= 0xFFFFFFFF)
      {
        uint64_t v9 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream writeBuffer:size:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 365, 0, "overflow in writeBuffer:");
        +[OITSUAssertionHandler logBacktraceThrottled];
        mCurrentEntry = self->mCurrentEntry;
      }
      self->mCurrentEntry->crc = crc32(mCurrentEntry->crc, (const Bytef *)a3, a4);
    }
  }
  else
  {
    +[OISFUZipException raise:@"SFUZipOutputError" format:@"-writeBuffer:size: called when current entry is nil"];
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
      uint64_t v9 = (OISFUZipOutputEntry *)v8;
    }
    else {
      uint64_t v9 = 0;
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
  uint64_t v12 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream canRemoveEntryWithName:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 382, 0, "Can't find entry named: %@", a3);
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (void)removeEntryWithName:(id)a3
{
  if (!self->mOutputStream)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream removeEntryWithName:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 390, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  mCurrentEntry = self->mCurrentEntry;
  if (mCurrentEntry && [(NSString *)mCurrentEntry->name isEqualToString:a3])
  {
    unint64_t v7 = self->mCurrentEntry;
    [(OISFUZipArchiveOutputStream *)self finishEntry];
  }
  else
  {
    uint64_t v8 = [(NSMutableArray *)self->mEntries count];
    if (!v8)
    {
LABEL_19:
      uint64_t v16 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream removeEntryWithName:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 407, 0, "Can't find entry named: %@", a3);
      +[OITSUAssertionHandler logBacktraceThrottled];
      return;
    }
    unint64_t v9 = v8;
    unint64_t v10 = 0;
    do
    {
      unint64_t v7 = (OISFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v10];
      if (![(NSString *)v7->name isEqualToString:a3]) {
        unint64_t v7 = 0;
      }
      ++v10;
      if (v7) {
        BOOL v11 = 1;
      }
      else {
        BOOL v11 = v10 >= v9;
      }
    }
    while (!v11);
  }
  if (!v7) {
    goto LABEL_19;
  }
  uint64_t v12 = v7;
  [(NSMutableArray *)self->mEntries removeObject:v7];
  if (v7 == self->mLastEntryInFile)
  {
    int64_t v17 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
    [(OISFUMoveableFileOutputStream *)self->mOutputStream truncateToLength:v7->offset];
    if (v17 < (int64_t)v7->offset) {
      [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v17 whence:0];
    }
    self->mLastEntryInFile = 0;
    uint64_t v18 = [(NSMutableArray *)self->mEntries count];
    if (!self->mLastEntryInFile && v18)
    {
      uint64_t v19 = v18 - 1;
      while (1)
      {
        uint64_t v20 = (OISFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v19];
        if (v20->compressedSize + v20->compressedDataOffset == v7->offset) {
          break;
        }
        BOOL v11 = v19-- != 0;
        char v21 = v11;
        if (self->mLastEntryInFile || (v21 & 1) == 0) {
          return;
        }
      }
      self->mLastEntryInFile = v20;
    }
  }
  else
  {
    uint64_t v13 = objc_alloc_init(OISFUZipFreeSpaceEntry);
    uint64_t v14 = v13;
    v13->offset = v7->offset;
    unint64_t v15 = v7->compressedDataOffset - v7->offset + v7->compressedSize;
    v13->length = v15;
    if (v15 >= 0x2F)
    {
      [(NSMutableArray *)self->mFreeList addObject:v13];

      self->mFreeBytes += v14->length;
    }
    else
    {

      +[OISFUZipException raise:@"SFUZipOutputError", @"Removing entry named %@ produced free space that is too small.", a3 format];
    }
  }
}

- (void)setEncryptedDocumentUuid:(id)a3
{
  if (!self->mOutputStream) {
    +[OISFUZipException raise:@"SFUZipOutputError" format:@"Tried to set encrypted document UUID after writing finished."];
  }
  id v5 = a3;

  self->mEncryptedDocumentUuid = (NSData *)a3;
}

- (void)close
{
  if (!self->mOutputStream)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream close]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 470, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [(OISFUZipArchiveOutputStream *)self finishEntry];
  uint64_t v4 = [(NSMutableArray *)self->mFreeList count];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = malloc_type_calloc(1uLL, 0x40000uLL, 0x47BEBE3DuLL);
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(NSMutableArray *)self->mFreeList objectAtIndex:v7];
      [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:*(void *)(v8 + 8) whence:0];
      unint64_t v9 = objc_alloc_init(OISFUZipOutputEntry);
      self->mCurrentEntry = v9;
      [(NSMutableArray *)self->mEntries addObject:v9];

      unint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @".iWTrash/%08X", ++v7);
      self->mCurrentEntry->name = (NSString *)[v10 copy];
      self->mCurrentEntry->utf8NameLength = strlen((const char *)[v10 UTF8String]);
      self->mCurrentEntry->isCompressed = 0;
      self->mCurrentEntry->isEncrypted = 0;
      self->mCurrentEntry->time = SFUZipCurrentDosTime();
      self->mCurrentEntry->compressedDataOffset = self->mCurrentEntry->offset
                                                + [(OISFUZipArchiveOutputStream *)self writeLocalFileHeaderForEntry:self->mCurrentEntry];
      self->mCurrentEntry->crc = crc32(0, 0, 0);
      self->mEntryOutputStream = (SFUOutputStream *)self->mOutputStream;
      for (unint64_t i = *(void *)(v8 + 16) - self->mCurrentEntry->compressedDataOffset + self->mCurrentEntry->offset; i; i -= v12)
      {
        if (i >= 0x40000) {
          uint64_t v12 = 0x40000;
        }
        else {
          uint64_t v12 = i;
        }
        [(OISFUZipArchiveOutputStream *)self writeBuffer:v6 size:v12];
      }
      [(OISFUZipArchiveOutputStream *)self finishEntry];
    }
    while (v7 != v5);
    if (v6) {
      free(v6);
    }
  }
  int64_t v13 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
  [(NSMutableArray *)self->mEntries sortUsingSelector:sel_compareByOffset_];
  uint64_t v14 = (void *)[(NSMutableArray *)self->mEntries objectEnumerator];
  uint64_t v15 = [v14 nextObject];
  if (v15) {
    [(OISFUZipArchiveOutputStream *)self writeCentralFileHeaderUsingEntry:v15 isFirstEntry:1];
  }
  uint64_t v16 = [v14 nextObject];
  if (v16)
  {
    uint64_t v17 = v16;
    do
    {
      [(OISFUZipArchiveOutputStream *)self writeCentralFileHeaderUsingEntry:v17 isFirstEntry:0];
      uint64_t v17 = [v14 nextObject];
    }
    while (v17);
  }
  [(OISFUZipArchiveOutputStream *)self writeEndOfCentralDirectoryWithOffset:v13];

  self->mOutputStream = 0;
}

- (void)moveToPath:(id)a3
{
  if (!self->mOutputStream)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream moveToPath:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 545, 0, "Zip output stream is closed.");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  [(OISFUZipArchiveOutputStream *)self finishEntry];
  id v6 = [(OISFUMoveableFileOutputStream *)self->mOutputStream path];
  if (![(OISFUMoveableFileOutputStream *)self->mOutputStream moveToPath:a3]) {
    +[OISFUZipException raise:@"SFUZipOutputError", @"Could not move output stream from %@ to %@", v6, a3 format];
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
  uint64_t v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", -[NSMutableArray count](self->mEntries, "count"));
  id v6 = [[OISFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
  uint64_t v7 = (void *)[(NSMutableArray *)self->mEntries objectEnumerator];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v9 = v8;
    do
    {
      unint64_t v10 = [[OISFUZipEntry alloc] initWithDataRepresentation:v6 compressionMethod:*(unsigned __int8 *)(v9 + 24) compressedSize:*(void *)(v9 + 32) uncompressedSize:*(void *)(v9 + 40) offset:*(void *)(v9 + 48) crc:*(unsigned int *)(v9 + 64)];
      BOOL v11 = v10;
      if (*(unsigned char *)(v9 + 25)) {
        [(OISFUZipEntry *)v10 setCryptoKey:self->mCryptoKey];
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
  [(OISFUMoveableFileOutputStream *)mOutputStream truncateToLength:0];
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
        unint64_t v10 = *(OISFUZipOutputEntry **)(*((void *)&v12 + 1) + 8 * v9);
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
        uint64_t v5 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream(Private) finishEntry]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 659, 0, "Wrong output stream for compressed entry.");
        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      mEntryOutputStream = (SFUOutputStream *)[(SFUOutputStream *)self->mEntryOutputStream closeLocalStream];
      mCurrentEntry = self->mCurrentEntry;
    }
    if (mCurrentEntry->isEncrypted)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v6 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream(Private) finishEntry]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 667, 0, "Wrong output stream type for encrypted entry.");
        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      [(SFUOutputStream *)mEntryOutputStream closeLocalStream];
      self->mCurrentEntry->crc = [(SFUOutputStream *)mEntryOutputStream crc32];
    }

    self->mEntryOutputStream = 0;
    self->mCurrentEntry->unint64_t compressedSize = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset]
                                        - self->mCurrentEntry->compressedDataOffset;
    uint64_t v7 = self->mCurrentEntry;
    if (v7->isWrittenDirectlyToFile)
    {
      v7->ununint64_t compressedSize = v7->compressedSize;
      if (!self->mCurrentEntry->crc)
      {
        if (![(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
          +[OISFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but output stream cannot be seeked for CRC calculation."];
        }
        if (![(OISFUMoveableFileOutputStream *)self->mOutputStream canCreateInputStream]) {
          +[OISFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but output stream cannot be read for CRC calculation."];
        }
        uint64_t v8 = [[OISFUBufferedInputStream alloc] initWithStream:[(OISFUMoveableFileOutputStream *)self->mOutputStream inputStream]];
        if (![(OISFUBufferedInputStream *)v8 canSeek])
        {
          [(OISFUBufferedInputStream *)v8 close];

          +[OISFUZipException raise:@"SFUZipOutputError" format:@"Entry written directly to seekable output stream, but input stream cannot be seeked for CRC calculation."];
          uint64_t v8 = 0;
        }
        [(OISFUBufferedInputStream *)v8 seekToOffset:self->mCurrentEntry->compressedDataOffset];
        buf = 0;
        uint64_t v9 = [(OISFUBufferedInputStream *)v8 readToOwnBuffer:&buf size:0xFFFFFFFFLL];
        if (v9)
        {
          LODWORD(v10) = v9;
          do
          {
            self->mCurrentEntry->crc = crc32(self->mCurrentEntry->crc, buf, v10);
            buf = 0;
            uint64_t v10 = [(OISFUBufferedInputStream *)v8 readToOwnBuffer:&buf size:0xFFFFFFFFLL];
          }
          while (v10);
        }
        [(OISFUBufferedInputStream *)v8 close];
      }
    }
    if (![(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek])
    {
      mBuffer = self->mBuffer;
      *(_DWORD *)mBuffer = *(_DWORD *)"PK\a\b";
      *((_DWORD *)mBuffer + 1) = self->mCurrentEntry->crc;
      uint64_t v18 = self->mCurrentEntry;
      BOOL is64Bit = v18->is64Bit;
      unint64_t compressedSize = v18->compressedSize;
      if (is64Bit)
      {
        *((void *)mBuffer + 1) = compressedSize;
        *((void *)mBuffer + 2) = self->mCurrentEntry->uncompressedSize;
        uint64_t v21 = 24;
      }
      else
      {
        *((_DWORD *)mBuffer + 2) = compressedSize;
        *((_DWORD *)mBuffer + 3) = self->mCurrentEntry->uncompressedSize;
        uint64_t v21 = 16;
      }
      [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:&mBuffer[v21] - self->mBuffer];
      goto LABEL_50;
    }
    if (self->mCurrentFreeSpace)
    {
      int64_t v11 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
      long long v12 = self->mCurrentEntry;
      unint64_t v13 = v11 - v12->offset;
      mCurrentFreeSpace = self->mCurrentFreeSpace;
      unint64_t length = mCurrentFreeSpace->length;
      if (v13 > length)
      {
        +[OISFUZipException raise:@"SFUZipOutputError", @"Wrote more bytes than we had allocated for file %@", v12->name format];
        mCurrentFreeSpace = self->mCurrentFreeSpace;
        unint64_t length = mCurrentFreeSpace->length;
      }
      unint64_t v16 = length - v13;
      if ((uint64_t)(length - v13) < 1)
      {
        -[NSMutableArray removeObject:](self->mFreeList, "removeObject:");
      }
      else
      {
        if (v16 < 0x2F)
        {
          +[OISFUZipException raise:@"SFUZipOutputError", @"Wrote more bytes than we had allocated for file %@", self->mCurrentEntry->name format];
          mCurrentFreeSpace = self->mCurrentFreeSpace;
        }
        mCurrentFreeSpace->offset += v13;
        self->mCurrentFreeSpace->unint64_t length = v16;
      }
      uint64_t v22 = self->mCurrentFreeSpace;
      self->mFreeBytes -= v13;

      self->mCurrentFreeSpace = 0;
    }
    uint64_t v23 = self->mBuffer;
    uint64_t v24 = self->mCurrentEntry;
    unint64_t v26 = v24->compressedSize;
    ununint64_t compressedSize = v24->uncompressedSize;
    *(_DWORD *)uint64_t v23 = v24->crc;
    unint64_t v27 = HIDWORD(v26);
    if (HIDWORD(v26)) {
      int v28 = -1;
    }
    else {
      int v28 = self->mCurrentEntry->compressedSize;
    }
    *((_DWORD *)v23 + 1) = v28;
    unint64_t v29 = HIDWORD(uncompressedSize);
    if (HIDWORD(uncompressedSize))
    {
      *((_DWORD *)v23 + 2) = -1;
      [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:self->mCurrentEntry->offset + 14 whence:0];
      [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:12];
    }
    else
    {
      *((_DWORD *)v23 + 2) = self->mCurrentEntry->uncompressedSize;
      [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:self->mCurrentEntry->offset + 14 whence:0];
      [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:12];
      if (!v27)
      {
LABEL_49:
        [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:0 whence:2];
LABEL_50:
        self->mCurrentEntry = 0;
        [(OISFUZipArchiveOutputStream *)self coalesceAndTruncateFreeSpace];
        return;
      }
    }
    v30 = self->mCurrentEntry;
    if (!v30->is64Bit)
    {
      uint64_t v31 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream(Private) finishEntry]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"], 776, 0, "Wrote a zip entry that needs 64 bit sizes, but didn't create 64 bit field.");
      +[OITSUAssertionHandler logBacktraceThrottled];
      v30 = self->mCurrentEntry;
    }
    char v32 = self->mBuffer;
    if (v29)
    {
      *(void *)char v32 = v30->uncompressedSize;
      v32 += 8;
      v30 = self->mCurrentEntry;
    }
    if (v27)
    {
      *(void *)char v32 = v30->compressedSize;
      v32 += 8;
      v30 = self->mCurrentEntry;
    }
    [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:v30->offset + v30->utf8NameLength + 34 whence:0];
    [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:v32 - self->mBuffer];
    goto LABEL_49;
  }
}

- (void)coalesceAndTruncateFreeSpace
{
  if (!self->mCurrentEntry
    || (uint64_t v3 = [NSString stringWithUTF8String:"-[OISFUZipArchiveOutputStream(Private) coalesceAndTruncateFreeSpace]"], +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchiveOutputStream.m"), 820, 0, "-coalesceAndTruncateFreeSpace should not be called while an entry is being written to"), +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled"), !self->mCurrentEntry))
  {
    if ([(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek]
      && [(NSMutableArray *)self->mFreeList count])
    {
      [(NSMutableArray *)self->mFreeList sortUsingSelector:sel_compareByOffset_];
      unint64_t v4 = [(NSMutableArray *)self->mFreeList count];
      if (v4 >= 2)
      {
        unint64_t v5 = v4;
        uint64_t v6 = 0;
        for (uint64_t i = 1; i != v5; ++i)
        {
          uint64_t v8 = [(NSMutableArray *)self->mFreeList objectAtIndex:i];
          if (v6
            && (uint64_t v9 = [(NSMutableArray *)v6 lastObject]) != 0
            && (uint64_t v10 = *(void *)(v9 + 16), *(void *)(v8 + 8) - v10 == *(void *)(v9 + 8)))
          {
            *(void *)(v9 + 16) = *(void *)(v8 + 16) + v10;
          }
          else
          {
            uint64_t v11 = [(NSMutableArray *)self->mFreeList objectAtIndex:i - 1];
            uint64_t v12 = *(void *)(v11 + 16);
            if (*(void *)(v8 + 8) - v12 == *(void *)(v11 + 8))
            {
              uint64_t v13 = v11;
              if (!v6)
              {
                uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
                uint64_t v12 = *(void *)(v13 + 16);
              }
              *(void *)(v13 + 16) = v12 + *(void *)(v8 + 16);
              [(NSMutableArray *)v6 addObject:v13];
            }
          }
        }
        if (v6)
        {

          self->mFreeList = v6;
        }
      }
      [(OISFUMoveableFileOutputStream *)self->mOutputStream seekToOffset:0 whence:2];
      int64_t v14 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
      uint64_t v15 = [(NSMutableArray *)self->mFreeList lastObject];
      if (v14 - *(void *)(v15 + 16) == *(void *)(v15 + 8))
      {
        uint64_t v16 = v15;
        -[OISFUMoveableFileOutputStream truncateToLength:](self->mOutputStream, "truncateToLength:");
        self->mFreeBytes -= *(void *)(v16 + 16);
        [(NSMutableArray *)self->mFreeList removeLastObject];
        if (!self->mLastEntryInFile)
        {
          uint64_t v17 = [(NSMutableArray *)self->mEntries count];
          if (!self->mLastEntryInFile)
          {
            if (v17)
            {
              uint64_t v18 = v17 - 1;
              while (1)
              {
                uint64_t v19 = (OISFUZipOutputEntry *)[(NSMutableArray *)self->mEntries objectAtIndex:v18];
                if (v19->compressedSize + v19->compressedDataOffset == *(void *)(v16 + 8)) {
                  break;
                }
                BOOL v21 = v18-- != 0;
                if (self->mLastEntryInFile || !v21) {
                  return;
                }
              }
              self->mLastEntryInFile = v19;
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
  if ([(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
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
    +[OISFUZipException raise:@"SFUZipOutputError", @"File name %@ is too long", *((void *)a3 + 1) format];
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
  *((void *)a3 + 6) = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
  [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:30];
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [*((id *)a3 + 1) UTF8String], *((void *)a3 + 2));
  if (*((unsigned char *)a3 + 69))
  {
    uint64_t v11 = self->mBuffer;
    *(_DWORD *)uint64_t v11 = 1048577;
    *(void *)(v11 + 12) = 0;
    *(void *)(v11 + 4) = 0;
    [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:20];
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
  if ([(OISFUMoveableFileOutputStream *)self->mOutputStream canSeek]) {
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
    id v25 = +[OISFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:](OISFUCryptoUtils, "generatePassphraseVerifierForKey:verifierVersion:");
    v23 += [v25 length] + 8;
    mPassphraseHint = self->mPassphraseHint;
    long long v38 = mPassphraseHint;
    if (mPassphraseHint) {
      v23 += [(NSData *)mPassphraseHint length] + 8;
    }
    mEncryptedDocumentUuid = self->mEncryptedDocumentUuid;
    if (mEncryptedDocumentUuid)
    {
      int v28 = self->mEncryptedDocumentUuid;
      LOWORD(v23) = v23 + [(NSData *)mEncryptedDocumentUuid length] + 8;
      goto LABEL_37;
    }
  }
  else
  {
    id v25 = 0;
    long long v38 = 0;
  }
  int v28 = 0;
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
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", self->mBuffer, 46, v38);
  -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [*((id *)a3 + 1) UTF8String], *((void *)a3 + 2));
  if (!v20) {
    goto LABEL_49;
  }
  v30 = self->mBuffer;
  *(_WORD *)v30 = 1;
  *((_WORD *)v30 + 1) = v40;
  if (v16)
  {
    *(void *)(v30 + 4) = *((void *)a3 + 5);
    uint64_t v31 = v30 + 12;
    if (!v14) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
  uint64_t v31 = v30 + 4;
  if (v14)
  {
LABEL_45:
    *(void *)uint64_t v31 = *((void *)a3 + 4);
    v31 += 8;
  }
LABEL_46:
  if (v21)
  {
    *(void *)uint64_t v31 = *((void *)a3 + 6);
    v31 += 8;
  }
  [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:v31 - self->mBuffer];
LABEL_49:
  if (self->mCryptoKey && v41)
  {
    char v32 = self->mBuffer;
    *(_WORD *)char v32 = 25453;
    *((_WORD *)v32 + 1) = [v25 length] + 4;
    *((_DWORD *)v32 + 1) = 1987082089;
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
    -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [v25 bytes], objc_msgSend(v25, "length"));
    if (v39)
    {
      id v33 = self->mBuffer;
      *(_WORD *)id v33 = 25454;
      *((_WORD *)v33 + 1) = [v39 length] + 4;
      *((_DWORD *)v33 + 1) = 1752201065;
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:", [v39 bytes], objc_msgSend(v39, "length"));
    }
    if (v28)
    {
      id v34 = self->mBuffer;
      *(_WORD *)id v34 = 25455;
      *((_WORD *)v34 + 1) = [(NSData *)v28 length] + 4;
      *((_DWORD *)v34 + 1) = *(_DWORD *)"iwuu";
      -[OISFUMoveableFileOutputStream writeBuffer:size:](self->mOutputStream, "writeBuffer:size:");
      mOutputStream = self->mOutputStream;
      uint64_t v36 = [(NSData *)v28 bytes];
      uint64_t v37 = [(NSData *)v28 length];
      [(OISFUMoveableFileOutputStream *)mOutputStream writeBuffer:v36 size:v37];
    }
  }
}

- (void)writeEndOfCentralDirectoryWithOffset:(int64_t)a3
{
  unint64_t v5 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset] - a3;
  unint64_t v6 = [(NSMutableArray *)self->mEntries count];
  unint64_t v7 = v6;
  if (a3 > 0xFFFFFFFFLL || (!(v6 >> 16) ? (BOOL v8 = HIDWORD(v5) == 0) : (BOOL v8 = 0), !v8))
  {
    int64_t v9 = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset];
    [(OISFUZipArchiveOutputStream *)self writeZip64EndOfCentralDirectoryWithOffset:a3];
    [(OISFUZipArchiveOutputStream *)self writeZip64EndOfCentralDirectoryLocatorWithOffset:v9];
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
  [(OISFUMoveableFileOutputStream *)mOutputStream writeBuffer:v15 size:22];
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
  *((void *)mBuffer + 5) = [(OISFUMoveableFileOutputStream *)self->mOutputStream offset] - a3;
  *((void *)mBuffer + 6) = a3;
  mOutputStream = self->mOutputStream;
  BOOL v8 = self->mBuffer;
  [(OISFUMoveableFileOutputStream *)mOutputStream writeBuffer:v8 size:56];
}

- (void)writeZip64EndOfCentralDirectoryLocatorWithOffset:(int64_t)a3
{
  mBuffer = self->mBuffer;
  *(_DWORD *)mBuffer = 117853008;
  *((_DWORD *)mBuffer + 1) = 0;
  *((void *)mBuffer + 1) = a3;
  *((_DWORD *)mBuffer + 4) = 1;
  [(OISFUMoveableFileOutputStream *)self->mOutputStream writeBuffer:self->mBuffer size:20];
}

@end