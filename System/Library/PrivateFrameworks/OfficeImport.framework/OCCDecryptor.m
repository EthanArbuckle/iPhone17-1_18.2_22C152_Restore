@interface OCCDecryptor
+ (id)agileDescriptorNamespace;
+ (id)agilePasswordKeyEncryptorNamespace;
+ (id)allocTempFileWithBase:(id)a3 outFilename:(id *)a4 tempDirectory:(id *)a5;
- (BOOL)decrypt;
- (BOOL)decryptIntoOutputFile;
- (BOOL)isReadProtectedUsingDefaultPassphrase;
- (BOOL)verifyPassphrase:(id)a3;
- (NSString)outputFilename;
- (OCCDecryptor)initWithStreamer:(OCCStreamer *)a3;
- (void)dealloc;
- (void)deleteOutputFile;
@end

@implementation OCCDecryptor

- (void)dealloc
{
  [(OCCDecryptor *)self deleteOutputFile];
  mStreamer = self->mStreamer;
  if (mStreamer) {
    (*((void (**)(OCCStreamer *))mStreamer->var0 + 1))(mStreamer);
  }
  v4.receiver = self;
  v4.super_class = (Class)OCCDecryptor;
  [(OCCDecryptor *)&v4 dealloc];
}

- (OCCDecryptor)initWithStreamer:(OCCStreamer *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OCCDecryptor;
  objc_super v4 = [(OCCDecryptor *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->mStreamer = a3;
    var2 = a3->var2;
    if (var2)
    {
      uint64_t v7 = [[NSString alloc] initWithUTF8String:var2];
      mBaseStringForOutputFilename = v5->mBaseStringForOutputFilename;
      v5->mBaseStringForOutputFilename = (NSString *)v7;
    }
  }
  return v5;
}

- (BOOL)isReadProtectedUsingDefaultPassphrase
{
  uint64_t v3 = (*((uint64_t (**)(OCCStreamer *, SEL))self->mStreamer->var0 + 2))(self->mStreamer, a2);
  if (!v3) {
    return 0;
  }
  objc_super v4 = [NSString stringWithUTF8String:v3];
  BOOL v5 = [(OCCDecryptor *)self verifyPassphrase:v4];

  return v5;
}

- (void)deleteOutputFile
{
  mOutputFilename = self->mOutputFilename;
  if (mOutputFilename)
  {
    TCRemoveFileSecurely(mOutputFilename);
    objc_super v4 = self->mOutputFilename;
    self->mOutputFilename = 0;
  }
  mTempDirectory = self->mTempDirectory;
  if (mTempDirectory)
  {
    self->mTempDirectory = 0;
  }
}

- (BOOL)decrypt
{
  uint64_t v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  mBaseStringForOutputFilename = self->mBaseStringForOutputFilename;
  if (mBaseStringForOutputFilename) {
    BOOL v5 = mBaseStringForOutputFilename;
  }
  else {
    BOOL v5 = @"temp.tmp";
  }
  id v13 = 0;
  id v14 = 0;
  v6 = (void *)[(id)objc_opt_class() allocTempFileWithBase:v5 outFilename:&v14 tempDirectory:&v13];
  id v7 = v14;
  id v8 = v14;
  id v9 = v13;
  id v10 = v13;
  objc_storeStrong((id *)&self->mOutputFilename, v7);
  objc_storeStrong((id *)&self->mTempDirectory, v9);
  if (v6)
  {
    [v6 closeFile];
    BOOL v11 = [(OCCDecryptor *)self decryptIntoOutputFile];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)verifyPassphrase:(id)a3
{
  var1 = self->mStreamer->var1;
  id v4 = [a3 getDataUsingOfficeCryptographicEncoding];
  LOBYTE(var1) = OCCCryptoKey::verifyPassphrase(var1, (const void *)[v4 bytes], objc_msgSend(v4, "length"));

  return (char)var1;
}

- (BOOL)decryptIntoOutputFile
{
  uint64_t v3 = fopen([(NSString *)self->mOutputFilename UTF8String], "w+b");
  if (v3)
  {
    id v4 = v3;
    char v5 = (*((uint64_t (**)(OCCStreamer *, FILE *))self->mStreamer->var0 + 4))(self->mStreamer, v3);
    fclose(v4);
    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (id)allocTempFileWithBase:(id)a3 outFilename:(id *)a4 tempDirectory:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 pathExtension];
  id v9 = NSString;
  id v10 = [v7 lastPathComponent];
  BOOL v11 = [v10 stringByDeletingPathExtension];
  v12 = [v9 stringWithFormat:@"%@.XXXXXX.%@", v11, v8];

  id v29 = 0;
  id v13 = [[OITSUTemporaryDirectory alloc] initWithError:&v29];
  id v14 = v29;
  v15 = v14;
  if (v13)
  {
    v16 = [(OITSUTemporaryDirectory *)v13 path];
    v17 = [v16 stringByAppendingPathComponent:v12];

    if (a5) {
      *a5 = v13;
    }
    v18 = v17;
    v19 = [(NSString *)v18 fileSystemRepresentation];
    v20 = [MEMORY[0x263F08850] defaultManager];
    if (![v20 fileExistsAtPath:v18] || (TCRemoveFileSecurely(v18) & 1) != 0)
    {
      if (v19)
      {
        v28 = a4;
        size_t v21 = strlen(v19);
        v22 = (char *)malloc_type_malloc(v21 + 1, 0xA862CACBuLL);
        v23 = v22;
        if (v22)
        {
          strcpy(v22, v19);
          uint64_t v24 = mkstemps(v23, [v8 length] + 1);
          if (v24 != -1)
          {
            v25 = [MEMORY[0x263F08850] defaultManager];
            id *v28 = [v25 stringWithFileSystemRepresentation:v23 length:strlen(v23)];

            free(v23);
            v26 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v24];
LABEL_14:

            goto LABEL_15;
          }
          free(v23);
        }
      }
      else
      {
        NSLog((NSString *)@"[TSUTemporaryDirectory] Temporary file system representation is null");
      }
    }
    v26 = 0;
    goto LABEL_14;
  }
  NSLog((NSString *)@"[TSUTemporaryDirectory] Could not create temporary directory : %@", v14);
  v26 = 0;
LABEL_15:

  return v26;
}

- (NSString)outputFilename
{
  return self->mOutputFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseStringForOutputFilename, 0);
  objc_storeStrong((id *)&self->mOutputFilename, 0);
  objc_storeStrong((id *)&self->mTempDirectory, 0);
}

+ (id)agileDescriptorNamespace
{
  v2 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/2006/encryption"];
  return v2;
}

+ (id)agilePasswordKeyEncryptorNamespace
{
  v2 = [[CXNamespace alloc] initWithUri:"http://schemas.microsoft.com/office/2006/keyEncryptor/password"];
  return v2;
}

@end