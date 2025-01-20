@interface CRLUICollectionViewCellAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityTextOperationAction:(id)a3;
- (CGRect)accessibilityFrame;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextViewTextOperationResponder;
- (id)_crlaxAlternateTextOperationProvider;
- (id)_crlaxBaseCollectionViewCellTextOperations;
@end

@implementation CRLUICollectionViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return @"UICollectionViewCell";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (CGRect)accessibilityFrame
{
  id v3 = [(CRLUICollectionViewCellAccessibility *)self accessibilityContainer];
  v21.receiver = self;
  v21.super_class = (Class)CRLUICollectionViewCellAccessibility;
  [(CRLUICollectionViewCellAccessibility *)&v21 accessibilityFrame];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;
  NSClassFromString(@"UICollectionViewCellAccessibilityElement");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v3 accessibilityContainer];

    id v3 = (void *)v12;
  }
  if (v3)
  {
    [v3 accessibilityFrame];
    v25.origin.CGFloat x = v13;
    v25.origin.CGFloat y = v14;
    v25.size.CGFloat width = v15;
    v25.size.CGFloat height = v16;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectIntersection(v22, v25);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (BOOL)_accessibilityHasTextOperations
{
  v7.receiver = self;
  v7.super_class = (Class)CRLUICollectionViewCellAccessibility;
  id v3 = [(CRLUICollectionViewCellAccessibility *)&v7 _accessibilityTextOperations];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(CRLUICollectionViewCellAccessibility *)self _crlaxAlternateTextOperationProvider];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)_accessibilityTextOperations
{
  v7.receiver = self;
  v7.super_class = (Class)CRLUICollectionViewCellAccessibility;
  id v3 = [(CRLUICollectionViewCellAccessibility *)&v7 _accessibilityTextOperations];
  if (![v3 count])
  {
    BOOL v4 = [(CRLUICollectionViewCellAccessibility *)self _crlaxAlternateTextOperationProvider];
    uint64_t v5 = [v4 _accessibilityTextOperations];

    id v3 = (void *)v5;
  }

  return v3;
}

- (BOOL)_accessibilityTextOperationAction:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLUICollectionViewCellAccessibility;
  if ([(CRLUICollectionViewCellAccessibility *)&v9 _accessibilityTextOperationAction:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    double v6 = [(CRLUICollectionViewCellAccessibility *)self _crlaxAlternateTextOperationProvider];
    objc_super v7 = [v6 _accessibilityTextViewTextOperationResponder];
    unsigned __int8 v5 = [v7 _accessibilityTextOperationAction:v4];
  }
  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  v2 = [(CRLUICollectionViewCellAccessibility *)self _crlaxAlternateTextOperationProvider];
  id v3 = [v2 _accessibilityTextViewTextOperationResponder];

  return v3;
}

- (id)_crlaxAlternateTextOperationProvider
{
  id v2 = [(CRLUICollectionViewCellAccessibility *)self nextResponder];
  if (v2)
  {
    while (1)
    {
      id v3 = [v2 _accessibilityTextOperations];
      id v4 = [v3 count];

      if (v4) {
        break;
      }
      uint64_t v5 = [v2 nextResponder];

      id v2 = (id)v5;
      if (!v5) {
        goto LABEL_6;
      }
    }
    id v2 = v2;
  }
LABEL_6:

  return v2;
}

- (id)_crlaxBaseCollectionViewCellTextOperations
{
  v4.receiver = self;
  v4.super_class = (Class)CRLUICollectionViewCellAccessibility;
  id v2 = [(CRLUICollectionViewCellAccessibility *)&v4 _accessibilityTextOperations];

  return v2;
}

@end