@interface CRLBoardItemSelectionAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (NSSet)crlaxInfos;
- (unint64_t)crlaxInfoCount;
@end

@implementation CRLBoardItemSelectionAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLBoardItemSelection";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSSet)crlaxInfos
{
  v2 = [(CRLBoardItemSelectionAccessibility *)self crlaxTarget];
  v3 = [v2 boardItems];

  return (NSSet *)v3;
}

- (unint64_t)crlaxInfoCount
{
  v2 = [(CRLBoardItemSelectionAccessibility *)self crlaxTarget];
  id v3 = [v2 itemCount];

  return (unint64_t)v3;
}

@end