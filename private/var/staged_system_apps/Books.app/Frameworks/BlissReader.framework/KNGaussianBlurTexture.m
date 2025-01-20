@interface KNGaussianBlurTexture
- (BOOL)isMetalTexture;
- (CGRect)bounds;
- (CGRect)frame;
- (KNGaussianBlurTexture)initWithMetalTexture:(id)a3 frame:(CGRect)a4 blurAmount:(double)a5;
- (KNGaussianBlurTexture)initWithTextureName:(unsigned int)a3 frame:(CGRect)a4 blurAmount:(double)a5;
- (MTLTexture)texture;
- (double)blurAmount;
- (id)description;
- (unsigned)textureName;
- (void)dealloc;
- (void)setBlurAmount:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTexture:(id)a3;
- (void)setTextureName:(unsigned int)a3;
- (void)teardown;
@end

@implementation KNGaussianBlurTexture

- (KNGaussianBlurTexture)initWithTextureName:(unsigned int)a3 frame:(CGRect)a4 blurAmount:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)KNGaussianBlurTexture;
  result = [(KNGaussianBlurTexture *)&v12 init];
  if (result)
  {
    result->_textureName = a3;
    result->_frame.origin.CGFloat y = y;
    result->_frame.size.CGFloat width = width;
    result->_frame.size.CGFloat height = height;
    result->_blurAmount = a5;
    result->_frame.origin.CGFloat x = x;
    result->_isMetalTexture = 0;
  }
  return result;
}

- (KNGaussianBlurTexture)initWithMetalTexture:(id)a3 frame:(CGRect)a4 blurAmount:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KNGaussianBlurTexture;
  v13 = [(KNGaussianBlurTexture *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_texture, a3);
    v14->_frame.origin.CGFloat y = y;
    v14->_frame.size.CGFloat width = width;
    v14->_frame.size.CGFloat height = height;
    v14->_blurAmount = a5;
    v14->_frame.origin.CGFloat x = x;
    v14->_isMetalTexture = 1;
  }

  return v14;
}

- (void)teardown
{
  if ([(KNGaussianBlurTexture *)self isMetalTexture])
  {
    texture = self->_texture;
    self->_texture = 0;
  }
  self->_didTeardown = 1;
}

- (void)dealloc
{
  if (!self->_didTeardown)
  {
    v3 = +[TSUAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurTexture dealloc]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:111 description:@"Didn't call -teardown! Leaking!!"];
  }
  v6.receiver = self;
  v6.super_class = (Class)KNGaussianBlurTexture;
  [(KNGaussianBlurTexture *)&v6 dealloc];
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)KNGaussianBlurTexture;
  v3 = [(KNGaussianBlurTexture *)&v11 description];
  uint64_t v4 = [(KNGaussianBlurTexture *)self textureName];
  [(KNGaussianBlurTexture *)self blurAmount];
  uint64_t v6 = v5;
  [(KNGaussianBlurTexture *)self frame];
  v7 = NSStringFromCGRect(v13);
  [(KNGaussianBlurTexture *)self bounds];
  v8 = NSStringFromCGRect(v14);
  v9 = +[NSString stringWithFormat:@"%@: name:%d, blur:%0.1f, frame:%@, bounds:%@", v3, v4, v6, v7, v8];

  return v9;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (double)blurAmount
{
  return self->_blurAmount;
}

- (void)setBlurAmount:(double)a3
{
  self->_blurAmount = a3;
}

- (BOOL)isMetalTexture
{
  return self->_isMetalTexture;
}

- (unsigned)textureName
{
  return self->_textureName;
}

- (void)setTextureName:(unsigned int)a3
{
  self->_textureName = a3;
}

- (void).cxx_destruct
{
}

@end