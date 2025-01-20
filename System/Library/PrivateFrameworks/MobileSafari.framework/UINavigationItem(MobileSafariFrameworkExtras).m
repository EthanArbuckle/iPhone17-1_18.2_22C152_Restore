@interface UINavigationItem(MobileSafariFrameworkExtras)
- (BOOL)sf_isEmpty;
- (id)sf_preferredDismissOrDoneButtonItem;
- (uint64_t)_sf_prefersDismissOrDoneButtonOnLeft;
- (void)sf_setPreferredDismissOrDoneButtonItem:()MobileSafariFrameworkExtras;
@end

@implementation UINavigationItem(MobileSafariFrameworkExtras)

- (BOOL)sf_isEmpty
{
  v2 = [a1 title];
  if ([v2 length])
  {
    BOOL v3 = 0;
  }
  else
  {
    v4 = [a1 leftBarButtonItems];
    if ([v4 count])
    {
      BOOL v3 = 0;
    }
    else
    {
      v5 = [a1 rightBarButtonItems];
      BOOL v3 = [v5 count] == 0;
    }
  }

  return v3;
}

- (uint64_t)_sf_prefersDismissOrDoneButtonOnLeft
{
  return 0;
}

- (id)sf_preferredDismissOrDoneButtonItem
{
  if (objc_msgSend(a1, "_sf_prefersDismissOrDoneButtonOnLeft")) {
    [a1 leftBarButtonItem];
  }
  else {
  v2 = [a1 rightBarButtonItem];
  }

  return v2;
}

- (void)sf_setPreferredDismissOrDoneButtonItem:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  if (objc_msgSend(a1, "_sf_prefersDismissOrDoneButtonOnLeft")) {
    [a1 setLeftBarButtonItem:v4];
  }
  else {
    [a1 setRightBarButtonItem:v4];
  }
}

@end