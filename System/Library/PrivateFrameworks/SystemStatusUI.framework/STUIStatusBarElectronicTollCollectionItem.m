@interface STUIStatusBarElectronicTollCollectionItem
- (id)imageForUpdate:(id)a3;
- (id)indicatorEntryKey;
@end

@implementation STUIStatusBarElectronicTollCollectionItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9768];
}

- (id)imageForUpdate:(id)a3
{
  id v3 = a3;
  v4 = [v3 data];
  v5 = [v4 electronicTollCollectionEntry];

  v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = DashBoardFrameworkBundle();
  v8 = [v3 styleAttributes];
  v9 = [v8 traitCollection];
  v10 = [v6 imageNamed:@"Black_JapanETC" inBundle:v7 compatibleWithTraitCollection:v9];

  v11 = [v10 imageWithRenderingMode:2];

  v12 = [v3 styleAttributes];

  v13 = [v12 imageTintColor];

  if (([v5 BOOLValue] & 1) == 0)
  {
    uint64_t v14 = [v13 colorWithAlphaComponent:0.4];

    v13 = (void *)v14;
  }
  v15 = [v11 _flatImageWithColor:v13];

  return v15;
}

@end