@interface TSDPointPathSourceAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSDPointPathSourceAccessibility)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5;
- (id)_tsaxInferredLabel;
@end

@implementation TSDPointPathSourceAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDPointPathSource";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_tsaxInferredLabel
{
  int v2 = [(TSDPointPathSourceAccessibility *)self tsaxUnsignedIntValueForKey:@"type"];
  if (v2 > 99)
  {
    if (v2 == 100)
    {
      CFStringRef v3 = @"Star";
      goto LABEL_10;
    }
    if (v2 == 200)
    {
      CFStringRef v3 = @"Plus";
      goto LABEL_10;
    }
    return 0;
  }
  if (v2 >= 2)
  {
    if (v2 == 10)
    {
      CFStringRef v3 = @"DoubleArrow";
      goto LABEL_10;
    }
    return 0;
  }
  CFStringRef v3 = @"Arrow";
LABEL_10:

  return TSAccessibilityLocalizedString((uint64_t)v3);
}

- (TSDPointPathSourceAccessibility)initWithType:(int)a3 point:(CGPoint)a4 naturalSize:(CGSize)a5
{
  v9.receiver = self;
  v9.super_class = (Class)TSDPointPathSourceAccessibility;
  v6 = -[TSDPointPathSourceAccessibility initWithType:point:naturalSize:](&v9, "initWithType:point:naturalSize:", a4.x, a4.y, a5.width, a5.height);
  if (a3 > 99)
  {
    if (a3 == 100)
    {
      CFStringRef v7 = @"Star";
      goto LABEL_10;
    }
    if (a3 == 200)
    {
      CFStringRef v7 = @"Plus";
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 < 2)
    {
      CFStringRef v7 = @"Arrow";
LABEL_10:
      [(TSDPointPathSourceAccessibility *)v6 setAccessibilityIdentifier:TSAccessibilityLocalizedString((uint64_t)v7)];
      return v6;
    }
    if (a3 == 10)
    {
      CFStringRef v7 = @"DoubleArrow";
      goto LABEL_10;
    }
  }
  return v6;
}

@end