@interface PKPaymentReaderModeDetailsViewController
+ (BOOL)readerModeProvisioningIsSupported;
- (PKPaymentReaderModeDetailsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5;
- (PKPaymentSetupProduct)product;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (id)defaultFields;
- (id)defaultHeaderViewSubTitle;
- (id)defaultHeaderViewTitle;
- (id)footerView;
- (id)visibleFieldIdentifiers;
- (void)_downloadCardArtIfNecessary:(id)a3;
- (void)_prepareForProvisioningViewController;
- (void)_pushReaderModeProvisioningWithCompletion:(id)a3;
- (void)_registerLocalDeviceWithCompletion:(id)a3;
- (void)_showTerms;
- (void)handleNextButtonTapped:(id)a3;
- (void)setReporter:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PKPaymentReaderModeDetailsViewController

- (PKPaymentReaderModeDetailsViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4 product:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(id)objc_opt_class() readerModeProvisioningIsSupported])
  {
    v55.receiver = self;
    v55.super_class = (Class)PKPaymentReaderModeDetailsViewController;
    v10 = [(PKPaymentSetupProvisioningFieldsViewController *)&v55 initWithProvisioningController:v8 context:a4 setupDelegate:0];
    v11 = v10;
    if (v10)
    {
      id v38 = v9;
      p_product = (id *)&v10->_product;
      objc_storeStrong((id *)&v10->_product, a5);
      v13 = [*p_product provisioningMethodMetadataForType:*MEMORY[0x1E4F87AA0]];
      self = v13;
      if (v13)
      {
        v14 = [(PKPaymentReaderModeDetailsViewController *)v13 requiredFields];
        v15 = [(PKPaymentReaderModeDetailsViewController *)self readerModeResources];
        v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F87AC0]];
        v17 = [v16 objectForKeyedSubscript:@"welcome"];

        uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F87A98]];
        titleText = v11->_titleText;
        v11->_titleText = (NSString *)v18;

        uint64_t v20 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F87A90]];
        subtitleText = v11->_subtitleText;
        v11->_subtitleText = (NSString *)v20;
      }
      else
      {
        v14 = [*p_product requiredFields];
      }
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v14];
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v51 = 0;
      v52 = &v51;
      uint64_t v53 = 0x2020000000;
      char v54 = 0;
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x2020000000;
      char v50 = 0;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __91__PKPaymentReaderModeDetailsViewController_initWithProvisioningController_context_product___block_invoke;
      v39[3] = &unk_1E59CF4F8;
      id v26 = v25;
      id v40 = v26;
      id v27 = v22;
      id v41 = v27;
      id v28 = v23;
      id v42 = v28;
      id v29 = v24;
      id v43 = v29;
      v45 = &v51;
      id v30 = v14;
      id v44 = v30;
      v46 = &v47;
      [v30 enumerateObjectsUsingBlock:v39];
      if (!*((unsigned char *)v52 + 24))
      {
        v31 = (void *)[v26 copy];
        [v28 addObject:v31];
      }
      if (*((unsigned char *)v48 + 24))
      {
        v32 = [(PKPaymentSetupFieldsViewController *)v11 fieldsModel];
        v33 = (void *)[v27 copy];
        [v32 updateWithPaymentSetupFields:v29 footerFields:v33];

        [(PKPaymentSetupFieldsViewController *)v11 setSectionIdentifiers:v28];
      }
      else
      {
        v34 = [(PKPaymentSetupFieldsViewController *)v11 fieldsModel];
        [v34 updateWithPaymentSetupFields:v30];
      }
      dispatch_group_t v35 = dispatch_group_create();
      nextScreenGroup = v11->_nextScreenGroup;
      v11->_nextScreenGroup = (OS_dispatch_group *)v35;

      [(PKPaymentReaderModeDetailsViewController *)v11 _prepareForProvisioningViewController];
      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v51, 8);

      id v9 = v38;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __91__PKPaymentReaderModeDetailsViewController_initWithProvisioningController_context_product___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([v5 isFieldTypeLabel])
  {
    uint64_t v6 = [*(id *)(a1 + 32) firstObject];
    if (v6)
    {
      v7 = (void *)v6;
      id v8 = *(void **)(a1 + 40);
      v22[0] = v5;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      [v8 setValue:v9 forKey:v7];

      v10 = *(void **)(a1 + 48);
      v11 = (void *)[*(id *)(a1 + 32) copy];
      [v10 addObject:v11];

      [*(id *)(a1 + 32) removeAllObjects];
      [*(id *)(a1 + 56) removeObject:v5];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 64) count] - 1 == a3;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    else
    {
      if ([*(id *)(a1 + 48) count])
      {
        v14 = [*(id *)(a1 + 48) lastObject];
      }
      else
      {
        v14 = 0;
      }
      if ([v14 count]
        && ([v14 firstObject], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v7 = (void *)v15;
        id v16 = objc_alloc(MEMORY[0x1E4F1CA48]);
        v17 = [*(id *)(a1 + 40) objectForKey:v7];
        uint64_t v18 = (void *)[v16 initWithArray:v17];

        [v18 addObject:v5];
        v19 = *(void **)(a1 + 40);
        uint64_t v20 = (void *)[v18 copy];
        [v19 setValue:v20 forKey:v7];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 64) count] - 1 == a3;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
      else
      {
        v21 = *(void **)(a1 + 32);
        uint64_t v18 = [v5 identifier];
        [v21 addObject:v18];
        v7 = 0;
      }
    }
  }
  else if (([v5 isFieldTypeFooter] & 1) == 0)
  {
    v12 = *(void **)(a1 + 32);
    v13 = [v5 identifier];
    [v12 addObject:v13];
  }
}

+ (BOOL)readerModeProvisioningIsSupported
{
  return [MEMORY[0x1E4F845F0] isSupported];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentReaderModeDetailsViewController;
  [(PKPaymentSetupFieldsViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentReaderModeDetailsViewController;
  [(PKPaymentReaderModeDetailsViewController *)&v8 viewDidDisappear:a3];
  objc_super v4 = [(PKPaymentReaderModeDetailsViewController *)self navigationController];
  id v5 = [v4 viewControllers];
  char v6 = [v5 containsObject:self];

  if ((v6 & 1) == 0)
  {
    v7 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
    [v7 resetAllPaymentSetupFieldValues];
  }
}

- (void)handleNextButtonTapped:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  objc_super v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self paymentProvisioningController];
  [v4 resetForNewProvisioning];
  [v4 resolveRequirementsUsingProduct:self->_product];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__PKPaymentReaderModeDetailsViewController_handleNextButtonTapped___block_invoke;
  v5[3] = &unk_1E59CDF18;
  v5[4] = self;
  [(PKPaymentReaderModeDetailsViewController *)self _registerLocalDeviceWithCompletion:v5];
}

void __67__PKPaymentReaderModeDetailsViewController_handleNextButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  char v6 = *(id **)(a1 + 32);
  id v10 = v5;
  if (a2)
  {
    [v6 _showTerms];
  }
  else
  {
    [v6[166] reportError:v5 context:0];
    v7 = [*(id *)(a1 + 32) paymentProvisioningController];
    objc_super v8 = [v7 alertForDisplayableError:v10];

    id v9 = [*(id *)(a1 + 32) navigationController];
    [v9 presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_registerLocalDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F84D50] sharedService];
    if ([v5 needsRegistration])
    {
      [(PKPaymentSetupFieldsViewController *)self showActivitySpinnerWithTitle:0 subtitle:0];
      char v6 = (void *)MEMORY[0x1E4F84BD0];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke;
      v7[3] = &unk_1E59CF570;
      id v8 = v5;
      id v9 = self;
      id v10 = v4;
      [v6 configureWebServiceIfNecessary:v8 completion:v7];
    }
    else
    {
      (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
    }
  }
}

void __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) registrationSetupSupportedInRegion])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F84BB8]) initWithWebService:*(void *)(a1 + 32)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_2;
    v9[3] = &unk_1E59CF548;
    id v5 = *(void **)(a1 + 48);
    v9[4] = *(void *)(a1 + 40);
    id v10 = v4;
    id v11 = v5;
    id v6 = v4;
    [v6 validatePreconditionsAndRegister:v9];
  }
  else
  {
    [*(id *)(a1 + 40) hideActivitySpinner];
    uint64_t v7 = *(void *)(a1 + 48);
    id v8 = PKDisplayableErrorForCommonType();
    (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
  }
}

void __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_3;
  block[3] = &unk_1E59CF520;
  block[4] = *(void *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  char v12 = a2;
  id v11 = v6;
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __79__PKPaymentReaderModeDetailsViewController__registerLocalDeviceWithCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) hideActivitySpinner];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

- (void)_showTerms
{
  id v3 = [(PKPaymentSetupProduct *)self->_product termsURL];
  id v4 = v3;
  if (v3 && !self->_termsAccepted)
  {
    [(PKPaymentSetupFieldsViewController *)self showActivitySpinnerWithTitle:0 subtitle:0];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke;
    v9[3] = &unk_1E59CDF18;
    v9[4] = self;
    [(PKPaymentSetupProvisioningFieldsViewController *)self displayTermsForTermsURL:v4 withCompletionHandler:v9];
  }
  else
  {
    nextScreenGroup = self->_nextScreenGroup;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_5;
    block[3] = &unk_1E59CA870;
    id v7 = v3;
    id v8 = self;
    dispatch_group_notify(nextScreenGroup, MEMORY[0x1E4F14428], block);
  }
}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 1296);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_2;
  block[3] = &unk_1E59CD7B0;
  char v11 = a2;
  void block[4] = v6;
  id v10 = v5;
  id v8 = v5;
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], block);
}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_2(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 1328);
  uint64_t v3 = *MEMORY[0x1E4F86308];
  v15[0] = *MEMORY[0x1E4F86488];
  uint64_t v4 = *MEMORY[0x1E4F86D18];
  v14[0] = v3;
  v14[1] = v4;
  id v5 = PKAnalyticsReportSwitchToggleResultValue();
  v15[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  [v2 reportEvent:v6];

  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1288) = 1;
    id v7 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_3;
    v13[3] = &unk_1E59CA7D0;
    v13[4] = v7;
    [v7 _pushReaderModeProvisioningWithCompletion:v13];
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      id v9 = [v8 paymentProvisioningController];
      id v10 = [v9 displayableErrorForError:*(void *)(a1 + 40)];
      [*(id *)(*(void *)(a1 + 32) + 1328) reportError:v10 context:0];
      char v11 = [v9 alertForDisplayableError:v10];
      char v12 = [*(id *)(a1 + 32) navigationController];
      [v12 presentViewController:v11 animated:1 completion:0];

      [*(id *)(a1 + 32) hideActivitySpinner];
    }
    else
    {
      [v8 hideActivitySpinner];
    }
  }
}

void __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_4;
  block[3] = &unk_1E59CA7D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideActivitySpinner];
}

uint64_t __54__PKPaymentReaderModeDetailsViewController__showTerms__block_invoke_5(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Skipping Terms & Conditions because no termsURL was set", v4, 2u);
    }
  }
  return [*(id *)(a1 + 40) _pushReaderModeProvisioningWithCompletion:0];
}

- (void)_prepareForProvisioningViewController
{
  dispatch_group_enter((dispatch_group_t)self->_nextScreenGroup);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__PKPaymentReaderModeDetailsViewController__prepareForProvisioningViewController__block_invoke;
  v3[3] = &unk_1E59CB6D8;
  v3[4] = self;
  [(PKPaymentReaderModeDetailsViewController *)self _downloadCardArtIfNecessary:v3];
}

void __81__PKPaymentReaderModeDetailsViewController__prepareForProvisioningViewController__block_invoke(uint64_t a1, char a2)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 1296));
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Failed to load either digital/plastic card images", v4, 2u);
    }
  }
}

- (void)_pushReaderModeProvisioningWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportPageCompleted:1 context:0];
  id v4 = [(PKPaymentSetupProvisioningFieldsViewController *)self flowItemDelegate];
  [v4 provisioningViewController:self didFinishWithSuccess:1];
}

- (void)_downloadCardArtIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  product = self->_product;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke;
  v17[3] = &unk_1E59CD9B0;
  id v7 = v5;
  uint64_t v18 = v7;
  id v8 = [(PKPaymentSetupProduct *)product plasticCardCachedImage:v17];
  dispatch_group_enter(v7);
  id v9 = self->_product;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_2;
  void v15[3] = &unk_1E59CD9B0;
  id v16 = v7;
  id v10 = v7;
  id v11 = [(PKPaymentSetupProduct *)v9 digitalCardCachedImage:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_3;
  v13[3] = &unk_1E59CAD68;
  v13[4] = self;
  id v14 = v4;
  id v12 = v4;
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], v13);
}

void __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke(uint64_t a1)
{
}

void __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_2(uint64_t a1)
{
}

uint64_t __72__PKPaymentReaderModeDetailsViewController__downloadCardArtIfNecessary___block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    v2 = [*(id *)(*(void *)(result + 32) + 1320) imageAssets];
    if ([v2 digitalCardImage])
    {
      uint64_t v3 = [*(id *)(*(void *)(v1 + 32) + 1320) imageAssets];
      [v3 plasticCardImage];
    }
    id v4 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v4();
  }
  return result;
}

- (id)defaultFields
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)visibleFieldIdentifiers
{
  v2 = [(PKPaymentSetupFieldsViewController *)self fieldsModel];
  uint64_t v3 = [v2 visibleSetupFieldIdentifiers];

  return v3;
}

- (id)defaultHeaderViewTitle
{
  titleText = self->_titleText;
  if (titleText)
  {
    uint64_t v3 = titleText;
  }
  else
  {
    id v4 = [(PKPaymentSetupProduct *)self->_product displayName];
    PKLocalizedPaymentString(&cfstr_ReaderModeDeta.isa, &stru_1EF1B4C70.isa, v4);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)defaultHeaderViewSubTitle
{
  subtitleText = self->_subtitleText;
  if (subtitleText)
  {
    uint64_t v3 = subtitleText;
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_ReaderModeDeta_0.isa);
    uint64_t v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (id)footerView
{
  return 0;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);

  objc_storeStrong((id *)&self->_nextScreenGroup, 0);
}

@end