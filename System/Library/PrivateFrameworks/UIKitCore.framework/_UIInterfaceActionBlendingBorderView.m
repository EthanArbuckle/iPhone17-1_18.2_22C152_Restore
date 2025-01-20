@interface _UIInterfaceActionBlendingBorderView
+ (BOOL)isBorderView;
+ (id)newWithRoundedCornerPosition:(unint64_t)a3 continuousCornerRadius:(double)a4;
@end

@implementation _UIInterfaceActionBlendingBorderView

+ (BOOL)isBorderView
{
  return 1;
}

+ (id)newWithRoundedCornerPosition:(unint64_t)a3 continuousCornerRadius:(double)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = +[UIColor _vibrantLightDividerBurnColor];
  v8 = +[UIColor _vibrantLightDividerDarkeningColor];
  v9 = (void *)[v6 initWithCompositingBurnColor:v7 plusDColor:v8];

  if (a3)
  {
    [v9 setRoundedCornerPosition:a3];
    [v9 _setContinuousCornerRadius:a4];
  }
  return v9;
}

@end