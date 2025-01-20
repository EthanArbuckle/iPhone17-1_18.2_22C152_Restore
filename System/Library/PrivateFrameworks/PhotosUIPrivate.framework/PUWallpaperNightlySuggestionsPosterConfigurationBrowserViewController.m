@interface PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_doneEditingSettings:(id)a3;
- (void)_setIncludeCityscapes:(id)a3;
- (void)_setIncludeLandscapes:(id)a3;
- (void)_setIncludePets:(id)a3;
- (void)doCustomPosterConfiguration;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_customConfiguration, 0);
  objc_storeStrong((id *)&self->_suggestionViewController, 0);
  objc_storeStrong((id *)&self->_posterConfigurations, 0);
}

- (void)_doneEditingSettings:(id)a3
{
  if (self->_isPresentingCustomPosterConfigurationSettings)
  {
    self->_isPresentingCustomPosterConfigurationSettings = 0;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __94__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__doneEditingSettings___block_invoke;
    v3[3] = &unk_1E5F2ED10;
    v3[4] = self;
    [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self dismissViewControllerAnimated:1 completion:v3];
  }
}

void __94__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__doneEditingSettings___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 1048) copy];
  [*(id *)(*(void *)(a1 + 32) + 1032) setPosterConfiguration:v2];

  id v3 = [*(id *)(a1 + 32) navigationController];
  [v3 pushViewController:*(void *)(*(void *)(a1 + 32) + 1032) animated:1];
}

- (void)_setIncludeCityscapes:(id)a3
{
  uint64_t v4 = [a3 isOn];
  customConfiguration = self->_customConfiguration;
  [(PUWallpaperNightlySuggestionsPosterConfiguration *)customConfiguration setIncludeCityscapes:v4];
}

- (void)_setIncludeLandscapes:(id)a3
{
  uint64_t v4 = [a3 isOn];
  customConfiguration = self->_customConfiguration;
  [(PUWallpaperNightlySuggestionsPosterConfiguration *)customConfiguration setIncludeLandscapes:v4];
}

- (void)_setIncludePets:(id)a3
{
  uint64_t v4 = [a3 isOn];
  customConfiguration = self->_customConfiguration;
  [(PUWallpaperNightlySuggestionsPosterConfiguration *)customConfiguration setIncludePets:v4];
}

- (void)doCustomPosterConfiguration
{
  id v33 = objc_alloc_init(MEMORY[0x1E4FB1EC0]);
  id v3 = [v33 view];
  uint64_t v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v5 = [v4 colorWithAlphaComponent:0.75];
  [v3 setBackgroundColor:v5];

  id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [v3 bounds];
  v8 = objc_msgSend(v6, "initWithFrame:", 10.0, 10.0, v7 + -20.0, 100.0);
  [v8 setAutoresizingMask:34];
  v9 = [v8 layer];
  [v9 setCornerRadius:6.0];

  v10 = [MEMORY[0x1E4FB1618] lightGrayColor];
  [v8 setBackgroundColor:v10];

  v32 = v3;
  [v3 addSubview:v8];
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB14D0]), "initWithFrame:", 20.0, 20.0, 180.0, 40.0);
  [v11 setAutoresizingMask:36];
  [v11 setTitle:@"Done" forState:0];
  v12 = [MEMORY[0x1E4FB1618] blueColor];
  [v11 setTitleColor:v12 forState:0];

  [v11 addTarget:self action:sel__doneEditingSettings_ forControlEvents:0xFFFFFFFFLL];
  [v8 addSubview:v11];
  v31 = v11;
  [v11 sizeToFit];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 80.0, 180.0, 40.0);
  [v13 setAutoresizingMask:36];
  [v13 setText:@"Persons:"];
  v30 = v13;
  [v8 addSubview:v13];
  id v14 = objc_alloc(MEMORY[0x1E4FB1D00]);
  [v8 frame];
  v16 = objc_msgSend(v14, "initWithFrame:style:", 0, 20.0, 120.0, v15 + -40.0, 300.0);
  [v16 setAllowsMultipleSelection:1];
  [v16 setDataSource:self];
  [v16 setDelegate:self];
  [v8 addSubview:v16];
  if ([(NSArray *)self->_persons count])
  {
    unint64_t v17 = 0;
    do
    {
      v18 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration personLocalIdentifiers];
      v19 = [(NSArray *)self->_persons objectAtIndexedSubscript:v17];
      v20 = [v19 localIdentifier];
      int v21 = [v18 containsObject:v20];

      if (v21)
      {
        v22 = [MEMORY[0x1E4F28D58] indexPathForRow:v17 inSection:0];
        [v16 selectRowAtIndexPath:v22 animated:0 scrollPosition:0];
      }
      ++v17;
    }
    while (v17 < [(NSArray *)self->_persons count]);
  }
  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 440.0, 180.0, 40.0);
  [v29 setAutoresizingMask:36];
  [v29 setText:@"Include Pets:"];
  [v8 addSubview:v29];
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", 200.0, 440.0, 50.0, 40.0);
  [v23 setAutoresizingMask:36];
  objc_msgSend(v23, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includePets](self->_customConfiguration, "includePets"));
  [v23 addTarget:self action:sel__setIncludePets_ forControlEvents:4096];
  [v8 addSubview:v23];
  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 500.0, 180.0, 40.0);
  [v24 setAutoresizingMask:36];
  [v24 setText:@"Include Landscapes:"];
  [v8 addSubview:v24];
  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", 200.0, 500.0, 50.0, 40.0);
  [v25 setAutoresizingMask:36];
  objc_msgSend(v25, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includeLandscapes](self->_customConfiguration, "includeLandscapes"));
  [v25 addTarget:self action:sel__setIncludeLandscapes_ forControlEvents:4096];
  [v8 addSubview:v25];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", 20.0, 560.0, 180.0, 40.0);
  [v26 setAutoresizingMask:36];
  [v26 setText:@"Include Cityscapes:"];
  [v8 addSubview:v26];
  v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1CD0]), "initWithFrame:", 200.0, 560.0, 50.0, 40.0);
  [v27 setAutoresizingMask:36];
  objc_msgSend(v27, "setOn:", -[PUWallpaperNightlySuggestionsPosterConfiguration includeCityscapes](self->_customConfiguration, "includeCityscapes"));
  [v27 addTarget:self action:sel__setIncludeCityscapes_ forControlEvents:4096];
  [v8 addSubview:v27];
  [v32 bounds];
  objc_msgSend(v8, "setFrame:", 10.0, 10.0, v28 + -20.0, 620.0);
  [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self setModalPresentationStyle:7];
  [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self presentViewController:v33 animated:1 completion:0];
  self->_isPresentingCustomPosterConfigurationSettings = 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self tableView];

  if (v8 == v6)
  {
    v10 = [v6 dequeueReusableCellWithIdentifier:@"PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell"];
    if (!v10)
    {
      v10 = [[PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell alloc] initWithStyle:3 reuseIdentifier:@"PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell"];
      v16 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 detailTextLabel];
      [v16 setNumberOfLines:1];

      unint64_t v17 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 detailTextLabel];
      [v17 setLineBreakMode:0];
    }
    v9 = -[NSArray objectAtIndexedSubscript:](self->_posterConfigurations, "objectAtIndexedSubscript:", [v7 item]);
    v11 = [v9 name];
    id v14 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 textLabel];
    [v14 setText:v11];
  }
  else
  {
    v9 = -[NSArray objectAtIndexedSubscript:](self->_persons, "objectAtIndexedSubscript:", [v7 item]);
    v10 = [v6 dequeueReusableCellWithIdentifier:@"PUWallpaperNightlySuggestionsPosterConfigurationPersonCell"];
    if (!v10) {
      v10 = [[PUWallpaperNightlySuggestionsPosterConfigurationPersonCell alloc] initWithStyle:3 reuseIdentifier:@"PUWallpaperNightlySuggestionsPosterConfigurationPersonCell"];
    }
    v11 = [v9 localIdentifier];
    [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 setPersonLocalIdentifier:v11];
    v12 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration personLocalIdentifiers];
    if ([v12 containsObject:v11]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 0;
    }
    [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 setAccessoryType:v13];

    id v14 = [v9 displayName];
    if (![v14 length])
    {
      double v15 = [v9 name];

      if ([v15 length])
      {
        id v14 = v15;
      }
      else
      {
        id v14 = [v11 substringToIndex:8];
      }
    }
    v18 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewCell *)v10 textLabel];
    [v18 setText:v14];
  }
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self tableView];

  id v7 = &OBJC_IVAR___PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__persons;
  if (v6 == v5) {
    id v7 = &OBJC_IVAR___PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController__posterConfigurations;
  }
  id v8 = *(Class *)((char *)&self->super.super.super.super.isa + *v7);
  return [v8 count];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 40.0;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self tableView];

  if (v7 != v12)
  {
    id v8 = [v12 cellForRowAtIndexPath:v6];
    [v8 setAccessoryType:0];
    v9 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration personLocalIdentifiers];
    v10 = (void *)[v9 mutableCopy];

    v11 = [v8 personLocalIdentifier];
    [v10 removeObject:v11];

    [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration setPersonLocalIdentifiers:v10];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self tableView];

  if (v7 == v15)
  {
    posterConfigurations = self->_posterConfigurations;
    uint64_t v13 = [v6 item];

    id v8 = [(NSArray *)posterConfigurations objectAtIndexedSubscript:v13];
    id v14 = [v8 name];
    LODWORD(v13) = [v14 hasPrefix:@"Custom"];

    if (v13)
    {
      [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self doCustomPosterConfiguration];
      goto LABEL_7;
    }
    [(PUWallpaperNightlySuggestionsViewController *)self->_suggestionViewController setPosterConfiguration:v8];
    v9 = [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)self navigationController];
    [v9 pushViewController:self->_suggestionViewController animated:1];
  }
  else
  {
    id v8 = [v15 cellForRowAtIndexPath:v6];

    [v8 setAccessoryType:3];
    v9 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration personLocalIdentifiers];
    v10 = [v8 personLocalIdentifier];
    v11 = [v9 setByAddingObject:v10];
    [(PUWallpaperNightlySuggestionsPosterConfiguration *)self->_customConfiguration setPersonLocalIdentifiers:v11];
  }
LABEL_7:
}

- (void)viewDidLoad
{
  v72[3] = *MEMORY[0x1E4F143B8];
  v69.receiver = self;
  v69.super_class = (Class)PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController;
  [(PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController *)&v69 viewDidLoad];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  id v5 = (void *)MEMORY[0x1E4F28BA0];
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
  v72[0] = v6;
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"subtype = %d", 652);
  v72[1] = v7;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"context != nil"];
  v72[2] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
  v10 = [v5 andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  v62 = v4;
  v11 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v4];
  id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v66;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v66 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v65 + 1) + 8 * v17) context];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v15);
  }

  v19 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v20 = [v19 librarySpecificFetchOptions];

  int v21 = (void *)MEMORY[0x1E4F391F0];
  v22 = [v12 allObjects];
  v23 = [v21 fetchPersonsWithLocalIdentifiers:v22 options:v20];

  v24 = [v23 fetchedObjects];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __84__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController_viewDidLoad__block_invoke;
  v63[3] = &unk_1E5F24580;
  id v25 = v12;
  id v64 = v25;
  v26 = [v24 sortedArrayUsingComparator:v63];
  persons = self->_persons;
  self->_persons = v26;

  if ([(NSArray *)self->_persons count])
  {
    double v28 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v29 = [MEMORY[0x1E4F1CAD0] set];
    v30 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v28 initWithName:@"Custom…" personLocalIdentifiers:v29 includePets:1 includeLandscapes:0 includeCityscapes:0];
    customConfiguration = self->_customConfiguration;
    self->_customConfiguration = v30;

    v32 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    id v33 = (void *)MEMORY[0x1E4F1CAD0];
    v59 = [(NSArray *)self->_persons firstObject];
    v58 = [v59 localIdentifier];
    v57 = [v33 setWithObject:v58];
    v56 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v32 initWithName:@"Top Person" personLocalIdentifiers:v57 includePets:0 includeLandscapes:0 includeCityscapes:0];
    v70[0] = v56;
    v61 = v20;
    v34 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    id v60 = v25;
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v55 = [(NSArray *)self->_persons objectAtIndexedSubscript:arc4random_uniform([(NSArray *)self->_persons count])];
    v54 = [v55 localIdentifier];
    v53 = [v35 setWithObject:v54];
    v36 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v34 initWithName:@"Non-Top Person" personLocalIdentifiers:v53 includePets:0 includeLandscapes:0 includeCityscapes:0];
    v70[1] = v36;
    v37 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v38 = [MEMORY[0x1E4F1CAD0] set];
    v39 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v37 initWithName:@"Pets" personLocalIdentifiers:v38 includePets:1 includeLandscapes:0 includeCityscapes:0];
    v70[2] = v39;
    v40 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v41 = [MEMORY[0x1E4F1CAD0] set];
    v42 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v40 initWithName:@"Landscapes" personLocalIdentifiers:v41 includePets:0 includeLandscapes:1 includeCityscapes:0];
    v70[3] = v42;
    v43 = [PUWallpaperNightlySuggestionsPosterConfiguration alloc];
    v44 = [MEMORY[0x1E4F1CAD0] set];
    v45 = [(PUWallpaperNightlySuggestionsPosterConfiguration *)v43 initWithName:@"Cityscapes" personLocalIdentifiers:v44 includePets:0 includeLandscapes:0 includeCityscapes:1];
    v46 = self->_customConfiguration;
    v70[4] = v45;
    v70[5] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:6];
    posterConfigurations = self->_posterConfigurations;
    self->_posterConfigurations = v47;

    v20 = v61;
    id v25 = v60;
  }
  v49 = [PUWallpaperNightlySuggestionsViewController alloc];
  v50 = [[PUPassiveContentDebugViewSpec alloc] initWithViewMode:0];
  v51 = [(PUWallpaperNightlySuggestionsViewController *)v49 initWithSpec:v50];
  suggestionViewController = self->_suggestionViewController;
  self->_suggestionViewController = v51;
}

uint64_t __84__PUWallpaperNightlySuggestionsPosterConfigurationBrowserViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NSNumber;
  id v8 = *(void **)(a1 + 32);
  v9 = [v6 localIdentifier];
  v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "countForObject:", v9));
  v11 = NSNumber;
  id v12 = *(void **)(a1 + 32);
  id v13 = [v5 localIdentifier];
  uint64_t v14 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "countForObject:", v13));
  uint64_t v15 = [v10 compare:v14];
  if (!v15)
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "faceCount"));
    uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "faceCount"));
    uint64_t v15 = [v16 compare:v17];
    if (!v15)
    {
      v20 = [v6 localIdentifier];
      v18 = [v5 localIdentifier];
      uint64_t v15 = [v20 compare:v18];
    }
  }

  return v15;
}

@end