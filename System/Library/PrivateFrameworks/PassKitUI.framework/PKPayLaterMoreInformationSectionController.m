@interface PKPayLaterMoreInformationSectionController
- (PKPayLaterMoreInformationSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4;
@end

@implementation PKPayLaterMoreInformationSectionController

- (PKPayLaterMoreInformationSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 financingController];
  v10 = [v9 payLaterAccount];
  v45.receiver = self;
  v45.super_class = (Class)PKPayLaterMoreInformationSectionController;
  v11 = [(PKPayLaterSectionController *)&v45 initWithPayLaterAccount:v10 dynamicContentPage:v8 viewControllerDelegate:0];
  v12 = v11;
  if (v11)
  {
    v31 = v10;
    v32 = v9;
    id v33 = v8;
    id v34 = v7;
    objc_storeStrong((id *)&v11->_setupController, a3);
    v13 = (void *)MEMORY[0x1E4FB1830];
    v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2980]];
    uint64_t v15 = [v13 configurationWithFont:v14];
    iconFontConfiguration = v12->_iconFontConfiguration;
    v12->_iconFontConfiguration = (UIImageSymbolConfiguration *)v15;

    v17 = [(PKPayLaterSectionController *)v12 dynamicContentPage];
    v18 = [v17 sections];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v36 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v42 != v36) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v23 = objc_msgSend(v22, "rows", v31, v32, v33, v34);
          uint64_t v24 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v24)
          {
            uint64_t v25 = v24;
            uint64_t v26 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v25; ++j)
              {
                if (*(void *)v38 != v26) {
                  objc_enumerationMutation(v23);
                }
                v28 = PKImageFromPayLaterDynamicContentPageItem(*(PKPayLaterDynamicContentPageItem **)(*((void *)&v37 + 1) + 8 * j), v12->_iconFontConfiguration, 0);
                [v28 size];
                v12->_maxIconWidth = fmax(v29, v12->_maxIconWidth);
              }
              uint64_t v25 = [v23 countByEnumeratingWithState:&v37 objects:v46 count:16];
            }
            while (v25);
          }
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v20);
    }

    id v8 = v33;
    id v7 = v34;
    v10 = v31;
    v9 = v32;
  }

  return v12;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterMoreInformationSectionController;
  v4 = [(PKPayLaterSectionController *)&v6 layoutWithLayoutEnvironment:a3 sectionIdentifier:a4];
  [v4 contentInsets];
  [v4 setContentInsets:16.0];

  return v4;
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  v5 = [v4 sections];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [NSString stringWithFormat:@"%@%ld", @"section-", v6];
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
  if ([v5 hasPrefix:@"section-"])
  {
    id v7 = [v5 stringByReplacingOccurrencesOfString:@"section-" withString:&stru_1EF1B5B50];
    unint64_t v8 = [v7 integerValue];

    v9 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v10 = [v9 sections];

    if (v8 < [v10 count])
    {
      v11 = [v10 objectAtIndexedSubscript:v8];
      [(PKPayLaterMoreInformationSectionController *)self _configureDynamicSection:v11 snapshot:v6];
    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v22 = a4;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v23 = v6;
  obuint64_t j = [v6 rows];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v25 = *(void *)v28;
    v9 = (void *)*MEMORY[0x1E4FB28C8];
    v10 = (void *)*MEMORY[0x1E4FB27D0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        v12 = *(PKPayLaterDynamicContentPageItem **)(*((void *)&v27 + 1) + 8 * i);
        v13 = PKImageFromPayLaterDynamicContentPageItem(v12, self->_iconFontConfiguration, 0);
        v14 = [PKPayLaterTileDetailIconRow alloc];
        uint64_t v15 = [(PKPayLaterDynamicContentPageItem *)v12 contentTitle];
        v16 = [(PKPayLaterDynamicContentPageItem *)v12 contentSubtitle];
        v17 = [(PKPayLaterTileDetailIconRow *)v14 initWithTitle:v15 detail:v16 iconImage:v13];

        v18 = PKFontForDefaultDesign(v9, v10, 2, 0);
        [(PKPayLaterTileDetailIconRow *)v17 setTitleFont:v18];

        double maxIconWidth = self->_maxIconWidth;
        [v13 size];
        [(PKPayLaterTileDetailIconRow *)v17 setAdditionalIconPadding:fmax(maxIconWidth - v20, 0.0)];
        [v26 safelyAddObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  v21 = (void *)[v26 copy];
  [v22 appendItems:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconFontConfiguration, 0);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end