@interface PKApplyVerifyingViewController
- (BOOL)shouldDisplayErrorOnWithdraw;
- (PKApplyVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6 actionIdentifierToSubmit:(id)a7 termsIdentifiersToSubmit:(id)a8 odiAttributesDictionaryToSubmit:(id)a9;
- (id)pageTag;
- (void)_updateSubtitleWithAltTextIfNecessary;
- (void)viewDidLoad;
@end

@implementation PKApplyVerifyingViewController

- (PKApplyVerifyingViewController)initWithController:(id)a3 setupDelegate:(id)a4 context:(int64_t)a5 applyPage:(id)a6 actionIdentifierToSubmit:(id)a7 termsIdentifiersToSubmit:(id)a8 odiAttributesDictionaryToSubmit:(id)a9
{
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)PKApplyVerifyingViewController;
  v18 = [(PKApplyCollectionViewController *)&v22 initWithController:a3 setupDelegate:a4 context:a5 applyPage:a6];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_actionIdentifierToSubmit, a7);
    objc_storeStrong((id *)&v19->_termsIdentifiersToSubmit, a8);
    objc_storeStrong((id *)&v19->_odiAttributesDictionaryToSubmit, a9);
    v19->_minimumDelayNanoSeconds = 1000000000.0;
    [(PKApplyVerifyingViewController *)v19 _updateSubtitleWithAltTextIfNecessary];
  }

  return v19;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)PKApplyVerifyingViewController;
  [(PKApplyCollectionViewController *)&v13 viewDidLoad];
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  objc_initWeak(&location, self);
  v6 = [(PKApplyCollectionViewController *)self controller];
  actionIdentifierToSubmit = self->_actionIdentifierToSubmit;
  termsIdentifiersToSubmit = self->_termsIdentifiersToSubmit;
  odiAttributesDictionaryToSubmit = self->_odiAttributesDictionaryToSubmit;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke;
  v10[3] = &unk_1E59CDA28;
  objc_copyWeak(v11, &location);
  *(double *)&v11[1] = v5 * 1000000000.0;
  [v6 submitActionIdentifier:actionIdentifierToSubmit termsIdentifiers:termsIdentifiersToSubmit odiAttributesDictionary:odiAttributesDictionaryToSubmit completion:v10];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSince1970];
    double v11 = v10 * 1000000000.0;

    dispatch_time_t v12 = dispatch_time(0, (uint64_t)(fmax(WeakRetained[167] - vabdd_f64(v11, *(double *)(a1 + 40)), 0.0) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke_2;
    block[3] = &unk_1E59CB378;
    objc_copyWeak(&v16, v7);
    id v14 = v5;
    id v15 = v6;
    dispatch_after(v12, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v16);
  }
}

void __45__PKApplyVerifyingViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained handleNextViewController:*(void *)(a1 + 32) displayableError:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (id)pageTag
{
  return (id)*MEMORY[0x1E4F86728];
}

- (BOOL)shouldDisplayErrorOnWithdraw
{
  return 0;
}

- (void)_updateSubtitleWithAltTextIfNecessary
{
  id v3 = [(PKApplyCollectionViewController *)self page];
  double v4 = [v3 altSubtitle];

  id v5 = [(PKApplyCollectionViewController *)self page];
  uint64_t v6 = [v5 altSubtitleTimeInterval];

  if (v4 && v6 >= 1)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * v6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PKApplyVerifyingViewController__updateSubtitleWithAltTextIfNecessary__block_invoke;
    block[3] = &unk_1E59CB010;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __71__PKApplyVerifyingViewController__updateSubtitleWithAltTextIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setSubtitleText:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiAttributesDictionaryToSubmit, 0);
  objc_storeStrong((id *)&self->_termsIdentifiersToSubmit, 0);

  objc_storeStrong((id *)&self->_actionIdentifierToSubmit, 0);
}

@end