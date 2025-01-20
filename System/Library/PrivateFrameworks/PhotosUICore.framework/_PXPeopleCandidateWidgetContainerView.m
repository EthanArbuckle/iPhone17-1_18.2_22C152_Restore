@interface _PXPeopleCandidateWidgetContainerView
- (BOOL)isDisappearing;
- (UIView)containedView;
- (void)layoutSubviews;
- (void)setContainedView:(id)a3;
- (void)setIsDisappearing:(BOOL)a3;
@end

@implementation _PXPeopleCandidateWidgetContainerView

- (void).cxx_destruct
{
}

- (void)setIsDisappearing:(BOOL)a3
{
  self->_isDisappearing = a3;
}

- (BOOL)isDisappearing
{
  return self->_isDisappearing;
}

- (UIView)containedView
{
  return self->_containedView;
}

- (void)layoutSubviews
{
  if (![(_PXPeopleCandidateWidgetContainerView *)self isDisappearing])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55___PXPeopleCandidateWidgetContainerView_layoutSubviews__block_invoke;
    v4[3] = &unk_1E5DD36F8;
    v4[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v4];
  }
  v3.receiver = self;
  v3.super_class = (Class)_PXPeopleCandidateWidgetContainerView;
  [(_PXPeopleCandidateWidgetContainerView *)&v3 layoutSubviews];
}

- (void)setContainedView:(id)a3
{
  v5 = (UIView *)a3;
  containedView = self->_containedView;
  if (containedView != v5)
  {
    v8 = v5;
    v7 = [(UIView *)containedView superview];

    if (v7 == self) {
      [(UIView *)self->_containedView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_containedView, a3);
    [(_PXPeopleCandidateWidgetContainerView *)self addSubview:v8];
    v5 = v8;
  }
}

@end