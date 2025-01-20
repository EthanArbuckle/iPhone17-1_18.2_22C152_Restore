@interface QLPreviewConverter
+ (BOOL)canConvertDocumentType:(id)a3;
+ (BOOL)isCSVDocumentType:(id)a3;
+ (BOOL)isIWorkDocumentType:(id)a3;
+ (BOOL)isLPDFDocumentType:(id)a3;
+ (BOOL)isOfficeDocumentType:(id)a3;
+ (BOOL)isRTFDocumentType:(id)a3;
+ (BOOL)isSafeRequest:(id)a3;
+ (BOOL)isSafeURL:(id)a3;
+ (BOOL)isSpreadSheetDocumentType:(id)a3;
+ (id)_csvMIMETypes;
+ (id)_csvUTIs;
+ (id)_iWorkMIMETypes;
+ (id)_iWorkUTIs;
+ (id)_lpdfUTIs;
+ (id)_officeMIMETypes;
+ (id)_officeUTIs;
+ (id)_rtfMIMETypes;
+ (id)_rtfUTIs;
+ (id)_spreadSheetMIMETypes;
+ (id)_spreadSheetUTIs;
+ (id)convertibleMIMETypes;
+ (id)convertibleTypes;
+ (id)convertibleUTIs;
- (BOOL)htmlErrorDisabled;
- (BOOL)isCancelled;
- (BOOL)isComputed;
- (NSString)previewFileName;
- (NSString)previewUTI;
- (NSURLRequest)previewRequest;
- (NSURLResponse)previewResponse;
- (QLPreviewConverter)initWithConnection:(id)a3 delegate:(id)a4 response:(id)a5 options:(id)a6;
- (QLPreviewConverter)initWithData:(id)a3 name:(id)a4 uti:(id)a5 options:(id)a6;
- (QLPreviewConverter)initWithURL:(id)a3 uti:(id)a4 options:(id)a5;
- (QLPreviewConverterParts)previewParts;
- (id)safeRequestForRequest:(id)a3;
- (void)_closeIOCahnnel;
- (void)_createDispatchIOChannel;
- (void)_register;
- (void)_writeDataArrayIntoStream:(id)a3;
- (void)appendData:(id)a3;
- (void)appendDataArray:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)finishConverting;
- (void)finishedAppendingData;
- (void)setHtmlErrorDisabled:(BOOL)a3;
@end

@implementation QLPreviewConverter

+ (id)convertibleMIMETypes
{
  v3 = objc_opt_new();
  v4 = [a1 _officeMIMETypes];
  v5 = [v4 allObjects];
  [v3 addObjectsFromArray:v5];

  v6 = [a1 _iWorkMIMETypes];
  v7 = [v6 allObjects];
  [v3 addObjectsFromArray:v7];

  v8 = [a1 _rtfMIMETypes];
  v9 = [v8 allObjects];
  [v3 addObjectsFromArray:v9];

  v10 = [a1 _csvMIMETypes];
  v11 = [v10 allObjects];
  [v3 addObjectsFromArray:v11];

  v12 = [a1 _spreadSheetMIMETypes];
  v13 = [v12 allObjects];
  [v3 addObjectsFromArray:v13];

  v14 = (void *)[v3 copy];
  return v14;
}

+ (id)_officeMIMETypes
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_officeMIMETypes_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"application/vnd.ms-powerpoint", @"application/vnd.openxmlformats-officedocument.presentationml.presentation", @"application/vnd.openxmlformats-officedocument.presentationml.template", @"application/vnd.openxmlformats-officedocument.presentationml.slideshow", @"application/vnd.ms-powerpoint.presentation.macroenabled.12", @"application/vnd.ms-powerpoint.slideshow.macroenabled.12", @"application/vnd.ms-powerpoint.template.macroenabled.12", @"application/vnd.ms-excel", @"application/vnd.openxmlformats-officedocument.spreadsheetml.template", @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", @"application/vnd.ms-excel.template.macroenabled.12", @"application/vnd.ms-excel.sheet.macroenabled.12", @"application/msword", @"application/vnd.openxmlformats-officedocument.wordprocessingml.document", @"application/vnd.openxmlformats-officedocument.wordprocessingml.template", @"application/vnd.ms-word.document.macroenabled.12", 0);
    v4 = (void *)_officeMIMETypes_result;
    _officeMIMETypes_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_officeMIMETypes_result;
  return v5;
}

+ (id)_iWorkMIMETypes
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_iWorkMIMETypes_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"application/vnd.iwork.numbers.archive", @"application/vnd.iwork.pages.archive", @"application/x-iwork-keynote-sffkey", @"application/x-iwork-numbers-sffnumbers", @"application/x-iwork-pages-sffpages", @"application/vnd.iwork.numbers.archive", @"application/vnd.iwork.pages.archive", @"application/vnd.iwork.keynote.archive", 0);
    v4 = (void *)_iWorkMIMETypes_result;
    _iWorkMIMETypes_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_iWorkMIMETypes_result;
  return v5;
}

+ (id)_rtfMIMETypes
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_rtfMIMETypes_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"application/rtf", @"application/rtfd", 0);
    v4 = (void *)_rtfMIMETypes_result;
    _rtfMIMETypes_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_rtfMIMETypes_result;
  return v5;
}

+ (id)_csvMIMETypes
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_csvMIMETypes_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"text/comma-separated-values", @"text/csv", 0);
    v4 = (void *)_csvMIMETypes_result;
    _csvMIMETypes_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_csvMIMETypes_result;
  return v5;
}

+ (id)_spreadSheetMIMETypes
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_spreadSheetMIMETypes_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"application/vnd.ms-excel", @"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", @"application/vnd.ms-excel.sheet.macroenabled.12", @"application/vnd.openxmlformats-officedocument.spreadsheetml.template", @"application/vnd.ms-excel.template.macroenabled.12", @"application/vnd.iwork.numbers.archive", @"application/x-iwork-numbers-sffnumbers", 0);
    v4 = (void *)_spreadSheetMIMETypes_result;
    _spreadSheetMIMETypes_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_spreadSheetMIMETypes_result;
  return v5;
}

+ (id)convertibleUTIs
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__QLPreviewConverter_convertibleUTIs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (convertibleUTIs_once != -1) {
    dispatch_once(&convertibleUTIs_once, block);
  }
  v2 = (void *)[(id)convertibleUTIs_allUTIs copy];
  return v2;
}

void __37__QLPreviewConverter_convertibleUTIs__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = (void *)convertibleUTIs_allUTIs;
  convertibleUTIs_allUTIs = v2;

  v4 = (void *)convertibleUTIs_allUTIs;
  v5 = [*(id *)(a1 + 32) _officeUTIs];
  v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  v7 = (void *)convertibleUTIs_allUTIs;
  v8 = [*(id *)(a1 + 32) _iWorkUTIs];
  v9 = [v8 allObjects];
  [v7 addObjectsFromArray:v9];

  v10 = (void *)convertibleUTIs_allUTIs;
  v11 = [*(id *)(a1 + 32) _rtfUTIs];
  v12 = [v11 allObjects];
  [v10 addObjectsFromArray:v12];

  v13 = (void *)convertibleUTIs_allUTIs;
  v14 = [*(id *)(a1 + 32) _lpdfUTIs];
  v15 = [v14 allObjects];
  [v13 addObjectsFromArray:v15];

  v16 = (void *)convertibleUTIs_allUTIs;
  v17 = [*(id *)(a1 + 32) _csvUTIs];
  v18 = [v17 allObjects];
  [v16 addObjectsFromArray:v18];

  v19 = (void *)convertibleUTIs_allUTIs;
  id v21 = [*(id *)(a1 + 32) _spreadSheetUTIs];
  v20 = [v21 allObjects];
  [v19 addObjectsFromArray:v20];
}

+ (id)convertibleTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__QLPreviewConverter_convertibleTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (convertibleTypes_once != -1) {
    dispatch_once(&convertibleTypes_once, block);
  }
  uint64_t v2 = (void *)[(id)convertibleTypes_allTypes copy];
  return v2;
}

void __38__QLPreviewConverter_convertibleTypes__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v3 = [*(id *)(a1 + 32) convertibleUTIs];
  uint64_t v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)convertibleTypes_allTypes;
  convertibleTypes_allTypes = v4;

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = objc_msgSend(*(id *)(a1 + 32), "convertibleUTIs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        if (v11) {
          [(id)convertibleTypes_allTypes addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

+ (id)_officeUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_officeUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.microsoft.powerpoint.ppt", @"com.microsoft.powerpoint.pot", @"com.microsoft.powerpoint.pps", @"org.openxmlformats.presentationml.presentation", @"org.openxmlformats.presentationml.presentation.macroenabled", @"org.openxmlformats.presentationml.template", @"org.openxmlformats.presentationml.template.macroenabled", @"org.openxmlformats.presentationml.slideshow", @"org.openxmlformats.presentationml.slideshow.macroenabled", @"com.microsoft.excel.xls", @"com.microsoft.excel.xlt", @"com.microsoft.excel.xla", @"org.openxmlformats.spreadsheetml.sheet", @"org.openxmlformats.spreadsheetml.sheet.macroenabled", @"org.openxmlformats.spreadsheetml.template", @"org.openxmlformats.spreadsheetml.template.macroenabled", @"com.microsoft.word.doc",
           @"com.microsoft.word.dot",
           @"org.openxmlformats.wordprocessingml.document",
           @"org.openxmlformats.wordprocessingml.document.macroenabled",
           @"org.openxmlformats.wordprocessingml.template",
           @"org.openxmlformats.wordprocessingml.template.macroenabled",
           0);
    uint64_t v4 = (void *)_officeUTIs_result;
    _officeUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_officeUTIs_result;
  return v5;
}

+ (id)_iWorkUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_iWorkUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.iwork.keynote.key", @"com.apple.iwork.numbers.numbers", @"com.apple.iwork.pages.pages", @"com.apple.iwork.keynote.sffkey", @"com.apple.iwork.numbers.sffnumbers", @"com.apple.iwork.pages.sffpages", @"com.apple.iwork.numbers.template", @"com.apple.iwork.numbers.sfftemplate", @"com.apple.iwork.pages.template", @"com.apple.iwork.pages.sfftemplate", @"com.apple.iwork.keynote.kth", @"com.apple.iwork.keynote.sffkth", 0);
    uint64_t v4 = (void *)_iWorkUTIs_result;
    _iWorkUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_iWorkUTIs_result;
  return v5;
}

+ (id)_rtfUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_rtfUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"public.rtf", @"com.apple.rtfd", 0);
    uint64_t v4 = (void *)_rtfUTIs_result;
    _rtfUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_rtfUTIs_result;
  return v5;
}

+ (id)_lpdfUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_lpdfUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.apple.localized-pdf-bundle", 0);
    uint64_t v4 = (void *)_lpdfUTIs_result;
    _lpdfUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_lpdfUTIs_result;
  return v5;
}

+ (id)_csvUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_csvUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"public.comma-separated-values-text", 0);
    uint64_t v4 = (void *)_csvUTIs_result;
    _csvUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_csvUTIs_result;
  return v5;
}

+ (id)_spreadSheetUTIs
{
  id v2 = objc_opt_class();
  objc_sync_enter(v2);
  if (!_spreadSheetUTIs_result)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"com.microsoft.excel.xls", @"com.microsoft.excel.xlt", @"com.microsoft.excel.xla", @"org.openxmlformats.spreadsheetml.sheet", @"org.openxmlformats.spreadsheetml.sheet.macroenabled", @"org.openxmlformats.spreadsheetml.template", @"org.openxmlformats.spreadsheetml.template.macroenabled", @"com.apple.iwork.numbers.template", @"com.apple.iwork.numbers.sfftemplate", @"com.apple.iwork.numbers.numbers", @"com.apple.iwork.numbers.sffnumbers", 0);
    uint64_t v4 = (void *)_spreadSheetUTIs_result;
    _spreadSheetUTIs_result = v3;
  }
  objc_sync_exit(v2);

  v5 = (void *)_spreadSheetUTIs_result;
  return v5;
}

+ (BOOL)isOfficeDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _officeUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)isIWorkDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _iWorkUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)isCSVDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _csvUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)isLPDFDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _lpdfUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)isRTFDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _rtfUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)isSpreadSheetDocumentType:(id)a3
{
  id v4 = a3;
  v5 = [a1 _spreadSheetUTIs];
  v6 = [v4 lowercaseString];

  LOBYTE(v4) = [v5 containsObject:v6];
  return (char)v4;
}

+ (BOOL)canConvertDocumentType:(id)a3
{
  return +[QLBasePreviewParts canConvertDocumentType:a3];
}

- (QLPreviewConverter)initWithURL:(id)a3 uti:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewConverter;
  v11 = [(QLPreviewConverter *)&v18 init];
  if (v11)
  {
    long long v12 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v11->_previewParts;
    v11->_previewParts = &v12->super;

    [(QLPreviewConverterParts *)v11->_previewParts setUrl:v8];
    long long v14 = [v8 path];
    long long v15 = [v14 lastPathComponent];
    [(QLPreviewConverterParts *)v11->_previewParts setFileName:v15];

    [(QLPreviewConverterParts *)v11->_previewParts setUti:v9];
    v16 = [v10 objectForKey:@"Password"];
    [(QLPreviewConverterParts *)v11->_previewParts setPassword:v16];

    +[QLPreviewConverterParts registerPreview:v11->_previewParts];
  }

  return v11;
}

- (QLPreviewConverter)initWithData:(id)a3 name:(id)a4 uti:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLPreviewConverter;
  long long v14 = [(QLPreviewConverter *)&v19 init];
  if (v14)
  {
    long long v15 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v14->_previewParts;
    v14->_previewParts = &v15->super;

    [(QLPreviewConverterParts *)v14->_previewParts setData:v10];
    [(QLPreviewConverterParts *)v14->_previewParts setFileName:v11];
    [(QLPreviewConverterParts *)v14->_previewParts setUti:v12];
    uint64_t v17 = [v13 objectForKey:@"Password"];
    [(QLPreviewConverterParts *)v14->_previewParts setPassword:v17];

    +[QLPreviewConverterParts registerPreview:v14->_previewParts];
  }

  return v14;
}

- (QLPreviewConverter)initWithConnection:(id)a3 delegate:(id)a4 response:(id)a5 options:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)QLPreviewConverter;
  long long v14 = [(QLPreviewConverter *)&v27 init];
  if (v14)
  {
    long long v15 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v14->_previewParts;
    v14->_previewParts = &v15->super;

    [(QLPreviewConverterParts *)v14->_previewParts setConnection:v10];
    [(QLPreviewConverterParts *)v14->_previewParts setDelegate:v11];
    uint64_t v17 = [v13 objectForKey:@"Password"];
    [(QLPreviewConverterParts *)v14->_previewParts setPassword:v17];

    uint64_t v18 = [v12 expectedContentLength];
    objc_super v19 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v18 & ~(v18 >> 63)];
    [(QLPreviewConverterParts *)v14->_previewParts setData:v19];

    v20 = [v12 suggestedFilename];
    id v21 = [v12 MIMEType];
    v22 = (void *)_QLTypeCopyUTIForFileNameAndMimeType(v20, v21);

    v23 = [v12 suggestedFilename];
    [(QLPreviewConverterParts *)v14->_previewParts setFileName:v23];

    [(QLPreviewConverterParts *)v14->_previewParts setUti:v22];
    +[QLPreviewConverterParts registerPreview:v14->_previewParts];
    uint64_t v24 = [v13 copy];
    options = v14->_options;
    v14->_options = (NSDictionary *)v24;
  }
  return v14;
}

- (void)dealloc
{
  if (self->_previewParts) {
    +[QLPreviewConverterParts unregisterPreview:](QLPreviewConverterParts, "unregisterPreview:");
  }
  if (self->_io_write)
  {
    self->_dataGatheringSucceeded = 0;
    [(QLPreviewConverter *)self _closeIOCahnnel];
  }
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewConverter;
  [(QLPreviewConverter *)&v3 dealloc];
}

- (void)_register
{
}

- (void)finishConverting
{
  if (self->_previewParts)
  {
    +[QLPreviewConverterParts unregisterPreview:](QLPreviewConverterParts, "unregisterPreview:");
    previewParts = self->_previewParts;
    self->_previewParts = 0;
  }
}

- (void)cancel
{
}

- (BOOL)isCancelled
{
  return [(QLPreviewConverterParts *)self->_previewParts isCancelled];
}

- (BOOL)isComputed
{
  return [(QLPreviewConverterParts *)self->_previewParts isComputed];
}

- (NSString)previewFileName
{
  id v2 = [(QLPreviewConverterParts *)self->_previewParts fileName];
  objc_super v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)previewUTI
{
  id v2 = [(QLPreviewConverterParts *)self->_previewParts uti];
  objc_super v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (QLPreviewConverterParts)previewParts
{
  return self->_previewParts;
}

- (NSURLRequest)previewRequest
{
  return (NSURLRequest *)[(QLPreviewConverterParts *)self->_previewParts previewRequest];
}

- (NSURLResponse)previewResponse
{
  return [(QLPreviewConverterParts *)self->_previewParts previewResponse];
}

- (id)safeRequestForRequest:(id)a3
{
  objc_super v3 = [(QLPreviewConverterParts *)self->_previewParts safeRequestForRequest:a3];
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1E4F290D0];
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"about:"];
    objc_super v3 = [v4 requestWithURL:v5];
  }
  return v3;
}

+ (BOOL)isSafeURL:(id)a3
{
  objc_super v3 = [a3 scheme];
  if (v3) {
    BOOL v4 = [@"x-apple-ql-id" caseInsensitiveCompare:v3] == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (BOOL)isSafeRequest:(id)a3
{
  BOOL v4 = [a3 URL];
  LOBYTE(a1) = [a1 isSafeURL:v4];

  return (char)a1;
}

- (void)appendData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[QLPreviewConverter appendDataArray:](self, "appendDataArray:", v6, v7, v8);
}

- (void)appendDataArray:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!self->_dataPhaseFinished)
  {
    if (self->_io_write)
    {
      [(QLPreviewConverter *)self _writeDataArrayIntoStream:v4];
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = 0;
        uint64_t v9 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(v5);
            }
            v8 += [*(id *)(*((void *)&v30 + 1) + 8 * i) length];
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v7);
      }
      else
      {
        uint64_t v8 = 0;
      }
      id v11 = [(QLPreviewConverterParts *)self->_previewParts data];
      uint64_t v12 = [v11 length];
      uint64_t v13 = v12 + v8;
      if ((unint64_t)(v12 + v8) < 0x3200001)
      {
        uint64_t v18 = v12;
        [v11 increaseLengthBy:v8];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v19 = v5;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v27 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              uint64_t v25 = objc_msgSend(v24, "length", (void)v26);
              objc_msgSend(v11, "replaceBytesInRange:withBytes:", v18, v25, objc_msgSend(v24, "bytes"));
              v18 += v25;
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v21);
        }
      }
      else
      {
        long long v14 = (NSObject **)MEMORY[0x1E4F945F0];
        long long v15 = *MEMORY[0x1E4F945F0];
        if (!*MEMORY[0x1E4F945F0])
        {
          QLSInitLogging();
          long long v15 = *v14;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v37 = v13;
          _os_log_impl(&dword_1E2805000, v15, OS_LOG_TYPE_DEFAULT, "Receiving data size bigger than what we can keep in memory (%lu) #Conversion", buf, 0xCu);
        }
        [(QLPreviewConverter *)self _createDispatchIOChannel];
        v16 = [(QLPreviewConverterParts *)self->_previewParts data];
        v35 = v16;
        uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
        [(QLPreviewConverter *)self _writeDataArrayIntoStream:v17];

        [(QLPreviewConverterParts *)self->_previewParts setData:0];
        [(QLPreviewConverter *)self _writeDataArrayIntoStream:v5];
      }
    }
  }
}

- (void)_createDispatchIOChannel
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!self->_io_write && !self->_tmpFileURL)
  {
    objc_super v3 = [(QLPreviewConverterParts *)self->_previewParts uti];

    if (v3)
    {
      id v4 = (void *)MEMORY[0x1E4F442D8];
      id v5 = [(QLPreviewConverterParts *)self->_previewParts uti];
      uint64_t v6 = [v4 typeWithIdentifier:v5];

      objc_super v3 = [v6 preferredFilenameExtension];
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v8 = NSString;
    uint64_t v9 = NSTemporaryDirectory();
    id v10 = objc_opt_new();
    id v11 = [v10 UUIDString];
    uint64_t v12 = [v8 stringWithFormat:@"%@%@.%@", v9, v11, v3];
    uint64_t v13 = [v7 fileURLWithPath:v12];
    tmpFileURL = self->_tmpFileURL;
    self->_tmpFileURL = v13;

    self->_totalWrittenBytes = 0;
    self->_dataGatheringSucceeded = 1;
    id v15 = [(NSURL *)self->_tmpFileURL path];
    v16 = (const char *)[v15 UTF8String];
    cleanup_handler[0] = MEMORY[0x1E4F143A8];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __46__QLPreviewConverter__createDispatchIOChannel__block_invoke;
    cleanup_handler[3] = &unk_1E6DD3FE8;
    cleanup_handler[4] = self;
    uint64_t v17 = (OS_dispatch_io *)dispatch_io_create_with_path(0, v16, 513, 0x180u, MEMORY[0x1E4F14428], cleanup_handler);
    io_write = self->_io_write;
    self->_io_write = v17;

    id v19 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v20 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = self->_tmpFileURL;
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = v21;
      _os_log_impl(&dword_1E2805000, v20, OS_LOG_TYPE_DEFAULT, "Creating tmp file to write the preview converter data (%@) #Conversion", buf, 0xCu);
    }
  }
}

uint64_t __46__QLPreviewConverter__createDispatchIOChannel__block_invoke(uint64_t a1, int a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2 || (uint64_t v13 = *(void *)(a1 + 32), !*(unsigned char *)(v13 + 49)))
  {
    id v4 = (NSObject **)MEMORY[0x1E4F945F0];
    id v5 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = a2;
      _os_log_impl(&dword_1E2805000, v5, OS_LOG_TYPE_DEFAULT, "Cannot write data into disk. error:%d. #Conversion", buf, 8u);
    }
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v7 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      uint64_t v7 = *v4;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1E2805000, v7, OS_LOG_TYPE_DEFAULT, "Deleting temporary file created for the conversion %@ due to an error while writing the incoming data into disk. #Conversion", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    id v15 = 0;
    char v10 = [v6 removeItemAtURL:v9 error:&v15];
    id v11 = v15;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = *v4;
      if (!*v4)
      {
        QLSInitLogging();
        uint64_t v12 = *v4;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, "Problem deleting the temporary file for the preview converter (%@) #Conversion", buf, 0xCu);
      }
    }
  }
  else
  {
    [*(id *)(v13 + 8) setUrl:*(void *)(v13 + 32)];
    [*(id *)(*(void *)(a1 + 32) + 8) setShouldRemoveURLAfterGeneration:1];
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) startComputingPreview];
}

- (void)_closeIOCahnnel
{
  io_write = self->_io_write;
  if (io_write)
  {
    dispatch_io_close(io_write, 0);
    id v4 = self->_io_write;
    self->_io_write = 0;
  }
}

- (void)_writeDataArrayIntoStream:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        self->_totalWrittenBytes += [v9 length];
        id v10 = v9;
        id v11 = (const void *)[v10 bytes];
        size_t v12 = [v10 length];
        destructor[0] = MEMORY[0x1E4F143A8];
        destructor[1] = 3221225472;
        destructor[2] = __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke;
        destructor[3] = &unk_1E6DD3DB8;
        destructor[4] = v10;
        uint64_t v13 = dispatch_data_create(v11, v12, v7, destructor);
        io_write = self->_io_write;
        off_t totalWrittenBytes = self->_totalWrittenBytes;
        io_handler[0] = MEMORY[0x1E4F143A8];
        io_handler[1] = 3221225472;
        io_handler[2] = __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke_2;
        io_handler[3] = &unk_1E6DD4010;
        io_handler[4] = self;
        dispatch_io_write(io_write, totalWrittenBytes, v13, v7, io_handler);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

void __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    uint64_t v7 = (NSObject **)MEMORY[0x1E4F945F0];
    uint64_t v8 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a4;
      _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_DEFAULT, "Cannot write data into disk. error:%d. #Conversion", (uint8_t *)v9, 8u);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
    [*(id *)(a1 + 32) finishedAppendingData];
  }
}

- (void)finishedAppendingData
{
  if (!self->_dataPhaseFinished)
  {
    self->_dataPhaseFinished = 1;
    if (self->_io_write) {
      [(QLPreviewConverter *)self _closeIOCahnnel];
    }
    else {
      [(QLPreviewConverterParts *)self->_previewParts startComputingPreview];
    }
  }
}

- (void)setHtmlErrorDisabled:(BOOL)a3
{
}

- (BOOL)htmlErrorDisabled
{
  return [(QLPreviewConverterParts *)self->_previewParts htmlErrorDisabled];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpFileURL, 0);
  objc_storeStrong((id *)&self->_io_write, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_previewParts, 0);
}

@end