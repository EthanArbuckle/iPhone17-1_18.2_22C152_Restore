@interface ICQUsagePhotosController
+ (id)mediaGroups;
- (id)sizeForSpecifier:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
@end

@implementation ICQUsagePhotosController

+ (id)mediaGroups
{
  v4[4] = *MEMORY[0x263EF8340];
  v4[0] = @"photolibrary";
  v4[1] = @"syncedfromitunes";
  v4[2] = @"myphotostream";
  v4[3] = @"sharedphotostream";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];
  return v2;
}

- (id)sizeForSpecifier:(id)a3
{
  id v3 = a3;
  v4 = +[ICQUsageStorageMonitor sharedMonitor];
  v5 = [v3 identifier];

  v6 = [v4 mediaCollectionForKey:v5];

  v7 = (void *)MEMORY[0x263F086F0];
  [v6 totalSize];
  v9 = [v7 stringFromByteCount:(uint64_t)v8 countStyle:2];

  return v9;
}

- (id)specifiers
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v26 = (int)*MEMORY[0x263F5FDB8];
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    v5 = (void *)MEMORY[0x263F5FC40];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"PHOTOS" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    float v8 = [v5 preferenceSpecifierNamed:v7 target:0 set:0 get:0 detail:0 cell:0 edit:0];

    [v8 setProperty:@"PSUsageSizeHeader" forKey:*MEMORY[0x263F60118]];
    v9 = [(ICQUsagePhotosController *)self specifier];
    v10 = [v9 propertyForKey:@"TOTAL_SIZE"];
    [v8 setProperty:v10 forKey:@"SIZE"];

    v29 = v4;
    v25 = v8;
    [v4 insertObject:v8 atIndex:0];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v30 = self;
    id obj = [(id)objc_opt_class() mediaGroups];
    uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      uint64_t v28 = *MEMORY[0x263F60138];
      uint64_t v27 = *MEMORY[0x263F5FFE0];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8 * v14);
          v16 = +[ICQUsageStorageMonitor sharedMonitor];
          v17 = [v16 mediaCollectionForKey:v15];

          [v17 totalSize];
          if (v18 > 0.0)
          {
            v19 = (void *)MEMORY[0x263F5FC40];
            v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v21 = [v20 localizedStringForKey:v15 value:&stru_26DFF2C90 table:@"Usage Statistics"];
            v22 = [v19 preferenceSpecifierNamed:v21 target:v30 set:0 get:sel_sizeForSpecifier_ detail:0 cell:4 edit:0];

            [v22 setProperty:v15 forKey:v28];
            [v22 setProperty:objc_opt_class() forKey:v27];
            [v29 addObject:v22];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }

    v23 = *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26);
    *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26) = (Class)v29;

    id v3 = *(Class *)((char *)&v30->super.super.super.super.super.super.super.isa + v26);
  }
  return v3;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

@end