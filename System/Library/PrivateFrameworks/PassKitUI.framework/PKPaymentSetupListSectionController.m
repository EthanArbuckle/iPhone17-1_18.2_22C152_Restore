@interface PKPaymentSetupListSectionController
- (NSArray)identifiers;
- (NSArray)items;
- (NSDirectionalEdgeInsets)headerDirectionalLayoutMargins;
- (PKPaymentSetupListSectionController)init;
- (PKPaymentSetupListSectionController)initWithIdentifiers:(id)a3;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4;
- (id)defaultListLayout;
- (id)footerAttributedStringForIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)setCellRegistration:(id)a3;
- (void)setHeaderDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)setIdentifiers:(id)a3;
- (void)setItems:(id)a3;
@end

@implementation PKPaymentSetupListSectionController

- (PKPaymentSetupListSectionController)initWithIdentifiers:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentSetupListSectionController;
  v6 = [(PKPaymentSetupListSectionController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifiers, a3);
    *(_OWORD *)&v7->_headerDirectionalLayoutMargins.top = xmmword_1A0444690;
    *(_OWORD *)&v7->_headerDirectionalLayoutMargins.bottom = xmmword_1A0444690;
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v9 = objc_opt_class();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__PKPaymentSetupListSectionController_initWithIdentifiers___block_invoke;
    v13[3] = &unk_1E59CBB38;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [v8 registrationWithCellClass:v9 configurationHandler:v13];
    cellRegistration = v7->_cellRegistration;
    v7->_cellRegistration = (UICollectionViewCellRegistration *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __59__PKPaymentSetupListSectionController_initWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decoratePaymentSetListCell:v9 forItem:v6];
  }
}

- (PKPaymentSetupListSectionController)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
  v4 = [v3 UUIDString];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(PKPaymentSetupListSectionController *)self initWithIdentifiers:v5];

  return v6;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  id v8 = [v6 title];
  [v7 setText:v8];

  id v9 = [v6 subtitle];
  [v7 setSecondaryText:v9];

  uint64_t v10 = [v7 secondaryTextProperties];
  v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v10 setColor:v11];

  [v7 directionalLayoutMargins];
  double v13 = v12;
  double v15 = v14;
  objc_super v16 = [v5 traitCollection];
  uint64_t v17 = [v16 userInterfaceIdiom];

  double v18 = 10.0;
  if (v17 == 6) {
    double v18 = 12.0;
  }
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v18, v13, v18, v15);
  v19 = [v6 icon];
  [v7 setImage:v19];

  v20 = [v7 imageProperties];
  [v20 setAccessibilityIgnoresInvertColors:1];
  [v5 setContentConfiguration:v7];
  v21 = [v6 identifier];
  [v5 setAccessibilityIdentifier:v21];

  [v5 setConfigurationUpdateHandler:&__block_literal_global_142];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v23 = [v6 badgeText];
  if (v23)
  {
    v24 = +[PKCellAccessoryBadge accessoryBadgeWithTitle:v23];
    [v22 addObject:v24];
  }
  v25 = [v6 labelText];
  if (v25)
  {
    v26 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v25];
    v27 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
    [v26 setFont:v27];

    [v22 addObject:v26];
  }
  if ([v6 loadingIndicatorVisible])
  {
    id v28 = +[PKCellAccessoryLoadingIndicator accessory];
  }
  else
  {
    if ([v6 displayChevron])
    {
      v29 = (objc_class *)MEMORY[0x1E4FB1518];
    }
    else
    {
      if ([v6 displayInfo])
      {
        id v34 = objc_alloc(MEMORY[0x1E4FB1838]);
        v35 = [MEMORY[0x1E4FB1818] systemImageNamed:@"info.circle"];
        v36 = (void *)[v34 initWithImage:v35];

        v30 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v36 placement:1];
        goto LABEL_13;
      }
      if (![v6 selected] || (objc_msgSend(v6, "useMultiSelectAccessory") & 1) != 0)
      {
        v30 = 0;
        goto LABEL_13;
      }
      v29 = (objc_class *)MEMORY[0x1E4FB14F8];
    }
    id v28 = objc_alloc_init(v29);
  }
  v30 = v28;
LABEL_13:
  [v22 safelyAddObject:v30];
  [v30 setReservedLayoutWidth:*MEMORY[0x1E4FB2750]];
  if ([v6 reserverSpaceForSelectedAccessory] && !objc_msgSend(v22, "count"))
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    [v31 setHidden:1];
    [v31 setIsAccessibilityElement:0];
    [v22 addObject:v31];
  }
  if ([v6 useMultiSelectAccessory])
  {
    uint64_t v32 = +[PKCellAccessoryMultiSelectIndicator accessoryWithSelected:](PKCellAccessoryMultiSelectIndicator, "accessoryWithSelected:", [v6 selected]);

    [v22 safelyAddObject:v32];
    v30 = (void *)v32;
  }
  [v5 setAccessories:v22];

  return v7;
}

void __74__PKPaymentSetupListSectionController_decoratePaymentSetListCell_forItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (id)defaultListLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  return 0;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v6 = v5;
  if (self->_items) {
    objc_msgSend(v5, "appendItems:");
  }

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  id v9 = [(PKPaymentSetupListSectionController *)self headerAttributedStringForIdentifier:v7];
  if (v9) {
    [v8 setHeaderMode:1];
  }
  uint64_t v10 = [(PKPaymentSetupListSectionController *)self footerAttributedStringForIdentifier:v7];
  if (v10) {
    [v8 setFooterMode:1];
  }
  v11 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v8 layoutEnvironment:v6];

  return v11;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((id)*MEMORY[0x1E4FB2770] == v8)
  {
    uint64_t v13 = [(PKPaymentSetupListSectionController *)self headerAttributedStringForIdentifier:v9];
    if (!v13) {
      goto LABEL_8;
    }
    v11 = (void *)v13;
    double v12 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
    [v12 setAttributedText:v11];
    objc_msgSend(v12, "setDirectionalLayoutMargins:", self->_headerDirectionalLayoutMargins.top, self->_headerDirectionalLayoutMargins.leading, self->_headerDirectionalLayoutMargins.bottom, self->_headerDirectionalLayoutMargins.trailing);
    goto LABEL_7;
  }
  if ((id)*MEMORY[0x1E4FB2760] == v8)
  {
    uint64_t v10 = [(PKPaymentSetupListSectionController *)self footerAttributedStringForIdentifier:v9];
    if (v10)
    {
      v11 = (void *)v10;
      double v12 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
      [v12 setAttributedText:v11];
LABEL_7:
      [v14 setContentConfiguration:v12];
    }
  }
LABEL_8:
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSDirectionalEdgeInsets)headerDirectionalLayoutMargins
{
  double top = self->_headerDirectionalLayoutMargins.top;
  double leading = self->_headerDirectionalLayoutMargins.leading;
  double bottom = self->_headerDirectionalLayoutMargins.bottom;
  double trailing = self->_headerDirectionalLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setHeaderDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_headerDirectionalLayoutMargins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);

  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end