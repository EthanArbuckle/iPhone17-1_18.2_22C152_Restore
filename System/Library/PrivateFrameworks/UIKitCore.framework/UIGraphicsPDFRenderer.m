@interface UIGraphicsPDFRenderer
+ (CGContext)contextWithFormat:(id)a3;
+ (Class)rendererContextClass;
+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4;
- (BOOL)writePDFToURL:(NSURL *)url withActions:(UIGraphicsPDFDrawingActions)actions error:(NSError *)error;
- (NSData)PDFDataWithActions:(UIGraphicsPDFDrawingActions)actions;
- (UIGraphicsPDFRenderer)init;
- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)a3;
- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsPDFRendererFormat *)format;
- (void)popContext:(id)a3;
- (void)pushContext:(id)a3;
@end

@implementation UIGraphicsPDFRenderer

- (void)pushContext:(id)a3
{
  id v3 = a3;
  v4 = malloc_type_malloc(0x48uLL, 0x1000040773C5DECuLL);
  [v3 documentBounds];
  void *v4 = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  [v3 pageBounds];
  v4[4] = v9;
  v4[5] = v10;
  v4[6] = v11;
  v4[7] = v12;
  *((unsigned char *)v4 + 64) = [v3 inPage];
  v13 = (CGContext *)[v3 CGContext];

  ContextStack = (int *)GetContextStack(1);
  CGContextRef v15 = CGContextRetain(v13);
  int v16 = *ContextStack;
  v17 = &ContextStack[6 * *ContextStack];
  *((void *)v17 + 1) = v15;
  v17[4] = 2;
  *((void *)v17 + 3) = v4;
  int *ContextStack = v16 + 1;
}

- (void)popContext:(id)a3
{
  id v4 = a3;
  if ([v4 inPage]) {
    CGPDFContextEndPage((CGContextRef)[v4 CGContext]);
  }
  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsPDFRenderer;
  [(UIGraphicsRenderer *)&v5 popContext:v4];
  CGPDFContextClose((CGContextRef)[v4 CGContext]);
}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

+ (CGContext)contextWithFormat:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(v3, "documentInfo", *(void *)&v4, *(void *)&v6, *(void *)&v8, *(void *)&v10);
  CFDictionaryRef v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = [v3 outputURL];

  if (v13)
  {
    CFURLRef v14 = [v3 outputURL];
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    if (CGRectIsEmpty(v23)) {
      CGContextRef v15 = 0;
    }
    else {
      CGContextRef v15 = (const CGRect *)&v22;
    }
    int v16 = CGPDFContextCreateWithURL(v14, v15, v12);
  }
  else
  {
    v17 = [v3 pdfData];

    if (v17
      && ([v3 pdfData],
          v18 = (__CFData *)objc_claimAutoreleasedReturnValue(),
          v19 = CGDataConsumerCreateWithCFData(v18),
          v18,
          v19))
    {
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      if (CGRectIsEmpty(v24)) {
        v20 = 0;
      }
      else {
        v20 = (const CGRect *)&v22;
      }
      int v16 = CGPDFContextCreate(v19, v20, v12);
      CGDataConsumerRelease(v19);
    }
    else
    {
      int v16 = 0;
    }
  }

  return v16;
}

+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4
{
  id v4 = a4;
  CGFloat v5 = [v4 format];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v21 = v6;
  double v22 = v8;
  *(double *)&long long v23 = v10;
  *((double *)&v23 + 1) = v12;
  CFURLRef v14 = [v5 documentInfo];
  CGContextRef v15 = [v14 objectForKey:*MEMORY[0x1E4F1DDE0]];
  int v16 = v15;
  if (v15)
  {
    [v15 getBytes:&v21 length:32];
    CGFloat v7 = v21;
    CGFloat v9 = v22;
    CGFloat v13 = *((double *)&v23 + 1);
    CGFloat v11 = *(double *)&v23;
  }
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  if (CGRectIsEmpty(v24))
  {
    double v21 = 0.0;
    double v22 = 0.0;
    long long v23 = xmmword_186B97750;
    double v17 = 0.0;
    double v18 = 612.0;
    double v19 = 792.0;
    double v20 = 0.0;
  }
  else
  {
    double v20 = v21;
    double v17 = v22;
    double v19 = *((double *)&v23 + 1);
    double v18 = *(double *)&v23;
  }
  objc_msgSend(v4, "setDocumentBounds:", v20, v17, v18, v19, *(void *)&v21, *(void *)&v22, v23);
  objc_msgSend(v4, "setPageBounds:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setInPage:0];
}

- (UIGraphicsPDFRenderer)init
{
  id v3 = +[UIGraphicsRendererFormat preferredFormat];
  id v4 = -[UIGraphicsPDFRenderer initWithBounds:format:](self, "initWithBounds:format:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v4;
}

- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = +[UIGraphicsRendererFormat preferredFormat];
  CGFloat v9 = -[UIGraphicsPDFRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsPDFRendererFormat *)format
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  double y = bounds.origin.y;
  double x = bounds.origin.x;
  CGFloat v9 = format;
  [(UIGraphicsPDFRendererFormat *)v9 setPdfData:0];
  [(UIGraphicsPDFRendererFormat *)v9 setOutputURL:0];
  v12.receiver = self;
  v12.super_class = (Class)UIGraphicsPDFRenderer;
  double v10 = -[UIGraphicsRenderer initWithBounds:format:](&v12, sel_initWithBounds_format_, v9, x, y, width, height);

  return v10;
}

- (BOOL)writePDFToURL:(NSURL *)url withActions:(UIGraphicsPDFDrawingActions)actions error:(NSError *)error
{
  UIGraphicsPDFDrawingActions v8 = actions;
  CGFloat v9 = url;
  double v10 = [(UIGraphicsRenderer *)self format];
  [v10 setOutputURL:v9];

  LOBYTE(error) = [(UIGraphicsRenderer *)self runDrawingActions:v8 completionActions:0 format:v10 error:error];
  return (char)error;
}

- (NSData)PDFDataWithActions:(UIGraphicsPDFDrawingActions)actions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA58];
  UIGraphicsPDFDrawingActions v5 = actions;
  id v6 = objc_alloc_init(v4);
  CGFloat v7 = [(UIGraphicsRenderer *)self format];
  [v7 setPdfData:v6];
  LODWORD(self) = [(UIGraphicsRenderer *)self runDrawingActions:v5 completionActions:0 format:v7 error:0];

  if (self) {
    id v8 = (id)[v6 copy];
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
  }
  CGFloat v9 = v8;

  return (NSData *)v9;
}

@end