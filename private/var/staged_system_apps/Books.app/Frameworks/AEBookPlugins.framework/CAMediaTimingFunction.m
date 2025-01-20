@interface CAMediaTimingFunction
+ (CAMediaTimingFunction)functionWithControlPoints:(const CGPoint *)a3;
@end

@implementation CAMediaTimingFunction

+ (CAMediaTimingFunction)functionWithControlPoints:(const CGPoint *)a3
{
  CGFloat x = a3->x;
  CGFloat y = a3->y;
  *(float *)&CGFloat x = a3->x;
  *(float *)&CGFloat y = y;
  CGFloat v5 = a3[1].x;
  CGFloat v6 = a3[1].y;
  *(float *)&CGFloat v5 = v5;
  *(float *)&CGFloat v6 = v6;
  return +[CAMediaTimingFunction functionWithControlPoints:x :y :v5 :v6];
}

@end