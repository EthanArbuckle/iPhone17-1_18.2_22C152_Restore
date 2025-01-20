@interface CRLUIImage
+ (id)imageNamed:(id)a3;
- (CGImage)CGImage;
- (CGImage)CGImageForSize:(CGSize)a3;
- (CGSize)size;
- (CRLUIImage)initWithContentsOfFile:(id)a3;
- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3;
- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4;
- (CRLUIImage)initWithSystemImageNamed:(id)a3;
- (CRLUIImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4;
- (CRLUIImage)initWithUIImage:(id)a3;
- (double)scale;
- (id)UIImage;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)imageOrientation;
- (void)dealloc;
@end

@implementation CRLUIImage

+ (id)imageNamed:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = +[UIImage imageNamed:v4];

  id v7 = [v5 initWithUIImage:v6];

  return v7;
}

- (CRLUIImage)initWithUIImage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLUIImage;
  v6 = [(CRLImage *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->mUIImage, a3);
    }
    else
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (CRLUIImage)initWithContentsOfFile:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)UIImage) initWithContentsOfFile:v4];

  v6 = [(CRLUIImage *)self initWithUIImage:v5];
  return v6;
}

- (CRLUIImage)initWithSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v6 = a3;
  id v7 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:a4];
  v8 = +[UIImage systemImageNamed:v6 withConfiguration:v7];

  objc_super v9 = [(CRLUIImage *)self initWithUIImage:v8];
  return v9;
}

- (CRLUIImage)initWithSystemImageNamed:(id)a3
{
  id v4 = +[UIImage systemImageNamed:a3];
  id v5 = [(CRLUIImage *)self initWithUIImage:v4];

  return v5;
}

- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5 = +[UIImage crl_internalSystemImageNamed:a3 pointSize:a4];
  id v6 = [(CRLUIImage *)self initWithUIImage:v5];

  return v6;
}

- (CRLUIImage)initWithPrivateSystemImageNamed:(id)a3
{
  id v4 = +[UIImage crl_internalSystemImageNamed:a3];
  id v5 = [(CRLUIImage *)self initWithUIImage:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mUIImage = self->mUIImage;

  return [v4 initWithUIImage:mUIImage];
}

- (void)dealloc
{
  mUIImage = self->mUIImage;
  self->mUIImage = 0;

  v4.receiver = self;
  v4.super_class = (Class)CRLUIImage;
  [(CRLImage *)&v4 dealloc];
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

- (void).cxx_destruct
{
}

@end