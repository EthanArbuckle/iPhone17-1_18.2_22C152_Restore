@interface PXYearsViewKeyAssetHackService
- (BOOL)canPerformAction;
- (BOOL)shouldSetKeyAssetForHighlight:(id)a3;
- (id)title;
@end

@implementation PXYearsViewKeyAssetHackService

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  id v4 = a3;
  if ([v4 kind] == 1 || objc_msgSend(v4, "kind") == 2)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXYearsViewKeyAssetHackService;
    BOOL v5 = [(PXMonthsViewKeyAssetHackService *)&v7 shouldSetKeyAssetForHighlight:v4];
  }

  return v5;
}

- (BOOL)canPerformAction
{
  if (![(id)objc_opt_class() keyAssetHackServiceIsEnabled]) {
    return 0;
  }
  v3 = [(PXKeyAssetHackService *)self asset];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)title
{
  return @"Set as Month/Year Key Asset";
}

@end