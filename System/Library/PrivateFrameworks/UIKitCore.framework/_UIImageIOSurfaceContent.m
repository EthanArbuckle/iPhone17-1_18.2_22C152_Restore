@interface _UIImageIOSurfaceContent
- (BOOL)isEqual:(id)a3;
- (BOOL)isHDR;
- (BOOL)isIOSurface;
- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering;
- (CGSize)sizeInPixels;
- (_UIImageIOSurfaceContent)initWithIOSurface:(__IOSurface *)a3 scale:(double)a4;
- (_UIImageIOSurfaceContent)initWithScale:(double)a3;
- (__IOSurface)IOSurface;
- (id)description;
- (id)imageRendererFormat;
- (id)makeSDRVersion;
- (id)typeName;
- (unint64_t)hash;
- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6;
- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5;
- (void)dealloc;
@end

@implementation _UIImageIOSurfaceContent

- (_UIImageIOSurfaceContent)initWithIOSurface:(__IOSurface *)a3 scale:(double)a4
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1465 description:@"Need an ioSurfaceRef"];
  }
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != IOSurfaceGetTypeID())
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1466 description:@"ioSurfaceRef passed is not an IOSurfaceRef"];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageIOSurfaceContent;
  v9 = [(_UIImageContent *)&v13 initWithScale:a4];
  if (v9) {
    v9->_surfaceRef = (__IOSurface *)CFRetain(a3);
  }
  return v9;
}

- (_UIImageIOSurfaceContent)initWithScale:(double)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UIImageContent.m" lineNumber:1477 description:@"You need to use -initWithIOSurface:scale:"];

  return 0;
}

- (void)dealloc
{
  CFRelease(self->_surfaceRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIImageIOSurfaceContent;
  [(_UIImageIOSurfaceContent *)&v3 dealloc];
}

- (BOOL)isHDR
{
  return 0;
}

- (id)makeSDRVersion
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(_UIImageIOSurfaceContent *)self isHDR])
  {
    surfaceRef = self->_surfaceRef;
    v9 = @"dst-gamut";
    v10[0] = &unk_1ED3F3D50;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    CGImage = (CGImage *)_UIRenderingBufferCreateCGImage(surfaceRef, v4);

    v6 = [_UIImageCGImageContent alloc];
    [(_UIImageContent *)self scale];
    v7 = -[_UIImageCGImageContent initWithCGImage:scale:](v6, "initWithCGImage:scale:", CGImage);
    CGImageRelease(CGImage);
  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (id)imageRendererFormat
{
  v4.receiver = self;
  v4.super_class = (Class)_UIImageIOSurfaceContent;
  v2 = [(_UIImageContent *)&v4 imageRendererFormat];
  return v2;
}

- (id)typeName
{
  return @"IOSurface";
}

- (__IOSurface)IOSurface
{
  return self->_surfaceRef;
}

- (BOOL)isIOSurface
{
  return 1;
}

- (CGSize)sizeInPixels
{
  double Width = (double)IOSurfaceGetWidth(self->_surfaceRef);
  double Height = (double)IOSurfaceGetHeight(self->_surfaceRef);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (__IOSurface **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageIOSurfaceContent;
  if ([(_UIImageContent *)&v7 isEqual:v4]) {
    BOOL v5 = self->_surfaceRef == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_surfaceRef;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"IOSurfaceRef:%p", self->_surfaceRef);
}

- (BOOL)prefersProvidingNonCGImageContentsDirectlyForRendering
{
  return 1;
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CGFloat v9 = *MEMORY[0x1E4F1DAD8];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  CGImage = (CGImage *)_UIRenderingBufferCreateCGImage(self->_surfaceRef, 0);
  v13.origin.x = v9;
  v13.origin.y = v10;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGContextDrawImage(a5, v13, CGImage);
  CGImageRelease(CGImage);
}

@end