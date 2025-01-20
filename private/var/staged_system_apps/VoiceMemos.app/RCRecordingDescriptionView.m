@interface RCRecordingDescriptionView
+ (RCRecordingDescriptionView)descriptionViewWithStyle:(int64_t)a3;
- (BOOL)_setupMoreButtonIfNeeded;
- (BOOL)displayTranscriptAvailableIcon;
- (BOOL)hasMultipleTracks;
- (BOOL)isInCompactDisplayMode;
- (BOOL)isTitleAccessible;
- (BOOL)isTitleFieldAccessible;
- (BOOL)showDownloading;
- (BOOL)showSaving;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)titleEditingAllowed;
- (BOOL)wasManuallyRenamed;
- (NSDate)creationDate;
- (NSString)UUID;
- (NSString)axCreationDateString;
- (NSString)axDurationString;
- (NSString)axMultiTrackIndicatorString;
- (NSString)axTranscriptAvailableString;
- (NSString)preEditingName;
- (NSString)recordingTitle;
- (NUIContainerStackView)dateAndDurationStack;
- (NUIContainerStackView)titleDateDurationStack;
- (RCControlsActionDelegate)actionDelegate;
- (RCRecordingDescriptionView)initWithCoder:(id)a3;
- (RCRecordingDescriptionView)initWithFrame:(CGRect)a3;
- (RCRecordingDescriptionView)initWithStyle:(int64_t)a3;
- (RCRecordingDescriptionViewDelegate)recordingDescriptionViewDelegate;
- (RCRecordingDescriptionViewLabelConfiguration)labelConfiguration;
- (RCTextField)titleTextField;
- (UIButton)moreButton;
- (UIImageView)multiTrackIndicatorImageView;
- (UIImageView)transcriptAvailableImageView;
- (UILabel)creationDateOrDownloadingLabel;
- (UILabel)durationLabel;
- (UILabel)titleLabel;
- (UIView)dateAndDurationEmptySpacerView;
- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)moreButtonMenuCreator;
- (double)intrinsicHeight;
- (double)recordingDuration;
- (id)_backgroundColorAnimation;
- (id)accessibilityElements;
- (int64_t)presentedControl;
- (int64_t)style;
- (void)_animateLabel:(id)a3 textColor:(id)a4 duration:(double)a5;
- (void)_animateTextField:(id)a3 textColor:(id)a4 duration:(double)a5;
- (void)_applyLabelConfiguration;
- (void)_commonInitWithStyle:(int64_t)a3;
- (void)_endEditingTitleDueToNotification;
- (void)_maybeSelectAllTextFieldText;
- (void)_setArrangedSubviewsWithTitleDateDurationStack:(id)a3 moreButton:(id)a4;
- (void)_setupConfigurationForStyle:(int64_t)a3;
- (void)_setupStackForStyle:(int64_t)a3;
- (void)_setupTitleLabel;
- (void)_setupTitleTextField;
- (void)_styleTitle;
- (void)_styleView;
- (void)_switchToTitleTextField;
- (void)_syncDurationVisibility;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)_updateCreationDateOrDownloadingLabel;
- (void)_updateForPresentedControlsOptions;
- (void)_updateMoreButtonMenu;
- (void)_updateMultitrackIndicatorViewVisibility;
- (void)_updateStackIfNeeded;
- (void)_updateTextFieldFocusabilityForStyle:(int64_t)a3;
- (void)_updateTranscriptAvailableViewVisibility;
- (void)addTitleAccessibilityTraits:(unint64_t)a3;
- (void)beginEditingTitle;
- (void)configureLineBreakMode:(BOOL)a3 force:(BOOL)a4;
- (void)deviceTranscriptionSupportDidChange:(BOOL)a3;
- (void)endEditingTitle;
- (void)localeDidChange;
- (void)removeTitleAccessibilityTraits:(unint64_t)a3;
- (void)restyle;
- (void)setActionDelegate:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCreationDateOrDownloadingLabel:(id)a3;
- (void)setDateAndDurationEmptySpacerView:(id)a3;
- (void)setDisplayTranscriptAvailableIcon:(BOOL)a3;
- (void)setDurationLabel:(id)a3;
- (void)setDurationLabelAccessible:(BOOL)a3;
- (void)setHasMultipleTracks:(BOOL)a3;
- (void)setIntrinsicHeight:(double)a3;
- (void)setIsInCompactDisplayMode:(BOOL)a3;
- (void)setLabelConfiguration:(id)a3;
- (void)setMoreButton:(id)a3;
- (void)setMoreButtonMenuCreator:(id)a3;
- (void)setMultiTrackIndicatorImageView:(id)a3;
- (void)setPreEditingName:(id)a3;
- (void)setPresentedControl:(int64_t)a3;
- (void)setRecordingDescriptionViewDelegate:(id)a3;
- (void)setRecordingDuration:(double)a3;
- (void)setRecordingDuration:(double)a3 withHiddenLabel:(BOOL)a4 withHiddenSubcomponents:(BOOL)a5 isDurationLabelAX:(BOOL)a6;
- (void)setRecordingTitle:(id)a3;
- (void)setShowDownloading:(BOOL)a3;
- (void)setShowSaving:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitleAccessible:(BOOL)a3;
- (void)setTitleEditingAllowed:(BOOL)a3;
- (void)setTitleFieldAccessible:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleTextField:(id)a3;
- (void)setTranscriptAvailableImageView:(id)a3;
- (void)setUUID:(id)a3;
- (void)setWasManuallyRenamed:(BOOL)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateForDisplayMode:(int64_t)a3;
@end

@implementation RCRecordingDescriptionView

- (void)_switchToTitleTextField
{
  [(RCRecordingDescriptionView *)self _setupTitleTextField];
  v3 = [(RCRecordingDescriptionView *)self titleTextField];
  v4 = [(NUIContainerStackView *)self->_titleDateDurationStack arrangedSubviews];
  id v5 = [v4 count];

  if (!v5) {
    goto LABEL_6;
  }
  v6 = [(NUIContainerStackView *)self->_titleDateDurationStack arrangedSubviews];
  v7 = [v6 objectAtIndexedSubscript:0];

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v8 = [(RCRecordingDescriptionView *)self titleLabel];
    v9 = [v8 text];
    [v3 setText:v9];

    dateAndDurationStack = self->_dateAndDurationStack;
    v12[0] = v3;
    v12[1] = dateAndDurationStack;
    v11 = +[NSArray arrayWithObjects:v12 count:2];
    [(NUIContainerStackView *)self->_titleDateDurationStack setArrangedSubviews:v11];

    [(RCRecordingDescriptionView *)self _setArrangedSubviewsWithTitleDateDurationStack:self->_titleDateDurationStack moreButton:self->_moreButton];
LABEL_6:
    [(RCRecordingDescriptionView *)self setTitleLabel:0];
    goto LABEL_7;
  }

LABEL_7:
}

- (void)updateForDisplayMode:(int64_t)a3
{
  self->_isInCompactDisplayMode = a3 == 0;
  id v8 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v5 = [v8 durationLabelFont];
  [v8 descriptionViewTitleToSecondaryPadding];
  if (!a3)
  {
    uint64_t v6 = [v8 durationLabelFontForCompactRecordingView];

    [v8 descriptionCompactViewTitleToSecondaryPadding];
    id v5 = (void *)v6;
  }
  -[NUIContainerStackView setSpacing:](self->_titleDateDurationStack, "setSpacing:");
  [(UILabel *)self->_creationDateOrDownloadingLabel setHidden:a3 == 0];
  v7 = [(RCRecordingDescriptionView *)self durationLabel];
  [v7 setFont:v5];

  [(RCRecordingDescriptionView *)self _updateTranscriptAvailableViewVisibility];
  [(RCRecordingDescriptionView *)self _updateMultitrackIndicatorViewVisibility];
  [(RCRecordingDescriptionView *)self _styleView];
}

- (void)_setupTitleTextField
{
  uint64_t v3 = [(RCRecordingDescriptionView *)self titleTextField];
  if (!v3)
  {
    v11 = -[RCTextField initWithFrame:]([RCTextField alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(RCRecordingDescriptionView *)self setTitleTextField:v11];
    [(RCTextField *)v11 setAutocapitalizationType:2];
    [(RCTextField *)v11 setDelegate:self];
    [(RCTextField *)v11 setAdjustsFontForContentSizeCategory:1];
    if ((id)[(RCRecordingDescriptionView *)self style] == (id)2)
    {
      LODWORD(v4) = 1132068864;
      -[RCTextField setLayoutSize:withContentPriority:](v11, "setLayoutSize:withContentPriority:", 10.0, NUIContainerViewLengthUseDefault, v4);
    }
    if ((id)[(RCRecordingDescriptionView *)self style] == (id)1
      || ![(RCRecordingDescriptionView *)self style])
    {
      id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v5 playbackViewTitleTextInsets];
      -[RCTextField setCustomAlignmentRectInsets:](v11, "setCustomAlignmentRectInsets:");
    }
    [(RCRecordingDescriptionView *)self configureLineBreakMode:self->_wasManuallyRenamed force:1];
    uint64_t v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    if ([v6 expandsRecordingsCollectionViewItemOnSelection])
    {

LABEL_13:
      uint64_t v3 = (uint64_t)v11;
      goto LABEL_14;
    }
    v7 = [(RCRecordingDescriptionView *)self titleTextField];
    id v8 = [v7 text];
    if ([v8 isEqualToString:&stru_100228BC8])
    {
    }
    else
    {
      v9 = [(RCRecordingDescriptionView *)self titleTextField];
      v10 = [v9 text];

      if (v10) {
        goto LABEL_13;
      }
    }
    [(RCRecordingDescriptionView *)self setTitleAccessible:0];
    goto LABEL_13;
  }
LABEL_14:
  id v12 = (id)v3;
  [(RCRecordingDescriptionView *)self _styleTitle];
  [(RCRecordingDescriptionView *)self _applyLabelConfiguration];
}

- (NSString)recordingTitle
{
  return self->_recordingTitle;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)_commonInitWithStyle:(int64_t)a3
{
  [(RCRecordingDescriptionView *)self setArrangedSubviewRemovalPolicy:2];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"localeDidChange" name:NSCurrentLocaleDidChangeNotification object:0];

  uint64_t v6 = +[TranscriptionAvailabilityProvider shared];
  [v6 registerObserver:self];

  v7 = +[UIColor clearColor];
  [(RCRecordingDescriptionView *)self setBackgroundColor:v7];

  id v8 = objc_opt_new();
  [(RCRecordingDescriptionView *)self setCreationDateOrDownloadingLabel:v8];
  [v8 setAdjustsFontForContentSizeCategory:1];
  if (a3 == 2)
  {
    LODWORD(v9) = 1148846080;
    [v8 setContentHuggingPriority:0 forAxis:v9];
  }
  v38 = v8;
  v10 = objc_opt_new();
  [(RCRecordingDescriptionView *)self setDurationLabel:v10];
  [v10 setAdjustsFontForContentSizeCategory:1];
  [v10 setNumberOfLines:0];
  if (a3 == 2)
  {
    LODWORD(v11) = 1144750080;
    [v10 setContentHuggingPriority:0 forAxis:v11];
  }
  id v12 = +[RCRecorderStyleProvider sharedStyleProvider];
  uint64_t v13 = [v12 transcriptionImage];

  v37 = (void *)v13;
  id v14 = [objc_alloc((Class)UIImageView) initWithImage:v13];
  LODWORD(v15) = 1148846080;
  [v14 setContentHuggingPriority:0 forAxis:v15];
  [v14 setContentMode:1];
  [v14 setHidden:1];
  [v14 setIsAccessibilityElement:1];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"AX_TRANSCRIPTION_AVAILABLE" value:&stru_100228BC8 table:0];
  [v14 setAccessibilityLabel:v17];

  UIAccessibilityTraits v18 = UIAccessibilityTraitNone;
  [v14 setAccessibilityTraits:UIAccessibilityTraitNone];
  [(RCRecordingDescriptionView *)self setTranscriptAvailableImageView:v14];
  v19 = +[RCRecorderStyleProvider sharedStyleProvider];
  v20 = [v19 multiTrackIndicatorImage];

  id v21 = [objc_alloc((Class)UIImageView) initWithImage:v20];
  LODWORD(v22) = 1148846080;
  [v21 setContentHuggingPriority:0 forAxis:v22];
  [v21 setContentMode:1];
  [v21 setHidden:1];
  [v21 setIsAccessibilityElement:1];
  v23 = +[NSBundle mainBundle];
  v24 = [v23 localizedStringForKey:@"AX_MULTIPLE_LAYERS_INDICATOR" value:&stru_100228BC8 table:0];
  [v21 setAccessibilityLabel:v24];

  [v21 setAccessibilityTraits:v18];
  [(RCRecordingDescriptionView *)self setMultiTrackIndicatorImageView:v21];
  id v25 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 10.0, 10.0];
  LODWORD(v26) = 1132068864;
  [v25 setContentHuggingPriority:0 forAxis:v26];
  LODWORD(v27) = 1144750080;
  [v25 setContentCompressionResistancePriority:0 forAxis:v27];
  [(RCRecordingDescriptionView *)self setDateAndDurationEmptySpacerView:v25];
  v28 = +[NSNotificationCenter defaultCenter];
  [v28 addObserver:self selector:"didChangePreferredContentSize" name:UIContentSizeCategoryDidChangeNotification object:0];

  v29 = [(RCRecordingDescriptionView *)self titleTextField];
  v30 = [v29 text];
  LODWORD(v13) = [v30 isEqualToString:&stru_100228BC8];

  if (v13) {
    [(RCRecordingDescriptionView *)self setTitleAccessible:0];
  }
  self->_style = v36;
  -[RCRecordingDescriptionView _updateTextFieldFocusabilityForStyle:](self, "_updateTextFieldFocusabilityForStyle:");
  [(RCRecordingDescriptionView *)self _setupStackForStyle:self->_style];
  [(RCRecordingDescriptionView *)self _setupConfigurationForStyle:self->_style];
  [(RCRecordingDescriptionView *)self _styleView];
  v31 = +[NSNotificationCenter defaultCenter];
  [v31 addObserver:self selector:"_endEditingTitleDueToNotification" name:@"RecordingDescriptionViewShouldEndEditingNotificationName" object:0];

  v32 = self;
  v39[0] = v32;
  v33 = self;
  v39[1] = v33;
  v34 = +[NSArray arrayWithObjects:v39 count:2];
  id v35 = [(RCRecordingDescriptionView *)self registerForTraitChanges:v34 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
}

- (void)_applyLabelConfiguration
{
  uint64_t v3 = [(RCRecordingDescriptionView *)self labelConfiguration];
  double v4 = [v3 recordingTitleEditingTintColor];
  id v5 = [(RCRecordingDescriptionView *)self titleTextField];
  [v5 setTintColor:v4];

  uint64_t v6 = [(RCRecordingDescriptionView *)self _backgroundColorAnimation];
  id v36 = v6;
  if (v6)
  {
    [v6 duration];
    double v8 = v7;
    double v9 = [(RCRecordingDescriptionView *)self titleTextField];
    v10 = [(RCRecordingDescriptionView *)self labelConfiguration];
    double v11 = [v10 recordingTitleTextColor];
    [(RCRecordingDescriptionView *)self _animateTextField:v9 textColor:v11 duration:v8];

    id v12 = [(RCRecordingDescriptionView *)self titleLabel];
    uint64_t v13 = [(RCRecordingDescriptionView *)self labelConfiguration];
    id v14 = [v13 recordingTitleTextColor];
    [(RCRecordingDescriptionView *)self _animateLabel:v12 textColor:v14 duration:v8];

    double v15 = [(RCRecordingDescriptionView *)self durationLabel];
    v16 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v17 = [v16 subtitleTextColor];
    [(RCRecordingDescriptionView *)self _animateLabel:v15 textColor:v17 duration:v8];

    UIAccessibilityTraits v18 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    v19 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v20 = [v19 subtitleTextColor];
    [(RCRecordingDescriptionView *)self _animateLabel:v18 textColor:v20 duration:v8];
  }
  else
  {
    id v21 = [(RCRecordingDescriptionView *)self labelConfiguration];
    double v22 = [v21 recordingTitleTextColor];
    v23 = [(RCRecordingDescriptionView *)self titleTextField];
    [v23 setTextColor:v22];

    v24 = [(RCRecordingDescriptionView *)self labelConfiguration];
    id v25 = [v24 recordingTitleTextColor];
    double v26 = [(RCRecordingDescriptionView *)self titleLabel];
    [v26 setTextColor:v25];

    double v27 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v28 = [v27 subtitleTextColor];
    v29 = [(RCRecordingDescriptionView *)self durationLabel];
    [v29 setTextColor:v28];

    v30 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v31 = [v30 subtitleTextColor];
    v32 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    [v32 setTextColor:v31];

    v33 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v34 = [v33 subtitleTextColor];
    id v35 = [(RCRecordingDescriptionView *)self transcriptAvailableImageView];
    [v35 setTintColor:v34];

    UIAccessibilityTraits v18 = [(RCRecordingDescriptionView *)self labelConfiguration];
    v19 = [v18 subtitleTextColor];
    v20 = [(RCRecordingDescriptionView *)self multiTrackIndicatorImageView];
    [v20 setTintColor:v19];
  }
}

- (RCRecordingDescriptionViewLabelConfiguration)labelConfiguration
{
  return self->_labelConfiguration;
}

- (RCTextField)titleTextField
{
  return self->_titleTextField;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)transcriptAvailableImageView
{
  return self->_transcriptAvailableImageView;
}

- (UIImageView)multiTrackIndicatorImageView
{
  return self->_multiTrackIndicatorImageView;
}

- (id)_backgroundColorAnimation
{
  v2 = [(RCRecordingDescriptionView *)self window];
  uint64_t v3 = [v2 windowScene];
  double v4 = [v3 delegate];

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

- (void)_updateTranscriptAvailableViewVisibility
{
  uint64_t v3 = +[TranscriptionAvailabilityProvider shared];
  unsigned int v4 = [v3 deviceIsSupported];

  if (self->_displayTranscriptAvailableIcon) {
    uint64_t v5 = v4 ^ 1;
  }
  else {
    uint64_t v5 = 1;
  }
  transcriptAvailableImageView = self->_transcriptAvailableImageView;

  [(UIImageView *)transcriptAvailableImageView setHidden:v5];
}

- (void)setTranscriptAvailableImageView:(id)a3
{
}

- (void)setMultiTrackIndicatorImageView:(id)a3
{
}

- (void)setDurationLabel:(id)a3
{
}

- (void)setDateAndDurationEmptySpacerView:(id)a3
{
}

- (void)setCreationDateOrDownloadingLabel:(id)a3
{
}

- (void)_styleView
{
  id v9 = +[RCRecorderStyleProvider sharedStyleProvider];
  int64_t v3 = [(RCRecordingDescriptionView *)self style];
  unsigned int v4 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
  uint64_t v5 = [v9 creationDateLabelFont];
  [v4 setFont:v5];

  if (v3 == 2)
  {
    uint64_t v6 = [v9 creationDateLabelFontForRecordingCollectionViewCell];
    [v4 setFont:v6];
  }
  [(RCRecordingDescriptionView *)self _styleTitle];
  double v7 = [v9 durationLabelFont];
  double v8 = [(RCRecordingDescriptionView *)self durationLabel];
  [v8 setFont:v7];

  [(RCRecordingDescriptionView *)self setStyle:v3];
}

- (void)_updateTextFieldFocusabilityForStyle:(int64_t)a3
{
  if (a3
    || (+[RCRecorderStyleProvider sharedStyleProvider],
        unsigned int v4 = objc_claimAutoreleasedReturnValue(),
        unsigned int v5 = [v4 disablesFocusInRecordingViewTitle],
        v4,
        !v5))
  {
    uint64_t v6 = [(RCRecordingDescriptionView *)self titleTextField];
    id v8 = v6;
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = [(RCRecordingDescriptionView *)self titleTextField];
    id v8 = v6;
    uint64_t v7 = 1;
  }
  [v6 setFocusDisabled:v7];
}

- (void)_styleTitle
{
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  int64_t v3 = [(RCRecordingDescriptionView *)self titleLabel];
  unsigned int v4 = [(RCRecordingDescriptionView *)self titleTextField];
  if ((id)[(RCRecordingDescriptionView *)self style] == (id)2) {
    [v6 descriptionViewScalableTitleFontForRecordingCollectionViewCell];
  }
  else {
  unsigned int v5 = [v6 descriptionViewScalableTitleFontForCardView];
  }
  [v4 setFont:v5];
  [v3 setFont:v5];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  -[RCRecordingDescriptionView _setupConfigurationForStyle:](self, "_setupConfigurationForStyle:");

  [(RCRecordingDescriptionView *)self _updateTextFieldFocusabilityForStyle:a3];
}

- (void)_setupStackForStyle:(int64_t)a3
{
  unsigned int v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v6 = v5;
  if (a3 == 2 && [v5 usesTitleLabelPerfOptimization])
  {
    [(RCRecordingDescriptionView *)self _setupTitleLabel];
    uint64_t v7 = [(RCRecordingDescriptionView *)self titleLabel];
  }
  else
  {
    [(RCRecordingDescriptionView *)self _setupTitleTextField];
    [(RCRecordingDescriptionView *)self setTitleEditingAllowed:1];
    uint64_t v7 = [(RCRecordingDescriptionView *)self titleTextField];
  }
  id v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002B504;
  v11[3] = &unk_100221C60;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  int64_t v14 = a3;
  id v9 = v6;
  id v10 = v8;
  [(RCRecordingDescriptionView *)self performBatchUpdates:v11];
}

- (void)setRecordingDuration:(double)a3 withHiddenLabel:(BOOL)a4 withHiddenSubcomponents:(BOOL)a5 isDurationLabelAX:(BOOL)a6
{
  BOOL v6 = a4;
  self->_recordingDuration = a3;
  if (a6)
  {
    double v8 = round(a3);
    id v9 = [(RCRecordingDescriptionView *)self durationLabel];
    [v9 setIsAccessibilityElement:1];

    id v10 = +[NSBundle mainBundle];
    double v11 = [v10 localizedStringForKey:@"DURATION" value:&stru_100228BC8 table:0];
    id v12 = [(RCRecordingDescriptionView *)self durationLabel];
    [v12 setAccessibilityLabel:v11];

    id v13 = [(RCRecordingDescriptionView *)self durationLabel];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000591B8;
    v18[3] = &unk_100221C10;
    *(double *)&v18[4] = v8;
    [v13 _setAccessibilityValueBlock:v18];
  }
  else
  {
    id v13 = [(RCRecordingDescriptionView *)self durationLabel];
    [v13 setIsAccessibilityElement:0];
  }

  int64_t v14 = [(RCRecordingDescriptionView *)self durationLabel];
  if (v6)
  {
    [(RCRecordingDescriptionView *)self recordingDuration];
    RCLocalizedPlaybackTime();
  }
  else
  {
    RCLocalizedDurationWithHiddenComponents();
  double v15 = };
  v16 = [v14 text];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0) {
    [v14 setText:v15];
  }
  if ([(UILabel *)self->_creationDateOrDownloadingLabel isHidden] != v6) {
    [(UILabel *)self->_creationDateOrDownloadingLabel setHidden:v6];
  }
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)_updateCreationDateOrDownloadingLabel
{
  id v22 = [(RCRecordingDescriptionView *)self creationDate];
  if ([(RCRecordingDescriptionView *)self showDownloading])
  {
    int64_t v3 = +[NSBundle mainBundle];
    unsigned int v4 = v3;
    CFStringRef v5 = @"MEMO_IS_DOWNLOADING";
LABEL_5:
    BOOL v6 = [v3 localizedStringForKey:v5 value:&stru_100228BC8 table:0];

    uint64_t v7 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    double v8 = [v7 text];
    unsigned __int8 v9 = [v6 isEqualToString:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
      [v10 setText:v6];
    }
    double v11 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    [v11 setAccessibilityLabel:v6];

    goto LABEL_8;
  }
  if ([(RCRecordingDescriptionView *)self showSaving])
  {
    int64_t v3 = +[NSBundle mainBundle];
    unsigned int v4 = v3;
    CFStringRef v5 = @"SAVING_CHANGES";
    goto LABEL_5;
  }
  if (v22)
  {
    id v12 = +[RCRecorderStyleProvider sharedStyleProvider];
    id v13 = [(RCRecordingDescriptionView *)self UUID];
    BOOL v6 = [v12 formattedDateStringFromDate:v22 forUUID:v13];

    int64_t v14 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    double v15 = [v14 text];
    unsigned __int8 v16 = [v6 isEqualToString:v15];

    if ((v16 & 1) == 0)
    {
      unsigned __int8 v17 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
      [v17 setText:v6];
    }
    UIAccessibilityTraits v18 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    [v18 setIsAccessibilityElement:1];

    v19 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    v20 = [v19 text];
    id v21 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    [v21 setAccessibilityLabel:v20];
  }
  else
  {
    BOOL v6 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    [v6 setIsAccessibilityElement:0];
  }
LABEL_8:
}

- (UILabel)creationDateOrDownloadingLabel
{
  return self->_creationDateOrDownloadingLabel;
}

- (BOOL)showSaving
{
  return self->_showSaving;
}

- (BOOL)showDownloading
{
  return self->_showDownloading;
}

- (void)_setupTitleLabel
{
  int64_t v3 = [(RCRecordingDescriptionView *)self titleLabel];
  if (!v3)
  {
    id v6 = (id)objc_opt_new();
    if ((id)[(RCRecordingDescriptionView *)self style] == (id)1
      || ![(RCRecordingDescriptionView *)self style])
    {
      unsigned int v4 = +[RCRecorderStyleProvider sharedStyleProvider];
      [v4 playbackViewTitleTextInsets];
      [v6 setCustomAlignmentRectInsets:];
    }
    [(RCRecordingDescriptionView *)self setTitleLabel:v6];
    [v6 setAdjustsFontForContentSizeCategory:1];
    if ((id)[(RCRecordingDescriptionView *)self style] == (id)2)
    {
      LODWORD(v5) = 1132068864;
      [v6 setLayoutSize:10.0 withContentPriority:NUIContainerViewLengthUseDefault v5];
    }
    [(RCRecordingDescriptionView *)self configureLineBreakMode:self->_wasManuallyRenamed force:1];
    int64_t v3 = v6;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (void)configureLineBreakMode:(BOOL)a3 force:(BOOL)a4
{
  if (a3) {
    int64_t v4 = 4;
  }
  else {
    int64_t v4 = 5;
  }
  if (v4 != self->_lineBreakMode || a4)
  {
    self->_lineBreakMode = v4;
    uint64_t v7 = [(RCRecordingDescriptionView *)self titleLabel];
    [v7 setLineBreakMode:v4];

    double v8 = [(RCRecordingDescriptionView *)self titleTextField];
    if (v8)
    {
      id v18 = v8;
      unsigned __int8 v9 = [v8 defaultTextAttributes];
      id v10 = v9;
      if (v9)
      {
        double v11 = [v9 objectForKeyedSubscript:NSParagraphStyleAttributeName];
        id v12 = v11;
        if (!v11 || [v11 lineBreakMode] != self->_lineBreakMode)
        {
          id v13 = objc_alloc_init((Class)NSMutableParagraphStyle);
          [v13 setLineBreakMode:self->_lineBreakMode];
          int64_t v14 = [(RCRecordingDescriptionView *)self titleTextField];
          double v15 = [v14 defaultTextAttributes];
          id v16 = [v15 mutableCopy];

          [v16 setObject:v13 forKeyedSubscript:NSParagraphStyleAttributeName];
          unsigned __int8 v17 = [(RCRecordingDescriptionView *)self titleTextField];
          [v17 setDefaultTextAttributes:v16];
        }
      }

      double v8 = v18;
    }
  }
}

- (void)setTitleLabel:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)_setupConfigurationForStyle:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      uint64_t v5 = +[RCRecordingDescriptionViewLabelConfiguration recordingViewConfiguration];
      goto LABEL_6;
    case 1:
      uint64_t v5 = +[RCRecordingDescriptionViewLabelConfiguration playbackViewConfiguration];
      goto LABEL_6;
    case 2:
      uint64_t v5 = +[RCRecordingDescriptionViewLabelConfiguration recordingCollectionViewCellConfiguration];
      goto LABEL_6;
    case 3:
    case 4:
      uint64_t v5 = +[RCRecordingDescriptionViewLabelConfiguration emptyConfiguration];
LABEL_6:
      id v6 = (id)v5;
      [(RCRecordingDescriptionView *)self setLabelConfiguration:v5];

      break;
    default:
      return;
  }
}

- (void)setLabelConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_labelConfiguration, a3);

  [(RCRecordingDescriptionView *)self _applyLabelConfiguration];
}

- (BOOL)titleEditingAllowed
{
  return self->_titleEditingAllowed;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  if (self->_wasManuallyRenamed != a3)
  {
    self->_wasManuallyRenamed = a3;
    -[RCRecordingDescriptionView configureLineBreakMode:force:](self, "configureLineBreakMode:force:");
  }
}

- (void)setShowDownloading:(BOOL)a3
{
  if (self->_showDownloading != a3)
  {
    self->_showDownloading = a3;
    [(RCRecordingDescriptionView *)self _syncDurationVisibility];
    [(RCRecordingDescriptionView *)self _updateCreationDateOrDownloadingLabel];
    [(RCRecordingDescriptionView *)self layoutSubviews];
  }
}

- (void)setRecordingTitle:(id)a3
{
  id v11 = a3;
  int64_t v4 = (NSString *)[v11 copy];
  recordingTitle = self->_recordingTitle;
  self->_recordingTitle = v4;

  id v6 = [(RCRecordingDescriptionView *)self titleTextField];
  uint64_t v7 = [v6 text];
  double v8 = v7;
  if (v6 && (!v7 || ([v7 isEqualToString:v11] & 1) == 0)) {
    [v6 setText:v11];
  }
  unsigned __int8 v9 = [(RCRecordingDescriptionView *)self titleLabel];
  [v9 setText:v11];

  if (v11)
  {
    if (![v11 isEqualToString:&stru_100228BC8])
    {
      uint64_t v10 = 1;
      goto LABEL_10;
    }
    if (![v11 isEqualToString:&stru_100228BC8]) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = 0;
LABEL_10:
  [(RCRecordingDescriptionView *)self setTitleAccessible:v10];
LABEL_11:
}

- (void)setTitleAccessible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(RCRecordingDescriptionView *)self titleTextField];
  [v5 setIsAccessibilityElement:v3];

  id v6 = [(RCRecordingDescriptionView *)self titleLabel];
  [v6 setIsAccessibilityElement:v3];
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
  id v5 = a3;
  id v6 = [(RCRecordingDescriptionView *)self moreButtonMenuCreator];
  [v6 setRecordingUUID:v5];
}

- (_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator)moreButtonMenuCreator
{
  return self->_moreButtonMenuCreator;
}

- (void)setDisplayTranscriptAvailableIcon:(BOOL)a3
{
  self->_displayTranscriptAvailableIcon = a3;
  [(RCRecordingDescriptionView *)self _updateTranscriptAvailableViewVisibility];
}

- (void)setHasMultipleTracks:(BOOL)a3
{
  self->_hasMultipleTracks = a3;
  [(RCRecordingDescriptionView *)self _updateMultitrackIndicatorViewVisibility];

  [(RCRecordingDescriptionView *)self _updateMoreButtonMenu];
}

- (void)_updateMultitrackIndicatorViewVisibility
{
  uint64_t v3 = [(RCRecordingDescriptionView *)self hasMultipleTracks] ^ 1;
  multiTrackIndicatorImageView = self->_multiTrackIndicatorImageView;

  [(UIImageView *)multiTrackIndicatorImageView setHidden:v3];
}

- (BOOL)hasMultipleTracks
{
  return self->_hasMultipleTracks;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);

  [(RCRecordingDescriptionView *)self _updateCreationDateOrDownloadingLabel];
}

- (void)_updateStackIfNeeded
{
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v3 = [v6 isAccessibilityLargerTextSizeEnabled];
  if ((id)[(RCRecordingDescriptionView *)self style] == (id)2) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  if (v3) {
    double v5 = 4.0;
  }
  else {
    double v5 = 8.0;
  }
  [(NUIContainerStackView *)self->_dateAndDurationStack setAxis:v3];
  [(NUIContainerStackView *)self->_dateAndDurationStack setSpacing:v5];
  [(NUIContainerStackView *)self->_dateAndDurationStack setAlignment:v4];
  [(UIView *)self->_dateAndDurationEmptySpacerView setHidden:v4];
}

- (void)_setArrangedSubviewsWithTitleDateDurationStack:(id)a3 moreButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6 && v7)
  {
    id v13 = v6;
    id v14 = v7;
    unsigned __int8 v9 = &v13;
    uint64_t v10 = 2;
LABEL_6:
    id v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, v10, v12, v13, v14);
    [(RCRecordingDescriptionView *)self setArrangedSubviews:v11];

    goto LABEL_7;
  }
  if (v6)
  {
    id v12 = v6;
    unsigned __int8 v9 = &v12;
    uint64_t v10 = 1;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)setRecordingDescriptionViewDelegate:(id)a3
{
}

- (void)setPresentedControl:(int64_t)a3
{
  self->_presentedControl = a3;
  if (a3 == 2 && [(RCRecordingDescriptionView *)self _setupMoreButtonIfNeeded]) {
    [(RCRecordingDescriptionView *)self _setArrangedSubviewsWithTitleDateDurationStack:self->_titleDateDurationStack moreButton:self->_moreButton];
  }

  [(RCRecordingDescriptionView *)self _updateForPresentedControlsOptions];
}

- (void)setActionDelegate:(id)a3
{
}

+ (RCRecordingDescriptionView)descriptionViewWithStyle:(int64_t)a3
{
  unsigned int v3 = [[RCRecordingDescriptionView alloc] initWithStyle:a3];

  return v3;
}

- (RCRecordingDescriptionView)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCRecordingDescriptionView;
  uint64_t v4 = -[RCRecordingDescriptionView initWithFrame:](&v7, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  double v5 = v4;
  if (v4) {
    [(RCRecordingDescriptionView *)v4 _commonInitWithStyle:a3];
  }
  return v5;
}

- (void)deviceTranscriptionSupportDidChange:(BOOL)a3
{
  [(RCRecordingDescriptionView *)self _updateMoreButtonMenu];

  [(RCRecordingDescriptionView *)self _updateTranscriptAvailableViewVisibility];
}

- (void)_updateForPresentedControlsOptions
{
  BOOL v3 = (id)[(RCRecordingDescriptionView *)self presentedControl] != (id)2;
  uint64_t v4 = [(RCRecordingDescriptionView *)self moreButton];
  [v4 setHidden:v3];

  BOOL v5 = (id)[(RCRecordingDescriptionView *)self presentedControl] != (id)1;
  id v6 = [(RCRecordingDescriptionView *)self durationLabel];
  [v6 setHidden:v5];
}

- (int64_t)presentedControl
{
  return self->_presentedControl;
}

- (void)_updateMoreButtonMenu
{
  BOOL v3 = [(RCRecordingDescriptionView *)self moreButton];

  if (v3)
  {
    uint64_t v4 = +[TranscriptionAvailabilityProvider shared];
    id v5 = [v4 deviceIsSupported];

    if (v5) {
      BOOL displayTranscriptAvailableIcon = self->_displayTranscriptAvailableIcon;
    }
    else {
      BOOL displayTranscriptAvailableIcon = 0;
    }
    objc_super v7 = [_TtC10VoiceMemos36RCRecordingCellMoreButtonMenuCreator alloc];
    double v8 = [(RCRecordingDescriptionView *)self UUID];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
    uint64_t v10 = [(RCRecordingCellMoreButtonMenuCreator *)v7 initWithRecordingUUID:v8 actionDelegate:WeakRetained source:0];
    [(RCRecordingDescriptionView *)self setMoreButtonMenuCreator:v10];

    id v11 = [(RCRecordingDescriptionView *)self moreButtonMenuCreator];
    id v12 = [v11 createMenuWithDisplayShowTranscriptAction:v5 displayCopyTranscriptAction:displayTranscriptAvailableIcon hasMultipleTracks:[self hasMultipleTracks]];
    id v13 = [(RCRecordingDescriptionView *)self moreButton];
    [v13 setMenu:v12];

    id v14 = [(RCRecordingDescriptionView *)self moreButton];
    [v14 setShowsMenuAsPrimaryAction:1];
  }
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setTitleTextField:(id)a3
{
}

- (void)setTitleEditingAllowed:(BOOL)a3
{
  self->_BOOL titleEditingAllowed = a3;
  if (a3)
  {
    [(RCRecordingDescriptionView *)self _switchToTitleTextField];
    BOOL titleEditingAllowed = self->_titleEditingAllowed;
  }
  else
  {
    BOOL titleEditingAllowed = 0;
  }
  id v5 = [(RCRecordingDescriptionView *)self titleTextField];
  [v5 setEnabled:titleEditingAllowed];
}

- (void)setIntrinsicHeight:(double)a3
{
}

- (void)setShowSaving:(BOOL)a3
{
  if (self->_showSaving != a3)
  {
    self->_showSaving = a3;
    [(RCRecordingDescriptionView *)self _syncDurationVisibility];
    [(RCRecordingDescriptionView *)self _updateCreationDateOrDownloadingLabel];
  }
}

- (void)_syncDurationVisibility
{
  double v3 = 0.0;
  if (![(RCRecordingDescriptionView *)self showDownloading])
  {
    if ([(RCRecordingDescriptionView *)self showSaving]) {
      double v3 = 0.0;
    }
    else {
      double v3 = 1.0;
    }
  }
  uint64_t v4 = [(RCRecordingDescriptionView *)self durationLabel];
  [v4 alpha];
  double v6 = v5;

  if (v6 != v3)
  {
    if (v3 == 0.0)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100059160;
      v8[3] = &unk_100221278;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
    }
    else
    {
      id v7 = [(RCRecordingDescriptionView *)self durationLabel];
      [v7 setAlpha:v3];
    }
  }
}

- (void)localeDidChange
{
}

- (RCRecordingDescriptionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingDescriptionView;
  double v3 = [(RCRecordingDescriptionView *)&v6 initWithCoder:a3];
  uint64_t v4 = v3;
  if (v3) {
    [(RCRecordingDescriptionView *)v3 _commonInitWithStyle:0];
  }
  return v4;
}

- (RCRecordingDescriptionView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingDescriptionView;
  double v3 = -[RCRecordingDescriptionView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3) {
    [(RCRecordingDescriptionView *)v3 _commonInitWithStyle:0];
  }
  return v4;
}

- (BOOL)_setupMoreButtonIfNeeded
{
  double v3 = [(RCRecordingDescriptionView *)self moreButton];

  if (!v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:1];
    [(RCRecordingDescriptionView *)self setMoreButton:v4];
    double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    objc_super v6 = [v5 ellipsisImage];
    id v7 = [v5 shuttleBarImageSymbolConfiguration];
    double v8 = [v6 imageWithConfiguration:v7];
    [v4 setImage:v8 forState:0];

    [v4 setTitle:0 forState:0];
    [v4 setContentHorizontalAlignment:5];
    LODWORD(v9) = 1144750080;
    [v4 setContentHuggingPriority:0 forAxis:v9];
    uint64_t v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"MORE_ACTIONS" value:&stru_100228BC8 table:0];
    [v4 setAccessibilityLabel:v11];

    [v4 setAccessibilityIdentifier:@"More Actions button"];
    id v12 = objc_alloc_init((Class)UILargeContentViewerInteraction);
    [v4 addInteraction:v12];

    id v13 = [v4 accessibilityLabel];
    [v4 setLargeContentTitle:v13];

    [v4 setShowsLargeContentViewer:1];
    [(RCRecordingDescriptionView *)self _updateMoreButtonMenu];
  }
  return v3 == 0;
}

- (void)restyle
{
  [(RCRecordingDescriptionView *)self _styleView];

  [(RCRecordingDescriptionView *)self _applyLabelConfiguration];
}

- (void)_animateLabel:(id)a3 textColor:(id)a4 duration:(double)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059554;
  v9[3] = &unk_100221C38;
  id v10 = a3;
  id v11 = a4;
  id v7 = v11;
  id v8 = v10;
  +[UIView transitionWithView:v8 duration:5242880 options:v9 animations:0 completion:a5];
}

- (void)_animateTextField:(id)a3 textColor:(id)a4 duration:(double)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100059638;
  v9[3] = &unk_100221C38;
  id v10 = a3;
  id v11 = a4;
  id v7 = v11;
  id v8 = v10;
  +[UIView transitionWithView:v8 duration:5242880 options:v9 animations:0 completion:a5];
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v8 = a4;
  if ((id)[(RCRecordingDescriptionView *)self style] == (id)2)
  {
    double v5 = [(RCRecordingDescriptionView *)self traitCollection];
    id v6 = [v5 userInterfaceStyle];
    id v7 = [v8 userInterfaceStyle];

    if (v6 != v7) {
      [(RCRecordingDescriptionView *)self _applyLabelConfiguration];
    }
  }
  [(RCRecordingDescriptionView *)self _updateStackIfNeeded];
}

- (void)_maybeSelectAllTextFieldText
{
  p_recordingDescriptionViewDelegate = &self->_recordingDescriptionViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
    unsigned int v7 = [v6 shouldSelectFullTitleAtBeginEditing];

    if (v7)
    {
      id v8 = [(RCRecordingDescriptionView *)self titleTextField];
      [v8 selectAll:0];
    }
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [v9 text];
  [(RCRecordingDescriptionView *)self setPreEditingName:v4];

  [(RCRecordingDescriptionView *)self _maybeSelectAllTextFieldText];
  p_recordingDescriptionViewDelegate = &self->_recordingDescriptionViewDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_recordingDescriptionViewDelegate);
    [v8 didBeginEditingInTextField:v9];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  id v9 = a3;
  if ([v8 isEqualToString:@"\n"])
  {
    [v9 resignFirstResponder];

    BOOL v10 = 0;
  }
  else
  {
    id v11 = [v9 text];

    id v12 = [v11 length];
    id v13 = [v8 length];
    uint64_t v14 = (uint64_t)v13 + (void)v12 - length;
    BOOL v16 = (uint64_t)((uint64_t)v13 - length) < 0 || (unint64_t)v14 < 0x65;
    if (v14 < 0) {
      BOOL v16 = 0;
    }
    BOOL v10 = location + length <= (unint64_t)v12 && v16;
  }

  return v10;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
    [v6 didEndEditingInTextField];
  }
  char v7 = [v12 text];
  if ([v7 length]
    && ([v12 text],
        id v8 = objc_claimAutoreleasedReturnValue(),
        [(RCRecordingDescriptionView *)self preEditingName],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v10 = [v8 isEqualToString:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    id v11 = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);
    [v11 handleUpdateTitle:v7];
  }
  else
  {
    id v11 = [(RCRecordingDescriptionView *)self preEditingName];
    [v12 setText:v11];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (id)accessibilityElements
{
  double v3 = +[NSMutableArray array];
  uint64_t v4 = [(RCRecordingDescriptionView *)self titleTextField];

  if (v4)
  {
    char v5 = [(RCRecordingDescriptionView *)self titleTextField];
    [v3 addObject:v5];
  }
  id v6 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];

  if (v6)
  {
    char v7 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
    unsigned __int8 v8 = [v7 isHidden];

    if ((v8 & 1) == 0)
    {
      id v9 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
      [v3 addObject:v9];
    }
  }
  uint64_t v10 = [(RCRecordingDescriptionView *)self transcriptAvailableImageView];
  if (v10)
  {
    id v11 = (void *)v10;
    id v12 = [(RCRecordingDescriptionView *)self transcriptAvailableImageView];
    unsigned __int8 v13 = [v12 isHidden];

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = [(RCRecordingDescriptionView *)self transcriptAvailableImageView];
      [v3 addObject:v14];
    }
  }
  uint64_t v15 = [(RCRecordingDescriptionView *)self multiTrackIndicatorImageView];
  if (v15)
  {
    BOOL v16 = (void *)v15;
    unsigned __int8 v17 = [(RCRecordingDescriptionView *)self multiTrackIndicatorImageView];
    unsigned __int8 v18 = [v17 isHidden];

    if ((v18 & 1) == 0)
    {
      v19 = [(RCRecordingDescriptionView *)self multiTrackIndicatorImageView];
      [v3 addObject:v19];
    }
  }
  uint64_t v20 = [(RCRecordingDescriptionView *)self durationLabel];
  if (v20)
  {
    id v21 = (void *)v20;
    id v22 = [(RCRecordingDescriptionView *)self durationLabel];
    unsigned __int8 v23 = [v22 isHidden];

    if ((v23 & 1) == 0)
    {
      v24 = [(RCRecordingDescriptionView *)self durationLabel];
      [v3 addObject:v24];
    }
  }
  uint64_t v25 = [(RCRecordingDescriptionView *)self moreButton];
  if (v25)
  {
    double v26 = (void *)v25;
    double v27 = [(RCRecordingDescriptionView *)self moreButton];
    unsigned __int8 v28 = [v27 isHidden];

    if ((v28 & 1) == 0)
    {
      v29 = [(RCRecordingDescriptionView *)self moreButton];
      [v3 addObject:v29];
    }
  }

  return v3;
}

- (NSString)axCreationDateString
{
  v2 = [(RCRecordingDescriptionView *)self creationDateOrDownloadingLabel];
  double v3 = [v2 accessibilityLabel];

  return (NSString *)v3;
}

- (NSString)axTranscriptAvailableString
{
  v2 = [(RCRecordingDescriptionView *)self transcriptAvailableImageView];
  double v3 = [v2 accessibilityLabel];

  return (NSString *)v3;
}

- (NSString)axMultiTrackIndicatorString
{
  v2 = [(RCRecordingDescriptionView *)self multiTrackIndicatorImageView];
  double v3 = [v2 accessibilityLabel];

  return (NSString *)v3;
}

- (NSString)axDurationString
{
  v2 = [(RCRecordingDescriptionView *)self durationLabel];
  double v3 = [v2 accessibilityLabel];

  return (NSString *)v3;
}

- (void)setDurationLabelAccessible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCRecordingDescriptionView *)self durationLabel];
  [v4 setIsAccessibilityElement:v3];
}

- (BOOL)isTitleAccessible
{
  BOOL v3 = [(RCRecordingDescriptionView *)self titleTextField];
  if ([v3 isAccessibilityElement])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    char v5 = [(RCRecordingDescriptionView *)self titleLabel];
    unsigned __int8 v4 = [v5 isAccessibilityElement];
  }
  return v4;
}

- (void)addTitleAccessibilityTraits:(unint64_t)a3
{
  char v5 = [(RCRecordingDescriptionView *)self titleTextField];
  [v5 setAccessibilityTraits:[v5 accessibilityTraits] | a3];

  id v6 = [(RCRecordingDescriptionView *)self titleLabel];
  [v6 setAccessibilityTraits:((unint64_t)[v6 accessibilityTraits] | a3)];
}

- (void)removeTitleAccessibilityTraits:(unint64_t)a3
{
  char v5 = [(RCRecordingDescriptionView *)self titleTextField];
  [v5 setAccessibilityTraits:[v5 accessibilityTraits] & ~a3];

  id v6 = [(RCRecordingDescriptionView *)self titleLabel];
  [v6 setAccessibilityTraits:[v6 accessibilityTraits] & ~a3];
}

- (void)beginEditingTitle
{
  id v2 = [(RCRecordingDescriptionView *)self titleTextField];
  [v2 becomeFirstResponder];
}

- (void)_endEditingTitleDueToNotification
{
  BOOL v3 = [(RCRecordingDescriptionView *)self titleTextField];
  unsigned int v4 = [v3 isEditing];

  if (v4)
  {
    id v5 = [(RCRecordingDescriptionView *)self titleTextField];
    [v5 endEditing:0];
  }
}

- (void)endEditingTitle
{
  id v2 = [(RCRecordingDescriptionView *)self titleTextField];
  [v2 endEditing:1];
}

- (double)intrinsicHeight
{
  [(RCRecordingDescriptionView *)self intrinsicContentSize];
  return v2;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
}

- (BOOL)displayTranscriptAvailableIcon
{
  return self->_displayTranscriptAvailableIcon;
}

- (RCRecordingDescriptionViewDelegate)recordingDescriptionViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingDescriptionViewDelegate);

  return (RCRecordingDescriptionViewDelegate *)WeakRetained;
}

- (RCControlsActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (RCControlsActionDelegate *)WeakRetained;
}

- (BOOL)isTitleFieldAccessible
{
  return self->_titleFieldAccessible;
}

- (void)setTitleFieldAccessible:(BOOL)a3
{
  self->_titleFieldAccessible = a3;
}

- (BOOL)wasManuallyRenamed
{
  return self->_wasManuallyRenamed;
}

- (NUIContainerStackView)titleDateDurationStack
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMoreButton:(id)a3
{
}

- (NUIContainerStackView)dateAndDurationStack
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 144, 1);
}

- (UIView)dateAndDurationEmptySpacerView
{
  return self->_dateAndDurationEmptySpacerView;
}

- (NSString)preEditingName
{
  return self->_preEditingName;
}

- (void)setPreEditingName:(id)a3
{
}

- (void)setMoreButtonMenuCreator:(id)a3
{
}

- (BOOL)isInCompactDisplayMode
{
  return self->_isInCompactDisplayMode;
}

- (void)setIsInCompactDisplayMode:(BOOL)a3
{
  self->_isInCompactDisplayMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonMenuCreator, 0);
  objc_storeStrong((id *)&self->_preEditingName, 0);
  objc_storeStrong((id *)&self->_titleTextField, 0);
  objc_storeStrong((id *)&self->_multiTrackIndicatorImageView, 0);
  objc_storeStrong((id *)&self->_transcriptAvailableImageView, 0);
  objc_storeStrong((id *)&self->_dateAndDurationEmptySpacerView, 0);
  objc_storeStrong((id *)&self->_dateAndDurationStack, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_titleDateDurationStack, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);
  objc_storeStrong((id *)&self->_creationDateOrDownloadingLabel, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_destroyWeak((id *)&self->_recordingDescriptionViewDelegate);
  objc_storeStrong((id *)&self->_labelConfiguration, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_recordingTitle, 0);
}

@end