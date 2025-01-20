@interface _UIImageCUIVectorImageContent
- (BOOL)_canProvideCGImageDirectly;
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)isCGPDFPage;
- (BOOL)isCGSVGDocument;
- (BOOL)isEqual:(id)a3;
- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4;
- (CGPDFPage)CGPDFPage;
- (CGSVGDocument)CGSVGDocument;
- (_UIImageCUIVectorImageContent)contentWithCGImage:(CGImage *)a3;
- (_UIImageCUIVectorImageContent)initWithCGImage:(CGImage *)a3 CUIVectorImage:(id)a4 scale:(double)a5;
- (_UIImageCUIVectorImageContent)initWithScale:(double)a3;
- (double)vectorScale;
- (id)description;
- (id)typeName;
- (unint64_t)hash;
- (void)_drawVectorCommandsWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation _UIImageCUIVectorImageContent

- (double)vectorScale
{
  return 1.0;
}

- (BOOL)_canProvideCGImageDirectly
{
  return 1;
}

- (unint64_t)hash
{
  return [(CUINamedVectorImage *)self->_vectorImage hash];
}

- (_UIImageCUIVectorImageContent)initWithCGImage:(CGImage *)a3 CUIVectorImage:(id)a4 scale:(double)a5
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIImageCUIVectorImageContent;
  v11 = [(_UIImageCGImageContent *)&v14 initWithCGImage:a3 scale:a5];
  if (v11)
  {
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v11 file:@"_UIImageContent.m" lineNumber:1737 description:@"Need a valid vector image!"];
    }
    objc_storeStrong((id *)&v11->_vectorImage, a4);
  }

  return v11;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  if (a3.width <= 0.0) {
    return 0;
  }
  if (a3.height <= 0.0) {
    return 0;
  }
  v6 = (const void *)-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:](self->_vectorImage, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, a3.width, a3.height, v4, v5);
  if (!v6) {
    return 0;
  }
  return (CGImage *)CFAutorelease(v6);
}

- (void).cxx_destruct
{
}

- (_UIImageCUIVectorImageContent)initWithScale:(double)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1746 description:@"You need to use -initWithCUIVectorImage:scale:"];

  return 0;
}

- (id)typeName
{
  return @"vector";
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (_UIImageCUIVectorImageContent)contentWithCGImage:(CGImage *)a3
{
  uint64_t v5 = [_UIImageCUIVectorImageContent alloc];
  vectorImage = self->_vectorImage;
  [(_UIImageContent *)self scale];
  v7 = -[_UIImageCUIVectorImageContent initWithCGImage:CUIVectorImage:scale:](v5, "initWithCGImage:CUIVectorImage:scale:", a3, vectorImage);
  return v7;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height = a3.height;
  double width = a3.width;
  [(_UIImageContent *)self size];
  double v11 = v10;
  double v13 = v12;
  if ([(_UIImageCUIVectorImageContent *)self isCGPDFPage]) {
    BOOL v14 = [(_UIImageCUIVectorImageContent *)self CGPDFPage] != 0;
  }
  else {
    BOOL v14 = 0;
  }
  if ([(_UIImageCUIVectorImageContent *)self isCGSVGDocument]) {
    BOOL v15 = [(_UIImageCUIVectorImageContent *)self CGSVGDocument] != 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v14)
  {
    if (v11 == 0.0) {
      goto LABEL_16;
    }
  }
  else
  {
    if (v11 == 0.0) {
      BOOL v15 = 0;
    }
    if (!v15) {
      goto LABEL_16;
    }
  }
  if (v13 == 0.0)
  {
LABEL_16:
    v17.receiver = self;
    v17.super_class = (Class)_UIImageCUIVectorImageContent;
    -[_UIImageContent _prepareForDrawingWithSize:scale:inContext:](&v17, sel__prepareForDrawingWithSize_scale_inContext_, a5, width, height, a4);
    return;
  }
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  CGContextScaleCTM(a5, width / v11, height / v13);
  if (v14)
  {
    v16 = [(_UIImageCUIVectorImageContent *)self CGPDFPage];
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.double width = v11;
    v19.size.double height = v13;
    CGPDFPageGetDrawingTransform(&transform, v16, kCGPDFCropBox, v19, 0, 1);
    CGContextConcatCTM(a5, &transform);
  }
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  if (a3.width > 0.0)
  {
    CGFloat height = a3.height;
    if (a3.height > 0.0)
    {
      CGFloat width = a3.width;
      vectorImage = self->_vectorImage;
      [(_UIImageContent *)self scale];
      double v10 = (CGImage *)-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:](vectorImage, "rasterizeImageUsingScaleFactor:forTargetSize:");
      v12.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
      v12.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
      v12.size.CGFloat width = width;
      v12.size.CGFloat height = height;
      CGContextDrawImage(a5, v12, v10);
      CGImageRelease(v10);
    }
  }
}

- (void)_drawVectorCommandsWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v19 = a6;
  if ([(_UIImageCUIVectorImageContent *)self isCGPDFPage]
    && (double v11 = self, [(_UIImageCUIVectorImageContent *)v11 CGPDFPage])
    && (([(_UIImageContent *)v11 CGPDFPageSize], v13 == *MEMORY[0x1E4F1DB30])
      ? (BOOL v14 = v12 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v14 = 0),
        !v14))
  {
    CGContextDrawPDFPage(a5, [(_UIImageCUIVectorImageContent *)v11 CGPDFPage]);
  }
  else if ([(_UIImageCUIVectorImageContent *)self isCGSVGDocument] {
         && (BOOL v15 = self, [(_UIImageCUIVectorImageContent *)v15 CGSVGDocument])
  }
         && (([(_UIImageContent *)v15 CGSVGDocumentSize], v17 == *MEMORY[0x1E4F1DB30])
           ? (BOOL v18 = v16 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
           : (BOOL v18 = 0),
             !v18))
  {
    [(_UIImageCUIVectorImageContent *)v15 CGSVGDocument];
    CGContextDrawSVGDocument();
  }
  else
  {
    -[_UIImageCUIVectorImageContent _drawWithSize:scale:inContext:effect:](self, "_drawWithSize:scale:inContext:effect:", a5, v19, width, height, a4);
  }
}

- (BOOL)isCGPDFPage
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (CGPDFPage)CGPDFPage
{
  if (![(_UIImageCUIVectorImageContent *)self isCGPDFPage]) {
    return 0;
  }
  v3 = self->_vectorImage;
  if ([(CUINamedVectorImage *)v3 pdfDocument]
    && CGPDFDocumentGetNumberOfPages((CGPDFDocumentRef)[(CUINamedVectorImage *)v3 pdfDocument]))
  {
    Page = CGPDFDocumentGetPage((CGPDFDocumentRef)[(CUINamedVectorImage *)v3 pdfDocument], 1uLL);
  }
  else
  {
    Page = 0;
  }

  return Page;
}

- (BOOL)isCGSVGDocument
{
  uint64_t v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (CGSVGDocument)CGSVGDocument
{
  if (![(_UIImageCUIVectorImageContent *)self isCGSVGDocument]) {
    return 0;
  }
  vectorImage = self->_vectorImage;
  return (CGSVGDocument *)[(CUINamedVectorImage *)vectorImage svgDocument];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4))
  {
    uint64_t v5 = (void *)v4[6];
    v6 = self->_vectorImage;
    v7 = v5;
    uint64_t v8 = v7;
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      if (v6) {
        BOOL v9 = v7 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = 0;
      }
      else {
        char v10 = [(CUINamedVectorImage *)v6 isEqual:v7];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  if ([(_UIImageCUIVectorImageContent *)self isCGPDFPage])
  {
    v3 = NSString;
    uint64_t v4 = objc_opt_class();
    vectorImage = self->_vectorImage;
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&self->super._imageRef, memory_order_acquire);
    v7 = self;
    [v3 stringWithFormat:@"<%@:%p vector:%p (CGImageRef:%p + CGPDFPage:%p)", v4, v7, vectorImage, explicit, -[_UIImageCUIVectorImageContent CGPDFPage](v7, "CGPDFPage")];
    double v13 = LABEL_5:;
    goto LABEL_7;
  }
  if ([(_UIImageCUIVectorImageContent *)self isCGSVGDocument])
  {
    uint64_t v8 = NSString;
    uint64_t v9 = objc_opt_class();
    char v10 = self->_vectorImage;
    unint64_t v11 = atomic_load_explicit((atomic_ullong *volatile)&self->super._imageRef, memory_order_acquire);
    double v12 = self;
    [v8 stringWithFormat:@"<%@:%p vector:%p (CGImageRef:%p + CGSVGDocument:%p)", v9, v12, v10, v11, -[_UIImageCUIVectorImageContent CGSVGDocument](v12, "CGSVGDocument")];
    goto LABEL_5;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UIImageCUIVectorImageContent;
  double v13 = [(_UIImageCGImageContent *)&v15 description];
LABEL_7:
  return v13;
}

@end