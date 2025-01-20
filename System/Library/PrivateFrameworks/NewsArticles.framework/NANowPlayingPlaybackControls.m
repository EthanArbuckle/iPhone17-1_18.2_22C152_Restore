@interface NANowPlayingPlaybackControls
- (BOOL)isPlaying;
- (BOOL)nextTrackButtonEnabled;
- (BOOL)skipForwardButtonEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NANowPlayingPlaybackControls)initWithFrame:(CGRect)a3 inset:(double)a4 layoutSpecProvider:(id)a5;
- (NANowPlayingPlaybackControlsDelegate)delegate;
- (NANowPlayingPlaybackControlsLayoutSpecProvider)layoutSpecProvider;
- (UIButton)forwardButton;
- (UIButton)playPauseButton;
- (UIButton)rewindButton;
- (UIView)contentView;
- (double)inset;
- (id)buttonColor;
- (id)disabledButtonColor;
- (void)layoutSubviews;
- (void)nextTrackButtonTapped:(id)a3;
- (void)pauseButtonTapped:(id)a3;
- (void)playButtonTapped:(id)a3;
- (void)rewindButtonTapped:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardButton:(id)a3;
- (void)setInset:(double)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setLayoutSpecProvider:(id)a3;
- (void)setNextTrackButtonEnabled:(BOOL)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setRewindButton:(id)a3;
- (void)setSkipForwardButtonEnabled:(BOOL)a3;
- (void)skipForwardButtonTapped:(id)a3;
- (void)updateForwardButton;
@end

@implementation NANowPlayingPlaybackControls

- (NANowPlayingPlaybackControls)initWithFrame:(CGRect)a3 inset:(double)a4 layoutSpecProvider:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v38.receiver = self;
  v38.super_class = (Class)NANowPlayingPlaybackControls;
  v12 = -[NANowPlayingPlaybackControls initWithFrame:](&v38, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke;
    v36[3] = &unk_1E64061D8;
    v14 = v12;
    v37 = v14;
    uint64_t v15 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke((uint64_t)v36);
    contentView = v14->_contentView;
    v14->_contentView = (UIView *)v15;

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2;
    v34[3] = &unk_1E6406340;
    v17 = v14;
    v35 = v17;
    uint64_t v18 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2((uint64_t)v34);
    rewindButton = v17->_rewindButton;
    v17->_rewindButton = (UIButton *)v18;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3;
    v32[3] = &unk_1E64060E0;
    v20 = v17;
    v33 = v20;
    uint64_t v21 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3((uint64_t)v32);
    playPauseButton = v20->_playPauseButton;
    v20->_playPauseButton = (UIButton *)v21;

    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4;
    v30 = &unk_1E6406340;
    v23 = v20;
    v31 = v23;
    uint64_t v24 = __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4((uint64_t)&v27);
    id v25 = v23[56];
    v23[56] = (id)v24;

    objc_storeWeak(v23 + 58, v11);
    *((double *)v23 + 57) = a4;
    objc_msgSend(v23, "setIsPlaying:", 0, v27, v28, v29, v30);
  }
  return v13;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setAutoresizingMask:16];
  [*(id *)(a1 + 32) addSubview:v3];

  return v3;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v3 = [*(id *)(a1 + 32) buttonColor];
  [v2 setTintColor:v3];

  [v2 addTarget:*(void *)(a1 + 32) action:sel_rewindButtonTapped_ forControlEvents:64];
  v4 = NABundle();
  v5 = [v4 localizedStringForKey:@"rewind, 15 seconds", &stru_1F1AD8EC0, 0 value table];
  [v2 setAccessibilityLabel:v5];

  v6 = [*(id *)(a1 + 32) contentView];
  [v6 addSubview:v2];

  return v2;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_3(uint64_t a1)
{
  id v2 = +[NATouchInsetsButton buttonWithType:1];
  v3 = [*(id *)(a1 + 32) buttonColor];
  [v2 setTintColor:v3];

  objc_msgSend(v2, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
  v4 = NABundle();
  v5 = [v4 localizedStringForKey:@"pause" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v5];

  v6 = [*(id *)(a1 + 32) contentView];
  [v6 addSubview:v2];

  return v2;
}

id __71__NANowPlayingPlaybackControls_initWithFrame_inset_layoutSpecProvider___block_invoke_4(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  v3 = [*(id *)(a1 + 32) buttonColor];
  [v2 setTintColor:v3];

  [v2 addTarget:*(void *)(a1 + 32) action:sel_nextTrackButtonTapped_ forControlEvents:64];
  v4 = NABundle();
  v5 = [v4 localizedStringForKey:@"next track" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v5];

  v6 = [*(id *)(a1 + 32) contentView];
  [v6 addSubview:v2];

  return v2;
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)NANowPlayingPlaybackControls;
  [(NANowPlayingPlaybackControls *)&v61 layoutSubviews];
  v3 = [(NANowPlayingPlaybackControls *)self rewindButton];
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gobackward.15"];
  v5 = (void *)MEMORY[0x1E4FB1830];
  v6 = [(NANowPlayingPlaybackControls *)self layoutSpecProvider];
  [v6 nextTrackAndRewindButtonPointSize];
  v7 = objc_msgSend(v5, "configurationWithPointSize:weight:scale:", 4, 2);
  v8 = [v4 imageWithConfiguration:v7];
  [v3 setBackgroundImage:v8 forState:0];

  v9 = [(NANowPlayingPlaybackControls *)self rewindButton];
  [v9 sizeToFit];

  v10 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  if ([(NANowPlayingPlaybackControls *)self isPlaying]) {
    id v11 = @"pause.fill";
  }
  else {
    id v11 = @"play.fill";
  }
  v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v11];
  v13 = (void *)MEMORY[0x1E4FB1830];
  v14 = [(NANowPlayingPlaybackControls *)self layoutSpecProvider];
  [v14 playPausePointSize];
  uint64_t v15 = objc_msgSend(v13, "configurationWithPointSize:weight:scale:", 8, 2);
  v16 = [v12 imageWithConfiguration:v15];
  [v10 setBackgroundImage:v16 forState:0];

  v17 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  [v17 sizeToFit];

  [(NANowPlayingPlaybackControls *)self updateForwardButton];
  uint64_t v18 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v18 sizeToFit];

  [(NANowPlayingPlaybackControls *)self bounds];
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  [(NANowPlayingPlaybackControls *)self inset];
  CGFloat v28 = v27;
  v62.origin.double x = v20;
  v62.origin.double y = v22;
  v62.size.double width = v24;
  v62.size.double height = v26;
  CGRect v63 = CGRectInset(v62, v28, 0.0);
  double x = v63.origin.x;
  double y = v63.origin.y;
  double width = v63.size.width;
  double height = v63.size.height;
  v33 = [(NANowPlayingPlaybackControls *)self contentView];
  objc_msgSend(v33, "setFrame:", x, y, width, height);

  v34 = [(NANowPlayingPlaybackControls *)self contentView];
  [v34 bounds];
  double v35 = CGRectGetHeight(v64);
  v36 = [(NANowPlayingPlaybackControls *)self rewindButton];
  [v36 bounds];
  double v37 = (v35 - CGRectGetHeight(v65)) * 0.5;
  objc_super v38 = [(NANowPlayingPlaybackControls *)self rewindButton];
  [v38 bounds];
  double v39 = CGRectGetWidth(v66);
  v40 = [(NANowPlayingPlaybackControls *)self rewindButton];
  [v40 bounds];
  double v41 = CGRectGetHeight(v67);
  v42 = [(NANowPlayingPlaybackControls *)self rewindButton];
  objc_msgSend(v42, "setFrame:", 0.0, v37, v39, v41);

  v43 = [(NANowPlayingPlaybackControls *)self contentView];
  [v43 bounds];
  double MidX = CGRectGetMidX(v68);
  v45 = [(NANowPlayingPlaybackControls *)self contentView];
  [v45 bounds];
  double MidY = CGRectGetMidY(v69);
  v47 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  objc_msgSend(v47, "setCenter:", MidX, MidY);

  v48 = [(NANowPlayingPlaybackControls *)self contentView];
  [v48 bounds];
  double v49 = CGRectGetWidth(v70);
  v50 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v50 bounds];
  double v51 = v49 - CGRectGetWidth(v71);
  v52 = [(NANowPlayingPlaybackControls *)self contentView];
  [v52 bounds];
  double v53 = CGRectGetHeight(v72);
  v54 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v54 bounds];
  double v55 = (v53 - CGRectGetHeight(v73)) * 0.5;
  v56 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v56 bounds];
  double v57 = CGRectGetWidth(v74);
  v58 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v58 bounds];
  double v59 = CGRectGetHeight(v75);
  v60 = [(NANowPlayingPlaybackControls *)self forwardButton];
  objc_msgSend(v60, "setFrame:", v51, v55, v57, v59);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(NANowPlayingPlaybackControls *)self rewindButton];
  [v5 bounds];
  double v7 = v6;

  v8 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  [v8 bounds];
  double v10 = v9;

  id v11 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v11 bounds];
  double v13 = v12;

  if (v10 >= v13) {
    double v14 = v10;
  }
  else {
    double v14 = v13;
  }
  if (v7 >= v14) {
    double v15 = v7;
  }
  else {
    double v15 = v14;
  }
  double v16 = width;
  result.double height = v15;
  result.CGFloat width = v16;
  return result;
}

- (id)buttonColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)disabledButtonColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.5];
}

- (void)setIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isPlaying = a3;
  v5 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  if (v3) {
    double v6 = @"pause.fill";
  }
  else {
    double v6 = @"play.fill";
  }
  double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
  v8 = (void *)MEMORY[0x1E4FB1830];
  double v9 = [(NANowPlayingPlaybackControls *)self layoutSpecProvider];
  [v9 playPausePointSize];
  double v10 = objc_msgSend(v8, "configurationWithPointSize:weight:scale:", 8, 2);
  id v11 = [v7 imageWithConfiguration:v10];
  [v5 setBackgroundImage:v11 forState:0];

  double v12 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  [v12 removeTarget:self action:0 forControlEvents:64];

  double v13 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  double v14 = v13;
  double v15 = &selRef_pauseButtonTapped_;
  if (!v3) {
    double v15 = &selRef_playButtonTapped_;
  }
  [v13 addTarget:self action:*v15 forControlEvents:64];

  double v16 = NABundle();
  id v20 = v16;
  if (v3) {
    v17 = @"pause";
  }
  else {
    v17 = @"play";
  }
  uint64_t v18 = [v16 localizedStringForKey:v17 value:&stru_1F1AD8EC0 table:0];
  double v19 = [(NANowPlayingPlaybackControls *)self playPauseButton];
  [v19 setAccessibilityLabel:v18];
}

- (void)setNextTrackButtonEnabled:(BOOL)a3
{
  self->_nextTrackButtonEnabled = a3;
  [(NANowPlayingPlaybackControls *)self updateForwardButton];
}

- (void)setSkipForwardButtonEnabled:(BOOL)a3
{
  self->_skipForwardButtonEnabled = a3;
  [(NANowPlayingPlaybackControls *)self updateForwardButton];
}

- (void)updateForwardButton
{
  BOOL v3 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v3 removeTarget:self action:0 forControlEvents:64];

  BOOL v4 = [(NANowPlayingPlaybackControls *)self skipForwardButtonEnabled];
  v5 = [(NANowPlayingPlaybackControls *)self forwardButton];
  if (v4)
  {
    double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"goforward.15"];
    double v7 = (void *)MEMORY[0x1E4FB1830];
    v8 = [(NANowPlayingPlaybackControls *)self layoutSpecProvider];
    [v8 nextTrackAndRewindButtonPointSize];
    double v9 = objc_msgSend(v7, "configurationWithPointSize:weight:scale:", 4, 2);
    double v10 = [v6 imageWithConfiguration:v9];
    [v5 setBackgroundImage:v10 forState:0];

    id v11 = [(NANowPlayingPlaybackControls *)self forwardButton];
    [v11 addTarget:self action:sel_skipForwardButtonTapped_ forControlEvents:64];

    double v12 = NABundle();
    double v13 = v12;
    double v14 = @"skip forward";
  }
  else
  {
    double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"forward.fill"];
    double v16 = (void *)MEMORY[0x1E4FB1830];
    v17 = [(NANowPlayingPlaybackControls *)self layoutSpecProvider];
    [v17 nextTrackAndRewindButtonPointSize];
    uint64_t v18 = objc_msgSend(v16, "configurationWithPointSize:weight:scale:", 4, 2);
    double v19 = [v15 imageWithConfiguration:v18];
    [v5 setBackgroundImage:v19 forState:0];

    id v20 = [(NANowPlayingPlaybackControls *)self forwardButton];
    [v20 addTarget:self action:sel_nextTrackButtonTapped_ forControlEvents:64];

    double v12 = NABundle();
    double v13 = v12;
    double v14 = @"next track";
  }
  double v21 = [v12 localizedStringForKey:v14 value:&stru_1F1AD8EC0 table:0];
  CGFloat v22 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v22 setAccessibilityLabel:v21];

  if ([(NANowPlayingPlaybackControls *)self nextTrackButtonEnabled])
  {
    double v23 = [(NANowPlayingPlaybackControls *)self forwardButton];
    [v23 setEnabled:1];

LABEL_7:
    uint64_t v26 = [(NANowPlayingPlaybackControls *)self buttonColor];
    goto LABEL_9;
  }
  BOOL v24 = [(NANowPlayingPlaybackControls *)self skipForwardButtonEnabled];
  double v25 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v25 setEnabled:v24];

  if (v24) {
    goto LABEL_7;
  }
  uint64_t v26 = [(NANowPlayingPlaybackControls *)self disabledButtonColor];
LABEL_9:
  id v28 = (id)v26;
  double v27 = [(NANowPlayingPlaybackControls *)self forwardButton];
  [v27 setTintColor:v28];
}

- (void)rewindButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Rewind tapped", v6, 2u);
  }

  v5 = [(NANowPlayingPlaybackControls *)self delegate];
  [v5 nowPlayingPlaybackControlsDidTapRewind:self];
}

- (void)skipForwardButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Skip forward tapped", v6, 2u);
  }

  v5 = [(NANowPlayingPlaybackControls *)self delegate];
  [v5 nowPlayingPlaybackControlsDidTapSkipForward:self];
}

- (void)pauseButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Pause button tapped", v6, 2u);
  }

  v5 = [(NANowPlayingPlaybackControls *)self delegate];
  [v5 nowPlayingPlaybackControlsDidTapPause:self];
}

- (void)playButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Play button tapped", v6, 2u);
  }

  v5 = [(NANowPlayingPlaybackControls *)self delegate];
  [v5 nowPlayingPlaybackControlsDidTapPlay:self];
}

- (void)nextTrackButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Next track button tapped", v6, 2u);
  }

  v5 = [(NANowPlayingPlaybackControls *)self delegate];
  [v5 nowPlayingPlaybackControlsDidTapNextTrack:self];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)nextTrackButtonEnabled
{
  return self->_nextTrackButtonEnabled;
}

- (BOOL)skipForwardButtonEnabled
{
  return self->_skipForwardButtonEnabled;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NANowPlayingPlaybackControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NANowPlayingPlaybackControlsDelegate *)WeakRetained;
}

- (UIButton)rewindButton
{
  return self->_rewindButton;
}

- (void)setRewindButton:(id)a3
{
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (UIButton)forwardButton
{
  return self->_forwardButton;
}

- (void)setForwardButton:(id)a3
{
}

- (double)inset
{
  return self->_inset;
}

- (void)setInset:(double)a3
{
  self->_inset = a3;
}

- (NANowPlayingPlaybackControlsLayoutSpecProvider)layoutSpecProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutSpecProvider);

  return (NANowPlayingPlaybackControlsLayoutSpecProvider *)WeakRetained;
}

- (void)setLayoutSpecProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutSpecProvider);
  objc_storeStrong((id *)&self->_forwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_rewindButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end