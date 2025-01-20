@interface QLFilePreviewRequest
- (NSURL)fileURL;
- (QLFilePreviewRequest)initWithURL:(id)a3;
- (QLFilePreviewRequest)initWithURL:(id)a3 contentType:(id)a4;
- (UTType)contentType;
- (void)setContentType:(id)a3;
@end

@implementation QLFilePreviewRequest

- (QLFilePreviewRequest)initWithURL:(id)a3
{
  return [(QLFilePreviewRequest *)self initWithURL:a3 contentType:0];
}

- (QLFilePreviewRequest)initWithURL:(id)a3 contentType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)QLFilePreviewRequest;
  v9 = [(QLFilePreviewRequest *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    if (v8)
    {
      v11 = (UTType *)v8;
      contentType = v10->_contentType;
      v10->_contentType = v11;
    }
    else
    {
      v13 = (void *)MEMORY[0x263F1D920];
      contentType = [MEMORY[0x263F160F0] UTIForURL:v7];
      uint64_t v14 = [v13 typeWithIdentifier:contentType];
      v15 = v10->_contentType;
      v10->_contentType = (UTType *)v14;
    }
  }

  return v10;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end