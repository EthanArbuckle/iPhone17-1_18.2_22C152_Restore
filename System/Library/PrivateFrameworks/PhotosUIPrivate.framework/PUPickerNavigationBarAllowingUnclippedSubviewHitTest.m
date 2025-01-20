@interface PUPickerNavigationBarAllowingUnclippedSubviewHitTest
@end

@implementation PUPickerNavigationBarAllowingUnclippedSubviewHitTest

id __98___PUPickerNavigationBarAllowingUnclippedSubviewHitTest__unclippedViewPassingHitTest_point_event___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (([v4 isHidden] & 1) == 0)
  {
    [v4 alpha];
    if (v6 > 0.01)
    {
      if ([v4 isUserInteractionEnabled])
      {
        v7 = [v4 subviews];
        [v5 addObjectsFromArray:v7];
      }
    }
  }

  return v5;
}

@end