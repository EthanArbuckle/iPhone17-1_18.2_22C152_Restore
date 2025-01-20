@interface SFAdjustedImageView
- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4;
@end

@implementation SFAdjustedImageView

- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4
{
  SFAdjustmentFiltersForAssetTypeAndURL(a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [(SFAdjustedImageView *)self layer];
  [v5 setFilters:v6];
}

@end