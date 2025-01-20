@interface NANowPlayingDockedView
- (BOOL)changesDisplayWhenHighlighted;
- (BOOL)waiting;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (MPUMarqueeView)publisherMarqueeContainer;
- (MPUMarqueeView)titleMarqueeContainer;
- (NANowPlayingDockedView)initWithBackground:(id)a3;
- (NANowPlayingDockedViewDelegate)delegate;
- (UIButton)closeButton;
- (UIButton)playPauseButton;
- (UIButton)rewindButton;
- (UILabel)publisherLabel;
- (UILabel)titleLabel;
- (UIMenu)menu;
- (UIView)contentView;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_updateTitleAccessibilityLabel;
- (void)closeButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)pauseButtonTapped:(id)a3;
- (void)playButtonTapped:(id)a3;
- (void)rewindButtonTapped:(id)a3;
- (void)setChangesDisplayWhenHighlighted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4;
- (void)setMarqueeRunning:(BOOL)a3;
- (void)setMenu:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWaiting:(BOOL)a3;
@end

@implementation NANowPlayingDockedView

- (NANowPlayingDockedView)initWithBackground:(id)a3
{
  v50[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)NANowPlayingDockedView;
  v5 = -[NANowPlayingDockedView initWithFrame:](&v49, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    [v4 setAutoresizingMask:18];
    [(NANowPlayingDockedView *)v5 addSubview:v4];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke;
    v47[3] = &unk_1E64061D8;
    v6 = v5;
    v48 = v6;
    uint64_t v7 = __45__NANowPlayingDockedView_initWithBackground___block_invoke((uint64_t)v47);
    contentView = v6->_contentView;
    v6->_contentView = (UIView *)v7;

    uint64_t v9 = __58__NANowPlayingTitleView_initWithFrame_layoutSpecProvider___block_invoke_3();
    publisherLabel = v6->_publisherLabel;
    v6->_publisherLabel = (UILabel *)v9;

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_3;
    v45[3] = &unk_1E6406158;
    v11 = v6;
    v46 = v11;
    uint64_t v12 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_3((uint64_t)v45);
    publisherMarqueeContainer = v11->_publisherMarqueeContainer;
    v11->_publisherMarqueeContainer = (MPUMarqueeView *)v12;

    uint64_t v14 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_4();
    titleLabel = v11->_titleLabel;
    v11->_titleLabel = (UILabel *)v14;

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_5;
    v43[3] = &unk_1E6406158;
    v16 = v11;
    v44 = v16;
    uint64_t v17 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_5((uint64_t)v43);
    titleMarqueeContainer = v16->_titleMarqueeContainer;
    v16->_titleMarqueeContainer = (MPUMarqueeView *)v17;

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_6;
    v41[3] = &unk_1E6406340;
    v19 = v16;
    v42 = v19;
    uint64_t v20 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_6((uint64_t)v41);
    rewindButton = v19->_rewindButton;
    v19->_rewindButton = (UIButton *)v20;

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_7;
    v39[3] = &unk_1E6406340;
    v22 = v19;
    v40 = v22;
    uint64_t v23 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_7((uint64_t)v39);
    playPauseButton = v22->_playPauseButton;
    v22->_playPauseButton = (UIButton *)v23;

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __45__NANowPlayingDockedView_initWithBackground___block_invoke_8;
    v37[3] = &unk_1E6406340;
    v25 = v22;
    v38 = v25;
    uint64_t v26 = __45__NANowPlayingDockedView_initWithBackground___block_invoke_8((uint64_t)v37);
    closeButton = v25->_closeButton;
    v25->_closeButton = (UIButton *)v26;

    v25->_changesDisplayWhenHighlighted = 0;
    v28 = NABundle();
    v29 = [v28 localizedStringForKey:@"mini player" value:&stru_1F1AD8EC0 table:0];
    [(NANowPlayingDockedView *)v25 setAccessibilityLabel:v29];

    [(NANowPlayingDockedView *)v25 setAccessibilityContainerType:4];
    v30 = [(NANowPlayingDockedView *)v25 titleLabel];
    v50[0] = v30;
    v31 = [(NANowPlayingDockedView *)v25 rewindButton];
    v50[1] = v31;
    v32 = [(NANowPlayingDockedView *)v25 playPauseButton];
    v50[2] = v32;
    v33 = [(NANowPlayingDockedView *)v25 closeButton];
    v50[3] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    v35 = [(NANowPlayingDockedView *)v25 contentView];
    [v35 setAccessibilityElements:v34];

    [(NANowPlayingDockedView *)v25 setIsPlaying:0 waiting:0];
  }

  return v5;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setAutoresizingMask:16];
  [*(id *)(a1 + 32) addSubview:v3];
  return v3;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F73A18]);
  [v2 setMarqueeEnabled:1];
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  [v2 setContentGap:32.0];
  v3 = [v2 contentView];
  id v4 = [*(id *)(a1 + 32) publisherLabel];
  [v3 addSubview:v4];

  v5 = [*(id *)(a1 + 32) publisherLabel];
  [v2 setViewForContentSize:v5];

  v6 = [*(id *)(a1 + 32) contentView];
  [v6 addSubview:v2];

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_4()
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1930]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v2 = NABundle();
  v3 = [v2 localizedStringForKey:@"Double tap to expand the mini player" value:&stru_1F1AD8EC0 table:0];
  [v1 setAccessibilityHint:v3];

  [v1 setAdjustsFontForContentSizeCategory:1];
  return v1;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_5(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F73A18]);
  [v2 setMarqueeEnabled:1];
  objc_msgSend(v2, "setFadeEdgeInsets:", 0.0, 0.0, 0.0, 36.0);
  [v2 setContentGap:32.0];
  v3 = [v2 contentView];
  id v4 = [*(id *)(a1 + 32) titleLabel];
  [v3 addSubview:v4];

  v5 = [*(id *)(a1 + 32) publisherMarqueeContainer];
  [v2 addCoordinatedMarqueeView:v5];

  v6 = [*(id *)(a1 + 32) titleLabel];
  [v2 setViewForContentSize:v6];

  uint64_t v7 = [*(id *)(a1 + 32) contentView];
  [v7 addSubview:v2];

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_6(uint64_t a1)
{
  id v2 = +[NATouchInsetsButton buttonWithType:0];
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gobackward.15"];
  id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:20.0];
  v5 = [v3 imageWithConfiguration:v4];
  [v2 setImage:v5 forState:0];

  v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setTintColor:v6];

  uint64_t v7 = NABundle();
  v8 = [v7 localizedStringForKey:@"rewind, 15 seconds", &stru_1F1AD8EC0, 0 value table];
  [v2 setAccessibilityLabel:v8];

  [v2 addTarget:*(void *)(a1 + 32) action:sel_rewindButtonTapped_ forControlEvents:64];
  [v2 sizeToFit];
  [v2 bounds];
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v9, v10, v11, v12));
  v13 = [*(id *)(a1 + 32) contentView];
  [v13 addSubview:v2];

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_7(uint64_t a1)
{
  id v2 = +[NATouchInsetsButton buttonWithType:0];
  v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pause.fill"];
  id v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:26.0];
  v5 = [v3 imageWithConfiguration:v4];
  [v2 setImage:v5 forState:0];

  v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setTintColor:v6];

  uint64_t v7 = NABundle();
  v8 = [v7 localizedStringForKey:@"pause" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v8];

  [v2 addTarget:*(void *)(a1 + 32) action:sel_pauseButtonTapped_ forControlEvents:64];
  [v2 sizeToFit];
  [v2 bounds];
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v9, v10, v11, v12));
  v13 = [*(id *)(a1 + 32) contentView];
  [v13 addSubview:v2];

  return v2;
}

id __45__NANowPlayingDockedView_initWithBackground___block_invoke_8(uint64_t a1)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v2 = +[NATouchInsetsButton buttonWithType:0];
  v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:3 weight:33.0];
  id v4 = (void *)MEMORY[0x1E4FB1830];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v20[0] = v5;
  v6 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v20[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v8 = [v4 configurationWithPaletteColors:v7];
  CGFloat v9 = [v3 configurationByApplyingConfiguration:v8];

  CGFloat v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
  CGFloat v11 = [v10 imageWithConfiguration:v9];
  [v2 setImage:v11 forState:0];

  CGFloat v12 = NABundle();
  v13 = [v12 localizedStringForKey:@"close" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v13];

  [v2 addTarget:*(void *)(a1 + 32) action:sel_closeButtonTapped_ forControlEvents:64];
  [v2 sizeToFit];
  [v2 bounds];
  objc_msgSend(v2, "setTouchInsets:", NAInsetsToMinimumTapTargetForFrame(v14, v15, v16, v17));
  v18 = [*(id *)(a1 + 32) contentView];
  [v18 addSubview:v2];

  return v2;
}

- (void)setHighlighted:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NANowPlayingDockedView;
  [(NANowPlayingDockedView *)&v7 setHighlighted:a3];
  int v4 = [(NANowPlayingDockedView *)self isHighlighted];
  double v5 = 1.0;
  if (v4)
  {
    BOOL v6 = [(NANowPlayingDockedView *)self changesDisplayWhenHighlighted];
    double v5 = 0.8;
    if (!v6) {
      double v5 = 1.0;
    }
  }
  [(NANowPlayingDockedView *)self setAlpha:v5];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NANowPlayingDockedView;
  -[NANowPlayingDockedView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (NANowPlayingDockedView *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v6 = v5;
    }
    else {
      BOOL v6 = self;
    }
    objc_super v7 = v6;
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (void)layoutSubviews
{
  v103.receiver = self;
  v103.super_class = (Class)NANowPlayingDockedView;
  [(NANowPlayingDockedView *)&v103 layoutSubviews];
  [(NANowPlayingDockedView *)self bounds];
  double v4 = v3 + 14.0;
  double v6 = v5 + 16.0;
  double v8 = v7 + -25.0;
  double v10 = v9 + -34.0;
  CGFloat v11 = [(NANowPlayingDockedView *)self contentView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  CGFloat v12 = [(NANowPlayingDockedView *)self publisherLabel];
  [v12 bounds];
  double Width = CGRectGetWidth(v104);
  CGFloat v14 = [(NANowPlayingDockedView *)self publisherLabel];
  [v14 bounds];
  double Height = CGRectGetHeight(v105);
  CGFloat v16 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0, Width, Height);

  CGFloat v17 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v17 frame];
  CGFloat v18 = CGRectGetMaxY(v106) + 4.5;
  v19 = [(NANowPlayingDockedView *)self titleLabel];
  [v19 bounds];
  double v20 = CGRectGetWidth(v107);
  v21 = [(NANowPlayingDockedView *)self titleLabel];
  [v21 bounds];
  double v22 = CGRectGetHeight(v108);
  uint64_t v23 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  objc_msgSend(v23, "setFrame:", 0.0, v18, v20, v22);

  v24 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v24 frame];
  double MaxY = CGRectGetMaxY(v109);
  uint64_t v26 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v26 frame];
  double v27 = (MaxY - CGRectGetMinY(v110)) * 0.5;

  v28 = [(NANowPlayingDockedView *)self contentView];
  [v28 bounds];
  double v29 = CGRectGetWidth(v111);
  v30 = [(NANowPlayingDockedView *)self closeButton];
  [v30 bounds];
  double v31 = v29 - CGRectGetWidth(v112);
  v32 = [(NANowPlayingDockedView *)self closeButton];
  [v32 bounds];
  double v33 = v27 - CGRectGetHeight(v113) * 0.5;
  v34 = [(NANowPlayingDockedView *)self closeButton];
  [v34 bounds];
  double v35 = CGRectGetWidth(v114);
  v36 = [(NANowPlayingDockedView *)self closeButton];
  [v36 bounds];
  double v37 = CGRectGetHeight(v115);
  v38 = [(NANowPlayingDockedView *)self closeButton];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  v39 = [(NANowPlayingDockedView *)self closeButton];
  [v39 frame];
  double v41 = v40;
  v42 = [(NANowPlayingDockedView *)self playPauseButton];
  [v42 bounds];
  double v43 = v41 - (CGRectGetWidth(v116) + 21.0);
  v44 = [(NANowPlayingDockedView *)self playPauseButton];
  [v44 bounds];
  double v45 = v27 - CGRectGetHeight(v117) * 0.5;
  v46 = [(NANowPlayingDockedView *)self playPauseButton];
  [v46 bounds];
  double v47 = CGRectGetWidth(v118);
  v48 = [(NANowPlayingDockedView *)self playPauseButton];
  [v48 bounds];
  double v49 = CGRectGetHeight(v119);
  v50 = [(NANowPlayingDockedView *)self playPauseButton];
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

  v51 = [(NANowPlayingDockedView *)self playPauseButton];
  [v51 frame];
  double v53 = v52;
  v54 = [(NANowPlayingDockedView *)self rewindButton];
  [v54 bounds];
  double v55 = v53 - (CGRectGetWidth(v120) + 23.0);
  v56 = [(NANowPlayingDockedView *)self rewindButton];
  [v56 bounds];
  double v57 = v27 - CGRectGetHeight(v121) * 0.5;
  v58 = [(NANowPlayingDockedView *)self rewindButton];
  [v58 bounds];
  double v59 = CGRectGetWidth(v122);
  v60 = [(NANowPlayingDockedView *)self rewindButton];
  [v60 bounds];
  double v61 = CGRectGetHeight(v123);
  v62 = [(NANowPlayingDockedView *)self rewindButton];
  objc_msgSend(v62, "setFrame:", v55, v57, v59, v61);

  v63 = [(NANowPlayingDockedView *)self rewindButton];
  [v63 frame];
  CGFloat v64 = CGRectGetMinX(v124) + -20.0;

  v65 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v65 frame];
  double MinX = CGRectGetMinX(v125);
  v67 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v67 frame];
  double MinY = CGRectGetMinY(v126);
  v69 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v69 frame];
  double v70 = CGRectGetHeight(v127);
  v71 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  objc_msgSend(v71, "setFrame:", MinX, MinY, v64, v70);

  v72 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v72 frame];
  double v73 = CGRectGetMinX(v128);
  v74 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v74 frame];
  double v75 = CGRectGetMinY(v129);
  v76 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v76 frame];
  double v77 = CGRectGetHeight(v130);
  v78 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  objc_msgSend(v78, "setFrame:", v73, v75, v64, v77);

  v79 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v79 frame];
  CGFloat v81 = v80;
  CGFloat v83 = v82;
  CGFloat v85 = v84;
  CGFloat v87 = v86;
  v88 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v88 frame];
  v135.origin.CGFloat x = v89;
  v135.origin.CGFloat y = v90;
  v135.size.width = v91;
  v135.size.height = v92;
  v131.origin.CGFloat x = v81;
  v131.origin.CGFloat y = v83;
  v131.size.width = v85;
  v131.size.height = v87;
  CGRect v132 = CGRectUnion(v131, v135);
  CGFloat x = v132.origin.x;
  CGFloat y = v132.origin.y;
  CGFloat v95 = v132.size.width;
  CGFloat v96 = v132.size.height;

  v97 = [(NANowPlayingDockedView *)self contentView];
  v133.origin.CGFloat x = x;
  v133.origin.CGFloat y = y;
  v133.size.width = v95;
  v133.size.height = v96;
  CGRect v134 = UIAccessibilityConvertFrameToScreenCoordinates(v133, v97);
  double v98 = v134.origin.x;
  double v99 = v134.origin.y;
  double v100 = v134.size.width;
  double v101 = v134.size.height;
  v102 = [(NANowPlayingDockedView *)self titleLabel];
  objc_msgSend(v102, "setAccessibilityFrame:", v98, v99, v100, v101);
}

- (void)setPublisher:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = NANowPlayingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl(&dword_1BF495000, v5, OS_LOG_TYPE_DEFAULT, "Docked View setting publisher to %{public}@", buf, 0xCu);
  }

  double v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09B8]];
  double v7 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28E0]];
  double v8 = [v7 scaledFontForFont:v6 maximumPointSize:17.0];

  double v9 = (void *)MEMORY[0x1E4FB1EB0];
  double v10 = [(NANowPlayingDockedView *)self publisherLabel];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__NANowPlayingDockedView_setPublisher___block_invoke;
  v13[3] = &unk_1E6406180;
  id v14 = v4;
  id v15 = v8;
  CGFloat v16 = self;
  id v11 = v8;
  id v12 = v4;
  [v9 transitionWithView:v10 duration:5242880 options:v13 animations:0 completion:0.25];

  [(NANowPlayingDockedView *)self _updateTitleAccessibilityLabel];
}

uint64_t __39__NANowPlayingDockedView_setPublisher___block_invoke(uint64_t a1)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *MEMORY[0x1E4F247E8];
    v13[0] = *MEMORY[0x1E4FB06F8];
    v13[1] = v3;
    v14[0] = v2;
    v14[1] = &unk_1F1B03878;
    v13[2] = *MEMORY[0x1E4FB0700];
    id v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.76 green:0.76 blue:0.78 alpha:1.0];
    v14[2] = v4;
    double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v7 = [*(id *)(a1 + 32) uppercaseString];
    double v8 = (void *)[v6 initWithString:v7 attributes:v5];
    double v9 = [*(id *)(a1 + 48) publisherLabel];
    [v9 setAttributedText:v8];
  }
  else
  {
    double v10 = [*(id *)(a1 + 48) publisherLabel];
    [v10 setText:0];
  }
  id v11 = [*(id *)(a1 + 48) publisherLabel];
  [v11 sizeToFit];

  return [*(id *)(a1 + 48) setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = NANowPlayingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v4;
    _os_log_impl(&dword_1BF495000, v5, OS_LOG_TYPE_DEFAULT, "Docked View setting title to %{public}@", buf, 0xCu);
  }

  id v6 = (void *)MEMORY[0x1E4FB08E0];
  double v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.5 weight:*MEMORY[0x1E4FB09E0]];
  double v8 = [v7 fontDescriptor];
  double v9 = [v8 fontDescriptorWithSymbolicTraits:64];
  double v10 = [v6 fontWithDescriptor:v9 size:0.0];

  id v11 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2950]];
  id v12 = [v11 scaledFontForFont:v10 maximumPointSize:21.0];

  uint64_t v13 = *MEMORY[0x1E4F247E8];
  v23[0] = *MEMORY[0x1E4FB06F8];
  v23[1] = v13;
  v24[0] = v12;
  v24[1] = &unk_1F1B03888;
  v23[2] = *MEMORY[0x1E4FB0700];
  id v14 = [MEMORY[0x1E4FB1618] whiteColor];
  v24[2] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

  CGFloat v16 = (void *)MEMORY[0x1E4FB1EB0];
  CGFloat v17 = [(NANowPlayingDockedView *)self titleLabel];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __35__NANowPlayingDockedView_setTitle___block_invoke;
  void v20[3] = &unk_1E6406180;
  v20[4] = self;
  id v21 = v4;
  id v22 = v15;
  id v18 = v15;
  id v19 = v4;
  [v16 transitionWithView:v17 duration:5242880 options:v20 animations:0 completion:0.25];

  [(NANowPlayingDockedView *)self _updateTitleAccessibilityLabel];
}

uint64_t __35__NANowPlayingDockedView_setTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 40) attributes:*(void *)(a1 + 48)];
  uint64_t v3 = [*(id *)(a1 + 32) titleLabel];
  [v3 setAttributedText:v2];

  id v4 = [*(id *)(a1 + 32) titleLabel];
  [v4 sizeToFit];

  double v5 = *(void **)(a1 + 32);
  return [v5 setNeedsLayout];
}

- (void)setMarqueeRunning:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(NANowPlayingDockedView *)self publisherMarqueeContainer];
  [v5 setMarqueeEnabled:v3];

  id v6 = [(NANowPlayingDockedView *)self titleMarqueeContainer];
  [v6 setMarqueeEnabled:v3];
}

- (void)setIsPlaying:(BOOL)a3 waiting:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(NANowPlayingDockedView *)self setWaiting:a4];
  if (v4)
  {
    dispatch_time_t v7 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__NANowPlayingDockedView_setIsPlaying_waiting___block_invoke;
    block[3] = &unk_1E6406368;
    block[4] = self;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  else
  {
    double v8 = [(NANowPlayingDockedView *)self rewindButton];
    [v8 setEnabled:1];
  }
  if (v5)
  {
    double v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pause.fill"];
    double v10 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:2 scale:26.0];
    id v11 = [v9 imageWithConfiguration:v10];

    id v12 = NABundle();
    uint64_t v13 = v12;
    id v14 = @"pause";
  }
  else
  {
    id v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
    CGFloat v16 = [MEMORY[0x1E4FB1830] configurationWithPointSize:1 weight:2 scale:24.0];
    id v11 = [v15 imageWithConfiguration:v16];

    id v12 = NABundle();
    uint64_t v13 = v12;
    id v14 = @"play";
  }
  CGFloat v17 = [v12 localizedStringForKey:v14 value:&stru_1F1AD8EC0 table:0];

  id v18 = [(NANowPlayingDockedView *)self playPauseButton];
  [v18 setImage:v11 forState:0];

  id v19 = [(NANowPlayingDockedView *)self playPauseButton];
  [v19 setAccessibilityLabel:v17];

  double v20 = [(NANowPlayingDockedView *)self playPauseButton];
  [v20 removeTarget:self action:0 forControlEvents:64];

  id v21 = [(NANowPlayingDockedView *)self playPauseButton];
  id v22 = v21;
  uint64_t v23 = &selRef_pauseButtonTapped_;
  if (!v5) {
    uint64_t v23 = &selRef_playButtonTapped_;
  }
  [v21 addTarget:self action:*v23 forControlEvents:64];

  [(NANowPlayingDockedView *)self setNeedsLayout];
}

void __47__NANowPlayingDockedView_setIsPlaying_waiting___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) waiting])
  {
    id v2 = [*(id *)(a1 + 32) rewindButton];
    [v2 setEnabled:0];
  }
}

- (void)_updateTitleAccessibilityLabel
{
  id v9 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  BOOL v3 = [(NANowPlayingDockedView *)self publisherLabel];
  BOOL v4 = [v3 text];

  BOOL v5 = [(NANowPlayingDockedView *)self titleLabel];
  id v6 = [v5 text];

  if ([v4 length]) {
    [v9 addObject:v4];
  }
  if ([v6 length]) {
    [v9 addObject:v6];
  }
  if ([v9 count])
  {
    dispatch_time_t v7 = [v9 componentsJoinedByString:@"\n"];
    double v8 = [(NANowPlayingDockedView *)self titleLabel];
    [v8 setAccessibilityLabel:v7];
  }
  else
  {
    dispatch_time_t v7 = [(NANowPlayingDockedView *)self titleLabel];
    [v7 setAccessibilityLabel:0];
  }
}

- (void)closeButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Close button tapped", v6, 2u);
  }

  BOOL v5 = [(NANowPlayingDockedView *)self delegate];
  [v5 nowPlayingDockedViewDidTapClose:self];
}

- (void)pauseButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Pause button tapped", v6, 2u);
  }

  BOOL v5 = [(NANowPlayingDockedView *)self delegate];
  [v5 nowPlayingDockedViewDidTapPause:self];
}

- (void)playButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Play button tapped", v6, 2u);
  }

  BOOL v5 = [(NANowPlayingDockedView *)self delegate];
  [v5 nowPlayingDockedViewDidTapPlay:self];
}

- (void)rewindButtonTapped:(id)a3
{
  BOOL v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "Docked View Rewind tapped", v6, 2u);
  }

  BOOL v5 = [(NANowPlayingDockedView *)self delegate];
  [v5 nowPlayingDockedViewDidTapRewind:self];
}

- (void)setMenu:(id)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  BOOL v5 = [(NANowPlayingDockedView *)self menu];

  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__NANowPlayingDockedView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v8[3] = &unk_1E6406390;
    v8[4] = self;
    id v6 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

uint64_t __80__NANowPlayingDockedView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) menu];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NANowPlayingDockedView;
  [(NANowPlayingDockedView *)&v12 menuAttachmentPointForConfiguration:a3];
  double v5 = v4;
  double v7 = v6;
  [(NANowPlayingDockedView *)self safeAreaInsets];
  if (v8 == 0.0) {
    double v9 = 10.0;
  }
  else {
    [(NANowPlayingDockedView *)self safeAreaInsets];
  }
  double v10 = v7 + v9 + -4.0;
  double v11 = v5;
  result.CGFloat y = v10;
  result.CGFloat x = v11;
  return result;
}

- (BOOL)changesDisplayWhenHighlighted
{
  return self->_changesDisplayWhenHighlighted;
}

- (void)setChangesDisplayWhenHighlighted:(BOOL)a3
{
  self->_changesDisplayWhenHighlighted = a3;
}

- (NANowPlayingDockedViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NANowPlayingDockedViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)publisherLabel
{
  return self->_publisherLabel;
}

- (MPUMarqueeView)publisherMarqueeContainer
{
  return self->_publisherMarqueeContainer;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (MPUMarqueeView)titleMarqueeContainer
{
  return self->_titleMarqueeContainer;
}

- (UIButton)rewindButton
{
  return self->_rewindButton;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (BOOL)waiting
{
  return self->_waiting;
}

- (void)setWaiting:(BOOL)a3
{
  self->_waiting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_rewindButton, 0);
  objc_storeStrong((id *)&self->_titleMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_publisherMarqueeContainer, 0);
  objc_storeStrong((id *)&self->_publisherLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end