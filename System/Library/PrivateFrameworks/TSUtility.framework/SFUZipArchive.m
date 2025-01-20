@interface SFUZipArchive
+ (BOOL)isZipArchiveAtPath:(id)a3;
- (BOOL)decompressAtPath:(id)a3;
- (BOOL)isEncrypted;
- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (SFUZipArchiveDelegate)delegate;
- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3;
- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 eocdOffset:(id)a4;
- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 offset:(id)a4;
- (const)searchForEndOfCentralDirectoryFromInputStream:(id)a3 offset:(int64_t *)a4;
- (id)allEntryNames;
- (id)encryptedDocumentUuid;
- (id)entryWithName:(id)a3;
- (id)entryWithName:(id)a3 dataLength:(int64_t)a4;
- (id)passphraseHint;
- (id)passphraseVerifier;
- (id)readFilenameFromBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)collapseCommonRootDirectory;
- (void)dealloc;
- (void)readEntries;
- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5;
- (void)setCryptoKey:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SFUZipArchive

+ (BOOL)isZipArchiveAtPath:(id)a3
{
  v3 = [[SFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
  id v4 = [(SFUZipArchiveFileDataRepresentation *)v3 inputStream];
  BOOL v6 = [v4 readToBuffer:&v8 size:4] == 4 && v8 == 67324752;
  [v4 close];

  return v6;
}

- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(SFUZipArchive *)self init];
  if (v6)
  {
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[SFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
    [(SFUZipArchive *)v6 readEntries];
    if (v4) {
      [(SFUZipArchive *)v6 collapseCommonRootDirectory];
    }
  }
  return v6;
}

- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(SFUZipArchive *)self init];
  if (v6)
  {
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[SFUZipArchiveMemoryDataRepresentation alloc] initWithData:a3];
    [(SFUZipArchive *)v6 readEntries];
    if (v4) {
      [(SFUZipArchive *)v6 collapseCommonRootDirectory];
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchive;
  [(SFUZipArchive *)&v3 dealloc];
}

- (id)entryWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->mEntries objectForKey:a3];
}

- (id)entryWithName:(id)a3 dataLength:(int64_t)a4
{
  id v5 = [(SFUZipArchive *)self entryWithName:a3];
  BOOL v6 = v5;
  if (v5) {
    [v5 setDataLength:a4];
  }
  return v6;
}

- (id)allEntryNames
{
  return (id)[(NSMutableDictionary *)self->mEntries allKeys];
}

- (BOOL)isEncrypted
{
  return self->mPassphraseVerifier != 0;
}

- (id)passphraseVerifier
{
  return self->mPassphraseVerifier;
}

- (id)passphraseHint
{
  return self->mPassphraseHint;
}

- (id)encryptedDocumentUuid
{
  return self->mEncryptedDocumentUuid;
}

- (void)setCryptoKey:(id)a3
{
  id v5 = a3;

  self->mCryptoKey = (SFUCryptoKey *)a3;
  BOOL v6 = (void *)[(NSMutableDictionary *)self->mEntries allValues];
  mCryptoKey = self->mCryptoKey;
  [v6 makeObjectsPerformSelector:sel_setCryptoKey_ withObject:mCryptoKey];
}

- (BOOL)decompressAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = (void *)[MEMORY[0x263F08850] defaultManager];
  char v24 = 0;
  if ([v5 fileExistsAtPath:a3 isDirectory:&v24])
  {
    if (!v24)
    {
      id v6 = +[TSUAssertionHandler currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[SFUZipArchive decompressAtPath:]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 231, @"Can only decompress into a directory");
      return 0;
    }
  }
  else if (([v5 createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
  {
    id v17 = +[TSUAssertionHandler currentHandler];
    uint64_t v18 = [NSString stringWithUTF8String:"-[SFUZipArchive decompressAtPath:]"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 226, @"Can't create output directory");
    return 0;
  }
  int v8 = objc_msgSend(-[SFUZipArchive allEntryNames](self, "allEntryNames"), "sortedArrayUsingSelector:", sel_compare_);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (!v9) {
    return 1;
  }
  uint64_t v10 = *(void *)v21;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v8);
      }
      v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      uint64_t v13 = [v12 length];
      v14 = (void *)[a3 stringByAppendingPathComponent:v12];
      if ([v12 characterAtIndex:v13 - 1] == 47)
      {
        char v15 = [v5 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];
      }
      else
      {
        char v15 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v14, "stringByDeletingLastPathComponent"), 1, 0, 0);
        id v16 = [(SFUZipArchive *)self entryWithName:v12];
        [v16 copyToFile:v14];
        [(SFUZipArchiveDelegate *)[(SFUZipArchive *)self delegate] zipArchiveDidDecompressEntry:v16];
      }
    }
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  }
  while (v9);
  return v15;
}

- (SFUZipArchiveDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SFUZipArchiveDelegate *)a3;
}

- (void)readEntries
{
  id v3 = objc_alloc_init(MEMORY[0x263F086B0]);
  [[SFUZipRecordInputStream alloc] initWithDataRepresentation:self->mDataRepresentation];
  -[SFUZipArchive readEndOfCentralDirectoryFromInputStream:](self, "readEndOfCentralDirectoryFromInputStream:");
}

- (void)collapseCommonRootDirectory
{
  id v20 = objc_alloc_init(MEMORY[0x263F086B0]);
  id v3 = [(SFUZipArchive *)self allEntryNames];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      int v8 = objc_msgSend((id)objc_msgSend(v3, "objectAtIndex:", v7), "pathComponents");
      if ((unint64_t)[v8 count] < 2
        || (objc_msgSend((id)objc_msgSend(v8, "objectAtIndex:", 0), "isEqualToString:", @"__MACOSX") & 1) == 0)
      {
        if (v6)
        {
          unint64_t v9 = 0;
          if ([v6 count])
          {
            do
            {
              if (v9 >= [v8 count]) {
                break;
              }
              if (!objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", v9), "isEqualToString:", objc_msgSend(v8, "objectAtIndexedSubscript:", v9)))break; {
              ++v9;
              }
            }
            while (v9 < [v6 count]);
            if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          if (v9 != [v6 count] + 1) {
            objc_msgSend(v6, "removeObjectsInRange:", v9, objc_msgSend(v6, "count") - v9);
          }
        }
        else
        {
          id v6 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v8];
          [v6 removeLastObject];
        }
      }
      if (++v7 == v5) {
        goto LABEL_17;
      }
    }
  }
  id v6 = 0;
LABEL_17:
  if ([v6 count]) {
    id v10 = (id)[NSString pathWithComponents:v6];
  }
  else {
    id v10 = 0;
  }

  id v11 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (v10)
  {
    id v21 = v11;
    v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    uint64_t v13 = [v10 length];
    id v14 = [(SFUZipArchive *)self allEntryNames];
    uint64_t v15 = [v14 count];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = v13 + 1;
      do
      {
        v19 = (void *)[v14 objectAtIndex:v17];
        if ([v19 length] != v18 && (objc_msgSend(v19, "hasPrefix:", @"__MACOSX") & 1) == 0) {
          -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", -[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", v19), [v19 substringFromIndex:v18]);
        }
        ++v17;
      }
      while (v16 != v17);
    }

    self->mEntries = v12;
    id v11 = v21;
  }
}

- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3
{
  uint64_t v16 = [(SFUZipArchiveDataRepresentation *)self->mDataRepresentation dataLength] - 22;
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:");
  int v8 = (SFUZipEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    result = [(SFUZipArchive *)self searchForEndOfCentralDirectoryFromInputStream:a4 offset:&v16];
    int v8 = result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  if (LOWORD(v8->var0) | WORD1(v8->var0)) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  unint64_t var0_high = HIWORD(v8->var0);
  int64_t var1_low = LODWORD(v8->var1);
  int64_t var1_high = HIDWORD(v8->var1);
  retstr->var0 = var0_high;
  retstr->var1 = var1_low;
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || var1_low == -1 || var1_high == -1)
  {
    long long v14 = 0uLL;
    int64_t v15 = 0;
    result = [(SFUZipArchive *)self readZip64EndOfCentralDirectoryFromInputStream:a4 eocdOffset:v16];
    if (*((void *)&v14 + 1))
    {
      *(_OWORD *)&retstr->var0 = v14;
      retstr->var2 = v15;
    }
  }
  return result;
}

- (const)searchForEndOfCentralDirectoryFromInputStream:(id)a3 offset:(int64_t *)a4
{
  unint64_t v6 = [(SFUZipArchiveDataRepresentation *)self->mDataRepresentation dataLength];
  if (v6 <= 0x10015) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 65557;
  }
  unint64_t v8 = v6 - v7;
  unint64_t v9 = [a3 dataAtOffset:v6 - v7 size:v7 end:v6];
  unint64_t v10 = v7 & 0x3FF | 0x400;
  if (v10 >= v7) {
    unint64_t v10 = v7;
  }
  id v11 = (char *)(v9 + v7 - v10);
  if ((unint64_t)v11 >= v9)
  {
    unint64_t v13 = v9;
    uint64_t v14 = v10 - 21;
    do
    {
      if (v14 >= 1)
      {
        unint64_t v15 = (unint64_t)&v11[v14];
        uint64_t v16 = v11;
        do
        {
          uint64_t v17 = memchr(v16, 80, v15 - (void)v16);
          uint64_t v18 = (unsigned char *)v15;
          if (v17)
          {
            if (v17[1] == 75 && v17[2] == 5)
            {
              uint64_t v18 = v17;
              if (v17[3] == 6)
              {
                v12 = v17 + 4;
                *a4 = (int64_t)&v17[v8 - v13];
                return v12;
              }
            }
            else
            {
              uint64_t v18 = v17;
            }
          }
          uint64_t v16 = v18 + 4;
        }
        while ((unint64_t)(v18 + 4) < v15);
      }
      v11 -= 1024;
      uint64_t v14 = 1024;
    }
    while ((unint64_t)v11 >= v13);
  }
  +[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Could not find the end of central directory record"];
  return 0;
}

- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 eocdOffset:(id)a4
{
  int64_t v8 = a5 - 20;
  if ((unint64_t)a5 < 0x14) {
    +[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"File isn't long enough for Zip64 locator"];
  }
  result = (SFUZipEndOfCentralDirectory *)[a4 dataAtOffset:v8 size:20 end:0];
  unint64_t v10 = result;
  if (LODWORD(result->var0) != 117853008) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Zip64 end of central directory locator record signature not found"];
  }
  if (HIDWORD(v10->var0)) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  int64_t var1 = v10->var1;
  if (LODWORD(v10->var2) != 1) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  if (self)
  {
    return [(SFUZipArchive *)self readZip64EndOfCentralDirectoryFromInputStream:a4 offset:var1];
  }
  else
  {
    retstr->var0 = 0;
    retstr->int64_t var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 offset:(id)a4
{
  result = (SFUZipEndOfCentralDirectory *)[a4 dataAtOffset:a5 size:56 end:0];
  unint64_t v7 = result;
  if (LODWORD(result->var0) != 101075792) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Zip64 end of central directory record signature not found"];
  }
  if (LODWORD(v7->var2)) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  if (HIDWORD(v7->var2)) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v7[1].var1;
  retstr->var2 = v7[2].var0;
  return result;
}

- (id)readFilenameFromBuffer:(const char *)a3 size:(unint64_t)a4
{
  id result = (id)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
  if (!result)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    id result = (id)[[NSString alloc] initWithBytes:a3 length:a4 encoding:CFStringConvertEncodingToNSStringEncoding(SystemEncoding)];
    if (!result)
    {
      +[SFUZipException raise:@"SFUZipFilenameError" format:@"Could not read filename."];
      return 0;
    }
  }
  return result;
}

- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5
{
  if ((uint64_t)a4 >= 4)
  {
    uint64_t v17 = v5;
    uint64_t v18 = v6;
    unint64_t v9 = &a3[a4];
    qmemcpy(v16, "iwphiwuu", sizeof(v16));
    do
    {
      uint64_t v10 = *((unsigned __int16 *)a3 + 1);
      id v11 = a3 + 4;
      v12 = &a3[v10 + 4];
      if (v12 > v9) {
        break;
      }
      unsigned int v13 = *(unsigned __int16 *)a3;
      if (v13 > 0x636D)
      {
        if (v13 == 25454)
        {
          BOOL v14 = v10 >= 4 && self->mPassphraseHint == 0;
          if (v14 && *(_DWORD *)v11 == v16[0])
          {
            unint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 8 length:(v10 - 4)];
            self->mPassphraseHint = (NSString *)+[SFUCryptoUtils decodePassphraseHint:v15];
          }
        }
        else if (v13 == 25455 && v10 >= 4 && !self->mEncryptedDocumentUuid && *(_DWORD *)v11 == v16[1])
        {
          self->mEncryptedDocumentUuid = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 8 length:(v10 - 4)];
        }
      }
      else if (v13 == 1)
      {
        objc_msgSend(a5, "readZip64ExtraField:size:", a3 + 4);
      }
      else if (v13 == 25453 && v10 >= 4 && !self->mPassphraseVerifier && *(_DWORD *)v11 == 1987082089)
      {
        self->mPassphraseVerifier = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:a3 + 8 length:(v10 - 4)];
      }
      a3 = v12;
    }
    while (v12 + 4 <= v9);
  }
}

@end