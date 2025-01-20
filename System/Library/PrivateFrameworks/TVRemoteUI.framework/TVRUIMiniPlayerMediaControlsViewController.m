@interface TVRUIMiniPlayerMediaControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isMediaActive;
- (BOOL)isPlaying;
- (BOOL)wantsFastForwardButton;
- (NSNumber)playbackRate;
- (TVREventHaptic)eventHaptic;
- (TVRUIButton)playPauseButton;
- (TVRUIButton)skipBackwardButton;
- (TVRUIButton)skipForwardButton;
- (TVRUIMiniPlayerMediaControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (TVRUIStyleProvider)styleProvider;
- (id)commandHandler;
- (void)_configureHierarchy;
- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 withFeedback:(BOOL)a4;
- (void)_playPauseWasTapped:(id)a3;
- (void)_skipBackwardWasLongPressed:(id)a3;
- (void)_skipBackwardWasTapped:(id)a3;
- (void)_skipForwardWasLongPressed:(id)a3;
- (void)_skipForwardWasTapped:(id)a3;
- (void)_updateButtonsFromPlayingState:(BOOL)a3 mediaActive:(BOOL)a4 playbackRate:(id)a5;
- (void)setCommandHandler:(id)a3;
- (void)setIsMediaActive:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setPlaybackRate:(id)a3;
- (void)setSkipBackwardButton:(id)a3;
- (void)setSkipForwardButton:(id)a3;
- (void)setStyleProvider:(id)a3;
- (void)setWantsFastForwardButton:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TVRUIMiniPlayerMediaControlsViewController

- (TVRUIMiniPlayerMediaControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TVRUIMiniPlayerMediaControlsViewController;
  v4 = [(TVRUIMiniPlayerMediaControlsViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v4->_styleProvider;
    v4->_styleProvider = (TVRUIStyleProvider *)v5;

    playbackRate = v4->_playbackRate;
    v4->_playbackRate = (NSNumber *)&unk_26DB65DD0;
  }
  return v4;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TVRUIMiniPlayerMediaControlsViewController;
  [(TVRUIMiniPlayerMediaControlsViewController *)&v3 viewDidLoad];
  [(TVRUIMiniPlayerMediaControlsViewController *)self _configureHierarchy];
}

- (void)setIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isPlaying = a3;
  BOOL v5 = [(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive];
  id v6 = [(TVRUIMiniPlayerMediaControlsViewController *)self playbackRate];
  [(TVRUIMiniPlayerMediaControlsViewController *)self _updateButtonsFromPlayingState:v3 mediaActive:v5 playbackRate:v6];
}

- (void)setIsMediaActive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isMediaActive = a3;
  BOOL v5 = [(TVRUIMiniPlayerMediaControlsViewController *)self isPlaying];
  id v6 = [(TVRUIMiniPlayerMediaControlsViewController *)self playbackRate];
  [(TVRUIMiniPlayerMediaControlsViewController *)self _updateButtonsFromPlayingState:v5 mediaActive:v3 playbackRate:v6];
}

- (void)setPlaybackRate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackRate, a3);
  id v5 = a3;
  [(TVRUIMiniPlayerMediaControlsViewController *)self _updateButtonsFromPlayingState:[(TVRUIMiniPlayerMediaControlsViewController *)self isPlaying] mediaActive:[(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive] playbackRate:v5];
}

- (void)_configureHierarchy
{
  v73[3] = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(TVREventHaptic);
  eventHaptic = self->_eventHaptic;
  self->_eventHaptic = v3;

  id v5 = [[TVRUIButton alloc] initWithType:7 hasTapAction:1 buttonLocation:2];
  [(TVRUIButton *)v5 setHasButtonShape:0];
  id v6 = [[TVRUIButton alloc] initWithType:9994 hasTapAction:1 buttonLocation:2];
  [(TVRUIButton *)v6 setHasButtonShape:0];
  v7 = [[TVRUIButton alloc] initWithType:6 hasTapAction:1 buttonLocation:2];
  [(TVRUIButton *)v7 setHasButtonShape:0];
  v8 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__skipBackwardWasTapped_];
  [v8 setCancelsTouchesInView:0];
  v65 = v8;
  [(TVRUIButton *)v5 addGestureRecognizer:v8];
  v64 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__skipBackwardWasLongPressed_];
  -[TVRUIButton addGestureRecognizer:](v5, "addGestureRecognizer:");
  v63 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__playPauseWasTapped_];
  -[TVRUIButton addGestureRecognizer:](v6, "addGestureRecognizer:");
  objc_super v9 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__skipForwardWasTapped_];
  [v9 setCancelsTouchesInView:0];
  v62 = v9;
  [(TVRUIButton *)v7 addGestureRecognizer:v9];
  v61 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__skipForwardWasLongPressed_];
  -[TVRUIButton addGestureRecognizer:](v7, "addGestureRecognizer:");
  v66 = self;
  v10 = [(TVRUIMiniPlayerMediaControlsViewController *)self view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  v73[0] = v5;
  v73[1] = v7;
  v11 = v7;
  v73[2] = v6;
  [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:3];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v72 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v68 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
        LODWORD(v18) = 1148846080;
        [v17 setContentHuggingPriority:1 forAxis:v18];
        [v10 addSubview:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v14);
  }

  [v10 setClipsToBounds:0];
  v45 = (void *)MEMORY[0x263F08938];
  v60 = [v10 heightAnchor];
  v59 = [v60 constraintEqualToConstant:41.0];
  v71[0] = v59;
  v58 = [(TVRUIButton *)v5 leadingAnchor];
  v57 = [v10 leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v71[1] = v56;
  v55 = [(TVRUIButton *)v5 centerYAnchor];
  v54 = [v10 centerYAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v71[2] = v53;
  v52 = [(TVRUIButton *)v5 widthAnchor];
  v51 = [v52 constraintEqualToConstant:64.0];
  v71[3] = v51;
  v50 = [(TVRUIButton *)v5 heightAnchor];
  v49 = [v50 constraintEqualToConstant:64.0];
  v71[4] = v49;
  v47 = [(TVRUIButton *)v6 leadingAnchor];
  v48 = [(TVRUIButton *)v5 imageView];
  v46 = [v48 trailingAnchor];
  v44 = [v47 constraintEqualToAnchor:v46 constant:65.0];
  v71[5] = v44;
  v43 = [(TVRUIButton *)v6 centerYAnchor];
  v42 = [v10 centerYAnchor];
  v40 = [v43 constraintEqualToAnchor:v42];
  v71[6] = v40;
  v38 = [(TVRUIButton *)v6 widthAnchor];
  v36 = [v38 constraintEqualToConstant:64.0];
  v71[7] = v36;
  v35 = [(TVRUIButton *)v6 heightAnchor];
  v34 = [v35 constraintEqualToConstant:64.0];
  v71[8] = v34;
  v37 = v7;
  v32 = [(TVRUIButton *)v7 leadingAnchor];
  v33 = [(TVRUIButton *)v6 imageView];
  v31 = [v33 trailingAnchor];
  v30 = [v32 constraintEqualToAnchor:v31 constant:65.0];
  v71[9] = v30;
  v29 = [(TVRUIButton *)v7 centerYAnchor];
  v28 = [v10 centerYAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v71[10] = v27;
  v19 = [(TVRUIButton *)v7 trailingAnchor];
  [v10 trailingAnchor];
  v20 = v41 = v5;
  v21 = [v19 constraintEqualToAnchor:v20];
  v71[11] = v21;
  v22 = [(TVRUIButton *)v11 widthAnchor];
  [v22 constraintEqualToConstant:64.0];
  v23 = v39 = v6;
  v71[12] = v23;
  v24 = [(TVRUIButton *)v11 heightAnchor];
  v25 = [v24 constraintEqualToConstant:64.0];
  v71[13] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:14];
  [v45 activateConstraints:v26];

  [(TVRUIMiniPlayerMediaControlsViewController *)v66 setSkipForwardButton:v37];
  [(TVRUIMiniPlayerMediaControlsViewController *)v66 setSkipBackwardButton:v41];
  [(TVRUIMiniPlayerMediaControlsViewController *)v66 setPlayPauseButton:v39];
}

- (void)_updateButtonsFromPlayingState:(BOOL)a3 mediaActive:(BOOL)a4 playbackRate:(id)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a5;
  objc_super v9 = [(TVRUIMiniPlayerMediaControlsViewController *)self playPauseButton];
  v10 = v9;
  if (v6) {
    uint64_t v11 = 9994;
  }
  else {
    uint64_t v11 = 9993;
  }
  [v9 _updateButtonType:v11];

  [v8 doubleValue];
  if (!v8
    || ((double v13 = fabs(v12 + -1.0), v14 = fabs(v12), v13 >= 0.00000011920929) ? (v15 = v14 < 0.00000011920929) : (v15 = 1),
        v15))
  {
    [(TVRUIMiniPlayerMediaControlsViewController *)self setWantsFastForwardButton:0];
    v16 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipForwardButton];
    [v16 _updateButtonType:6];

    double v18 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipBackwardButton];
    v19 = v18;
    uint64_t v20 = 7;
  }
  else
  {
    -[TVRUIMiniPlayerMediaControlsViewController setWantsFastForwardButton:](self, "setWantsFastForwardButton:", 1, v14);
    v17 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipForwardButton];
    [v17 _updateButtonType:9995];

    double v18 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipBackwardButton];
    v19 = v18;
    uint64_t v20 = 9996;
  }
  [v18 _updateButtonType:v20];

  if (a4)
  {
    v21 = [MEMORY[0x263F825C8] whiteColor];
  }
  else
  {
    v22 = [(TVRUIMiniPlayerMediaControlsViewController *)self styleProvider];
    v21 = [v22 inactiveMediaControlTintColor];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipBackwardButton];
  v34[0] = v23;
  v24 = [(TVRUIMiniPlayerMediaControlsViewController *)self skipForwardButton];
  v34[1] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];

  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) setTintColor:v21];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v27);
  }
}

- (void)_skipBackwardWasTapped:(id)a3
{
  if ([(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive])
  {
    if ([(TVRUIMiniPlayerMediaControlsViewController *)self isPlaying]) {
      uint64_t v4 = [(TVRUIMiniPlayerMediaControlsViewController *)self wantsFastForwardButton];
    }
    else {
      uint64_t v4 = 2;
    }
    [(TVRUIMiniPlayerMediaControlsViewController *)self _invokeCommandHandlerWithCommand:v4 withFeedback:1];
  }
}

- (void)_skipBackwardWasLongPressed:(id)a3
{
  id v7 = a3;
  if ([(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive])
  {
    if ([v7 state] == 1)
    {
      uint64_t v4 = self;
      uint64_t v5 = 5;
      uint64_t v6 = 1;
LABEL_7:
      [(TVRUIMiniPlayerMediaControlsViewController *)v4 _invokeCommandHandlerWithCommand:v5 withFeedback:v6];
      goto LABEL_8;
    }
    if ([v7 state] == 3 || objc_msgSend(v7, "state") == 4)
    {
      uint64_t v4 = self;
      uint64_t v5 = 6;
      uint64_t v6 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)_playPauseWasTapped:(id)a3
{
  [(TVRUIMiniPlayerMediaControlsViewController *)self setIsPlaying:[(TVRUIMiniPlayerMediaControlsViewController *)self isPlaying] ^ 1];
  [(TVRUIMiniPlayerMediaControlsViewController *)self _invokeCommandHandlerWithCommand:2 withFeedback:1];
}

- (void)_skipForwardWasTapped:(id)a3
{
  if ([(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive])
  {
    if ([(TVRUIMiniPlayerMediaControlsViewController *)self isPlaying])
    {
      if ([(TVRUIMiniPlayerMediaControlsViewController *)self wantsFastForwardButton]) {
        uint64_t v4 = 4;
      }
      else {
        uint64_t v4 = 3;
      }
    }
    else
    {
      uint64_t v4 = 2;
    }
    [(TVRUIMiniPlayerMediaControlsViewController *)self _invokeCommandHandlerWithCommand:v4 withFeedback:1];
  }
}

- (void)_skipForwardWasLongPressed:(id)a3
{
  id v7 = a3;
  if ([(TVRUIMiniPlayerMediaControlsViewController *)self isMediaActive])
  {
    if ([v7 state] == 1)
    {
      uint64_t v4 = self;
      uint64_t v5 = 7;
      uint64_t v6 = 1;
LABEL_7:
      [(TVRUIMiniPlayerMediaControlsViewController *)v4 _invokeCommandHandlerWithCommand:v5 withFeedback:v6];
      goto LABEL_8;
    }
    if ([v7 state] == 3 || objc_msgSend(v7, "state") == 4)
    {
      uint64_t v4 = self;
      uint64_t v5 = 8;
      uint64_t v6 = 0;
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)_invokeCommandHandlerWithCommand:(unint64_t)a3 withFeedback:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(TVRUIMiniPlayerMediaControlsViewController *)self commandHandler];

  if (v7)
  {
    id v8 = [(TVRUIMiniPlayerMediaControlsViewController *)self commandHandler];
    v8[2](v8, a3, MEMORY[0x263EFFA78]);

    if (v4)
    {
      id v9 = [(TVRUIMiniPlayerMediaControlsViewController *)self eventHaptic];
      [v9 playSelectionEventHaptic];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (BOOL)isMediaActive
{
  return self->_isMediaActive;
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (id)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (TVRUIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (TVRUIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
}

- (TVRUIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
}

- (TVREventHaptic)eventHaptic
{
  return self->_eventHaptic;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (BOOL)wantsFastForwardButton
{
  return self->_wantsFastForwardButton;
}

- (void)setWantsFastForwardButton:(BOOL)a3
{
  self->_wantsFastForwardButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_eventHaptic, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_playbackRate, 0);
}

@end