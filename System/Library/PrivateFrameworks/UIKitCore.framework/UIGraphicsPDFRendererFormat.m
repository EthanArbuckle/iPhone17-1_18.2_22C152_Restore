@interface UIGraphicsPDFRendererFormat
- (NSDictionary)documentInfo;
- (NSMutableData)pdfData;
- (NSURL)outputURL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDocumentInfo:(NSDictionary *)documentInfo;
- (void)setOutputURL:(id)a3;
- (void)setPdfData:(id)a3;
@end

@implementation UIGraphicsPDFRendererFormat

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIGraphicsPDFRendererFormat;
  id v4 = [(UIGraphicsRendererFormat *)&v10 copyWithZone:a3];
  v5 = [(UIGraphicsPDFRendererFormat *)self documentInfo];
  v6 = (void *)[v5 copy];
  [v4 setDocumentInfo:v6];

  v7 = [(UIGraphicsPDFRendererFormat *)self outputURL];
  [v4 setOutputURL:v7];

  v8 = [(UIGraphicsPDFRendererFormat *)self pdfData];
  [v4 setPdfData:v8];

  return v4;
}

- (NSDictionary)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(NSDictionary *)documentInfo
{
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOutputURL:(id)a3
{
}

- (NSMutableData)pdfData
{
  return (NSMutableData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPdfData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfData, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end