@interface PLImageContainer
- (BOOL)hasAuxiliaryImages;
- (CGImage)CGImage;
- (CGSize)pixelSize;
- (NSArray)auxiliaryImageRecords;
- (NSData)data;
- (NSString)uniformTypeIdentifier;
- (PLImageContainer)initWithCGImage:(CGImage *)a3;
- (PLImageContainer)initWithCGImage:(CGImage *)a3 ioSurface:(void *)a4 CIImage:(id)a5 backingData:(id)a6 uniformTypeIdentifier:(id)a7 size:(CGSize)a8 auxiliaryImageRecords:(id)a9;
- (PLImageContainer)initWithIOSurface:(__IOSurface *)a3;
- (PLImageContainer)initWithPLImage:(id)a3;
- (PLImageContainer)initWithPLImage:(id)a3 backingData:(id)a4 uniformTypeIdentifier:(id)a5 auxiliaryImageRecords:(id)a6;
- (id)description;
- (void)dealloc;
- (void)ioSurface;
@end

@implementation PLImageContainer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageRecords, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_CIImage, 0);
}

- (NSArray)auxiliaryImageRecords
{
  return self->_auxiliaryImageRecords;
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (NSData)data
{
  return self->_data;
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (BOOL)hasAuxiliaryImages
{
  return [(NSArray *)self->_auxiliaryImageRecords count] != 0;
}

- (CGSize)pixelSize
{
  double height = self->_pixelSize.height;
  if (height < 0.0 || (double Width = self->_pixelSize.width, Width < 0.0))
  {
    CGImage = self->_CGImage;
    if (CGImage)
    {
      double Width = (double)CGImageGetWidth(CGImage);
      size_t v6 = CGImageGetHeight(self->_CGImage);
    }
    else
    {
      CIImage = self->_CIImage;
      if (CIImage)
      {
        [CIImage extent];
        double Width = v8;
        double height = v9;
        self->_pixelSize.width = v8;
        self->_pixelSize.double height = v9;
        goto LABEL_8;
      }
      ioSurface = (__IOSurface *)self->_ioSurface;
      if (!ioSurface)
      {
        double Width = self->_pixelSize.width;
        goto LABEL_8;
      }
      double Width = (double)IOSurfaceGetWidth(ioSurface);
      size_t v6 = IOSurfaceGetHeight((IOSurfaceRef)self->_ioSurface);
    }
    double height = (double)v6;
    self->_pixelSize.width = Width;
    self->_pixelSize.double height = (double)v6;
  }
LABEL_8:
  double v10 = Width;
  result.double height = height;
  result.width = v10;
  return result;
}

- (void)ioSurface
{
  CGSize result = self->_ioSurface;
  if (!result)
  {
    CGSize result = self->_CGImage;
    if (result) {
      return (void *)MEMORY[0x1F40DA980]();
    }
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PLImageContainer;
  v4 = [(PLImageContainer *)&v13 description];
  ioSurface = self->_ioSurface;
  CIImage = self->_CIImage;
  CGImage = self->_CGImage;
  data = self->_data;
  uniformTypeIdentifier = self->_uniformTypeIdentifier;
  double v10 = NSStringFromSize(self->_pixelSize);
  v11 = [v3 stringWithFormat:@"%@ (IOS:%@ CGI:%@ CII:%@ D:%@ UTI:%@ sz:%@)", v4, ioSurface, CGImage, CIImage, data, uniformTypeIdentifier, v10];

  return v11;
}

- (void)dealloc
{
  CGImageRelease(self->_CGImage);
  self->_CGImage = 0;
  CIImage = self->_CIImage;
  self->_CIImage = 0;

  ioSurface = self->_ioSurface;
  if (ioSurface)
  {
    CFRelease(ioSurface);
    self->_ioSurface = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PLImageContainer;
  [(PLImageContainer *)&v5 dealloc];
}

- (PLImageContainer)initWithCGImage:(CGImage *)a3
{
  return -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", a3, 0, 0, 0, 0, 0, -1.0, -1.0);
}

- (PLImageContainer)initWithIOSurface:(__IOSurface *)a3
{
  return -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", 0, a3, 0, 0, 0, 0, -1.0, -1.0);
}

- (PLImageContainer)initWithPLImage:(id)a3
{
  return [(PLImageContainer *)self initWithPLImage:a3 backingData:0 uniformTypeIdentifier:0 auxiliaryImageRecords:0];
}

- (PLImageContainer)initWithPLImage:(id)a3 backingData:(id)a4 uniformTypeIdentifier:(id)a5 auxiliaryImageRecords:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = MEMORY[0x19F38B400]();
  uint64_t v15 = DCIM_CGImageRefFromPLImage();
  v16 = MEMORY[0x19F38B2F0](v13);

  v17 = -[PLImageContainer initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:](self, "initWithCGImage:ioSurface:CIImage:backingData:uniformTypeIdentifier:size:auxiliaryImageRecords:", v15, v14, v16, v12, v11, v10, -1.0, -1.0);
  return v17;
}

- (PLImageContainer)initWithCGImage:(CGImage *)a3 ioSurface:(void *)a4 CIImage:(id)a5 backingData:(id)a6 uniformTypeIdentifier:(id)a7 size:(CGSize)a8 auxiliaryImageRecords:(id)a9
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v26.receiver = self;
  v26.super_class = (Class)PLImageContainer;
  v22 = [(PLImageContainer *)&v26 init];
  if (v22)
  {
    v22->_CGImage = CGImageRetain(a3);
    objc_storeStrong((id *)&v22->_CIImage, a5);
    if (a4) {
      v22->_ioSurface = (void *)CFRetain(a4);
    }
    objc_storeStrong((id *)&v22->_data, a6);
    uint64_t v23 = [v20 copy];
    uniformTypeIdentifier = v22->_uniformTypeIdentifier;
    v22->_uniformTypeIdentifier = (NSString *)v23;

    v22->_pixelSize.CGFloat width = width;
    v22->_pixelSize.CGFloat height = height;
    objc_storeStrong((id *)&v22->_auxiliaryImageRecords, a9);
  }

  return v22;
}

@end