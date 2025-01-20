@interface SPUIPlatterShadowView
- (SPUIPlatterShadowView)init;
@end

@implementation SPUIPlatterShadowView

- (SPUIPlatterShadowView)init
{
  v7.receiver = self;
  v7.super_class = (Class)SPUIPlatterShadowView;
  v2 = [(SPUIPlatterShadowView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SPUIPlatterShadowView *)v2 layer];
    LODWORD(v5) = 0.5;
    [v4 setShadowOpacity:v5];
    [v4 setShadowRadius:20.0];
    objc_msgSend(v4, "setShadowOffset:", 0.0, 10.0);
    [v4 setCornerRadius:20.0];
    [v4 setCornerCurve:*MEMORY[0x263F15A20]];
    [(SPUIPlatterShadowView *)v3 effectiveScreenScale];
    objc_msgSend(v4, "setContentsScale:");
    [v4 setShadowPathIsBounds:1];
  }
  return v3;
}

@end