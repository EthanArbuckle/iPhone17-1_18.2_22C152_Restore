@interface RCEditingToolbar
- (BOOL)_isActionEnabled:(int64_t)a3;
- (BOOL)canCancel;
- (BOOL)canSave;
- (BOOL)canUndo;
- (BOOL)hasCustomizedPlaybackSettings;
- (BOOL)isTranscriptViewDisplayed;
- (NSArray)buttonsArray;
- (RCControlsActionDelegate)controlsActionDelegate;
- (RCEditingToolbar)initWithCoder:(id)a3;
- (RCEditingToolbar)initWithFrame:(CGRect)a3;
- (RCEditingToolbar)initWithInternalConstructionDelayedUntilUnhidden;
- (RCToggleButton)playbackSettingsButton;
- (RCToggleButton)transcriptionButton;
- (RCTouchInsetsButton)leftSideButton;
- (RCTouchInsetsButton)rightSideButton;
- (RCTouchInsetsButton)trimButton;
- (UILabel)titleLabel;
- (id)_createPlaybackSettingsButton;
- (id)_createTranscriptionButton;
- (int64_t)activityMode;
- (int64_t)displayMode;
- (void)_classSpecificPrepareToPresent;
- (void)_commonInit;
- (void)_configureToggleButton:(id)a3 action:(SEL)a4;
- (void)_displayPlaybackSettings;
- (void)_handleAction:(id)a3;
- (void)_handleTrim;
- (void)_prepareToPresent;
- (void)_setupForApplyTitle;
- (void)_setupForCancelTitle;
- (void)_setupForDoneTitle;
- (void)_setupForUndoTitle;
- (void)_styleView;
- (void)_syncViewsToState;
- (void)_toggleTranscriptView;
- (void)_updateButtonState:(id)a3 hidden:(BOOL)a4 enabled:(BOOL)a5 dimmedMode:(BOOL)a6;
- (void)_updateControlsToHidden:(BOOL)a3 enabled:(BOOL)a4 rightSideButtonVisible:(BOOL)a5 leftSideButtonVisible:(BOOL)a6 dimmedMode:(BOOL)a7;
- (void)contentSizeChanged;
- (void)restyle;
- (void)setActivityMode:(int64_t)a3;
- (void)setButtonsArray:(id)a3;
- (void)setCanCancel:(BOOL)a3;
- (void)setCanSave:(BOOL)a3;
- (void)setCanUndo:(BOOL)a3;
- (void)setControlsActionDelegate:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setHasCustomizedPlaybackSettings:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsTranscriptViewDisplayed:(BOOL)a3;
- (void)setLeftSideButton:(id)a3;
- (void)setPlaybackSettingsButton:(id)a3;
- (void)setRightSideButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTranscriptionButton:(id)a3;
- (void)setTrimButton:(id)a3;
@end

@implementation RCEditingToolbar

- (void)_commonInit
{
  [(RCEditingToolbar *)self _classSpecificInit];
  id v3 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  [(RCEditingToolbar *)self addInteraction:v3];

  *(&self->super.usesIntrinsicHeightSetting + 3) = 1;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (RCEditingToolbar)initWithInternalConstructionDelayedUntilUnhidden
{
  v5.receiver = self;
  v5.super_class = (Class)RCEditingToolbar;
  v2 = -[RCEditingToolbar initWithFrame:](&v5, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  id v3 = v2;
  if (v2)
  {
    *(&v2->super.usesIntrinsicHeightSetting + 1) = 1;
    [(RCEditingToolbar *)v2 _commonInit];
  }
  return v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && *(&self->super.usesIntrinsicHeightSetting + 1))
  {
    *(&self->super.usesIntrinsicHeightSetting + 1) = 0;
    [(RCEditingToolbar *)self _prepareToPresent];
  }
  v5.receiver = self;
  v5.super_class = (Class)RCEditingToolbar;
  [(RCEditingToolbar *)&v5 setHidden:v3];
}

- (void)setDisplayMode:(int64_t)a3
{
  *(void *)&self->_canUndo = a3;
  [(RCEditingToolbar *)self _syncViewsToState];
  UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;

  UIAccessibilityPostNotification(v3, 0);
}

- (void)setControlsActionDelegate:(id)a3
{
}

- (void)setCanUndo:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 2) = a3;
  [(RCEditingToolbar *)self _syncViewsToState];
}

- (void)setCanCancel:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 3) = a3;
  [(RCEditingToolbar *)self _syncViewsToState];
}

- (void)setActivityMode:(int64_t)a3
{
  *(int64_t *)((char *)&self->_displayMode + 1) = a3;
  [(RCEditingToolbar *)self _syncViewsToState];
}

- (void)restyle
{
  if (!*(&self->super.usesIntrinsicHeightSetting + 1)) {
    [(RCEditingToolbar *)self _styleView];
  }
}

- (void)_syncViewsToState
{
  if (!*(&self->super.usesIntrinsicHeightSetting + 1))
  {
    +[CATransaction begin];
    +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
    UIAccessibilityNotifications v3 = [(RCEditingToolbar *)self titleLabel];
    [v3 setHidden:1];

    unint64_t v4 = [(RCEditingToolbar *)self displayMode];
    switch([(RCEditingToolbar *)self activityMode])
    {
      case 0:
      case 1:
        int64_t v5 = [(RCEditingToolbar *)self displayMode];
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        BOOL v9 = v5 == 2;
        break;
      case 2:
        v10 = +[RCRecorderStyleProvider sharedStyleProvider];
        unsigned int v11 = [v10 hostsUndoButtonInToolbar];

        if (v11)
        {
          [(RCEditingToolbar *)self _setupForUndoTitle];
          uint64_t v7 = 0;
          BOOL v9 = 0;
          uint64_t v6 = 1;
        }
        else
        {
          uint64_t v6 = 0;
          uint64_t v7 = 0;
          BOOL v9 = 0;
        }
        uint64_t v8 = 1;
        break;
      case 3:
        v12 = +[NSBundle mainBundle];
        v13 = v12;
        CFStringRef v14 = @"EDIT_MODE_INSERT_VIEW_TITLE";
        goto LABEL_9;
      case 4:
        v12 = +[NSBundle mainBundle];
        v13 = v12;
        CFStringRef v14 = @"EDIT_MODE_TRIM_VIEW_TITLE";
LABEL_9:
        v15 = [v12 localizedStringForKey:v14 value:&stru_100228BC8 table:0];

        [*(id *)((char *)&self->_transcriptionButton + 1) setText:v15];
        v16 = [(RCEditingToolbar *)self titleLabel];
        [v16 setHidden:0];

        [*(id *)((char *)&self->_transcriptionButton + 1) setAccessibilityValue:v15];
        [(RCEditingToolbar *)self _setupForCancelTitle];
        [(RCEditingToolbar *)self _setupForApplyTitle];

        BOOL v9 = 0;
        uint64_t v8 = 0;
        uint64_t v6 = 1;
        uint64_t v7 = 1;
        break;
      default:
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        BOOL v9 = 0;
        uint64_t v8 = 0;
        break;
    }
    if (v4 >= 2)
    {
      uint64_t v18 = v8 ^ 1;
      v17 = self;
    }
    else
    {
      v17 = self;
      uint64_t v18 = 1;
      uint64_t v8 = 0;
      uint64_t v7 = 0;
      uint64_t v6 = 0;
    }
    [(RCEditingToolbar *)v17 _updateControlsToHidden:v18 enabled:v8 rightSideButtonVisible:v7 leftSideButtonVisible:v6 dimmedMode:v9];
    v19 = +[RCRecorderStyleProvider sharedStyleProvider];
    if (([v19 hostsTransportAndDoneButtonInBottomSection] & 1) == 0)
    {
      v20 = [(RCEditingToolbar *)self accessibilityElements];

      if (v20)
      {
        v21 = [(RCEditingToolbar *)self leftSideButton];
        v22 = [(RCEditingToolbar *)self titleLabel];
        v25[1] = v22;
        v23 = [(RCEditingToolbar *)self rightSideButton];
        v25[2] = v23;
        v24 = +[NSArray arrayWithObjects:v25 count:3];
        [(RCEditingToolbar *)self setAccessibilityElements:v24];
      }
    }
    +[CATransaction commit];
  }
}

- (void)_setupForUndoTitle
{
  [*(id *)((char *)&self->_rightSideButton + 1) setImage:0 forState:0];
  UIAccessibilityNotifications v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"EDIT_MODE_UNDO_BUTTON_TITLE" value:&stru_100228BC8 table:0];

  [*(id *)((char *)&self->_rightSideButton + 1) setAccessibilityLabel:v4];
  [*(id *)((char *)&self->_rightSideButton + 1) setTitle:v4 forState:0];
  [*(id *)((char *)&self->_rightSideButton + 1) setTag:1];
}

- (void)_setupForCancelTitle
{
  [*(id *)((char *)&self->_rightSideButton + 1) setImage:0 forState:0];
  UIAccessibilityNotifications v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];

  [*(id *)((char *)&self->_rightSideButton + 1) setAccessibilityLabel:v4];
  [*(id *)((char *)&self->_rightSideButton + 1) setTitle:v4 forState:0];
  [*(id *)((char *)&self->_rightSideButton + 1) setTag:0];
}

- (void)_setupForDoneTitle
{
  [*(id *)((char *)&self->_trimButton + 1) setImage:0 forState:0];
  UIAccessibilityNotifications v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"DONE" value:&stru_100228BC8 table:0];

  [*(id *)((char *)&self->_trimButton + 1) setAccessibilityLabel:v4];
  [*(id *)((char *)&self->_trimButton + 1) setTitle:v4 forState:0];
  [*(id *)((char *)&self->_trimButton + 1) setTag:3];
}

- (void)_setupForApplyTitle
{
  UIAccessibilityNotifications v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"APPLY" value:&stru_100228BC8 table:0];

  [*(id *)((char *)&self->_trimButton + 1) setTitle:v4 forState:0];
  [*(id *)((char *)&self->_trimButton + 1) setAccessibilityLabel:v4];
  [*(id *)((char *)&self->_trimButton + 1) setTag:2];
}

- (void)_updateControlsToHidden:(BOOL)a3 enabled:(BOOL)a4 rightSideButtonVisible:(BOOL)a5 leftSideButtonVisible:(BOOL)a6 dimmedMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  BOOL v11 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v13 = [(RCEditingToolbar *)self buttonsArray];
  id v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        [(RCEditingToolbar *)self _updateButtonState:*(void *)(*((void *)&v38 + 1) + 8 * i) hidden:v11 enabled:v10 dimmedMode:v7];
      }
      id v15 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(RCEditingToolbar *)self rightSideButton];
  v19 = v18;
  if (v9)
  {
    v20 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v21 = [v20 hostsTransportAndDoneButtonInBottomSection];

    [v19 setHidden:v21];
    [v19 setEnabled:[self _isActionEnabled:[v19 tag]]];
  }
  else
  {
    [v18 setHidden:1];
  }
  v22 = [(RCEditingToolbar *)self leftSideButton];
  BOOL v23 = -[RCEditingToolbar _isActionEnabled:](self, "_isActionEnabled:", [v22 tag]);

  v24 = [(RCEditingToolbar *)self leftSideButton];
  [v24 setEnabled:v23];

  v25 = [(RCEditingToolbar *)self leftSideButton];
  [v25 setHidden:!v8];

  v26 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v27 = [v26 hostsTrimButtonInToolbar];

  v28 = [(RCEditingToolbar *)self trimButton];
  v29 = v28;
  if (v28 && !v11)
  {

    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v30 = [(RCEditingToolbar *)self isTranscriptViewDisplayed] & (v27 ^ 1);
    uint64_t v31 = [(RCEditingToolbar *)self isTranscriptViewDisplayed] ^ 1;
    v29 = [(RCEditingToolbar *)self trimButton];
    [(RCEditingToolbar *)self _updateButtonState:v29 hidden:v30 enabled:v31 dimmedMode:0];
  }

LABEL_16:
  v32 = [(RCEditingToolbar *)self transcriptionButton];
  if (v32) {
    unsigned int v33 = v27;
  }
  else {
    unsigned int v33 = 0;
  }

  if (v33 == 1)
  {
    int64_t v34 = [(RCEditingToolbar *)self activityMode];
    BOOL v35 = v34 == 4;
    BOOL v36 = v34 != 4;
    v37 = [(RCEditingToolbar *)self transcriptionButton];
    [(RCEditingToolbar *)self _updateButtonState:v37 hidden:v35 enabled:v36 dimmedMode:0];
  }
}

- (void)_updateButtonState:(id)a3 hidden:(BOOL)a4 enabled:(BOOL)a5 dimmedMode:(BOOL)a6
{
  BOOL v6 = a5;
  uint64_t v7 = a4 & ~a6;
  id v9 = a3;
  [v9 setHidden:v7];
  [v9 setUserInteractionEnabled:v6];
  double v8 = 0.2;
  if (v6) {
    double v8 = 1.0;
  }
  [v9 setAlpha:v8];
}

- (RCEditingToolbar)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCEditingToolbar;
  UIAccessibilityNotifications v3 = [(RCEditingToolbar *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(RCEditingToolbar *)v3 _commonInit];
  }
  return v4;
}

- (RCEditingToolbar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCEditingToolbar;
  UIAccessibilityNotifications v3 = -[RCEditingToolbar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(RCEditingToolbar *)v3 _commonInit];
  }
  return v4;
}

- (void)_classSpecificPrepareToPresent
{
  UIAccessibilityNotifications v3 = (RCTouchInsetsButton *)objc_opt_new();
  id v4 = *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1);
  *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1) = v3;

  [*(id *)((char *)&self->_rightSideButton + 1) addTarget:self action:"_handleAction:" forControlEvents:64];
  LODWORD(v5) = 1148846080;
  [*(id *)((char *)&self->_rightSideButton + 1) setContentCompressionResistancePriority:0 forAxis:v5];
  [(RCEditingToolbar *)self _setupForUndoTitle];
  [(RCEditingToolbar *)self addSubview:*(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1)];
  objc_super v6 = (RCTouchInsetsButton *)objc_opt_new();
  uint64_t v7 = *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
  *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1) = v6;

  [*(id *)((char *)&self->_trimButton + 1) addTarget:self action:"_handleAction:" forControlEvents:64];
  LODWORD(v8) = 1148846080;
  [*(id *)((char *)&self->_trimButton + 1) setContentCompressionResistancePriority:0 forAxis:v8];
  [(RCEditingToolbar *)self _setupForApplyTitle];
  id v9 = (RCToggleButton *)objc_opt_new();
  BOOL v10 = *(RCToggleButton **)((char *)&self->_transcriptionButton + 1);
  *(RCToggleButton **)((char *)&self->_transcriptionButton + 1) = v9;

  [(RCEditingToolbar *)self addSubview:*(RCToggleButton **)((char *)&self->_transcriptionButton + 1)];
  BOOL v11 = *(RCToggleButton **)((char *)&self->_transcriptionButton + 1);

  [v11 setHidden:1];
}

- (void)_prepareToPresent
{
  [(RCEditingToolbar *)self _classSpecificPrepareToPresent];
  [(RCEditingToolbar *)self _styleView];
  [(RCEditingToolbar *)self _syncViewsToState];

  [(RCEditingToolbar *)self layoutSubviews];
}

- (void)_handleTrim
{
  id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
  UIAccessibilityNotifications v3 = [(RCEditingToolbar *)self trimButton];
  [v4 performControlsAction:31 position:v3 source:0.0];
}

- (void)_displayPlaybackSettings
{
  id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
  UIAccessibilityNotifications v3 = [(RCEditingToolbar *)self playbackSettingsButton];
  [v4 performControlsAction:44 position:v3 source:0.0];
}

- (void)_toggleTranscriptView
{
  id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
  UIAccessibilityNotifications v3 = [(RCEditingToolbar *)self playbackSettingsButton];
  [v4 performControlsAction:45 position:v3 source:0.0];
}

- (void)_handleAction:(id)a3
{
  id v7 = a3;
  switch((unint64_t)[v7 tag])
  {
    case 0uLL:
      id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
      double v5 = v4;
      uint64_t v6 = 26;
      goto LABEL_5;
    case 1uLL:
      id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
      double v5 = v4;
      uint64_t v6 = 37;
      goto LABEL_5;
    case 2uLL:
    case 3uLL:
      id v4 = [(RCEditingToolbar *)self controlsActionDelegate];
      double v5 = v4;
      uint64_t v6 = 24;
LABEL_5:
      [v4 performControlsAction:v6 position:v7 source:0.0];

      break;
    default:
      break;
  }
}

- (void)setCanSave:(BOOL)a3
{
  *(&self->super.usesIntrinsicHeightSetting + 4) = a3;
  [(RCEditingToolbar *)self _syncViewsToState];
}

- (BOOL)_isActionEnabled:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      if ((id)[(RCEditingToolbar *)self activityMode] != (id)4) {
        goto LABEL_6;
      }
      BOOL result = [(RCEditingToolbar *)self canCancel];
      break;
    case 1:
      BOOL result = [(RCEditingToolbar *)self canUndo];
      break;
    case 2:
      BOOL result = [(RCEditingToolbar *)self canSave];
      break;
    case 3:
LABEL_6:
      BOOL result = 1;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)setHasCustomizedPlaybackSettings:(BOOL)a3
{
  BOOL v3 = a3;
  *(&self->super.usesIntrinsicHeightSetting + 5) = a3;
  id v4 = [(RCEditingToolbar *)self playbackSettingsButton];
  [v4 setIsToggled:v3];
}

- (void)setIsTranscriptViewDisplayed:(BOOL)a3
{
  BOOL v3 = a3;
  *(&self->super.usesIntrinsicHeightSetting + 6) = a3;
  double v5 = [(RCEditingToolbar *)self transcriptionButton];
  [v5 setIsToggled:v3];

  [(RCEditingToolbar *)self _syncViewsToState];
}

- (void)_styleView
{
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v4 = [v3 editingToolbarButtonTextColor];
  double v5 = [v3 editingToolbarButtonDisabledTextColor];
  v73 = [v3 editingToolbarTitleTextColor];
  uint64_t v6 = [v3 editingToolbarCancelButtonLabelFont];
  uint64_t v7 = [v3 editingToolbarSaveButtonLabelFont];
  v72 = [v3 editingToolbarTitleLabelFont];
  double v8 = [(RCEditingToolbar *)self leftSideButton];
  id v9 = [v8 centerYAnchor];
  BOOL v10 = [(RCEditingToolbar *)self centerYAnchor];
  BOOL v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  v12 = [v8 leadingAnchor];
  v13 = [(RCEditingToolbar *)self leadingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13 constant:16.0];
  [v14 setActive:1];

  [v8 setTitleColor:v4 forState:0];
  [v8 setTitleColor:v5 forState:2];
  v69 = v8;
  id v15 = [v8 titleLabel];
  v71 = (void *)v6;
  uint64_t v16 = v6;
  v17 = (void *)v4;
  [v15 setFont:v16];

  uint64_t v18 = [(RCEditingToolbar *)self rightSideButton];
  v19 = [v18 titleLabel];
  v70 = (void *)v7;
  [v19 setFont:v7];

  [v18 setTitleColor:v4 forState:0];
  [v18 setTitleColor:v5 forState:2];
  v20 = [(RCEditingToolbar *)self titleLabel];
  [v20 setFont:v72];
  [v20 setTextColor:v73];
  [v3 editToolbarTitleTopInset];
  [v20 alignCenterTopToCenterTopOfView:self];
  if (([v3 hostsTransportAndDoneButtonInBottomSection] & 1) == 0)
  {
    [(RCEditingToolbar *)self addSubview:*(RCTouchInsetsButton **)((char *)&self->_trimButton + 1)];
    id v21 = *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
    [v3 editToolbarButtonHorizontalInset];
    double v23 = -v22;
    [v3 editToolbarButtonTopInset];
    [v21 alignTopTrailingToTopTrailingOfView:self paddingX:v23 paddingY:v24];
    [*(id *)((char *)&self->_trimButton + 1) setEnabled:0];
  }
  if ([v3 hostsTrimButtonInToolbar])
  {
    v65 = v18;
    v67 = (void *)v4;
    uint64_t v25 = [v3 editingToolbarImageSymbolConfiguration];
    v26 = [(RCEditingToolbar *)self trimButton];
    v66 = v5;
    v68 = (void *)v25;
    if (!v26)
    {
      v26 = objc_opt_new();
      [(RCEditingToolbar *)self setTrimButton:v26];
      [v26 addTarget:self action:"_handleTrim" forControlEvents:64];
      LODWORD(v27) = 1148846080;
      [v26 setContentCompressionResistancePriority:0 forAxis:v27];
      v28 = [v3 trimImage];
      [v26 setImage:v28 forState:0];

      v29 = +[NSBundle mainBundle];
      uint64_t v30 = [v29 localizedStringForKey:@"EDIT_MODE_TRIM_BUTTON_TITLE" value:&stru_100228BC8 table:0];
      [v26 setAccessibilityLabel:v30];

      uint64_t v31 = +[NSBundle mainBundle];
      v32 = [v31 localizedStringForKey:@"EDIT_MODE_TRIM_BUTTON_TITLE" value:&stru_100228BC8 table:0];
      [v26 setLargeContentTitle:v32];

      unsigned int v33 = [v3 editingToolbarMaximumContentSizeCategory];
      [v26 setMaximumContentSizeCategory:v33];

      uint64_t v25 = (uint64_t)v68;
    }
    [v26 setPreferredSymbolConfiguration:v25 forImageInState:0];
    [(RCEditingToolbar *)self addSubview:v26];
    int64_t v34 = [v26 lastBaselineAnchor];
    BOOL v35 = [(RCEditingToolbar *)self leftSideButton];
    BOOL v36 = [v35 lastBaselineAnchor];
    v37 = [v34 constraintEqualToAnchor:v36];
    [v37 setActive:1];

    long long v38 = [v26 trailingAnchor];
    long long v39 = [(RCEditingToolbar *)self trailingAnchor];
    [v3 editToolbarButtonHorizontalInset];
    long long v41 = [v38 constraintEqualToAnchor:v39 constant:-v40];
    [v41 setActive:1];

    v42 = [(RCEditingToolbar *)self playbackSettingsButton];
    if (!v42)
    {
      v42 = [(RCEditingToolbar *)self _createPlaybackSettingsButton];
      [(RCEditingToolbar *)self setPlaybackSettingsButton:v42];
    }
    [v42 setIsToggled:[self hasCustomizedPlaybackSettings]];
    v43 = [v3 editingToolbarMaximumContentSizeCategory];
    [v42 setMaximumContentSizeCategory:v43];

    [(RCEditingToolbar *)self addSubview:v42];
    v44 = +[TranscriptionAvailabilityProvider shared];
    unsigned int v45 = [v44 deviceIsSupported];

    if (v45)
    {
      v46 = [(RCEditingToolbar *)self transcriptionButton];
      if (!v46)
      {
        v46 = [(RCEditingToolbar *)self _createTranscriptionButton];
        [(RCEditingToolbar *)self setTranscriptionButton:v46];
      }
      [v46 setIsToggled:[self isTranscriptViewDisplayed]];
      v47 = [v3 editingToolbarMaximumContentSizeCategory];
      [v46 setMaximumContentSizeCategory:v47];

      [(RCEditingToolbar *)self addSubview:v46];
      [v3 editToolbarButtonHorizontalInset];
      [v46 alignCenterTrailingToCenterLeadingOfView:v26 paddingX:v48 * -1.5 paddingY:0.0];
      [v3 editToolbarButtonHorizontalInset];
      [v42 alignCenterTrailingToCenterLeadingOfView:v46 paddingX:v49 * -1.5 paddingY:0.0];
    }
    else
    {
      [v3 editToolbarButtonHorizontalInset];
      [v42 alignCenterTrailingToCenterLeadingOfView:v26 paddingX:v53 * -1.5 paddingY:0.0];
    }
    v54 = +[TranscriptionAvailabilityProvider shared];
    unsigned int v55 = [v54 deviceIsSupported];

    if (v55)
    {
      v56 = [(RCEditingToolbar *)self transcriptionButton];
      v76[0] = v56;
      v57 = [(RCEditingToolbar *)self playbackSettingsButton];
      v76[1] = v57;
      v58 = [(RCEditingToolbar *)self trimButton];
      v76[2] = v58;
      v59 = +[NSArray arrayWithObjects:v76 count:3];
      [(RCEditingToolbar *)self setButtonsArray:v59];
    }
    else
    {
      v56 = [(RCEditingToolbar *)self playbackSettingsButton];
      v75[0] = v56;
      v57 = [(RCEditingToolbar *)self trimButton];
      v75[1] = v57;
      v58 = +[NSArray arrayWithObjects:v75 count:2];
      [(RCEditingToolbar *)self setButtonsArray:v58];
    }
    double v5 = v66;

    v17 = v67;
    uint64_t v18 = v65;
  }
  else
  {
    v50 = [(RCEditingToolbar *)self trimButton];
    [v50 removeFromSuperview];
    [v50 removeAllConstraints];
    v51 = [(RCEditingToolbar *)self playbackSettingsButton];
    [v51 removeAllConstraints];
    [v51 removeFromSuperview];
    v52 = [(RCEditingToolbar *)self transcriptionButton];
    [v52 removeAllConstraints];
    [v52 removeFromSuperview];
  }
  if ([v3 hostsTransportAndDoneButtonInBottomSection])
  {
    [(RCEditingToolbar *)self setAccessibilityElements:0];
  }
  else
  {
    v60 = [(RCEditingToolbar *)self leftSideButton];
    v74[0] = v60;
    v61 = [(RCEditingToolbar *)self titleLabel];
    v74[1] = v61;
    v62 = [(RCEditingToolbar *)self rightSideButton];
    v74[2] = v62;
    +[NSArray arrayWithObjects:v74 count:3];
    v64 = v63 = v17;
    [(RCEditingToolbar *)self setAccessibilityElements:v64];

    v17 = v63;
  }
}

- (void)contentSizeChanged
{
  uint64_t v3 = [(RCEditingToolbar *)self trimButton];
  if (v3)
  {
    id v11 = (id)v3;
    uint64_t v4 = [(RCEditingToolbar *)self playbackSettingsButton];
    if (v4)
    {
      double v5 = (void *)v4;
      uint64_t v6 = [(RCEditingToolbar *)self transcriptionButton];

      if (!v6) {
        return;
      }
      id v11 = +[RCRecorderStyleProvider sharedStyleProvider];
      uint64_t v7 = [v11 editingToolbarImageSymbolConfiguration];
      double v8 = [(RCEditingToolbar *)self trimButton];
      [v8 setPreferredSymbolConfiguration:v7 forImageInState:0];

      id v9 = [(RCEditingToolbar *)self playbackSettingsButton];
      [v9 setImageSymbolConfiguration:v7];

      BOOL v10 = [(RCEditingToolbar *)self transcriptionButton];
      [v10 setImageSymbolConfiguration:v7];
    }
  }
}

- (id)_createPlaybackSettingsButton
{
  uint64_t v3 = +[RCToggleButton playbackSettingsButton];
  [(RCEditingToolbar *)self _configureToggleButton:v3 action:"_displayPlaybackSettings"];

  return v3;
}

- (id)_createTranscriptionButton
{
  uint64_t v3 = +[RCToggleButton transcriptionButton];
  [(RCEditingToolbar *)self _configureToggleButton:v3 action:"_toggleTranscriptView"];

  return v3;
}

- (void)_configureToggleButton:(id)a3 action:(SEL)a4
{
  id v9 = a3;
  uint64_t v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v7 = [v6 editingToolbarImageSymbolConfiguration];
  [v9 setImageSymbolConfiguration:v7];

  [v9 addTarget:self action:a4 forControlEvents:64];
  LODWORD(v8) = 1148846080;
  [v9 setContentCompressionResistancePriority:0 forAxis:v8];
}

- (int64_t)displayMode
{
  return *(void *)&self->_canUndo;
}

- (int64_t)activityMode
{
  return *(int64_t *)((char *)&self->_displayMode + 1);
}

- (BOOL)canUndo
{
  return *(&self->super.usesIntrinsicHeightSetting + 2);
}

- (BOOL)canCancel
{
  return *(&self->super.usesIntrinsicHeightSetting + 3);
}

- (BOOL)canSave
{
  return *(&self->super.usesIntrinsicHeightSetting + 4);
}

- (BOOL)hasCustomizedPlaybackSettings
{
  return *(&self->super.usesIntrinsicHeightSetting + 5);
}

- (BOOL)isTranscriptViewDisplayed
{
  return *(&self->super.usesIntrinsicHeightSetting + 6);
}

- (RCControlsActionDelegate)controlsActionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_activityMode + 1));

  return (RCControlsActionDelegate *)WeakRetained;
}

- (RCTouchInsetsButton)trimButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_controlsActionDelegate + 1);
}

- (void)setTrimButton:(id)a3
{
}

- (RCTouchInsetsButton)rightSideButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_trimButton + 1);
}

- (void)setRightSideButton:(id)a3
{
}

- (RCTouchInsetsButton)leftSideButton
{
  return *(RCTouchInsetsButton **)((char *)&self->_rightSideButton + 1);
}

- (void)setLeftSideButton:(id)a3
{
}

- (RCToggleButton)playbackSettingsButton
{
  return *(RCToggleButton **)((char *)&self->_leftSideButton + 1);
}

- (void)setPlaybackSettingsButton:(id)a3
{
}

- (RCToggleButton)transcriptionButton
{
  return *(RCToggleButton **)((char *)&self->_playbackSettingsButton + 1);
}

- (void)setTranscriptionButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return *(UILabel **)((char *)&self->_transcriptionButton + 1);
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)buttonsArray
{
  return *(NSArray **)((char *)&self->_titleLabel + 1);
}

- (void)setButtonsArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_transcriptionButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_playbackSettingsButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_leftSideButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_rightSideButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_trimButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_controlsActionDelegate + 1), 0);

  objc_destroyWeak((id *)((char *)&self->_activityMode + 1));
}

@end