@interface TSUSafeSaveAssistant
+ (BOOL)finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
+ (id)temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4;
+ (void)removeTemporaryDirectoryAtURL:(id)a3;
+ (void)writeAttributes:(id)a3 toURL:(id)a4;
- (BOOL)endSaveWithSuccess:(BOOL)a3 addingAttributes:(id)a4 error:(id *)a5;
- (BOOL)endSaveWithSuccess:(BOOL)a3 toURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
- (NSURL)writeURL;
- (TSUSafeSaveAssistant)init;
- (id)initForSavingToURL:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)removeTemporaryDirectory;
@end

@implementation TSUSafeSaveAssistant

- (TSUSafeSaveAssistant)init
{
  v2 = +[TSUAssertionHandler currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSUSafeSaveAssistant init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSafeSaveAssistant.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:16 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSUSafeSaveAssistant init]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (id)initForSavingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)TSUSafeSaveAssistant;
    v7 = [(TSUSafeSaveAssistant *)&v24 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      saveURL = v7->_saveURL;
      v7->_saveURL = (NSURL *)v8;

      uint64_t v10 = [(id)objc_opt_class() temporaryDirectoryURLForWritingToURL:v6 error:a4];
      temporaryDirectoryURL = v7->_temporaryDirectoryURL;
      v7->_temporaryDirectoryURL = (NSURL *)v10;

      if (v7->_temporaryDirectoryURL)
      {
        v12 = v7->_saveURL;
        id v23 = 0;
        BOOL v13 = [(NSURL *)v12 getResourceValue:&v23 forKey:*MEMORY[0x263EFF6A8] error:0];
        v14 = (TSUSafeSaveAssistant *)v23;
        v15 = v14;
        if (v13 && [(TSUSafeSaveAssistant *)v14 BOOLValue])
        {
          v16 = v7->_temporaryDirectoryURL;
          writeURL = v7->_writeURL;
          v7->_writeURL = v16;
        }
        else
        {
          v19 = v7->_temporaryDirectoryURL;
          writeURL = [(NSURL *)v7->_saveURL lastPathComponent];
          uint64_t v20 = [(NSURL *)v19 URLByAppendingPathComponent:writeURL];
          v21 = v7->_writeURL;
          v7->_writeURL = (NSURL *)v20;
        }
      }
      else
      {
        v15 = v7;
        v7 = 0;
      }
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)dealloc
{
  [(TSUSafeSaveAssistant *)self removeTemporaryDirectory];
  v3.receiver = self;
  v3.super_class = (Class)TSUSafeSaveAssistant;
  [(TSUSafeSaveAssistant *)&v3 dealloc];
}

- (BOOL)endSaveWithSuccess:(BOOL)a3 addingAttributes:(id)a4 error:(id *)a5
{
  return [(TSUSafeSaveAssistant *)self endSaveWithSuccess:a3 toURL:self->_saveURL addingAttributes:a4 error:a5];
}

- (BOOL)endSaveWithSuccess:(BOOL)a3 toURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  BOOL v8 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!self->_temporaryDirectoryURL)
  {
    v14 = +[TSUAssertionHandler currentHandler];
    v15 = [NSString stringWithUTF8String:"-[TSUSafeSaveAssistant endSaveWithSuccess:toURL:addingAttributes:error:]"];
    v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUSafeSaveAssistant.m"];
    v17 = NSStringFromSelector(a2);
    [v14 handleFailureInFunction:v15, v16, 66, @"%@ should only be called once.", v17 file lineNumber description];

    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_5:
    char v13 = 0;
    goto LABEL_6;
  }
  char v13 = [(id)objc_opt_class() finishWritingToURL:v11 byMovingItemAtURL:self->_writeURL addingAttributes:v12 error:a6];
LABEL_6:
  [(TSUSafeSaveAssistant *)self removeTemporaryDirectory];

  return v13;
}

- (void)removeTemporaryDirectory
{
  if (self->_temporaryDirectoryURL)
  {
    [(id)objc_opt_class() removeTemporaryDirectoryAtURL:self->_temporaryDirectoryURL];
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;
  }
}

+ (id)temporaryDirectoryURLForWritingToURL:(id)a3 error:(id *)a4
{
  v5 = (void *)MEMORY[0x263F08850];
  id v6 = a3;
  v7 = [v5 defaultManager];
  BOOL v8 = [v7 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:a4];

  return v8;
}

+ (void)writeAttributes:(id)a3 toURL:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 objectForKey:*MEMORY[0x263F08010]];
  if ([v9 count] != (v6 != 0) || objc_msgSend(v6, "BOOLValue"))
  {
    v7 = [v5 path];
    if (v7)
    {
      BOOL v8 = [MEMORY[0x263F08850] defaultManager];
      [v8 setAttributes:v9 ofItemAtPath:v7 error:0];
    }
  }
}

+ (BOOL)finishWritingToURL:(id)a3 byMovingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = (void *)MEMORY[0x263F08850];
  id v13 = a3;
  v14 = [v12 defaultManager];
  v15 = [v13 path];

  if ([v14 fileExistsAtPath:v15]
    && ![v14 removeItemAtPath:v15 error:a6])
  {
    char v17 = 0;
  }
  else
  {
    [a1 writeAttributes:v11 toURL:v10];
    v16 = [v10 path];
    char v17 = [v14 moveItemAtPath:v16 toPath:v15 error:a6];
  }
  return v17;
}

+ (void)removeTemporaryDirectoryAtURL:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x263F08850];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  [v5 removeItemAtURL:v4 error:0];
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_saveURL, 0);
}

@end