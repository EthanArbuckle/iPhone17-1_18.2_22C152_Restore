@interface OCCEncryptor
+ (id)allocTempFileWithBase:(id)a3 filename:(id *)a4;
- (BOOL)encrypt;
- (BOOL)encryptIntoOutputFile;
- (NSString)outputFilename;
- (OCCEncryptor)initWithStreamer:(OCCStreamer *)a3;
- (void)dealloc;
@end

@implementation OCCEncryptor

- (void)dealloc
{
  mStreamer = self->mStreamer;
  if (mStreamer) {
    (*((void (**)(OCCStreamer *, SEL))mStreamer->var0 + 1))(mStreamer, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)OCCEncryptor;
  [(OCCEncryptor *)&v4 dealloc];
}

- (OCCEncryptor)initWithStreamer:(OCCStreamer *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)OCCEncryptor;
  objc_super v4 = [(OCCEncryptor *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->mStreamer = a3;
    var2 = a3->var2;
    if (var2)
    {
      uint64_t v7 = [[NSString alloc] initWithUTF8String:var2];
      mOutputFilename = v5->mOutputFilename;
      v5->mOutputFilename = (NSString *)v7;
    }
  }
  return v5;
}

- (BOOL)encrypt
{
  v2 = self;
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  LOBYTE(v2) = [(OCCEncryptor *)v2 encryptIntoOutputFile];
  return (char)v2;
}

- (BOOL)encryptIntoOutputFile
{
  v3 = fopen([(NSString *)self->mOutputFilename UTF8String], "w+b");
  if (v3)
  {
    objc_super v4 = v3;
    char v5 = (*((uint64_t (**)(OCCStreamer *, FILE *))self->mStreamer->var0 + 5))(self->mStreamer, v3);
    fclose(v4);
    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (id)allocTempFileWithBase:(id)a3 filename:(id *)a4
{
  char v5 = NSString;
  v6 = [a3 lastPathComponent];
  uint64_t v7 = [v5 stringWithFormat:@"%@.XXXXXX", v6];

  v8 = NSTemporaryDirectory();
  v9 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v9)
  {
    uint64_t v10 = [NSString stringWithUTF8String:v9];

    v8 = (void *)v10;
  }
  v11 = [v8 stringByAppendingPathComponent:v7];
  v12 = [(NSString *)v11 fileSystemRepresentation];
  v13 = [MEMORY[0x263F08850] defaultManager];
  if ([v13 fileExistsAtPath:v11] && (TCRemoveFileSecurely(v11) & 1) == 0) {
    goto LABEL_9;
  }
  size_t v14 = strlen(v12);
  v15 = (char *)malloc_type_malloc(v14 + 1, 0xB42769BCuLL);
  v16 = v15;
  if (!v15) {
    goto LABEL_9;
  }
  v17 = strcpy(v15, v12);
  uint64_t v18 = mkstemp(v17);
  if (v18 == -1)
  {
    free(v16);
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v19 = [MEMORY[0x263F08850] defaultManager];
  *a4 = [v19 stringWithFileSystemRepresentation:v16 length:strlen(v16)];

  free(v16);
  v20 = (void *)[objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v18];
LABEL_10:

  return v20;
}

- (NSString)outputFilename
{
  return self->mOutputFilename;
}

- (void).cxx_destruct
{
}

@end