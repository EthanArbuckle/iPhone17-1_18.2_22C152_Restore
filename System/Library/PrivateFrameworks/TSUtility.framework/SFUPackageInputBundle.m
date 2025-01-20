@interface SFUPackageInputBundle
- (BOOL)hasEntryWithName:(id)a3;
- (SFUPackageInputBundle)initWithPath:(id)a3;
- (id)_existingPathForEntryName:(id)a3 isGz:(BOOL *)a4;
- (id)bufferedInputStreamForEntry:(id)a3;
- (id)inputStreamForEntry:(id)a3;
- (int64_t)lengthOfEntry:(id)a3;
- (unsigned)crc32ForEntry:(id)a3;
- (void)copyEntry:(id)a3 toFile:(id)a4;
- (void)dealloc;
@end

@implementation SFUPackageInputBundle

- (SFUPackageInputBundle)initWithPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFUPackageInputBundle;
  v4 = [(SFUPackageInputBundle *)&v6 init];
  if (v4) {
    v4->_rootPath = (NSString *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUPackageInputBundle;
  [(SFUPackageInputBundle *)&v3 dealloc];
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
  return [(SFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:0] != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  char v5 = 0;
  objc_super v3 = [(SFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v5];
  if (v3)
  {
    if (v5) {
      objc_super v3 = [[SFUGZipFileInputStream alloc] initWithPath:v3];
    }
    else {
      objc_super v3 = [[SFUFileInputStream alloc] initWithPath:v3 offset:0];
    }
  }
  return v3;
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  objc_super v3 = [(SFUPackageInputBundle *)self inputStreamForEntry:a3];
  if (v3) {
    objc_super v3 = [[SFUBufferedInputStream alloc] initWithStream:v3];
  }
  return v3;
}

- (int64_t)lengthOfEntry:(id)a3
{
  char v14 = 0;
  id v5 = [(SFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v14];
  if (!v5) {
    return 0;
  }
  if (!v14) {
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", v5, 0), "fileSize");
  }
  id v6 = +[TSUAssertionHandler currentHandler];
  uint64_t v7 = [NSString stringWithUTF8String:"-[SFUPackageInputBundle lengthOfEntry:]"];
  [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUInputBundle.m"), 180, @"Asked for the length of gzipped entry %@. This is slow.", a3 file lineNumber description];
  id v8 = [(SFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
  int64_t v9 = 0;
  v10 = v8;
  if (v8)
  {
    do
    {
      uint64_t v13 = 0;
      uint64_t v11 = [v10 readToOwnBuffer:&v13 size:-1];
      v9 += v11;
    }
    while (v11);
  }
  [v10 close];
  return v9;
}

- (unsigned)crc32ForEntry:(id)a3
{
  uLong v3 = 0;
  id v5 = [(SFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
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
  char v15 = 0;
  id v7 = [(SFUPackageInputBundle *)self _existingPathForEntryName:a3 isGz:&v15];
  if (v7)
  {
    id v8 = v7;
    int64_t v9 = (void *)[MEMORY[0x263F08850] defaultManager];
    if (v15)
    {
      id v10 = [(SFUPackageInputBundle *)self bufferedInputStreamForEntry:a3];
      if (v10)
      {
        uint64_t v11 = [[SFUFileOutputStream alloc] initWithPath:a4];
        if (v11)
        {
          while (1)
          {
            uint64_t v14 = 0;
            uint64_t v12 = [v10 readToOwnBuffer:&v14 size:-1];
            if (!v12) {
              break;
            }
            [(SFUFileOutputStream *)v11 writeBuffer:v14 size:v12];
          }
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
      [v10 close];
      [(SFUFileOutputStream *)v11 close];
    }
    else
    {
      uint64_t v13 = v9;
      uint64_t v14 = 0;
      if (([v9 linkItemAtPath:v8 toPath:a4 error:&v14] & 1) == 0
        && ([v13 copyItemAtPath:v8 toPath:a4 error:&v14] & 1) == 0)
      {
        objc_msgSend(MEMORY[0x263EFF940], "tsu_raiseWithError:", v14);
      }
    }
  }
}

@end