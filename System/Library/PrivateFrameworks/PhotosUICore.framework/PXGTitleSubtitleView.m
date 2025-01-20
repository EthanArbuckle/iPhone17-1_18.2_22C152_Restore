@interface PXGTitleSubtitleView
- (CGRect)clippingRect;
- (PXGTitleSubtitleViewConfiguration)userData;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGTitleSubtitleView

- (void).cxx_destruct
{
}

- (PXGTitleSubtitleViewConfiguration)userData
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
  id v4 = a3;
  v5 = (PXGTitleSubtitleViewConfiguration *)[v4 copy];
  userData = self->_userData;
  self->_userData = v5;

  v7 = [v4 title];
  [(PXTitleSubtitleUILabel *)self setTitleText:v7];

  v8 = [v4 subtitle];
  [(PXTitleSubtitleUILabel *)self setSubtitleText:v8];

  id v9 = [v4 spec];

  [(PXTitleSubtitleUILabel *)self setSpec:v9];
}

@end