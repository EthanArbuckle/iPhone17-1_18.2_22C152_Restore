@interface PKDynamicProvisioningPageViewController
- (PKDynamicProvisioningPageContent)page;
- (PKDynamicProvisioningPageViewController)initWithPage:(id)a3 context:(int64_t)a4;
- (id)bodyButtonAction;
- (id)cancelButtonAction;
- (id)doneButtonAction;
- (id)linkAction;
- (id)primaryButtonAction;
- (id)secondaryButtonAction;
- (void)explanationViewControllerDidSelectCancel:(id)a3;
- (void)explanationViewControllerDidSelectDone:(id)a3;
- (void)explanationViewDidSelectBodyButton:(id)a3;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)explanationViewDidSelectSetupLater:(id)a3;
- (void)preflightWithCompletion:(id)a3;
- (void)setBodyButtonAction:(id)a3;
- (void)setCancelButtonAction:(id)a3;
- (void)setDoneButtonAction:(id)a3;
- (void)setLinkAction:(id)a3;
- (void)setPrimaryButtonAction:(id)a3;
- (void)setSecondaryButtonAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKDynamicProvisioningPageViewController

- (PKDynamicProvisioningPageViewController)initWithPage:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDynamicProvisioningPageViewController;
  v8 = [(PKExplanationViewController *)&v11 initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_page, a3);
    [(PKExplanationViewController *)v9 setShowCancelButton:0];
    [(PKExplanationViewController *)v9 setShowDoneButton:0];
    [(PKExplanationViewController *)v9 setExplanationViewControllerDelegate:v9];
  }

  return v9;
}

- (void)viewDidLoad
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)PKDynamicProvisioningPageViewController;
  [(PKExplanationViewController *)&v43 viewDidLoad];
  v25 = [(PKDynamicProvisioningPageViewController *)self navigationItem];
  [v25 setHidesBackButton:1];
  v35 = [(PKExplanationViewController *)self explanationView];
  v3 = [v35 dockView];
  v32 = [v3 footerView];

  v33 = [v35 dockView];
  [v35 setShowPrivacyView:0];
  [v32 setManualEntryButton:0];
  if (self->_heroImage)
  {
    objc_msgSend(v35, "setImage:");
  }
  else
  {
    v4 = [(PKDynamicProvisioningPageContent *)self->_page identifier];
    int v5 = [v4 isEqualToString:@"physicalCardQuote"];

    if (v5)
    {
      v6 = PKFeatureApplicationHeaderImageWithImage(2, 0);
      [v35 setImage:v6];
    }
  }
  id v7 = [(PKDynamicProvisioningPageContent *)self->_page title];
  [v35 setTitleText:v7];

  v24 = [(PKDynamicProvisioningPageContent *)self->_page subtitle];
  v31 = PKAttributedStringCreateProvisioningBulletedParagraph(v24, (void *)*MEMORY[0x1E4FB27F0]);
  if (v31)
  {
    [v35 setAttributedBodyText:v31];
    v8 = [v35 bodyTextView];
    [v8 setDataDetectorTypes:0];
  }
  v30 = [(PKDynamicProvisioningPageContent *)self->_page disclosureTitle];
  if (v30) {
    [v33 setButtonExplanationText:v30];
  }
  v9 = [(PKDynamicProvisioningPageContent *)self->_page learnMore];
  v29 = [v9 buttonTitle];

  if (v29) {
    [v35 setBodyButtonText:v29];
  }
  v28 = [(PKDynamicProvisioningPageContent *)self->_page primaryActionTitle];
  if (v28)
  {
    v10 = [v33 primaryButton];
    [v10 setTitle:v28 forState:0];
  }
  else
  {
    [v33 setPrimaryButton:0];
  }
  v27 = [(PKDynamicProvisioningPageContent *)self->_page secondaryActionTitle];
  if (v27)
  {
    [v35 setForceShowSetupLaterButton:1];
    objc_super v11 = [v32 setupLaterButton];
    [v11 setTitle:v27 forState:0];
  }
  else
  {
    [v32 setForceShowSetupLaterButton:0];
  }
  if ([(PKDynamicProvisioningPageContent *)self->_page contentAlignment] == 4)
  {
    [v35 setTitleTextAlignment:4];
    [v35 setBodyTextAlignment:4];
  }
  v34 = [(PKDynamicProvisioningPageContent *)self->_page footerContent];
  v26 = [v34 footerText];
  if (v34 && v26)
  {
    v23 = objc_alloc_init(PKMultiHyperlinkView);
    [(PKMultiHyperlinkView *)v23 setText:v26];
    [(PKMultiHyperlinkView *)v23 setTextAlignment:1];
    objc_initWeak(&location, self);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v13 = [v34 links];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v39 != v15) {
            objc_enumerationMutation(v13);
          }
          v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v18 = [PKTextRangeHyperlink alloc];
          v19 = [v17 linkText];
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = __54__PKDynamicProvisioningPageViewController_viewDidLoad__block_invoke;
          v36[3] = &unk_1E59CB010;
          objc_copyWeak(&v37, &location);
          v36[4] = v17;
          v20 = [(PKTextRangeHyperlink *)v18 initWithLinkText:v19 action:v36];

          [v12 safelyAddObject:v20];
          objc_destroyWeak(&v37);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v14);
    }

    uint64_t v21 = [v12 count];
    if (v21) {
      v22 = (void *)[v12 copy];
    }
    else {
      v22 = 0;
    }
    [(PKMultiHyperlinkView *)v23 setSources:v22];
    if (v21) {

    }
    [v33 setAdditionalLinkView:v23];
    objc_destroyWeak(&location);
  }
}

void __54__PKDynamicProvisioningPageViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *((void *)WeakRetained + 137);
    if (v4)
    {
      int v5 = v3;
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
      v3 = v5;
    }
  }
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [(PKDynamicProvisioningPageContent *)self->_page heroImageURL];
  id v7 = [v5 URLWithString:v6];

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke;
    aBlock[3] = &unk_1E59DBE28;
    aBlock[4] = self;
    id v15 = v4;
    v8 = (void (**)(void *, void *))_Block_copy(aBlock);
    v9 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    v10 = [v9 cachedDataForURL:v7];

    if (v10)
    {
      v8[2](v8, v10);
    }
    else
    {
      objc_super v11 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_3;
      v12[3] = &unk_1E59CE028;
      v13 = v8;
      [v11 downloadFromUrl:v7 completionHandler:v12];
    }
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4FB1818] imageWithData:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 1040);
    *(void *)(v5 + 1040) = v4;
  }
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_2;
    block[3] = &unk_1E59CAA98;
    id v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__PKDynamicProvisioningPageViewController_preflightWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v3 = (void (**)(void))_Block_copy(self->_primaryButtonAction);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)explanationViewDidSelectSetupLater:(id)a3
{
  id v3 = (void (**)(void))_Block_copy(self->_secondaryButtonAction);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)explanationViewControllerDidSelectCancel:(id)a3
{
  uint64_t v4 = _Block_copy(self->_cancelButtonAction);
  id v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    uint64_t v5 = [(PKDynamicProvisioningPageViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)explanationViewControllerDidSelectDone:(id)a3
{
  uint64_t v4 = _Block_copy(self->_doneButtonAction);
  id v6 = v4;
  if (v4)
  {
    (*((void (**)(void))v4 + 2))();
  }
  else
  {
    uint64_t v5 = [(PKDynamicProvisioningPageViewController *)self presentingViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)explanationViewDidSelectBodyButton:(id)a3
{
  id v3 = (void (**)(void))_Block_copy(self->_bodyButtonAction);
  if (v3)
  {
    uint64_t v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (PKDynamicProvisioningPageContent)page
{
  return self->_page;
}

- (id)primaryButtonAction
{
  return self->_primaryButtonAction;
}

- (void)setPrimaryButtonAction:(id)a3
{
}

- (id)secondaryButtonAction
{
  return self->_secondaryButtonAction;
}

- (void)setSecondaryButtonAction:(id)a3
{
}

- (id)bodyButtonAction
{
  return self->_bodyButtonAction;
}

- (void)setBodyButtonAction:(id)a3
{
}

- (id)cancelButtonAction
{
  return self->_cancelButtonAction;
}

- (void)setCancelButtonAction:(id)a3
{
}

- (id)doneButtonAction
{
  return self->_doneButtonAction;
}

- (void)setDoneButtonAction:(id)a3
{
}

- (id)linkAction
{
  return self->_linkAction;
}

- (void)setLinkAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_linkAction, 0);
  objc_storeStrong(&self->_doneButtonAction, 0);
  objc_storeStrong(&self->_cancelButtonAction, 0);
  objc_storeStrong(&self->_bodyButtonAction, 0);
  objc_storeStrong(&self->_secondaryButtonAction, 0);
  objc_storeStrong(&self->_primaryButtonAction, 0);
  objc_storeStrong((id *)&self->_page, 0);

  objc_storeStrong((id *)&self->_heroImage, 0);
}

@end