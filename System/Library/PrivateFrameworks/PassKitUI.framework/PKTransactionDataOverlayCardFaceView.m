@interface PKTransactionDataOverlayCardFaceView
+ (double)borderWidth;
+ (id)borderColor;
- (BOOL)isContentSuppressed;
- (BOOL)isMotionEnabled;
- (BOOL)isPaused;
- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4;
- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5;
- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5 fetchInitialContentSynchronously:(BOOL)a6;
- (id)rendererState;
- (void)_updateContentIfPossible;
- (void)_updateMagnitudesWithStyle:(int64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)invalidate;
- (void)layoutSubviews;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4;
- (void)setContentSuppressed:(BOOL)a3;
- (void)setMotionEnabled:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
@end

@implementation PKTransactionDataOverlayCardFaceView

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5 fetchInitialContentSynchronously:(BOOL)a6
{
  BOOL v47 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v59[8] = *MEMORY[0x1E4F143B8];
  id v51 = a4;
  id v52 = a5;
  v56.receiver = self;
  v56.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  v13 = -[PKTransactionDataOverlayCardFaceView initWithFrame:](&v56, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    p_pass = (id *)&v13->_pass;
    objc_storeStrong((id *)&v13->_pass, a4);
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F84C38]) initWithDelegate:v14];
    paymentService = v14->_paymentService;
    v14->_paymentService = (PKPaymentService *)v15;

    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [(PKTransactionDataOverlayCardFaceView *)v14 setBackgroundColor:v17];

    v18 = [(PKTransactionDataOverlayCardFaceView *)v14 layer];
    PKPassFrontFaceContentSize();
    [(id)objc_opt_class() borderWidth];
    id v19 = [(id)objc_opt_class() borderColor];
    [v19 CGColor];
    PKPaymentStyleApplyCorners();

    v14->_contentSuppressed = PKDeviceLocked();
    id v20 = objc_alloc(MEMORY[0x1E4F88118]);
    [(PKTransactionDataOverlayCardFaceView *)v14 bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    overlayView = v14->_overlayView;
    v14->_overlayView = (PKCategoryVisualizationCardView *)v21;

    [(PKCategoryVisualizationCardView *)v14->_overlayView setBlurDisabled:PKBroadwayDisableDynamicCardBlur()];
    v48 = v14->_overlayView;
    v50 = PKBrightColorForMerchantCategory(0);
    v59[0] = v50;
    v23 = PKBrightColorForMerchantCategory(1);
    v59[1] = v23;
    v24 = PKBrightColorForMerchantCategory(2);
    v59[2] = v24;
    v25 = PKBrightColorForMerchantCategory(3);
    v59[3] = v25;
    v26 = PKBrightColorForMerchantCategory(4);
    v59[4] = v26;
    v27 = PKBrightColorForMerchantCategory(5);
    v59[5] = v27;
    v28 = PKBrightColorForMerchantCategory(6);
    v59[6] = v28;
    v29 = PKBrightColorForMerchantCategory(7);
    v59[7] = v29;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:8];
    [(PKCategoryVisualizationCardView *)v48 setBucketColors:v30];

    [(PKTransactionDataOverlayCardFaceView *)v14 addSubview:v14->_overlayView];
    v31 = [(PKPass *)v14->_pass liveRenderedImageSet];
    if (v14->_contentSuppressed)
    {

      id v32 = 0;
    }
    else
    {
      id v32 = v52;
    }
    id v52 = v32;
    [(PKCategoryVisualizationCardView *)v14->_overlayView renderWithTextures:v31 rendererState:432];
    if (!v14->_contentSuppressed)
    {
      if (v52 || !v47)
      {
        [(PKTransactionDataOverlayCardFaceView *)v14 _updateMagnitudesWithStyle:0 completion:0];
      }
      else
      {
        v33 = v14->_overlayView;
        v34 = *(Class *)((char *)&v14->super.super.super.isa + v46);
        v35 = [*p_pass uniqueID];
        v36 = [v34 categoryVisualizationMagnitudesForPassUniqueID:v35];
        [(PKCategoryVisualizationCardView *)v33 setMagnitudes:v36 withStyle:0];
      }
    }
    p_unlockNotifyToken = &v14->_unlockNotifyToken;
    v14->_unlockNotifyToken = -1;
    v38 = +[PKUIForegroundActiveArbiter sharedInstance];
    v39 = v38;
    if (v38)
    {
      v14->_foregroundActive = ((unsigned __int16)[v38 registerObserver:v14] >> 8) & 1;
    }
    else
    {
      v14->_foregroundActive = 1;
      if (v14->_contentSuppressed)
      {
        objc_initWeak(&location, v14);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __106__PKTransactionDataOverlayCardFaceView_initWithFrame_pass_rendererState_fetchInitialContentSynchronously___block_invoke;
        aBlock[3] = &unk_1E59CBA90;
        objc_copyWeak(&v54, &location);
        v40 = _Block_copy(aBlock);
        v41 = (const char *)*MEMORY[0x1E4F78160];
        v42 = MEMORY[0x1E4F14428];
        id v43 = MEMORY[0x1E4F14428];
        LODWORD(v41) = notify_register_dispatch(v41, &v14->_unlockNotifyToken, v42, v40);

        if (v41)
        {
          v44 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v58 = v14;
            _os_log_impl(&dword_19F450000, v44, OS_LOG_TYPE_DEFAULT, "PKTransactionDataOverlayCardFaceView (%p): failed to register for unlock notification.", buf, 0xCu);
          }

          if (*p_unlockNotifyToken != -1)
          {
            notify_cancel(*p_unlockNotifyToken);
            int *p_unlockNotifyToken = -1;
          }
        }

        objc_destroyWeak(&v54);
        objc_destroyWeak(&location);
      }
    }
  }
  return v14;
}

+ (id)borderColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.21];
}

- (void)setMotionEnabled:(BOOL)a3
{
}

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4 rendererState:(id)a5
{
  return -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:fetchInitialContentSynchronously:](self, "initWithFrame:pass:rendererState:fetchInitialContentSynchronously:", a4, a5, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setPaused:(BOOL)a3
{
}

+ (double)borderWidth
{
  return PKUIPixelLength() * 3.0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  [(PKTransactionDataOverlayCardFaceView *)&v4 layoutSubviews];
  overlayView = self->_overlayView;
  [(PKTransactionDataOverlayCardFaceView *)self bounds];
  -[PKCategoryVisualizationCardView setFrame:](overlayView, "setFrame:");
}

- (PKTransactionDataOverlayCardFaceView)initWithFrame:(CGRect)a3 pass:(id)a4
{
  return -[PKTransactionDataOverlayCardFaceView initWithFrame:pass:rendererState:](self, "initWithFrame:pass:rendererState:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

void __106__PKTransactionDataOverlayCardFaceView_initWithFrame_pass_rendererState_fetchInitialContentSynchronously___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateContentIfPossible];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  [(PKTransactionDataOverlayCardFaceView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKTransactionDataOverlayCardFaceView;
  [(PKTransactionDataOverlayCardFaceView *)&v3 dealloc];
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    objc_super v3 = +[PKUIForegroundActiveArbiter sharedInstance];
    [v3 unregisterObserver:self];

    [(PKCategoryVisualizationCardView *)self->_overlayView invalidate];
    [(PKPaymentService *)self->_paymentService setDelegate:0];
    paymentService = self->_paymentService;
    self->_paymentService = 0;

    int unlockNotifyToken = self->_unlockNotifyToken;
    if (unlockNotifyToken != -1)
    {
      notify_cancel(unlockNotifyToken);
      self->_int unlockNotifyToken = -1;
    }
  }
}

- (void)setContentSuppressed:(BOOL)a3
{
  if (((!self->_contentSuppressed ^ a3) & 1) == 0)
  {
    self->_contentSuppressed = a3;
    if (a3) {
      [(PKCategoryVisualizationCardView *)self->_overlayView setMagnitudes:0 withStyle:2];
    }
    else {
      [(PKTransactionDataOverlayCardFaceView *)self _updateContentIfPossible];
    }
  }
}

- (BOOL)isMotionEnabled
{
  return [(PKCategoryVisualizationCardView *)self->_overlayView isMotionEnabled];
}

- (BOOL)isPaused
{
  return [(PKCategoryVisualizationCardView *)self->_overlayView isPaused];
}

- (id)rendererState
{
  return (id)[(PKCategoryVisualizationCardView *)self->_overlayView rendererState];
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateCategoryVisualizationWithStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(PKPass *)self->_pass uniqueID];
  id v10 = v6;
  id v8 = v7;
  if (v8 == v10)
  {

    goto LABEL_7;
  }
  if (!v10 || !v8)
  {

    goto LABEL_9;
  }
  int v9 = [v10 isEqualToString:v8];

  if (v9) {
LABEL_7:
  }
    [(PKTransactionDataOverlayCardFaceView *)self _updateMagnitudesWithStyle:a4 completion:0];
LABEL_9:
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  BOOL v4 = (*(void *)&a4.var0 >> 8) & 1;
  if (self->_foregroundActive != v4)
  {
    self->_foregroundActive = v4;
    [(PKTransactionDataOverlayCardFaceView *)self _updateContentIfPossible];
  }
}

- (void)_updateContentIfPossible
{
  if (self->_foregroundActive)
  {
    if (!self->_contentSuppressed || (char v3 = PKDeviceLocked(), self->_contentSuppressed = v3, (v3 & 1) == 0))
    {
      int unlockNotifyToken = self->_unlockNotifyToken;
      if (unlockNotifyToken != -1)
      {
        notify_cancel(unlockNotifyToken);
        self->_int unlockNotifyToken = -1;
      }
    }
    [(PKTransactionDataOverlayCardFaceView *)self _updateMagnitudesWithStyle:0 completion:0];
  }
}

- (void)_updateMagnitudesWithStyle:(int64_t)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (self->_paymentService && !self->_contentSuppressed)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v15 = self;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "PKTransactionDataOverlayCardFaceView (%p): fetching magnitudes.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    paymentService = self->_paymentService;
    id v10 = [(PKPass *)self->_pass uniqueID];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke;
    v11[3] = &unk_1E59CBAE0;
    objc_copyWeak(v13, (id *)buf);
    v13[1] = (id)a3;
    id v12 = v7;
    [(PKPaymentService *)paymentService categoryVisualizationMagnitudesForPassUniqueID:v10 completion:v11];

    objc_destroyWeak(v13);
    objc_destroyWeak((id *)buf);
  }
  else if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

void __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke_2;
  v6[3] = &unk_1E59CBAB8;
  objc_copyWeak(v9, (id *)(a1 + 40));
  BOOL v4 = *(void **)(a1 + 48);
  id v7 = v3;
  v9[1] = v4;
  id v8 = *(id *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v9);
}

void __78__PKTransactionDataOverlayCardFaceView__updateMagnitudesWithStyle_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[53] setMagnitudes:*(void *)(a1 + 32) withStyle:*(void *)(a1 + 56)];
    id v3 = v5;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
    id v3 = v5;
  }
}

- (BOOL)isContentSuppressed
{
  return self->_contentSuppressed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentService, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end