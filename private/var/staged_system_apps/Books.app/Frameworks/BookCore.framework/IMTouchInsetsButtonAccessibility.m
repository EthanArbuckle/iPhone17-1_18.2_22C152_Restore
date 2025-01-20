@interface IMTouchInsetsButtonAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (CGRect)accessibilityFrame;
@end

@implementation IMTouchInsetsButtonAccessibility

+ (id)imaxTargetClassName
{
  return @"IMTouchInsetsButton";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (CGRect)accessibilityFrame
{
  uint64_t v18 = 0;
  v19 = (double *)&v18;
  uint64_t v20 = 0x4010000000;
  v21 = &unk_250006;
  long long v22 = 0u;
  long long v23 = 0u;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_60854;
  v17[3] = &unk_2C39F0;
  v17[4] = self;
  v17[5] = &v18;
  IMAXAccessibilityPerformSafeBlock(v17);
  [(IMTouchInsetsButtonAccessibility *)self bounds];
  double v3 = v19[4];
  double v4 = v19[5];
  v24.origin.CGFloat x = v5 + v4;
  v24.origin.CGFloat y = v6 + v3;
  v24.size.CGFloat width = v7 - (v4 + v19[7]);
  v24.size.CGFloat height = v8 - (v3 + v19[6]);
  CGRect v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, (UIView *)self);
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  _Block_object_dispose(&v18, 8);
  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

@end