@interface UITableViewCell(SafariExtras)
- (void)_safari_setLinkedPageTitle:()SafariExtras URL:;
- (void)_safari_setLinkedPageTitle:()SafariExtras description:;
@end

@implementation UITableViewCell(SafariExtras)

- (void)_safari_setLinkedPageTitle:()SafariExtras URL:
{
  id v6 = a3;
  objc_msgSend(a4, "safari_stringForListDisplay");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_safari_setLinkedPageTitle:description:", v6, v7);
}

- (void)_safari_setLinkedPageTitle:()SafariExtras description:
{
  id v10 = a4;
  id v6 = a3;
  id v7 = [a1 textLabel];
  [v7 setLineBreakMode:4];
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = v10;
  }
  [v7 setText:v8];

  if ([a1 style] == 3)
  {
    v9 = [a1 detailTextLabel];
    [v9 setLineBreakMode:5];
    [v9 setText:v10];
  }
}

@end