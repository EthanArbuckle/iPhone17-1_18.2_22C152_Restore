@interface TSUUIImage
+ (id)imageNamed:(id)a3 inBundle:(id)a4;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (TSUUIImage)initWithContentsOfFile:(id)a3;
- (TSUUIImage)initWithData:(id)a3;
- (TSUUIImage)initWithUIImage:(id)a3;
- (double)scale;
- (id)UIImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)imageOrientation;
- (void)dealloc;
@end

@implementation TSUUIImage

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  id v6 = objc_alloc((Class)a1);
  v7 = objc_msgSend(v6, "initWithUIImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "traitCollection")));
  return v7;
}

- (TSUUIImage)initWithUIImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSUUIImage;
  v4 = [(TSUImage *)&v7 init];
  if (v4)
  {
    v5 = (UIImage *)a3;
    v4->mUIImage = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (TSUUIImage)initWithData:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:a3];
  return [(TSUUIImage *)self initWithUIImage:v4];
}

- (TSUUIImage)initWithContentsOfFile:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithContentsOfFile:a3];
  return [(TSUUIImage *)self initWithUIImage:v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mUIImage = self->mUIImage;
  return (id)[v4 initWithUIImage:mUIImage];
}

- (void)dealloc
{
  self->mUIImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUUIImage;
  [(TSUImage *)&v3 dealloc];
}

- (id)UIImage
{
  return self->mUIImage;
}

- (CGSize)size
{
  [self->mUIImage size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)scale
{
  [self->mUIImage scale];
  return result;
}

- (CGImage)CGImage
{
  return [self->mUIImage CGImage];
}

- (CGImage)CGImageForSize:(CGSize)a3
{
  return [self->mUIImage CGImage];
}

- (int64_t)imageOrientation
{
  return [self->mUIImage imageOrientation];
}

@end