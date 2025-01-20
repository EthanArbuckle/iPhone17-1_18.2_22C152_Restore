@interface PKPayLaterProductOptionsSectionController
- (PKPayLaterProductOptionsSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 delegate:(id)a5;
- (id)_productAssessmentForSectionIdentifier:(id)a3 outIndex:(int64_t *)a4;
- (id)_productTileDetailRowForProductAssessment:(id)a3 installmentIndex:(int64_t)a4;
- (id)_tileDetailRowWithTitle:(id)a3 subtitle:(id)a4 text:(id)a5 detailText:(id)a6 textSubtitle:(id)a7 customView:(id)a8 financingOption:(id)a9 preliminaryAssessment:(id)a10;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (int64_t)_productAssessmentInstallmentCount:(id)a3;
- (void)_configureProductSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4;
- (void)_configureShowMoreOptionsButtonSectionWithSnapshot:(id)a3;
- (void)configureCellForRegistration:(id)a3 item:(id)a4;
@end

@implementation PKPayLaterProductOptionsSectionController

- (PKPayLaterProductOptionsSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  v12 = [v9 financingController];
  v13 = [v12 payLaterAccount];
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterProductOptionsSectionController;
  v14 = [(PKPayLaterSectionController *)&v18 initWithPayLaterAccount:v13 dynamicContentPage:v11 viewControllerDelegate:v10];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_setupController, a3);
    objc_storeWeak((id *)&v14->_delegate, v10);
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    numberFormatter = v14->_numberFormatter;
    v14->_numberFormatter = v15;

    v14->_showAllOptions = 0;
  }

  return v14;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterProductOptionsSectionController;
  id v7 = a4;
  [(PKPayLaterSectionController *)&v9 configureCellForRegistration:v6 item:v7];
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if (self)
  {
    v8 = objc_msgSend(MEMORY[0x1E4FB1498], "clearConfiguration", v9.receiver, v9.super_class);
    [v6 setBackgroundConfiguration:v8];
  }
  else
  {
    PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v6);
  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterProductOptionsSectionController;
  id v7 = [(PKPayLaterSectionController *)&v12 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  v8 = (__CFString *)v6;
  objc_super v9 = v8;
  if (v8 == @"kShowMoreOptionsButtonSection"
    || v8
    && (int v10 = [(__CFString *)v8 isEqualToString:@"kShowMoreOptionsButtonSection"],
        v9,
        v10))
  {
    [v7 contentInsets];
    [v7 setContentInsets:0.0];
  }

  return v7;
}

- (id)identifiers
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(PKPayLaterSetupFlowController *)self->_setupController controllerContext];
  v4 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  v5 = [v4 assessmentCollection];

  unint64_t v6 = [(PKPayLaterSetupFlowController *)self->_setupController selectedProductType];
  if (v6 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke;
  aBlock[3] = &unk_1E59D5970;
  v37 = self;
  aBlock[4] = self;
  id v10 = v9;
  id v46 = v10;
  id v36 = v8;
  id v47 = v36;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  v34 = [v5 productAssessmentForProductType:v7];
  v11[2](v11);
  v35 = v5;
  objc_super v12 = [v5 eligibleProductAssessments];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke_2;
  v44[3] = &__block_descriptor_40_e44_B32__0__PKPayLaterProductAssessment_8Q16_B24l;
  v44[4] = v7;
  v13 = objc_msgSend(v12, "pk_objectsPassingTest:", v44);

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v41 != v17) {
          objc_enumerationMutation(v14);
        }
        ((void (*)(void (**)(void), void))v11[2])(v11, *(void *)(*((void *)&v40 + 1) + 8 * i));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v16);
  }

  uint64_t v19 = [v10 copy];
  formattedIdentifiersByProductType = v37->_formattedIdentifiersByProductType;
  v37->_formattedIdentifiersByProductType = (NSDictionary *)v19;

  v21 = v36;
  uint64_t v22 = [v36 copy];
  sortedProductTypeSections = v37->_sortedProductTypeSections;
  v37->_sortedProductTypeSections = (NSArray *)v22;

  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v36 count])
  {
    unint64_t v24 = 0;
    unint64_t v38 = v3 - 1;
    do
    {
      v25 = [v21 objectAtIndexedSubscript:v24];
      v26 = [v10 objectForKey:v25];
      v27 = v26;
      if (v24 || v38 < 3)
      {
        [v39 addObjectsFromArray:v26];
      }
      else
      {
        uint64_t v28 = [v26 count];
        double v29 = fmin((double)v28, 3.0);
        if (v37->_showAllOptions) {
          unint64_t v30 = v28;
        }
        else {
          unint64_t v30 = (uint64_t)v29;
        }
        v31 = objc_msgSend(v27, "subarrayWithRange:", 0, v30);
        [v39 addObjectsFromArray:v31];

        v21 = v36;
        if (!v37->_showAllOptions && [v27 count] > v30) {
          [v39 addObject:@"kShowMoreOptionsButtonSection"];
        }
      }

      ++v24;
    }
    while (v24 < [v21 count]);
  }
  v32 = (void *)[v39 copy];

  return v32;
}

void __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke(id *a1, void *a2)
{
  id v13 = a2;
  int v3 = [v13 isEligible];
  v4 = v13;
  if (v3)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "productType"));
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = [a1[4] _productAssessmentInstallmentCount:v13];
    if (v7 >= 1)
    {
      uint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        id v10 = NSString;
        [v5 integerValue];
        id v11 = PKPayLaterAccountProductTypeToString();
        objc_super v12 = [v10 stringWithFormat:@"%@%ld", v11, i];
        [v6 addObject:v12];
      }
    }
    if ([v6 count]) {
      [a1[5] setObject:v6 forKey:v5];
    }
    [a1[6] addObject:v5];

    v4 = v13;
  }
}

BOOL __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 productType] != *(void *)(a1 + 32);
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSArray *)self->_sortedProductTypeSections count])
  {
    v5 = [(NSArray *)self->_sortedProductTypeSections objectAtIndexedSubscript:0];
    id v6 = [(NSDictionary *)self->_formattedIdentifiersByProductType objectForKey:v5];
    if ([v6 count])
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(NSArray *)self->_sortedProductTypeSections count] < 2)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_sortedProductTypeSections objectAtIndexedSubscript:1];
    id v9 = [(NSDictionary *)self->_formattedIdentifiersByProductType objectForKey:v8];
    if ([v9 count])
    {
      id v10 = [v9 objectAtIndexedSubscript:0];
    }
    else
    {
      id v10 = 0;
    }
  }
  id v11 = v4;
  id v12 = v7;
  id v13 = v12;
  if (v12 == v11)
  {

    goto LABEL_19;
  }
  if (v11 && v12)
  {
    int v14 = [v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_21;
    }
LABEL_19:
    uint64_t v15 = [(PKPayLaterSectionController *)self dynamicContentPage];
    uint64_t v16 = v15;
    uint64_t v17 = 1;
    goto LABEL_28;
  }

LABEL_21:
  id v18 = v11;
  id v19 = v10;
  if (v19 == v18)
  {
  }
  else
  {
    v20 = v19;
    if (!v11 || !v19)
    {

      goto LABEL_31;
    }
    int v21 = [v18 isEqualToString:v19];

    if (!v21) {
      goto LABEL_31;
    }
  }
  uint64_t v15 = [(PKPayLaterSectionController *)self dynamicContentPage];
  uint64_t v16 = v15;
  uint64_t v17 = 3;
LABEL_28:
  uint64_t v22 = [v15 productSectionForType:v17];

  v23 = [v22 contentTitle];

  if (v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    v25 = [v23 uppercaseString];
    v31[0] = *MEMORY[0x1E4FB06F8];
    v26 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v32[0] = v26;
    v31[1] = *MEMORY[0x1E4FB0700];
    v27 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v32[1] = v27;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    double v29 = (void *)[v24 initWithString:v25 attributes:v28];

    goto LABEL_32;
  }
LABEL_31:
  double v29 = 0;
LABEL_32:

  return v29;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(PKPayLaterProductOptionsSectionController *)self identifiers];
  id v6 = [v5 lastObject];
  id v7 = v4;
  id v8 = v6;
  if (v8 == v7)
  {

    goto LABEL_7;
  }
  id v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  char v10 = [v7 isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    id v11 = [(PKPayLaterSectionController *)self dynamicContentPage];
    id v12 = [v11 footerContent];
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  id v13 = [(PKPayLaterProductOptionsSectionController *)self _productAssessmentForSectionIdentifier:v7 outIndex:&v24];
  id v11 = v13;
  unint64_t v14 = v24;
  if (v24 < 0
    || ([v13 financingOptions],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unint64_t v16 = [v15 count],
        v15,
        v14 >= v16))
  {
    id v18 = 0;
  }
  else
  {
    uint64_t v17 = [v11 financingOptions];
    id v18 = [v17 objectAtIndexedSubscript:v24];
  }
  id v19 = [(PKPayLaterSectionController *)self dynamicContentPage];
  uint64_t v20 = [v11 productType];
  int v21 = [v18 identifier];
  uint64_t v22 = [v19 dynamicContentPageForProductType:v20 optionIdentifier:v21];
  id v12 = [v22 footerContent];

LABEL_14:

  return v12;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 hasPrefix:@"kShowMoreOptionsButtonSection"]) {
    [(PKPayLaterProductOptionsSectionController *)self _configureShowMoreOptionsButtonSectionWithSnapshot:v6];
  }
  else {
    [(PKPayLaterProductOptionsSectionController *)self _configureProductSectionWithSectionIdentifier:v5 snapshot:v6];
  }

  return v6;
}

- (void)_configureProductSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  char v10 = [(PKPayLaterProductOptionsSectionController *)self _productAssessmentForSectionIdentifier:v8 outIndex:&v13];

  id v11 = [(PKPayLaterProductOptionsSectionController *)self _productTileDetailRowForProductAssessment:v10 installmentIndex:v13];
  [v9 safelyAddObject:v11];
  if ([v9 count])
  {
    id v12 = (void *)[v9 copy];
    [v6 appendItems:v12];
  }
}

- (void)_configureShowMoreOptionsButtonSectionWithSnapshot:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(PKPayLaterSectionController *)self dynamicContentPage];
  id v7 = [v6 productSectionForType:1];

  id v8 = [v7 linkText];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    PKLocalizedCocoonString(&cfstr_ShowMoreOption.isa);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v11 = v10;

  id v12 = [v7 systemImageName];
  uint64_t v13 = (void *)MEMORY[0x1E4FB1830];
  unint64_t v14 = [MEMORY[0x1E4FB1618] linkColor];
  uint64_t v15 = [v13 configurationWithHierarchicalColor:v14];

  if (v12)
  {
    unint64_t v16 = [MEMORY[0x1E4FB1818] systemImageNamed:v12 withConfiguration:v15];
  }
  else
  {
    unint64_t v16 = 0;
  }
  objc_initWeak(&location, self);
  uint64_t v17 = [PKPayLaterButtonRow alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__PKPayLaterProductOptionsSectionController__configureShowMoreOptionsButtonSectionWithSnapshot___block_invoke;
  v20[3] = &unk_1E59CB010;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  id v18 = [(PKPayLaterButtonRow *)v17 initWithTitle:v11 selectionHandler:v20];
  [(PKPayLaterButtonRow *)v18 setImage:v16];
  [v5 addObject:v18];
  id v19 = (void *)[v5 copy];
  [v4 appendItems:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __96__PKPayLaterProductOptionsSectionController__configureShowMoreOptionsButtonSectionWithSnapshot___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[120] = *(unsigned char *)(*(void *)(a1 + 32) + 120) ^ 1;
    id v4 = WeakRetained;
    int v3 = [WeakRetained dynamicCollectionDelegate];
    [v3 reloadDataAnimated:1];

    WeakRetained = v4;
  }
}

- (id)_productTileDetailRowForProductAssessment:(id)a3 installmentIndex:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 preliminaryAssessment];
  id v8 = [v6 financingOptions];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    id v19 = 0;
    if (a4 < 0 || !v7) {
      goto LABEL_17;
    }
    uint64_t v20 = [v7 installmentPlans];
    unint64_t v21 = [v20 count];

    if (v21 > a4)
    {
      v33 = self;
      unint64_t v14 = [(PKPayLaterSectionController *)self dynamicContentPage];
      unint64_t v16 = objc_msgSend(v14, "dynamicContentPageForProductType:optionIdentifier:", objc_msgSend(v6, "productType"), 0);
      id v18 = [v16 contentItem];
      v34 = 0;
      goto LABEL_9;
    }
LABEL_12:
    id v19 = 0;
    goto LABEL_17;
  }
  if (a4 < 0) {
    goto LABEL_12;
  }
  id v10 = [v6 financingOptions];
  unint64_t v11 = [v10 count];

  if (v11 <= a4) {
    goto LABEL_12;
  }
  id v12 = [v6 financingOptions];
  uint64_t v13 = [v12 objectAtIndexedSubscript:a4];

  v33 = self;
  unint64_t v14 = [(PKPayLaterSectionController *)self dynamicContentPage];
  uint64_t v15 = [v6 productType];
  v34 = v13;
  unint64_t v16 = [v13 identifier];
  uint64_t v17 = [v14 dynamicContentPageForProductType:v15 optionIdentifier:v16];
  id v18 = [v17 contentItem];

LABEL_9:
  uint64_t v22 = [v18 contentTitle];
  v23 = [v18 contentSubtitle];
  uint64_t v24 = [v18 contentDetailLeading];
  v25 = [v18 contentDetailTrailing];
  v26 = [v18 contentDetailSubtitleLeading];
  if (v22)
  {
    if (+[PKPayLaterScheduleView canFormScheduleViewForDynamincContentItem:v18])
    {
      v27 = [[PKPayLaterScheduleView alloc] initWithDynamicContentItem:v18];
    }
    else
    {
      v27 = 0;
    }
    uint64_t v28 = v34;
    v31 = v7;
    v32 = v7;
    double v29 = v27;
    id v19 = [(PKPayLaterProductOptionsSectionController *)v33 _tileDetailRowWithTitle:v22 subtitle:v23 text:v24 detailText:v25 textSubtitle:v26 customView:v27 financingOption:v34 preliminaryAssessment:v31];

    id v7 = v32;
  }
  else
  {
    id v19 = 0;
    uint64_t v28 = v34;
  }

LABEL_17:

  return v19;
}

- (id)_tileDetailRowWithTitle:(id)a3 subtitle:(id)a4 text:(id)a5 detailText:(id)a6 textSubtitle:(id)a7 customView:(id)a8 financingOption:(id)a9 preliminaryAssessment:(id)a10
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v16 = a6;
  id v17 = a7;
  id v33 = a8;
  id v18 = a9;
  id v19 = a10;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__PKPayLaterProductOptionsSectionController__tileDetailRowWithTitle_subtitle_text_detailText_textSubtitle_customView_financingOption_preliminaryAssessment___block_invoke;
  aBlock[3] = &unk_1E59CB378;
  objc_copyWeak(&v40, &location);
  id v20 = v18;
  id v38 = v20;
  id v21 = v19;
  id v39 = v21;
  uint64_t v22 = _Block_copy(aBlock);
  v23 = [(PKPayLaterSectionController *)self dynamicContentPage];
  uint64_t v24 = [v23 pageType];

  v25 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  v26 = [v25 assessmentCollection];

  v27 = [v26 eligibleProductAssessments];
  uint64_t v28 = [v27 count];

  if (v24 == 11 || v24 == 6 && v28 == 1)
  {
    double v29 = v17;
    unint64_t v30 = v16;

    uint64_t v22 = 0;
  }
  else
  {
    double v29 = v17;
    unint64_t v30 = v16;
  }
  v31 = [[PKPayLaterTileDetailRow alloc] initWithTitleText:v36 subtitleText:v35 text:v34 detailText:v30 textSubtitle:v29 customView:v33 selectionHandler:v22];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v31;
}

void __156__PKPayLaterProductOptionsSectionController__tileDetailRowWithTitle_subtitle_text_detailText_textSubtitle_customView_financingOption_preliminaryAssessment___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = WeakRetained;
      id v3 = objc_loadWeakRetained(WeakRetained + 13);
      [v3 productOptionsSectionController:v4 didSelectFinancingOption:*(void *)(a1 + 32)];
    }
    else
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_7;
      }
      id v4 = WeakRetained;
      id v3 = objc_loadWeakRetained(WeakRetained + 13);
      [v3 productOptionsSectionController:v4 didSelectPreliminaryAssessment:*(void *)(a1 + 40)];
    }

    WeakRetained = v4;
  }
LABEL_7:
}

- (int64_t)_productAssessmentInstallmentCount:(id)a3
{
  id v3 = a3;
  id v4 = [v3 financingOptions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [v3 financingOptions];

    int64_t v7 = [v6 count];
    return v7;
  }
  else
  {
    uint64_t v9 = [v3 preliminaryAssessment];

    id v10 = [v9 installmentPlans];
    int64_t v11 = [v10 count] != 0;

    return v11;
  }
}

- (id)_productAssessmentForSectionIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6 = a3;
  int64_t v7 = [(PKPayLaterSetupFlowController *)self->_setupController financingController];
  id v8 = [v7 assessmentCollection];

  uint64_t v9 = PKPayLaterAccountProductTypeToString();
  if (![v6 hasPrefix:v9])
  {
    id v12 = 0;
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v10 = [v6 stringByReplacingOccurrencesOfString:v9 withString:&stru_1EF1B5B50];
  int64_t v11 = [v10 integerValue];

  id v12 = [v8 productAssessmentForProductType:1];
  if (a4) {
LABEL_5:
  }
    *a4 = v11;
LABEL_6:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedIdentifiersByProductType, 0);
  objc_storeStrong((id *)&self->_sortedProductTypeSections, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_setupController, 0);
}

@end