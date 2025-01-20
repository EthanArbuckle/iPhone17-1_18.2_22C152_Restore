@interface PXVisualDiagnosticsContext
- (BOOL)isPrivateDataAllowed;
- (CGContext)CGContext;
- (CGRect)currentPageBounds;
- (CGSize)defaultPageSize;
- (NSURL)fileURL;
- (PXVisualDiagnosticsConfiguration)configuration;
- (PXVisualDiagnosticsContext)init;
- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3;
- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3 dataConsumer:(CGDataConsumer *)a4;
- (void)addPagesForTableWithConfiguration:(id)a3 columnsConfiguration:(id)a4 rowsConfiguration:(id)a5;
- (void)addTitlePageWithTitle:(id)a3 subtitle:(id)a4;
- (void)beginPage;
- (void)beginPageWithConfiguration:(id)a3;
- (void)dealloc;
- (void)drawImageInRect:(CGRect)a3 configuration:(id)a4;
- (void)drawTextInRect:(CGRect)a3 configuration:(id)a4;
- (void)endPage;
- (void)fillRect:(CGRect)a3 configuration:(id)a4;
- (void)strokeRect:(CGRect)a3 configuration:(id)a4;
@end

@implementation PXVisualDiagnosticsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (PXVisualDiagnosticsConfiguration)configuration
{
  return self->_configuration;
}

- (CGRect)currentPageBounds
{
  double x = self->_currentPageBounds.origin.x;
  double y = self->_currentPageBounds.origin.y;
  double width = self->_currentPageBounds.size.width;
  double height = self->_currentPageBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGContext)CGContext
{
  return self->_CGContext;
}

- (BOOL)isPrivateDataAllowed
{
  v2 = [(PXVisualDiagnosticsContext *)self configuration];
  char v3 = [v2 isPrivateDataAllowed];

  return v3;
}

- (void)addPagesForTableWithConfiguration:(id)a3 columnsConfiguration:(id)a4 rowsConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = (void (**)(id, PXVisualDiagnosticsTable *))a3;
  v11 = objc_alloc_init(PXVisualDiagnosticsTable);
  -[PXVisualDiagnosticsTable setMargins:](v11, "setMargins:", 10.0, 10.0, 10.0, 10.0);
  v10[2](v10, v11);

  [(PXVisualDiagnosticsTable *)v11 configureColumnsWithConfiguration:v9];
  [(PXVisualDiagnosticsTable *)v11 renderInContext:self withRowsConfiguration:v8];
}

- (void)addTitlePageWithTitle:(id)a3 subtitle:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x263F089B8];
  id v8 = a3;
  id v9 = [v7 alloc];
  uint64_t v10 = *MEMORY[0x263F814F0];
  v35[0] = *MEMORY[0x263F814F0];
  double v11 = *MEMORY[0x263F81800];
  v12 = [MEMORY[0x263F81708] systemFontOfSize:24.0 weight:*MEMORY[0x263F81800]];
  v36[0] = v12;
  uint64_t v13 = *MEMORY[0x263F81500];
  v35[1] = *MEMORY[0x263F81500];
  v14 = [MEMORY[0x263F825C8] blackColor];
  v36[1] = v14;
  v15 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  v16 = (void *)[v9 initWithString:v8 attributes:v15];

  v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
  [v16 appendAttributedString:v17];

  if ([v6 length])
  {
    id v18 = objc_alloc(MEMORY[0x263F086A0]);
    v33[0] = v10;
    v19 = [MEMORY[0x263F81708] systemFontOfSize:18.0 weight:v11];
    v33[1] = v13;
    v34[0] = v19;
    v20 = [MEMORY[0x263F825C8] lightGrayColor];
    v34[1] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    v22 = (void *)[v18 initWithString:v6 attributes:v21];
    [v16 appendAttributedString:v22];
  }
  [(PXVisualDiagnosticsContext *)self beginPage];
  [(PXVisualDiagnosticsContext *)self currentPageBounds];
  CGRect v38 = CGRectInset(v37, 80.0, 100.0);
  double x = v38.origin.x;
  double y = v38.origin.y;
  double width = v38.size.width;
  double height = v38.size.height;
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = __61__PXVisualDiagnosticsContext_addTitlePageWithTitle_subtitle___block_invoke;
  v31 = &unk_26545AB50;
  id v32 = v16;
  id v27 = v16;
  -[PXVisualDiagnosticsContext drawTextInRect:configuration:](self, "drawTextInRect:configuration:", &v28, x, y, width, height);
  [(PXVisualDiagnosticsContext *)self endPage];
}

uint64_t __61__PXVisualDiagnosticsContext_addTitlePageWithTitle_subtitle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAttributedText:*(void *)(a1 + 32)];
}

- (void)drawImageInRect:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = (void (**)(id, _PXVisualDiagnosticsDrawImageConfiguration *))a4;
  v17 = objc_alloc_init(_PXVisualDiagnosticsDrawImageConfiguration);
  v8[2](v8, v17);

  id v9 = [(_PXVisualDiagnosticsDrawImageConfiguration *)v17 image];
  uint64_t v10 = [(_PXVisualDiagnosticsDrawImageConfiguration *)v17 symbolName];
  double v11 = (void *)v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    id v9 = [MEMORY[0x263F827E8] systemImageNamed:v10];
  }
  if (v9)
  {
    [v9 size];
    PXSizeGetAspectRatio(v13, v14);
    PFSizeWithAspectRatioFittingSize();
    objc_msgSend(v9, "drawInRect:", x + width * 0.5 + v15 * -0.5, y + height * 0.5 + v16 * -0.5, v15);
  }
}

- (void)drawTextInRect:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = (void (**)(id, _PXVisualDiagnosticsDrawTextConfiguration *))a4;
  v35 = objc_alloc_init(_PXVisualDiagnosticsDrawTextConfiguration);
  v8[2](v8, v35);

  [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 relativePosition];
  double v10 = v9;
  uint64_t v12 = v11;
  double v13 = [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 attributedText];
  if (!v13)
  {
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    double v15 = [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 font];
    if (v15)
    {
      [v14 setObject:v15 forKeyedSubscript:*MEMORY[0x263F814F0]];
    }
    else
    {
      double v16 = (void *)MEMORY[0x263F81708];
      [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 fontSize];
      v17 = objc_msgSend(v16, "monospacedSystemFontOfSize:weight:");
      [v14 setObject:v17 forKeyedSubscript:*MEMORY[0x263F814F0]];
    }
    id v18 = [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 textColor];
    [v14 setObject:v18 forKeyedSubscript:*MEMORY[0x263F81500]];

    v19 = [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 backgroundColor];
    [v14 setObject:v19 forKeyedSubscript:*MEMORY[0x263F814A8]];

    id v20 = objc_alloc_init(MEMORY[0x263F81650]);
    v21 = v20;
    if (v10 <= 0.666666667)
    {
      if (v10 <= 0.333333333)
      {
LABEL_10:
        [v14 setObject:v21 forKeyedSubscript:*MEMORY[0x263F81540]];
        id v23 = objc_alloc(MEMORY[0x263F086A0]);
        uint64_t v24 = [(_PXVisualDiagnosticsDrawTextConfiguration *)v35 text];
        v25 = (void *)v24;
        if (v24) {
          v26 = (__CFString *)v24;
        }
        else {
          v26 = &stru_270799240;
        }
        double v13 = (void *)[v23 initWithString:v26 attributes:v14];

        goto LABEL_14;
      }
      uint64_t v22 = 1;
    }
    else
    {
      uint64_t v22 = 2;
    }
    [v20 setAlignment:v22];
    goto LABEL_10;
  }
LABEL_14:
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, width, height, v12);
  double v28 = v27;
  double v30 = v29;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  double MinX = CGRectGetMinX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.double width = width;
  v38.size.double height = height;
  double v32 = MinX + v10 * (CGRectGetMaxX(v38) - v28 - MinX);
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.double width = width;
  v39.size.double height = height;
  double MinY = CGRectGetMinY(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  objc_msgSend(v13, "drawInRect:", v32, MinY + v34 * (CGRectGetMaxY(v40) - v30 - MinY), v28, v30);
}

- (void)fillRect:(CGRect)a3 configuration:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = (void (**)(id, _PXVisualDiagnosticsFillRectConfiguration *))a4;
  uint64_t v12 = objc_alloc_init(_PXVisualDiagnosticsFillRectConfiguration);
  v9[2](v9, v12);

  double v10 = [(PXVisualDiagnosticsContext *)self CGContext];
  id v11 = [(_PXVisualDiagnosticsFillRectConfiguration *)v12 fillColor];
  CGContextSetFillColorWithColor(v10, (CGColorRef)[v11 CGColor]);

  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGContextFillRect(v10, v14);
}

- (void)strokeRect:(CGRect)a3 configuration:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = (void (**)(id, _PXVisualDiagnosticsStrokeRectConfiguration *))a4;
  double v13 = objc_alloc_init(_PXVisualDiagnosticsStrokeRectConfiguration);
  v9[2](v9, v13);

  double v10 = [(PXVisualDiagnosticsContext *)self CGContext];
  id v11 = [(_PXVisualDiagnosticsStrokeRectConfiguration *)v13 strokeColor];
  CGContextSetStrokeColorWithColor(v10, (CGColorRef)[v11 CGColor]);

  [(_PXVisualDiagnosticsStrokeRectConfiguration *)v13 lineWidth];
  CGContextSetLineWidth(v10, v12);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGContextStrokeRect(v10, v15);
}

- (void)endPage
{
  [(PXVisualDiagnosticsContext *)self currentPageBounds];
  if (CGRectIsNull(v6))
  {
    char v3 = PXAssertGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_259CDA000, v3, OS_LOG_TYPE_ERROR, "unbalanced page end", v5, 2u);
    }
  }
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_currentPageBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_currentPageBounds.size = v4;
  UIGraphicsPopContext();
  CGPDFContextEndPage([(PXVisualDiagnosticsContext *)self CGContext]);
}

- (void)beginPageWithConfiguration:(id)a3
{
  CGSize v4 = (void (**)(id, void *))a3;
  v5 = [_PXVisualDiagnosticsPageConfiguration alloc];
  CGRect v6 = [(PXVisualDiagnosticsContext *)self configuration];
  v7 = [(_PXVisualDiagnosticsPageConfiguration *)v5 initWithConfiguration:v6];

  v4[2](v4, v7);
  id v8 = [(PXVisualDiagnosticsContext *)self CGContext];
  [(PXVisualDiagnosticsContext *)self currentPageBounds];
  if (!CGRectIsNull(v16))
  {
    double v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15[0] = 0;
      _os_log_error_impl(&dword_259CDA000, v9, OS_LOG_TYPE_ERROR, "unbalanced page begin", (uint8_t *)v15, 2u);
    }
  }
  [(_PXVisualDiagnosticsPageConfiguration *)v7 pageSize];
  self->_currentPageBounds.origin = (CGPoint)*MEMORY[0x263F00148];
  self->_currentPageBounds.size.CGFloat width = v10;
  self->_currentPageBounds.size.CGFloat height = v11;
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  double v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", self->_currentPageBounds.origin.x, self->_currentPageBounds.origin.y, self->_currentPageBounds.size.width, self->_currentPageBounds.size.height);
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F00438]];

  CGPDFContextBeginPage(v8, (CFDictionaryRef)v12);
  UIGraphicsPushContext(v8);
  CGFloat MaxY = CGRectGetMaxY(self->_currentPageBounds);
  CGContextTranslateCTM(v8, 0.0, MaxY);
  CGContextScaleCTM(v8, 1.0, -1.0);
}

- (void)beginPage
{
}

- (CGSize)defaultPageSize
{
  v2 = [(PXVisualDiagnosticsContext *)self configuration];
  [v2 defaultPageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)dealloc
{
  CGContextRelease(self->_CGContext);
  v3.receiver = self;
  v3.super_class = (Class)PXVisualDiagnosticsContext;
  [(PXVisualDiagnosticsContext *)&v3 dealloc];
}

- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3 dataConsumer:(CGDataConsumer *)a4
{
  id v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXVisualDiagnosticsContext;
  double v8 = [(PXVisualDiagnosticsContext *)&v27 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    CGSize v10 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    v9->_currentPageBounds.origin = (CGPoint)*MEMORY[0x263F001A0];
    v9->_currentPageBounds.size = v10;
    [(PXVisualDiagnosticsConfiguration *)v9->_configuration defaultPageSize];
    mediaBox.origin = (CGPoint)*MEMORY[0x263F00148];
    mediaBox.size.CGFloat width = v11;
    mediaBox.size.CGFloat height = v12;
    id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v13 setObject:@"Photos Visual Diagnostics" forKeyedSubscript:*MEMORY[0x263F003B8]];
    if (a4)
    {
      v9->_CGContext = CGPDFContextCreate(a4, &mediaBox, (CFDictionaryRef)v13);
    }
    else
    {
      CGRect v14 = [(PXVisualDiagnosticsConfiguration *)v9->_configuration name];
      if (![(__CFString *)v14 length])
      {

        CGRect v14 = @"VisualDiagnostics";
      }
      id v15 = objc_alloc_init(MEMORY[0x263F08790]);
      [v15 setDateFormat:@"yyyy-MM-dd-HHmmss"];
      CGRect v16 = [MEMORY[0x263EFF910] date];
      v17 = [v15 stringFromDate:v16];
      id v18 = [(__CFString *)v14 stringByAppendingFormat:@"-%@", v17];

      v19 = NSURL;
      id v20 = NSTemporaryDirectory();
      v21 = [v19 fileURLWithPath:v20 isDirectory:1];
      uint64_t v22 = [v21 URLByAppendingPathComponent:v18 isDirectory:0];
      uint64_t v23 = [v22 URLByAppendingPathExtension:@"pdf"];
      fileURL = v9->_fileURL;
      v9->_fileURL = (NSURL *)v23;

      v9->_CGContext = CGPDFContextCreateWithURL((CFURLRef)v9->_fileURL, &mediaBox, (CFDictionaryRef)v13);
    }
  }
  return v9;
}

- (PXVisualDiagnosticsContext)initWithConfiguration:(id)a3
{
  return [(PXVisualDiagnosticsContext *)self initWithConfiguration:a3 dataConsumer:0];
}

- (PXVisualDiagnosticsContext)init
{
  double v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVisualDiagnosticsContext.m", 41, @"%s is not available as initializer", "-[PXVisualDiagnosticsContext init]");

  abort();
}

@end