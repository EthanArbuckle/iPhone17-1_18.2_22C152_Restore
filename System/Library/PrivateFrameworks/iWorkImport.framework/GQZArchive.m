@interface GQZArchive
- (BOOL)isEncrypted;
- (GQZArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (GQZArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4;
- (GQZEndOfCentralDirectory)readEndOfCentralDirectory;
- (GQZEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromOffset:(SEL)a3;
- (GQZEndOfCentralDirectory)readZip64EndOfCentralDirectoryWithEocdOffset:(SEL)a3;
- (const)searchForEndOfCentralDirectoryOffset:(int64_t *)a3;
- (id)entryNames;
- (id)entryWithName:(id)a3;
- (id)filename;
- (id)readFilenameFromBuffer:(const char *)a3 size:(unint64_t)a4;
- (void)collapseCommonRootDirectory;
- (void)dealloc;
- (void)readEntries;
- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5;
@end

@implementation GQZArchive

- (GQZArchive)initWithPath:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(GQZArchive *)self init];
  if (v6)
  {
    v6->mFilename = (NSString *)[a3 lastPathComponent];
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mInput = (GQZArchiveInputStream *)[[GQZArchiveFileInputStream alloc] initWithPath:a3];
    [(GQZArchive *)v6 readEntries];
    if (v4) {
      [(GQZArchive *)v6 collapseCommonRootDirectory];
    }
  }
  return v6;
}

- (GQZArchive)initWithData:(id)a3 collapseCommonRootDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(GQZArchive *)self init];
  if (v6)
  {
    v6->mEntries = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mInput = (GQZArchiveInputStream *)[[GQZArchiveMemoryInputStream alloc] initWithData:a3];
    [(GQZArchive *)v6 readEntries];
    if (v4) {
      [(GQZArchive *)v6 collapseCommonRootDirectory];
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQZArchive;
  [(GQZArchive *)&v3 dealloc];
}

- (id)entryWithName:(id)a3
{
  return [(NSMutableDictionary *)self->mEntries objectForKey:a3];
}

- (id)entryNames
{
  return [(NSMutableDictionary *)self->mEntries allKeys];
}

- (BOOL)isEncrypted
{
  return self->mIsEncrypted;
}

- (id)filename
{
  return self->mFilename;
}

- (void)readEntries
{
  if (self) {
    [(GQZArchive *)self readEndOfCentralDirectory];
  }
}

- (void)collapseCommonRootDirectory
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  id v4 = [(GQZArchive *)self entryNames];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = 0;
    v7 = 0;
    while (1)
    {
      id v8 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v6), "pathComponents");
      if ((unint64_t)[v8 count] < 2) {
        break;
      }
      id v9 = [v8 objectAtIndex:0];
      if (!v9) {
        break;
      }
      v10 = v9;
      if (([v9 isEqualToString:@"__MACOSX"] & 1) == 0)
      {
        if (v7)
        {
          if (![v10 isEqualToString:v7]) {
            break;
          }
        }
        else
        {
          v7 = v10;
        }
      }
      if (v5 == ++v6) {
        goto LABEL_13;
      }
    }
  }
  v7 = 0;
LABEL_13:
  id v11 = v7;

  id v12 = objc_alloc_init((Class)NSAutoreleasePool);
  if (v7)
  {
    id v20 = v12;
    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](self->mEntries, "count"));
    unsigned int v14 = [v7 length];
    id v15 = [(GQZArchive *)self entryNames];
    uint64_t v16 = [v15 count];
    if (v16)
    {
      uint64_t v17 = 0;
      id v18 = (id)(v14 + 1);
      do
      {
        id v19 = [v15 objectAtIndex:v17];
        if ([v19 length] != v18
          && ([v19 hasPrefix:@"__MACOSX"] & 1) == 0)
        {
          -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", -[NSMutableDictionary objectForKey:](self->mEntries, "objectForKey:", v19), [v19 substringFromIndex:v18]);
        }
        ++v17;
      }
      while (v16 != v17);
    }

    self->mEntries = v13;
    id v12 = v20;
  }
}

- (GQZEndOfCentralDirectory)readEndOfCentralDirectory
{
  unsigned int v14 = (char *)[(GQZArchiveInputStream *)self->mInput size] - 22;
  result = (GQZEndOfCentralDirectory *)-[GQZArchiveInputStream dataAtOffset:size:end:readSize:](self->mInput, "dataAtOffset:size:end:readSize:");
  uint64_t v6 = (GQZEndOfCentralDirectory *)((char *)&result->var0 + 4);
  if (LODWORD(result->var0) != 101010256)
  {
    result = [(GQZArchive *)self searchForEndOfCentralDirectoryOffset:&v14];
    uint64_t v6 = result;
  }
  if (LOWORD(v6->var0) | WORD1(v6->var0)) {
    result = (GQZEndOfCentralDirectory *)+[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  unint64_t var0_high = HIWORD(v6->var0);
  int64_t var1_low = LODWORD(v6->var1);
  int64_t var1_high = HIDWORD(v6->var1);
  retstr->var0 = var0_high;
  retstr->var1 = var1_low;
  retstr->var2 = var1_high;
  if (var0_high == 0xFFFF || var1_low == -1 || var1_high == -1)
  {
    long long v12 = 0uLL;
    int64_t v13 = 0;
    result = [(GQZArchive *)self readZip64EndOfCentralDirectoryWithEocdOffset:v14];
    if (*((void *)&v12 + 1))
    {
      *(_OWORD *)&retstr->var0 = v12;
      retstr->var2 = v13;
    }
  }
  return result;
}

- (const)searchForEndOfCentralDirectoryOffset:(int64_t *)a3
{
  uint64_t v5 = (char *)[(GQZArchiveInputStream *)self->mInput size];
  if ((uint64_t)v5 >= 65557) {
    uint64_t v6 = 65557;
  }
  else {
    uint64_t v6 = (uint64_t)v5;
  }
  v7 = &v5[-v6];
  id v8 = (char *)[(GQZArchiveInputStream *)self->mInput dataAtOffset:&v5[-v6] size:v6 end:v5 readSize:0];
  uint64_t v9 = v6 & 0x3FF | 0x400;
  if (v9 >= v6) {
    uint64_t v9 = v6;
  }
  v10 = &v8[v6 - v9];
  if (v10 < v8)
  {
LABEL_18:
    +[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"Could not find the end of central directory record"];
    return 0;
  }
  id v11 = v8;
  uint64_t v12 = v9 - 21;
  while (v12 < 1)
  {
LABEL_17:
    v10 -= 1024;
    uint64_t v12 = 1024;
    if (v10 < v11) {
      goto LABEL_18;
    }
  }
  unint64_t v13 = (unint64_t)&v10[v12];
  unsigned int v14 = v10;
  while (1)
  {
    id v15 = memchr(v14, 80, v13 - (void)v14);
    uint64_t v16 = (unsigned char *)v13;
    if (v15)
    {
      if (*((unsigned char *)v15 + 1) != 75 || *((unsigned char *)v15 + 2) != 5)
      {
        uint64_t v16 = v15;
        goto LABEL_16;
      }
      uint64_t v16 = v15;
      if (*((unsigned char *)v15 + 3) == 6) {
        break;
      }
    }
LABEL_16:
    unsigned int v14 = v16 + 4;
    if ((unint64_t)(v16 + 4) >= v13) {
      goto LABEL_17;
    }
  }
  uint64_t v17 = (char *)v15 + 4;
  if (a3) {
    *a3 = &v7[(void)v15] - v11;
  }
  return v17;
}

- (GQZEndOfCentralDirectory)readZip64EndOfCentralDirectoryWithEocdOffset:(SEL)a3
{
  if (a4 <= 19) {
    +[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"File isn't long enough for Zip64 locator"];
  }
  uint64_t v6 = [(GQZArchiveInputStream *)self->mInput dataAtOffset:a4 - 20 size:20 end:0 readSize:0];
  if (*v6 != 117853008) {
    +[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"Zip64 end of central directory locator record signature not found"];
  }
  if (v6[1]) {
    +[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  uint64_t v7 = *((void *)v6 + 1);
  if (v6[4] != 1) {
    +[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  return [(GQZArchive *)self readZip64EndOfCentralDirectoryFromOffset:v7];
}

- (GQZEndOfCentralDirectory)readZip64EndOfCentralDirectoryFromOffset:(SEL)a3
{
  result = (GQZEndOfCentralDirectory *)[(GQZArchiveInputStream *)self->mInput dataAtOffset:a4 size:56 end:0 readSize:0];
  uint64_t v6 = result;
  if (LODWORD(result->var0) != 101075792) {
    result = (GQZEndOfCentralDirectory *)+[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"Zip64 end of central directory record signature not found"];
  }
  if (LODWORD(v6->var2)) {
    result = (GQZEndOfCentralDirectory *)+[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  if (HIDWORD(v6->var2)) {
    result = (GQZEndOfCentralDirectory *)+[GQZException raise:@"GQZEndOfCentralDirectoryError" format:@"No multi-disk support"];
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v6[1].var1;
  retstr->var2 = v6[2].var0;
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
      +[GQZException raise:@"GQZFilenameError" format:@"Could not read filename."];
      return 0;
    }
  }
  return result;
}

- (void)readExtraFieldFromBuffer:(const char *)a3 size:(unint64_t)a4 entry:(id)a5
{
  if ((uint64_t)a4 >= 4)
  {
    uint64_t v6 = a3;
    id v8 = &a3[a4];
    do
    {
      uint64_t v9 = *((unsigned __int16 *)v6 + 1);
      v10 = v6 + 4;
      id v11 = &v6[v9 + 4];
      if (v11 > v8) {
        break;
      }
      int v12 = *(unsigned __int16 *)v6;
      if (v12 == 25453)
      {
        BOOL v13 = v9 >= 4 && !self->mIsEncrypted;
        if (v13 && *v10 == 1987082089) {
          self->mIsEncrypted = 1;
        }
      }
      else if (v12 == 1)
      {
        objc_msgSend(a5, "readZip64ExtraField:size:");
      }
      uint64_t v6 = v11;
    }
    while (v11 + 4 <= v8);
  }
}

@end