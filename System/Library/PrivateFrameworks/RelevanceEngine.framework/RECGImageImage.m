@interface RECGImageImage
- (BOOL)isEqual:(id)a3;
- (CGImage)CGImage;
- (RECGImageImage)initWithCoder:(id)a3;
- (RECGImageImage)initWithImage:(CGImage *)a3 scale:(double)a4;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RECGImageImage

- (RECGImageImage)initWithImage:(CGImage *)a3 scale:(double)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RECGImageImage;
  v6 = [(RECGImageImage *)&v8 init];
  if (v6)
  {
    v6->_CGImage = CGImageCreateCopy(a3);
    v6->_scale = a4;
  }
  return v6;
}

- (void)dealloc
{
  CGImage = self->_CGImage;
  if (CGImage) {
    CGImageRelease(CGImage);
  }
  v4.receiver = self;
  v4.super_class = (Class)RECGImageImage;
  [(RECGImageImage *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  CGImage = self->_CGImage;
  double scale = self->_scale;
  return (id)[v4 initWithImage:CGImage scale:scale];
}

- (unint64_t)hash
{
  unint64_t scale = (unint64_t)self->_scale;
  return CFHash(self->_CGImage) ^ scale;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ((CGImage *)[v5 CGImage] == self->_CGImage)
    {
      [v5 scale];
      *(float *)&double v7 = v7 - self->_scale;
      BOOL v6 = fabsf(*(float *)&v7) < 0.00000011921;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (RECGImageImage)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scale"];
  CFDataRef v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image-data"];

  double v7 = CGDataProviderCreateWithCFData(v6);
  CGImageRef v8 = CGImageCreateWithPNGDataProvider(v7, 0, 0, kCGRenderingIntentDefault);
  CFAutorelease(v8);
  CFRelease(v7);
  [v5 doubleValue];
  v9 = -[RECGImageImage initWithImage:scale:](self, "initWithImage:scale:", v8);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [NSNumber numberWithDouble:self->_scale];
  [v8 encodeObject:v4 forKey:@"scale"];

  id v5 = (__CFData *)objc_alloc_init(MEMORY[0x263EFF990]);
  CFDataRef v6 = [(id)*MEMORY[0x263F1DC08] identifier];
  double v7 = CGImageDestinationCreateWithData(v5, v6, 0, 0);

  CGImageDestinationAddImage(v7, self->_CGImage, 0);
  if (CGImageDestinationFinalize(v7)) {
    [v8 encodeObject:v5 forKey:@"image-data"];
  }
  CFRelease(v7);
}

- (CGImage)CGImage
{
  return self->_CGImage;
}

- (double)scale
{
  return self->_scale;
}

@end