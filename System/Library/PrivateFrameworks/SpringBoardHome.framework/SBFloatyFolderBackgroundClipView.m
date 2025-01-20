@interface SBFloatyFolderBackgroundClipView
- (SBFloatyFolderBackgroundClipView)initWithFrame:(CGRect)a3;
- (SBFolderBackgroundView)backgroundView;
- (double)cornerRadius;
- (unint64_t)backgroundEffect;
- (void)layoutSubviews;
- (void)setBackgroundEffect:(unint64_t)a3;
- (void)setCornerRadius:(double)a3;
@end

@implementation SBFloatyFolderBackgroundClipView

- (void)setBackgroundEffect:(unint64_t)a3
{
}

- (SBFloatyFolderBackgroundClipView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFloatyFolderBackgroundClipView;
  v3 = -[SBFloatyFolderBackgroundClipView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SBFolderBackgroundView);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v4;

    [(SBFloatyFolderBackgroundClipView *)v3 addSubview:v3->_backgroundView];
    [(SBFloatyFolderBackgroundClipView *)v3 setClipsToBounds:1];
    +[SBFolderBackgroundView cornerRadiusToInsetContent];
    -[SBFloatyFolderBackgroundClipView setCornerRadius:](v3, "setCornerRadius:");
  }
  return v3;
}

- (void)setCornerRadius:(double)a3
{
}

- (SBFolderBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)layoutSubviews
{
  [(SBFolderBackgroundView *)self->_backgroundView frame];
  CGRectGetWidth(v7);
  int IsZero = BSFloatIsZero();
  backgroundView = self->_backgroundView;
  [(SBFloatyFolderBackgroundClipView *)self bounds];
  -[SBFolderBackgroundView setFrame:](backgroundView, "setFrame:");
  if (IsZero)
  {
    v5 = self->_backgroundView;
    [(SBFolderBackgroundView *)v5 updateTintEffectColor];
  }
}

- (unint64_t)backgroundEffect
{
  return [(SBFolderBackgroundView *)self->_backgroundView effect];
}

- (double)cornerRadius
{
  [(SBFolderBackgroundView *)self->_backgroundView _continuousCornerRadius];
  return result;
}

- (void).cxx_destruct
{
}

@end