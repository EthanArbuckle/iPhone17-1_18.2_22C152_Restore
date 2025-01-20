@interface _UIImageCGPDFPageContent
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)isCGPDFPage;
- (BOOL)isEqual:(id)a3;
- (CGPDFPage)CGPDFPage;
- (CGSize)sizeInPixels;
- (_UIImageCGPDFPageContent)initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4;
- (_UIImageCGPDFPageContent)initWithScale:(double)a3;
- (double)vectorScale;
- (id)description;
- (id)typeName;
- (unint64_t)hash;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)dealloc;
@end

@implementation _UIImageCGPDFPageContent

- (_UIImageCGPDFPageContent)initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1568 description:@"Need a pdfPageRef"];
  }
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != CGPDFPageGetTypeID())
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1569 description:@"pdfPageRef passed is not a CGPDFPageRef"];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCGPDFPageContent;
  v9 = [(_UIImageContent *)&v13 initWithScale:a4];
  if (v9) {
    v9->_pdfPageRef = CGPDFPageRetain(a3);
  }
  return v9;
}

- (_UIImageCGPDFPageContent)initWithScale:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1580 description:@"You need to use -initWithCGPDFPage:scale:"];

  return 0;
}

- (void)dealloc
{
  CGPDFPageRelease(self->_pdfPageRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIImageCGPDFPageContent;
  [(_UIImageCGPDFPageContent *)&v3 dealloc];
}

- (id)typeName
{
  return @"PDF";
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (BOOL)isCGPDFPage
{
  return 1;
}

- (CGPDFPage)CGPDFPage
{
  return self->_pdfPageRef;
}

- (CGSize)sizeInPixels
{
  CGRect BoxRect = CGPDFPageGetBoxRect(self->_pdfPageRef, kCGPDFMediaBox);
  double width = BoxRect.size.width;
  double height = BoxRect.size.height;
  [(_UIImageContent *)self scale];
  double v6 = v5 * width;
  [(_UIImageContent *)self scale];
  double v8 = height * v7;
  double v9 = v6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

- (double)vectorScale
{
  return 1.0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CGPDFPage **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCGPDFPageContent;
  if ([(_UIImageContent *)&v7 isEqual:v4]) {
    BOOL v5 = self->_pdfPageRef == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_pdfPageRef;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CGPDFPage:%p", self->_pdfPageRef);
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height = a3.height;
  double width = a3.width;
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  [(_UIImageContent *)self size];
  double v10 = width / v9;
  double v12 = height / v11;
  CGContextScaleCTM(a5, v10, v12);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
}

@end