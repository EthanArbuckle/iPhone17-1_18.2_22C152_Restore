@interface PKSecureElementPassContactIssuerHelper
- (PKSecureElementPass)pass;
- (PKSecureElementPassContactIssuerHelperDelegate)delegate;
- (id)openBusinessChatHandler;
- (unint64_t)featureIdentifier;
- (void)callIssuer;
- (void)emailIssuer;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)openIssuerWebsite;
- (void)presentContactViewController:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setOpenBusinessChatHandler:(id)a3;
- (void)setPass:(id)a3;
@end

@implementation PKSecureElementPassContactIssuerHelper

- (void)setPass:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  objc_storeStrong((id *)&self->_pass, a3);
  v5 = [(PKSecureElementPass *)self->_pass devicePaymentApplications];
  v6 = [v5 allObjects];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v12 = objc_msgSend(v11, "automaticSelectionCriteria", v18);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
LABEL_8:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v20 + 1) + 8 * v16) type];
          self->_isAppleAccess = PKEqualObjects();

          if (self->_isAppleAccess) {
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v14) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      if (self->_isAppleAccess) {
        break;
      }
      if (++v10 == v8)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)presentContactViewController:(unint64_t)a3
{
  unint64_t v5 = PKUserInterfaceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  v6 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
  uint64_t v7 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
  uint64_t v8 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];
  v47 = [(PKSecureElementPass *)self->_pass businessChatIdentifier];
  uint64_t v9 = [(PKSecureElementPass *)self->_pass organizationName];
  BOOL v10 = [v7 length] != 0;
  v46 = v8;
  if ([(PKSecureElementPass *)self->_pass hasAssociatedPeerPaymentAccount])
  {
    uint64_t v11 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas_11.isa);
LABEL_5:
    id v12 = (id)v11;
LABEL_6:

    uint64_t v9 = v12;
    goto LABEL_7;
  }
  if (self->_featureIdentifier)
  {
    uint64_t v11 = PKLocalizedFeatureString();
    goto LABEL_5;
  }
  if (self->_isAppleAccess && [(PKSecureElementPass *)self->_pass isAccessPass])
  {
    v40 = [(PKSecureElementPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A50]];
    uint64_t v41 = [v40 value];
    v42 = (void *)v41;
    if (v41) {
      v43 = (void *)v41;
    }
    else {
      v43 = v9;
    }
    id v12 = v43;

    uint64_t v8 = v46;
    uint64_t v9 = v40;
    goto LABEL_6;
  }
LABEL_7:
  unsigned int v13 = a3 & v10;
  v48 = PKLocalizedPaymentString(&cfstr_ContactIssuer.isa, &stru_1EF1B4C70.isa, v9);
  uint64_t v14 = 0;
  if (v5 && ((v13 ^ 1) & 1) == 0)
  {
    [(PKSecureElementPass *)self->_pass organizationName];
    v16 = uint64_t v15 = v8;
    uint64_t v14 = PKLocalizedPaymentString(&cfstr_ContactIssuerB.isa, &cfstr_12.isa, v16, v7);

    uint64_t v8 = v15;
  }
  v44 = v7;
  if (v5) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v13;
  }
  if (v6 && [v6 length]) {
    unint64_t v18 = (a3 >> 1) & 1;
  }
  else {
    LODWORD(v18) = 0;
  }
  v45 = v6;
  if (v8)
  {
    if ([v8 length]) {
      unsigned int v19 = (a3 >> 2) & 1;
    }
    else {
      unsigned int v19 = 0;
    }
  }
  else
  {
    unsigned int v19 = 0;
  }
  uint64_t v20 = 0;
  if ((a3 & 8) != 0 && v47) {
    uint64_t v20 = +[PKBusinessChatController deviceSupportsBusinessChat];
  }
  if (v5) {
    BOOL v21 = v18 + (unint64_t)v17 + v19 == v20 << 63 >> 63;
  }
  else {
    BOOL v21 = 0;
  }
  uint64_t v22 = v21;
  long long v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v48 message:v14 preferredStyle:v22];
  if (v17)
  {
    long long v24 = (void *)MEMORY[0x1E4FB1410];
    long long v25 = PKLocalizedPaymentString(&cfstr_Call_0.isa);
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke;
    v52[3] = &unk_1E59CB1F0;
    v52[4] = self;
    long long v26 = [v24 actionWithTitle:v25 style:0 handler:v52];
    [v23 addAction:v26];

    if (!v18) {
      goto LABEL_33;
    }
  }
  else if (!v18)
  {
LABEL_33:
    if (v19) {
      goto LABEL_34;
    }
    goto LABEL_38;
  }
  uint64_t v30 = (void *)MEMORY[0x1E4FB1410];
  v31 = PKLocalizedPaymentString(&cfstr_Email.isa);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_2;
  v51[3] = &unk_1E59CB1F0;
  v51[4] = self;
  v32 = [v30 actionWithTitle:v31 style:0 handler:v51];
  [v23 addAction:v32];

  if (v19)
  {
LABEL_34:
    long long v27 = (void *)MEMORY[0x1E4FB1410];
    v28 = PKLocalizedPaymentString(&cfstr_GoToWebsite.isa);
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_3;
    v50[3] = &unk_1E59CB1F0;
    v50[4] = self;
    v29 = [v27 actionWithTitle:v28 style:0 handler:v50];
    [v23 addAction:v29];

    if (!v20) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_38:
  if (v20)
  {
LABEL_39:
    v33 = (void *)MEMORY[0x1E4FB1410];
    v34 = PKLocalizedPaymentString(&cfstr_Message_0.isa);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_4;
    v49[3] = &unk_1E59CB1F0;
    v49[4] = self;
    v35 = [v33 actionWithTitle:v34 style:0 handler:v49];
    [v23 addAction:v35];
  }
LABEL_40:
  v36 = (void *)MEMORY[0x1E4FB1410];
  v37 = PKLocalizedString(&cfstr_Cancel.isa);
  v38 = [v36 actionWithTitle:v37 style:1 handler:0];
  [v23 addAction:v38];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contactIssuerHelper:self didRequestPresentViewController:v23 animated:1 completion:0];
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) callIssuer];
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) emailIssuer];
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) openIssuerWebsite];
}

uint64_t __71__PKSecureElementPassContactIssuerHelper_presentContactViewController___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)callIssuer
{
  v50[1] = *MEMORY[0x1E4F143B8];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contactIssuerHelper:self didRequestPresentViewController:v34 animated:1 completion:0];

    return;
  }
  if (!PKUserInterfaceIdiomSupportsLargeLayouts())
  {
    v4 = [(PKSecureElementPass *)self->_pass organizationName];
    unint64_t v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v4 message:0 preferredStyle:0];
    v6 = (void *)MEMORY[0x1E4FB1930];
    v50[0] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    uint64_t v8 = [v6 appearanceWhenContainedInInstancesOfClasses:v7];
    [v8 setNumberOfLines:2];

    uint64_t v9 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A58]];
    id v10 = v9;
    if (v9)
    {
      uint64_t v11 = (void *)MEMORY[0x1E4FB1410];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke;
      v46[3] = &unk_1E59CB1F0;
      id v47 = v9;
      id v12 = [v11 actionWithTitle:v47 style:0 handler:v46];
      [v5 addAction:v12];
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v30 = self;
    id obj = [(PKSecureElementPass *)self->_pass backFieldBuckets];
    uint64_t v33 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
    if (!v33)
    {
LABEL_36:

      long long v27 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
      v28 = [MEMORY[0x1E4FB1410] actionWithTitle:v27 style:1 handler:0];
      [v5 addAction:v28];

      id v29 = objc_loadWeakRetained((id *)&v30->_delegate);
      [v29 contactIssuerHelper:v30 didRequestPresentViewController:v5 animated:1 completion:0];

      return;
    }
    uint64_t v32 = *(void *)v43;
LABEL_13:
    unsigned int v13 = 0;
    while (1)
    {
      if (*(void *)v43 != v32) {
        objc_enumerationMutation(obj);
      }
      v35 = v13;
      uint64_t v14 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v13);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v16) {
        break;
      }
LABEL_34:

      unsigned int v13 = v35 + 1;
      if (v35 + 1 == (char *)v33)
      {
        uint64_t v33 = [obj countByEnumeratingWithState:&v42 objects:v49 count:16];
        if (!v33) {
          goto LABEL_36;
        }
        goto LABEL_13;
      }
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
LABEL_18:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v39 != v18) {
        objc_enumerationMutation(v15);
      }
      uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * v19);
      if ([v20 dataDetectorTypes] != 1) {
        goto LABEL_32;
      }
      id v21 = [v20 label];

      uint64_t v22 = [v20 value];

      if (v21) {
        BOOL v23 = v22 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (v23)
      {
        if (v21 || (id v21 = v22) != 0)
        {
LABEL_31:
          long long v25 = (void *)MEMORY[0x1E4FB1410];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke_2;
          v36[3] = &unk_1E59CB1F0;
          id v10 = v22;
          id v37 = v10;
          long long v26 = [v25 actionWithTitle:v21 style:0 handler:v36];
          [v5 addAction:v26];

          v4 = v21;
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v24 = [v21 stringByAppendingFormat:@"\n%@", v22];

        id v21 = (id)v24;
        if (v24) {
          goto LABEL_31;
        }
      }
      v4 = 0;
      id v10 = v22;
LABEL_32:
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (!v17) {
          goto LABEL_34;
        }
        goto LABEL_18;
      }
    }
  }

  [(PKSecureElementPassContactIssuerHelper *)self presentContactViewController:1];
}

void __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke()
{
  PKTelephoneURLFromPhoneNumber();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

void __52__PKSecureElementPassContactIssuerHelper_callIssuer__block_invoke_2()
{
  PKTelephoneURLFromPhoneNumber();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v0 openSensitiveURL:v1 withOptions:0];
}

- (void)openIssuerWebsite
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contactIssuerHelper:self didRequestPresentViewController:v5 animated:1 completion:0];
  }
  else
  {
    id v5 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A60]];
    id WeakRetained = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    if (WeakRetained)
    {
      v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      [v4 openURL:WeakRetained configuration:0 completionHandler:0];
    }
  }
}

- (void)emailIssuer
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained contactIssuerHelper:self didRequestPresentViewController:v13 animated:1 completion:0];

    v4 = v13;
  }
  else
  {
    if ([(objc_class *)getMFMailComposeViewControllerClass_0() canSendMail])
    {
      id v5 = objc_alloc_init(getMFMailComposeViewControllerClass_0());
      [v5 setMailComposeDelegate:self];
      v6 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
      v15[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      [v5 setToRecipients:v7];

      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      [v8 contactIssuerHelper:self didRequestPresentViewController:v5 animated:1 completion:0];

      return;
    }
    id v14 = [(PKSecureElementPass *)self->_pass localizedValueForFieldKey:*MEMORY[0x1E4F87A48]];
    if ([v14 length])
    {
      uint64_t v9 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v10 = (void *)MEMORY[0x1E4F1CB10];
      uint64_t v11 = [NSString stringWithFormat:@"mailto:%@", v14];
      id v12 = [v10 URLWithString:v11];
      [v9 openURL:v12 configuration:0 completionHandler:0];
    }
    v4 = v14;
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained contactIssuerHelper:self didRequestDismissViewControllerAnimated:1 completion:0];
}

- (PKSecureElementPassContactIssuerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSecureElementPassContactIssuerHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKSecureElementPass)pass
{
  return self->_pass;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (id)openBusinessChatHandler
{
  return self->_openBusinessChatHandler;
}

- (void)setOpenBusinessChatHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_openBusinessChatHandler, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end