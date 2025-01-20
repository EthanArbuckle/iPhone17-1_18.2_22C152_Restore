@interface RCShuttleBar
- (BOOL)_isCardStyle;
- (BOOL)enabled;
- (BOOL)recentlyDeleted;
- (BOOL)trimButtonsEnabled;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5;
- (CGSize)_estimateTrimDeleteButtonSizeForProposedSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (NUIContainerBoxView)playPauseBusyContainerView;
- (NUIContainerStackView)centerClusterStackView;
- (RCAudioScrubber)timelineSlider;
- (RCControlsActionDelegate)actionDelegate;
- (RCDeleteButton)deleteSelectionButton;
- (RCShuttleBar)initWithShuttleBarStyle:(int64_t)a3;
- (RCTouchInsetsButton)deleteButton;
- (RCTouchInsetsButton)editRecordingButton;
- (RCTouchInsetsButton)inButton;
- (RCTouchInsetsButton)jumpBackwardButton;
- (RCTouchInsetsButton)jumpForwardButton;
- (RCTouchInsetsButton)outButton;
- (RCTouchInsetsButton)playPauseButton;
- (RCTouchInsetsButton)recoverButton;
- (RCTrimButton)trimToSelectionButton;
- (UIColor)controlsAnimationColor;
- (UIColor)controlsColor;
- (UIColor)secondaryControlsColor;
- (double)centerClusterWidthCard;
- (double)centerClusterWidthLibrary;
- (double)currentTime;
- (double)duration;
- (double)intrinsicHeight;
- (id)_imageForState:(int64_t)a3 inStyle:(int64_t)a4;
- (id)_pauseImageForStyle:(int64_t)a3;
- (id)_playImageForStyle:(int64_t)a3;
- (int64_t)editMode;
- (int64_t)playControlState;
- (int64_t)style;
- (unint64_t)presentedControlsOptions;
- (void)_commonInit;
- (void)_handleDelete;
- (void)_handleDeleteSelection;
- (void)_handleEditRecording;
- (void)_handleErase;
- (void)_handleJumpBackward;
- (void)_handleJumpForward;
- (void)_handlePlayPause;
- (void)_handleSetInPoint;
- (void)_handleSetOutPoint;
- (void)_handleTrimToSelection;
- (void)_handleUndelete;
- (void)_setupDeleteButton;
- (void)_setupEditRecordingButton;
- (void)_setupRecoverButton;
- (void)_syncCenterClusterSpacing;
- (void)_syncForStyleChanges;
- (void)_syncToStyleAndPlayControlState;
- (void)_updateButtonColors;
- (void)_updateForPresentedControlsOptions;
- (void)cancelScrubbing;
- (void)detailSlider:(id)a3 didChangeValue:(float)a4;
- (void)detailSliderTrackingDidBegin:(id)a3;
- (void)detailSliderTrackingDidCancel:(id)a3;
- (void)detailSliderTrackingDidEnd:(id)a3;
- (void)setActionDelegate:(id)a3;
- (void)setCenterClusterStackView:(id)a3;
- (void)setCenterClusterWidthCard:(double)a3;
- (void)setCenterClusterWidthLibrary:(double)a3;
- (void)setControlsAnimationColor:(id)a3;
- (void)setControlsColor:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDeleteSelectionButton:(id)a3;
- (void)setDuration:(double)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setEditRecordingButton:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInButton:(id)a3;
- (void)setIntrinsicHeight:(double)a3;
- (void)setJumpBackwardButton:(id)a3;
- (void)setJumpForwardButton:(id)a3;
- (void)setOutButton:(id)a3;
- (void)setPlayControlState:(int64_t)a3;
- (void)setPlayPauseBusyContainerView:(id)a3;
- (void)setPlayPauseButton:(id)a3;
- (void)setPresentedControlsOptions:(unint64_t)a3;
- (void)setRecentlyDeleted:(BOOL)a3;
- (void)setRecoverButton:(id)a3;
- (void)setSecondaryControlsColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTimelineSlider:(id)a3;
- (void)setTrimButtonsEnabled:(BOOL)a3;
- (void)setTrimToSelectionButton:(id)a3;
- (void)updateWidthOnSizeChange;
@end

@implementation RCShuttleBar

- (RCShuttleBar)initWithShuttleBarStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCShuttleBar;
  v4 = [(RCShuttleBar *)&v7 initWithArrangedSubviewRows:0];
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    [(RCShuttleBar *)v4 _commonInit];
    [(RCShuttleBar *)v5 _syncForStyleChanges];
    [(RCShuttleBar *)v5 setDelegate:v5];
  }
  return v5;
}

- (void)setPlayControlState:(int64_t)a3
{
  self->_playControlState = a3;
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  [(RCShuttleBar *)self _syncForStyleChanges];
}

- (void)_syncForStyleChanges
{
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];

  [(RCShuttleBar *)self _syncCenterClusterSpacing];
}

- (void)_syncToStyleAndPlayControlState
{
  id v46 = [(RCShuttleBar *)self playPauseButton];
  int64_t v3 = [(RCShuttleBar *)self style];
  int64_t v4 = [(RCShuttleBar *)self playControlState];
  if (v4 == 2)
  {
    [v46 setHidden:1];
  }
  else
  {
    if (v4 == 1)
    {
      [v46 setHidden:0];
      v5 = [(RCShuttleBar *)self _imageForState:1 inStyle:v3];
      [v46 setImage:v5 forState:0];
      v6 = +[NSBundle mainBundle];
      objc_super v7 = v6;
      CFStringRef v8 = @"PAUSE";
    }
    else
    {
      if (v4) {
        goto LABEL_8;
      }
      [v46 setHidden:0];
      v5 = [(RCShuttleBar *)self _imageForState:0 inStyle:v3];
      [v46 setImage:v5 forState:0];
      v6 = +[NSBundle mainBundle];
      objc_super v7 = v6;
      CFStringRef v8 = @"PLAY";
    }
    v9 = [v6 localizedStringForKey:v8 value:&stru_100228BC8 table:0];
    [v46 setAccessibilityLabel:v9];

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:v8 value:&stru_100228BC8 table:0];
    [v46 setLargeContentTitle:v11];
  }
LABEL_8:
  BOOL v12 = [(RCShuttleBar *)self _isCardStyle];
  v13 = +[RCRecorderStyleProvider sharedStyleProvider];
  v14 = v13;
  if (v12)
  {
    [v13 shuttleBarButtonContainerHeightCard];
    double v16 = v15;
    int64_t v17 = [(RCShuttleBar *)self editMode];
    if (!v17)
    {
      [v14 jumpBackwardForwardButtonSpacing];
      double v28 = v27;
      v29 = [(RCShuttleBar *)self centerClusterStackView];
      [v29 setSpacing:v28];

      [v14 centerClusterWidthJumpButton];
      goto LABEL_16;
    }
    if (v17 == 1)
    {
      [(RCShuttleBar *)self centerClusterWidthCard];
LABEL_16:
      double width = v18;
      goto LABEL_18;
    }
    double width = CGSizeZero.width;
  }
  else
  {
    [v13 shuttleBarButtonContainerHeightLibrary];
    double v16 = v19;
    [(RCShuttleBar *)self centerClusterWidthLibrary];
    double width = v20;
    if ([(RCShuttleBar *)self recentlyDeleted])
    {
      [v14 centerClusterControlSize];
      double width = v22;
    }
    v23 = [(RCShuttleBar *)self centerClusterStackView];
    [v23 setSpacing:0.0];

    [v14 shuttleBarAdditionalSliderSpacingLibrary];
    double v25 = -v24;
    v26 = [(RCShuttleBar *)self timelineSlider];
    [v26 setCustomAlignmentRectInsets:v25, 0.0, 0.0, 0.0];
  }
LABEL_18:
  -[NUIContainerStackView setMinimumLayoutSize:](self->_centerClusterStackView, "setMinimumLayoutSize:", width, v16);
  -[NUIContainerStackView setMaximumLayoutSize:](self->_centerClusterStackView, "setMaximumLayoutSize:", width, v16);
  if (v12)
  {
    v30 = [v14 cardGoForwardImage];
    [v14 cardGoBackwardImage];
  }
  else
  {
    v30 = [v14 libraryGoForwardImage];
    [v14 libraryGoBackwardImage];
  v31 = };
  v32 = [(RCShuttleBar *)self jumpForwardButton];
  [v32 setImage:v30 forState:0];

  v33 = [(RCShuttleBar *)self jumpBackwardButton];
  [v33 setImage:v31 forState:0];

  if ([v14 transportButtonsAnimateWithCircle])
  {
    v34 = [(RCShuttleBar *)self playPauseButton];
    [v34 setShouldAnimateOnTap:v12];

    [v14 transportButtonAnimationPlayCircleRadius];
    double v36 = v35;
    v37 = [(RCShuttleBar *)self playPauseButton];
    [v37 setAnimationCircleRadius:v36];

    v38 = [(RCShuttleBar *)self jumpForwardButton];
    [v38 setShouldAnimateOnTap:v12];

    [v14 transportButtonAnimationJumpCircleRadius];
    double v40 = v39;
    v41 = [(RCShuttleBar *)self jumpForwardButton];
    [v41 setAnimationCircleRadius:v40];

    v42 = [(RCShuttleBar *)self jumpBackwardButton];
    [v42 setShouldAnimateOnTap:v12];

    [v14 transportButtonAnimationJumpCircleRadius];
    double v44 = v43;
    v45 = [(RCShuttleBar *)self jumpBackwardButton];
    [v45 setAnimationCircleRadius:v44];
  }
}

- (BOOL)_isCardStyle
{
  int64_t v3 = [(RCShuttleBar *)self style];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(RCShuttleBar *)self style] == (id)2;
  }
  return v3;
}

- (void)_syncCenterClusterSpacing
{
  int64_t v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v3 shuttleBarShouldForceProportionalDistribution];
  double v5 = v4;

  if (v5 == 0.0 && ([(RCShuttleBar *)self style] || [(RCShuttleBar *)self recentlyDeleted])) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(RCShuttleBar *)self centerClusterStackView];
  [v7 setDistribution:v6];
}

- (void)updateWidthOnSizeChange
{
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v9 supportsRotationButNotOtherResizing])
  {
    [(NUIContainerStackView *)self->_centerClusterStackView minimumLayoutSize];
    [v9 shuttleBarButtonContainerHeightLibrary];
    double v4 = v3;
    [v9 centerClusterWidthJumpButton];
    double v6 = v5;
    if ([(RCShuttleBar *)self _isCardStyle]) {
      self->_centerClusterWidthCard = v6;
    }
    [v9 jumpBackwardForwardButtonSpacing];
    double v8 = v7;
    -[NUIContainerStackView setMinimumLayoutSize:](self->_centerClusterStackView, "setMinimumLayoutSize:", v6, v4);
    -[NUIContainerStackView setMaximumLayoutSize:](self->_centerClusterStackView, "setMaximumLayoutSize:", v6, v4);
    [(NUIContainerStackView *)self->_centerClusterStackView setSpacing:v8];
  }
}

- (void)cancelScrubbing
{
  id v2 = [(RCShuttleBar *)self timelineSlider];
  [v2 cancelTracking];
}

- (id)_imageForState:(int64_t)a3 inStyle:(int64_t)a4
{
  if (a3)
  {
    if (a3 == 1)
    {
      double v4 = [(RCShuttleBar *)self _pauseImageForStyle:a4];
    }
    else
    {
      double v4 = 0;
    }
  }
  else
  {
    double v4 = [(RCShuttleBar *)self _playImageForStyle:a4];
  }

  return v4;
}

- (id)_playImageForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 2)
  {
    double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v4 = [v3 cardPlayImage];
LABEL_5:
    double v5 = (void *)v4;

    goto LABEL_7;
  }
  if (!a3)
  {
    double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v4 = [v3 libraryPlayImage];
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (id)_pauseImageForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 2)
  {
    double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v4 = [v3 cardPauseImage];
LABEL_5:
    double v5 = (void *)v4;

    goto LABEL_7;
  }
  if (!a3)
  {
    double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    uint64_t v4 = [v3 libraryPauseImage];
    goto LABEL_5;
  }
  double v5 = 0;
LABEL_7:

  return v5;
}

- (RCTouchInsetsButton)inButton
{
  inButton = self->_inButton;
  if (!inButton)
  {
    uint64_t v4 = +[RCTouchInsetsButton touchInsetsButton];
    double v5 = self->_inButton;
    self->_inButton = v4;

    [(RCTouchInsetsButton *)self->_inButton addTarget:self action:"_handleSetInPoint" forControlEvents:64];
    double v6 = self->_inButton;
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"INSERT_MODE_IN_BUTTON_TITLE" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)v6 setTitle:v8 forState:0];

    id v9 = self->_inButton;
    v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    v11 = [v10 inOutButtonTextColor];
    [(RCTouchInsetsButton *)v9 setTitleColor:v11 forState:0];

    BOOL v12 = self->_inButton;
    v13 = +[RCRecorderStyleProvider sharedStyleProvider];
    v14 = [v13 inOutButtonBackgroundColor];
    [(RCTouchInsetsButton *)v12 setBackgroundColor:v14];

    double v15 = self->_inButton;
    double v16 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v16 inOutButtonCornerRadius];
    -[RCTouchInsetsButton _setCornerRadius:](v15, "_setCornerRadius:");

    int64_t v17 = +[RCRecorderStyleProvider sharedStyleProvider];
    double v18 = [v17 editingControlButtonLabelFont];
    double v19 = [(RCTouchInsetsButton *)self->_inButton titleLabel];
    [v19 setFont:v18];

    double v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"SET_IN_POINT" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)self->_inButton setAccessibilityLabel:v21];

    [(RCTouchInsetsButton *)self->_inButton setAccessibilityIdentifier:@"Insertion in point button"];
    double v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"SET_IN_POINT" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)self->_inButton setLargeContentTitle:v23];

    inButton = self->_inButton;
  }

  return inButton;
}

- (RCTouchInsetsButton)outButton
{
  outButton = self->_outButton;
  if (!outButton)
  {
    uint64_t v4 = +[RCTouchInsetsButton touchInsetsButton];
    double v5 = self->_outButton;
    self->_outButton = v4;

    [(RCTouchInsetsButton *)self->_outButton addTarget:self action:"_handleSetOutPoint" forControlEvents:64];
    double v6 = self->_outButton;
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"INSERT_MODE_OUT_BUTTON_TITLE" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)v6 setTitle:v8 forState:0];

    id v9 = self->_outButton;
    v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    v11 = [v10 inOutButtonTextColor];
    [(RCTouchInsetsButton *)v9 setTitleColor:v11 forState:0];

    BOOL v12 = self->_outButton;
    v13 = +[RCRecorderStyleProvider sharedStyleProvider];
    v14 = [v13 inOutButtonBackgroundColor];
    [(RCTouchInsetsButton *)v12 setBackgroundColor:v14];

    double v15 = self->_outButton;
    double v16 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v16 inOutButtonCornerRadius];
    -[RCTouchInsetsButton _setCornerRadius:](v15, "_setCornerRadius:");

    int64_t v17 = +[RCRecorderStyleProvider sharedStyleProvider];
    double v18 = [v17 editingControlButtonLabelFont];
    double v19 = [(RCTouchInsetsButton *)self->_outButton titleLabel];
    [v19 setFont:v18];

    double v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"SET_OUT_POINT" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)self->_outButton setAccessibilityLabel:v21];

    [(RCTouchInsetsButton *)self->_outButton setAccessibilityIdentifier:@"Insertion out point button"];
    double v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"SET_OUT_POINT" value:&stru_100228BC8 table:0];
    [(RCTouchInsetsButton *)self->_outButton setLargeContentTitle:v23];

    outButton = self->_outButton;
  }

  return outButton;
}

- (RCTrimButton)trimToSelectionButton
{
  trimToSelectionButton = self->_trimToSelectionButton;
  if (!trimToSelectionButton)
  {
    uint64_t v4 = +[RCTrimButton buttonWithType:1];
    double v5 = self->_trimToSelectionButton;
    self->_trimToSelectionButton = v4;

    [(RCTrimButton *)self->_trimToSelectionButton addTarget:self action:"_handleTrimToSelection" forControlEvents:64];
    LODWORD(v6) = 1144750080;
    [(RCTrimButton *)self->_trimToSelectionButton setContentCompressionResistancePriority:0 forAxis:v6];
    trimToSelectionButton = self->_trimToSelectionButton;
  }

  return trimToSelectionButton;
}

- (RCDeleteButton)deleteSelectionButton
{
  deleteSelectionButton = self->_deleteSelectionButton;
  if (!deleteSelectionButton)
  {
    uint64_t v4 = +[RCDeleteButton buttonWithType:1];
    double v5 = self->_deleteSelectionButton;
    self->_deleteSelectionButton = v4;

    [(RCDeleteButton *)self->_deleteSelectionButton addTarget:self action:"_handleDeleteSelection" forControlEvents:64];
    LODWORD(v6) = 1144750080;
    [(RCDeleteButton *)self->_deleteSelectionButton setContentCompressionResistancePriority:0 forAxis:v6];
    deleteSelectionButton = self->_deleteSelectionButton;
  }

  return deleteSelectionButton;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
  if (a3 == 1)
  {
    v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v11 = [v10 hostsTransportAndDoneButtonInBottomSection];

    if (!v11)
    {
      double v6 = [(RCShuttleBar *)self trimToSelectionButton];
      double v7 = [(RCShuttleBar *)self playPauseBusyContainerView];
      v17[1] = v7;
      double v8 = [(RCShuttleBar *)self deleteSelectionButton];
      uint64_t v12 = 0;
      v17[2] = v8;
      id v9 = v17;
      goto LABEL_9;
    }
    double v6 = [(RCShuttleBar *)self jumpBackwardButton];
    v18[0] = v6;
    double v7 = [(RCShuttleBar *)self playPauseBusyContainerView];
    v18[1] = v7;
    double v8 = [(RCShuttleBar *)self jumpForwardButton];
    v18[2] = v8;
    id v9 = v18;
  }
  else
  {
    if (a3)
    {
      v13 = 0;
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    uint64_t v4 = [(RCShuttleBar *)self controlsColor];
    double v5 = [(RCShuttleBar *)self playPauseButton];
    [v5 setTintColor:v4];

    double v6 = [(RCShuttleBar *)self jumpBackwardButton];
    v19[0] = v6;
    double v7 = [(RCShuttleBar *)self playPauseBusyContainerView];
    v19[1] = v7;
    double v8 = [(RCShuttleBar *)self jumpForwardButton];
    v19[2] = v8;
    id v9 = v19;
  }
  uint64_t v12 = 1;
LABEL_9:
  v13 = +[NSArray arrayWithObjects:v9 count:3];

LABEL_10:
  v14 = [(RCShuttleBar *)self centerClusterStackView];
  [v14 setSemanticContentAttribute:v12];

  double v15 = [(NUIContainerStackView *)self->_centerClusterStackView arrangedSubviews];
  unsigned __int8 v16 = [v13 isEqualToArray:v15];

  if ((v16 & 1) == 0) {
    [(NUIContainerStackView *)self->_centerClusterStackView setArrangedSubviews:v13];
  }
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
  [(RCShuttleBar *)self setAccessibilityElements:v13];
}

- (void)setTrimButtonsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_trimButtonsEnabled = a3;
  double v5 = [(RCShuttleBar *)self trimToSelectionButton];
  [v5 setEnabled:v3];

  id v6 = [(RCShuttleBar *)self deleteSelectionButton];
  [v6 setEnabled:v3];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  -[RCShuttleBar setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100047378;
  v5[3] = &unk_100221830;
  v5[4] = self;
  BOOL v6 = a3;
  +[UIView animateWithDuration:v5 animations:0.2];
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  id v4 = [(RCShuttleBar *)self timelineSlider];
  [v4 setDuration:a3];
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  id v5 = [(RCShuttleBar *)self timelineSlider];
  *(float *)&double v4 = a3;
  [v5 setValue:v4];
}

- (void)setControlsColor:(id)a3
{
  objc_storeStrong((id *)&self->_controlsColor, a3);

  [(RCShuttleBar *)self _updateButtonColors];
}

- (void)setSecondaryControlsColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryControlsColor, a3);

  [(RCShuttleBar *)self _updateButtonColors];
}

- (void)setControlsAnimationColor:(id)a3
{
  objc_storeStrong((id *)&self->_controlsAnimationColor, a3);

  [(RCShuttleBar *)self _updateButtonColors];
}

- (void)_updateButtonColors
{
  if (self->_controlsColor)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    BOOL v3 = [(RCShuttleBar *)self jumpBackwardButton];
    v18[0] = v3;
    double v4 = [(RCShuttleBar *)self jumpForwardButton];
    v18[1] = v4;
    id v5 = [(RCShuttleBar *)self playPauseButton];
    v18[2] = v5;
    BOOL v6 = +[NSArray arrayWithObjects:v18 count:3];

    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v11 setTintColor:self->_controlsColor];
          [v11 setAnimationCircleColor:self->_controlsAnimationColor];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
  }
  secondaryControlsColor = self->_secondaryControlsColor;
  if (secondaryControlsColor)
  {
    v13 = [(RCShuttleBar *)self deleteButton];
    [v13 setTintColor:secondaryControlsColor];
  }
}

- (void)setCenterClusterWidthCard:(double)a3
{
  self->_centerClusterWidthCard = a3;
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
}

- (void)setCenterClusterWidthLibrary:(double)a3
{
  self->_centerClusterWidthLibrary = a3;
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
}

- (void)setPresentedControlsOptions:(unint64_t)a3
{
  self->_presentedControlsOptions = a3;
  [(RCShuttleBar *)self _updateForPresentedControlsOptions];
}

- (void)_updateForPresentedControlsOptions
{
  unsigned __int8 v3 = [(RCShuttleBar *)self presentedControlsOptions];
  double v4 = [(RCShuttleBar *)self rowAtIndex:0];
  [v4 setHidden:(v3 & 1) == 0];

  BOOL v5 = (v3 & 2) == 0;
  BOOL v6 = [(RCShuttleBar *)self deleteButton];
  [v6 setHidden:v5];

  id v7 = [(RCShuttleBar *)self editRecordingButton];
  [v7 setHidden:v5];

  id v8 = [(RCShuttleBar *)self recoverButton];
  [v8 setHidden:v5];
}

- (void)setRecentlyDeleted:(BOOL)a3
{
  if (self->_recentlyDeleted != a3)
  {
    BOOL v3 = a3;
    self->_recentlyDeleted = a3;
    if ([(RCShuttleBar *)self numberOfRows] == (id)2
      && [(RCShuttleBar *)self numberOfColumns] == (id)3)
    {
      if (v3)
      {
        [(RCShuttleBar *)self _setupRecoverButton];
        [(RCShuttleBar *)self recoverButton];
      }
      else
      {
        [(RCShuttleBar *)self _setupEditRecordingButton];
        [(RCShuttleBar *)self editRecordingButton];
      BOOL v5 = };
      [(RCShuttleBar *)self replaceArrangedSubview:v5 inColumnAtIndex:0 rowAtIndex:1];
    }
    else
    {
      BOOL v5 = OSLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_10016AFF8(v5);
      }
    }

    BOOL v6 = [(RCShuttleBar *)self jumpBackwardButton];
    [v6 setHidden:v3];

    id v7 = [(RCShuttleBar *)self jumpForwardButton];
    [v7 setHidden:v3];

    [(RCShuttleBar *)self _setupDeleteButton];
    [(RCShuttleBar *)self _updateButtonColors];
    [(RCShuttleBar *)self _syncCenterClusterSpacing];
    [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
  }
}

- (void)_commonInit
{
  [(RCShuttleBar *)self setArrangedSubviewRemovalPolicy:2];
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v4 = objc_opt_new();
  double v5 = NUIContainerViewLengthUseDefault;
  [v4 setMaximumLayoutSize:50.0, NUIContainerViewLengthUseDefault];
  [v4 setMinimumLayoutSize:v5, 20.0];
  [(RCShuttleBar *)self setTimelineSlider:v4];
  [v4 setDelegate:self];
  LODWORD(v6) = 1148846080;
  [v4 setContentHuggingPriority:1 forAxis:v6];
  [v4 setClipsToBounds:0];
  [v3 centerClusterWidthLibrary];
  self->_centerClusterWidthLibrary = v7;
  v59 = v3;
  [v3 centerClusterWidthCard];
  self->_centerClusterWidthCard = v8;
  uint64_t v9 = +[RCTouchInsetsButton touchInsetsButton];
  jumpBackwardButton = self->_jumpBackwardButton;
  self->_jumpBackwardButton = v9;

  [(RCTouchInsetsButton *)self->_jumpBackwardButton addTarget:self action:"_handleJumpBackward" forControlEvents:64];
  unsigned int v11 = +[NSBundle mainBundle];
  uint64_t v12 = [v11 localizedStringForKey:@"REWIND_BUTTON" value:&stru_100228BC8 table:0];
  [(RCTouchInsetsButton *)self->_jumpBackwardButton setAccessibilityLabel:v12];

  [(RCTouchInsetsButton *)self->_jumpBackwardButton setAccessibilityIdentifier:@"Rewind button"];
  v13 = +[NSBundle mainBundle];
  long long v14 = [v13 localizedStringForKey:@"REWIND_BUTTON" value:&stru_100228BC8 table:0];
  [(RCTouchInsetsButton *)self->_jumpBackwardButton setLargeContentTitle:v14];

  long long v15 = self->_jumpBackwardButton;
  long long v16 = +[RCRecorderStyleProvider sharedStyleProvider];
  long long v17 = [v16 libraryGoBackwardImage];
  [(RCTouchInsetsButton *)v15 setImage:v17 forState:0];

  double v18 = +[RCTouchInsetsButton touchInsetsButton];
  jumpForwardButton = self->_jumpForwardButton;
  self->_jumpForwardButton = v18;

  [(RCTouchInsetsButton *)self->_jumpForwardButton addTarget:self action:"_handleJumpForward" forControlEvents:64];
  double v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"FASTFORWARD_BUTTON" value:&stru_100228BC8 table:0];
  [(RCTouchInsetsButton *)self->_jumpForwardButton setAccessibilityLabel:v21];

  [(RCTouchInsetsButton *)self->_jumpForwardButton setAccessibilityIdentifier:@"Fast forward button"];
  double v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"FASTFORWARD_BUTTON" value:&stru_100228BC8 table:0];
  [(RCTouchInsetsButton *)self->_jumpForwardButton setLargeContentTitle:v23];

  double v24 = self->_jumpForwardButton;
  double v25 = +[RCRecorderStyleProvider sharedStyleProvider];
  v26 = [v25 libraryGoForwardImage];
  [(RCTouchInsetsButton *)v24 setImage:v26 forState:0];

  double v27 = +[RCTouchInsetsButton touchInsetsButton];
  playPauseButton = self->_playPauseButton;
  self->_playPauseButton = v27;

  [(RCTouchInsetsButton *)self->_playPauseButton addTarget:self action:"_handlePlayPause" forControlEvents:64];
  LODWORD(v29) = 1148846080;
  [(RCTouchInsetsButton *)self->_playPauseButton setContentCompressionResistancePriority:0 forAxis:v29];
  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"PLAY" value:&stru_100228BC8 table:0];
  [(RCTouchInsetsButton *)self->_playPauseButton setAccessibilityLabel:v31];

  v32 = self->_playPauseButton;
  unint64_t v33 = (unint64_t)[(RCTouchInsetsButton *)v32 accessibilityTraits];
  [(RCTouchInsetsButton *)v32 setAccessibilityTraits:UIAccessibilityTraitStartsMediaSession | v33];
  id v34 = objc_alloc((Class)NUIContainerBoxView);
  v66 = self->_playPauseButton;
  double v35 = +[NSArray arrayWithObjects:&v66 count:1];
  id v36 = [v34 initWithArrangedSubviews:v35];

  [v3 centerClusterControlSize];
  double v38 = v37;
  double v40 = v39;
  [v36 setMinimumLayoutSize:];
  [v36 setMaximumLayoutSize:v38, v40];
  [(RCShuttleBar *)self setPlayPauseBusyContainerView:v36];
  id v41 = objc_alloc((Class)NUIContainerStackView);
  v65[0] = self->_jumpBackwardButton;
  v65[1] = v36;
  v65[2] = self->_jumpForwardButton;
  v42 = +[NSArray arrayWithObjects:v65 count:3];
  id v43 = [v41 initWithArrangedSubviews:v42];

  [v43 setDelegate:self];
  [v43 setArrangedSubviewRemovalPolicy:2];
  [(RCShuttleBar *)self setCenterClusterStackView:v43];
  [v43 setAxis:0];
  [v43 setDistribution:2];
  [v43 setAlignment:3];
  [v43 setSemanticContentAttribute:1];
  [(RCShuttleBar *)self _setupEditRecordingButton];
  [(RCShuttleBar *)self _setupRecoverButton];
  [(RCShuttleBar *)self _setupDeleteButton];
  unsigned int v44 = [(RCShuttleBar *)self recentlyDeleted];
  v45 = &OBJC_IVAR___RCShuttleBar__editRecordingButton;
  if (v44) {
    v45 = &OBJC_IVAR___RCShuttleBar__recoverButton;
  }
  id v46 = *(id *)&self->NUIContainerGridView_opaque[*v45];
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_10004809C;
  v60[3] = &unk_100221858;
  v60[4] = self;
  id v61 = v4;
  id v62 = v46;
  id v63 = v43;
  id v58 = v43;
  id v56 = v46;
  id v57 = v4;
  [(RCShuttleBar *)self performBatchUpdates:v60];
  [(RCShuttleBar *)self _syncToStyleAndPlayControlState];
  v47 = [(RCShuttleBar *)self timelineSlider];
  v64[0] = v47;
  v48 = [(RCShuttleBar *)self recoverButton];
  v64[1] = v48;
  v49 = [(RCShuttleBar *)self editRecordingButton];
  v64[2] = v49;
  v50 = [(RCShuttleBar *)self jumpBackwardButton];
  v64[3] = v50;
  v51 = [(RCShuttleBar *)self playPauseButton];
  v64[4] = v51;
  v52 = [(RCShuttleBar *)self jumpForwardButton];
  v64[5] = v52;
  v53 = [(RCShuttleBar *)self deleteButton];
  v64[6] = v53;
  v54 = +[NSArray arrayWithObjects:v64 count:7];
  [(RCShuttleBar *)self setAccessibilityElements:v54];

  id v55 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  [(RCShuttleBar *)self addInteraction:v55];
}

- (void)_setupEditRecordingButton
{
  id v13 = [(RCShuttleBar *)self editRecordingButton];
  if (!v13)
  {
    id v13 = +[RCTouchInsetsButton touchInsetsButton];
    BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    double v4 = [v3 shuttleBarImageSymbolConfiguration];
    double v5 = [v3 editButtonImage];
    double v6 = [v5 imageWithConfiguration:v4];

    [v13 setImage:v6 forState:0];
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"AX_EDIT_RECORDING" value:&stru_100228BC8 table:0];

    [v13 setAccessibilityLabel:v8];
    [v13 setLargeContentTitle:v8];
    [v13 setAccessibilityIdentifier:@"Edit recording button"];
    [v13 intrinsicContentSize];
    double v10 = v9;
    double v12 = v11;
    [v13 setMinimumLayoutSize:];
    [v13 setMaximumLayoutSize:v10, v12];
    [(RCShuttleBar *)self setEditRecordingButton:v13];
  }
  [(RCShuttleBar *)self setClipsToBounds:0];
  [v13 addTarget:self action:"_handleEditRecording" forControlEvents:64];
}

- (void)_setupRecoverButton
{
  id v13 = [(RCShuttleBar *)self recoverButton];
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (!v13)
  {
    id v13 = +[RCTouchInsetsButton touchInsetsButton];
    -[RCShuttleBar setRecoverButton:](self, "setRecoverButton:");
  }
  [(RCShuttleBar *)self setClipsToBounds:0];
  [v3 centerClusterControlSizeRecentlyDeleted];
  double v5 = v4;
  double v7 = v6;
  [v13 setMinimumLayoutSize:];
  [v13 setMaximumLayoutSize:v5, v7];
  double v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"RECOVER" value:&stru_100228BC8 table:0];
  [v13 setTitle:v9 forState:0];

  [v13 addTarget:self action:"_handleUndelete" forControlEvents:64];
  double v10 = +[NSBundle mainBundle];
  double v11 = [v10 localizedStringForKey:@"RECOVER" value:&stru_100228BC8 table:0];
  [v13 setAccessibilityLabel:v11];

  [v13 setAccessibilityIdentifier:@"Recover"];
  [v13 setContentHorizontalAlignment:4];
  double v12 = [v13 accessibilityLabel];
  [v13 setLargeContentTitle:v12];
}

- (void)_setupDeleteButton
{
  id v21 = [(RCShuttleBar *)self deleteButton];
  BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (!v21)
  {
    id v21 = +[RCTouchInsetsButton touchInsetsButton];
    [v21 setContentHorizontalAlignment:5];
    [(RCShuttleBar *)self setDeleteButton:v21];
  }
  [(RCShuttleBar *)self setClipsToBounds:0];
  if ([(RCShuttleBar *)self recentlyDeleted])
  {
    [v21 setImage:0 forState:0];
    double v4 = +[NSBundle mainBundle];
    double v5 = [v4 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
    [v21 setTitle:v5 forState:0];

    [v21 removeTarget:self action:"_handleDelete" forControlEvents:64];
    [v21 addTarget:self action:"_handleErase" forControlEvents:64];
    double v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
    [v21 setAccessibilityLabel:v7];

    [v21 setAccessibilityIdentifier:@"Delete forever button"];
    [v3 centerClusterControlSizeRecentlyDeleted];
    double v8 = v21;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    id v13 = [v3 trashImage];
    long long v14 = [v3 shuttleBarImageSymbolConfiguration];
    long long v15 = [v13 imageWithConfiguration:v14];
    [v21 setImage:v15 forState:0];
    [v21 setTitle:0 forState:0];
    [v21 removeTarget:self action:"_handleUndelete" forControlEvents:64];
    [v21 addTarget:self action:"_handleDelete" forControlEvents:64];
    long long v16 = +[NSBundle mainBundle];
    long long v17 = [v16 localizedStringForKey:@"DELETE" value:&stru_100228BC8 table:0];
    [v21 setAccessibilityLabel:v17];

    [v21 setAccessibilityIdentifier:@"Delete button"];
    [v21 intrinsicContentSize];
    double v10 = v18;
    double v12 = v19;

    double v8 = v21;
  }
  id v22 = v8;
  [v8 setMinimumLayoutSize:v10, v12];
  [v22 setMaximumLayoutSize:v10, v12];
  double v20 = [v22 accessibilityLabel];
  [v22 setLargeContentTitle:v20];
}

- (void)_handleJumpBackward
{
  BOOL v3 = [(RCShuttleBar *)self actionDelegate];
  [v3 performControlsAction:12 position:self source:0.0];

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  id v4 = [(RCShuttleBar *)self jumpBackwardButton];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);
}

- (void)_handleJumpForward
{
  BOOL v3 = [(RCShuttleBar *)self actionDelegate];
  [v3 performControlsAction:11 position:self source:0.0];

  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  id v4 = [(RCShuttleBar *)self jumpForwardButton];
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v3, v4);
}

- (void)_handlePlayPause
{
  int64_t v3 = [(RCShuttleBar *)self playControlState];
  if (v3 == 1)
  {
    id v4 = [(RCShuttleBar *)self actionDelegate];
    [v4 performControlsAction:1 position:self source:0.0];
  }
  else
  {
    if (v3) {
      goto LABEL_6;
    }
    id v4 = [(RCShuttleBar *)self actionDelegate];
    double v5 = [(RCShuttleBar *)self timelineSlider];
    [v5 position];
    [v4 performControlsAction:0 position:self];
  }
LABEL_6:
  UIAccessibilityNotifications v6 = UIAccessibilityLayoutChangedNotification;
  id v7 = [(RCShuttleBar *)self playPauseButton];
  UIAccessibilityPostNotification(v6, v7);
}

- (void)_handleEditRecording
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self editRecordingButton];
  [v4 performControlsAction:23 position:v3 source:0.0];
}

- (void)_handleErase
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self deleteButton];
  [v4 performControlsAction:17 position:v3 source:0.0];
}

- (void)_handleDelete
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self deleteButton];
  [v4 performControlsAction:15 position:v3 source:0.0];
}

- (void)_handleUndelete
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self deleteButton];
  [v4 performControlsAction:20 position:v3 source:0.0];
}

- (void)_handleSetInPoint
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self inButton];
  [v4 performControlsAction:33 position:v3 source:0.0];
}

- (void)_handleSetOutPoint
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self outButton];
  [v4 performControlsAction:34 position:v3 source:0.0];
}

- (void)_handleTrimToSelection
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self trimToSelectionButton];
  [v4 performControlsAction:35 position:v3 source:0.0];
}

- (void)_handleDeleteSelection
{
  id v4 = [(RCShuttleBar *)self actionDelegate];
  int64_t v3 = [(RCShuttleBar *)self deleteSelectionButton];
  [v4 performControlsAction:36 position:v3 source:0.0];
}

- (void)detailSliderTrackingDidBegin:(id)a3
{
  id v4 = a3;
  id v7 = [(RCShuttleBar *)self actionDelegate];
  [v4 position];
  double v6 = v5;

  [v7 performControlsAction:8 position:0 source:v6];
}

- (void)detailSliderTrackingDidEnd:(id)a3
{
  id v4 = a3;
  id v7 = [(RCShuttleBar *)self actionDelegate];
  [v4 position];
  double v6 = v5;

  [v7 performControlsAction:10 position:0 source:v6];
}

- (void)detailSliderTrackingDidCancel:(id)a3
{
  id v4 = a3;
  id v7 = [(RCShuttleBar *)self actionDelegate];
  [v4 position];
  double v6 = v5;

  [v7 performControlsAction:10 position:0 source:v6];
}

- (void)detailSlider:(id)a3 didChangeValue:(float)a4
{
  id v5 = a3;
  id v8 = [(RCShuttleBar *)self actionDelegate];
  [v5 position];
  double v7 = v6;

  [v8 performControlsAction:9 position:0 source:v7];
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  if ([v12 isEqual:self->_centerClusterStackView])
  {
    double width = floor(width);
    [v11 frame];
    double MidX = CGRectGetMidX(v21);
    [v11 frame];
    double x = MidX - v14 + width * -0.5;
  }
  else if (([v12 isEqual:self->_trimToSelectionButton] & 1) != 0 {
         || [v12 isEqual:self->_deleteSelectionButton])
  }
  {
    -[RCShuttleBar _estimateTrimDeleteButtonSizeForProposedSize:](self, "_estimateTrimDeleteButtonSizeForProposedSize:", width, height);
    double x = x - (v15 - width) * 0.5;
    double y = y - (v16 - height) * 0.5;
    double height = v16;
    double width = v15;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGSize)_estimateTrimDeleteButtonSizeForProposedSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[RCTrimButton sizeThatFits:](self->_trimToSelectionButton, "sizeThatFits:", a3.width, 3.40282347e38);
  double v7 = v6;
  double v9 = v8;
  -[RCDeleteButton sizeThatFits:](self->_deleteSelectionButton, "sizeThatFits:", width, 3.40282347e38);
  if (v7 >= width) {
    double v12 = v7;
  }
  else {
    double v12 = width;
  }
  if (v10 < width) {
    double v10 = width;
  }
  if (v9 >= height) {
    double v13 = v9;
  }
  else {
    double v13 = height;
  }
  if (v11 < height) {
    double v11 = height;
  }
  if (v12 >= v10) {
    double v10 = v12;
  }
  if (v13 >= v11) {
    double v11 = v13;
  }
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)RCShuttleBar;
  [(RCShuttleBar *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  if (![(RCShuttleBar *)self presentedControlsOptions])
  {
    [(RCShuttleBar *)self centerClusterWidthCard];
    double v4 = v7;
  }
  double v8 = v4;
  double v9 = v6;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)setIntrinsicHeight:(double)a3
{
}

- (double)intrinsicHeight
{
  [(RCShuttleBar *)self intrinsicContentSize];
  return v2;
}

- (int64_t)playControlState
{
  return self->_playControlState;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (UIColor)controlsColor
{
  return self->_controlsColor;
}

- (UIColor)secondaryControlsColor
{
  return self->_secondaryControlsColor;
}

- (UIColor)controlsAnimationColor
{
  return self->_controlsAnimationColor;
}

- (double)centerClusterWidthLibrary
{
  return self->_centerClusterWidthLibrary;
}

- (double)centerClusterWidthCard
{
  return self->_centerClusterWidthCard;
}

- (double)duration
{
  return self->_duration;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (RCControlsActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (RCControlsActionDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)trimButtonsEnabled
{
  return self->_trimButtonsEnabled;
}

- (BOOL)recentlyDeleted
{
  return self->_recentlyDeleted;
}

- (unint64_t)presentedControlsOptions
{
  return self->_presentedControlsOptions;
}

- (NUIContainerStackView)centerClusterStackView
{
  return self->_centerClusterStackView;
}

- (void)setCenterClusterStackView:(id)a3
{
}

- (NUIContainerBoxView)playPauseBusyContainerView
{
  return self->_playPauseBusyContainerView;
}

- (void)setPlayPauseBusyContainerView:(id)a3
{
}

- (RCTouchInsetsButton)editRecordingButton
{
  return self->_editRecordingButton;
}

- (void)setEditRecordingButton:(id)a3
{
}

- (RCTouchInsetsButton)recoverButton
{
  return self->_recoverButton;
}

- (void)setRecoverButton:(id)a3
{
}

- (RCTouchInsetsButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (RCTouchInsetsButton)jumpBackwardButton
{
  return self->_jumpBackwardButton;
}

- (void)setJumpBackwardButton:(id)a3
{
}

- (RCTouchInsetsButton)jumpForwardButton
{
  return self->_jumpForwardButton;
}

- (void)setJumpForwardButton:(id)a3
{
}

- (RCTouchInsetsButton)playPauseButton
{
  return self->_playPauseButton;
}

- (void)setPlayPauseButton:(id)a3
{
}

- (void)setInButton:(id)a3
{
}

- (void)setOutButton:(id)a3
{
}

- (void)setTrimToSelectionButton:(id)a3
{
}

- (void)setDeleteSelectionButton:(id)a3
{
}

- (RCAudioScrubber)timelineSlider
{
  return self->_timelineSlider;
}

- (void)setTimelineSlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineSlider, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButton, 0);
  objc_storeStrong((id *)&self->_trimToSelectionButton, 0);
  objc_storeStrong((id *)&self->_outButton, 0);
  objc_storeStrong((id *)&self->_inButton, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_jumpForwardButton, 0);
  objc_storeStrong((id *)&self->_jumpBackwardButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_recoverButton, 0);
  objc_storeStrong((id *)&self->_editRecordingButton, 0);
  objc_storeStrong((id *)&self->_playPauseBusyContainerView, 0);
  objc_storeStrong((id *)&self->_centerClusterStackView, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_controlsAnimationColor, 0);
  objc_storeStrong((id *)&self->_secondaryControlsColor, 0);

  objc_storeStrong((id *)&self->_controlsColor, 0);
}

@end