@interface WFWidgetCell
- (BOOL)completingSuccessfully;
- (BOOL)enabled;
- (BOOL)isMultiline;
- (BOOL)isRTL;
- (BOOL)touchIsInView:(id)a3 event:(id)a4;
- (BOOL)touchesContainNonIndirectTouch:(id)a3;
- (CAGradientLayer)sheenLayer;
- (CGSize)iconViewSize;
- (NSProgress)progress;
- (NSTimer)clearCompletedTimer;
- (UIImageView)iconView;
- (UITextView)nameView;
- (UIVisualEffectView)emptyStateBackgroundView;
- (WFColor)homeScreenTintColor;
- (WFConfiguredSystemAction)action;
- (WFFloatingViewConfiguration)currentConfiguration;
- (WFWidgetCell)init;
- (WFWidgetCellDelegate)delegate;
- (WFWidgetChicletStyle)widgetChicletStyle;
- (WFWorkflowProgressView)progressView;
- (id)description;
- (id)emptyCellGradient;
- (id)imageForAction:(id)a3 dataSource:(id)a4 family:(int64_t)a5;
- (int64_t)lastKnownWidgetFamily;
- (int64_t)runningState;
- (int64_t)widgetType;
- (void)configureSheenViewIfNeededWithCornerRadius:(double)a3;
- (void)configureWithAction:(id)a3 dataSource:(id)a4 cornerRadius:(double)a5 widgetType:(int64_t)a6 family:(int64_t)a7 homeScreenTintColor:(id)a8;
- (void)dealloc;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetProgressState;
- (void)resetToEmptyState;
- (void)setClearCompletedTimer:(id)a3;
- (void)setCompletingSuccessfully:(BOOL)a3;
- (void)setCurrentConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmptyStateBackgroundView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHomeScreenTintColor:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIconViewSize:(CGSize)a3;
- (void)setLastKnownWidgetFamily:(int64_t)a3;
- (void)setNameView:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRunningState:(int64_t)a3;
- (void)setSheenLayer:(id)a3;
- (void)setWidgetType:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateGradient;
- (void)updateTextTintIfNeeded;
@end

@implementation WFWidgetCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyStateBackgroundView, 0);
  objc_storeStrong((id *)&self->_clearCompletedTimer, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_sheenLayer, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_nameView, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setEmptyStateBackgroundView:(id)a3
{
}

- (UIVisualEffectView)emptyStateBackgroundView
{
  return self->_emptyStateBackgroundView;
}

- (void)setClearCompletedTimer:(id)a3
{
}

- (NSTimer)clearCompletedTimer
{
  return self->_clearCompletedTimer;
}

- (WFWorkflowProgressView)progressView
{
  return self->_progressView;
}

- (void)setSheenLayer:(id)a3
{
}

- (CAGradientLayer)sheenLayer
{
  return self->_sheenLayer;
}

- (void)setIconViewSize:(CGSize)a3
{
  self->_iconViewSize = a3;
}

- (CGSize)iconViewSize
{
  double width = self->_iconViewSize.width;
  double height = self->_iconViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setNameView:(id)a3
{
}

- (UITextView)nameView
{
  return self->_nameView;
}

- (void)setCurrentConfiguration:(id)a3
{
}

- (WFFloatingViewConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setLastKnownWidgetFamily:(int64_t)a3
{
  self->_lastKnownWidgetFamily = a3;
}

- (int64_t)lastKnownWidgetFamily
{
  return self->_lastKnownWidgetFamily;
}

- (void)setWidgetType:(int64_t)a3
{
  self->_widgetType = a3;
}

- (int64_t)widgetType
{
  return self->_widgetType;
}

- (WFColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setCompletingSuccessfully:(BOOL)a3
{
  self->_completingSuccessfully = a3;
}

- (BOOL)completingSuccessfully
{
  return self->_completingSuccessfully;
}

- (int64_t)runningState
{
  return self->_runningState;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (WFConfiguredSystemAction)action
{
  return self->_action;
}

- (void)setDelegate:(id)a3
{
}

- (WFWidgetCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFWidgetCellDelegate *)WeakRetained;
}

- (void)handleTap:(id)a3
{
  id v4 = [(WFWidgetCell *)self delegate];
  [v4 widgetCellWasTapped:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)WFProgressPercentageCompletedContext == a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__WFWidgetCell_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2642A5EA0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else if ((void *)WFProgressUserInfoContext == a6)
  {
    v13 = [(WFWidgetCell *)self progress];
    v14 = [v13 userInfo];
    v15 = [v14 objectForKey:*MEMORY[0x263F85A68]];

    -[WFWidgetCell setRunningState:](self, "setRunningState:", [v15 integerValue]);
  }
}

void __63__WFWidgetCell_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progress];
  [v2 fractionCompleted];
  double v4 = v3;

  BOOL v5 = v4 > 0.0 && v4 < 1.0;
  if (v5 && [*(id *)(a1 + 32) runningState] != 1) {
    [*(id *)(a1 + 32) setRunningState:1];
  }
  id v7 = [*(id *)(a1 + 32) progressView];
  v6 = [*(id *)(a1 + 32) progress];
  [v6 fractionCompleted];
  objc_msgSend(v7, "setFractionCompleted:");
}

- (void)setProgress:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    [v5 fractionCompleted];
    id v5 = v8;
    if (v6 != 1.0)
    {
      progress = self->_progress;
      if (progress)
      {
        [(NSProgress *)progress removeObserver:self forKeyPath:@"fractionCompleted"];
        [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"userInfo.runningState"];
      }
      objc_storeStrong((id *)&self->_progress, a3);
      [v8 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:WFProgressPercentageCompletedContext];
      [v8 addObserver:self forKeyPath:@"userInfo.runningState" options:0 context:WFProgressUserInfoContext];
      id v5 = v8;
    }
  }
}

- (void)layoutSubviews
{
  v111[1] = *MEMORY[0x263EF8340];
  v110.receiver = self;
  v110.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v110 layoutSubviews];
  [(WFWidgetCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(WFWidgetCell *)self window];
  id v12 = [v11 screen];
  [v12 scale];
  if (v13 <= 0.0)
  {
    v14 = [MEMORY[0x263F82B60] mainScreen];
    [v14 scale];
  }
  else
  {
    v14 = [(WFWidgetCell *)self window];
    v15 = [v14 screen];
    [v15 scale];
  }
  v16 = [(WFWidgetCell *)self emptyStateBackgroundView];
  objc_msgSend(v16, "setFrame:", v4, v6, v8, v10);

  v17 = [(WFWidgetCell *)self sheenLayer];
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);

  BOOL v18 = [(WFWidgetCell *)self isRTL];
  if (v8 == v10)
  {
    [MEMORY[0x263F85130] largeGlyphSize];
  }
  else if (v10 > 50.0)
  {
    [MEMORY[0x263F85130] smallGlyphSize];
  }
  else
  {
    [MEMORY[0x263F85130] extraSmallGlyphSize];
  }
  double v19 = 8.0;
  if (v10 > 60.0) {
    double v19 = 10.0;
  }
  if (v10 <= 50.0) {
    double v19 = 6.0;
  }
  double v20 = 11.0;
  if (v8 == v10)
  {
    double v20 = 17.0;
    double v21 = 16.0;
  }
  else
  {
    double v21 = v19;
  }
  double v109 = v20;
  UIRectIntegralWithScale();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [(WFWidgetCell *)self iconView];
  objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

  double v108 = v21;
  UIRectIntegralWithScale();
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  v39 = [(WFWidgetCell *)self progressView];
  objc_msgSend(v39, "setFrame:", v32, v34, v36, v38);

  if (v8 == v10)
  {
    uint64_t v47 = *MEMORY[0x263F83430];
    v48 = [(WFWidgetCell *)self nameView];
    [v48 setMaximumContentSizeCategory:v47];

    v42 = [MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81828]];
    id v49 = objc_alloc(MEMORY[0x263F82770]);
    v44 = (void *)[v49 initForTextStyle:*MEMORY[0x263F835F0]];
    v45 = v44;
    double v46 = 36.0;
  }
  else
  {
    uint64_t v40 = *MEMORY[0x263F83420];
    v41 = [(WFWidgetCell *)self nameView];
    [v41 setMaximumContentSizeCategory:v40];

    v42 = [MEMORY[0x263F81708] systemFontOfSize:14.0 weight:*MEMORY[0x263F81828]];
    id v43 = objc_alloc(MEMORY[0x263F82770]);
    v44 = (void *)[v43 initForTextStyle:*MEMORY[0x263F835B8]];
    v45 = v44;
    double v46 = 22.0;
  }
  v50 = [v44 scaledFontForFont:v42 maximumPointSize:v46];

  v51 = [(WFWidgetCell *)self nameView];
  [v51 setFont:v50];

  BOOL v52 = [(WFWidgetCell *)self isMultiline];
  v53 = [(WFWidgetCell *)self nameView];
  v54 = [v53 textContainer];
  v55 = v54;
  if (v8 == v10 || !v52)
  {
    if (v8 == v10) {
      uint64_t v84 = 2;
    }
    else {
      uint64_t v84 = 1;
    }
    [v54 setMaximumNumberOfLines:v84];

    v85 = [(WFWidgetCell *)self nameView];
    v86 = [v85 textContainer];
    [v86 setLineFragmentPadding:0.0];

    double v87 = *MEMORY[0x263F834E8];
    double v88 = *(double *)(MEMORY[0x263F834E8] + 8);
    double v89 = *(double *)(MEMORY[0x263F834E8] + 16);
    double v90 = *(double *)(MEMORY[0x263F834E8] + 24);
    v91 = [(WFWidgetCell *)self nameView];
    objc_msgSend(v91, "setTextContainerInset:", v87, v88, v89, v90);

    v92 = [(WFWidgetCell *)self nameView];
    v93 = [v92 textContainer];
    [v93 setExclusionPaths:MEMORY[0x263EFFA68]];

    v94 = [(WFWidgetCell *)self nameView];
    objc_msgSend(v94, "sizeThatFits:", v8 + v109 * -2.0, v10);

    [v50 lineHeight];
    [v50 lineHeight];
    if (v8 == v10) {
      [v50 lineHeight];
    }
    UIRectIntegralWithScale();
    double v96 = v95;
    double v98 = v97;
    double v100 = v99;
    double v102 = v101;
    v83 = [(WFWidgetCell *)self nameView];
    objc_msgSend(v83, "setFrame:", v96, v98, v100, v102);
  }
  else
  {
    [v54 setMaximumNumberOfLines:2];

    v56 = [(WFWidgetCell *)self nameView];
    v57 = [v56 textContainer];
    [v57 setLineFragmentPadding:5.0];

    v58 = [(WFWidgetCell *)self nameView];
    v59 = [v58 textContainer];
    [v59 lineFragmentPadding];
    double v61 = v109 - v60;

    v62 = [(WFWidgetCell *)self nameView];
    objc_msgSend(v62, "setTextContainerInset:", v108, v61, v108, v61);

    UIRectIntegralWithScale();
    double v64 = v63;
    double v66 = v65;
    double v68 = v67;
    double v70 = v69;
    v71 = [(WFWidgetCell *)self nameView];
    objc_msgSend(v71, "setFrame:", v64, v66, v68, v70);

    v72 = (void *)MEMORY[0x263F824C0];
    if (v18)
    {
      v73 = [(WFWidgetCell *)self nameView];
      [v73 bounds];
      double v75 = v74 - v109 * 2.0;
      v76 = [(WFWidgetCell *)self iconView];
      [v76 bounds];
      double v78 = v75 - v77;
      v79 = [(WFWidgetCell *)self iconView];
      [v79 bounds];
      double v81 = v80 + v109 * 2.0;
      v82 = [(WFWidgetCell *)self iconView];
      [v82 bounds];
      v83 = objc_msgSend(v72, "bezierPathWithRect:", v78, 0.0, v81);
    }
    else
    {
      v73 = [(WFWidgetCell *)self iconView];
      [v73 bounds];
      double v104 = v109 + v103;
      v76 = [(WFWidgetCell *)self iconView];
      [v76 bounds];
      v83 = objc_msgSend(v72, "bezierPathWithRect:", 0.0, 0.0, v104);
    }

    v111[0] = v83;
    v105 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:1];
    v106 = [(WFWidgetCell *)self nameView];
    v107 = [v106 textContainer];
    [v107 setExclusionPaths:v105];
  }
}

- (void)setRunningState:(int64_t)a3
{
  self->_runningState = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __32__WFWidgetCell_setRunningState___block_invoke;
  v3[3] = &unk_2642A5D70;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __32__WFWidgetCell_setRunningState___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) progressView];
  double v3 = [*(id *)(a1 + 32) clearCompletedTimer];
  [v3 invalidate];

  [*(id *)(a1 + 32) setClearCompletedTimer:0];
  if (!*(void *)(a1 + 40))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__WFWidgetCell_setRunningState___block_invoke_2;
    aBlock[3] = &unk_2642A5CF8;
    id v7 = v2;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v20 = v7;
    uint64_t v21 = v8;
    uint64_t v22 = v9;
    double v10 = (void (**)(void))_Block_copy(aBlock);
    if ([*(id *)(a1 + 32) completingSuccessfully])
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 409) = 0;
      [v7 transitionToState:1];
      id v11 = (void *)MEMORY[0x263EFFA20];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __32__WFWidgetCell_setRunningState___block_invoke_5;
      v17[3] = &unk_2642A5D20;
      BOOL v18 = v10;
      id v12 = [v11 scheduledTimerWithTimeInterval:0 repeats:v17 block:1.5];
      [*(id *)(a1 + 32) setClearCompletedTimer:v12];
    }
    else
    {
      v10[2](v10);
    }

    double v6 = v20;
    goto LABEL_9;
  }
  [v2 transitionToState:0];
  if ([v2 isHidden])
  {
    [v2 setAlpha:0.0];
    [v2 setHidden:0];
    double v4 = (void *)MEMORY[0x263F82E00];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __32__WFWidgetCell_setRunningState___block_invoke_6;
    v15[3] = &unk_2642A5EA0;
    id v16 = v2;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__WFWidgetCell_setRunningState___block_invoke_7;
    v14[3] = &unk_2642A5D48;
    uint64_t v5 = *(void *)(a1 + 40);
    v14[4] = *(void *)(a1 + 32);
    v14[5] = v5;
    [v4 animateWithDuration:v15 animations:v14 completion:0.200000003];
    double v6 = v16;
LABEL_9:

    goto LABEL_10;
  }
  double v13 = [*(id *)(a1 + 32) delegate];
  [v13 widgetCellDidTransitionToState:*(void *)(a1 + 40)];

LABEL_10:
}

void __32__WFWidgetCell_setRunningState___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isHidden] && (objc_msgSend(*(id *)(a1 + 32), "alpha"), v2 <= 0.0))
  {
    id v7 = *(void **)(a1 + 40);
    [v7 resetProgressState];
  }
  else
  {
    double v3 = (void *)MEMORY[0x263F82E00];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __32__WFWidgetCell_setRunningState___block_invoke_3;
    v12[3] = &unk_2642A5EA0;
    id v13 = *(id *)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __32__WFWidgetCell_setRunningState___block_invoke_4;
    v8[3] = &unk_2642A5CD0;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v9 = v4;
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    [v3 animateWithDuration:v12 animations:v8 completion:0.200000003];
  }
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __32__WFWidgetCell_setRunningState___block_invoke_7(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 widgetCellDidTransitionToState:*(void *)(a1 + 40)];
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __32__WFWidgetCell_setRunningState___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  id v2 = [*(id *)(a1 + 40) delegate];
  [v2 widgetCellDidTransitionToState:*(void *)(a1 + 48)];

  double v3 = *(void **)(a1 + 40);
  return [v3 resetProgressState];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__WFWidgetCell_setEnabled___block_invoke;
    v5[3] = &unk_2642A5CA8;
    v5[4] = self;
    BOOL v6 = a3;
    [MEMORY[0x263F82E00] animateWithDuration:4 delay:v5 options:0 animations:0.200000003 completion:0.0];
    self->_enabled = a3;
  }
}

uint64_t __27__WFWidgetCell_setEnabled___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.5;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)resetProgressState
{
  self->_runningState = 0;
  double v3 = [(WFWidgetCell *)self progressView];
  [v3 setHidden:1];

  id v4 = [(WFWidgetCell *)self progressView];
  [v4 transitionToState:0];

  uint64_t v5 = [(WFWidgetCell *)self progressView];
  [v5 reset];

  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted"];
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"userInfo.runningState"];
  progress = self->_progress;
  self->_progress = 0;
}

- (void)resetToEmptyState
{
  action = self->_action;
  self->_action = 0;

  int64_t v4 = [(WFWidgetCell *)self widgetType];
  uint64_t v5 = [(WFWidgetCell *)self emptyStateBackgroundView];
  BOOL v6 = v5;
  if (v4 == 1)
  {

    if (!v6)
    {
      id v7 = objc_alloc(MEMORY[0x263F82E50]);
      uint64_t v8 = (void *)MEMORY[0x263F82DF0];
      id v9 = [MEMORY[0x263F824D8] effectWithStyle:7];
      uint64_t v10 = [v8 effectForBlurEffect:v9 style:1];
      uint64_t v11 = (void *)[v7 initWithEffect:v10];
      [(WFWidgetCell *)self setEmptyStateBackgroundView:v11];

      id v12 = [(WFWidgetCell *)self emptyStateBackgroundView];
      id v13 = [v12 contentView];
      v14 = [(WFWidgetCell *)self nameView];
      [v13 addSubview:v14];

      v15 = [(WFWidgetCell *)self emptyStateBackgroundView];
      id v16 = [v15 contentView];
      v17 = [(WFWidgetCell *)self iconView];
      [v16 addSubview:v17];

      [(WFWidgetCell *)self bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v26 = [(WFWidgetCell *)self emptyStateBackgroundView];
      objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

      double v27 = [(WFWidgetCell *)self emptyStateBackgroundView];
      [v27 setAutoresizingMask:18];

      double v28 = [(WFWidgetCell *)self emptyStateBackgroundView];
      [(WFWidgetCell *)self addSubview:v28];
    }
    double v29 = WFLocalizedString(@"No Shortcut");
    v30 = [(WFWidgetCell *)self nameView];
    [v30 setText:v29];

    double v31 = [MEMORY[0x263F827E8] _systemImageNamed:@"app.2.stack.3d"];
    double v32 = [v31 imageWithRenderingMode:2];
    double v33 = [(WFWidgetCell *)self iconView];
    [v33 setImage:v32];

    double v34 = [MEMORY[0x263F825C8] whiteColor];
    double v35 = [(WFWidgetCell *)self nameView];
    [v35 setTextColor:v34];

    double v36 = [MEMORY[0x263F825C8] whiteColor];
    double v37 = [(WFWidgetCell *)self iconView];
    [v37 setTintColor:v36];

    double v38 = [MEMORY[0x263F825C8] whiteColor];
    v39 = [(WFWidgetCell *)self progressView];
    [v39 setTintColor:v38];
  }
  else
  {
    [v5 removeFromSuperview];

    uint64_t v40 = [(WFWidgetCell *)self nameView];
    [v40 setText:0];

    double v38 = [(WFWidgetCell *)self iconView];
    [v38 setImage:0];
  }

  [(WFWidgetCell *)self setEnabled:v4 == 1];
  [(WFWidgetCell *)self updateGradient];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v6 touchesCancelled:a3 withEvent:a4];
  if ([(WFWidgetCell *)self enabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__WFWidgetCell_touchesCancelled_withEvent___block_invoke;
    block[3] = &unk_2642A5EA0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __43__WFWidgetCell_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPressed:0 animated:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v6 touchesEnded:a3 withEvent:a4];
  if ([(WFWidgetCell *)self enabled])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__WFWidgetCell_touchesEnded_withEvent___block_invoke;
    block[3] = &unk_2642A5EA0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __39__WFWidgetCell_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPressed:0 animated:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v18 touchesMoved:v6 withEvent:v7];
  if ([(WFWidgetCell *)self enabled]
    && [(WFWidgetCell *)self touchesContainNonIndirectTouch:v6])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          if ([(WFWidgetCell *)self touchIsInView:*(void *)(*((void *)&v14 + 1) + 8 * i) event:v7])
          {
            LOBYTE(v9) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __39__WFWidgetCell_touchesMoved_withEvent___block_invoke;
    v12[3] = &unk_2642A5CA8;
    void v12[4] = self;
    char v13 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v12);
  }
}

uint64_t __39__WFWidgetCell_touchesMoved_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPressed:*(unsigned __int8 *)(a1 + 40) animated:1];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v8 touchesBegan:v6 withEvent:a4];
  if ([(WFWidgetCell *)self enabled]
    && [(WFWidgetCell *)self touchesContainNonIndirectTouch:v6])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__WFWidgetCell_touchesBegan_withEvent___block_invoke;
    block[3] = &unk_2642A5EA0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __39__WFWidgetCell_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPressed:1 animated:1];
}

- (BOOL)touchesContainNonIndirectTouch:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "type", (void)v8) != 1)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)touchIsInView:(id)a3 event:(id)a4
{
  id v6 = a4;
  [a3 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  [(WFWidgetCell *)self bounds];
  v13.x = v8;
  v13.y = v10;
  if (CGRectContainsPoint(v14, v13)) {
    char v11 = 1;
  }
  else {
    char v11 = -[WFWidgetCell pointInside:withEvent:](self, "pointInside:withEvent:", v6, v8, v10);
  }

  return v11;
}

- (void)setHomeScreenTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_homeScreenTintColor, a3);
  [(WFWidgetCell *)self updateGradient];
  [(WFWidgetCell *)self updateTextTintIfNeeded];
}

- (void)updateTextTintIfNeeded
{
  id v3 = [MEMORY[0x263F825C8] whiteColor];
  double v17 = 0.0;
  double v18 = 0.0;
  uint64_t v15 = 0;
  double v16 = 0.0;
  homeScreenTintColor = self->_homeScreenTintColor;
  if (homeScreenTintColor
    && [(WFColor *)homeScreenTintColor getRed:&v18 green:&v17 blue:&v16 alpha:&v15])
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__WFWidgetCell_updateTextTintIfNeeded__block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_d16__0__UIColor_8l;
    *(double *)&void aBlock[4] = v17 * (v17 * 0.7152) + v18 * 0.2126 * v18 + v16 * 0.0722 * v16;
    uint64_t v5 = (double (**)(void *, void *))_Block_copy(aBlock);
    id v6 = [MEMORY[0x263F825C8] systemGray2Color];
    double v7 = v5[2](v5, v6);

    double v8 = [MEMORY[0x263F825C8] whiteColor];
    double v9 = v5[2](v5, v8);

    if (v7 > v9) {
      [MEMORY[0x263F825C8] systemGray2Color];
    }
    else {
    uint64_t v10 = [MEMORY[0x263F825C8] whiteColor];
    }

    char v11 = [(WFWidgetCell *)self nameView];
    [v11 setTextColor:v10];

    id v12 = [(WFWidgetCell *)self iconView];
    [v12 setTintColor:v10];

    id v3 = (void *)v10;
  }
  CGPoint v13 = [(WFWidgetCell *)self progressView];
  [v13 setTintColor:v3];
}

double __38__WFWidgetCell_updateTextTintIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  double v11 = 0.0;
  double v12 = 0.0;
  uint64_t v9 = 0;
  double v10 = 0.0;
  int v3 = [a2 getRed:&v12 green:&v11 blue:&v10 alpha:&v9];
  double result = 0.0;
  if (v3)
  {
    double v5 = v11 * (v11 * 0.7152) + v12 * 0.2126 * v12 + v10 * 0.0722 * v10;
    double v6 = *(double *)(a1 + 32);
    if (v5 >= v6) {
      double v7 = v11 * (v11 * 0.7152) + v12 * 0.2126 * v12 + v10 * 0.0722 * v10;
    }
    else {
      double v7 = *(double *)(a1 + 32);
    }
    double v8 = v7 + 0.05;
    if (v5 >= v6) {
      double v5 = *(double *)(a1 + 32);
    }
    return v8 / (v5 + 0.05);
  }
  return result;
}

- (void)configureSheenViewIfNeededWithCornerRadius:(double)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  double v5 = [(WFWidgetCell *)self sheenLayer];
  double v6 = [(WFWidgetCell *)self widgetChicletStyle];
  int v7 = [v6 needsSheenView];

  if (v7)
  {
    [v5 setCornerRadius:a3];
    double v8 = [MEMORY[0x263F851A8] whiteColor];
    uint64_t v9 = [v8 colorWithAlphaComponent:0.2];

    double v10 = [MEMORY[0x263F851A8] whiteColor];
    double v11 = [v10 colorWithAlphaComponent:0.001];

    id v12 = v9;
    v15[0] = [v12 CGColor];
    id v13 = v11;
    v15[1] = [v13 CGColor];
    CGRect v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:2];
    [v5 setColors:v14];
  }
  else
  {
    [v5 setColors:0];
  }
}

- (void)updateGradient
{
  if (self->_action)
  {
    if (!self->_homeScreenTintColor)
    {
      double v5 = [(WFWidgetCell *)self widgetChicletStyle];
      uint64_t v4 = [v5 baseGradient];

      goto LABEL_7;
    }
    uint64_t v3 = [objc_alloc(MEMORY[0x263F852D8]) initWithColor:self->_homeScreenTintColor];
  }
  else
  {
    uint64_t v3 = [(WFWidgetCell *)self emptyCellGradient];
  }
  uint64_t v4 = (void *)v3;
LABEL_7:
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetCell;
  [(WFFloatingView *)&v6 setGradient:v4];
}

- (id)emptyCellGradient
{
  id v2 = objc_alloc(MEMORY[0x263F852D8]);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithWhite:0.0 alpha:0.1];
  uint64_t v4 = (void *)[v2 initWithColor:v3];

  return v4;
}

- (WFWidgetChicletStyle)widgetChicletStyle
{
  uint64_t v3 = +[WFWidgetChicletStyle widgetStyleWithAction:self->_action];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[WFWidgetChicletStyle fallbackWidgetStyleWithAction:self->_action];
  }
  objc_super v6 = v5;

  return (WFWidgetChicletStyle *)v6;
}

- (id)imageForAction:(id)a3 dataSource:(id)a4 family:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([(WFWidgetCell *)self widgetType] == 1) {
    [MEMORY[0x263F85130] largeGlyphSize];
  }
  else {
    [MEMORY[0x263F85130] smallGlyphSize];
  }
  double v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v17 = [v8 contextualAction];
      double v18 = [v17 icon];
      double v19 = [v18 wfIcon];

      id v20 = v19;
      if (v20)
      {
LABEL_10:
        double v21 = v20;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v23 = (void *)MEMORY[0x263F82818];
          id v13 = v21;
          double v24 = [v23 configurationWithPointSize:5 weight:v11];
          double v25 = (void *)MEMORY[0x263F827E8];
          double v26 = [v13 symbolName];

          double v27 = [v25 _systemImageNamed:v26 withConfiguration:v24];

          double v28 = [(WFWidgetCell *)self iconView];
          [v28 setContentMode:4];

          goto LABEL_20;
        }
        id v13 = v21;
        objc_opt_class();
        char v34 = objc_opt_isKindOfClass();

        if (v34)
        {
          double v24 = [v13 image];
          uint64_t v31 = [v24 platformImage];
          goto LABEL_19;
        }
        goto LABEL_24;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_25:
        if (a5 == 1) {
          [MEMORY[0x263F85130] largeGlyphSize];
        }
        else {
          [MEMORY[0x263F85130] smallGlyphSize];
        }
        double v37 = v35;
        double v38 = v36;
        v39 = [v8 associatedBundleIdentifier];
        double v27 = +[WFApplicationIconProvider applicationIconImageForBundleIdentifier:size:](WFApplicationIconProvider, "applicationIconImageForBundleIdentifier:size:", v39, v37, v38);

        goto LABEL_29;
      }
      id v20 = [v8 previewIcon];
      if (v20) {
        goto LABEL_10;
      }
    }
    id v13 = 0;
LABEL_24:

    goto LABEL_25;
  }
  id v12 = [v8 identifier];
  id v13 = [v9 widgetWorkflowWithIdentifier:v12];

  CGRect v14 = [v13 associatedAppBundleIdentifier];

  if (v14)
  {
    if (a5 == 1) {
      [MEMORY[0x263F85130] largeGlyphSize];
    }
    else {
      [MEMORY[0x263F85130] smallGlyphSize];
    }
    double v32 = v15;
    double v33 = v16;
    double v24 = [v8 associatedBundleIdentifier];
    uint64_t v31 = +[WFApplicationIconProvider applicationIconImageForBundleIdentifier:size:](WFApplicationIconProvider, "applicationIconImageForBundleIdentifier:size:", v24, v32, v33);
    goto LABEL_19;
  }
  if (![v13 iconImage]) {
    goto LABEL_24;
  }
  id v29 = objc_alloc(MEMORY[0x263F827E8]);
  uint64_t v30 = [v13 iconImage];
  [v13 iconImageScale];
  double v24 = objc_msgSend(v29, "initWithCGImage:scale:orientation:", v30, 0);
  uint64_t v31 = [v24 imageWithRenderingMode:2];
LABEL_19:
  double v27 = (void *)v31;
LABEL_20:

  if (!v27) {
    goto LABEL_25;
  }
LABEL_29:

  return v27;
}

- (void)configureWithAction:(id)a3 dataSource:(id)a4 cornerRadius:(double)a5 widgetType:(int64_t)a6 family:(int64_t)a7 homeScreenTintColor:(id)a8
{
  id v59 = a3;
  id v15 = a4;
  id v16 = a8;
  if ([(WFWidgetCell *)self runningState] == 1)
  {
    double v17 = [(WFWidgetCell *)self action];
    if ([v17 isEqual:v59])
    {
      double v18 = [(WFWidgetCell *)self currentConfiguration];
      [v18 cornerRadius];
      if (v19 == a5)
      {
        int64_t v20 = [(WFWidgetCell *)self lastKnownWidgetFamily];

        if (v20 == a7) {
          goto LABEL_19;
        }
        goto LABEL_8;
      }
    }
  }
LABEL_8:
  objc_storeStrong((id *)&self->_action, a3);
  self->_lastKnownWidgetFamily = a7;
  self->_widgetType = a6;
  objc_storeStrong((id *)&self->_homeScreenTintColor, a8);
  BOOL v22 = a6 == 1 && a7 == 1;
  double v23 = [(WFWidgetCell *)self currentConfiguration];
  [v23 setAppliesCornerRadiusDuringTouchDownOnly:v22];

  double v24 = [(WFWidgetCell *)self currentConfiguration];
  [v24 cornerRadius];
  double v26 = v25;

  if (v26 != a5)
  {
    double v27 = [(WFWidgetCell *)self currentConfiguration];
    [v27 setCornerRadius:a5];

    double v28 = [(WFWidgetCell *)self currentConfiguration];
    [(WFFloatingView *)self applyConfiguration:v28];
  }
  [(WFWidgetCell *)self resetProgressState];
  if (v59)
  {
    id v29 = [(WFWidgetCell *)self nameView];
    [(WFWidgetCell *)self addSubview:v29];

    uint64_t v30 = [(WFWidgetCell *)self iconView];
    [(WFWidgetCell *)self addSubview:v30];

    [(WFWidgetCell *)self setEmptyStateBackgroundView:0];
    [(WFWidgetCell *)self updateGradient];
    uint64_t v31 = [v59 name];
    double v32 = [(WFWidgetCell *)self nameView];
    [v32 setText:v31];

    double v33 = [(WFWidgetCell *)self imageForAction:v59 dataSource:v15 family:a7];
    char v34 = [(WFWidgetCell *)self iconView];
    [v34 setImage:v33];

    double v35 = [(WFWidgetCell *)self widgetChicletStyle];
    double v36 = [v35 foregroundColor];
    double v37 = [v36 platformColor];
    double v38 = [(WFWidgetCell *)self iconView];
    [v38 setTintColor:v37];

    v39 = [(WFWidgetCell *)self widgetChicletStyle];
    [v39 foregroundOpacity];
    double v41 = v40;
    v42 = [(WFWidgetCell *)self iconView];
    [v42 setAlpha:v41];

    id v43 = [(WFWidgetCell *)self widgetChicletStyle];
    v44 = [v43 foregroundCompositingFilter];
    v45 = [(WFWidgetCell *)self iconView];
    double v46 = [v45 layer];
    [v46 setCompositingFilter:v44];

    [(WFWidgetCell *)self setEnabled:1];
    uint64_t v47 = [(WFWidgetCell *)self widgetChicletStyle];
    v48 = [v47 foregroundColor];
    id v49 = [v48 platformColor];
    v50 = [(WFWidgetCell *)self nameView];
    [v50 setTextColor:v49];

    v51 = [(WFWidgetCell *)self widgetChicletStyle];
    [v51 foregroundOpacity];
    double v53 = v52;
    v54 = [(WFWidgetCell *)self nameView];
    [v54 setAlpha:v53];

    v55 = [(WFWidgetCell *)self widgetChicletStyle];
    v56 = [v55 foregroundCompositingFilter];
    v57 = [(WFWidgetCell *)self nameView];
    v58 = [v57 layer];
    [v58 setCompositingFilter:v56];

    [(WFWidgetCell *)self configureSheenViewIfNeededWithCornerRadius:a5];
    [(WFWidgetCell *)self updateTextTintIfNeeded];
    [(WFWidgetCell *)self setNeedsLayout];
  }
  else
  {
    [(WFWidgetCell *)self resetToEmptyState];
  }
LABEL_19:
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetCell;
  uint64_t v4 = [(WFWidgetCell *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@, runningState: %ld", v4, -[WFWidgetCell runningState](self, "runningState")];

  return v5;
}

- (BOOL)isMultiline
{
  id v2 = [(WFWidgetCell *)self traitCollection];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  LOBYTE(v2) = UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x263F83440]) == NSOrderedDescending;
  return (char)v2;
}

- (BOOL)isRTL
{
  return [(WFWidgetCell *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (void)dealloc
{
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:WFProgressPercentageCompletedContext];
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"userInfo.runningState" context:WFProgressUserInfoContext];
  v3.receiver = self;
  v3.super_class = (Class)WFWidgetCell;
  [(WFWidgetCell *)&v3 dealloc];
}

- (WFWidgetCell)init
{
  objc_super v3 = objc_alloc_init(WFFloatingViewConfiguration);
  [(WFFloatingViewConfiguration *)v3 setShadowOpacity:0.0];
  [(WFFloatingViewConfiguration *)v3 setCornerRadius:0.0];
  [(WFFloatingViewConfiguration *)v3 setGradientDirection:4];
  v26.receiver = self;
  v26.super_class = (Class)WFWidgetCell;
  uint64_t v4 = [(WFFloatingView *)&v26 initWithConfiguration:v3];
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_currentConfiguration, v3);
    objc_super v6 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x263F157D0]);
    objc_super v7 = [(WFWidgetCell *)v5 layer];
    [v7 addSublayer:v6];

    sheenLayer = v5->_sheenLayer;
    v5->_sheenLayer = v6;
    id v9 = v6;

    [(WFWidgetCell *)v5 setEnabled:0];
    [(WFWidgetCell *)v5 setExclusiveTouch:1];
    id v10 = objc_alloc(MEMORY[0x263F82D60]);
    double v11 = (UITextView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(UITextView *)v11 setUserInteractionEnabled:0];
    [(UITextView *)v11 setEditable:0];
    [(UITextView *)v11 setSelectable:0];
    id v12 = [(UITextView *)v11 textContainer];
    [v12 setLineBreakMode:4];

    id v13 = [(UITextView *)v11 layoutManager];
    [v13 setUsesDefaultHyphenation:1];

    [(UITextView *)v11 setBackgroundColor:0];
    [(UITextView *)v11 setClipsToBounds:1];
    [(UITextView *)v11 setAdjustsFontForContentSizeCategory:1];
    [(WFWidgetCell *)v5 addSubview:v11];
    nameView = v5->_nameView;
    v5->_nameView = v11;
    id v15 = v11;

    id v16 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    [(WFWidgetCell *)v5 addSubview:v16];
    iconView = v5->_iconView;
    v5->_iconView = v16;
    double v18 = v16;

    double v19 = objc_alloc_init(WFWorkflowProgressView);
    [(WFWorkflowProgressView *)v19 setHidden:1];
    [(WFWidgetCell *)v5 addSubview:v19];
    progressView = v5->_progressView;
    v5->_progressView = v19;
    double v21 = v19;

    BOOL v22 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v5 action:sel_handleTap_];
    [v22 setNumberOfTouchesRequired:1];
    [v22 setNumberOfTapsRequired:1];
    [(WFWidgetCell *)v5 addGestureRecognizer:v22];
    [(WFFloatingView *)v5 setGradient:0];
    double v23 = [(WFWidgetCell *)v5 layer];
    [v23 setAllowsGroupBlending:0];

    double v24 = v5;
  }

  return v5;
}

@end