@interface TSUSafeSaveAssistant
+ (BOOL)finishWritingToURL:(id)a3 byMovingOrCopyingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
+ (void)writeAttributes:(id)a3 toURL:(id)a4;
- (BOOL)endSaveWithSuccess:(BOOL)a3 addingAttributes:(id)a4 error:(id *)a5;
- (BOOL)endSaveWithSuccess:(BOOL)a3 toURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6;
- (NSURL)writeURL;
- (TSUSafeSaveAssistant)init;
- (id)initForSavingToURL:(id)a3 error:(id *)a4;
@end

@implementation TSUSafeSaveAssistant

- (TSUSafeSaveAssistant)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUSafeSaveAssistant init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSafeSaveAssistant.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:22 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUSafeSaveAssistant init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)initForSavingToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    v21.receiver = self;
    v21.super_class = (Class)TSUSafeSaveAssistant;
    id v7 = [(TSUSafeSaveAssistant *)&v21 init];
    if (v7)
    {
      uint64_t v8 = [v6 copy];
      saveURL = v7->_saveURL;
      v7->_saveURL = (NSURL *)v8;

      id v20 = 0;
      v10 = [[OITSUTemporaryDirectory alloc] initForWritingToURL:v6 error:&v20];
      id v11 = v20;
      temporaryDirectory = v7->_temporaryDirectory;
      v7->_temporaryDirectory = v10;

      v13 = v7->_temporaryDirectory;
      if (v13)
      {
        v14 = [(OITSUTemporaryDirectory *)v13 URL];
        v15 = [(NSURL *)v7->_saveURL lastPathComponent];
        uint64_t v16 = [v14 URLByAppendingPathComponent:v15];
        writeURL = v7->_writeURL;
        v7->_writeURL = (NSURL *)v16;
      }
      else
      {
        v14 = v7;
        id v7 = 0;
      }

      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
      id v11 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
    *a4 = v11;
LABEL_11:
    self = v7;

    v18 = self;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_12:

  return v18;
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
  if (!self->_temporaryDirectory)
  {
    v14 = [NSString stringWithUTF8String:"-[TSUSafeSaveAssistant endSaveWithSuccess:toURL:addingAttributes:error:]"];
    v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUSafeSaveAssistant.m"];
    uint64_t v16 = NSStringFromSelector(a2);
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 57, 0, "%{public}@ should only be called once.", v16);

    +[OITSUAssertionHandler logBacktraceThrottled];
    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_5:
    char v13 = 0;
    goto LABEL_6;
  }
  char v13 = [(id)objc_opt_class() finishWritingToURL:v11 byMovingOrCopyingItemAtURL:self->_writeURL addingAttributes:v12 error:a6];
LABEL_6:
  temporaryDirectory = self->_temporaryDirectory;
  self->_temporaryDirectory = 0;

  return v13;
}

+ (void)writeAttributes:(id)a3 toURL:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  id v6 = [v9 objectForKey:*MEMORY[0x263F08010]];
  if ([v9 count] != (v6 != 0) || objc_msgSend(v6, "BOOLValue"))
  {
    id v7 = [v5 path];
    if (v7)
    {
      BOOL v8 = [MEMORY[0x263F08850] defaultManager];
      [v8 setAttributes:v9 ofItemAtPath:v7 error:0];
    }
  }
}

+ (BOOL)finishWritingToURL:(id)a3 byMovingOrCopyingItemAtURL:(id)a4 addingAttributes:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [MEMORY[0x263F08850] defaultManager];
  v14 = [v10 path];
  if ([v13 fileExistsAtPath:v14])
  {
    id v28 = 0;
    v15 = [[TSUExtendedAttributeCollection alloc] initWithPath:v14 options:0 error:&v28];
    id v16 = v28;
    id v17 = v16;
    if (!v15)
    {
      LOBYTE(v20) = 0;
      goto LABEL_11;
    }
    v24 = a6;
    id v27 = v16;
    int v18 = [v13 removeItemAtURL:v10 error:&v27];
    id v19 = v27;

    if (!v18)
    {
      LOBYTE(v20) = 0;
      id v17 = v19;
      a6 = v24;
      if (!v24) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    a6 = v24;
  }
  else
  {
    v15 = 0;
    id v19 = 0;
  }
  [a1 writeAttributes:v12 toURL:v11];
  id v26 = v19;
  int v20 = [v13 moveItemAtURL:v11 toURL:v10 error:&v26];
  id v17 = v26;

  if (v20 && v15)
  {
    id v25 = v17;
    LOBYTE(v20) = [(TSUExtendedAttributeCollection *)v15 setAttributeCollectionToPath:v14 intent:2 options:0 error:&v25];
    objc_super v21 = a6;
    id v22 = v25;

    id v17 = v22;
    a6 = v21;
    if (!v21) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_11:
  if (a6) {
LABEL_12:
  }
    *a6 = v17;
LABEL_13:

  return v20;
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeURL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_saveURL, 0);
}

@end