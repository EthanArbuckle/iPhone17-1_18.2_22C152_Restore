@interface PXDaysViewKeyAssetHackService
- (BOOL)canPerformAction;
- (BOOL)shouldSetKeyAssetForHighlight:(id)a3;
- (id)title;
@end

@implementation PXDaysViewKeyAssetHackService

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  id v4 = a3;
  if ([v4 kind] && objc_msgSend(v4, "type") != 3)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXDaysViewKeyAssetHackService;
    BOOL v5 = [(PXKeyAssetHackService *)&v7 shouldSetKeyAssetForHighlight:v4];
  }
  else
  {
    BOOL v5 = 1;
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
  return @"Set as Day Key Asset";
}

@end