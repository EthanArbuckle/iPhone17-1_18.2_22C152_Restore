@interface PKPaymentPreferenceContactSectionController
- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6;
- (BOOL)editedTextFieldHasError:(id)a3;
- (PKPaymentPreferenceContactSectionController)initWithContactPreference:(id)a3 contactFormatValidator:(id)a4 style:(int64_t)a5 preferencesChangedHandler:(id)a6;
- (PKPaymentPreferenceContactSectionControllerDelegate)contactDelegate;
- (id)addPreferenceItems;
- (id)appendNewSubPreference;
- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4;
- (void)deleteItem:(id)a3 forRow:(unint64_t)a4;
- (void)editItem:(id)a3 forRow:(unint64_t)a4;
- (void)saveContact:(id)a3 forItem:(id)a4 withContactKey:(id)a5 completion:(id)a6;
- (void)setContactDelegate:(id)a3;
@end

@implementation PKPaymentPreferenceContactSectionController

- (PKPaymentPreferenceContactSectionController)initWithContactPreference:(id)a3 contactFormatValidator:(id)a4 style:(int64_t)a5 preferencesChangedHandler:(id)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentPreferenceContactSectionController;
  v12 = [(PKPaymentPreferenceSectionController *)&v15 initWithPreference:a3 style:a5 preferencesChangedHandler:a6];
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_contactFormatValidator, a4);
  }

  return v13;
}

- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [PKPaymentPreferenceContactOptionListItem alloc];
  v9 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v10 = [(PKPaymentPreferenceOptionListItem *)v8 initWithPreference:v7 inSectionPreference:v9 hasErrorHandler:v6];

  return v10;
}

- (id)addPreferenceItems
{
  v30[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v3 = [PKPaymentPreferenceAddListItem alloc];
  v4 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke;
  v26[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v27, &location);
  v5 = [(PKPaymentPreferenceAddListItem *)v3 initWithAddPreferenceType:0 forSectionPreference:v4 handler:v26];

  id v6 = [PKPaymentPreferenceAddListItem alloc];
  id v7 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke_2;
  v24[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v25, &location);
  v8 = [(PKPaymentPreferenceAddListItem *)v6 initWithAddPreferenceType:1 forSectionPreference:v7 handler:v24];

  if ([(PKPaymentPreferenceSectionController *)self style] == 2)
  {
    v9 = PKBridgeButtonTextColor();
    [(PKPaymentPreferenceAddListItem *)v5 setButtonTextColor:v9];
    [(PKPaymentPreferenceAddListItem *)v8 setButtonTextColor:v9];
  }
  v10 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  id v11 = [v10 contactKey];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v12)
  {
    v30[0] = v5;
    v13 = v30;
    uint64_t v14 = 1;
LABEL_9:
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:v14];
    goto LABEL_10;
  }
  objc_super v15 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v16 = [v15 contactKey];
  if ([v16 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {

LABEL_8:
    v29[0] = v5;
    v29[1] = v8;
    v13 = v29;
    uint64_t v14 = 2;
    goto LABEL_9;
  }
  v17 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v18 = [v17 contactKey];
  int v19 = [v18 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v19) {
    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPreferenceContactSectionController;
  uint64_t v20 = [(PKPaymentPreferenceSectionController *)&v23 addPreferenceItems];
LABEL_10:
  v21 = (void *)v20;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v21;
}

void __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained linkedSectionController];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_loadWeakRetained(v1);
  }
  id v12 = v5;

  id v6 = [v12 contactPreference];
  id v7 = [v6 contactKey];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1AF10]];

  v9 = [v12 contactDelegate];
  v10 = v9;
  if (v8)
  {
    id v11 = [v12 contactPreference];
    [v10 showAddressPickerForPreference:v11 inSectionController:v12];
  }
  else
  {
    [v9 startInlineEditingForContactItem:0 inSectionController:v12];
  }
}

void __65__PKPaymentPreferenceContactSectionController_addPreferenceItems__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained linkedSectionController];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = objc_loadWeakRetained(v1);
  }
  id v8 = v5;

  id v6 = [v8 contactDelegate];
  id v7 = [v8 contactPreference];
  [v6 showContactsPickerForPreference:v7 inSectionController:v8];
}

- (void)deleteItem:(id)a3 forRow:(unint64_t)a4
{
  id v19 = a3;
  if (![v19 isOptionItem]) {
    goto LABEL_14;
  }
  id v6 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  id v7 = [(PKPaymentPreferenceSectionController *)self items];
  [v7 removeObjectAtIndex:a4];

  id v8 = [v19 preference];
  v9 = [MEMORY[0x1E4F84B48] defaultInstance];
  v10 = [v8 recentContact];
  [v9 deleteRecent:v10];

  id v11 = [v6 contactKey];
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AF10]] && !objc_msgSend(v6, "type"))
  {
    id v12 = [MEMORY[0x1E4F84B40] defaults];
    [v12 deleteDefaultBillingAddress:v8];
    goto LABEL_7;
  }
  if ([v8 contactSource] == 2)
  {
    id v12 = [MEMORY[0x1E4F84B40] defaults];
    [v12 deleteDefaultForContactKey:v11];
LABEL_7:
  }
  v13 = [v6 preferences];
  uint64_t v14 = (void *)[v13 mutableCopy];

  unint64_t v15 = [v6 selectedIndex];
  if (v15 >= [v14 count])
  {
    v16 = 0;
  }
  else
  {
    v16 = objc_msgSend(v14, "objectAtIndex:", objc_msgSend(v6, "selectedIndex"));
  }
  [v14 removeObjectAtIndex:a4];
  v17 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  [v17 setPreferences:v14];

  if (v16) {
    objc_msgSend(v6, "setSelectedIndex:", objc_msgSend(v14, "indexOfObject:", v16));
  }
  v18 = [(PKPaymentPreferenceSectionController *)self handler];
  ((void (**)(void, PKPaymentPreferenceContactSectionController *, id))v18)[2](v18, self, v19);

LABEL_14:
}

- (void)editItem:(id)a3 forRow:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  id v7 = v5;
  id v8 = [v6 contactKey];
  uint64_t v9 = *MEMORY[0x1E4F1AF10];
  int v10 = [v8 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v10)
  {
    id v11 = [v7 contactPreference];
    uint64_t v12 = [v11 contactSource];
    v13 = [(PKPaymentPreferenceContactSectionController *)self contactDelegate];
    uint64_t v14 = v13;
    if (v12 == 1)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __63__PKPaymentPreferenceContactSectionController_editItem_forRow___block_invoke;
      v18[3] = &unk_1E59CA870;
      v18[4] = self;
      id v19 = v7;
      [v14 presentMeCardAlertControllerWithContact:v11 contactKey:v9 handler:v18];
    }
    else
    {
      [v13 showAddressEditorForContactItem:v7 inSectionController:self];
    }
    goto LABEL_9;
  }
  unint64_t v15 = [v6 contactKey];
  if ([v15 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {

LABEL_8:
    id v11 = [(PKPaymentPreferenceContactSectionController *)self contactDelegate];
    [v11 startInlineEditingForContactItem:v7 inSectionController:self];
LABEL_9:

    goto LABEL_10;
  }
  v16 = [v6 contactKey];
  int v17 = [v16 isEqualToString:*MEMORY[0x1E4F1AEE0]];

  if (v17) {
    goto LABEL_8;
  }
LABEL_10:
}

void __63__PKPaymentPreferenceContactSectionController_editItem_forRow___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactDelegate];
  [v2 showAddressEditorForContactItem:*(void *)(a1 + 40) inSectionController:*(void *)(a1 + 32)];
}

- (BOOL)editedTextFieldHasError:(id)a3
{
  v4 = [a3 text];
  if ([v4 length])
  {
    id v5 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
    id v6 = [v5 contactKey];

    if ([v6 isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1BA70]) initWithStringValue:v4];
      id v8 = objc_alloc(MEMORY[0x1E4F1BA70]);
      uint64_t v9 = [v7 digits];
      int v10 = (void *)[v8 initWithStringValue:v9];

      int v11 = [(PKContactFormatValidator *)self->_contactFormatValidator phoneNumberIsValid:v10 forCountryCode:0] ^ 1;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      int v11 = [(PKContactFormatValidator *)self->_contactFormatValidator emailAddressIsValid:v4] ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)appendNewSubPreference
{
  id v2 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  v3 = [v2 preferences];
  v4 = (void *)[v3 mutableCopy];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  [v5 setContactSource:3];
  id v6 = [v2 preferences];
  id v7 = [v6 lastObject];
  unsigned int v8 = [v7 isHideMyEmail];

  uint64_t v9 = [v2 preferences];
  objc_msgSend(v4, "insertObject:atIndex:", v5, objc_msgSend(v9, "count") - v8);

  [v2 setPreferences:v4];

  return v5;
}

- (void)saveContact:(id)a3 forItem:(id)a4 withContactKey:(id)a5 completion:(id)a6
{
  id v22 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, id))a6;
  if (v10)
  {
    v13 = [(PKPaymentPreferenceContactSectionController *)self contactItems];
    uint64_t v14 = [v13 indexOfObject:v10];
  }
  else
  {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v15 = [(PKPaymentPreferenceContactSectionController *)self contactPreference];
  if ([(PKPaymentPreferenceContactSectionController *)self _saveUpdatedContact:v22 contactKey:v11 preference:v15 atIndex:v14])
  {
    id v16 = [(PKPaymentPreferenceSectionController *)self newOptionItemForSubPreference:v22];
    int v17 = [(PKPaymentPreferenceSectionController *)self items];
    v18 = v17;
    if (v10)
    {
      [v17 replaceObjectAtIndex:v14 withObject:v16];
    }
    else
    {
      if ([v15 selectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = [(PKPaymentPreferenceContactSectionController *)self contactItems];
        uint64_t v20 = objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v15, "selectedIndex"));
        v21 = (void *)[v20 copy];

        objc_msgSend(v18, "replaceObjectAtIndex:withObject:", objc_msgSend(v15, "selectedIndex"), v21);
      }
      [v18 insertObject:v16 atIndex:0];
      [v15 setSelectedIndex:0];
    }

    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    id v16 = 0;
    if (v12) {
LABEL_13:
    }
      v12[2](v12, v16);
  }
}

- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
  }
  else
  {
    uint64_t v14 = [v11 preferences];
    v13 = [v14 objectAtIndex:a6];

    objc_msgSend(v9, "setContactSource:", objc_msgSend(v13, "contactSource"));
  }
  unint64_t v15 = [v12 preferences];
  id v16 = (void *)[v15 mutableCopy];

  if (!v13) {
    goto LABEL_13;
  }
  if ([v13 contactSource] != 1)
  {
    if ([v13 contactSource] == 2)
    {
      int v17 = [v13 recentContact];

      if (v17)
      {
        v18 = [MEMORY[0x1E4F84B48] defaultInstance];
        id v19 = [v13 recentContact];
        [v18 deleteRecent:v19];
      }
      if ([v10 isEqualToString:*MEMORY[0x1E4F1ADC8]])
      {
        uint64_t v20 = [MEMORY[0x1E4F84B40] defaults];
        [v20 setDefaultContactEmail:v9];
      }
      else if ([v10 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
        uint64_t v20 = [MEMORY[0x1E4F84B40] defaults];
        [v20 setDefaultContactPhone:v9];
      }
      else
      {
        if ([v12 type] != 1)
        {
LABEL_27:
          v29 = [MEMORY[0x1E4F84B48] defaultInstance];
          v30 = [v29 saveContactToCoreRecents:v9 preference:v12];

          [v9 setRecentContact:v30];
          [v16 replaceObjectAtIndex:a6 withObject:v9];

          goto LABEL_28;
        }
        uint64_t v20 = [MEMORY[0x1E4F84B40] defaults];
        [v20 setDefaultShippingAddress:v9];
      }

      goto LABEL_27;
    }
LABEL_13:
    v21 = [v13 recentContact];

    if (v21)
    {
      id v22 = [MEMORY[0x1E4F84B48] defaultInstance];
      objc_super v23 = [v13 recentContact];
      [v22 deleteRecent:v23];
    }
    v24 = [MEMORY[0x1E4F84B48] defaultInstance];
    id v25 = [v24 saveContactToCoreRecents:v9 preference:v12];

    [v9 setContactSource:3];
    [v9 setRecentContact:v25];
    if (v13) {
      [v16 replaceObjectAtIndex:a6 withObject:v9];
    }
    else {
      [v16 insertObject:v9 atIndex:0];
    }

    goto LABEL_28;
  }
  if (PKUpdateMeContact())
  {
    [v16 replaceObjectAtIndex:a6 withObject:v9];
LABEL_28:
    BOOL v28 = 1;
    goto LABEL_29;
  }
  v26 = [MEMORY[0x1E4F84B48] defaultInstance];
  id v27 = [v26 saveContactToCoreRecents:v9 preference:v12];

  [v9 setRecentContact:v27];
  [v9 setContactSource:3];
  [v16 addObject:v9];
  if ([v12 selectedIndex] == a6) {
    objc_msgSend(v12, "setSelectedIndex:", objc_msgSend(v16, "indexOfObject:", v9));
  }

  BOOL v28 = 0;
LABEL_29:
  v31 = (void *)[v16 copy];
  [v12 setPreferences:v31];

  return v28;
}

- (PKPaymentPreferenceContactSectionControllerDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactDelegate);

  return (PKPaymentPreferenceContactSectionControllerDelegate *)WeakRetained;
}

- (void)setContactDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactDelegate);

  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
}

@end