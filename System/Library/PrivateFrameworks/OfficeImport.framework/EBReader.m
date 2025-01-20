@interface EBReader
- (BOOL)isFileStructuredStorage;
- (BOOL)start;
- (BOOL)useStringOptimization;
- (EBReader)initWithCancelDelegate:(id)a3;
- (NSString)temporaryDirectory;
- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4;
- (OCCEncryptionInfoReader)encryptionInfoReader;
- (id)read;
- (void)dealloc;
- (void)setIsFileStructuredStorage:(BOOL)a3;
- (void)setTemporaryDirectory:(id)a3;
- (void)setUseStringOptimization:(BOOL)a3;
@end

@implementation EBReader

- (BOOL)start
{
  v3 = [(OCDReader *)self data];
  unint64_t v4 = [v3 length];

  if (HIDWORD(v4)) {
    goto LABEL_2;
  }
  v5 = [(EBReader *)self xlReader];
  if (!v5) {
    return (char)v5;
  }
  v6 = v5;
  v7 = [(OCDReader *)self fileName];

  if (v7)
  {
    id v8 = [(OCDReader *)self fileName];
    v9 = fopen((const char *)[v8 UTF8String], "rb");

    if (v9)
    {
      [(OCBReader *)self setFile:v9];
      (*(void (**)(XlBinaryReader *, __sFILE *))(*(void *)v6 + 16))(v6, [(OCBReader *)self file]);
LABEL_9:
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    uint64_t v13 = TCUnknownProblemMessage;
    v14 = [(OCDReader *)self fileName];
    +[TCMessageException raise:](TCMessageException, "raise:", v13, v14);
  }
  else
  {
    v10 = [(OCDReader *)self data];

    if (v10)
    {
      id v11 = [(OCDReader *)self data];
      self->mBuffer = (const void *)[v11 bytes];

      v12 = [(OCDReader *)self data];
      XlBinaryReader::start(v6, &self->mBuffer, [v12 length]);

      goto LABEL_9;
    }
  }
LABEL_2:
  LOBYTE(v5) = 0;
  return (char)v5;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  v2 = [(EBReader *)self xlReader];
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0;
  }
}

- (id)read
{
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  [(OCDEncryptedReader *)self useUnencryptedDocument];
  unint64_t v4 = [(OCBReader *)self binaryReader];
  (*((void (**)(OcBinaryReader *))v4->var0 + 80))(v4);
  v5 = [EBReaderState alloc];
  v6 = [(OCDReader *)self cancelDelegate];
  v7 = [(EBReaderState *)v5 initWithXlReader:v4 cancelDelegate:v6];

  v9 = +[EBWorkbook readWithState:v7 reader:self];

  [(EBReaderState *)v7 pauseReading];

  return v9;
}

- (BOOL)useStringOptimization
{
  return self->mUseStringOptimization;
}

- (NSString)temporaryDirectory
{
  return self->mTemporaryDirectory;
}

- (void)dealloc
{
  mXlObjectFactory = self->mXlObjectFactory;
  if (mXlObjectFactory) {
    (*((void (**)(XlObjectFactory *, SEL))mXlObjectFactory->var0 + 1))(mXlObjectFactory, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)EBReader;
  [(OCBReader *)&v4 dealloc];
}

- (EBReader)initWithCancelDelegate:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EBReader;
  if ([(OCBReader *)&v6 initWithCancelDelegate:v4]) {
    operator new();
  }

  return 0;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
}

- (void)setTemporaryDirectory:(id)a3
{
}

- (void)setUseStringOptimization:(BOOL)a3
{
  self->mUseStringOptimization = a3;
}

- (BOOL)isFileStructuredStorage
{
  return self->mIsFileStructuredStorage;
}

- (void)setIsFileStructuredStorage:(BOOL)a3
{
  self->mIsFileStructuredStorage = a3;
}

- (void).cxx_destruct
{
}

@end