@interface SSHarvestedApplicationDocument
+ (BOOL)supportsBSXPCSecureCoding;
- (CGRect)PDFVisibleRect;
- (NSData)PDFData;
- (NSString)loggableDescription;
- (SSHarvestedApplicationDocument)initWithBSXPCCoder:(id)a3;
- (int64_t)PDFPage;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setPDFData:(id)a3;
- (void)setPDFPage:(int64_t)a3;
- (void)setPDFVisibleRect:(CGRect)a3;
@end

@implementation SSHarvestedApplicationDocument

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSHarvestedApplicationDocument)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSHarvestedApplicationDocument *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kSSHarvestedApplicationMetadataPDFDataKey"];
  PDFData = v5->_PDFData;
  v5->_PDFData = (NSData *)v6;

  v5->_PDFPage = [v4 decodeInt64ForKey:@"kSSHarvestedApplicationMetadataPDFPageKey"];
  [v4 decodeCGRectForKey:@"kSSHarvestedApplicationMetadataPDFVisibleRectKey"];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v5->_PDFVisibleRect.origin.x = v9;
  v5->_PDFVisibleRect.origin.y = v11;
  v5->_PDFVisibleRect.size.width = v13;
  v5->_PDFVisibleRect.size.height = v15;
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(SSHarvestedApplicationDocument *)self PDFData];
  [v5 encodeObject:v4 forKey:@"kSSHarvestedApplicationMetadataPDFDataKey"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[SSHarvestedApplicationDocument PDFPage](self, "PDFPage"), @"kSSHarvestedApplicationMetadataPDFPageKey");
  [(SSHarvestedApplicationDocument *)self PDFVisibleRect];
  objc_msgSend(v5, "encodeCGRect:forKey:", @"kSSHarvestedApplicationMetadataPDFVisibleRectKey");
}

- (NSString)loggableDescription
{
  v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  id v5 = [(SSHarvestedApplicationDocument *)self PDFData];
  int64_t v6 = [(SSHarvestedApplicationDocument *)self PDFPage];
  [(SSHarvestedApplicationDocument *)self PDFVisibleRect];
  v7 = NSStringFromCGRect(v11);
  double v8 = [v4 stringWithFormat:@" has pdfData: %d, page:%d, visibleRect:%@", v5 != 0, v6, v7];
  [v3 appendString:v8];

  return (NSString *)v3;
}

- (NSData)PDFData
{
  return self->_PDFData;
}

- (void)setPDFData:(id)a3
{
}

- (int64_t)PDFPage
{
  return self->_PDFPage;
}

- (void)setPDFPage:(int64_t)a3
{
  self->_PDFPage = a3;
}

- (CGRect)PDFVisibleRect
{
  double x = self->_PDFVisibleRect.origin.x;
  double y = self->_PDFVisibleRect.origin.y;
  double width = self->_PDFVisibleRect.size.width;
  double height = self->_PDFVisibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPDFVisibleRect:(CGRect)a3
{
  self->_PDFVisibleRect = a3;
}

- (void).cxx_destruct
{
}

@end