@interface PGDimmingView
- (PGDimmingView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PGDimmingView

- (PGDimmingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PGDimmingView;
  v3 = -[PGDimmingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
    [(PGDimmingView *)v3 setBackgroundColor:v4];
    [(PGDimmingView *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end