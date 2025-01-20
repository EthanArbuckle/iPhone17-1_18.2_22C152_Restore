@interface SFUnifiedBarItemPlatterView
- (SFUnifiedBarItemPlatterView)initWithFrame:(CGRect)a3;
- (UIVisualEffectView)effectView;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
@end

@implementation SFUnifiedBarItemPlatterView

- (SFUnifiedBarItemPlatterView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarItemPlatterView;
  v3 = -[SFUnifiedBarItemPlatterView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
    [(SFUnifiedBarItemPlatterView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    effectView = v3->_effectView;
    v3->_effectView = (UIVisualEffectView *)v5;

    [(UIVisualEffectView *)v3->_effectView setAutoresizingMask:18];
    [(SFUnifiedBarItemPlatterView *)v3 addSubview:v3->_effectView];
    v7 = v3;
  }

  return v3;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarItemPlatterView;
  -[SFUnifiedBarItemPlatterView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIVisualEffectView *)self->_effectView _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBarItemPlatterView;
  -[SFUnifiedBarItemPlatterView _setCornerRadius:](&v5, sel__setCornerRadius_);
  [(UIVisualEffectView *)self->_effectView _setCornerRadius:a3];
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void).cxx_destruct
{
}

@end