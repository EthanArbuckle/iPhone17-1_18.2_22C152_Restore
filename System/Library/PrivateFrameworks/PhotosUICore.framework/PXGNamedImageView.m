@interface PXGNamedImageView
- (CGRect)clippingRect;
- (PXGNamedImageViewConfiguration)userData;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGNamedImageView

- (void).cxx_destruct
{
}

- (PXGNamedImageViewConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v4 = (PXGNamedImageViewConfiguration *)[a3 copy];
  userData = self->_userData;
  self->_userData = v4;

  v6 = [(PXGNamedImageViewConfiguration *)self->_userData imageName];
  if (v6)
  {
    v7 = [(PXGNamedImageViewConfiguration *)self->_userData bundle];
    objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:bundle:", v6, v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  [(PXGNamedImageView *)self setImage:v8];
  [(PXGNamedImageView *)self setContentMode:[(PXGNamedImageViewConfiguration *)self->_userData contentMode]];
  [(PXGNamedImageView *)self setUserInteractionEnabled:0];
}

@end