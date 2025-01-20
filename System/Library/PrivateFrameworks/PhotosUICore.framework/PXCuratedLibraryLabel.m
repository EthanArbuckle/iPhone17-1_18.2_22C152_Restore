@interface PXCuratedLibraryLabel
+ (CGSize)sizeThatFits:(CGSize)a3 withConfiguration:(id)a4;
- (CGRect)clippingRect;
- (PXCuratedLibraryLabelConfiguration)userData;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXCuratedLibraryLabel

- (void).cxx_destruct
{
}

- (PXCuratedLibraryLabelConfiguration)userData
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
  v5 = (PXCuratedLibraryLabelConfiguration *)[v4 copy];
  userData = self->_userData;
  self->_userData = v5;

  v7 = [v4 text];
  [(PXCuratedLibraryLabel *)self setText:v7];

  -[PXCuratedLibraryLabel setTextAlignment:](self, "setTextAlignment:", [v4 textAlignment]);
  v8 = +[PXCuratedLibraryOverlayButton defaultTitleFont];
  [(PXCuratedLibraryLabel *)self setFont:v8];

  id v9 = [v4 textColor];

  [(PXCuratedLibraryLabel *)self setTextColor:v9];
}

+ (CGSize)sizeThatFits:(CGSize)a3 withConfiguration:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = sizeThatFits_withConfiguration__onceToken;
  id v7 = a4;
  if (v6 != -1) {
    dispatch_once(&sizeThatFits_withConfiguration__onceToken, &__block_literal_global_294563);
  }
  [(id)sizeThatFits_withConfiguration__measuringLabel setUserData:v7];

  objc_msgSend((id)sizeThatFits_withConfiguration__measuringLabel, "sizeThatFits:", width, height);
  double v10 = ceil(v9);
  result.double height = v8;
  result.double width = v10;
  return result;
}

void __56__PXCuratedLibraryLabel_sizeThatFits_withConfiguration___block_invoke()
{
  v0 = objc_alloc_init(PXCuratedLibraryLabel);
  v1 = (void *)sizeThatFits_withConfiguration__measuringLabel;
  sizeThatFits_withConfiguration__measuringLabel = (uint64_t)v0;
}

@end