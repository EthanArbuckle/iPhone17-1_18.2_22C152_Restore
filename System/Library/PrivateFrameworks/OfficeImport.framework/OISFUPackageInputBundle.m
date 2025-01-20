@interface OISFUPackageInputBundle
- (BOOL)hasEntryWithName:(id)a3;
- (OISFUPackageInputBundle)initWithPath:(id)a3;
- (id)_existingPathForEntryName:(id)a3 isGz:(BOOL *)a4;
- (id)bufferedInputStreamForEntry:(id)a3;
- (id)inputStreamForEntry:(id)a3;
- (int64_t)lengthOfEntry:(id)a3;
- (unsigned)crc32ForEntry:(id)a3;
- (void)copyEntry:(id)a3 toFile:(id)a4;
- (void)dealloc;
@end

@implementation OISFUPackageInputBundle

- (OISFUPackageInputBundle)initWithPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OISFUPackageInputBundle;
  v4 = [(OISFUPackageInputBundle *)&v6 init];
  if (v4) {
    v4->_rootPath = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OISFUPackageInputBundle;
  [(OISFUPackageInputBundle *)&v3 dealloc];
}

- (id)_existingPathForEntryName:(id)a3 isGz:(BOOL *)a4
{
  v7 = (void *)[MEMORY[0x263F08850] defaultManager];
  v8 = [(NSString *)self->_rootPath stringByAppendingPathComponent:a3];
  if ([v7 fileExistsAtPath:v8])
  {
    LOBYTE(v9) = 0;
    if (!a4) {
      return v8;
    }
    goto LABEL_7;
  }
  v8 = [(NSString *)v8 stringByAppendingPathExtension:@"gz"];
  int v9 = [v7 fileExistsAtPath:v8];
  if (!v9) {
    v8 = 0;
  }
  if (a4) {
LABEL_7:
  }
    *a4 = v9;
  return v8;
}

- (BOOL)hasEntryWithName:(id)a3
{
  return [(OISFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:0] != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  char v5 = 0;
  objc_super v3 = [(OISFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v5];
  if (v3)
  {
    if (v5) {
      objc_super v3 = [[OISFUGZipFileInputStream alloc] initWithPath:v3];
    }
    else {
      objc_super v3 = [[OISFUFileInputStream alloc] initWithPath:v3 offset:0];
    }
  }
  return v3;
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  objc_super v3 = [(OISFUPackageInputBundle *)self inputStreamForEntry:a3];
  if (v3) {
    objc_super v3 = [[OISFUBufferedInputStream alloc] initWithStream:v3];
  }
  return v3;
}

- (int64_t)lengthOfEntry:(id)a3
{
  char v13 = 0;
  id v5 = [(OISFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v13];
  if (!v5) {
    return 0;
  }
  if (!v13) {
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", v5, 0), "fileSize");
  }
  uint64_t v6 = [NSString stringWithUTF8String:"-[OISFUPackageInputBundle lengthOfEntry:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUInputBundle.m"], 152, 0, "Asked for the length of gzipped entry %@. This is slow.", a3);
  +[OITSUAssertionHandler logBacktraceThrottled];
  id v7 = [(OISFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
  int64_t v8 = 0;
  int v9 = v7;
  if (v7)
  {
    do
    {
      uint64_t v12 = 0;
      uint64_t v10 = [v9 readToOwnBuffer:&v12 size:-1];
      v8 += v10;
    }
    while (v10);
  }
  [v9 close];
  return v8;
}

- (unsigned)crc32ForEntry:(id)a3
{
  uLong v3 = 0;
  id v5 = [(OISFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
  if (v5)
  {
    while (1)
    {
      buf = 0;
      uint64_t v4 = [v5 readToOwnBuffer:&buf size:-1];
      if (!v4) {
        break;
      }
      LODWORD(v3) = crc32(v3, buf, v4);
    }
  }
  objc_msgSend(v5, "close", v4);
  return v3;
}

- (void)copyEntry:(id)a3 toFile:(id)a4
{
  char v16 = 0;
  id v7 = [(OISFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    if (v16)
    {
      id v10 = [(OISFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
      if (v10)
      {
        v11 = [[OISFUFileOutputStream alloc] initWithPath:a4];
        if (v11)
        {
          while (1)
          {
            uint64_t v15 = 0;
            uint64_t v12 = [v10 readToOwnBuffer:&v15 size:-1];
            if (!v12) {
              break;
            }
            [(OISFUFileOutputStream *)v11 writeBuffer:v15 size:v12];
          }
        }
      }
      else
      {
        v11 = 0;
      }
      [v10 close];
      [(OISFUFileOutputStream *)v11 close];
    }
    else
    {
      char v13 = (void *)v9;
      uint64_t v15 = 0;
      uint64_t v14 = objc_msgSend(NSURL, "tsu_fileURLWithPath:", v8);
      if ((objc_msgSend(v13, "tsu_linkOrCopyItemAtURL:toURL:error:", v14, objc_msgSend(NSURL, "tsu_fileURLWithPath:", a4), &v15) & 1) == 0)objc_msgSend(MEMORY[0x263EFF940], "tsu_raiseWithError:", v15); {
    }
      }
  }
}

@end