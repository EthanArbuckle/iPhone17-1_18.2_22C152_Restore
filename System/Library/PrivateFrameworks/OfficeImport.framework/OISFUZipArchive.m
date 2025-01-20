@interface OISFUZipArchive
+ (BOOL)isZipArchiveAtPath:(id)a3;
- (BOOL)decompressAtPath:(id)a3;
- (BOOL)decompressAtPath:(id)a3 wasEmpty:(BOOL *)a4;
- (BOOL)isEncrypted;
- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5;
- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5;
- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3;
- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 eocdOffset:(id)a4;
- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 offset:(id)a4;
- (const)searchForEndOfCentralDirectoryFromInputStream:(id)a3 offset:(int64_t *)a4;
- (id)allEntryNames;
- (id)commonRootDirectoryIgnoringCase:(BOOL)a3;
- (id)encryptedDocumentUuid;
- (id)entryWithName:(id)a3;
- (id)entryWithName:(id)a3 dataLength:(int64_t)a4;
- (id)passphraseHint;
- (id)passphraseVerifier;
- (id)readFilenameFromBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)collapseCommonRootDirectoryIgnoreCase:(BOOL)a3;
- (void)dealloc;
- (void)readEntries;
- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5;
- (void)setCryptoKey:(id)a3;
@end

@implementation OISFUZipArchive

+ (BOOL)isZipArchiveAtPath:(id)a3
{
  v3 = [[OISFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
  id v4 = [(OISFUZipArchiveFileDataRepresentation *)v3 inputStream];
  BOOL v6 = [v4 readToBuffer:&v8 size:4] == 4 && v8 == 67324752;
  [v4 close];

  return v6;
}

os_log_t __38__OISFUZipArchive_isZipArchiveAtPath___block_invoke()
{
  os_log_t result = TSULogCreateCategory("TSUErrorCat");
  TSUErrorCat_log_t = (uint64_t)result;
  return result;
}

- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return [(OISFUZipArchive *)self initWithPath:a3 collapseCommonRootDirectory:a4 ignoreCase:0];
}

- (OISFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v8 = [(OISFUZipArchive *)self init];
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[OISFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
    [(OISFUZipArchive *)v8 readEntries];
    if (v6) {
      [(OISFUZipArchive *)v8 collapseCommonRootDirectoryIgnoreCase:v5];
    }
  }
  return v8;
}

- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return [(OISFUZipArchive *)self initWithData:a3 collapseCommonRootDirectory:a4 ignoreCase:0];
}

- (OISFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v8 = [(OISFUZipArchive *)self init];
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[OISFUZipArchiveMemoryDataRepresentation alloc] initWithData:a3];
    [(OISFUZipArchive *)v8 readEntries];
    if (v6) {
      [(OISFUZipArchive *)v8 collapseCommonRootDirectoryIgnoreCase:v5];
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipArchive;
  [(OISFUZipArchive *)&v3 dealloc];
}

- (id)entryWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->mEntries objectForKey:a3];
}

- (id)entryWithName:(id)a3 dataLength:(int64_t)a4
{
  id v5 = [(OISFUZipArchive *)self entryWithName:a3];
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

  self->mCryptoKey = (OISFUCryptoKey *)a3;
  BOOL v6 = (void *)[(NSMutableDictionary *)self->mEntries allValues];
  mCryptoKey = self->mCryptoKey;
  [v6 makeObjectsPerformSelector:sel_setCryptoKey_ withObject:mCryptoKey];
}

- (BOOL)decompressAtPath:(id)a3
{
  return [(OISFUZipArchive *)self decompressAtPath:a3 wasEmpty:0];
}

- (BOOL)decompressAtPath:(id)a3 wasEmpty:(BOOL *)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v6 = (void *)[MEMORY[0x263F08850] defaultManager];
  char v26 = 0;
  v20 = a4;
  if ([v6 fileExistsAtPath:a3 isDirectory:&v26])
  {
    if (!v26)
    {
      uint64_t v7 = [NSString stringWithUTF8String:"-[OISFUZipArchive decompressAtPath:wasEmpty:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"], 224, 0, "Can only decompress into a directory");
      +[OITSUAssertionHandler logBacktraceThrottled];
LABEL_19:
      char v18 = 0;
      char v16 = 0;
      goto LABEL_22;
    }
  }
  else if (([v6 createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)
  {
    uint64_t v17 = [NSString stringWithUTF8String:"-[OISFUZipArchive decompressAtPath:wasEmpty:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"], 221, 0, "Can't create output directory");
    +[OITSUAssertionHandler logBacktraceThrottled];
    goto LABEL_19;
  }
  int v8 = objc_msgSend(-[OISFUZipArchive allEntryNames](self, "allEntryNames", a4), "sortedArrayUsingSelector:", sel_compare_);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v9 = 0;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 length];
        v15 = (void *)[a3 stringByAppendingPathComponent:v13];
        if ([v13 characterAtIndex:v14 - 1] == 47)
        {
          char v16 = [v6 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];
        }
        else
        {
          char v16 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(v15, "stringByDeletingLastPathComponent"), 1, 0, 0);
          objc_msgSend(-[OISFUZipArchive entryWithName:](self, "entryWithName:", v13), "copyToFile:", v15);
          if ((v9 & 1) == 0 && ![v13 hasPrefix:@"."]) {
            char v9 = 1;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }
  else
  {
    char v16 = 1;
  }
  char v18 = v9;
LABEL_22:
  if (v20) {
    BOOL *v20 = v18 ^ 1;
  }
  return v16;
}

- (id)commonRootDirectoryIgnoringCase:(BOOL)a3
{
  BOOL v3 = a3;
  context = (void *)MEMORY[0x23EC9A170](self, a2);
  id v5 = [(OISFUZipArchive *)self allEntryNames];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = v3 | 2;
    while (1)
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v9), "pathComponents");
      if ((unint64_t)[v11 count] < 2
        || (objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", @"__MACOSX") & 1) == 0)
      {
        if (v8)
        {
          unint64_t v12 = 0;
          if ([v8 count])
          {
            do
            {
              if (v12 >= [v11 count]) {
                break;
              }
              if (objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v12), "compare:options:", objc_msgSend(v11, "objectAtIndexedSubscript:", v12), v10))
              {
                break;
              }
              ++v12;
            }
            while (v12 < [v8 count]);
            if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          if (v12 != [v8 count] + 1) {
            objc_msgSend(v8, "removeObjectsInRange:", v12, objc_msgSend(v8, "count") - v12);
          }
        }
        else
        {
          int v8 = (void *)[MEMORY[0x263EFF980] arrayWithArray:v11];
          [v8 removeLastObject];
        }
      }
      if (++v9 == v7) {
        goto LABEL_17;
      }
    }
  }
  int v8 = 0;
LABEL_17:
  if ([v8 count]) {
    id v13 = (id)[NSString pathWithComponents:v8];
  }
  else {
    id v13 = 0;
  }
  return v13;
}

- (void)readEntries
{
  context = (void *)MEMORY[0x23EC9A170](self, a2);
  [[OISFUZipRecordInputStream alloc] initWithDataRepresentation:self->mDataRepresentation];
  -[OISFUZipArchive readEndOfCentralDirectoryFromInputStream:](self, "readEndOfCentralDirectoryFromInputStream:");
}

- (void)collapseCommonRootDirectoryIgnoreCase:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)MEMORY[0x23EC9A170](self, a2);
  id v6 = [(OISFUZipArchive *)self commonRootDirectoryIgnoringCase:v3];
  if (v6)
  {
    uint64_t v7 = v6;
    int v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    uint64_t v9 = [v7 length];
    id v10 = [(OISFUZipArchive *)self allEntryNames];
    uint64_t v11 = [v10 count];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = v9 + 1;
      do
      {
        v15 = (void *)[v10 objectAtIndex:v13];
        if ([v15 length] != v14 && (objc_msgSend(v15, "hasPrefix:", @"__MACOSX") & 1) == 0) {
          -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", -[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", v15), [v15 substringFromIndex:v14]);
        }
        ++v13;
      }
      while (v12 != v13);
    }

    self->mEntries = v8;
  }
}

- (SFUZipEndOfCentralDirectory)readEndOfCentralDirectoryFromInputStream:(SEL)a3
{
  uint64_t v14 = [(SFUZipArchiveDataRepresentation *)self->mDataRepresentation dataLength] - 22;
  os_log_t result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:");
  int v8 = (SFUZipEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    os_log_t result = [(OISFUZipArchive *)self searchForEndOfCentralDirectoryFromInputStream:a4 offset:&v14];
    int v8 = result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  if (LOWORD(v8->var0) | WORD1(v8->var0)) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  unint64_t var0_high = HIWORD(v8->var0);
  retstr->var0 = var0_high;
  int64_t var1_low = LODWORD(v8->var1);
  retstr->var1 = var1_low;
  int64_t var1_high = HIDWORD(v8->var1);
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || var1_low == -1 || var1_high == -1) {
    return [(OISFUZipArchive *)self readZip64EndOfCentralDirectoryFromInputStream:a4 eocdOffset:v14];
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
  uint64_t v11 = (char *)(v9 + v7 - v10);
  if ((unint64_t)v11 >= v9)
  {
    unint64_t v13 = v9;
    uint64_t v14 = v10 - 21;
    do
    {
      if (v14 >= 1)
      {
        unint64_t v15 = (unint64_t)&v11[v14];
        char v16 = v11;
        do
        {
          uint64_t v17 = memchr(v16, 80, v15 - (void)v16);
          char v18 = (unsigned char *)v15;
          if (v17)
          {
            if (v17[1] == 75 && v17[2] == 5)
            {
              char v18 = v17;
              if (v17[3] == 6)
              {
                uint64_t v12 = v17 + 4;
                *a4 = (int64_t)&v17[v8 - v13];
                return v12;
              }
            }
            else
            {
              char v18 = v17;
            }
          }
          char v16 = v18 + 4;
        }
        while ((unint64_t)(v18 + 4) < v15);
      }
      v11 -= 1024;
      uint64_t v14 = 1024;
    }
    while ((unint64_t)v11 >= v13);
  }
  +[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Could not find the end of central directory record"];
  return 0;
}

- (SFUZipEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromInputStream:(SEL)a3 eocdOffset:(id)a4
{
  int64_t v8 = a5 - 20;
  if ((unint64_t)a5 < 0x14) {
    +[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"File isn't long enough for Zip64 locator"];
  }
  os_log_t result = (SFUZipEndOfCentralDirectory *)[a4 dataAtOffset:v8 size:20 end:0];
  unint64_t v10 = result;
  if (LODWORD(result->var0) != 117853008) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Zip64 end of central directory locator record signature not found"];
  }
  if (HIDWORD(v10->var0)) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  int64_t var1 = v10->var1;
  if (LODWORD(v10->var2) != 1) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  if (self)
  {
    return [(OISFUZipArchive *)self readZip64EndOfCentralDirectoryFromInputStream:a4 offset:var1];
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
  os_log_t result = (SFUZipEndOfCentralDirectory *)[a4 dataAtOffset:a5 size:56 end:0];
  unint64_t v7 = result;
  if (LODWORD(result->var0) != 101075792) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"Zip64 end of central directory record signature not found"];
  }
  if (LODWORD(v7->var2)) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  if (HIDWORD(v7->var2)) {
    os_log_t result = (SFUZipEndOfCentralDirectory *)+[OISFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
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
      +[OISFUZipException raise:@"SFUZipFilenameError" format:@"Could not read filename."];
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
      uint64_t v11 = a3 + 4;
      uint64_t v12 = &a3[v10 + 4];
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
            self->mPassphraseHint = (NSString *)+[OISFUCryptoUtils decodePassphraseHint:v15];
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