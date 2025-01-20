@interface PKAuxiliaryPassInformationDataSource
- (BOOL)_isDynamicSection:(int64_t)a3;
- (NSIndexPath)headerIndexPath;
- (NSString)footerSecondaryText;
- (NSString)footerSecondaryTitle;
- (NSString)footerText;
- (NSString)footerTitle;
- (PKAuxiliaryPassInformationDataSource)initWithItem:(id)a3 forPass:(id)a4;
- (PKMerchant)merchant;
- (PKPassAuxiliaryPassInformationItem)item;
- (id)_headerItem;
- (id)footerTextItemForSection:(unint64_t)a3;
- (id)itemAtIndexPath:(id)a3;
- (id)navigationBarTitle;
- (id)titleForSection:(unint64_t)a3;
- (unint64_t)numberOfItemsInSection:(unint64_t)a3;
- (unint64_t)numberOfSections;
- (void)_loadMerchantForPassUniqueID:(id)a3;
- (void)_notifyContentLoadedIfNecessary;
- (void)setDataSourceDelegate:(id)a3;
@end

@implementation PKAuxiliaryPassInformationDataSource

- (PKAuxiliaryPassInformationDataSource)initWithItem:(id)a3 forPass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryPassInformationDataSource;
  v9 = [(PKAuxiliaryPassInformationDataSource *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_item, a3);
    uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
    headerIndexPath = v10->_headerIndexPath;
    v10->_headerIndexPath = (NSIndexPath *)v11;

    v10->_contentIsLoaded = 0;
    v13 = [v8 uniqueID];
    [(PKAuxiliaryPassInformationDataSource *)v10 _loadMerchantForPassUniqueID:v13];
  }
  return v10;
}

- (id)titleForSection:(unint64_t)a3
{
  if (-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:"))
  {
    v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
    v6 = [v5 objectAtIndex:(unint64_t)((double)a3 + -1.0)];
    id v7 = [v6 header];

    if (v7)
    {
      id v8 = +[PKDashboardHeaderTextItem itemWithHeaderText:v7];
      [v8 setStyle:5];
      v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [v8 setTitleColor:v9];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)footerTextItemForSection:(unint64_t)a3
{
  if (-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:"))
  {
    v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
    v6 = [v5 objectAtIndex:(unint64_t)((double)a3 + -1.0)];
    id v7 = [v6 footer];

    if (v7)
    {
      id v8 = +[PKDashboardFooterTextItem itemWithFooterText:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)numberOfSections
{
  merchant = self->_merchant;
  if (!self->_contentIsLoaded)
  {
    unint64_t v5 = 0;
    if (merchant) {
      return v5;
    }
    goto LABEL_3;
  }
  v4 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
  unint64_t v5 = [v4 count] + 2;

  if (!merchant) {
LABEL_3:
  }
    v5 -= self->_contentIsLoaded;
  return v5;
}

- (unint64_t)numberOfItemsInSection:(unint64_t)a3
{
  if (!a3) {
    return 1;
  }
  if (!-[PKAuxiliaryPassInformationDataSource _isDynamicSection:](self, "_isDynamicSection:")) {
    return self->_merchant != 0;
  }
  if (!self->_contentIsLoaded) {
    return 0;
  }
  unint64_t v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
  v6 = [v5 objectAtIndex:(unint64_t)((double)a3 + -1.0)];
  id v7 = [v6 rows];
  unint64_t v8 = [v7 count];

  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 section];
  if (v5)
  {
    unint64_t v6 = v5;
    if ([(PKAuxiliaryPassInformationDataSource *)self _isDynamicSection:v5])
    {
      id v7 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
      unint64_t v8 = [v7 objectAtIndex:(unint64_t)((double)v6 + -1.0)];
      v9 = [v8 rows];
      v10 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row"));

      uint64_t v11 = objc_alloc_init(PKDashboardTextActionItem);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v12 = [(PKPassAuxiliaryPassInformationItem *)self->_item fields];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v41 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            v18 = [v17 key];
            int v19 = [v18 isEqualToString:v10];

            if (v19)
            {
              unsigned __int8 v39 = 0;
              v20 = [v17 labelImage];
              uint64_t v21 = +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", [v20 tintColor], &v39);
              v38 = v20;
              v22 = +[PKDashboardTextActionItem imageForPassFieldImage:v20 hasTintColor:v39];
              v33 = [v17 value];
              v23 = [v17 valueImage];
              v36 = +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", [v23 tintColor], &v39);
              v37 = v23;
              v35 = +[PKDashboardTextActionItem imageForPassFieldImage:v23 hasTintColor:v39];
              v24 = [v17 accessoryImage];
              v34 = +[PKDashboardTextActionItem colorForSemanticColor:hasTintColor:](PKDashboardTextActionItem, "colorForSemanticColor:hasTintColor:", [v24 tintColor], &v39);
              v25 = +[PKDashboardTextActionItem imageForPassFieldImage:v24 hasTintColor:v39];
              v26 = [v17 label];
              [(PKDashboardTextActionItem *)v11 setTitle:v26];

              [(PKDashboardTextActionItem *)v11 setTitleImage:v22];
              v27 = (void *)v21;
              [(PKDashboardTextActionItem *)v11 setTitleColor:v21];
              id v28 = v33;
              v29 = v28;
              if (v28)
              {
                uint64_t v30 = [v28 length];

                if (v30) {
                  v31 = v29;
                }
                else {
                  v31 = 0;
                }
              }
              else
              {
                v31 = 0;
              }
              [(PKDashboardTextActionItem *)v11 setSubtitle:v31];
              [(PKDashboardTextActionItem *)v11 setSubtitleImage:v35];
              [(PKDashboardTextActionItem *)v11 setSubtitleColor:v36];
              [(PKDashboardTextActionItem *)v11 setAccessoryImage:v25];
              [(PKDashboardTextActionItem *)v11 setAccessoryColor:v34];
              [(PKDashboardTextActionItem *)v11 setLayoutStyle:1];

              goto LABEL_22;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_22:
    }
    else if (self->_merchant)
    {
      uint64_t v11 = objc_alloc_init(PKDashboardTransactionMapItem);
      [(PKDashboardTextActionItem *)v11 setMerchant:self->_merchant];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = [(PKAuxiliaryPassInformationDataSource *)self _headerItem];
  }

  return v11;
}

- (void)setDataSourceDelegate:(id)a3
{
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  if (self->_contentIsLoaded) {
    [v4 contentIsLoaded];
  }
}

- (id)navigationBarTitle
{
  v3 = [(PKMerchant *)self->_merchant displayName];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item title];
  }
  unint64_t v6 = v5;

  if ([(PKMerchant *)self->_merchant useDisplayNameIgnoringBrand])
  {
    uint64_t v7 = [(PKMerchant *)self->_merchant displayNameIgnoringBrand];

    unint64_t v6 = (void *)v7;
  }

  return v6;
}

- (NSString)footerTitle
{
  return (NSString *)[(PKPassAuxiliaryPassInformationItem *)self->_item detailFooterLeadingTitle];
}

- (NSString)footerText
{
  return (NSString *)[(PKPassAuxiliaryPassInformationItem *)self->_item detailFooterLeadingText];
}

- (NSString)footerSecondaryText
{
  return (NSString *)[(PKPassAuxiliaryPassInformationItem *)self->_item detailFooterTrailingText];
}

- (NSString)footerSecondaryTitle
{
  return (NSString *)[(PKPassAuxiliaryPassInformationItem *)self->_item detailFooterTrailingTitle];
}

- (BOOL)_isDynamicSection:(int64_t)a3
{
  if (a3 < 1) {
    return 0;
  }
  double v3 = (double)a3;
  id v4 = [(PKPassAuxiliaryPassInformationItem *)self->_item sections];
  BOOL v5 = (double)(unint64_t)[v4 count] + 1.0 > v3;

  return v5;
}

- (id)_headerItem
{
  double v3 = [[PKTransactionHistoryHeaderItem alloc] initWithType:0];
  id v4 = v3;
  if (self->_merchant)
  {
    -[PKTransactionHistoryHeaderItem setMerchant:](v3, "setMerchant:");
    [(PKTransactionHistoryHeaderItem *)v4 setShowDetailedPropertyLocation:1];
  }
  else
  {
    BOOL v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item title];
    [(PKTransactionHistoryHeaderItem *)v4 setTitle:v5];

    [(PKTransactionHistoryHeaderItem *)v4 setCategory:[(PKPassAuxiliaryPassInformationItem *)self->_item merchantCategory]];
  }

  return v4;
}

- (void)_loadMerchantForPassUniqueID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKPassAuxiliaryPassInformationItem *)self->_item mapsURL];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F84C38]);
    item = self->_item;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke;
    v8[3] = &unk_1E59D2CA0;
    v8[4] = self;
    [v6 merchantForPassUniqueIdentifier:v4 withAuxiliaryPassInformationItem:item completion:v8];
  }
  else if (!self->_contentIsLoaded)
  {
    [(PKAuxiliaryPassInformationDataSource *)self _notifyContentLoadedIfNecessary];
  }
}

void __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
  id v4 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke_2;
  v5[3] = &unk_1E59CA7F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E4F14428], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __69__PKAuxiliaryPassInformationDataSource__loadMerchantForPassUniqueID___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[8])
  {
    v2 = WeakRetained;
    [WeakRetained _notifyContentLoadedIfNecessary];
    WeakRetained = v2;
  }
}

- (void)_notifyContentLoadedIfNecessary
{
  if (!self->_contentIsLoaded)
  {
    self->_contentIsLoaded = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contentIsLoaded];
  }
}

- (PKPassAuxiliaryPassInformationItem)item
{
  return self->_item;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (NSIndexPath)headerIndexPath
{
  return self->_headerIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexPath, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_item, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end