@interface QLBasePreviewParts
+ (BOOL)canConvertDocumentType:(id)a3;
+ (BOOL)isBundleURL:(id)a3;
+ (void)dataCallbackForUTI:(id)a3 andSize:(unint64_t)a4;
+ (void)urlCallbackForUTI:(id)a3;
- (void)computePreview;
@end

@implementation QLBasePreviewParts

+ (BOOL)canConvertDocumentType:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[QLPreviewConverter isOfficeDocumentType:v3]
    || +[QLPreviewConverter isIWorkDocumentType:v3]
    || +[QLPreviewConverter isLPDFDocumentType:v3]
    || +[QLPreviewConverter isCSVDocumentType:v3]
    || +[QLPreviewConverter isRTFDocumentType:v3];

  return v4;
}

+ (BOOL)isBundleURL:(id)a3
{
  id v3 = a3;
  if ([v3 isFileURL])
  {
    char v8 = 0;
    BOOL v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [v3 path];
    [v4 fileExistsAtPath:v5 isDirectory:&v8];

    BOOL v6 = v8 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (void)urlCallbackForUTI:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = +[QLPreviewConverter isOfficeDocumentType:v3];
  v5 = OIGenerateProgressivePreviewForURL;
  if (v4) {
    goto LABEL_6;
  }
  BOOL v6 = +[QLPreviewConverter isIWorkDocumentType:v3];
  v5 = IWGenerateProgressivePreviewForURL;
  if (v6
    || (BOOL v7 = +[QLPreviewConverter isCSVDocumentType:v3],
        v5 = OIGenerateProgressivePreviewForURL,
        v7)
    || (BOOL v8 = +[QLPreviewConverter isRTFDocumentType:v3],
        v5 = RTFGeneratePreviewForURL,
        v8)
    || (BOOL v9 = +[QLPreviewConverter isLPDFDocumentType:v3],
        v5 = LPDFGeneratePreviewForURL,
        v9))
  {
LABEL_6:
    v10 = v5;
  }
  else
  {
    v12 = (NSObject **)MEMORY[0x1E4F945F0];
    v13 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl(&dword_1E2805000, v13, OS_LOG_TYPE_ERROR, "Cannot find url converter callback for uti %@ #Conversion", (uint8_t *)&v14, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (void)dataCallbackForUTI:(id)a3 andSize:(unint64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[QLPreviewConverter isOfficeDocumentType:v4];
  BOOL v6 = OIGenerateProgressivePreviewForData;
  if (v5
    || (BOOL v7 = +[QLPreviewConverter isIWorkDocumentType:v4],
        BOOL v6 = IWGenerateAtomicPreviewForData,
        v7)
    || (BOOL v8 = +[QLPreviewConverter isCSVDocumentType:v4],
        BOOL v6 = OIGenerateProgressivePreviewForData,
        v8)
    || (BOOL v9 = +[QLPreviewConverter isRTFDocumentType:v4],
        BOOL v6 = RTFGeneratePreviewForData,
        v9))
  {
    v10 = v6;
  }
  else
  {
    v12 = (NSObject **)MEMORY[0x1E4F945F0];
    v13 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1E2805000, v13, OS_LOG_TYPE_ERROR, "Cannot find data converter callback for uti %@ #Conversion", (uint8_t *)&v14, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

- (void)computePreview
{
  id v3 = [(QLPreviewParts *)self previewURL];
  if (v3)
  {
    id v21 = v3;
    id v4 = [MEMORY[0x1E4F42948] currentDevice];
    BOOL v5 = [v4 userInterfaceIdiom] == 0;

    BOOL v6 = (void *)MEMORY[0x1E4F1CA60];
    BOOL v7 = [v21 absoluteString];
    BOOL v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    BOOL v9 = [(QLPreviewConverterParts *)self fileName];
    v10 = objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, @"URLBase", v8, @"IsOnPhone", v9, @"FileName", 0);

    v11 = [(QLPreviewConverterParts *)self password];

    if (v11)
    {
      v12 = [(QLPreviewConverterParts *)self password];
      [v10 setObject:v12 forKey:@"Password"];
    }
    data = self->super._data;
    if (data)
    {
      int v14 = +[QLBasePreviewParts dataCallbackForUTI:self->super._uti andSize:[(NSData *)data length]];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = self->super._data;
        uti = self->super._uti;
LABEL_7:
        ((void (*)(void, QLBasePreviewParts *, void *, NSString *, void *))v15)(0, self, v16, uti, v10);
      }
    }
    else
    {
      url = self->super._url;
      if (url)
      {
        if (![(NSURL *)url isFileURL])
        {
          v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:self->super._url];
          v20 = +[QLBasePreviewParts dataCallbackForUTI:self->super._uti andSize:[(NSData *)self->super._data length]];
          if (v20) {
            v20(0, self, v19, self->super._uti, v10);
          }

          goto LABEL_19;
        }
        id v15 = +[QLBasePreviewParts isBundleURL:self->super._url]
           && PGPackageHasEmbeddedPreview(self->super._url)
            ? PGGeneratePreviewForURL
            : (uint64_t (*)(uint64_t, __QLPreviewRequest *, const void *))+[QLBasePreviewParts urlCallbackForUTI:self->super._uti];
        if (v15)
        {
          uint64_t v16 = self->super._url;
          uti = self->super._uti;
          goto LABEL_7;
        }
      }
    }
LABEL_19:

    id v3 = v21;
  }
}

@end