@interface PGLayoutContainerView
- (PGLayoutContainerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PGLayoutContainerView

- (PGLayoutContainerView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PGLayoutContainerView;
  v3 = -[PGLayoutContainerView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PGLayoutContainerView *)v3 layer];
    [v5 setAllowsGroupBlending:0];
  }
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGLayoutContainerView;
  -[PGLayoutContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (PGLayoutContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    v5 = 0;
  }
  objc_super v7 = v5;

  return v7;
}

@end