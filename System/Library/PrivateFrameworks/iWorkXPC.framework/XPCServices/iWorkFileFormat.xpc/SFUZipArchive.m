@interface SFUZipArchive
+ (BOOL)isZipArchiveAtPath:(id)a3;
- (BOOL)decompressAtPath:(id)a3;
- (BOOL)decompressAtPath:(id)a3 wasEmpty:(BOOL *)a4;
- (BOOL)isEncrypted;
- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5;
- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5;
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

@implementation SFUZipArchive

+ (BOOL)isZipArchiveAtPath:(id)a3
{
  v3 = [[SFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
  id v4 = [(SFUZipArchiveFileDataRepresentation *)v3 inputStream];
  BOOL v6 = [v4 readToBuffer:v8 size:4] == (id)4 && v8[0] == 67324752;
  [v4 close];

  return v6;
}

- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return [(SFUZipArchive *)self initWithPath:a3 collapseCommonRootDirectory:a4 ignoreCase:0];
}

- (SFUZipArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [(SFUZipArchive *)self init];
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[SFUZipArchiveFileDataRepresentation alloc] initWithPath:a3];
    [(SFUZipArchive *)v8 readEntries];
    if (v6) {
      [(SFUZipArchive *)v8 collapseCommonRootDirectoryIgnoreCase:v5];
    }
  }
  return v8;
}

- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  return [(SFUZipArchive *)self initWithData:a3 collapseCommonRootDirectory:a4 ignoreCase:0];
}

- (SFUZipArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4 ignoreCase:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v8 = [(SFUZipArchive *)self init];
  if (v8)
  {
    v8->mEntries = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->mDataRepresentation = (SFUZipArchiveDataRepresentation *)[[SFUZipArchiveMemoryDataRepresentation alloc] initWithData:a3];
    [(SFUZipArchive *)v8 readEntries];
    if (v6) {
      [(SFUZipArchive *)v8 collapseCommonRootDirectoryIgnoreCase:v5];
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipArchive;
  [(SFUZipArchive *)&v3 dealloc];
}

- (id)entryWithName:(id)a3
{
  return [(NSMutableDictionary *)self->mEntries objectForKey:a3];
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
  return [(NSMutableDictionary *)self->mEntries allKeys];
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
  id v6 = [(NSMutableDictionary *)self->mEntries allValues];
  mCryptoKey = self->mCryptoKey;
  _[v6 makeObjectsPerformSelector:"setCryptoKey:" withObject:mCryptoKey];
}

- (BOOL)decompressAtPath:(id)a3
{
  return [(SFUZipArchive *)self decompressAtPath:a3 wasEmpty:0];
}

- (BOOL)decompressAtPath:(id)a3 wasEmpty:(BOOL *)a4
{
  id v6 = +[NSFileManager defaultManager];
  char v24 = 0;
  if ([(NSFileManager *)v6 fileExistsAtPath:a3 isDirectory:&v24])
  {
    if (!v24)
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CDEE0);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_100168FC8();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipArchive decompressAtPath:wasEmpty:]", a4), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipArchive.m"), 220, 0, "Can only decompress into a directory");
      +[TSUAssertionHandler logBacktraceThrottled];
LABEL_27:
      char v16 = 0;
      unsigned __int8 v15 = 0;
      goto LABEL_30;
    }
  }
  else if (![(NSFileManager *)v6 createDirectoryAtPath:a3 withIntermediateDirectories:1 attributes:0 error:0])
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CDEC0);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_100169050();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SFUZipArchive decompressAtPath:wasEmpty:]", a4), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUZipArchive.m"), 217, 0, "Can't create output directory");
    +[TSUAssertionHandler logBacktraceThrottled];
    goto LABEL_27;
  }
  id v7 = objc_msgSend(-[SFUZipArchive allEntryNames](self, "allEntryNames", a4), "sortedArrayUsingSelector:", "compare:");
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v8 = 0;
  id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v13 = (char *)[v12 length];
        id v14 = [a3 stringByAppendingPathComponent:v12];
        if ([v12 characterAtIndex:v13 - 1] == 47)
        {
          unsigned __int8 v15 = [(NSFileManager *)v6 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:0 error:0];
        }
        else
        {
          unsigned __int8 v15 = -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [v14 stringByDeletingLastPathComponent], 1, 0, 0);
          objc_msgSend(-[SFUZipArchive entryWithName:](self, "entryWithName:", v12), "copyToFile:", v14);
          if ((v8 & 1) == 0 && ![v12 hasPrefix:@"."]) {
            char v8 = 1;
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }
  else
  {
    unsigned __int8 v15 = 1;
  }
  char v16 = v8;
LABEL_30:
  if (v18) {
    unsigned char *v18 = v16 ^ 1;
  }
  return v15;
}

- (id)commonRootDirectoryIgnoringCase:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SFUZipArchive *)self allEntryNames];
  id v6 = [v5 count];
  if (v6)
  {
    id v7 = v6;
    char v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = v3 | 2;
    while (1)
    {
      id v11 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v9), "pathComponents");
      if ((unint64_t)[v11 count] < 2
        || (objc_msgSend(objc_msgSend(v11, "objectAtIndex:", 0), "isEqualToString:", @"__MACOSX") & 1) == 0)
      {
        if (v8)
        {
          v12 = 0;
          if ([(NSMutableArray *)v8 count])
          {
            do
            {
              if (v12 >= [v11 count]) {
                break;
              }
              if (objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v12), "compare:options:", objc_msgSend(v11, "objectAtIndexedSubscript:", v12), v10))
              {
                break;
              }
              ++v12;
            }
            while (v12 < [(NSMutableArray *)v8 count]);
            if (v12 == (char *)0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
          }
          if (v12 != (char *)[(NSMutableArray *)v8 count] + 1) {
            -[NSMutableArray removeObjectsInRange:](v8, "removeObjectsInRange:", v12, (unsigned char *)[(NSMutableArray *)v8 count] - v12);
          }
        }
        else
        {
          char v8 = +[NSMutableArray arrayWithArray:v11];
          [(NSMutableArray *)v8 removeLastObject];
        }
      }
      if ((id)++v9 == v7) {
        goto LABEL_17;
      }
    }
  }
  char v8 = 0;
LABEL_17:
  if ([(NSMutableArray *)v8 count]) {
    v13 = +[NSString pathWithComponents:v8];
  }
  else {
    v13 = 0;
  }
  return v13;
}

- (void)readEntries
{
  [[SFUZipRecordInputStream alloc] initWithDataRepresentation:self->mDataRepresentation];
  -[SFUZipArchive readEndOfCentralDirectoryFromInputStream:](self, "readEndOfCentralDirectoryFromInputStream:");
}

- (void)collapseCommonRootDirectoryIgnoreCase:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(SFUZipArchive *)self commonRootDirectoryIgnoringCase:v3];
  if (v6)
  {
    id v7 = v6;
    char v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    uint64_t v9 = (char *)[v7 length];
    id v10 = [(SFUZipArchive *)self allEntryNames];
    id v11 = (char *)[v10 count];
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      id v14 = v9 + 1;
      do
      {
        id v15 = [v10 objectAtIndex:v13];
        if ([v15 length] != v14
          && ([v15 hasPrefix:@"__MACOSX"] & 1) == 0)
        {
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
  id v14 = (char *)[(SFUZipArchiveDataRepresentation *)self->mDataRepresentation dataLength] - 22;
  result = (SFUZipEndOfCentralDirectory *)objc_msgSend(a4, "dataAtOffset:size:end:");
  char v8 = (SFUZipEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    result = [(SFUZipArchive *)self searchForEndOfCentralDirectoryFromInputStream:a4 offset:&v14];
    char v8 = result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  if (LOWORD(v8->var0) | WORD1(v8->var0)) {
    result = (SFUZipEndOfCentralDirectory *)+[SFUZipException raise:@"SFUZipEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  unint64_t var0_high = HIWORD(v8->var0);
  retstr->var0 = var0_high;
  int64_t var1_low = LODWORD(v8->var1);
  retstr->var1 = var1_low;
  int64_t var1_high = HIDWORD(v8->var1);
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || var1_low == -1 || var1_high == -1) {
    return [(SFUZipArchive *)self readZip64EndOfCentralDirectoryFromInputStream:a4 eocdOffset:v14];
  }
  return result;
}

- (const)searchForEndOfCentralDirectoryFromInputStream:(id)a3 offset:(int64_t *)a4
{
  id v6 = (char *)[(SFUZipArchiveDataRepresentation *)self->mDataRepresentation dataLength];
  if ((unint64_t)v6 <= 0x10015) {
    unint64_t v7 = (unint64_t)v6;
  }
  else {
    unint64_t v7 = 65557;
  }
  char v8 = &v6[-v7];
  uint64_t v9 = (char *)[a3 dataAtOffset:&v6[-v7] size:v7 end:v6];
  unint64_t v10 = v7 & 0x3FF | 0x400;
  if (v10 >= v7) {
    unint64_t v10 = v7;
  }
  id v11 = &v9[v7 - v10];
  if (v11 >= v9)
  {
    v13 = v9;
    uint64_t v14 = v10 - 21;
    do
    {
      if (v14 >= 1)
      {
        unint64_t v15 = (unint64_t)&v11[v14];
        char v16 = v11;
        do
        {
          v17 = memchr(v16, 80, v15 - (void)v16);
          v18 = (unsigned char *)v15;
          if (v17)
          {
            if (*((unsigned char *)v17 + 1) == 75 && *((unsigned char *)v17 + 2) == 5)
            {
              v18 = v17;
              if (*((unsigned char *)v17 + 3) == 6)
              {
                v12 = (char *)v17 + 4;
                *a4 = &v8[(void)v17] - v13;
                return v12;
              }
            }
            else
            {
              v18 = v17;
            }
          }
          char v16 = v18 + 4;
        }
        while ((unint64_t)(v18 + 4) < v15);
      }
      v11 -= 1024;
      uint64_t v14 = 1024;
    }
    while (v11 >= v13);
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
  id result = [objc_alloc((Class)NSString) initWithBytes:a3 length:a4 encoding:4];
  if (!result)
  {
    CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
    id result = [objc_alloc((Class)NSString) initWithBytes:a3 length:a4 encoding:CFStringConvertEncodingToNSStringEncoding(SystemEncoding)];
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
    uint64_t v18 = v5;
    uint64_t v19 = v6;
    uint64_t v9 = &a3[a4];
    qmemcpy(v17, "iwphiwuu", sizeof(v17));
    while (1)
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
          if (v14 && *(_DWORD *)v11 == v17[0])
          {
            id v15 = [objc_alloc((Class)NSData) initWithBytes:a3 + 8 length:(v10 - 4)];
            self->mPassphraseHint = (NSString *)+[SFUCryptoUtils decodePassphraseHint:v15];
          }
        }
        else if (v13 == 25455 && v10 >= 4 && !self->mEncryptedDocumentUuid && *(_DWORD *)v11 == v17[1])
        {
          self->mEncryptedDocumentUuid = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a3 + 8 length:(v10 - 4)];
        }
      }
      else if (v13 == 1)
      {
        objc_msgSend(a5, "readZip64ExtraField:size:", a3 + 4);
      }
      else if (v13 == 25453 && v10 >= 4 && !self->mPassphraseVerifier && *(_DWORD *)v11 == 1987082089)
      {
        self->mPassphraseVerifier = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a3 + 8 length:(v10 - 4)];
      }
      a3 = v12;
      if (v12 + 4 > v9) {
        return;
      }
    }
    if (TSUErrorCat_init_token != -1) {
      dispatch_once(&TSUErrorCat_init_token, &stru_1001CDF00);
    }
    char v16 = TSUErrorCat_log_t;
    if (os_log_type_enabled((os_log_t)TSUErrorCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_1001690D8(v16);
    }
  }
}

@end