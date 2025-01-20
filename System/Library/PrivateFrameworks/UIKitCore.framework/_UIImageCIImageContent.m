@interface _UIImageCIImageContent
- (BOOL)canRenderCIImage;
- (BOOL)canScaleImageToTargetResolution;
- (BOOL)isCIImage;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDR;
- (CGSize)sizeInPixels;
- (_UIImageCIImageContent)initWithCIImage:(id)a3 scale:(double)a4;
- (_UIImageCIImageContent)initWithScale:(double)a3;
- (id)CIImage;
- (id)description;
- (id)imageRendererFormat;
- (id)makeSDRVersion;
- (id)typeName;
- (unint64_t)hash;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation _UIImageCIImageContent

- (void).cxx_destruct
{
}

- (CGSize)sizeInPixels
{
  [(CIImage *)self->_ciImage extent];
  double v3 = v2;
  double v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (_UIImageCIImageContent)initWithCIImage:(id)a3 scale:(double)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1204 description:@"Need a ciImage"];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCIImageContent;
  v9 = [(_UIImageContent *)&v13 initWithScale:a4];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ciImage, a3);
    v10->_allowHDR = 0;
  }

  return v10;
}

- (_UIImageCIImageContent)initWithScale:(double)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1219 description:@"You need to use -initWithCIImage:scale:"];

  return 0;
}

- (BOOL)isHDR
{
  return self->_allowHDR;
}

- (id)makeSDRVersion
{
  double v2 = self;
  if (v2->_allowHDR)
  {
    double v3 = [_UIImageCIImageContent alloc];
    ciImage = v2->_ciImage;
    [(_UIImageContent *)v2 scale];
    uint64_t v5 = -[_UIImageCIImageContent initWithCIImage:scale:](v3, "initWithCIImage:scale:", ciImage);

    *(unsigned char *)(v5 + 48) = 0;
    double v2 = (_UIImageCIImageContent *)v5;
  }
  return v2;
}

- (id)imageRendererFormat
{
  double v3 = +[UIGraphicsImageRendererFormat preferredFormat];
  if ([(_UIImageCIImageContent *)self isHDR]) {
    [v3 setPreferredRange:100];
  }
  [(_UIImageContent *)self scale];
  objc_msgSend(v3, "setScale:");
  return v3;
}

- (id)typeName
{
  return @"CIImage";
}

- (id)CIImage
{
  return self->_ciImage;
}

- (BOOL)isCIImage
{
  return 1;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canRenderCIImage
{
  [(CIImage *)self->_ciImage extent];
  return v3 > 0.0 && v2 > 0.0;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (CIImage **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCIImageContent;
  if ([(_UIImageContent *)&v7 isEqual:v4]) {
    BOOL v5 = self->_ciImage == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(CIImage *)self->_ciImage hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"CIImage:%@", self->_ciImage];
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  [(CIImage *)self->_ciImage extent];
  double x = v22.origin.x;
  double y = v22.origin.y;
  double v12 = v22.size.width;
  double v13 = v22.size.height;
  if (!CGRectIsInfinite(v22))
  {
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeScale(&v21, width / v12, height / v13);
    ciImage = self->_ciImage;
    CGAffineTransform v20 = v21;
    v15 = [(CIImage *)ciImage imageByApplyingTransform:&v20];
    CGFloat v16 = *MEMORY[0x1E4F1DAD8];
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (qword_1EB25B1D0 != -1) {
      dispatch_once(&qword_1EB25B1D0, &__block_literal_global_288);
    }
    v18 = [MEMORY[0x1E4F1E018] contextWithOptions:qword_1EB25B1C8];
    v19 = (CGImage *)objc_msgSend(v18, "createCGImage:fromRect:", v15, x, y, width, height);

    v23.origin.double x = v16;
    v23.origin.double y = v17;
    v23.size.double width = width;
    v23.size.double height = height;
    CGContextDrawImage(a5, v23, v19);
    CGImageRelease(v19);
  }
}

@end