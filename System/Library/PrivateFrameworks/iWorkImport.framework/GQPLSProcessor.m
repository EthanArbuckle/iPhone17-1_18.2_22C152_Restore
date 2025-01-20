@interface GQPLSProcessor
- (BOOL)go;
- (Class)generator;
- (GQPLSProcessor)initWithURL:(__CFURL *)a3 indexFileName:(id)a4 outputType:(int)a5 outputPath:(__CFString *)a6 previewRequest:(__QLPreviewRequest *)a7 progressiveHelper:(id)a8 generator:(Class)a9 zipArchive:(id)a10 cryptoKey:(id)a11;
- (GQPLSProcessor)initWithURL:(__CFURL *)a3 zipArchive:(id)a4 indexFileName:(id)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9 generator:(Class)a10 cryptoKey:(id)a11;
- (void)pushInitialState;
@end

@implementation GQPLSProcessor

- (GQPLSProcessor)initWithURL:(__CFURL *)a3 indexFileName:(id)a4 outputType:(int)a5 outputPath:(__CFString *)a6 previewRequest:(__QLPreviewRequest *)a7 progressiveHelper:(id)a8 generator:(Class)a9 zipArchive:(id)a10 cryptoKey:(id)a11
{
  uint64_t v13 = *(void *)&a5;
  v21.receiver = self;
  v21.super_class = (Class)GQPLSProcessor;
  v15 = [(GQPProcessor *)&v21 initWithPath:[(__CFURL *)a3 path] indexFileName:a4 previewRequest:a7 cryptoKey:a11];
  v16 = v15;
  if (v15)
  {
    v15->mGenerator = a9;
    v17 = objc_alloc_init(GQDLSDocument);
    id v18 = +[GQUOutputBundleFactory createOutputBundleForType:v13 outputPath:a6 progressiveHelper:a8];
    v19 = [[GQSDocument alloc] initWithRoot:v17 processor:v16 bundleUrl:a3 archive:a10 outputBundle:v18];
    v16->super.mDocumentState = v19;
    [(GQSDocument *)v19 pushObject:v17];
  }
  return v16;
}

- (GQPLSProcessor)initWithURL:(__CFURL *)a3 zipArchive:(id)a4 indexFileName:(id)a5 outputType:(int)a6 outputPath:(__CFString *)a7 previewRequest:(__QLPreviewRequest *)a8 progressiveHelper:(id)a9 generator:(Class)a10 cryptoKey:(id)a11
{
  uint64_t v12 = *(void *)&a6;
  v21.receiver = self;
  v21.super_class = (Class)GQPLSProcessor;
  v15 = [(GQPProcessor *)&v21 initWithZipArchive:a4 indexFileName:a5 previewRequest:a8 cryptoKey:a11];
  v16 = v15;
  if (v15)
  {
    v15->mGenerator = a10;
    v17 = objc_alloc_init(GQDLSDocument);
    id v18 = +[GQUOutputBundleFactory createOutputBundleForType:v12 outputPath:a7 progressiveHelper:a9];
    v19 = [[GQSDocument alloc] initWithRoot:v17 processor:v16 archive:a4 outputBundle:v18 fileURL:a3];
    v16->super.mDocumentState = v19;
    [(GQSDocument *)v19 pushObject:v17];
  }
  return v16;
}

- (void)pushInitialState
{
}

- (BOOL)go
{
  v8.receiver = self;
  v8.super_class = (Class)GQPLSProcessor;
  unsigned int v3 = [(GQPProcessor *)&v8 go];
  if (self->mGenerator)
  {
    unsigned int v4 = [(GQSDocument *)self->super.mDocumentState generatorBeginWasCalled];
    if ((v4 & v3) == 1)
    {
      unsigned int v5 = [(objc_class *)self->mGenerator endDocument:[(GQSDocument *)self->super.mDocumentState root] state:self->super.mDocumentState];
      if (!v5) {
        return v5;
      }
      goto LABEL_7;
    }
    v3 &= ~v4;
  }
  if (!v3)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_7:
  if (self->super.mOutputPreviewRequest
    && (id v6 = [(GQSDocument *)self->super.mDocumentState outputBundle],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {
    LOBYTE(v5) = [v6 giveOutputToPreviewRequest:self->super.mOutputPreviewRequest];
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (Class)generator
{
  return self->mGenerator;
}

@end