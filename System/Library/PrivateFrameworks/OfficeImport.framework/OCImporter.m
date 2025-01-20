@interface OCImporter
+ (BOOL)URLIsXML:(id)a3;
+ (Class)binaryReaderClass;
+ (Class)readerClassForURL:(id)a3;
+ (Class)xmlReaderClass;
+ (id)xmlPathExtensions;
+ (void)initialize;
- (BOOL)isDocumentEncryptedUnsupportedVersion:(BOOL *)a3 errorMessage:(id *)a4;
- (BOOL)isDocumentEncryptedUnsupportedVersionHelper:(BOOL *)a3 errorMessage:(id *)a4 readError:(BOOL *)a5;
- (BOOL)isXML;
- (BOOL)setPassphrase:(id)a3;
- (BOOL)start;
- (BOOL)tryAlternateReader;
- (Class)readerClass;
- (NSString)lastPasswordAttempted;
- (OCImporter)initWithData:(id)a3;
- (OCImporter)initWithURL:(id)a3;
- (OITSUProgressContext)progressContext;
- (id)displayName;
- (id)filename;
- (id)officeDOMInspector;
- (id)url;
- (void)dealloc;
- (void)finalizeWithDocumentState:(id)a3;
- (void)setLastPasswordAttempted:(id)a3;
- (void)setOfficeDOMInspector:(id)a3;
- (void)setProgressContext:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation OCImporter

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

- (OCImporter)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OCImporter;
  v5 = [(OCMapper *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(OCImporter *)v5 setURL:v4];
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)+[CXCommon ignoreExternalEntityLoader]);
  }

  return v6;
}

- (OCImporter)initWithData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OCImporter;
  v6 = [(OCMapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mData, a3);
  }

  return v7;
}

- (void)dealloc
{
  xmlSetExternalEntityLoader((xmlExternalEntityLoader)+[CXCommon defaultExternalEntityLoader]);
  v3.receiver = self;
  v3.super_class = (Class)OCImporter;
  [(OCImporter *)&v3 dealloc];
}

- (id)url
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
  id v5 = (NSURL *)a3;
  if (self->mURL != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mURL, a3);
    id v5 = v6;
  }
}

- (BOOL)tryAlternateReader
{
  return self->mTryAlternateReader;
}

- (BOOL)isDocumentEncryptedUnsupportedVersionHelper:(BOOL *)a3 errorMessage:(id *)a4 readError:(BOOL *)a5
{
  if ([(OCImporter *)self start])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = self->mReader;
      int v21 = 0;
      if ([(OCDReader *)v9 retainDecryptorWithErrorCode:&v21])
      {
        v10 = [(OCDReader *)v9 decryptor];
        char v11 = [v10 isReadProtectedUsingDefaultPassphrase];

        if ((v11 & 1) == 0)
        {
          *a3 = 0;
          BOOL v12 = 1;
LABEL_18:

          return v12;
        }
      }
      else
      {
        int v19 = v21;
        if (v21 == 8011 || v21 == 8001)
        {
          [(OCDReader *)self->mReader verifyFileFormat];
          int v19 = v21;
        }
        if (v19 == 8003)
        {
          BOOL v12 = 1;
          *a3 = 1;
          if (a4) {
            *a4 = (id) kErrorMessageUnsupportedEncryption;
          }
          goto LABEL_18;
        }
      }
      BOOL v12 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v13 = [(OCDReader *)self->mReader startError];
    v14 = v13;
    if (v13)
    {
      v15 = [v13 localizedDescription];
      v16 = [(id)TCInvalidFileFormatMessage messageText];
      int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        *a5 = 1;
        v18 = [v14 localizedDescription];
        *a4 = (id)[v18 copy];
      }
    }
  }
  return 0;
}

- (BOOL)isDocumentEncryptedUnsupportedVersion:(BOOL *)a3 errorMessage:(id *)a4
{
  char v9 = 0;
  BOOL result = [(OCImporter *)self isDocumentEncryptedUnsupportedVersionHelper:a3 errorMessage:a4 readError:&v9];
  if (!result && v9)
  {
    if (self->mTryAlternateReader)
    {
      return 0;
    }
    else
    {
      mReader = self->mReader;
      self->mReader = 0;

      self->mTryAlternateReader = 1;
      *a4 = 0;
      return [(OCImporter *)self isDocumentEncryptedUnsupportedVersionHelper:a3 errorMessage:a4 readError:&v9];
    }
  }
  return result;
}

- (BOOL)setPassphrase:(id)a3
{
  id v4 = a3;
  id v5 = self->mReader;
  v6 = [(OCDReader *)v5 decryptor];
  int v7 = [v6 verifyPassphrase:v4];

  if (v7) {
    [(OCImporter *)self setLastPasswordAttempted:v4];
  }

  return v7;
}

- (id)filename
{
  return [(OCDReader *)self->mReader fileName];
}

- (id)displayName
{
  v2 = [(OCDReader *)self->mReader fileName];
  objc_super v3 = [v2 lastPathComponent];

  return v3;
}

- (void)finalizeWithDocumentState:(id)a3
{
  id v4 = a3;
  +[TCProgressContext createStageWithSteps:@"Background objects" takingSteps:100.0 name:10.0];
  objc_super v3 = [v4 backgroundThreadManager];
  [v3 waitUntilComplete];

  +[TCProgressContext endStage];
  +[TCMessageContext reportWarningsToDelegate];
}

+ (id)xmlPathExtensions
{
  v2 = [NSString stringWithUTF8String:"+[OCImporter xmlPathExtensions]"];
  objc_super v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 211, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  int v7 = NSString;
  objc_super v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "+[OCImporter xmlPathExtensions]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (Class)binaryReaderClass
{
  v2 = [NSString stringWithUTF8String:"+[OCImporter binaryReaderClass]"];
  objc_super v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 216, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  int v7 = NSString;
  objc_super v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "+[OCImporter binaryReaderClass]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (Class)xmlReaderClass
{
  v2 = [NSString stringWithUTF8String:"+[OCImporter xmlReaderClass]"];
  objc_super v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeCommon/ImportExport/OCImporter.mm"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[OITSUAssertionHandler handleFailureInFunction:v2, v3, 221, 0, "Abstract method not overridden by %@", v5 file lineNumber isFatal description];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v6 = (void *)MEMORY[0x263EFF940];
  int v7 = NSString;
  objc_super v8 = (objc_class *)objc_opt_class();
  char v9 = NSStringFromClass(v8);
  v10 = [v7 stringWithFormat:@"Abstract method not overridden by %@: %s", v9, "+[OCImporter xmlReaderClass]"];
  id v11 = [v6 exceptionWithName:*MEMORY[0x263EFF498] reason:v10 userInfo:0];

  objc_exception_throw(v11);
}

+ (BOOL)URLIsXML:(id)a3
{
  id v4 = [a3 pathExtension];
  id v5 = [v4 lowercaseString];

  v6 = [a1 xmlPathExtensions];
  LOBYTE(a1) = [v6 indexOfObject:v5] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a1;
}

+ (Class)readerClassForURL:(id)a3
{
  id v4 = a3;
  if ([a1 URLIsXML:v4]) {
    id v5 = (void *)[a1 xmlReaderClass];
  }
  else {
    id v5 = (void *)[a1 binaryReaderClass];
  }
  v6 = v5;

  return v6;
}

- (BOOL)isXML
{
  objc_super v3 = objc_opt_class();
  mURL = self->mURL;
  return [v3 URLIsXML:mURL];
}

- (Class)readerClass
{
  int v3 = [(OCImporter *)self isXML];
  int v4 = [(OCImporter *)self tryAlternateReader];
  id v5 = objc_opt_class();
  if (v3 == v4) {
    v6 = (void *)[v5 binaryReaderClass];
  }
  else {
    v6 = (void *)[v5 xmlReaderClass];
  }
  return (Class)v6;
}

- (OITSUProgressContext)progressContext
{
  return (OITSUProgressContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setProgressContext:(id)a3
{
}

- (id)officeDOMInspector
{
  return self->mOfficeDOMInspector;
}

- (void)setOfficeDOMInspector:(id)a3
{
}

- (NSString)lastPasswordAttempted
{
  return self->_lastPasswordAttempted;
}

- (void)setLastPasswordAttempted:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPasswordAttempted, 0);
  objc_storeStrong(&self->mOfficeDOMInspector, 0);
  objc_storeStrong((id *)&self->mProgressContext, 0);
  objc_storeStrong((id *)&self->mReader, 0);
  objc_storeStrong((id *)&self->mData, 0);
  objc_storeStrong((id *)&self->mURL, 0);
}

- (BOOL)start
{
  return 0;
}

@end