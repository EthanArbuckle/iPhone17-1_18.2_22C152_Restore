@interface PGControlsView
- (BOOL)PG_preferredVisibilityForView:(id)a3;
- (BOOL)_showsDimmingView;
- (BOOL)prefersControlsHidden;
- (CGRect)_prerollIndicatorFrameWithScaling:(double)a3;
- (CGRect)_progressIndicatorFrameWithScaling:(double)a3;
- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5;
- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5;
- (PGControlsView)initWithCoder:(id)a3;
- (PGControlsView)initWithFrame:(CGRect)a3 viewModel:(id)a4;
- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4;
- (id)PG_backdropGroupLeader;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)buttonViewDidReceiveTouchUpInside:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setPrefersControlsHidden:(BOOL)a3;
- (void)updateControlsAlpha;
- (void)updateControlsHidden;
- (void)updateProgress;
- (void)viewModelDidUpdateValuesFromOldValues:(id)a3;
@end

@implementation PGControlsView

- (PGControlsView)initWithFrame:(CGRect)a3 viewModel:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v60[6] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v58.receiver = self;
  v58.super_class = (Class)PGControlsView;
  v11 = -[PGLayoutContainerView initWithFrame:](&v58, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    v53 = v10;
    objc_storeStrong((id *)&v11->_viewModel, a4);
    v13 = [PGCABackdropLayerView alloc];
    [(PGControlsView *)v12 bounds];
    uint64_t v14 = -[PGCABackdropLayerView initWithFrame:captureOnly:](v13, "initWithFrame:captureOnly:", 1);
    captureOnlyView = v12->_captureOnlyView;
    v12->_captureOnlyView = (PGCABackdropLayerView *)v14;

    [(PGControlsView *)v12 addSubview:v12->_captureOnlyView];
    v16 = [PGDimmingView alloc];
    [(PGControlsView *)v12 bounds];
    uint64_t v17 = -[PGDimmingView initWithFrame:](v16, "initWithFrame:");
    dimmingView = v12->_dimmingView;
    v12->_dimmingView = (UIView *)v17;

    [(PGControlsView *)v12 addSubview:v12->_dimmingView];
    v19 = [PGLayoutContainerView alloc];
    [(PGControlsView *)v12 bounds];
    uint64_t v20 = -[PGLayoutContainerView initWithFrame:](v19, "initWithFrame:");
    hidableItemsLayoutContainerView = v12->_hidableItemsLayoutContainerView;
    v12->_hidableItemsLayoutContainerView = (PGLayoutContainerView *)v20;

    [(PGControlsView *)v12 addSubview:v12->_hidableItemsLayoutContainerView];
    uint64_t v22 = +[PGButtonView buttonWithDelegate:v12];
    cancelButton = v12->_cancelButton;
    v12->_cancelButton = (PGButtonView *)v22;

    [(PGMaterialView *)v12->_cancelButton _setContinuousCornerRadius:6.0];
    uint64_t v24 = +[PGButtonView buttonWithDelegate:v12];
    restoreButton = v12->_restoreButton;
    v12->_restoreButton = (PGButtonView *)v24;

    [(PGMaterialView *)v12->_restoreButton _setContinuousCornerRadius:6.0];
    uint64_t v26 = +[PGButtonView buttonWithDelegate:v12];
    skipBackButton = v12->_skipBackButton;
    v12->_skipBackButton = (PGButtonView *)v26;

    [(PGButtonView *)v12->_skipBackButton setGlyphSize:26.0];
    [(PGButtonView *)v12->_skipBackButton setCircular:1];
    uint64_t v28 = +[PGButtonView buttonWithDelegate:v12];
    actionButton = v12->_actionButton;
    v12->_actionButton = (PGButtonView *)v28;

    [(PGButtonView *)v12->_actionButton setGlyphSize:38.0];
    [(PGButtonView *)v12->_actionButton setCircular:1];
    uint64_t v30 = +[PGButtonView buttonWithDelegate:v12];
    skipForwardButton = v12->_skipForwardButton;
    v12->_skipForwardButton = (PGButtonView *)v30;

    [(PGButtonView *)v12->_skipForwardButton setGlyphSize:24.0];
    [(PGButtonView *)v12->_skipForwardButton setCircular:1];
    uint64_t v32 = +[PGButtonView buttonWithDelegate:v12];
    liveIndicatorBadgeButton = v12->_liveIndicatorBadgeButton;
    v12->_liveIndicatorBadgeButton = (PGButtonView *)v32;

    [(PGButtonView *)v12->_liveIndicatorBadgeButton setEnabled:0];
    [(PGMaterialView *)v12->_liveIndicatorBadgeButton _setContinuousCornerRadius:6.0];
    v34 = v12->_liveIndicatorBadgeButton;
    v35 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.75];
    [(PGButtonView *)v34 setTintColor:v35];

    v60[0] = v12->_restoreButton;
    v60[1] = v12->_cancelButton;
    v60[2] = v12->_skipBackButton;
    v60[3] = v12->_actionButton;
    v60[4] = v12->_skipForwardButton;
    v60[5] = v12->_liveIndicatorBadgeButton;
    uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:6];
    allButtons = v12->_allButtons;
    v12->_allButtons = (NSArray *)v36;

    v38 = [PGProgressIndicator alloc];
    [(PGControlsView *)v12 _progressIndicatorFrameWithScaling:1.0];
    uint64_t v39 = -[PGProgressIndicator initWithFrame:](v38, "initWithFrame:");
    progressIndicator = v12->_progressIndicator;
    v12->_progressIndicator = (PGProgressIndicator *)v39;

    [(PGLayoutContainerView *)v12->_hidableItemsLayoutContainerView addSubview:v12->_progressIndicator];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v41 = v12->_allButtons;
    uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          [(PGLayoutContainerView *)v12->_hidableItemsLayoutContainerView addSubview:*(void *)(*((void *)&v54 + 1) + 8 * v45++)];
        }
        while (v43 != v45);
        uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v43);
    }

    v46 = [PGPrerollIndicatorView alloc];
    id v10 = v53;
    uint64_t v47 = -[PGPrerollIndicatorView initWithFrame:viewModel:](v46, "initWithFrame:viewModel:", v53, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    prerollIndicatorView = v12->_prerollIndicatorView;
    v12->_prerollIndicatorView = (PGPrerollIndicatorView *)v47;

    [(PGControlsView *)v12 addSubview:v12->_prerollIndicatorView];
    v49 = [v53 values];
    [(PGControlsView *)v12 viewModelDidUpdateValuesFromOldValues:v49];

    v50 = [[PGDisplayLink alloc] initWithOwner:v12 linkFired:&__block_literal_global_7];
    displayLinkForProgressUpdates = v12->_displayLinkForProgressUpdates;
    v12->_displayLinkForProgressUpdates = v50;

    [(UIView *)v12 PG_recursivelyDisallowGroupBlending];
  }

  return v12;
}

uint64_t __42__PGControlsView_initWithFrame_viewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateProgress];
}

- (PGControlsView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2, self, @"PGControlsView.m", 113, @"You cannot do this, but Xcode thinks you can." object file lineNumber description];

  v6 = [MEMORY[0x1E4F1CA98] null];
  v7 = -[PGControlsView initWithFrame:viewModel:](self, "initWithFrame:viewModel:", v6, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));

  return v7;
}

- (void)dealloc
{
  [(PGDisplayLink *)self->_displayLinkForProgressUpdates invalidate];
  [(PGProgressIndicator *)self->_progressIndicator setIncludesWaitingToPlayIndicator:0];
  v3.receiver = self;
  v3.super_class = (Class)PGControlsView;
  [(PGControlsView *)&v3 dealloc];
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGControlsView;
  -[PGControlsView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_dimmingView _setContinuousCornerRadius:a3];
  [(UIView *)self->_contentLoadingIndicatorContainerView _setContinuousCornerRadius:a3];
}

- (void)viewModelDidUpdateValuesFromOldValues:(id)a3
{
  id v74 = a3;
  v4 = [(PGControlsViewModel *)self->_viewModel values];
  -[PGButtonView setHidden:](self->_restoreButton, "setHidden:", [v4 includesRestoreButton] ^ 1);
  -[PGButtonView setHidden:](self->_skipBackButton, "setHidden:", [v4 includesSkipBackButton] ^ 1);
  -[PGButtonView setHidden:](self->_actionButton, "setHidden:", [v4 includesActionButton] ^ 1);
  -[PGButtonView setHidden:](self->_skipForwardButton, "setHidden:", [v4 includesSkipForwardButton] ^ 1);
  -[PGButtonView setHidden:](self->_cancelButton, "setHidden:", [v4 includesCancelButton] ^ 1);
  -[PGButtonView setHidden:](self->_liveIndicatorBadgeButton, "setHidden:", [v4 includesLiveIndicatorBadge] ^ 1);
  -[PGButtonView setEnabled:](self->_skipBackButton, "setEnabled:", [v4 isSkipBackButtonEnabled]);
  -[PGButtonView setEnabled:](self->_actionButton, "setEnabled:", [v4 isActionButtonEnabled]);
  -[PGButtonView setEnabled:](self->_skipForwardButton, "setEnabled:", [v4 isSkipForwardButtonEnabled]);
  cancelButton = self->_cancelButton;
  v6 = [v4 cancelButtonImageTintColor];
  if (v6)
  {
    [(PGButtonView *)cancelButton setTintColor:v6];
  }
  else
  {
    v7 = [(PGButtonView *)self->_cancelButton enabledTintColor];
    [(PGButtonView *)cancelButton setTintColor:v7];
  }
  v8 = self->_cancelButton;
  v9 = [v4 cancelButtonBackgroundTintColor];
  [(PGMaterialView *)v8 setBackgroundColor:v9];

  skipBackButton = self->_skipBackButton;
  v11 = [v4 skipBackButtonImageTintColor];
  if (v11)
  {
    [(PGButtonView *)skipBackButton setTintColor:v11];
  }
  else
  {
    v12 = [(PGButtonView *)self->_actionButton enabledTintColor];
    [(PGButtonView *)skipBackButton setTintColor:v12];
  }
  v13 = self->_skipBackButton;
  uint64_t v14 = [v4 skipBackButtonBackgroundTintColor];
  [(PGMaterialView *)v13 setBackgroundColor:v14];

  skipForwardButton = self->_skipForwardButton;
  v16 = [v4 skipForwardButtonImageTintColor];
  if (v16)
  {
    [(PGButtonView *)skipForwardButton setTintColor:v16];
  }
  else
  {
    uint64_t v17 = [(PGButtonView *)self->_actionButton enabledTintColor];
    [(PGButtonView *)skipForwardButton setTintColor:v17];
  }
  v18 = self->_skipForwardButton;
  v19 = [v4 skipForwardButtonBackgroundTintColor];
  [(PGMaterialView *)v18 setBackgroundColor:v19];

  actionButton = self->_actionButton;
  v21 = [v4 actionButtonImageTintColor];
  if (v21)
  {
    [(PGButtonView *)actionButton setTintColor:v21];
  }
  else
  {
    uint64_t v22 = [(PGButtonView *)self->_actionButton enabledTintColor];
    [(PGButtonView *)actionButton setTintColor:v22];
  }
  v23 = self->_actionButton;
  uint64_t v24 = [v4 actionButtonBackgroundTintColor];
  [(PGMaterialView *)v23 setBackgroundColor:v24];

  v25 = self->_cancelButton;
  uint64_t v26 = [v4 cancelButtonSystemImageName];
  [(PGButtonView *)v25 setSystemImageName:v26];

  restoreButton = self->_restoreButton;
  uint64_t v28 = [v4 restoreButtonSystemImageName];
  [(PGButtonView *)restoreButton setSystemImageName:v28];

  v29 = self->_skipBackButton;
  uint64_t v30 = [v4 skipBackButtonSystemImageName];
  [(PGButtonView *)v29 setSystemImageName:v30];

  v31 = self->_actionButton;
  uint64_t v32 = [v4 actionButtonSystemImageName];
  [(PGButtonView *)v31 setSystemImageName:v32];

  v33 = self->_skipForwardButton;
  v34 = [v4 skipForwardButtonSystemImageName];
  [(PGButtonView *)v33 setSystemImageName:v34];

  v35 = self->_restoreButton;
  uint64_t v36 = [(PGButtonView *)v35 enabledTintColor];
  [(PGButtonView *)v35 setTintColor:v36];

  v37 = self->_cancelButton;
  v38 = [v4 cancelButtonAccessibilityIdentifier];
  [(PGButtonView *)v37 setAccessibilityIdentifier:v38];

  uint64_t v39 = self->_restoreButton;
  v40 = [v4 restoreButtonAccessibilityIdentifier];
  [(PGButtonView *)v39 setAccessibilityIdentifier:v40];

  v41 = self->_skipBackButton;
  uint64_t v42 = [v4 skipBackButtonAccessibilityIdentifier];
  [(PGButtonView *)v41 setAccessibilityIdentifier:v42];

  uint64_t v43 = self->_actionButton;
  uint64_t v44 = [v4 actionButtonAccessibilityIdentifier];
  [(PGButtonView *)v43 setAccessibilityIdentifier:v44];

  uint64_t v45 = self->_skipForwardButton;
  v46 = [v4 skipForwardButtonAccessibilityIdentifier];
  [(PGButtonView *)v45 setAccessibilityIdentifier:v46];

  uint64_t v47 = self->_cancelButton;
  v48 = [v4 cancelButtonCustomImage];
  [(PGButtonView *)v47 setImage:v48];

  -[PGMaterialView setBackdropHidden:](self->_cancelButton, "setBackdropHidden:", [v4 cancelButtonWantsBackground] ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_restoreButton, "setBackdropHidden:", [v4 restoreButtonWantsBackground] ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_skipBackButton, "setBackdropHidden:", [v4 actionButtonsWantBackground] ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_actionButton, "setBackdropHidden:", [v4 actionButtonsWantBackground] ^ 1);
  -[PGMaterialView setBackdropHidden:](self->_skipForwardButton, "setBackdropHidden:", [v4 actionButtonsWantBackground] ^ 1);
  int v49 = [v4 actionButtonsWantBackground];
  if (v49) {
    double v50 = 23.0;
  }
  else {
    double v50 = 21.0;
  }
  if (v49) {
    double v51 = 23.0;
  }
  else {
    double v51 = 30.0;
  }
  [(PGButtonView *)self->_skipBackButton setGlyphSize:v50];
  [(PGButtonView *)self->_actionButton setGlyphSize:v51];
  [(PGButtonView *)self->_skipForwardButton setGlyphSize:v50];
  -[PGProgressIndicator setHidden:](self->_progressIndicator, "setHidden:", [v4 includesProgressBar] ^ 1);
  [(PGControlsView *)self updateProgress];
  int v52 = [v4 isPrerollActive];
  int v53 = v52 ^ [(PGPrerollIndicatorView *)self->_prerollIndicatorView isHidden];
  if ((v53 & 1) == 0)
  {
    [(PGPrerollIndicatorView *)self->_prerollIndicatorView setHidden:v52 ^ 1u];
    progressIndicator = self->_progressIndicator;
    long long v55 = [v4 prerollTintColor];
    [(PGProgressIndicator *)progressIndicator setCustomElapsedTrackTintColor:v55];
  }
  int v56 = [v74 cancelButtonWantsBackground];
  int v57 = v56 ^ [v4 cancelButtonWantsBackground] | v53 ^ 1;
  int v58 = [v74 restoreButtonWantsBackground];
  int v59 = v58 ^ [v4 restoreButtonWantsBackground];
  int v60 = [v74 actionButtonsWantBackground];
  int v61 = v60 ^ [v4 actionButtonsWantBackground];
  int v62 = [v74 includesLiveIndicatorBadge];
  int v63 = v62 ^ [v4 includesLiveIndicatorBadge];
  int v64 = [v74 includesContentLoadingIndicator];
  int v65 = v64 ^ [v4 includesContentLoadingIndicator] | v63 | v61 | v59 | v57;
  v66 = [v74 cancelButtonCustomText];
  v67 = [v4 cancelButtonCustomText];
  if (v66 != v67)
  {
    v68 = [v74 cancelButtonCustomText];
    v69 = [v4 cancelButtonCustomText];
    int v70 = [v68 isEqualToString:v69] ^ 1;

    v65 |= v70;
  }

  v71 = [v74 cancelButtonCustomImage];
  v72 = [v4 cancelButtonCustomImage];

  if (v71 != v72 || v65)
  {
    [(PGControlsView *)self setNeedsLayout];
    [(PGControlsView *)self layoutIfNeeded];
  }
  [(PGPrerollIndicatorView *)self->_prerollIndicatorView updateValues];
  [(UIView *)self->_dimmingView setHidden:[(PGControlsView *)self _showsDimmingView] ^ 1];
  v73 = [(PGControlsView *)self PG_backdropGroupLeader];
  [v73 updateEffects];
}

- (void)updateProgress
{
  progressIndicator = self->_progressIndicator;
  v4 = [(PGControlsViewModel *)self->_viewModel playbackState];
  [v4 normalizedProgress];
  -[PGProgressIndicator setProgress:](progressIndicator, "setProgress:");

  if ([(PGControlsView *)self prefersControlsHidden]
    || ([(PGControlsView *)self window], objc_super v5 = objc_claimAutoreleasedReturnValue(),
                                                  v5,
                                                  !v5))
  {
    displayLinkForProgressUpdates = self->_displayLinkForProgressUpdates;
    unint64_t v11 = 0;
  }
  else
  {
    v6 = [(PGControlsView *)self traitCollection];
    [v6 displayScale];
    double v8 = v7;

    [(PGProgressIndicator *)self->_progressIndicator frame];
    CGFloat Width = CGRectGetWidth(v16);
    id v10 = self->_displayLinkForProgressUpdates;
    unint64_t v11 = [(PGControlsViewModel *)self->_viewModel recommendedUpdateCadenceForProgressBarWithWidthInPixels:fmax(v8, 1.0) * Width];
    displayLinkForProgressUpdates = v10;
  }
  [(PGDisplayLink *)displayLinkForProgressUpdates setPreferredFramesPerSecond:v11];
  v13 = self->_progressIndicator;
  id v14 = [(PGControlsViewModel *)self->_viewModel values];
  -[PGProgressIndicator setIncludesWaitingToPlayIndicator:](v13, "setIncludesWaitingToPlayIndicator:", [v14 includesWaitingToPlayIndicator]);
}

- (void)updateControlsAlpha
{
  if ([(PGControlsView *)self prefersControlsHidden])
  {
    double v3 = 0.0;
    [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView setAlpha:0.0];
    p_dimmingView = &self->_dimmingView;
  }
  else
  {
    p_dimmingView = &self->_dimmingView;
    [(UIView *)self->_dimmingView setHidden:[(PGControlsView *)self _showsDimmingView] ^ 1];
    [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView setHidden:0];
    double v3 = 1.0;
    [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView setAlpha:1.0];
  }
  [(UIView *)*p_dimmingView setAlpha:v3];
  objc_super v5 = [(PGControlsViewModel *)self->_viewModel values];
  int v6 = [v5 isPrerollActive];

  if (v6)
  {
    [(PGControlsView *)self setNeedsLayout];
    [(PGControlsView *)self layoutIfNeeded];
  }
}

- (void)updateControlsHidden
{
  [(PGControlsView *)self updateProgress];
  int v3 = [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView isHidden];
  [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView setHidden:[(PGControlsView *)self prefersControlsHidden]];
  if (v3 != [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView isHidden])
  {
    id v4 = [(PGControlsView *)self PG_backdropGroupLeader];
    [v4 updateEffects];
  }
}

- (void)setPrefersControlsHidden:(BOOL)a3
{
  if (self->_prefersControlsHidden != a3)
  {
    self->_prefersControlsHidden = a3;
    [(PGControlsView *)self updateProgress];
    id v4 = [(PGControlsView *)self PG_backdropGroupLeader];
    [v4 updateEffects];
  }
}

- (id)PG_backdropGroupLeader
{
  return self->_captureOnlyView;
}

- (BOOL)PG_preferredVisibilityForView:(id)a3
{
  id v4 = (PGButtonView *)a3;
  int v5 = [(PGButtonView *)v4 isHidden];
  if (![(PGControlsView *)self prefersControlsHidden])
  {
    double v8 = [(PGControlsViewModel *)self->_viewModel values];
    int v6 = v8;
    if (self->_cancelButton == v4)
    {
      char v9 = [v8 includesCancelButton];
    }
    else if (self->_restoreButton == v4)
    {
      char v9 = [v8 includesRestoreButton];
    }
    else if (self->_skipBackButton == v4)
    {
      char v9 = [v8 includesSkipBackButton];
    }
    else if (self->_actionButton == v4)
    {
      char v9 = [v8 includesActionButton];
    }
    else
    {
      if (self->_skipForwardButton != v4) {
        goto LABEL_16;
      }
      char v9 = [v8 includesSkipForwardButton];
    }
    LOBYTE(v5) = v9;
    goto LABEL_16;
  }
  if ([(PGButtonView *)v4 isDescendantOfView:self->_prerollIndicatorView])
  {
    int v6 = [(PGControlsViewModel *)self->_viewModel values];
    double v7 = [v6 prerollAttributes];
    LOBYTE(v5) = v7 != 0;

LABEL_16:
    goto LABEL_17;
  }
  v5 &= ~[(PGButtonView *)v4 isDescendantOfView:self];
LABEL_17:

  return v5;
}

- (void)layoutSubviews
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  v122.receiver = self;
  v122.super_class = (Class)PGControlsView;
  [(PGControlsView *)&v122 layoutSubviews];
  captureOnlyView = self->_captureOnlyView;
  [(PGControlsView *)self bounds];
  -[PGCABackdropLayerView setFrame:](captureOnlyView, "setFrame:");
  dimmingView = self->_dimmingView;
  [(PGControlsView *)self bounds];
  -[UIView setFrame:](dimmingView, "setFrame:");
  hidableItemsLayoutContainerView = self->_hidableItemsLayoutContainerView;
  [(PGControlsView *)self bounds];
  -[PGLayoutContainerView setFrame:](hidableItemsLayoutContainerView, "setFrame:");
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  int v6 = self->_allButtons;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v118 objects:v127 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v119;
    long long v112 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v113 = *MEMORY[0x1E4F1DAB8];
    long long v110 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v119 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        *(_OWORD *)&v117.a = v113;
        *(_OWORD *)&v117.c = v112;
        *(_OWORD *)&v117.tdouble x = v110;
        [v11 setTransform:&v117];
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v118 objects:v127 count:16];
    }
    while (v8);
  }

  [(PGControlsViewModel *)self->_viewModel preferredMinimumWidth];
  double v13 = v12;
  [(PGControlsView *)self bounds];
  double Width = CGRectGetWidth(v129);
  [(PGControlsView *)self bounds];
  double Height = CGRectGetHeight(v130);
  double v16 = Width / v13;
  if (Width / v13 > 1.0) {
    double v16 = 1.0;
  }
  double v17 = Height / 110.0;
  if (Height / 110.0 > 1.0) {
    double v17 = 1.0;
  }
  if (v16 >= v17) {
    CGFloat v18 = v17;
  }
  else {
    CGFloat v18 = v16;
  }
  double v19 = Height / 136.0;
  memset(&v117.c, 0, 32);
  if (v19 <= 1.0) {
    double v20 = v19;
  }
  else {
    double v20 = 1.0;
  }
  *(_OWORD *)&v117.a = 0uLL;
  CGAffineTransformMakeScale(&v117, v18, v18);
  memset(&v116, 0, sizeof(v116));
  CGAffineTransformMakeScale(&v116, v18 * 0.5 + 0.5, v18 * 0.5 + 0.5);
  CGAffineTransform v115 = v117;
  IsIdentitdouble y = CGAffineTransformIsIdentity(&v115);
  restoreButton = self->_restoreButton;
  [(PGControlsView *)self bounds];
  double v22 = 32.0;
  -[PGButtonView setFrame:](restoreButton, "setFrame:", CGRectGetMaxX(v131) + -32.0 + -9.0, 9.0, 32.0, 25.0);
  BOOL v23 = [(PGMaterialView *)self->_restoreButton isBackdropHidden];
  double v24 = 15.0;
  if (!v23) {
    double v24 = 13.0;
  }
  [(PGButtonView *)self->_restoreButton setGlyphSize:v24];
  v25 = [(PGControlsViewModel *)self->_viewModel values];
  uint64_t v26 = [v25 cancelButtonCustomText];

  v27 = [(PGControlsViewModel *)self->_viewModel values];
  uint64_t v28 = [v27 cancelButtonCustomText];

  if (v26)
  {
    uint64_t v29 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43920]];
    uint64_t v30 = (void *)v29;
    double v31 = 12.5;
    if (v29)
    {
      uint64_t v125 = *MEMORY[0x1E4F42508];
      uint64_t v126 = v29;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
      [v28 sizeWithAttributes:v32];
      double v34 = v33;

      _NF = v18 > 0.0 && v18 < 1.0;
      double v36 = Width;
      if (_NF) {
        double v36 = Width * (1.0 / v18);
      }
      double v37 = v36 + -27.0 + -32.0;
      if (v34 + 27.0 + 6.0 >= v37) {
        double v22 = v37;
      }
      else {
        double v22 = v34 + 27.0 + 6.0;
      }
    }
    else
    {
      double v22 = 32.0;
    }
  }
  else
  {
    uint64_t v30 = 0;
    double v31 = 6.0;
  }
  BOOL v38 = [(PGMaterialView *)self->_cancelButton isBackdropHidden];
  double v39 = 17.0;
  if (!v38) {
    double v39 = 13.0;
  }
  if (v26) {
    double v39 = 11.0;
  }
  [(PGButtonView *)self->_cancelButton setGlyphSize:v39];
  [(PGButtonView *)self->_cancelButton setText:v28];
  [(PGButtonView *)self->_cancelButton setFont:v30];
  cancelButton = self->_cancelButton;
  v41 = [(PGControlsViewModel *)self->_viewModel values];
  uint64_t v42 = [v41 cancelButtonCustomImage];
  [(PGButtonView *)cancelButton setImage:v42];

  -[PGButtonView setFrame:](self->_cancelButton, "setFrame:", 9.0, 9.0, v22, 25.0);
  [(PGMaterialView *)self->_cancelButton _setContinuousCornerRadius:v31];
  if (!IsIdentity)
  {
    uint64_t v43 = self->_cancelButton;
    CGAffineTransform v115 = v117;
    [(PGButtonView *)v43 setTransform:&v115];
    __asm { FMOV            V3.2D, #9.0 }
    [(PGButtonView *)self->_cancelButton setFrameOrigin:vaddq_f64(*(float64x2_t *)&v116.tx, vmlaq_f64(vmulq_f64(*(float64x2_t *)&v116.c, _Q3), _Q3, *(float64x2_t *)&v116.a))];
    v48 = self->_restoreButton;
    CGAffineTransform v115 = v117;
    [(PGButtonView *)v48 setTransform:&v115];
    [(PGButtonView *)self->_cancelButton origin];
    double v50 = v49;
    double v52 = v51;
    [(PGControlsView *)self bounds];
    double MaxX = CGRectGetMaxX(v132);
    [(PGButtonView *)self->_restoreButton frame];
    -[PGButtonView setFrameOrigin:](self->_restoreButton, "setFrameOrigin:", MaxX - (v50 + CGRectGetWidth(v133)), v52);
  }
  [(PGControlsView *)self _progressIndicatorFrameWithScaling:v18];
  -[PGProgressIndicator setFrame:](self->_progressIndicator, "setFrame:");
  [(PGControlsView *)self updateProgress];
  [(PGControlsView *)self _prerollIndicatorFrameWithScaling:v18];
  -[PGPrerollIndicatorView setFrame:](self->_prerollIndicatorView, "setFrame:");
  long long v54 = [(PGControlsViewModel *)self->_viewModel values];
  int v55 = [v54 includesLiveIndicatorBadge];

  if (v55)
  {
    int v56 = [(PGButtonView *)self->_liveIndicatorBadgeButton text];

    if (!v56)
    {
      liveIndicatorBadgeButton = self->_liveIndicatorBadgeButton;
      int v58 = [MEMORY[0x1E4F42A30] systemFontOfSize:13.0 weight:*MEMORY[0x1E4F43920]];
      [(PGButtonView *)liveIndicatorBadgeButton setFont:v58];

      int v59 = self->_liveIndicatorBadgeButton;
      int v60 = PGLocalizedString(@"LIVE_INDICATOR_BADGE");
      [(PGButtonView *)v59 setText:v60];
    }
    int v61 = [(PGButtonView *)self->_liveIndicatorBadgeButton text];
    uint64_t v123 = *MEMORY[0x1E4F42508];
    int v62 = [(PGButtonView *)self->_liveIndicatorBadgeButton font];
    v124 = v62;
    int v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
    [v61 sizeWithAttributes:v63];

    double v64 = *MEMORY[0x1E4F1DAD8];
    double v65 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    UISizeRoundToScale();
    -[PGButtonView setFrame:](self->_liveIndicatorBadgeButton, "setFrame:", v64, v65, v66, v67);
    v68 = self->_liveIndicatorBadgeButton;
    CGAffineTransform v115 = v117;
    [(PGButtonView *)v68 setTransform:&v115];
    [(PGProgressIndicator *)self->_progressIndicator frame];
    double MinX = CGRectGetMinX(v134);
    [(PGProgressIndicator *)self->_progressIndicator frame];
    CGFloat v70 = CGRectGetMinY(v135) + (v18 * 0.5 + 0.5) * -6.0;
    [(PGButtonView *)self->_liveIndicatorBadgeButton frame];
    -[PGButtonView setFrameOrigin:](self->_liveIndicatorBadgeButton, "setFrameOrigin:", MinX, v70 - CGRectGetHeight(v136));
  }
  v71 = [(PGControlsViewModel *)self->_viewModel values];
  if ([v71 actionButtonsWantBackground]) {
    double v72 = 52.0;
  }
  else {
    double v72 = 48.0;
  }

  double v111 = fmin(fmax(v20 * ((Width + v72 * -3.0) * 0.25), 12.0), 20.0);
  double v73 = v72 + v111;
  [(PGButtonView *)self->_cancelButton glyphSize];
  [(PGButtonView *)self->_restoreButton glyphSize];
  id v74 = [(PGControlsViewModel *)self->_viewModel values];
  if ([v74 includesLiveIndicatorBadge]) {
    [(PGButtonView *)self->_liveIndicatorBadgeButton frame];
  }
  else {
    [(PGProgressIndicator *)self->_progressIndicator frame];
  }
  CGRectGetMinY(*(CGRect *)&v75);

  UIRoundToScale();
  double v80 = v79;
  [(PGControlsView *)self bounds];
  double MidX = CGRectGetMidX(v137);
  double v82 = MidX - v72 * 0.5;
  double v83 = v80 - v72 * 0.5;
  -[PGButtonView setFrame:](self->_skipBackButton, "setFrame:", v82 - v73, v83, v72, v72);
  -[PGButtonView setFrame:](self->_actionButton, "setFrame:", v82, v83, v72, v72);
  -[PGButtonView setFrame:](self->_skipForwardButton, "setFrame:", v73 + v82, v83 + 0.0, v72, v72);
  if (!IsIdentity)
  {
    [(PGControlsView *)self bounds];
    if (!CGRectIsEmpty(v138))
    {
      skipBackButton = self->_skipBackButton;
      CGAffineTransform v115 = v117;
      [(PGButtonView *)skipBackButton setTransform:&v115];
      actionButton = self->_actionButton;
      CGAffineTransform v115 = v117;
      [(PGButtonView *)actionButton setTransform:&v115];
      skipForwardButton = self->_skipForwardButton;
      CGAffineTransform v115 = v117;
      [(PGButtonView *)skipForwardButton setTransform:&v115];
      -[PGButtonView setCenter:](self->_actionButton, "setCenter:", MidX, v80);
      [(PGButtonView *)self->_actionButton frame];
      CGFloat v87 = CGRectGetWidth(v139) + v111 * v18;
      [(PGButtonView *)self->_actionButton center];
      double v89 = v88;
      double v91 = v90 - v87;
      [(PGButtonView *)self->_actionButton center];
      CGFloat v93 = v87 + v92;
      double v95 = v94 + 0.0;
      -[PGButtonView setCenter:](self->_skipBackButton, "setCenter:", v91, v89);
      -[PGButtonView setCenter:](self->_skipForwardButton, "setCenter:", v93, v95);
    }
  }
  v96 = [(PGControlsViewModel *)self->_viewModel values];
  int v97 = [v96 includesContentLoadingIndicator];

  if (v97)
  {
    if (!self->_contentLoadingIndicator)
    {
      v98 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:101];
      contentLoadingIndicator = self->_contentLoadingIndicator;
      self->_contentLoadingIndicator = v98;

      id v100 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [(PGControlsView *)self bounds];
      v101 = (UIView *)objc_msgSend(v100, "initWithFrame:");
      contentLoadingIndicatorContainerView = self->_contentLoadingIndicatorContainerView;
      self->_contentLoadingIndicatorContainerView = v101;

      [(PGLayoutContainerView *)self->_hidableItemsLayoutContainerView insertSubview:self->_contentLoadingIndicatorContainerView atIndex:0];
      [(UIView *)self->_contentLoadingIndicatorContainerView addSubview:self->_contentLoadingIndicator];
      v103 = self->_contentLoadingIndicatorContainerView;
      v104 = [MEMORY[0x1E4F428B8] darkGrayColor];
      [(UIView *)v103 setBackgroundColor:v104];

      v105 = self->_contentLoadingIndicatorContainerView;
      [(UIView *)self->_dimmingView _continuousCornerRadius];
      -[UIView _setContinuousCornerRadius:](v105, "_setContinuousCornerRadius:");
    }
    v106 = self->_contentLoadingIndicatorContainerView;
    [(PGControlsView *)self bounds];
    -[UIView setFrame:](v106, "setFrame:");
    v107 = self->_contentLoadingIndicator;
    CGAffineTransform v115 = v117;
    [(UIActivityIndicatorView *)v107 setTransform:&v115];
    v108 = self->_contentLoadingIndicator;
    [(UIView *)self->_contentLoadingIndicatorContainerView bounds];
    UIRectGetCenter();
    -[UIActivityIndicatorView setCenter:](v108, "setCenter:");
  }
  [(UIView *)self->_contentLoadingIndicatorContainerView setHidden:v97 ^ 1u];
  if ((v97 ^ 1) == [(UIActivityIndicatorView *)self->_contentLoadingIndicator isAnimating])
  {
    v109 = self->_contentLoadingIndicator;
    if (v97) {
      [(UIActivityIndicatorView *)v109 startAnimating];
    }
    else {
      [(UIActivityIndicatorView *)v109 stopAnimating];
    }
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PGControlsView;
  [(PGControlsView *)&v4 didMoveToWindow];
  [(PGControlsView *)self updateProgress];
  if ([(PGControlsView *)self _isInAWindow])
  {
    int v3 = [(PGControlsView *)self PG_backdropGroupLeader];
    [v3 updateEffects];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PGControlsView;
  -[PGLayoutContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  int v5 = (PGControlsView *)objc_claimAutoreleasedReturnValue();
  int v6 = v5;
  if (v5 == self) {
    int v5 = 0;
  }
  uint64_t v7 = v5;

  return v7;
}

- (void)buttonViewDidReceiveTouchUpInside:(id)a3
{
  objc_super v4 = (PGButtonView *)a3;
  if (self->_restoreButton == v4)
  {
    int v5 = v4;
    [(PGControlsViewModel *)self->_viewModel handleRestoreButtonTapped];
  }
  else if (self->_actionButton == v4)
  {
    int v5 = v4;
    [(PGControlsViewModel *)self->_viewModel handleActionButtonTapped];
  }
  else if (self->_skipBackButton == v4)
  {
    int v5 = v4;
    [(PGControlsViewModel *)self->_viewModel handleSkipBackButtonTapped];
  }
  else if (self->_skipForwardButton == v4)
  {
    int v5 = v4;
    [(PGControlsViewModel *)self->_viewModel handleSkipForwardButtonTapped];
  }
  else
  {
    if (self->_cancelButton != v4) {
      goto LABEL_12;
    }
    int v5 = v4;
    [(PGControlsViewModel *)self->_viewModel handleCancelButtonTapped];
  }
  objc_super v4 = v5;
LABEL_12:
}

- (CGRect)buttonView:(id)a3 imageRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v10 = (PGButtonView *)a3;
  if (self->_cancelButton == v10)
  {
    unint64_t v11 = [(PGControlsViewModel *)self->_viewModel values];
    double v12 = [v11 cancelButtonCustomImage];

    if (v12)
    {
      [(PGButtonView *)v10 bounds];
      double width = CGRectGetHeight(v17) + -4.0;
      [(PGButtonView *)v10 bounds];
      double height = CGRectGetHeight(v18) + -4.0;
      CGFloat y = 2.0;
      CGFloat x = 2.0;
    }
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)buttonView:(id)a3 titleRectForContentRect:(CGRect)a4 proposedRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  double width = a5.size.width;
  CGFloat y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = (PGButtonView *)a3;
  if (self->_cancelButton == v10)
  {
    unint64_t v11 = [(PGControlsViewModel *)self->_viewModel values];
    double v12 = [v11 cancelButtonCustomText];

    if (v12)
    {
      [(PGButtonView *)v10 bounds];
      double x = CGRectGetMaxX(v17) - width + -6.0;
    }
  }

  double v13 = x;
  double v14 = y;
  double v15 = width;
  double v16 = height;
  result.size.CGFloat height = v16;
  result.size.double width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- (UIEdgeInsets)buttonView:(id)a3 contentEdgeInsetsForProposedInsets:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  double left = a4.left;
  CGFloat top = a4.top;
  uint64_t v8 = [(PGControlsViewModel *)self->_viewModel values];
  objc_super v9 = [v8 cancelButtonCustomImage];

  if (v9) {
    double v10 = 2.0;
  }
  else {
    double v10 = left;
  }
  double v11 = top;
  double v12 = bottom;
  double v13 = right;
  result.CGFloat right = v13;
  result.CGFloat bottom = v12;
  result.double left = v10;
  result.CGFloat top = v11;
  return result;
}

- (CGRect)_prerollIndicatorFrameWithScaling:(double)a3
{
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  [(PGControlsView *)self _progressIndicatorFrameWithScaling:a3];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  CGFloat v9 = CGRectGetWidth(v21);
  +[PGPrerollIndicatorView preferredHeight];
  double v19 = a3;
  double v11 = v10 * a3;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.CGFloat x = MinX;
  v24.origin.CGFloat y = rect;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v11;
  double v14 = MaxY - CGRectGetHeight(v24);
  if (![(PGControlsView *)self prefersControlsHidden])
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double v14 = v14 - (CGRectGetHeight(v25) + (v19 * 0.5 + 0.5) * 6.0);
  }
  double v15 = MinX;
  double v16 = v14;
  double v17 = v9;
  double v18 = v11;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_progressIndicatorFrameWithScaling:(double)a3
{
  [(PGControlsView *)self bounds];
  objc_super v4 = [(PGControlsView *)self traitCollection];
  [v4 displayScale];

  [(PGControlsView *)self bounds];
  CGRectGetMaxY(v15);
  UIPointRoundToViewScale();
  double v6 = v5;
  double v8 = v7;
  UISizeRoundToViewScale();
  double v10 = v9;
  double v12 = v11;
  double v13 = v6;
  double v14 = v8;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (BOOL)_showsDimmingView
{
  int v3 = [(PGControlsViewModel *)self->_viewModel values];
  if ([v3 actionButtonsWantBackground])
  {
    char v4 = 0;
  }
  else
  {
    double v5 = [(PGControlsViewModel *)self->_viewModel values];
    char v4 = [v5 includesActionButton];
  }
  return v4 & ~[(PGControlsView *)self prefersControlsHidden];
}

- (BOOL)prefersControlsHidden
{
  return self->_prefersControlsHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkForProgressUpdates, 0);
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_allButtons, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_prerollIndicatorView, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_captureOnlyView, 0);
  objc_storeStrong((id *)&self->_hidableItemsLayoutContainerView, 0);
  objc_storeStrong((id *)&self->_contentLoadingIndicatorContainerView, 0);
  objc_storeStrong((id *)&self->_contentLoadingIndicator, 0);
  objc_storeStrong((id *)&self->_liveIndicatorBadgeButton, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_skipBackButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_restoreButton, 0);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end