@interface SFMagicHeadCircleView
+ (Class)layerClass;
- (SFMagicHeadCircleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)update;
@end

@implementation SFMagicHeadCircleView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFMagicHeadCircleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFMagicHeadCircleView;
  v3 = -[SFMagicHeadCircleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(SFMagicHeadCircleView *)v3 update];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadCircleView;
  [(SFMagicHeadCircleView *)&v3 layoutSubviews];
  [(SFMagicHeadCircleView *)self update];
}

- (void)update
{
  id v6 = [(SFMagicHeadCircleView *)self layer];
  [(SFMagicHeadCircleView *)self frame];
  [v6 setCornerRadius:CGRectGetWidth(v8) * 0.5];
  objc_super v3 = (void *)MEMORY[0x263F824C0];
  [(SFMagicHeadCircleView *)self bounds];
  objc_msgSend(v3, "bezierPathWithOvalInRect:");
  id v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPath:", objc_msgSend(v4, "CGPath"));

  [v6 setMasksToBounds:1];
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  objc_msgSend(v6, "setFillColor:", objc_msgSend(v5, "CGColor"));
}

@end