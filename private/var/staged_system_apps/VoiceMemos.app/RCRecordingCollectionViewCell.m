@interface RCRecordingCollectionViewCell
- (BOOL)_hasCustomBackgroundColor;
- (BOOL)_shouldShowProgressOverlay;
- (BOOL)accessibilityPerformMagicTap;
- (BOOL)canBecomeFocused;
- (BOOL)editingInFlight;
- (BOOL)hasMultipleTracks;
- (BOOL)hasTranscription;
- (BOOL)isAccessibilityElement;
- (BOOL)isEditingTitle;
- (BOOL)isRecentlyDeleted;
- (BOOL)performEditTitleAXAction;
- (BOOL)performMoreActionsAXAction;
- (BOOL)representsDownloadingFile;
- (BOOL)shouldSelectFullTitleAtBeginEditing;
- (BOOL)verticallyExpanded;
- (BOOL)wasManuallyRenamed;
- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)result;
- (NSDate)creationDate;
- (NSString)UUID;
- (NSString)recordingTitle;
- (NUIContainerStackView)stackView;
- (RCProgressOverlay)progressOverlay;
- (RCRecordingCollectionViewCell)initWithFrame:(CGRect)a3;
- (RCRecordingDescriptionView)recordingDescriptionView;
- (RCRecordingsCollectionViewCellDelegate)cellDelegate;
- (RCShuttleBar)shuttleBar;
- (UITextField)textFieldBeingEdited;
- (double)currentTime;
- (double)descriptionHeight;
- (double)descriptionViewShuttleBarPadding;
- (double)recordingDuration;
- (double)shuttleBarHeight;
- (float)editingProgress;
- (id)_backgroundConfigurationForState:(id)a3;
- (id)_createCellAccessories;
- (id)_createProgressOverlay;
- (id)_customBackgroundColor;
- (id)_labelConfigurationForState:(id)a3;
- (id)_progressOverlayAccessory;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityElements;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)playControlState;
- (unint64_t)accessibilityTraits;
- (void)_collapseVertically;
- (void)_createShuttleBarIfNeeded;
- (void)_expandVertically;
- (void)_styleView;
- (void)_updateAfterSelectionChangeToSelected:(BOOL)a3;
- (void)_updateUIToVerticallyExpandedState:(BOOL)a3;
- (void)_verifyVerticallyExpandedState;
- (void)beginEditingTitle;
- (void)didBeginEditingInTextField:(id)a3;
- (void)didEndEditingInTextField;
- (void)handleUpdateTitle:(id)a3;
- (void)layoutSubviews;
- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5;
- (void)prepareForReuse;
- (void)resignFirstResponderForTitleEditing;
- (void)restyle;
- (void)setCellDelegate:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setDescriptionHeight:(double)a3;
- (void)setDescriptionViewShuttleBarPadding:(double)a3;
- (void)setEditingInFlight:(BOOL)a3;
- (void)setEditingProgress:(float)a3;
- (void)setHasMultipleTracks:(BOOL)a3;
- (void)setHasTranscription:(BOOL)a3;
- (void)setIsRecentlyDeleted:(BOOL)a3;
- (void)setPlayControlState:(int64_t)a3;
- (void)setProgressOverlay:(id)a3;
- (void)setRecordingDescriptionView:(id)a3;
- (void)setRecordingDuration:(double)a3;
- (void)setRecordingTitle:(id)a3;
- (void)setRepresentsDownloadingFile:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShuttleBar:(id)a3;
- (void)setShuttleBarHeight:(double)a3;
- (void)setTextFieldBeingEdited:(id)a3;
- (void)setUUID:(id)a3;
- (void)setVerticallyExpanded:(BOOL)a3;
- (void)setWasManuallyRenamed:(BOOL)a3;
- (void)updateAccessories;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation RCRecordingCollectionViewCell

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)recordingTitle
{
  v2 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  v3 = [v2 recordingTitle];

  return (NSString *)v3;
}

- (double)recordingDuration
{
  return self->_recordingDuration;
}

- (NSDate)creationDate
{
  v2 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  v3 = [v2 creationDate];

  return (NSDate *)v3;
}

- (id)_customBackgroundColor
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v2 recordingCollectionViewCellCustomBackgroundColor];

  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v11 = a3;
  v4 = [(RCRecordingCollectionViewCell *)self _backgroundConfigurationForState:v11];
  [(RCRecordingCollectionViewCell *)self setBackgroundConfiguration:v4];

  v5 = [(RCRecordingCollectionViewCell *)self _labelConfigurationForState:v11];
  v6 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v6 setLabelConfiguration:v5];

  if ([v11 isEditing]) {
    id v7 = 0;
  }
  else {
    id v7 = [v11 isSelected];
  }
  v8 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  unsigned int v9 = [v8 titleEditingAllowed];

  if (v7 != v9)
  {
    v10 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
    [v10 setTitleEditingAllowed:v7];
  }
  [(RCRecordingCollectionViewCell *)self _verifyVerticallyExpandedState];
}

- (RCRecordingDescriptionView)recordingDescriptionView
{
  return self->_recordingDescriptionView;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setWasManuallyRenamed:v3];
}

- (void)setRepresentsDownloadingFile:(BOOL)a3
{
  BOOL v3 = a3;
  self->_representsDownloadingFile = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setShowDownloading:v3];
}

- (void)setRecordingTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v6 setRecordingTitle:v4];

  v5 = [(RCRecordingCollectionViewCell *)self UUID];
  [v6 setUUID:v5];
}

- (void)setUUID:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  UUID = self->_UUID;
  self->_UUID = v5;

  id v7 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v7 setUUID:v4];
}

- (void)setRecordingDuration:(double)a3
{
  self->_recordingDuration = a3;
  double v5 = round(a3);
  id v6 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v6 setRecordingDuration:0 withHiddenLabel:0 withHiddenSubcomponents:1 isDurationLabelAX:v5];

  id v7 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  [v7 setDuration:a3];
}

- (void)setPlayControlState:(int64_t)a3
{
  self->_playControlState = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  [v4 setPlayControlState:a3];
}

- (RCShuttleBar)shuttleBar
{
  return self->_shuttleBar;
}

- (void)setIsRecentlyDeleted:(BOOL)a3
{
  self->_isRecentlyDeleted = a3;
}

- (void)setHasTranscription:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasTranscription = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setDisplayTranscriptAvailableIcon:v3];
}

- (void)setHasMultipleTracks:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasMultipleTracks = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setHasMultipleTracks:v3];
}

- (void)setEditingInFlight:(BOOL)a3
{
  if (self->_editingInFlight != a3)
  {
    BOOL v3 = a3;
    self->_editingInFlight = a3;
    double v5 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
    [v5 setShowSaving:v3];

    [(RCRecordingCollectionViewCell *)self updateAccessories];
    [(RCRecordingCollectionViewCell *)self _verifyVerticallyExpandedState];
  }
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  [v4 setCurrentTime:a3];
}

- (void)setCreationDate:(id)a3
{
  id v4 = a3;
  id v5 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v5 setCreationDate:v4];
}

- (void)setCellDelegate:(id)a3
{
}

- (RCRecordingCollectionViewCell)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)RCRecordingCollectionViewCell;
  BOOL v3 = -[RCRecordingCollectionViewCell initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[RCRecordingDescriptionView descriptionViewWithStyle:2];
    recordingDescriptionView = v3->_recordingDescriptionView;
    v3->_recordingDescriptionView = (RCRecordingDescriptionView *)v4;

    [(RCRecordingDescriptionView *)v3->_recordingDescriptionView setRecordingDescriptionViewDelegate:v3];
    [(RCRecordingDescriptionView *)v3->_recordingDescriptionView setPresentedControl:1];
    [(RCRecordingDescriptionView *)v3->_recordingDescriptionView setActionDelegate:v3];
    id v6 = objc_alloc((Class)NUIContainerStackView);
    v18 = v3->_recordingDescriptionView;
    id v7 = +[NSArray arrayWithObjects:&v18 count:1];
    v8 = (NUIContainerStackView *)[v6 initWithArrangedSubviews:v7];
    stackView = v3->_stackView;
    v3->_stackView = v8;

    [(NUIContainerStackView *)v3->_stackView setLayoutMarginsRelativeArrangement:1];
    [(NUIContainerStackView *)v3->_stackView setPreservesSuperviewLayoutMargins:1];
    [(NUIContainerStackView *)v3->_stackView setAxis:1];
    [(NUIContainerStackView *)v3->_stackView setClipsToBounds:1];
    [(RCRecordingCollectionViewCell *)v3 descriptionViewShuttleBarPadding];
    -[NUIContainerStackView setSpacing:](v3->_stackView, "setSpacing:");
    v10 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v10 recordingCellStackViewVerticalLayoutMargin];
    double v12 = v11;

    -[NUIContainerStackView setDirectionalLayoutMargins:](v3->_stackView, "setDirectionalLayoutMargins:", v12, 0.0, v12, 0.0);
    v13 = [(RCRecordingCollectionViewCell *)v3 contentView];
    [v13 addSubview:v3->_stackView];

    v14 = [(RCRecordingCollectionViewCell *)v3 contentView];
    [v14 setClipsToBounds:1];

    v15 = [(RCRecordingCollectionViewCell *)v3 _createCellAccessories];
    [(RCRecordingCollectionViewCell *)v3 setAccessories:v15];

    [(RCRecordingCollectionViewCell *)v3 _styleView];
    v3->_playControlState = 0;
  }
  return v3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [(RCRecordingCollectionViewCell *)self bounds];
  -[NUIContainerStackView effectiveLayoutSizeFittingSize:](self->_stackView, "effectiveLayoutSizeFittingSize:", v5, 0.0);
  double v7 = v6;
  double v9 = v8;
  [v4 size];
  if (v7 != v11 || v9 != v10)
  {
    id v13 = [v4 copy];

    [v13 setSize:v7, v9];
    id v4 = v13;
  }

  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)RCRecordingCollectionViewCell;
  [(RCRecordingCollectionViewCell *)&v13 layoutSubviews];
  BOOL v3 = [(RCRecordingCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[NUIContainerStackView setFrame:](self->_stackView, "setFrame:", v5, v7, v9, v11);
  -[NUIContainerStackView effectiveLayoutSizeFittingSize:](self->_stackView, "effectiveLayoutSizeFittingSize:", v9, 0.0);
  -[NUIContainerStackView setFrame:](self->_stackView, "setFrame:", v5, v7, v9, v12);
}

- (double)descriptionViewShuttleBarPadding
{
  return self->_descriptionViewShuttleBarPadding;
}

- (void)_verifyVerticallyExpandedState
{
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  if (([v5 expandsRecordingsCollectionViewItemOnSelection] & 1) != 0
    && [(RCRecordingCollectionViewCell *)self isSelected])
  {
    BOOL v3 = [(RCRecordingCollectionViewCell *)self configurationState];
    if ([v3 isEditing]) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = [(RCRecordingCollectionViewCell *)self _shouldShowProgressOverlay] ^ 1;
    }
    [(RCRecordingCollectionViewCell *)self setVerticallyExpanded:v4];
  }
  else
  {
    [(RCRecordingCollectionViewCell *)self setVerticallyExpanded:0];
  }
}

- (void)setVerticallyExpanded:(BOOL)a3
{
  if (self->_verticallyExpanded != a3)
  {
    self->_verticallyExpanded = a3;
    -[RCRecordingCollectionViewCell _updateUIToVerticallyExpandedState:](self, "_updateUIToVerticallyExpandedState:");
  }
}

- (void)_styleView
{
  id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
  [v6 libraryCellDescriptionHeight];
  self->_descriptionHeight = v3;
  [v6 libraryCellShuttleBarHeight];
  self->_shuttleBarHeight = v4;
  [v6 libraryCellDescriptionViewShuttleBarPadding];
  self->_descriptionViewShuttleBarPadding = v5;
}

- (id)_labelConfigurationForState:(id)a3
{
  id v4 = a3;
  if ([(RCRecordingCollectionViewCell *)self _hasCustomBackgroundColor])
  {
    double v5 = +[RCRecordingDescriptionViewLabelConfiguration recordingCollectionViewCellConfiguration];
  }
  else
  {
    id v6 = [(RCRecordingCollectionViewCell *)self defaultContentConfiguration];
    double v7 = [v6 updatedConfigurationForState:v4];

    double v8 = [v7 textProperties];
    double v5 = +[RCRecordingDescriptionViewLabelConfiguration emptyConfiguration];
    double v9 = [v8 color];
    [v5 setRecordingTitleTextColor:v9];

    double v10 = [v8 color];
    [v5 setRecordingTitleEditingTintColor:v10];

    double v11 = [v8 color];
    double v12 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v12 descriptionViewSecondaryLabelAlpha];
    objc_super v13 = [v11 colorWithAlphaComponent:];
    [v5 setSubtitleTextColor:v13];
  }

  return v5;
}

- (id)_createCellAccessories
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)UICellAccessoryMultiselect);
  [v4 setDisplayedState:1];
  [v3 addObject:v4];
  if ([(RCRecordingCollectionViewCell *)self _shouldShowProgressOverlay])
  {
    double v5 = [(RCRecordingCollectionViewCell *)self _progressOverlayAccessory];
    [v3 addObject:v5];
  }
  else
  {
    [(RCRecordingCollectionViewCell *)self setProgressOverlay:0];
  }

  return v3;
}

- (void)setProgressOverlay:(id)a3
{
}

- (BOOL)_shouldShowProgressOverlay
{
  id v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v3 showsProgressInRecordingCollectionViewCell]) {
    BOOL editingInFlight = self->_editingInFlight;
  }
  else {
    BOOL editingInFlight = 0;
  }

  return editingInFlight;
}

- (id)_backgroundConfigurationForState:(id)a3
{
  id v4 = a3;
  double v5 = [(RCRecordingCollectionViewCell *)self defaultBackgroundConfiguration];
  id v6 = [v5 updatedConfigurationForState:v4];

  if ([(RCRecordingCollectionViewCell *)self _hasCustomBackgroundColor])
  {
    double v7 = [(RCRecordingCollectionViewCell *)self _customBackgroundColor];
    [v6 setBackgroundColor:v7];
  }

  return v6;
}

- (BOOL)_hasCustomBackgroundColor
{
  v2 = [(RCRecordingCollectionViewCell *)self _customBackgroundColor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setDescriptionHeight:(double)a3
{
  self->_descriptionHeight = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setIntrinsicHeight:a3];
}

- (void)setShuttleBarHeight:(double)a3
{
  self->_shuttleBarHeight = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  [v4 setIntrinsicHeight:a3];
}

- (BOOL)wasManuallyRenamed
{
  v2 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  unsigned __int8 v3 = [v2 wasManuallyRenamed];

  return v3;
}

- (int64_t)playControlState
{
  return self->_playControlState;
}

- (void)_createShuttleBarIfNeeded
{
  if (!self->_shuttleBar)
  {
    unsigned __int8 v3 = [[RCShuttleBar alloc] initWithShuttleBarStyle:0];
    shuttleBar = self->_shuttleBar;
    self->_shuttleBar = v3;

    [(RCShuttleBar *)self->_shuttleBar setActionDelegate:self];
    [(RCShuttleBar *)self->_shuttleBar setPresentedControlsOptions:3];
    id v7 = (id)objc_opt_new();
    double v5 = [v7 transportControlsColorForLibrary];
    [(RCShuttleBar *)self->_shuttleBar setControlsColor:v5];

    id v6 = [v7 secondaryTransportControlsColorForLibrary];
    [(RCShuttleBar *)self->_shuttleBar setSecondaryControlsColor:v6];

    [(RCShuttleBar *)self->_shuttleBar setIntrinsicHeight:self->_shuttleBarHeight];
    [(RCShuttleBar *)self->_shuttleBar setHidden:1];
    [(NUIContainerStackView *)self->_stackView addArrangedSubview:self->_shuttleBar];
    [(RCRecordingCollectionViewCell *)self recordingDuration];
    -[RCShuttleBar setDuration:](self->_shuttleBar, "setDuration:");
    [(RCRecordingCollectionViewCell *)self currentTime];
    -[RCShuttleBar setCurrentTime:](self->_shuttleBar, "setCurrentTime:");
    [(NUIContainerStackView *)self->_stackView setDelegate:self];
    [(RCShuttleBar *)self->_shuttleBar setPlayControlState:[(RCRecordingCollectionViewCell *)self playControlState]];
  }
}

- (CGRect)containerView:(id)a3 layoutFrameForArrangedSubview:(id)a4 withProposedFrame:(CGRect)result
{
  if (self->_shuttleBar == a4) {
    result.origin.y = result.origin.y + 8.0;
  }
  return result;
}

- (void)updateAccessories
{
  id v3 = [(RCRecordingCollectionViewCell *)self _createCellAccessories];
  [(RCRecordingCollectionViewCell *)self setAccessories:v3];
}

- (id)_progressOverlayAccessory
{
  id v3 = [(RCRecordingCollectionViewCell *)self _createProgressOverlay];
  [(RCRecordingCollectionViewCell *)self setProgressOverlay:v3];
  id v4 = [objc_alloc((Class)UICellAccessoryCustomView) initWithCustomView:v3 placement:1];
  [v4 setDisplayedState:0];

  return v4;
}

- (id)_createProgressOverlay
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v3 = objc_opt_new();
  id v4 = [v2 progressViewBackgroundColorEditingCard];
  [v3 setDimmingBackgroundColor:v4];

  [v3 setStyle:0];
  [v2 editingProgressIndicatorDiameterCell];
  [v3 setFrame:0.0, 0.0, v5, v5];

  return v3;
}

- (void)restyle
{
  [(RCRecordingCollectionViewCell *)self _styleView];
  id v3 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v3 restyle];

  id v4 = [(RCRecordingCollectionViewCell *)self progressOverlay];
  [v4 restyle];

  if ([(RCRecordingCollectionViewCell *)self isSelected]) {
    [(RCRecordingCollectionViewCell *)self _updateAfterSelectionChangeToSelected:1];
  }
  [(RCRecordingCollectionViewCell *)self setEditingInFlight:[(RCRecordingCollectionViewCell *)self editingInFlight]];
  [(RCRecordingCollectionViewCell *)self _verifyVerticallyExpandedState];

  [(RCRecordingCollectionViewCell *)self setNeedsUpdateConfiguration];
}

- (void)prepareForReuse
{
  [(RCRecordingCollectionViewCell *)self setUUID:0];
  [(RCRecordingCollectionViewCell *)self setVerticallyExpanded:0];
  v3.receiver = self;
  v3.super_class = (Class)RCRecordingCollectionViewCell;
  [(RCRecordingCollectionViewCell *)&v3 prepareForReuse];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    double v5 = [(RCRecordingCollectionViewCell *)self shuttleBar];
    [v5 cancelScrubbing];
  }
  v9.receiver = self;
  v9.super_class = (Class)RCRecordingCollectionViewCell;
  [(RCRecordingCollectionViewCell *)&v9 setSelected:v3];
  id v6 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  if (v3)
  {
    id v7 = [(RCRecordingCollectionViewCell *)self configurationState];
    uint64_t v8 = [v7 isEditing] ^ 1;
  }
  else
  {
    uint64_t v8 = 0;
  }
  [v6 setTitleEditingAllowed:v8];
  [v6 setUserInteractionEnabled:v3];
  [(RCRecordingCollectionViewCell *)self _updateAfterSelectionChangeToSelected:v3];
}

- (void)_updateAfterSelectionChangeToSelected:(BOOL)a3
{
  id v9 = [(RCRecordingCollectionViewCell *)self progressOverlay];
  if (v9)
  {
    id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
    unsigned __int8 v5 = [v4 expandsRecordingsCollectionViewItemOnSelection];

    if ((v5 & 1) == 0)
    {
      id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
      id v7 = v6;
      if (a3) {
        +[UIColor secondaryLabelColor];
      }
      else {
      uint64_t v8 = [v6 recordingCollectionViewCellTextColor];
      }
      [v9 setProgressIndicatorColor:v8];
    }
  }
}

- (void)_updateUIToVerticallyExpandedState:(BOOL)a3
{
  if (a3) {
    [(RCRecordingCollectionViewCell *)self _expandVertically];
  }
  else {
    [(RCRecordingCollectionViewCell *)self _collapseVertically];
  }

  [(RCRecordingCollectionViewCell *)self invalidateIntrinsicContentSize];
}

- (void)_expandVertically
{
  [(RCRecordingCollectionViewCell *)self _createShuttleBarIfNeeded];
  [(RCShuttleBar *)self->_shuttleBar setAlpha:0.0];
  [(RCShuttleBar *)self->_shuttleBar setHidden:0];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004F994;
  v7[3] = &unk_100221278;
  v7[4] = self;
  +[UIView animateWithDuration:v7 animations:0.5];
  BOOL v3 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v3 setTitleFieldAccessible:1];

  LODWORD(v3) = [(RCRecordingCollectionViewCell *)self isRecentlyDeleted];
  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  unsigned __int8 v5 = v4;
  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 2;
  }
  [v4 setPresentedControl:v6];
}

- (void)_collapseVertically
{
  [(RCShuttleBar *)self->_shuttleBar setHidden:1];
  BOOL v3 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v3 setTitleFieldAccessible:0];

  id v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v4 setPresentedControl:1];
}

- (BOOL)editingInFlight
{
  return self->_editingInFlight;
}

- (void)setEditingProgress:(float)a3
{
  id v5 = [(RCRecordingCollectionViewCell *)self progressOverlay];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (float)editingProgress
{
  v2 = [(RCRecordingCollectionViewCell *)self progressOverlay];
  [v2 progress];
  float v4 = v3;

  return v4;
}

- (void)performControlsAction:(int64_t)a3 position:(double)a4 source:(id)a5
{
  id v8 = a5;
  id v10 = [(RCRecordingCollectionViewCell *)self cellDelegate];
  id v9 = [(RCRecordingCollectionViewCell *)self UUID];
  [v10 performAction:a3 atPosition:v9 forCellWithUUID:v8 source:a4];
}

- (void)handleUpdateTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(RCRecordingCollectionViewCell *)self cellDelegate];
  id v5 = [(RCRecordingCollectionViewCell *)self UUID];
  [v6 performRenameWithNewTitle:v4 forCellWithUUID:v5];
}

- (void)didBeginEditingInTextField:(id)a3
{
  id v5 = a3;
  id v4 = [(RCRecordingCollectionViewCell *)self cellDelegate];
  [v4 didBeginEditingTitle:self];

  [(RCRecordingCollectionViewCell *)self setTextFieldBeingEdited:v5];
}

- (void)didEndEditingInTextField
{
  float v3 = [(RCRecordingCollectionViewCell *)self cellDelegate];
  [v3 didEndEditingTitle:self];

  [(RCRecordingCollectionViewCell *)self setTextFieldBeingEdited:0];
}

- (BOOL)shouldSelectFullTitleAtBeginEditing
{
  return ![(RCRecordingCollectionViewCell *)self wasManuallyRenamed];
}

- (BOOL)canBecomeFocused
{
  if ([(RCRecordingCollectionViewCell *)self representsDownloadingFile]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)RCRecordingCollectionViewCell;
  if (![(RCRecordingCollectionViewCell *)&v6 canBecomeFocused]) {
    return 0;
  }
  float v3 = [(RCRecordingCollectionViewCell *)self textFieldBeingEdited];
  BOOL v4 = v3 == 0;

  return v4;
}

- (id)accessibilityLabel
{
  float v3 = [(RCRecordingCollectionViewCell *)self recordingTitle];

  if (!v3) {
    [(RCRecordingCollectionViewCell *)self setRecordingTitle:&stru_100228BC8];
  }
  BOOL v4 = [(RCRecordingCollectionViewCell *)self recordingTitle];
  id v5 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  objc_super v6 = [v5 axCreationDateString];
  id v7 = +[NSString stringWithFormat:@"%@, %@", v4, v6];

  if (self->_hasTranscription)
  {
    id v8 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
    id v9 = [v8 axTranscriptAvailableString];
    id v10 = +[NSString stringWithFormat:@", %@", v9];
    uint64_t v11 = [v7 stringByAppendingString:v10];

    id v7 = (void *)v11;
  }
  if (self->_hasMultipleTracks)
  {
    double v12 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
    objc_super v13 = [v12 axMultiTrackIndicatorString];
    v14 = +[NSString stringWithFormat:@", %@", v13];
    uint64_t v15 = [v7 stringByAppendingString:v14];

    id v7 = (void *)v15;
  }
  v16 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  objc_super v17 = [v16 axDurationString];
  v18 = +[NSString stringWithFormat:@", %@", v17];
  id v19 = [v7 stringByAppendingString:v18];

  return v7;
}

- (id)accessibilityUserInputLabels
{
  float v3 = [(RCRecordingCollectionViewCell *)self recordingTitle];

  if (!v3) {
    [(RCRecordingCollectionViewCell *)self setRecordingTitle:&stru_100228BC8];
  }
  BOOL v4 = [(RCRecordingCollectionViewCell *)self recordingTitle];
  id v7 = v4;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

- (id)accessibilityValue
{
  [(RCRecordingCollectionViewCell *)self recordingDuration];

  return (id)UIAXTimeStringForDuration();
}

- (BOOL)isAccessibilityElement
{
  float v3 = +[RCRecorderStyleProvider sharedStyleProvider];
  if ([v3 expandsRecordingsCollectionViewItemOnSelection])
  {
    BOOL v4 = [(RCRecordingCollectionViewCell *)self configurationState];
    unsigned __int8 v5 = [v4 isEditing];

    if ((v5 & 1) == 0) {
      return [(RCRecordingCollectionViewCell *)self isSelected] ^ 1;
    }
  }
  else
  {
  }
  return 1;
}

- (id)accessibilityElements
{
  if ([(RCRecordingCollectionViewCell *)self isAccessibilityElement])
  {
    float v3 = 0;
  }
  else
  {
    float v3 = +[NSMutableArray array];
    BOOL v4 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
    unsigned __int8 v5 = [v4 accessibilityElements];
    [v3 addObjectsFromArray:v5];

    objc_super v6 = [(RCRecordingCollectionViewCell *)self shuttleBar];
    id v7 = [v6 accessibilityElements];
    [v3 addObjectsFromArray:v7];
  }
  id v8 = [v3 copy];

  return v8;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)RCRecordingCollectionViewCell;
  UIAccessibilityTraits v3 = UIAccessibilityTraitButton | [(RCRecordingCollectionViewCell *)&v5 accessibilityTraits];
  if ([(RCRecordingCollectionViewCell *)self isSelected]) {
    return UIAccessibilityTraitSelected | v3;
  }
  else {
    return v3 & ~UIAccessibilityTraitSelected;
  }
}

- (id)accessibilityDragSourceDescriptors
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomActions
{
  v10.receiver = self;
  v10.super_class = (Class)RCRecordingCollectionViewCell;
  UIAccessibilityTraits v3 = [(RCRecordingCollectionViewCell *)&v10 accessibilityCustomActions];
  BOOL v4 = +[NSMutableArray arrayWithArray:v3];

  if ([(RCRecordingCollectionViewCell *)self isSelected])
  {
    id v5 = objc_alloc((Class)UIAccessibilityCustomAction);
    objc_super v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"AX_ACTION_EDIT_TITLE" value:&stru_100228BC8 table:0];
    id v8 = [v5 initWithName:v7 target:self selector:"performEditTitleAXAction"];

    [v4 addObject:v8];
  }

  return v4;
}

- (BOOL)performMoreActionsAXAction
{
  return 1;
}

- (BOOL)performEditTitleAXAction
{
  return 1;
}

- (BOOL)isEditingTitle
{
  v2 = [(RCRecordingCollectionViewCell *)self textFieldBeingEdited];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)beginEditingTitle
{
  id v2 = [(RCRecordingCollectionViewCell *)self recordingDescriptionView];
  [v2 beginEditingTitle];
}

- (void)resignFirstResponderForTitleEditing
{
  BOOL v3 = [(RCRecordingCollectionViewCell *)self textFieldBeingEdited];

  if (v3)
  {
    id v4 = [(RCRecordingCollectionViewCell *)self textFieldBeingEdited];
    [v4 resignFirstResponder];
  }
}

- (BOOL)accessibilityPerformMagicTap
{
  if (![(RCRecordingCollectionViewCell *)self isSelected]) {
    return 0;
  }
  BOOL v3 = [(RCRecordingCollectionViewCell *)self shuttleBar];
  id v4 = [v3 playControlState];

  if (v4 != (id)1) {
    return 0;
  }
  BOOL v5 = 1;
  [(RCRecordingCollectionViewCell *)self performControlsAction:1 position:self source:0.0];
  return v5;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (RCRecordingsCollectionViewCellDelegate)cellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cellDelegate);

  return (RCRecordingsCollectionViewCellDelegate *)WeakRetained;
}

- (double)descriptionHeight
{
  return self->_descriptionHeight;
}

- (double)shuttleBarHeight
{
  return self->_shuttleBarHeight;
}

- (BOOL)representsDownloadingFile
{
  return self->_representsDownloadingFile;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (BOOL)hasMultipleTracks
{
  return self->_hasMultipleTracks;
}

- (BOOL)verticallyExpanded
{
  return self->_verticallyExpanded;
}

- (BOOL)isRecentlyDeleted
{
  return self->_isRecentlyDeleted;
}

- (NUIContainerStackView)stackView
{
  return self->_stackView;
}

- (void)setRecordingDescriptionView:(id)a3
{
}

- (void)setShuttleBar:(id)a3
{
}

- (void)setDescriptionViewShuttleBarPadding:(double)a3
{
  self->_descriptionViewShuttleBarPadding = a3;
}

- (UITextField)textFieldBeingEdited
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldBeingEdited);

  return (UITextField *)WeakRetained;
}

- (void)setTextFieldBeingEdited:(id)a3
{
}

- (RCProgressOverlay)progressOverlay
{
  return self->_progressOverlay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressOverlay, 0);
  objc_destroyWeak((id *)&self->_textFieldBeingEdited);
  objc_storeStrong((id *)&self->_shuttleBar, 0);
  objc_storeStrong((id *)&self->_recordingDescriptionView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_destroyWeak((id *)&self->_cellDelegate);
}

@end