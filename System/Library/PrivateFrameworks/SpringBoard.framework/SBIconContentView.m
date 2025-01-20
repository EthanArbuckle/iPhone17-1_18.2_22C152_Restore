@interface SBIconContentView
- (SBIconContentView)initWithFrame:(CGRect)a3;
- (SBIconContentView)initWithOrientation:(int64_t)a3;
- (UIView)contentView;
- (id)preferredFocusEnvironments;
- (int64_t)orientation;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
- (void)setOrientation:(int64_t)a3;
@end

@implementation SBIconContentView

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBIconContentView;
  v3 = -[SBIconContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SBIconContentView *)v3 _setIgnoresLayerTransformForSafeAreaInsets:1];
  }
  return v4;
}

- (SBIconContentView)initWithOrientation:(int64_t)a3
{
  result = -[SBIconContentView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    result->_orientation = a3;
  }
  return result;
}

- (void)setOrientation:(int64_t)a3
{
  int v5 = XBInterfaceOrientationsAreOrthogonal();
  self->_orientation = a3;
  if (v5)
  {
    [(SBIconContentView *)self setNeedsLayout];
    [(SBIconContentView *)self layoutIfNeeded];
  }
}

- (void)setContentView:(id)a3
{
  int v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    int v5 = v7;
    if (v7)
    {
      [(SBIconContentView *)self addSubview:v7];
      int v5 = v7;
    }
  }
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)layoutSubviews
{
  id v3 = [(SBIconContentView *)self contentView];
  [(SBIconContentView *)self bounds];
  objc_msgSend(v3, "sb_setBoundsAndPositionFromFrame:");
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end