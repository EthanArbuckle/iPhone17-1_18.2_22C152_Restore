@interface CRLUITableViewCellAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)accessibilityScrollToVisible;
- (UISwitch)_crlaxAccessibilityTableViewSwitch;
- (id)_accessibilityTableViewSwitch;
- (void)_crlaxSetAccessibilityTableViewSwitch:(id)a3;
- (void)crlaxClearChildrenWorkaroundFor20458918;
@end

@implementation CRLUITableViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return @"UITableViewCell";
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

- (UISwitch)_crlaxAccessibilityTableViewSwitch
{
  return (UISwitch *)__CRLAccessibilityGetAssociatedObject(self, &unk_1016A9D6D);
}

- (void)_crlaxSetAccessibilityTableViewSwitch:(id)a3
{
}

- (void)crlaxClearChildrenWorkaroundFor20458918
{
  [(CRLUITableViewCellAccessibility *)self _accessibilityClearChildren];

  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (id)_accessibilityTableViewSwitch
{
  id v3 = [(CRLUITableViewCellAccessibility *)self _crlaxAccessibilityTableViewSwitch];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLUITableViewCellAccessibility;
    id v3 = [(CRLUITableViewCellAccessibility *)&v5 _accessibilityTableViewSwitch];
  }

  return v3;
}

- (BOOL)accessibilityScrollToVisible
{
  v20.receiver = self;
  v20.super_class = (Class)CRLUITableViewCellAccessibility;
  if ([(CRLUITableViewCellAccessibility *)&v20 accessibilityScrollToVisible])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = sub_10049916C;
    v18 = sub_10049917C;
    id v19 = 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100499184;
    v13[3] = &unk_1014CB090;
    v13[4] = self;
    v13[5] = &v14;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v13)) {
      abort();
    }
    id v4 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    if (v4)
    {
      objc_super v5 = [v4 visibleCells];
      v6 = [v5 sortedArrayUsingSelector:NSSelectorFromString(@"accessibilityCompareGeometry:")];

      if ((unint64_t)[v6 count] < 2)
      {
        BOOL v8 = 0;
      }
      else
      {
        [v6 objectAtIndexedSubscript:[v6 count] - 2];
        v7 = (CRLUITableViewCellAccessibility *)objc_claimAutoreleasedReturnValue();
        BOOL v8 = v7 == self;
      }
      if ([v6 count])
      {
        [v6 objectAtIndexedSubscript:([v6 count] - 1)];
        v9 = (CRLUITableViewCellAccessibility *)objc_claimAutoreleasedReturnValue();
        BOOL v10 = v9 == self;
      }
      else
      {
        BOOL v10 = 0;
      }
      int v3 = v8 || v10;
      if (v3 == 1)
      {
        v11 = [v4 indexPathForCell:self];
        [v4 scrollToRowAtIndexPath:v11 atScrollPosition:2 animated:0];
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

@end