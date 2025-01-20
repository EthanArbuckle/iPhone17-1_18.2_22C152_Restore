@interface PKThresholdTopUpSelectionSectionController
- (BOOL)editing;
- (BOOL)enabled;
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)valuesEdited;
- (NSArray)identifiers;
- (NSDecimalNumber)currentAmount;
- (NSDecimalNumber)currentThreshold;
- (NSString)amountTitle;
- (NSString)paymentMethodTitle;
- (NSString)thresholdTitle;
- (PKThresholdTopUpSelectionSectionController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 viewStyle:(int64_t)a10 delegate:(id)a11;
- (id)_buttonAccessoryForItem:(id)a3;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)applyUpdate;
- (void)didSelectItem:(id)a3;
- (void)setAmountTitle:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPaymentMethodTitle:(id)a3;
- (void)setThresholdTitle:(id)a3;
- (void)updatePaymentMethod:(id)a3;
@end

@implementation PKThresholdTopUpSelectionSectionController

- (PKThresholdTopUpSelectionSectionController)initWithAmountSuggestions:(id)a3 selectedAmount:(id)a4 thresholdSuggestions:(id)a5 selectedThreshold:(id)a6 currencyCode:(id)a7 paymentMethodName:(id)a8 paymentMethodIdentifier:(id)a9 viewStyle:(int64_t)a10 delegate:(id)a11
{
  id v18 = a3;
  id v19 = a4;
  id obj = a5;
  id v20 = a5;
  id v21 = a6;
  id v35 = a7;
  id v33 = a8;
  id v22 = a8;
  v23 = v21;
  id v34 = a9;
  id v24 = a11;
  v36.receiver = self;
  v36.super_class = (Class)PKThresholdTopUpSelectionSectionController;
  v25 = [(PKThresholdTopUpSelectionSectionController *)&v36 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_amountSuggestions, a3);
    objc_storeStrong((id *)&v26->_thresholdSuggestions, obj);
    objc_storeStrong((id *)&v26->_currencyCode, a7);
    v26->_amountIsExpanded = 1;
    *(_WORD *)&v26->_enabled = 257;
    objc_storeWeak((id *)&v26->_delegate, v24);
    if (v19)
    {
      v27 = (NSDecimalNumber *)v19;
    }
    else
    {
      v27 = [v18 firstObject];
    }
    currentAmount = v26->_currentAmount;
    v26->_currentAmount = v27;

    objc_storeStrong((id *)&v26->_originalAmount, v26->_currentAmount);
    if (v23)
    {
      v29 = v23;
    }
    else
    {
      v29 = [v20 firstObject];
    }
    currentThreshold = v26->_currentThreshold;
    v26->_currentThreshold = v29;

    objc_storeStrong((id *)&v26->_originalThreshold, v26->_currentThreshold);
    objc_storeStrong((id *)&v26->_currentPaymentMethodName, v33);
    objc_storeStrong((id *)&v26->_originalPaymentMethodName, v26->_currentPaymentMethodName);
    objc_storeStrong((id *)&v26->_currentPaymentMethodIdentifier, a9);
    objc_storeStrong((id *)&v26->_originalPaymentMethodIdentifier, v26->_currentPaymentMethodIdentifier);
    v26->_viewStyle = a10;
  }

  return v26;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
  if (!a3)
  {
    *(_WORD *)&self->_amountIsExpanded = 0;
    objc_storeStrong((id *)&self->_currentAmount, self->_originalAmount);
    objc_storeStrong((id *)&self->_currentThreshold, self->_originalThreshold);
    objc_storeStrong((id *)&self->_currentPaymentMethodName, self->_originalPaymentMethodName);
    objc_storeStrong((id *)&self->_currentPaymentMethodIdentifier, self->_originalPaymentMethodIdentifier);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:1];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:1];
}

- (void)applyUpdate
{
  objc_storeStrong((id *)&self->_originalAmount, self->_currentAmount);
  objc_storeStrong((id *)&self->_originalThreshold, self->_currentThreshold);
  objc_storeStrong((id *)&self->_originalPaymentMethodName, self->_currentPaymentMethodName);
  currentPaymentMethodIdentifier = self->_currentPaymentMethodIdentifier;

  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, currentPaymentMethodIdentifier);
}

- (BOOL)valuesEdited
{
  if (PKEqualObjects() && PKEqualObjects()) {
    return PKEqualObjects() ^ 1;
  }
  else {
    return 1;
  }
}

- (NSArray)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"thresholdSelection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  if (!self->_editing) {
    return 0;
  }
  v3 = [a3 identifier];
  if (PKEqualObjects() & 1) != 0 || (PKEqualObjects()) {
    char v4 = 1;
  }
  else {
    char v4 = PKEqualObjects();
  }

  return v4;
}

- (void)updatePaymentMethod:(id)a3
{
  id v4 = a3;
  v5 = [v4 localizedDescription];
  currentPaymentMethodName = self->_currentPaymentMethodName;
  self->_currentPaymentMethodName = v5;

  v7 = [v4 primaryAccountIdentifier];

  currentPaymentMethodIdentifier = self->_currentPaymentMethodIdentifier;
  self->_currentPaymentMethodIdentifier = v7;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"paymentMethodIdentifier"];
  [WeakRetained reloadItem:v9 animated:1];
}

- (void)didSelectItem:(id)a3
{
  id v7 = [a3 identifier];
  if (PKEqualObjects() && !self->_amountIsExpanded)
  {
    __int16 v5 = 1;
LABEL_9:
    *(_WORD *)&self->_amountIsExpanded = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadDataAnimated:1];
    goto LABEL_10;
  }
  if (PKEqualObjects() && !self->_thresholdIsExpanded)
  {
    __int16 v5 = 256;
    goto LABEL_9;
  }
  if (!PKEqualObjects()) {
    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didSelectPaymentMethod];
LABEL_10:

LABEL_11:
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 deselectCells];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == @"thresholdSelection"
    || v7
    && (int v9 = [(__CFString *)v7 isEqualToString:@"thresholdSelection"], v8, v9))
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"amountIdentifier"];
    [v10 addObject:v11];

    if (self->_amountIsExpanded)
    {
      v12 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"amountPickerIdentifier"];
      [v10 addObject:v12];
    }
    v13 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"thresholdIdentifier"];
    [v10 addObject:v13];

    if (self->_thresholdIsExpanded)
    {
      v14 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"thresholdPickerIdentifier"];
      [v10 addObject:v14];
    }
    if ([(NSString *)self->_currentPaymentMethodName length])
    {
      v15 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"paymentMethodIdentifier"];
      [v10 addObject:v15];
    }
    v16 = (void *)[v10 copy];
    [v6 appendItems:v16];
  }

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (PKEqualObjects() & 1) != 0 || (PKEqualObjects())
  {
    objc_initWeak(&location, self);
LABEL_4:
    uint64_t v6 = objc_opt_class();
    id v7 = (void *)MEMORY[0x1E4FB1578];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke;
    v17[3] = &unk_1E59D8D10;
    v8 = &v18;
    objc_copyWeak(&v18, &location);
    v17[4] = self;
    uint64_t v9 = [v7 registrationWithCellClass:v6 configurationHandler:v17];
    goto LABEL_5;
  }
  char v12 = PKEqualObjects();
  objc_initWeak(&location, self);
  if (v12) {
    goto LABEL_4;
  }
  uint64_t v13 = objc_opt_class();
  v14 = (void *)MEMORY[0x1E4FB1578];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_2;
  v15[3] = &unk_1E59D8D38;
  v8 = &v16;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  uint64_t v9 = [v14 registrationWithCellClass:v13 configurationHandler:v15];
LABEL_5:
  id v10 = (void *)v9;
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

  return v10;
}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v9 = [v7 identifier];
    id v10 = v9;
    int v11 = v9 == @"amountIdentifier";
    if (v9 == @"amountIdentifier" || !v9)
    {

      id v21 = v10;
      if (v10) {
        goto LABEL_6;
      }
    }
    else
    {
      int v11 = [(__CFString *)v9 isEqualToString:@"amountIdentifier"];

      if (v10 == @"thresholdIdentifier") {
        goto LABEL_14;
      }
      if (v10)
      {
LABEL_6:
        char v12 = [(__CFString *)v10 isEqualToString:@"thresholdIdentifier"] | v11;

        if ((v12 & 1) == 0)
        {
          uint64_t v13 = v10;
          if (v13 != @"paymentMethodIdentifier")
          {
            v14 = v13;
            int v15 = [(__CFString *)v13 isEqualToString:@"paymentMethodIdentifier"];

            if (!v15) {
              goto LABEL_30;
            }
          }
          id v16 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
          [v16 setText:*(void *)(*(void *)(a1 + 32) + 144)];
          [v16 setSecondaryText:*(void *)(*(void *)(a1 + 32) + 40)];
          int v17 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
          id v18 = [v16 textProperties];
          if (v17)
          {
            id v19 = [MEMORY[0x1E4FB1618] labelColor];
            [v18 setColor:v19];

            id v20 = [v16 secondaryTextProperties];
            [MEMORY[0x1E4FB1618] secondaryLabelColor];
          }
          else
          {
            objc_super v36 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
            [v18 setColor:v36];

            id v20 = [v16 secondaryTextProperties];
            [MEMORY[0x1E4FB1618] tertiaryLabelColor];
          v37 = };
          [v20 setColor:v37];

          if (!*(unsigned char *)(*(void *)(a1 + 32) + 121))
          {
            [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
            goto LABEL_29;
          }
          id v32 = objc_alloc_init(MEMORY[0x1E4FB1518]);
          id v39 = v32;
          id v33 = (void *)MEMORY[0x1E4F1C978];
          id v34 = &v39;
          goto LABEL_27;
        }
LABEL_14:
        id v22 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
        id v16 = v22;
        uint64_t v23 = 136;
        if (v11)
        {
          uint64_t v23 = 128;
          id v24 = (void *)MEMORY[0x1E4F85228];
        }
        else
        {
          id v24 = (void *)MEMORY[0x1E4F85AB0];
        }
        [v22 setText:*(void *)(*(void *)(a1 + 32) + v23)];
        [v6 setAccessibilityIdentifier:*v24];
        int v25 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 120);
        v26 = [v16 textProperties];
        if (v25)
        {
          v27 = [MEMORY[0x1E4FB1618] labelColor];
          [v26 setColor:v27];

          v28 = [v16 secondaryTextProperties];
          [MEMORY[0x1E4FB1618] secondaryLabelColor];
        }
        else
        {
          v29 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
          [v26 setColor:v29];

          v28 = [v16 secondaryTextProperties];
          [MEMORY[0x1E4FB1618] tertiaryLabelColor];
        v30 = };
        [v28 setColor:v30];

        v31 = *(unsigned char **)(a1 + 32);
        if (!v31[121])
        {
          PKCurrencyAmountMake();
          id v32 = (id)objc_claimAutoreleasedReturnValue();
          id v35 = [v32 minimalFormattedStringValue];
          [v16 setSecondaryText:v35];

          [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
LABEL_28:

LABEL_29:
          [v6 setContentConfiguration:v16];

LABEL_30:
          goto LABEL_31;
        }
        id v32 = [v31 _buttonAccessoryForItem:v7];
        v40[0] = v32;
        id v33 = (void *)MEMORY[0x1E4F1C978];
        id v34 = (id *)v40;
LABEL_27:
        v38 = [v33 arrayWithObjects:v34 count:1];
        [v6 setAccessories:v38];

        goto LABEL_28;
      }
    }
    if (!v11) {
      goto LABEL_30;
    }
    int v11 = 1;
    goto LABEL_14;
  }
LABEL_31:
}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a2;
  id v33 = a3;
  id v34 = a4;
  from = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = [v34 identifier];
    [v35 setAccessibilityIdentifier:v7];
    v8 = v7;
    uint64_t v9 = v8;
    if (v8 == @"amountPickerIdentifier") {
      goto LABEL_5;
    }
    if (!v8)
    {
LABEL_18:

      goto LABEL_19;
    }
    int v10 = [(__CFString *)v8 isEqualToString:@"amountPickerIdentifier"];

    if (v10)
    {
LABEL_5:
      v31 = v9;
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v12 = WeakRetained[9];
      uint64_t v13 = 0;
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v46;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = PKCurrencyAmountMake();
            id v18 = [v17 minimalFormattedStringValue];
            if (PKEqualObjects())
            {
              id v19 = v18;

              uint64_t v13 = v19;
            }
            [v11 addObject:v18];

            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v14);
      }

      [v35 setValues:v11];
      if (v13) {
        [v35 updateSelectedValue:v13];
      }
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_3;
      v43[3] = &unk_1E59D0FB8;
      id v20 = &v44;
      objc_copyWeak(&v44, from);
      [v35 setSelectionChanged:v43];
    }
    else
    {
      id v21 = v9;
      if (v21 != @"thresholdPickerIdentifier")
      {
        id v22 = v21;
        int v23 = [(__CFString *)v21 isEqualToString:@"thresholdPickerIdentifier"];

        if (!v23) {
          goto LABEL_18;
        }
      }
      v31 = v9;
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v24 = WeakRetained[10];
      uint64_t v13 = 0;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v40;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = PKCurrencyAmountMake();
            v29 = [v28 minimalFormattedStringValue];
            if (PKEqualObjects())
            {
              id v30 = v29;

              uint64_t v13 = v30;
            }
            [v11 addObject:v29];

            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v49 count:16];
        }
        while (v25);
      }

      [v35 setValues:v11];
      if (v13) {
        [v35 updateSelectedValue:v13];
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_4;
      v37[3] = &unk_1E59D0FB8;
      id v20 = &v38;
      objc_copyWeak(&v38, from);
      [v35 setSelectionChanged:v37];
    }
    objc_destroyWeak(v20);

    uint64_t v9 = v31;
    goto LABEL_18;
  }
LABEL_19:
}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    uint64_t v4 = [WeakRetained[9] objectAtIndex:a2];
    id v5 = v8[1];
    v8[1] = (id)v4;

    id v6 = objc_loadWeakRetained(v8 + 14);
    id v7 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"amountIdentifier"];
    [v6 reloadItem:v7 animated:1];

    id WeakRetained = v8;
  }
}

void __70__PKThresholdTopUpSelectionSectionController_cellRegistrationForItem___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    uint64_t v4 = [WeakRetained[10] objectAtIndex:a2];
    id v5 = v8[2];
    v8[2] = (id)v4;

    id v6 = objc_loadWeakRetained(v8 + 14);
    id v7 = [[PKThresholdTopUpSelectionItem alloc] initWithIdentifier:@"thresholdIdentifier"];
    [v6 reloadItem:v7 animated:1];

    id WeakRetained = v8;
  }
}

- (id)_buttonAccessoryForItem:(id)a3
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__PKThresholdTopUpSelectionSectionController__buttonAccessoryForItem___block_invoke;
  v30[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v32, &location);
  id v6 = v4;
  id v31 = v6;
  id v7 = [v5 actionWithHandler:v30];
  v8 = [v6 identifier];
  uint64_t v9 = (void *)MEMORY[0x1E4FB14D0];
  int v10 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  id v11 = [v9 buttonWithConfiguration:v10 primaryAction:v7];

  id v12 = [v11 configuration];
  uint64_t v13 = [MEMORY[0x1E4FB1618] labelColor];
  uint64_t v14 = v8;
  uint64_t v15 = v14;
  if (v14 == @"amountIdentifier")
  {
LABEL_4:
    int v17 = PKCurrencyAmountMake();
    if (!self->_amountIsExpanded) {
      goto LABEL_15;
    }
    if (self->_viewStyle == 2) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
  if (!v14) {
    goto LABEL_13;
  }
  int v16 = [(__CFString *)v14 isEqualToString:@"amountIdentifier"];

  if (v16) {
    goto LABEL_4;
  }
  id v19 = v15;
  if (v19 == @"thresholdIdentifier"
    || (id v20 = v19,
        int v21 = [(__CFString *)v19 isEqualToString:@"thresholdIdentifier"],
        v20,
        v21))
  {
    int v17 = PKCurrencyAmountMake();
    if (self->_thresholdIsExpanded)
    {
      if (self->_viewStyle == 2)
      {
LABEL_6:
        PKBridgeButtonTextColor();
        uint64_t v18 = LABEL_7:;
        id v22 = (void *)v18;

        uint64_t v13 = v22;
        goto LABEL_15;
      }
LABEL_14:
      [MEMORY[0x1E4FB1618] linkColor];
      goto LABEL_7;
    }
  }
  else
  {
LABEL_13:
    int v17 = 0;
  }
LABEL_15:
  id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
  id v24 = [v17 minimalFormattedStringValue];
  uint64_t v34 = *MEMORY[0x1E4FB0700];
  v35[0] = v13;
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  uint64_t v26 = (void *)[v23 initWithString:v24 attributes:v25];
  [v12 setAttributedTitle:v26];

  [v11 setConfiguration:v12];
  uint64_t v27 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  [v11 setTintColor:v27];

  v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v11 placement:1];
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v28;
}

void __70__PKThresholdTopUpSelectionSectionController__buttonAccessoryForItem___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didSelectItem:*(void *)(a1 + 32)];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1558];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppearance:2];
  id v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  [v7 contentInsets];
  [v7 setContentInsets:11.0];

  return v7;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)editing
{
  return self->_editing;
}

- (NSString)amountTitle
{
  return self->_amountTitle;
}

- (void)setAmountTitle:(id)a3
{
}

- (NSString)thresholdTitle
{
  return self->_thresholdTitle;
}

- (void)setThresholdTitle:(id)a3
{
}

- (NSString)paymentMethodTitle
{
  return self->_paymentMethodTitle;
}

- (void)setPaymentMethodTitle:(id)a3
{
}

- (NSDecimalNumber)currentAmount
{
  return self->_currentAmount;
}

- (NSDecimalNumber)currentThreshold
{
  return self->_currentThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodTitle, 0);
  objc_storeStrong((id *)&self->_thresholdTitle, 0);
  objc_storeStrong((id *)&self->_amountTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_thresholdSuggestions, 0);
  objc_storeStrong((id *)&self->_amountSuggestions, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_currentPaymentMethodIdentifier, 0);
  objc_storeStrong((id *)&self->_originalPaymentMethodName, 0);
  objc_storeStrong((id *)&self->_currentPaymentMethodName, 0);
  objc_storeStrong((id *)&self->_originalThreshold, 0);
  objc_storeStrong((id *)&self->_originalAmount, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);

  objc_storeStrong((id *)&self->_currentAmount, 0);
}

@end