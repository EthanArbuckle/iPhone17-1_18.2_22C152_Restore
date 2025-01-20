@interface PKBarcodePassDetailsNotificationSettingsSectionController
+ (BOOL)canShowSectionforPass:(id)a3;
+ (BOOL)validForPass:(id)a3;
+ (int64_t)_countOfRowsForPass:(id)a3;
- (BOOL)_shouldMapSection;
- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3;
- (NSArray)allSectionIdentifiers;
- (NSArray)sectionIdentifiers;
- (PKBarcodePassDetailsNotificationSettingsSectionController)init;
- (PKBarcodePassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 detailViewStyle:(int64_t)a4 delegate:(id)a5;
- (PKBarcodePassDetailsNotificationSettingsSectionControllerDelegate)delegate;
- (id)_cellForType:(int64_t)a3;
- (id)_indexPathForRowType:(int64_t)a3;
- (id)_settingsCellForRow:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)_countOfRows;
- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (unint64_t)_settingForRow:(unint64_t)a3;
- (void)_passSettingsChanged:(id)a3;
- (void)dealloc;
- (void)pushSettingsFromViewToModel;
@end

@implementation PKBarcodePassDetailsNotificationSettingsSectionController

+ (BOOL)validForPass:(id)a3
{
  return 1;
}

- (PKBarcodePassDetailsNotificationSettingsSectionController)init
{
  return 0;
}

- (PKBarcodePassDetailsNotificationSettingsSectionController)initWithPass:(id)a3 detailViewStyle:(int64_t)a4 delegate:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PKBarcodePassDetailsNotificationSettingsSectionController;
  v11 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)&v18 init];
  if (v11)
  {
    v20[0] = @"BarcodePassNotificationsSectionIdentifier";
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    allSectionIdentifiers = v11->_allSectionIdentifiers;
    v11->_allSectionIdentifiers = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_pass, a3);
    v11->_detailViewStyle = a4;
    objc_storeWeak((id *)&v11->_delegate, v10);
    if ([(PKBarcodePassDetailsNotificationSettingsSectionController *)v11 _shouldMapSection])
    {
      v19 = @"BarcodePassNotificationsSectionIdentifier";
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      sectionIdentifiers = v11->_sectionIdentifiers;
      v11->_sectionIdentifiers = (NSArray *)v14;
    }
    else
    {
      sectionIdentifiers = v11->_sectionIdentifiers;
      v11->_sectionIdentifiers = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    PKObservePassSettingsChanged();
    v16 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v16 addObserver:v11 selector:sel__passSettingsChanged_ name:*MEMORY[0x1E4F87590] object:0];
  }
  return v11;
}

- (void)dealloc
{
  PKUnregisterPassSettingsChangedObserver();
  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKBarcodePassDetailsNotificationSettingsSectionController;
  [(PKBarcodePassDetailsNotificationSettingsSectionController *)&v4 dealloc];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6 = a4;
  if (PKEqualObjects())
  {
    v7 = -[PKBarcodePassDetailsNotificationSettingsSectionController _settingsCellForRow:](self, "_settingsCellForRow:", [v6 row]);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  return 0;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (int64_t)_countOfRows
{
  v3 = objc_opt_class();
  pass = self->_pass;

  return [v3 _countOfRowsForPass:pass];
}

- (id)_indexPathForRowType:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v6 = [WeakRetained indexOfSectionIdentifier:@"BarcodePassNotificationsSectionIdentifier"];

  if ([(PKBarcodePassDetailsNotificationSettingsSectionController *)self _countOfRows] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:v6];
  }

  return v7;
}

- (id)_cellForType:(int64_t)a3
{
  objc_super v4 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)self _indexPathForRowType:a3];
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v6 = [WeakRetained cellForRowAtIndexPath:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)canShowSectionforPass:(id)a3
{
  id v3 = a3;
  if ([v3 isUpdatable]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasTimeOrLocationRelevancyInfo];
  }

  return v4;
}

+ (int64_t)_countOfRowsForPass:(id)a3
{
  id v3 = a3;
  if ([v3 isUpdatable])
  {
    if (([v3 settings] & 2) != 0) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  int64_t v5 = v4 + [v3 hasTimeOrLocationRelevancyInfo];

  return v5;
}

- (BOOL)_shouldMapSection
{
  id v3 = objc_opt_class();
  pass = self->_pass;

  return [v3 canShowSectionforPass:pass];
}

- (unint64_t)_settingForRow:(unint64_t)a3
{
  if ([(PKPass *)self->_pass isUpdatable])
  {
    char v5 = [(PKPass *)self->_pass settings];
    uint64_t v6 = 0;
    if ((v5 & 2) != 0) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if ((v5 & 2) != 0) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unsigned int v9 = [(PKPass *)self->_pass hasTimeOrLocationRelevancyInfo];
  if (v9) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v8 + (unint64_t)v9 <= a3) {
    return 0;
  }
  if (v6 == a3) {
    return 2;
  }
  if (v7 == a3) {
    return 128;
  }
  return v10 == a3;
}

- (id)_settingsCellForRow:(unint64_t)a3
{
  unint64_t v4 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)self _settingForRow:a3];
  unint64_t v5 = [(PKPass *)self->_pass settings];
  switch(v4)
  {
    case 1uLL:
      uint64_t v10 = [PKSettingTableCell alloc];
      v11 = PKLocalizedString(&cfstr_SettingsShowOn.isa);
      uint64_t v8 = [(PKSettingTableCell *)v10 initWithTitle:v11 target:0 action:0];

      [(PKSettingTableCell *)v8 setOn:v5 & 1];
      unsigned int v9 = (void *)MEMORY[0x1E4F85A68];
      goto LABEL_7;
    case 0x80uLL:
      uint64_t v12 = [PKSettingTableCell alloc];
      v13 = PKLocalizedString(&cfstr_SettingsShowNo.isa);
      uint64_t v8 = [(PKSettingTableCell *)v12 initWithTitle:v13 target:0 action:0];

      [(PKSettingTableCell *)v8 setOn:(v5 & 0x80) == 0];
      unsigned int v9 = (void *)MEMORY[0x1E4F85218];
      goto LABEL_7;
    case 2uLL:
      uint64_t v6 = [PKSettingTableCell alloc];
      uint64_t v7 = PKLocalizedString(&cfstr_SettingsNotify.isa);
      uint64_t v8 = [(PKSettingTableCell *)v6 initWithTitle:v7 target:0 action:0];

      [(PKSettingTableCell *)v8 setOn:(v5 >> 1) & 1];
      unsigned int v9 = (void *)MEMORY[0x1E4F85280];
LABEL_7:
      [(PKSettingTableCell *)v8 setAccessibilityIdentifier:*v9];
      goto LABEL_9;
  }
  uint64_t v8 = 0;
LABEL_9:
  [(PKSettingTableCell *)v8 setTarget:self action:sel_pushSettingsFromViewToModel];

  return v8;
}

- (void)pushSettingsFromViewToModel
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPass *)self->_pass settings];
  unint64_t v4 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)self _cellForType:0];
  unint64_t v5 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)self _cellForType:1];
  uint64_t v6 = [(PKBarcodePassDetailsNotificationSettingsSectionController *)self _cellForType:2];
  if (!v4)
  {
    unint64_t v7 = v3;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  if ([v4 isOn]) {
    unint64_t v7 = v3 | 2;
  }
  else {
    unint64_t v7 = v3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  if (v5)
  {
LABEL_6:
    if ([v5 isOn]) {
      v7 &= ~0x80uLL;
    }
    else {
      v7 |= 0x80uLL;
    }
  }
LABEL_9:
  if (v6)
  {
    if ([v6 isOn]) {
      v7 |= 1uLL;
    }
    else {
      v7 &= ~1uLL;
    }
  }
  int v8 = v7 ^ v3;
  if (((v7 ^ v3) & 2) != 0)
  {
    uint64_t v9 = *MEMORY[0x1E4F85C90];
    objc_super v18 = @"on";
    uint64_t v10 = [NSNumber numberWithBool:(v7 >> 1) & 1];
    v19[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    MEMORY[0x1A6220EC0](v9, v11);
  }
  if (v8)
  {
    uint64_t v12 = *MEMORY[0x1E4F85C88];
    v16 = @"on";
    v13 = [NSNumber numberWithBool:v7 & 1];
    v17 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    MEMORY[0x1A6220EC0](v12, v14);
  }
  [(PKPass *)self->_pass setSettings:(2 * v8) & 0x20 | v7];
  if ((v8 & 2) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadSectionIdentifier:@"BarcodePassNotificationsSectionIdentifier"];
  }
}

- (void)_passSettingsChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F875C0]];
  unint64_t v7 = [(PKPass *)self->_pass uniqueID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v4 userInfo];
    uint64_t v10 = [v9 objectForKey:*MEMORY[0x1E4F875B8]];

    if (v10)
    {
      uint64_t v11 = [v10 unsignedIntegerValue];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __82__PKBarcodePassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke;
      v12[3] = &unk_1E59CB460;
      v12[4] = self;
      v12[5] = v11;
      dispatch_async(MEMORY[0x1E4F14428], v12);
    }
  }
}

void __82__PKBarcodePassDetailsNotificationSettingsSectionController__passSettingsChanged___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setSettingsWithoutUpdatingDataAccessor:*(void *)(a1 + 40)];
  id v7 = [*(id *)(a1 + 32) _cellForType:0];
  v2 = [*(id *)(a1 + 32) _cellForType:1];
  uint64_t v3 = [*(id *)(a1 + 32) _cellForType:2];
  if (v7)
  {
    int v4 = [v7 isOn];
    uint64_t v5 = (*(void *)(a1 + 40) >> 1) & 1;
    [v7 setOn:v5 notify:0];
    [v2 setOn:(*(void *)(a1 + 40) & 0x80) == 0 notify:0];
    [v3 setOn:*(_DWORD *)(a1 + 40) & 1 notify:0];
    if (v4 != v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
      [WeakRetained reloadSectionIdentifier:@"BarcodePassNotificationsSectionIdentifier"];
    }
  }
  else
  {
    [0 setOn:(*(void *)(a1 + 40) >> 1) & 1 notify:0];
    [v2 setOn:(*(void *)(a1 + 40) & 0x80) == 0 notify:0];
    [v3 setOn:*(_DWORD *)(a1 + 40) & 1 notify:0];
  }
}

- (NSArray)allSectionIdentifiers
{
  return self->_allSectionIdentifiers;
}

- (NSArray)sectionIdentifiers
{
  return self->_sectionIdentifiers;
}

- (PKBarcodePassDetailsNotificationSettingsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKBarcodePassDetailsNotificationSettingsSectionControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end