@interface PUProgressIndicatorView
- (BOOL)isDeterminate;
- (BOOL)isShowingProgress;
- (BOOL)isStyleCompactBackground;
- (BOOL)isStyleDark;
- (BOOL)showsBackground;
- (CGSize)intrinsicContentSize;
- (NSString)localizedMessage;
- (PUProgressIndicatorView)initWithCoder:(id)a3;
- (PUProgressIndicatorView)initWithFrame:(CGRect)a3;
- (PUProgressIndicatorView)initWithStyle:(int64_t)a3;
- (double)_timestampBeganShowing;
- (double)currentProgress;
- (double)defaultProgressIndicatorDelay;
- (id)_newVisualEffectBackgroundView;
- (int64_t)_currentState;
- (int64_t)style;
- (void)_endShowingProgressIfReady;
- (void)_handleBeginShowingAnimated:(BOOL)a3 wasImmediate:(BOOL)a4;
- (void)_setCurrentState:(int64_t)a3;
- (void)_setTimestampBeganShowing:(double)a3;
- (void)_updatePieProgress;
- (void)_updateProgressViewsAnimated:(BOOL)a3 completion:(id)a4;
- (void)_updateProgressViewsWithAnimation:(int64_t)a3 completion:(id)a4;
- (void)_updateSubviewsOrdering;
- (void)beginShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4;
- (void)beginShowingProgressWithDelay:(double)a3 animated:(BOOL)a4;
- (void)endShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)setCurrentProgress:(double)a3;
- (void)setDeterminate:(BOOL)a3;
- (void)setLocalizedMessage:(id)a3;
- (void)setShowsBackground:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation PUProgressIndicatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_labelAndPieProgressConstraints, 0);
  objc_storeStrong((id *)&self->_labelAndSpinnerConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabelConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundViewConstraints, 0);
  objc_storeStrong((id *)&self->_pieProgressViewConstraints, 0);
  objc_storeStrong((id *)&self->_spinnerViewConstraints, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_pieProgressView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

- (void)_setTimestampBeganShowing:(double)a3
{
  self->__timestampBeganShowing = a3;
}

- (double)_timestampBeganShowing
{
  return self->__timestampBeganShowing;
}

- (int64_t)_currentState
{
  return self->__currentState;
}

- (BOOL)showsBackground
{
  return self->_showsBackground;
}

- (BOOL)isDeterminate
{
  return self->_isDeterminate;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (double)currentProgress
{
  return self->_currentProgress;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isStyleDark
{
  return ![(PUProgressIndicatorView *)self style] || [(PUProgressIndicatorView *)self style] == 5;
}

- (BOOL)isStyleCompactBackground
{
  return [(PUProgressIndicatorView *)self style] == 4 || [(PUProgressIndicatorView *)self style] == 5;
}

- (void)_setCurrentState:(int64_t)a3
{
  switch(self->__currentState)
  {
    case 0:
      if (a3 != 1) {
        goto LABEL_9;
      }
      break;
    case 1:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 2) {
        goto LABEL_9;
      }
      break;
    case 2:
      if (a3 != 3) {
        goto LABEL_9;
      }
      break;
    case 3:
      if (a3 != 4) {
        goto LABEL_9;
      }
      break;
    default:
LABEL_9:
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUProgressIndicatorView.m", 703, @"Invalid transition %ld %ld", self->__currentState, a3);

      break;
  }
  self->__currentState = a3;
}

- (void)_endShowingProgressIfReady
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__endShowingProgressIfReady object:0];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(PUProgressIndicatorView *)self _timestampBeganShowing];
  if (v5 - v4 + 1.0 <= 0.0 || self->_wantsImmediateHide)
  {
    [(PUProgressIndicatorView *)self _setCurrentState:4];
    BOOL v6 = !self->_wantsImmediateHide && self->_wantsAnimatedHide;
    if (self->_wantsAnimatedHide && self->_wantsImmediateHide) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v6;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PUProgressIndicatorView__endShowingProgressIfReady__block_invoke;
    v8[3] = &unk_1E5F2ED10;
    v8[4] = self;
    [(PUProgressIndicatorView *)self _updateProgressViewsWithAnimation:v7 completion:v8];
  }
  else
  {
    -[PUProgressIndicatorView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__endShowingProgressIfReady, 0);
  }
}

void __53__PUProgressIndicatorView__endShowingProgressIfReady__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 496);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = 0;
  }
}

- (void)endShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  [(PUProgressIndicatorView *)self _setCurrentState:3];
  self->_wantsImmediateHide = a3;
  self->_wantsAnimatedHide = a4;
  v9 = (void *)[v8 copy];

  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v9;

  [(PUProgressIndicatorView *)self _endShowingProgressIfReady];
}

- (void)_handleBeginShowingAnimated:(BOOL)a3 wasImmediate:(BOOL)a4
{
  BOOL v5 = a3;
  if ([(PUProgressIndicatorView *)self _currentState] == 1)
  {
    if (a4 || ([(PUProgressIndicatorView *)self currentProgress], v7 < 0.833))
    {
      [(PUProgressIndicatorView *)self _setCurrentState:2];
      [(PUProgressIndicatorView *)self _updateProgressViewsAnimated:v5 completion:0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      -[PUProgressIndicatorView _setTimestampBeganShowing:](self, "_setTimestampBeganShowing:");
    }
    else
    {
      [(PUProgressIndicatorView *)self endShowingProgressImmediately:1 animated:v5 withCompletionHandler:0];
    }
  }
}

- (void)beginShowingProgressWithDelay:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(PUProgressIndicatorView *)self _setCurrentState:1];
  if (a3 <= 0.0)
  {
    [(PUProgressIndicatorView *)self _handleBeginShowingAnimated:v4 wasImmediate:1];
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PUProgressIndicatorView_beginShowingProgressWithDelay_animated___block_invoke;
    block[3] = &unk_1E5F2D918;
    objc_copyWeak(&v9, &location);
    BOOL v10 = v4;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __66__PUProgressIndicatorView_beginShowingProgressWithDelay_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleBeginShowingAnimated:*(unsigned __int8 *)(a1 + 40) wasImmediate:0];
}

- (void)beginShowingProgressImmediately:(BOOL)a3 animated:(BOOL)a4
{
  double v4 = 1.25;
  if (a3) {
    double v4 = 0.0;
  }
  [(PUProgressIndicatorView *)self beginShowingProgressWithDelay:a4 animated:v4];
}

- (double)defaultProgressIndicatorDelay
{
  return 1.25;
}

- (BOOL)isShowingProgress
{
  return (unint64_t)([(PUProgressIndicatorView *)self _currentState] - 1) < 2;
}

- (void)setShowsBackground:(BOOL)a3
{
  if (self->_showsBackground != a3)
  {
    self->_showsBackground = a3;
    [(PUProgressIndicatorView *)self _updateProgressViewsAnimated:0 completion:0];
  }
}

- (void)setDeterminate:(BOOL)a3
{
  if (self->_isDeterminate != a3)
  {
    self->_isDeterminate = a3;
    if (self->_spinnerView) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = self->_pieProgressView != 0;
    }
    [(PUProgressIndicatorView *)self _updateProgressViewsAnimated:v3 completion:0];
  }
}

- (void)setLocalizedMessage:(id)a3
{
  localizedMessage = self->_localizedMessage;
  if (localizedMessage != a3)
  {
    id v5 = a3;
    BOOL v6 = [(NSString *)localizedMessage length] != 0;
    dispatch_time_t v7 = (NSString *)[v5 copy];

    id v8 = self->_localizedMessage;
    self->_localizedMessage = v7;

    [(PUProgressIndicatorView *)self _updateProgressViewsAnimated:v6 completion:0];
  }
}

- (void)setCurrentProgress:(double)a3
{
  if (self->_currentProgress != a3)
  {
    self->_currentProgress = a3;
    [(PUProgressIndicatorView *)self _updatePieProgress];
  }
}

- (void)_updateSubviewsOrdering
{
  [(PUProgressIndicatorView *)self sendSubviewToBack:self->_visualEffectView];
  [(PUProgressIndicatorView *)self bringSubviewToFront:self->_spinnerView];
  messageLabel = self->_messageLabel;
  [(PUProgressIndicatorView *)self bringSubviewToFront:messageLabel];
}

- (void)_updatePieProgress
{
}

- (void)_updateProgressViewsWithAnimation:(int64_t)a3 completion:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PUProgressIndicatorView *)self _currentState] == 2 && !self->_isDeterminate)
  {
    if (!self->_spinnerView)
    {
      switch([(PUProgressIndicatorView *)self style])
      {
        case 0:
          labelAndSpinnerConstraints = 0;
          goto LABEL_82;
        case 1:
        case 3:
        case 5:
          uint64_t v18 = [MEMORY[0x1E4FB1618] whiteColor];
          goto LABEL_81;
        case 2:
          labelAndSpinnerConstraints = [MEMORY[0x1E4FB1618] whiteColor];
          uint64_t v57 = 101;
          break;
        case 4:
          uint64_t v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
LABEL_81:
          labelAndSpinnerConstraints = (void *)v18;
LABEL_82:
          uint64_t v57 = 100;
          break;
        default:
          labelAndSpinnerConstraints = 0;
          uint64_t v57 = 0;
          break;
      }
      v58 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:v57];
      spinnerView = self->_spinnerView;
      self->_spinnerView = v58;

      [(UIActivityIndicatorView *)self->_spinnerView setColor:labelAndSpinnerConstraints];
      [(UIActivityIndicatorView *)self->_spinnerView startAnimating];
      [(UIActivityIndicatorView *)self->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PUProgressIndicatorView *)self addSubview:self->_spinnerView];
      BOOL v10 = [MEMORY[0x1E4F1CA48] array];
      [v10 addObject:self->_spinnerView];
      dispatch_time_t v7 = 0;
      goto LABEL_5;
    }
LABEL_7:
    dispatch_time_t v7 = 0;
    BOOL v10 = 0;
    goto LABEL_8;
  }
  if (!self->_spinnerView) {
    goto LABEL_7;
  }
  dispatch_time_t v7 = [MEMORY[0x1E4F1CA48] array];
  [v7 addObject:self->_spinnerView];
  id v8 = self->_spinnerView;
  self->_spinnerView = 0;

  spinnerViewConstraints = self->_spinnerViewConstraints;
  self->_spinnerViewConstraints = 0;

  BOOL v10 = 0;
  labelAndSpinnerConstraints = self->_labelAndSpinnerConstraints;
  self->_labelAndSpinnerConstraints = 0;
LABEL_5:

LABEL_8:
  if ([(PUProgressIndicatorView *)self _currentState] == 2 && self->_isDeterminate)
  {
    if (!self->_pieProgressView)
    {
      int64_t v12 = [(PUProgressIndicatorView *)self style];
      if ((unint64_t)(v12 - 1) > 3) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = qword_1AEFF8428[v12 - 1];
      }
      v19 = (PLRoundProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", v13, 0.0, 0.0, 20.0, 20.0);
      pieProgressView = self->_pieProgressView;
      self->_pieProgressView = v19;

      [(PLRoundProgressView *)self->_pieProgressView setTranslatesAutoresizingMaskIntoConstraints:0];
      if ([(PUProgressIndicatorView *)self isStyleCompactBackground])
      {
        v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PLRoundProgressView *)self->_pieProgressView setManualColor:v21];
      }
      [(PUProgressIndicatorView *)self addSubview:self->_pieProgressView];
      if (!v10)
      {
        BOOL v10 = [MEMORY[0x1E4F1CA48] array];
      }
      [v10 addObject:self->_pieProgressView];
    }
  }
  else
  {
    v14 = self->_pieProgressView;
    if (v14)
    {
      if (!v7)
      {
        dispatch_time_t v7 = [MEMORY[0x1E4F1CA48] array];
        v14 = self->_pieProgressView;
      }
      [v7 addObject:v14];
      v15 = self->_pieProgressView;
      self->_pieProgressView = 0;

      pieProgressViewConstraints = self->_pieProgressViewConstraints;
      self->_pieProgressViewConstraints = 0;

      labelAndPieProgressConstraints = self->_labelAndPieProgressConstraints;
      self->_labelAndPieProgressConstraints = 0;
    }
  }
  [(PUProgressIndicatorView *)self _updatePieProgress];
  if ([(PUProgressIndicatorView *)self _currentState] == 2
    && [(NSString *)self->_localizedMessage length])
  {
    messageLabel = self->_messageLabel;
    BOOL v23 = messageLabel != 0;
    if (!messageLabel)
    {
      v24 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v25 = self->_messageLabel;
      self->_messageLabel = v24;

      [(UILabel *)self->_messageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      BOOL v26 = [(PUProgressIndicatorView *)self isStyleCompactBackground];
      v27 = +[PUInterfaceManager currentTheme];
      v28 = v27;
      v29 = self->_messageLabel;
      if (v26) {
        [v27 configureCompactProgressIndicatorMessageLabel:v29];
      }
      else {
        [v27 configureProgressIndicatorMessageLabel:v29];
      }

      [(PUProgressIndicatorView *)self addSubview:self->_messageLabel];
      if (!v10)
      {
        BOOL v10 = [MEMORY[0x1E4F1CA48] array];
      }
      [v10 addObject:self->_messageLabel];
      messageLabel = self->_messageLabel;
    }
    localizedMessage = self->_localizedMessage;
    v36 = [(UILabel *)messageLabel text];
    LOBYTE(localizedMessage) = [(NSString *)localizedMessage isEqualToString:v36];

    if ((localizedMessage & 1) == 0)
    {
      [(UILabel *)self->_messageLabel setText:self->_localizedMessage];
      int v37 = 1;
      goto LABEL_40;
    }
  }
  else
  {
    v30 = self->_messageLabel;
    if (v30)
    {
      if (!v7)
      {
        dispatch_time_t v7 = [MEMORY[0x1E4F1CA48] array];
        v30 = self->_messageLabel;
      }
      [v7 addObject:v30];
      v31 = self->_messageLabel;
      self->_messageLabel = 0;

      messageLabelConstraints = self->_messageLabelConstraints;
      self->_messageLabelConstraints = 0;

      v33 = self->_labelAndSpinnerConstraints;
      self->_labelAndSpinnerConstraints = 0;

      v34 = self->_labelAndPieProgressConstraints;
      self->_labelAndPieProgressConstraints = 0;
    }
  }
  int v37 = 0;
  BOOL v23 = 0;
LABEL_40:
  if ([(PUProgressIndicatorView *)self _currentState] == 2 && self->_showsBackground)
  {
    if (!self->_visualEffectView)
    {
      v38 = [(PUProgressIndicatorView *)self _newVisualEffectBackgroundView];
      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = v38;

      [(PUProgressIndicatorView *)self addSubview:self->_visualEffectView];
      if (!v10)
      {
        BOOL v10 = [MEMORY[0x1E4F1CA48] array];
      }
      [v10 addObject:self->_visualEffectView];
    }
  }
  else
  {
    v40 = self->_visualEffectView;
    if (v40)
    {
      if (!v7)
      {
        dispatch_time_t v7 = [MEMORY[0x1E4F1CA48] array];
        v40 = self->_visualEffectView;
      }
      [v7 addObject:v40];
      v41 = self->_visualEffectView;
      self->_visualEffectView = 0;

      backgroundViewConstraints = self->_backgroundViewConstraints;
      self->_backgroundViewConstraints = 0;
    }
  }
  if ([v10 count])
  {
    [(PUProgressIndicatorView *)self _updateSubviewsOrdering];
    BOOL v43 = a3 != 0;
    double v44 = 0.4;
    if (a3 != 1) {
      double v44 = 0.0;
    }
    if (a3 == 2) {
      double v45 = 0.2;
    }
    else {
      double v45 = v44;
    }
LABEL_62:
    if (v23 && v43)
    {
      [(PUProgressIndicatorView *)self layoutIfNeeded];
      [(PUProgressIndicatorView *)self setNeedsUpdateConstraints];
      [(PUProgressIndicatorView *)self invalidateIntrinsicContentSize];
      [(PUProgressIndicatorView *)self setNeedsLayout];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke;
      v73[3] = &unk_1E5F2ED10;
      v73[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v73 animations:v45];
      BOOL v43 = 1;
    }
    else
    {
      [(PUProgressIndicatorView *)self setNeedsUpdateConstraints];
      [(PUProgressIndicatorView *)self invalidateIntrinsicContentSize];
    }
    goto LABEL_65;
  }
  BOOL v43 = a3 != 0;
  double v46 = 0.4;
  if (a3 != 1) {
    double v46 = 0.0;
  }
  if (a3 == 2) {
    double v45 = 0.2;
  }
  else {
    double v45 = v46;
  }
  if (v37) {
    goto LABEL_62;
  }
LABEL_65:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_2;
  aBlock[3] = &unk_1E5F2EBC8;
  id v47 = v7;
  id v70 = v47;
  v71 = self;
  id v48 = v6;
  id v72 = v48;
  v49 = _Block_copy(aBlock);
  v50 = v49;
  if (v43)
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v51 = v10;
    uint64_t v52 = [v51 countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v66 != v54) {
            objc_enumerationMutation(v51);
          }
          [*(id *)(*((void *)&v65 + 1) + 8 * i) setAlpha:0.0];
        }
        uint64_t v53 = [v51 countByEnumeratingWithState:&v65 objects:v74 count:16];
      }
      while (v53);
    }

    v56 = (void *)MEMORY[0x1E4FB1EB0];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_3;
    v62[3] = &unk_1E5F2ECC8;
    id v63 = v51;
    id v64 = v47;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_4;
    v60[3] = &unk_1E5F2D990;
    id v61 = v50;
    [v56 animateWithDuration:v62 animations:v60 completion:v45];
  }
  else
  {
    (*((void (**)(void *))v49 + 2))(v49);
  }
}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "removeFromSuperview", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  if ([*(id *)(a1 + 32) count]) {
    [*(id *)(a1 + 40) invalidateIntrinsicContentSize];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v6++) setAlpha:1.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v4);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "setAlpha:", 0.0, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v20 count:16];
    }
    while (v9);
  }
}

uint64_t __72__PUProgressIndicatorView__updateProgressViewsWithAnimation_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateProgressViewsAnimated:(BOOL)a3 completion:(id)a4
{
}

- (id)_newVisualEffectBackgroundView
{
  BOOL v2 = [(PUProgressIndicatorView *)self isStyleCompactBackground];
  if (v2) {
    uint64_t v3 = 7;
  }
  else {
    uint64_t v3 = 8;
  }
  if (v2) {
    double v4 = 12.0;
  }
  else {
    double v4 = 7.0;
  }
  uint64_t v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:v3];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v5];
  id v7 = [v6 layer];
  [v7 setAllowsGroupOpacity:0];
  [v7 setCornerRadius:v4];
  [v6 setClipsToBounds:1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v6;
}

- (CGSize)intrinsicContentSize
{
  spinnerView = self->_spinnerView;
  if (spinnerView)
  {
    [(UIActivityIndicatorView *)spinnerView intrinsicContentSize];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    pieProgressView = self->_pieProgressView;
    if (pieProgressView) {
      double v7 = 20.0;
    }
    else {
      double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    if (pieProgressView) {
      double v5 = 20.0;
    }
    else {
      double v5 = *MEMORY[0x1E4F1DB30];
    }
  }
  [(UILabel *)self->_messageLabel intrinsicContentSize];
  double v10 = v5 + v9;
  if ((self->_spinnerView || self->_pieProgressView) && self->_messageLabel) {
    double v10 = v10 + 8.0;
  }
  if (self->_visualEffectView)
  {
    double v10 = v10 + 24.0;
    BOOL v11 = [(PUProgressIndicatorView *)self isStyleCompactBackground];
    double v12 = 12.0;
    if (v11) {
      double v12 = 2.0;
    }
    double v7 = v7 + v12 * 2.0;
  }
  double v13 = v10;
  double v14 = v7;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)updateConstraints
{
  BOOL v3 = [(PUProgressIndicatorView *)self isStyleCompactBackground];
  if (v3) {
    double v4 = 3.0;
  }
  else {
    double v4 = 12.0;
  }
  if (self->_spinnerView && !self->_spinnerViewConstraints)
  {
    double v5 = [MEMORY[0x1E4F1CA48] array];
    if (self->_showsBackground) {
      double v6 = v4;
    }
    else {
      double v6 = 0.0;
    }
    double v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spinnerView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:v6];
    LODWORD(v8) = 1148846080;
    [v7 setPriority:v8];
    [(NSArray *)v5 addObject:v7];
    double v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spinnerView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-v6];

    LODWORD(v10) = 1144750080;
    [v9 setPriority:v10];
    [(NSArray *)v5 addObject:v9];
    BOOL v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_spinnerView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

    LODWORD(v12) = 1144750080;
    [v11 setPriority:v12];
    [(NSArray *)v5 addObject:v11];
    [(PUProgressIndicatorView *)self addConstraints:v5];
    spinnerViewConstraints = self->_spinnerViewConstraints;
    self->_spinnerViewConstraints = v5;
  }
  if (self->_pieProgressView && !self->_pieProgressViewConstraints)
  {
    double v14 = [MEMORY[0x1E4F1CA48] array];
    if (self->_showsBackground) {
      double v15 = v4;
    }
    else {
      double v15 = 0.0;
    }
    long long v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pieProgressView attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:v15];
    LODWORD(v17) = 1148846080;
    [v16 setPriority:v17];
    [(NSArray *)v14 addObject:v16];
    long long v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pieProgressView attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-v15];

    LODWORD(v19) = 1144750080;
    [v18 setPriority:v19];
    [(NSArray *)v14 addObject:v18];
    v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pieProgressView attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

    LODWORD(v21) = 1144750080;
    [v20 setPriority:v21];
    [(NSArray *)v14 addObject:v20];
    uint64_t v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pieProgressView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:20.0];
    [(NSArray *)v14 addObject:v22];

    BOOL v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_pieProgressView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:20.0];
    [(NSArray *)v14 addObject:v23];

    [(PUProgressIndicatorView *)self addConstraints:v14];
    pieProgressViewConstraints = self->_pieProgressViewConstraints;
    self->_pieProgressViewConstraints = v14;
  }
  if (self->_messageLabel)
  {
    if (self->_messageLabelConstraints) {
      goto LABEL_42;
    }
    v25 = [MEMORY[0x1E4F1CA48] array];
    double v26 = self->_showsBackground ? v4 : 0.0;
    double v27 = v3 ? 6.0 : v26;
    v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageLabel attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:v26];
    LODWORD(v29) = 1144750080;
    [v28 setPriority:v29];
    [(NSArray *)v25 addObject:v28];
    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageLabel attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-v27];

    LODWORD(v31) = 1148846080;
    [v30 setPriority:v31];
    [(NSArray *)v25 addObject:v30];
    v32 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageLabel attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];

    LODWORD(v33) = 1144750080;
    [v32 setPriority:v33];
    [(NSArray *)v25 addObject:v32];
    [(PUProgressIndicatorView *)self addConstraints:v25];
    messageLabelConstraints = self->_messageLabelConstraints;
    self->_messageLabelConstraints = v25;

    if (self->_messageLabel)
    {
LABEL_42:
      if (!self->_spinnerView || self->_labelAndSpinnerConstraints) {
        goto LABEL_41;
      }
      v35 = [MEMORY[0x1E4F1CA48] array];
      double v36 = 5.0;
      if (!v3) {
        double v36 = 8.0;
      }
      int v37 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageLabel attribute:5 relatedBy:0 toItem:self->_spinnerView attribute:6 multiplier:1.0 constant:v36];
      LODWORD(v38) = 1148846080;
      [v37 setPriority:v38];
      [(NSArray *)v35 addObject:v37];
      [(PUProgressIndicatorView *)self addConstraints:v35];
      labelAndSpinnerConstraints = self->_labelAndSpinnerConstraints;
      self->_labelAndSpinnerConstraints = v35;

      if (self->_messageLabel)
      {
LABEL_41:
        if (self->_pieProgressView && !self->_labelAndPieProgressConstraints)
        {
          v40 = [MEMORY[0x1E4F1CA48] array];
          double v41 = 5.0;
          if (!v3) {
            double v41 = 8.0;
          }
          v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_messageLabel attribute:5 relatedBy:0 toItem:self->_pieProgressView attribute:6 multiplier:1.0 constant:v41];
          LODWORD(v43) = 1148846080;
          [v42 setPriority:v43];
          [(NSArray *)v40 addObject:v42];
          [(PUProgressIndicatorView *)self addConstraints:v40];
          labelAndPieProgressConstraints = self->_labelAndPieProgressConstraints;
          self->_labelAndPieProgressConstraints = v40;
        }
      }
    }
  }
  visualEffectView = self->_visualEffectView;
  if (visualEffectView && !self->_backgroundViewConstraints)
  {
    double v46 = _NSDictionaryOfVariableBindings(&cfstr_Visualeffectvi.isa, visualEffectView, 0);
    id v47 = [MEMORY[0x1E4F1CA48] array];
    id v48 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_visualEffectView]|" options:0 metrics:0 views:v46];
    [(NSArray *)v47 addObjectsFromArray:v48];

    v49 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[_visualEffectView]|" options:0 metrics:0 views:v46];
    [(NSArray *)v47 addObjectsFromArray:v49];

    [(PUProgressIndicatorView *)self addConstraints:v47];
    backgroundViewConstraints = self->_backgroundViewConstraints;
    self->_backgroundViewConstraints = v47;
  }
  v51.receiver = self;
  v51.super_class = (Class)PUProgressIndicatorView;
  [(PUProgressIndicatorView *)&v51 updateConstraints];
}

- (PUProgressIndicatorView)initWithCoder:(id)a3
{
  double v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUProgressIndicatorView.m" lineNumber:117 description:@"unsupported initializer"];

  return [(PUProgressIndicatorView *)self initWithStyle:0];
}

- (PUProgressIndicatorView)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUProgressIndicatorView;
  double v4 = -[PUProgressIndicatorView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v5 = v4;
  if (v4)
  {
    v4->_isDeterminate = 1;
    v4->_style = a3;
    [(PUProgressIndicatorView *)v4 setOpaque:0];
  }
  return v5;
}

- (PUProgressIndicatorView)initWithFrame:(CGRect)a3
{
  return -[PUProgressIndicatorView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end