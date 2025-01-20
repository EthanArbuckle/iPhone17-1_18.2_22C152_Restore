@interface PKPaymentPreferenceSectionController
- (BOOL)_preferenceIsHideMyEmail:(id)a3;
- (BOOL)_showErrorForTextField:(id)a3;
- (BOOL)editedTextFieldHasError:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4;
- (Class)footerViewClassForSectionIdentifier:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSMutableArray)items;
- (PKPaymentPreference)preference;
- (PKPaymentPreferenceSectionController)initWithPreference:(id)a3 style:(int64_t)a4 preferencesChangedHandler:(id)a5;
- (PKPaymentPreferenceSectionController)linkedSectionController;
- (PKPaymentPreferenceSectionControllerDelegate)delegate;
- (id)addPreferenceItems;
- (id)appendNewItemForEditing;
- (id)appendNewSubPreference;
- (id)cellRegistrationForItem:(id)a3;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)handler;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)newOptionItemForSubPreference:(id)a3;
- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4;
- (id)sectionIdentifier;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (int64_t)style;
- (void)_updateSelectedIndexIfNeededFromNewItemIndex:(int64_t)a3;
- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItems:(id)a3;
- (void)setLinkedSectionController:(id)a3;
- (void)setSelectedIndex:(unint64_t)a3;
- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4;
- (void)textFieldDidEndEditing:(id)a3 forListCell:(id)a4;
@end

@implementation PKPaymentPreferenceSectionController

- (PKPaymentPreferenceSectionController)initWithPreference:(id)a3 style:(int64_t)a4 preferencesChangedHandler:(id)a5
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentPreferenceSectionController;
  v11 = [(PKPaymentPreferenceSectionController *)&v50 init];
  v12 = v11;
  if (v11)
  {
    p_preference = (id *)&v11->_preference;
    objc_storeStrong((id *)&v11->_preference, a3);
    v14 = _Block_copy(v10);
    id handler = v12->_handler;
    v12->_id handler = v14;

    v12->_style = a4;
    v12->_isEditingFieldThatWasOriginallyInvalid = 0;
    v16 = [(PKPaymentPreferenceSectionController *)v12 sectionIdentifier];
    v51[0] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
    [(PKDynamicListSectionController *)v12 setIdentifiers:v17];

    v18 = [*p_preference title];
    [(PKDynamicListSectionController *)v12 setHeaderText:v18];

    v19 = [*p_preference footer];
    [(PKDynamicListSectionController *)v12 setFooterText:v19];

    objc_initWeak(&location, v12);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v12->_items;
    v12->_items = v20;

    for (unint64_t i = 0; ; ++i)
    {
      v23 = [*p_preference preferences];
      BOOL v24 = i < [v23 count];

      id v25 = *p_preference;
      if (!v24) {
        break;
      }
      v26 = [v25 preferences];
      v27 = [v26 objectAtIndex:i];

      id v28 = [(PKPaymentPreferenceSectionController *)v12 newOptionItemForSubPreference:v27];
      [(NSMutableArray *)v12->_items addObject:v28];
    }
    v29 = [v25 preferences];
    v30 = [v29 lastObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v30 isHideMyEmail] & 1) == 0)
    {
      v31 = v12->_items;
      v32 = [(PKPaymentPreferenceSectionController *)v12 addPreferenceItems];
      [(NSMutableArray *)v31 addObjectsFromArray:v32];
    }
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke;
    v47[3] = &unk_1E59CDCD0;
    objc_copyWeak(&v48, &location);
    [(PKDynamicListSectionController *)v12 setTrailingSwipeActionsConfigurationProvider:v47];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_4;
    aBlock[3] = &unk_1E59CDCF8;
    objc_copyWeak(&v46, &location);
    v33 = _Block_copy(aBlock);
    uint64_t v34 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:v33];
    listRegistration = v12->_listRegistration;
    v12->_listRegistration = (UICollectionViewCellRegistration *)v34;

    v36 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v37 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_5;
    v42[3] = &unk_1E59CDD20;
    id v38 = v33;
    id v43 = v38;
    objc_copyWeak(&v44, &location);
    uint64_t v39 = [v36 registrationWithCellClass:v37 configurationHandler:v42];
    textFieldRegistration = v12->_textFieldRegistration;
    v12->_textFieldRegistration = (UICollectionViewCellRegistration *)v39;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);

    objc_destroyWeak(&location);
  }

  return v12;
}

id __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained[15], "objectAtIndex:", objc_msgSend(v3, "row"));
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v6 supportsSwipeActionType:0])
    {
      v8 = (void *)MEMORY[0x1E4FB1688];
      id v9 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp.isa);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_2;
      v23[3] = &unk_1E59CDCA8;
      BOOL v24 = v5;
      id v25 = v6;
      id v26 = v3;
      id v10 = [v8 contextualActionWithStyle:1 title:v9 handler:v23];
      [v7 addObject:v10];
    }
    if ([v6 supportsSwipeActionType:1])
    {
      v11 = (void *)MEMORY[0x1E4FB1688];
      v12 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_0.isa);
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_3;
      v19 = &unk_1E59CDCA8;
      v20 = v5;
      id v21 = v6;
      id v22 = v3;
      v13 = [v11 contextualActionWithStyle:0 title:v12 handler:&v16];
      objc_msgSend(v7, "addObject:", v13, v16, v17, v18, v19);
    }
    if ([v7 count])
    {
      v14 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v7];
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) row];

  return [v1 deleteItem:v2 forRow:v3];
}

uint64_t __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) row];

  return [v1 editItem:v2 forRow:v3];
}

void __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a3;
  id v7 = a4;
  id v8 = a2;
  id v9 = [v7 configuration];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = [v7 defaultAccessories];
  v12 = (void *)[v11 mutableCopy];

  LODWORD(v11) = [v7 isOptionItem];
  if (v11)
  {
    if (WeakRetained)
    {
      uint64_t v13 = [WeakRetained[12] selectedIndex];
      if (v13 == [v15 row])
      {
        id v14 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
        [v14 setDisplayedState:2];
        [v12 addObject:v14];
      }
    }
  }
  [v8 setAccessories:v12];
  [v8 setContentConfiguration:v9];
}

void __91__PKPaymentPreferenceSectionController_initWithPreference_style_preferencesChangedHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void (**)(uint64_t, id, uint64_t, uint64_t))(v7 + 16);
  id v9 = a2;
  v8(v7, v9, a3, a4);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setDelegate:WeakRetained];
}

- (id)sectionIdentifier
{
  uint64_t v2 = [(PKPaymentPreference *)self->_preference title];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v2 = @"unknown";
  }
  v4 = v2;

  return v4;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_items count] > a3)
  {
    uint64_t v5 = [(PKPaymentPreference *)self->_preference selectedIndex];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = v5;
      uint64_t v7 = [(NSMutableArray *)self->_items objectAtIndex:v5];
      id v8 = (void *)[v7 copy];

      [(NSMutableArray *)self->_items replaceObjectAtIndex:v6 withObject:v8];
    }
    [(PKPaymentPreference *)self->_preference setSelectedIndex:a3];
    id v9 = [(NSMutableArray *)self->_items objectAtIndex:a3];
    id v10 = (id)[v9 copy];

    [(NSMutableArray *)self->_items replaceObjectAtIndex:a3 withObject:v10];
  }
}

- (id)appendNewItemForEditing
{
  uint64_t v3 = [(PKPaymentPreferenceSectionController *)self appendNewSubPreference];
  id v4 = [(PKPaymentPreferenceSectionController *)self newOptionItemForSubPreference:v3];
  uint64_t v5 = [(PKPaymentPreference *)self->_preference preferences];
  uint64_t v6 = [v5 lastObject];
  int v7 = [v6 isHideMyEmail];

  if (v7) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = [(PKPaymentPreference *)self->_preference preferences];
  if ([v9 count] == v8)
  {
    uint64_t v10 = 0;
  }
  else
  {
    v11 = [(PKPaymentPreference *)self->_preference preferences];
    uint64_t v10 = [v11 count] - v8;
  }
  [(NSMutableArray *)self->_items insertObject:v4 atIndex:v10];
  [(PKPaymentPreferenceSectionController *)self _updateSelectedIndexIfNeededFromNewItemIndex:v10];
  id handler = (void (**)(id, PKPaymentPreferenceSectionController *, id))self->_handler;
  if (handler) {
    handler[2](handler, self, v4);
  }

  return v4;
}

- (void)_updateSelectedIndexIfNeededFromNewItemIndex:(int64_t)a3
{
  if ([(PKPaymentPreference *)self->_preference selectedIndex] == a3)
  {
    uint64_t v5 = [(PKPaymentPreference *)self->_preference preferences];
    uint64_t v6 = [v5 lastObject];
    int v7 = [v6 isHideMyEmail];

    if (v7)
    {
      preference = self->_preference;
      [(PKPaymentPreference *)preference setSelectedIndex:a3 + 1];
    }
  }
}

- (id)newOptionItemForSubPreference:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentPreferenceSectionController_newOptionItemForSubPreference___block_invoke;
  v7[3] = &unk_1E59CDD48;
  objc_copyWeak(&v8, &location);
  id v5 = [(PKPaymentPreferenceSectionController *)self newOptionItemForSubPreference:v4 hasErrorHandler:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __70__PKPaymentPreferenceSectionController_newOptionItemForSubPreference___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained _showErrorForTextField:v3];

  return v5;
}

- (id)newOptionItemForSubPreference:(id)a3 hasErrorHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[PKPaymentPreferenceOptionListItem alloc] initWithPreference:v7 inSectionPreference:self->_preference hasErrorHandler:v6];

  return v8;
}

- (id)addPreferenceItems
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)editedTextFieldHasError:(id)a3
{
  return 0;
}

- (BOOL)_showErrorForTextField:(id)a3
{
  return self->_isEditingFieldThatWasOriginallyInvalid
      && [(PKPaymentPreferenceSectionController *)self editedTextFieldHasError:a3];
}

- (id)appendNewSubPreference
{
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  uint64_t v5 = [(PKPaymentPreferenceSectionController *)self delegate];
  [v5 setEditing:0 animated:1 forSectionController:self];

  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4
{
  self->_isEditingFieldThatWasOriginallyInvalid = -[PKPaymentPreferenceSectionController editedTextFieldHasError:](self, "editedTextFieldHasError:", a3, a4);
}

- (void)textFieldDidEndEditing:(id)a3 forListCell:(id)a4
{
  self->_isEditingFieldThatWasOriginallyInvalid = 0;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceSectionController;
  id v4 = [(PKDynamicListSectionController *)&v6 layoutWithLayoutEnvironment:a3 sectionIdentifier:a4];

  return v4;
}

- (id)cellRegistrationForItem:(id)a3
{
  int v4 = [a3 supportsInlineEditing];
  uint64_t v5 = 5;
  if (v4) {
    uint64_t v5 = 6;
  }
  objc_super v6 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PKPaymentPreferenceSectionController__preference[v5]);

  return v6;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ((id)*MEMORY[0x1E4FB2770] == v9)
  {
    -[PKDynamicListSectionController configureSupplementaryRegistration:elementKind:sectionIdentifier:](&v13, sel_configureSupplementaryRegistration_elementKind_sectionIdentifier_, v8, v9, v10, v12.receiver, v12.super_class, self, PKPaymentPreferenceSectionController);
  }
  else if ((id)*MEMORY[0x1E4FB2760] == v9)
  {
    if ([(PKPaymentPreferenceSectionController *)self footerViewClassForSectionIdentifier:v10])
    {
      [(PKPaymentPreferenceSectionController *)self configureFooterView:v8 forSectionIdentifier:v10];
    }
    else
    {
      v11 = [(PKPaymentPreference *)self->_preference footer];

      if (v11) {
        -[PKDynamicListSectionController configureSupplementaryRegistration:elementKind:sectionIdentifier:](&v12, sel_configureSupplementaryRegistration_elementKind_sectionIdentifier_, v8, v9, v10, self, PKPaymentPreferenceSectionController, v13.receiver, v13.super_class);
      }
    }
  }
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentPreferenceSectionController *)self footerViewClassForSectionIdentifier:v6];
  id v9 = (id)*MEMORY[0x1E4FB2760];

  if (v9 != v7 || v8 == 0) {
    objc_opt_class();
  }
  else {
  v11 = [(PKPaymentPreferenceSectionController *)self footerViewClassForSectionIdentifier:v6];
  }

  return (Class)v11;
}

- (Class)footerViewClassForSectionIdentifier:(id)a3
{
  id v3 = [(PKPaymentPreferenceSectionController *)self footerContentForSectionIdentifier:a3];
  if (v3)
  {
    int v4 = objc_opt_class();
  }
  else
  {
    int v4 = 0;
  }

  return (Class)v4;
}

- (void)configureFooterView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentPreferenceSectionController *)self footerContentForSectionIdentifier:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_initWeak(&location, self);
      id v9 = v6;
      id v10 = objc_loadWeakRetained(&location);
      v11 = [v10 preference];
      objc_super v12 = [v11 footerLinkActionBlock];

      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __81__PKPaymentPreferenceSectionController_configureFooterView_forSectionIdentifier___block_invoke;
      id v21 = &unk_1E59CDD70;
      id v13 = v12;
      id v22 = v13;
      id v14 = +[PKTextRangeHyperlink hyperlinkSourcesFromApplyFooter:v8 linkTapped:&v18];
      objc_msgSend(v9, "edgeInsets", v18, v19, v20, v21);
      double v16 = v15;
      [v9 edgeInsets];
      objc_msgSend(v9, "setEdgeInsets:", 0.0, v16, 0.0);
      uint64_t v17 = [v8 footerText];
      [v9 setText:v17];

      [v9 setTextAlignment:4];
      [v9 setSources:v14];

      objc_destroyWeak(&location);
    }
  }
}

uint64_t __81__PKPaymentPreferenceSectionController_configureFooterView_forSectionIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  int v4 = [(PKPaymentPreference *)self->_preference footer];
  uint64_t v5 = [(PKPaymentPreference *)self->_preference footerLinkRange];
  if (v4) {
    BOOL v7 = v5 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v8 = v5;
    uint64_t v9 = v6;
    id v10 = objc_alloc_init(MEMORY[0x1E4F84488]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F84490]);
    objc_super v12 = objc_msgSend(v4, "substringWithRange:", v8, v9);
    [v11 setLinkText:v12];

    v15[0] = v11;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v10 setLinks:v13];

    [v10 setFooterText:v4];
  }

  return v10;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_items];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v24 = a3;
  if (![v24 isOptionItem])
  {
    int v6 = [v24 isAddItem];
    BOOL v7 = v24;
    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v8 = [v24 handler];
    v8[2]();

    goto LABEL_24;
  }
  unint64_t v4 = [(NSMutableArray *)self->_items indexOfObject:v24];
  id v5 = [(PKPaymentPreferenceSectionController *)self delegate];
  if ([v5 collectionViewIsEditingForSectionController:self])
  {
    if ([v24 supportsSwipeActionType:1])
    {

LABEL_15:
      [(PKPaymentPreferenceSectionController *)self editItem:v24 forRow:v4];
      goto LABEL_24;
    }
    char v17 = [v24 supportsInlineEditing];

    if (v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  char v9 = [(PKPaymentPreference *)self->_preference isReadOnly];
  BOOL v7 = v24;
  if (v9) {
    goto LABEL_25;
  }
  uint64_t v10 = [(PKPaymentPreference *)self->_preference selectedIndex];
  if (v4 == v10)
  {
    id v11 = [(PKPaymentPreference *)self->_preference preferences];
    unint64_t v12 = [v11 count];

    BOOL v7 = v24;
    if (v4 >= v12) {
      goto LABEL_25;
    }
    id v13 = [(PKPaymentPreference *)self->_preference preferences];
    id v14 = [v13 objectAtIndex:v4];

    double v15 = [(PKPaymentPreference *)self->_preference errorsForPreference:v14];
    uint64_t v16 = [v15 count];

    if (([(PKPaymentPreference *)self->_preference isReadOnly] & 1) == 0 && v16) {
      [(PKPaymentPreferenceSectionController *)self editItem:v24 forRow:v4];
    }
  }
  else
  {
    uint64_t v18 = v10;
    if ([(PKPaymentPreferenceSectionController *)self _preferenceIsHideMyEmail:v24])
    {
      id v19 = objc_alloc_init(MEMORY[0x1E4F84750]);
      if (([v19 isAccountConfigured] & 1) == 0)
      {
        v23 = [(PKPaymentPreferenceSectionController *)self delegate];
        [v23 presentHideMyEmailAlertController];

        goto LABEL_24;
      }
    }
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = [(NSMutableArray *)self->_items objectAtIndex:v18];
      id v21 = (void *)[v20 copy];

      [(NSMutableArray *)self->_items replaceObjectAtIndex:v18 withObject:v21];
    }
    id v14 = (void *)[v24 copy];
    [(NSMutableArray *)self->_items replaceObjectAtIndex:v4 withObject:v14];
    [(PKPaymentPreference *)self->_preference setSelectedIndex:v4];
    id handler = (void (**)(id, PKPaymentPreferenceSectionController *, id))self->_handler;
    if (handler) {
      handler[2](handler, self, v24);
    }
  }

LABEL_24:
  BOOL v7 = v24;
LABEL_25:
}

- (BOOL)_preferenceIsHideMyEmail:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = [v3 contactPreference];
    char v5 = [v4 isHideMyEmail];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (PKPaymentPreference)preference
{
  return self->_preference;
}

- (PKPaymentPreferenceSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPreferenceSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (PKPaymentPreferenceSectionController)linkedSectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkedSectionController);

  return (PKPaymentPreferenceSectionController *)WeakRetained;
}

- (void)setLinkedSectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkedSectionController);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preference, 0);
  objc_storeStrong((id *)&self->_textFieldRegistration, 0);

  objc_storeStrong((id *)&self->_listRegistration, 0);
}

@end