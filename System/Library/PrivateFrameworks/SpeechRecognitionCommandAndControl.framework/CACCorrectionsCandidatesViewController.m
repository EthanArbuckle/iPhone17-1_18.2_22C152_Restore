@interface CACCorrectionsCandidatesViewController
- (BOOL)_canShowWhileLocked;
- (CACCCorrectionsCandidatesViewControllerDelegate)delegate;
- (CACCorrectionsCandidateState)candidateConfiguration;
- (CGSize)preferredContentSize;
- (NSArray)allCandidates;
- (NSArray)alternatives;
- (NSArray)emojis;
- (NSString)text;
- (TIKeyboardCandidateSingle)originalTextCandidate;
- (TUICandidateView)candidateView;
- (TUICandidateView)secondaryCandidateView;
- (UILabel)titleLabel;
- (UIView)candidateBackdropView;
- (id)candidateResultSet;
- (id)newCandidateKeyWithFrame:(CGRect)a3;
- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6;
- (void)candidateViewDidTapArrowButton:(id)a3;
- (void)candidateViewNeedsToExpand:(id)a3;
- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4;
- (void)candidateViewWillBeginDragging:(id)a3;
- (void)closeButtonTapped;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAllCandidates:(id)a3;
- (void)setAlternatives:(id)a3;
- (void)setCandidateBackdropView:(id)a3;
- (void)setCandidateConfiguration:(id)a3;
- (void)setCandidateView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojis:(id)a3;
- (void)setOriginalTextCandidate:(id)a3;
- (void)setSecondaryCandidateView:(id)a3;
- (void)setText:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupConfigurations;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCandidateSet;
- (void)updateConfigurations;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation CACCorrectionsCandidatesViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CACCorrectionsCandidatesViewController;
  [(CACCorrectionsCandidatesViewController *)&v2 viewDidLoad];
}

- (void)dealloc
{
  v3 = [(CACCorrectionsCandidatesViewController *)self candidateView];
  [v3 removeObserver:self forKeyPath:@"candidateResultSet"];

  v4.receiver = self;
  v4.super_class = (Class)CACCorrectionsCandidatesViewController;
  [(CACCorrectionsCandidatesViewController *)&v4 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v63[12] = *MEMORY[0x263EF8340];
  if (!self->_candidateView)
  {
    [(CACCorrectionsCandidatesViewController *)self setupConfigurations];
    v3 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v3;

    v5 = self->_titleLabel;
    v6 = [MEMORY[0x263F82760] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v5 setFont:v6];

    [(UILabel *)self->_titleLabel setNumberOfLines:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:4];
    [(UILabel *)self->_titleLabel setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(CACCorrectionsCandidatesViewController *)self text];
    [(UILabel *)self->_titleLabel setText:v7];

    v8 = objc_opt_new();
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.5 alpha:1.0];
    [v8 setBackgroundColor:v9];

    [v8 setAlpha:0.2];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(CACCorrectionsCandidatesViewController *)self view];
    [v10 frame];
    v11 = -[CACCorrectionsCandidatesViewController newCandidateKeyWithFrame:](self, "newCandidateKeyWithFrame:");
    candidateView = self->_candidateView;
    self->_candidateView = v11;

    [(TUICandidateView *)self->_candidateView setState:self->_candidateConfiguration];
    [(TUICandidateView *)self->_candidateView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(CACCorrectionsCandidatesViewController *)self view];
    [v13 addSubview:self->_titleLabel];

    v14 = [(CACCorrectionsCandidatesViewController *)self view];
    [v14 addSubview:v8];

    v15 = [(CACCorrectionsCandidatesViewController *)self view];
    [v15 addSubview:self->_candidateView];

    v16 = [(CACCorrectionsCandidatesViewController *)self view];
    v17 = [v16 safeAreaLayoutGuide];

    v47 = (void *)MEMORY[0x263F08938];
    v61 = [(UILabel *)self->_titleLabel topAnchor];
    v60 = [v17 topAnchor];
    v59 = [v61 constraintGreaterThanOrEqualToAnchor:v60 constant:10.0];
    v63[0] = v59;
    v58 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
    v56 = [v17 topAnchor];
    v57 = [MEMORY[0x263F82770] defaultMetrics];
    [v57 scaledValueForValue:26.0];
    v55 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v56);
    v63[1] = v55;
    v54 = [(UILabel *)self->_titleLabel leadingAnchor];
    v53 = [v17 leadingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:14.0];
    v63[2] = v52;
    v51 = [(UILabel *)self->_titleLabel trailingAnchor];
    v50 = [v17 trailingAnchor];
    v49 = [v51 constraintLessThanOrEqualToAnchor:v50 constant:-14.0];
    v63[3] = v49;
    v46 = [v8 leadingAnchor];
    v48 = [(CACCorrectionsCandidatesViewController *)self view];
    v45 = [v48 leadingAnchor];
    v44 = [v46 constraintEqualToAnchor:v45];
    v63[4] = v44;
    v41 = [v8 trailingAnchor];
    v42 = [(CACCorrectionsCandidatesViewController *)self view];
    v40 = [v42 trailingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v63[5] = v39;
    v37 = [v8 topAnchor];
    v35 = [(UILabel *)self->_titleLabel bottomAnchor];
    v36 = [MEMORY[0x263F82770] defaultMetrics];
    [v36 scaledValueForValue:10.0];
    v34 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", v35);
    v63[6] = v34;
    v18 = v8;
    v43 = v8;
    v33 = [v8 heightAnchor];
    v32 = [v33 constraintEqualToConstant:1.0];
    v63[7] = v32;
    v31 = [(TUICandidateView *)self->_candidateView leadingAnchor];
    v30 = [(UILabel *)self->_titleLabel leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:14.0];
    v63[8] = v29;
    v28 = [(TUICandidateView *)self->_candidateView trailingAnchor];
    v38 = v17;
    v19 = [v17 trailingAnchor];
    v20 = [v28 constraintEqualToAnchor:v19 constant:-14.0];
    v63[9] = v20;
    v21 = [(TUICandidateView *)self->_candidateView topAnchor];
    v22 = [v18 bottomAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:4.0];
    v63[10] = v23;
    v24 = [(TUICandidateView *)self->_candidateView bottomAnchor];
    v25 = [v17 bottomAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v63[11] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:12];
    [v47 activateConstraints:v27];

    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __63__CACCorrectionsCandidatesViewController_viewDidLayoutSubviews__block_invoke;
    v62[3] = &unk_264D115D0;
    v62[4] = self;
    [MEMORY[0x263F82E00] performWithoutAnimation:v62];
    [(CACCorrectionsCandidatesViewController *)self updateCandidateSet];
  }
}

uint64_t __63__CACCorrectionsCandidatesViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConfigurations];
}

- (id)newCandidateKeyWithFrame:(CGRect)a3
{
  objc_super v4 = objc_msgSend(objc_alloc(MEMORY[0x263F7EC48]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 setDelegate:self];
  [v4 addObserver:self forKeyPath:@"candidateResultSet" options:3 context:CandidateSetContext];
  return v4;
}

- (void)setupConfigurations
{
  v3 = objc_alloc_init(CACCorrectionsCandidateState);
  candidateConfiguration = self->_candidateConfiguration;
  self->_candidateConfiguration = v3;

  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setHasBackdrop:0];
  if (CACIsInDarkMode()) {
    +[CACCorrectionsCandidateViewStyle cacDarkStyle];
  }
  else {
  v5 = +[CACCorrectionsCandidateViewStyle cacLightStyle];
  }
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setStyle:v5];

  v6 = +[CACCorrectionsCandidateViewStyle cacLightStyle];
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setDisambiguationStyle:v6];

  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setPrimaryGridRowType:1];
  v7 = self->_candidateConfiguration;
  [(CACCorrectionsCandidateState *)v7 setArrowButtonPosition:0];
}

- (void)updateConfigurations
{
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setDisambiguationGridPosition:0];
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setInlineTextViewPosition:0];
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setDisambiguationGridRowType:1];
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setSortControlPosition:0];
  id v5 = [(CACCorrectionsCandidatesViewController *)self candidateView];
  v3 = [(CACCorrectionsCandidatesViewController *)self candidateView];
  objc_super v4 = [v3 state];
  [v5 setState:v4 animated:1 force:0 completion:0];
}

- (void)setAlternatives:(id)a3
{
  v6 = (NSArray *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_alternatives != v6)
  {
    objc_storeStrong((id *)&v5->_alternatives, a3);
    [(CACCorrectionsCandidatesViewController *)v5 updateCandidateSet];
  }
  objc_sync_exit(v5);
}

- (void)setEmojis:(id)a3
{
  v6 = (NSArray *)a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (v5->_emojis != v6)
  {
    objc_storeStrong((id *)&v5->_emojis, a3);
    [(CACCorrectionsCandidatesViewController *)v5 updateCandidateSet];
  }
  objc_sync_exit(v5);
}

- (void)updateCandidateSet
{
  v3 = [(CACCorrectionsCandidatesViewController *)self candidateView];
  objc_super v4 = [(CACCorrectionsCandidatesViewController *)self candidateResultSet];
  [v3 setCandidateResultSet:v4];

  id v6 = [(CACCorrectionsCandidatesViewController *)self text];
  id v5 = [(CACCorrectionsCandidatesViewController *)self titleLabel];
  [v5 setText:v6];
}

- (id)candidateResultSet
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v39 = [MEMORY[0x263EFF980] array];
  v3 = [MEMORY[0x263EFF980] array];
  objc_super v4 = [MEMORY[0x263EFF980] array];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = [(CACCorrectionsCandidatesViewController *)self alternatives];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [MEMORY[0x263F7E640] candidateWithUnchangedInput:*(void *)(*((void *)&v48 + 1) + 8 * i)];
        [v3 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v7);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v11 = [(CACCorrectionsCandidatesViewController *)self emojis];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v45 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [MEMORY[0x263F7E640] candidateWithUnchangedInput:*(void *)(*((void *)&v44 + 1) + 8 * j)];
        [v4 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v44 objects:v54 count:16];
    }
    while (v13);
  }
  v37 = self;

  [v39 addObjectsFromArray:v3];
  v38 = v4;
  [v39 addObjectsFromArray:v4];
  v17 = [MEMORY[0x263EFF9A0] dictionary];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v18 = [&unk_26EB4CFE0 countByEnumeratingWithState:&v40 objects:v53 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(&unk_26EB4CFE0);
        }
        v22 = *(void **)(*((void *)&v40 + 1) + 8 * v21);
        char v23 = [v22 isEqualToString:@"All"];
        v24 = v39;
        if ((v23 & 1) != 0
          || (char v25 = [v22 isEqualToString:@"Text"], v24 = v3, (v25 & 1) != 0)
          || (int v26 = [v22 isEqualToString:@"Emoji"], v24 = v38, v26))
        {
          id v27 = v24;
        }
        else
        {
          id v27 = 0;
        }
        v28 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v27];
        v29 = (void *)[objc_alloc(MEMORY[0x263F7E630]) initWithTitle:&stru_26EB332F0 candidates:v28];
        v52 = v29;
        v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
        [v17 setObject:v30 forKey:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v31 = [&unk_26EB4CFE0 countByEnumeratingWithState:&v40 objects:v53 count:16];
      uint64_t v19 = v31;
    }
    while (v31);
  }
  v32 = (void *)MEMORY[0x263F7E640];
  v33 = [(CACCorrectionsCandidatesViewController *)v37 text];
  v34 = [v32 candidateWithUnchangedInput:v33];
  [(CACCorrectionsCandidatesViewController *)v37 setOriginalTextCandidate:v34];

  v35 = [MEMORY[0x263F7E638] setWithCandidates:v39];
  [(CACCorrectionsCandidatesViewController *)v37 setAllCandidates:v39];

  return v35;
}

- (CGSize)preferredContentSize
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v3 = [(CACCorrectionsCandidatesViewController *)self alternatives];
  uint64_t v4 = [v3 count];
  id v5 = [(CACCorrectionsCandidatesViewController *)self emojis];
  double v6 = (double)(unint64_t)([v5 count] + v4);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v7 = v6 / 3.0;
  uint64_t v8 = [(CACCorrectionsCandidatesViewController *)self alternatives];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v31;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v31 != v12) {
        objc_enumerationMutation(v8);
      }
      uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      if (((unint64_t)[v14 length] < 0x1F) | v11 & 1)
      {
        if ((unint64_t)[v14 length] >= 0x15 && (v11 & 1) == 0) {
          double v7 = v7 + 0.5;
        }
      }
      else
      {
        double v7 = 2.0;
        char v11 = 1;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  }
  while (v10);

  if (v11)
  {
    uint64_t v8 = [(CACCorrectionsCandidatesViewController *)self emojis];
    float v15 = (double)(unint64_t)[v8 count] / 3.0;
    double v7 = v7 + ceilf(v15);
LABEL_16:
  }
  v16 = [MEMORY[0x263F82770] defaultMetrics];
  [v16 scaledValueForValue:34.0];
  double v18 = v17;

  uint64_t v19 = [MEMORY[0x263F82770] defaultMetrics];
  [v19 scaledValueForValue:44.0];
  double v21 = v20;

  v22 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v23 = [v22 userInterfaceIdiom];

  if ((v23 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    *(double *)&uint64_t v24 = 374.0;
  }
  else
  {
    char v25 = [(CACCorrectionsCandidatesViewController *)self view];
    [v25 size];
    uint64_t v24 = v26;
  }
  float v27 = v7;
  double v28 = v18 / 3.0 + v21 + v18 * ceilf(v27);
  double v29 = *(double *)&v24;
  result.height = v28;
  result.width = v29;
  return result;
}

- (void)closeButtonTapped
{
  id v3 = [(CACCorrectionsCandidatesViewController *)self delegate];
  [v3 dismissCorrectionsCandidatesViewController:self];
}

- (void)candidateViewDidTapArrowButton:(id)a3
{
  id v3 = CACLogCorrections();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CACCorrectionsCandidatesViewController candidateViewDidTapArrowButton:]();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a4;
  id v9 = a5;
  if ((void *)CandidateSetContext == a6)
  {
    if ([a3 isEqualToString:@"candidateResultSet"])
    {
      uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
      char v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081C8]];

      if (v10 != v11)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
    }
  }
}

- (void)candidateView:(id)a3 didAcceptCandidate:(id)a4 atIndexPath:(id)a5 inGridType:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = CACLogCorrections();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[CACCorrectionsCandidatesViewController candidateView:didAcceptCandidate:atIndexPath:inGridType:]((uint64_t)v9, (uint64_t)v10, v12);
  }

  uint64_t v13 = [(CACCorrectionsCandidatesViewController *)self originalTextCandidate];
  id v14 = [v11 indexPathForCandidate:v13];

  if (v14 != v10)
  {
    float v15 = [(CACCorrectionsCandidatesViewController *)self delegate];
    v16 = [v9 candidate];
    [v15 correctionsCandidatesViewController:self didSelectItemWithText:v16];
  }
}

- (void)candidateViewSelectionDidChange:(id)a3 inGridType:(int64_t)a4
{
  uint64_t v4 = CACLogCorrections();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CACCorrectionsCandidatesViewController candidateViewSelectionDidChange:inGridType:]();
  }
}

- (void)candidateViewWillBeginDragging:(id)a3
{
  id v3 = CACLogCorrections();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CACCorrectionsCandidatesViewController candidateViewWillBeginDragging:]();
  }
}

- (void)candidateViewNeedsToExpand:(id)a3
{
  id v3 = CACLogCorrections();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[CACCorrectionsCandidatesViewController candidateViewNeedsToExpand:]();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACCorrectionsCandidatesViewController;
  [(CACCorrectionsCandidatesViewController *)&v5 traitCollectionDidChange:a3];
  if (CACIsInDarkMode()) {
    +[CACCorrectionsCandidateViewStyle cacDarkStyle];
  }
  else {
  uint64_t v4 = +[CACCorrectionsCandidateViewStyle cacLightStyle];
  }
  [(CACCorrectionsCandidateState *)self->_candidateConfiguration setStyle:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCCorrectionsCandidatesViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCCorrectionsCandidatesViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSArray)alternatives
{
  return self->_alternatives;
}

- (NSArray)emojis
{
  return self->_emojis;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TUICandidateView)candidateView
{
  return self->_candidateView;
}

- (void)setCandidateView:(id)a3
{
}

- (TUICandidateView)secondaryCandidateView
{
  return self->_secondaryCandidateView;
}

- (void)setSecondaryCandidateView:(id)a3
{
}

- (UIView)candidateBackdropView
{
  return self->_candidateBackdropView;
}

- (void)setCandidateBackdropView:(id)a3
{
}

- (CACCorrectionsCandidateState)candidateConfiguration
{
  return self->_candidateConfiguration;
}

- (void)setCandidateConfiguration:(id)a3
{
}

- (TIKeyboardCandidateSingle)originalTextCandidate
{
  return self->_originalTextCandidate;
}

- (void)setOriginalTextCandidate:(id)a3
{
}

- (NSArray)allCandidates
{
  return self->_allCandidates;
}

- (void)setAllCandidates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allCandidates, 0);
  objc_storeStrong((id *)&self->_originalTextCandidate, 0);
  objc_storeStrong((id *)&self->_candidateConfiguration, 0);
  objc_storeStrong((id *)&self->_candidateBackdropView, 0);
  objc_storeStrong((id *)&self->_secondaryCandidateView, 0);
  objc_storeStrong((id *)&self->_candidateView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_emojis, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)candidateViewDidTapArrowButton:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Tapped arrow somehow?", v2, v3, v4, v5, v6);
}

- (void)candidateView:(os_log_t)log didAcceptCandidate:atIndexPath:inGridType:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_238377000, log, OS_LOG_TYPE_DEBUG, "Accepted candidate %@ at index %@", (uint8_t *)&v3, 0x16u);
}

- (void)candidateViewSelectionDidChange:inGridType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Candidate selection changed", v2, v3, v4, v5, v6);
}

- (void)candidateViewWillBeginDragging:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Starting drag of candidate", v2, v3, v4, v5, v6);
}

- (void)candidateViewNeedsToExpand:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Candidate view needs expansion!", v2, v3, v4, v5, v6);
}

@end