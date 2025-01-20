@interface QLTop
+ (BOOL)supportsProgressiveMapping;
+ (id)metadataForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4;
+ (id)searchableAttributesForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4;
+ (void)fillHTMLArchiveForOfficeData:(id)a3 fileName:(id)a4 dataFormat:(unint64_t)a5 archiver:(id)a6;
+ (void)fillHTMLArchiveForOfficeFile:(id)a3 dataFormat:(unint64_t)a4 archiver:(id)a5;
+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7;
- (BOOL)forIndexing;
- (CMMapper)mapper;
- (CMState)state;
- (Class)mapperClassForIndexing:(BOOL)a3;
- (Class)readerClassForBinaryDocuments;
- (Class)readerClassForXMLDocuments;
- (Class)stateClass;
- (id)documentWithFile:(id)a3 orData:(id)a4 isXML:(BOOL)a5 archiver:(id)a6;
- (void)initializeClasses;
- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8;
- (void)readerDidEndDocument:(id)a3;
- (void)readerDidReadElement:(id)a3 atIndex:(unint64_t)a4 inDocument:(id)a5 isLastElement:(BOOL)a6;
- (void)readerDidStartDocument:(id)a3 withElementCount:(int64_t)a4;
- (void)setForIndexing:(BOOL)a3;
- (void)setupMappingStateWithDocument:(id)a3;
@end

@implementation QLTop

- (void)initializeClasses
{
  objc_opt_class();
  objc_opt_class();
}

- (Class)stateClass
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"QLTop.mm", 368, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];

  return 0;
}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  uint64_t v6 = objc_opt_class();
  v7 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"QLTop.mm", 374, @"Please override -[%@ %@]", v6, v7 object file lineNumber description];

  return 0;
}

- (Class)readerClassForXMLDocuments
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"QLTop.mm", 380, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];

  return 0;
}

- (Class)readerClassForBinaryDocuments
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, self, @"QLTop.mm", 386, @"Please override -[%@ %@]", v5, v6 object file lineNumber description];

  return 0;
}

- (void)setupMappingStateWithDocument:(id)a3
{
  id v8 = a3;
  if (self->_forIndexing) {
    v4 = objc_alloc_init(CMIndexingState);
  }
  else {
    v4 = (CMIndexingState *)objc_alloc_init([(QLTop *)self stateClass]);
  }
  state = self->_state;
  self->_state = &v4->super;

  [(CMState *)self->_state setIsOnPhone:[(CMArchiveManager *)self->_archiver isOnPhone]];
  [(CMState *)self->_state setSourceFormat:self->_format];
  [(CMState *)self->_state setIsThumbnail:[(CMArchiveManager *)self->_archiver isThumbnail]];
  [(CMState *)self->_state setDocument:v8];
  uint64_t v6 = (CMMapper *)objc_msgSend(objc_alloc(-[QLTop mapperClassForIndexing:](self, "mapperClassForIndexing:", self->_forIndexing)), "initWithDocument:archiver:", v8, self->_archiver);
  mapper = self->_mapper;
  self->_mapper = v6;

  [(CMMapper *)self->_mapper setFileName:self->_fileName];
}

- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8
{
  id v21 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  objc_storeStrong((id *)&self->_archiver, a7);
  self->_format = a6;
  if (v15)
  {
    v17 = (NSString *)v15;
  }
  else
  {
    v17 = [v21 lastPathComponent];
  }
  fileName = self->_fileName;
  self->_fileName = v17;

  self->_forIndexing = a8;
  [(QLTop *)self documentWithFile:v21 orData:v14 isXML:(a6 & 0xFFFFFFFFFFFFFFF9) == 0 archiver:v16];
  v19 = (OCDDocument *)objc_claimAutoreleasedReturnValue();
  document = self->_document;
  self->_document = v19;

  if (([(id)objc_opt_class() supportsProgressiveMapping] & 1) == 0)
  {
    [(QLTop *)self setupMappingStateWithDocument:self->_document];
    [(CMMapper *)self->_mapper mapWithState:self->_state];
  }
}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 dataFormat:(unint64_t)a6 archiver:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = objc_alloc_init((Class)a1);
  id v16 = (void *)MEMORY[0x23EC9A170]();
  [v15 readFile:v17 orData:v12 dataFileName:v13 format:a6 archiver:v14 forIndexing:0];
}

+ (void)fillHTMLArchiveForOfficeFile:(id)a3 dataFormat:(unint64_t)a4 archiver:(id)a5
{
  id v9 = a3;
  id v7 = a5;
  id v8 = classForFormat(a4);
  if (v8) {
    [v8 fillHTMLArchiveForOfficeFile:v9 orData:0 dataFileName:0 dataFormat:a4 archiver:v7];
  }
  else {
    +[QLTop fillHTMLArchiveForOfficeFile:v9 orData:0 dataFileName:0 dataFormat:a4 archiver:v7];
  }
}

+ (id)metadataForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 path];
  uint64_t v8 = +[CMFileManager getFileTypeFromPath:v7];

  if ((v8 & 0xFFFFFFFFFFFFFFF9) == 0)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"QLTop.mm", 492, @"XML file import is implemented in OISpotlightImporter, not in QLTop" object file lineNumber description];
  }
  id v9 = (objc_class *)classForFormat(v8);
  if (!v9)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = [v6 pathExtension];
    [v16 handleFailureInMethod:a2, a1, @"QLTop.mm", 495, @"Missing importer class for file type %@", v17 object file lineNumber description];
  }
  v10 = (id *)objc_alloc_init(v9);
  v11 = (void *)MEMORY[0x23EC9A170]();
  id v12 = [v6 path];
  [v10 readFile:v12 orData:0 dataFileName:0 format:v8 archiver:0 forIndexing:1];

  id v13 = [v10[2] metadata];

  return v13;
}

+ (id)searchableAttributesForBinaryOfficeFileAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 path];
  uint64_t v8 = +[CMFileManager getFileTypeFromPath:v7];

  if ((v8 & 0xFFFFFFFFFFFFFFF9) == 0)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"QLTop.mm", 522, @"XML file import is implemented in OISpotlightImporter, not in QLTop" object file lineNumber description];
  }
  id v9 = (objc_class *)classForFormat(v8);
  if (!v9)
  {
    id v16 = [MEMORY[0x263F08690] currentHandler];
    id v17 = [v6 pathExtension];
    [v16 handleFailureInMethod:a2, a1, @"QLTop.mm", 525, @"Missing importer class for file type %@", v17 object file lineNumber description];
  }
  v10 = (id *)objc_alloc_init(v9);
  v11 = (void *)MEMORY[0x23EC9A170]();
  id v12 = [v6 path];
  [v10 readFile:v12 orData:0 dataFileName:0 format:v8 archiver:0 forIndexing:1];

  id v13 = [v10[2] searchableAttributes];

  return v13;
}

+ (void)fillHTMLArchiveForOfficeData:(id)a3 fileName:(id)a4 dataFormat:(unint64_t)a5 archiver:(id)a6
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a6;
  id v11 = classForFormat(a5);
  if (v11) {
    [v11 fillHTMLArchiveForOfficeFile:0 orData:v12 dataFileName:v9 dataFormat:a5 archiver:v10];
  }
  else {
    +[QLTop fillHTMLArchiveForOfficeFile:0 orData:v12 dataFileName:v9 dataFormat:a5 archiver:v10];
  }
}

- (id)documentWithFile:(id)a3 orData:(id)a4 isXML:(BOOL)a5 archiver:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  [(QLTop *)self initializeClasses];
  if (v7) {
    id v14 = [(QLTop *)self readerClassForXMLDocuments];
  }
  else {
    id v14 = [(QLTop *)self readerClassForBinaryDocuments];
  }
  id v15 = v14;
  if (([(objc_class *)v14 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v26 = [MEMORY[0x263F08690] currentHandler];
    [v26 handleFailureInMethod:a2 object:self file:@"QLTop.mm" lineNumber:580 description:@"reader class should be an OCDEncryptedReader"];
  }
  id v16 = (void *)[[v15 alloc] initWithCancelDelegate:v13];
  objc_msgSend(v16, "setIsThumbnail:", objc_msgSend(v13, "isThumbnail"));
  if (v12)
  {
    [v16 setData:v12];
  }
  else if (v11)
  {
    [v16 setFileName:v11];
  }
  else
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"QLTop.mm" lineNumber:593 description:@"No file Data or file path"];
  }
  [v16 setDelegate:self];
  if (![v16 start])
  {
    v23 = 0;
    goto LABEL_27;
  }
  unsigned int v27 = 8011;
  if (![v16 retainDecryptorWithErrorCode:&v27])
  {
    if (v27 == 8011) {
      goto LABEL_26;
    }
    if (v27 != 8003)
    {
      if (v27 != 8001)
      {
        NSLog((NSString *)@"Unkown error when reading the document (%d)", v27);
        v24 = [MEMORY[0x263EFF940] exceptionWithName:@"kCMTopExceptionDocumentIsUnsupported" reason:0 userInfo:0];
        [v24 raise];
        goto LABEL_25;
      }
      if (![v16 isBinaryReader]) {
        goto LABEL_26;
      }
    }
    NSLog((NSString *)@"Unsupported encryption method");
    v24 = [MEMORY[0x263EFF940] exceptionWithName:@"kCMTopExceptionDocumentIsUnsupported" reason:0 userInfo:0];
    [v24 raise];
LABEL_25:

    goto LABEL_26;
  }
  v18 = [v16 decryptor];
  char v19 = [v18 isReadProtectedUsingDefaultPassphrase];

  if ((v19 & 1) == 0)
  {
    v20 = [v13 passphrase];
    if (!v20
      || ([v16 decryptor],
          id v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 verifyPassphrase:v20],
          v21,
          v20,
          (v22 & 1) == 0))
    {

      v24 = [MEMORY[0x263EFF940] exceptionWithName:kCMTopExceptionDocumentIsEncrypted reason:0 userInfo:0];
      [v24 raise];
      id v16 = 0;
      goto LABEL_25;
    }
  }
  NSLog((NSString *)@"The document was encrypted, but we decrypted it");
LABEL_26:
  v23 = [v16 read];
LABEL_27:

  return v23;
}

- (void)readerDidStartDocument:(id)a3 withElementCount:(int64_t)a4
{
  id v6 = a3;
  [(CMArchiveManager *)self->_archiver setPageCount:a4];
  [(QLTop *)self setupMappingStateWithDocument:v6];
  [(CMMapper *)self->_mapper startMappingWithState:self->_state];
}

- (void)readerDidReadElement:(id)a3 atIndex:(unint64_t)a4 inDocument:(id)a5 isLastElement:(BOOL)a6
{
}

- (void)readerDidEndDocument:(id)a3
{
  [(CMMapper *)self->_mapper finishMappingWithState:self->_state];
  mapper = self->_mapper;
  self->_mapper = 0;

  document = self->_document;
  self->_document = 0;
}

+ (BOOL)supportsProgressiveMapping
{
  return 0;
}

- (CMMapper)mapper
{
  return (CMMapper *)objc_getProperty(self, a2, 8, 1);
}

- (CMState)state
{
  return (CMState *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)forIndexing
{
  return self->_forIndexing;
}

- (void)setForIndexing:(BOOL)a3
{
  self->_forIndexing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_archiver, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_mapper, 0);
}

@end