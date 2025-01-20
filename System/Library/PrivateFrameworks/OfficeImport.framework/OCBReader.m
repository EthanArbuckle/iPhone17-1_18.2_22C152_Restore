@interface OCBReader
- (BOOL)isBinaryReader;
- (BOOL)retainDecryptorWithErrorCode:(int *)a3;
- (BOOL)start;
- (OCBReader)initWithCancelDelegate:(id)a3;
- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4;
- (OCCEncryptionInfoReader)encryptionInfoReader;
- (OcBinaryReader)binaryReader;
- (__sFILE)file;
- (id)allocDecryptorWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilename:(id)a4;
- (id)read;
- (void)closeFile;
- (void)dealloc;
- (void)restartReaderToUseDecryptedDocument;
- (void)setBinaryReader:(OcBinaryReader *)a3;
- (void)setFile:(__sFILE *)a3;
@end

@implementation OCBReader

- (void)setBinaryReader:(OcBinaryReader *)a3
{
  self->mBinaryReader = a3;
}

- (OcBinaryReader)binaryReader
{
  return self->mBinaryReader;
}

- (BOOL)retainDecryptorWithErrorCode:(int *)a3
{
  v5 = [(OCBReader *)self encryptionInfoReader];
  if (!v5) {
    return (char)v5;
  }
  if (self->super.mDecryptor)
  {
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  memset(v14, 0, sizeof(v14));
  v6 = [(OCBReader *)self encryptionInfoReader];
  if ((*((unsigned int (**)(OCCEncryptionInfoReader *, _DWORD *, _DWORD *, int *))v6->var0 + 2))(v6, &v14[1], v14, a3))
  {
    UsingEncryptionInfoBuffer = OCCCryptoKey::createUsingEncryptionInfoBuffer(0, *(unsigned __int16 **)&v14[1], (const void *)v14[0]);
    if (!UsingEncryptionInfoBuffer)
    {
      int v12 = 8003;
      goto LABEL_9;
    }
    v8 = UsingEncryptionInfoBuffer;
    v9 = [(OCDReader *)self fileName];
    v10 = [(OCBReader *)self allocDecryptorWithCryptoKey:v8 baseOutputFilename:v9];
    mDecryptor = self->super.mDecryptor;
    self->super.mDecryptor = v10;

    if (!self->super.mDecryptor)
    {
      int v12 = 8000;
LABEL_9:
      *a3 = v12;
    }
  }
  if (*(void *)&v14[1]) {
    MEMORY[0x23EC99790](*(void *)&v14[1], 0x1000C8077774924);
  }
  LOBYTE(v5) = self->super.mDecryptor != 0;
  return (char)v5;
}

- (void)dealloc
{
  mBinaryReader = self->mBinaryReader;
  if (mBinaryReader) {
    (*((void (**)(OcBinaryReader *, SEL))mBinaryReader->var0 + 1))(mBinaryReader, a2);
  }
  [(OCBReader *)self closeFile];
  v4.receiver = self;
  v4.super_class = (Class)OCBReader;
  [(OCBReader *)&v4 dealloc];
}

- (void)closeFile
{
  mFile = self->mFile;
  if (mFile)
  {
    fclose(mFile);
    self->mFile = 0;
  }
}

- (OCBReader)initWithCancelDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OCBReader;
  result = [(OCDReader *)&v4 initWithCancelDelegate:a3];
  if (result)
  {
    result->mBinaryReader = 0;
    result->mFile = 0;
  }
  return result;
}

- (void)setFile:(__sFILE *)a3
{
  self->mFile = a3;
  int v3 = fileno(a3);
  if (v3 >= 1)
  {
    int v4 = v3;
    fstat(v3, &v7);
    uint64_t v5 = 0;
    int st_size = v7.st_size;
    fcntl(v4, 44, &v5);
  }
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  return 0;
}

- (BOOL)isBinaryReader
{
  return 1;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
  return 0;
}

- (id)allocDecryptorWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilename:(id)a4
{
  id v6 = a4;
  stat v7 = [(OCDReader *)self fileName];

  if (v7) {
    uint64_t v8 = [v6 UTF8String];
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [(OCBReader *)self allocBinaryStreamerWithCryptoKey:a3 baseOutputFilenameInUTF8:v8];
  if (v9) {
    v9 = [[OCCDecryptor alloc] initWithStreamer:v9];
  }

  return v9;
}

- (void)restartReaderToUseDecryptedDocument
{
  int v3 = [(OCBReader *)self binaryReader];
  (*((void (**)(OcBinaryReader *))v3->var0 + 3))(v3);
  [(OCBReader *)self closeFile];
  int v4 = [(OCCDecryptor *)self->super.mDecryptor outputFilename];
  [(OCDReader *)self setFileName:v4];

  if (![(OCBReader *)self start])
  {
    uint64_t v5 = TCDecryptionFailedMessage;
    +[TCMessageException raise:v5];
  }
}

- (BOOL)start
{
  return 0;
}

- (id)read
{
  return 0;
}

- (__sFILE)file
{
  return self->mFile;
}

@end