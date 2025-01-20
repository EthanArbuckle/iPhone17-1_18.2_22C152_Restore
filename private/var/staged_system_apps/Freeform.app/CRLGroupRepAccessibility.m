@interface CRLGroupRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)accessibilityIsIgnored;
- (BOOL)crlaxAllowedToEditChildren;
- (BOOL)crlaxSupportsPublicCustomRotors;
- (BOOL)isAccessibilityElement;
- (CRLGroupItemAccessibility)crlaxInfoAccessibility;
- (NSArray)crlaxChildReps;
- (id)childRepsForHitTesting;
- (id)crlaxLabel;
@end

@implementation CRLGroupRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

+ (id)crlaxTargetClassName
{
  return @"CRLGroupRep";
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

- (BOOL)accessibilityIsIgnored
{
  return 0;
}

- (NSArray)crlaxChildReps
{
  v2 = [(CRLGroupRepAccessibility *)self crlaxTarget];
  id v3 = [v2 childReps];

  return (NSArray *)v3;
}

- (id)crlaxLabel
{
  char v14 = 0;
  v2 = [(CRLGroupRepAccessibility *)self crlaxTarget];
  id v3 = [v2 info];

  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v14);
  if (v14) {
    abort();
  }
  v6 = (void *)v5;

  v7 = [v6 accessibilityDescription];

  id v8 = [v7 length];
  v9 = +[NSBundle mainBundle];
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = [v9 localizedStringForKey:@"%@, group", 0, 0 value table];

    v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v7);
    v10 = (void *)v11;
  }
  else
  {
    v12 = [v9 localizedStringForKey:@"Group" value:0 table:0];
  }

  return v12;
}

- (BOOL)crlaxAllowedToEditChildren
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100291F64;
  v4[3] = &unk_1014CB090;
  v4[4] = self;
  v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (CRLGroupItemAccessibility)crlaxInfoAccessibility
{
  char v8 = 0;
  char v2 = [(CRLGroupRepAccessibility *)self crlaxTarget];
  id v3 = [v2 info];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLGroupItemAccessibility *)v6;
}

- (id)childRepsForHitTesting
{
  v7.receiver = self;
  v7.super_class = (Class)CRLGroupRepAccessibility;
  id v3 = [(CRLGroupRepAccessibility *)&v7 childRepsForHitTesting];
  v4 = +[CRLAccessibility sharedInstance];
  if ([v4 needsAccessibilityElements])
  {
    unsigned __int8 v5 = [(CRLGroupRepAccessibility *)self crlaxAllowedToEditChildren];

    if (v5) {
      goto LABEL_5;
    }
    v4 = v3;
    id v3 = 0;
  }

LABEL_5:

  return v3;
}

@end