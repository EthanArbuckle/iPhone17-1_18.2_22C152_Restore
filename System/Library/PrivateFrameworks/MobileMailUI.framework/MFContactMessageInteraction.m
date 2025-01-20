@interface MFContactMessageInteraction
- (BOOL)shouldShowContactHeader;
- (CertificateViewController)certificateViewController;
- (EMSecurityInformation)securityInformation;
- (MFCertificateTrustInformationKeychainManager)certificateKeychainManager;
- (MFContactMessageInteraction)init;
- (MFContactMessageInteractionDelegate)delegate;
- (MFSecureMIMEPersonHeaderView)headerView;
- (UIViewController)presentingViewController;
- (void)_certificateControllerDidFinish;
- (void)_configureSecureMIMEPersonHeaderView:(id)a3;
- (void)_presentCertificateTrustInfo:(id)a3;
- (void)_updateHeaderView;
- (void)_viewEncryptionCertificateButtonTapped:(id)a3;
- (void)_viewSigningCertificateButtonTapped:(id)a3;
- (void)addNotificationObservers;
- (void)installCertificateWithTrustException:(BOOL)a3;
- (void)performCertificateActionInstall;
- (void)performCertificateActionRemove;
- (void)performCertificateActionTrust;
- (void)performCertificateActionTrustAndInstall;
- (void)performCertificateActionUntrust;
- (void)promptOrInstallCertificationWithBlock:(id)a3;
- (void)promptToReplaceCurrentCertificateWithBlock:(id)a3;
- (void)refreshCertificateViewControllerStatus;
- (void)setCertificateKeychainManager:(id)a3;
- (void)setCertificateViewController:(id)a3 certificateTrustInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSecurityInformation:(id)a3;
- (void)updateCertificateAction;
- (void)updateWithSecurityInformation:(id)a3;
@end

@implementation MFContactMessageInteraction

- (MFContactMessageInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFContactMessageInteraction;
  v2 = [(MFContactMessageInteraction *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFContactMessageInteraction *)v2 addNotificationObservers];
  }
  return v3;
}

- (void)addNotificationObservers
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleTrustDidChange name:*MEMORY[0x1E4F77AF0] object:0];
}

- (MFSecureMIMEPersonHeaderView)headerView
{
  if ([(MFContactMessageInteraction *)self shouldShowContactHeader])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F35128]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(MFContactMessageInteraction *)self _configureSecureMIMEPersonHeaderView:v4];
  }
  else
  {
    v4 = 0;
  }
  return (MFSecureMIMEPersonHeaderView *)v4;
}

- (UIViewController)presentingViewController
{
  id v3 = [(MFContactMessageInteraction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 presentingViewControllerForMessageInteraction:self];
  }
  else
  {
    v4 = 0;
  }

  return (UIViewController *)v4;
}

- (BOOL)shouldShowContactHeader
{
  v2 = self;
  id v3 = [(MFContactMessageInteraction *)self securityInformation];
  char v4 = [v3 isSigned];

  objc_super v5 = [(MFContactMessageInteraction *)v2 securityInformation];
  LOBYTE(v2) = [v5 isEncrypted];

  return v4 | v2;
}

- (void)updateWithSecurityInformation:(id)a3
{
  id v4 = a3;
  -[MFContactMessageInteraction setSecurityInformation:](self, "setSecurityInformation:");
  [(MFContactMessageInteraction *)self _updateHeaderView];
}

- (void)_configureSecureMIMEPersonHeaderView:(id)a3
{
  id v50 = a3;
  if ([(MFContactMessageInteraction *)self shouldShowContactHeader])
  {
    id v4 = [(MFContactMessageInteraction *)self securityInformation];
    objc_super v5 = [v4 smimeError];
    int v6 = [v4 isSigned];
    int v7 = [v4 isEncrypted];
    if (!v5)
    {
      int v11 = v7;
      if (v6)
      {
        v12 = [v4 signers];
        int v47 = v11;
        v48 = [v12 firstObject];

        v13 = [MEMORY[0x1E4F1CA48] array];
        if (v48)
        {
          id v14 = objc_alloc(MEMORY[0x1E4F77BA0]);
          v15 = [v48 signingCertificateTrustInfo];
          v16 = (void *)[v14 initWithTrustInformation:v15];

          v45 = v16;
          if (([v16 action] | 2) == 2)
          {
            v17 = [MEMORY[0x1E4F28B50] mainBundle];
            v18 = [v17 localizedStringForKey:@"UNTRUSTED_SIGNATURE" value:&stru_1F39E2A88 table:@"Main"];

            v19 = NSString;
            v20 = MFLookupLocalizedString();
            v21 = [v48 signingCertificateTrustInfo];
            v22 = [v21 sender];
            v23 = objc_msgSend(v19, "stringWithFormat:", v20, v22);

            char v46 = 1;
          }
          else
          {
            v18 = 0;
            v23 = 0;
            char v46 = 0;
          }
          if ([v48 hasSeparateSigningAndEncryptionCertificates])
          {
            v28 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
            v29 = [MEMORY[0x1E4F28B50] mainBundle];
            v30 = [v29 localizedStringForKey:@"VIEW_SIGNING_CERTIFICATE" value:&stru_1F39E2A88 table:@"Main"];
            [v28 setTitle:v30 forState:0];

            [v28 addTarget:self action:sel__viewSigningCertificateButtonTapped_ forControlEvents:64];
            [v13 addObject:v28];
            v31 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
            v32 = [MEMORY[0x1E4F28B50] mainBundle];
            v33 = [v32 localizedStringForKey:@"VIEW_ENCRYPTION_CERTIFICATE" value:&stru_1F39E2A88 table:@"Main"];
            [v31 setTitle:v33 forState:0];

            [v31 addTarget:self action:sel__viewEncryptionCertificateButtonTapped_ forControlEvents:64];
            [v13 addObject:v31];
          }
          else
          {
            v34 = [v48 encryptionCertificateTrustInfo];
            v35 = &selRef__viewEncryptionCertificateButtonTapped_;
            if (!v34) {
              v35 = &selRef__viewSigningCertificateButtonTapped_;
            }
            v36 = *v35;

            v28 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
            v37 = [MEMORY[0x1E4F28B50] mainBundle];
            v38 = [v37 localizedStringForKey:@"VIEW_CERTIFICATE" value:&stru_1F39E2A88 table:@"Main"];
            [v28 setTitle:v38 forState:0];

            [v28 addTarget:self action:v36 forControlEvents:64];
            [v13 addObject:v28];
          }
        }
        else
        {
          v27 = [MEMORY[0x1E4F28B50] mainBundle];
          v18 = [v27 localizedStringForKey:@"SIGNATURE_ERROR" value:&stru_1F39E2A88 table:@"Main"];

          MFLookupLocalizedString();
          v23 = char v46 = 1;
        }
        if (v47)
        {
          v39 = [MEMORY[0x1E4F28B50] mainBundle];
          v25 = [v39 localizedStringForKey:@"ENCRYPTED" value:&stru_1F39E2A88 table:@"Main"];
        }
        else
        {
          v25 = 0;
        }
        if (v46)
        {
          v24 = 0;
        }
        else
        {
          v40 = [MEMORY[0x1E4F28B50] mainBundle];
          v24 = [v40 localizedStringForKey:@"SIGNED" value:&stru_1F39E2A88 table:@"Main"];

          v41 = [MEMORY[0x1E4F28B50] mainBundle];
          v42 = v41;
          if (v47) {
            v43 = @"SIGNED_AND_ENCRYPTED_DESCRIPTION";
          }
          else {
            v43 = @"SIGNED_DESCRIPTION";
          }
          uint64_t v44 = [v41 localizedStringForKey:v43 value:&stru_1F39E2A88 table:@"Main"];

          v23 = (void *)v44;
        }
      }
      else if (v7)
      {
        v26 = [MEMORY[0x1E4F28B50] mainBundle];
        v25 = [v26 localizedStringForKey:@"ENCRYPTED" value:&stru_1F39E2A88 table:@"Main"];

        v49 = [MEMORY[0x1E4F28B50] mainBundle];
        v23 = [v49 localizedStringForKey:@"ENCRYPTED_DESCRIPTION" value:&stru_1F39E2A88 table:@"Main"];
        v24 = 0;
        v18 = 0;
        v13 = 0;
      }
      else
      {
        v24 = 0;
        v25 = 0;
        v18 = 0;
        v23 = 0;
        v13 = 0;
      }
      goto LABEL_35;
    }
    uint64_t v8 = [v5 code];
    if (v8 == 1035)
    {
      v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"DECRYPTION_ERROR" value:&stru_1F39E2A88 table:@"Main"];
    }
    else
    {
      if (v8 != 1036)
      {
        v18 = 0;
        goto LABEL_13;
      }
      v9 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v10 = [v9 localizedStringForKey:@"SIGNATURE_ERROR" value:&stru_1F39E2A88 table:@"Main"];
    }
    v18 = (void *)v10;

LABEL_13:
    v24 = 0;
    [v5 localizedDescription];
    v23 = v25 = 0;
    v13 = 0;
LABEL_35:
    [v50 setSignedLabelText:v24];
    [v50 setSecureLabelText:v25];
    [v50 setWarningLabelText:v18];
    [v50 setExplanationText:v23];
    [v50 setButtons:v13];
  }
  [v50 invalidateIntrinsicContentSize];
}

- (void)_viewSigningCertificateButtonTapped:(id)a3
{
  id v4 = [(MFContactMessageInteraction *)self securityInformation];
  objc_super v5 = [v4 signers];
  int v6 = [v5 firstObject];
  id v8 = [v6 signingCertificateTrustInfo];

  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F77BA0]) initWithTrustInformation:v8];
  [(MFContactMessageInteraction *)self setCertificateKeychainManager:v7];

  [(MFContactMessageInteraction *)self _presentCertificateTrustInfo:v8];
}

- (void)_viewEncryptionCertificateButtonTapped:(id)a3
{
  id v4 = [(MFContactMessageInteraction *)self securityInformation];
  objc_super v5 = [v4 signers];
  int v6 = [v5 firstObject];
  id v8 = [v6 encryptionCertificateTrustInfo];

  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F77BA0]) initWithTrustInformation:v8];
  [(MFContactMessageInteraction *)self setCertificateKeychainManager:v7];

  [(MFContactMessageInteraction *)self _presentCertificateTrustInfo:v8];
}

- (void)_presentCertificateTrustInfo:(id)a3
{
  id v21 = a3;
  id v4 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  uint64_t v5 = [v4 action];

  int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F580F8]), "initWithTrust:action:", objc_msgSend(v21, "trust"), v5);
  int v7 = [MEMORY[0x1E4F28B50] mainBundle];
  id v8 = [v7 localizedStringForKey:@"CERTIFICATE" value:&stru_1F39E2A88 table:@"Main"];
  [v6 setTitle:v8];

  id v9 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  int v11 = [v10 localizedStringForKey:@"DONE" value:&stru_1F39E2A88 table:@"Main"];
  v12 = (void *)[v9 initWithTitle:v11 style:2 target:self action:sel__certificateControllerDidFinish];
  v13 = [v6 navigationItem];
  [v13 setRightBarButtonItem:v12];

  [(MFContactMessageInteraction *)self setCertificateViewController:v6 certificateTrustInfo:v21];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  v15 = [(MFContactMessageInteraction *)self presentingViewController];
  v16 = [v15 presentedViewController];

  if (v16)
  {
    uint64_t v17 = [v15 presentedViewController];

    v18 = (void *)v17;
    [v14 setModalPresentationStyle:3];
  }
  else
  {
    v19 = [v15 navigationController];
    uint64_t v20 = [v19 topViewController];

    v18 = (void *)v20;
  }
  [v18 presentViewController:v14 animated:1 completion:0];
}

- (void)setCertificateViewController:(id)a3 certificateTrustInfo:(id)a4
{
  id v8 = (CertificateViewController *)a3;
  id v7 = a4;
  if (self->_certificateViewController != v8)
  {
    objc_storeStrong((id *)&self->_certificateViewController, a3);
    objc_storeStrong((id *)&self->_certificateTrustInfo, a4);
    [(MFContactMessageInteraction *)self updateCertificateAction];
  }
}

- (void)_certificateControllerDidFinish
{
  certificateViewController = self->_certificateViewController;
  if (certificateViewController)
  {
    id v4 = [(CertificateViewController *)certificateViewController presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];

    uint64_t v5 = self->_certificateViewController;
    self->_certificateViewController = 0;

    certificateTrustInfo = self->_certificateTrustInfo;
    self->_certificateTrustInfo = 0;
  }
}

- (void)updateCertificateAction
{
  id v3 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  uint64_t v4 = [v3 keychainStatus];

  uint64_t v5 = [(MFContactMessageInteraction *)self securityInformation];
  int v6 = [v5 smimeError];

  id v7 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  int v8 = [v7 action];

  uint64_t v9 = [(EMCertificateTrustInformation *)self->_certificateTrustInfo certificateType];
  uint64_t v10 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  int v11 = [v10 canSaveCertificateToKeychain];

  v12 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  uint64_t v13 = [v12 action];
  id v14 = [(MFContactMessageInteraction *)self certificateViewController];
  [v14 setCertUIAction:v13];

  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = v15;
  if (v9 == 1) {
    [v15 localizedStringForKey:@"ENCRYPTION_CERTIFICATE_DESCRIPTION" value:&stru_1F39E2A88 table:@"Main"];
  }
  else {
  uint64_t v17 = [v15 localizedStringForKey:@"SIGNING_CERTIFICATE_DESCRIPTION" value:&stru_1F39E2A88 table:@"Main"];
  }

  if (v4 == 1)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v18 = [(MFContactMessageInteraction *)self certificateViewController];
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v20 = [v19 localizedStringForKey:@"REMOVE" value:&stru_1F39E2A88 table:@"Main"];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke;
    v35[3] = &unk_1E6D1A8F8;
    id v21 = &v36;
    objc_copyWeak(&v36, &location);
    [v18 setShowCertificateButton:1 localizedTitle:v20 localizedDescription:v17 destructive:1 handler:v35];
  }
  else
  {
    if (v6) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v8 == 1;
    }
    int v23 = !v22;
    if (v11)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      if (v23)
      {
        objc_initWeak(&location, self);
        v18 = [(MFContactMessageInteraction *)self certificateViewController];
        v19 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v20 = [v19 localizedStringForKey:@"INSTALL" value:&stru_1F39E2A88 table:@"Main"];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_2;
        v33[3] = &unk_1E6D1A8F8;
        id v21 = &v34;
        objc_copyWeak(&v34, &location);
        [v18 setShowCertificateButton:1 localizedTitle:v20 localizedDescription:v17 destructive:0 handler:v33];
      }
      else
      {
        objc_initWeak(&location, self);
        v18 = [(MFContactMessageInteraction *)self certificateViewController];
        v19 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v20 = [v19 localizedStringForKey:@"INSTALL" value:&stru_1F39E2A88 table:@"Main"];
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_3;
        v31[3] = &unk_1E6D1A8F8;
        id v21 = &v32;
        objc_copyWeak(&v32, &location);
        [v18 setShowCertificateButton:1 localizedTitle:v20 localizedDescription:v17 destructive:0 handler:v31];
      }
    }
    else if (v23)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v18 = [(MFContactMessageInteraction *)self certificateViewController];
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v20 = [v19 localizedStringForKey:@"TRUST" value:&stru_1F39E2A88 table:@"Main"];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_4;
      v29[3] = &unk_1E6D1A8F8;
      id v21 = &v30;
      objc_copyWeak(&v30, &location);
      [v18 setShowCertificateButton:1 localizedTitle:v20 localizedDescription:v17 destructive:0 handler:v29];
    }
    else
    {
      v24 = [(MFContactMessageInteraction *)self certificateKeychainManager];
      int v25 = [v24 hasTrustException];

      if (!v25)
      {
        v26 = [(MFContactMessageInteraction *)self certificateViewController];
        [v26 setShowCertificateButton:0 localizedTitle:0 localizedDescription:0 destructive:0 handler:0];

        goto LABEL_7;
      }
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v18 = [(MFContactMessageInteraction *)self certificateViewController];
      v19 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v20 = [v19 localizedStringForKey:@"UNTRUST" value:&stru_1F39E2A88 table:@"Main"];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_5;
      v27[3] = &unk_1E6D1A8F8;
      id v21 = &v28;
      objc_copyWeak(&v28, &location);
      [v18 setShowCertificateButton:1 localizedTitle:v20 localizedDescription:v17 destructive:1 handler:v27];
    }
  }

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
LABEL_7:
}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performCertificateActionRemove];
}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performCertificateActionTrustAndInstall];
}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performCertificateActionInstall];
}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performCertificateActionTrust];
}

void __54__MFContactMessageInteraction_updateCertificateAction__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained performCertificateActionUntrust];
}

- (void)performCertificateActionRemove
{
  id v3 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  [v3 removeTrustException];

  uint64_t v4 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  [v4 removeCertificateFromKeychain];

  [(MFContactMessageInteraction *)self updateCertificateAction];
  [(MFContactMessageInteraction *)self refreshCertificateViewControllerStatus];
}

- (void)performCertificateActionTrustAndInstall
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __70__MFContactMessageInteraction_performCertificateActionTrustAndInstall__block_invoke;
  v2[3] = &unk_1E6D1AB40;
  v2[4] = self;
  [(MFContactMessageInteraction *)self promptOrInstallCertificationWithBlock:v2];
}

uint64_t __70__MFContactMessageInteraction_performCertificateActionTrustAndInstall__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) installCertificateWithTrustException:1];
}

- (void)performCertificateActionInstall
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__MFContactMessageInteraction_performCertificateActionInstall__block_invoke;
  v2[3] = &unk_1E6D1AB40;
  v2[4] = self;
  [(MFContactMessageInteraction *)self promptOrInstallCertificationWithBlock:v2];
}

uint64_t __62__MFContactMessageInteraction_performCertificateActionInstall__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) installCertificateWithTrustException:0];
}

- (void)performCertificateActionTrust
{
  id v3 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  [v3 addTrustException];

  [(MFContactMessageInteraction *)self updateCertificateAction];
  [(MFContactMessageInteraction *)self refreshCertificateViewControllerStatus];
}

- (void)performCertificateActionUntrust
{
  id v3 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  [v3 removeTrustException];

  [(MFContactMessageInteraction *)self updateCertificateAction];
  [(MFContactMessageInteraction *)self refreshCertificateViewControllerStatus];
}

- (void)installCertificateWithTrustException:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(MFContactMessageInteraction *)self certificateKeychainManager];
    [v4 addTrustException];
  }
  uint64_t v5 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  [v5 saveCertificateToKeychain];

  [(MFContactMessageInteraction *)self updateCertificateAction];
  [(MFContactMessageInteraction *)self refreshCertificateViewControllerStatus];
}

- (void)_updateHeaderView
{
  id v4 = [(MFContactMessageInteraction *)self headerView];
  -[MFContactMessageInteraction _configureSecureMIMEPersonHeaderView:](self, "_configureSecureMIMEPersonHeaderView:");

  id v5 = [(MFContactMessageInteraction *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(MFContactMessageInteraction *)self headerView];
    [v5 contactMessageInteraction:self didUpdateHeaderView:v3];
  }
}

- (void)refreshCertificateViewControllerStatus
{
  id v3 = [(MFContactMessageInteraction *)self certificateViewController];
  v2 = [v3 tableView];
  [v2 reloadData];
}

- (void)promptOrInstallCertificationWithBlock:(id)a3
{
  int v6 = (void (**)(void))a3;
  id v4 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  uint64_t v5 = [v4 keychainStatus];

  if (v5 == 2) {
    [(MFContactMessageInteraction *)self promptToReplaceCurrentCertificateWithBlock:v6];
  }
  else {
    v6[2]();
  }
}

- (void)promptToReplaceCurrentCertificateWithBlock:(id)a3
{
  id v23 = a3;
  id v4 = [(MFContactMessageInteraction *)self certificateKeychainManager];
  uint64_t v5 = [v4 addressForSaving];

  int v6 = [MEMORY[0x1E4F28B50] mainBundle];
  id v7 = [v6 localizedStringForKey:@"OVERWRITE_CERTIFICATE_DESCRIPTION_FORMAT" value:&stru_1F39E2A88 table:@"Main"];

  int v8 = objc_msgSend(NSString, "stringWithFormat:", v7, v5);
  uint64_t v9 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v10 = [MEMORY[0x1E4F28B50] mainBundle];
  int v11 = [v10 localizedStringForKey:@"INSTALL_CERTIFICATE" value:&stru_1F39E2A88 table:@"Main"];
  v12 = [v9 alertControllerWithTitle:v11 message:v8 preferredStyle:1];

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  id v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"INSTALL" value:&stru_1F39E2A88 table:@"Main"];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__MFContactMessageInteraction_promptToReplaceCurrentCertificateWithBlock___block_invoke;
  v24[3] = &unk_1E6D1AF88;
  id v16 = v23;
  id v25 = v16;
  uint64_t v17 = [v13 actionWithTitle:v15 style:0 handler:v24];
  [v12 addAction:v17];

  v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1F39E2A88 table:@"Main"];
  id v21 = [v18 actionWithTitle:v20 style:1 handler:0];
  [v12 addAction:v21];

  BOOL v22 = [(MFContactMessageInteraction *)self certificateViewController];
  [v22 presentViewController:v12 animated:1 completion:0];
}

uint64_t __74__MFContactMessageInteraction_promptToReplaceCurrentCertificateWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MFContactMessageInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFContactMessageInteractionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CertificateViewController)certificateViewController
{
  return self->_certificateViewController;
}

- (EMSecurityInformation)securityInformation
{
  return self->_securityInformation;
}

- (void)setSecurityInformation:(id)a3
{
}

- (MFCertificateTrustInformationKeychainManager)certificateKeychainManager
{
  return self->_certificateKeychainManager;
}

- (void)setCertificateKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateKeychainManager, 0);
  objc_storeStrong((id *)&self->_securityInformation, 0);
  objc_storeStrong((id *)&self->_certificateViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificateTrustInfo, 0);
}

@end