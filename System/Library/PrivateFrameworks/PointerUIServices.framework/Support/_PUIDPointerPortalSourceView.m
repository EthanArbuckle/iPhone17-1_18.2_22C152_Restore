@interface _PUIDPointerPortalSourceView
- (UIViewFloatAnimatableProperty)opacityPairFilterAnimatableProperty;
- (_PUIDPointerPortalSourceView)initWithFrame:(CGRect)a3;
- (_UIPortalView)contentPortalView;
- (void)layoutSubviews;
- (void)setOpacityPairFilterAnimatableProperty:(id)a3;
@end

@implementation _PUIDPointerPortalSourceView

- (_PUIDPointerPortalSourceView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_PUIDPointerPortalSourceView;
  v3 = -[_PUIDPointerPortalSourceView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)_UIPortalView);
    [(_PUIDPointerPortalSourceView *)v3 bounds];
    v5 = (_UIPortalView *)objc_msgSend(v4, "initWithFrame:");
    contentPortalView = v3->_contentPortalView;
    v3->_contentPortalView = v5;

    [(_UIPortalView *)v3->_contentPortalView setMatchesAlpha:0];
    [(_UIPortalView *)v3->_contentPortalView setHidesSourceView:0];
    [(_UIPortalView *)v3->_contentPortalView setMatchesTransform:0];
    [(_UIPortalView *)v3->_contentPortalView setMatchesPosition:1];
    [(_UIPortalView *)v3->_contentPortalView setAlpha:0.0];
    [(_PUIDPointerPortalSourceView *)v3 addSubview:v3->_contentPortalView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_PUIDPointerPortalSourceView;
  [(_PUIDPointerPortalSourceView *)&v4 layoutSubviews];
  contentPortalView = self->_contentPortalView;
  [(_PUIDPointerPortalSourceView *)self bounds];
  -[_UIPortalView setFrame:](contentPortalView, "setFrame:");
}

- (_UIPortalView)contentPortalView
{
  return self->_contentPortalView;
}

- (UIViewFloatAnimatableProperty)opacityPairFilterAnimatableProperty
{
  return self->_opacityPairFilterAnimatableProperty;
}

- (void)setOpacityPairFilterAnimatableProperty:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opacityPairFilterAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_contentPortalView, 0);
}

@end