@interface TSUTemporaryDirectory
- (TSUTemporaryDirectory)init;
- (TSUTemporaryDirectory)initWithSignature:(id)a3;
- (TSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4;
- (id)URL;
- (id)path;
- (void)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4;
- (void)dealloc;
- (void)leakTemporaryDirectory;
@end

@implementation TSUTemporaryDirectory

- (TSUTemporaryDirectory)init
{
  return [(TSUTemporaryDirectory *)self initWithSignature:&stru_26D4F03D0 subdirectory:0];
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3
{
  return [(TSUTemporaryDirectory *)self initWithSignature:a3 subdirectory:0];
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSUTemporaryDirectory;
  v6 = [(TSUTemporaryDirectory *)&v9 init];
  v7 = v6;
  if (v6) {
    [(TSUTemporaryDirectory *)v6 _createDirectoryWithSignature:a3 subdirectory:a4];
  }
  return v7;
}

- (void)dealloc
{
  if (!self->_leak)
  {
    id v9 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "removeItemAtPath:error:", self->_path, &v9) & 1) == 0)
    {
      if ([v9 code] != 4
        || (v7 = (void *)[v9 domain],
            ([v7 isEqualToString:*MEMORY[0x263F07F70]] & 1) == 0))
      {
        TSULogErrorInFunction((uint64_t)"-[TSUTemporaryDirectory dealloc]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUTemporaryDirectory.mm", 65, @"Failed to remove TSUTemporaryDirectory. Error: %@, path: %@", v3, v4, v5, v6, (uint64_t)v9);
      }
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)TSUTemporaryDirectory;
  [(TSUTemporaryDirectory *)&v8 dealloc];
}

- (id)path
{
  return self->_path;
}

- (id)URL
{
  return (id)[NSURL fileURLWithPath:self->_path isDirectory:1];
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (void)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4
{
  if (a3) {
    uint64_t v6 = (__CFString *)a3;
  }
  else {
    uint64_t v6 = &stru_26D4F03D0;
  }
  if (!-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase)
  {
    objc_sync_enter(self);
    if (!-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase)
    {
      uint64_t v7 = [(id)SFUBundle() bundleIdentifier];
      id v8 = [NSString alloc];
      uint64_t v9 = getpid();
      v10 = @"com.apple.Unknown";
      if (v7) {
        v10 = (__CFString *)v7;
      }
      uint64_t v11 = [v8 initWithFormat:@"%@_%d", v10, v9];
      __dmb(0xBu);
      -[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase = v11;
      if (!v11)
      {
        id v12 = +[TSUAssertionHandler currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]"];
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUTemporaryDirectory.mm"), 105, @"Couldn't initialize lazy variable %s", "secretSubdirectoryNameBase");
      }
    }
    objc_sync_exit(self);
  }
  v14 = (void *)[(id)-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase stringByAppendingFormat:@"_%@_%d_%d", v6, (int)CFAbsoluteTimeGetCurrent(), atomic_fetch_add(-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryIndex, 1u)+ 1];
  if ((unint64_t)[v14 length] >= 0x100) {
    v14 = (void *)[v14 substringToIndex:255];
  }
  v15 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v15)
  {
    v16 = (NSString *)[NSString stringWithUTF8String:v15];
    if (!a4) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v16 = NSTemporaryDirectory();
  if (a4) {
LABEL_15:
  }
    v16 = [(NSString *)v16 stringByAppendingPathComponent:a4];
LABEL_16:
  v17 = [(NSString *)v16 stringByAppendingPathComponent:v14];
  uint64_t v18 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v18))self->_path = v17; {
  else
  }
    objc_msgSend(MEMORY[0x263EFF940], "tsu_raiseWithError:", v18);
}

@end