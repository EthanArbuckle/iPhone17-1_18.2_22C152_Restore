@interface PKMemoIconChooserSectionController
+ (double)_itemSizeForStyle:(unint64_t)a3;
+ (double)_minimumWidthForStyle:(unint64_t)a3;
+ (unint64_t)suggestedStyleForAvailableWidth:(double)a3;
- (NSArray)identifiers;
- (PKMemoIconChooserSectionController)initWithDelegate:(id)a3 mode:(unint64_t)a4 memo:(id)a5;
- (double)_selectionPreviewBottomSpacing;
- (double)_selectionPreviewTopSpacing;
- (id)cellRegistrationForItem:(id)a3;
- (id)contextMenuConfigurationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)selectedMemo;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (unint64_t)style;
- (void)addMemo:(id)a3;
- (void)cell:(id)a3 didUpdateText:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)reloadItems;
- (void)setMemoSelection:(id)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation PKMemoIconChooserSectionController

- (PKMemoIconChooserSectionController)initWithDelegate:(id)a3 mode:(unint64_t)a4 memo:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PKMemoIconChooserSectionController;
  v10 = [(PKMemoIconChooserSectionController *)&v43 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11->_mode = a4;
    v11->_style = 1;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v11->_items;
    v11->_items = v12;

    if (a4 == 1)
    {
      id v34 = v8;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v23 = PKPeerPaymentRecurringPaymentMemoColors();
      uint64_t v24 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(v23);
            }
            v28 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            id v29 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
            objc_msgSend(v29, "setColor:", objc_msgSend(v28, "integerValue"));
            v30 = v11->_items;
            v31 = [[PKMemoItem alloc] initWithMemo:v29 type:0];
            [(NSMutableArray *)v30 addObject:v31];
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v25);
      }

      v16 = [(NSMutableArray *)v11->_items firstObject];
      v32 = [v16 memo];
      [(PKMemoIconChooserSectionController *)v11 setMemoSelection:v32];

      id v8 = v34;
      goto LABEL_20;
    }
    if (!a4)
    {
      [(PKMemoIconChooserSectionController *)v11 setMemoSelection:v9];
      v14 = [[PKMemoItem alloc] initWithMemo:0 type:1];
      addNewItem = v11->_addNewItem;
      v11->_addNewItem = v14;

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v16 = PKPeerPaymentRecurringPaymentMemoSuggestions();
      uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v40;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v40 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = v11->_items;
            v22 = [[PKMemoItem alloc] initWithMemo:*(void *)(*((void *)&v39 + 1) + 8 * j) type:0];
            [(NSMutableArray *)v21 addObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v18);
      }
LABEL_20:
    }
  }

  return v11;
}

- (void)reloadItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(NSMutableArray *)self->_items removeAllObjects];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = PKPeerPaymentRecurringPaymentMemoSuggestions();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        items = self->_items;
        v10 = [PKMemoItem alloc];
        v11 = -[PKMemoItem initWithMemo:type:](v10, "initWithMemo:type:", v8, 0, (void)v13);
        [(NSMutableArray *)items addObject:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataForSectionIdentifier:@"chooser" animated:1];
}

- (NSArray)identifiers
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"selectionPresent";
  v4[1] = @"selectionEmpty";
  v4[2] = @"chooser";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  uint64_t v7 = (__CFString *)v5;
  uint64_t v8 = v7;
  if (v7 == @"chooser") {
    goto LABEL_23;
  }
  if (!v7) {
    goto LABEL_7;
  }
  int v9 = [(__CFString *)v7 isEqualToString:@"chooser"];

  if (v9)
  {
LABEL_23:
    if (!self->_mode)
    {
      v28[0] = self->_addNewItem;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      [v6 appendItems:v10];
    }
    [v6 appendItems:self->_items];
    goto LABEL_7;
  }
  v12 = v8;
  if (v12 == @"selectionPresent"
    || (long long v13 = v12,
        int v14 = [(__CFString *)v12 isEqualToString:@"selectionPresent"],
        v13,
        v14))
  {
    long long v15 = [(PKMemoItem *)self->_selectionItem memo];
    long long v16 = [v15 emoji];
    if ([v16 length])
    {
    }
    else
    {
      unint64_t mode = self->_mode;

      if (mode != 1)
      {
LABEL_20:

        goto LABEL_7;
      }
    }
    selectionItem = self->_selectionItem;
    uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&selectionItem count:1];
    [v6 appendItems:v25];

    goto LABEL_20;
  }
  uint64_t v17 = v13;
  if (v17 == @"selectionEmpty"
    || (uint64_t v18 = v17,
        int v19 = [(__CFString *)v17 isEqualToString:@"selectionEmpty"],
        v18,
        v19))
  {
    v20 = [(PKMemoItem *)self->_selectionItem memo];
    v21 = [v20 emoji];
    uint64_t v22 = [v21 length];

    if (!v22)
    {
      uint64_t v26 = self->_selectionItem;
      v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      [v6 appendItems:v23];
    }
  }
LABEL_7:

  return v6;
}

- (id)cellRegistrationForItem:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v5 = objc_opt_class();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PKMemoIconChooserSectionController_cellRegistrationForItem___block_invoke;
  v8[3] = &unk_1E59E0168;
  v8[4] = self;
  id v6 = [v4 registrationWithCellClass:v5 configurationHandler:v8];

  return v6;
}

void __62__PKMemoIconChooserSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  [v6 setItem:a4];
  [v6 setDelegate:*(void *)(a1 + 32)];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = (__CFString *)a4;
  uint64_t v7 = v6;
  if (v6 == @"selectionPresent") {
    goto LABEL_4;
  }
  if (v6)
  {
    char v8 = [(__CFString *)v6 isEqualToString:@"selectionPresent"];

    if (v8)
    {
LABEL_4:
      int v9 = 1;
      int v10 = 1;
      goto LABEL_10;
    }
    v11 = v7;
    if (v11 == @"selectionEmpty") {
      int v10 = 1;
    }
    else {
      int v10 = [(__CFString *)v11 isEqualToString:@"selectionEmpty"];
    }
  }
  else
  {
    int v10 = 0;
  }

  int v9 = 0;
LABEL_10:
  v12 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  if (v10)
  {
    double v13 = 96.0;
  }
  else
  {
    [(id)objc_opt_class() _itemSizeForStyle:self->_style];
    double v13 = v14;
  }
  uint64_t v15 = [MEMORY[0x1E4FB1308] absoluteDimension:v13];
  long long v16 = (void *)v15;
  if (v10) {
    uint64_t v17 = v12;
  }
  else {
    uint64_t v17 = (void *)v15;
  }
  uint64_t v18 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v19 = v17;
  id v20 = objc_alloc_init(v18);
  long long v37 = self;
  long long v39 = v20;
  if (v9 && !self->_mode)
  {
    v21 = [MEMORY[0x1E4FB1308] absoluteDimension:26.0];
    uint64_t v22 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v21 heightDimension:v21];
    v23 = objc_msgSend(MEMORY[0x1E4FB12F0], "layoutAnchorWithEdges:absoluteOffset:", 0, v13 * 0.5 + -5.2, -(v13 * 0.5 + -5.2));
    uint64_t v24 = [MEMORY[0x1E4FB1348] supplementaryItemWithLayoutSize:v22 elementKind:@"dismissItem" containerAnchor:v23];
    [v39 addObject:v24];

    id v20 = v39;
  }
  uint64_t v25 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v19 heightDimension:v16];
  uint64_t v26 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v25 supplementaryItems:v20];
  v27 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v12 heightDimension:v16];

  v28 = (void *)MEMORY[0x1E4FB1318];
  v40[0] = v26;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  v30 = [v28 horizontalGroupWithLayoutSize:v27 subitems:v29];

  if ((v10 & 1) == 0)
  {
    v31 = [MEMORY[0x1E4FB1340] flexibleSpacing:20.0];
    [v30 setInterItemSpacing:v31];
  }
  v32 = [MEMORY[0x1E4FB1330] sectionWithGroup:v30];
  [v32 setContentInsetsReference:1];
  if (v10)
  {
    [(PKMemoIconChooserSectionController *)v37 _selectionPreviewTopSpacing];
    double v34 = v33;
    [(PKMemoIconChooserSectionController *)v37 _selectionPreviewBottomSpacing];
    objc_msgSend(v32, "setContentInsets:", v34, 0.0, v35, 0.0);
  }
  else
  {
    objc_msgSend(v32, "setContentInsets:", 0.0, 20.0, 0.0, 20.0);
    [v32 setInterGroupSpacing:16.0];
  }

  return v32;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a4;
  id v30 = a5;
  id v9 = v8;
  int v10 = [v9 backgroundConfiguration];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 defaultBackgroundConfiguration];
  }
  double v13 = v12;

  double v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:26.0];
  uint64_t v15 = (void *)MEMORY[0x1E4FB1830];
  long long v16 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v35[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  v35[1] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  id v19 = [v15 configurationWithPaletteColors:v18];
  id v20 = [v14 configurationByApplyingConfiguration:v19];

  v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill" withConfiguration:v20];
  [v13 setImage:v21];
  [v13 setImageContentMode:4];
  uint64_t v22 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [v13 setStrokeColor:v22];

  [v13 setStrokeWidth:1.5];
  [v13 setCornerRadius:13.0];
  [v9 setBackgroundConfiguration:v13];
  objc_initWeak(&location, self);
  id v23 = objc_alloc(MEMORY[0x1E4FB14D0]);
  uint64_t v24 = (void *)MEMORY[0x1E4FB13F0];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke;
  v31[3] = &unk_1E59CE6B8;
  objc_copyWeak(&v32, &location);
  v31[4] = self;
  uint64_t v25 = [v24 actionWithHandler:v31];
  uint64_t v26 = objc_msgSend(v23, "initWithFrame:primaryAction:", v25, 0.0, 0.0, 26.0, 26.0);

  [v26 setConfigurationUpdateHandler:&__block_literal_global_238];
  v27 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v26 placement:0];
  [v9 setIndentsAccessories:0];
  double v34 = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [v9 setAccessories:v28];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    [WeakRetained setMemoSelection:0];
    id v3 = objc_loadWeakRetained(v5 + 1);
    [v3 didSelectItem:*(void *)(*(void *)(a1 + 32) + 32)];

    id v4 = objc_loadWeakRetained(v5 + 1);
    [v4 deselectCells];

    id WeakRetained = v5;
  }
}

uint64_t __103__PKMemoIconChooserSectionController_configureSupplementaryRegistration_elementKind_sectionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setTouchInsets:", -20.0, -20.0, -20.0, -20.0);
}

- (void)didSelectItem:(id)a3
{
  id v12 = a3;
  uint64_t v4 = [v12 type];
  if ((unint64_t)(v4 - 2) >= 2)
  {
    if (v4 != 1)
    {
      if (v4) {
        goto LABEL_9;
      }
      uint64_t v5 = [v12 memo];
      [(PKMemoIconChooserSectionController *)self setMemoSelection:v5];

      id WeakRetained = (PKMemoItem *)objc_loadWeakRetained((id *)&self->_delegate);
      [(PKMemoItem *)WeakRetained didSelectItem:v12];
      goto LABEL_8;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 didSelectItem:v12];
  }
  id v8 = [(PKMemoItem *)self->_selectionItem memo];

  if (!v8) {
    goto LABEL_9;
  }
  id v9 = [PKMemoItem alloc];
  int v10 = [(PKMemoItem *)self->_selectionItem memo];
  id WeakRetained = [(PKMemoItem *)v9 initWithMemo:v10 type:0];

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  [v11 selectCellForItem:WeakRetained];

LABEL_8:
LABEL_9:
}

- (id)contextMenuConfigurationForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 memo];
  id v6 = v5;
  if (self->_mode) {
    goto LABEL_2;
  }
  id v9 = [v5 emoji];
  if (![v9 length])
  {

    goto LABEL_2;
  }
  int v10 = [v6 text];
  uint64_t v11 = [v10 length];

  if (v11)
  {
LABEL_2:
    id v7 = 0;
    goto LABEL_3;
  }
  objc_initWeak(&location, self);
  id v12 = (void *)MEMORY[0x1E4FB1678];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke;
  v13[3] = &unk_1E59DF468;
  objc_copyWeak(&v15, &location);
  id v14 = v6;
  id v7 = [v12 configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
LABEL_3:

  return v7;
}

id __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_MemoPickerRemo.isa);
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"minus.circle"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke_2;
  id v15 = &unk_1E59CE6B8;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v16 = *(id *)(a1 + 32);
  id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:&v12];

  objc_msgSend(v7, "setAttributes:", 2, v12, v13, v14, v15);
  id v8 = (void *)MEMORY[0x1E4FB1970];
  v18[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  int v10 = [v8 menuWithTitle:&stru_1EF1B5B50 children:v9];

  objc_destroyWeak(&v17);

  return v10;
}

void __70__PKMemoIconChooserSectionController_contextMenuConfigurationForItem___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PKPeerPaymentRemoveRecurringPaymentRecentMemoIcon();
    [WeakRetained reloadItems];
  }
}

- (void)cell:(id)a3 didUpdateText:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained cell:v7 didUpdateText:v6];
}

- (double)_selectionPreviewTopSpacing
{
  double result = 0.0;
  if (self->_style - 1 < 2) {
    return 16.0;
  }
  return result;
}

- (double)_selectionPreviewBottomSpacing
{
  double result = 60.0;
  if (self->_style - 1 >= 2) {
    return 20.0;
  }
  return result;
}

+ (double)_itemSizeForStyle:(unint64_t)a3
{
  double result = 68.0;
  if (a3 == 1) {
    double result = 73.0;
  }
  if (a3 == 2) {
    return 81.0;
  }
  return result;
}

+ (double)_minimumWidthForStyle:(unint64_t)a3
{
  [a1 _itemSizeForStyle:a3];
  return v3 * 4.0 + 40.0 + 60.0;
}

+ (unint64_t)suggestedStyleForAvailableWidth:(double)a3
{
  [a1 _minimumWidthForStyle:1];
  if (v5 >= a3) {
    return 0;
  }
  [a1 _minimumWidthForStyle:2];
  if (v6 >= a3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)selectedMemo
{
  v2 = [(PKMemoItem *)self->_selectionItem memo];
  double v3 = (void *)[v2 copy];

  [v3 setText:0];

  return v3;
}

- (void)addMemo:(id)a3
{
  id v4 = a3;
  double v6 = [[PKMemoItem alloc] initWithMemo:v4 type:0];

  [(NSMutableArray *)self->_items insertObject:v6 atIndex:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataForSectionIdentifier:@"chooser" animated:1];
}

- (void)setMemoSelection:(id)a3
{
  id v22 = a3;
  id v4 = [(PKMemoItem *)self->_selectionItem memo];
  double v5 = [v4 emoji];
  if ([v5 length]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_mode == 1;
  }

  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    id v9 = [(PKMemoItem *)self->_selectionItem memo];
    if (v9)
    {
      id v10 = v9;
      objc_msgSend(v9, "setColor:", objc_msgSend(v22, "color"));
    }
    else
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
      objc_msgSend(v10, "setColor:", objc_msgSend(v22, "color"));
      selectionItem = self->_selectionItem;
      if (selectionItem)
      {
        [(PKMemoItem *)selectionItem setMemo:v10];
      }
      else
      {
        id v14 = [[PKMemoItem alloc] initWithMemo:v10 type:2];
        id v15 = self->_selectionItem;
        self->_selectionItem = v14;
      }
    }
  }
  else if (!mode)
  {
    id v8 = self->_selectionItem;
    if (v8)
    {
      [(PKMemoItem *)v8 setMemo:v22];
      [(PKMemoItem *)self->_selectionItem setType:3];
    }
    else
    {
      uint64_t v11 = [[PKMemoItem alloc] initWithMemo:v22 type:3];
      uint64_t v12 = self->_selectionItem;
      self->_selectionItem = v11;
    }
  }
  id v16 = [(PKMemoItem *)self->_selectionItem memo];
  id v17 = [v16 emoji];
  if ([v17 length])
  {

    if (v6)
    {
LABEL_17:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained reloadItem:self->_selectionItem animated:0];
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    p_delegate = &self->_delegate;
    id v21 = objc_loadWeakRetained((id *)p_delegate);
    [v21 reloadDataForSectionIdentifier:@"selectionPresent" animated:0];

    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained reloadDataForSectionIdentifier:@"selectionEmpty" animated:0];
    goto LABEL_22;
  }
  unint64_t v19 = self->_mode;

  if (v6 != (v19 == 1)) {
    goto LABEL_21;
  }
  if (v19 == 1) {
    goto LABEL_17;
  }
LABEL_23:
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained invalidateLayout];
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionItem, 0);
  objc_storeStrong((id *)&self->_addNewItem, 0);
  objc_storeStrong((id *)&self->_items, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end