@interface TVRUITouchpadViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)areMediaControlsVisible;
- (BOOL)enabled;
- (BOOL)isShowingControls;
- (TVRUIDevice)remoteDevice;
- (TVRUIDirectionalControlView)directionalControlView;
- (TVRUIStyleProvider)styleProvider;
- (TVRUITouchProcessor)touchProcessor;
- (TVRUITouchpadDelegate)touchDelegate;
- (TVRUITouchpadView)touchpadView;
- (UIView)backgroundView;
- (_TVRUIEventDelegate)eventDelegate;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)touchpadMode;
- (void)_darkenSystemColorsChanged:(id)a3;
- (void)_setupDirectionalArrowView;
- (void)_setupTouchpadView;
- (void)_simpleRemoteGesturesEnabled:(id)a3;
- (void)_toggleControlScale;
- (void)_transitionToAppropriateView;
- (void)_transitionToDirectionalControlView;
- (void)_transitionToTouchpadView;
- (void)_updateViewState;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)setBackgroundView:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDirectionalControlView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEventDelegate:(id)a3;
- (void)setMediaControlsAreVisible:(BOOL)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setShowControls:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTouchDelegate:(id)a3;
- (void)setTouchProcessor:(id)a3;
- (void)setTouchpadMode:(int64_t)a3;
- (void)setTouchpadView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)transitonToViewForDeviceType:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TVRUITouchpadViewController

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)TVRUITouchpadViewController;
  [(TVRUITouchpadViewController *)&v9 viewDidLoad];
  [(TVRUITouchpadViewController *)self _darkenSystemColorsChanged:0];
  [(TVRUITouchpadViewController *)self _setupTouchpadView];
  if (_AXSAppleTVRemoteUsesSimpleGestures()) {
    [(TVRUITouchpadViewController *)self _transitionToDirectionalControlView];
  }
  else {
    [(TVRUITouchpadViewController *)self _transitionToTouchpadView];
  }
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__simpleRemoteGesturesEnabled_ name:*MEMORY[0x263F8B118] object:0];

  v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Registered to listen for accessibility simple remote gestures", v8, 2u);
  }

  v5 = [(TVRUITouchpadViewController *)self view];
  v6 = (void *)[objc_alloc(MEMORY[0x263F82A70]) initWithDelegate:self];
  [v5 addInteraction:v6];

  v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__darkenSystemColorsChanged_ name:*MEMORY[0x263F831A0] object:0];

  [(TVRUITouchpadViewController *)self setEnabled:1];
}

- (void)viewWillLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)TVRUITouchpadViewController;
  [(TVRUITouchpadViewController *)&v34 viewWillLayoutSubviews];
  v3 = [(TVRUITouchpadViewController *)self backgroundView];

  if (v3)
  {
    v4 = [(TVRUITouchpadViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(TVRUITouchpadViewController *)self backgroundView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
  v14 = [(TVRUITouchpadViewController *)self view];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(TVRUITouchpadViewController *)self touchpadView];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(TVRUITouchpadViewController *)self view];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [(TVRUITouchpadViewController *)self directionalControlView];
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TVRUITouchpadViewController;
  [(TVRUITouchpadViewController *)&v7 viewWillDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F8B118] object:0];

  double v5 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Unregistered to listen for accessibility simple remote gestures", v6, 2u);
  }
}

- (void)transitonToViewForDeviceType:(int64_t)a3
{
  if (a3 == 2) {
    [(TVRUITouchpadViewController *)self _transitionToDirectionalControlView];
  }
  else {
    [(TVRUITouchpadViewController *)self _transitionToTouchpadView];
  }
}

- (void)_setupTouchpadView
{
  v3 = objc_alloc_init(TVRUITouchpadView);
  touchpadView = self->_touchpadView;
  self->_touchpadView = v3;

  [(TVRUITouchpadView *)self->_touchpadView setAutoresizingMask:18];
  double v5 = [(TVRUITouchpadViewController *)self touchDelegate];
  [(TVRUITouchpadView *)self->_touchpadView setTouchDelegate:v5];

  double v6 = [MEMORY[0x263F825C8] clearColor];
  [(TVRUITouchpadView *)self->_touchpadView setBackgroundColor:v6];

  objc_super v7 = [[TVRUIStandardTouchProcessor alloc] initWithTouchpadView:self->_touchpadView];
  touchProcessor = self->_touchProcessor;
  self->_touchProcessor = (TVRUITouchProcessor *)v7;

  double v9 = self->_touchProcessor;
  id v10 = [(TVRUITouchpadViewController *)self eventDelegate];
  [(TVRUITouchProcessor *)v9 setEventDelegate:v10];
}

- (void)_setupDirectionalArrowView
{
  v3 = [TVRUIDirectionalControlView alloc];
  v4 = [(TVRUITouchpadViewController *)self styleProvider];
  double v5 = [(TVRUIDirectionalControlView *)v3 initWithStyleProvider:v4];
  directionalControlView = self->_directionalControlView;
  self->_directionalControlView = v5;

  [(TVRUIDirectionalControlView *)self->_directionalControlView setAutoresizingMask:18];
  objc_super v7 = [MEMORY[0x263F825C8] clearColor];
  [(TVRUIDirectionalControlView *)self->_directionalControlView setBackgroundColor:v7];

  id v8 = [(TVRUITouchpadViewController *)self eventDelegate];
  [(TVRUIDirectionalControlView *)self->_directionalControlView setEventDelegate:v8];
}

- (void)_transitionToTouchpadView
{
  v3 = [(TVRUITouchpadViewController *)self directionalControlView];
  v4 = [v3 superview];
  double v5 = [(TVRUITouchpadViewController *)self view];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    objc_super v7 = (void *)MEMORY[0x263F82E00];
    id v8 = [(TVRUITouchpadViewController *)self directionalControlView];
    double v9 = [(TVRUITouchpadViewController *)self touchpadView];
    [v7 transitionFromView:v8 toView:v9 duration:5242880 options:0 completion:0.2];
  }
  else
  {
    id v8 = [(TVRUITouchpadViewController *)self view];
    double v9 = [(TVRUITouchpadViewController *)self touchpadView];
    [v8 addSubview:v9];
  }

  [(TVRUITouchpadViewController *)self setTouchpadMode:0];
}

- (void)_transitionToDirectionalControlView
{
  v3 = [(TVRUITouchpadViewController *)self directionalControlView];

  if (!v3) {
    [(TVRUITouchpadViewController *)self _setupDirectionalArrowView];
  }
  v4 = [(TVRUITouchpadViewController *)self eventDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(TVRUITouchpadViewController *)self eventDelegate];
    [v6 willShowDirectionalControls];
  }
  objc_super v7 = [(TVRUITouchpadViewController *)self touchpadView];
  id v8 = [v7 superview];
  double v9 = [(TVRUITouchpadViewController *)self view];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    double v11 = (void *)MEMORY[0x263F82E00];
    double v12 = [(TVRUITouchpadViewController *)self touchpadView];
    v13 = [(TVRUITouchpadViewController *)self directionalControlView];
    [v11 transitionFromView:v12 toView:v13 duration:5242880 options:0 completion:0.2];
  }
  else
  {
    double v12 = [(TVRUITouchpadViewController *)self view];
    v13 = [(TVRUITouchpadViewController *)self directionalControlView];
    [v12 addSubview:v13];
  }

  v14 = [(TVRUITouchpadViewController *)self directionalControlView];
  [v14 setAlpha:1.0];

  [(TVRUITouchpadViewController *)self setTouchpadMode:1];
  [(TVRUITouchpadViewController *)self _toggleControlScale];
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
  [(TVRUITouchpadViewController *)self _transitionToAppropriateView];
}

- (void)_transitionToAppropriateView
{
  if ([(TVRUIDevice *)self->_remoteDevice supportsTouchEvents])
  {
    int v3 = _AXSAppleTVRemoteUsesSimpleGestures();
    int64_t v4 = [(TVRUITouchpadViewController *)self touchpadMode];
    if (!v3)
    {
      if (v4)
      {
        [(TVRUITouchpadViewController *)self _transitionToTouchpadView];
      }
      return;
    }
  }
  else
  {
    int64_t v4 = [(TVRUITouchpadViewController *)self touchpadMode];
  }
  if (v4 != 1)
  {
    [(TVRUITouchpadViewController *)self _transitionToDirectionalControlView];
  }
}

- (void)_updateViewState
{
  if ([(TVRUITouchpadViewController *)self isShowingControls])
  {
    BOOL v3 = [(TVRUITouchpadViewController *)self enabled];
    if (v3)
    {
      double v4 = 1.0;
    }
    else
    {
      id v7 = [(TVRUITouchpadViewController *)self styleProvider];
      [v7 disabledButtonAlpha];
      double v4 = v5;
    }
    int v6 = [(TVRUITouchpadViewController *)self directionalControlView];
    [v6 setAlpha:v4];

    if (!v3)
    {
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(TVRUITouchpadViewController *)self _updateViewState];
  }
}

- (void)setShowControls:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(TVRUITouchpadViewController *)self directionalControlView];
  int v6 = [v5 superview];
  id v7 = [(TVRUITouchpadViewController *)self view];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    if (v3) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    int v10 = [(TVRUITouchpadViewController *)self directionalControlView];
    [v10 setAlpha:v9];

    id v11 = [(TVRUITouchpadViewController *)self touchpadView];
    [v11 setUserInteractionEnabled:v3];
  }
}

- (BOOL)isShowingControls
{
  v2 = [(TVRUITouchpadViewController *)self directionalControlView];
  [v2 alpha];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (void)setMediaControlsAreVisible:(BOOL)a3
{
  if (self->_mediaControlsAreVisible != a3)
  {
    self->_mediaControlsAreVisible = a3;
    [(TVRUITouchpadViewController *)self _toggleControlScale];
  }
}

- (void)_toggleControlScale
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v3 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(TVRUITouchpadViewController *)self isShowingControls];
    double v5 = [(TVRUITouchpadViewController *)self styleProvider];
    v9[0] = 67109376;
    v9[1] = v4;
    __int16 v10 = 1024;
    int v11 = [v5 isSmallDevice];
    _os_log_impl(&dword_227326000, v3, OS_LOG_TYPE_DEFAULT, "#directional - toggleControlState %d %d", (uint8_t *)v9, 0xEu);
  }
  if ([(TVRUITouchpadViewController *)self isShowingControls])
  {
    int v6 = [(TVRUITouchpadViewController *)self styleProvider];
    int v7 = [v6 isSmallDevice];

    if (v7)
    {
      int v8 = [(TVRUITouchpadViewController *)self directionalControlView];
      [v8 setOffsetDirectionalPad:self->_mediaControlsAreVisible];
    }
  }
}

- (void)_simpleRemoteGesturesEnabled:(id)a3
{
  BOOL v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "Accessibility simple remote gestures enabled notification received", v5, 2u);
  }

  [(TVRUITouchpadViewController *)self _transitionToAppropriateView];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(TVRUITouchpadViewController *)self touchpadMode])
  {
    int v7 = [(TVRUITouchpadViewController *)self touchProcessor];
    int v8 = [(TVRUITouchpadViewController *)self touchpadView];
    [v7 touchesBegan:v8 touches:v9 withEvent:v6];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(TVRUITouchpadViewController *)self touchpadMode])
  {
    int v7 = [(TVRUITouchpadViewController *)self touchProcessor];
    int v8 = [(TVRUITouchpadViewController *)self touchpadView];
    [v7 touchesMoved:v8 touches:v9 withEvent:v6];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(TVRUITouchpadViewController *)self touchpadMode])
  {
    int v7 = [(TVRUITouchpadViewController *)self touchProcessor];
    int v8 = [(TVRUITouchpadViewController *)self touchpadView];
    [v7 touchesEnded:v8 touches:v9 withEvent:v6];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(TVRUITouchpadViewController *)self touchpadMode])
  {
    int v7 = [(TVRUITouchpadViewController *)self touchProcessor];
    int v8 = [(TVRUITouchpadViewController *)self touchpadView];
    [v7 touchesCancelled:v8 touches:v9 withEvent:v6];
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a5;
  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v6 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[TVRUITouchpadViewController pointerInteraction:willEnterRegion:animator:]";
    _os_log_impl(&dword_227326000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if ([(TVRUITouchpadViewController *)self touchpadMode] != 1)
  {
    int v7 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning to directional controls because a pointer entered the touchpad", (uint8_t *)&v8, 2u);
    }

    [(TVRUITouchpadViewController *)self _transitionToDirectionalControlView];
  }
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v4 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[TVRUITouchpadViewController _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_227326000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  id v5 = [(TVRUITouchpadViewController *)self styleProvider];
  id v6 = [v5 touchpadBackgroundColor];
  int v7 = [(TVRUITouchpadViewController *)self view];
  [v7 setBackgroundColor:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (TVRUITouchpadDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (TVRUITouchpadDelegate *)WeakRetained;
}

- (void)setTouchDelegate:(id)a3
{
}

- (BOOL)areMediaControlsVisible
{
  return self->_mediaControlsAreVisible;
}

- (TVRUITouchpadView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
}

- (TVRUIDirectionalControlView)directionalControlView
{
  return self->_directionalControlView;
}

- (void)setDirectionalControlView:(id)a3
{
}

- (TVRUIDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (int64_t)touchpadMode
{
  return self->_touchpadMode;
}

- (void)setTouchpadMode:(int64_t)a3
{
  self->_touchpadMode = a3;
}

- (TVRUITouchProcessor)touchProcessor
{
  return self->_touchProcessor;
}

- (void)setTouchProcessor:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_touchProcessor, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_directionalControlView, 0);
  objc_storeStrong((id *)&self->_touchpadView, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end