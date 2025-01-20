@interface ReadingListContentUnavailableView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ReadingListContentUnavailableView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([v7 type] == 9)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ReadingListContentUnavailableView;
    BOOL v8 = -[ReadingListContentUnavailableView pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y);
  }

  return v8;
}

@end