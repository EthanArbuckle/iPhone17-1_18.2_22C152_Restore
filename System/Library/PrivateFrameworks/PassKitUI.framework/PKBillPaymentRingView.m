@interface PKBillPaymentRingView
- (BOOL)_isAmount:(id)a3 withinRoundingUnitOfAmount:(id)a4;
- (BOOL)_preferredPausedState;
- (BOOL)_setDisplayAmount:(id)a3;
- (BOOL)_updateEffectiveDisplayAmount;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isSmall;
- (CGPoint)_center;
- (CGPoint)_centerPointAtAngle:(double)a3 adjustToCover:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDecimalNumber)amount;
- (PKBillPaymentRingView)init;
- (PKBillPaymentRingView)initWithFrame:(CGRect)a3;
- (PKBillPaymentRingView)initWithSuggestedAmountList:(id)a3 delegate:(id)a4 dataSource:(id)a5;
- (PKBillPaymentRingViewDataSource)dataSource;
- (PKBillPaymentRingViewDelegate)delegate;
- (PKEnterCurrencyAmountView)enterCurrencyAmountView;
- (UIColor)currentEndColor;
- (UIColor)currentStartColor;
- (double)_amountLabelMaximumFontSize;
- (double)_angleForAmount:(id)a3;
- (double)_angleForAngleIndex:(unint64_t)a3;
- (double)_angleForPosition:(CGPoint)a3;
- (double)_angleForRecognizer:(id)a3;
- (double)_offsetAngle:(double)a3;
- (double)_offsetCurrentAngle;
- (double)_ringWidth;
- (double)targetAngle;
- (id)_blendFromGradientState:(id)a3 toState:(id)a4 withProgress:(double)a5;
- (id)_gradientStateForSuggestedAmount:(id)a3;
- (id)_roundedAmountForAngle:(double)a3;
- (id)_stickySuggestedAmountForCurrentAngle;
- (id)_suggestedAmountForAngleIndex:(unint64_t)a3;
- (id)_suggestedAmountImageForSuggestedAmount:(id)a3;
- (id)_targetGradientStateForAngle:(double)a3;
- (unint64_t)_segmentEndAngleIndexForAngle:(double)a3;
- (unint64_t)_unnormalizedAngleIndexForAngle:(double)a3;
- (void)_createStandardColors;
- (void)_createSuggestedAmountAngles;
- (void)_createSuggestedAmountRingColorStops;
- (void)_createSuggestedAmountsImageDictionary;
- (void)_dragEnded:(id)a3;
- (void)_dragMoved:(id)a3;
- (void)_dragMovedToAngle:(double)a3 normalizedRadius:(double)a4;
- (void)_dragRecognizerChanged:(id)a3;
- (void)_dragStarted:(id)a3;
- (void)_pauseRenderLoop;
- (void)_pressRecognized:(id)a3;
- (void)_setDotsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setHighlightedSuggestedAmount:(id)a3;
- (void)_setResponse:(double)a3;
- (void)_setSelectedSuggestedAmount:(id)a3;
- (void)_tapRecognized:(id)a3;
- (void)_updateCurvedText;
- (void)_updateForEnabledState;
- (void)_updateHandleImage;
- (void)_updateHandleState;
- (void)_updateInitialDisplayState;
- (void)_updateInterestText;
- (void)_updatePausedState;
- (void)completeInitialDisplayAnimated:(BOOL)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)didUpdateAngleSpringPosition;
- (void)didUpdateAngleSpringTarget;
- (void)didUpdateScaleSpringPosition;
- (void)layoutSubviews;
- (void)prepareForInitialDisplayWithAmount:(id)a3;
- (void)renderLoop:(id)a3 drawAtTime:(double)a4;
- (void)setAmount:(id)a3 animated:(BOOL)a4;
- (void)setAmount:(id)a3 animated:(BOOL)a4 userInitiatedWithKeypad:(BOOL)a5;
- (void)setAngle:(double)a3 animated:(BOOL)a4 forExplicitAmount:(id)a5 userInitiatedWithRing:(BOOL)a6 userInitiatedWithKeypad:(BOOL)a7;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHandleScale:(double)a3 animated:(BOOL)a4;
- (void)setIsSmall:(BOOL)a3;
@end

@implementation PKBillPaymentRingView

- (PKBillPaymentRingView)init
{
  return 0;
}

- (PKBillPaymentRingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKBillPaymentRingView)initWithSuggestedAmountList:(id)a3 delegate:(id)a4 dataSource:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v85.receiver = self;
  v85.super_class = (Class)PKBillPaymentRingView;
  v12 = -[PKBillPaymentRingView initWithFrame:](&v85, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v13 = v12;
  if (v12)
  {
    id v76 = v9;
    v12->_enabled = 1;
    v12->_needsInitialDisplay = 1;
    objc_storeStrong((id *)&v12->_suggestedAmountList, a3);
    id v78 = v10;
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeWeak((id *)&v13->_dataSource, v11);
    v13->_pinnedAmountAngleIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_dragCapture = 0;
    [(PKBillPaymentRingView *)v13 _createSuggestedAmountsImageDictionary];
    [(PKBillPaymentRingView *)v13 _createSuggestedAmountAngles];
    [(PKBillPaymentRingView *)v13 _createStandardColors];
    [(PKBillPaymentRingView *)v13 _createSuggestedAmountRingColorStops];
    v14 = objc_alloc_init(PKRingGradientView);
    ringView = v13->_ringView;
    v13->_ringView = v14;

    v16 = v13->_ringView;
    v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(PKRingGradientView *)v16 setStrokeColor:v17];

    v18 = v13->_ringView;
    v19 = [MEMORY[0x1E4FB1618] systemGray5Color];
    [(PKRingGradientView *)v18 setFillColor:v19];

    [(PKRingGradientView *)v13->_ringView setMinimumAngle:0.523598776];
    v20 = objc_alloc_init(PKBillPaymentCircularView);
    handleView = v13->_handleView;
    v13->_handleView = v20;

    v22 = [PKEnterCurrencyAmountView alloc];
    p_suggestedAmountList = (id *)&v13->_suggestedAmountList;
    v23 = [(PKBillPaymentSuggestedAmountList *)v13->_suggestedAmountList currencyCode];
    v24 = [(PKBillPaymentRingView *)v13 _roundedAmountForAngle:0.0];
    uint64_t v25 = [(PKEnterCurrencyAmountView *)v22 initWithCurrency:v23 amount:v24];
    enterCurrencyAmountView = v13->_enterCurrencyAmountView;
    v13->_enterCurrencyAmountView = (PKEnterCurrencyAmountView *)v25;

    [(PKEnterCurrencyAmountView *)v13->_enterCurrencyAmountView setShowsDecimalPointButton:1];
    [(PKEnterCurrencyAmountView *)v13->_enterCurrencyAmountView setKerning:&unk_1EF2B88A0];
    [(PKEnterCurrencyAmountView *)v13->_enterCurrencyAmountView setIgnoreIntegralNumber:1];
    [(PKEnterCurrencyAmountView *)v13->_enterCurrencyAmountView sizeToFit];
    v27 = objc_alloc_init(PKCurvedTextLabel);
    topCurvedTextLabel = v13->_topCurvedTextLabel;
    v13->_topCurvedTextLabel = v27;

    [(PKCurvedTextLabel *)v13->_topCurvedTextLabel setBaselineAdjustment:1];
    [(PKCurvedTextLabel *)v13->_topCurvedTextLabel setInterior:0];
    [(PKCurvedTextLabel *)v13->_topCurvedTextLabel setAccessibilityIdentifier:*MEMORY[0x1E4F852E0]];
    v29 = objc_alloc_init(PKCurvedTextLabel);
    bottomCurvedTextLabel = v13->_bottomCurvedTextLabel;
    v13->_bottomCurvedTextLabel = v29;

    [(PKCurvedTextLabel *)v13->_bottomCurvedTextLabel setBaselineAdjustment:1];
    [(PKCurvedTextLabel *)v13->_bottomCurvedTextLabel setInterior:1];
    [(PKCurvedTextLabel *)v13->_bottomCurvedTextLabel setAccessibilityIdentifier:*MEMORY[0x1E4F852D8]];
    v31 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    interestLabel = v13->_interestLabel;
    v13->_interestLabel = v31;

    [(UILabel *)v13->_interestLabel setBaselineAdjustment:1];
    [(UILabel *)v13->_interestLabel setTextAlignment:1];
    [(UILabel *)v13->_interestLabel setNumberOfLines:1];
    [(UILabel *)v13->_interestLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85630]];
    [(PKBillPaymentRingView *)v13 addSubview:v13->_ringView];
    [(PKBillPaymentRingView *)v13 addSubview:v13->_interestLabel];
    [(PKBillPaymentRingView *)v13 addSubview:v13->_enterCurrencyAmountView];
    [(PKBillPaymentRingView *)v13 addSubview:v13->_topCurvedTextLabel];
    [(PKBillPaymentRingView *)v13 addSubview:v13->_bottomCurvedTextLabel];
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v34 = v13->_suggestedAmountAngles;
    uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v81 objects:v86 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v82 != v37) {
            objc_enumerationMutation(v34);
          }
          v39 = -[NSDictionary objectForKeyedSubscript:](v13->_suggestedAmountsForAngle, "objectForKeyedSubscript:", *(void *)(*((void *)&v81 + 1) + 8 * i), v76);
          if (v39)
          {
            v40 = [[PKBillPaymentSuggestedAmountView alloc] initWithSuggestedAmount:v39];
            [v33 addObject:v40];
            [(PKBillPaymentRingView *)v13 addSubview:v40];
          }
        }
        uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v81 objects:v86 count:16];
      }
      while (v36);
    }

    uint64_t v41 = [v33 copy];
    suggestedAmountViews = v13->_suggestedAmountViews;
    v13->_suggestedAmountViews = (NSArray *)v41;

    [(PKBillPaymentRingView *)v13 addSubview:v13->_handleView];
    uint64_t v43 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v13 action:sel__tapRecognized_];
    tapRecognizer = v13->_tapRecognizer;
    v13->_tapRecognizer = (UITapGestureRecognizer *)v43;

    [(UITapGestureRecognizer *)v13->_tapRecognizer setDelegate:v13];
    [(PKBillPaymentRingView *)v13 addGestureRecognizer:v13->_tapRecognizer];
    uint64_t v45 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v13 action:sel__pressRecognized_];
    pressRecognizer = v13->_pressRecognizer;
    v13->_pressRecognizer = (UILongPressGestureRecognizer *)v45;

    [(UILongPressGestureRecognizer *)v13->_pressRecognizer setMinimumPressDuration:0.0];
    [(UILongPressGestureRecognizer *)v13->_pressRecognizer setDelegate:v13];
    [(PKBillPaymentRingView *)v13 addGestureRecognizer:v13->_pressRecognizer];
    uint64_t v47 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v13 action:sel__dragRecognizerChanged_];
    dragRecognizer = v13->_dragRecognizer;
    v13->_dragRecognizer = (UIPanGestureRecognizer *)v47;

    [(UIPanGestureRecognizer *)v13->_dragRecognizer setDelegate:v13];
    [(PKBillPaymentRingView *)v13 addGestureRecognizer:v13->_dragRecognizer];
    [(UITapGestureRecognizer *)v13->_tapRecognizer requireGestureRecognizerToFail:v13->_dragRecognizer];
    p_mass = &v13->_spring.mass;
    if (v13->_spring.mass != 1.0)
    {
      double *p_mass = 1.0;
      v13->_spring.dirty = 1;
    }
    v50 = &v13->_responseSpring.mass;
    if (v13->_responseSpring.mass != 1.0)
    {
      double *v50 = 1.0;
      v13->_responseSpring.dirty = 1;
    }
    id v10 = v78;
    if (v13->_scaleSpring.mass != 1.0)
    {
      v13->_scaleSpring.mass = 1.0;
      v13->_scaleSpring.dirty = 1;
    }
    double v51 = *p_mass;
    double stiffness = v13->_spring.stiffness;
    double v53 = *p_mass * 322.272797;
    if (stiffness != v53)
    {
      v13->_spring.double stiffness = v53;
      v13->_spring.dirty = 1;
      double stiffness = v53;
    }
    double v54 = sqrt(v51 * stiffness);
    double v55 = v54 + v54;
    if (v13->_spring.damping != v55)
    {
      v13->_spring.damping = v55;
      v13->_spring.dirty = 1;
    }
    double v56 = *v50;
    double v57 = v13->_responseSpring.stiffness;
    double v58 = *v50 * 3947.84176;
    if (v57 != v58)
    {
      v13->_responseSpring.double stiffness = v58;
      v13->_responseSpring.dirty = 1;
      double v57 = v58;
    }
    double v59 = sqrt(v56 * v57);
    double v60 = v59 + v59;
    if (v13->_responseSpring.damping != v60)
    {
      v13->_responseSpring.damping = v60;
      v13->_responseSpring.dirty = 1;
    }
    if (v13->_scaleSpring.stiffness != 631.654682)
    {
      v13->_scaleSpring.double stiffness = 631.654682;
      v13->_scaleSpring.dirty = 1;
    }
    if (v13->_scaleSpring.damping != 50.2654825)
    {
      v13->_scaleSpring.damping = 50.2654825;
      v13->_scaleSpring.dirty = 1;
    }
    *(int64x2_t *)&v13->_responseState.positionThreshold = vdupq_n_s64(0x3F40624DD2F1A9FCuLL);
    int64x2_t v61 = vdupq_n_s64(0x3F916872B020C49CuLL);
    *(int64x2_t *)&v13->_angleState.positionThreshold = v61;
    *(int64x2_t *)&v13->_scaleState.positionThreshold = v61;
    v62 = (PKRenderLoop *)objc_alloc_init(MEMORY[0x1E4F88158]);
    renderLoop = v13->_renderLoop;
    v13->_renderLoop = v62;

    [(PKRenderLoop *)v13->_renderLoop setDelegate:v13];
    [(PKRenderLoop *)v13->_renderLoop setPaused:1];
    LODWORD(v64) = 1117782016;
    LODWORD(v65) = 1123024896;
    LODWORD(v66) = 1123024896;
    -[PKRenderLoop setPreferredFrameRateRange:](v13->_renderLoop, "setPreferredFrameRateRange:", v64, v65, v66);
    v67 = [(PKBillPaymentRingView *)v13 traitCollection];
    uint64_t v68 = [v67 userInterfaceIdiom];

    if (!v68) {
      [(PKRenderLoop *)v13->_renderLoop setHighFrameRateReason:2162690];
    }
    v69 = (void *)MEMORY[0x1E4FB1EB0];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __73__PKBillPaymentRingView_initWithSuggestedAmountList_delegate_dataSource___block_invoke;
    v79[3] = &unk_1E59CA7D0;
    v70 = v13;
    v80 = v70;
    [v69 performWithoutAnimation:v79];
    [(PKBillPaymentRingView *)v70 setOpaque:0];
    v71 = [*p_suggestedAmountList minimumAmount];
    v72 = [*p_suggestedAmountList remainingStatementAmount];
    v73 = [*p_suggestedAmountList sortedSuggestedAmounts];
    if ([v73 count] == 1 && v71 && v72)
    {
      int v74 = PKEqualObjects();

      id v9 = v76;
      if (v74) {
        v70->_ignoreTouches = 1;
      }
    }
    else
    {

      id v9 = v76;
    }
  }
  return v13;
}

uint64_t __73__PKBillPaymentRingView_initWithSuggestedAmountList_delegate_dataSource___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) didUpdateAngleSpringTarget];
  [*(id *)(a1 + 32) didUpdateAngleSpringPosition];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2 + 880;
    *(void *)uint64_t v3 = 0;
    if (!*(unsigned char *)(v3 + 40) && *(double *)(v3 + 8) != 0.0) {
      *(unsigned char *)(v3 + 40) = 1;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4 && *(unsigned char *)(v4 + 920))
    {
      *(unsigned char *)(v4 + 920) = 0;
      *(void *)(v4 + 888) = *(void *)(v4 + 880);
      *(void *)(v4 + 896) = 0;
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  [(id)v4 didUpdateScaleSpringPosition];
  [*(id *)(a1 + 32) setAngle:0 animated:0 forExplicitAmount:0 userInitiatedWithRing:0 userInitiatedWithKeypad:0.523598776];
  v5 = *(void **)(a1 + 32);

  return [v5 _updateForEnabledState];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PKRenderLoop *)self->_renderLoop invalidate];
  v4.receiver = self;
  v4.super_class = (Class)PKBillPaymentRingView;
  [(PKBillPaymentRingView *)&v4 dealloc];
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)PKBillPaymentRingView;
  [(PKBillPaymentRingView *)&v6 didMoveToWindow];
  uint64_t v3 = [(PKBillPaymentRingView *)self window];
  renderLoop = self->_renderLoop;
  v5 = [v3 windowScene];
  [(PKRenderLoop *)renderLoop attachToWindowScene:v5];
}

- (void)layoutSubviews
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  v127.receiver = self;
  v127.super_class = (Class)PKBillPaymentRingView;
  id v3 = [(PKBillPaymentRingView *)&v127 layoutSubviews];
  context = (void *)MEMORY[0x1A6224460](v3);
  [(PKBillPaymentRingView *)self bounds];
  double v112 = v5;
  double v113 = v4;
  PKSizeAlignedInRect();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(PKRingGradientView *)self->_ringView frame];
  v135.origin.x = v14;
  v135.origin.y = v15;
  v135.size.width = v16;
  v135.size.height = v17;
  v130.origin.x = v7;
  CGFloat v116 = v9;
  CGFloat v117 = v13;
  v130.origin.y = v9;
  v130.size.width = v11;
  v130.size.height = v13;
  BOOL v18 = CGRectEqualToRect(v130, v135);
  if (!v18)
  {
    -[PKRingGradientView setFrame:](self->_ringView, "setFrame:", v7, v9, v11, v13);
    [(PKRingGradientView *)self->_ringView setNeedsDisplay];
  }
  [(PKBillPaymentRingView *)self _ringWidth];
  double v20 = v19;
  double v21 = v11 + v19 * -2.0 + -20.0;
  if (v21 >= 0.0) {
    double v22 = v21;
  }
  else {
    double v22 = 0.0;
  }
  double v118 = v11;
  double v23 = v11 - v20;
  CGFloat v115 = v7;
  double v111 = v11 - v20;
  if (!v18)
  {
    [(PKBillPaymentRingView *)self _amountLabelMaximumFontSize];
    double v25 = v24;
    double v26 = *MEMORY[0x1E4FB09D0];
    v27 = PKRoundedSystemFontOfSizeAndWeight(v24, *MEMORY[0x1E4FB09D0]);
    v28 = objc_msgSend(v27, "pk_fixedWidthFont");

    v29 = PKRoundedSystemFontOfSizeAndWeight(v25 * 0.5, v26);
    v30 = objc_msgSend(v29, "pk_fixedWidthFont");

    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAmountFont:v28];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrencySymbolFont:v30];
    v31 = [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView currentAmount];
    enterCurrencyAmountView = self->_enterCurrencyAmountView;
    id v33 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList maximumAmount];
    [(PKEnterCurrencyAmountView *)enterCurrencyAmountView setCurrentAmount:v33];

    -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
    double v35 = fmax(v25 * fmin(v22 / v34, 1.0), 12.0);
    uint64_t v36 = PKRoundedSystemFontOfSizeAndWeight(v35, v26);
    uint64_t v37 = objc_msgSend(v36, "pk_fixedWidthFont");

    v38 = PKRoundedSystemFontOfSizeAndWeight(v35 * 0.5, v26);
    v39 = objc_msgSend(v38, "pk_fixedWidthFont");

    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAmountFont:v37];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrencySymbolFont:v39];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrentAmount:v31];
    -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
    double v41 = v40;
    double v42 = v23 * 0.5;
    uint64_t v43 = PKRoundedSystemFontOfSizeAndWeight(fmax(fmin(v23 * 0.5 * 0.096, 13.0), 2.0), *MEMORY[0x1E4FB09C8]);
    [(PKCurvedTextLabel *)self->_topCurvedTextLabel setFont:v43];
    [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setFont:v43];
    long double v44 = acos(1.0 - (v42 - (v41 * 0.5 + 10.0)) / v42);
    long double v45 = sin((v44 + v44) * 0.5);
    v46 = PKRoundedSystemFontOfSizeAndWeight(fmax(fmin((v42 + v42) * v45 * 0.0856, 22.0), 2.0), v26);
    uint64_t v47 = objc_msgSend(v46, "pk_fixedWidthFont");

    [(UILabel *)self->_interestLabel setFont:v47];
  }
  -[PKBillPaymentCircularView sizeThatFits:](self->_handleView, "sizeThatFits:", v20, v20);
  double v48 = *MEMORY[0x1E4F1DAD8];
  double v49 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[PKBillPaymentCircularView setBounds:](self->_handleView, "setBounds:", *MEMORY[0x1E4F1DAD8], v49, v50, v51);
  handleView = self->_handleView;
  [(PKBillPaymentRingView *)self _offsetCurrentAngle];
  -[PKBillPaymentRingView _centerPointAtAngle:adjustToCover:](self, "_centerPointAtAngle:adjustToCover:", 0);
  -[PKBillPaymentCircularView setCenter:](handleView, "setCenter:");
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView frame];
  -[PKEnterCurrencyAmountView sizeThatFits:](self->_enterCurrencyAmountView, "sizeThatFits:", v22, 1.79769313e308);
  PKRectCenteredXInRect();
  PKRectCenteredYInRect();
  CGFloat v54 = v53;
  CGFloat v56 = v55;
  CGFloat v58 = v57;
  CGFloat v60 = v59;
  BOOL isSmall = self->_isSmall;
  -[PKEnterCurrencyAmountView setBounds:](self->_enterCurrencyAmountView, "setBounds:", v48, v49);
  v62 = self->_enterCurrencyAmountView;
  v131.origin.x = v54;
  v131.origin.y = v56;
  v131.size.width = v58;
  v131.size.height = v60;
  double MidX = CGRectGetMidX(v131);
  v132.origin.x = v54;
  v132.origin.y = v56;
  CGFloat v110 = v60;
  v132.size.width = v58;
  v132.size.height = v60;
  -[PKEnterCurrencyAmountView setCenter:](v62, "setCenter:", MidX, CGRectGetMidY(v132));
  double v64 = self->_enterCurrencyAmountView;
  if (isSmall)
  {
    CGFloat v65 = 0.00001;
    double v66 = (CGAffineTransform *)v126;
    v67 = (CGAffineTransform *)v126;
    CGFloat v68 = 0.00001;
  }
  else
  {
    double v66 = &v125;
    v67 = &v125;
    CGFloat v65 = 1.0;
    CGFloat v68 = 1.0;
  }
  CGAffineTransformMakeScale(v67, v65, v68);
  [(PKEnterCurrencyAmountView *)v64 setTransform:v66];
  [(PKCurvedTextLabel *)self->_topCurvedTextLabel frame];
  v69 = [(PKCurvedTextLabel *)self->_topCurvedTextLabel text];
  v70 = [(PKCurvedTextLabel *)self->_topCurvedTextLabel textAttributes];
  [v69 sizeWithAttributes:v70];
  double v72 = v71;

  double v109 = v118 * 0.5 - v20;
  [(PKCurvedTextLabel *)self->_topCurvedTextLabel setCircleRadius:v109 - v72 * 0.5 + -7.0];
  -[PKCurvedTextLabel sizeThatFits:](self->_topCurvedTextLabel, "sizeThatFits:", v113, v112);
  PKRectCenteredXInRect();
  -[PKCurvedTextLabel setFrame:](self->_topCurvedTextLabel, "setFrame:");
  [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel frame];
  v73 = [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel text];
  int v74 = [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel textAttributes];
  [v73 sizeWithAttributes:v74];
  double v76 = v75;

  [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setCircleRadius:v109 - v76 * 0.5 + -7.0];
  -[PKCurvedTextLabel sizeThatFits:](self->_bottomCurvedTextLabel, "sizeThatFits:", v113, v112);
  v133.origin.x = v115;
  v133.origin.y = v116;
  v133.size.width = v118;
  v133.size.height = v117;
  CGRectGetMaxY(v133);
  PKRectCenteredXInRect();
  -[PKCurvedTextLabel setFrame:](self->_bottomCurvedTextLabel, "setFrame:");
  [(UILabel *)self->_interestLabel frame];
  -[UILabel sizeThatFits:](self->_interestLabel, "sizeThatFits:", v111, 3.40282347e38);
  v134.origin.y = v56;
  v134.origin.x = v54;
  v134.size.height = v110;
  v134.size.width = v58;
  CGRectGetMaxY(v134);
  PKRectCenteredXInRect();
  -[UILabel setFrame:](self->_interestLabel, "setFrame:");
  if (self->_dotsVisible)
  {
    BOOL v77 = self->_isSmall;
    memset(&v124.c, 0, 32);
    if (v77) {
      double v78 = 0.0;
    }
    else {
      double v78 = 1.0;
    }
    *(_OWORD *)&v124.a = 0uLL;
    if (!v77)
    {
      long long v79 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v124.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v124.c = v79;
      *(_OWORD *)&v124.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      goto LABEL_19;
    }
  }
  else
  {
    memset(&v124, 0, sizeof(v124));
    double v78 = 0.0;
  }
  CGAffineTransformMakeScale(&v124, 0.00001, 0.00001);
LABEL_19:
  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  v80 = self->_suggestedAmountViews;
  uint64_t v81 = [(NSArray *)v80 countByEnumeratingWithState:&v120 objects:v128 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v82; ++i)
      {
        if (*(void *)v121 != v83) {
          objc_enumerationMutation(v80);
        }
        objc_super v85 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        v86 = [v85 suggestedAmount];
        uint64_t v87 = [v86 amount];
        [(PKBillPaymentRingView *)self _angleForAmount:v87];
        -[PKBillPaymentRingView _offsetAngle:](self, "_offsetAngle:");
        -[PKBillPaymentRingView _centerPointAtAngle:adjustToCover:](self, "_centerPointAtAngle:adjustToCover:", 0);
        double v89 = v88;
        double v91 = v90;
        objc_msgSend(v85, "sizeThatFits:", v20, v20);
        double v93 = v92;
        double v95 = v94;
        objc_msgSend(v85, "setBounds:", v48, v49, v92, v94);
        v96.n128_f64[0] = v89 + v93 * -0.5;
        v97.n128_f64[0] = v91 + v95 * -0.5;
        PKPointRoundToPixel(v96, v97, v98);
        double v100 = v99;
        double v102 = v101;
        v103 = [v85 layer];
        [v103 anchorPoint];
        objc_msgSend(v103, "setPosition:", v100 + v104 * v93, v102 + v105 * v95);
        [v85 setAlpha:v78];
        CGAffineTransform v119 = v124;
        [v85 setTransform:&v119];
      }
      uint64_t v82 = [(NSArray *)v80 countByEnumeratingWithState:&v120 objects:v128 count:16];
    }
    while (v82);
  }

  topCurvedTextLabel = self->_topCurvedTextLabel;
  if (self->_isSmall)
  {
    [(PKCurvedTextLabel *)topCurvedTextLabel setAlpha:0.0];
    [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setAlpha:0.0];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAlpha:0.0];
    [(PKBillPaymentCircularView *)self->_handleView setAlpha:0.0];
    interestLabel = self->_interestLabel;
    double interestLabelAlpha = 0.0;
  }
  else
  {
    [(PKCurvedTextLabel *)topCurvedTextLabel setAlpha:1.0];
    [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setAlpha:1.0];
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setAlpha:1.0];
    [(PKBillPaymentCircularView *)self->_handleView setAlpha:1.0];
    interestLabel = self->_interestLabel;
    double interestLabelAlpha = self->_interestLabelAlpha;
  }
  [(UILabel *)interestLabel setAlpha:interestLabelAlpha];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if ([(UIView *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    double v3 = 280.0;
  }
  else
  {
    unint64_t v4 = PKUIGetMinScreenType();
    if (v4 > 3) {
      double v3 = 318.0;
    }
    else {
      double v3 = dbl_1A0443DF8[v4];
    }
  }
  double v5 = v3;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)renderLoop:(id)a3 drawAtTime:(double)a4
{
  id v6 = a3;
  double lastDrawTime = self->_lastDrawTime;
  double v8 = fmax(a4 - lastDrawTime, 0.0);
  if (lastDrawTime <= 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }
  self->_double lastDrawTime = a4;
  p_angleState = &self->_angleState;
  double position = self->_angleState.position;
  v62 = v6;
  double v12 = self->_scaleState.position;
  p_responseState = &self->_responseState;
  CGFloat v14 = &OBJC_IVAR___PKBillPaymentRingView__tapRecognizer;
  if (!self->_responseState.running)
  {
    int v28 = 608;
    SpringStatesUpdate((uint64_t)&self->_spring, (uint64_t)&self->_angleState, v9);
    goto LABEL_49;
  }
  double v60 = self->_angleState.position;
  double v61 = self->_scaleState.position;
  [(PKRenderLoop *)self->_renderLoop preferredFrameRateRange];
  double v16 = v15;
  if (v15 < 0.0) {
    double v16 = 60.0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PKBillPaymentRingView_renderLoop_drawAtTime___block_invoke;
  aBlock[3] = &__block_descriptor_40_e8_d16__0Q8l;
  *(double *)&aBlock[4] = v16;
  CGFloat v17 = (double (**)(void *, uint64_t))_Block_copy(aBlock);
  double v18 = v17[2](v17, 1);
  double v19 = fmax(v18 - self->_responseSpringElapsedDuration, 0.0);
  double v64 = v19;
  if (v9 - v19 <= 0.000001) {
    double v20 = v9;
  }
  else {
    double v20 = v19;
  }
  if (v20 <= v9) {
    double v21 = v20;
  }
  else {
    double v21 = v9;
  }
  double v63 = v21;
  uint64_t v22 = -1;
  double v23 = 0.0;
  while (1)
  {
    uint64_t v24 = v22 + 1;
    if (v22 == -1)
    {
      double responseSpringElapsedDuration = self->_responseSpringElapsedDuration;
      double v26 = v20;
      if (v20 >= v9)
      {
        double v27 = v9 + responseSpringElapsedDuration;
        if (v20 <= v9) {
          double v27 = 0.0;
        }
        self->_double responseSpringElapsedDuration = v27;
        double v26 = v63;
      }
      int v28 = v14[3];
      if (responseSpringElapsedDuration > 0.0)
      {
        double v29 = v9;
        BOOL v30 = v20 >= v9;
        goto LABEL_40;
      }
      double v29 = v9;
      BOOL v30 = v20 >= v9;
      if (v26 <= 0.0) {
        goto LABEL_40;
      }
LABEL_37:
      if (self->_responseState.running)
      {
        SpringStatesUpdate((uint64_t)&self->_responseSpring, (uint64_t)p_responseState, v18);
        double v35 = (char *)self + v28;
        SpringSetResponse((uint64_t)v35, self->_responseState.position);
        goto LABEL_41;
      }
LABEL_40:
      double v35 = (char *)self + v28;
LABEL_41:
      SpringStatesUpdate((uint64_t)v35, (uint64_t)p_angleState, v26);
      if (v30) {
        goto LABEL_48;
      }
      goto LABEL_42;
    }
    double v31 = v64 + ((double (*)(double (**)(void *, uint64_t)))v17[2])(v17);
    double v29 = v9 - v31;
    double v32 = fmax(fmin(v9 - v31, v18), 0.0);
    double v26 = v9 - v31 - v32 <= 0.000001 ? v9 - v31 : v32;
    if (v26 < v18 || v23 >= v31) {
      break;
    }
    int v28 = v14[3];
    if (v26 > 0.0)
    {
      BOOL v30 = 0;
LABEL_36:
      double v23 = v31;
      goto LABEL_37;
    }
    double v35 = (char *)self + v28;
    SpringStatesUpdate((uint64_t)v35, (uint64_t)p_angleState, v26);
    double v23 = v31;
LABEL_42:
    uint64_t v22 = v24;
    CGFloat v14 = &OBJC_IVAR___PKBillPaymentRingView__tapRecognizer;
    if (!self->_responseState.running)
    {
      double v36 = v29 - v26;
      uint64_t v37 = v35;
      v38 = &self->_angleState;
      goto LABEL_47;
    }
  }
  if (v26 <= 0.0) {
    double v34 = 0.0;
  }
  else {
    double v34 = v26;
  }
  self->_double responseSpringElapsedDuration = v34;
  int v28 = v14[3];
  if (v26 > 0.0)
  {
    BOOL v30 = 1;
    goto LABEL_36;
  }
  uint64_t v37 = (char *)self + v28;
  v38 = &self->_angleState;
  double v36 = v26;
LABEL_47:
  SpringStatesUpdate((uint64_t)v37, (uint64_t)v38, v36);
LABEL_48:

  double position = v60;
  double v12 = v61;
LABEL_49:
  SpringStatesUpdate((uint64_t)&self->_scaleSpring, (uint64_t)&self->_scaleState, v9);
  BOOL v39 = [(PKBillPaymentRingView *)self _preferredPausedState];
  if (!self->_angleState.running)
  {
    overrideGradientState = self->_overrideGradientState;
    self->_overrideGradientState = 0;

    if (self->_responseState.running)
    {
      self->_responseState.running = 0;
      double target = p_responseState->target;
      self->_responseState.double position = self->_responseState.target;
      self->_responseState.velocity = 0.0;
      SpringSetResponse((uint64_t)self + v28, target);
    }
  }
  double v42 = (void *)MEMORY[0x1A6224460]();
  if (self->_angleState.position != position)
  {
    [(PKBillPaymentRingView *)self didUpdateAngleSpringPosition];
    if (self->_feedbackGenerator)
    {
      double v43 = self->_angleState.position;
      if (self->_dragging)
      {
        NSUInteger v44 = [(NSArray *)self->_suggestedAmountAngles count];
        if (v44)
        {
          uint64_t v45 = 0;
          NSUInteger v46 = v44 - 1;
          while (1)
          {
            uint64_t v47 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v45];
            [v47 doubleValue];
            double v49 = v48;

            BOOL v50 = v43 <= position || v43 < v49;
            if (!v50 && position < v49) {
              break;
            }
            BOOL v52 = v43 <= v49 && v43 <= position;
            if (position <= v49) {
              BOOL v52 = 0;
            }
            if (!v52 && v46 != v45++) {
              continue;
            }
            if (v52) {
              break;
            }
            goto LABEL_87;
          }
LABEL_86:
          [(UISelectionFeedbackGenerator *)self->_feedbackGenerator selectionChanged];
        }
      }
      else if (self->_pinnedAmount && self->_pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL)
      {
        double pinnedAmountAngle = self->_pinnedAmountAngle;
        double v55 = pinnedAmountAngle + -0.04;
        double v56 = pinnedAmountAngle + 0.04;
        BOOL v57 = position < v55 || position > v56;
        BOOL v58 = !v57 || v43 < v55;
        if (!v58 && v43 <= v56) {
          goto LABEL_86;
        }
      }
    }
  }
LABEL_87:
  if (self->_scaleState.position != v12) {
    [(PKBillPaymentRingView *)self didUpdateScaleSpringPosition];
  }
  if (v39) {
    [(PKBillPaymentRingView *)self _pauseRenderLoop];
  }
  [(PKBillPaymentRingView *)self layoutIfNeeded];
}

double __47__PKBillPaymentRingView_renderLoop_drawAtTime___block_invoke(uint64_t a1, unint64_t a2)
{
  return (double)a2 / *(double *)(a1 + 32);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return !self->_ignoreTouches && !self->_isSmall;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  pressRecognizer = self->_pressRecognizer;
  return pressRecognizer == a3 || pressRecognizer == a4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UIPanGestureRecognizer *)a3;
  [a4 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  if ((UIPanGestureRecognizer *)self->_tapRecognizer == v6)
  {
    [(PKBillPaymentRingView *)self _ringWidth];
    double v13 = v12;
    [(PKRingGradientView *)self->_ringView radius];
    double v15 = v14 + v13 * -0.5;
    double v16 = v13 * 0.5 + 16.0;
    [(PKBillPaymentRingView *)self _center];
    double v19 = sqrt((v18 - v10) * (v18 - v10) + (v17 - v8) * (v17 - v8));
    BOOL v11 = v19 <= v16 + v15 && v19 >= v15 - v16;
  }
  else if (self->_dragRecognizer == v6 || (UIPanGestureRecognizer *)self->_pressRecognizer == v6)
  {
    double v20 = [(PKBillPaymentCircularView *)self->_handleView layer];
    [v20 anchorPoint];
    double v22 = v21;
    double v24 = v23;
    [v20 position];
    double v26 = v25;
    double v28 = v27;
    [v20 bounds];
    double width = v38.size.width;
    double height = v38.size.height;
    CGFloat v31 = v26 - v22 * v38.size.width;
    CGFloat v32 = v28 - v24 * v38.size.height;
    v38.origin.x = v31;
    v38.origin.y = v32;
    double MidX = CGRectGetMidX(v38);
    v39.origin.x = v31;
    v39.origin.y = v32;
    v39.size.double width = width;
    v39.size.double height = height;
    CGFloat MidY = CGRectGetMidY(v39);
    double v35 = sqrt((MidY - v10) * (MidY - v10) + (MidX - v8) * (MidX - v8));
    if (width >= height) {
      double v36 = height;
    }
    else {
      double v36 = width;
    }
    BOOL v11 = v35 <= v36 + 16.0;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (double)_angleForRecognizer:(id)a3
{
  [a3 locationInView:self];

  -[PKBillPaymentRingView _angleForPosition:](self, "_angleForPosition:");
  return result;
}

- (double)_angleForPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PKBillPaymentRingView *)self _center];
  long double v7 = atan2(y - v6, x - v5);
  double result = fmod(v7 + -4.71238898, 6.28318531);
  if (result < 0.0) {
    double result = result + 6.28318531;
  }
  if (result == 0.0) {
    return 6.28318531;
  }
  return result;
}

- (void)_tapRecognized:(id)a3
{
  [(PKBillPaymentRingView *)self _angleForRecognizer:a3];
  if (v4 < 0.523598776) {
    double v4 = 6.28318531;
  }

  [(PKBillPaymentRingView *)self setAngle:1 animated:0 forExplicitAmount:1 userInitiatedWithRing:0 userInitiatedWithKeypad:v4];
}

- (void)_pressRecognized:(id)a3
{
  uint64_t v4 = [a3 state];
  char v5 = v4 - 1;
  if (unint64_t)(v4 - 1) <= 4 && ((0x1Du >> v5))
  {
    self->_pressed = 0x101uLL >> (8 * v5);
    [(PKBillPaymentRingView *)self _updateHandleState];
  }
}

- (void)_dragRecognizerChanged:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 state];
  if ((unint64_t)(v4 - 3) < 3)
  {
    [(PKBillPaymentRingView *)self _dragMoved:v7];
    [(PKBillPaymentRingView *)self _dragEnded:v7];
LABEL_8:
    double v6 = v7;
    goto LABEL_9;
  }
  if (v4 == 2)
  {
LABEL_7:
    [(PKBillPaymentRingView *)self _dragMoved:v7];
    goto LABEL_8;
  }
  BOOL v5 = v4 == 1;
  double v6 = v7;
  if (v5)
  {
    [(PKBillPaymentRingView *)self _dragStarted:v7];
    goto LABEL_7;
  }
LABEL_9:
}

- (void)_dragMoved:(id)a3
{
  [a3 locationInView:self];
  double v5 = v4;
  double v7 = v6;
  [(PKRingGradientView *)self->_ringView radius];
  [(PKBillPaymentRingView *)self _center];
  -[PKBillPaymentRingView _angleForPosition:](self, "_angleForPosition:", v5, v7);

  -[PKBillPaymentRingView _dragMovedToAngle:normalizedRadius:](self, "_dragMovedToAngle:normalizedRadius:");
}

- (void)_dragStarted:(id)a3
{
  self->_dragging = 1;
  [(PKBillPaymentRingView *)self _updateHandleState];
  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator)
  {
    [(UISelectionFeedbackGenerator *)feedbackGenerator userInteractionStarted];
  }
}

- (void)_dragEnded:(id)a3
{
  self->_dragging = 0;
  self->_dragCapture = 0;
  [(PKBillPaymentRingView *)self _updateHandleState];
  feedbackGenerator = self->_feedbackGenerator;
  if (feedbackGenerator)
  {
    [(UISelectionFeedbackGenerator *)feedbackGenerator userInteractionEnded];
    if ([(PKRenderLoop *)self->_renderLoop isPaused])
    {
      double v5 = self->_feedbackGenerator;
      self->_feedbackGenerator = 0;
    }
  }
}

- (void)_dragMovedToAngle:(double)a3 normalizedRadius:(double)a4
{
  int64_t dragCapture = self->_dragCapture;
  if ((unint64_t)(dragCapture - 1) >= 2)
  {
    if (!dragCapture)
    {
      if (a4 <= 0.25)
      {
LABEL_17:
        self->_int64_t dragCapture = 3;
LABEL_18:
        if (a4 <= 0.25)
        {
          double target = self->_angleState.target;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      if (a3 < 6.28318531 && a3 > 0.523598776) {
        goto LABEL_23;
      }
      int64_t dragCapture = 2;
      if ((self->_angleState.target + -0.523598776) / 5.75958653 < 0.5) {
        int64_t dragCapture = 1;
      }
      self->_int64_t dragCapture = dragCapture;
    }
  }
  else if (a4 <= 0.25)
  {
    goto LABEL_17;
  }
  if (dragCapture == 1)
  {
    double target = 0.523598776;
    if (a3 <= 0.523598776 || a3 > 0.696386372) {
      goto LABEL_24;
    }
LABEL_22:
    self->_int64_t dragCapture = 0;
    goto LABEL_23;
  }
  if (dragCapture == 3) {
    goto LABEL_18;
  }
  if (dragCapture != 2)
  {
LABEL_23:
    double target = a3;
    goto LABEL_24;
  }
  double target = 6.28318531;
  if (a3 >= 6.11039771 && a3 < 6.28318531) {
    goto LABEL_22;
  }
LABEL_24:
  [(PKBillPaymentRingView *)self setAngle:1 animated:0 forExplicitAmount:1 userInitiatedWithRing:0 userInitiatedWithKeypad:target];
}

- (void)_updateHandleState
{
  if (self->_dragging)
  {
    double v2 = 1.2;
  }
  else
  {
    double v2 = 1.2;
    if (!self->_pressed) {
      double v2 = 1.0;
    }
  }
  [(PKBillPaymentRingView *)self setHandleScale:1 animated:v2];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_BOOL enabled = a3;
    [(PKBillPaymentRingView *)self _updateForEnabledState];
    [(PKBillPaymentRingView *)self _updateCurvedText];
    BOOL enabled = self->_enabled;
    if (self->_enabled)
    {
      double v5 = 0;
    }
    else
    {
      double v5 = [MEMORY[0x1E4F28C28] zero];
    }
    objc_storeStrong((id *)&self->_overrideDisplayAmount, v5);
    if (!enabled) {

    }
    [(PKBillPaymentRingView *)self _updateEffectiveDisplayAmount];
  }
}

- (void)prepareForInitialDisplayWithAmount:(id)a3
{
  if (self->_needsInitialDisplay)
  {
    double v4 = (NSDecimalNumber *)[a3 copy];
    initialDisplayAmount = self->_initialDisplayAmount;
    self->_initialDisplayAmount = v4;

    [(PKBillPaymentRingView *)self _updateInitialDisplayState];
    self->_preparedForInitialDispladouble y = 1;
  }
}

- (void)_updateInitialDisplayState
{
  if (self->_needsInitialDisplay)
  {
    if (self->_initialDisplayAmount)
    {
      -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
      double v4 = v3;
    }
    else
    {
      double v4 = dbl_1A0443D50[!self->_isSmall];
    }
    double v5 = [(PKBillPaymentRingView *)self _targetGradientStateForAngle:v4];
    overrideGradientState = self->_overrideGradientState;
    self->_overrideGradientState = v5;

    self->_overrideGradientStartAngle = v4;
    [(PKBillPaymentRingView *)self didUpdateAngleSpringTarget];
    [(PKBillPaymentRingView *)self didUpdateAngleSpringPosition];
  }
}

- (void)completeInitialDisplayAnimated:(BOOL)a3
{
  if (self->_needsInitialDisplay)
  {
    BOOL v3 = a3;
    if (!self->_preparedForInitialDisplay) {
      [(PKBillPaymentRingView *)self prepareForInitialDisplayWithAmount:0];
    }
    self->_needsInitialDispladouble y = 0;
    [(PKBillPaymentRingView *)self _setDotsVisible:1 animated:v3];
    if (self->_initialDisplayAmount)
    {
      -[PKBillPaymentRingView setAmount:animated:](self, "setAmount:animated:");
    }
  }
}

- (void)setAmount:(id)a3 animated:(BOOL)a4
{
}

- (void)setAmount:(id)a3 animated:(BOOL)a4 userInitiatedWithKeypad:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
    if (self->_needsInitialDisplay)
    {
      [(PKBillPaymentRingView *)self prepareForInitialDisplayWithAmount:v8];
    }
    else
    {
      [(PKBillPaymentRingView *)self _angleForAmount:v8];
      -[PKBillPaymentRingView setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:](self, "setAngle:animated:forExplicitAmount:userInitiatedWithRing:userInitiatedWithKeypad:", v6, v10, 0, v5);
    }
    double v9 = v10;
  }
}

- (NSDecimalNumber)amount
{
  pinnedAmount = self->_pinnedAmount;
  if (pinnedAmount)
  {
    BOOL v3 = pinnedAmount;
  }
  else
  {
    BOOL v3 = [(PKBillPaymentRingView *)self _roundedAmountForAngle:self->_angleState.target];
  }

  return v3;
}

- (double)targetAngle
{
  return self->_angleState.target;
}

- (UIColor)currentStartColor
{
  double v2 = [(PKBillPaymentRingView *)self _targetGradientStateForAngle:self->_angleState.target];
  BOOL v3 = [v2 startColor];

  return (UIColor *)v3;
}

- (UIColor)currentEndColor
{
  double v2 = [(PKBillPaymentRingView *)self _targetGradientStateForAngle:self->_angleState.target];
  BOOL v3 = [v2 endColor];

  return (UIColor *)v3;
}

- (void)setIsSmall:(BOOL)a3
{
  if (self->_isSmall != a3)
  {
    [(PKBillPaymentRingView *)self layoutIfNeeded];
    self->_BOOL isSmall = a3;
    [(PKBillPaymentRingView *)self setNeedsLayout];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__PKBillPaymentRingView_setIsSmall___block_invoke;
    v7[3] = &unk_1E59CA7D0;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:0];
    [(PKBillPaymentRingView *)self setNeedsDisplay];
    if (self->_needsInitialDisplay)
    {
      if (self->_preparedForInitialDisplay) {
        [(PKBillPaymentRingView *)self _updateInitialDisplayState];
      }
    }
    else
    {
      if (self->_pinnedAmount)
      {
        -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
        pinnedAmount = self->_pinnedAmount;
      }
      else
      {
        pinnedAmount = 0;
        double v5 = fmin(fmax(self->_angleState.target, dbl_1A0443D50[!self->_isSmall]), 6.28318531);
      }
      [(PKBillPaymentRingView *)self setAngle:1 animated:pinnedAmount forExplicitAmount:0 userInitiatedWithRing:0 userInitiatedWithKeypad:v5];
    }
  }
}

uint64_t __36__PKBillPaymentRingView_setIsSmall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)didUpdateAngleSpringTarget
{
  if (self->_initialDisplayAmount)
  {
    -[PKBillPaymentRingView _angleForAmount:](self, "_angleForAmount:");
  }
  else if (self->_pinnedAmount)
  {
    pinnedAmountAngleIndedouble x = self->_pinnedAmountAngleIndex;
    if (pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_4;
    }
  }
  pinnedAmountAngleIndedouble x = -[PKBillPaymentRingView _unnormalizedAngleIndexForAngle:](self, "_unnormalizedAngleIndexForAngle:");
LABEL_4:
  double v4 = [(PKBillPaymentRingView *)self _suggestedAmountForAngleIndex:pinnedAmountAngleIndex];
  if (v4)
  {
    [(PKBillPaymentRingView *)self _setSelectedSuggestedAmount:v4];
  }
  else
  {
    double v5 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList initialSuggestedAmount];
    [(PKBillPaymentRingView *)self _setSelectedSuggestedAmount:v5];
  }
  if (self->_isSmall)
  {
    [(PKBillPaymentRingView *)self _updateHandleImage];
  }
}

- (void)didUpdateAngleSpringPosition
{
  [(PKBillPaymentRingView *)self setNeedsLayout];
  p_initialDisplayAmount = &self->_initialDisplayAmount;
  initialDisplayAmount = self->_initialDisplayAmount;
  if (initialDisplayAmount)
  {
    [(PKBillPaymentRingView *)self _angleForAmount:self->_initialDisplayAmount];
    double target = v5;
    BOOL v7 = 0;
    double position = self->_angleState.position;
    BOOL v9 = 1;
  }
  else
  {
    double target = self->_angleState.target;
    double position = self->_angleState.position;
    if (self->_pinnedAmount
      && (double pinnedAmountAngle = self->_pinnedAmountAngle, position >= pinnedAmountAngle + -0.172787596))
    {
      BOOL v9 = position <= pinnedAmountAngle + 0.172787596;
      BOOL v7 = v9;
    }
    else
    {
      BOOL v9 = 0;
      BOOL v7 = 0;
    }
  }
  [(PKRingGradientView *)self->_ringView setCurrentAngle:position];
  if (!self->_isSmall) {
    [(PKBillPaymentRingView *)self _updateHandleImage];
  }
  uint64_t v11 = [(PKBillPaymentRingView *)self _roundedAmountForAngle:position];
  double v24 = (NSDecimalNumber *)v11;
  if (self->_userEnteredAmountWithKeypad)
  {
    double v12 = (NSDecimalNumber *)v11;
    double v24 = self->_pinnedAmount;
  }
  else
  {
    if (!v9) {
      goto LABEL_18;
    }
    if (!initialDisplayAmount) {
      p_initialDisplayAmount = &self->_pinnedAmount;
    }
    double v12 = *p_initialDisplayAmount;
    if ([(PKBillPaymentRingView *)self _isAmount:v24 withinRoundingUnitOfAmount:v12])
    {
      double v12 = v12;

      double v24 = v12;
    }
  }

  if (initialDisplayAmount)
  {
    pinnedAmountAngleIndedouble x = [(PKBillPaymentRingView *)self _unnormalizedAngleIndexForAngle:target];
    double v14 = target;
    goto LABEL_24;
  }
LABEL_18:
  if (!v7 || (pinnedAmountAngleIndedouble x = self->_pinnedAmountAngleIndex, pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL)) {
    pinnedAmountAngleIndedouble x = [(PKBillPaymentRingView *)self _unnormalizedAngleIndexForAngle:position];
  }
  if (self->_overrideGradientState) {
    double v14 = target;
  }
  else {
    double v14 = position;
  }
LABEL_24:
  double v15 = [(PKBillPaymentRingView *)self _targetGradientStateForAngle:v14];
  overrideGradientState = self->_overrideGradientState;
  if (overrideGradientState)
  {
    double overrideGradientStartAngle = self->_overrideGradientStartAngle;
    if (target - overrideGradientStartAngle == 0.0)
    {
      double v18 = overrideGradientState;
    }
    else
    {
      -[PKBillPaymentRingView _blendFromGradientState:toState:withProgress:](self, "_blendFromGradientState:toState:withProgress:", (position - overrideGradientStartAngle) / (target - overrideGradientStartAngle));
      double v18 = (PKBillPaymentRingGradientState *)objc_claimAutoreleasedReturnValue();
    }
    double v19 = v18;

    double v15 = v19;
  }
  double v20 = [v15 startColor];
  double v21 = [v15 endColor];
  [(PKRingGradientView *)self->_ringView setGradientStartColor:v20];
  [(PKRingGradientView *)self->_ringView setGradientEndColor:v21];
  [(PKBillPaymentCircularView *)self->_handleView setPrimaryColor:v21];
  [(UILabel *)self->_interestLabel setTextColor:v20];
  double v22 = [(PKBillPaymentRingView *)self _suggestedAmountForAngleIndex:pinnedAmountAngleIndex];
  if (v22)
  {
    [(PKBillPaymentRingView *)self _setHighlightedSuggestedAmount:v22];
  }
  else
  {
    double v23 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList initialSuggestedAmount];
    [(PKBillPaymentRingView *)self _setHighlightedSuggestedAmount:v23];
  }
  if (![(PKBillPaymentRingView *)self _setDisplayAmount:v24]) {
    [(PKBillPaymentRingView *)self _updateInterestText];
  }
}

- (void)didUpdateScaleSpringPosition
{
  long double v3 = exp(self->_scaleState.position);
  double v4 = [(PKBillPaymentCircularView *)self->_handleView layer];
  CATransform3DMakeScale(&v5, v3, v3, 1.0);
  [v4 setTransform:&v5];
}

- (void)setAngle:(double)a3 animated:(BOOL)a4 forExplicitAmount:(id)a5 userInitiatedWithRing:(BOOL)a6 userInitiatedWithKeypad:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a4;
  id v12 = a5;
  BOOL v13 = v9 && self->_enabled;
  self->_userSelectedAngleChange = v8;
  self->_userEnteredAmountWithKeypad = a7;
  p_angleState = &self->_angleState;
  double target = self->_angleState.target;
  double position = self->_angleState.position;
  id v70 = v12;
  if (v12)
  {
    double v17 = (char *)v12;
    NSUInteger v18 = [(NSArray *)self->_suggestedAmountAngles count];
    if (!v18)
    {
      p_initialDisplayAmount = &self->_initialDisplayAmount;
      initialDisplayAmount = self->_initialDisplayAmount;
      BOOL v41 = initialDisplayAmount != 0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      double v26 = a3;
      if (!initialDisplayAmount || v8) {
        goto LABEL_42;
      }
      goto LABEL_35;
    }
    NSUInteger v19 = v18;
    BOOL v69 = v13;
    unint64_t v20 = 0;
    while (1)
    {
      suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
      double v22 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v20];
      double v23 = [(NSDictionary *)suggestedAmountsForAngle objectForKeyedSubscript:v22];
      double v24 = [v23 amount];
      char v25 = PKEqualObjects();

      if (v25) {
        break;
      }
      if (v19 == ++v20)
      {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
        break;
      }
    }
    double v26 = a3;
    p_angleState = &self->_angleState;
    BOOL v13 = v69;
  }
  else
  {
    double v17 = [(NSArray *)self->_suggestedAmountAngles count];
    if (!v17)
    {
      p_initialDisplayAmount = &self->_initialDisplayAmount;
      double v42 = self->_initialDisplayAmount;
      BOOL v41 = v42 != 0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      double v26 = 0.0;
      if (!v42 || v8) {
        goto LABEL_42;
      }
      goto LABEL_36;
    }
    BOOL v27 = v13;
    double v28 = 0;
    double v29 = 0;
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    double v30 = 1.79769313e308;
    do
    {
      CGFloat v31 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v29];
      [v31 doubleValue];
      BOOL v33 = v32 + -0.172787596 > a3 || v32 + 0.172787596 < a3;
      double v34 = vabdd_f64(a3, v32);
      if (!v33 && v34 <= v30)
      {
        id v36 = v31;

        double v28 = v36;
        unint64_t v20 = (unint64_t)v29;
        double v30 = v34;
      }

      ++v29;
    }
    while (v17 != v29);
    if (v28)
    {
      [v28 doubleValue];
      double v26 = v37;
      CGRect v38 = [(NSDictionary *)self->_suggestedAmountsForAngle objectForKeyedSubscript:v28];
      double v17 = [v38 amount];

      a3 = v26;
    }
    else
    {
      double v17 = 0;
      double v26 = 0.0;
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v13 = v27;
  }
  p_initialDisplayAmount = &self->_initialDisplayAmount;
  double v43 = self->_initialDisplayAmount;
  BOOL v41 = v43 != 0;
  if (!v43 || v8) {
    goto LABEL_42;
  }
  if (!v70) {
    goto LABEL_36;
  }
LABEL_35:
  if (PKEqualObjects())
  {
LABEL_36:
    BOOL v41 = !self->_needsInitialDisplay;
    if (!self->_needsInitialDisplay && v13)
    {
      if ((PKEqualObjects() & 1) == 0) {
        goto LABEL_41;
      }
LABEL_43:
      int v46 = 0;
      goto LABEL_44;
    }
LABEL_42:
    if (v41) {
      goto LABEL_41;
    }
    goto LABEL_43;
  }
LABEL_41:
  uint64_t v45 = *p_initialDisplayAmount;
  *p_initialDisplayAmount = 0;

  int v46 = 1;
LABEL_44:
  if (PKEqualObjects() && self->_pinnedAmountAngle == v26)
  {
    if (self->_pinnedAmountAngleIndex == v20) {
      int v47 = v46;
    }
    else {
      int v47 = 1;
    }
    if (target == a3 && v47 == 0)
    {
      int v47 = 0;
      if (v13) {
        goto LABEL_59;
      }
      goto LABEL_57;
    }
  }
  else
  {
    int v47 = 1;
  }
  p_angleState->double target = a3;
  if (!p_angleState->running && p_angleState->position != a3) {
    p_angleState->running = 1;
  }
  double v48 = (NSDecimalNumber *)[v17 copy];
  pinnedAmount = self->_pinnedAmount;
  self->_pinnedAmount = v48;

  self->_double pinnedAmountAngle = v26;
  self->_pinnedAmountAngleIndedouble x = v20;
  if (self->_overrideGradientState)
  {
    BOOL v50 = [(PKRingGradientView *)self->_ringView gradientStartColor];
    uint64_t v51 = [(PKRingGradientView *)self->_ringView gradientEndColor];
    BOOL v52 = (void *)v51;
    if (v50 && v51)
    {
      double v53 = [[PKBillPaymentRingGradientState alloc] initWithStartColor:v50 endColor:v51];
      overrideGradientState = self->_overrideGradientState;
      self->_overrideGradientState = v53;

      self->_double overrideGradientStartAngle = position;
    }
    else
    {
      double v55 = self->_overrideGradientState;
      self->_overrideGradientState = 0;
    }
  }
  [(PKBillPaymentRingView *)self didUpdateAngleSpringTarget];
  if (!v13)
  {
LABEL_57:
    double v56 = self->_overrideGradientState;
    self->_overrideGradientState = 0;

    if (p_angleState->running)
    {
      p_angleState->running = 0;
      p_angleState->double position = p_angleState->target;
      p_angleState->velocitdouble y = 0.0;
    }
  }
LABEL_59:
  if (((p_angleState->position == position) & ~v47) == 0) {
    [(PKBillPaymentRingView *)self didUpdateAngleSpringPosition];
  }
  if (p_angleState->running)
  {
    if (target != a3)
    {
      if (v13 && v8)
      {
        if (!self->_feedbackGenerator)
        {
          BOOL v57 = [MEMORY[0x1E4FB2290] defaultConfiguration];
          BOOL v58 = [v57 tweakedConfigurationForCaller:self usage:@"majorSelection"];

          double v59 = [MEMORY[0x1E4FB20B0] feedbackWithDictionaryRepresentation:&unk_1EF2BA428];
          [v58 setFeedback:v59];

          double v60 = (UISelectionFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB1C18]) initWithConfiguration:v58 coordinateSpace:self];
          feedbackGenerator = self->_feedbackGenerator;
          self->_feedbackGenerator = v60;

          if (self->_dragging) {
            [(UISelectionFeedbackGenerator *)self->_feedbackGenerator userInteractionStarted];
          }
          goto LABEL_69;
        }
      }
      else if (!self->_dragging)
      {
        BOOL v58 = self->_feedbackGenerator;
        self->_feedbackGenerator = 0;
LABEL_69:
      }
    }
    double v62 = vabdd_f64(p_angleState->position, p_angleState->target);
    if (self->_dragging)
    {
      double v63 = fmin(fmax((v62 + -0.575958653) / 5.18362788, 0.0), 1.0);
      double v64 = 1.0 - v63;
      double v65 = v63 * -0.356674944;
      double v66 = -2.07944154;
    }
    else
    {
      double v67 = v62 / 5.75958653;
      double v64 = 1.0 - v67;
      double v65 = v67 * -0.356674944;
      double v66 = -1.04982212;
    }
    [(PKBillPaymentRingView *)self _setResponse:(double)exp(v65 + v64 * v66)];
  }
  [(PKBillPaymentRingView *)self _updatePausedState];
}

- (void)setHandleScale:(double)a3 animated:(BOOL)a4
{
  p_scaleState = &self->_scaleState;
  double position = self->_scaleState.position;
  double v8 = log(a3);
  p_scaleState->double target = v8;
  if (p_scaleState->running || position == v8)
  {
    double v10 = position;
    if (!p_scaleState->running) {
      goto LABEL_9;
    }
  }
  else
  {
    p_scaleState->running = 1;
  }
  double v10 = position;
  if (!a4)
  {
    p_scaleState->running = 0;
    p_scaleState->double position = v8;
    double v10 = v8;
    p_scaleState->velocitdouble y = 0.0;
  }
LABEL_9:
  if (v10 != position) {
    [(PKBillPaymentRingView *)self didUpdateScaleSpringPosition];
  }

  [(PKBillPaymentRingView *)self _updatePausedState];
}

- (BOOL)_preferredPausedState
{
  return !self->_angleState.running && !self->_scaleState.running;
}

- (void)_updatePausedState
{
  if ([(PKBillPaymentRingView *)self _preferredPausedState])
  {
    [(PKBillPaymentRingView *)self _pauseRenderLoop];
  }
  else if ([(PKRenderLoop *)self->_renderLoop isPaused])
  {
    if (self->_responseState.running)
    {
      self->_responseState.running = 0;
      double target = self->_responseState.target;
      self->_responseState.double position = target;
      self->_responseState.velocitdouble y = 0.0;
      SpringSetResponse((uint64_t)&self->_spring, target);
    }
    self->_double lastDrawTime = CACurrentMediaTime();
    renderLoop = self->_renderLoop;
    [(PKRenderLoop *)renderLoop setPaused:0];
  }
}

- (id)_blendFromGradientState:(id)a3 toState:(id)a4 withProgress:(double)a5
{
  BOOL v7 = (void *)MEMORY[0x1E4FB1618];
  id v8 = a4;
  id v9 = a3;
  double v10 = [v9 startColor];
  uint64_t v11 = [v8 startColor];
  id v12 = objc_msgSend(v7, "pkui_blendFromColor:toColor:withProgress:", v10, v11, a5);

  BOOL v13 = (void *)MEMORY[0x1E4FB1618];
  double v14 = [v9 endColor];

  double v15 = [v8 endColor];

  double v16 = objc_msgSend(v13, "pkui_blendFromColor:toColor:withProgress:", v14, v15, a5);

  double v17 = [[PKBillPaymentRingGradientState alloc] initWithStartColor:v12 endColor:v16];

  return v17;
}

- (void)_updateForEnabledState
{
  if (self->_enabled) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  id v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  }
  if (self->_enabled) {
    [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  else {
  long double v3 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
  }
  [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setTextColor:v4];
  [(PKCurvedTextLabel *)self->_topCurvedTextLabel setTextColor:v3];
  [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setTextColor:v3];
  [(UITapGestureRecognizer *)self->_tapRecognizer setEnabled:self->_enabled];
  [(UIPanGestureRecognizer *)self->_dragRecognizer setEnabled:self->_enabled];
  [(PKBillPaymentCircularView *)self->_handleView setHidden:!self->_enabled];
  [(PKRingGradientView *)self->_ringView setEnabled:self->_enabled];
}

- (void)_updateCurvedText
{
  BOOL enabled = self->_enabled;
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  BOOL v6 = WeakRetained;
  if (enabled)
  {
    id v9 = [WeakRetained billPaymentRingView:self topCurvedTextForSuggestedAmount:self->_highlightedSuggestedAmount];

    id v7 = objc_loadWeakRetained((id *)p_dataSource);
    [v7 billPaymentRingView:self bottomCurvedTextForSuggestedAmount:self->_highlightedSuggestedAmount];
  }
  else
  {
    id v9 = [WeakRetained disabledTopCurvedTextForBillPaymentRingView:self];

    id v7 = objc_loadWeakRetained((id *)p_dataSource);
    [v7 disabledBottomCurvedTextForBillPaymentRingView:self];
  id v8 = };

  [(PKCurvedTextLabel *)self->_topCurvedTextLabel setText:v9];
  [(PKCurvedTextLabel *)self->_bottomCurvedTextLabel setText:v8];
}

- (void)_setResponse:(double)a3
{
  if (self->_responseState.target != a3)
  {
    self->_double responseSpringElapsedDuration = 0.0;
    self->_responseState.double target = a3;
    if (!self->_responseState.running && self->_responseState.position != a3) {
      self->_responseState.running = 1;
    }
  }
}

- (void)_setDotsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (((!self->_dotsVisible ^ a3) & 1) == 0)
  {
    if (a4)
    {
      [(PKBillPaymentRingView *)self layoutIfNeeded];
      self->_dotsVisible = a3;
      [(PKBillPaymentRingView *)self setNeedsLayout];
      BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:3.0 stiffness:1000.0 damping:500.0];
      id v7 = v6;
      if (self->_dotsVisible)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke;
        v9[3] = &unk_1E59D2EB0;
        v9[4] = self;
        [v6 setAnimationDelayHandler:v9];
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke_2;
      v8[3] = &unk_1E59CA7D0;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v7, 0, v8, 0, 0.0);
    }
    else
    {
      self->_dotsVisible = a3;
      [(PKBillPaymentRingView *)self setNeedsLayout];
    }
  }
}

double __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isEqualToString:@"opacity"] & 1) != 0
    || (double v7 = 0.0, [v6 isEqualToString:@"transform"]))
  {
    unint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 416) indexOfObjectIdenticalTo:v5];
    double v7 = 0.0;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      double v7 = (double)v8 * 0.15;
    }
  }

  return v7;
}

uint64_t __50__PKBillPaymentRingView__setDotsVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)_setDisplayAmount:(id)a3
{
  id v4 = a3;
  if (PKEqualObjects())
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = (NSDecimalNumber *)[v4 copy];
    displayAmount = self->_displayAmount;
    self->_displayAmount = v6;

    BOOL v5 = [(PKBillPaymentRingView *)self _updateEffectiveDisplayAmount];
  }

  return v5;
}

- (BOOL)_updateEffectiveDisplayAmount
{
  overrideDisplayAmount = self->_overrideDisplayAmount;
  if (!overrideDisplayAmount) {
    overrideDisplayAmount = self->_displayAmount;
  }
  id v4 = overrideDisplayAmount;
  p_effectiveDisplayAmount = &self->_effectiveDisplayAmount;
  char v6 = PKEqualObjects();
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveDisplayAmount, overrideDisplayAmount);
    [(PKEnterCurrencyAmountView *)self->_enterCurrencyAmountView setCurrentAmount:*p_effectiveDisplayAmount forceFormatForDisplay:PKIsVision() ^ 1];
    [(PKBillPaymentRingView *)self _updateInterestText];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v8 = (void *)[(NSDecimalNumber *)*p_effectiveDisplayAmount copy];
      [WeakRetained billPaymentRingView:self amountChanged:v8];
    }
    [(PKBillPaymentRingView *)self setNeedsLayout];
  }
  return v6 ^ 1;
}

- (void)_setSelectedSuggestedAmount:(id)a3
{
  id v7 = a3;
  id v15 = v7;
  if (v7)
  {
    pinnedAmountAngleIndedouble x = self->_pinnedAmountAngleIndex;
    if (pinnedAmountAngleIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
      long double v3 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:self->_pinnedAmountAngleIndex];
      uint64_t v11 = [(NSDictionary *)suggestedAmountsForAngle objectForKeyedSubscript:v3];
      id v7 = v15;
      if ((id)v11 == v15)
      {
        LODWORD(initialDisplayAmount) = 1;
        id v4 = v15;
      }
      else
      {
        id v4 = (void *)v11;
        initialDisplayAmount = self->_initialDisplayAmount;
        if (initialDisplayAmount) {
          goto LABEL_8;
        }
      }
LABEL_11:

      goto LABEL_12;
    }
    initialDisplayAmount = self->_initialDisplayAmount;
    if (initialDisplayAmount)
    {
LABEL_8:
      id v12 = [v7 amount];
      LODWORD(initialDisplayAmount) = PKEqualObjects();

      if (pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else
  {
    LODWORD(initialDisplayAmount) = 0;
  }
LABEL_12:
  if (!PKEqualObjects()
    || (!self->_needsInitialDisplay
      ? (BOOL v13 = initialDisplayAmount == self->_selectedSuggestedAmountIsTarget)
      : (BOOL v13 = 0),
        !v13))
  {
    self->_selectedSuggestedAmountIsTarget = (char)initialDisplayAmount;
    objc_storeStrong((id *)&self->_selectedSuggestedAmount, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained billPaymentRingView:self selectedSuggestedAmount:self->_selectedSuggestedAmount selectedSuggestedAmountIsTarget:self->_selectedSuggestedAmountIsTarget userInitiatedChange:self->_userSelectedAngleChange];
  }
}

- (void)_setHighlightedSuggestedAmount:(id)a3
{
  id v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_highlightedSuggestedAmount, a3);
    if (self->_enabled) {
      [(PKBillPaymentRingView *)self _updateCurvedText];
    }
  }
}

- (id)_stickySuggestedAmountForCurrentAngle
{
  if (!self->_pinnedAmount
    || (pinnedAmountAngleIndedouble x = self->_pinnedAmountAngleIndex, pinnedAmountAngleIndex == 0x7FFFFFFFFFFFFFFFLL)
    || (([(PKBillPaymentRingView *)self _angleForAngleIndex:self->_pinnedAmountAngleIndex],
         double position = self->_angleState.position,
         double v6 = v5 + -0.172787596,
         double v7 = v5 + 0.172787596,
         position >= v6)
      ? (BOOL v8 = position > v7)
      : (BOOL v8 = 1),
        v8))
  {
    double v10 = 0;
  }
  else
  {
    double v10 = [(PKBillPaymentRingView *)self _suggestedAmountForAngleIndex:pinnedAmountAngleIndex];
  }

  return v10;
}

- (void)_updateHandleImage
{
  if (self->_isSmall)
  {
    uint64_t v3 = [(PKBillPaymentRingView *)self _suggestedAmountImageForSuggestedAmount:self->_selectedSuggestedAmount];
  }
  else
  {
    id v4 = [(PKBillPaymentRingView *)self _stickySuggestedAmountForCurrentAngle];
    if (v4)
    {
      id v5 = [(PKBillPaymentRingView *)self _suggestedAmountImageForSuggestedAmount:v4];
    }
    else
    {
      id v5 = 0;
    }

    uint64_t v3 = (uint64_t)v5;
  }
  id v6 = (id)v3;
  [(PKBillPaymentCircularView *)self->_handleView setImage:v3];
}

- (void)_updateInterestText
{
  p_dataSource = &self->_dataSource;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  id v5 = WeakRetained;
  initialDisplayAmount = self->_initialDisplayAmount;
  if (!initialDisplayAmount) {
    initialDisplayAmount = self->_effectiveDisplayAmount;
  }
  double v7 = [WeakRetained billPaymentRingView:self interestTextForAmount:initialDisplayAmount];

  BOOL v8 = [(UILabel *)self->_interestLabel text];
  id v9 = objc_loadWeakRetained((id *)p_dataSource);
  double v10 = [v9 billPaymentRingViewZeroInterestText:self];

  if (v7) {
    uint64_t v11 = v7;
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = v11;

  int v13 = PKEqualObjects();
  int v14 = PKEqualObjects();
  if (self->_needsInitialDisplay || (!self->_isSmall ? (BOOL v15 = (v13 | v14) == 0) : (BOOL v15 = 1), v15))
  {
    double v16 = 0;
    if (v13)
    {
LABEL_16:
      interestLabel = self->_interestLabel;
      id v19 = v10;
      goto LABEL_18;
    }
  }
  else
  {
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F88168]) initWithMass:3.0 stiffness:1000.0 damping:500.0];
    double v16 = v17;
    if (v13)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __44__PKBillPaymentRingView__updateInterestText__block_invoke;
      v22[3] = &unk_1E59D2EB0;
      v22[4] = self;
      [v17 setAnimationDelayHandler:v22];
      goto LABEL_16;
    }
  }
  interestLabel = self->_interestLabel;
  id v19 = v12;
LABEL_18:
  [(UILabel *)interestLabel setText:v19];
  if (v16) {
    [(PKBillPaymentRingView *)self layoutIfNeeded];
  }
  double v20 = 1.0;
  if (v13) {
    double v20 = 0.0;
  }
  self->_double interestLabelAlpha = v20;
  if ((v13 & 1) == 0) {
    [(UILabel *)self->_interestLabel setText:v12];
  }
  [(PKBillPaymentRingView *)self setNeedsLayout];
  if (v16)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__PKBillPaymentRingView__updateInterestText__block_invoke_2;
    v21[3] = &unk_1E59CA7D0;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingFactory:withDelay:options:animations:completion:", v16, 4, v21, 0, 0.0);
  }
}

double __44__PKBillPaymentRingView__updateInterestText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v6 isEqualToString:@"opacity"] & 1) != 0
    || (double v7 = 0.0, [v6 isEqualToString:@"position"]))
  {
    if (*(id *)(*(void *)(a1 + 32) + 1016) == v5) {
      double v7 = 0.35;
    }
    else {
      double v7 = 0.0;
    }
  }

  return v7;
}

uint64_t __44__PKBillPaymentRingView__updateInterestText__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_pauseRenderLoop
{
  [(PKRenderLoop *)self->_renderLoop setPaused:1];
  if (!self->_dragging)
  {
    feedbackGenerator = self->_feedbackGenerator;
    self->_feedbackGenerator = 0;
  }
  initialDisplayAmount = self->_initialDisplayAmount;
  if (initialDisplayAmount && !self->_needsInitialDisplay)
  {
    self->_initialDisplayAmount = 0;
  }
}

- (double)_angleForAmount:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_suggestedAmountAngles count];
  [v4 doubleValue];
  double v7 = v6;
  double minimumPaymentAmount = self->_minimumPaymentAmount;
  if (v6 >= minimumPaymentAmount)
  {
    if (v5)
    {
      uint64_t v11 = 0;
      double v12 = 0.523598776;
      while (1)
      {
        int v13 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v11];
        int v14 = [(NSDictionary *)self->_suggestedAmountsForAngle objectForKeyedSubscript:v13];
        BOOL v15 = [v14 amount];
        [v15 doubleValue];
        double v17 = v16;

        [v13 doubleValue];
        double v10 = v18;
        if (v7 < v17) {
          break;
        }

        ++v11;
        double v12 = v10;
        double minimumPaymentAmount = v17;
        if (v5 == v11) {
          goto LABEL_14;
        }
      }
      if (v17 != minimumPaymentAmount)
      {
        double v19 = fmin(fmax((v7 - minimumPaymentAmount) / (v17 - minimumPaymentAmount), 0.0), 1.0);
        double v12 = v10 * v19 + v12 * (1.0 - v19);
      }

      double v10 = v12;
    }
    else
    {
      double v10 = 6.28318531;
    }
  }
  else if (self->_isSmall)
  {
    double v9 = fmin(fmax(v6 / minimumPaymentAmount, 0.0), 1.0);
    double v10 = v9 * 0.523598776 + (1.0 - v9) * 0.226892803;
  }
  else
  {
    double v10 = dbl_1A0443D60[v5 == 0];
  }
LABEL_14:

  return v10;
}

- (id)_roundedAmountForAngle:(double)a3
{
  NSUInteger v5 = [(NSArray *)self->_suggestedAmountAngles count];
  double maximumPaymentAmount = self->_maximumPaymentAmount;
  double minimumPaymentAmount = self->_minimumPaymentAmount;
  if (!v5)
  {
    double v9 = self->_maximumPaymentAmount;
    if (a3 >= 0.523598776)
    {
      double v9 = self->_maximumPaymentAmount;
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  double v8 = 0.523598776;
  double v9 = self->_minimumPaymentAmount;
  if (a3 < 0.523598776)
  {
LABEL_8:
    if (self->_isSmall)
    {
      double v18 = fmin(fmax((a3 + -0.226892803) / 0.296705973, 0.0), 1.0);
      double v9 = v18 * minimumPaymentAmount + minimumPaymentAmount * (1.0 - v18);
    }
    goto LABEL_14;
  }
  NSUInteger v10 = v5;
  uint64_t v11 = 0;
  while (1)
  {
    double v12 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v11];
    int v13 = [(NSDictionary *)self->_suggestedAmountsForAngle objectForKeyedSubscript:v12];
    int v14 = [v13 amount];
    [v14 doubleValue];
    double v9 = v15;

    [v12 doubleValue];
    double v17 = v16;
    if (v16 > a3) {
      break;
    }

    ++v11;
    double minimumPaymentAmount = v9;
    double v8 = v17;
    if (v10 == v11)
    {
      double minimumPaymentAmount = v9;
      goto LABEL_14;
    }
  }
  double v19 = minimumPaymentAmount;
  if (v16 != v8)
  {
    double v20 = fmin(fmax((a3 - v8) / (v16 - v8), 0.0), 1.0);
    double v19 = v9 * v20 + minimumPaymentAmount * (1.0 - v20);
  }

  double maximumPaymentAmount = v9;
  double v9 = v19;
LABEL_14:
  double v21 = fmin(fmax(self->_amountRoundingUnit * round(v9 / self->_amountRoundingUnit), minimumPaymentAmount), maximumPaymentAmount);
  double v22 = (void *)MEMORY[0x1E4F28C28];
  double v23 = [NSNumber numberWithDouble:v21];
  double v24 = v23;
  if (v23)
  {
    [v23 decimalValue];
  }
  else
  {
    v27[0] = 0;
    v27[1] = 0;
    int v28 = 0;
  }
  char v25 = [v22 decimalNumberWithDecimal:v27];

  return v25;
}

- (BOOL)_isAmount:(id)a3 withinRoundingUnitOfAmount:(id)a4
{
  id v6 = a4;
  [a3 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  double v10 = v9;

  double amountRoundingUnit = self->_amountRoundingUnit;
  return v8 <= v10 + amountRoundingUnit && v8 >= v10 - amountRoundingUnit;
}

- (CGPoint)_centerPointAtAngle:(double)a3 adjustToCover:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKBillPaymentRingView *)self _center];
  double v8 = v7;
  double v10 = v9;
  [(PKRingGradientView *)self->_ringView frame];
  CGFloat v11 = CGRectGetWidth(v20) * 0.5;
  [(PKBillPaymentRingView *)self _ringWidth];
  double v13 = v11 - v12 * 0.5;
  if (v4)
  {
    double v14 = PKUIPixelLength();
    a3 = a3 + asin(v14 / v13) * -5.0;
  }
  float v15 = a3;
  __float2 v16 = __sincosf_stret(v15);
  double v17 = v10 + v13 * v16.__sinval;
  double v18 = v8 + v13 * v16.__cosval;
  result.double y = v17;
  result.double x = v18;
  return result;
}

- (double)_offsetAngle:(double)a3
{
  return a3 + 4.71238898;
}

- (double)_offsetCurrentAngle
{
  [(PKBillPaymentRingView *)self _offsetAngle:self->_angleState.position];
  return result;
}

- (CGPoint)_center
{
  [(PKRingGradientView *)self->_ringView frame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGFloat MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v11);
  double v8 = MidX;
  result.CGFloat y = MidY;
  result.CGFloat x = v8;
  return result;
}

- (double)_ringWidth
{
  [(PKRingGradientView *)self->_ringView totalWidth];
  return result;
}

- (double)_amountLabelMaximumFontSize
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 57.0;
  if (!v2) {
    return 42.0;
  }
  return result;
}

- (unint64_t)_unnormalizedAngleIndexForAngle:(double)a3
{
  NSUInteger v5 = [(NSArray *)self->_suggestedAmountAngles count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v6 = v5;
  unint64_t v7 = 0;
  double v8 = fmax(a3, 0.523598776);
  unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    CGRect v10 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:v7];
    [v10 doubleValue];
    if (v8 >= v11) {
      unint64_t v9 = v7;
    }

    ++v7;
  }
  while (v6 != v7);
  return v9;
}

- (unint64_t)_segmentEndAngleIndexForAngle:(double)a3
{
  unint64_t result = [(NSArray *)self->_suggestedAmountAngles count];
  if (result)
  {
    unint64_t v6 = result;
    unint64_t v7 = [(PKBillPaymentRingView *)self _unnormalizedAngleIndexForAngle:a3];
    if (v7 + 1 < v6 - 1) {
      unint64_t v8 = v7 + 1;
    }
    else {
      unint64_t v8 = v6 - 1;
    }
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v8;
    }
  }
  return result;
}

- (double)_angleForAngleIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_suggestedAmountAngles count] <= a3) {
    return 0.0;
  }
  NSUInteger v5 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:a3];
  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (id)_suggestedAmountForAngleIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_suggestedAmountAngles count] <= a3)
  {
    double v7 = 0;
  }
  else
  {
    suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
    double v6 = [(NSArray *)self->_suggestedAmountAngles objectAtIndexedSubscript:a3];
    double v7 = [(NSDictionary *)suggestedAmountsForAngle objectForKeyedSubscript:v6];
  }

  return v7;
}

- (id)_suggestedAmountImageForSuggestedAmount:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (v4)
  {
    if ([v4 category] == 1)
    {
      suggestedAmoutImages = self->_suggestedAmoutImages;
      double v7 = &unk_1EF2B8FD0;
LABEL_10:
      unint64_t v9 = [(NSDictionary *)suggestedAmoutImages objectForKey:v7];
      goto LABEL_12;
    }
    if ([v5 category] == 19)
    {
      suggestedAmoutImages = self->_suggestedAmoutImages;
LABEL_6:
      double v7 = &unk_1EF2B8FE8;
      goto LABEL_10;
    }
    if ([v5 category] == 18)
    {
      unint64_t v8 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList suggestedAmountWithCategory:19];

      suggestedAmoutImages = self->_suggestedAmoutImages;
      if (v8)
      {
        double v7 = &unk_1EF2B9000;
        goto LABEL_10;
      }
      goto LABEL_6;
    }
  }
  unint64_t v9 = 0;
LABEL_12:

  return v9;
}

- (id)_targetGradientStateForAngle:(double)a3
{
  unint64_t v5 = -[PKBillPaymentRingView _segmentEndAngleIndexForAngle:](self, "_segmentEndAngleIndexForAngle:");
  unint64_t v6 = v5;
  if (v5) {
    unint64_t v7 = v5 - 1;
  }
  else {
    unint64_t v7 = 0;
  }
  [(PKBillPaymentRingView *)self _angleForAngleIndex:v5];
  double v9 = v8;
  CGRect v10 = [(PKBillPaymentRingView *)self _suggestedAmountForAngleIndex:v6];
  double v11 = [(PKBillPaymentRingView *)self _gradientStateForSuggestedAmount:v10];

  if (v7 == v6)
  {
    double v12 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList smalllestSuggestionAmountBelowRemainingStatementAmount];
    int v13 = objc_msgSend(v12, "pk_isPositiveNumber");

    if (v13)
    {
      standardRingStates = self->_standardRingStates;
      float v15 = &unk_1EF2B8FD0;
    }
    else
    {
      CGRect v20 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList remainingStatementAmount];

      standardRingStates = self->_standardRingStates;
      if (v20) {
        float v15 = &unk_1EF2B9000;
      }
      else {
        float v15 = &unk_1EF2B8FE8;
      }
    }
    double v19 = [(NSDictionary *)standardRingStates objectForKeyedSubscript:v15];
    double v17 = 0.523598776;
  }
  else
  {
    [(PKBillPaymentRingView *)self _angleForAngleIndex:v7];
    double v17 = v16;
    double v18 = [(PKBillPaymentRingView *)self _suggestedAmountForAngleIndex:v7];
    double v19 = [(PKBillPaymentRingView *)self _gradientStateForSuggestedAmount:v18];
  }
  double v21 = fmin(v9 - v17, 0.172787596);
  if (v9 - v21 >= a3)
  {
    id v22 = v19;
  }
  else if (v9 <= a3)
  {
    id v22 = v11;
  }
  else
  {
    id v22 = [(PKBillPaymentRingView *)self _blendFromGradientState:v19 toState:v11 withProgress:(a3 - (v9 - v21)) / v21];
  }
  double v23 = v22;

  return v23;
}

- (id)_gradientStateForSuggestedAmount:(id)a3
{
  id v4 = [a3 amount];
  unint64_t v5 = [(NSDictionary *)self->_colorStops objectForKeyedSubscript:&unk_1EF2B8FD0];
  unint64_t v6 = [(NSDictionary *)self->_colorStops objectForKeyedSubscript:&unk_1EF2B8FE8];
  unint64_t v7 = [(NSDictionary *)self->_colorStops objectForKeyedSubscript:&unk_1EF2B9018];
  if (v5) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  unsigned int v9 = !v8;
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = [v4 compare:v5];
  }
  if (v6) {
    BOOL v11 = v4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = [v4 compare:v6];
  }
  if (v7) {
    BOOL v14 = v4 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = !v14;
  if (v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = [v4 compare:v7];
  }
  if (v10 == 1) {
    unsigned int v17 = 0;
  }
  else {
    unsigned int v17 = v9;
  }
  int v18 = v12 ^ 1;
  if (v13 == 1) {
    int v18 = 1;
  }
  if (v17) {
    int v18 = 0;
  }
  if ((unint64_t)(v10 - 1) < 0xFFFFFFFFFFFFFFFELL) {
    uint64_t v19 = v9;
  }
  else {
    uint64_t v19 = 0;
  }
  if (v17) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 1;
  }
  if (v13 != -1) {
    uint64_t v20 = 2;
  }
  if (v12) {
    uint64_t v19 = v20;
  }
  if (v18) {
    uint64_t v21 = 2;
  }
  else {
    uint64_t v21 = v19;
  }
  if (v17) {
    uint64_t v22 = v19;
  }
  else {
    uint64_t v22 = v21;
  }
  if (v16 != -1) {
    uint64_t v22 = 3;
  }
  if (v15) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = v19;
  }
  standardRingStates = self->_standardRingStates;
  char v25 = [NSNumber numberWithUnsignedInteger:v23];
  double v26 = [(NSDictionary *)standardRingStates objectForKeyedSubscript:v25];

  return v26;
}

- (void)_createSuggestedAmountsImageDictionary
{
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = PKPassKitUIBundle();
  id v4 = [v3 URLForResource:@"Bill_Payment_Exclamation" withExtension:@"pdf"];

  double v5 = PKUIScreenScale();
  unint64_t v6 = PKUIImageFromPDF(v4, 18.0, 18.0, v5);
  [v17 setObject:v6 forKey:&unk_1EF2B8FD0];
  unint64_t v7 = PKPassKitUIBundle();
  BOOL v8 = [v7 URLForResource:@"Bill_Payment_Checkmark" withExtension:@"pdf"];

  double v9 = PKUIScreenScale();
  uint64_t v10 = PKUIImageFromPDF(v8, 18.0, 18.0, v9);

  [v17 setObject:v10 forKey:&unk_1EF2B9000];
  BOOL v11 = PKPassKitUIBundle();
  int v12 = [v11 URLForResource:@"Bill_Payment_Star" withExtension:@"pdf"];

  double v13 = PKUIScreenScale();
  BOOL v14 = PKUIImageFromPDF(v12, 18.0, 18.0, v13);

  [v17 setObject:v14 forKey:&unk_1EF2B8FE8];
  int v15 = (NSDictionary *)[v17 copy];
  suggestedAmoutImages = self->_suggestedAmoutImages;
  self->_suggestedAmoutImages = v15;
}

- (void)_createSuggestedAmountAngles
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList minimumAmount];
  CGFloat v54 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList maximumAmount];
  [v54 doubleValue];
  double v5 = v4;
  if (v3) {
    [v3 doubleValue];
  }
  else {
    double v6 = 0.0;
  }
  double v7 = v5 - v6;
  double v8 = 0.01;
  double v55 = v3;
  if (v7 != 0.0)
  {
    unint64_t v9 = 0;
    double v10 = 1.79769313e308;
    double v11 = fabs(v7) / 100.0;
    while (1)
    {
      double v12 = v9 >= 0xA
          ? __exp10((double)((v9 - 10) / 3u + 2)) * RoundingUnit_map[(v9 - 10) % 3u]
          : dbl_1A0443E18[v9];
      if (v12 >= v11) {
        break;
      }
      double v13 = v11 - v12;
      if (v13 < v10 && v13 > 0.0)
      {
        double v10 = v13;
        if (v9++ != 99) {
          continue;
        }
      }
      goto LABEL_16;
    }
    double v8 = v12;
  }
LABEL_16:
  if (v3)
  {
    [v3 doubleValue];
    double v16 = v15;
  }
  else
  {
    id v17 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList remainingStatementAmount];
    int v18 = v17;
    double v16 = v8;
    if (v17)
    {
      [v17 doubleValue];
      double v16 = fmin(v19, v8);
    }
    uint64_t v20 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList maximumAmount];

    if (v20)
    {
      [v20 doubleValue];
      double v16 = fmin(v21, v16);
    }
    uint64_t v3 = v55;
  }
  self->_double amountRoundingUnit = v8;
  self->_double minimumPaymentAmount = v16;
  self->_double maximumPaymentAmount = v5;
  double v22 = vabdd_f64(v5, v16);
  uint64_t v23 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList suggestedAmountWithCategory:18];
  double v24 = [v23 amount];

  [v24 doubleValue];
  double v26 = v25;
  char v57 = 0;
  double v56 = 0.0;
  if (v24)
  {
    double v27 = 0.0;
    if (v5 - v16 == 0.0) {
      goto LABEL_36;
    }
    double v28 = fmin(fmax((v25 - v16) / v22, 0.0), 1.0);
    double v29 = v28 * 6.28318531 + (1.0 - v28) * 0.523598776;
    if (v3) {
      char v30 = [v24 isEqual:v3];
    }
    else {
      char v30 = 0;
    }
    char v31 = [v24 isEqual:v54];
    double v27 = 5.75958653;
    if (v29 > 5.75958653 && (v31 & 1) == 0) {
      goto LABEL_30;
    }
    char v57 = 0;
    double v56 = 0.0;
    if (v3)
    {
      double v27 = 1.04719755;
      if (v29 < 1.04719755)
      {
        if ((v30 & 1) == 0)
        {
LABEL_30:
          double v22 = fabs(v26 - v16);
          double v56 = vabdd_f64(v5, v26);
          char v57 = 1;
          goto LABEL_36;
        }
        char v57 = 0;
      }
    }
  }
  double v27 = 0.0;
LABEL_36:
  double v53 = v24;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  BOOL v33 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList sortedSuggestedAmounts];
  uint64_t v34 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v60 != v36) {
          objc_enumerationMutation(v33);
        }
        CGRect v38 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        CGRect v39 = objc_msgSend(v38, "amount", v53);
        [v39 doubleValue];
        double v41 = v40;

        if (v41 >= self->_minimumPaymentAmount && v41 <= self->_maximumPaymentAmount)
        {
          if (v57)
          {
            if (v22 <= 0.0)
            {
              if (v41 <= v26) {
                double v42 = v27;
              }
              else {
                double v42 = 6.28318531;
              }
            }
            else
            {
              if (v41 > v26)
              {
                double v42 = 6.28318531;
                if (v56 > 0.0)
                {
                  double v43 = fmin(fmax((v41 - v26) / v56, 0.0), 1.0);
                  double v42 = v43 * 6.28318531 + v27 * (1.0 - v43);
                }
                goto LABEL_55;
              }
              double v47 = fmin(fmax((v41 - v16) / v22, 0.0), 1.0);
              double v45 = 1.0 - v47;
              double v46 = v27 * v47;
LABEL_54:
              double v42 = v46 + v45 * 0.523598776;
            }
          }
          else
          {
            double v42 = 6.28318531;
            if (v22 > 0.0)
            {
              double v44 = fmin(fmax((v41 - v16) / v22, 0.0), 1.0);
              double v45 = 1.0 - v44;
              double v46 = v44 * 6.28318531;
              goto LABEL_54;
            }
          }
LABEL_55:
          double v48 = [NSNumber numberWithDouble:v42];
          [v32 addObject:v48];
          [v58 setObject:v38 forKeyedSubscript:v48];

          continue;
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v59 objects:v63 count:16];
    }
    while (v35);
  }

  [v32 sortUsingComparator:&__block_literal_global_81];
  double v49 = (NSArray *)[v32 copy];
  suggestedAmountAngles = self->_suggestedAmountAngles;
  self->_suggestedAmountAngles = v49;

  uint64_t v51 = (NSDictionary *)[v58 copy];
  suggestedAmountsForAngle = self->_suggestedAmountsForAngle;
  self->_suggestedAmountsForAngle = v51;
}

uint64_t __53__PKBillPaymentRingView__createSuggestedAmountAngles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  if (v6 < v8) {
    return -1;
  }
  else {
    return v6 > v8;
  }
}

- (void)_createStandardColors
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = 0;
  int64x2_t v20 = vdupq_n_s64(0x3FD7D7D7D7D5AFEEuLL);
  do
  {
    id v4 = [PKBillPaymentRingGradientState alloc];
    switch(v3)
    {
      case 0:
        CGFloat components = 1.0;
        long long v5 = (__int128)v20;
        goto LABEL_7;
      case 1:
        CGFloat components = 0.992;
        long long v5 = xmmword_1A0443D90;
        goto LABEL_7;
      case 2:
        CGFloat components = 0.105882353;
        long long v5 = xmmword_1A0443D80;
        goto LABEL_7;
      case 3:
        CGFloat components = 0.0392156863;
        long long v5 = xmmword_1A0443D70;
LABEL_7:
        long long v22 = v5;
        uint64_t v23 = 0x3FF0000000000000;
        break;
      default:
        break;
    }
    double v6 = (CGColorSpace *)PKColorSpaceStandardRGB();
    double v7 = CGColorCreate(v6, &components);
    double v8 = [MEMORY[0x1E4FB1618] colorWithCGColor:v7];
    CGColorRelease(v7);
    unint64_t v9 = objc_msgSend(v8, "pkui_extendedLinearColor");

    switch(v3)
    {
      case 0:
        CGFloat components = 0.960784314;
        long long v10 = xmmword_1A0443DD0;
        goto LABEL_13;
      case 1:
        CGFloat components = 1.0;
        long long v10 = xmmword_1A0443DC0;
        goto LABEL_13;
      case 2:
        CGFloat components = 0.71372549;
        long long v10 = xmmword_1A0443DB0;
        goto LABEL_13;
      case 3:
        CGFloat components = 0.615686275;
        long long v10 = xmmword_1A0443DA0;
LABEL_13:
        long long v22 = v10;
        uint64_t v23 = 0x3FF0000000000000;
        break;
      default:
        break;
    }
    double v11 = (CGColorSpace *)PKColorSpaceStandardRGB();
    double v12 = CGColorCreate(v11, &components);
    double v13 = [MEMORY[0x1E4FB1618] colorWithCGColor:v12];
    CGColorRelease(v12);
    BOOL v14 = objc_msgSend(v13, "pkui_extendedLinearColor");

    double v15 = [(PKBillPaymentRingGradientState *)v4 initWithStartColor:v9 endColor:v14];
    double v16 = [NSNumber numberWithUnsignedInteger:v3];
    [v2 setObject:v15 forKeyedSubscript:v16];

    ++v3;
  }
  while (v3 != 4);
  id v17 = (NSDictionary *)[v2 copy];
  standardRingStates = self->_standardRingStates;
  self->_standardRingStates = v17;
}

- (void)_createSuggestedAmountRingColorStops
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList minimumAmount];
  id v4 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList remainingStatementAmount];
  long long v5 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList maximumAmount];
  double v6 = [(PKBillPaymentSuggestedAmountList *)self->_suggestedAmountList suggestedAmountWithCategory:30];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 amount];

    long long v5 = (void *)v8;
  }
  if (PKEqualObjects())
  {

    long long v5 = 0;
  }
  [v11 setObject:v3 forKeyedSubscript:&unk_1EF2B8FD0];
  [v11 setObject:v4 forKeyedSubscript:&unk_1EF2B8FE8];
  [v11 setObject:v5 forKeyedSubscript:&unk_1EF2B9018];
  unint64_t v9 = (NSDictionary *)[v11 copy];
  colorStops = self->_colorStops;
  self->_colorStops = v9;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PKBillPaymentRingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKBillPaymentRingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKBillPaymentRingViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PKBillPaymentRingViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (BOOL)isSmall
{
  return self->_isSmall;
}

- (PKEnterCurrencyAmountView)enterCurrencyAmountView
{
  return self->_enterCurrencyAmountView;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomCurvedTextLabel, 0);
  objc_storeStrong((id *)&self->_topCurvedTextLabel, 0);
  objc_storeStrong((id *)&self->_interestLabel, 0);
  objc_storeStrong((id *)&self->_enterCurrencyAmountView, 0);
  objc_storeStrong((id *)&self->_handleView, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_overrideGradientState, 0);
  objc_storeStrong((id *)&self->_initialDisplayAmount, 0);
  objc_storeStrong((id *)&self->_dragRecognizer, 0);
  objc_storeStrong((id *)&self->_pressRecognizer, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_renderLoop, 0);
  objc_storeStrong((id *)&self->_pinnedAmount, 0);
  objc_storeStrong((id *)&self->_highlightedSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_selectedSuggestedAmount, 0);
  objc_storeStrong((id *)&self->_effectiveDisplayAmount, 0);
  objc_storeStrong((id *)&self->_overrideDisplayAmount, 0);
  objc_storeStrong((id *)&self->_displayAmount, 0);
  objc_storeStrong((id *)&self->_colorStops, 0);
  objc_storeStrong((id *)&self->_standardRingStates, 0);
  objc_storeStrong((id *)&self->_suggestedAmountsForAngle, 0);
  objc_storeStrong((id *)&self->_suggestedAmountAngles, 0);
  objc_storeStrong((id *)&self->_suggestedAmoutImages, 0);
  objc_storeStrong((id *)&self->_suggestedAmountViews, 0);

  objc_storeStrong((id *)&self->_suggestedAmountList, 0);
}

@end