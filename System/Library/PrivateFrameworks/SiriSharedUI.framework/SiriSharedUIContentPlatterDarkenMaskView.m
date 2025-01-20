@interface SiriSharedUIContentPlatterDarkenMaskView
- (SiriSharedUIContentPlatterDarkenMaskView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SiriSharedUIContentPlatterDarkenMaskView

- (SiriSharedUIContentPlatterDarkenMaskView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterDarkenMaskView;
  v3 = -[SiriSharedUIContentPlatterDarkenMaskView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] blackColor];
    [(SiriSharedUIContentPlatterDarkenMaskView *)v3 setBackgroundColor:v4];

    [(SiriSharedUIContentPlatterDarkenMaskView *)v3 setAlpha:0.0];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SiriSharedUIContentPlatterDarkenMaskView;
  -[SiriSharedUIContentPlatterDarkenMaskView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SiriSharedUIContentPlatterDarkenMaskView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    v7 = 0;
  }
  else {
    v7 = v5;
  }

  return v7;
}

@end