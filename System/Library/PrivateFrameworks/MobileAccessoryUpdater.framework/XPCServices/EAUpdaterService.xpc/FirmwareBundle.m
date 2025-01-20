@interface FirmwareBundle
+ (id)defaultBundlePath;
- (FirmwareBundle)initWithBundle:(id)a3;
- (FirmwareBundle)initWithBundleName:(id)a3;
- (FirmwareBundle)initWithBundlePath:(id)a3;
- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6;
- (NSData)certificate;
- (NSData)firmwareImage;
- (NSData)hash;
- (NSData)signature;
- (NSDictionary)buildManifest;
- (NSURL)firmwareLocalURL;
- (id)description;
- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4;
- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (id)parseResourceFileIntoData:(id)a3;
- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4;
- (unsigned)firmwareImageBaseAddress;
- (unsigned)firmwareImageSize;
- (unsigned)productIDCode;
- (void)calculateHash;
- (void)dealloc;
- (void)loadFirmwareImage;
- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5;
- (void)parseSRECLine:(id)a3 intoImage:(id)a4;
- (void)setBuildManifest:(id)a3;
- (void)setProductIDCode:(unsigned int)a3;
@end

@implementation FirmwareBundle

+ (id)defaultBundlePath
{
  v2 = [+[NSBundle mainBundle] resourcePath];
  return [(NSString *)v2 stringByAppendingFormat:@"/FirmwareBundles/"];
}

- (void)calculateHash
{
  uint64_t v11 = 0;
  firmwareLocalURL = self->_firmwareLocalURL;
  if (firmwareLocalURL)
  {
    HashForDataAtLocationAsData = (NSData *)generateHashForDataAtLocationAsData((uint64_t)firmwareLocalURL, 10, (uint64_t)&v11);
    self->_hash = HashForDataAtLocationAsData;
    v5 = HashForDataAtLocationAsData;
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    uint64_t v6 = ccsha256_di();
    NSLog(@"%s: hash not provided by asset. creating sha256 on the fly imageSize=%d\n", "-[FirmwareBundle calculateHash]", self->_firmwareImageSize);
    __chkstk_darwin();
    v8 = (char *)&v10 - v7;
    ccdigest_init();
    [(NSData *)self->_firmwareImage bytes];
    ccdigest_update();
    (*(void (**)(uint64_t, char *, _OWORD *))(v6 + 56))(v6, v8, v12);
    v9 = +[NSData dataWithBytes:v12 length:32];
    self->_hash = v9;
    NSLog(@"hash created %@\n", v9);
  }
}

- (FirmwareBundle)initWithData:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v6 = self;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)FirmwareBundle;
    uint64_t v6 = [(FirmwareBundle *)&v23 init];
    if (v6)
    {
      v6->_firmwareImage = (NSData *)a3;
      v6->_firmwareImageSize = [a3 length];
      v6->_hash = (NSData *)a4;
      v6->_signature = (NSData *)a5;
      v6->_certificate = (NSData *)a6;
      *(void *)&v6->_productIDCode = 0;
      v6->_bundleDescription = 0;
      v6->_buildManifest = 0;
      if (!v6->_hash) {
        [(FirmwareBundle *)v6 calculateHash];
      }
      firmwareImage = v6->_firmwareImage;
      v12 = "valid";
      if (firmwareImage) {
        v13 = "valid";
      }
      else {
        v13 = "nil";
      }
      id v14 = [(NSData *)firmwareImage length];
      hash = v6->_hash;
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      id v17 = [(NSData *)hash length];
      signature = v6->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      id v20 = [(NSData *)signature length];
      certificate = v6->_certificate;
      if (!certificate) {
        v12 = "nil";
      }
      NSLog(@"%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n", "-[FirmwareBundle initWithData:hashData:signatureData:certData:]", v13, v14, v16, v17, v19, v20, v12, [(NSData *)certificate length], v6->_productIDCode);
    }
    else
    {
      NSLog(@"%s: super init failed\n", "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
    }
  }
  else
  {
    NSLog(@"%s: null payload\n", "-[FirmwareBundle initWithData:hashData:signatureData:certData:]");
  }
  return v6;
}

- (FirmwareBundle)initWithURL:(id)a3 hashData:(id)a4 signatureData:(id)a5 certData:(id)a6
{
  uint64_t v25 = 0;
  if ([a3 checkResourceIsReachableAndReturnError:&v25])
  {
    v24.receiver = self;
    v24.super_class = (Class)FirmwareBundle;
    uint64_t v11 = [(FirmwareBundle *)&v24 init];
    if (v11)
    {
      v11->_firmwareLocalURL = (NSURL *)a3;
      v11->_hash = (NSData *)a4;
      v11->_signature = (NSData *)a5;
      v11->_certificate = (NSData *)a6;
      *(void *)&v11->_productIDCode = 0;
      v11->_bundleDescription = 0;
      v11->_buildManifest = 0;
      id v23 = 0;
      [a3 getResourceValue:&v23 forKey:NSURLFileSizeKey error:&v25];
      v11->_firmwareImageSize = [v23 unsignedIntValue];
      if (!v11->_hash) {
        [(FirmwareBundle *)v11 calculateHash];
      }
      firmwareLocalURL = v11->_firmwareLocalURL;
      id v13 = [(NSData *)v11->_firmwareImage length];
      hash = v11->_hash;
      v15 = "valid";
      if (hash) {
        v16 = "valid";
      }
      else {
        v16 = "nil";
      }
      id v17 = [(NSData *)hash length];
      signature = v11->_signature;
      if (signature) {
        v19 = "valid";
      }
      else {
        v19 = "nil";
      }
      id v20 = [(NSData *)signature length];
      certificate = v11->_certificate;
      if (!certificate) {
        v15 = "nil";
      }
      NSLog(@"%s: I=%@[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d\n", "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]", firmwareLocalURL, v13, v16, v17, v19, v20, v15, [(NSData *)certificate length], v11->_productIDCode);
    }
    else
    {
      NSLog(@"%s: super init failed\n", "-[FirmwareBundle initWithURL:hashData:signatureData:certData:]");
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100014340((uint64_t)a3);
    }
    return 0;
  }
  return v11;
}

- (FirmwareBundle)initWithBundle:(id)a3
{
  id v35 = 0;
  uint64_t v36 = 0;
  v34.receiver = self;
  v34.super_class = (Class)FirmwareBundle;
  v4 = [(FirmwareBundle *)&v34 init];
  if (!v4) {
    goto LABEL_37;
  }
  id v5 = [a3 objectForInfoDictionaryKey:@"FirmwareImageBaseAddress"];
  id v6 = [a3 objectForInfoDictionaryKey:@"FirmwareImageSize"];
  id v7 = [a3 objectForInfoDictionaryKey:@"FirmwareImageFile"];
  if (!v7) {
    goto LABEL_37;
  }
  id v8 = v7;
  id v9 = [a3 objectForInfoDictionaryKey:@"HashFile"];
  id v10 = [a3 objectForInfoDictionaryKey:@"CertificateFile"];
  id v11 = [a3 objectForInfoDictionaryKey:@"SignatureFile"];
  id v12 = [a3 objectForInfoDictionaryKey:@"CFBundleIdentifier"];
  if (!v12) {
    goto LABEL_37;
  }
  id v13 = v12;
  NSLog(@"%s: Info Name Keys [I:%@ H:%@ S:%@ C=%@]\n", "-[FirmwareBundle initWithBundle:]", v8, v9, v11, v10);
  if (v5) {
    [+[NSScanner scannerWithString:v5] scanHexInt:&v4->_firmwareImageBaseAddress];
  }
  if (v6)
  {
    [+[NSScanner scannerWithString:v6] scanHexInt:&v4->_firmwareImageSize];
  }
  else
  {
    [(FirmwareBundle *)v4 parseFileName:v8 intoPath:&v36 andExtension:&v35];
    unint64_t v14 = -[NSDictionary fileSize](-[NSFileManager attributesOfItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "attributesOfItemAtPath:error:", [a3 pathForResource:v36 ofType:v35], 0), "fileSize");
    v4->_firmwareImageSize = v14;
    NSLog(@"%s: imageFileSize unspecified by asset. using file size=%d\n", "-[FirmwareBundle initWithBundle:]", v14);
  }
  id v15 = [a3 objectForInfoDictionaryKey:@"DefaultFillByte"];
  if (v15)
  {
    int v33 = 0;
    [+[NSScanner scannerWithString:v15] scanHexInt:&v33];
    unsigned __int8 v16 = v33;
  }
  else
  {
    unsigned __int8 v16 = -1;
  }
  [(FirmwareBundle *)v4 parseFileName:v8 intoPath:&v36 andExtension:&v35];
  if (![v35 caseInsensitiveCompare:@"s19"])
  {
    v19 = -[FirmwareBundle parseSRECFile:withDefaultByteValue:](v4, "parseSRECFile:withDefaultByteValue:", [a3 pathForResource:v36 ofType:v35], v16);
    goto LABEL_16;
  }
  id v17 = [v35 caseInsensitiveCompare:@"bin"];
  id v18 = [a3 pathForResource:v36 ofType:v35];
  if (v17)
  {
    v19 = [(FirmwareBundle *)v4 parseMSP430TXTFile:v18 withDefaultByteValue:v16];
LABEL_16:
    uint64_t v20 = 40;
    goto LABEL_18;
  }
  v19 = +[NSURL fileURLWithPath:v18];
  uint64_t v20 = 80;
LABEL_18:
  *(Class *)((char *)&v4->super.isa + v20) = (Class)v19;
  [(FirmwareBundle *)v4 parseFileName:@"BuildManifest.plist" intoPath:&v36 andExtension:&v35];
  v4->_buildManifest = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", [a3 pathForResource:v36 ofType:v35]);
  if (v9)
  {
    [(FirmwareBundle *)v4 parseFileName:v9 intoPath:&v36 andExtension:&v35];
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      v21 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      v21 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_hash = v21;
    if (!v10) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  [(FirmwareBundle *)v4 calculateHash];
  if (v10)
  {
LABEL_25:
    [(FirmwareBundle *)v4 parseFileName:v10 intoPath:&v36 andExtension:&v35];
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      v22 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      v22 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_certificate = v22;
  }
LABEL_29:
  if (v11)
  {
    [(FirmwareBundle *)v4 parseFileName:v11 intoPath:&v36 andExtension:&v35];
    if ([v35 caseInsensitiveCompare:@"bin"]) {
      id v23 = -[FirmwareBundle parseResourceFileIntoData:](v4, "parseResourceFileIntoData:", [a3 pathForResource:v36 ofType:v35]);
    }
    else {
      id v23 = +[NSData dataWithContentsOfFile:](NSData, "dataWithContentsOfFile:", [a3 pathForResource:v36 ofType:v35]);
    }
    v4->_signature = v23;
  }
  id v24 = [v13 componentsSeparatedByString:@"."];
  if (v24) {
    LODWORD(v24) = objc_msgSend(objc_msgSend(v24, "lastObject"), "intValue");
  }
  v4->_productIDCode = v24;
  v4->_bundleDescription = (NSString *)objc_msgSend(objc_msgSend(a3, "bundlePath"), "lastPathComponent");
LABEL_37:
  if ([(FirmwareBundle *)v4 firmwareImage]) {
    uint64_t v25 = "valid";
  }
  else {
    uint64_t v25 = "nil";
  }
  uint64_t v26 = [(FirmwareBundle *)v4 firmwareImageSize];
  if ([(FirmwareBundle *)v4 hash]) {
    v27 = "valid";
  }
  else {
    v27 = "nil";
  }
  id v28 = [(NSData *)[(FirmwareBundle *)v4 hash] length];
  if ([(FirmwareBundle *)v4 signature]) {
    v29 = "valid";
  }
  else {
    v29 = "nil";
  }
  id v30 = [(NSData *)[(FirmwareBundle *)v4 signature] length];
  if ([(FirmwareBundle *)v4 certificate]) {
    v31 = "valid";
  }
  else {
    v31 = "nil";
  }
  NSLog(@"%s: I=%s[%lu] H=%s[%lu] S=%s[%lu] C=%s[%lu] productID=%d baseAddress=%d\n", "-[FirmwareBundle initWithBundle:]", v25, v26, v27, v28, v29, v30, v31, [(NSData *)[(FirmwareBundle *)v4 certificate] length], [(FirmwareBundle *)v4 productIDCode], [(FirmwareBundle *)v4 firmwareImageBaseAddress]);
  return v4;
}

- (FirmwareBundle)initWithBundlePath:(id)a3
{
  v4 = +[NSBundle bundleWithPath:a3];
  return [(FirmwareBundle *)self initWithBundle:v4];
}

- (FirmwareBundle)initWithBundleName:(id)a3
{
  id v4 = objc_msgSend(+[FirmwareBundle defaultBundlePath](FirmwareBundle, "defaultBundlePath"), "stringByAppendingString:", a3);
  return [(FirmwareBundle *)self initWithBundlePath:v4];
}

- (void)loadFirmwareImage
{
  if ([(NSURL *)self->_firmwareLocalURL checkResourceIsReachableAndReturnError:0])
  {
    self->_firmwareImage = (NSData *)[objc_alloc((Class)NSData) initWithContentsOfURL:self->_firmwareLocalURL];
  }
}

- (id)getFirmwareDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  firmwareFilehandle = self->_firmwareFilehandle;
  if (!firmwareFilehandle)
  {
    firmwareFilehandle = +[NSFileHandle fileHandleForReadingFromURL:self->_firmwareLocalURL error:a4];
    self->_firmwareFilehandle = firmwareFilehandle;
    if (!firmwareFilehandle) {
      return 0;
    }
  }
  if (![(NSFileHandle *)firmwareFilehandle uarpSeekToOffset:location error:a4])return 0; {
  id v9 = self->_firmwareFilehandle;
  }
  return [(NSFileHandle *)v9 uarpReadDataUpToLength:length error:a4];
}

- (void)parseFileName:(id)a3 intoPath:(id *)a4 andExtension:(id *)a5
{
  id v8 = [a3 pathExtension];
  *a5 = v8;
  if ([v8 caseInsensitiveCompare:@"txt"]
    && [*a5 caseInsensitiveCompare:@"s19"]
    && [*a5 caseInsensitiveCompare:@"bin"]
    && [*a5 caseInsensitiveCompare:@"plist"])
  {
    *a4 = a3;
    *a5 = @"txt";
  }
  else
  {
    *a4 = [a3 stringByDeletingPathExtension];
  }
}

- (id)parseResourceFileIntoData:(id)a3
{
  v3 = +[NSString stringWithContentsOfFile:a3 encoding:1 error:0];
  id v4 = +[NSMutableData dataWithCapacity:[(NSString *)v3 length] / 5];
  id v5 = +[NSScanner scannerWithString:v3];
  int v8 = 0;
  if ([(NSScanner *)v5 scanHexInt:&v8])
  {
    do
    {
      char v7 = v8;
      [(NSMutableData *)v4 appendBytes:&v7 length:1];
      [(NSScanner *)v5 scanCharactersFromSet:+[NSCharacterSet characterSetWithCharactersInString:@","] intoString:0];
    }
    while ([(NSScanner *)v5 scanHexInt:&v8]);
  }
  return v4;
}

- (id)parseMSP430TXTFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  char v7 = +[NSMutableData dataWithLength:self->_firmwareImageSize];
  memset([(NSMutableData *)v7 mutableBytes], v4, [(NSMutableData *)v7 length]);
  int v14 = 0;
  int v8 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", +[NSString stringWithContentsOfFile:a3 encoding:1 error:0]);
  if (![(NSScanner *)v8 isAtEnd])
  {
    do
    {
      id v13 = 0;
      if ([(NSScanner *)v8 scanUpToString:@"\n" intoString:&v13])
      {
        unsigned int v9 = [v13 characterAtIndex:0];
        if (v9 != 113)
        {
          if (v9 == 64)
          {
            -[NSScanner scanHexInt:](+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", [v13 substringFromIndex:1]), "scanHexInt:", &v14);
            v14 -= self->_firmwareImageBaseAddress;
          }
          else
          {
            id v10 = +[NSScanner scannerWithString:v13];
            if (![(NSScanner *)v10 isAtEnd])
            {
              do
              {
                int v12 = 0;
                [(NSScanner *)v10 scanHexInt:&v12];
                ++v14;
                -[NSMutableData replaceBytesInRange:withBytes:](v7, "replaceBytesInRange:withBytes:");
              }
              while (![(NSScanner *)v10 isAtEnd]);
            }
          }
        }
      }
    }
    while (![(NSScanner *)v8 isAtEnd]);
  }
  return v7;
}

- (void)parseSRECLine:(id)a3 intoImage:(id)a4
{
  int v16 = 0;
  char v7 = (const char *)[a3 cStringUsingEncoding:1];
  int v8 = *((unsigned __int8 *)v7 + 1);
  sscanf(v7 + 2, "%02x", &v16);
  uint64_t v9 = v16;
  if ((char *)[a3 length] - 4 == (unsigned char *)(2 * v9))
  {
    char v10 = v9;
    if (v9)
    {
      id v11 = v7 + 4;
      uint64_t v12 = (v9 - 1) + 1;
      id v13 = &v17;
      char v10 = v9;
      do
      {
        sscanf(v11, "%02x", &v16);
        v11 += 2;
        char v14 = v16;
        *(unsigned char *)id v13 = v16;
        id v13 = (unsigned __int16 *)((char *)v13 + 1);
        v10 += v14;
        --v12;
      }
      while (v12);
    }
    if (v10 == -1)
    {
      if (v8 != 48 && v8 != 57)
      {
        if (v8 == 49)
        {
          if (v9 <= 2) {
            NSLog(@"byte_count too low in parseSRECLine", v15);
          }
          else {
            objc_msgSend(a4, "replaceBytesInRange:withBytes:", (unsigned __int16)(_byteswap_ushort(v17) - self->_firmwareImageBaseAddress), (int)v9 - 3, v18);
          }
        }
        else
        {
          NSLog(@"Unhandled SREC record type in parseSRECLine", v15);
        }
      }
    }
    else
    {
      NSLog(@"checksum failure in parseSRECLine", v15);
    }
  }
  else
  {
    NSLog(@"parseSRECLine: Invalid byte_count %d in SREC text_line (%lu)", v9, (char *)[a3 length] - 4);
  }
}

- (id)parseSRECFile:(id)a3 withDefaultByteValue:(unsigned __int8)a4
{
  int v4 = a4;
  char v7 = +[NSMutableData dataWithLength:self->_firmwareImageSize];
  memset([(NSMutableData *)v7 mutableBytes], v4, [(NSMutableData *)v7 length]);
  int v8 = +[NSScanner scannerWithString:](NSScanner, "scannerWithString:", +[NSString stringWithContentsOfFile:a3 encoding:1 error:0]);
  if (![(NSScanner *)v8 isAtEnd])
  {
    do
    {
      uint64_t v10 = 0;
      if ([(NSScanner *)v8 scanUpToString:@"\n" intoString:&v10]) {
        [(FirmwareBundle *)self parseSRECLine:v10 intoImage:v7];
      }
    }
    while (![(NSScanner *)v8 isAtEnd]);
  }
  return v7;
}

- (void)dealloc
{
  [(NSFileHandle *)self->_firmwareFilehandle uarpCloseAndReturnError:0];
  v3.receiver = self;
  v3.super_class = (Class)FirmwareBundle;
  [(FirmwareBundle *)&v3 dealloc];
}

- (id)description
{
  return self->_bundleDescription;
}

- (NSData)firmwareImage
{
  return self->_firmwareImage;
}

- (NSDictionary)buildManifest
{
  return self->_buildManifest;
}

- (void)setBuildManifest:(id)a3
{
}

- (NSData)hash
{
  return self->_hash;
}

- (NSData)certificate
{
  return self->_certificate;
}

- (NSData)signature
{
  return self->_signature;
}

- (unsigned)productIDCode
{
  return self->_productIDCode;
}

- (void)setProductIDCode:(unsigned int)a3
{
  self->_productIDCode = a3;
}

- (unsigned)firmwareImageBaseAddress
{
  return self->_firmwareImageBaseAddress;
}

- (unsigned)firmwareImageSize
{
  return self->_firmwareImageSize;
}

- (NSURL)firmwareLocalURL
{
  return self->_firmwareLocalURL;
}

@end