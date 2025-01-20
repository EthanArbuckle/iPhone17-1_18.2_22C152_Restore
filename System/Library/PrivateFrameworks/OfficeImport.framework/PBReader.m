@interface PBReader
- (BOOL)start;
- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4;
- (OCCEncryptionInfoReader)encryptionInfoReader;
- (PBReader)initWithCancelDelegate:(id)a3;
- (id)read;
- (void)dealloc;
@end

@implementation PBReader

- (BOOL)start
{
  v3 = [(PBReader *)self pptReader];
  if (v3)
  {
    v4 = v3;
    v5 = [(OCDReader *)self fileName];

    if (v5)
    {
      id v6 = [(OCDReader *)self fileName];
      v7 = fopen((const char *)[v6 UTF8String], "rb");

      if (v7)
      {
        [(OCBReader *)self setFile:v7];
        (*(void (**)(PptBinaryReader *, __sFILE *))(*(void *)v4 + 16))(v4, [(OCBReader *)self file]);
LABEL_7:
        LOBYTE(v3) = 1;
        return (char)v3;
      }
      uint64_t v11 = TCUnknownProblemMessage;
      v12 = [(OCDReader *)self fileName];
      +[TCMessageException raise:](TCMessageException, "raise:", v11, v12);
    }
    else
    {
      v8 = [(OCDReader *)self data];

      if (v8)
      {
        id v9 = [(OCDReader *)self data];
        self->mBuffer = (const void *)[v9 bytes];

        v10 = [(OCDReader *)self data];
        PptBinaryReader::start(v4, &self->mBuffer, [v10 length]);

        goto LABEL_7;
      }
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  v2 = [(PBReader *)self pptReader];
  if (v2) {
    return v2 + 3;
  }
  else {
    return 0;
  }
}

- (id)read
{
  v3 = (void *)MEMORY[0x23EC9A170](self, a2);
  [(OCDEncryptedReader *)self useUnencryptedDocument];
  v13 = objc_alloc_init(PDPresentation);

  v4 = objc_alloc_init(OADGraphicStyleCache);
  [(OCDDocument *)v13 setGraphicStyleCache:v4];

  [(OCDDocument *)v13 setReader:self];
  v5 = [(OCDReader *)self fileName];
  id v6 = [v5 pathExtension];
  v7 = [v6 lowercaseString];
  -[PDPresentation setIsAutoPlay:](v13, "setIsAutoPlay:", [v7 isEqualToString:@"pps"]);

  v8 = [(PBReader *)self pptReader];
  id v9 = [(OCDReader *)self cancelDelegate];
  BOOL v10 = [(OCDReader *)self isThumbnail];
  uint64_t v11 = [(OCDReader *)self delegate];
  +[PBPresentation readFrom:v8 to:v13 cancel:v9 asThumbnail:v10 delegate:v11];

  return v13;
}

- (void)dealloc
{
  mPptObjectFactory = self->mPptObjectFactory;
  if (mPptObjectFactory) {
    (*((void (**)(PptObjectFactory *, SEL))mPptObjectFactory->var0 + 1))(mPptObjectFactory, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)PBReader;
  [(OCBReader *)&v4 dealloc];
}

- (PBReader)initWithCancelDelegate:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PBReader;
  if ([(OCBReader *)&v6 initWithCancelDelegate:v4]) {
    operator new();
  }

  return 0;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
}

@end