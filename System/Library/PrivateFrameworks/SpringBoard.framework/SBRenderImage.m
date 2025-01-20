@interface SBRenderImage
- (SBRenderImage)initWithRenderImage:(_CARenderImage *)a3;
- (void)CA_copyRenderValue;
- (void)dealloc;
@end

@implementation SBRenderImage

- (SBRenderImage)initWithRenderImage:(_CARenderImage *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBRenderImage;
  v3 = [(SBRenderImage *)&v5 init];
  if (v3) {
    v3->_image = (_CARenderImage *)CARenderRetain();
  }
  return v3;
}

- (void)dealloc
{
  CARenderRelease();
  v3.receiver = self;
  v3.super_class = (Class)SBRenderImage;
  [(SBRenderImage *)&v3 dealloc];
}

- (void)CA_copyRenderValue
{
  return (void *)CARenderRetain();
}

@end