@interface UITableView(DataSourceConfiguration)
- (uint64_t)cellRegistered;
- (void)setCellRegistered:()DataSourceConfiguration;
@end

@implementation UITableView(DataSourceConfiguration)

- (void)setCellRegistered:()DataSourceConfiguration
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_cellRegistered, v2, (void *)3);
}

- (uint64_t)cellRegistered
{
  v1 = objc_getAssociatedObject(a1, sel_cellRegistered);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end