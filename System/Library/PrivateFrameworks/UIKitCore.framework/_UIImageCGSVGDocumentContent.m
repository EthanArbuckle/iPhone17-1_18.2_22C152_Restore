@interface _UIImageCGSVGDocumentContent
- (BOOL)canEmitVectorDrawingCommands;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)isCGSVGDocument;
- (BOOL)isEqual:(id)a3;
- (CGSVGDocument)CGSVGDocument;
- (CGSize)sizeInPixels;
- (_UIImageCGSVGDocumentContent)initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4;
- (_UIImageCGSVGDocumentContent)initWithScale:(double)a3;
- (double)vectorScale;
- (id)description;
- (id)typeName;
- (unint64_t)hash;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)dealloc;
@end

@implementation _UIImageCGSVGDocumentContent

- (_UIImageCGSVGDocumentContent)initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1652 description:@"Need a svgDocumentRef"];
  }
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != CGSVGDocumentGetTypeID())
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1653 description:@"svgDocumentRef passed is not a CGSVGDocumentRef"];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCGSVGDocumentContent;
  v9 = [(_UIImageContent *)&v13 initWithScale:a4];
  if (v9) {
    v9->_svgDocumentRef = (CGSVGDocument *)CGSVGDocumentRetain();
  }
  return v9;
}

- (_UIImageCGSVGDocumentContent)initWithScale:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1664 description:@"You need to use -initWithCGSVGDocument:scale:"];

  return 0;
}

- (void)dealloc
{
  CGSVGDocumentRelease();
  v3.receiver = self;
  v3.super_class = (Class)_UIImageCGSVGDocumentContent;
  [(_UIImageCGSVGDocumentContent *)&v3 dealloc];
}

- (id)typeName
{
  return @"SVG";
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (BOOL)isCGSVGDocument
{
  return 1;
}

- (CGSVGDocument)CGSVGDocument
{
  return self->_svgDocumentRef;
}

- (CGSize)sizeInPixels
{
  CGSVGDocumentGetCanvasSize();
  double v4 = v3;
  double v6 = v5;
  [(_UIImageContent *)self scale];
  double v8 = v4 * v7;
  [(_UIImageContent *)self scale];
  double v10 = v6 * v9;
  double v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)vectorScale
{
  return 1.0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CGSVGDocument **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCGSVGDocumentContent;
  if ([(_UIImageContent *)&v7 isEqual:v4]) {
    BOOL v5 = self->_svgDocumentRef == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_svgDocumentRef;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CGSVGDocument:%p", self->_svgDocumentRef);
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