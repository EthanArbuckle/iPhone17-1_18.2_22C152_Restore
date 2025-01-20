@interface CRLUnknownRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)accessibilityActivate;
- (id)crlaxLabel;
@end

@implementation CRLUnknownRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLUnknownRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)crlaxLabel
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Unsupported Object" value:0 table:0];

  return v3;
}

- (BOOL)accessibilityActivate
{
  return -[CRLUnknownRepAccessibility handleSingleTapAtPoint:inputType:](self, "handleSingleTapAtPoint:inputType:", 0, CGPointZero.x, CGPointZero.y);
}

@end