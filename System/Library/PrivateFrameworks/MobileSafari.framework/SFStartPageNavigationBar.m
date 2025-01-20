@interface SFStartPageNavigationBar
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation SFStartPageNavigationBar

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SFStartPageNavigationBar;
  v5 = -[SFStartPageNavigationBar hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = [(SFStartPageNavigationBar *)self topItem];
  v8 = [v7 standardAppearance];
  v9 = [v8 backgroundEffect];

  if (v9 || (isKindOfClass & 1) != 0) {
    id v10 = v5;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

@end