@interface PXMonthsViewKeyAssetHackService
- (BOOL)canPerformAction;
- (BOOL)shouldSetKeyAssetForHighlight:(id)a3;
- (id)title;
@end

@implementation PXMonthsViewKeyAssetHackService

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1AD10A0B0]([v4 type]))
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXMonthsViewKeyAssetHackService;
    BOOL v5 = [(PXDaysViewKeyAssetHackService *)&v7 shouldSetKeyAssetForHighlight:v4];
  }

  return v5;
}

- (BOOL)canPerformAction
{
  if (![(id)objc_opt_class() keyAssetHackServiceIsEnabled]) {
    return 0;
  }
  v3 = [(PXKeyAssetHackService *)self asset];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 photoLibrary];
    v6 = [v5 librarySpecificFetchOptions];

    objc_super v7 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v4 withType:6 options:v6];
    v8 = [v7 firstObject];

    if (v8) {
      BOOL v9 = [v8 type] == 5;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)title
{
  return @"Set as Trip Key Asset";
}

@end