@interface STStorageActionTip
- (Class)detailControllerClass;
- (NSArray)significantItems;
- (STStorageActionTip)init;
- (void)setDetailControllerClass:(Class)a3;
- (void)setSignificantItems:(id)a3;
@end

@implementation STStorageActionTip

- (STStorageActionTip)init
{
  v5.receiver = self;
  v5.super_class = (Class)STStorageActionTip;
  v2 = [(STStorageTip *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:&stru_26C91D0A0 target:v2 set:0 get:0 detail:0 cell:2 edit:0];
    [v3 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(STStorageTip *)v2 setSpecifier:v3];
    [(STStorageTip *)v2 setProperty:@"stActionTip" forKey:@"stTipKind"];
  }
  return v2;
}

- (void)setDetailControllerClass:(Class)a3
{
  id v4 = [(STStorageTip *)self specifier];
  [v4 setDetailControllerClass:a3];
}

- (Class)detailControllerClass
{
  v2 = [(STStorageTip *)self specifier];
  v3 = [v2 detailControllerClass];

  return (Class)v3;
}

- (NSArray)significantItems
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignificantItems:(id)a3
{
}

- (void).cxx_destruct
{
}

@end