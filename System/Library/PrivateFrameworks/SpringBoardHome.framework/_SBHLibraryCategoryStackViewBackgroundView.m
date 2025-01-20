@interface _SBHLibraryCategoryStackViewBackgroundView
- (MTMaterialView)materialView;
- (UIView)tintingView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)setMaterialView:(id)a3;
- (void)setTintingView:(id)a3;
@end

@implementation _SBHLibraryCategoryStackViewBackgroundView

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SBHLibraryCategoryStackViewBackgroundView;
  -[_SBHLibraryCategoryStackViewBackgroundView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_tintingView _setContinuousCornerRadius:a3];
  [(MTMaterialView *)self->_materialView _setContinuousCornerRadius:a3];
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
}

- (UIView)tintingView
{
  return self->_tintingView;
}

- (void)setTintingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintingView, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
}

@end