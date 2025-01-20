@interface PKPayLaterBusinessChatTopicExplanationSectionController
- (PKPayLaterBusinessChatTopicExplanationSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContentPage:(id)a9 delegate:(id)a10;
- (id)_firstSectionIdentifier;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4;
- (void)applyHeaderConfigurationProperties:(id)a3 sectionIdentifier:(id)a4;
@end

@implementation PKPayLaterBusinessChatTopicExplanationSectionController

- (PKPayLaterBusinessChatTopicExplanationSectionController)initWithPayLaterAccount:(id)a3 payLaterPass:(id)a4 financingPlan:(id)a5 installment:(id)a6 payment:(id)a7 topic:(id)a8 dynamicContentPage:(id)a9 delegate:(id)a10
{
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPayLaterBusinessChatTopicExplanationSectionController;
  v18 = [(PKPayLaterSectionController *)&v25 initWithPayLaterAccount:a3 dynamicContentPage:a9 viewControllerDelegate:a10];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_financingPlan, a5);
    objc_storeStrong((id *)&v19->_payLaterPass, a4);
    objc_storeStrong((id *)&v19->_installment, a6);
    objc_storeStrong((id *)&v19->_payment, a7);
    objc_storeStrong((id *)&v19->_topic, a8);
  }

  return v19;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPayLaterBusinessChatTopicExplanationSectionController *)self _firstSectionIdentifier];
  id v6 = v4;
  id v7 = v5;
  if (v7 == v6)
  {

    goto LABEL_7;
  }
  v8 = v7;
  if (v6 && v7)
  {
    int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_9;
    }
LABEL_7:
    v10 = [(PKPayLaterSectionController *)self dynamicContentPage];
    v11 = [v10 headerSubtitle];

    id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
    v18[0] = *MEMORY[0x1E4FB06F8];
    v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2998], (void *)*MEMORY[0x1E4FB27D0], 2, 0);
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4FB0700];
    v14 = [MEMORY[0x1E4FB1618] labelColor];
    v19[1] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    v16 = (void *)[v12 initWithString:v11 attributes:v15];

    goto LABEL_10;
  }

LABEL_9:
  v16 = 0;
LABEL_10:

  return v16;
}

- (void)applyHeaderConfigurationProperties:(id)a3 sectionIdentifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(PKPayLaterBusinessChatTopicExplanationSectionController *)self _firstSectionIdentifier];
  id v8 = v6;
  id v9 = v7;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  int v11 = [v8 isEqualToString:v9];

  if (v11)
  {
LABEL_7:
    v10 = [v12 textProperties];
    [v10 setAlignment:1];
LABEL_9:
  }
}

- (id)identifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(PKPayLaterSectionController *)self dynamicContentPage];
  v5 = [v4 sections];

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

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPayLaterBusinessChatTopicExplanationSectionController *)self identifiers];
  id v9 = [v8 firstObject];
  id v10 = v6;
  id v11 = v9;
  id v12 = v11;
  if (v11 == v10)
  {
    int v13 = 1;
  }
  else
  {
    int v13 = 0;
    if (v10 && v11) {
      int v13 = [v10 isEqualToString:v11];
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterBusinessChatTopicExplanationSectionController;
  v14 = [(PKPayLaterSectionController *)&v17 layoutWithLayoutEnvironment:v7 sectionIdentifier:v10];

  [v14 contentInsets];
  if (v13) {
    double v15 = 16.0;
  }
  [v14 setContentInsets:v15];

  return v14;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 hasPrefix:@"kExplanationSectionPrefix-"])
  {
    id v7 = [v5 stringByReplacingOccurrencesOfString:@"kExplanationSectionPrefix-" withString:&stru_1EF1B5B50];
    unint64_t v8 = [v7 integerValue];

    id v9 = [(PKPayLaterSectionController *)self dynamicContentPage];
    id v10 = [v9 sections];

    if (v8 < [v10 count])
    {
      id v11 = [v10 objectAtIndexedSubscript:v8];
      [(PKPayLaterBusinessChatTopicExplanationSectionController *)self _configureDynamicSection:v11 snapshot:v6];
    }
  }

  return v6;
}

- (void)_configureDynamicSection:(id)a3 snapshot:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v33 = a4;
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = (void *)MEMORY[0x1E4FB1830];
  v39 = (void *)*MEMORY[0x1E4FB28C8];
  id v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
  v40 = [v6 configurationWithFont:v7];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v34 = v5;
  id obj = [v5 rows];
  uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v41)
  {
    uint64_t v38 = *(void *)v46;
    v37 = (void *)*MEMORY[0x1E4FB27D0];
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v46 != v38) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v10 = [PKMultiStackedLabelSource alloc];
        id v11 = [v9 contentTitle];
        id v12 = [(PKMultiStackedLabelSource *)v10 initWithText:v11];

        int v13 = [MEMORY[0x1E4FB1618] labelColor];
        v14 = PKImageFromPayLaterDynamicContentPageItem((PKPayLaterDynamicContentPageItem *)v9, v40, v13);
        [(PKMultiStackedLabelSource *)v12 setIcon:v14];

        double v15 = PKFontForDefaultDesign(v39, v37, 2, 0);
        [(PKMultiStackedLabelSource *)v12 setFont:v15];

        v16 = [MEMORY[0x1E4FB1618] labelColor];
        [(PKMultiStackedLabelSource *)v12 setTextColor:v16];

        objc_super v17 = [PKMultiStackedLabelSource alloc];
        v18 = [v9 contentSubtitle];
        v19 = [(PKMultiStackedLabelSource *)v17 initWithText:v18];

        v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PKMultiStackedLabelSource *)v19 setTextColor:v20];

        id v21 = [PKPayLaterStackedLabelRow alloc];
        v49[0] = v12;
        v49[1] = v19;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
        id v23 = [(PKPayLaterStackedLabelRow *)v21 initWithSources:v22];

        [(PKPayLaterStackedLabelRow *)v23 setPaddingBetweenRows:8.0];
        [v42 safelyAddObject:v23];
        id v24 = [v9 linkText];
        if ([v24 length])
        {
          objc_super v25 = [v9 linkURL];
          if (v25)
          {
            id v26 = objc_alloc_init(MEMORY[0x1E4F84490]);
            [v26 setLinkText:v24];
            [v26 setLinkURL:v25];
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __93__PKPayLaterBusinessChatTopicExplanationSectionController__configureDynamicSection_snapshot___block_invoke;
            aBlock[3] = &unk_1E59CA870;
            aBlock[4] = self;
            id v44 = v26;
            id v27 = v26;
            v28 = _Block_copy(aBlock);
          }
          else
          {
            v28 = 0;
          }
          v29 = [PKPayLaterTitleDetailRow alloc];
          v30 = [v9 linkText];
          v31 = [(PKPayLaterTitleDetailRow *)v29 initWithTitle:v30 detail:0 selectionHandler:v28];

          [v42 addObject:v31];
        }
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v41);
  }

  v32 = (void *)[v42 copy];
  [v33 appendItems:v32];
}

void __93__PKPayLaterBusinessChatTopicExplanationSectionController__configureDynamicSection_snapshot___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dynamicCollectionDelegate];
  [v2 didTapHyperLink:*(void *)(a1 + 40)];
}

- (id)_firstSectionIdentifier
{
  return (id)[NSString stringWithFormat:@"%@%ld", @"kExplanationSectionPrefix-", 0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_installment, 0);
  objc_storeStrong((id *)&self->_financingPlan, 0);

  objc_storeStrong((id *)&self->_payLaterPass, 0);
}

@end