@interface DOCPDFMetadataProvider
+ (id)pdfMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5;
- (NSArray)displaySortOrder;
- (NSDictionary)metadataValues;
- (id)compactMetadataValues;
- (id)fullMetadataValues;
- (void)addPagesToDictionary:(id)a3;
- (void)addSecureToDictionary:(id)a3;
- (void)addSizeToDictionary:(id)a3;
- (void)addVersionToDictionary:(id)a3;
- (void)dealloc;
@end

@implementation DOCPDFMetadataProvider

+ (id)pdfMetadataProviderWithNode:(id)a3 levelOfDetail:(int64_t)a4 URL:(id)a5
{
  id v7 = a3;
  CFURLRef v8 = (const __CFURL *)a5;
  if (v8)
  {
    v9 = [v7 contentType];
    v10 = [v9 identifier];
    v11 = [UTTypePDF identifier];
    unsigned int v12 = [v10 isEqualToString:v11];

    if (v12)
    {
      v13 = CGPDFDocumentCreateWithURL(v8);
      if (v13)
      {
        v14 = v13;
        CGPDFDictionaryRef Info = CGPDFDocumentGetInfo(v13);
        if (Info)
        {
          CGPDFDictionaryRef v16 = Info;
          v17 = objc_opt_new();
          v17[2] = v16;
          v17[3] = a4;
          v17[1] = v14;
          goto LABEL_8;
        }
        CGPDFDocumentRelease(v14);
      }
    }
  }
  v17 = 0;
LABEL_8:

  return v17;
}

- (NSDictionary)metadataValues
{
  int64_t levelOfDetail = self->_levelOfDetail;
  if (levelOfDetail)
  {
    if (levelOfDetail != 1) {
      goto LABEL_6;
    }
    v3 = [(DOCPDFMetadataProvider *)self fullMetadataValues];
  }
  else
  {
    v3 = [(DOCPDFMetadataProvider *)self compactMetadataValues];
  }
  a2 = v3;
LABEL_6:

  return (NSDictionary *)(id)a2;
}

- (NSArray)displaySortOrder
{
  return (NSArray *)&off_1006BB508;
}

- (id)compactMetadataValues
{
  return +[NSDictionary dictionary];
}

- (id)fullMetadataValues
{
  v3 = objc_opt_new();
  id v4 = [&off_1006BB520 mutableCopy];
  [(DOCPDFMetadataProvider *)self addVersionToDictionary:v3];
  [(DOCPDFMetadataProvider *)self addPagesToDictionary:v3];
  [(DOCPDFMetadataProvider *)self addSizeToDictionary:v3];
  [(DOCPDFMetadataProvider *)self addSecureToDictionary:v3];
  if (CGPDFDocumentIsUnlocked(self->_pdfDocument))
  {
    pdfCGPDFDictionaryRef Info = self->_pdfInfo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E9124;
    v10[3] = &unk_100689500;
    id v11 = v4;
    id v6 = v3;
    id v12 = v6;
    CGPDFDictionaryApplyBlock(pdfInfo, v10, 0);
    id v7 = v12;
    id v8 = v6;
  }

  return v3;
}

- (void)addPagesToDictionary:(id)a3
{
  pdfDocument = self->_pdfDocument;
  id v4 = a3;
  id v6 = +[NSNumber numberWithUnsignedLong:CGPDFDocumentGetNumberOfPages(pdfDocument)];
  v5 = +[NSNumberFormatter localizedStringFromNumber:v6 numberStyle:0];
  [v4 setObject:v5 forKeyedSubscript:@"Pages"];
}

- (void)addSecureToDictionary:(id)a3
{
  pdfDocument = self->_pdfDocument;
  id v4 = a3;
  BOOL IsEncrypted = CGPDFDocumentIsEncrypted(pdfDocument);
  id v6 = _DocumentManagerBundle();
  id v7 = v6;
  if (IsEncrypted)
  {
    CFStringRef v8 = @"Metadata File Encryption Status [Encrypted With Password]";
    CFStringRef v9 = @"Password";
  }
  else
  {
    CFStringRef v8 = @"Metadata File Encryption Status [Not Encrypted]";
    CFStringRef v9 = @"None";
  }
  id v10 = [v6 localizedStringForKey:v8 value:v9 table:@"Localizable"];

  [v4 setObject:v10 forKeyedSubscript:@"Security"];
}

- (void)addVersionToDictionary:(id)a3
{
  id v4 = a3;
  int majorVersion = 0;
  int minorVersion = 0;
  CGPDFDocumentGetVersion(self->_pdfDocument, &majorVersion, &minorVersion);
  if (majorVersion >= 1)
  {
    v5 = +[NSString stringWithFormat:@"%d.%d", majorVersion, minorVersion];
    [v4 setObject:v5 forKeyedSubscript:@"Version"];
  }
}

- (void)addSizeToDictionary:(id)a3
{
  id v6 = a3;
  if (CGPDFDocumentGetNumberOfPages(self->_pdfDocument))
  {
    Page = CGPDFDocumentGetPage(self->_pdfDocument, 1uLL);
    if (Page)
    {
      CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
      v5 = DOCLocalizedMetadataStringForWidthByHeight();
      [v6 setObject:v5 forKeyedSubscript:@"Resolution"];
    }
  }
}

- (void)dealloc
{
  CGPDFDocumentRelease(self->_pdfDocument);
  v3.receiver = self;
  v3.super_class = (Class)DOCPDFMetadataProvider;
  [(DOCPDFMetadataProvider *)&v3 dealloc];
}

@end