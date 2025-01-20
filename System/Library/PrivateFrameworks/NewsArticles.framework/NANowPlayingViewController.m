@interface NANowPlayingViewController
- (CGSize)artworkSizeForViewWidth:(double)a3;
- (NANowPlayingArtworkView)artworkView;
- (NANowPlayingBottomControls)bottomControls;
- (NANowPlayingPlaybackControls)playbackControls;
- (NANowPlayingTimeControl)timeControl;
- (NANowPlayingTitleView)titleView;
- (NANowPlayingViewController)initWithBackground:(id)a3;
- (NANowPlayingViewControllerDelegate)delegate;
- (NANowPlayingVolumeSlider)volumeControl;
- (UIButton)dismissButton;
- (UIButton)ellipsisButton;
- (UIView)contentView;
- (_UIGrabber)grabberView;
- (double)nextTrackAndRewindButtonPointSize;
- (double)playPausePointSize;
- (double)publisherLogoBottomMargin;
- (double)publisherLogoHeight;
- (double)titleLabelFontSize;
- (id)nowPlayingBottomControlsProvidePlaybackRateMenu:(id)a3;
- (void)applicationWillEnterForeground;
- (void)artworkTapped:(id)a3;
- (void)dismissButtonTapped:(id)a3;
- (void)nowPlayingPlaybackControlsDidTapNextTrack:(id)a3;
- (void)nowPlayingPlaybackControlsDidTapPause:(id)a3;
- (void)nowPlayingPlaybackControlsDidTapPlay:(id)a3;
- (void)nowPlayingPlaybackControlsDidTapRewind:(id)a3;
- (void)nowPlayingPlaybackControlsDidTapSkipForward:(id)a3;
- (void)nowPlayingTitleViewDidTapEllipsis:(id)a3;
- (void)seekToPosition:(double)a3;
- (void)setArtwork:(id)a3;
- (void)setArtwork:(id)a3 animated:(BOOL)a4;
- (void)setArtworkView:(id)a3;
- (void)setBottomControls:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7;
- (void)setDelegate:(id)a3;
- (void)setDismissButton:(id)a3;
- (void)setGrabberView:(id)a3;
- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4;
- (void)setNextTrackButtonEnabled:(BOOL)a3;
- (void)setPlaybackControls:(id)a3;
- (void)setPublisherImage:(id)a3 fallbackName:(id)a4;
- (void)setRate:(double)a3;
- (void)setSkipForwardButtonEnabled:(BOOL)a3;
- (void)setTimeControl:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setVolumeControl:(id)a3;
- (void)titleViewTapped:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation NANowPlayingViewController

- (NANowPlayingViewController)initWithBackground:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)NANowPlayingViewController;
  v5 = [(NANowPlayingViewController *)&v53 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5)
  {
    [(NANowPlayingViewController *)v5 setView:v4];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke;
    v51[3] = &unk_1E64061D8;
    v7 = v6;
    v52 = v7;
    uint64_t v8 = __49__NANowPlayingViewController_initWithBackground___block_invoke((uint64_t)v51);
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v8;

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_2;
    v49[3] = &unk_1E6406200;
    v10 = v7;
    v50 = v10;
    uint64_t v11 = __49__NANowPlayingViewController_initWithBackground___block_invoke_2((uint64_t)v49);
    titleView = v10->_titleView;
    v10->_titleView = (NANowPlayingTitleView *)v11;

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_3;
    v47[3] = &unk_1E6406250;
    v13 = v10;
    v48 = v13;
    uint64_t v14 = __49__NANowPlayingViewController_initWithBackground___block_invoke_3((uint64_t)v47);
    timeControl = v13->_timeControl;
    v13->_timeControl = (NANowPlayingTimeControl *)v14;

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_5;
    v45[3] = &unk_1E6406278;
    v16 = v13;
    v46 = v16;
    uint64_t v17 = __49__NANowPlayingViewController_initWithBackground___block_invoke_5((uint64_t)v45);
    playbackControls = v16->_playbackControls;
    v16->_playbackControls = (NANowPlayingPlaybackControls *)v17;

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_6;
    v43[3] = &unk_1E64062A0;
    v19 = v16;
    v44 = v19;
    uint64_t v20 = __49__NANowPlayingViewController_initWithBackground___block_invoke_6((uint64_t)v43);
    volumeControl = v19->_volumeControl;
    v19->_volumeControl = (NANowPlayingVolumeSlider *)v20;

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_7;
    v41[3] = &unk_1E64062C8;
    v22 = v19;
    v42 = v22;
    uint64_t v23 = __49__NANowPlayingViewController_initWithBackground___block_invoke_7((uint64_t)v41);
    bottomControls = v22->_bottomControls;
    v22->_bottomControls = (NANowPlayingBottomControls *)v23;

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_8;
    v39[3] = &unk_1E64062F0;
    v25 = v22;
    v40 = v25;
    uint64_t v26 = __49__NANowPlayingViewController_initWithBackground___block_invoke_8((uint64_t)v39);
    artworkView = v25->_artworkView;
    v25->_artworkView = (NANowPlayingArtworkView *)v26;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_9;
    v37[3] = &unk_1E6406318;
    v28 = v25;
    v38 = v28;
    uint64_t v29 = __49__NANowPlayingViewController_initWithBackground___block_invoke_9((uint64_t)v37);
    grabberView = v28->_grabberView;
    v28->_grabberView = (_UIGrabber *)v29;

    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_10;
    v35[3] = &unk_1E6406340;
    v31 = v28;
    id v36 = v31;
    uint64_t v32 = __49__NANowPlayingViewController_initWithBackground___block_invoke_10((uint64_t)v35);
    v33 = (void *)v31[130];
    v31[130] = v32;
  }
  return v6;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setAutoresizingMask:16];
  id v4 = [*(id *)(a1 + 32) view];
  [v4 addSubview:v3];

  return v3;
}

NANowPlayingTitleView *__49__NANowPlayingViewController_initWithBackground___block_invoke_2(uint64_t a1)
{
  id v2 = [NANowPlayingTitleView alloc];
  v3 = -[NANowPlayingTitleView initWithFrame:layoutSpecProvider:](v2, "initWithFrame:layoutSpecProvider:", *(void *)(a1 + 32), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NANowPlayingTitleView *)v3 setAutoresizingMask:2];
  [(NANowPlayingTitleView *)v3 setMarqueeRunning:1];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:*(void *)(a1 + 32) action:sel_titleViewTapped_];
  [(NANowPlayingTitleView *)v3 addGestureRecognizer:v4];

  [(NANowPlayingTitleView *)v3 setDelegate:*(void *)(a1 + 32)];
  v5 = [*(id *)(a1 + 32) contentView];
  [v5 addSubview:v3];

  return v3;
}

NANowPlayingTimeControl *__49__NANowPlayingViewController_initWithBackground___block_invoke_3(uint64_t a1)
{
  id v2 = [NANowPlayingTimeControl alloc];
  v3 = -[NANowPlayingTimeControl initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NANowPlayingTimeControl *)v3 setAutoresizingMask:2];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__NANowPlayingViewController_initWithBackground___block_invoke_4;
  v8[3] = &unk_1E6406228;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 32);
  [(NANowPlayingTimeControl *)v3 setTimeDidChangeHandler:v8];
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [(NANowPlayingTimeControl *)v3 setTintColor:v4];

  v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(NANowPlayingTimeControl *)v3 setTimeLabelTextColor:v5];

  v6 = [*(id *)(a1 + 32) contentView];
  [v6 addSubview:v3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v3;
}

void __49__NANowPlayingViewController_initWithBackground___block_invoke_4(uint64_t a1, char a2, double a3)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = [WeakRetained delegate];
    [v6 nowPlayingViewController:*(void *)(a1 + 32) seekToPosition:a3];
  }
}

NANowPlayingPlaybackControls *__49__NANowPlayingViewController_initWithBackground___block_invoke_5(uint64_t a1)
{
  id v2 = [NANowPlayingPlaybackControls alloc];
  uint64_t v3 = [*(id *)(a1 + 32) view];
  id v4 = [v3 window];
  +[NANowPlayingLayoutSpec playbackControlsHorizontalInsetInView:v4];
  v6 = -[NANowPlayingPlaybackControls initWithFrame:inset:layoutSpecProvider:](v2, "initWithFrame:inset:layoutSpecProvider:", *(void *)(a1 + 32), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v5);

  [(NANowPlayingPlaybackControls *)v6 setAutoresizingMask:2];
  [(NANowPlayingPlaybackControls *)v6 setDelegate:*(void *)(a1 + 32)];
  v7 = [*(id *)(a1 + 32) contentView];
  [v7 addSubview:v6];

  return v6;
}

NANowPlayingVolumeSlider *__49__NANowPlayingViewController_initWithBackground___block_invoke_6(uint64_t a1)
{
  id v2 = [NANowPlayingVolumeSlider alloc];
  uint64_t v3 = -[NANowPlayingVolumeSlider initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NANowPlayingVolumeSlider *)v3 setAutoresizingMask:2];
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  [(NANowPlayingVolumeSlider *)v3 setTintColor:v4];

  double v5 = [*(id *)(a1 + 32) contentView];
  [v5 addSubview:v3];

  return v3;
}

NANowPlayingBottomControls *__49__NANowPlayingViewController_initWithBackground___block_invoke_7(uint64_t a1)
{
  id v2 = [NANowPlayingBottomControls alloc];
  uint64_t v3 = -[NANowPlayingBottomControls initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NANowPlayingBottomControls *)v3 setAutoresizingMask:2];
  [(NANowPlayingBottomControls *)v3 setDelegate:*(void *)(a1 + 32)];
  [(NANowPlayingBottomControls *)v3 startAirplayStatusUpdates];
  id v4 = [*(id *)(a1 + 32) contentView];
  [v4 addSubview:v3];

  return v3;
}

NANowPlayingArtworkView *__49__NANowPlayingViewController_initWithBackground___block_invoke_8(uint64_t a1)
{
  id v2 = [NANowPlayingArtworkView alloc];
  uint64_t v3 = -[NANowPlayingArtworkView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NANowPlayingArtworkView *)v3 setAutoresizingMask:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:*(void *)(a1 + 32) action:sel_artworkTapped_];
  [(NANowPlayingArtworkView *)v3 addGestureRecognizer:v4];

  double v5 = [*(id *)(a1 + 32) view];
  [v5 addSubview:v3];

  return v3;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke_9(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB2138]);
  [v2 setOverrideUserInterfaceStyle:2];
  [v2 sizeToFit];
  uint64_t v3 = [*(id *)(a1 + 32) view];
  [v3 addSubview:v2];

  return v2;
}

id __49__NANowPlayingViewController_initWithBackground___block_invoke_10(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v2 addTarget:*(void *)(a1 + 32) action:sel_dismissButtonTapped_ forControlEvents:64];
  uint64_t v3 = [*(id *)(a1 + 32) view];
  [v3 addSubview:v2];

  id v4 = NABundle();
  double v5 = [v4 localizedStringForKey:@"Collapse to mini-player" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v5];

  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)NANowPlayingViewController;
  [(NANowPlayingViewController *)&v4 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_applicationWillEnterForeground name:*MEMORY[0x1E4FB2730] object:0];
}

- (void)viewWillLayoutSubviews
{
  v107.receiver = self;
  v107.super_class = (Class)NANowPlayingViewController;
  [(NANowPlayingViewController *)&v107 viewWillLayoutSubviews];
  uint64_t v3 = [(NANowPlayingViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;

  double v6 = fmax(v5, 12.0);
  v7 = [(NANowPlayingViewController *)self view];
  [v7 bounds];
  double Width = CGRectGetWidth(v108);
  id v9 = [(NANowPlayingViewController *)self grabberView];
  [v9 bounds];
  double v10 = (Width - CGRectGetWidth(v109)) * 0.5;
  uint64_t v11 = [(NANowPlayingViewController *)self grabberView];
  [v11 bounds];
  double v12 = CGRectGetWidth(v110);
  v13 = [(NANowPlayingViewController *)self grabberView];
  [v13 bounds];
  double Height = CGRectGetHeight(v111);
  v15 = [(NANowPlayingViewController *)self grabberView];
  objc_msgSend(v15, "setFrame:", v10, v6 + 7.0, v12, Height);

  v16 = [(NANowPlayingViewController *)self view];
  [v16 bounds];
  double v17 = CGRectGetWidth(v112);
  v18 = [(NANowPlayingViewController *)self dismissButton];
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v17, v6 + 32.0);

  v19 = [(NANowPlayingViewController *)self view];
  [v19 bounds];
  [(NANowPlayingViewController *)self artworkSizeForViewWidth:CGRectGetWidth(v113)];
  double v21 = v20;
  double v23 = v22;

  v24 = [(NANowPlayingViewController *)self artworkView];
  objc_msgSend(v24, "setFrame:", 24.0, v6 + 44.0, v21, v23);

  v25 = [(NANowPlayingViewController *)self view];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(NANowPlayingViewController *)self artworkView];
  [v34 frame];
  double MaxY = CGRectGetMaxY(v114);
  id v36 = [(NANowPlayingViewController *)self view];
  v37 = [v36 window];
  +[NANowPlayingLayoutSpec artworkBottomMarginInView:v37];
  double v39 = MaxY + v38;
  v40 = [(NANowPlayingViewController *)self view];
  [v40 safeAreaInsets];
  double v42 = v33 - (v39 + v41 + 15.0);
  v43 = [(NANowPlayingViewController *)self contentView];
  objc_msgSend(v43, "setFrame:", v27 + 32.0, v29 + v39, v31 + -64.0, v42);

  v44 = [(NANowPlayingViewController *)self titleView];
  [v44 sizeToFit];

  v45 = [(NANowPlayingViewController *)self titleView];
  [v45 bounds];
  double v46 = CGRectGetWidth(v115);
  v47 = [(NANowPlayingViewController *)self titleView];
  [v47 bounds];
  double v48 = CGRectGetHeight(v116);
  v49 = [(NANowPlayingViewController *)self titleView];
  objc_msgSend(v49, "setFrame:", 0.0, 0.0, v46, v48);

  v50 = [(NANowPlayingViewController *)self timeControl];
  v51 = [(NANowPlayingViewController *)self contentView];
  [v51 bounds];
  objc_msgSend(v50, "systemLayoutSizeFittingSize:", v52, v53);
  double v55 = v54;
  double v57 = v56;

  v58 = [(NANowPlayingViewController *)self titleView];
  [v58 frame];
  double v59 = CGRectGetMaxY(v117);
  v60 = [(NANowPlayingViewController *)self view];
  v61 = [v60 window];
  +[NANowPlayingLayoutSpec titleViewBottomMarginInView:v61];
  double v63 = v59 + v62;
  v64 = [(NANowPlayingViewController *)self timeControl];
  objc_msgSend(v64, "setFrame:", 0.0, v63, v55, v57);

  v65 = [(NANowPlayingViewController *)self bottomControls];
  [v65 sizeToFit];

  v66 = [(NANowPlayingViewController *)self bottomControls];
  [v66 bounds];
  CGFloat v67 = CGRectGetHeight(v118) + -44.0;

  v68 = [(NANowPlayingViewController *)self view];
  [v68 bounds];
  double v69 = CGRectGetHeight(v119);
  v70 = [(NANowPlayingViewController *)self contentView];
  [v70 frame];
  double v71 = CGRectGetMaxY(v120);

  double v72 = v67 + v71 - v69;
  if (v72 <= 0.0) {
    double v73 = 44.0;
  }
  else {
    double v73 = v72 + 44.0;
  }
  v74 = [(NANowPlayingViewController *)self contentView];
  [v74 bounds];
  CGFloat v75 = CGRectGetHeight(v121) - v73;
  v76 = [(NANowPlayingViewController *)self bottomControls];
  [v76 bounds];
  double v77 = CGRectGetWidth(v122);
  v78 = [(NANowPlayingViewController *)self bottomControls];
  [v78 bounds];
  double v79 = CGRectGetHeight(v123);
  v80 = [(NANowPlayingViewController *)self bottomControls];
  objc_msgSend(v80, "setFrame:", 0.0, v75, v77, v79);

  v81 = [(NANowPlayingViewController *)self volumeControl];
  v82 = [(NANowPlayingViewController *)self contentView];
  [v82 bounds];
  objc_msgSend(v81, "systemLayoutSizeFittingSize:", v83, v84);
  double v86 = v85;
  double v88 = v87;

  v89 = [(NANowPlayingViewController *)self bottomControls];
  [v89 frame];
  double MinY = CGRectGetMinY(v124);
  v91 = [(NANowPlayingViewController *)self view];
  v92 = [v91 window];
  +[NANowPlayingLayoutSpec bottomControlsTopMarginInView:v92];
  double v94 = MinY - v93;
  v95 = [(NANowPlayingViewController *)self volumeControl];
  [v95 bounds];
  double v96 = v94 - CGRectGetHeight(v125);
  v97 = [(NANowPlayingViewController *)self volumeControl];
  objc_msgSend(v97, "setFrame:", 0.0, v96, v86, v88);

  v98 = [(NANowPlayingViewController *)self timeControl];
  [v98 frame];
  CGFloat v99 = CGRectGetMaxY(v126) + 2.0;
  v100 = [(NANowPlayingViewController *)self playbackControls];
  [v100 bounds];
  double v101 = CGRectGetWidth(v127);
  v102 = [(NANowPlayingViewController *)self volumeControl];
  [v102 frame];
  double v103 = CGRectGetMinY(v128);
  v104 = [(NANowPlayingViewController *)self timeControl];
  [v104 frame];
  double v105 = v103 - CGRectGetMaxY(v129);
  v106 = [(NANowPlayingViewController *)self playbackControls];
  objc_msgSend(v106, "setFrame:", 0.0, v99, v101, v105);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NANowPlayingViewController;
  [(NANowPlayingViewController *)&v6 viewWillDisappear:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"NANowPlayingViewControllerWillDisappearNotification" object:self];

  double v5 = [(NANowPlayingViewController *)self bottomControls];
  [v5 dismissAirplayPicker];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NANowPlayingViewController;
  [(NANowPlayingViewController *)&v5 viewDidDisappear:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"NANowPlayingViewControllerDidDisappearNotification" object:self];
}

- (void)setCurrentTime:(double)a3 duration:(double)a4 rate:(double)a5 isWaiting:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = [(NANowPlayingViewController *)self timeControl];
  [v12 setCurrentTime:v8 duration:v7 rate:a3 isWaiting:a4 animated:a5];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NANowPlayingViewController *)self titleView];
  [v5 setTitle:v4];

  id v6 = [(NANowPlayingViewController *)self artworkView];
  [v6 setAccessibilityLabel:v4];
}

- (void)setPublisherImage:(id)a3 fallbackName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NANowPlayingViewController *)self titleView];
  [v8 setPublisherImage:v7 fallbackName:v6];
}

- (void)setArtwork:(id)a3
{
}

- (void)setArtwork:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NANowPlayingViewController *)self artworkView];
  [v7 setTrackImage:v6 animated:v4];

  id v8 = [(NANowPlayingViewController *)self artworkView];
  [v8 sizeToFit];
}

- (void)setDelegate:(id)a3
{
}

- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4
{
  BOOL v4 = a3;
  id v5 = [(NANowPlayingViewController *)self playbackControls];
  [v5 setIsPlaying:v4];
}

- (void)setRate:(double)a3
{
  id v4 = [(NANowPlayingViewController *)self bottomControls];
  [v4 setRate:a3];
}

- (UIButton)ellipsisButton
{
  id v2 = [(NANowPlayingViewController *)self titleView];
  uint64_t v3 = [v2 ellipsisButton];

  return (UIButton *)v3;
}

- (void)setSkipForwardButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NANowPlayingViewController *)self playbackControls];
  [v4 setSkipForwardButtonEnabled:v3];
}

- (void)setNextTrackButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NANowPlayingViewController *)self playbackControls];
  [v4 setNextTrackButtonEnabled:v3];
}

- (double)publisherLogoHeight
{
  id v2 = [(NANowPlayingViewController *)self titleView];
  [v2 publisherLogoHeight];
  double v4 = v3;

  return v4;
}

- (CGSize)artworkSizeForViewWidth:(double)a3
{
  double v4 = [(NANowPlayingViewController *)self artworkView];
  [v4 artworkSizeForTitleViewWidth:a3 + -48.0];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)dismissButtonTapped:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapDismissButton:self];
}

- (void)artworkTapped:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidRequestNavigateToArticle:self];
}

- (void)titleViewTapped:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidRequestNavigateToArticle:self];
}

- (void)nowPlayingTitleViewDidTapEllipsis:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapEllipsis:self];
}

- (void)nowPlayingPlaybackControlsDidTapRewind:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapRewind:self];
}

- (void)nowPlayingPlaybackControlsDidTapSkipForward:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapSkipForward:self];
}

- (void)nowPlayingPlaybackControlsDidTapPause:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapPause:self];
}

- (void)nowPlayingPlaybackControlsDidTapPlay:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapPlay:self];
}

- (void)nowPlayingPlaybackControlsDidTapNextTrack:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  [v4 nowPlayingViewControllerDidTapNextTrack:self];
}

- (void)seekToPosition:(double)a3
{
  id v5 = [(NANowPlayingViewController *)self delegate];
  [v5 nowPlayingViewController:self seekToPosition:a3];
}

- (id)nowPlayingBottomControlsProvidePlaybackRateMenu:(id)a3
{
  id v4 = [(NANowPlayingViewController *)self delegate];
  id v5 = [v4 nowPlayingViewControllerProvidePlaybackRateMenu:self];

  return v5;
}

- (void)applicationWillEnterForeground
{
  id v2 = [(NANowPlayingViewController *)self titleView];
  [v2 setMarqueeRunning:1];
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (NANowPlayingArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (NANowPlayingTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (NANowPlayingTimeControl)timeControl
{
  return self->_timeControl;
}

- (void)setTimeControl:(id)a3
{
}

- (NANowPlayingPlaybackControls)playbackControls
{
  return self->_playbackControls;
}

- (void)setPlaybackControls:(id)a3
{
}

- (NANowPlayingVolumeSlider)volumeControl
{
  return self->_volumeControl;
}

- (void)setVolumeControl:(id)a3
{
}

- (NANowPlayingBottomControls)bottomControls
{
  return self->_bottomControls;
}

- (void)setBottomControls:(id)a3
{
}

- (_UIGrabber)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
}

- (UIButton)dismissButton
{
  return self->_dismissButton;
}

- (void)setDismissButton:(id)a3
{
}

- (NANowPlayingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NANowPlayingViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_bottomControls, 0);
  objc_storeStrong((id *)&self->_volumeControl, 0);
  objc_storeStrong((id *)&self->_playbackControls, 0);
  objc_storeStrong((id *)&self->_timeControl, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

- (double)playPausePointSize
{
  id v2 = [(NANowPlayingViewController *)self view];
  double v3 = [v2 window];
  +[NANowPlayingLayoutSpec playPausePointSizeInView:v3];
  double v5 = v4;

  return v5;
}

- (double)nextTrackAndRewindButtonPointSize
{
  id v2 = [(NANowPlayingViewController *)self view];
  double v3 = [v2 window];
  +[NANowPlayingLayoutSpec nextTrackAndRewindButtonPointSizeInView:v3];
  double v5 = v4;

  return v5;
}

- (double)titleLabelFontSize
{
  id v2 = [(NANowPlayingViewController *)self view];
  double v3 = [v2 window];
  +[NANowPlayingLayoutSpec titleLabelFontSizeInView:v3];
  double v5 = v4;

  return v5;
}

- (double)publisherLogoBottomMargin
{
  id v2 = [(NANowPlayingViewController *)self view];
  double v3 = [v2 window];
  +[NANowPlayingLayoutSpec publisherLogoBottomMarginInView:v3];
  double v5 = v4;

  return v5;
}

@end