@interface PKProvisioningReaderModeViewController
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (PKProvisioningReaderModeViewController)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5 fieldsModel:(id)a6 delegate:(id)a7;
- (void)_done:(id)a3;
- (void)_hideBackButton:(BOOL)a3;
- (void)_invalidateCardNotFoundTimer;
- (void)_resetProvisioningState;
- (void)_setIdleTimerDisabled:(BOOL)a3;
- (void)_setupCardIngester;
- (void)_startCardNotFoundTimer;
- (void)_startIngestion;
- (void)_startReadingCard;
- (void)_startTransferringCard;
- (void)_tearDownCardIngester;
- (void)_updateToUIState:(unint64_t)a3;
- (void)cardNotFoundTimerFired:(id)a3;
- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6;
- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4;
- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4;
- (void)loadView;
- (void)setReporter:(id)a3;
- (void)showReaderModeError:(id)a3 isRecoverable:(BOOL)a4;
- (void)showWithProvisioningError:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKProvisioningReaderModeViewController

- (PKProvisioningReaderModeViewController)initWithContext:(int64_t)a3 product:(id)a4 isWatch:(BOOL)a5 fieldsModel:(id)a6 delegate:(id)a7
{
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)PKProvisioningReaderModeViewController;
  v16 = [(PKProvisioningReaderModeViewController *)&v19 initWithNibName:0 bundle:0];
  v17 = v16;
  if (v16)
  {
    v16->_context = a3;
    objc_storeWeak((id *)&v16->_delegate, v15);
    v17->_isWatch = a5;
    objc_storeStrong((id *)&v17->_fieldsModel, a6);
    objc_storeStrong((id *)&v17->_product, a4);
    v17->_state = 0;
  }

  return v17;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKProvisioningReaderModeViewController;
  [(PKProvisioningReaderModeViewController *)&v5 viewDidLoad];
  int64_t context = self->_context;
  v4 = [(PKProvisioningReaderModeViewController *)self view];
  PKPaymentSetupApplyContextAppearance(context, v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKProvisioningReaderModeViewController;
  [(PKProvisioningReaderModeViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
  if (!self->_state) {
    [(PKProvisioningReaderModeViewController *)self _startIngestion];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKProvisioningReaderModeViewController;
  [(PKProvisioningReaderModeViewController *)&v7 viewDidDisappear:a3];
  [(PKProvisioningReaderModeViewController *)self _tearDownCardIngester];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_super v5 = [WeakRetained provisionedPass];
  if (v5)
  {
    unint64_t state = self->_state;

    if (state == 6) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained viewControllerDidFailIngestion:self];
  }
}

- (void)loadView
{
  v16.receiver = self;
  v16.super_class = (Class)PKProvisioningReaderModeViewController;
  [(PKProvisioningReaderModeViewController *)&v16 loadView];
  v3 = [(PKProvisioningReaderModeViewController *)self view];
  objc_super v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];

  objc_super v5 = [[PKReaderModeProvisioningView alloc] initWithContext:self->_context product:self->_product isWatch:self->_isWatch];
  provisioningView = self->_provisioningView;
  self->_provisioningView = v5;

  objc_super v7 = [(PKPaymentSetupProduct *)self->_product imageAssets];
  uint64_t v8 = [v7 plasticCardImage];

  v9 = [(PKPaymentSetupProduct *)self->_product imageAssets];
  uint64_t v10 = [v9 digitalCardImage];

  if (v8) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v12 = [MEMORY[0x1E4FB1818] imageWithCGImage:v8];
    id v13 = [MEMORY[0x1E4FB1818] imageWithCGImage:v10];
    [(PKReaderModeProvisioningView *)self->_provisioningView setPlasticCardImage:v12];
    [(PKReaderModeProvisioningView *)self->_provisioningView setDigitalCardImage:v13];
  }
  id v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v14;

  [(UIScrollView *)self->_scrollView addSubview:self->_provisioningView];
  [(UIScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
  [(UIScrollView *)self->_scrollView setShowsVerticalScrollIndicator:1];
  [(UIScrollView *)self->_scrollView setAlwaysBounceVertical:1];
  [v3 addSubview:self->_scrollView];
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKProvisioningReaderModeViewController;
  [(PKProvisioningReaderModeViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(PKProvisioningReaderModeViewController *)self view];
  objc_super v4 = [v3 safeAreaLayoutGuide];
  [v4 layoutFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[PKReaderModeProvisioningView sizeThatFits:](self->_provisioningView, "sizeThatFits:", v10, 1.79769313e308);
  double v14 = v13;
  double v16 = v15;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:", v6, v8, v10, v12);
  -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v14, v16);
  -[PKReaderModeProvisioningView setFrame:](self->_provisioningView, "setFrame:", 0.0, 0.0, v14, v16);
  [(PKReaderModeProvisioningView *)self->_provisioningView layoutIfNeeded];
  [(UIScrollView *)self->_scrollView setScrollEnabled:v16 > v12];
}

- (void)_setIdleTimerDisabled:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_idleTimerDisabled != a3)
  {
    BOOL v3 = a3;
    double v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = @"enabled";
      if (v3) {
        double v6 = @"disabled";
      }
      int v8 = 138412546;
      double v9 = v6;
      __int16 v10 = 2112;
      double v11 = @"ReaderModeProvisioning";
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Payment Setup has %@ the Idle Timer. (For: %@)", (uint8_t *)&v8, 0x16u);
    }

    double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v7 _setIdleTimerDisabled:v3 forReason:@"ReaderModeProvisioning"];

    self->_idleTimerDisabled = v3;
  }
}

- (void)_hideBackButton:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKProvisioningReaderModeViewController *)self navigationItem];
  [v4 setHidesBackButton:v3 animated:1];
}

- (void)_updateToUIState:(unint64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__PKProvisioningReaderModeViewController__updateToUIState___block_invoke;
  v4[3] = &unk_1E59CB460;
  v4[4] = self;
  v4[5] = a3;
  BOOL v3 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__PKProvisioningReaderModeViewController__updateToUIState___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "%@, Updating UI state to %lu", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if ((unint64_t)(v5 - 4) >= 2)
  {
    if (v5 == 1) {
      [*(id *)(a1 + 32) _hideBackButton:0];
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) navigationItem];
    id v7 = objc_alloc(MEMORY[0x1E4FB14A8]);
    int v8 = PKLocalizedPaymentString(&cfstr_Next.isa);
    double v9 = (void *)[v7 initWithTitle:v8 style:2 target:*(void *)(a1 + 32) action:sel__done_];

    [v6 setHidesBackButton:1];
    [v6 setRightBarButtonItem:v9];
  }
  [*(id *)(*(void *)(a1 + 32) + 1016) setState:*(void *)(a1 + 40) animated:1];
  __int16 v10 = [*(id *)(a1 + 32) view];
  [v10 setNeedsLayout];
}

- (void)_done:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidComplete:self];
}

- (void)_setupCardIngester
{
  if (!self->_cardIngester)
  {
    uint64_t v3 = (PKContactlessCardIngester *)[objc_alloc(MEMORY[0x1E4F845F0]) initWithPaymentSetupProduct:self->_product delegate:self];
    cardIngester = self->_cardIngester;
    self->_cardIngester = v3;
  }
}

- (void)_tearDownCardIngester
{
  [(PKContactlessCardIngester *)self->_cardIngester invalidate];
  cardIngester = self->_cardIngester;
  self->_cardIngester = 0;

  [(PKProvisioningReaderModeViewController *)self _setIdleTimerDisabled:0];

  [(PKProvisioningReaderModeViewController *)self _invalidateCardNotFoundTimer];
}

- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6
{
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __127__PKProvisioningReaderModeViewController_contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke;
  v12[3] = &unk_1E59DB110;
  BOOL v14 = a5;
  v12[4] = self;
  id v13 = v9;
  BOOL v15 = a6;
  __int16 v10 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v17 = v10;
  id v11 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __127__PKProvisioningReaderModeViewController_contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _invalidateCardNotFoundTimer];
  *(void *)(*(void *)(a1 + 32) + 1040) = 0;
  v2 = *(id **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained(v2 + 123);
    [WeakRetained viewControllerDidFailIngestion:*(void *)(a1 + 32)];

    [*(id *)(a1 + 32) _resetProvisioningState];
  }
  else
  {
    [v2 _updateToUIState:0];
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = 0.0;
    if (*(void *)(v4 + 1032) == 5)
    {
      *(void *)(v4 + 1040) = 4;
      uint64_t v4 = *(void *)(a1 + 32);
      double v5 = 0.776119403;
    }
    [*(id *)(v4 + 1016) setTransferringProgress:v5 duration:0.0];
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = *(unsigned __int8 *)(a1 + 48);
    int v9 = *(unsigned __int8 *)(a1 + 49);
    int v11 = 136315906;
    uint64_t v12 = "-[PKProvisioningReaderModeViewController contactlessCardIngester:didFailToIngestCardWithError:resetProvisionin"
          "g:isRecoverable:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    __int16 v15 = 1024;
    int v16 = v8;
    __int16 v17 = 1024;
    int v18 = v9;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "%s:%@ (resetProvisioning: %d, isRecoverable: %d)", (uint8_t *)&v11, 0x22u);
  }

  return [*(id *)(a1 + 32) showReaderModeError:*(void *)(a1 + 40) isRecoverable:*(unsigned __int8 *)(a1 + 49)];
}

- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4
{
  id v6 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke;
  v9[3] = &unk_1E59CC648;
  id v10 = v6;
  unint64_t v11 = a4;
  v9[4] = self;
  uint64_t v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v13 = v7;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2 == 2)
  {
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2;
    block[3] = &unk_1E59CA7D0;
    void block[4] = *(void *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
    [*(id *)(a1 + 32) _invalidateCardNotFoundTimer];
    [*(id *)(a1 + 32) _hideBackButton:1];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 1032);
    if (v5 == 5)
    {
      id v6 = *(void **)(v4 + 1016);
      double v7 = 0.98;
      double v8 = 7.0;
    }
    else
    {
      if (v5 != 1) {
        goto LABEL_9;
      }
      id v6 = *(void **)(v4 + 1016);
      double v7 = 0.179104478;
      double v8 = 6.0;
    }
    [v6 setTransferringProgress:v7 duration:v8];
  }
  else if (v2 == 10)
  {
    [*(id *)(a1 + 32) _startCardNotFoundTimer];
  }
LABEL_9:
  int v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2080;
    int v16 = "-[PKProvisioningReaderModeViewController contactlessCardIngester:didUpdateCardIngestionStatus:]_block_invoke";
    __int16 v17 = 2048;
    uint64_t v18 = v11;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "%@, %s:%lu", buf, 0x20u);
  }
}

void *__95__PKProvisioningReaderModeViewController_contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  unint64_t v2 = result[129];
  BOOL v3 = v2 > 5;
  uint64_t v4 = (1 << v2) & 0x2E;
  if (!v3 && v4 != 0) {
    return (void *)[result _updateToUIState:3];
  }
  return result;
}

- (void)cardNotFoundTimerFired:(id)a3
{
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Card not found timer fired", v5, 2u);
  }

  [(PKProvisioningReaderModeViewController *)self _updateToUIState:1];
  [(PKProvisioningReaderModeViewController *)self _invalidateCardNotFoundTimer];
}

- (void)_startCardNotFoundTimer
{
  [(PKProvisioningReaderModeViewController *)self _invalidateCardNotFoundTimer];
  BOOL v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_cardNotFoundTimerFired_ selector:0 userInfo:0 repeats:15.0];
  cardNotFoundTimer = self->_cardNotFoundTimer;
  self->_cardNotFoundTimer = v3;
}

- (void)_invalidateCardNotFoundTimer
{
  [(NSTimer *)self->_cardNotFoundTimer invalidate];
  cardNotFoundTimer = self->_cardNotFoundTimer;
  self->_cardNotFoundTimer = 0;
}

- (void)_startIngestion
{
  if ((self->_state | 4) == 4)
  {
    [(PKProvisioningReaderModeViewController *)self _setIdleTimerDisabled:1];
    if (!self->_cardIngester) {
      [(PKProvisioningReaderModeViewController *)self _setupCardIngester];
    }
    [(PKProvisioningReaderModeViewController *)self _updateToUIState:2];
    unint64_t state = self->_state;
    if (state == 4)
    {
      [(PKProvisioningReaderModeViewController *)self _startTransferringCard];
    }
    else if (!state)
    {
      [(PKProvisioningReaderModeViewController *)self _startReadingCard];
    }
  }
}

- (void)_startReadingCard
{
  if (self->_state)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Warning! Attempted to ingestCard: while currently ingesting", (uint8_t *)buf, 2u);
    }

    [(PKProvisioningReaderModeViewController *)self contactlessCardIngester:self->_cardIngester didFailToIngestCardWithError:0 resetProvisioning:1 isRecoverable:1];
  }
  else
  {
    self->_unint64_t state = 1;
    objc_initWeak(buf, self);
    cardIngester = self->_cardIngester;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke;
    v5[3] = &unk_1E59D7080;
    objc_copyWeak(&v6, buf);
    [(PKContactlessCardIngester *)cardIngester ingestCardWithSuccessHandler:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(buf);
  }
}

void __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke_2;
  v6[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v3;
  uint64_t v4 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v10 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __59__PKProvisioningReaderModeViewController__startReadingCard__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _invalidateCardNotFoundTimer];
    objc_storeStrong(v5 + 132, *(id *)(a1 + 32));
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F84A60]) initWithPaymentSetupProduct:v5[125] cardSessionToken:v5[132]];
    v5[129] = (id)2;
    id v4 = objc_loadWeakRetained(v5 + 123);
    [v4 provisionWithFieldModel:v5[124] paymentCredential:v3];

    id WeakRetained = v5;
  }
}

- (void)_startTransferringCard
{
  if (self->_state == 4)
  {
    self->_unint64_t state = 5;
    cardIngester = self->_cardIngester;
    cardSessionToken = self->_cardSessionToken;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = self;
    [(PKContactlessCardIngester *)cardIngester ingestCardWithCardSessionToken:cardSessionToken successHandler:v7];
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Warning! attempting to ingestCardWithCardSessionToken: while currently ingesting", v6, 2u);
    }

    [(PKProvisioningReaderModeViewController *)self contactlessCardIngester:self->_cardIngester didFailToIngestCardWithError:0 resetProvisioning:1 isRecoverable:1];
  }
}

void __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_2;
  v2[3] = &unk_1E59CA7D0;
  v2[4] = *(void *)(a1 + 32);
  v1 = v2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v4 = v1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1032) = 6;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  id v3 = [WeakRetained provisionedPass];

  id v4 = [v3 fieldForKey:*MEMORY[0x1E4F87A40]];
  if (v4) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }

  [*(id *)(*(void *)(a1 + 32) + 1016) setTransferringProgress:1.0 duration:0.5];
  dispatch_time_t v6 = dispatch_time(0, 500000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_3;
  v7[3] = &unk_1E59CB460;
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  [*(id *)(a1 + 32) _tearDownCardIngester];
}

uint64_t __64__PKProvisioningReaderModeViewController__startTransferringCard__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateToUIState:*(void *)(a1 + 40)];
}

- (void)_resetProvisioningState
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PKProvisioningReaderModeViewController__resetProvisioningState__block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  unint64_t v2 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_0;
  block[3] = &unk_1E59CAA98;
  id v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __65__PKProvisioningReaderModeViewController__resetProvisioningState__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateToUIState:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1056);
  *(void *)(v2 + 1056) = 0;

  *(void *)(*(void *)(a1 + 32) + 1032) = 0;
  id v4 = *(void **)(*(void *)(a1 + 32) + 1016);

  return [v4 setTransferringProgress:0.0 duration:0.0];
}

- (void)showReaderModeError:(id)a3 isRecoverable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_unint64_t state = self->_stateOnRetry;
  self->_stateOnRetry = 0;
  reporter = self->_reporter;
  id v7 = a3;
  [(PKProvisioningAnalyticsSessionUIReporter *)reporter reportError:v7 context:0];
  if (v4) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 4;
  }
  int v9 = [MEMORY[0x1E4F84ED8] errorWithUnderlyingError:v7 defaultSeverity:v8];

  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    uint64_t v12 = v9;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Reader mode provisioning failed with error: %@", (uint8_t *)&v11, 0xCu);
  }

  [(PKProvisioningReaderModeViewController *)self showWithProvisioningError:v9];
  [(PKProvisioningReaderModeViewController *)self _hideBackButton:0];
}

- (void)showWithProvisioningError:(id)a3
{
  id v4 = a3;
  [(PKProvisioningReaderModeViewController *)self _setIdleTimerDisabled:0];
  [(PKProvisioningReaderModeViewController *)self _hideBackButton:0];
  if (([v4 hasLocalizedTitleAndMessage] & 1) == 0)
  {
    id v5 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar.isa);
    [v4 setLocalizedTitle:v5];

    dispatch_time_t v6 = PKLocalizedPaymentString(&cfstr_CouldNotAddCar_0.isa);
    [v4 setLocalizedMessage:v6];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke;
  v10[3] = &unk_1E59CA7D0;
  v10[4] = self;
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_2;
  v9[3] = &unk_1E59CA7D0;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_3;
  v8[3] = &unk_1E59CA7D0;
  id v7 = [MEMORY[0x1E4FB1418] alertForErrorWithError:v4 acknowledgeButtonText:0 exitButtonText:0 onAcknowledge:v10 onExit:v9 onTryAgain:v8];
  [(PKProvisioningReaderModeViewController *)self presentViewController:v7 animated:1 completion:0];
}

void __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained viewControllerDidCancel:*(void *)(a1 + 32)];
}

void __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 984));
  [WeakRetained viewControllerDidComplete:*(void *)(a1 + 32)];
}

uint64_t __68__PKProvisioningReaderModeViewController_showWithProvisioningError___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startIngestion];
}

- (void)didTransitionTo:(int64_t)a3 loading:(BOOL)a4
{
  if (a4)
  {
    [(PKProvisioningReaderModeViewController *)self _updateToUIState:3];
    [(PKProvisioningReaderModeViewController *)self _setIdleTimerDisabled:0];
    [(PKProvisioningReaderModeViewController *)self _hideBackButton:1];
    if ((unint64_t)a3 >= 6)
    {
      if ((unint64_t)(a3 - 6) >= 3) {
        return;
      }
      provisioningView = self->_provisioningView;
      double v7 = 0.776119403;
    }
    else
    {
      provisioningView = self->_provisioningView;
      double v7 = 0.537313433;
    }
    [(PKReaderModeProvisioningView *)provisioningView setTransferringProgress:v7 duration:12.0];
  }
  else if (a3 == 8)
  {
    self->_unint64_t state = 4;
    [(PKProvisioningReaderModeViewController *)self _startTransferringCard];
  }
  else
  {
    [(PKProvisioningReaderModeViewController *)self _resetProvisioningState];
  }
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
  objc_storeStrong((id *)&self->_cardNotFoundTimer, 0);
  objc_storeStrong((id *)&self->_cardSessionToken, 0);
  objc_storeStrong((id *)&self->_cardIngester, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_provisioningView, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end