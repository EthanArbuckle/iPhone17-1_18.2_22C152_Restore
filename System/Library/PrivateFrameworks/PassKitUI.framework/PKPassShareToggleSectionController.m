@interface PKPassShareToggleSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)toggleValue;
- (NSString)footerText;
- (PKPassShareToggleSectionController)initWithIdentifier:(id)a3 title:(id)a4 toggleValue:(BOOL)a5 isEditable:(BOOL)a6 delegate:(id)a7;
- (PKPassShareToggleSectionControllerDelegate)delegate;
- (UIImage)icon;
- (id)cellRegistrationForItem:(id)a3;
- (id)footerAttributedStringForIdentifier:(id)a3;
- (void)decorateCell:(id)a3 forIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setIcon:(id)a3;
- (void)setToggleValue:(BOOL)a3;
- (void)toggleValueDidChange:(id)a3;
@end

@implementation PKPassShareToggleSectionController

- (PKPassShareToggleSectionController)initWithIdentifier:(id)a3 title:(id)a4 toggleValue:(BOOL)a5 isEditable:(BOOL)a6 delegate:(id)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v22[0] = @"ToggleSection";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  v20.receiver = self;
  v20.super_class = (Class)PKPassShareToggleSectionController;
  v17 = [(PKPassShareSectionController *)&v20 initWithIdentifiers:v16];

  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v17->_title, a4);
    v17->_toggleValue = a5;
    v17->_isEditable = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v21 = @"ToggleRow";
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
    [(PKPaymentSetupListSectionController *)v17 setItems:v18];
  }
  return v17;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__PKPassShareToggleSectionController_cellRegistrationForItem___block_invoke;
  v9[3] = &unk_1E59CBB38;
  objc_copyWeak(&v10, &location);
  v7 = [v5 registrationWithCellClass:v6 configurationHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v7;
}

void __62__PKPassShareToggleSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained decorateCell:v8 forIdentifier:v6];
  }
}

- (void)decorateCell:(id)a3 forIdentifier:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (__CFString *)a4;
  id v8 = v7;
  if (v7 == @"ToggleRow"
    || v7 && (int v9 = [(__CFString *)v7 isEqualToString:@"ToggleRow"], v8, v9))
  {
    id v10 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    [v11 setOn:self->_toggleValue];
    [v11 setEnabled:self->_isEditable];
    [v11 addTarget:self action:sel_toggleValueDidChange_ forControlEvents:4096];
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v11 placement:1];
    [v12 setMaintainsFixedSize:1];
    v16[0] = v12;
    id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v6 setAccessories:v13];

    [v10 setText:self->_title];
    [v10 setImage:self->_icon];
    id v14 = [v10 imageProperties];
    id v15 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v14 setTintColor:v15];

    [v6 setContentConfiguration:v10];
    [v6 setConfigurationUpdateHandler:&__block_literal_global_7];
  }
}

void __65__PKPassShareToggleSectionController_decorateCell_forIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4FB1498];
  id v3 = a2;
  id v5 = [v2 listGroupedCellConfiguration];
  id v4 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v5 setBackgroundColor:v4];

  [v3 setBackgroundConfiguration:v5];
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_footerText = &self->_footerText;
  id WeakRetained = objc_loadWeakRetained((id *)p_footerText);
  if (WeakRetained)
  {
    v7 = (__CFString *)v4;
    if (v7 == @"ToggleSection")
    {
    }
    else
    {
      id v8 = v7;
      if (!v7)
      {

LABEL_9:
        id WeakRetained = 0;
        goto LABEL_10;
      }
      int v9 = [(__CFString *)v7 isEqualToString:@"ToggleSection"];

      if (!v9) {
        goto LABEL_9;
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v11 = objc_loadWeakRetained((id *)p_footerText);
    v16[0] = *MEMORY[0x1E4FB06F8];
    v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27C0]);
    v17[0] = v12;
    v16[1] = *MEMORY[0x1E4FB0700];
    id v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v17[1] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    id WeakRetained = (id)[v10 initWithString:v11 attributes:v14];
  }
LABEL_10:

  return WeakRetained;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)toggleValueDidChange:(id)a3
{
  self->_toggleValue = [a3 isOn];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained toggle:self->_identifier valueDidChange:self->_toggleValue];
}

- (PKPassShareToggleSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassShareToggleSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)footerText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_footerText);

  return (NSString *)WeakRetained;
}

- (void)setFooterText:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)toggleValue
{
  return self->_toggleValue;
}

- (void)setToggleValue:(BOOL)a3
{
  self->_toggleValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_destroyWeak((id *)&self->_footerText);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end