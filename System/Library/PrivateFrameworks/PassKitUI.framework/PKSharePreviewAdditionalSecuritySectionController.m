@interface PKSharePreviewAdditionalSecuritySectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKSharePreviewAdditionalSecuritySectionController)init;
- (PKSharePreviewAdditionalSecuritySectionController)initWithInitiationContext:(id)a3 delegate:(id)a4;
- (PKSharePreviewAdditionalSecuritySectionController)initWithMode:(unint64_t)a3 activationOptions:(id)a4 delegate:(id)a5;
- (id)_initWithMode:(unint64_t)a3 activationOptions:(id)a4 context:(id)a5 delegate:(id)a6;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)footerAttributedStringForIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (void)_activationCodeSwitchValueChanged:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setContext:(id)a3;
@end

@implementation PKSharePreviewAdditionalSecuritySectionController

- (PKSharePreviewAdditionalSecuritySectionController)init
{
  return 0;
}

- (PKSharePreviewAdditionalSecuritySectionController)initWithInitiationContext:(id)a3 delegate:(id)a4
{
  return (PKSharePreviewAdditionalSecuritySectionController *)[(PKSharePreviewAdditionalSecuritySectionController *)self _initWithMode:0 activationOptions:0 context:a3 delegate:a4];
}

- (PKSharePreviewAdditionalSecuritySectionController)initWithMode:(unint64_t)a3 activationOptions:(id)a4 delegate:(id)a5
{
  return (PKSharePreviewAdditionalSecuritySectionController *)[(PKSharePreviewAdditionalSecuritySectionController *)self _initWithMode:a3 activationOptions:a4 context:0 delegate:a5];
}

- (id)_initWithMode:(unint64_t)a3 activationOptions:(id)a4 context:(id)a5 delegate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKSharePreviewAdditionalSecuritySectionController;
  v14 = [(PKPassShareSectionController *)&v26 initWithIdentifiers:&unk_1EF2BA368];
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    v14->_mode = a3;
    objc_storeStrong((id *)&v14->_activationOptions, a4);
    objc_storeStrong(p_isa + 11, a5);
    objc_storeWeak(p_isa + 12, v13);
    objc_initWeak(&location, p_isa);
    v16 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v17 = objc_opt_class();
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __102__PKSharePreviewAdditionalSecuritySectionController__initWithMode_activationOptions_context_delegate___block_invoke;
    v23 = &unk_1E59CBB38;
    objc_copyWeak(&v24, &location);
    v18 = [v16 registrationWithCellClass:v17 configurationHandler:&v20];
    objc_msgSend(p_isa, "setCellRegistration:", v18, v20, v21, v22, v23);

    [p_isa reloadItemsAnimated:0];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return p_isa;
}

void __102__PKSharePreviewAdditionalSecuritySectionController__initWithMode_activationOptions_context_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forRowItem:v6];
  }
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);

  [(PKSharePreviewAdditionalSecuritySectionController *)self reloadItemsAnimated:0];
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  activationOptions = self->_activationOptions;
  if (activationOptions)
  {
    id v6 = activationOptions;
LABEL_4:
    int v8 = 1;
    v41 = v6;
    id v9 = v41;
    goto LABEL_5;
  }
  v7 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v6 = [v7 activationOptions];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v39 = [(PKPassShareInitiationContext *)self->_context availableActivationOptions];
  if (v39)
  {
    id v9 = (void *)v39;
    int v8 = 0;
    v41 = 0;
LABEL_5:
    v10 = PKPassShareActivationOptionActivationCodeTypes();
    id v11 = [v9 optionOfTypes:v10];

    v43 = [v11 value];
    id v12 = [v9 optionsOfType:3];
    footerText = self->_footerText;
    self->_footerText = 0;

    context = self->_context;
    BOOL v42 = v3;
    if (context)
    {
      BOOL v15 = [(PKPassShareInitiationContext *)context areActivationOptionsUserEditable];
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v15)
      {
        uint64_t v17 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"ActivationCodeToggleRowItem"];
        v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"number.circle.fill" withConfiguration:0];
        [(PKSharePreviewRowItem *)v17 setIcon:v18];

        if (v11) {
          v19 = @"SHARE_OVERVIEW_ACTIVATION_CODE_TITLE";
        }
        else {
          v19 = @"SHARE_OVERVIEW_ACTIVATION_CODE_EXTERNAL_KEY_TITLE";
        }
        uint64_t v20 = PKLocalizedShareableCredentialString(&v19->isa);
        [(PKSharePreviewRowItem *)v17 setTitle:v20];

        int v21 = 1;
        if (v8) {
          uint64_t v22 = 1;
        }
        else {
          uint64_t v22 = 2;
        }
        [(PKSharePreviewRowItem *)v17 setDisplayToggleState:v22];
        [v16 addObject:v17];

        goto LABEL_16;
      }
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    int v21 = 0;
LABEL_16:
    char v23 = v8 ^ 1;
    if (v11) {
      char v24 = v23;
    }
    else {
      char v24 = 1;
    }
    if ((v24 & 1) == 0)
    {
      v25 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"ActivationCodePreviewRowItem"];
      if (v21)
      {
        PKLocalizedShareableCredentialString(&cfstr_ShareOverviewA_2.isa);
      }
      else
      {
        objc_super v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"number.circle.fill" withConfiguration:0];
        [(PKSharePreviewRowItem *)v25 setIcon:v26];

        [v11 localizedName];
      v27 = };
      [(PKSharePreviewRowItem *)v25 setTitle:v27];

      [(PKSharePreviewRowItem *)v25 setIsShowingSensitiveContent:1];
      if (v43)
      {
        -[PKSharePreviewRowItem setSubtitle:](v25, "setSubtitle:");
      }
      else
      {
        v28 = PKPANMask();
        [(PKSharePreviewRowItem *)v25 setSubtitle:v28];
      }
      [v16 addObject:v25];
    }
    if ([v12 count]) {
      char v29 = v23;
    }
    else {
      char v29 = 1;
    }
    if ((v29 & 1) == 0 && v12)
    {
      v30 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"ActivationExistingKeyPreviewRowItem"];
      v31 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_8.isa);
      [(PKSharePreviewRowItem *)v30 setTitle:v31];

      if ((v21 & 1) == 0)
      {
        v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"key" withConfiguration:0];
        [(PKSharePreviewRowItem *)v30 setIcon:v32];
      }
      [(PKSharePreviewRowItem *)v30 setIsShowingSensitiveContent:1];
      [v16 addObject:v30];
    }
    v33 = NSString;
    v34 = [v9 localizationKeyPostfix];
    v35 = [v33 stringWithFormat:@"SHARE_OVERVIEW_ACTIVATION_FOOTER_%@", v34];
    PKLocalizedShareableCredentialString(v35);
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();
    v37 = self->_footerText;
    self->_footerText = v36;

    [(PKPaymentSetupListSectionController *)self setItems:v16];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadDataAnimated:v42];

    return;
  }
  uint64_t v40 = MEMORY[0x1E4F1CBF0];

  [(PKPaymentSetupListSectionController *)self setItems:v40];
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v9 = [v7 title];
  [v8 setText:v9];

  v10 = [v7 subtitle];
  [v8 setSecondaryText:v10];

  id v11 = [v8 secondaryTextProperties];
  id v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v11 setColor:v12];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  id v13 = [v7 icon];

  if (v13)
  {
    v14 = [v7 icon];
    [v8 setImage:v14];

    BOOL v15 = [v8 imageProperties];
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else
  {
    id v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"number.circle.fill" withConfiguration:0];
    [v8 setImage:v16];

    BOOL v15 = [v8 imageProperties];
    [MEMORY[0x1E4FB1618] clearColor];
  uint64_t v17 = };
  [v15 setTintColor:v17];

  [v6 setContentConfiguration:v8];
  if (self->_mode == 2) {
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else {
  v18 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__PKSharePreviewAdditionalSecuritySectionController_decorateListCell_forRowItem___block_invoke;
  v30[3] = &unk_1E59D4018;
  id v19 = v18;
  id v31 = v19;
  [v6 setConfigurationUpdateHandler:v30];
  if (![v7 displayChevron])
  {
    uint64_t v21 = [v7 displayToggleState];
    if (!v21) {
      goto LABEL_15;
    }
    uint64_t v22 = v21;
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    char v24 = [v7 identifier];
    int v25 = PKEqualObjects();

    if (v25) {
      [v23 addTarget:self action:sel__activationCodeSwitchValueChanged_ forControlEvents:4096];
    }
    [v23 setOn:v22 == 1];
    id v20 = (id)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v23 placement:1];
    [v20 setMaintainsFixedSize:1];

    if (!v20) {
      goto LABEL_15;
    }
LABEL_14:
    v32[0] = v20;
    objc_super v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    [v6 setAccessories:v26];

    goto LABEL_16;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  if (v20) {
    goto LABEL_14;
  }
LABEL_15:
  [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
LABEL_16:
  uint64_t v27 = [v7 isShowingSensitiveContent];
  v28 = [v6 contentView];
  objc_msgSend(v28, "pkui_setExcludedFromScreenCapture:andBroadcasting:", v27, v27);

  return v8;
}

void __81__PKSharePreviewAdditionalSecuritySectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v5 = (void *)MEMORY[0x1E4FB1498];
  id v6 = a2;
  id v7 = [v5 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    int v8 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    [v7 setBackgroundColor:v8];
  }
  else
  {
    [v7 setBackgroundColor:*(void *)(a1 + 32)];
  }
  [v6 setBackgroundConfiguration:v7];
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (self->_mode == 2) {
    BOOL v3 = @"SHARE_OVERVIEW_ACTIVATION_CODE_VIEWING_HEADER";
  }
  else {
    BOOL v3 = @"SHARE_OVERVIEW_ACTIVATION_CODE_HEADER";
  }
  v4 = (objc_class *)MEMORY[0x1E4F28B18];
  v5 = v3;
  id v6 = [v4 alloc];
  id v7 = PKLocalizedShareableCredentialString(v5);

  v13[0] = *MEMORY[0x1E4FB06F8];
  int v8 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
  v14[0] = v8;
  v13[1] = *MEMORY[0x1E4FB0700];
  id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v14[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = (void *)[v6 initWithString:v7 attributes:v10];

  return v11;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (self->_footerText)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
    footerText = self->_footerText;
    v11[0] = *MEMORY[0x1E4FB06F8];
    id v6 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27C0]);
    v12[0] = v6;
    v11[1] = *MEMORY[0x1E4FB0700];
    id v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v12[1] = v7;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    id v9 = (void *)[v4 initWithString:footerText attributes:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)didSelectItem:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deselectCells];
}

- (void)_activationCodeSwitchValueChanged:(id)a3
{
  int v4 = [a3 isOn];
  v5 = [(PKPassShareInitiationContext *)self->_context composedShare];
  id v6 = v5;
  if (v4)
  {
    id v7 = [(PKPassShareInitiationContext *)self->_context availableActivationOptions];
    [v6 setActivationOptions:v7];
  }
  else
  {
    [v5 setActivationOptions:0];
  }

  [(PKSharePreviewAdditionalSecuritySectionController *)self reloadItemsAnimated:1];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_activationOptions, 0);
}

@end