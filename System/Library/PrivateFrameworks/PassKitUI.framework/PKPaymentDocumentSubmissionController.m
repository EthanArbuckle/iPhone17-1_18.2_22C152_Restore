@interface PKPaymentDocumentSubmissionController
- (NSBundle)localizationBundle;
- (NSString)preferredLanguage;
- (PKDocumentRequest)selectedDocument;
- (PKPaymentDocumentSubmissionController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 acceptableDocuments:(id)a5 featureIdentifier:(unint64_t)a6 localizationBundle:(id)a7 preferredLanguage:(id)a8;
- (PKPaymentDocumentSubmissionControllerDelegate)delegate;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (UIImage)backID;
- (UIImage)frontID;
- (id)nextViewController;
- (int64_t)context;
- (int64_t)side;
- (int64_t)state;
- (unint64_t)featureIdentifier;
- (void)captureFailedWithError:(id)a3;
- (void)capturedImage:(id)a3;
- (void)scanAgain;
- (void)setBackID:(id)a3;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatureIdentifier:(unint64_t)a3;
- (void)setFrontID:(id)a3;
- (void)setSelectedDocument:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setSide:(int64_t)a3;
- (void)setState:(int64_t)a3;
- (void)stateChanged;
- (void)terminateSetupFlow;
- (void)tryUploadAgain;
- (void)uploadID;
- (void)userApprovedCapturedID;
- (void)userRejectedCapturedID;
- (void)userWantsToCancel;
- (void)userWantsToContinue;
@end

@implementation PKPaymentDocumentSubmissionController

- (PKPaymentDocumentSubmissionController)initWithSetupDelegate:(id)a3 context:(int64_t)a4 acceptableDocuments:(id)a5 featureIdentifier:(unint64_t)a6 localizationBundle:(id)a7 preferredLanguage:(id)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v18 = [(PKPaymentDocumentSubmissionController *)self init];
  v19 = v18;
  if (v18)
  {
    v18->_context = a4;
    v18->_featureIdentifier = a6;
    objc_storeWeak((id *)&v18->_setupDelegate, v14);
    id v39 = v14;
    id v37 = v16;
    if (v16)
    {
      v20 = (NSBundle *)v16;
    }
    else
    {
      PKPassKitBundle();
      v20 = (NSBundle *)objc_claimAutoreleasedReturnValue();
    }
    localizationBundle = v19->_localizationBundle;
    v19->_localizationBundle = v20;

    v40 = v19;
    objc_storeStrong((id *)&v19->_preferredLanguage, a8);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v38 = v15;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v42;
      p_selectedDocument = (id *)&v19->_selectedDocument;
LABEL_7:
      uint64_t v27 = 0;
      while (1)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(v22);
        }
        v28 = *(void **)(*((void *)&v41 + 1) + 8 * v27);
        v29 = [v28 countryCode];
        v30 = v29;
        if (v29 == @"USA"
          || v29
          && ((char v31 = [@"USA" isEqualToString:v29], v30, (v31 & 1) != 0)
           || (v32 = v30, v32 == @"US")
           || (v33 = v32, int v34 = [@"US" isEqualToString:v32], v33, v34)))
        {
          if ((unint64_t)([v28 documentType] - 1) <= 1) {
            objc_storeStrong(p_selectedDocument, v28);
          }
        }
        id v35 = *p_selectedDocument;

        if (v35) {
          break;
        }
        if (v24 == ++v27)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v24) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    id v14 = v39;
    v19 = v40;
    id v16 = v37;
    id v15 = v38;
    if (!v40->_selectedDocument) {
      [(PKPaymentDocumentSubmissionController *)v40 setState:1];
    }
  }

  return v19;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  if (!a3)
  {
    -[PKPaymentDocumentSubmissionController setFrontID:](self, "setFrontID:");
    [(PKPaymentDocumentSubmissionController *)self setBackID:0];
    [(PKPaymentDocumentSubmissionController *)self setSide:0];
  }
}

- (id)nextViewController
{
  unint64_t state = self->_state;
  if (state <= 0xA && ((0x77Fu >> state) & 1) != 0) {
    v3 = (void *)[objc_alloc(*off_1E59DB510[state]) initWithController:self context:self->_context featureIdentifier:self->_featureIdentifier];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)capturedImage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_state == 2)
  {
    self->_unint64_t state = 3;
    int64_t side = self->_side;
    id v7 = v4;
    if (side == 1)
    {
      [(PKPaymentDocumentSubmissionController *)self setBackID:v4];
    }
    else
    {
      if (side)
      {
LABEL_7:
        [(PKPaymentDocumentSubmissionController *)self stateChanged];
        v5 = v7;
        goto LABEL_8;
      }
      [(PKPaymentDocumentSubmissionController *)self setFrontID:v4];
    }
    v5 = v7;
    if (self->_state == 2) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
}

- (void)userWantsToContinue
{
  if (!self->_state)
  {
    self->_unint64_t state = 2;
    [(PKPaymentDocumentSubmissionController *)self stateChanged];
  }
}

- (void)userApprovedCapturedID
{
  if (self->_state != 3) {
    return;
  }
  int64_t side = self->_side;
  if (side == 1)
  {
LABEL_7:
    [(PKPaymentDocumentSubmissionController *)self uploadID];
LABEL_8:
    if (self->_state == 3) {
      return;
    }
    goto LABEL_10;
  }
  if (side) {
    return;
  }
  uint64_t v4 = [(PKDocumentRequest *)self->_selectedDocument documentType];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  *(_OWORD *)&self->_unint64_t state = xmmword_1A0444EF0;
LABEL_10:

  [(PKPaymentDocumentSubmissionController *)self stateChanged];
}

- (void)userRejectedCapturedID
{
  if (self->_state != 3) {
    return;
  }
  PKAnalyticsSendEventForFeature();
  self->_unint64_t state = 2;
  int64_t side = self->_side;
  if (side == 1)
  {
    [(PKPaymentDocumentSubmissionController *)self setBackID:0];
LABEL_6:
    if (self->_state == 3) {
      return;
    }
    goto LABEL_8;
  }
  if (!side)
  {
    [(PKPaymentDocumentSubmissionController *)self setFrontID:0];
    goto LABEL_6;
  }
LABEL_8:

  [(PKPaymentDocumentSubmissionController *)self stateChanged];
}

- (void)captureFailedWithError:(id)a3
{
  int64_t state = self->_state;
  self->_int64_t state = 4;
  if (state != 4) {
    [(PKPaymentDocumentSubmissionController *)self stateChanged];
  }
}

- (void)scanAgain
{
  int64_t state = self->_state;
  [(PKPaymentDocumentSubmissionController *)self setFrontID:0];
  [(PKPaymentDocumentSubmissionController *)self setBackID:0];
  *(_OWORD *)&self->_int64_t state = xmmword_1A0410050;
  if (state != 2)
  {
    [(PKPaymentDocumentSubmissionController *)self stateChanged];
  }
}

- (void)uploadID
{
}

- (void)tryUploadAgain
{
  int64_t state = self->_state;
  [(PKPaymentDocumentSubmissionController *)self uploadID];
  if (state != self->_state)
  {
    [(PKPaymentDocumentSubmissionController *)self stateChanged];
  }
}

- (void)userWantsToCancel
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PKPaymentDocumentSubmissionController_userWantsToCancel__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__PKPaymentDocumentSubmissionController_userWantsToCancel__block_invoke(uint64_t a1)
{
  PKAnalyticsSendEventForFeature();
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  char v2 = objc_opt_respondsToSelector();
  v3 = *(id **)(a1 + 32);
  if (v2)
  {
    id v4 = objc_loadWeakRetained(v3 + 3);
    [WeakRetained viewControllerDidCancelSetupFlow:v4];
  }
  else
  {
    [v3 terminateSetupFlow];
  }
}

- (void)terminateSetupFlow
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKPaymentDocumentSubmissionController_terminateSetupFlow__block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PKPaymentDocumentSubmissionController_terminateSetupFlow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  char v2 = objc_opt_respondsToSelector();
  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v4 = v3;
  if (v2) {
    [WeakRetained viewControllerDidTerminateSetupFlow:v3];
  }
  else {
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)stateChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__PKPaymentDocumentSubmissionController_stateChanged__block_invoke;
    v4[3] = &unk_1E59CA870;
    id v5 = WeakRetained;
    v6 = self;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __53__PKPaymentDocumentSubmissionController_stateChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) captureController:*(void *)(a1 + 40) didChangeStateTo:*(void *)(*(void *)(a1 + 40) + 8)];
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)side
{
  return self->_side;
}

- (void)setSide:(int64_t)a3
{
  self->_int64_t side = a3;
}

- (PKPaymentDocumentSubmissionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentDocumentSubmissionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKDocumentRequest)selectedDocument
{
  return self->_selectedDocument;
}

- (void)setSelectedDocument:(id)a3
{
}

- (UIImage)frontID
{
  return self->_frontID;
}

- (void)setFrontID:(id)a3
{
}

- (UIImage)backID
{
  return self->_backID;
}

- (void)setBackID:(id)a3
{
}

- (NSBundle)localizationBundle
{
  return self->_localizationBundle;
}

- (NSString)preferredLanguage
{
  return self->_preferredLanguage;
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void)setFeatureIdentifier:(unint64_t)a3
{
  self->_featureIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_preferredLanguage, 0);
  objc_storeStrong((id *)&self->_localizationBundle, 0);
  objc_storeStrong((id *)&self->_backID, 0);
  objc_storeStrong((id *)&self->_frontID, 0);
  objc_storeStrong((id *)&self->_selectedDocument, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end