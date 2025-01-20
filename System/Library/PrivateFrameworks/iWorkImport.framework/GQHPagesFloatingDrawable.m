@interface GQHPagesFloatingDrawable
+ (Class)beginTable:(id)a3;
+ (int)beginDrawables:(id)a3;
+ (int)endDrawables:(id)a3;
+ (int)handleDrawable:(id)a3 state:(id)a4;
@end

@implementation GQHPagesFloatingDrawable

+ (int)beginDrawables:(id)a3
{
  return 1;
}

+ (int)handleDrawable:(id)a3 state:(id)a4
{
  return 1;
}

+ (Class)beginTable:(id)a3
{
  return (Class)objc_opt_class();
}

+ (int)endDrawables:(id)a3
{
  return 1;
}

@end