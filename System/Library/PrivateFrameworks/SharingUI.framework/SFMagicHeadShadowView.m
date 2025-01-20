@interface SFMagicHeadShadowView
- (BOOL)visible;
- (SFMagicHeadShadowView)initWithFrame:(CGRect)a3;
- (void)setVisible:(BOOL)a3;
@end

@implementation SFMagicHeadShadowView

- (SFMagicHeadShadowView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFMagicHeadShadowView;
  v3 = -[SFMagicHeadShadowView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(SFMagicHeadShadowView *)v3 setBackgroundColor:v4];

    v5 = [(SFMagicHeadShadowView *)v3 layer];
    id v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.07];
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v6, "CGColor"));

    [v5 setShadowRadius:12.0];
  }
  return v3;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    if (a3) {
      float v3 = *(float *)"333?";
    }
    else {
      float v3 = 0.0;
    }
    id v5 = [(SFMagicHeadShadowView *)self layer];
    *(float *)&double v4 = v3;
    [v5 setShadowOpacity:v4];
  }
}

- (BOOL)visible
{
  return self->_visible;
}

@end