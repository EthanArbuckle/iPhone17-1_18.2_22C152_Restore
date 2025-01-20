@interface _PUSyndicationAttributionTileView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _PUSyndicationAttributionTileView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_PUSyndicationAttributionTileView;
  -[_PUSyndicationAttributionTileView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_PUSyndicationAttributionTileView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

@end