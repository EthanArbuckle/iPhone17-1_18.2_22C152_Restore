@interface PKPayLaterDisputeExplanationSectionController
- (Class)headerViewClassForSectionIdentifier:(id)a3;
- (PKPayLaterDisputeExplanationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 layout:(unint64_t)a5 dynamicContentPage:(id)a6 viewControllerDelegate:(id)a7;
- (id)_firstSectionIdentifier;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4;
@end

@implementation PKPayLaterDisputeExplanationSectionController

- (PKPayLaterDisputeExplanationSectionController)initWithFinancingPlan:(id)a3 payLaterAccount:(id)a4 layout:(unint64_t)a5 dynamicContentPage:(id)a6 viewControllerDelegate:(id)a7
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterDisputeExplanationSectionController;
  v14 = [(PKPayLaterSectionController *)&v45 initWithPayLaterAccount:a4 dynamicContentPage:a6 viewControllerDelegate:a7];
  v15 = v14;
  if (v14)
  {
    id v34 = v13;
    objc_storeStrong((id *)&v14->_financingPlan, a3);
    v15->_layout = a5;
    v16 = (void *)MEMORY[0x1E4FB1830];
    v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2980]];
    uint64_t v18 = [v16 configurationWithFont:v17];
    iconFontConfiguration = v15->_iconFontConfiguration;
    v15->_iconFontConfiguration = (UIImageSymbolConfiguration *)v18;

    v20 = [(PKPayLaterSectionController *)v15 dynamicContentPage];
    v21 = [v20 sections];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v21;
    uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v36 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v26 = [v25 rows];
          uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v38 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = PKImageFromPayLaterDynamicContentPageItem(*(PKPayLaterDynamicContentPageItem **)(*((void *)&v37 + 1) + 8 * j), v15->_iconFontConfiguration, 0);
                [v31 size];
                v15->_maxIconWidth = fmax(v32, v15->_maxIconWidth);
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v28);
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v23);
    }

    id v13 = v34;
  }

  return v15;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPayLaterDisputeExplanationSectionController *)self _firstSectionIdentifier];
  id v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  if (v6 && v5)
  {
    int v8 = [v5 isEqualToString:v6];

    if (!v8) {
      goto LABEL_9;
    }
LABEL_7:
    v9 = objc_opt_class();
    goto LABEL_10;
  }

LABEL_9:
  v9 = 0;
LABEL_10:

  return (Class)v9;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(PKPayLaterDisputeExplanationSectionController *)self _firstSectionIdentifier];
  id v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  if (!v8 || !v7)
  {

LABEL_10:
    goto LABEL_11;
  }
  int v10 = [v7 isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    id v7 = v16;
    v11 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v12 = [v11 headerTitle];
    [v7 setPrimaryText:v12];

    id v13 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v14 = [v13 headerSubtitle];
    [v7 setSecondaryText:v14];

    v15 = PKPayLaterDisputeFlagIconImageWithConfiguration();
    [v7 setImage:v15];

    [v7 setBottomPadding:16.0];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterDisputeExplanationSectionController;
  [(PKPayLaterSectionController *)&v9 configureCellForRegistration:v6 item:v7];
  if (self->_layout == 1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [MEMORY[0x1E4FB1498] clearConfiguration];
      [v6 setBackgroundConfiguration:v8];
    }
  }
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v5 = [v4 sections];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [NSString stringWithFormat:@"%@%ld", @"kExplanationSectionPrefix-", v6];
      [v3 addObject:v7];

      ++v6;
    }
    while (v6 < [v5 count]);
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 hasPrefix:@"kExplanationSectionPrefix-"])
  {
    id v7 = [v5 stringByReplacingOccurrencesOfString:@"kExplanationSectionPrefix-" withString:&stru_1EF1B5B50];
    unint64_t v8 = [v7 integerValue];

    objc_super v9 = [(PKPayLaterSectionController *)self dynamicContentPage];
    int v10 = [v9 sections];

    if (v8 < [v10 count])
    {
      v11 = [v10 objectAtIndexedSubscript:v8];
      [(PKPayLaterDisputeExplanationSectionController *)self _configureDynamicSection:v11 snapshot:v6];
    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v29 = a4;
  long long v39 = self;
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t layout = self->_layout;
  id v7 = (void *)MEMORY[0x1E4FB1830];
  unint64_t v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2980]];
  uint64_t v36 = [v7 configurationWithFont:v8];

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v30 = v6;
  obuint64_t j = [v6 rows];
  uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v37)
  {
    uint64_t v34 = *(void *)v45;
    v31 = (void *)*MEMORY[0x1E4FB27D0];
    double v32 = (void *)*MEMORY[0x1E4FB28C8];
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(PKPayLaterDynamicContentPageItem **)(*((void *)&v44 + 1) + 8 * i);
        v11 = PKImageFromPayLaterDynamicContentPageItem(v10, v36, 0);
        v12 = [(PKPayLaterDynamicContentPageItem *)v10 contentTitle];
        uint64_t v13 = [(PKPayLaterDynamicContentPageItem *)v10 contentSubtitle];
        v14 = (void *)v13;
        v15 = 0;
        if (v12) {
          BOOL v16 = v13 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          v15 = PKFontForDefaultDesign(v32, v31, 2, 0);
        }
        v17 = [[PKPayLaterTileDetailIconRow alloc] initWithTitle:v12 detail:v14 iconImage:v11];
        [(PKPayLaterTileDetailIconRow *)v17 setTitleFont:v15];
        [(PKPayLaterTileDetailIconRow *)v17 setCenterTitleText:layout == 1];
        double maxIconWidth = v39->_maxIconWidth;
        [v11 size];
        [(PKPayLaterTileDetailIconRow *)v17 setAdditionalIconPadding:fmax(maxIconWidth - v19, 0.0)];
        [v40 safelyAddObject:v17];
        v20 = [(PKPayLaterDynamicContentPageItem *)v10 linkText];
        v21 = [(PKPayLaterDynamicContentPageItem *)v10 linkURL];
        if ([v20 length])
        {
          long long v38 = v11;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __83__PKPayLaterDisputeExplanationSectionController__configureDynamicSection_snapshot___block_invoke;
          aBlock[3] = &unk_1E59CA870;
          id v22 = v21;
          id v42 = v22;
          long long v43 = v39;
          uint64_t v23 = _Block_copy(aBlock);
          v24 = v23;
          if (!v22)
          {

            v24 = 0;
          }
          v25 = [PKPayLaterTitleDetailRow alloc];
          v26 = [(PKPayLaterDynamicContentPageItem *)v10 linkText];
          uint64_t v27 = [(PKPayLaterTitleDetailRow *)v25 initWithTitle:v26 detail:0 selectionHandler:v24];

          [v40 addObject:v27];
          v11 = v38;
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v37);
  }

  uint64_t v28 = (void *)[v40 copy];
  [v29 appendItems:v28];
}

void __83__PKPayLaterDisputeExplanationSectionController__configureDynamicSection_snapshot___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) scheme];
  int v3 = [v2 containsString:@"http"];

  if (v3)
  {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F3AEB8]) initWithURL:*(void *)(a1 + 32)];
    [v5 setModalPresentationStyle:2];
    id v4 = [*(id *)(a1 + 40) dynamicCollectionDelegate];
    [v4 presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v5 openSensitiveURL:*(void *)(a1 + 32) withOptions:0];
  }
}

- (id)_firstSectionIdentifier
{
  return (id)[NSString stringWithFormat:@"%@%ld", @"kExplanationSectionPrefix-", 0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFontConfiguration, 0);

  objc_storeStrong((id *)&self->_financingPlan, 0);
}

@end