@interface VLFScanningInstructionView
- (UIColor)textColor;
- (VLFScanningAnimationManager)animationManager;
- (VLFScanningInstructionLabel)instructionLabel;
- (VLFScanningInstructionLabel)sizingLabel;
- (VLFScanningInstructionView)initWithLayout:(unint64_t)a3;
- (double)lastViewWidth;
- (id)titleTextForCurrentState;
- (id)titleTextForState:(int64_t)a3;
- (int64_t)currentScanningState;
- (unint64_t)currentLayout;
- (void)configureSizingLabel;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnimationManager:(id)a3;
- (void)setCurrentLayout:(unint64_t)a3;
- (void)setCurrentScanningState:(int64_t)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setLastViewWidth:(double)a3;
- (void)setSizingLabel:(id)a3;
- (void)setTextColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForCurrentState;
@end

@implementation VLFScanningInstructionView

- (VLFScanningInstructionView)initWithLayout:(unint64_t)a3
{
  v45.receiver = self;
  v45.super_class = (Class)VLFScanningInstructionView;
  v4 = -[VLFScanningInstructionView initWithFrame:](&v45, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_currentScanningState = 1;
    v4->_currentLayout = a3;
    v43 = +[NSMutableArray array];
    v6 = [[VLFScanningInstructionLabel alloc] initForSizing:1];
    sizingLabel = v5->_sizingLabel;
    v5->_sizingLabel = v6;

    [(VLFScanningInstructionLabel *)v5->_sizingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VLFScanningInstructionLabel *)v5->_sizingLabel setAlpha:0.0];
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"VLFSessionScanningAnimationShowLongestTextKey"];

    if (v9)
    {
      v10 = sub_1008EFE04();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Debug option to show the sizing label is enabled", buf, 2u);
      }

      [(VLFScanningInstructionLabel *)v5->_sizingLabel setAlpha:0.300000012];
    }
    [(VLFScanningInstructionLabel *)v5->_sizingLabel setCurrentLayout:v5->_currentLayout];
    [(VLFScanningInstructionView *)v5 addSubview:v5->_sizingLabel];
    v41 = [(VLFScanningInstructionLabel *)v5->_sizingLabel leadingAnchor];
    v39 = [(VLFScanningInstructionView *)v5 leadingAnchor];
    v37 = [v41 constraintEqualToAnchor:v39];
    v47[0] = v37;
    v36 = [(VLFScanningInstructionLabel *)v5->_sizingLabel trailingAnchor];
    v11 = [(VLFScanningInstructionView *)v5 trailingAnchor];
    v12 = [v36 constraintEqualToAnchor:v11];
    v47[1] = v12;
    v13 = [(VLFScanningInstructionLabel *)v5->_sizingLabel topAnchor];
    v14 = [(VLFScanningInstructionView *)v5 topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v47[2] = v15;
    v16 = [(VLFScanningInstructionLabel *)v5->_sizingLabel bottomAnchor];
    v17 = [(VLFScanningInstructionView *)v5 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v47[3] = v18;
    v19 = +[NSArray arrayWithObjects:v47 count:4];
    [v43 addObjectsFromArray:v19];

    v20 = [[VLFScanningInstructionLabel alloc] initForSizing:0];
    instructionLabel = v5->_instructionLabel;
    v5->_instructionLabel = v20;

    [(VLFScanningInstructionLabel *)v5->_instructionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(VLFScanningInstructionLabel *)v5->_instructionLabel setCurrentLayout:v5->_currentLayout];
    [(VLFScanningInstructionView *)v5 addSubview:v5->_instructionLabel];
    v42 = [(VLFScanningInstructionLabel *)v5->_instructionLabel leadingAnchor];
    v40 = [(VLFScanningInstructionView *)v5 leadingAnchor];
    v38 = [v42 constraintEqualToAnchor:v40];
    v46[0] = v38;
    v22 = [(VLFScanningInstructionLabel *)v5->_instructionLabel trailingAnchor];
    v23 = [(VLFScanningInstructionView *)v5 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v46[1] = v24;
    v25 = [(VLFScanningInstructionLabel *)v5->_instructionLabel firstBaselineAnchor];
    v26 = [(VLFScanningInstructionLabel *)v5->_sizingLabel firstBaselineAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v46[2] = v27;
    v28 = +[NSArray arrayWithObjects:v46 count:3];
    [v43 addObjectsFromArray:v28];

    +[NSLayoutConstraint activateConstraints:v43];
    v29 = [VLFScanningAnimationManager alloc];
    v30 = [(VLFScanningInstructionLabel *)v5->_instructionLabel layer];
    v31 = [(VLFScanningAnimationManager *)v29 initWithLayer:v30];
    animationManager = v5->_animationManager;
    v5->_animationManager = v31;

    [(VLFScanningInstructionView *)v5 updateForCurrentState];
    [(VLFScanningInstructionLabel *)v5->_sizingLabel addFontObserver:v5->_instructionLabel];
    v33 = +[NSUserDefaults standardUserDefaults];
    [v33 addObserver:v5 forKeyPath:@"VLFSessionScanningAnimationShowLongestTextKey" options:1 context:0];

    v34 = +[NSUserDefaults standardUserDefaults];
    [v34 addObserver:v5 forKeyPath:@"VLFSessionScanningAnimationAlternativeLongestTextKey" options:1 context:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"VLFSessionScanningAnimationAlternativeLongestTextKey"];

  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"VLFSessionScanningAnimationShowLongestTextKey"];

  v5.receiver = self;
  v5.super_class = (Class)VLFScanningInstructionView;
  [(VLFScanningInstructionView *)&v5 dealloc];
}

- (void)setCurrentLayout:(unint64_t)a3
{
  if (self->_currentLayout != a3)
  {
    self->_unint64_t currentLayout = a3;
    v4 = sub_1008EFE04();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t currentLayout = self->_currentLayout;
      int v10 = 134217984;
      unint64_t v11 = currentLayout;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating for layout: %lu", (uint8_t *)&v10, 0xCu);
    }

    unint64_t v6 = self->_currentLayout;
    v7 = [(VLFScanningInstructionView *)self sizingLabel];
    [v7 setCurrentLayout:v6];

    unint64_t v8 = self->_currentLayout;
    unsigned int v9 = [(VLFScanningInstructionView *)self instructionLabel];
    [v9 setCurrentLayout:v8];

    [(VLFScanningInstructionView *)self configureSizingLabel];
  }
}

- (void)setCurrentScanningState:(int64_t)a3
{
  if (self->_currentScanningState != a3)
  {
    self->_currentScanningState = a3;
    v4 = sub_1008EFE04();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = self->_currentScanningState - 2;
      if (v5 > 3) {
        CFStringRef v6 = @"VLFScanningStateInitializing";
      }
      else {
        CFStringRef v6 = off_101300090[v5];
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating for scanning state: %@", buf, 0xCu);
    }

    if (self->_currentScanningState == 1)
    {
      [(VLFScanningInstructionView *)self updateForCurrentState];
    }
    else
    {
      v7 = [(VLFScanningInstructionView *)self animationManager];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1008F0170;
      v8[3] = &unk_1012E5D08;
      v8[4] = self;
      [v7 fadeWithFadeOutCompletion:v8];
    }
  }
}

- (UIColor)textColor
{
  v2 = [(VLFScanningInstructionView *)self instructionLabel];
  v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(VLFScanningInstructionView *)self instructionLabel];
  [v5 setTextColor:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VLFScanningInstructionView;
  [(VLFScanningInstructionView *)&v11 traitCollectionDidChange:v4];
  id v5 = sub_1008EFE04();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)CFStringRef v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating for new trait collection", v10, 2u);
  }

  if (!v4) {
    goto LABEL_5;
  }
  CFStringRef v6 = [(VLFScanningInstructionView *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  unint64_t v8 = [v4 preferredContentSizeCategory];
  NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v7, v8);

  if (v9) {
LABEL_5:
  }
    [(VLFScanningInstructionView *)self configureSizingLabel];
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)VLFScanningInstructionView;
  [(VLFScanningInstructionView *)&v15 layoutSubviews];
  v3 = [(VLFScanningInstructionView *)self superview];
  [v3 frame];
  BOOL v5 = v4 > 290.0;
  CFStringRef v6 = [(VLFScanningInstructionView *)self sizingLabel];
  [v6 setRunningOnBigPhone:v5];

  [(VLFScanningInstructionView *)self lastViewWidth];
  double v8 = v7;
  [(VLFScanningInstructionView *)self frame];
  if (vabdd_f64(v8, v9) > 2.22044605e-16)
  {
    CFStringRef v10 = sub_1008EFE04();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      [(VLFScanningInstructionView *)self lastViewWidth];
      uint64_t v12 = v11;
      [(VLFScanningInstructionView *)self frame];
      *(_DWORD *)buf = 134218240;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      uint64_t v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "View width changed from %f to %f; updating sizing label",
        buf,
        0x16u);
    }

    [(VLFScanningInstructionView *)self frame];
    [(VLFScanningInstructionView *)self setLastViewWidth:v14];
    [(VLFScanningInstructionView *)self configureSizingLabel];
  }
}

- (void)configureSizingLabel
{
  v3 = +[NSMutableSet set];
  for (uint64_t i = 1; i != 6; ++i)
  {
    BOOL v5 = [(VLFScanningInstructionView *)self titleTextForState:i];
    [v3 addObject:v5];
  }
  CFStringRef v6 = +[NSUserDefaults standardUserDefaults];
  double v7 = [v6 stringForKey:@"VLFSessionScanningAnimationAlternativeLongestTextKey"];

  if ([v7 length]) {
    [v3 addObject:v7];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v3;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (!v9)
  {

    v27 = 0;
    double v14 = 2.22507386e-308;
    double v13 = 1.79769313e308;
LABEL_21:
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v40 = "-[VLFScanningInstructionView configureSizingLabel]";
      __int16 v41 = 2080;
      v42 = "VLFScanningInstructionView.m";
      __int16 v43 = 1024;
      LODWORD(v44[0]) = 209;
      WORD2(v44[0]) = 2080;
      *(void *)((char *)v44 + 6) = "tallestTitleWithSmallestPointSize != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v40 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    v31 = sub_1008EFE04();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not calculate the title with the smallest scaled font", buf, 2u);
    }

    uint64_t v11 = 0;
    goto LABEL_30;
  }
  id v10 = v9;
  v34 = v7;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v36;
  double v13 = 1.79769313e308;
  double v14 = 2.22507386e-308;
  do
  {
    for (j = 0; j != v10; j = (char *)j + 1)
    {
      if (*(void *)v36 != v12) {
        objc_enumerationMutation(v8);
      }
      v16 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
      uint64_t v17 = [(VLFScanningInstructionView *)self sizingLabel];
      [v17 setText:v16];

      __int16 v18 = [(VLFScanningInstructionView *)self sizingLabel];
      uint64_t v19 = [v18 font];
      [v19 pointSize];
      double v21 = v20;

      v22 = [(VLFScanningInstructionView *)self sizingLabel];
      [v22 contentHeight];
      double v24 = v23;

      if (v21 >= v13 && (vabdd_f64(v21, v13) > 2.22044605e-16 || v24 <= v14)) {
        continue;
      }
      id v26 = v16;

      double v14 = v24;
      double v13 = v21;
      uint64_t v11 = v26;
    }
    id v10 = [v8 countByEnumeratingWithState:&v35 objects:v45 count:16];
  }
  while (v10);

  v27 = (const char *)v11;
  double v7 = v34;
  if (!v11) {
    goto LABEL_21;
  }
LABEL_30:
  v32 = [(VLFScanningInstructionView *)self sizingLabel];
  [v32 setText:v11];

  v33 = sub_1008EFE04();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v40 = v27;
    __int16 v41 = 2048;
    v42 = *(const char **)&v13;
    __int16 v43 = 2048;
    *(double *)v44 = v14;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Configured sizing label with smallest scaled font title: '%@' scale: %f tallest height: %f", buf, 0x20u);
  }
}

- (id)titleTextForCurrentState
{
  int64_t v3 = [(VLFScanningInstructionView *)self currentScanningState];

  return [(VLFScanningInstructionView *)self titleTextForState:v3];
}

- (id)titleTextForState:(int64_t)a3
{
  uint64_t Integer = GEOConfigGetInteger();
  switch(a3)
  {
    case 1:
      switch(Integer)
      {
        case 0:
          goto LABEL_32;
        case 1:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_scan_buildings_1";
          break;
        case 2:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_scan_buildings_2";
          break;
        case 3:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_scan_buildings_3";
          break;
        default:
          double v14 = sub_1005762E4();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            int v20 = 136315906;
            double v21 = "-[VLFScanningInstructionView titleTextForState:]";
            __int16 v22 = 2080;
            double v23 = "VLFScanningInstructionView.m";
            __int16 v24 = 1024;
            int v25 = 236;
            __int16 v26 = 2080;
            v27 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v20, 0x26u);
          }

          if (sub_100BB36BC())
          {
            objc_super v15 = sub_1005762E4();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = +[NSThread callStackSymbols];
              int v20 = 138412290;
              double v21 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
            }
          }
LABEL_32:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_scan_buildings";
          break;
      }
      goto LABEL_18;
    case 2:
      switch(Integer)
      {
        case 0:
          goto LABEL_39;
        case 1:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_keep_moving_iphone_1";
          break;
        case 2:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_keep_moving_iphone_2";
          break;
        case 3:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_keep_moving_iphone_3";
          break;
        default:
          uint64_t v17 = sub_1005762E4();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            int v20 = 136315906;
            double v21 = "-[VLFScanningInstructionView titleTextForState:]";
            __int16 v22 = 2080;
            double v23 = "VLFScanningInstructionView.m";
            __int16 v24 = 1024;
            int v25 = 248;
            __int16 v26 = 2080;
            v27 = "experimentConfig == 0";
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v20, 0x26u);
          }

          if (sub_100BB36BC())
          {
            __int16 v18 = sub_1005762E4();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = +[NSThread callStackSymbols];
              int v20 = 138412290;
              double v21 = v19;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
            }
          }
LABEL_39:
          BOOL v5 = +[NSBundle mainBundle];
          CFStringRef v6 = v5;
          CFStringRef v7 = @"VLF_localization_title_text_keep_moving_iphone";
          break;
      }
      goto LABEL_18;
    case 3:
      BOOL v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"VLF_localization_text_device_moving_too_fast";
      goto LABEL_18;
    case 4:
      BOOL v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"VLF_localization_text_raise_device";
      goto LABEL_18;
    case 5:
      BOOL v5 = +[NSBundle mainBundle];
      CFStringRef v6 = v5;
      CFStringRef v7 = @"VLF_localization_text_lower_device";
LABEL_18:
      uint64_t v12 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];

      break;
    default:
      id v8 = sub_1005762E4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v20 = 136315650;
        double v21 = "-[VLFScanningInstructionView titleTextForState:]";
        __int16 v22 = 2080;
        double v23 = "VLFScanningInstructionView.m";
        __int16 v24 = 1024;
        int v25 = 263;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v20, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        id v9 = sub_1005762E4();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = +[NSThread callStackSymbols];
          int v20 = 138412290;
          double v21 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v20, 0xCu);
        }
      }
      uint64_t v11 = sub_1008EFE04();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134217984;
        double v21 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Asked for title with invalid state: %ld", (uint8_t *)&v20, 0xCu);
      }

      uint64_t v12 = 0;
      break;
  }

  return v12;
}

- (void)updateForCurrentState
{
  id v4 = [(VLFScanningInstructionView *)self titleTextForCurrentState];
  int64_t v3 = [(VLFScanningInstructionView *)self instructionLabel];
  [v3 setText:v4];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSUserDefaults standardUserDefaults];

  if (v13 == v11)
  {
    if ([v10 isEqualToString:@"VLFSessionScanningAnimationAlternativeLongestTextKey"])
    {
      [(VLFScanningInstructionView *)self configureSizingLabel];
    }
    else if ([v10 isEqualToString:@"VLFSessionScanningAnimationShowLongestTextKey"])
    {
      double v14 = +[NSUserDefaults standardUserDefaults];
      unsigned int v15 = [v14 BOOLForKey:@"VLFSessionScanningAnimationShowLongestTextKey"];
      double v16 = 0.300000012;
      if (!v15) {
        double v16 = 0.0;
      }
      [(VLFScanningInstructionLabel *)self->_sizingLabel setAlpha:v16];
    }
    else
    {
      -[VLFScanningInstructionView observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, v17.receiver, v17.super_class, self, VLFScanningInstructionView);
    }
  }
  else
  {
    -[VLFScanningInstructionView observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6, self, VLFScanningInstructionView, v18.receiver, v18.super_class);
  }
}

- (unint64_t)currentLayout
{
  return self->_currentLayout;
}

- (int64_t)currentScanningState
{
  return self->_currentScanningState;
}

- (VLFScanningInstructionLabel)sizingLabel
{
  return self->_sizingLabel;
}

- (void)setSizingLabel:(id)a3
{
}

- (VLFScanningInstructionLabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (VLFScanningAnimationManager)animationManager
{
  return self->_animationManager;
}

- (void)setAnimationManager:(id)a3
{
}

- (double)lastViewWidth
{
  return self->_lastViewWidth;
}

- (void)setLastViewWidth:(double)a3
{
  self->_lastViewWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);

  objc_storeStrong((id *)&self->_sizingLabel, 0);
}

@end