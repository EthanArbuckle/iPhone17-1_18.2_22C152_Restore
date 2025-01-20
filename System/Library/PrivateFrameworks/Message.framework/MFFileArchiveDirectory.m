@interface MFFileArchiveDirectory
+ (BOOL)_hasZipSignature:(id)a3;
+ (CentralDirectory)_centralDirectory:(id)a3;
+ (CentralHeader)_centralHeader:(id)a3;
+ (_NSRange)_rangeOfCentralDirectory:(int64_t)a3;
+ (_NSRange)rangeOfCentralDirectoryInData:(id)a3;
+ (id)_entriesFromCentralDictionary:(CentralDirectory *)a3 inData:(id)a4 archiveData:(id)a5;
+ (id)archiveDirectory;
- (BOOL)inputWithData:(id)a3;
- (BOOL)inputWithURL:(id)a3;
- (BOOL)setArchiveEntry:(id)a3;
- (NSData)contents;
- (NSError)error;
- (NSURL)url;
- (id)archiveEntries;
- (id)description;
- (id)mainEntry;
- (id)scrubbedArchiveEntries;
- (void)_scrubContentDirectory;
- (void)setContents:(id)a3;
- (void)setMainEntry:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation MFFileArchiveDirectory

+ (id)archiveDirectory
{
  v2 = objc_alloc_init(MFFileArchiveDirectory);
  return v2;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Class:%@\nURL:%@\nEntries[%@]", objc_opt_class(), self->_url, self->_entries];
}

- (id)archiveEntries
{
  return (id)[(NSMutableDictionary *)self->_entries allValues];
}

+ (_NSRange)rangeOfCentralDirectoryInData:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && (id v4 = v3,
        (v5 = memmem((const void *)[v4 bytes], objc_msgSend(v4, "length"), &centralDirectorySignatureString, 4uLL)) != 0))
  {
    id v6 = v4;
    uint64_t v7 = [v6 bytes];
    unint64_t v8 = [v6 length];
    unint64_t v9 = (unint64_t)v5 - v7 + 22;
    if (v9 <= v8) {
      uint64_t v10 = (uint64_t)v5 - v7;
    }
    else {
      uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 <= v8) {
      uint64_t v11 = 22;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v12 = v10;
  NSUInteger v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)inputWithURL:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_url, a3);
  url = self->_url;
  id v12 = 0;
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:url options:3 error:&v12];
  id v8 = v12;
  id v9 = v12;
  if (v9) {
    objc_storeStrong((id *)&self->_error, v8);
  }
  BOOL v10 = [(MFFileArchiveDirectory *)self inputWithData:v7];

  return v10;
}

- (BOOL)inputWithData:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_contents, a3);
  uint64_t v6 = +[MFFileArchiveDirectory _rangeOfCentralDirectory:](MFFileArchiveDirectory, "_rangeOfCentralDirectory:", [v5 length]);
  id v8 = objc_msgSend(v5, "subdataWithRange:", v6, v7);
  id v9 = +[MFFileArchiveDirectory _centralDirectory:v8];
  BOOL v10 = v9;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(v5, "subdataWithRange:", v9->var6, v9->var5);
    id v12 = +[MFFileArchiveDirectory _entriesFromCentralDictionary:v10 inData:v11 archiveData:v5];
    NSUInteger v13 = (NSMutableDictionary *)[v12 mutableCopy];
    entries = self->_entries;
    self->_entries = v13;

    scrubbedEntries = self->_scrubbedEntries;
    self->_scrubbedEntries = 0;
  }
  return v10 != 0;
}

+ (id)_entriesFromCentralDictionary:(CentralDirectory *)a3 inData:(id)a4 archiveData:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3->var3];
  int var3 = a3->var3;
  if (a3->var3)
  {
    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t var5 = a3->var5;
    do
    {
      v14 = objc_msgSend(v20, "subdataWithRange:", v11, var5);

      v15 = (unsigned __int16 *)[a1 _centralHeader:v14];
      if (!v15) {
        break;
      }
      v16 = +[MFFileArchiveEntry archiveEntryWithCentralHeader:v15 archiveData:v8];
      v17 = [v16 path];
      [v9 setObject:v16 forKey:v17];

      unint64_t v18 = v15[14] + (unint64_t)v15[15] + v15[16] + 46;
      v11 += v18;
      var5 -= v18;

      id v12 = v14;
      --var3;
    }
    while (var3);
  }
  return v9;
}

- (id)mainEntry
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  p_mainEntry = &self->_mainEntry;
  id v4 = self->_mainEntry;
  id v5 = [(MFFileArchiveEntry *)*(p_mainEntry - 2) allValues];
  uint64_t v6 = v5;
  if (!v4)
  {
    if (![v5 count])
    {
      id v4 = 0;
      goto LABEL_9;
    }
    if ([v6 count] == 1)
    {
      id v4 = [v6 firstObject];
    }
    else
    {
      id v4 = 0;
    }
    [(MFFileArchiveDirectory *)self _scrubContentDirectory];
    uint64_t v7 = [(NSMutableDictionary *)self->_scrubbedEntries allValues];
    id v8 = v7;
    if (v4) {
      goto LABEL_8;
    }
    if ([v7 count] == 1)
    {
      id v4 = [v8 firstObject];
      if (v4) {
        goto LABEL_8;
      }
    }
    BOOL v10 = [(NSURL *)self->_url path];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = [(NSURL *)self->_url path];
      NSUInteger v13 = [v12 lastPathComponent];
      v14 = [v13 lowercaseString];

      v15 = [v14 pathExtension];
      LODWORD(v13) = [v15 isEqualToString:@"zip"];

      if (v13)
      {
        uint64_t v16 = [v14 stringByDeletingPathExtension];

        v14 = (void *)v16;
      }
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __35__MFFileArchiveDirectory_mainEntry__block_invoke;
      v35[3] = &unk_1E5D3E728;
      id v17 = v14;
      id v36 = v17;
      uint64_t v18 = [v8 indexOfObjectPassingTest:v35];
      if (v18 == 0x7FFFFFFFFFFFFFFFLL)
      {
      }
      else
      {
        id v4 = [v8 objectAtIndex:v18];

        if (v4) {
          goto LABEL_8;
        }
      }
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v8;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v20)
    {
      v29 = v8;
      v30 = v6;
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v23 = *(void *)v32;
      uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        uint64_t v25 = 0;
        uint64_t v26 = v21 + v20;
        do
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v19);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8 * v25);
          if (v22 < objc_msgSend(v27, "uncompressedSize", v29, v30, (void)v31))
          {
            uint64_t v22 = [v27 uncompressedSize];
            uint64_t v24 = v21 + v25;
          }
          ++v25;
        }
        while (v20 != v25);
        uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v37 count:16];
        uint64_t v21 = v26;
      }
      while (v20);

      id v8 = v29;
      uint64_t v6 = v30;
      if (v24 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v4 = [v19 objectAtIndex:v24];
        if (v4) {
          goto LABEL_8;
        }
      }
    }
    else
    {
    }
    uint64_t v28 = [v19 indexOfObjectPassingTest:&__block_literal_global_32];
    if (v28 == 0x7FFFFFFFFFFFFFFFLL
      || ([v19 objectAtIndex:v28],
          (id v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v19, "firstObject", v28);
      id v4 = (MFFileArchiveEntry *)objc_claimAutoreleasedReturnValue();
    }
LABEL_8:
    objc_storeStrong((id *)p_mainEntry, v4);
  }
LABEL_9:

  return v4;
}

uint64_t __35__MFFileArchiveDirectory_mainEntry__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 fileName];
    id v8 = [v7 lastPathComponent];
    id v9 = [v8 lowercaseString];
    uint64_t v10 = [v9 isEqualToString:*(void *)(a1 + 32)];

    if (v10) {
      *a4 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

BOOL __35__MFFileArchiveDirectory_mainEntry__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 fileName];
    uint64_t v7 = [v6 lastPathComponent];
    int v8 = [v7 characterAtIndex:0];

    BOOL v9 = v8 != 46;
    if (v8 != 46)
    {
      BOOL v9 = 1;
      *a4 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)setMainEntry:(id)a3
{
}

- (void)_scrubContentDirectory
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_scrubbedEntries)
  {
    id v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_entries, "count"));
    scrubbedEntries = self->_scrubbedEntries;
    self->_scrubbedEntries = v3;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v16 = self;
    id v5 = [(NSMutableDictionary *)self->_entries allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v6) {
      goto LABEL_16;
    }
    uint64_t v7 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v10 = [v9 fileName];
        if ([v10 length] && objc_msgSend(v9, "uncompressedSize"))
        {
          uint64_t v11 = [v9 fileName];
          id v12 = [v9 fileName];
          if (objc_msgSend(v11, "characterAtIndex:", objc_msgSend(v12, "length") - 1) == 47)
          {
          }
          else
          {
            NSUInteger v13 = [v9 path];
            char v14 = [v13 hasPrefix:@"__MACOSX/"];

            if (v14) {
              continue;
            }
            v15 = v16->_scrubbedEntries;
            uint64_t v10 = [v9 path];
            [(NSMutableDictionary *)v15 setObject:v9 forKey:v10];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v6)
      {
LABEL_16:

        return;
      }
    }
  }
}

- (id)scrubbedArchiveEntries
{
  scrubbedEntries = self->_scrubbedEntries;
  if (!scrubbedEntries)
  {
    [(MFFileArchiveDirectory *)self _scrubContentDirectory];
    scrubbedEntries = self->_scrubbedEntries;
  }
  return (id)[(NSMutableDictionary *)scrubbedEntries allValues];
}

+ (CentralHeader)_centralHeader:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x36)
  {
LABEL_6:
    id v4 = 0;
    goto LABEL_7;
  }
  id v4 = (CentralHeader *)[v3 bytes];
  if (*(_DWORD *)v4->var0 != 33639248)
  {
    id v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "#Attachments Failed to validate archive central header", v7, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

+ (CentralDirectory)_centralDirectory:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] < 0x16)
  {
LABEL_6:
    id v4 = 0;
    goto LABEL_7;
  }
  id v4 = (CentralDirectory *)[v3 bytes];
  if (*(_DWORD *)v4->var0 != 101010256)
  {
    id v5 = MFLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_INFO, "#Attachments Failed to validate archive central directory", v7, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

+ (_NSRange)_rangeOfCentralDirectory:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    NSUInteger v3 = a3 - 22;
  }
  NSUInteger v4 = 22;
  result.length = v4;
  result.location = v3;
  return result;
}

+ (BOOL)_hasZipSignature:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = v3;
    BOOL v5 = memmem((const void *)[v4 bytes], objc_msgSend(v4, "length"), &localHeaderSignatureString, 4uLL) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)setArchiveEntry:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    entries = self->_entries;
    uint64_t v7 = [v4 path];
    int v8 = [(NSMutableDictionary *)entries objectForKey:v7];

    if (v8)
    {
      [v8 merge:v5];
    }
    else
    {
      BOOL v9 = self->_entries;
      if (!v9)
      {
        uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v11 = self->_entries;
        self->_entries = v10;

        BOOL v9 = self->_entries;
      }
      id v12 = [v5 path];
      [(NSMutableDictionary *)v9 setObject:v5 forKey:v12];
    }
  }

  return v5 != 0;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_mainEntry, 0);
  objc_storeStrong((id *)&self->_scrubbedEntries, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end