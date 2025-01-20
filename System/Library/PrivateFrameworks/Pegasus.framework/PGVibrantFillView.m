@interface PGVibrantFillView
- (PGVibrantFillView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)PG_updateVibrancyEffectForTintColor;
- (void)tintColorDidChange;
@end

@implementation PGVibrantFillView

- (void)PG_updateVibrancyEffectForTintColor
{
  v3 = [(PGVibrantFillView *)self tintColor];
  int v4 = objc_msgSend(v3, "PG_wantsVibrancyEffect");
  v5 = (void *)*MEMORY[0x1E4F3A2E8];
  if (!v4) {
    v5 = 0;
  }
  id v10 = v5;

  v6 = [(PGVibrantFillView *)self layer];
  id v7 = [v6 compositingFilter];

  if (([v7 isEqualToString:v10] & 1) == 0 && v7 != v10)
  {
    v8 = [(PGVibrantFillView *)self layer];
    [v8 setCompositingFilter:v10];
  }
  v9 = [(PGVibrantFillView *)self tintColor];
  [(PGVibrantFillView *)self setBackgroundColor:v9];
}

- (PGVibrantFillView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PGVibrantFillView;
  v3 = -[PGVibrantFillView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3) {
    [(PGVibrantFillView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGVibrantFillView;
  -[PGVibrantFillView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PGVibrantFillView *)objc_claimAutoreleasedReturnValue();
  objc_super v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  id v7 = v5;

  return v7;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PGVibrantFillView;
  [(PGVibrantFillView *)&v3 tintColorDidChange];
  [(PGVibrantFillView *)self PG_updateVibrancyEffectForTintColor];
}

@end