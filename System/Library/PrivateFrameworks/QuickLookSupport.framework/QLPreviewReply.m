@interface QLPreviewReply
+ (BOOL)supportsSecureCoding;
- (BOOL)wantsBorder;
- (CGSize)contentSize;
- (CGSize)minimumSize;
- (NSData)data;
- (NSDictionary)attachments;
- (NSString)title;
- (NSStringEncoding)stringEncoding;
- (QLPreviewReply)init;
- (QLPreviewReply)initForPDFWithPageSize:(CGSize)defaultPageSize documentCreationBlock:(void *)documentCreationBlock;
- (QLPreviewReply)initWithCoder:(id)a3;
- (QLPreviewReply)initWithContextSize:(CGSize)contextSize isBitmap:(BOOL)isBitmap drawingBlock:(void *)drawingBlock;
- (QLPreviewReply)initWithDataOfContentType:(UTType *)contentType contentSize:(CGSize)contentSize dataCreationBlock:(void *)dataCreationBlock;
- (QLPreviewReply)initWithFileURL:(NSURL *)fileURL;
- (QLPreviewReply)initWithFileURL:(id)a3 forcedContentType:(id)a4;
- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 minimumSize:(CGSize)a4 title:(id)a5 wantsBorder:(BOOL)a6;
- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 title:(id)a4 wantsBorder:(BOOL)a5;
- (QLTBitmapFormat)bitmapFormat;
- (QLURLHandler)fileURLHandler;
- (UTType)contentType;
- (id)dataCreationBlock;
- (id)documentCreationBlock;
- (id)drawInContextBlock;
- (id)drawWithContext:(CGContext *)a3;
- (id)updateFromDataCreationBlock;
- (unint64_t)replyType;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(NSDictionary *)attachments;
- (void)setBitmapFormat:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setContentType:(id)a3;
- (void)setData:(id)a3;
- (void)setDataCreationBlock:(id)a3;
- (void)setDocumentCreationBlock:(id)a3;
- (void)setDrawInContextBlock:(id)a3;
- (void)setFileURLHandler:(id)a3;
- (void)setMinimumSize:(CGSize)a3;
- (void)setReplyType:(unint64_t)a3;
- (void)setStringEncoding:(NSStringEncoding)stringEncoding;
- (void)setTitle:(NSString *)title;
- (void)setWantsBorder:(BOOL)a3;
- (void)updateWithImageData:(id)a3 bitmapFormat:(id)a4;
@end

@implementation QLPreviewReply

- (QLPreviewReply)init
{
  v8.receiver = self;
  v8.super_class = (Class)QLPreviewReply;
  v2 = [(QLPreviewReply *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_wantsBorder = 1;
    attachments = v2->_attachments;
    v5 = (NSDictionary *)MEMORY[0x263EFFA78];
    v2->_stringEncoding = 4;
    v2->_attachments = v5;

    title = v3->_title;
    v3->_title = (NSString *)&stru_26C8F1910;
  }
  return v3;
}

- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 minimumSize:(CGSize)a4 title:(id)a5 wantsBorder:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  double v9 = a3.height;
  double v10 = a3.width;
  id v12 = a5;
  v13 = (QLPreviewReply *)objc_opt_new();
  [(QLPreviewReply *)v13 setTitle:v12];

  -[QLPreviewReply setContentSize:](v13, "setContentSize:", v10, v9);
  -[QLPreviewReply setMinimumSize:](v13, "setMinimumSize:", width, height);
  [(QLPreviewReply *)v13 setWantsBorder:v6];
  [(QLPreviewReply *)v13 setReplyType:5];

  return v13;
}

- (QLPreviewReply)initWithViewControllerOfPreferredContentSize:(CGSize)a3 title:(id)a4 wantsBorder:(BOOL)a5
{
  return -[QLPreviewReply initWithViewControllerOfPreferredContentSize:minimumSize:title:wantsBorder:](self, "initWithViewControllerOfPreferredContentSize:minimumSize:title:wantsBorder:", a4, a5, a3.width, a3.height, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (QLPreviewReply)initWithContextSize:(CGSize)contextSize isBitmap:(BOOL)isBitmap drawingBlock:(void *)drawingBlock
{
  BOOL v5 = isBitmap;
  double height = contextSize.height;
  double width = contextSize.width;
  double v9 = drawingBlock;
  double v10 = (QLPreviewReply *)objc_opt_new();
  [(QLPreviewReply *)v10 setReplyType:!v5];
  [(QLPreviewReply *)v10 setDrawInContextBlock:v9];

  -[QLPreviewReply setContentSize:](v10, "setContentSize:", width, height);
  v11 = (void *)MEMORY[0x263F1DB18];
  if (!v5) {
    v11 = (void *)MEMORY[0x263F1DBF0];
  }
  [(QLPreviewReply *)v10 setContentType:*v11];

  return v10;
}

- (QLPreviewReply)initForPDFWithPageSize:(CGSize)defaultPageSize documentCreationBlock:(void *)documentCreationBlock
{
  double height = defaultPageSize.height;
  double width = defaultPageSize.width;
  v7 = documentCreationBlock;
  objc_super v8 = (QLPreviewReply *)objc_opt_new();
  [(QLPreviewReply *)v8 setReplyType:2];
  -[QLPreviewReply setContentSize:](v8, "setContentSize:", width, height);
  [(QLPreviewReply *)v8 setDocumentCreationBlock:v7];

  [(QLPreviewReply *)v8 setContentType:*MEMORY[0x263F1DBF0]];
  return v8;
}

- (QLPreviewReply)initWithFileURL:(NSURL *)fileURL
{
  return [(QLPreviewReply *)self initWithFileURL:fileURL forcedContentType:0];
}

- (QLPreviewReply)initWithFileURL:(id)a3 forcedContentType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = (QLPreviewReply *)objc_opt_new();
  [(QLPreviewReply *)v8 setReplyType:3];
  if (v6)
  {
    id v9 = objc_alloc(MEMORY[0x263F160E8]);
    double v10 = (void *)[v9 initWithURL:v6 sandboxType:*MEMORY[0x263EF8000]];
    [(QLPreviewReply *)v8 setFileURLHandler:v10];

    if (v7)
    {
      [(QLPreviewReply *)v8 setContentType:v7];
    }
    else
    {
      v11 = (void *)MEMORY[0x263F1D920];
      id v12 = [MEMORY[0x263F160F0] UTIForURL:v6];
      v13 = [v11 typeWithIdentifier:v12];
      [(QLPreviewReply *)v8 setContentType:v13];
    }
  }

  return v8;
}

- (QLPreviewReply)initWithDataOfContentType:(UTType *)contentType contentSize:(CGSize)contentSize dataCreationBlock:(void *)dataCreationBlock
{
  double height = contentSize.height;
  double width = contentSize.width;
  id v9 = dataCreationBlock;
  double v10 = contentType;
  v11 = (QLPreviewReply *)objc_opt_new();
  [(QLPreviewReply *)v11 setReplyType:4];
  [(QLPreviewReply *)v11 setContentType:v10];

  -[QLPreviewReply setContentSize:](v11, "setContentSize:", width, height);
  [(QLPreviewReply *)v11 setDataCreationBlock:v9];

  return v11;
}

- (void)updateWithImageData:(id)a3 bitmapFormat:(id)a4
{
  id v6 = a4;
  [(QLPreviewReply *)self setData:a3];
  [(QLPreviewReply *)self setBitmapFormat:v6];
}

- (id)updateFromDataCreationBlock
{
  id v3 = [(QLPreviewReply *)self dataCreationBlock];

  if (v3)
  {
    v4 = [(QLPreviewReply *)self dataCreationBlock];
    id v7 = 0;
    BOOL v5 = ((void (**)(void, QLPreviewReply *, id *))v4)[2](v4, self, &v7);
    id v3 = v7;
    [(QLPreviewReply *)self setData:v5];
  }
  return v3;
}

- (id)drawWithContext:(CGContext *)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(QLPreviewReply *)self drawInContextBlock];

  if (!v5)
  {
    double v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v14[0] = @"Unable to render preview";
    id v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v9 = [v10 errorWithDomain:@"QuickLookPreviewErrors" code:3 userInfo:v8];
    goto LABEL_5;
  }
  id v6 = [(QLPreviewReply *)self drawInContextBlock];
  id v12 = 0;
  char v7 = ((uint64_t (**)(void, CGContext *, QLPreviewReply *, id *))v6)[2](v6, a3, self, &v12);
  id v8 = v12;

  uint64_t v9 = 0;
  if (v7)
  {
LABEL_5:

    id v8 = (id)v9;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v16 = a3;
  v4 = [(QLPreviewReply *)self contentType];
  [v16 encodeObject:v4 forKey:@"contentType"];

  BOOL v5 = [(QLPreviewReply *)self data];
  [v16 encodeObject:v5 forKey:@"data"];

  objc_msgSend(v16, "encodeInteger:forKey:", -[QLPreviewReply stringEncoding](self, "stringEncoding"), @"stringEncoding");
  id v6 = [(QLPreviewReply *)self attachments];
  [v16 encodeObject:v6 forKey:@"attachments"];

  char v7 = [(QLPreviewReply *)self fileURLHandler];
  [v16 encodeObject:v7 forKey:@"fileURL"];

  id v8 = [(QLPreviewReply *)self bitmapFormat];
  [v16 encodeObject:v8 forKey:@"bitmapFormat"];

  uint64_t v9 = [(QLPreviewReply *)self title];
  [v16 encodeObject:v9 forKey:@"title"];

  [(QLPreviewReply *)self contentSize];
  *(float *)&double v10 = v10;
  [v16 encodeFloat:@"contentWidth" forKey:v10];
  [(QLPreviewReply *)self contentSize];
  *(float *)&double v12 = v11;
  [v16 encodeFloat:@"contentHeight" forKey:v12];
  [(QLPreviewReply *)self minimumSize];
  *(float *)&double v13 = v13;
  [v16 encodeFloat:@"minimumWidth" forKey:v13];
  [(QLPreviewReply *)self minimumSize];
  *(float *)&double v15 = v14;
  [v16 encodeFloat:@"minimumHeight" forKey:v15];
  objc_msgSend(v16, "encodeBool:forKey:", -[QLPreviewReply wantsBorder](self, "wantsBorder"), @"wantsBorder");
  objc_msgSend(v16, "encodeInteger:forKey:", -[QLPreviewReply replyType](self, "replyType"), @"replyType");
}

- (QLPreviewReply)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)QLPreviewReply;
  BOOL v5 = [(QLPreviewReply *)&v23 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentType"];
    [(QLPreviewReply *)v5 setContentType:v6];

    char v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(QLPreviewReply *)v5 setData:v7];

    -[QLPreviewReply setStringEncoding:](v5, "setStringEncoding:", [v4 decodeIntegerForKey:@"stringEncoding"]);
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    double v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    double v12 = [v4 decodeObjectOfClasses:v11 forKey:@"attachments"];
    [(QLPreviewReply *)v5 setAttachments:v12];

    double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    [(QLPreviewReply *)v5 setFileURLHandler:v13];

    double v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bitmapFormat"];
    [(QLPreviewReply *)v5 setBitmapFormat:v14];

    double v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    [(QLPreviewReply *)v5 setTitle:v15];

    [v4 decodeFloatForKey:@"contentWidth"];
    double v17 = v16;
    [v4 decodeFloatForKey:@"contentHeight"];
    -[QLPreviewReply setContentSize:](v5, "setContentSize:", v17, v18);
    [v4 decodeFloatForKey:@"minimumWidth"];
    double v20 = v19;
    [v4 decodeFloatForKey:@"minimumHeight"];
    -[QLPreviewReply setMinimumSize:](v5, "setMinimumSize:", v20, v21);
    -[QLPreviewReply setWantsBorder:](v5, "setWantsBorder:", [v4 decodeBoolForKey:@"wantsBorder"]);
    -[QLPreviewReply setReplyType:](v5, "setReplyType:", [v4 decodeIntegerForKey:@"replyType"]);
  }

  return v5;
}

- (NSStringEncoding)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(NSStringEncoding)stringEncoding
{
  self->_stringEncoding = stringEncoding;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAttachments:(NSDictionary *)attachments
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTitle:(NSString *)title
{
}

- (unint64_t)replyType
{
  return self->_replyType;
}

- (void)setReplyType:(unint64_t)a3
{
  self->_replyType = a3;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setData:(id)a3
{
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContentType:(id)a3
{
}

- (CGSize)contentSize
{
  objc_copyStruct(v4, &self->_contentSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_contentSize, &v3, 16, 1, 0);
}

- (CGSize)minimumSize
{
  objc_copyStruct(v4, &self->_minimumSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_minimumSize, &v3, 16, 1, 0);
}

- (QLURLHandler)fileURLHandler
{
  return (QLURLHandler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileURLHandler:(id)a3
{
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBitmapFormat:(id)a3
{
}

- (BOOL)wantsBorder
{
  return self->_wantsBorder;
}

- (void)setWantsBorder:(BOOL)a3
{
  self->_wantsBorder = a3;
}

- (id)drawInContextBlock
{
  return self->_drawInContextBlock;
}

- (void)setDrawInContextBlock:(id)a3
{
}

- (id)documentCreationBlock
{
  return self->_documentCreationBlock;
}

- (void)setDocumentCreationBlock:(id)a3
{
}

- (id)dataCreationBlock
{
  return self->_dataCreationBlock;
}

- (void)setDataCreationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataCreationBlock, 0);
  objc_storeStrong(&self->_documentCreationBlock, 0);
  objc_storeStrong(&self->_drawInContextBlock, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_fileURLHandler, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end