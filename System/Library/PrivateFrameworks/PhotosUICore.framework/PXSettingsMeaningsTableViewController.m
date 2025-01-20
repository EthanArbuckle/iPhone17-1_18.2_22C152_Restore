@interface PXSettingsMeaningsTableViewController
- (NSArray)meaningLabels;
- (NSDictionary)meaningDataContainerByMeaningLabels;
- (PXSettingsMeaningsTableViewController)init;
- (id)_meaningDataContainerByMeaningLabels;
- (id)_momentIdentifiersByMeaningLabel;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setMeaningDataContainerByMeaningLabels:(id)a3;
- (void)setMeaningLabels:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PXSettingsMeaningsTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meaningDataContainerByMeaningLabels, 0);
  objc_storeStrong((id *)&self->_meaningLabels, 0);
}

- (void)setMeaningDataContainerByMeaningLabels:(id)a3
{
}

- (NSDictionary)meaningDataContainerByMeaningLabels
{
  return self->_meaningDataContainerByMeaningLabels;
}

- (void)setMeaningLabels:(id)a3
{
}

- (NSArray)meaningLabels
{
  return self->_meaningLabels;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PXSettingsMeaningsTableViewCellId" forIndexPath:v6];
  v8 = [(PXSettingsMeaningsTableViewController *)self meaningLabels];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndexedSubscript:v9];

  v11 = [v7 textLabel];
  [v11 setText:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PXSettingsMeaningsTableViewController *)self meaningLabels];
  uint64_t v7 = [v5 row];

  id v15 = [v6 objectAtIndexedSubscript:v7];

  v8 = [(PXSettingsMeaningsTableViewController *)self meaningDataContainerByMeaningLabels];
  uint64_t v9 = [v8 objectForKeyedSubscript:v15];

  v10 = [v9 assetCollection];
  v11 = [v9 curatedAssets];
  v12 = PXPhotosViewConfigurationForAssetCollectionWithExistingAssetsFetchResult(v10, v11, 0, 0, 1);

  v13 = [[PXPhotosUIViewController alloc] initWithConfiguration:v12];
  v14 = [(PXSettingsMeaningsTableViewController *)self navigationController];
  [v14 pushViewController:v13 animated:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PXSettingsMeaningsTableViewController *)self meaningLabels];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)_momentIdentifiersByMeaningLabel
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v4 = (void *)MEMORY[0x1E4F1CB10];
  int64_t v5 = NSTemporaryDirectory();
  id v6 = [v5 stringByAppendingPathComponent:@"fingerprint.csv"];
  uint64_t v7 = [v4 fileURLWithPath:v6];
  v8 = [v3 stringWithContentsOfURL:v7 encoding:4 error:0];

  if (v8)
  {
    v38 = self;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v37 = v8;
    v10 = [v8 componentsSeparatedByString:@"\n"];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v42 = 0;
      char v13 = 1;
      uint64_t v14 = *(void *)v47;
      id v15 = @"Meaning_";
      uint64_t v39 = *(void *)v47;
      v40 = v10;
      do
      {
        uint64_t v16 = 0;
        uint64_t v41 = v12;
        do
        {
          if (*(void *)v47 != v14) {
            objc_enumerationMutation(v10);
          }
          v17 = [*(id *)(*((void *)&v46 + 1) + 8 * v16) componentsSeparatedByString:@","];
          v18 = objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
          v44 = v17;
          v45 = [v17 firstObject];
          if (([v45 isEqualToString:&stru_1F00B0030] & 1) == 0)
          {
            if (v13)
            {
              id v19 = v18;
              v20 = v42;
              id v42 = v19;
            }
            else
            {
              id v43 = v45;
              if ([v18 count])
              {
                unint64_t v21 = 0;
                v22 = v42;
                do
                {
                  v23 = [v22 objectAtIndexedSubscript:v21];
                  if ([v23 hasPrefix:v15])
                  {
                    v24 = v15;
                    v25 = [v23 stringByReplacingOccurrencesOfString:v15 withString:&stru_1F00B0030];
                    v26 = [v18 objectAtIndexedSubscript:v21];
                    int v27 = [v26 BOOLValue];

                    if (v27)
                    {
                      v28 = [v9 valueForKey:v25];
                      v29 = v28;
                      if (v28)
                      {
                        v30 = [v28 setByAddingObject:v43];
                        [v9 setValue:v30 forKey:v25];
                      }
                      else
                      {
                        v31 = v9;
                        v32 = (void *)MEMORY[0x1E4F1CAD0];
                        id v50 = v43;
                        v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                        v33 = [v32 setWithArray:v30];
                        [v31 setValue:v33 forKey:v25];

                        id v9 = v31;
                        v22 = v42;
                      }
                    }
                    id v15 = v24;
                  }

                  ++v21;
                }
                while (v21 < [v18 count]);
                uint64_t v14 = v39;
                v10 = v40;
                uint64_t v12 = v41;
              }
              v20 = v43;
            }

            char v13 = 0;
          }

          ++v16;
        }
        while (v16 != v12);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v12);
    }
    else
    {
      id v42 = 0;
    }
    uint64_t v34 = [v9 allKeys];
    meaningLabels = v38->_meaningLabels;
    v38->_meaningLabels = (NSArray *)v34;

    v8 = v37;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_meaningDataContainerByMeaningLabels
{
  v2 = [(PXSettingsMeaningsTableViewController *)self _momentIdentifiersByMeaningLabel];
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 librarySpecificFetchOptions];

  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__72961;
  id v15 = __Block_byref_object_dispose__72962;
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__PXSettingsMeaningsTableViewController__meaningDataContainerByMeaningLabels__block_invoke;
  v8[3] = &unk_1E5DB6550;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [v2 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __77__PXSettingsMeaningsTableViewController__meaningDataContainerByMeaningLabels__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (void *)MEMORY[0x1E4F38EE8];
  id v6 = a2;
  uint64_t v7 = [a3 allObjects];
  id v11 = [v5 fetchAssetCollectionsWithLocalIdentifiers:v7 options:*(void *)(a1 + 32)];

  v8 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollections:v11 options:*(void *)(a1 + 32)];
  id v9 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssetFetchResult:v8 title:v6];
  v10 = [[PXSettingsMeaningMomentDataContainer alloc] initWithCuratedAssets:v8 assetCollection:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v10 forKey:v6];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PXSettingsMeaningsTableViewController;
  [(PXSettingsMeaningsTableViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(PXSettingsMeaningsTableViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(PXSettingsMeaningsTableViewController *)self tableView];
  [v5 setAllowsMultipleSelection:0];

  id v6 = [(PXSettingsMeaningsTableViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXSettingsMeaningsTableViewCellId"];
}

- (PXSettingsMeaningsTableViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXSettingsMeaningsTableViewController;
  v2 = [(PXSettingsMeaningsTableViewController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(PXSettingsMeaningsTableViewController *)v2 _meaningDataContainerByMeaningLabels];
    [(PXSettingsMeaningsTableViewController *)v3 setMeaningDataContainerByMeaningLabels:v4];

    id v5 = [(PXSettingsMeaningsTableViewController *)v3 meaningDataContainerByMeaningLabels];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      objc_super v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Meaning Scores Not Found" message:@"Please make sure to run the fingerprint generation before. " preferredStyle:1];
      v8 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:&__block_literal_global_72977];
      [v7 addAction:v8];
      [(PXSettingsMeaningsTableViewController *)v3 presentViewController:v7 animated:1 completion:0];
    }
  }
  return v3;
}

@end