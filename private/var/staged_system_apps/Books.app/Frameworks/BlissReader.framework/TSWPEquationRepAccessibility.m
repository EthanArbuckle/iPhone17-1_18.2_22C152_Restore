@interface TSWPEquationRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)tsaxShouldExposeAsAttachmentToken;
- (NSDictionary)tsaxMathEquationRepresentation;
- (id)_axEquation;
- (id)accessibilityLabel;
- (id)accessibilityMathEquation;
- (id)accessibilityMathMLSource;
- (unint64_t)accessibilityTraits;
- (void)tsaxSetMathEquationRepresentation:(id)a3;
@end

@implementation TSWPEquationRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPEquationRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSDictionary)tsaxMathEquationRepresentation
{
  return (NSDictionary *)__TSAccessibilityGetAssociatedObject(self, &unk_5738F0);
}

- (void)tsaxSetMathEquationRepresentation:(id)a3
{
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)TSWPEquationRepAccessibility;
  BOOL v6 = -[TSWPEquationRepAccessibility containsPoint:](&v8, "containsPoint:");
  if ([+[TSAccessibility sharedInstance] needsAccessibilityElements])
  {
    [(TSDRepAccessibility *)self tsaxNaturalBounds];
    v9.CGFloat x = x;
    v9.CGFloat y = y;
    return CGRectContainsPoint(v10, v9);
  }
  return v6;
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return 0x40000000000;
}

- (id)_axEquation
{
  id v2 = [(TSDRepAccessibility *)self tsaxValueForKey:@"info"];

  return [v2 tsaxValueForKey:@"equation"];
}

- (id)accessibilityMathEquation
{
  v3 = [(TSWPEquationRepAccessibility *)self tsaxMathEquationRepresentation];
  if (!v3)
  {
    id v4 = [(TSWPEquationRepAccessibility *)self _axEquation];
    if (qword_5738F8 != -1) {
      dispatch_once(&qword_5738F8, &stru_46BF28);
    }
    id v5 = [[[v4 tsaxValueForKey:@"root"] tsaxValueForKey:@"mExpression"]
    v3 = (NSDictionary *)+[NSMutableDictionary dictionary];
    sub_26A414(v5, v3, 0);
    [(TSWPEquationRepAccessibility *)self tsaxSetMathEquationRepresentation:v3];
  }
  return v3;
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)accessibilityMathMLSource
{
  id result = [[self _axEquation] tsaxValueForKey:@"mSource"];
  if (result)
  {
    id v3 = [objc_alloc((Class)NSString) initWithData:result encoding:1];
    return v3;
  }
  return result;
}

@end