@interface PKPaymentCredentialMetadataTableController
- (PKPaymentCredentialMetadataTableController)initWithMetadata:(id)a3 setupContext:(int64_t)a4 cellStyle:(int64_t)a5;
- (id)cellForRowAtIndexPath:(id)a3;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (void)willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4;
@end

@implementation PKPaymentCredentialMetadataTableController

- (PKPaymentCredentialMetadataTableController)initWithMetadata:(id)a3 setupContext:(int64_t)a4 cellStyle:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentCredentialMetadataTableController;
  v9 = [(PKPaymentCredentialMetadataTableController *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    metadata = v9->_metadata;
    v9->_metadata = (NSArray *)v10;

    v9->_setupContext = a4;
    v9->_cellStyle = a5;
  }

  return v9;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  return [(NSArray *)self->_metadata count];
}

- (id)cellForRowAtIndexPath:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4FB1D08];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithStyle:self->_cellStyle reuseIdentifier:@"summaryCell"];
  v7 = PKProvisioningSecondaryBackgroundColor();
  [v6 setBackgroundColor:v7];

  id v8 = [v6 detailTextLabel];
  v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v8 setColor:v9];

  metadata = self->_metadata;
  uint64_t v11 = [v5 row];

  v12 = [(NSArray *)metadata objectAtIndex:v11];
  objc_super v13 = [v6 textLabel];
  v14 = [v12 localizedDisplayName];
  [v13 setText:v14];

  v15 = [v6 detailTextLabel];
  v16 = [v12 displayString];
  [v15 setText:v16];

  [v15 setAdjustsFontSizeToFitWidth:1];
  [v15 setMinimumScaleFactor:0.75];
  [v15 setNumberOfLines:2];
  [v6 setSelectionStyle:0];
  if (self->_cellStyle == 3)
  {
    char IsBridge = PKPaymentSetupContextIsBridge();
    v18 = [v6 textLabel];
    if (IsBridge)
    {
      v19 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [v18 setTextColor:v19];

      v20 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      [v18 setFont:v20];

      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else
    {
      v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v18 setTextColor:v21];

      v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
      [v18 setFont:v22];

      [MEMORY[0x1E4FB1618] labelColor];
    v23 = };
    [v15 setTextColor:v23];

    v24 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28D0], 0, 0, 4);
    [v15 setFont:v24];
  }

  return v6;
}

- (void)willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4
{
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v5 = objc_msgSend(a3, "cellForRowAtIndexPath:", a4, a5.x, a5.y);
  v6 = v5;
  if (v5)
  {
    v7 = [v5 detailTextLabel];
    id v8 = [v7 text];
  }
  else
  {
    id v8 = 0;
  }
  if (![v8 length])
  {

    id v8 = 0;
  }
  v9 = (void *)MEMORY[0x1E4FB1678];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E59D5228;
  id v14 = v8;
  id v10 = v8;
  uint64_t v11 = [v9 configurationWithIdentifier:0 previewProvider:0 actionProvider:v13];

  return v11;
}

id __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 32)) {
    goto LABEL_4;
  }
  v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v11[3] = &unk_1E59D5200;
  id v12 = *(id *)(a1 + 32);
  v6 = [v4 actionWithTitle:v5 image:0 identifier:0 handler:v11];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FB1970];
    v13[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v9 = [v7 menuWithTitle:&stru_1EF1B5B50 children:v8];
  }
  else
  {
LABEL_4:
    v9 = 0;
  }

  return v9;
}

void __104__PKPaymentCredentialMetadataTableController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end