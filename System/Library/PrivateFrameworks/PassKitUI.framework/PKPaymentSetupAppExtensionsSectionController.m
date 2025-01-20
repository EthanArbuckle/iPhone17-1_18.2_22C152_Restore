@interface PKPaymentSetupAppExtensionsSectionController
- (BOOL)updateWithRequirements:(unint64_t)a3 paymentSetupProductModel:(id)a4;
- (PKPaymentSetupAppExtensionsSectionController)init;
- (PKPaymentSetupAppExtensionsSectionControllerDelegate)delegate;
- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)hideLoadingIndicatorsAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentSetupAppExtensionsSectionController

- (PKPaymentSetupAppExtensionsSectionController)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentSetupAppExtensionsSectionController;
  v2 = [(PKPaymentSetupListSectionController *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v3;

    __asm { FMOV            V0.2D, #28.0 }
    *(_OWORD *)(v2 + 72) = _Q0;
  }
  return (PKPaymentSetupAppExtensionsSectionController *)v2;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  v5 = (double *)self;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupAppExtensionsSectionController;
  id v6 = a3;
  v7 = [(PKPaymentSetupListSectionController *)&v10 decoratePaymentSetListCell:v6 forItem:a4];
  v8 = objc_msgSend(v7, "imageProperties", v10.receiver, v10.super_class);
  v5 += 9;
  objc_msgSend(v8, "setMaximumSize:", *v5, v5[1]);
  objc_msgSend(v8, "setReservedLayoutSize:", *v5, v5[1]);
  [v8 setCornerRadius:6.0];
  [v6 setContentConfiguration:v7];

  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  [v6 setHeaderMode:1];
  v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a3;
  v7 = [v5 plainHeaderConfiguration];
  v15[0] = *MEMORY[0x1E4FB06F8];
  v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
  v16[0] = v8;
  v15[1] = *MEMORY[0x1E4FB0700];
  v9 = [MEMORY[0x1E4FB1618] labelColor];
  v16[1] = v9;
  objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  PKDeviceSpecificLocalizedStringKeyForKey(@"PAYMENT_SETUP_APP_EXTENSION_HEADER", 0);
  objc_super v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
  v13 = PKLocalizedPaymentString(v11);
  v14 = (void *)[v12 initWithString:v13 attributes:v10];
  [v7 setAttributedText:v14];

  [v6 setContentConfiguration:v7];
}

- (void)didSelectItem:(id)a3
{
  self->_didHideLoadingIndicators = 0;
  id v4 = a3;
  id v5 = [v4 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = [v4 identifier];
  v8 = [v4 title];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __62__PKPaymentSetupAppExtensionsSectionController_didSelectItem___block_invoke;
  v13 = &unk_1E59CAEA8;
  v14 = self;
  id v9 = v5;
  id v15 = v9;
  LODWORD(v5) = [WeakRetained didSelectAppExtensionWithIdentifier:v7 title:v8 completion:&v10];

  if (v5 && !self->_didHideLoadingIndicators) {
    -[PKPaymentSetupAppExtensionsSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", v9, 1, 1, v10, v11, v12, v13, v14);
  }
}

uint64_t __62__PKPaymentSetupAppExtensionsSectionController_didSelectItem___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateItemIdentifier:*(void *)(result + 40) loadingIndicatorVisibility:0 animated:1];
  }
  return result;
}

- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v18 = a3;
  v8 = -[NSMutableDictionary objectForKey:](self->_keyedListItems, "objectForKey:");
  id v9 = v8;
  if (v8 && [v8 loadingIndicatorVisible] != v6)
  {
    uint64_t v10 = (void *)[v9 copy];
    [v10 setLoadingIndicatorVisible:v6];
    [(NSMutableDictionary *)self->_keyedListItems setObject:v10 forKey:v18];
    uint64_t v11 = [(PKPaymentSetupListSectionController *)self items];
    id v12 = (void *)[v11 mutableCopy];

    uint64_t v13 = [v12 indexOfObject:v9];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      [v12 replaceObjectAtIndex:v13 withObject:v10];
    }
    v14 = (void *)[v12 copy];
    [(PKPaymentSetupListSectionController *)self setItems:v14];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16 = [(PKPaymentSetupListSectionController *)self identifiers];
    v17 = [v16 firstObject];
    [WeakRetained reloadRequiredForSectionIdentifier:v17 animated:v5];
  }
}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_didHideLoadingIndicators = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_keyedListItems allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PKPaymentSetupAppExtensionsSectionController *)self _updateItemIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v9++) loadingIndicatorVisibility:0 animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BOOL)updateWithRequirements:(unint64_t)a3 paymentSetupProductModel:(id)a4
{
  char v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t shouldDisplay = self->_shouldDisplay;
  if (shouldDisplay)
  {
    BOOL v8 = shouldDisplay == 1;
  }
  else if ((v4 & 0x40) != 0)
  {
    uint64_t v28 = 88;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v6;
    id obj = [v6 setupProductsOfType:6];
    uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        uint64_t v13 = 0;
        uint64_t v30 = v11;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
          uint64_t v15 = objc_msgSend(v14, "productIdentifier", v28);
          v16 = [(NSMutableDictionary *)self->_keyedListItems objectForKey:v15];
          if (v16) {
            goto LABEL_15;
          }
          id v17 = v9;
          id v18 = objc_msgSend(v14, "thumbnailCachedImageForSize:completion:", 0, self->_iconSize.width, self->_iconSize.height);
          v19 = v18;
          if (v18)
          {
            id v20 = v18;
          }
          else
          {
            PKUIImageNamed(@"default_welcome_icon");
            id v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v21 = v20;

          v22 = [PKPaymentSetupAppExtensionsListItem alloc];
          v23 = [v14 displayName];
          v16 = [(PKPaymentSetupListItem *)v22 initWithTitle:v23 subtitle:0 icon:v21];

          [(PKPaymentSetupListItem *)v16 setIdentifier:v15];
          [(PKPaymentSetupListItem *)v16 setDisplayChevron:1];
          [(NSMutableDictionary *)self->_keyedListItems setObject:v16 forKey:v15];

          id v9 = v17;
          uint64_t v11 = v30;
          if (v16)
          {
LABEL_15:
            [v9 addObject:v16];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }

    uint64_t v24 = [v9 count];
    BOOL v8 = v24 != 0;
    if (v24)
    {
      *(Class *)((char *)&self->super.super.isa + v28) = (Class)1;
      v25 = self;
      id v26 = v9;
    }
    else
    {
      *(Class *)((char *)&self->super.super.isa + v28) = (Class)2;
      id v26 = (id)MEMORY[0x1E4F1CBF0];
      v25 = self;
    }
    -[PKPaymentSetupListSectionController setItems:](v25, "setItems:", v26, v28);

    id v6 = v29;
  }
  else
  {
    [(PKPaymentSetupListSectionController *)self setItems:MEMORY[0x1E4F1CBF0]];
    BOOL v8 = 0;
  }

  return v8;
}

- (PKPaymentSetupAppExtensionsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupAppExtensionsSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_keyedListItems, 0);
}

@end