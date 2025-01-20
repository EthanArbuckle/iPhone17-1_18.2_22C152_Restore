@interface TUIImpressionOverlayView
- (TUIImpressionOverlayView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation TUIImpressionOverlayView

- (TUIImpressionOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TUIImpressionOverlayView;
  v3 = -[TUIImpressionOverlayView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TUIImpressionOverlayView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)applyLayoutAttributes:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TUIImpressionOverlayView;
  id v4 = a3;
  [(TUIReusableBaseView *)&v10 applyLayoutAttributes:v4];
  uint64_t v5 = objc_opt_class();
  objc_super v6 = objc_msgSend(v4, "generic", v10.receiver, v10.super_class);

  v7 = TUIDynamicCast(v5, v6);

  if ([v7 timingCount]) {
    +[UIColor greenColor];
  }
  else {
  v8 = +[UIColor redColor];
  }
  v9 = [v8 colorWithAlphaComponent:0.3];

  [(TUIImpressionOverlayView *)self setBackgroundColor:v9];
}

@end