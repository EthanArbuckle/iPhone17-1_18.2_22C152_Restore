@interface PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView
- (PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView)initWithFilteringContext:(id)a3;
- (UISwitch)favoritePersonsAreVIPsCheckBox;
- (UISwitch)requiresNoBlinkCheckBox;
- (UISwitch)requiresSmileCheckBox;
- (UITextField)maximumFaceRollTextField;
- (UITextField)maximumFaceSizeTextField;
- (UITextField)minimumCropScoreTextField;
- (UITextField)minimumFaceQualityTextField;
- (UITextField)minimumFaceSizeTextField;
- (UITextField)minimumNumberOfCandidatesForEligiblePersonTextField;
- (UITextField)minimumWallpaperScoreTextField;
- (UITextField)normalizedDeviationForImportantPersonsTextField;
- (UITextField)normalizedDeviationForVeryImportantPersonsTextField;
- (UITextField)timeIntervalForCandidateDedupingTextField;
- (id)aspectRatios;
- (id)highlights;
- (int64_t)indexOfRowWithPersonLocalIdentifiers:(id)a3;
- (void)favoritePersonsAreVIPsChanged:(id)a3;
- (void)maximumFaceRollChanged:(id)a3;
- (void)maximumFaceSizeChanged:(id)a3;
- (void)minimumCropScoreChanged:(id)a3;
- (void)minimumFaceQualityChanged:(id)a3;
- (void)minimumFaceSizeChanged:(id)a3;
- (void)minimumNumberOfCandidatesForEligiblePersonChanged:(id)a3;
- (void)minimumWallpaperScoreChanged:(id)a3;
- (void)normalizedDeviationForImportantPersonsChanged:(id)a3;
- (void)normalizedDeviationForVeryImportantPersonsChanged:(id)a3;
- (void)requiresNoBlinkChanged:(id)a3;
- (void)requiresSmileChanged:(id)a3;
- (void)timeIntervalForCandidateDedupingChanged:(id)a3;
@end

@implementation PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumCropScoreTextField, 0);
  objc_storeStrong((id *)&self->_minimumWallpaperScoreTextField, 0);
  objc_storeStrong((id *)&self->_maximumFaceRollTextField, 0);
  objc_storeStrong((id *)&self->_maximumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_minimumFaceSizeTextField, 0);
  objc_storeStrong((id *)&self->_minimumFaceQualityTextField, 0);
  objc_storeStrong((id *)&self->_requiresNoBlinkCheckBox, 0);
  objc_storeStrong((id *)&self->_requiresSmileCheckBox, 0);
  objc_storeStrong((id *)&self->_timeIntervalForCandidateDedupingTextField, 0);
  objc_storeStrong((id *)&self->_minimumNumberOfCandidatesForEligiblePersonTextField, 0);
  objc_storeStrong((id *)&self->_favoritePersonsAreVIPsCheckBox, 0);
  objc_storeStrong((id *)&self->_normalizedDeviationForImportantPersonsTextField, 0);
  objc_storeStrong((id *)&self->_normalizedDeviationForVeryImportantPersonsTextField, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_filteringContext, 0);
}

- (UITextField)minimumCropScoreTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2184, 1);
}

- (UITextField)minimumWallpaperScoreTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2176, 1);
}

- (UITextField)maximumFaceRollTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2168, 1);
}

- (UITextField)maximumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2160, 1);
}

- (UITextField)minimumFaceSizeTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2152, 1);
}

- (UITextField)minimumFaceQualityTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2144, 1);
}

- (UISwitch)requiresNoBlinkCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2136, 1);
}

- (UISwitch)requiresSmileCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2128, 1);
}

- (UITextField)timeIntervalForCandidateDedupingTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2120, 1);
}

- (UITextField)minimumNumberOfCandidatesForEligiblePersonTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2112, 1);
}

- (UISwitch)favoritePersonsAreVIPsCheckBox
{
  return (UISwitch *)objc_getProperty(self, a2, 2104, 1);
}

- (UITextField)normalizedDeviationForImportantPersonsTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2096, 1);
}

- (UITextField)normalizedDeviationForVeryImportantPersonsTextField
{
  return (UITextField *)objc_getProperty(self, a2, 2088, 1);
}

- (void)minimumCropScoreChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumCropScore:](self->_filteringContext, "setMinimumCropScore:");
}

- (void)minimumWallpaperScoreChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumWallpaperScore:](self->_filteringContext, "setMinimumWallpaperScore:");
}

- (void)maximumFaceRollChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMaximumFaceRoll:](self->_filteringContext, "setMaximumFaceRoll:");
}

- (void)maximumFaceSizeChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMaximumFaceSize:](self->_filteringContext, "setMaximumFaceSize:");
}

- (void)minimumFaceSizeChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumFaceSize:](self->_filteringContext, "setMinimumFaceSize:");
}

- (void)minimumFaceQualityChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumFaceQuality:](self->_filteringContext, "setMinimumFaceQuality:");
}

- (void)requiresNoBlinkChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  filteringContext = self->_filteringContext;
  [(PUTopPeopleWallpaperSuggesterFilteringContext *)filteringContext setRequiresNoBlink:v4];
}

- (void)requiresSmileChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  filteringContext = self->_filteringContext;
  [(PUTopPeopleWallpaperSuggesterFilteringContext *)filteringContext setRequiresSmile:v4];
}

- (void)timeIntervalForCandidateDedupingChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setTimeIntervalForCandidateDeduping:](self->_filteringContext, "setTimeIntervalForCandidateDeduping:");
}

- (void)minimumNumberOfCandidatesForEligiblePersonChanged:(id)a3
{
  id v4 = [a3 text];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setMinimumNumberOfCandidatesForEligiblePerson:](self->_filteringContext, "setMinimumNumberOfCandidatesForEligiblePerson:", [v4 integerValue]);
}

- (void)favoritePersonsAreVIPsChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  filteringContext = self->_filteringContext;
  [(PUTopPeopleWallpaperSuggesterFilteringContext *)filteringContext setFavoritePersonsAreVIPs:v4];
}

- (void)normalizedDeviationForImportantPersonsChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setNormalizedDeviationForImportantPersons:](self->_filteringContext, "setNormalizedDeviationForImportantPersons:");
}

- (void)normalizedDeviationForVeryImportantPersonsChanged:(id)a3
{
  id v4 = [a3 text];
  [v4 doubleValue];
  -[PUTopPeopleWallpaperSuggesterFilteringContext setNormalizedDeviationForVeryImportantPersons:](self->_filteringContext, "setNormalizedDeviationForVeryImportantPersons:");
}

- (id)highlights
{
  v31[1] = *MEMORY[0x1E4F143B8];
  highlights = self->_highlights;
  if (!highlights)
  {
    v22 = self;
    v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", &unk_1F078B930, 0);
    v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v7 = [v6 librarySpecificFetchOptions];

    v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
    v31[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    [v7 setSortDescriptors:v9];

    v21 = v7;
    [MEMORY[0x1E4F39238] fetchAssetCollectionsWithType:6 subtype:0x7FFFFFFFFFFFFFFFLL options:v7];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v28[0] = @"localIdentifier";
          v15 = [v14 localIdentifier];
          v28[1] = @"name";
          v29[0] = v15;
          v16 = [v14 localizedTitle];
          v17 = v16;
          if (!v16)
          {
            v2 = [v14 localizedSubtitle];
            v17 = v2;
          }
          v29[1] = v17;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
          [(NSArray *)v5 addObject:v18];

          if (!v16) {
        }
          }
        uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      }
      while (v11);
    }
    v19 = v22->_highlights;
    v22->_highlights = v5;

    highlights = v22->_highlights;
  }
  return highlights;
}

- (id)aspectRatios
{
  return &unk_1F078AB68;
}

- (int64_t)indexOfRowWithPersonLocalIdentifiers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 anyObject];
    v7 = v6;
    if (!v6)
    {
      int64_t v8 = 1;
      goto LABEL_17;
    }
    if ([v6 isEqualToString:@"*"])
    {
      int64_t v8 = 2;
LABEL_17:

      goto LABEL_18;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v9 = self->_persons;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      uint64_t v13 = 3;
      while (2)
      {
        uint64_t v14 = 0;
        uint64_t v15 = v13 + v11;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v14), "localIdentifier", (void)v19);
          char v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            int64_t v8 = v13 + v14;

            goto LABEL_17;
          }
          ++v14;
        }
        while (v11 != v14);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v13 = v15;
        if (v11) {
          continue;
        }
        break;
      }
    }

    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v8 = 0;
  }
LABEL_18:

  return v8;
}

- (PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView)initWithFilteringContext:(id)a3
{
  id v5 = a3;
  v70.receiver = self;
  v70.super_class = (Class)PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView;
  v6 = [(PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView *)&v70 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_filteringContext, a3);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView_initWithFilteringContext___block_invoke;
    aBlock[3] = &unk_1E5F220D0;
    int64_t v8 = v7;
    v69 = v8;
    v9 = (void (**)(void *, void, __CFString *))_Block_copy(aBlock);
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v11 = v8[261];
    v8[261] = v10;

    [v8[261] addTarget:v8 action:sel_normalizedDeviationForVeryImportantPersonsChanged_ forControlEvents:0x40000];
    uint64_t v12 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext normalizedDeviationForVeryImportantPersons];
    uint64_t v14 = [v12 stringWithFormat:@"%.2f", v13];
    [v8[261] setText:v14];

    [v8[261] sizeToFit];
    [v8[261] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[261]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[261], @"Norm Dev for VIPs:");
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v16 = v8[262];
    v8[262] = v15;

    [v8[262] addTarget:v8 action:sel_normalizedDeviationForImportantPersonsChanged_ forControlEvents:0x40000];
    char v17 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext normalizedDeviationForImportantPersons];
    long long v19 = [v17 stringWithFormat:@"%.2f", v18];
    [v8[262] setText:v19];

    [v8[262] sizeToFit];
    [v8[262] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[262]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[262], @"Norm Dev for IPs:");
    id v20 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    id v21 = v8[263];
    v8[263] = v20;

    [v8[263] addTarget:v8 action:sel_favoritePersonsAreVIPsChanged_ forControlEvents:64];
    objc_msgSend(v8[263], "setOn:", -[PUTopPeopleWallpaperSuggesterFilteringContext favoritePersonsAreVIPs](v7->_filteringContext, "favoritePersonsAreVIPs"));
    [v8[263] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[263]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[263], @"Fav Persons are VIPs:");
    id v22 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v23 = v8[264];
    v8[264] = v22;

    [v8[264] addTarget:v8 action:sel_minimumNumberOfCandidatesForEligiblePersonChanged_ forControlEvents:0x40000];
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[PUTopPeopleWallpaperSuggesterFilteringContext minimumNumberOfCandidatesForEligiblePerson](v7->_filteringContext, "minimumNumberOfCandidatesForEligiblePerson"));
    [v8[264] setText:v24];

    [v8[264] sizeToFit];
    [v8[264] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[264]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[264], @"Min Num Candidates:");
    id v25 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v26 = v8[265];
    v8[265] = v25;

    [v8[265] addTarget:v8 action:sel_timeIntervalForCandidateDedupingChanged_ forControlEvents:0x40000];
    long long v27 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext timeIntervalForCandidateDeduping];
    v29 = [v27 stringWithFormat:@"%.2f", v28];
    [v8[265] setText:v29];

    [v8[265] sizeToFit];
    [v8[265] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[265]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[265], @"TimeInt for Deduping:");
    id v30 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    id v31 = v8[266];
    v8[266] = v30;

    [v8[266] addTarget:v8 action:sel_requiresSmileChanged_ forControlEvents:64];
    objc_msgSend(v8[266], "setOn:", -[PUTopPeopleWallpaperSuggesterFilteringContext requiresSmile](v7->_filteringContext, "requiresSmile"));
    [v8[266] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[266]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[266], @"Requires Smile:");
    id v32 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    id v33 = v8[267];
    v8[267] = v32;

    [v8[267] addTarget:v8 action:sel_requiresNoBlinkChanged_ forControlEvents:64];
    objc_msgSend(v8[267], "setOn:", -[PUTopPeopleWallpaperSuggesterFilteringContext requiresNoBlink](v7->_filteringContext, "requiresNoBlink"));
    [v8[267] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[267]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[267], @"Requires No Blink:");
    id v34 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v35 = v8[268];
    v8[268] = v34;

    [v8[268] addTarget:v8 action:sel_minimumFaceQualityChanged_ forControlEvents:0x40000];
    v36 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext minimumFaceQuality];
    v38 = [v36 stringWithFormat:@"%.2f", v37];
    [v8[268] setText:v38];

    [v8[268] sizeToFit];
    [v8[268] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[268]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[268], @"Min Face Quality:");
    id v39 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v40 = v8[269];
    v8[269] = v39;

    [v8[269] addTarget:v8 action:sel_minimumFaceSizeChanged_ forControlEvents:0x40000];
    v41 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext minimumFaceSize];
    v43 = [v41 stringWithFormat:@"%.2f", v42];
    [v8[269] setText:v43];

    [v8[269] sizeToFit];
    [v8[269] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[269]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[269], @"Min Face Size:");
    id v44 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v45 = v8[270];
    v8[270] = v44;

    [v8[270] addTarget:v8 action:sel_maximumFaceSizeChanged_ forControlEvents:0x40000];
    v46 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext maximumFaceSize];
    v48 = [v46 stringWithFormat:@"%.2f", v47];
    [v8[270] setText:v48];

    [v8[270] sizeToFit];
    [v8[270] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[270]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[270], @"Max Face Size:");
    id v49 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v50 = v8[271];
    v8[271] = v49;

    [v8[271] addTarget:v8 action:sel_maximumFaceRollChanged_ forControlEvents:0x40000];
    v51 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext maximumFaceRoll];
    v53 = [v51 stringWithFormat:@"%.2f", v52];
    [v8[271] setText:v53];

    [v8[271] sizeToFit];
    [v8[271] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[271]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[271], @"Max Face Roll:");
    id v54 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v55 = v8[272];
    v8[272] = v54;

    [v8[272] addTarget:v8 action:sel_minimumWallpaperScoreChanged_ forControlEvents:0x40000];
    v56 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext minimumWallpaperScore];
    v58 = [v56 stringWithFormat:@"%.2f", v57];
    [v8[272] setText:v58];

    [v8[272] sizeToFit];
    [v8[272] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[272]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[272], @"Min Wallpaper Score:");
    id v59 = objc_alloc_init(MEMORY[0x1E4FB1D70]);
    id v60 = v8[273];
    v8[273] = v59;

    [v8[273] addTarget:v8 action:sel_minimumCropScoreChanged_ forControlEvents:0x40000];
    v61 = NSString;
    [(PUTopPeopleWallpaperSuggesterFilteringContext *)v7->_filteringContext minimumCropScore];
    v63 = [v61 stringWithFormat:@"%.2f", v62];
    [v8[273] setText:v63];

    [v8[273] sizeToFit];
    [v8[273] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v8[273]];
    ((void (**)(void *, id, __CFString *))v9)[2](v9, v8[273], @"Min Asset Crop Score:");
    v64 = (void *)MEMORY[0x1E4F28DC8];
    v65 = _NSDictionaryOfVariableBindings(&cfstr_Normalizeddevi.isa, v8[261], v8[262], v8[263], v8[264], v8[265], v8[266], v8[267], v8[268], v8[269], v8[270], v8[271], v8[272], v8[273], 0);
    v66 = [v64 constraintsWithVisualFormat:@"V:|-16-[_normalizedDeviationForVeryImportantPersonsTextField]-10-[_normalizedDeviationForImportantPersonsTextField]-10-[_favoritePersonsAreVIPsCheckBox]-10-[_minimumNumberOfCandidatesForEligiblePersonTextField]-10-[_timeIntervalForCandidateDedupingTextField]-10-[_requiresSmileCheckBox]-10-[_requiresNoBlinkCheckBox]-10-[_minimumFaceQualityTextField]-10-[_minimumFaceSizeTextField]-10-[_maximumFaceSizeTextField]-10-[_maximumFaceRollTextField]-10-[_minimumWallpaperScoreTextField]-10-[_minimumCropScoreTextField]->=0-|" options:0 metrics:0 views:v65];
    [v8 addConstraints:v66];
  }
  return v7;
}

void __92__PUTopPeopleWallpaperSuggesterDebugSettingsFilteringSettingsView_initWithFilteringContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1930];
  id v6 = a3;
  id v7 = a2;
  id firstValue = objc_alloc_init(v5);
  [firstValue setText:v6];

  [firstValue sizeToFit];
  [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(a1 + 32) addSubview:firstValue];
  int64_t v8 = [firstValue centerYAnchor];
  v9 = [v7 centerYAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9 constant:0.0];
  [v10 setActive:1];

  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v13 = _NSDictionaryOfVariableBindings(&cfstr_LabelView.isa, firstValue, v7, 0);

  uint64_t v14 = [v12 constraintsWithVisualFormat:@"H:|-[label]-10-[view]->=0-|" options:0 metrics:0 views:v13];
  [v11 addConstraints:v14];
}

@end