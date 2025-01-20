@interface PUCurationClassificationSignalBrowserDebugViewController
- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6;
- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)signalIdentifiersForSection:(int64_t)a3;
- (id)signalNameForUnknownSignalIdentifier:(int)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_fetchSignals;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUCurationClassificationSignalBrowserDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionViewController, 0);
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUIDBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_countsBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalInfoBySignalIdentifier, 0);
  objc_storeStrong((id *)&self->_signalIdentifiersBySectionName, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v92 = [a3 dequeueReusableCellWithIdentifier:@"ClassificationSignalBrowserDebugTableViewCellIdentifier"];
  if (!v92)
  {
    v7 = [[PUCurationClassificationSignalBrowserDebugViewCell alloc] initWithStyle:3 reuseIdentifier:@"ClassificationSignalBrowserDebugTableViewCellIdentifier"];
    v8 = [(PUCurationClassificationSignalBrowserDebugViewCell *)v7 detailTextLabel];
    [v8 setNumberOfLines:1];

    id v92 = v7;
    v9 = [(PUCurationClassificationSignalBrowserDebugViewCell *)v7 detailTextLabel];
    [v9 setLineBreakMode:0];
  }
  v10 = -[PUCurationClassificationSignalBrowserDebugViewController signalIdentifiersForSection:](self, "signalIdentifiersForSection:", [v6 section]);
  uint64_t v11 = [v6 item];

  v12 = [v10 objectAtIndexedSubscript:v11];

  v13 = [(NSDictionary *)self->_signalInfoBySignalIdentifier objectForKeyedSubscript:v12];
  v14 = [v13 objectForKeyedSubscript:@"name"];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    -[PUCurationClassificationSignalBrowserDebugViewController signalNameForUnknownSignalIdentifier:](self, "signalNameForUnknownSignalIdentifier:", [v12 intValue]);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v17 = v16;

  [v92 setSignalName:v17];
  v18 = [v13 objectForKeyedSubscript:@"operatingPoint"];
  [v18 doubleValue];
  double v20 = v19;

  v21 = [v13 objectForKeyedSubscript:@"highPrecisionOperatingPoint"];
  [v21 doubleValue];
  double v23 = v22;

  v24 = [v13 objectForKeyedSubscript:@"highRecallOperatingPoint"];
  [v24 doubleValue];
  double v26 = v25;

  v27 = [(NSDictionary *)self->_countsBySignalIdentifier objectForKeyedSubscript:v12];
  id v28 = objc_alloc(MEMORY[0x1E4F28E48]);
  v29 = objc_msgSend(NSString, "stringWithFormat:", @"%@ ("), v17;
  v30 = (void *)[v28 initWithString:v29];

  uint64_t v31 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" / "];
  v89 = v13;
  v90 = v12;
  v88 = v17;
  v91 = v27;
  if (v20 == v23 && v20 == v26)
  {
    v86 = (void *)v31;
    id v32 = objc_alloc(MEMORY[0x1E4F28B18]);
    v33 = NSString;
    v34 = [v27 objectAtIndexedSubscript:0];
    v35 = objc_msgSend(v33, "stringWithFormat:", @"%lu", objc_msgSend(v34, "unsignedLongValue"));
    uint64_t v36 = *MEMORY[0x1E4FB0700];
    if (v20 == 0.0)
    {
      unint64_t v37 = 0x1E4F28000uLL;
      uint64_t v97 = *MEMORY[0x1E4FB0700];
      v38 = [MEMORY[0x1E4FB1618] labelColor];
      v98 = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
      v40 = (void *)[v32 initWithString:v35 attributes:v39];
      [v30 appendAttributedString:v40];
      v41 = v86;
    }
    else
    {
      uint64_t v95 = *MEMORY[0x1E4FB0700];
      v73 = [MEMORY[0x1E4FB1618] labelColor];
      v96 = v73;
      v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
      v75 = (void *)[v32 initWithString:v35 attributes:v74];
      [v30 appendAttributedString:v75];

      [v30 appendAttributedString:v86];
      id v76 = objc_alloc(MEMORY[0x1E4F28B18]);
      v77 = NSString;
      unint64_t numberOfAssets = self->_numberOfAssets;
      v34 = [v91 objectAtIndexedSubscript:0];
      unint64_t v84 = numberOfAssets - [v34 unsignedLongValue];
      v79 = v77;
      v41 = v86;
      v35 = objc_msgSend(v79, "stringWithFormat:", @"%lu", v84);
      uint64_t v93 = v36;
      v38 = [MEMORY[0x1E4FB1618] redColor];
      v94 = v38;
      v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      v80 = v76;
      unint64_t v37 = 0x1E4F28000uLL;
      v40 = (void *)[v80 initWithString:v35 attributes:v39];
      [v30 appendAttributedString:v40];
    }
  }
  else
  {
    v42 = (void *)v31;
    id v43 = objc_alloc(MEMORY[0x1E4F28B18]);
    v44 = NSString;
    v45 = [v27 objectAtIndexedSubscript:0];
    v46 = objc_msgSend(v44, "stringWithFormat:", @"%lu", objc_msgSend(v45, "unsignedLongValue"));
    uint64_t v105 = *MEMORY[0x1E4FB0700];
    uint64_t v47 = v105;
    [MEMORY[0x1E4FB1618] greenColor];
    v87 = self;
    v49 = v48 = v27;
    v106[0] = v49;
    v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:&v105 count:1];
    v51 = (void *)[v43 initWithString:v46 attributes:v50];
    [v30 appendAttributedString:v51];

    [v30 appendAttributedString:v42];
    id v52 = objc_alloc(MEMORY[0x1E4F28B18]);
    v53 = NSString;
    v54 = [v48 objectAtIndexedSubscript:1];
    v55 = objc_msgSend(v53, "stringWithFormat:", @"%lu", objc_msgSend(v54, "unsignedLongValue"));
    uint64_t v85 = v47;
    uint64_t v103 = v47;
    v56 = [MEMORY[0x1E4FB1618] labelColor];
    v104 = v56;
    v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v58 = (void *)[v52 initWithString:v55 attributes:v57];
    [v30 appendAttributedString:v58];

    [v30 appendAttributedString:v42];
    id v59 = objc_alloc(MEMORY[0x1E4F28B18]);
    v60 = NSString;
    v61 = [v48 objectAtIndexedSubscript:2];
    v62 = objc_msgSend(v60, "stringWithFormat:", @"%lu", objc_msgSend(v61, "unsignedLongValue"));
    uint64_t v101 = v47;
    v63 = [MEMORY[0x1E4FB1618] yellowColor];
    v102 = v63;
    v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
    v65 = (void *)[v59 initWithString:v62 attributes:v64];
    [v30 appendAttributedString:v65];

    [v30 appendAttributedString:v42];
    id v66 = objc_alloc(MEMORY[0x1E4F28B18]);
    v67 = NSString;
    unint64_t v68 = v87->_numberOfAssets;
    v34 = [v48 objectAtIndexedSubscript:0];
    uint64_t v69 = [v34 unsignedLongValue];
    v35 = [v48 objectAtIndexedSubscript:1];
    uint64_t v70 = [v35 unsignedLongValue];
    v38 = [v48 objectAtIndexedSubscript:2];
    v39 = objc_msgSend(v67, "stringWithFormat:", @"%lu", v68 - objc_msgSend(v38, "unsignedLongValue") - (v69 + v70));
    uint64_t v99 = v85;
    v40 = [MEMORY[0x1E4FB1618] redColor];
    v100 = v40;
    v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
    v72 = (void *)[v66 initWithString:v39 attributes:v71];
    [v30 appendAttributedString:v72];

    v41 = v42;
    unint64_t v37 = 0x1E4F28000;
  }

  v81 = (void *)[objc_alloc(*(Class *)(v37 + 2840)) initWithString:@""]);
  [v30 appendAttributedString:v81];

  v82 = [v92 textLabel];
  [v82 setAttributedText:v30];

  return v92;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v4 = [(PUCurationClassificationSignalBrowserDebugViewController *)self signalIdentifiersForSection:a4];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(NSArray *)self->_sectionNames objectAtIndexedSubscript:a4];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sectionNames count];
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[PUCurationClassificationSignalBrowserDebugViewController signalIdentifiersForSection:](self, "signalIdentifiersForSection:", [v5 section]);
  uint64_t v7 = [v5 item];

  id v25 = [v6 objectAtIndexedSubscript:v7];

  v8 = [(NSDictionary *)self->_signalConfidenceByAssetUUIDBySignalIdentifier objectForKeyedSubscript:v25];
  v9 = [(NSDictionary *)self->_signalInfoBySignalIdentifier objectForKeyedSubscript:v25];
  v10 = [v9 objectForKeyedSubscript:@"name"];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    -[PUCurationClassificationSignalBrowserDebugViewController signalNameForUnknownSignalIdentifier:](self, "signalNameForUnknownSignalIdentifier:", [v25 intValue]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  v14 = [(NSDictionary *)self->_signalInfoBySignalIdentifier objectForKeyedSubscript:v25];
  v15 = [v14 objectForKeyedSubscript:@"operatingPoint"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v14 objectForKeyedSubscript:@"highPrecisionOperatingPoint"];
  [v18 doubleValue];
  double v20 = v19;

  if (v20 == v17) {
    double v20 = 1.0;
  }
  v21 = [v14 objectForKeyedSubscript:@"highRecallOperatingPoint"];
  [v21 doubleValue];
  double v23 = v22;

  [(PUCurationClassificationSignalAssetBrowserDebugViewController *)self->_assetCollectionViewController setSignalConfidenceByAssetUUID:v8 withSignalName:v13 operatingPoint:v17 highPrecisionOperatingPoint:v20 highRecallOperatingPoint:v23];
  v24 = [(PUCurationClassificationSignalBrowserDebugViewController *)self navigationController];
  [v24 pushViewController:self->_assetCollectionViewController animated:1];
}

- (id)signalIdentifiersForSection:(int64_t)a3
{
  signalIdentifiersBySectionName = self->_signalIdentifiersBySectionName;
  v4 = [(NSArray *)self->_sectionNames objectAtIndexedSubscript:a3];
  id v5 = [(NSDictionary *)signalIdentifiersBySectionName objectForKeyedSubscript:v4];

  return v5;
}

- (id)signalNameForUnknownSignalIdentifier:(int)a3
{
  if ((a3 & 0x7FFFFF00u) <= 0x7FFFFAFF)
  {
    v4 = @"Really Unknown";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", off_1E5F277B0[((a3 & 0x7FFFFF00u) - 2147482368) >> 8], *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_fetchSignals
{
  v82[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v4 = [v3 photoAnalysisClient];
  id v79 = 0;
  id v5 = [v4 requestSignalModelInfosWithError:&v79];
  id v53 = v79;

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke;
  v76[3] = &unk_1E5F27768;
  id v8 = v6;
  id v77 = v8;
  id v50 = v7;
  id v78 = v50;
  v54 = v5;
  [v5 enumerateKeysAndObjectsUsingBlock:v76];
  v51 = v8;
  v9 = [v8 allKeys];
  v10 = [v9 sortedArrayUsingSelector:sel_compare_];
  sectionNames = self->_sectionNames;
  self->_sectionNames = v10;

  objc_storeStrong((id *)&self->_signalIdentifiersBySectionName, v6);
  p_signalInfoBySignalIdentifier = &self->_signalInfoBySignalIdentifier;
  objc_storeStrong((id *)&self->_signalInfoBySignalIdentifier, v7);
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v64 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13 = [v3 librarySpecificFetchOptions];
  v82[0] = *MEMORY[0x1E4F39538];
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:1];
  [v13 setFetchPropertySets:v14];

  [v13 setShouldPrefetchCount:1];
  [v13 setChunkSizeForFetch:500];
  v49 = v13;
  v15 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v13];
  id v52 = self;
  self->_unint64_t numberOfAssets = [v15 count];
  uint64_t v47 = (void *)MEMORY[0x1B3E7C430]();
  id v48 = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_2;
  aBlock[3] = &unk_1E5F27790;
  id v46 = v12;
  id v75 = v46;
  v61 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
  uint64_t v57 = v16;
  if (v16)
  {
    uint64_t v56 = *(void *)v71;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v71 != v56) {
          objc_enumerationMutation(obj);
        }
        uint64_t v59 = v19;
        double v20 = *(void **)(*((void *)&v70 + 1) + 8 * v19);
        context = (void *)MEMORY[0x1B3E7C430](v16, v17, v18);
        v62 = objc_msgSend(v20, "uuid", v46, v47, v48);
        v21 = [v20 sceneClassifications];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v63 = v21;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v66 objects:v80 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v67;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v67 != v24) {
                objc_enumerationMutation(v63);
              }
              double v26 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              uint64_t v27 = [v26 extendedSceneIdentifier];
              if ((v27 & 0xFF000000) == 0x7F000000)
              {
                id v28 = [NSNumber numberWithUnsignedLongLong:v27];
                [v26 confidence];
                double v30 = v29;
                v61[2](v61, v62, v28);
                uint64_t v31 = [v64 objectForKeyedSubscript:v28];
                if (!v31)
                {
                  uint64_t v31 = (void *)[&unk_1F078AEB0 mutableCopy];
                  [v64 setObject:v31 forKeyedSubscript:v28];
                }
                id v32 = [(NSDictionary *)*p_signalInfoBySignalIdentifier objectForKeyedSubscript:v28];
                v33 = [v32 objectForKeyedSubscript:@"highPrecisionOperatingPoint"];
                [v33 doubleValue];
                double v35 = v34;

                if (v30 >= v35)
                {
                  uint64_t v42 = 0;
                }
                else
                {
                  uint64_t v36 = [v32 objectForKeyedSubscript:@"operatingPoint"];
                  [v36 doubleValue];
                  double v38 = v37;

                  if (v30 >= v38)
                  {
                    uint64_t v42 = 1;
                  }
                  else
                  {
                    v39 = [v32 objectForKeyedSubscript:@"highRecallOperatingPoint"];
                    [v39 doubleValue];
                    double v41 = v40;

                    if (v30 >= v41) {
                      uint64_t v42 = 2;
                    }
                    else {
                      uint64_t v42 = 3;
                    }
                  }
                }
                id v43 = NSNumber;
                v44 = [v31 objectAtIndexedSubscript:v42];
                v45 = objc_msgSend(v43, "numberWithUnsignedInteger:", objc_msgSend(v44, "unsignedIntegerValue") + 1);
                [v31 setObject:v45 atIndexedSubscript:v42];
              }
            }
            uint64_t v23 = [v63 countByEnumeratingWithState:&v66 objects:v80 count:16];
          }
          while (v23);
        }

        uint64_t v19 = v59 + 1;
      }
      while (v59 + 1 != v57);
      uint64_t v16 = [obj countByEnumeratingWithState:&v70 objects:v81 count:16];
      uint64_t v57 = v16;
    }
    while (v16);
  }

  objc_storeStrong((id *)&v52->_countsBySignalIdentifier, v64);
  objc_storeStrong((id *)&v52->_signalConfidenceByAssetUUIDBySignalIdentifier, v48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_231;
  block[3] = &unk_1E5F2ED10;
  block[4] = v52;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = NSString;
        id v12 = [v10 objectForKeyedSubscript:@"isHierarchical"];
        int v13 = [v12 BOOLValue];
        v14 = @"Leaf";
        if (v13) {
          v14 = @"Hierarchical";
        }
        v15 = [v11 stringWithFormat:@"%@ (%@)", v5, v14];

        id v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v15];
        if (!v16)
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v15];
        }
        uint64_t v17 = [v10 objectForKeyedSubscript:@"identifier"];
        [v16 addObject:v17];
        [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v17];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_2(uint64_t a1, void *a2, void *a3, double a4)
{
  id v11 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectForKeyedSubscript:v11];
  if (!v9)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v11];
  }
  v10 = [NSNumber numberWithDouble:a4];
  [v9 setObject:v10 forKeyedSubscript:v8];
}

void __73__PUCurationClassificationSignalBrowserDebugViewController__fetchSignals__block_invoke_231(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PUCurationClassificationSignalBrowserDebugViewController;
  [(PUCurationClassificationSignalBrowserDebugViewController *)&v8 viewDidLoad];
  uint64_t v3 = [(PUCurationClassificationSignalBrowserDebugViewController *)self px_extendedTraitCollection];
  [v3 userInterfaceIdiom];
  objc_opt_class();

  v4 = [PUCurationClassificationSignalAssetBrowserDebugViewController alloc];
  id v5 = objc_opt_new();
  uint64_t v6 = [(PUPhotosAlbumViewController *)v4 initWithSpec:v5];
  assetCollectionViewController = self->_assetCollectionViewController;
  self->_assetCollectionViewController = v6;

  [(PUCurationClassificationSignalBrowserDebugViewController *)self _fetchSignals];
}

@end