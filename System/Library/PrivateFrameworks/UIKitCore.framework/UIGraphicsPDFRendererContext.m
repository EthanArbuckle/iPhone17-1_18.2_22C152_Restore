@interface UIGraphicsPDFRendererContext
- (BOOL)inPage;
- (CGRect)documentBounds;
- (CGRect)pageBounds;
- (CGRect)pdfContextBounds;
- (void)addDestinationWithName:(NSString *)name atPoint:(CGPoint)point;
- (void)beginPage;
- (void)beginPageWithBounds:(CGRect)bounds pageInfo:(NSDictionary *)pageInfo;
- (void)setDestinationWithName:(NSString *)name forRect:(CGRect)rect;
- (void)setDocumentBounds:(CGRect)a3;
- (void)setInPage:(BOOL)a3;
- (void)setPageBounds:(CGRect)a3;
- (void)setURL:(NSURL *)url forRect:(CGRect)rect;
- (void)updateAuxInfo:(id)a3;
@end

@implementation UIGraphicsPDFRendererContext

- (void)updateAuxInfo:(id)a3
{
  id v13 = a3;
  uint64_t CurrentContextAuxInfo = GetCurrentContextAuxInfo(2);
  if (CurrentContextAuxInfo)
  {
    uint64_t v4 = CurrentContextAuxInfo;
    [v13 documentBounds];
    *(void *)uint64_t v4 = v5;
    *(void *)(v4 + 8) = v6;
    *(void *)(v4 + 16) = v7;
    *(void *)(v4 + 24) = v8;
    [v13 pageBounds];
    *(void *)(v4 + 32) = v9;
    *(void *)(v4 + 40) = v10;
    *(void *)(v4 + 48) = v11;
    *(void *)(v4 + 56) = v12;
    *(unsigned char *)(v4 + 64) = [v13 inPage];
  }
}

- (void)beginPage
{
  id v3 = [(UIGraphicsRendererContext *)self format];
  [v3 bounds];
  -[UIGraphicsPDFRendererContext beginPageWithBounds:pageInfo:](self, "beginPageWithBounds:pageInfo:", MEMORY[0x1E4F1CC08]);
}

- (void)beginPageWithBounds:(CGRect)bounds pageInfo:(NSDictionary *)pageInfo
{
  CGRect v34 = bounds;
  uint64_t v5 = pageInfo;
  uint64_t v6 = [(UIGraphicsRendererContext *)self format];
  uint64_t v7 = [(UIGraphicsRendererContext *)self CGContext];
  if ([(UIGraphicsPDFRendererContext *)self inPage]) {
    CGPDFContextEndPage(v7);
  }
  uint64_t v8 = [v6 documentInfo];
  v32[0] = &v34;
  uint64_t v9 = *MEMORY[0x1E4F1DDE0];
  uint64_t v10 = [v8 objectForKey:*MEMORY[0x1E4F1DDE0]];
  uint64_t v11 = v10;
  if (v10) {
    [v10 getBytes:v32 length:32];
  }

  if (CGRectIsEmpty(v34))
  {
    [(UIGraphicsPDFRendererContext *)self documentBounds];
    v34.origin.x = v12;
    v34.origin.y = v13;
    v34.size.width = v14;
    v34.size.height = v15;
  }
  -[UIGraphicsPDFRendererContext setPageBounds:](self, "setPageBounds:");
  [(UIGraphicsPDFRendererContext *)self setInPage:1];
  [(UIGraphicsPDFRendererContext *)self pageBounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  *(double *)v32 = v16;
  *(double *)&v32[1] = v18;
  *(double *)&v32[2] = v20;
  CGFloat ty = v22;
  uint64_t v24 = [(NSDictionary *)v5 objectForKey:v9];
  if (v24)
  {
    v25 = (void *)v24;
LABEL_13:

    goto LABEL_14;
  }
  [(UIGraphicsPDFRendererContext *)self documentBounds];
  v37.origin.x = v26;
  v37.origin.y = v27;
  v37.size.width = v28;
  v37.size.height = v29;
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  if (CGRectEqualToRect(v35, v37))
  {
    v25 = 0;
    goto LABEL_13;
  }
  v38.size.width = 612.0;
  v38.size.height = 792.0;
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v36.origin.x = v17;
  v36.origin.y = v19;
  v36.size.width = v21;
  v36.size.height = v23;
  if (!CGRectEqualToRect(v36, v38))
  {
    v25 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v32 length:32];
    v30 = (NSDictionary *)[(NSDictionary *)v5 mutableCopy];

    [(NSDictionary *)v30 setObject:v25 forKey:v9];
    uint64_t v5 = v30;
    goto LABEL_13;
  }
LABEL_14:
  CGPDFContextBeginPage(v7, (CFDictionaryRef)v5);
  CGContextTranslateCTM(v7, 0.0, ty);
  CGContextScaleCTM(v7, 1.0, -1.0);
  CGAffineTransformMakeScale(&v31, 1.0, -1.0);
  CGContextSetBaseCTM();
  [(UIGraphicsPDFRendererContext *)self updateAuxInfo:self];
}

- (CGRect)pdfContextBounds
{
  if ([(UIGraphicsPDFRendererContext *)self inPage]) {
    [(UIGraphicsPDFRendererContext *)self pageBounds];
  }
  else {
    [(UIGraphicsPDFRendererContext *)self documentBounds];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setURL:(NSURL *)url forRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  urla = url;
  uint64_t v9 = [(UIGraphicsRendererContext *)self CGContext];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPDFContextSetURLForRect(v9, (CFURLRef)urla, v12);
}

- (void)addDestinationWithName:(NSString *)name atPoint:(CGPoint)point
{
  CGFloat y = point.y;
  CGFloat x = point.x;
  namea = name;
  uint64_t v7 = [(UIGraphicsRendererContext *)self CGContext];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  CGPDFContextAddDestinationAtPoint(v7, namea, v10);
}

- (void)setDestinationWithName:(NSString *)name forRect:(CGRect)rect
{
  CGFloat height = rect.size.height;
  CGFloat width = rect.size.width;
  CGFloat y = rect.origin.y;
  CGFloat x = rect.origin.x;
  namea = name;
  uint64_t v9 = [(UIGraphicsRendererContext *)self CGContext];
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGPDFContextSetDestinationForRect(v9, namea, v12);
}

- (CGRect)documentBounds
{
  objc_copyStruct(v6, &self->_documentBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setDocumentBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_documentBounds, &v3, 32, 1, 0);
}

- (CGRect)pageBounds
{
  objc_copyStruct(v6, &self->_pageBounds, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setPageBounds:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_pageBounds, &v3, 32, 1, 0);
}

- (BOOL)inPage
{
  return self->_inPage;
}

- (void)setInPage:(BOOL)a3
{
  self->_inPage = a3;
}

@end