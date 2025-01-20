@interface RCRecordingView
- ($F24F406B2B787EFB06265DBA3D28CBD5)currentTrackTimeRange;
- (BOOL)_doingSomeKindOfCapture;
- (BOOL)_shouldEnableRecordingControlForState:(int64_t)a3;
- (BOOL)_shouldHideBottomElements;
- (BOOL)_showsEditingToolbar;
- (BOOL)_stateSupportsDragGesture;
- (BOOL)_touchIsInExcludedView:(id)a3;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)allowsNewRecordings;
- (BOOL)blurThroughEffectsActive;
- (BOOL)canSaveTrimChanges;
- (BOOL)editingInFlight;
- (BOOL)forceDisableRecordingControl;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasCustomizedPlaybackSettings;
- (BOOL)hasMultipleTracks;
- (BOOL)hasTranscription;
- (BOOL)isSyncingViewsToState;
- (BOOL)shouldEnableDoneButtonWhileRecording;
- (BOOL)shouldHideSubseconds;
- (BOOL)shouldSaveAsNew;
- (BOOL)shouldSelectFullTitleAtBeginEditing;
- (BOOL)showsDoneButton;
- (BOOL)textFieldIsBeingEdited;
- (BOOL)trimEnabled;
- (CGSize)intrinsicContentSize;
- (NSArray)dragGesturePassthroughSpecs;
- (NSDate)creationDate;
- (NSLayoutConstraint)deleteSelectionButtonTrailingConstraint;
- (NSLayoutConstraint)recordButtonCenterXToLeadingConstraint;
- (NSLayoutConstraint)recordButtonCenterXToViewCenterXConstraint;
- (NSLayoutConstraint)recordButtonCenterYConstraint;
- (NSLayoutConstraint)trimDeleteButtonLeftConstantConstraint;
- (NSString)recordingTitle;
- (RCCardPresentationDelegate)cardPresentationDelegate;
- (RCDeleteButton)deleteSelectionButton;
- (RCEditingToolbar)editingToolbar;
- (RCProgressOverlay)progressOverlay;
- (RCRecordingControl)cancelButton;
- (RCRecordingDescriptionView)descriptionView;
- (RCRecordingView)initWithFrame:(CGRect)a3;
- (RCRecordingViewDelegate)viewDelegate;
- (RCShuttleBar)shuttleBar;
- (RCTimeLabel)currentTimeLabel;
- (RCToggleButton)playbackSettingsButton;
- (RCToggleButton)transcriptionButton;
- (RCTouchInsetsButton)doneEditingButton;
- (RCTrimButton)trimToSelectionButton;
- (SettableIntrinsicSizeView)bottomControlsContainerView;
- (SettableIntrinsicSizeView)bottomFillerView;
- (SettableIntrinsicSizeView)buttonsAndDescriptionContainerView;
- (SettableIntrinsicSizeView)centerContentContainerView;
- (SettableIntrinsicSizeView)fixedOverviewWaveformContainerView;
- (SettableIntrinsicSizeView)topCardSpacerView;
- (SettableIntrinsicSizeView)topFullScreenSpacerView;
- (SettableIntrinsicSizeView)trimOverviewWaveformContainerView;
- (UIButton)moreActionsButton;
- (UILabel)overviewBeginTimeLabel;
- (UILabel)overviewEndTimeLabel;
- (UIStackView)mainContainerStackView;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UITextField)textFieldBeingEdited;
- (UIView)fixedOverviewWaveformView;
- (UIView)recordButton;
- (UIView)transcriptView;
- (UIView)trimOverviewWaveformView;
- (UIView)waveformView;
- (_TtC10VoiceMemos12RCDoneButton)doneButton;
- (_TtC10VoiceMemos24RCRecordButtonAppFactory)recordButtonFactory;
- (_TtC10VoiceMemos24RCRecordButtonRepository)recordButtonRepository;
- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)moreButtonMenuCreator;
- (double)_doneButtonSidePadding;
- (double)_recordingControlSidePadding;
- (double)_shuttleBarWidth;
- (double)_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:(double)a3;
- (double)_supplementaryColumnMinimumCenterXPosition;
- (double)_trimDeleteButtonHeight;
- (double)_trimDeleteButtonLeftPadding;
- (double)_trimDeleteButtonWidth;
- (double)bottomAccessoryContentContainerHeight;
- (double)bottomAccessoryDescriptionHeight;
- (double)currentTime;
- (double)currentTimeReadoutHeight;
- (double)editingToolbarCompactHeight;
- (double)editingToolbarHeight;
- (double)fixedOverviewWaveformHeight;
- (double)fullScreenDescriptionHeight;
- (double)fullScreenWaveFormHeight;
- (double)hostViewHeight;
- (double)intrinsicHeightForBottomAccessoryViewAndSafeArea;
- (double)intrinsicHeightForCompactView;
- (double)recordingControlSectionHeight;
- (double)recordingDuration;
- (double)shuttleBarHeight;
- (double)statusBarHeight;
- (double)topScreenSpacerHeight;
- (float)centerContentVerticalHuggingPriority;
- (float)editingProgress;
- (id)_backgroundColorAnimation;
- (id)_bottomElementsToHide;
- (id)createTranscriptViewExpansionAnimator;
- (id)saveAsNewRecordingAction:(id)a3;
- (id)saveMenuForDoneButton:(id)a3;
- (id)saveRecordingAction:(id)a3;
- (int64_t)_recordButtonStateForRecordingControlState:(int64_t)a3;
- (int64_t)_recordingControlStateForRecordButtonState:(int64_t)a3;
- (int64_t)centerContentViewState;
- (int64_t)dismissalDisplayStyle;
- (int64_t)displayStyle;
- (int64_t)playControlState;
- (int64_t)recordingControlState;
- (int64_t)recordingViewState;
- (int64_t)transcriptViewState;
- (unint64_t)_displayOptionForView:(id)a3;
- (void)_addLabelsToWaveformOverview:(id)a3 containerView:(id)a4;
- (void)_addSubviewsOfView:(id)a3 includingTopLevelView:(BOOL)a4 toMutableArray:(id)a5;
- (void)_adjustBackgroundColorForDisplayStyle:(int64_t)a3;
- (void)_adjustForHostViewHeight;
- (void)_adjustTraitOverridesForDisplayStyle:(int64_t)a3;
- (void)_alignRecordingControlToCenter;
- (void)_alignRecordingControlToLeft;
- (void)_applyDimmingColorToProgressOverlay;
- (void)_applyFixedOverviewWaveformViewConstraints;
- (void)_assignIVarsFromStyleProvider;
- (void)_classSpecificInit;
- (void)_classSpecificLayout;
- (void)_classSpecificReset;
- (void)_classSpecificSetDisplayStyle:(int64_t)a3;
- (void)_classSpecificSyncTranscriptViewState;
- (void)_createShuttleBarIfNeeded;
- (void)_dimRecordingDescriptionView:(BOOL)a3 animated:(BOOL)a4;
- (void)_displayPlaybackSettings;
- (void)_dropView:(id)a3;
- (void)_handleDeleteSelection;
- (void)_handleTapToFullscreen:(id)a3;
- (void)_handleTrimToSelection;
- (void)_primeFramesOfHiddenItems;
- (void)_setupButtonsAndDescriptionContainerView;
- (void)_setupMoreActionsButton;
- (void)_setupPlaybackSettingsButton;
- (void)_showHideViewsForDisplayOptions:(unint64_t)a3;
- (void)_showRecordingControlOrTrimOverview;
- (void)_showTrimDeleteSelectionButtonsIfNeeded:(BOOL)a3;
- (void)_styleView;
- (void)_swapCurrentArrangedSubview:(id)a3 withNewArrangedSubview:(id)a4;
- (void)_switchToCompact;
- (void)_switchToFullScreen;
- (void)_syncCenterContentContainerViewState;
- (void)_syncSubviewIntrinsicHeights;
- (void)_syncTapGestureRecognizerEnablement;
- (void)_syncViewsToState;
- (void)_trimInsertReplaceDoneButtonAction:(id)a3;
- (void)_trimInsertReplaceDoneButtonSaveAsNewAction:(id)a3;
- (void)_updateCenterContentContainerViewConstraints;
- (void)_updateCurrentTimeLabelForTime:(double)a3;
- (void)_updateMoreButtonMenu;
- (void)_updateRecordButtonStateForRecordingViewState:(int64_t)a3;
- (void)_updateRecordingDescriptionViewForDuration:(double)a3;
- (void)_updateShuttleBarEnablement;
- (void)_updateToolbarsActivityMode:(int64_t)a3;
- (void)_updateTranscriptionButtonVisibility;
- (void)addTransitionSpacing;
- (void)assignActionOnDoneButton:(id)a3;
- (void)cancelButtonTapped;
- (void)cancelTextEditing;
- (void)cleanupAfterDismiss;
- (void)completePresent;
- (void)controlActivated:(id)a3;
- (void)deviceTranscriptionSupportDidChange:(BOOL)a3;
- (void)didBeginEditingInTextField:(id)a3;
- (void)didChangePreferredContentSize;
- (void)didEndEditingInTextField;
- (void)doneButtonMenuActionTriggered:(id)a3;
- (void)handleUpdateTitle:(id)a3;
- (void)layoutSubviews;
- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5;
- (void)prepareForDismiss;
- (void)prepareForPresent:(BOOL)a3;
- (void)recordButtonTapped;
- (void)removeTransitionSpacing;
- (void)reset;
- (void)resetDoneButtonSaveAction:(id)a3;
- (void)restyle;
- (void)setAllowsNewRecordings:(BOOL)a3;
- (void)setBlurThroughEffectsActive:(BOOL)a3;
- (void)setBottomAccessoryContentContainerHeight:(double)a3;
- (void)setBottomAccessoryDescriptionHeight:(double)a3;
- (void)setBottomControlsContainerView:(id)a3;
- (void)setBottomFillerView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonsAndDescriptionContainerView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCardPresentationDelegate:(id)a3;
- (void)setCenterContentContainerView:(id)a3;
- (void)setCenterContentViewState:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeLabel:(id)a3;
- (void)setCurrentTimeReadoutHeight:(double)a3;
- (void)setCurrentTrackTimeRange:(id)a3;
- (void)setDeleteSelectionButton:(id)a3;
- (void)setDeleteSelectionButtonTrailingConstraint:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setDismissalDisplayStyle:(int64_t)a3;
- (void)setDisplayStyle:(int64_t)a3;
- (void)setDoneButton:(id)a3;
- (void)setDoneEditingButton:(id)a3;
- (void)setDragGesturePassthroughSpecs:(id)a3;
- (void)setEditingInFlight:(BOOL)a3;
- (void)setEditingProgress:(float)a3;
- (void)setEditingToolbar:(id)a3;
- (void)setEditingToolbarCompactHeight:(double)a3;
- (void)setEditingToolbarHeight:(double)a3;
- (void)setFixedOverviewWaveformContainerView:(id)a3;
- (void)setFixedOverviewWaveformHeight:(double)a3;
- (void)setFixedOverviewWaveformView:(id)a3;
- (void)setForceDisableRecordingControl:(BOOL)a3;
- (void)setFullScreenDescriptionHeight:(double)a3;
- (void)setFullScreenWaveFormHeight:(double)a3;
- (void)setHasCustomizedPlaybackSettings:(BOOL)a3;
- (void)setHasMultipleTracks:(BOOL)a3;
- (void)setHasTranscription:(BOOL)a3;
- (void)setHostViewHeight:(double)a3;
- (void)setIsSyncingViewsToState:(BOOL)a3;
- (void)setMainContainerStackView:(id)a3;
- (void)setMoreActionsAndPlaybackSettingsButtonsHidden:(BOOL)a3;
- (void)setMoreActionsButton:(id)a3;
- (void)setMoreButtonMenuCreator:(id)a3;
- (void)setOverviewBeginTimeLabel:(id)a3;
- (void)setOverviewEndTimeLabel:(id)a3;
- (void)setPlayControlState:(int64_t)a3;
- (void)setPlaybackSettingsButton:(id)a3;
- (void)setProgressOverlay:(id)a3;
- (void)setRecordButton:(id)a3;
- (void)setRecordButtonCenterXToLeadingConstraint:(id)a3;
- (void)setRecordButtonCenterXToViewCenterXConstraint:(id)a3;
- (void)setRecordButtonCenterYConstraint:(id)a3;
- (void)setRecordButtonFactory:(id)a3;
- (void)setRecordButtonRepository:(id)a3;
- (void)setRecordingControlSectionHeight:(double)a3;
- (void)setRecordingControlState:(int64_t)a3;
- (void)setRecordingDuration:(double)a3;
- (void)setRecordingTitle:(id)a3;
- (void)setRecordingViewState:(int64_t)a3;
- (void)setRecordingViewState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)setSaveRecordingAction:(id)a3;
- (void)setShouldHideSubseconds:(BOOL)a3;
- (void)setShouldSaveAsNew:(BOOL)a3;
- (void)setShowsDoneButton:(BOOL)a3;
- (void)setShuttleBar:(id)a3;
- (void)setShuttleBarHeight:(double)a3;
- (void)setStatusBarHeight:(double)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextFieldBeingEdited:(id)a3;
- (void)setTopCardSpacerView:(id)a3;
- (void)setTopFullScreenSpacerView:(id)a3;
- (void)setTopScreenSpacerHeight:(double)a3;
- (void)setTranscriptView:(id)a3;
- (void)setTranscriptViewState:(int64_t)a3;
- (void)setTranscriptionButton:(id)a3;
- (void)setTrimDeleteButtonLeftConstantConstraint:(id)a3;
- (void)setTrimEnabled:(BOOL)a3;
- (void)setTrimOverviewWaveformContainerView:(id)a3;
- (void)setTrimOverviewWaveformView:(id)a3;
- (void)setTrimToSelectionButton:(id)a3;
- (void)setViewDelegate:(id)a3;
- (void)setWaveformView:(id)a3;
- (void)toggleFullCompact;
- (void)toggleTranscriptView:(id)a3;
- (void)trimSaveStateChanged:(BOOL)a3;
- (void)undoStateChanged:(BOOL)a3 isNewRecording:(BOOL)a4;
- (void)updateAccessibilityForRecordingViewState:(int64_t)a3;
- (void)updateForEditingStart;
- (void)updateForRecordingEnd:(BOOL)a3;
- (void)updateForRecordingStart;
- (void)updateForSizeChange;
- (void)updateMoreActionsAndPlaybackSettingButtonVisibility;
- (void)updateRecordButtonViewStateWithCurrentTime:(double)a3;
- (void)updateTrackState:(unint64_t)a3;
@end

@implementation RCRecordingView

- (double)_shuttleBarWidth
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v2 centerClusterWidthCard];
  double v4 = v3;

  return v4;
}

- (BOOL)hasCustomizedPlaybackSettings
{
  v2 = [(RCRecordingView *)self editingToolbar];
  unsigned __int8 v3 = [v2 hasCustomizedPlaybackSettings];

  return v3;
}

- (BOOL)textFieldIsBeingEdited
{
  v2 = [(RCRecordingView *)self textFieldBeingEdited];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_updateRecordButtonStateForRecordingViewState:(int64_t)a3
{
  int64_t v4 = a3;
  switch(a3)
  {
    case 0:
      goto LABEL_15;
    case 1:
      v9 = +[RCRecorderStyleProvider sharedStyleProvider];
      if ([v9 supportsCompactRecordingCard])
      {
        int64_t v10 = [(RCRecordingView *)self displayStyle];

        if (v10 != 3)
        {
          int64_t v4 = 2;
          goto LABEL_15;
        }
      }
      else
      {
      }
LABEL_14:
      int64_t v4 = 1;
LABEL_15:
      v11 = [(RCRecordingView *)self recordButtonRepository];
      [v11 setState:v4];

      return;
    case 2:
    case 8:
      return;
    case 3:
    case 4:
    case 5:
      v5 = [(RCRecordingView *)self viewDelegate];
      unsigned __int8 v6 = [v5 willRecordIntoTrackTwo];

      uint64_t v7 = 3;
      if (v4 == 5) {
        uint64_t v7 = 4;
      }
      if (v6) {
        int64_t v4 = 0;
      }
      else {
        int64_t v4 = v7;
      }
      goto LABEL_15;
    case 6:
    case 7:
      goto LABEL_14;
    default:
      v8 = OSLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10016DB74(v8);
      }

      int64_t v4 = 0;
      goto LABEL_15;
  }
}

- (void)_showTrimDeleteSelectionButtonsIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v6 = [v5 hostsTransportAndDoneButtonInBottomSection];

  if (v6)
  {
    uint64_t v7 = [(RCRecordingView *)self deleteSelectionButton];
    [v7 setHidden:v3 ^ 1];

    v8 = [(RCRecordingView *)self trimToSelectionButton];
    [v8 setHidden:v3 ^ 1];

    id v9 = [(RCRecordingView *)self deleteSelectionButtonTrailingConstraint];
    [v9 setActive:v3];
  }
}

- (RCRecordingViewDelegate)viewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);

  return (RCRecordingViewDelegate *)WeakRetained;
}

- (void)_syncTapGestureRecognizerEnablement
{
  if ((id)[(RCRecordingView *)self recordingViewState] == (id)8
    || (id)[(RCRecordingView *)self displayStyle] != (id)2)
  {
    int v4 = 0;
    id v3 = 0;
  }
  else
  {
    id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v3 = [v6 allowsInteractiveCardSizing];
    int v4 = 1;
  }
  v5 = [(RCRecordingView *)self tapGestureRecognizer];
  [v5 setEnabled:v3];

  if (v4)
  {
  }
}

- (void)updateTrackState:(unint64_t)a3
{
  v5 = [(RCRecordingView *)self recordButtonRepository];
  [v5 setTrackState:a3];

  id v6 = [(RCRecordingView *)self transcriptionButton];
  [v6 setEnabled:a3 != 2];
}

- (BOOL)_showsEditingToolbar
{
  id v3 = +[NSNumber numberWithInteger:[(RCRecordingView *)self recordingViewState]];
  unsigned __int8 v4 = [&off_10022D928 containsObject:v3];

  if ((id)[(RCRecordingView *)self displayStyle] == (id)3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(RCRecordingView *)self bounds];
  double v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)RCRecordingView;
  -[RCRecordingView setBounds:](&v11, "setBounds:", x, y, width, height);
  if (v9 != width)
  {
    int64_t v10 = [(RCRecordingView *)self viewDelegate];
    [v10 recordingViewWidthDidChange:width];
  }
}

- (void)_adjustBackgroundColorForDisplayStyle:(int64_t)a3
{
  v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v6 = v5;
  if ((unint64_t)a3 > 2) {
    [v5 recordingCardDefaultBackgroundColor];
  }
  else {
  id v7 = [v5 recordingCardBottomAccessoryBackgroundColor];
  }
  if (v7) {
    [(RCRecordingView *)self setBackgroundColor:v7];
  }
}

- (void)setRecordingViewState:(int64_t)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 || (isKindOfClass & 1) == 0)
  {
    id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v8 = v6;
    if (a3 == 1) {
      id v7 = [v6 allowsInteractiveCardSizing];
    }
    else {
      id v7 = 0;
    }
    [(RCRecordingView *)self setRecordingViewState:a3 animated:v7 force:0];
  }
}

- (void)_updateCurrentTimeLabelForTime:(double)a3
{
  [(RCRecordingView *)self recordingDuration];
  [(RCRecordingView *)self shouldHideSubseconds];
  RCLocalizedPlaybackTime();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v4 = [(RCRecordingView *)self currentTimeLabel];
  [v4 setText:v5];
}

- (void)setMoreActionsAndPlaybackSettingsButtonsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(RCRecordingView *)self playbackSettingsButton];
  [v5 setHidden:v3];

  id v6 = [(RCRecordingView *)self moreActionsButton];
  [v6 setHidden:v3];
}

- (id)_backgroundColorAnimation
{
  v2 = [(RCRecordingView *)self window];
  BOOL v3 = [v2 windowScene];
  unsigned __int8 v4 = [v3 delegate];

  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___RCBackgroundColorAnimating])
  {
    id v5 = [v4 backgroundColorAnimation];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_swapCurrentArrangedSubview:(id)a3 withNewArrangedSubview:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(RCRecordingView *)self mainContainerStackView];
  id v8 = [v7 arrangedSubviews];
  if ([v8 containsObject:v6])
  {
    [v7 removeArrangedSubview:v9];
  }
  else
  {
    [v7 insertArrangedSubview:v6 atIndex:[v8 indexOfObject:v9]];
    [v7 removeArrangedSubview:v9];
    [v9 removeFromSuperview];
  }
}

- (void)setPlayControlState:(int64_t)a3
{
  BOOL v5 = a3 == 0;
  id v6 = [(RCRecordingView *)self recordButtonRepository];
  [v6 setIsEnabled:[self _shouldEnableRecordingControlForState:a3]];

  id v7 = [(RCRecordingView *)self cancelButton];
  [v7 setEnabled:v5];

  id v8 = [(RCRecordingView *)self editingToolbar];
  [v8 setCanCancel:v5];

  id v9 = [(RCRecordingView *)self shuttleBar];
  [v9 setPlayControlState:a3];
}

- (void)_adjustTraitOverridesForDisplayStyle:(int64_t)a3
{
  BOOL v5 = [(RCRecordingView *)self traitOverrides];
  id v6 = self;
  unsigned int v7 = [v5 containsTrait:v6];

  id v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v9 = [v8 supportsRecordingViewElevatedUserInterfaceLevelOverride];

  if (v7) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = a3 == 1;
  }
  if (!v10 || v9 == 0)
  {
    if (!v7) {
      return;
    }
    id v13 = [(RCRecordingView *)self traitOverrides];
    v12 = self;
    [v13 removeTrait:v12];
  }
  else
  {
    id v13 = [(RCRecordingView *)self traitOverrides];
    [v13 setUserInterfaceLevel:1];
  }
}

- (void)_showRecordingControlOrTrimOverview
{
  BOOL v3 = (id)[(RCRecordingView *)self recordingViewState] != (id)8
    || (id)[(RCRecordingView *)self displayStyle] != (id)3;
  id v10 = [(RCRecordingView *)self bottomControlsContainerView];
  unsigned __int8 v4 = [(RCRecordingView *)self trimOverviewWaveformContainerView];
  BOOL v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v6 = [v5 shouldShowOverviewWaveform];

  unsigned int v7 = [(RCRecordingView *)self fixedOverviewWaveformView];
  id v8 = v7;
  if (!v6)
  {
    if (!v3)
    {
      [v7 setHidden:0];

      [(RCRecordingView *)self _swapCurrentArrangedSubview:v10 withNewArrangedSubview:v4];
      goto LABEL_11;
    }
    [v7 setHidden:1];

    [(RCRecordingView *)self _swapCurrentArrangedSubview:v4 withNewArrangedSubview:v10];
LABEL_9:
    unsigned int v9 = [(RCRecordingView *)self recordButtonCenterYConstraint];
    [(RCRecordingView *)self addConstraint:v9];

    goto LABEL_11;
  }
  [v7 setHidden:0];

  [(RCRecordingView *)self _swapCurrentArrangedSubview:v4 withNewArrangedSubview:v10];
  if (v3) {
    goto LABEL_9;
  }
LABEL_11:
}

- (void)_syncViewsToState
{
  [(RCRecordingView *)self setIsSyncingViewsToState:1];
  unsigned int v3 = [(RCRecordingView *)self _showsEditingToolbar];
  unsigned __int8 v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v5 = 384;
  switch([(RCRecordingView *)self displayStyle])
  {
    case 0:
      uint64_t v5 = 0;
      goto LABEL_3;
    case 1:
LABEL_3:
      if ([v4 hostsTransportAndDoneButtonInBottomSection]) {
        [(RCRecordingView *)self _alignRecordingControlToCenter];
      }
      unsigned int v6 = [(RCRecordingView *)self editingToolbar];
      [v6 setDisplayMode:0];

      unsigned int v7 = [(RCRecordingView *)self descriptionView];
      [v7 updateForDisplayMode:0];

      break;
    case 2:
      id v8 = [(RCRecordingView *)self editingToolbar];
      [v8 setDisplayMode:1];

      unsigned int v9 = [(RCRecordingView *)self descriptionView];
      [v9 updateForDisplayMode:0];

      uint64_t v5 = 466;
      break;
    case 3:
      if ([v4 presentsTitleAndAdditionalEditingControlsInRecordingCard]) {
        uint64_t v10 = 507;
      }
      else {
        uint64_t v10 = 443;
      }
      if ([v4 shouldShowOverviewWaveform]) {
        uint64_t v5 = v10 | 4;
      }
      else {
        uint64_t v5 = v10;
      }
      objc_super v11 = [(RCRecordingView *)self editingToolbar];
      [v11 setDisplayMode:2];

      v12 = [(RCRecordingView *)self descriptionView];
      [v12 updateForDisplayMode:1];

      if ([v4 hostsTransportAndDoneButtonInBottomSection]) {
        [(RCRecordingView *)self _alignRecordingControlToLeft];
      }
      break;
    default:
      break;
  }
  if (v3) {
    uint64_t v13 = v5 | 0x40;
  }
  else {
    uint64_t v13 = v5;
  }
  if ([(RCRecordingView *)self _shouldHideBottomElements])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = [(RCRecordingView *)self _bottomElementsToHide];
    id v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v13 &= ~[(RCRecordingView *)self _displayOptionForView:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        id v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v16);
    }
  }
  [(RCRecordingView *)self _updateTranscriptionButtonVisibility];
  [(RCRecordingView *)self _showRecordingControlOrTrimOverview];
  [(RCRecordingView *)self _showHideViewsForDisplayOptions:v13];
  [(RCRecordingView *)self _updateCenterContentContainerViewConstraints];
  [(RCRecordingView *)self layoutSubviews];
  v19 = [(RCRecordingView *)self viewDelegate];
  [v19 visualStateChanged];

  [(RCRecordingView *)self setIsSyncingViewsToState:0];
}

- (void)setIsSyncingViewsToState:(BOOL)a3
{
  self->_isSyncingViewsToState = a3;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  BOOL v3 = a3;
  self->_showsDoneButton = a3;
  id v28 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v28 hostsTransportAndDoneButtonInBottomSection])
  {
    uint64_t v5 = [(RCRecordingView *)self doneEditingButton];
    [v5 setEnabledState:2];

    unsigned int v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"DONE" value:&stru_100228BC8 table:0];
    id v8 = [(RCRecordingView *)self doneButton];
    [v8 setTitle:v7];

    unsigned int v9 = [(RCRecordingView *)self doneButton];
    uint64_t v10 = [(RCRecordingView *)self doneButton];
    [v10 calculatedWidth];
    [v9 constrainWidth:];

    objc_super v11 = [(RCRecordingView *)self doneButton];
    v12 = [(RCRecordingView *)self doneButton];
    [v12 buttonHeight];
    [v11 constrainHeight:];

    if (v3 || self->_recordingViewState != 8)
    {
      v19 = [(RCRecordingView *)self doneButton];
      [v19 setEnabled:1 isHidden:0 userInteractionEnabled:1];
    }
    else
    {
      uint64_t v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"APPLY" value:&stru_100228BC8 table:0];
      id v15 = [(RCRecordingView *)self doneButton];
      [v15 setTitle:v14];

      id v16 = [(RCRecordingView *)self doneButton];
      [v16 setEnabled:0 isHidden:0 userInteractionEnabled:0];

      [(RCRecordingView *)self setShouldSaveAsNew:0];
    }
    uint64_t v20 = [(RCRecordingView *)self doneButton];
  }
  else
  {
    uint64_t v17 = [(RCRecordingView *)self doneButton];
    [v17 setHidden:1];

    v18 = [(RCRecordingView *)self doneEditingButton];
    [v18 setEnabledState:!v3];

    uint64_t v20 = [(RCRecordingView *)self doneEditingButton];
  }
  long long v21 = (void *)v20;
  [(RCRecordingView *)self assignActionOnDoneButton:v20];

  unsigned int v22 = [(RCRecordingView *)self _doingSomeKindOfCapture];
  unsigned int v23 = [v28 supportsCompactRecordingCard];
  if ((id)[(RCRecordingView *)self displayStyle] == (id)2 && v23)
  {
    v24 = [(RCRecordingView *)self doneEditingButton];
    [v24 setEnabledState:v22];
  }
  int64_t v25 = [(RCRecordingView *)self displayStyle];
  int v26 = v22 ^ 1;
  if (v25 != 2) {
    int v26 = 1;
  }
  if ((v26 | v23 ^ 1) != 1 || (id)[(RCRecordingView *)self displayStyle] == (id)1)
  {
    v27 = [(RCRecordingView *)self doneEditingButton];
    [v27 setEnabledState:2];
  }
}

- (RCTouchInsetsButton)doneEditingButton
{
  return self->_doneEditingButton;
}

- (void)_setupMoreActionsButton
{
  id v10 = [(RCRecordingView *)self moreActionsButton];
  if (!v10)
  {
    id v10 = +[UIButton buttonWithType:1];
    BOOL v3 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned __int8 v4 = [v3 editingToolbarImageSymbolConfiguration];
    uint64_t v5 = [v3 ellipsisCircleImage];
    unsigned int v6 = [v5 imageWithConfiguration:v4];

    [v10 setImage:v6 forState:0];
    unsigned int v7 = [v3 editingToolbarMaximumContentSizeCategory];
    [v10 setMaximumContentSizeCategory:v7];

    id v8 = +[NSBundle mainBundle];
    unsigned int v9 = [v8 localizedStringForKey:@"MORE_ACTIONS" value:&stru_100228BC8 table:0];

    [v10 setAccessibilityLabel:v9];
    [v10 setLargeContentTitle:v9];
    [(RCRecordingView *)self setMoreActionsButton:v10];
  }
  [(RCRecordingView *)self _updateMoreButtonMenu];
}

- (void)reset
{
  [(RCRecordingView *)self _classSpecificReset];
  [(RCRecordingView *)self setRecordingViewState:0];
  [(RCRecordingView *)self setPlayControlState:0];
  [(RCRecordingView *)self setCenterContentViewState:0];
  [(RCRecordingView *)self setCurrentTime:0.0];
  BOOL v3 = [(RCRecordingView *)self currentTimeLabel];
  [v3 setText:&stru_100228BC8];

  unsigned __int8 v4 = [(RCRecordingView *)self editingToolbar];
  [v4 setCanUndo:0];

  [(RCRecordingView *)self setShouldSaveAsNew:0];
  uint64_t v5 = [(RCRecordingView *)self doneButton];
  [v5 setHidden:1];

  unsigned int v6 = [(RCRecordingView *)self currentTimeLabel];
  [v6 setIsAccessibilityElement:0];

  [(RCRecordingView *)self setEditingInFlight:0];
  unsigned int v7 = [(RCRecordingView *)self progressOverlay];
  [v7 setProgress:0.0];

  if ([(RCRecordingView *)self textFieldIsBeingEdited])
  {
    id v8 = [(RCRecordingView *)self descriptionView];
    [v8 endEditingTitle];
  }
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  -[RCRecordingView _updateCurrentTimeLabelForTime:](self, "_updateCurrentTimeLabelForTime:");
  BOOL v5 = [(RCRecordingView *)self recordingViewState] != 0;
  unsigned int v6 = [(RCRecordingView *)self currentTimeLabel];
  [v6 setIsAccessibilityElement:v5];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"CURRENT_POSITION" value:&stru_100228BC8 table:0];
  unsigned int v9 = [(RCRecordingView *)self currentTimeLabel];
  [v9 setAccessibilityLabel:v8];

  id v10 = UIAXTimeStringForDuration();
  objc_super v11 = [(RCRecordingView *)self currentTimeLabel];
  [v11 setAccessibilityValue:v10];

  [(RCRecordingView *)self updateRecordButtonViewStateWithCurrentTime:a3];
}

- (RCTimeLabel)currentTimeLabel
{
  return self->_currentTimeLabel;
}

- (void)_showHideViewsForDisplayOptions:(unint64_t)a3
{
  __int16 v3 = a3;
  BOOL v5 = (a3 & 1) == 0;
  unsigned int v6 = [(RCRecordingView *)self topFullScreenSpacerView];
  [v6 setHidden:v5];

  unsigned int v7 = [(RCRecordingView *)self centerContentContainerView];
  [v7 setHidden:(v3 & 2) == 0];

  id v8 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  [v8 setHidden:(v3 & 4) == 0];

  unsigned int v9 = [(RCRecordingView *)self currentTimeLabel];
  [v9 setHidden:(v3 & 8) == 0];

  id v10 = [(RCRecordingView *)self editingToolbar];
  [v10 setHidden:(v3 & 0x40) == 0];

  objc_super v11 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
  [v11 setHidden:(v3 & 0x10) == 0];

  v12 = [(RCRecordingView *)self shuttleBar];
  [v12 setHidden:(v3 & 0x20) == 0];

  uint64_t v13 = [(RCRecordingView *)self bottomControlsContainerView];
  [v13 setHidden:(v3 & 0x80) == 0];

  v14 = [(RCRecordingView *)self bottomFillerView];
  [v14 setHidden:(v3 & 0x100) == 0];

  id v15 = [(RCRecordingView *)self mainContainerStackView];
  [v15 invalidateIntrinsicContentSize];

  [(RCRecordingView *)self invalidateIntrinsicContentSize];

  [(RCRecordingView *)self setNeedsDisplay];
}

- (void)_alignRecordingControlToCenter
{
  __int16 v3 = [(RCRecordingView *)self doneButton];
  [v3 setHidden:1];

  unsigned __int8 v4 = [(RCRecordingView *)self cancelButton];
  [v4 setHidden:1];

  BOOL v5 = [(RCRecordingView *)self recordButtonCenterXToLeadingConstraint];
  [v5 setActive:0];

  id v6 = [(RCRecordingView *)self recordButtonCenterXToViewCenterXConstraint];
  [v6 setActive:1];
}

- (NSLayoutConstraint)recordButtonCenterXToViewCenterXConstraint
{
  return self->_recordButtonCenterXToViewCenterXConstraint;
}

- (NSLayoutConstraint)recordButtonCenterXToLeadingConstraint
{
  return self->_recordButtonCenterXToLeadingConstraint;
}

- (_TtC10VoiceMemos12RCDoneButton)doneButton
{
  return self->_doneButton;
}

- (void)updateAccessibilityForRecordingViewState:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v10 = [(RCRecordingView *)self doneButton];
      [v10 setIsAccessibilityElement:0];

      objc_super v11 = [(RCRecordingView *)self centerContentContainerView];
      [v11 setAccessibilityElementsHidden:1];

      v12 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
      [v12 setAccessibilityElementsHidden:1];

      uint64_t v13 = [(RCRecordingView *)self shuttleBar];
      [v13 setAccessibilityElementsHidden:1];

      v14 = +[RCRecorderStyleProvider sharedStyleProvider];
      unsigned int v15 = [v14 hostsTransportAndDoneButtonInBottomSection];

      if (!v15) {
        goto LABEL_10;
      }
      id v16 = self;
      uint64_t v17 = 0;
      goto LABEL_11;
    case 1:
      v18 = [(RCRecordingView *)self doneButton];
      [v18 setIsAccessibilityElement:1];

      v19 = [(RCRecordingView *)self descriptionView];
      [v19 addTitleAccessibilityTraits:UIAccessibilityTraitStaticText];
      goto LABEL_9;
    case 2:
      unsigned int v9 = [(RCRecordingView *)self doneButton];
      [v9 setIsAccessibilityElement:1];

      [(RCRecordingView *)self setAccessibilityIgnoresInvertColors:0];
      id v8 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
      [v8 setAccessibilityElementsHidden:0];
      goto LABEL_3;
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      unsigned __int8 v4 = [(RCRecordingView *)self descriptionView];
      [v4 removeTitleAccessibilityTraits:UIAccessibilityTraitStaticText];

      BOOL v5 = [(RCRecordingView *)self centerContentContainerView];
      [v5 setAccessibilityElementsHidden:0];

      id v6 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
      [v6 setAccessibilityElementsHidden:0];

      unsigned int v7 = [(RCRecordingView *)self shuttleBar];
      [v7 setAccessibilityElementsHidden:0];

      [(RCRecordingView *)self setAccessibilityIgnoresInvertColors:1];
      id v8 = [(RCRecordingView *)self doneButton];
      [v8 setIsAccessibilityElement:1];
LABEL_3:

      break;
    case 8:
      v19 = [(RCRecordingView *)self doneButton];
      [v19 setIsAccessibilityElement:1];
LABEL_9:

      uint64_t v20 = [(RCRecordingView *)self centerContentContainerView];
      [v20 setAccessibilityElementsHidden:0];

      long long v21 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
      [v21 setAccessibilityElementsHidden:0];

      unsigned int v22 = [(RCRecordingView *)self shuttleBar];
      [v22 setAccessibilityElementsHidden:0];

LABEL_10:
      id v16 = self;
      uint64_t v17 = 1;
LABEL_11:
      [(RCRecordingView *)v16 setAccessibilityIgnoresInvertColors:v17];
      break;
    default:
      break;
  }
  id v25 = [(RCRecordingView *)self cancelButton];
  uint64_t v23 = [v25 isHidden] ^ 1;
  v24 = [(RCRecordingView *)self cancelButton];
  [v24 setIsAccessibilityElement:v23];
}

- (RCRecordingControl)cancelButton
{
  return self->_cancelButton;
}

- (void)_setupPlaybackSettingsButton
{
  id v12 = [(RCRecordingView *)self playbackSettingsButton];
  __int16 v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (!v12)
  {
    id v12 = +[RCToggleButton playbackSettingsButton];
    unsigned __int8 v4 = [v3 editingToolbarImageSymbolConfiguration];
    [v12 setImageSymbolConfiguration:v4];

    BOOL v5 = [v12 widthAnchor];
    [v3 editRecordingViewImageSize];
    id v6 = [v5 constraintEqualToConstant:];
    [v6 setActive:1];

    unsigned int v7 = [v3 editingToolbarMaximumContentSizeCategory];
    [v12 setMaximumContentSizeCategory:v7];

    [v12 setIsToggled:[self hasCustomizedPlaybackSettings]];
    [(RCRecordingView *)self setPlaybackSettingsButton:v12];
  }
  [(RCRecordingView *)self setClipsToBounds:0];
  [v3 playbackSettingsButtonExtraActivePoints];
  double v9 = -v8;
  id v10 = [(RCRecordingView *)self playbackSettingsButton];
  [v10 _setTouchInsets:v9, v9, v9, v9];

  objc_super v11 = [(RCRecordingView *)self playbackSettingsButton];
  [v11 addTarget:self action:"_displayPlaybackSettings" forControlEvents:64];
}

- (void)_setupButtonsAndDescriptionContainerView
{
  id v53 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v53 editRecordingViewLeadingAndTrailingImagePadding];
  double v4 = v3;
  [v53 paddingBetweenButtonsAndDescriptionView];
  double v6 = v5;
  unsigned int v7 = objc_opt_new();
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [(RCRecordingView *)self descriptionView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v9 = [(RCRecordingView *)self descriptionView];
  [v7 addSubview:v9];

  id v10 = [(RCRecordingView *)self descriptionView];
  objc_super v11 = [v10 topAnchor];
  id v12 = [v7 topAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [(RCRecordingView *)self descriptionView];
  unsigned int v15 = [v14 bottomAnchor];
  id v16 = [v7 bottomAnchor];
  uint64_t v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [(RCRecordingView *)self descriptionView];
  v19 = [v18 centerXAnchor];
  uint64_t v20 = [v7 centerXAnchor];
  long long v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  unsigned int v22 = [(RCRecordingView *)self playbackSettingsButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v23 = [(RCRecordingView *)self playbackSettingsButton];
  [v7 addSubview:v23];

  v24 = [(RCRecordingView *)self playbackSettingsButton];
  id v25 = [v24 leadingAnchor];
  int v26 = [v7 leadingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26 constant:v4];
  [v27 setActive:1];

  id v28 = [(RCRecordingView *)self descriptionView];
  v29 = [v28 leadingAnchor];
  v30 = [(RCRecordingView *)self playbackSettingsButton];
  v31 = [v30 trailingAnchor];
  v32 = [v29 constraintGreaterThanOrEqualToAnchor:v31 constant:v6];
  [v32 setActive:1];

  v33 = [(RCRecordingView *)self playbackSettingsButton];
  v34 = [v33 centerYAnchor];
  v35 = [(RCRecordingView *)self descriptionView];
  v36 = [v35 centerYAnchor];
  v37 = [v34 constraintEqualToAnchor:v36];
  [v37 setActive:1];

  v38 = [(RCRecordingView *)self playbackSettingsButton];
  LODWORD(v39) = 1148846080;
  [v38 setContentCompressionResistancePriority:0 forAxis:v39];

  v40 = [(RCRecordingView *)self moreActionsButton];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 addSubview:v40];
  v41 = [v40 trailingAnchor];
  v42 = [v7 trailingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42 constant:-v4];
  [v43 setActive:1];

  v44 = [v40 leadingAnchor];
  v45 = [(RCRecordingView *)self descriptionView];
  v46 = [v45 trailingAnchor];
  v47 = [v44 constraintGreaterThanOrEqualToAnchor:v46 constant:v6];
  [v47 setActive:1];

  v48 = [v40 centerYAnchor];
  v49 = [(RCRecordingView *)self descriptionView];
  v50 = [v49 centerYAnchor];
  v51 = [v48 constraintEqualToAnchor:v50];
  [v51 setActive:1];

  LODWORD(v52) = 1148846080;
  [v40 setContentCompressionResistancePriority:0 forAxis:v52];
  [(RCRecordingView *)self setButtonsAndDescriptionContainerView:v7];
}

- (RCRecordingDescriptionView)descriptionView
{
  return self->_descriptionView;
}

- (RCToggleButton)playbackSettingsButton
{
  return self->_playbackSettingsButton;
}

- (void)assignActionOnDoneButton:(id)a3
{
  id v8 = a3;
  -[RCRecordingView resetDoneButtonSaveAction:](self, "resetDoneButtonSaveAction:");
  if (!RCSaveAsNewFeatureFlagIsEnabled()) {
    goto LABEL_7;
  }
  if (![(RCRecordingView *)self shouldSaveAsNew])
  {
    [v8 setShowsMenuAsPrimaryAction:0];
LABEL_7:
    [(RCRecordingView *)self setSaveRecordingAction:v8];
    goto LABEL_8;
  }
  double v4 = [(RCRecordingView *)self viewDelegate];
  unsigned int v5 = [v4 isRecording];

  id v6 = v8;
  if (v5)
  {
    [v8 addTarget:self action:"doneButtonMenuActionTriggered:" forControlEvents:0x4000];
    id v6 = v8;
  }
  unsigned int v7 = [(RCRecordingView *)self saveMenuForDoneButton:v6];
  [v8 setMenu:v7];

  [v8 setShowsMenuAsPrimaryAction:1];
LABEL_8:
}

- (BOOL)shouldSaveAsNew
{
  return self->_shouldSaveAsNew;
}

- (void)setSaveRecordingAction:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self saveRecordingAction:v4];
  [v4 addAction:v5 forControlEvents:64];
}

- (id)saveRecordingAction:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"SAVE RECORDING" value:&stru_100228BC8 table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100097AA0;
  v10[3] = &unk_100222C48;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];

  return v8;
}

- (void)resetDoneButtonSaveAction:(id)a3
{
}

- (void)_updateMoreButtonMenu
{
  double v3 = [(RCRecordingView *)self moreActionsButton];

  if (v3)
  {
    id v4 = +[TranscriptionAvailabilityProvider shared];
    unsigned int v5 = [v4 deviceIsSupported];

    if (v5) {
      BOOL v6 = [(RCRecordingView *)self hasTranscription];
    }
    else {
      BOOL v6 = 0;
    }
    BOOL v7 = (id)[(RCRecordingView *)self centerContentViewState] == (id)1;
    id v8 = [_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator alloc];
    double v9 = [(RCRecordingView *)self descriptionView];
    id v10 = [v9 UUID];
    id v11 = [(RCRecordingCardMoreButtonMenuCreator *)v8 initWithRecordingUUID:v10 actionDelegate:self];
    [(RCRecordingView *)self setMoreButtonMenuCreator:v11];

    id v12 = [(RCRecordingView *)self moreButtonMenuCreator];
    BOOL v13 = [(RCRecordingView *)self hasMultipleTracks];
    v14 = [(RCRecordingView *)self editingToolbar];
    unsigned int v15 = [v12 createMenuWithDisplayCopyTranscriptAction:v6 hideTrimItem:v7 hasMultipleTracks:v13 showUndoItem:[v14 canUndo]];
    id v16 = [(RCRecordingView *)self moreActionsButton];
    [v16 setMenu:v15];

    id v17 = [(RCRecordingView *)self moreActionsButton];
    [v17 setShowsMenuAsPrimaryAction:1];
  }
}

- (UIButton)moreActionsButton
{
  return self->_moreActionsButton;
}

- (void)setMoreButtonMenuCreator:(id)a3
{
}

- (_TtC10VoiceMemos36RCRecordingCardMoreButtonMenuCreator)moreButtonMenuCreator
{
  return self->_moreButtonMenuCreator;
}

- (BOOL)hasMultipleTracks
{
  return self->_hasMultipleTracks;
}

- (int64_t)centerContentViewState
{
  return self->_centerContentViewState;
}

- (void)setRecordingViewState:(int64_t)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a4;
  int64_t recordingViewState = self->_recordingViewState;
  if (!a5 && recordingViewState == a3) {
    return;
  }
  unsigned int v9 = +[CATransaction disableActions];
  +[CATransaction begin];
  +[CATransaction setDisableActions:v9 | !v5];
  self->_int64_t recordingViewState = a3;
  id v10 = [(RCRecordingView *)self recordButton];
  [v10 setHidden:0];

  [(RCRecordingView *)self _showTrimDeleteSelectionButtonsIfNeeded:0];
  [(RCRecordingView *)self _updateShuttleBarEnablement];
  id v36 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v11 = [v36 hostsTransportAndDoneButtonInBottomSection];
  [(RCRecordingView *)self _syncTapGestureRecognizerEnablement];
  unsigned __int8 v12 = [(RCRecordingView *)self _doingSomeKindOfCapture];
  if ((unint64_t)(a3 - 6) >= 0xFFFFFFFFFFFFFFFDLL && (v12 & 1) == 0 && (v11 & 1) == 0)
  {
    BOOL v13 = [(RCRecordingView *)self doneEditingButton];
    [v13 setDoneButtonEnabledState:0];
  }
  switch(a3)
  {
    case 0:
    case 2:
      [(RCRecordingView *)self _updateToolbarsActivityMode:0];
      [(RCRecordingView *)self setShowsDoneButton:1];
      uint64_t v20 = [(RCRecordingView *)self cancelButton];
      [v20 setHidden:1];

      [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:1];
      v19 = [(RCRecordingView *)self shuttleBar];
      [v19 setEditMode:0];
      goto LABEL_18;
    case 1:
      [(RCRecordingView *)self _updateToolbarsActivityMode:1];
      if ([(RCRecordingView *)self shouldEnableDoneButtonWhileRecording]) {
        goto LABEL_9;
      }
      if (([v36 hostsTransportAndDoneButtonInBottomSection] & 1) == 0)
      {
        long long v21 = [(RCRecordingView *)self doneEditingButton];
        [v21 setEnabledState:1];
      }
      goto LABEL_10;
    case 3:
    case 4:
    case 5:
      [(RCRecordingView *)self _updateToolbarsActivityMode:2];
LABEL_9:
      [(RCRecordingView *)self setShowsDoneButton:1];
LABEL_10:
      v14 = [(RCRecordingView *)self cancelButton];
      [v14 setHidden:1];

      unsigned int v15 = [(RCRecordingView *)self shuttleBar];
      [v15 setEditMode:0];

      [(RCRecordingView *)self updateMoreActionsAndPlaybackSettingButtonVisibility];
      break;
    case 6:
    case 7:
      [(RCRecordingView *)self setShowsDoneButton:1];
      id v16 = [(RCRecordingView *)self cancelButton];
      [v16 setHidden:1];

      id v17 = [(RCRecordingView *)self editingToolbar];
      [v17 setActivityMode:1];

      v18 = [(RCRecordingView *)self moreActionsButton];
      [v18 setEnabled:0];

      v19 = [(RCRecordingView *)self playbackSettingsButton];
      [v19 rc_setEnabled:0];
      goto LABEL_18;
    case 8:
      [(RCRecordingView *)self _updateToolbarsActivityMode:4];
      unsigned int v22 = [(RCRecordingView *)self editingToolbar];
      -[RCRecordingView setShowsDoneButton:](self, "setShowsDoneButton:", [v22 canSave]);

      uint64_t v23 = [(RCRecordingView *)self cancelButton];
      [v23 setHidden:0];

      v24 = [(RCRecordingView *)self shuttleBar];
      [v24 setEditMode:1];

      id v25 = [(RCRecordingView *)self recordButton];
      [v25 setHidden:1];

      [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:1];
      [(RCRecordingView *)self _showTrimDeleteSelectionButtonsIfNeeded:1];
      v19 = +[NSBundle mainBundle];
      int v26 = [v19 localizedStringForKey:@"APPLY" value:&stru_100228BC8 table:0];
      v27 = [(RCRecordingView *)self doneButton];
      [v27 setTitle:v26];

LABEL_18:
      break;
    default:
      [(RCRecordingView *)self setShowsDoneButton:0];
      break;
  }
  [(RCRecordingView *)self _updateRecordButtonStateForRecordingViewState:a3];
  [(RCRecordingView *)self updateAccessibilityForRecordingViewState:a3];
  [(RCRecordingView *)self setNeedsLayout];
  [(RCRecordingView *)self _syncViewsToState];
  +[CATransaction commit];
  id v28 = [(RCRecordingView *)self recordButton];
  unsigned int v29 = [v28 isHidden];

  if (v29)
  {
    if (a3 != 8
      || ([(RCRecordingView *)self doneButton],
          v30 = objc_claimAutoreleasedReturnValue(),
          unsigned int v31 = [v30 isEnabled],
          v30,
          !v31))
    {
      UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self);
      goto LABEL_26;
    }
    UIAccessibilityNotifications v32 = UIAccessibilityScreenChangedNotification;
    v33 = [(RCRecordingView *)self doneButton];
  }
  else
  {
    UIAccessibilityNotifications v32 = UIAccessibilityScreenChangedNotification;
    v33 = [(RCRecordingView *)self recordButton];
  }
  v34 = v33;
  UIAccessibilityPostNotification(v32, v33);

LABEL_26:
  if (recordingViewState != a3)
  {
    v35 = [(RCRecordingView *)self viewDelegate];
    [v35 didUpdateRecordingViewState];
  }
}

- (void)_classSpecificInit
{
  double v3 = +[TranscriptionAvailabilityProvider shared];
  [v3 registerObserver:self];

  [(RCRecordingView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RCRecordingView *)self _assignIVarsFromStyleProvider];
  id v4 = objc_opt_new();
  [(RCRecordingView *)self setTopFullScreenSpacerView:v4];
  [v4 setIntrinsicHeight:self->_topScreenSpacerHeight];
  v72 = v4;
  [v4 setUsesIntrinsicHeightSetting:1];
  v71 = objc_opt_new();
  -[RCRecordingView setTopCardSpacerView:](self, "setTopCardSpacerView:");
  BOOL v5 = [(RCRecordingView *)self topCardSpacerView];
  LODWORD(v6) = 1132068864;
  [v5 setContentHuggingPriority:1 forAxis:v6];

  BOOL v7 = [(RCRecordingView *)self topCardSpacerView];
  LODWORD(v8) = 1132068864;
  [v7 setContentCompressionResistancePriority:1 forAxis:v8];

  [(RCRecordingView *)self _setupPlaybackSettingsButton];
  [(RCRecordingView *)self _setupMoreActionsButton];
  unsigned int v9 = +[RCRecordingDescriptionView descriptionViewWithStyle:0];
  [(RCRecordingView *)self setDescriptionView:v9];
  [v9 setRecordingDescriptionViewDelegate:self];
  v70 = v9;
  [v9 setIntrinsicHeight:self->_bottomAccessoryDescriptionHeight];
  [(RCRecordingView *)self _setupButtonsAndDescriptionContainerView];
  id v10 = [[RCEditingToolbar alloc] initWithInternalConstructionDelayedUntilUnhidden];
  [(RCRecordingView *)self setEditingToolbar:v10];
  [(RCEditingToolbar *)v10 setControlsActionDelegate:self];
  [(SettableIntrinsicSizeView *)v10 setIntrinsicHeight:self->_editingToolbarHeight];
  [(SettableIntrinsicSizeView *)v10 setUsesIntrinsicHeightSetting:1];
  v69 = v10;
  LODWORD(v11) = 1148846080;
  [(RCEditingToolbar *)v10 setContentCompressionResistancePriority:1 forAxis:v11];
  unsigned __int8 v12 = +[RCRecorderStyleProvider sharedStyleProvider];
  BOOL v13 = objc_alloc_init(SettableIntrinsicSizeView);
  [(RCRecordingView *)self setCenterContentContainerView:v13];
  [(SettableIntrinsicSizeView *)v13 setIntrinsicHeight:self->_bottomAccessoryContentContainerHeight];
  [(SettableIntrinsicSizeView *)v13 setUsesIntrinsicHeightSetting:1];
  [(RCRecordingView *)self centerContentVerticalHuggingPriority];
  v68 = v13;
  -[SettableIntrinsicSizeView setContentHuggingPriority:forAxis:](v13, "setContentHuggingPriority:forAxis:", 1);
  v14 = objc_opt_new();
  [(RCRecordingView *)self setFixedOverviewWaveformContainerView:v14];
  [v14 setIntrinsicHeight:self->_fixedOverviewWaveformHeight];
  [v14 setUsesIntrinsicHeightSetting:1];
  v67 = v14;
  LODWORD(v15) = 1148846080;
  [v14 setContentCompressionResistancePriority:1 forAxis:v15];
  id v16 = objc_opt_new();
  [(RCRecordingView *)self setTrimOverviewWaveformContainerView:v16];
  [v16 setIntrinsicHeight:self->_recordingControlSectionHeight];
  v66 = v16;
  [v16 setUsesIntrinsicHeightSetting:1];
  id v17 = objc_opt_new();
  [(RCRecordingView *)self setCurrentTimeLabel:v17];
  [v17 setIntrinsicHeight:self->_currentTimeReadoutHeight];
  [v17 setUsesIntrinsicHeightSetting:1];
  [v17 setTextAlignment:1];
  v65 = v17;
  LODWORD(v18) = 1148846080;
  [v17 setContentCompressionResistancePriority:1 forAxis:v18];
  v19 = objc_opt_new();
  [(RCRecordingView *)self setBottomControlsContainerView:v19];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 addLeadingToLeadingConstraintWithView:self padding:0.0];
  [v19 addTrailingToTrailingConstraintWithView:self padding:0.0];
  [v19 addBottomToBottomConstraintWithView:self padding:0.0];
  [v19 setIntrinsicHeight:self->_recordingControlSectionHeight];
  [v19 setUsesIntrinsicHeightSetting:1];
  id v20 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  [v19 addInteraction:v20];

  LODWORD(v21) = 1148846080;
  [v19 setContentCompressionResistancePriority:1 forAxis:v21];
  unsigned int v22 = +[RCToggleButton transcriptionButton];
  [v19 addSubview:v22];
  [v12 transcriptionButtonSidePadding];
  [v22 alignCenterLeadingToCenterLeadingOfView:v19];
  [v22 addTarget:self action:"toggleTranscriptView:" forControlEvents:64];
  uint64_t v23 = [v12 editingToolbarImageSymbolConfiguration];
  [v22 setImageSymbolConfiguration:v23];

  v24 = [v12 editingToolbarMaximumContentSizeCategory];
  [v22 setMaximumContentSizeCategory:v24];

  v64 = v22;
  [(RCRecordingView *)self setTranscriptionButton:v22];
  [(RCRecordingView *)self _updateTranscriptionButtonVisibility];
  id v25 = objc_alloc_init(_TtC10VoiceMemos24RCRecordButtonRepository);
  [(RCRecordingView *)self setRecordButtonRepository:v25];

  int v26 = [_TtC10VoiceMemos24RCRecordButtonAppFactory alloc];
  v27 = [(RCRecordingView *)self recordButtonRepository];
  id v28 = [(RCRecordButtonAppFactory *)v26 initWithRecordButtonRepository:v27 interactionHandler:self];
  [(RCRecordingView *)self setRecordButtonFactory:v28];

  unsigned int v29 = [(RCRecordingView *)self recordButtonFactory];
  v30 = [v29 createRecordButton];
  [(RCRecordingView *)self setRecordButton:v30];

  unsigned int v31 = [(RCRecordingView *)self recordButton];
  [v19 addSubview:v31];

  UIAccessibilityNotifications v32 = [(RCRecordingView *)self recordButton];
  [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

  v33 = [(RCRecordingView *)self recordButton];
  v34 = [v33 centerXAnchor];
  v35 = [v19 centerXAnchor];
  id v36 = [v34 constraintEqualToAnchor:v35];
  [(RCRecordingView *)self setRecordButtonCenterXToViewCenterXConstraint:v36];

  [(RCRecordingView *)self _alignRecordingControlToCenter];
  v37 = [(RCRecordingView *)self recordButton];
  v38 = [v37 centerXAnchor];
  double v39 = [v19 leadingAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [(RCRecordingView *)self setRecordButtonCenterXToLeadingConstraint:v40];

  v41 = [(RCRecordingView *)self recordButton];
  v42 = [v41 centerYAnchor];
  v43 = [v19 centerYAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  [(RCRecordingView *)self setRecordButtonCenterYConstraint:v44];

  v45 = v12;
  uint64_t v46 = [v12 editingToolbarButtonTextColor];
  uint64_t v47 = [v12 editingToolbarSaveButtonLabelFont];
  v48 = objc_opt_new();
  LODWORD(v49) = 1148846080;
  [v48 setContentCompressionResistancePriority:0 forAxis:v49];
  [v19 addSubview:v48];
  [v45 doneEditingButtonSidePadding];
  [v48 alignCenterTrailingToCenterTrailingOfView:v19 padding:-v50];
  v51 = +[NSBundle mainBundle];
  double v52 = [v51 localizedStringForKey:@"DONE" value:&stru_100228BC8 table:0];

  [v48 setAccessibilityLabel:v52];
  [v48 setTitle:v52 forState:0];
  v63 = (void *)v46;
  [v48 setTitleColor:v46 forState:0];
  id v53 = [v48 titleLabel];
  v62 = (void *)v47;
  [v53 setFont:v47];

  [v48 setDoneButtonEnabledState:2];
  [(RCRecordingView *)self assignActionOnDoneButton:v48];
  [(RCRecordingView *)self setDoneEditingButton:v48];
  v54 = objc_opt_new();
  [v54 setUsesIntrinsicHeightSetting:1];
  [(RCRecordingView *)self setBottomFillerView:v54];
  v55 = [(RCRecordingView *)self transcriptionButton];
  v73[0] = v55;
  v56 = [(RCRecordingView *)self recordButton];
  v73[1] = v56;
  v57 = [(RCRecordingView *)self doneEditingButton];
  v73[2] = v57;
  v58 = +[NSArray arrayWithObjects:v73 count:3];
  [v19 setAccessibilityElements:v58];

  v59 = objc_opt_new();
  [(RCRecordingView *)self setMainContainerStackView:v59];
  [v59 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v59 setAxis:1];
  [v59 setDistribution:0];
  [v59 setAlignment:0];
  if ([v45 showsRecordingViewInFullScreen])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v59 setLayoutMarginsRelativeArrangement:1];
    }
  }
  [(RCRecordingView *)self addSubview:v59];
  [v59 constrainSizeAndAlignCenterToCenterOfView:self];
  [(RCRecordingView *)self _styleView];
  v60 = [(RCRecordingView *)self recordButtonCenterYConstraint];
  [(RCRecordingView *)self addConstraint:v60];

  [(RCRecordingView *)self setRecordingViewState:0 animated:0 force:1];
  v61 = +[NSNotificationCenter defaultCenter];
  [v61 addObserver:self selector:"didChangePreferredContentSize" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (UIView)recordButton
{
  return self->_recordButton;
}

- (void)_updateTranscriptionButtonVisibility
{
  double v3 = +[TranscriptionAvailabilityProvider shared];
  unsigned int v4 = [v3 deviceIsSupported];

  BOOL v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v6 = [v5 hostsTranscriptionButtonInToolbar];

  BOOL v7 = 1;
  if (v4 && (v6 & 1) == 0) {
    BOOL v7 = (id)[(RCRecordingView *)self displayStyle] != (id)3;
  }
  id v8 = [(RCRecordingView *)self transcriptionButton];
  [v8 setHidden:v7];
}

- (RCToggleButton)transcriptionButton
{
  return self->_transcriptionButton;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingView;
  [(RCRecordingView *)&v9 layoutSubviews];
  uint64_t v3 = [(RCRecordingView *)self window];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    unsigned __int8 v5 = [(RCRecordingView *)self isSyncingViewsToState];

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v6 = [(RCRecordingView *)self cardPresentationDelegate];
      [(RCRecordingView *)self bounds];
      [v6 recordingView:self didUpdateViewHeight:v7];
    }
  }
  [(RCRecordingView *)self _classSpecificLayout];
  id v8 = [(RCRecordingView *)self bottomControlsContainerView];
  [v8 layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  if ([(RCRecordingView *)self displayStyle])
  {
    uint64_t v3 = [(RCRecordingView *)self mainContainerStackView];
    unsigned int v4 = [v3 arrangedSubviews];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      double v9 = 0.0;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          double v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isHidden", (void)v16) & 1) == 0)
          {
            [v11 intrinsicHeight];
            double v9 = v9 + v12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }

    CGFloat v13 = UIViewNoIntrinsicMetric;
  }
  else
  {
    CGFloat v13 = UIViewNoIntrinsicMetric;
    double v9 = 0.0;
  }
  double v14 = v13;
  double v15 = v9;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (int64_t)displayStyle
{
  return self->_displayStyle;
}

- (UIStackView)mainContainerStackView
{
  return self->_mainContainerStackView;
}

- (void)_classSpecificLayout
{
  uint64_t v3 = +[UIApplication sharedApplication];
  unsigned int v4 = [v3 delegate];
  id v5 = [v4 window];
  [v5 safeAreaInsets];
  double v7 = v6 + 0.0;

  uint64_t v8 = [(RCRecordingView *)self bottomFillerView];
  [v8 intrinsicHeight];
  double v10 = v9;

  if (v10 != v7)
  {
    double v11 = [(RCRecordingView *)self bottomFillerView];
    [v11 setIntrinsicHeight:v7];

    [(RCRecordingView *)self invalidateIntrinsicContentSize];
  }
}

- (SettableIntrinsicSizeView)bottomFillerView
{
  return self->_bottomFillerView;
}

- (void)_assignIVarsFromStyleProvider
{
  id v17 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v17 topScreenSpacerHeight];
  self->_topScreenSpacerHeight = v3;
  [v17 bottomAccessoryContentContainerHeight];
  self->_bottomAccessoryContentContainerHeight = v4;
  [v17 bottomAccessoryDescriptionHeight];
  self->_bottomAccessoryDescriptionHeight = v5;
  [v17 fullScreenDescriptionHeight];
  self->_fullScreenDescriptionHeight = v6;
  [v17 editToolbarHeight];
  self->_editingToolbarHeight = v7;
  [v17 editToolbarCompactHeight];
  self->_editingToolbarCompactHeight = v8;
  [v17 positionReadoutHeight];
  self->_currentTimeReadoutHeight = v9;
  [v17 shuttleBarHeight];
  self->_shuttleBarHeight = v10;
  [v17 overviewWaveformHeight];
  double v12 = v11;
  [v17 recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview];
  double v14 = v12 + v13;
  [v17 recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview];
  self->_fixedOverviewWaveformHeight = v14 + v15;
  [v17 recordingControlSectionHeight];
  self->_recordingControlSectionHeight = v16;
}

- (void)_styleView
{
  [(RCRecordingView *)self _assignIVarsFromStyleProvider];
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCRecordingView *)self _adjustTraitOverridesForDisplayStyle:[(RCRecordingView *)self displayStyle]];
  [(RCRecordingView *)self _adjustBackgroundColorForDisplayStyle:[(RCRecordingView *)self displayStyle]];
  v125 = [(RCRecordingView *)self tapGestureRecognizer];
  if ([v3 allowsInteractiveCardSizing])
  {
    if (!v125)
    {
      id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleTapToFullscreen:"];
      [(RCRecordingView *)self setTapGestureRecognizer:v4];
      v125 = v4;
      [(RCRecordingView *)self addGestureRecognizer:v4];
    }
    [v125 setEnabled:1];
    [v125 setDelegate:self];
  }
  else
  {
    [v125 setEnabled:0];
  }
  unsigned int v5 = [v3 hasBeginAndEndTimeLabelAtOverviewWaveform];
  double v6 = [(RCRecordingView *)self overviewBeginTimeLabel];
  double v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      double v7 = objc_opt_new();
      [(RCRecordingView *)self setOverviewBeginTimeLabel:v7];
    }
    double v8 = [v3 beginEndLabelsColor];
    [v7 setTextColor:v8];

    [v7 setTextAlignment:4];
    [v7 setNumberOfLines:0];
    double v9 = [v3 beginEndLabelsFont];
    [v7 setFont:v9];

    double v10 = [(RCRecordingView *)self overviewEndTimeLabel];
    if (!v10)
    {
      double v10 = objc_opt_new();
      [(RCRecordingView *)self setOverviewEndTimeLabel:v10];
    }
    double v11 = [v3 beginEndLabelsColor];
    [v10 setTextColor:v11];

    [v10 setTextAlignment:4];
    [v10 setNumberOfLines:0];
    double v12 = [v3 timeLineLabelFont];
    [v10 setFont:v12];
  }
  else
  {
    [v6 removeAllConstraints];

    double v7 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v7 removeAllConstraints];
  }

  double v13 = [(RCRecordingView *)self currentTimeLabel];
  double v14 = [(RCRecordingView *)self _backgroundColorAnimation];
  v123 = v14;
  if (v14)
  {
    [v14 duration];
    double v16 = v15;
    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472;
    v134[2] = sub_100095468;
    v134[3] = &unk_100221278;
    id v135 = v13;
    +[UIView transitionWithView:v135 duration:5242880 options:v134 animations:0 completion:v16];
  }
  else
  {
    id v17 = [v3 playbackCardTimeLabelFontColor];
    [v13 setTextColor:v17];
  }
  long long v18 = [v3 playbackViewTimeLabelFont];
  [v13 setFont:v18];

  [v3 positionReadoutLabelYOffset];
  [v13 setLabelYOffset:];
  long long v19 = [(RCRecordingView *)self shuttleBar];
  [v19 setStyle:2];
  id v20 = [v3 transportControlsColorForRecordingCard];
  [v19 setControlsColor:v20];

  double v21 = [v3 transportButtonAnimationCircleColor];
  [v19 setControlsAnimationColor:v21];

  [(RCRecordingView *)self _shuttleBarWidth];
  [v19 setCenterClusterWidthCard];
  [v19 invalidateIntrinsicContentSize];
  uint64_t v22 = [v3 editingToolbarButtonTextColor];
  uint64_t v23 = [v3 editingToolbarSaveButtonLabelFont];
  v24 = [(RCRecordingView *)self doneEditingButton];
  v122 = (void *)v22;
  [v24 setTitleColor:v22 forState:0];
  id v25 = [(RCRecordingView *)self bottomControlsContainerView];
  [v3 doneEditingButtonSidePadding];
  [v24 alignCenterTrailingToCenterTrailingOfView:v25 padding:-v26];

  v120 = v24;
  v27 = [v24 titleLabel];
  v121 = (void *)v23;
  [v27 setFont:v23];

  id v28 = [(RCRecordingView *)self editingToolbar];
  unsigned int v29 = [(RCRecordingView *)self bottomControlsContainerView];
  v30 = objc_opt_new();
  if ([v3 presentsTitleAndAdditionalEditingControlsInRecordingCard])
  {
    [v30 addObject:v28];
    [v28 restyle];
  }
  else
  {
    unsigned int v31 = [(RCRecordingView *)self topFullScreenSpacerView];
    [v30 addObject:v31];
  }
  UIAccessibilityNotifications v32 = [(RCRecordingView *)self topCardSpacerView];
  [v30 addObject:v32];

  v33 = [(RCRecordingView *)self topCardSpacerView];
  [v33 setHidden:1];

  v124 = v29;
  if ([v3 presentsTitleAndAdditionalEditingControlsInRecordingCard])
  {
    v141[0] = v28;
    v34 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];
    v141[1] = v34;
    v35 = +[NSArray arrayWithObjects:v141 count:2];
    [v30 addObjectsFromArray:v35];

    unsigned int v29 = v124;
  }
  v118 = [(RCRecordingView *)self centerContentContainerView];
  [v30 addObject:];
  if ([v3 shouldShowOverviewWaveform])
  {
    id v36 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
    [v30 addObject:v36];
  }
  v119 = v28;
  if (![v3 hostsTransportAndDoneButtonInBottomSection])
  {
    v80 = [(RCRecordingView *)self deleteSelectionButtonTrailingConstraint];
    [(RCRecordingView *)self removeConstraint:v80];

    [(RCRecordingView *)self setDeleteSelectionButtonTrailingConstraint:0];
    v81 = [(RCRecordingView *)self trimDeleteButtonLeftConstantConstraint];
    [(RCRecordingView *)self removeConstraint:v81];

    [(RCRecordingView *)self setTrimDeleteButtonLeftConstantConstraint:0];
    v82 = [(RCRecordingView *)self doneButton];
    [(RCRecordingView *)self _dropView:v82];
    [v82 removeFromSuperview];
    uint64_t v47 = [(RCRecordingView *)self shuttleBar];
    [(RCRecordingView *)self _dropView:v47];
    [v47 removeFromSuperview];
    v83 = [(RCRecordingView *)self trimToSelectionButton];
    [(RCRecordingView *)self _dropView:v83];
    [v83 removeFromSuperview];
    v54 = [(RCRecordingView *)self deleteSelectionButton];
    [(RCRecordingView *)self _dropView:v54];
    [v54 removeFromSuperview];
    [(RCRecordingView *)self setAccessibilityElements:0];
LABEL_39:

    goto LABEL_40;
  }
  if (v19)
  {
    v37 = [v19 superview];

    if (v37 != v29)
    {
      [v29 addSubview:v19];
      v38 = [(RCRecordingView *)self doneButton];
      double v39 = [(RCRecordingView *)self doneButton];

      if (!v39)
      {
        v40 = objc_alloc_init(_TtC10VoiceMemos12RCDoneButton);

        v38 = v40;
      }
      [v29 addSubview:v38];
      v116 = v38;
      [(RCRecordingView *)self setDoneButton:v38];
      v41 = [(RCRecordingView *)self doneButton];
      [(RCRecordingView *)self assignActionOnDoneButton:v41];

      v42 = [(RCRecordingView *)self doneButton];
      [v42 setIsAccessibilityElement:1];

      [v19 alignCenterToCenterOfView:v29];
      [v19 constrainHeight:self->_shuttleBarHeight];
      [v19 setHidden:1];
      if ([v3 hostsCancelButtonInBottomSection])
      {
        v43 = [RCRecordingControl alloc];
        [v3 recordingControlDiameter];
        v44 = -[RCRecordingControl initWithDiameter:](v43, "initWithDiameter:");
        [v29 addSubview:v44];
        [(RCRecordingView *)self setCancelButton:v44];
        [(RCRecordingControl *)v44 setHidden:1];
        [(RCRecordingControl *)v44 setDelegate:self];
        [(RCRecordingControl *)v44 setRecordingControlState:10];
        v45 = [v3 recordingSectionCancelButtonInnerColor];
        [(RCRecordingControl *)v44 setInnerColor:v45];

        uint64_t v46 = [v3 recordingSectionDoneAndCancelButtonTextColor];
        [(RCRecordingControl *)v44 setFontColor:v46];

        unsigned int v29 = v124;
      }
      v117 = v13;
      uint64_t v47 = [(RCRecordingView *)self trimToSelectionButton];
      if (!v47)
      {
        uint64_t v47 = +[RCTrimButton buttonWithType:1];
        [v47 addTarget:self action:"_handleTrimToSelection" forControlEvents:64];
        [(RCRecordingView *)self setTrimToSelectionButton:v47];
      }
      [v29 addSubview:v47];
      v48 = [(RCRecordingView *)self trimDeleteButtonLeftConstantConstraint];
      [(RCRecordingView *)self removeConstraint:v48];

      [(RCRecordingView *)self _trimDeleteButtonLeftPadding];
      double v50 = v49;
      v51 = [v47 leadingAnchor];
      double v52 = [v124 leadingAnchor];
      id v53 = [v51 constraintEqualToAnchor:v52 constant:v50];

      [(RCRecordingView *)self setTrimDeleteButtonLeftConstantConstraint:v53];
      v115 = v53;
      [v53 setActive:1];
      [v47 addCenterYConstraintWithView:v124];
      [v47 setHidden:1];
      v54 = [(RCRecordingView *)self deleteSelectionButton];
      if (!v54)
      {
        v54 = +[RCDeleteButton buttonWithType:1];
        [v54 addTarget:self action:"_handleDeleteSelection" forControlEvents:64];
        [(RCRecordingView *)self setDeleteSelectionButton:v54];
      }
      [v124 addSubview:v54];
      v55 = [(RCRecordingView *)self deleteSelectionButtonTrailingConstraint];
      [(RCRecordingView *)self removeConstraint:v55];

      v56 = [(RCRecordingView *)self shuttleBar];
      v57 = +[NSLayoutConstraint constraintWithItem:v54 attribute:6 relatedBy:-1 toItem:v56 attribute:5 multiplier:1.0 constant:0.0];

      [(RCRecordingView *)self setDeleteSelectionButtonTrailingConstraint:v57];
      v114 = v57;
      [v57 setActive:0];
      v58 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v58 trimDeleteButtonLeftPaddingDistance];
      [v54 addLeadingToTrailingConstraintWithView:v47];

      [v54 addCenterYConstraintWithView:v124];
      [v54 setHidden:1];
      [(RCRecordingView *)self _trimDeleteButtonWidth];
      double v60 = v59;
      v61 = [v47 widthAnchor];
      v62 = [v61 constraintEqualToConstant:v60];

      [v62 setActive:1];
      v113 = v62;
      LODWORD(v63) = 1144733696;
      [v62 setPriority:v63];
      v64 = [v54 widthAnchor];
      v65 = [v47 widthAnchor];
      v66 = [v64 constraintEqualToAnchor:v65];

      v112 = v66;
      [v66 setActive:1];
      [(RCRecordingView *)self _trimDeleteButtonHeight];
      double v68 = v67;
      v69 = [v47 heightAnchor];
      v70 = [v69 constraintEqualToConstant:v68];

      [v70 setActive:1];
      v111 = v70;
      LODWORD(v71) = 1144733696;
      [v70 setPriority:v71];
      v72 = [v54 heightAnchor];
      v73 = [v47 heightAnchor];
      v74 = [v72 constraintEqualToAnchor:v73];

      v110 = v74;
      [v74 setActive:1];
      v75 = +[RCRecorderStyleProvider sharedStyleProvider];
      LODWORD(v73) = [v75 hostsCancelButtonInBottomSection];

      uint64_t v76 = [(RCRecordingView *)self editingToolbar];
      v109 = (void *)v76;
      if (v73)
      {
        v140[0] = v76;
        v108 = [(RCRecordingView *)self descriptionView];
        v140[1] = v108;
        v107 = [(RCRecordingView *)self centerContentContainerView];
        v140[2] = v107;
        v106 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
        v140[3] = v106;
        v140[4] = v117;
        v105 = [(RCRecordingView *)self recordButton];
        v140[5] = v105;
        v104 = [(RCRecordingView *)self trimToSelectionButton];
        v140[6] = v104;
        v103 = [(RCRecordingView *)self deleteSelectionButton];
        v140[7] = v103;
        v140[8] = v19;
        v77 = [(RCRecordingView *)self cancelButton];
        v140[9] = v77;
        v78 = [(RCRecordingView *)self doneButton];
        v140[10] = v78;
        v79 = +[NSArray arrayWithObjects:v140 count:11];
        [(RCRecordingView *)self setAccessibilityElements:v79];
      }
      else
      {
        v139[0] = v76;
        v108 = [(RCRecordingView *)self descriptionView];
        v139[1] = v108;
        v107 = [(RCRecordingView *)self centerContentContainerView];
        v139[2] = v107;
        v106 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
        v139[3] = v106;
        v139[4] = v117;
        v105 = [(RCRecordingView *)self recordButton];
        v139[5] = v105;
        v104 = [(RCRecordingView *)self trimToSelectionButton];
        v139[6] = v104;
        v103 = [(RCRecordingView *)self deleteSelectionButton];
        v139[7] = v103;
        v139[8] = v19;
        v77 = [(RCRecordingView *)self doneButton];
        v139[9] = v77;
        v78 = +[NSArray arrayWithObjects:v139 count:10];
        [(RCRecordingView *)self setAccessibilityElements:v78];
      }
      v82 = v116;

      double v13 = v117;
      unsigned int v29 = v124;
      v83 = v115;
      goto LABEL_39;
    }
  }
LABEL_40:
  v84 = v13;
  [v30 addObject:v13];
  unsigned __int8 v85 = [v3 hostsTransportAndDoneButtonInBottomSection];
  if (v19 && (v85 & 1) == 0)
  {
    [v30 addObject:v19];
    [v19 setHidden:1];
  }
  v138[0] = v29;
  v86 = [(RCRecordingView *)self bottomFillerView];
  v138[1] = v86;
  v87 = +[NSArray arrayWithObjects:v138 count:2];
  [v30 addObjectsFromArray:v87];

  v88 = [(RCRecordingView *)self mainContainerStackView];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  v89 = [v88 arrangedSubviews];
  id v90 = [v89 countByEnumeratingWithState:&v130 objects:v137 count:16];
  if (v90)
  {
    id v91 = v90;
    uint64_t v92 = *(void *)v131;
    do
    {
      for (i = 0; i != v91; i = (char *)i + 1)
      {
        if (*(void *)v131 != v92) {
          objc_enumerationMutation(v89);
        }
        [v88 removeArrangedSubview:*(void *)(*((void *)&v130 + 1) + 8 * i)];
      }
      id v91 = [v89 countByEnumeratingWithState:&v130 objects:v137 count:16];
    }
    while (v91);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v94 = v30;
  id v95 = [v94 countByEnumeratingWithState:&v126 objects:v136 count:16];
  if (v95)
  {
    id v96 = v95;
    uint64_t v97 = *(void *)v127;
    do
    {
      for (j = 0; j != v96; j = (char *)j + 1)
      {
        if (*(void *)v127 != v97) {
          objc_enumerationMutation(v94);
        }
        [v88 addArrangedSubview:*(void *)(*((void *)&v126 + 1) + 8 * (void)j)];
      }
      id v96 = [v94 countByEnumeratingWithState:&v126 objects:v136 count:16];
    }
    while (v96);
  }

  if ([v3 hostsTransportAndDoneButtonInBottomSection])
  {
    v99 = v119;
    if ((id)[(RCRecordingView *)self displayStyle] == (id)3)
    {
      [(RCRecordingView *)self _alignRecordingControlToLeft];
    }
    else if ((id)[(RCRecordingView *)self displayStyle] == (id)2)
    {
      [(RCRecordingView *)self setDisplayStyle:3];
    }
  }
  else
  {
    [(RCRecordingView *)self _alignRecordingControlToCenter];
    v99 = v119;
  }
  [v3 recordingViewSpaceBetweenToolbarAndDescriptionView];
  double v101 = v100;
  v102 = [(RCRecordingView *)self editingToolbar];
  [v88 setCustomSpacing:v102 afterView:v101];
}

- (void)_dropView:(id)a3
{
}

- (SettableIntrinsicSizeView)topCardSpacerView
{
  return self->_topCardSpacerView;
}

- (SettableIntrinsicSizeView)bottomControlsContainerView
{
  return self->_bottomControlsContainerView;
}

- (RCShuttleBar)shuttleBar
{
  return self->_shuttleBar;
}

- (RCEditingToolbar)editingToolbar
{
  return self->_editingToolbar;
}

- (BOOL)_doingSomeKindOfCapture
{
  unint64_t v2 = [(RCRecordingView *)self recordingViewState];
  return (v2 < 8) & (0xC2u >> v2);
}

- (int64_t)recordingViewState
{
  return self->_recordingViewState;
}

- (void)updateRecordButtonViewStateWithCurrentTime:(double)a3
{
  unint64_t v5 = [(RCRecordingView *)self recordingViewState];
  if (v5 > 8 || ((1 << v5) & 0x1C3) == 0)
  {
    [(RCRecordingView *)self recordingDuration];
    double v8 = v7;
    [(RCRecordingView *)self currentTrackTimeRange];
    if ((RCTimeRangeEqualToTimeRange() & 1) == 0)
    {
      [(RCRecordingView *)self currentTrackTimeRange];
      double v8 = v9;
      [(RCRecordingView *)self recordingDuration];
      if (v8 >= v10) {
        double v8 = v10;
      }
    }
    if (v8 + -0.06 <= a3) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 4;
    }
    if (v11 == [(RCRecordingView *)self recordingViewState])
    {
      [(RCRecordingView *)self _updateRecordButtonStateForRecordingViewState:v11];
    }
    else
    {
      [(RCRecordingView *)self setRecordingViewState:v11];
    }
  }
}

- (RCTrimButton)trimToSelectionButton
{
  return self->_trimToSelectionButton;
}

- (SettableIntrinsicSizeView)trimOverviewWaveformContainerView
{
  return self->_trimOverviewWaveformContainerView;
}

- (NSLayoutConstraint)trimDeleteButtonLeftConstantConstraint
{
  return self->_trimDeleteButtonLeftConstantConstraint;
}

- (SettableIntrinsicSizeView)topFullScreenSpacerView
{
  return self->_topFullScreenSpacerView;
}

- (UITextField)textFieldBeingEdited
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldBeingEdited);

  return (UITextField *)WeakRetained;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (BOOL)shouldHideSubseconds
{
  return self->_shouldHideSubseconds;
}

- (void)setViewDelegate:(id)a3
{
}

- (void)setTrimOverviewWaveformContainerView:(id)a3
{
}

- (void)setTrimDeleteButtonLeftConstantConstraint:(id)a3
{
}

- (void)setTranscriptionButton:(id)a3
{
}

- (void)setTranscriptView:(id)a3
{
  objc_storeWeak((id *)&self->_transcriptView, a3);

  [(RCRecordingView *)self _syncCenterContentContainerViewState];
}

- (void)setTopFullScreenSpacerView:(id)a3
{
}

- (void)setTopCardSpacerView:(id)a3
{
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (void)setShouldSaveAsNew:(BOOL)a3
{
  self->_shouldSaveAsNew = a3;
}

- (void)setRecordButtonRepository:(id)a3
{
}

- (void)setRecordButtonFactory:(id)a3
{
}

- (void)setRecordButtonCenterYConstraint:(id)a3
{
}

- (void)setRecordButtonCenterXToViewCenterXConstraint:(id)a3
{
}

- (void)setRecordButtonCenterXToLeadingConstraint:(id)a3
{
}

- (void)setRecordButton:(id)a3
{
}

- (void)setPlaybackSettingsButton:(id)a3
{
}

- (void)setMoreActionsButton:(id)a3
{
}

- (void)setMainContainerStackView:(id)a3
{
}

- (void)setFixedOverviewWaveformContainerView:(id)a3
{
}

- (void)setEditingToolbar:(id)a3
{
}

- (void)setEditingInFlight:(BOOL)a3
{
  BOOL v3 = a3;
  self->_editingInFlight = a3;
  int64_t v5 = [(RCRecordingView *)self displayStyle];
  double v6 = [(RCRecordingView *)self progressOverlay];
  if (!v3 || v5 == 1)
  {
    id v9 = v6;
    [v6 dismiss];
  }
  else
  {
    if (!v6)
    {
      id v8 = (id)objc_opt_new();
      double v7 = +[UIColor secondaryLabelColor];
      [v8 setProgressIndicatorColor:v7];

      [(RCRecordingView *)self setProgressOverlay:v8];
      [(RCRecordingView *)self _applyDimmingColorToProgressOverlay];
      [v8 setStyle:1];
      double v6 = v8;
    }
    id v9 = v6;
    [v6 presentInView:self];
  }
}

- (void)setDoneEditingButton:(id)a3
{
}

- (void)setDisplayStyle:(int64_t)a3
{
  int64_t displayStyle = self->_displayStyle;
  if (displayStyle != a3)
  {
    if (a3 != 3 && displayStyle == 3) {
      [(RCRecordingView *)self cancelTextEditing];
    }
    self->_int64_t displayStyle = a3;
    [(RCRecordingView *)self _classSpecificSetDisplayStyle:a3];
    [(RCRecordingView *)self _adjustTraitOverridesForDisplayStyle:a3];
    [(RCRecordingView *)self _adjustBackgroundColorForDisplayStyle:a3];
    [(RCRecordingView *)self _syncSubviewIntrinsicHeights];
    [(RCRecordingView *)self _syncViewsToState];
    [(RCRecordingView *)self invalidateIntrinsicContentSize];
    [(RCRecordingView *)self _syncTapGestureRecognizerEnablement];
    [(RCRecordingView *)self setAccessibilityViewIsModal:self->_displayStyle != 1];
    id v6 = [(RCRecordingView *)self viewDelegate];
    [v6 didUpdateRecordingViewDisplayStyle];
  }
}

- (void)setDismissalDisplayStyle:(int64_t)a3
{
  self->_dismissalDisplayStyle = a3;
}

- (void)setDescriptionView:(id)a3
{
}

- (void)setDeleteSelectionButtonTrailingConstraint:(id)a3
{
}

- (void)setCurrentTimeLabel:(id)a3
{
}

- (void)setCenterContentViewState:(int64_t)a3
{
  if (self->_centerContentViewState != a3)
  {
    int64_t v5 = [(RCRecordingView *)self viewDelegate];
    [v5 willUpdateRecordingCenterContentViewState:a3];

    self->_centerContentViewState = a3;
    BOOL v6 = a3 == 1;
    double v7 = [(RCRecordingView *)self transcriptionButton];
    [v7 setIsToggled:v6];

    id v8 = [(RCRecordingView *)self editingToolbar];
    [v8 setIsTranscriptViewDisplayed:v6];

    [(RCRecordingView *)self updateMoreActionsAndPlaybackSettingButtonVisibility];
    [(RCRecordingView *)self _syncCenterContentContainerViewState];
    [(RCRecordingView *)self setTranscriptViewState:0];
    id v9 = [(RCRecordingView *)self viewDelegate];
    [v9 didUpdateRecordingCenterContentViewState];
  }
}

- (void)setCenterContentContainerView:(id)a3
{
}

- (void)setButtonsAndDescriptionContainerView:(id)a3
{
}

- (void)setBottomFillerView:(id)a3
{
}

- (void)setBottomControlsContainerView:(id)a3
{
}

- (void)setAllowsNewRecordings:(BOOL)a3
{
  self->_allowsNewRecordings = a3;
  -[RCRecordingView setDismissalDisplayStyle:](self, "setDismissalDisplayStyle:");
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (_TtC10VoiceMemos24RCRecordButtonRepository)recordButtonRepository
{
  return self->_recordButtonRepository;
}

- (_TtC10VoiceMemos24RCRecordButtonAppFactory)recordButtonFactory
{
  return self->_recordButtonFactory;
}

- (NSLayoutConstraint)recordButtonCenterYConstraint
{
  return self->_recordButtonCenterYConstraint;
}

- (RCProgressOverlay)progressOverlay
{
  return self->_progressOverlay;
}

- (UILabel)overviewEndTimeLabel
{
  return self->_overviewEndTimeLabel;
}

- (UILabel)overviewBeginTimeLabel
{
  return self->_overviewBeginTimeLabel;
}

- (BOOL)isSyncingViewsToState
{
  return self->_isSyncingViewsToState;
}

- (RCRecordingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingView;
  BOOL v3 = -[RCRecordingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(RCRecordingView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4->_int64_t displayStyle = 1;
    v4->_allowsNewRecordings = 1;
    [(RCRecordingView *)v4 _classSpecificInit];
    [(RCRecordingView *)v4 _accessibilitySetInterfaceStyleIntent:2];
  }
  return v4;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (BOOL)forceDisableRecordingControl
{
  return self->_forceDisableRecordingControl;
}

- (UIView)fixedOverviewWaveformView
{
  return self->_fixedOverviewWaveformView;
}

- (SettableIntrinsicSizeView)fixedOverviewWaveformContainerView
{
  return self->_fixedOverviewWaveformContainerView;
}

- (int64_t)dismissalDisplayStyle
{
  return self->_dismissalDisplayStyle;
}

- (void)deviceTranscriptionSupportDidChange:(BOOL)a3
{
  [(RCRecordingView *)self _updateMoreButtonMenu];

  [(RCRecordingView *)self _updateTranscriptionButtonVisibility];
}

- (RCDeleteButton)deleteSelectionButton
{
  return self->_deleteSelectionButton;
}

- (NSLayoutConstraint)deleteSelectionButtonTrailingConstraint
{
  return self->_deleteSelectionButtonTrailingConstraint;
}

- (float)centerContentVerticalHuggingPriority
{
  return 249.0;
}

- (SettableIntrinsicSizeView)centerContentContainerView
{
  return self->_centerContentContainerView;
}

- (RCCardPresentationDelegate)cardPresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardPresentationDelegate);

  return (RCCardPresentationDelegate *)WeakRetained;
}

- (SettableIntrinsicSizeView)buttonsAndDescriptionContainerView
{
  return self->_buttonsAndDescriptionContainerView;
}

- (void)_updateToolbarsActivityMode:(int64_t)a3
{
  id v4 = [(RCRecordingView *)self editingToolbar];
  [v4 setActivityMode:a3];
}

- (void)_updateShuttleBarEnablement
{
  int64_t v3 = [(RCRecordingView *)self recordingViewState];
  unsigned int v4 = ![(RCRecordingView *)self _doingSomeKindOfCapture];
  if (v3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = [(RCRecordingView *)self shuttleBar];
  [v6 setEnabled:v5];
}

- (void)_updateCenterContentContainerViewConstraints
{
  int64_t v3 = [(RCRecordingView *)self centerContentViewState];
  int64_t v4 = [(RCRecordingView *)self displayStyle];
  if (v3 == 1)
  {
    id WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
    if (!WeakRetained) {
      goto LABEL_9;
    }
  }
  else
  {
    id WeakRetained = self->_waveformView;
    if (!WeakRetained) {
      goto LABEL_9;
    }
  }
  long long v19 = WeakRetained;
  id v6 = [(RCRecordingView *)self centerContentContainerView];
  double v7 = [v6 subviews];
  unsigned int v8 = [v7 containsObject:v19];

  id WeakRetained = v19;
  if (v8)
  {
    id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
    double v10 = v9;
    double v11 = 0.0;
    double v12 = 0.0;
    if (v4 != 2)
    {
      [v9 centerContentViewTopPadding];
      double v11 = v13;
      [v10 centerContentViewBottomPadding];
      double v12 = v14;
    }
    double v15 = [(RCRecordingView *)self centerContentContainerView];
    [(UIView *)v19 addTopToTopConstraintWithView:v15 padding:v11];

    double v16 = [(RCRecordingView *)self centerContentContainerView];
    [(UIView *)v19 addBottomToBottomConstraintWithView:v16 padding:-v12];

    id v17 = [(RCRecordingView *)self centerContentContainerView];
    [(UIView *)v19 addLeadingToLeadingConstraintWithView:v17 padding:0.0];

    long long v18 = [(RCRecordingView *)self centerContentContainerView];
    [(UIView *)v19 addTrailingToTrailingConstraintWithView:v18 padding:0.0];

    id WeakRetained = v19;
  }
LABEL_9:
}

- (void)_syncCenterContentContainerViewState
{
  int64_t centerContentViewState = self->_centerContentViewState;
  if (centerContentViewState == 1)
  {
    id WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);

    if (!WeakRetained) {
      goto LABEL_13;
    }
    id WeakRetained = self->_waveformView;
    uint64_t v5 = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
  }
  else
  {
    if (centerContentViewState || !self->_waveformView)
    {
      id WeakRetained = 0;
      goto LABEL_13;
    }
    id WeakRetained = (UIView *)objc_loadWeakRetained((id *)&self->_transcriptView);
    uint64_t v5 = self->_waveformView;
  }
  id v6 = v5;
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100095F98;
    v10[3] = &unk_100221CB0;
    id WeakRetained = WeakRetained;
    double v11 = WeakRetained;
    double v12 = self;
    double v7 = v6;
    double v13 = v7;
    unsigned int v8 = objc_retainBlock(v10);
    if ((id)[(RCRecordingView *)self displayStyle] == (id)3)
    {
      id v9 = [(RCRecordingView *)self centerContentContainerView];
      +[UIView transitionWithView:v9 duration:5242880 options:v8 animations:0 completion:0.4];
    }
    else
    {
      ((void (*)(void *))v8[2])(v8);
    }
    [(RCRecordingView *)self _updateCenterContentContainerViewConstraints];
  }
LABEL_13:
}

- (BOOL)_shouldHideBottomElements
{
  return (id)[(RCRecordingView *)self centerContentViewState] == (id)1
      && (id)[(RCRecordingView *)self transcriptViewState] == (id)1;
}

- (BOOL)_shouldEnableRecordingControlForState:(int64_t)a3
{
  unsigned int v4 = ![(RCRecordingView *)self forceDisableRecordingControl];
  if (a3) {
    return 0;
  }
  else {
    return v4;
  }
}

- (void)_classSpecificReset
{
  int64_t v3 = [(RCRecordingView *)self dismissalDisplayStyle];

  [(RCRecordingView *)self setDisplayStyle:v3];
}

- (void)setHostViewHeight:(double)a3
{
  if (self->_hostViewHeight != a3)
  {
    self->_hostViewHeight = a3;
    [(RCRecordingView *)self _adjustForHostViewHeight];
  }
}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_statusBarHeight = a3;
    [(RCRecordingView *)self _adjustForHostViewHeight];
  }
}

- (void)_classSpecificSetDisplayStyle:(int64_t)a3
{
  if ([(RCRecordingView *)self dismissalDisplayStyle] != a3) {
    [(RCRecordingView *)self _createShuttleBarIfNeeded];
  }
  if (a3 == 3)
  {
    uint64_t v21 = [(RCRecordingView *)self centerContentContainerView];
    uint64_t v19 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v21 includeTopLevelView:1];
    v23[0] = v19;
    double v10 = [(RCRecordingView *)self shuttleBar];
    uint64_t v22 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v10 includeTopLevelView:0];
    v23[1] = v22;
    id v20 = [(RCRecordingView *)self editingToolbar];
    double v11 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v20 includeTopLevelView:0];
    v23[2] = v11;
    double v12 = [(RCRecordingView *)self doneEditingButton];
    double v13 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v12 includeTopLevelView:1];
    v23[3] = v13;
    double v14 = [(RCRecordingView *)self trimOverviewWaveformContainerView];
    double v15 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v14 includeTopLevelView:1];
    v23[4] = v15;
    double v16 = [(RCRecordingView *)self bottomControlsContainerView];
    id v17 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v16 includeTopLevelView:1];
    v23[5] = v17;
    long long v18 = +[NSArray arrayWithObjects:v23 count:6];
    [(RCRecordingView *)self setDragGesturePassthroughSpecs:v18];

    id v9 = (void *)v19;
    unsigned int v8 = (void *)v21;

    goto LABEL_9;
  }
  if (a3 == 2)
  {
    uint64_t v5 = [(RCRecordingView *)self waveformView];
    if (v5)
    {
      id v6 = (void *)v5;
      double v7 = [(RCRecordingView *)self descriptionView];

      if (v7)
      {
        unsigned int v8 = [(RCRecordingView *)self doneEditingButton];
        id v9 = +[RCPassthroughViewsSpec passthroughViewsSpecWithTopLevelView:v8 includeTopLevelView:1];
        v24 = v9;
        double v10 = +[NSArray arrayWithObjects:&v24 count:1];
        [(RCRecordingView *)self setDragGesturePassthroughSpecs:v10];
LABEL_9:
      }
    }
  }
}

- (void)setRecordingControlState:(int64_t)a3
{
  int64_t v4 = [(RCRecordingView *)self _recordButtonStateForRecordingControlState:a3];
  id v5 = [(RCRecordingView *)self recordButtonRepository];
  [v5 setState:v4];
}

- (int64_t)recordingControlState
{
  int64_t v3 = [(RCRecordingView *)self recordButtonRepository];
  int64_t v4 = -[RCRecordingView _recordingControlStateForRecordButtonState:](self, "_recordingControlStateForRecordButtonState:", [v3 state]);

  return v4;
}

- (int64_t)_recordButtonStateForRecordingControlState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return qword_1001F02F0[a3 - 1];
  }
}

- (int64_t)_recordingControlStateForRecordButtonState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 4) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void)setForceDisableRecordingControl:(BOOL)a3
{
  if (self->_forceDisableRecordingControl != a3)
  {
    self->_forceDisableRecordingControl = a3;
    id v4 = [(RCRecordingView *)self recordButtonRepository];
    [v4 setIsEnabled:[self _shouldEnableRecordingControlForState:[self playControlState]]];
  }
}

- (int64_t)playControlState
{
  unint64_t v2 = [(RCRecordingView *)self shuttleBar];
  id v3 = [v2 playControlState];

  return (int64_t)v3;
}

- (void)updateMoreActionsAndPlaybackSettingButtonVisibility
{
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v7 showsDescriptionViewInLineWithTrimAndPlaybackSettingsButtons]
    && (id)[(RCRecordingView *)self displayStyle] == (id)3)
  {
    if ((id)[(RCRecordingView *)self recordingControlState] == (id)1
      || (id)[(RCRecordingView *)self recordingControlState] == (id)2)
    {
      [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:0];
      id v3 = [(RCRecordingView *)self playbackSettingsButton];
      [v3 rc_setEnabled:0];

      id v4 = [(RCRecordingView *)self moreActionsButton];
      [v4 setEnabled:0];
    }
    else
    {
      [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:0];
      id v5 = [(RCRecordingView *)self playbackSettingsButton];
      [v5 rc_setEnabled:1];

      id v6 = [(RCRecordingView *)self moreActionsButton];
      [v6 setEnabled:1];

      [(RCRecordingView *)self _updateMoreButtonMenu];
    }
  }
  else
  {
    [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:1];
  }
}

- (BOOL)shouldEnableDoneButtonWhileRecording
{
  return 1;
}

- (void)restyle
{
  [(RCRecordingView *)self _styleView];
  [(RCRecordingView *)self setDisplayStyle:[(RCRecordingView *)self displayStyle]];
  [(RCRecordingView *)self setTrimEnabled:[(RCRecordingView *)self trimEnabled]];
  [(RCRecordingView *)self setRecordingViewState:[(RCRecordingView *)self recordingViewState] animated:1 force:1];
  [(RCRecordingView *)self _syncViewsToState];
  [(RCRecordingView *)self _adjustForHostViewHeight];
  id v3 = [(RCRecordingView *)self progressOverlay];
  [v3 restyle];

  [(RCRecordingView *)self setNeedsLayout];
}

- (void)_applyDimmingColorToProgressOverlay
{
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = [v5 progressViewBackgroundColorEditingCard];
  id v4 = [(RCRecordingView *)self progressOverlay];
  [v4 setDimmingBackgroundColor:v3];
}

- (void)_displayPlaybackSettings
{
  id v3 = [(RCRecordingView *)self playbackSettingsButton];
  [(RCRecordingView *)self performControlsAction:44 position:v3 source:0.0];
}

- (void)setHasMultipleTracks:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasMultipleTracks = a3;
  [(RCRecordingView *)self _updateMoreButtonMenu];
  id v5 = [(RCRecordingView *)self descriptionView];
  [v5 setHasMultipleTracks:v3];
}

- (unint64_t)_displayOptionForView:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self topFullScreenSpacerView];

  if (v5 == v4)
  {
    unint64_t v15 = 1;
  }
  else
  {
    id v6 = [(RCRecordingView *)self centerContentContainerView];

    if (v6 == v4)
    {
      unint64_t v15 = 2;
    }
    else
    {
      id v7 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];

      if (v7 == v4)
      {
        unint64_t v15 = 4;
      }
      else
      {
        id v8 = [(RCRecordingView *)self currentTimeLabel];

        if (v8 == v4)
        {
          unint64_t v15 = 8;
        }
        else
        {
          id v9 = [(RCRecordingView *)self editingToolbar];

          if (v9 == v4)
          {
            unint64_t v15 = 64;
          }
          else
          {
            id v10 = [(RCRecordingView *)self buttonsAndDescriptionContainerView];

            if (v10 == v4)
            {
              unint64_t v15 = 16;
            }
            else
            {
              id v11 = [(RCRecordingView *)self shuttleBar];

              if (v11 == v4)
              {
                unint64_t v15 = 32;
              }
              else
              {
                id v12 = [(RCRecordingView *)self bottomControlsContainerView];

                if (v12 == v4)
                {
                  unint64_t v15 = 128;
                }
                else
                {
                  id v13 = [(RCRecordingView *)self bottomFillerView];

                  if (v13 == v4)
                  {
                    unint64_t v15 = 256;
                  }
                  else
                  {
                    double v14 = OSLogForCategory();
                    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
                      sub_10016DAF0(v14);
                    }

                    unint64_t v15 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v15;
}

- (void)undoStateChanged:(BOOL)a3 isNewRecording:(BOOL)a4
{
  int v4 = a4;
  BOOL v5 = a3;
  id v7 = [(RCRecordingView *)self editingToolbar];
  [v7 setCanUndo:v5];

  [(RCRecordingView *)self setShouldSaveAsNew:v5 & ~v4];
  id v8 = [(RCRecordingView *)self doneButton];
  [(RCRecordingView *)self assignActionOnDoneButton:v8];

  id v9 = [(RCRecordingView *)self doneEditingButton];
  [(RCRecordingView *)self assignActionOnDoneButton:v9];
}

- (void)trimSaveStateChanged:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RCRecordingView *)self editingToolbar];
  [v5 setCanSave:v3];

  int64_t v6 = [(RCRecordingView *)self recordingViewState];

  [(RCRecordingView *)self setRecordingViewState:v6 animated:0 force:1];
}

- (void)setTrimEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_trimEnabled = a3;
  BOOL v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v6 = [v5 hostsTransportAndDoneButtonInBottomSection];

  if (v6)
  {
    id v7 = [(RCRecordingView *)self trimToSelectionButton];
    [v7 setEnabled:v3];

    id v8 = [(RCRecordingView *)self deleteSelectionButton];
    [v8 setEnabled:v3];
  }
  else
  {
    id v8 = [(RCRecordingView *)self shuttleBar];
    [v8 setTrimButtonsEnabled:v3];
  }
}

- (BOOL)trimEnabled
{
  return self->_trimEnabled;
}

- (BOOL)canSaveTrimChanges
{
  unint64_t v2 = [(RCRecordingView *)self editingToolbar];
  unsigned __int8 v3 = [v2 canSave];

  return v3;
}

- (void)setHasCustomizedPlaybackSettings:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(RCRecordingView *)self editingToolbar];
  [v5 setHasCustomizedPlaybackSettings:v3];

  id v6 = [(RCRecordingView *)self playbackSettingsButton];
  [v6 setIsToggled:v3];
}

- (void)setHasTranscription:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasTranscription = a3;
  BOOL v5 = [(RCRecordingView *)self descriptionView];
  [v5 setDisplayTranscriptAvailableIcon:v3];

  [(RCRecordingView *)self _updateMoreButtonMenu];
}

- (BOOL)editingInFlight
{
  return self->_editingInFlight;
}

- (void)setEditingProgress:(float)a3
{
  id v5 = [(RCRecordingView *)self progressOverlay];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (float)editingProgress
{
  unint64_t v2 = [(RCRecordingView *)self progressOverlay];
  [v2 progress];
  float v4 = v3;

  return v4;
}

- (void)setRecordingTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self descriptionView];
  [v5 setRecordingTitle:v4];
}

- (NSString)recordingTitle
{
  unint64_t v2 = [(RCRecordingView *)self descriptionView];
  float v3 = [v2 recordingTitle];

  return (NSString *)v3;
}

- (void)setCreationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self descriptionView];
  [v5 setCreationDate:v4];
}

- (NSDate)creationDate
{
  unint64_t v2 = [(RCRecordingView *)self descriptionView];
  float v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (void)setShouldHideSubseconds:(BOOL)a3
{
  if (self->_shouldHideSubseconds != a3)
  {
    self->_shouldHideSubseconds = a3;
    [(RCRecordingView *)self _updateRecordingDescriptionViewForDuration:self->_recordingDuration];
    double currentTime = self->_currentTime;
    [(RCRecordingView *)self _updateCurrentTimeLabelForTime:currentTime];
  }
}

- (void)setRecordingDuration:(double)a3
{
  if (self->_recordingDuration != a3)
  {
    self->_recordingDuration = a3;
    [(RCRecordingView *)self _updateRecordingDescriptionViewForDuration:a3];
    id v5 = RCLocalizedDuration();
    id v6 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v6 setText:v5];

    id v7 = [(RCRecordingView *)self overviewEndTimeLabel];
    [v7 sizeToFit];
  }
  if (a3 == 0.0)
  {
    id v8 = [(RCRecordingView *)self descriptionView];
    [v8 setDurationLabelAccessible:0];
  }
}

- (void)_updateRecordingDescriptionViewForDuration:(double)a3
{
  int64_t v5 = [(RCRecordingView *)self displayStyle];
  if ([(RCRecordingView *)self recordingViewState]) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = self->_recordingDuration != 0.0;
  }
  id v7 = [(RCRecordingView *)self descriptionView];
  [v7 setRecordingDuration:v5 == 2 withHiddenLabel:[self shouldHideSubseconds] withHiddenSubcomponents:v6 isDurationLabelAX:a3];
}

- (double)intrinsicHeightForCompactView
{
  return self->_editingToolbarCompactHeight
       + self->_bottomAccessoryDescriptionHeight
       + self->_bottomAccessoryContentContainerHeight
       + self->_recordingControlSectionHeight;
}

- (double)intrinsicHeightForBottomAccessoryViewAndSafeArea
{
  double recordingControlSectionHeight = self->_recordingControlSectionHeight;
  float v3 = +[UIApplication sharedApplication];
  id v4 = [v3 delegate];
  int64_t v5 = [v4 window];
  [v5 safeAreaInsets];
  double v7 = v6;

  return recordingControlSectionHeight + v7;
}

- (void)setWaveformView:(id)a3
{
  self->_waveformView = (UIView *)a3;
  [a3 setAccessibilityIgnoresInvertColors:0];

  [(RCRecordingView *)self _syncCenterContentContainerViewState];
}

- (void)setTranscriptViewState:(int64_t)a3
{
  if (self->_transcriptViewState != a3)
  {
    self->_transcriptViewState = a3;
    int64_t v5 = [(RCRecordingView *)self viewDelegate];
    [v5 willUpdateRecordingViewTranscriptState:a3];

    [(RCRecordingView *)self _classSpecificSyncTranscriptViewState];
  }
}

- (void)_classSpecificSyncTranscriptViewState
{
  unsigned int v3 = [(RCRecordingView *)self _shouldHideBottomElements];
  char v4 = v3;
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = [(RCRecordingView *)self createTranscriptViewExpansionAnimator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100096138;
  v7[3] = &unk_100222588;
  v7[4] = self;
  char v8 = v4;
  *(double *)&v7[5] = v5;
  [v6 addAnimations:v7];
  [v6 startAnimation];
}

- (id)_bottomElementsToHide
{
  unsigned int v3 = [(RCRecordingView *)self currentTimeLabel];
  char v4 = [(RCRecordingView *)self shuttleBar];
  v8[1] = v4;
  double v5 = [(RCRecordingView *)self bottomControlsContainerView];
  v8[2] = v5;
  double v6 = +[NSArray arrayWithObjects:v8 count:3];

  return v6;
}

- (id)createTranscriptViewExpansionAnimator
{
  id v2 = [objc_alloc((Class)UISpringTimingParameters) initWithMass:1.0 stiffness:450.0 damping:45.0 initialVelocity:0.0];
  id v3 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v2 timingParameters:0.0];

  return v3;
}

- (void)setFixedOverviewWaveformView:(id)a3
{
  double v7 = (UIView *)a3;
  self->_fixedOverviewWaveformView = v7;
  char v4 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  if (v4)
  {
    [(UIView *)self->_fixedOverviewWaveformView removeFromSuperview];
    [v4 addSubview:v7];
    [(RCRecordingView *)self _applyFixedOverviewWaveformViewConstraints];
    [(UIView *)v7 setAccessibilityIgnoresInvertColors:0];
    double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v6 = [v5 hasBeginAndEndTimeLabelAtOverviewWaveform];

    if (v6) {
      [(RCRecordingView *)self _addLabelsToWaveformOverview:v7 containerView:v4];
    }
  }
}

- (void)_applyFixedOverviewWaveformViewConstraints
{
  id v11 = [(RCRecordingView *)self fixedOverviewWaveformView];
  [v11 removeAllConstraints];
  id v3 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  char v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 recordingViewWaveformOverviewSidePadding];
  double v6 = v5;
  [v4 recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview];
  double v8 = v7;
  [v4 recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview];
  double v10 = v9;
  [v11 alignCenterTopToCenterTopOfView:v3 padding:v8];
  [v11 alignCenterBottomToCenterBottomOfView:v3 padding:-v10];
  [v11 constrainWidthWithView:v3 padding:v6 * -2.0];
}

- (void)setTrimOverviewWaveformView:(id)a3
{
  double v14 = (UIView *)a3;
  self->_trimOverviewWaveformView = v14;
  char v4 = [(RCRecordingView *)self trimOverviewWaveformContainerView];
  if (v4)
  {
    double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v5 recordingViewWaveformOverviewSidePadding];
    double v7 = v6;
    [v5 recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview];
    double v9 = v8;
    [v5 recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview];
    double v11 = v9 + v10;
    [(UIView *)self->_trimOverviewWaveformView removeFromSuperview];
    [v4 addSubview:v14];
    [(UIView *)v14 constrainSizeAndAlignCenterToCenterOfView:v4 sizePaddingX:-v7 sizePaddingY:v11 * -0.5 centerPaddingX:0.0 centerPaddingY:0.0];
    id v12 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned int v13 = [v12 hasBeginAndEndTimeLabelAtOverviewWaveform];

    if (v13) {
      [(RCRecordingView *)self _addLabelsToWaveformOverview:v14 containerView:v4];
    }
  }
}

- (void)_addLabelsToWaveformOverview:(id)a3 containerView:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v8 removeFromSuperview];

  double v9 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v9 removeFromSuperview];

  double v10 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v10 removeAllConstraints];

  double v11 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v11 removeAllConstraints];

  id v12 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v6 addSubview:v12];

  unsigned int v13 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v6 addSubview:v13];

  double v14 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v14 beginEndLabelsTopPadding];
  double v16 = v15;

  id v17 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v17 addTopToBottomConstraintWithView:v7 padding:v16];

  long long v18 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v18 addLeftToLeftConstraintWithView:v7 padding:0.0];

  uint64_t v19 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v19 addTopToBottomConstraintWithView:v7 padding:v16];

  id v20 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v20 addRightToRightConstraintWithView:v7 padding:0.0];

  uint64_t v21 = RCLocalizedDuration();
  uint64_t v22 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v22 setText:v21];

  uint64_t v23 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v23 sizeToFit];

  v24 = RCLocalizedDuration();
  id v25 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v25 setText:v24];

  double v26 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v26 sizeToFit];

  v27 = [(RCRecordingView *)self overviewBeginTimeLabel];
  [v27 setIsAccessibilityElement:0];

  id v28 = [(RCRecordingView *)self overviewEndTimeLabel];
  [v28 setIsAccessibilityElement:0];
}

- (void)_createShuttleBarIfNeeded
{
  id v3 = [(RCRecordingView *)self shuttleBar];
  if (!v3)
  {
    id v7 = [[RCShuttleBar alloc] initWithShuttleBarStyle:2];
    [(RCRecordingView *)self setShuttleBar:v7];
    char v4 = +[RCRecorderStyleProvider sharedStyleProvider];
    [(RCShuttleBar *)v7 setIntrinsicHeight:self->_shuttleBarHeight];
    [(RCShuttleBar *)v7 setPresentedControlsOptions:0];
    [(RCShuttleBar *)v7 setActionDelegate:self];
    double v5 = [v4 transportControlsColorForRecordingCard];
    [(RCShuttleBar *)v7 setControlsColor:v5];

    id v6 = [v4 transportButtonAnimationCircleColor];
    [(RCShuttleBar *)v7 setControlsAnimationColor:v6];

    [(RCRecordingView *)self _styleView];
    [(RCRecordingView *)self _updateShuttleBarEnablement];
    [(RCRecordingView *)self _primeFramesOfHiddenItems];

    id v3 = v7;
  }
}

- (void)_primeFramesOfHiddenItems
{
  id v3 = [(RCRecordingView *)self bottomControlsContainerView];
  [v3 frame];
  double v5 = v4;
  [(RCRecordingView *)self frame];
  double v7 = v6;

  id v9 = [(RCRecordingView *)self shuttleBar];
  [v9 setFrame:0.0, v5, v7, 1.0];
  [v9 layoutSubviews];
  double v8 = [(RCRecordingView *)self editingToolbar];
  [v8 setFrame:0.0, v5, v7, 1.0];
  [v8 layoutSubviews];
}

- (void)prepareForPresent:(BOOL)a3
{
  id v12 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v12 hostsTransportAndDoneButtonInBottomSection]) {
    [(RCRecordingView *)self _alignRecordingControlToLeft];
  }
  double v5 = +[UIApplication sharedApplication];
  double v6 = [v5 delegate];
  double v7 = [v6 window];
  [v7 safeAreaInsets];
  double v9 = v8;

  [v12 topMarginMinSafeAreaTopInsetForCardView];
  if (v9 < v10) {
    double v9 = v10;
  }
  [v12 topMarginForCardView];
  [(RCRecordingView *)self setStatusBarHeight:v11 + v9];
  if ([v12 animatesRecordingCardPresentation] && !a3) {
    [(RCRecordingView *)self _dimRecordingDescriptionView:1 animated:0];
  }
}

- (void)completePresent
{
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v6 hostsTransportAndDoneButtonInBottomSection])
  {
    id v3 = [(RCRecordingView *)self doneButton];
    [v3 setEnabled:1 isHidden:0 userInteractionEnabled:1];
  }
  if ([v6 animatesRecordingCardPresentation]) {
    [(RCRecordingView *)self _dimRecordingDescriptionView:0 animated:1];
  }
  [(RCRecordingView *)self _updateMoreButtonMenu];
  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;
  double v5 = [(RCRecordingView *)self recordButton];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)prepareForDismiss
{
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v4 hostsTransportAndDoneButtonInBottomSection]) {
    [(RCRecordingView *)self _alignRecordingControlToCenter];
  }
  id v3 = [(RCRecordingView *)self doneEditingButton];
  [v3 setDoneButtonEnabledState:2];

  if ([v4 animatesRecordingCardPresentation]) {
    [(RCRecordingView *)self addTransitionSpacing];
  }
}

- (void)cleanupAfterDismiss
{
  [(RCRecordingView *)self setRecordingViewState:0];
  id v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v4 = [v3 animatesRecordingCardPresentation];

  if (v4) {
    [(RCRecordingView *)self removeTransitionSpacing];
  }
  UIAccessibilityNotifications v5 = UIAccessibilityLayoutChangedNotification;
  id v6 = [(RCRecordingView *)self recordButton];
  UIAccessibilityPostNotification(v5, v6);
}

- (void)_alignRecordingControlToLeft
{
  id v18 = [(RCRecordingView *)self doneButton];
  id v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(RCRecordingView *)self _recordingControlSidePadding];
  double v5 = v4;
  [(RCRecordingView *)self _doneButtonSidePadding];
  double v7 = v6;
  double v8 = [(RCRecordingView *)self bottomControlsContainerView];
  [v18 alignCenterTrailingToCenterTrailingOfView:v8 padding:v7];

  [(RCRecordingView *)self _supplementaryColumnMinimumCenterXPosition];
  double v10 = v9;
  double v11 = [(RCRecordingView *)self recordButtonCenterXToLeadingConstraint];
  [v11 setConstant:v10];

  id v12 = [(RCRecordingView *)self recordButtonCenterXToViewCenterXConstraint];
  [v12 setActive:0];

  unsigned int v13 = [(RCRecordingView *)self recordButtonCenterXToLeadingConstraint];
  [v13 setActive:1];

  if ([v3 hostsCancelButtonInBottomSection])
  {
    double v14 = [(RCRecordingView *)self cancelButton];
    [v3 cancelButtonBottomAlignmentOffset];
    double v16 = v5 + v15;
    id v17 = [(RCRecordingView *)self bottomControlsContainerView];
    [v14 alignCenterTrailingToCenterTrailingOfView:v17 padding:-v16];
  }
}

- (double)_recordingControlSidePadding
{
  id v3 = [(RCRecordingView *)self recordButton];
  [v3 intrinsicContentSize];
  double v5 = v4;

  [(RCRecordingView *)self _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:v5];
  return result;
}

- (double)_doneButtonSidePadding
{
  id v3 = [(RCRecordingView *)self doneButton];
  [v3 intrinsicContentSize];
  double v5 = v4;

  [(RCRecordingView *)self _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:v5];
  return -v6;
}

- (void)updateForRecordingStart
{
  unint64_t v3 = (unint64_t)[(RCRecordingView *)self recordingViewState] - 4;
  if (v3 > 3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = qword_1001F0320[v3];
  }

  [(RCRecordingView *)self setRecordingViewState:v4];
}

- (void)updateForRecordingEnd:(BOOL)a3
{
  int64_t v5 = [(RCRecordingView *)self displayStyle];
  int64_t v6 = [(RCRecordingView *)self dismissalDisplayStyle];
  if (v5 == 3 || a3)
  {
    if (v5 != v6)
    {
      [(RCRecordingView *)self setRecordingViewState:5];
    }
  }
  else
  {
    [(RCRecordingView *)self setDisplayStyle:v6];
    [(RCRecordingView *)self setRecordingViewState:0];
    [(RCRecordingView *)self setCurrentTime:0.0];
  }
}

- (void)updateForEditingStart
{
  [(RCRecordingView *)self setDisplayStyle:3];
  [(RCRecordingView *)self setRecordingViewState:3];
  [(RCRecordingView *)self currentTime];

  -[RCRecordingView updateRecordButtonViewStateWithCurrentTime:](self, "updateRecordButtonViewStateWithCurrentTime:");
}

- (void)_adjustForHostViewHeight
{
  [(RCRecordingView *)self statusBarHeight];
  double v4 = v3;
  [(RCRecordingView *)self hostViewHeight];
  double v6 = v5;
  [(RCRecordingView *)self editingToolbarHeight];
  double v8 = v7;
  double v9 = v4 + self->_recordingControlSectionHeight + self->_currentTimeReadoutHeight;
  double v10 = [(RCRecordingView *)self bottomFillerView];
  [v10 intrinsicHeight];
  double v12 = v11;

  id v18 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ((id)[(RCRecordingView *)self displayStyle] == (id)2)
  {
    [(RCRecordingView *)self editingToolbarCompactHeight];
    double v8 = v13;
  }
  double v14 = v9 + v12;
  if (([v18 presentsTitleAndAdditionalEditingControlsInRecordingCard] & 1) == 0)
  {
    double v15 = [(RCRecordingView *)self topFullScreenSpacerView];
    [v15 intrinsicHeight];
    double v8 = v16;
  }
  double v17 = v14 + v8;
  if ([v18 shouldShowOverviewWaveform]) {
    double v17 = v17 + self->_fixedOverviewWaveformHeight;
  }
  if ([v18 presentsTitleAndAdditionalEditingControlsInRecordingCard]) {
    double v17 = v17 + self->_fullScreenDescriptionHeight;
  }
  if (([v18 hostsTransportAndDoneButtonInBottomSection] & 1) == 0) {
    double v17 = v17 + self->_shuttleBarHeight;
  }
  [(RCRecordingView *)self setFullScreenWaveFormHeight:v6 - v17];
  [(RCRecordingView *)self _syncSubviewIntrinsicHeights];
}

- (void)updateForSizeChange
{
  double v3 = [(RCRecordingView *)self shuttleBar];
  [v3 updateWidthOnSizeChange];

  [(RCRecordingView *)self _trimDeleteButtonLeftPadding];
  double v5 = v4;
  id v6 = [(RCRecordingView *)self trimDeleteButtonLeftConstantConstraint];
  [v6 setConstant:v5];
}

- (double)_trimDeleteButtonWidth
{
  [(RCTrimButton *)self->_trimToSelectionButton sizeToFit];
  [(RCTrimButton *)self->_trimToSelectionButton bounds];
  double v4 = v3;
  [(RCDeleteButton *)self->_deleteSelectionButton sizeToFit];
  [(RCDeleteButton *)self->_deleteSelectionButton bounds];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 trimDeleteButtonLeftSize];
  double v9 = v8;

  if (v9 >= v6) {
    return v9;
  }
  else {
    return v6;
  }
}

- (double)_trimDeleteButtonHeight
{
  [(RCTrimButton *)self->_trimToSelectionButton sizeToFit];
  [(RCTrimButton *)self->_trimToSelectionButton bounds];
  double v4 = v3;
  [(RCDeleteButton *)self->_deleteSelectionButton sizeToFit];
  [(RCDeleteButton *)self->_deleteSelectionButton bounds];
  if (v4 >= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 trimDeleteButtonLeftSize];
  double v9 = v8;

  if (v9 >= v6) {
    return v9;
  }
  else {
    return v6;
  }
}

- (double)_trimDeleteButtonLeftPadding
{
  [(RCRecordingView *)self _trimDeleteButtonWidth];
  double v4 = v3;
  [(RCRecordingView *)self _trimDeleteButtonWidth];
  double v6 = v5;
  double v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v7 trimDeleteButtonLeftPaddingDistance];
  double v9 = v8;

  [(RCRecordingView *)self _sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:v6 + v4 + v9];
  double v11 = v10;
  [(RCRecordingView *)self _recordingControlSidePadding];
  if (result < v11) {
    return v11;
  }
  return result;
}

- (double)_sidePaddingForElementHorizontallyCenteredInSupplementaryColumn:(double)a3
{
  [(RCRecordingView *)self _supplementaryColumnMinimumCenterXPosition];
  return v4 + a3 * -0.5;
}

- (double)_supplementaryColumnMinimumCenterXPosition
{
  id v2 = +[UIApplication sharedApplication];
  double v3 = [v2 delegate];
  double v4 = [v3 window];
  double v5 = [v4 rootViewController];

  [v5 minimumSupplementaryColumnWidth];
  double v7 = v6 * 0.5;

  return v7;
}

- (void)_syncSubviewIntrinsicHeights
{
  id v33 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (([v33 presentsTitleAndAdditionalEditingControlsInRecordingCard] & 1) == 0)
  {
    [(RCRecordingView *)self topScreenSpacerHeight];
    double v4 = v3;
    double v5 = +[UIApplication sharedApplication];
    double v6 = [v5 delegate];
    double v7 = [v6 window];
    [v7 safeAreaInsets];
    double v9 = v4 + v8;
    double v10 = [(RCRecordingView *)self topFullScreenSpacerView];
    [v10 setIntrinsicHeight:v9];
  }
  [(RCRecordingView *)self recordingControlSectionHeight];
  double v12 = v11;
  double v13 = [(RCRecordingView *)self bottomControlsContainerView];
  [v13 setIntrinsicHeight:v12];

  [(RCRecordingView *)self editingToolbarHeight];
  double v15 = v14;
  double v16 = [(RCRecordingView *)self editingToolbar];
  [v16 setIntrinsicHeight:v15];

  [(RCRecordingView *)self shuttleBarHeight];
  double v18 = v17;
  uint64_t v19 = [(RCRecordingView *)self shuttleBar];
  [v19 setIntrinsicHeight:v18];

  double fixedOverviewWaveformHeight = self->_fixedOverviewWaveformHeight;
  uint64_t v21 = [(RCRecordingView *)self fixedOverviewWaveformContainerView];
  [v21 setIntrinsicHeight:fixedOverviewWaveformHeight];

  int64_t v22 = [(RCRecordingView *)self displayStyle];
  if (v22 == 1) {
    goto LABEL_8;
  }
  if (v22 == 2)
  {
    double editingToolbarCompactHeight = self->_editingToolbarCompactHeight;
    id v28 = [(RCRecordingView *)self editingToolbar];
    [v28 setIntrinsicHeight:editingToolbarCompactHeight];

LABEL_8:
    double bottomAccessoryContentContainerHeight = self->_bottomAccessoryContentContainerHeight;
    v30 = [(RCRecordingView *)self centerContentContainerView];
    [v30 setIntrinsicHeight:bottomAccessoryContentContainerHeight];

    uint64_t v26 = 160;
    goto LABEL_9;
  }
  if (v22 != 3) {
    goto LABEL_10;
  }
  [v33 recordingViewSpaceBetweenToolbarAndDescriptionView];
  double v24 = self->_fullScreenWaveFormHeight - v23;
  id v25 = [(RCRecordingView *)self centerContentContainerView];
  [v25 setIntrinsicHeight:v24];

  uint64_t v26 = 152;
LABEL_9:
  double v31 = *(double *)((char *)&self->super.super.super.isa + v26);
  UIAccessibilityNotifications v32 = [(RCRecordingView *)self descriptionView];
  [v32 setIntrinsicHeight:v31];

LABEL_10:
  [(RCRecordingView *)self invalidateIntrinsicContentSize];
}

- (void)cancelTextEditing
{
  id v2 = [(RCRecordingView *)self textFieldBeingEdited];
  [v2 resignFirstResponder];
}

- (void)_trimInsertReplaceDoneButtonAction:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self viewDelegate];
  [v5 performAction:24 atPosition:v4 source:0.0];
}

- (void)_trimInsertReplaceDoneButtonSaveAsNewAction:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self viewDelegate];
  [v5 performAction:25 atPosition:v4 source:0.0];
}

- (void)toggleTranscriptView:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self viewDelegate];
  [v5 performAction:45 atPosition:v4 source:0.0];
}

- (id)saveMenuForDoneButton:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self saveRecordingAction:v4];
  double v6 = [(RCRecordingView *)self saveAsNewRecordingAction:v4];

  v10[0] = v6;
  v10[1] = v5;
  double v7 = +[NSArray arrayWithObjects:v10 count:2];
  double v8 = +[UIMenu menuWithChildren:v7];

  return v8;
}

- (id)saveAsNewRecordingAction:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  double v6 = [v5 localizedStringForKey:@"SAVE AS NEW RECORDING" value:&stru_100228BC8 table:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100097BC0;
  v10[3] = &unk_100222C48;
  void v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  double v8 = +[UIAction actionWithTitle:v6 image:0 identifier:0 handler:v10];

  return v8;
}

- (void)doneButtonMenuActionTriggered:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self viewDelegate];
  [v5 performAction:5 atPosition:v4 source:0.0];
}

- (void)recordButtonTapped
{
  double v3 = [(RCRecordingView *)self recordButtonRepository];
  id v4 = [v3 state];

  uint64_t v5 = 4;
  switch((unint64_t)v4)
  {
    case 0uLL:
      double v6 = [(RCRecordingView *)self recordButtonRepository];
      id v7 = [v6 trackState];

      if (v7 == (id)2) {
        uint64_t v5 = 4;
      }
      else {
        uint64_t v5 = 1;
      }
      goto LABEL_10;
    case 1uLL:
      uint64_t v5 = 2;
      goto LABEL_10;
    case 2uLL:
      if ((id)[(RCRecordingView *)self displayStyle] == (id)2) {
        uint64_t v5 = 3;
      }
      else {
        uint64_t v5 = 2;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_10;
    case 4uLL:
      uint64_t v5 = 5;
LABEL_10:
      id v8 = [(RCRecordingView *)self viewDelegate];
      [v8 actionActivated:v5];

      break;
    default:
      return;
  }
}

- (void)cancelButtonTapped
{
  id v4 = [(RCRecordingView *)self viewDelegate];
  double v3 = [(RCRecordingView *)self cancelButton];
  [v4 performAction:26 atPosition:v3 source:0.0];
}

- (void)controlActivated:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self cancelButton];

  if (v5 == v4)
  {
    [(RCRecordingView *)self cancelButtonTapped];
  }
  else
  {
    [(RCRecordingView *)self recordButtonTapped];
  }
}

- (void)_handleTrimToSelection
{
  id v4 = [(RCRecordingView *)self viewDelegate];
  double v3 = [(RCRecordingView *)self deleteSelectionButton];
  [v4 performAction:35 atPosition:v3 source:0.0];
}

- (void)_handleDeleteSelection
{
  id v4 = [(RCRecordingView *)self viewDelegate];
  double v3 = [(RCRecordingView *)self deleteSelectionButton];
  [v4 performAction:36 atPosition:v3 source:0.0];
}

- (void)_handleTapToFullscreen:(id)a3
{
  id v4 = a3;
  if ((id)-[RCRecordingView displayStyle](self, "displayStyle") == (id)2 && [v4 state] == (id)3) {
    [(RCRecordingView *)self _switchToFullScreen];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ([(RCRecordingView *)self _stateSupportsDragGesture]) {
    unsigned int v6 = ![(RCRecordingView *)self _touchIsInExcludedView:v5];
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)_touchIsInExcludedView:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v6 = [(RCRecordingView *)self dragGesturePassthroughSpecs];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v11 topLevelView];
        -[RCRecordingView _addSubviewsOfView:includingTopLevelView:toMutableArray:](self, "_addSubviewsOfView:includingTopLevelView:toMutableArray:", v12, [v11 includeTopLevelView], v5);
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [v4 locationInView:self];
  double v13 = -[RCRecordingView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  unsigned __int8 v14 = [v5 containsObject:v13];

  return v14;
}

- (BOOL)_stateSupportsDragGesture
{
  return (id)[(RCRecordingView *)self recordingViewState] != (id)8;
}

- (void)_addSubviewsOfView:(id)a3 includingTopLevelView:(BOOL)a4 toMutableArray:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  double v10 = v9;
  if (v6) {
    [v9 addObject:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = [v8 subviews];
  id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        [v10 addObject:v16];
        [(RCRecordingView *)self _addSubviewsOfView:v16 includingTopLevelView:0 toMutableArray:v10];
      }
      id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)toggleFullCompact
{
  double v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v4 = [v3 supportsCompactRecordingCard];

  if (v4)
  {
    int64_t v5 = [(RCRecordingView *)self displayStyle];
    if (v5 == 3)
    {
      [(RCRecordingView *)self _switchToCompact];
    }
    else if (v5 == 2)
    {
      [(RCRecordingView *)self _switchToFullScreen];
    }
  }
}

- (void)_switchToFullScreen
{
  if ((id)[(RCRecordingView *)self displayStyle] != (id)3)
  {
    [(RCRecordingView *)self setDisplayStyle:3];
    [(RCRecordingView *)self setRecordingViewState:[(RCRecordingView *)self recordingViewState] animated:1 force:1];
    [(RCRecordingView *)self _updateRecordingDescriptionViewForDuration:self->_recordingDuration];
    [(RCRecordingView *)self updateMoreActionsAndPlaybackSettingButtonVisibility];
    UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;
    UIAccessibilityPostNotification(v3, 0);
  }
}

- (void)_switchToCompact
{
  if ((id)[(RCRecordingView *)self displayStyle] != (id)2)
  {
    [(RCRecordingView *)self setDisplayStyle:2];
    [(RCRecordingView *)self setRecordingViewState:[(RCRecordingView *)self recordingViewState] animated:1 force:1];
    [(RCRecordingView *)self _updateRecordingDescriptionViewForDuration:self->_recordingDuration];
    [(RCRecordingView *)self setMoreActionsAndPlaybackSettingsButtonsHidden:1];
    UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;
    UIAccessibilityPostNotification(v3, 0);
  }
}

- (void)_dimRecordingDescriptionView:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = 0.0;
  if (a4)
  {
    id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v7 dimDescriptionViewAnimationDuration];
    double v6 = v8;
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100098590;
  v9[3] = &unk_100221830;
  v9[4] = self;
  BOOL v10 = a3;
  +[UIView animateWithDuration:v9 animations:v6];
}

- (void)addTransitionSpacing
{
  id v2 = [(RCRecordingView *)self topCardSpacerView];
  [v2 setHidden:0];
}

- (void)removeTransitionSpacing
{
  id v2 = [(RCRecordingView *)self topCardSpacerView];
  [v2 setHidden:1];
}

- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5
{
  id v7 = a5;
  id v8 = [(RCRecordingView *)self viewDelegate];
  [(RCRecordingView *)self currentTime];
  [v8 performAction:a3 atPosition:v7];
}

- (void)handleUpdateTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingView *)self viewDelegate];
  [v5 performRenameWithNewTitle:v4];
}

- (void)didBeginEditingInTextField:(id)a3
{
  id v4 = a3;
  if ((id)[(RCRecordingView *)self displayStyle] == (id)2) {
    [(RCRecordingView *)self toggleFullCompact];
  }
  [(RCRecordingView *)self setTextFieldBeingEdited:v4];
}

- (void)didEndEditingInTextField
{
}

- (BOOL)shouldSelectFullTitleAtBeginEditing
{
  id v2 = [(RCRecordingView *)self viewDelegate];
  char v3 = [v2 recordingTitleHasBeenEdited] ^ 1;

  return v3;
}

- (BOOL)accessibilityPerformMagicTap
{
  if ((id)[(RCRecordingView *)self recordingControlState] == (id)1
    || (id)[(RCRecordingView *)self recordingControlState] == (id)2)
  {
    return 0;
  }
  if ((id)[(RCRecordingView *)self displayStyle] != (id)3
    || (id)[(RCRecordingView *)self playControlState] != (id)1)
  {
    if ((id)[(RCRecordingView *)self displayStyle] == (id)3
      && ![(RCRecordingView *)self playControlState])
    {
      char v3 = [(RCRecordingView *)self shuttleBar];
      id v4 = self;
      uint64_t v5 = 0;
      goto LABEL_10;
    }
    return 0;
  }
  char v3 = [(RCRecordingView *)self shuttleBar];
  id v4 = self;
  uint64_t v5 = 1;
LABEL_10:
  [(RCRecordingView *)v4 performControlsAction:v5 position:v3 source:0.0];

  return 1;
}

- (void)didChangePreferredContentSize
{
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v4 fullScreenDescriptionHeight];
  self->_fullScreenDescriptionHeight = v3;
  [(RCRecordingView *)self _adjustForHostViewHeight];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)currentTrackTimeRange
{
  double beginTime = self->_currentTrackTimeRange.beginTime;
  double endTime = self->_currentTrackTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setCurrentTrackTimeRange:(id)a3
{
  self->_currentTrackTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (int64_t)transcriptViewState
{
  return self->_transcriptViewState;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (UIView)transcriptView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transcriptView);

  return (UIView *)WeakRetained;
}

- (UIView)waveformView
{
  return self->_waveformView;
}

- (UIView)trimOverviewWaveformView
{
  return self->_trimOverviewWaveformView;
}

- (double)topScreenSpacerHeight
{
  return self->_topScreenSpacerHeight;
}

- (void)setTopScreenSpacerHeight:(double)a3
{
  self->_topScreenSpacerHeight = a3;
}

- (double)fullScreenWaveFormHeight
{
  return self->_fullScreenWaveFormHeight;
}

- (void)setFullScreenWaveFormHeight:(double)a3
{
  self->_fullScreenWaveFormHeight = a3;
}

- (double)bottomAccessoryContentContainerHeight
{
  return self->_bottomAccessoryContentContainerHeight;
}

- (void)setBottomAccessoryContentContainerHeight:(double)a3
{
  self->_double bottomAccessoryContentContainerHeight = a3;
}

- (double)currentTimeReadoutHeight
{
  return self->_currentTimeReadoutHeight;
}

- (void)setCurrentTimeReadoutHeight:(double)a3
{
  self->_currentTimeReadoutHeight = a3;
}

- (double)fullScreenDescriptionHeight
{
  return self->_fullScreenDescriptionHeight;
}

- (void)setFullScreenDescriptionHeight:(double)a3
{
  self->_fullScreenDescriptionHeight = a3;
}

- (double)bottomAccessoryDescriptionHeight
{
  return self->_bottomAccessoryDescriptionHeight;
}

- (void)setBottomAccessoryDescriptionHeight:(double)a3
{
  self->_bottomAccessoryDescriptionHeight = a3;
}

- (double)editingToolbarHeight
{
  return self->_editingToolbarHeight;
}

- (void)setEditingToolbarHeight:(double)a3
{
  self->_editingToolbarHeight = a3;
}

- (double)editingToolbarCompactHeight
{
  return self->_editingToolbarCompactHeight;
}

- (void)setEditingToolbarCompactHeight:(double)a3
{
  self->_double editingToolbarCompactHeight = a3;
}

- (double)shuttleBarHeight
{
  return self->_shuttleBarHeight;
}

- (void)setShuttleBarHeight:(double)a3
{
  self->_shuttleBarHeight = a3;
}

- (double)hostViewHeight
{
  return self->_hostViewHeight;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (void)setCardPresentationDelegate:(id)a3
{
}

- (BOOL)blurThroughEffectsActive
{
  return self->_blurThroughEffectsActive;
}

- (void)setBlurThroughEffectsActive:(BOOL)a3
{
  self->_blurThroughEffectsActive = a3;
}

- (BOOL)allowsNewRecordings
{
  return self->_allowsNewRecordings;
}

- (void)setTextFieldBeingEdited:(id)a3
{
}

- (void)setCancelButton:(id)a3
{
}

- (void)setShuttleBar:(id)a3
{
}

- (void)setOverviewBeginTimeLabel:(id)a3
{
}

- (void)setOverviewEndTimeLabel:(id)a3
{
}

- (void)setTrimToSelectionButton:(id)a3
{
}

- (void)setDeleteSelectionButton:(id)a3
{
}

- (void)setProgressOverlay:(id)a3
{
}

- (double)recordingControlSectionHeight
{
  return self->_recordingControlSectionHeight;
}

- (void)setRecordingControlSectionHeight:(double)a3
{
  self->_double recordingControlSectionHeight = a3;
}

- (double)fixedOverviewWaveformHeight
{
  return self->_fixedOverviewWaveformHeight;
}

- (void)setFixedOverviewWaveformHeight:(double)a3
{
  self->_double fixedOverviewWaveformHeight = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (NSArray)dragGesturePassthroughSpecs
{
  return self->_dragGesturePassthroughSpecs;
}

- (void)setDragGesturePassthroughSpecs:(id)a3
{
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneEditingButton, 0);
  objc_storeStrong((id *)&self->_editingToolbar, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_recordButton, 0);
  objc_storeStrong((id *)&self->_moreButtonMenuCreator, 0);
  objc_storeStrong((id *)&self->_dragGesturePassthroughSpecs, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_trimDeleteButtonLeftConstantConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonCenterXToViewCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_recordButtonCenterXToLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_buttonsAndDescriptionContainerView, 0);
  objc_storeStrong((id *)&self->_moreActionsButton, 0);
  objc_storeStrong((id *)&self->_playbackSettingsButton, 0);
  objc_storeStrong((id *)&self->_progressOverlay, 0);
  objc_storeStrong((id *)&self->_deleteSelectionButton, 0);
  objc_storeStrong((id *)&self->_trimToSelectionButton, 0);
  objc_storeStrong((id *)&self->_bottomFillerView, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainerView, 0);
  objc_storeStrong((id *)&self->_topCardSpacerView, 0);
  objc_storeStrong((id *)&self->_topFullScreenSpacerView, 0);
  objc_storeStrong((id *)&self->_currentTimeLabel, 0);
  objc_storeStrong((id *)&self->_overviewEndTimeLabel, 0);
  objc_storeStrong((id *)&self->_overviewBeginTimeLabel, 0);
  objc_storeStrong((id *)&self->_trimOverviewWaveformContainerView, 0);
  objc_storeStrong((id *)&self->_fixedOverviewWaveformContainerView, 0);
  objc_storeStrong((id *)&self->_centerContentContainerView, 0);
  objc_storeStrong((id *)&self->_shuttleBar, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_recordButtonFactory, 0);
  objc_destroyWeak((id *)&self->_textFieldBeingEdited);
  objc_storeStrong((id *)&self->_mainContainerStackView, 0);
  objc_storeStrong((id *)&self->_recordButtonRepository, 0);
  objc_destroyWeak((id *)&self->_cardPresentationDelegate);
  objc_destroyWeak((id *)&self->_viewDelegate);
  objc_storeStrong((id *)&self->_transcriptionButton, 0);

  objc_destroyWeak((id *)&self->_transcriptView);
}

@end