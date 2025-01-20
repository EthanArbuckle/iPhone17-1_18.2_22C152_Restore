@interface UIScrollView(ISScrollViewVitalityController)
- (ISUIScrollViewVitalityController)is_vitalityControllerCreateIfNeeded:()ISScrollViewVitalityController;
- (uint64_t)canDriveVitality;
- (uint64_t)is_vitalityController;
- (void)is_didLayoutPlayerViews;
- (void)setCanDriveVitality:()ISScrollViewVitalityController;
@end

@implementation UIScrollView(ISScrollViewVitalityController)

- (void)is_didLayoutPlayerViews
{
  objc_msgSend(a1, "is_vitalityController");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 didLayoutPlayerViews];
}

- (void)setCanDriveVitality:()ISScrollViewVitalityController
{
  if ([a1 canDriveVitality] != a3)
  {
    v5 = (const void *)ISScrollViewCanDriveVitalityAssociationKey;
    v6 = [NSNumber numberWithBool:a3];
    objc_setAssociatedObject(a1, v5, v6, (void *)1);

    if ((a3 & 1) == 0)
    {
      v7 = (const void *)ISScrollViewVitalityControllerAssociationKey;
      objc_setAssociatedObject(a1, v7, 0, (void *)1);
    }
  }
}

- (uint64_t)canDriveVitality
{
  uint64_t v1 = objc_getAssociatedObject(a1, (const void *)ISScrollViewCanDriveVitalityAssociationKey);
  v2 = (void *)v1;
  v3 = (void *)MEMORY[0x1E4F1CC38];
  if (v1) {
    v3 = (void *)v1;
  }
  id v4 = v3;

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (ISUIScrollViewVitalityController)is_vitalityControllerCreateIfNeeded:()ISScrollViewVitalityController
{
  objc_getAssociatedObject(a1, (const void *)ISScrollViewVitalityControllerAssociationKey);
  uint64_t v5 = (ISUIScrollViewVitalityController *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = a3 == 0;
  }
  if (!v6)
  {
    if ([a1 canDriveVitality])
    {
      uint64_t v5 = objc_alloc_init(ISUIScrollViewVitalityController);
      [(ISUIScrollViewVitalityController *)v5 _setScrollView:a1];
      objc_setAssociatedObject(a1, (const void *)ISScrollViewVitalityControllerAssociationKey, v5, (void *)1);
    }
    else
    {
      uint64_t v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)is_vitalityController
{
  return objc_msgSend(a1, "is_vitalityControllerCreateIfNeeded:", 1);
}

@end