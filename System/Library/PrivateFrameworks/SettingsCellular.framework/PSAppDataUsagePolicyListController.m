@interface PSAppDataUsagePolicyListController
- (PSAppDataUsagePolicyListController)init;
- (id)specifiers;
- (void)_adjustTitle;
- (void)setSpecifier:(id)a3;
@end

@implementation PSAppDataUsagePolicyListController

- (PSAppDataUsagePolicyListController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSAppDataUsagePolicyListController;
  v2 = [(PSAppDataUsagePolicyListController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PSAppDataUsagePolicyListController *)v2 _adjustTitle];
  }
  return v3;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v17.receiver = self;
    v17.super_class = (Class)PSAppDataUsagePolicyListController;
    id v5 = [(PSListItemsController *)&v17 specifiers];
    uint64_t v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v3) firstObject];
    v7 = (void *)v6;
    if (v6 && !*(void *)(v6 + (int)*MEMORY[0x263F5FE10]))
    {
      v8 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) displayName];
      if ([v8 length])
      {
        v9 = NSString;
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v11 = SFLocalizableWAPIStringKeyForKey();
        v12 = [v10 localizedStringForKey:v11 value:&stru_26D7A1F58 table:@"WirelessData"];
        v13 = objc_msgSend(v9, "stringWithFormat:", v12, v8);
      }
      else
      {
        v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v11 = SFLocalizableWAPIStringKeyForKey();
        v13 = [v10 localizedStringForKey:v11 value:&stru_26D7A1F58 table:@"WirelessData"];
      }

      [v7 setName:v13];
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  v14 = (void *)[v4 mutableCopy];
  +[SettingsCellularSharedUtils logSpecifiers:v14 origin:@"[PSAppDataUsagePolicyListController specifiers] end"];

  v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  return v15;
}

- (void)setSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSAppDataUsagePolicyListController;
  [(PSAppDataUsagePolicyListController *)&v4 setSpecifier:a3];
  [(PSAppDataUsagePolicyListController *)self _adjustTitle];
}

- (void)_adjustTitle
{
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]);
  if (v3)
  {
    id v4 = [v3 displayName];
    if ([v4 length]) {
      [(PSAppDataUsagePolicyListController *)self setTitle:v4];
    }
  }
}

@end