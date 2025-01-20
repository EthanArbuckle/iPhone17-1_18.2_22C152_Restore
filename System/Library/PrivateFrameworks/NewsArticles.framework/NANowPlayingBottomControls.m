@interface NANowPlayingBottomControls
+ (id)_accessibilityValueForRate:(double)a3;
+ (id)_labelForRate:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPMediaControls)mediaControls;
- (MPRouteButton)routeButton;
- (NANowPlayingBottomControls)initWithFrame:(CGRect)a3;
- (NANowPlayingBottomControlsDelegate)delegate;
- (NATouchInsetsButton)playbackSpeedButton;
- (NATouchInsetsButton)sizingPlaybackSpeedButton;
- (double)iconCenterY;
- (double)spacingBetweenButtonCenters;
- (double)widestPlaybackSpeedLabelWidth;
- (id)buttonTitleFont;
- (void)dealloc;
- (void)dismissAirplayPicker;
- (void)layoutPlaybackSpeedButton;
- (void)layoutRouteButton;
- (void)layoutSubviews;
- (void)playbackSpeedButtonTapped:(id)a3;
- (void)routeButtonTapped:(id)a3;
- (void)routeButtonTouchDown:(id)a3;
- (void)routeButtonTouchUpOutside:(id)a3;
- (void)routeDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setPlaybackSpeedButton:(id)a3;
- (void)setRate:(double)a3;
- (void)setRouteButton:(id)a3;
- (void)setSizingPlaybackSpeedButton:(id)a3;
- (void)startAirplayStatusUpdates;
- (void)updateRouteButtonWithRoute:(id)a3;
@end

@implementation NANowPlayingBottomControls

- (NANowPlayingBottomControls)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)NANowPlayingBottomControls;
  v3 = -[NANowPlayingBottomControls initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke;
    v21[3] = &unk_1E64060E0;
    v5 = v3;
    v22 = v5;
    uint64_t v6 = __44__NANowPlayingBottomControls_initWithFrame___block_invoke((uint64_t)v21);
    playbackSpeedButton = v5->_playbackSpeedButton;
    v5->_playbackSpeedButton = (NATouchInsetsButton *)v6;

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2;
    v19[3] = &unk_1E64060E0;
    v8 = v5;
    v20 = v8;
    uint64_t v9 = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2((uint64_t)v19);
    sizingPlaybackSpeedButton = v8->_sizingPlaybackSpeedButton;
    v8->_sizingPlaybackSpeedButton = (NATouchInsetsButton *)v9;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3;
    v17[3] = &unk_1E6406108;
    v11 = v8;
    v18 = v11;
    uint64_t v12 = __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3((uint64_t)v17);
    routeButton = v11->_routeButton;
    v11->_routeButton = (MPRouteButton *)v12;

    v14 = (MPMediaControls *)objc_alloc_init(MEMORY[0x1E4F31908]);
    mediaControls = v11->_mediaControls;
    v11->_mediaControls = v14;

    [(MPMediaControls *)v11->_mediaControls setSourceView:v11->_routeButton];
  }
  return v4;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke(uint64_t a1)
{
  v2 = +[NATouchInsetsButton buttonWithType:0];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setTintColor:v3];

  v4 = [v2 titleLabel];
  [v4 setAdjustsFontForContentSizeCategory:1];

  v5 = [MEMORY[0x1E4FB1970] menuWithChildren:MEMORY[0x1E4F1CBF0]];
  [v2 setMenu:v5];

  [v2 setShowsMenuAsPrimaryAction:1];
  [v2 addTarget:*(void *)(a1 + 32) action:sel_playbackSpeedButtonTapped_ forControlEvents:0x4000];
  uint64_t v6 = NABundle();
  v7 = [v6 localizedStringForKey:@"playback speed" value:&stru_1F1AD8EC0 table:0];
  [v2 setAccessibilityLabel:v7];

  [*(id *)(a1 + 32) addSubview:v2];
  return v2;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke_2(uint64_t a1)
{
  v2 = +[NATouchInsetsButton buttonWithType:0];
  v3 = [*(id *)(a1 + 32) playbackSpeedButton];
  v4 = [v3 titleLabel];
  uint64_t v5 = [v4 adjustsFontForContentSizeCategory];
  uint64_t v6 = [v2 titleLabel];
  [v6 setAdjustsFontForContentSizeCategory:v5];

  [v2 setHidden:1];
  [*(id *)(a1 + 32) addSubview:v2];
  return v2;
}

id __44__NANowPlayingBottomControls_initWithFrame___block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F31A30]);
  v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v3 setExclusiveTouch:1];
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"airplayaudio"];
  uint64_t v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:22.0];
  uint64_t v6 = [v4 imageWithConfiguration:v5];
  [v3 setAccessoryImage:v6];

  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v3 setTintColor:v7];

  v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E0]];
  [v3 setFont:v8];

  [v3 setRouteLabelAxis:1];
  [v3 addTarget:*(void *)(a1 + 32) action:sel_routeButtonTouchDown_ forControlEvents:1];
  [v3 addTarget:*(void *)(a1 + 32) action:sel_routeButtonTouchUpOutside_ forControlEvents:128];
  [v3 addTarget:*(void *)(a1 + 32) action:sel_routeButtonTapped_ forControlEvents:64];
  [*(id *)(a1 + 32) addSubview:v3];
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NANowPlayingBottomControls;
  [(NANowPlayingBottomControls *)&v3 layoutSubviews];
  [(NANowPlayingBottomControls *)self layoutPlaybackSpeedButton];
  [(NANowPlayingBottomControls *)self layoutRouteButton];
}

- (id)buttonTitleFont
{
  id v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0 weight:*MEMORY[0x1E4FB09E0]];
  objc_super v3 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB2998]];
  v4 = [v3 scaledFontForFont:v2 maximumPointSize:26.0];

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = [(NANowPlayingBottomControls *)self routeButton];
  [v5 intrinsicContentSize];
  double v7 = v6;

  if (v7 >= 48.0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NANowPlayingBottomControls sizeThatFits:]();
  }
  v8 = [(NANowPlayingBottomControls *)self routeButton];
  uint64_t v9 = [v8 accessoryImage];
  [v9 size];
  double v11 = v10 * -0.5;

  [(NANowPlayingBottomControls *)self iconCenterY];
  double v13 = v12 + v11;
  v14 = [(NANowPlayingBottomControls *)self routeButton];
  [v14 accessoryImageSpacing];
  double v16 = v15;

  double v17 = v13 + 48.0 + v16;
  double v18 = width;
  result.height = v17;
  result.CGFloat width = v18;
  return result;
}

- (double)iconCenterY
{
  return 22.0;
}

- (double)spacingBetweenButtonCenters
{
  [(NANowPlayingBottomControls *)self bounds];
  return CGRectGetWidth(v3) / 3.0;
}

- (void)layoutPlaybackSpeedButton
{
  CGRect v3 = [(NANowPlayingBottomControls *)self buttonTitleFont];
  v4 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  uint64_t v5 = [v4 titleLabel];
  [v5 setFont:v3];

  double v6 = [(NANowPlayingBottomControls *)self buttonTitleFont];
  double v7 = [(NANowPlayingBottomControls *)self sizingPlaybackSpeedButton];
  v8 = [v7 titleLabel];
  [v8 setFont:v6];

  uint64_t v9 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v9 sizeToFit];

  double v10 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v10 bounds];
  double Height = CGRectGetHeight(v37);

  [(NANowPlayingBottomControls *)self bounds];
  double MidX = CGRectGetMidX(v38);
  [(NANowPlayingBottomControls *)self spacingBetweenButtonCenters];
  double v14 = MidX - v13 * 0.5;
  [(NANowPlayingBottomControls *)self widestPlaybackSpeedLabelWidth];
  double v16 = v15;
  double v17 = v14 - v15 * 0.5;
  [(NANowPlayingBottomControls *)self iconCenterY];
  double v19 = v18 - Height * 0.5;
  v20 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v20 bounds];
  double v21 = CGRectGetHeight(v39);
  v22 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  objc_msgSend(v22, "setFrame:", v17, v19, v16, v21);

  id v35 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v35 bounds];
  double v27 = NAInsetsToMinimumTapTargetForFrame(v23, v24, v25, v26);
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  objc_msgSend(v34, "setTouchInsets:", v27, v29, v31, v33);
}

- (void)layoutRouteButton
{
  [(NANowPlayingBottomControls *)self bounds];
  double MidX = CGRectGetMidX(v38);
  [(NANowPlayingBottomControls *)self spacingBetweenButtonCenters];
  double v5 = MidX + v4 * 0.5;
  double v6 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v6 frame];
  double v7 = CGRectGetMidX(v39);
  [(NANowPlayingBottomControls *)self widestPlaybackSpeedLabelWidth];
  double v9 = v7 + v8 * 0.5;

  [(NANowPlayingBottomControls *)self bounds];
  double v10 = CGRectGetMaxX(v40) - v5 + -4.0;
  if (v5 - v9 + -4.0 < v10) {
    double v10 = v5 - v9 + -4.0;
  }
  double v11 = v10 + v10;
  double v12 = [(NANowPlayingBottomControls *)self routeButton];
  [(NANowPlayingBottomControls *)self bounds];
  objc_msgSend(v12, "sizeThatFits:", v11, CGRectGetHeight(v41));
  double v14 = v13;
  double v16 = v15;

  if (v11 >= v14) {
    double v11 = v14;
  }
  double v17 = [(NANowPlayingBottomControls *)self routeButton];
  double v18 = [v17 accessoryImage];
  [v18 size];
  double v20 = v19 * 0.5;

  [(NANowPlayingBottomControls *)self iconCenterY];
  double v22 = v21 - v20;
  CGFloat v23 = [(NANowPlayingBottomControls *)self routeButton];
  objc_msgSend(v23, "setFrame:", v5 - v11 * 0.5, v22, v11, v16);

  id v36 = [(NANowPlayingBottomControls *)self routeButton];
  [v36 bounds];
  double v28 = NAInsetsToMinimumTapTargetForFrame(v24, v25, v26, v27);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  id v35 = [(NANowPlayingBottomControls *)self routeButton];
  objc_msgSend(v35, "setHitRectInsets:", v28, v30, v32, v34);
}

- (double)widestPlaybackSpeedLabelWidth
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [&unk_1F1B03898 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v17;
  double v6 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(&unk_1F1B03898);
      }
      double v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      double v9 = objc_opt_class();
      [v8 doubleValue];
      double v10 = objc_msgSend(v9, "_labelForRate:");
      double v11 = [(NANowPlayingBottomControls *)self sizingPlaybackSpeedButton];
      [v11 setTitle:v10 forState:0];

      double v12 = [(NANowPlayingBottomControls *)self sizingPlaybackSpeedButton];
      [v12 intrinsicContentSize];
      double v14 = v13;

      if (v14 >= v6) {
        double v6 = v14;
      }
    }
    uint64_t v4 = [&unk_1F1B03898 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v4);
  return v6;
}

- (void)setRate:(double)a3
{
  uint64_t v5 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  double v6 = [(id)objc_opt_class() _labelForRate:a3];
  [v5 setTitle:v6 forState:0];

  double v7 = [(id)objc_opt_class() _accessibilityValueForRate:a3];
  double v8 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v8 setAccessibilityValue:v7];

  [(NANowPlayingBottomControls *)self setNeedsLayout];
}

- (void)setDelegate:(id)a3
{
}

+ (id)_accessibilityValueForRate:(double)a3
{
  if (a3 >= 1.0)
  {
    if (a3 >= 1.25)
    {
      if (a3 >= 1.5)
      {
        if (a3 >= 1.75)
        {
          uint64_t v4 = NABundle();
          uint64_t v5 = v4;
          if (a3 >= 2.0) {
            double v6 = @"double speed";
          }
          else {
            double v6 = @"one and three quarters speed";
          }
        }
        else
        {
          uint64_t v4 = NABundle();
          uint64_t v5 = v4;
          double v6 = @"one and a half speed";
        }
      }
      else
      {
        uint64_t v4 = NABundle();
        uint64_t v5 = v4;
        double v6 = @"one and a quarter speed";
      }
    }
    else
    {
      uint64_t v4 = NABundle();
      uint64_t v5 = v4;
      double v6 = @"normal speed";
    }
  }
  else
  {
    uint64_t v4 = NABundle();
    uint64_t v5 = v4;
    double v6 = @"three quarters speed";
  }
  double v7 = [v4 localizedStringForKey:v6 value:&stru_1F1AD8EC0 table:0];

  return v7;
}

+ (id)_labelForRate:(double)a3
{
  if (a3 >= 1.0)
  {
    if (a3 >= 1.25)
    {
      if (a3 >= 1.5)
      {
        if (a3 >= 1.75)
        {
          uint64_t v4 = NABundle();
          uint64_t v5 = v4;
          if (a3 >= 2.0) {
            double v6 = @"2";
          }
          else {
            double v6 = @"1.75";
          }
        }
        else
        {
          uint64_t v4 = NABundle();
          uint64_t v5 = v4;
          double v6 = @"1.5";
        }
      }
      else
      {
        uint64_t v4 = NABundle();
        uint64_t v5 = v4;
        double v6 = @"1.25";
      }
    }
    else
    {
      uint64_t v4 = NABundle();
      uint64_t v5 = v4;
      double v6 = @"1";
    }
  }
  else
  {
    uint64_t v4 = NABundle();
    uint64_t v5 = v4;
    double v6 = @"0.75";
  }
  double v7 = [v4 localizedStringForKey:v6 value:&stru_1F1AD8EC0 table:0];

  double v8 = NABundle();
  double v9 = [v8 localizedStringForKey:@"×" value:&stru_1F1AD8EC0 table:0];
  double v10 = [v7 stringByAppendingString:v9];

  return v10;
}

- (void)playbackSpeedButtonTapped:(id)a3
{
  uint64_t v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v8 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "playbackSpeedButtonMenuAction:", v8, 2u);
  }

  uint64_t v5 = [(NANowPlayingBottomControls *)self delegate];
  double v6 = [v5 nowPlayingBottomControlsProvidePlaybackRateMenu:self];
  double v7 = [(NANowPlayingBottomControls *)self playbackSpeedButton];
  [v7 setMenu:v6];
}

- (void)routeButtonTouchDown:(id)a3
{
  uint64_t v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTouchDown:", v6, 2u);
  }

  uint64_t v5 = [(NANowPlayingBottomControls *)self mediaControls];
  [v5 startPrewarming];
}

- (void)routeButtonTapped:(id)a3
{
  uint64_t v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTapped:", v6, 2u);
  }

  uint64_t v5 = [(NANowPlayingBottomControls *)self mediaControls];
  [v5 present];
}

- (void)routeButtonTouchUpOutside:(id)a3
{
  uint64_t v4 = NANowPlayingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1BF495000, v4, OS_LOG_TYPE_DEFAULT, "routeButtonTouchUpOutside:", v6, 2u);
  }

  uint64_t v5 = [(NANowPlayingBottomControls *)self mediaControls];
  [v5 stopPrewarming];
}

- (void)startAirplayStatusUpdates
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_routeDidChange_ name:*MEMORY[0x1E4F31240] object:0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__NANowPlayingBottomControls_startAirplayStatusUpdates__block_invoke;
  v4[3] = &unk_1E6406130;
  v4[4] = self;
  [MEMORY[0x1E4F31850] getActiveRouteWithTimeout:v4 completion:1.0];
}

void __55__NANowPlayingBottomControls_startAirplayStatusUpdates__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    [v3 updateRouteButtonWithRoute:a2];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F31850] systemRoute];
    [v2 updateRouteButtonWithRoute:v4];
  }
}

- (void)dismissAirplayPicker
{
  id v2 = [(NANowPlayingBottomControls *)self mediaControls];
  [v2 dismiss];
}

- (void)routeDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v7 = [v4 object];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__NANowPlayingBottomControls_routeDidChange___block_invoke;
    v9[3] = &unk_1E64060B8;
    v9[4] = self;
    id v10 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __45__NANowPlayingBottomControls_routeDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRouteButtonWithRoute:*(void *)(a1 + 40)];
}

- (void)updateRouteButtonWithRoute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NANowPlayingBottomControls *)self routeButton];
  [v5 setRoute:v4];

  LODWORD(v5) = [v4 isRoutingToWirelessDevice];
  uint64_t v6 = v5 ^ 1;
  double v7 = [(NANowPlayingBottomControls *)self routeButton];
  [v7 setRouteLabelHidden:v6];

  [(NANowPlayingBottomControls *)self setNeedsLayout];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NANowPlayingBottomControls;
  [(NANowPlayingBottomControls *)&v4 dealloc];
}

- (NATouchInsetsButton)playbackSpeedButton
{
  return self->_playbackSpeedButton;
}

- (void)setPlaybackSpeedButton:(id)a3
{
}

- (NATouchInsetsButton)sizingPlaybackSpeedButton
{
  return self->_sizingPlaybackSpeedButton;
}

- (void)setSizingPlaybackSpeedButton:(id)a3
{
}

- (MPRouteButton)routeButton
{
  return self->_routeButton;
}

- (void)setRouteButton:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (NANowPlayingBottomControlsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NANowPlayingBottomControlsDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_routeButton, 0);
  objc_storeStrong((id *)&self->_sizingPlaybackSpeedButton, 0);
  objc_storeStrong((id *)&self->_playbackSpeedButton, 0);
}

- (void)sizeThatFits:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"MPRouteButton needs to be remeasured to find out its max height"];
  int v1 = 136315906;
  id v2 = "-[NANowPlayingBottomControls sizeThatFits:]";
  __int16 v3 = 2080;
  objc_super v4 = "NANowPlayingBottomControls.m";
  __int16 v5 = 1024;
  int v6 = 111;
  __int16 v7 = 2114;
  id v8 = v0;
  _os_log_error_impl(&dword_1BF495000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end