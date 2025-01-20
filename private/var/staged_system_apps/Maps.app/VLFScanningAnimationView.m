@interface VLFScanningAnimationView
- (BOOL)isDarkMode;
- (MapsLoopingVideoPlayerView)playerView;
- (UIImageView)skylineImageView;
- (VLFScanningAnimationManager)animationManager;
- (VLFScanningAnimationView)initWithFrame:(CGRect)a3;
- (id)videoNameForCurrentState;
- (int64_t)currentScanningState;
- (void)didMoveToWindow;
- (void)setAnimationManager:(id)a3;
- (void)setCurrentScanningState:(int64_t)a3;
- (void)setPlayerView:(id)a3;
- (void)setSkylineImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForCurrentStateAndPreserveTimestamp:(BOOL)a3 animate:(BOOL)a4;
@end

@implementation VLFScanningAnimationView

- (VLFScanningAnimationView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VLFScanningAnimationView;
  v3 = -[VLFScanningAnimationView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_currentScanningState = 1;
    v5 = objc_opt_new();
    id v6 = objc_alloc((Class)UIImageView);
    v7 = +[UIImage imageNamed:@"VLF_skyline"];
    v8 = (UIImageView *)[v6 initWithImage:v7];
    skylineImageView = v4->_skylineImageView;
    v4->_skylineImageView = v8;

    [(UIImageView *)v4->_skylineImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_skylineImageView setContentMode:1];
    [(VLFScanningAnimationView *)v4 addSubview:v4->_skylineImageView];
    LODWORD(v10) = 1148846080;
    v11 = [(UIImageView *)v4->_skylineImageView _maps_constraintsEqualToEdgesOfView:v4 priority:v10];
    v12 = [v11 allConstraints];
    [v5 addObjectsFromArray:v12];

    v13 = -[MapsLoopingVideoPlayerView initWithFrame:]([MapsLoopingVideoPlayerView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    playerView = v4->_playerView;
    v4->_playerView = v13;

    [(MapsLoopingVideoPlayerView *)v4->_playerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VLFScanningAnimationView *)v4 addSubview:v4->_playerView];
    LODWORD(v15) = 1148846080;
    v16 = [(MapsLoopingVideoPlayerView *)v4->_playerView _maps_constraintsEqualToEdgesOfView:v4 priority:v15];
    v17 = [v16 allConstraints];
    [v5 addObjectsFromArray:v17];

    +[NSLayoutConstraint activateConstraints:v5];
    v18 = [VLFScanningAnimationManager alloc];
    v19 = [(MapsLoopingVideoPlayerView *)v4->_playerView layer];
    v20 = [(VLFScanningAnimationManager *)v18 initWithLayer:v19];
    animationManager = v4->_animationManager;
    v4->_animationManager = v20;

    v22 = +[NSUserDefaults standardUserDefaults];
    LODWORD(v19) = [v22 BOOLForKey:@"VLFSessionScanningAnimationShowLongestTextKey"];

    if (v19)
    {
      v23 = +[UIColor labelColor];
      v24 = [v23 colorWithAlphaComponent:0.300000012];
      [(VLFScanningAnimationView *)v4 setBackgroundColor:v24];
    }
    [(VLFScanningAnimationView *)v4 updateForCurrentStateAndPreserveTimestamp:0 animate:0];
  }
  return v4;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)VLFScanningAnimationView;
  [(VLFScanningAnimationView *)&v5 didMoveToWindow];
  v3 = [(VLFScanningAnimationView *)self window];
  v4 = [v3 windowScene];

  if (v4) {
    [(VLFScanningAnimationView *)self updateForCurrentStateAndPreserveTimestamp:0 animate:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VLFScanningAnimationView;
  [(VLFScanningAnimationView *)&v6 traitCollectionDidChange:a3];
  v4 = sub_1003E3200();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Trait collection did change", v5, 2u);
  }

  [(VLFScanningAnimationView *)self updateForCurrentStateAndPreserveTimestamp:1 animate:0];
}

- (void)setCurrentScanningState:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  objc_super v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136316418;
        v21 = "-[VLFScanningAnimationView setCurrentScanningState:]";
        __int16 v22 = 2080;
        v23 = "VLFScanningAnimationView.m";
        __int16 v24 = 1024;
        int v25 = 99;
        __int16 v26 = 2080;
        v27 = "dispatch_get_main_queue()";
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v30 = 2080;
        v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v20,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v18 = sub_1005762E4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          v21 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
    }
  }
  int64_t currentScanningState = self->_currentScanningState;
  if (currentScanningState != a3)
  {
    self->_int64_t currentScanningState = a3;
    v9 = sub_1003E3200();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)(currentScanningState - 2) > 3) {
        CFStringRef v10 = @"VLFScanningStateInitializing";
      }
      else {
        CFStringRef v10 = *(&off_1012E8A78 + currentScanningState - 2);
      }
      unint64_t v11 = self->_currentScanningState - 2;
      if (v11 > 3) {
        CFStringRef v12 = @"VLFScanningStateInitializing";
      }
      else {
        CFStringRef v12 = *(&off_1012E8A78 + v11);
      }
      int v20 = 138412546;
      v21 = (const char *)v10;
      __int16 v22 = 2112;
      v23 = (const char *)v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Current scanning state changed from %@ to %@", (uint8_t *)&v20, 0x16u);
    }

    int64_t v13 = self->_currentScanningState;
    if ((unint64_t)(currentScanningState - 1) > 1 || (unint64_t)(v13 - 1) > 1)
    {
      [(VLFScanningAnimationView *)self updateForCurrentStateAndPreserveTimestamp:0 animate:v13 != 1];
    }
    else
    {
      double v15 = sub_1003E3200();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Ignoring transition between .Initializing and .Scanning because they're the same video", (uint8_t *)&v20, 2u);
      }
    }
  }
}

- (BOOL)isDarkMode
{
  v2 = [(VLFScanningAnimationView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)videoNameForCurrentState
{
  int64_t v3 = [(VLFScanningAnimationView *)self currentScanningState];
  if ((unint64_t)(v3 - 1) < 3)
  {
    if (+[VLFDeviceInfo isIslandDevice])
    {
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      objc_super v5 = @"VLF_scan_island_light";
      CFStringRef v6 = @"VLF_scan_island_dark";
    }
    else
    {
      unsigned int v7 = +[VLFDeviceInfo isNotchDevice];
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      if (v7)
      {
        objc_super v5 = @"VLF_scan_notch_light";
        CFStringRef v6 = @"VLF_scan_notch_dark";
      }
      else
      {
        objc_super v5 = @"VLF_scan_light";
        CFStringRef v6 = @"VLF_scan_dark";
      }
    }
LABEL_31:
    if (v4) {
      objc_super v5 = (__CFString *)v6;
    }
    v16 = v5;
    goto LABEL_34;
  }
  if (v3 == 4)
  {
    if (+[VLFDeviceInfo isIslandDevice])
    {
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      objc_super v5 = @"VLF_raise_island_light";
      CFStringRef v6 = @"VLF_raise_island_dark";
    }
    else
    {
      unsigned int v15 = +[VLFDeviceInfo isNotchDevice];
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      if (v15)
      {
        objc_super v5 = @"VLF_raise_notch_light";
        CFStringRef v6 = @"VLF_raise_notch_dark";
      }
      else
      {
        objc_super v5 = @"VLF_raise_light";
        CFStringRef v6 = @"VLF_raise_dark";
      }
    }
    goto LABEL_31;
  }
  if (v3 == 5)
  {
    if (+[VLFDeviceInfo isIslandDevice])
    {
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      objc_super v5 = @"VLF_lower_island_light";
      CFStringRef v6 = @"VLF_lower_island_dark";
    }
    else
    {
      unsigned int v14 = +[VLFDeviceInfo isNotchDevice];
      unsigned int v4 = [(VLFScanningAnimationView *)self isDarkMode];
      if (v14)
      {
        objc_super v5 = @"VLF_lower_notch_light";
        CFStringRef v6 = @"VLF_lower_notch_dark";
      }
      else
      {
        objc_super v5 = @"VLF_lower_light";
        CFStringRef v6 = @"VLF_lower_dark";
      }
    }
    goto LABEL_31;
  }
  v8 = sub_1005762E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v18 = 136315650;
    v19 = "-[VLFScanningAnimationView videoNameForCurrentState]";
    __int16 v20 = 2080;
    v21 = "VLFScanningAnimationView.m";
    __int16 v22 = 1024;
    int v23 = 161;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v18, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    v9 = sub_1005762E4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v10 = +[NSThread callStackSymbols];
      int v18 = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v18, 0xCu);
    }
  }
  unint64_t v11 = sub_1003E3200();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int64_t v12 = [(VLFScanningAnimationView *)self currentScanningState];
    if ((unint64_t)(v12 - 2) > 3) {
      CFStringRef v13 = @"VLFScanningStateInitializing";
    }
    else {
      CFStringRef v13 = *(&off_1012E8A78 + v12 - 2);
    }
    int v18 = 138412290;
    v19 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid current scanning state: (%@); could not determine video name to use",
      (uint8_t *)&v18,
      0xCu);
  }

  v16 = 0;
LABEL_34:

  return v16;
}

- (void)updateForCurrentStateAndPreserveTimestamp:(BOOL)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v8 = dispatch_queue_get_label(0);
  if (label != v8)
  {
    BOOL v9 = !label || v8 == 0;
    if (v9 || strcmp(label, v8))
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v27 = "-[VLFScanningAnimationView updateForCurrentStateAndPreserveTimestamp:animate:]";
        __int16 v28 = 2080;
        v29 = "VLFScanningAnimationView.m";
        __int16 v30 = 1024;
        *(_DWORD *)v31 = 168;
        *(_WORD *)&v31[4] = 2080;
        *(void *)&v31[6] = "dispatch_get_main_queue()";
        __int16 v32 = 2080;
        v33 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v34 = 2080;
        v35 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        __int16 v22 = sub_1005762E4();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v27 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  CFStringRef v10 = sub_1003E3200();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int64_t v11 = [(VLFScanningAnimationView *)self currentScanningState];
    if ((unint64_t)(v11 - 2) > 3) {
      CFStringRef v12 = @"VLFScanningStateInitializing";
    }
    else {
      CFStringRef v12 = *(&off_1012E8A78 + v11 - 2);
    }
    if (v5) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    *(_DWORD *)buf = 138412802;
    v27 = (const char *)v12;
    __int16 v28 = 2112;
    v29 = (const char *)v13;
    if (v4) {
      unsigned int v14 = @"YES";
    }
    else {
      unsigned int v14 = @"NO";
    }
    __int16 v30 = 2112;
    *(void *)v31 = v14;
    unsigned int v15 = v13;
    v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating for the current state: (%@) preserving timestamp: %@ animated: %@", buf, 0x20u);
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1003E3C84;
  v24[3] = &unk_1012E6300;
  v24[4] = self;
  BOOL v25 = v5;
  v17 = objc_retainBlock(v24);
  int v18 = sub_1003E3200();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Animating fade out", buf, 2u);
    }

    __int16 v20 = [(VLFScanningAnimationView *)self animationManager];
    [v20 fadeWithFadeOutCompletion:v17];
  }
  else
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Not animating fade out", buf, 2u);
    }

    __int16 v20 = [(VLFScanningAnimationView *)self animationManager];
    [v20 replaceOnGoingFadeOutCompletion:v17];
  }
}

- (int64_t)currentScanningState
{
  return self->_currentScanningState;
}

- (UIImageView)skylineImageView
{
  return self->_skylineImageView;
}

- (void)setSkylineImageView:(id)a3
{
}

- (MapsLoopingVideoPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_playerView, 0);

  objc_storeStrong((id *)&self->_skylineImageView, 0);
}

@end