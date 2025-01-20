@interface PKPassFooterView
- (BOOL)_canApplyContentViewForPersonalizedApplication;
- (BOOL)_canApplyContentViewForValueAddedService;
- (BOOL)isPassAuthorized;
- (BOOL)isPassFooterContentViewInGroup:(id)a3;
- (BOOL)isPhysicalButtonRequired;
- (BOOL)isViewCurrentContentView:(id)a3;
- (BOOL)requestPileSuppression;
- (PKPassFooterView)init;
- (PKPassFooterView)initWithFrame:(CGRect)a3;
- (PKPassFooterViewConfiguration)configuration;
- (PKPassFooterViewDelegate)delegate;
- (id)_messageContentViewFromMessage:(id)a3;
- (id)_messageForPaymentApplicationState;
- (id)_messageForPeerPaymentLockedByOwner;
- (id)_messageForPeerPaymentZeroBalance;
- (id)_messageForRestrictedState;
- (id)_messageForUnavailableState;
- (int64_t)_acquireContactlessInterfaceSessionErrorActionForError:(id)a3;
- (int64_t)coachingState;
- (unint64_t)suppressedContentForContentView:(id)a3;
- (void)_acquireContactlessInterfaceSessionWithSessionToken:(unint64_t)a3 shouldForceSessionAcquisition:(BOOL)a4 handler:(id)a5;
- (void)_advanceContentViewVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4;
- (void)_advanceVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4;
- (void)_commitContentViewAnimated:(BOOL)a3;
- (void)_configureForPersonalizedPaymentApplicationWithContext:(id)a3;
- (void)_configureForValueAddedServiceWithContext:(id)a3;
- (void)_configureWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5;
- (void)_endSession;
- (void)_endSessionStartTimer;
- (void)_lostModeButtonTapped;
- (void)_setCoachingState:(int64_t)a3;
- (void)_setContentView:(id)a3 animated:(BOOL)a4;
- (void)_setPhysicalButtonRequired:(BOOL)a3;
- (void)_startContactlessInterfaceSessionWithContext:(id)a3 shouldForceSessionAcquisition:(BOOL)a4 sessionAvailable:(id)a5 sessionUnavailable:(id)a6;
- (void)_updateForForegroundActivePresentationIfNecessaryAnimated:(BOOL)a3;
- (void)_updateForNonForegroundActivePresentationAnimated:(BOOL)a3;
- (void)configureWithConfiguration:(id)a3 context:(id)a4 options:(id)a5;
- (void)dealloc;
- (void)didBecomeHiddenAnimated:(BOOL)a3;
- (void)didBecomeVisibleAnimated:(BOOL)a3;
- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)invalidate;
- (void)layoutSubviews;
- (void)passFooterContentView:(id)a3 didAuthorizeAndRetrieveDecryptedBarcode:(id)a4;
- (void)passFooterContentViewDidAuthenticate:(id)a3;
- (void)passFooterContentViewDidChangeCoachingState:(id)a3;
- (void)passFooterContentViewDidChangePhysicalButtonRequirement:(id)a3;
- (void)passFooterContentViewDidChangePileSuppressionRequirement:(id)a3;
- (void)passFooterContentViewDidInvalidateAuthorization:(id)a3;
- (void)passFooterContentViewDidTransact:(id)a3 success:(BOOL)a4;
- (void)passFooterContentViewRequestsSessionSuppression:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showFullScreenBarcode;
- (void)willBecomeHiddenAnimated:(BOOL)a3;
- (void)willBecomeVisibleAnimated:(BOOL)a3;
@end

@implementation PKPassFooterView

- (PKPassFooterView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPassFooterView)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassFooterView;
  v2 = -[PKPassFooterView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    sessionDelayGroup = v2->_sessionDelayGroup;
    v2->_sessionDelayGroup = (OS_dispatch_group *)v3;

    v5 = +[PKUIForegroundActiveArbiter sharedInstance];
    v6 = v5;
    if (v5)
    {
      v2->_isBackgrounded = ([v5 registerObserver:v2] & 1) == 0;
      v2->_isAssistantActive = ([v6 registerDeactivationObserver:v2] & 0x10) != 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  dispatch_group_t v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  v4 = v3;
  if (v3)
  {
    [v3 unregisterObserver:self];
    [v4 unregisterDeactivationObserver:self];
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  contentView = self->_contentView;
  if (contentView)
  {
    [(PKPassFooterContentView *)contentView setDelegate:0];
    [(PKPassFooterView *)self _advanceContentViewVisibilityToState:0 animated:0];
  }
  [(PKPassFooterView *)self invalidate];

  v7.receiver = self;
  v7.super_class = (Class)PKPassFooterView;
  [(PKPassFooterView *)&v7 dealloc];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKPassFooterView;
  [(PKPassFooterView *)&v11 layoutSubviews];
  [(PKPassFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PKPassFooterContentView setFrame:](self->_contentView, "setFrame:");
  -[PKPassFooterContentView setFrame:](self->_fadingContentView, "setFrame:", v4, v6, v8, v10);
}

- (void)willBecomeVisibleAnimated:(BOOL)a3
{
}

- (void)willBecomeHiddenAnimated:(BOOL)a3
{
}

- (void)didBecomeVisibleAnimated:(BOOL)a3
{
}

- (void)didBecomeHiddenAnimated:(BOOL)a3
{
}

- (void)configureWithConfiguration:(id)a3 context:(id)a4 options:(id)a5
{
  char v5 = (char)a5;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (PKEqualObjects()) {
    BOOL v10 = (v5 & 2) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    objc_super v11 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
    [(PKPassFooterView *)self _configureWithConfiguration:v8 context:v9 animated:v5 & 1];
    v12 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
    v13 = v12;
    if (v12) {
      BOOL v14 = v11 == v12;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14 || [v12 style] == 8) {
      goto LABEL_36;
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v15 setObject:*MEMORY[0x1E4F86478] forKeyedSubscript:*MEMORY[0x1E4F86308]];
    [v15 setObject:*MEMORY[0x1E4F86798] forKeyedSubscript:*MEMORY[0x1E4F86730]];
    id v16 = v15;
    id v17 = v13;
    v18 = v17;
    if (!v16)
    {
LABEL_35:

      v41 = (void *)MEMORY[0x1E4F843E0];
      uint64_t v42 = *MEMORY[0x1E4F87058];
      v44[0] = *MEMORY[0x1E4F87010];
      v44[1] = v42;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
      [v41 subjects:v43 sendEvent:v16];

LABEL_36:
      goto LABEL_37;
    }
    uint64_t v19 = [v17 passType];
    v20 = (id *)MEMORY[0x1E4F86D78];
    if ((unint64_t)(v19 + 1) >= 3) {
      v21 = (__CFString *)(id)*MEMORY[0x1E4F86D78];
    }
    else {
      v21 = off_1E59DFD90[v19 + 1];
    }
    [v16 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F867E8]];

    unint64_t v22 = [v18 style];
    if (v22 < 0xD && ((0x13FFu >> v22) & 1) != 0) {
      v23 = off_1E59DFDA8[v22];
    }
    else {
      v23 = (__CFString *)*v20;
    }
    [v16 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F867E0]];

    v24 = [v18 nfcPayload];
    PKAnalyticsReportSwitchToggleResultValue();
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    [v16 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F867A8]];

    id v26 = v18;
    if ([v26 passType] == 1)
    {
      v27 = [v26 secureElementPass];
      unint64_t v28 = [v27 cardType];
      if (v28 <= 4) {
        v25 = (__CFString *)**((id **)&unk_1E59DFE10 + v28);
      }
    }
    else
    {
      v25 = @"other";
    }

    [v16 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F867D0]];
    v29 = [v26 secureElementPass];
    if ([v29 isIdentityPass])
    {
      uint64_t v30 = [v29 identityType];
      if ((unint64_t)(v30 - 1) < 3)
      {
        v31 = off_1E59DFE38[v30 - 1];
        goto LABEL_30;
      }
    }
    else if ([v29 isAccessPass])
    {
      unint64_t v32 = [v29 accessType];
      if (v32 < 7)
      {
        v31 = off_1E59DFE50[v32];
        goto LABEL_30;
      }
    }
    v31 = (__CFString *)*v20;
LABEL_30:

    [v16 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F867C8]];
    v33 = [v26 secureElementPass];
    v34 = [v33 devicePaymentApplications];
    [v34 count];

    v35 = PKAnalyticsReportSwitchToggleResultValue();

    [v16 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F861A0]];
    v36 = [v26 secureElementPass];
    id v37 = *v20;
    v38 = [v36 organizationName];
    if ([v38 length])
    {
      unint64_t v39 = [v36 cardType];
      if (v39 <= 4 && ((1 << v39) & 0x16) != 0)
      {
        id v40 = v38;

        id v37 = v40;
      }
    }

    [v16 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F865A0]];
    goto LABEL_35;
  }
LABEL_37:
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    double v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 134349056;
      double v7 = self;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): invalidated.", (uint8_t *)&v6, 0xCu);
    }

    self->_invalidated = 1;
    [(PKPassFooterView *)self _endSessionStartTimer];
    [(PKPassFooterView *)self _endSession];
    informativeAssertion = self->_informativeAssertion;
    if (informativeAssertion)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        int v6 = 134349312;
        double v7 = self;
        __int16 v8 = 2048;
        id v9 = informativeAssertion;
        _os_log_debug_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): releasing nearfield informative assertion %p.", (uint8_t *)&v6, 0x16u);
      }

      InvalidateAssertion(self->_informativeAssertion);
      char v5 = self->_informativeAssertion;
      self->_informativeAssertion = 0;
    }
    if (self->_contentView || self->_fadingContentView) {
      [(PKPassFooterView *)self _setContentView:0 animated:0];
    }
  }
}

- (BOOL)isPassAuthorized
{
  return [(PKPassFooterContentView *)self->_contentView isPassAuthorized];
}

- (BOOL)requestPileSuppression
{
  return [(PKPassFooterContentView *)self->_contentView requestPileSuppression];
}

- (BOOL)isViewCurrentContentView:(id)a3
{
  return self->_contentView == a3;
}

- (void)showFullScreenBarcode
{
}

- (void)passFooterContentViewDidAuthenticate:(id)a3
{
  double v4 = [(PKPassFooterViewConfiguration *)self->_configuration passView];
  [v4 didAuthenticate];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained;
    char v7 = objc_opt_respondsToSelector();
    int v6 = v8;
    if (v7)
    {
      [v8 passFooterViewDidSucceedAtAuthorization:self];
      int v6 = v8;
    }
  }
}

- (void)passFooterContentViewDidTransact:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(PKPassFooterViewConfiguration *)self->_configuration passView];
  [v6 didTransact];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  __int16 v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained;
    char v9 = objc_opt_respondsToSelector();
    __int16 v8 = v10;
    if (v9)
    {
      [v10 passFooterViewDidTransact:self success:v4];
      __int16 v8 = v10;
    }
  }
}

- (void)passFooterContentView:(id)a3 didAuthorizeAndRetrieveDecryptedBarcode:(id)a4
{
  configuration = self->_configuration;
  id v6 = a4;
  char v7 = [(PKPassFooterViewConfiguration *)configuration passView];
  [v7 setPaymentBarcodeData:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v11 = WeakRetained;
    char v10 = objc_opt_respondsToSelector();
    char v9 = v11;
    if (v10)
    {
      [v11 passFooterViewDidSucceedAtAuthorization:self];
      char v9 = v11;
    }
  }
}

- (void)passFooterContentViewDidInvalidateAuthorization:(id)a3
{
  BOOL v4 = [(PKPassFooterViewConfiguration *)self->_configuration passView];
  [v4 setPaymentBarcodeData:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v8 = WeakRetained;
    char v7 = objc_opt_respondsToSelector();
    id v6 = v8;
    if (v7)
    {
      [v8 passFooterViewDidEndAuthorization:self];
      id v6 = v8;
    }
  }
}

- (void)passFooterContentViewRequestsSessionSuppression:(id)a3
{
  [(PKPassFooterView *)self _endSessionStartTimer];
  [(PKPassFooterView *)self _endSession];
  BOOL v4 = self->_sessionDelayGroup;
  dispatch_group_enter((dispatch_group_t)v4);
  dispatch_time_t v5 = dispatch_time(0, 1500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKPassFooterView_passFooterContentViewRequestsSessionSuppression___block_invoke;
  block[3] = &unk_1E59CA7D0;
  __int16 v8 = v4;
  id v6 = v4;
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
  [(PKPassFooterView *)self _configureWithConfiguration:self->_configuration context:0 animated:1];
}

void __68__PKPassFooterView_passFooterContentViewRequestsSessionSuppression___block_invoke(uint64_t a1)
{
}

- (void)passFooterContentViewDidChangePhysicalButtonRequirement:(id)a3
{
  if (self->_contentView == a3)
  {
    uint64_t v4 = [a3 isPhysicalButtonRequired];
    [(PKPassFooterView *)self _setPhysicalButtonRequired:v4];
  }
}

- (void)passFooterContentViewDidChangeCoachingState:(id)a3
{
  if (self->_contentView == a3)
  {
    uint64_t v4 = [a3 coachingState];
    [(PKPassFooterView *)self _setCoachingState:v4];
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL var0 = a4.var0;
  id v6 = a3;
  if (!self->_isBackgrounded != var0)
  {
    id v7 = v6;
    self->_isBackgrounded = !var0;
    if (var0) {
      [(PKPassFooterView *)self _updateForForegroundActivePresentationIfNecessaryAnimated:0];
    }
    else {
      [(PKPassFooterView *)self _updateForNonForegroundActivePresentationAnimated:0];
    }
    id v6 = v7;
  }
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateDeactivationReasons:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  if (((v4 & 0x10) == 0) != !self->_isAssistantActive)
  {
    id v7 = v6;
    self->_isAssistantActive = (v4 & 0x10) >> 4;
    if ((v4 & 0x10) != 0) {
      [(PKPassFooterView *)self _updateForNonForegroundActivePresentationAnimated:1];
    }
    else {
      [(PKPassFooterView *)self _updateForForegroundActivePresentationIfNecessaryAnimated:1];
    }
    id v6 = v7;
  }
}

- (BOOL)isPassFooterContentViewInGroup:(id)a3
{
  double v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained isPassFooterViewInGroup:v3];

  return (char)v3;
}

- (unint64_t)suppressedContentForContentView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unint64_t v5 = [WeakRetained suppressedContentForPassFooter:self];

  return v5;
}

- (void)passFooterContentViewDidChangePileSuppressionRequirement:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained passFooterViewDidChangePileSuppressionRequirement:self];
  }
}

- (void)_updateForForegroundActivePresentationIfNecessaryAnimated:(BOOL)a3
{
  if (!self->_isBackgrounded && !self->_isAssistantActive) {
    [(PKPassFooterView *)self _configureWithConfiguration:self->_configuration context:0 animated:0];
  }
}

- (void)_updateForNonForegroundActivePresentationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPassFooterView *)self _endSessionStartTimer];
  [(PKPassFooterView *)self _endSession];

  [(PKPassFooterView *)self _setContentView:0 animated:v3];
}

- (void)_configureWithConfiguration:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  BOOL v31 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_invalidated) {
    char v9 = 0;
  }
  else {
    char v9 = v7;
  }
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, v9);
  [(PKPassFooterView *)self _endSessionStartTimer];
  [(PKPassFooterView *)self _endSession];
  objc_super v11 = [(PKPassFooterViewConfiguration *)self->_configuration passView];
  v12 = [v11 pass];
  if ([v12 passType] == 1) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;
  informativeAssertion = self->_informativeAssertion;
  if (v12)
  {
    if (informativeAssertion) {
      goto LABEL_21;
    }
    id v30 = v8;
    id v16 = [(id)PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    id v32 = 0;
    id v17 = [v16 requestAssertion:3 error:&v32];
    v18 = (NFAssertion *)v32;

    uint64_t v19 = PKLogFacilityTypeGetObject();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134349312;
        v34 = self;
        __int16 v35 = 2048;
        v36 = v17;
        _os_log_debug_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): acquired nearfield informative assertion %p.", buf, 0x16u);
      }

      v21 = v17;
      v20 = self->_informativeAssertion;
      self->_informativeAssertion = v21;
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349314;
      v34 = self;
      __int16 v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_19F450000, v20, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): failed to acquire nearfield informative assertion - %@.", buf, 0x16u);
    }

    id v8 = v30;
  }
  else
  {
    if (!informativeAssertion) {
      goto LABEL_21;
    }
    unint64_t v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349312;
      v34 = self;
      __int16 v35 = 2048;
      v36 = informativeAssertion;
      _os_log_debug_impl(&dword_19F450000, v22, OS_LOG_TYPE_DEBUG, "PKPassFooterView (%{public}p): releasing nearfield informative assertion %p.", buf, 0x16u);
    }

    InvalidateAssertion(self->_informativeAssertion);
    v18 = self->_informativeAssertion;
    self->_informativeAssertion = 0;
  }

LABEL_21:
  if (*p_configuration)
  {
    v23 = 0;
    switch([(PKPassFooterViewConfiguration *)*p_configuration state])
    {
      case 0:
        v24 = [(PKPassFooterContentView *)[PKPassBarcodeFooterView alloc] initWithPass:v12 presentationContext:0];
        goto LABEL_33;
      case 1:
        if (!v11) {
          break;
        }
        v25 = [(PKPassFooterView *)self _messageForPaymentApplicationState];
        v23 = [(PKPassFooterView *)self _messageContentViewFromMessage:v25];

        if (v23) {
          goto LABEL_39;
        }
        id v26 = [v14 devicePrimaryBarcodePaymentApplication];
        [v26 state];
        if (PKPaymentApplicationStateIsPersonalized())
        {
        }
        else
        {
          [v14 effectiveContactlessPaymentApplicationState];
          int IsPersonalized = PKPaymentApplicationStateIsPersonalized();

          if (!IsPersonalized) {
            break;
          }
        }
        [(PKPassFooterView *)self _configureForPersonalizedPaymentApplicationWithContext:v8];
        break;
      case 2:
        if (v11) {
          [(PKPassFooterView *)self _configureForValueAddedServiceWithContext:v8];
        }
        break;
      case 3:
        uint64_t v27 = [(PKPassFooterView *)self _messageForRestrictedState];
        goto LABEL_35;
      case 4:
        v24 = [[PKPassPaymentConfirmationView alloc] initWithPass:v14 passView:v11 context:v8];
LABEL_33:
        v23 = v24;
        goto LABEL_39;
      case 6:
        uint64_t v27 = [(PKPassFooterView *)self _messageForPeerPaymentZeroBalance];
        goto LABEL_35;
      case 7:
        uint64_t v27 = [(PKPassFooterView *)self _messageForPeerPaymentLockedByOwner];
LABEL_35:
        unint64_t v28 = (void *)v27;
        v23 = [(PKPassFooterView *)self _messageContentViewFromMessage:v27];

        goto LABEL_39;
      default:
        goto LABEL_39;
    }
  }
  v23 = 0;
LABEL_39:
  [(PKPassFooterView *)self _setContentView:v23 animated:v31];
}

- (void)_startContactlessInterfaceSessionWithContext:(id)a3 shouldForceSessionAcquisition:(BOOL)a4 sessionAvailable:(id)a5 sessionUnavailable:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  [(PKPassFooterView *)self _endSessionStartTimer];
  [(PKPassFooterView *)self _endSession];
  v12 = [v9 backgroundSession];
  id v13 = objc_alloc_init(MEMORY[0x1E4F84C38]);
  if (*(_OWORD *)&self->_contentView == 0 && PKUserIntentIsAvailable())
  {
    id v14 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
    [(PKPassFooterView *)self _setPhysicalButtonRequired:+[PKPassPaymentContainerView initialPhysicalButtonRequiredAssumptionForPass:v14 context:v9 paymentService:v13]];
  }
  objc_initWeak(location, self);
  id v15 = (void *)(self->_sessionToken + 1);
  self->_sessionToken = (unint64_t)v15;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  char v43 = 0;
  self->_acquiringSession = 1;
  sessionDelayGroup = self->_sessionDelayGroup;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke;
  block[3] = &unk_1E59DFC80;
  objc_copyWeak(v40, location);
  v40[1] = v15;
  id v34 = v12;
  id v35 = v13;
  id v37 = v10;
  unint64_t v39 = v42;
  id v17 = v11;
  id v38 = v17;
  v36 = self;
  BOOL v41 = a4;
  id v28 = v13;
  id v18 = v10;
  id v19 = v12;
  v20 = MEMORY[0x1E4F14428];
  dispatch_group_notify(sessionDelayGroup, MEMORY[0x1E4F14428], block);
  v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v20);
  sessionStartTimer = self->_sessionStartTimer;
  self->_sessionStartTimer = v21;

  v23 = self->_sessionStartTimer;
  dispatch_time_t v24 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v25 = self->_sessionStartTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_47;
  handler[3] = &unk_1E59DFCA8;
  objc_copyWeak(v32, location);
  v32[1] = v15;
  id v30 = v17;
  BOOL v31 = v42;
  id v26 = v17;
  dispatch_source_set_event_handler(v25, handler);
  dispatch_resume((dispatch_object_t)self->_sessionStartTimer);

  objc_destroyWeak(v32);
  objc_destroyWeak(v40);
  _Block_object_dispose(v42, 8);
  objc_destroyWeak(location);
}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_2;
    aBlock[3] = &unk_1E59DFC30;
    objc_copyWeak(v28, v2);
    v28[1] = *(id *)(a1 + 88);
    id v26 = *(id *)(a1 + 56);
    id v25 = *(id *)(a1 + 40);
    long long v19 = *(_OWORD *)(a1 + 64);
    id v4 = (id)v19;
    long long v27 = v19;
    unint64_t v5 = _Block_copy(aBlock);
    id v6 = *(void **)(a1 + 32);
    if (!v6)
    {
LABEL_15:
      objc_msgSend(WeakRetained, "_acquireContactlessInterfaceSessionWithSessionToken:shouldForceSessionAcquisition:handler:", *(void *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), v5, v19);
      goto LABEL_16;
    }
    id v7 = [v6 pass];
    id v8 = [v7 uniqueID];
    id v9 = [*(id *)(*(void *)(a1 + 48) + 488) pass];
    id v10 = [v9 uniqueID];
    id v11 = v8;
    id v12 = v10;
    if (v11 == v12)
    {
    }
    else
    {
      id v13 = v12;
      if (!v11 || !v12)
      {

LABEL_12:
        id v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v30 = WeakRetained;
          _os_log_impl(&dword_19F450000, v18, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): error: background session configured for incorrect pass - unwanted transactions may have occurred.", buf, 0xCu);
        }

        [*(id *)(a1 + 32) invalidate];
        goto LABEL_15;
      }
      char v14 = [v11 isEqualToString:v12];

      if ((v14 & 1) == 0) {
        goto LABEL_12;
      }
    }
    id v15 = *(void **)(a1 + 32);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_3;
    v20[3] = &unk_1E59DFC58;
    objc_copyWeak(v22, v2);
    id v16 = v5;
    id v17 = *(void **)(a1 + 88);
    id v21 = v16;
    v22[1] = v17;
    char v23 = *(unsigned char *)(a1 + 96);
    [v15 claimActiveSessionWithCompletion:v20];

    objc_destroyWeak(v22);
LABEL_16:

    objc_destroyWeak(v28);
    goto LABEL_17;
  }
  [*(id *)(a1 + 32) invalidate];
LABEL_17:
}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained && *((void *)WeakRetained + 56) == *(void *)(a1 + 72) && !*((unsigned char *)WeakRetained + 480))
  {
    *((unsigned char *)WeakRetained + 442) = 0;
    [WeakRetained _endSessionStartTimer];
    if (v6 || (PKStoreDemoModeEnabled() & 1) != 0 || PKUIOnlyDemoModeEnabled())
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
      if (!*(unsigned char *)(v5 + 24))
      {
        *(unsigned char *)(v5 + 24) = 1;
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
  }
  else
  {
    InvalidateSession(v6);
  }
}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        int v7 = 134217984;
        id v8 = WeakRetained;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): using background session.", (uint8_t *)&v7, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      if (v6)
      {
        int v7 = 134217984;
        id v8 = WeakRetained;
        _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%p): failed to acquire background session - falling back.", (uint8_t *)&v7, 0xCu);
      }

      [WeakRetained _acquireContactlessInterfaceSessionWithSessionToken:*(void *)(a1 + 48) shouldForceSessionAcquisition:*(unsigned __int8 *)(a1 + 56) handler:*(void *)(a1 + 32)];
    }
  }
  else
  {
    InvalidateSession(v3);
  }
}

void __131__PKPassFooterView__startContactlessInterfaceSessionWithContext_shouldForceSessionAcquisition_sessionAvailable_sessionUnavailable___block_invoke_47(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    BOOL v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      int v6 = 134349312;
      id v7 = WeakRetained;
      __int16 v8 = 2050;
      uint64_t v9 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Contactless payment session acquisition timed-out for token %{public}ld.", (uint8_t *)&v6, 0x16u);
    }

    if (*((void *)WeakRetained + 56) == *(void *)(a1 + 56) && !*((unsigned char *)WeakRetained + 480))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      if (!*(unsigned char *)(v5 + 24))
      {
        *(unsigned char *)(v5 + 24) = 1;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      [WeakRetained _endSessionStartTimer];
    }
  }
}

- (int64_t)_acquireContactlessInterfaceSessionErrorActionForError:(id)a3
{
  id v3 = a3;
  if (PKNearFieldRadioIsAvailable())
  {
    uint64_t v4 = [v3 domain];
    uint64_t v5 = [NSString stringWithUTF8String:"nfcd"];
    int v6 = [v4 isEqualToString:v5];

    if (v6) {
      int64_t v7 = [v3 code] == 50;
    }
    else {
      int64_t v7 = 0;
    }
  }
  else
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (void)_acquireContactlessInterfaceSessionWithSessionToken:(unint64_t)a3 shouldForceSessionAcquisition:(BOOL)a4 handler:(id)a5
{
  BOOL v5 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (v8)
  {
    if (self->_sessionToken != a3 || self->_invalidated || self->_isBackgrounded)
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_53;
        v21[3] = &unk_1E59CAA98;
        id v22 = v8;
        dispatch_async(MEMORY[0x1E4F14428], v21);

        goto LABEL_9;
      }
      *(_DWORD *)buf = 134349312;
      id v28 = self;
      __int16 v29 = 2050;
      unint64_t v30 = a3;
      uint64_t v10 = "PKPassFooterView (%{public}p): acquisition no longer allowed for token %{public}ld.";
      id v11 = v9;
      uint32_t v12 = 22;
LABEL_7:
      _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      goto LABEL_8;
    }
    if (PKStoreDemoModeEnabled() & 1) != 0 || (PKUIOnlyDemoModeEnabled())
    {
      uint64_t v9 = PKLogFacilityTypeGetObject();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_8;
      }
      *(_DWORD *)buf = 134349056;
      id v28 = self;
      uint64_t v10 = "PKPassFooterView (%{public}p): skippping contactless payment session aquisition due to demo mode.";
      id v11 = v9;
      uint32_t v12 = 12;
      goto LABEL_7;
    }
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      id v28 = self;
      __int16 v29 = 2050;
      unint64_t v30 = a3;
      _os_log_impl(&dword_19F450000, v13, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Acquiring contactless payment session for token %{public}ld...", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    char v14 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
    if ([v14 passType] == 1) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke;
    aBlock[3] = &unk_1E59DFCF8;
    objc_copyWeak(v25, (id *)buf);
    v25[1] = (id)a3;
    id v17 = v8;
    BOOL v26 = v5;
    void aBlock[4] = self;
    id v24 = v17;
    id v18 = _Block_copy(aBlock);
    if ([v16 isCarKeyPass])
    {
      long long v19 = [MEMORY[0x1E4F84C40] startDigitalCarKeySessionWithCompletion:v18];
    }
    else if (([v16 isCarKeyPass] & 1) != 0 || !objc_msgSend(v16, "hasCredentials"))
    {
      if (v5) {
        [MEMORY[0x1E4F84C40] forceContactlessInterfaceSessionWithCompletion:v18];
      }
      else {
      long long v19 = [MEMORY[0x1E4F84C40] startContactlessInterfaceSessionWithCompletion:v18];
      }
    }
    else
    {
      long long v19 = [MEMORY[0x1E4F84C40] startSTSContactlessInterfaceSessionWithDelegate:self completion:v18];
    }
    sessionHandle = self->_sessionHandle;
    self->_sessionHandle = v19;

    objc_destroyWeak(v25);
    objc_destroyWeak((id *)buf);
  }
LABEL_9:
}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_2;
  block[3] = &unk_1E59DFCD0;
  objc_copyWeak(v16, (id *)(a1 + 48));
  v16[1] = *(id *)(a1 + 56);
  id v12 = v5;
  id v7 = *(id *)(a1 + 40);
  char v17 = *(unsigned char *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v7;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v16);
}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = WeakRetained;
  if (!WeakRetained || (uint64_t v5 = WeakRetained[56], v5 != *(void *)(a1 + 72)) || *((unsigned char *)WeakRetained + 480))
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134349312;
      id v22 = v7;
      __int16 v23 = 2050;
      uint64_t v24 = v8;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): acquisition no longer allowed for token %{public}ld.", buf, 0x16u);
    }

    InvalidateSession(*(PKContactlessInterfaceSession **)(a1 + 32));
    goto LABEL_7;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134349568;
    id v22 = v4;
    __int16 v23 = 2050;
    uint64_t v24 = v11;
    __int16 v25 = 2050;
    uint64_t v26 = v5;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Acquired contactless payment session (%{public}p) for token %{public}ld.", buf, 0x20u);
  }

  id v12 = (void *)v4[58];
  v4[58] = 0;

  if (*(void *)(a1 + 32))
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  uint64_t v13 = [v4 _acquireContactlessInterfaceSessionErrorActionForError:*(void *)(a1 + 40)];
  switch(v13)
  {
    case 2:
LABEL_7:
      id v9 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_8:
      v9();
      break;
    case 1:
      id v15 = PKCreateAlertControllerForNFCRadioDisabled();
      id v16 = objc_msgSend(v4, "pkui_viewControllerFromResponderChain");
      [v16 presentViewController:v15 animated:1 completion:0];

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      break;
    case 0:
      dispatch_time_t v14 = dispatch_time(0, 2000000000);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_50;
      v17[3] = &unk_1E59D86F8;
      objc_copyWeak(v19, v2);
      v19[1] = *(id *)(a1 + 72);
      char v20 = *(unsigned char *)(a1 + 80);
      id v18 = *(id *)(a1 + 56);
      dispatch_after(v14, MEMORY[0x1E4F14428], v17);

      objc_destroyWeak(v19);
      break;
  }
}

void __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_50(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v5 = 134349312;
      id v6 = WeakRetained;
      __int16 v7 = 2050;
      uint64_t v8 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassFooterView (%{public}p): Restarting contactless payment session acquisition for token %{public}ld...", (uint8_t *)&v5, 0x16u);
    }

    [WeakRetained _acquireContactlessInterfaceSessionWithSessionToken:*(void *)(a1 + 48) shouldForceSessionAcquisition:*(unsigned __int8 *)(a1 + 56) handler:*(void *)(a1 + 32)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __110__PKPassFooterView__acquireContactlessInterfaceSessionWithSessionToken_shouldForceSessionAcquisition_handler___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_configureForPersonalizedPaymentApplicationWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
  if ([v5 passType] == 1) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke;
  aBlock[3] = &unk_1E59DFD20;
  objc_copyWeak(&v20, &location);
  id v8 = v7;
  id v17 = v8;
  id v18 = self;
  id v9 = v4;
  id v19 = v9;
  id v10 = _Block_copy(aBlock);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke_2;
  v14[3] = &unk_1E59CB010;
  objc_copyWeak(&v15, &location);
  v14[4] = self;
  uint64_t v11 = _Block_copy(v14);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v13 = [WeakRetained isPassFooterViewInGroup:self];

  [(PKPassFooterView *)self _startContactlessInterfaceSessionWithContext:v9 shouldForceSessionAcquisition:v13 sessionAvailable:v10 sessionUnavailable:v11];
  objc_destroyWeak(&v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained && [WeakRetained _canApplyContentViewForPersonalizedApplication])
  {
    id v8 = [PKPassPaymentContainerView alloc];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(*(void *)(a1 + 40) + 488) passView];
    uint64_t v11 = [(PKPassPaymentContainerView *)v8 initWithPass:v9 passView:v10 context:*(void *)(a1 + 48) paymentSession:v12 paymentService:v5];

    [v7 _setContentView:v11 animated:1];
  }
  else
  {
    InvalidateSession(v12);
  }
}

void __75__PKPassFooterView__configureForPersonalizedPaymentApplicationWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    int v4 = [WeakRetained _canApplyContentViewForPersonalizedApplication];
    id v3 = v8;
    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v5 _messageForUnavailableState];
      id v7 = [v5 _messageContentViewFromMessage:v6];
      [v8 _setContentView:v7 animated:1];

      id v3 = v8;
    }
  }
}

- (void)_configureForValueAddedServiceWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke;
  aBlock[3] = &unk_1E59DFD20;
  objc_copyWeak(&v16, &location);
  id v6 = v5;
  id v13 = v6;
  dispatch_time_t v14 = self;
  id v7 = v4;
  id v15 = v7;
  id v8 = _Block_copy(aBlock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke_2;
  v10[3] = &unk_1E59CB010;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  uint64_t v9 = _Block_copy(v10);
  [(PKPassFooterView *)self _startContactlessInterfaceSessionWithContext:v7 shouldForceSessionAcquisition:0 sessionAvailable:v8 sessionUnavailable:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained && [WeakRetained _canApplyContentViewForValueAddedService])
  {
    id v8 = [PKPassPaymentContainerView alloc];
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(*(void *)(a1 + 40) + 488) passView];
    id v11 = [(PKPassPaymentContainerView *)v8 initWithPass:v9 passView:v10 context:*(void *)(a1 + 48) paymentSession:v12 paymentService:v5];

    [v7 _setContentView:v11 animated:1];
  }
  else
  {
    InvalidateSession(v12);
  }
}

void __62__PKPassFooterView__configureForValueAddedServiceWithContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    int v4 = [WeakRetained _canApplyContentViewForValueAddedService];
    id v3 = v8;
    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      id v6 = [v5 _messageForUnavailableState];
      id v7 = [v5 _messageContentViewFromMessage:v6];
      [v8 _setContentView:v7 animated:1];

      id v3 = v8;
    }
  }
}

- (void)_setContentView:(id)a3 animated:(BOOL)a4
{
  id v6 = (PKPassFooterContentView *)a3;
  id v7 = v6;
  if (self->_invalidated)
  {
    if (v6)
    {
      [(PKPassFooterContentView *)v6 setDelegate:0];
      [(PKPassFooterContentView *)v7 invalidate];

      id v7 = 0;
    }
  }
  else if (a4)
  {
    p_contentView = &self->_contentView;
    contentView = self->_contentView;
    if (contentView == v7) {
      goto LABEL_49;
    }
    uint64_t v10 = 1;
    if (!contentView) {
      goto LABEL_31;
    }
    goto LABEL_14;
  }
  fadingContentView = self->_fadingContentView;
  if (fadingContentView)
  {
    id v12 = fadingContentView;
    id v13 = self->_fadingContentView;
    self->_fadingContentView = 0;

    if (self->_fadingContentViewNeedsDidHide) {
      [(PKPassFooterContentView *)v12 didBecomeHiddenAnimated:0];
    }
    [(PKPassFooterContentView *)v12 removeFromSuperview];
    [(PKPassFooterContentView *)v12 invalidate];
  }
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v7)
  {
    uint64_t v10 = 0;
    if (!contentView)
    {
LABEL_31:
      BOOL v28 = [(PKPassFooterContentView *)*p_contentView requestPileSuppression];
      objc_storeStrong((id *)p_contentView, v7);
      if (*p_contentView)
      {
        [(PKPassFooterContentView *)*p_contentView setDelegate:self];
        if (((self->_fadingContentView == 0) & ~v10) == 0) {
          [(PKPassFooterContentView *)*p_contentView setAlpha:0.0];
        }
        if (PKViewVisibilityStateIsVisible()) {
          [(PKPassFooterView *)self _advanceContentViewVisibilityToState:1 animated:v10];
        }
        [(PKPassFooterView *)self addSubview:*p_contentView];
        [(PKPassFooterView *)self setNeedsLayout];
        [(PKPassFooterView *)self layoutIfNeeded];
        if (!self->_fadingContentView) {
          [(PKPassFooterView *)self _commitContentViewAnimated:v10];
        }
      }
      if (v28 != [(PKPassFooterContentView *)*p_contentView requestPileSuppression])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
          [WeakRetained passFooterViewDidChangePileSuppressionRequirement:self];
        }
      }
      if (v7)
      {
        [(PKPassFooterView *)self _setPhysicalButtonRequired:[(PKPassFooterContentView *)v7 isPhysicalButtonRequired]];
        uint64_t v30 = [(PKPassFooterContentView *)v7 coachingState];
      }
      else
      {
        if (!self->_acquiringSession) {
          -[PKPassFooterView _setPhysicalButtonRequired:](self, "_setPhysicalButtonRequired:", [0 isPhysicalButtonRequired]);
        }
        uint64_t v30 = 0;
      }
      [(PKPassFooterView *)self _setCoachingState:v30];
      goto LABEL_49;
    }
LABEL_14:
    [(PKPassFooterContentView *)contentView setDelegate:0];
    int contentViewVisibility = self->_contentViewVisibility;
    BOOL v15 = self->_contentViewVisibility != 0;
    if (v10 && (p_fadingContentView = &self->_fadingContentView, !self->_fadingContentView))
    {
      if (self->_contentViewVisibility) {
        [(PKPassFooterView *)self _advanceContentViewVisibilityToState:3 animated:1];
      }
      objc_storeStrong((id *)p_fadingContentView, *p_contentView);
      self->_fadingContentViewNeedsDidHide = v15;
      id v21 = *p_contentView;
      *p_contentView = 0;

      [(PKPassFooterContentView *)*p_fadingContentView alpha];
      OpacityAnimation = CreateOpacityAnimation(v22, 0.0);
      objc_initWeak(&location, self);
      uint64_t v24 = *p_fadingContentView;
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      id v34 = __45__PKPassFooterView__setContentView_animated___block_invoke;
      id v35 = &unk_1E59CB268;
      uint64_t v31 = &v37;
      objc_copyWeak(&v37, &location);
      __int16 v25 = v24;
      v36 = v25;
      objc_msgSend(OpacityAnimation, "pkui_setCompletionHandler:", &v32);
      uint64_t v26 = [(PKPassFooterContentView *)*p_fadingContentView layer];
      id v27 = (id)objc_msgSend(v26, "pkui_addAdditiveAnimation:", OpacityAnimation);

      [(PKPassFooterContentView *)*p_fadingContentView setAlpha:0.0];
      if (contentViewVisibility) {
        -[PKPassFooterView _advanceContentViewVisibilityToState:animated:](self, "_advanceContentViewVisibilityToState:animated:", 0, 0, &v37, v32, v33, v34, v35);
      }

      objc_destroyWeak(v31);
      objc_destroyWeak(&location);
    }
    else
    {
      if (self->_contentViewVisibility)
      {
        [(PKPassFooterView *)self _advanceContentViewVisibilityToState:3 animated:0];
        [(PKPassFooterContentView *)*p_contentView removeFromSuperview];
        [(PKPassFooterView *)self _advanceContentViewVisibilityToState:0 animated:0];
      }
      else
      {
        [(PKPassFooterContentView *)*p_contentView removeFromSuperview];
      }
      [(PKPassFooterContentView *)*p_contentView invalidate];
      id v17 = *p_contentView;
      *p_contentView = 0;

      if ((v10 & 1) == 0)
      {
        id v18 = self->_fadingContentView;
        if (v18)
        {
          id v19 = v18;
          id v20 = self->_fadingContentView;
          self->_fadingContentView = 0;

          if (self->_fadingContentViewNeedsDidHide) {
            [(PKPassFooterContentView *)v19 didBecomeHiddenAnimated:0];
          }
          [(PKPassFooterContentView *)v19 removeFromSuperview];
          [(PKPassFooterContentView *)v19 invalidate];
        }
      }
    }
    goto LABEL_31;
  }
  if (self->_fadingContentView) {
    [(PKPassFooterView *)self _commitContentViewAnimated:0];
  }
LABEL_49:
}

void __45__PKPassFooterView__setContentView_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[52] == *(void *)(a1 + 32))
  {
    id v3 = WeakRetained;
    [WeakRetained _commitContentViewAnimated:1];
    id WeakRetained = v3;
  }
}

- (void)_commitContentViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  fadingContentView = self->_fadingContentView;
  if (fadingContentView)
  {
    id v6 = fadingContentView;
    id v7 = self->_fadingContentView;
    self->_fadingContentView = 0;

    if (self->_fadingContentViewNeedsDidHide) {
      [(PKPassFooterContentView *)v6 didBecomeHiddenAnimated:0];
    }
    [(PKPassFooterContentView *)v6 removeFromSuperview];
    [(PKPassFooterContentView *)v6 invalidate];
  }
  if (v3)
  {
    contentView = self->_contentView;
    if (contentView)
    {
      [(PKPassFooterContentView *)contentView alpha];
      OpacityAnimation = CreateOpacityAnimation(v9, 1.0);
      id v11 = [(PKPassFooterContentView *)self->_contentView layer];
      id v12 = (id)objc_msgSend(v11, "pkui_addAdditiveAnimation:", OpacityAnimation);

      [(PKPassFooterContentView *)self->_contentView setAlpha:1.0];
    }
  }
  uint64_t visibility = self->_visibility;

  [(PKPassFooterView *)self _advanceContentViewVisibilityToState:visibility animated:v3];
}

- (void)_setPhysicalButtonRequired:(BOOL)a3
{
  if (((!self->_physicalButtonRequired ^ a3) & 1) == 0)
  {
    self->_physicalButtonRequired = a3;
    if (PKViewVisibilityStateIsVisible())
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained passFooterViewDidChangePhysicalButtonRequirement:self];
    }
  }
}

- (void)_setCoachingState:(int64_t)a3
{
  if (self->_coachingState != a3)
  {
    self->_coachingState = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passFooterViewDidChangeCoachingState:self];
  }
}

- (void)_advanceVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  LOBYTE(v7) = a4;
  PKViewVisibilityStateAdvanceState();
  if (!self->_visibility) {
    [(PKPassFooterView *)self _endSession];
  }
}

uint64_t __55__PKPassFooterView__advanceVisibilityToState_animated___block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 481) = a2;
  if (!*(void *)(*(void *)(result + 32) + 416)) {
    return [*(id *)(result + 32) _advanceContentViewVisibilityToState:a2 animated:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)_advanceContentViewVisibilityToState:(unsigned __int8)a3 animated:(BOOL)a4
{
  int v4 = self->_contentView;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    PKViewVisibilityStateAdvanceState();
  }
}

uint64_t __66__PKPassFooterView__advanceContentViewVisibilityToState_animated___block_invoke(uint64_t result, int a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 482) = a2;
  uint64_t v2 = result;
  switch(a2)
  {
    case 0:
      result = objc_opt_respondsToSelector();
      if (result)
      {
        BOOL v3 = *(void **)(v2 + 40);
        uint64_t v4 = *(unsigned __int8 *)(v2 + 48);
        result = [v3 didBecomeHiddenAnimated:v4];
      }
      break;
    case 1:
      result = objc_opt_respondsToSelector();
      if (result)
      {
        double v9 = *(void **)(v2 + 40);
        uint64_t v10 = *(unsigned __int8 *)(v2 + 48);
        result = [v9 willBecomeVisibleAnimated:v10];
      }
      break;
    case 2:
      result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v5 = *(void **)(v2 + 40);
        uint64_t v6 = *(unsigned __int8 *)(v2 + 48);
        result = [v5 didBecomeVisibleAnimated:v6];
      }
      break;
    case 3:
      result = objc_opt_respondsToSelector();
      if (result)
      {
        uint64_t v7 = *(void **)(v2 + 40);
        uint64_t v8 = *(unsigned __int8 *)(v2 + 48);
        result = [v7 willBecomeHiddenAnimated:v8];
      }
      break;
    default:
      return result;
  }
  return result;
}

- (void)_endSession
{
  self->_acquiringSession = 0;
  ++self->_sessionToken;
  sessionHandle = self->_sessionHandle;
  if (sessionHandle)
  {
    uint64_t v4 = sessionHandle;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = ___ZL17InvalidateSessionP22PKPaymentSessionHandle_block_invoke;
    v7[3] = &unk_1E59CCD30;
    uint64_t v8 = v4;
    uint64_t v5 = v4;
    PeformBackgroundTask(v7);

    uint64_t v6 = self->_sessionHandle;
    self->_sessionHandle = 0;
  }
}

- (void)_endSessionStartTimer
{
  sessionStartTimer = self->_sessionStartTimer;
  if (sessionStartTimer)
  {
    dispatch_source_cancel(sessionStartTimer);
    uint64_t v4 = self->_sessionStartTimer;
    self->_sessionStartTimer = 0;
  }
}

- (BOOL)_canApplyContentViewForPersonalizedApplication
{
  if (self->_invalidated || self->_isBackgrounded || self->_isAssistantActive)
  {
    LOBYTE(IsVisible) = 0;
  }
  else
  {
    int IsVisible = PKViewVisibilityStateIsVisible();
    if (IsVisible) {
      LOBYTE(IsVisible) = [(PKPassFooterViewConfiguration *)self->_configuration state] == 1;
    }
  }
  return IsVisible;
}

- (BOOL)_canApplyContentViewForValueAddedService
{
  if (self->_invalidated || self->_isBackgrounded || self->_isAssistantActive)
  {
    LOBYTE(IsVisible) = 0;
  }
  else
  {
    int IsVisible = PKViewVisibilityStateIsVisible();
    if (IsVisible) {
      LOBYTE(IsVisible) = [(PKPassFooterViewConfiguration *)self->_configuration state] == 2;
    }
  }
  return IsVisible;
}

- (void)_lostModeButtonTapped
{
  uint64_t v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "Starting FMDFMIP lost mode exit.", v4, 2u);
  }

  BOOL v3 = [MEMORY[0x1E4F61A48] sharedInstance];
  [v3 initiateLostModeExitAuthWithCompletion:&__block_literal_global_233];
}

void __41__PKPassFooterView__lostModeButtonTapped__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PKLogFacilityTypeGetObject();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = [v2 localizedDescription];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Error exiting lost mode: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Completed FMDFMIP lost mode exit.", (uint8_t *)&v6, 2u);
    }

    PKSetNeedsLostModeExitAuth();
  }
}

- (id)_messageContentViewFromMessage:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    BOOL v4 = [[PKPassMessageFooterContentView alloc] initWithPass:0 presentationContext:0];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithObject:v3];

    [(PKPassMessageFooterContentView *)v4 updateWithMessages:v5];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_messageForUnavailableState
{
  id v3 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v3 setIdentifier:@"applicationState"];
  BOOL v4 = PKLocalizedPaymentString(&cfstr_PaymentDeviceU.isa);
  [(PKDashboardPassMessage *)v3 setTitle:v4];

  uint64_t v5 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
  if ([v5 passType] == 1) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  if ([v6 isAccessPass]) {
    uint64_t v7 = @"PAYMENT_DEVICE_UNAVAILABLE_WALLET_MESSAGE";
  }
  else {
    uint64_t v7 = @"PAYMENT_DEVICE_UNAVAILABLE_MESSAGE";
  }
  uint64_t v8 = PKLocalizedPaymentString(&v7->isa);
  [(PKDashboardPassMessage *)v3 setMessage:v8];

  return v3;
}

- (id)_messageForRestrictedState
{
  id v2 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v2 setIdentifier:@"applicationState"];
  id v3 = PKLocalizedPaymentString(&cfstr_RestrictedMode.isa);
  [(PKDashboardPassMessage *)v2 setTitle:v3];

  BOOL v4 = PKLocalizedPaymentString(&cfstr_RestrictedMode_0.isa);
  [(PKDashboardPassMessage *)v2 setMessage:v4];

  return v2;
}

- (id)_messageForPeerPaymentZeroBalance
{
  id v2 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v2 setIdentifier:@"applicationState"];
  id v3 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_16.isa);
  [(PKDashboardPassMessage *)v2 setTitle:v3];

  BOOL v4 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_29.isa);
  [(PKDashboardPassMessage *)v2 setMessage:v4];

  uint64_t v5 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentAcc_30.isa);
  [(PKDashboardPassMessage *)v2 setButtonTitle:v5];

  [(PKDashboardPassMessage *)v2 setActionOnButtonPress:&__block_literal_global_95];
  [(PKDashboardPassMessage *)v2 setShowDisclosure:1];
  int v6 = PKPassKitUIBundle();
  uint64_t v7 = [v6 URLForResource:@"MessageError" withExtension:@"pdf"];
  double v8 = PKUIScreenScale();
  double v9 = PKUIImageFromPDF(v7, 45.0, 45.0, v8);
  [(PKDashboardPassMessage *)v2 setImage:v9];

  return v2;
}

void __53__PKPassFooterView__messageForPeerPaymentZeroBalance__block_invoke()
{
  if (PKRunningInViewService() && ([MEMORY[0x1E4F85128] isWalletRestricted] & 1) == 0)
  {
    PKPeerPaymentGetTopUpSensitiveURL();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    v0 = [MEMORY[0x1E4F62AF8] sharedService];
    id v1 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v1 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
    if (v2) {
      [v1 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F62678]];
    }
    [v0 openApplication:*MEMORY[0x1E4F87D30] options:v1 withResult:0];
  }
}

- (id)_messageForPeerPaymentLockedByOwner
{
  id v2 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v2 setIdentifier:@"applicationState"];
  id v3 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_9.isa);
  [(PKDashboardPassMessage *)v2 setTitle:v3];

  BOOL v4 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentDas_24.isa);
  [(PKDashboardPassMessage *)v2 setMessage:v4];

  uint64_t v5 = PKPassKitUIBundle();
  int v6 = [v5 URLForResource:@"MessageAlert" withExtension:@"pdf"];
  double v7 = PKUIScreenScale();
  double v8 = PKUIImageFromPDF(v6, 45.0, 45.0, v7);
  [(PKDashboardPassMessage *)v2 setImage:v8];

  return v2;
}

- (id)_messageForPaymentApplicationState
{
  id v3 = [(PKPassFooterViewConfiguration *)self->_configuration pass];
  if ([v3 passType] == 1) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = v4;
  char v6 = [v5 supportsBarcodePayment];
  if (PKNeedsLostModeExitAuth()) {
    uint64_t v7 = 7;
  }
  else {
    uint64_t v7 = [v5 effectiveContactlessPaymentApplicationState];
  }
  if (!PKPaymentApplicationStateIsPersonalized()) {
    goto LABEL_10;
  }
  double v8 = [v5 devicePrimaryContactlessPaymentApplication];
  if (v8
    || ([v5 deviceInAppPaymentApplications],
        double v8 = objc_claimAutoreleasedReturnValue(),
        ![v8 count]))
  {

LABEL_10:
    double v9 = 0;
    switch(v7)
    {
      case 2:
        double v9 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
        uint64_t v10 = PKLocalizedPaymentString(&cfstr_ActivatingTitl.isa);
        [(PKDashboardPassMessage *)v9 setTitle:v10];

        if (v6) {
          PKLocalizedAquamanString(&cfstr_ActivatingAcco_0.isa);
        }
        else {
        BOOL v15 = PKLocalizedPaymentString(&cfstr_ActivatingMess_0.isa);
        }
        goto LABEL_28;
      case 6:
        double v9 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
        if (v6)
        {
          id v16 = PKLocalizedAquamanString(&cfstr_PaymentAppErro_4.isa);
          [(PKDashboardPassMessage *)v9 setTitle:v16];

          BOOL v15 = [v3 organizationName];
          PKLocalizedAquamanString(&cfstr_PaymentAppSusp_3.isa, &stru_1EF1B4C70.isa, v15);
        }
        else
        {
          uint64_t v24 = PKLocalizedPaymentString(&cfstr_PaymentAppErro.isa);
          [(PKDashboardPassMessage *)v9 setTitle:v24];

          BOOL v15 = [v3 organizationName];
          PKLocalizedPaymentString(&cfstr_PaymentAppSusp_2.isa, &stru_1EF1B4C70.isa, v15);
        __int16 v25 = };
        [(PKDashboardPassMessage *)v9 setMessage:v25];
        goto LABEL_31;
      case 7:
        double v9 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
        id v17 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp.isa);
        [(PKDashboardPassMessage *)v9 setTitle:v17];

        id v18 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp_0.isa);
        [(PKDashboardPassMessage *)v9 setMessage:v18];

        id v19 = PKLocalizedPaymentString(&cfstr_PaymentAppSusp_1.isa);
        [(PKDashboardPassMessage *)v9 setButtonTitle:v19];

        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __54__PKPassFooterView__messageForPaymentApplicationState__block_invoke;
        v29[3] = &unk_1E59CA870;
        id v30 = v3;
        uint64_t v31 = self;
        [(PKDashboardPassMessage *)v9 setActionOnButtonPress:v29];
        [(PKDashboardPassMessage *)v9 setShowDisclosure:1];
        id v20 = PKPassKitUIBundle();
        id v21 = [v20 URLForResource:@"MessageAlert" withExtension:@"pdf"];
        double v22 = PKUIScreenScale();
        __int16 v23 = PKUIImageFromPDF(v21, 45.0, 45.0, v22);
        [(PKDashboardPassMessage *)v9 setImage:v23];

        goto LABEL_33;
      case 9:
        double v9 = objc_alloc_init(PKDashboardPassMessage);
        [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
        if (v6) {
          PKLocalizedAquamanString(&cfstr_PaymentAppErro_4.isa);
        }
        else {
        uint64_t v26 = PKLocalizedPaymentString(&cfstr_PaymentAppErro.isa);
        }
        [(PKDashboardPassMessage *)v9 setTitle:v26];

        BOOL v15 = [v5 localizedSuspendedReason];
        if (!v15) {
          goto LABEL_32;
        }
LABEL_28:
        [(PKDashboardPassMessage *)v9 setMessage:v15];
        goto LABEL_32;
      default:
        goto LABEL_33;
    }
  }
  char v11 = [v5 supportsBarcodePayment];

  if (v11) {
    goto LABEL_10;
  }
  id v12 = [v3 organizationName];

  if (v12)
  {
    id v13 = [v3 organizationName];
    dispatch_time_t v14 = objc_msgSend(v13, "pk_uppercaseStringForPreferredLocale");
    BOOL v15 = PKLocalizedPaymentString(&cfstr_PaymentSummary_0.isa, &stru_1EF1B4C70.isa, v14);
  }
  else
  {
    BOOL v15 = PKLocalizedPaymentString(&cfstr_PaymentSummary_1.isa);
  }
  double v9 = objc_alloc_init(PKDashboardPassMessage);
  [(PKDashboardPassMessage *)v9 setIdentifier:@"applicationState"];
  [(PKDashboardPassMessage *)v9 setTitle:v15];
  __int16 v25 = [v3 localizedDescription];
  id v27 = PKLocalizedPaymentString(&cfstr_PaymentAppNoCo.isa, &stru_1EF1B4C70.isa, v25);
  [(PKDashboardPassMessage *)v9 setMessage:v27];

LABEL_31:
LABEL_32:

LABEL_33:

  return v9;
}

void __54__PKPassFooterView__messageForPaymentApplicationState__block_invoke(uint64_t a1)
{
  if (PKRunningInViewService() && PKDeviceUILocked())
  {
    if (([MEMORY[0x1E4F85128] isWalletRestricted] & 1) == 0)
    {
      id v5 = [MEMORY[0x1E4F62AF8] sharedService];
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F62688]];
      BOOL v4 = [*(id *)(a1 + 32) passURL];
      [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F62678]];

      [v5 openApplication:*MEMORY[0x1E4F87D30] options:v3 withResult:0];
    }
  }
  else
  {
    id v2 = *(void **)(a1 + 40);
    [v2 _lostModeButtonTapped];
  }
}

- (PKPassFooterViewConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)isPhysicalButtonRequired
{
  return self->_physicalButtonRequired;
}

- (int64_t)coachingState
{
  return self->_coachingState;
}

- (PKPassFooterViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassFooterViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_informativeAssertion, 0);
  objc_storeStrong((id *)&self->_sessionHandle, 0);
  objc_storeStrong((id *)&self->_sessionDelayGroup, 0);
  objc_storeStrong((id *)&self->_sessionStartTimer, 0);
  objc_storeStrong((id *)&self->_fadingContentView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end