@interface ICQUsageDetailController
+ (BOOL)hasMediaForGroups:(id)a3;
+ (float)totalSizeForGroups:(id)a3;
+ (id)mediaGroups;
+ (id)mpKeyTranslations;
+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)hasMedia;
- (BOOL)isAppController;
- (BOOL)needsToShowToolbarInPrefsAppRoot;
- (BOOL)removeMediaEntry:(id)a3 inSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (BOOL)updateSizesAfterDeletingMediaKind:(id)a3 deletedSection:(BOOL)a4 shouldPop:(BOOL)a5;
- (ICQUsageStorageController)storageController;
- (NSDictionary)mediaCache;
- (id)copyMediaSpecifiers;
- (id)documentsAndDataSpecifiers;
- (id)dynamicSize:(id)a3;
- (id)size:(id)a3;
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)confirmAppDeletion;
- (void)deleteApp;
- (void)loadView;
- (void)setStorageController:(id)a3;
- (void)showMore:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ICQUsageDetailController

+ (id)mediaGroups
{
  return 0;
}

+ (id)mpKeyTranslations
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"name";
  uint64_t v2 = *MEMORY[0x263F11390];
  v7[0] = @"audiopodcasts";
  v7[1] = @"videopodcasts";
  v8[0] = v2;
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x263F11220];
  v7[2] = @"audiocourses";
  v7[3] = @"videocourses";
  v8[2] = v3;
  v8[3] = v3;
  v7[4] = @"audiobooks";
  v8[4] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  v10[0] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v5;
}

+ (float)totalSizeForGroups:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[ICQUsageStorageMonitor sharedMonitor];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    float v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = objc_msgSend(v4, "mediaCollectionForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v11 totalSize];
        float v9 = v9 + v12;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    float v9 = 0.0;
  }

  return v9;
}

+ (BOOL)hasMediaForGroups:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = +[ICQUsageStorageMonitor sharedMonitor];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          float v9 = objc_msgSend(v4, "mediaCollectionForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          v10 = [v9 items];
          uint64_t v11 = [v10 count];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

+ (void)setupSpecifier:(id)a3 forMediaGroups:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  uint64_t v7 = [v16 propertyForKey:@"USAGE_APP"];
  +[ICQUsageDetailController totalSizeForGroups:v6];
  float v9 = v8;
  v10 = NSNumber;
  [v7 totalSize];
  *(float *)&double v12 = v9 + v11;
  long long v13 = [v10 numberWithFloat:v12];
  [v16 setProperty:v13 forKey:kTotalSizeProperty];

  if (v7)
  {
    uint64_t v14 = 2;
  }
  else
  {
    [a1 totalSizeForGroups:v6];
    if (v15 <= 0.0) {
      uint64_t v14 = 4;
    }
    else {
      uint64_t v14 = 2;
    }
  }
  [v16 setCellType:v14];
}

- (BOOL)hasMedia
{
  uint64_t v2 = [(id)objc_opt_class() mediaGroups];
  char v3 = [(id)objc_opt_class() hasMediaForGroups:v2];

  return v3;
}

- (BOOL)isAppController
{
  uint64_t v2 = [(ICQUsageDetailController *)self specifier];
  char v3 = [v2 propertyForKey:@"USAGE_APP"];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)loadView
{
  v15.receiver = self;
  v15.super_class = (Class)ICQUsageDetailController;
  [(ICQUsageDetailController *)&v15 loadView];
  char v3 = [(ICQUsageDetailController *)self table];
  if ([(ICQUsageDetailController *)self isAppController])
  {
    BOOL v4 = [ICQUsageDetailHeader alloc];
    +[ICQUsageDetailHeader usageDetailHeaderHeight];
    id v6 = -[ICQUsageDetailHeader initWithFrame:](v4, "initWithFrame:", 0.0, 0.0, 0.0, v5);
    [(ICQUsageDetailHeader *)v6 setLabelTextAndIconWithSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
    [v3 setTableHeaderView:v6];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    float v8 = [v7 localizedStringForKey:@"INFO" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    [(ICQUsageDetailController *)self setTitle:v8];

    float v9 = [(ICQUsageDetailController *)self navigationItem];
    v10 = [v9 rightBarButtonItem];
    [v10 setEnabled:0];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F82E00]);
    if (PSIsiPad()) {
      double v12 = 20.0;
    }
    else {
      double v12 = 10.0;
    }
    id v6 = (ICQUsageDetailHeader *)objc_msgSend(v11, "initWithFrame:", 0.0, 0.0, 0.0, v12);
    [v3 setTableHeaderView:v6];
  }

  if (![(ICQUsageDetailController *)self hasMedia]) {
    [(PSEditableListController *)self setEditingButtonHidden:1 animated:0];
  }
  long long v13 = +[ICQUsageStorageMonitor sharedMonitor];
  uint64_t v14 = [v13 footerItems];
  [(ICQUsageDetailController *)self setToolbarItems:v14 animated:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ICQUsageDetailController;
  [(ICQUsageDetailController *)&v4 viewDidDisappear:a3];
  if ([(ICQUsageDetailController *)self isMovingFromParentViewController])[(ICQUsageDetailController *)self setStorageController:0]; {
}
  }

- (BOOL)needsToShowToolbarInPrefsAppRoot
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (void)showMore:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  [(ICQUsageDetailController *)self getGroup:&v12 row:0 ofSpecifier:v4];
  media = self->_media;
  id v6 = [v4 propertyForKey:@"mediaKind"];
  uint64_t v7 = [(NSMutableDictionary *)media objectForKey:v6];

  float v8 = [v7 objectForKey:@"usageGroupSpecifiers"];
  unint64_t v9 = [v8 count];
  v10 = 0;
  if (v9 >= 7)
  {
    v10 = objc_msgSend(v8, "subarrayWithRange:", 6, v9 - 6);
  }
  id v11 = [NSNumber numberWithBool:1];
  [v7 setObject:v11 forKey:@"usageGroupShowAll"];

  [v7 removeObjectForKey:@"usageGroupShowAllSpecifier"];
  [(ICQUsageDetailController *)self beginUpdates];
  [(ICQUsageDetailController *)self removeSpecifier:v4];
  if (v10) {
    [(ICQUsageDetailController *)self insertContiguousSpecifiers:v10 atEndOfGroup:v12 animated:1];
  }
  [(ICQUsageDetailController *)self endUpdates];
}

- (BOOL)removeMediaEntry:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 propertyForKey:@"mediaKind"];
  float v8 = [(NSMutableDictionary *)self->_media objectForKey:v7];
  unint64_t v9 = [v8 objectForKey:@"usageGroupSpecifiers"];
  [(ICQUsageDetailController *)self beginUpdates];
  v10 = [v8 objectForKey:@"usageGroupShowAll"];
  char v11 = [v10 BOOLValue];

  if ((v11 & 1) == 0)
  {
    [v9 removeObject:v6];
    if ((unint64_t)[v9 count] > 6)
    {
      [(ICQUsageDetailController *)self removeSpecifier:v6 animated:1];
      long long v17 = [v9 objectAtIndex:5];
      uint64_t v18 = [v8 objectForKey:@"usageGroupShowAllSpecifier"];
      [(ICQUsageDetailController *)self insertSpecifier:v17 atIndex:[(ICQUsageDetailController *)self indexOfSpecifier:v18] animated:1];
    }
    else
    {
      uint64_t v12 = [NSNumber numberWithBool:1];
      [v8 setObject:v12 forKey:@"usageGroupShowAll"];

      long long v13 = [v8 objectForKey:@"usageGroupShowAllSpecifier"];
      [(ICQUsageDetailController *)self removeSpecifier:v13 animated:1];

      [(ICQUsageDetailController *)self removeSpecifier:v6 animated:1];
      [v8 removeObjectForKey:@"usageGroupShowAllSpecifier"];
      uint64_t v14 = [v9 objectAtIndex:5];
      [(ICQUsageDetailController *)self insertSpecifier:v14 atEndOfGroup:a4 animated:1];
    }
    goto LABEL_8;
  }
  if ((unint64_t)[v9 count] >= 3)
  {
    [(ICQUsageDetailController *)self removeSpecifier:v6 animated:1];
    [v9 removeObject:v6];
LABEL_8:
    id v16 = v9;
    goto LABEL_9;
  }
  [(ICQUsageDetailController *)self removeContiguousSpecifiers:v9 animated:1];
  [(NSMutableDictionary *)self->_media removeObjectForKey:v7];
  objc_super v15 = +[ICQUsageStorageMonitor sharedMonitor];
  [v15 removeMediaCollectionCacheForKey:v7];

  id v16 = 0;
LABEL_9:

  [(ICQUsageDetailController *)self endUpdates];
  return v16 == 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = [v6 row];
  uint64_t v8 = [v6 section];
  uint64_t v9 = [(ICQUsageDetailController *)self indexForIndexPath:v6];

  v10 = [(ICQUsageDetailController *)self specifierAtIndex:v9];
  char v11 = [v10 propertyForKey:@"mediaKind"];
  uint64_t v12 = [(NSMutableDictionary *)self->_media objectForKey:v11];
  long long v13 = +[ICQUsageStorageMonitor sharedMonitor];
  uint64_t v14 = [v13 mediaCollectionForKey:v11];
  BOOL v15 = [(ICQUsageDetailController *)self removeMediaEntry:v10 inSection:v8];
  id v16 = [v12 objectForKey:@"usageGroupMediaType"];
  int v17 = [v16 intValue];

  if (v17)
  {
    if (v17 != 1)
    {
      v22 = 0;
      goto LABEL_7;
    }
    uint64_t v18 = [v14 items];
    uint64_t v19 = [v18 objectAtIndex:v7];

    v27[0] = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  }
  else
  {
    v21 = [v14 items];
    uint64_t v19 = [v21 objectAtIndex:v7];

    uint64_t v20 = [v19 items];
  }
  v22 = (void *)v20;

LABEL_7:
  v23 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_264921C80;
  id v26 = v22;
  id v24 = v22;
  dispatch_async(v23, block);

  [v14 removeItemAtIndex:v7];
  [(ICQUsageDetailController *)self updateSizesAfterDeletingMediaKind:v11 deletedSection:v15 shouldPop:1];
}

void __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F11E40] defaultMediaLibrary];
  [v2 removeItems:*(void *)(a1 + 32)];

  char v3 = MEMORY[0x263EF83A0];
  dispatch_async(v3, &__block_literal_global_3);
}

void __75__ICQUsageDetailController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke_2()
{
  id v0 = +[ICQUsageStorageMonitor sharedMonitor];
  [v0 fetchSystemSizeStrings];
}

- (BOOL)updateSizesAfterDeletingMediaKind:(id)a3 deletedSection:(BOOL)a4 shouldPop:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if (!a4)
  {
    uint64_t v9 = [(NSMutableDictionary *)self->_media objectForKey:v8];
    v10 = [v9 objectForKey:@"usageGroupSpecifiers"];
    char v11 = +[ICQUsageStorageMonitor sharedMonitor];
    uint64_t v12 = [v11 mediaCollectionForKey:v8];

    long long v13 = [v10 objectAtIndex:0];
    [v12 totalSize];
    float v15 = v14;
    id v16 = objc_msgSend(NSNumber, "numberWithFloat:");
    [v13 setProperty:v16 forKey:@"SIZE"];

    int v17 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)v15 countStyle:2];
    uint64_t v18 = [v13 propertyForKey:*MEMORY[0x263F60128]];
    [v18 setSize:v17];
  }
  BOOL v19 = [(ICQUsageDetailController *)self isAppController];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = (int)*MEMORY[0x263F5FE98];
  uint64_t v22 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v21);
  v23 = [(id)objc_opt_class() mediaGroups];
  [v20 setupSpecifier:v22 forMediaGroups:v23];

  if (!v19 && ![(NSMutableDictionary *)self->_media count]) {
    [*(id *)((char *)&self->super.super.super.super.super.super.isa + v21) setCellType:4];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageController);
  if (!WeakRetained) {
    -[ICQUsageDetailController updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:]();
  }

  id v25 = objc_loadWeakRetained((id *)&self->_storageController);
  [v25 sizeChangedForSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + v21)];

  if (v19 || !v5 || [(NSMutableDictionary *)self->_media count])
  {
    BOOL v26 = 0;
  }
  else
  {
    v28 = [(ICQUsageDetailController *)self navigationController];
    v29 = [(ICQUsageDetailController *)self parentController];
    BOOL v26 = 1;
    id v30 = (id)[v28 popToViewController:v29 animated:1];
  }
  return v26;
}

- (id)size:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 propertyForKey:@"mediaKind"];
  uint64_t v19 = 0;
  [(ICQUsageDetailController *)self getGroup:0 row:&v19 ofSpecifier:v4];

  id v6 = +[ICQUsageStorageMonitor sharedMonitor];
  uint64_t v7 = [(NSMutableDictionary *)self->_media objectForKey:v5];
  id v8 = [v7 objectForKey:@"usageGroupMediaType"];
  int v9 = [v8 intValue];

  if (v9)
  {
    float v10 = 0.0;
    if (v9 != 1) {
      goto LABEL_6;
    }
    char v11 = [v6 mediaCollectionForKey:v5];
    uint64_t v12 = [v11 items];
    long long v13 = [v12 objectAtIndex:v19];
    float v14 = [v13 valueForProperty:*MEMORY[0x263F11298]];
    [v14 floatValue];
    float v10 = v15;
  }
  else
  {
    char v11 = [v6 mediaCollectionForKey:v5];
    uint64_t v12 = [v11 itemSizes];
    long long v13 = [v12 objectAtIndex:v19];
    [v13 floatValue];
    float v10 = v16;
  }

LABEL_6:
  int v17 = [MEMORY[0x263F086F0] stringFromByteCount:(uint64_t)v10 countStyle:2];

  return v17;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5 = [(ICQUsageDetailController *)self indexForIndexPath:a4];
  id v6 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]) objectAtIndex:v5];
  unint64_t v7 = *(void *)&v6[*MEMORY[0x263F5FE10]] - 1;
  id v8 = [v6 identifier];
  int v9 = [v8 isEqualToString:@"DOCS_AND_DATA"];

  unsigned int v10 = (v9 | [MEMORY[0x263F82438] isRunningInStoreDemoMode]) ^ 1;
  if (v7 < 4) {
    int64_t v11 = v10;
  }
  else {
    int64_t v11 = 0;
  }

  return v11;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  id v6 = a4;
  if ([(ICQUsageDetailController *)self tableView:a3 editingStyleForRowAtIndexPath:v6])
  {
    char v7 = 1;
  }
  else
  {
    id v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "objectAtIndex:", -[ICQUsageDetailController indexForIndexPath:](self, "indexForIndexPath:", v6));
    int v9 = [v8 propertyForKey:*MEMORY[0x263F60138]];
    char v7 = [v9 isEqualToString:@"SHOW_ALL"];
  }
  return v7;
}

- (id)dynamicSize:(id)a3
{
  uint64_t v4 = (int)*MEMORY[0x263F5FE98];
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) propertyForKey:@"USAGE_APP"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) propertyForKey:@"USAGE_APP"];
    id v8 = (void *)MEMORY[0x263F086F0];
    [v7 dataSize];
    unsigned int v10 = [v8 stringFromByteCount:(uint64_t)v9 countStyle:2];
  }
  else
  {
    unsigned int v10 = &stru_26DFF2C90;
  }
  return v10;
}

- (void)confirmAppDeletion
{
  uint64_t v21 = (char *)objc_alloc_init(MEMORY[0x263F5FB40]);
  uint64_t v19 = NSDictionary;
  uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  float v16 = [v20 localizedStringForKey:@"DELETE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  uint64_t v15 = *MEMORY[0x263F60008];
  int v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v3 = [v17 localizedStringForKey:@"CANCEL" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  uint64_t v14 = *MEMORY[0x263F5FFF8];
  uint64_t v4 = NSString;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"DELETE_APP_EXPLANATION" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  char v7 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) name];
  id v8 = objc_msgSend(v4, "stringWithFormat:", v6, v7);
  uint64_t v9 = *MEMORY[0x263F60010];
  unsigned int v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v11 = [v10 localizedStringForKey:@"DELETE_APP" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  uint64_t v12 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v16, v15, v3, v14, v8, v9, v11, *MEMORY[0x263F60018], 0);
  [v21 setupWithDictionary:v12];

  long long v13 = [NSNumber numberWithBool:1];
  [v21 setProperty:v13 forKey:*MEMORY[0x263F60000]];

  objc_storeWeak((id *)&v21[*MEMORY[0x263F5FE40]], self);
  [v21 setConfirmationAction:sel_deleteApp];
  [(ICQUsageDetailController *)self showConfirmationViewForSpecifier:v21];
}

- (void)deleteApp
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[ICQUsageDetailController deleteApp]";
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "%@-%s: This class should no longer be used.", (uint8_t *)&v2, 0x16u);
}

- (id)documentsAndDataSpecifiers
{
  uint64_t v3 = [(ICQUsageDetailController *)self navigationItem];
  __int16 v4 = [v3 rightBarButtonItem];
  [v4 setEnabled:0];

  uint64_t v5 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  [v5 addObject:v6];

  char v7 = (void *)MEMORY[0x263F5FC40];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"DOCUMENTS_AND_DATA" value:&stru_26DFF2C90 table:@"Usage Statistics"];
  unsigned int v10 = [v7 preferenceSpecifierNamed:v9 target:self set:0 get:sel_dynamicSize_ detail:0 cell:4 edit:0];

  [v10 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v10 setIdentifier:@"DOCS_AND_DATA"];
  [v5 addObject:v10];

  return v5;
}

- (id)copyMediaSpecifiers
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v74 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!self->_media)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:7];
    media = self->_media;
    self->_media = v3;
  }
  uint64_t v5 = +[ICQUsageStorageMonitor sharedMonitor];
  uint64_t v6 = [(id)objc_opt_class() mediaGroups];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __47__ICQUsageDetailController_copyMediaSpecifiers__block_invoke;
  v97[3] = &unk_264922368;
  id v7 = v5;
  id v98 = v7;
  id v8 = [v6 sortedArrayUsingComparator:v97];

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  obuint64_t j = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v94;
    uint64_t v68 = *MEMORY[0x263F11298];
    uint64_t v77 = *MEMORY[0x263F11400];
    uint64_t v82 = *MEMORY[0x263F5FFE0];
    uint64_t v81 = *MEMORY[0x263F601A8];
    uint64_t v67 = *MEMORY[0x263F60118];
    uint64_t v66 = *MEMORY[0x263F60138];
    uint64_t v69 = *(void *)v94;
    id v70 = v7;
    do
    {
      uint64_t v12 = 0;
      uint64_t v71 = v10;
      do
      {
        if (*(void *)v94 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v76 = v12;
        uint64_t v13 = *(void *)(*((void *)&v93 + 1) + 8 * v12);
        v78 = [v7 mediaCollectionForKey:v13];
        uint64_t v14 = [v78 items];
        uint64_t v15 = [v14 count];

        if (v15)
        {
          float v16 = [(NSMutableDictionary *)self->_media objectForKey:v13];
          if (v16)
          {
            int v17 = v16;
            uint64_t v18 = [v16 objectForKey:@"usageGroupSpecifiers"];
            uint64_t v19 = [v17 objectForKey:@"usageGroupShowAll"];
            int v20 = [v19 BOOLValue];

            if (v20)
            {
              [v74 addObjectsFromArray:v18];
            }
            else
            {
              v39 = objc_msgSend(v18, "subarrayWithRange:", 0, 6);
              [v74 addObjectsFromArray:v39];

              v40 = [v17 objectForKey:@"usageGroupShowAllSpecifier"];
              [v74 addObject:v40];
            }
          }
          else
          {
            uint64_t v84 = v13;
            [v78 sortItemsByMediaKey:v68];
            uint64_t v21 = [v78 items];
            uint64_t v22 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
            uint64_t v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v21, "count") + 1);
            [v22 setObject:v23 forKey:@"usageGroupSpecifiers"];
            int v24 = [v78 isGrouped];
            char v25 = v24;
            BOOL v26 = [NSNumber numberWithUnsignedInt:v24 ^ 1u];
            v72 = v22;
            [v22 setObject:v26 forKey:@"usageGroupMediaType"];

            v75 = v21;
            v83 = (void *)v23;
            if (v25)
            {
              long long v87 = 0uLL;
              long long v88 = 0uLL;
              long long v85 = 0uLL;
              long long v86 = 0uLL;
              id v79 = v21;
              uint64_t v27 = [v79 countByEnumeratingWithState:&v85 objects:v99 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v80 = *(void *)v86;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    id v30 = self;
                    if (*(void *)v86 != v80) {
                      objc_enumerationMutation(v79);
                    }
                    v31 = [*(id *)(*((void *)&v85 + 1) + 8 * i) representativeItem];
                    v32 = +[ICQUsageDetailController mpKeyTranslations];
                    v33 = [v32 objectForKey:@"name"];
                    v34 = [v33 objectForKey:v84];
                    v35 = [v31 valueForProperty:v34];

                    self = v30;
                    v36 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v35 target:v30 set:0 get:sel_size_ detail:0 cell:4 edit:0];
                    [v36 setProperty:objc_opt_class() forKey:v82];
                    v37 = [v31 artworkCatalog];
                    [v36 setProperty:v37 forKey:@"ICON_LOADER"];

                    v38 = [NSNumber numberWithBool:1];
                    [v36 setProperty:v38 forKey:v81];

                    [v36 setProperty:v84 forKey:@"mediaKind"];
                    [v83 addObject:v36];
                  }
                  uint64_t v28 = [v79 countByEnumeratingWithState:&v85 objects:v99 count:16];
                }
                while (v28);
              }
            }
            else
            {
              long long v91 = 0uLL;
              long long v92 = 0uLL;
              long long v89 = 0uLL;
              long long v90 = 0uLL;
              id v41 = v21;
              uint64_t v42 = [v41 countByEnumeratingWithState:&v89 objects:v100 count:16];
              if (v42)
              {
                uint64_t v43 = v42;
                uint64_t v44 = *(void *)v90;
                do
                {
                  for (uint64_t j = 0; j != v43; ++j)
                  {
                    if (*(void *)v90 != v44) {
                      objc_enumerationMutation(v41);
                    }
                    v46 = *(void **)(*((void *)&v89 + 1) + 8 * j);
                    v47 = [v46 valueForProperty:v77];
                    v48 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v47 target:self set:0 get:sel_size_ detail:0 cell:4 edit:0];
                    [v48 setProperty:objc_opt_class() forKey:v82];
                    v49 = [v46 artworkCatalog];
                    [v48 setProperty:v49 forKey:@"ICON_LOADER"];

                    v50 = [NSNumber numberWithBool:1];
                    [v48 setProperty:v50 forKey:v81];

                    [v48 setProperty:v84 forKey:@"mediaKind"];
                    [v83 addObject:v48];
                  }
                  uint64_t v43 = [v41 countByEnumeratingWithState:&v89 objects:v100 count:16];
                }
                while (v43);
              }
            }

            v51 = (void *)MEMORY[0x263F5FC40];
            v52 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v53 = [v52 localizedStringForKey:v84 value:&stru_26DFF2C90 table:@"Usage Statistics"];
            v54 = [v51 preferenceSpecifierNamed:v53 target:0 set:0 get:0 detail:0 cell:0 edit:0];

            uint64_t v55 = v84;
            [v54 setProperty:@"PSUsageSizeHeader" forKey:v67];
            v56 = NSNumber;
            [v78 totalSize];
            v57 = objc_msgSend(v56, "numberWithFloat:");
            [v54 setProperty:v57 forKey:@"SIZE"];

            [v54 setProperty:v84 forKey:@"mediaKind"];
            [v83 insertObject:v54 atIndex:0];
            if ((unint64_t)([v83 count] - 7) > 0xFFFFFFFFFFFFFFF9)
            {
              v64 = [NSNumber numberWithBool:1];
              int v17 = v72;
              [v72 setObject:v64 forKey:@"usageGroupShowAll"];

              [v74 addObjectsFromArray:v83];
            }
            else
            {
              v58 = objc_msgSend(v83, "subarrayWithRange:", 0, 6);
              [v74 addObjectsFromArray:v58];

              v59 = (void *)MEMORY[0x263F5FC40];
              v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v61 = [v60 localizedStringForKey:@"SHOW_ALL" value:&stru_26DFF2C90 table:@"Usage Statistics"];
              v62 = [v59 preferenceSpecifierNamed:v61 target:self set:0 get:0 detail:0 cell:13 edit:0];

              [v62 setProperty:@"SHOW_ALL" forKey:v66];
              [v62 setProperty:v84 forKey:@"mediaKind"];
              [v62 setProperty:objc_opt_class() forKey:v82];
              [v62 setButtonAction:sel_showMore_];
              [v74 addObject:v62];
              v63 = [NSNumber numberWithBool:0];
              int v17 = v72;
              [v72 setObject:v63 forKey:@"usageGroupShowAll"];

              [v72 setObject:v62 forKey:@"usageGroupShowAllSpecifier"];
              uint64_t v55 = v84;
            }
            id v7 = v70;
            uint64_t v10 = v71;
            uint64_t v11 = v69;
            [(NSMutableDictionary *)self->_media setObject:v17 forKey:v55];

            uint64_t v18 = v75;
          }
        }
        uint64_t v12 = v76 + 1;
      }
      while (v76 + 1 != v10);
      uint64_t v10 = [obj countByEnumeratingWithState:&v93 objects:v101 count:16];
    }
    while (v10);
  }

  return v74;
}

uint64_t __47__ICQUsageDetailController_copyMediaSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 mediaCollectionForKey:a2];
  id v8 = [*(id *)(a1 + 32) mediaCollectionForKey:v6];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    uint64_t v11 = !v10;
    if (v7) {
      BOOL v12 = v8 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12) {
      uint64_t v17 = -1;
    }
    else {
      uint64_t v17 = v11;
    }
  }
  else
  {
    uint64_t v13 = NSNumber;
    [v8 totalSize];
    uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
    uint64_t v15 = NSNumber;
    [v7 totalSize];
    float v16 = objc_msgSend(v15, "numberWithFloat:");
    uint64_t v17 = [v14 compare:v16];
  }
  return v17;
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  __int16 v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    if ([(ICQUsageDetailController *)self hasMedia]) {
      id v5 = [(ICQUsageDetailController *)self copyMediaSpecifiers];
    }
    else {
      id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v6 = v5;
    if ([(ICQUsageDetailController *)self isAppController])
    {
      id v7 = [(ICQUsageDetailController *)self documentsAndDataSpecifiers];
      [v6 addObjectsFromArray:v7];
    }
    if (![(ICQUsageDetailController *)self isAppController]) {
      goto LABEL_13;
    }
    id v8 = [MEMORY[0x263F53C50] sharedConnection];
    if ([v8 effectiveRestrictedBoolValueForSetting:*MEMORY[0x263F53758]] != 2)
    {
      char v9 = [MEMORY[0x263F82438] isRunningInStoreDemoMode];

      if (v9)
      {
LABEL_13:
        uint64_t v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v6;

        __int16 v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
        goto LABEL_14;
      }
      id v8 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) propertyForKey:@"USAGE_APP"];
      if (([v8 isSystemApp] & 1) == 0)
      {
        BOOL v10 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
        [v6 addObject:v10];

        uint64_t v11 = (void *)MEMORY[0x263F5FC40];
        BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v13 = [v12 localizedStringForKey:@"DELETE_APP" value:&stru_26DFF2C90 table:@"Usage Statistics"];
        uint64_t v14 = [v11 deleteButtonSpecifierWithName:v13 target:self action:sel_confirmAppDeletion];
        [v6 addObject:v14];
      }
    }

    goto LABEL_13;
  }
LABEL_14:
  return v4;
}

- (NSDictionary)mediaCache
{
  return &self->_media->super;
}

- (ICQUsageStorageController)storageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageController);
  return (ICQUsageStorageController *)WeakRetained;
}

- (void)setStorageController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageController);
  objc_storeStrong((id *)&self->_documentsGroup, 0);
  objc_storeStrong((id *)&self->_media, 0);
}

- (void)updateSizesAfterDeletingMediaKind:deletedSection:shouldPop:.cold.1()
{
}

@end