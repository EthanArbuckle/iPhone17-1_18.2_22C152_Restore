@interface RCRecorderStyleProvider
+ (id)sharedStyleProvider;
- (BOOL)_isCompactWidth;
- (BOOL)_isIOSMac;
- (BOOL)_isIpad;
- (BOOL)_isIpadOrIOSMac;
- (BOOL)_isIphone;
- (BOOL)_isLandscape;
- (BOOL)_isPortrait;
- (BOOL)_isWatch;
- (BOOL)_isWideIPad;
- (BOOL)_isWideIpadOrIOSMac;
- (BOOL)_recordingsListShouldUsePlainAppearance;
- (BOOL)allowsInteractiveCardSizing;
- (BOOL)appIsRightToLeft;
- (BOOL)expandsRecordingsCollectionViewItemOnSelection;
- (BOOL)explicitlyScrollsToRecordingsCollectionViewItemOnSelection;
- (BOOL)folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle;
- (BOOL)folderSelectionCollectionViewNeedsDisclosureAccessory;
- (BOOL)folderSelectionCollectionViewShowsSeparators;
- (BOOL)hasPlaybackCard;
- (BOOL)isAccessibilityLargerTextSizeEnabled;
- (BOOL)librarySupportsBlueCellSelectionStyle;
- (BOOL)presentsTitleAndAdditionalEditingControlsInPlaybackCard;
- (BOOL)presentsTitleAndAdditionalEditingControlsInRecordingCard;
- (BOOL)setSplitViewHorizontalSizeClass:(int64_t)a3;
- (BOOL)showsProgressInRecordingCollectionViewCell;
- (BOOL)sidebarCollectionViewNeedsDisclosureAccessory;
- (BOOL)sidebarCollectionViewShowsSeparators;
- (BOOL)sidebarPresentsWithGesture;
- (BOOL)supportsCompactRecordingCard;
- (BOOL)supportsDisplaceSplitBehavior;
- (BOOL)supportsRecordingViewElevatedUserInterfaceLevelOverride;
- (BOOL)supportsSheetPresentationSPI;
- (BOOL)transcriptViewShouldUseWidthMultiplier;
- (BOOL)transportButtonsAnimateWithCircle;
- (BOOL)usesLargeTitles;
- (BOOL)usesNavBarLargeTitleAndSearchBarHosting;
- (BOOL)usesSplitBehavior;
- (BOOL)usesTitleLabelPerfOptimization;
- (BOOL)usesVectorGlyph;
- (CAFrameRateRange)displayRefreshRate:(BOOL)a3;
- (CGSize)actionMenuImageSize;
- (CGSize)bannerSize;
- (CGSize)centerClusterControlSize;
- (CGSize)centerClusterControlSizeRecentlyDeleted;
- (CGSize)playbackSpeedSliderTickSize;
- (CGSize)trimDeleteButtonLeftSize;
- (NSDirectionalEdgeInsets)toggleButtonContentInsets;
- (UIEdgeInsets)playbackViewEdgeInsets;
- (UIEdgeInsets)playbackViewFullScreenEdgeInsets;
- (UIEdgeInsets)playbackViewTitleTextInsets;
- (double)_originalRecordingControlDiameter;
- (double)actionButtonExtraXAxisActiveWidth;
- (double)activityWaveformRunningAverageDuration;
- (double)activityWaveformTimeWindowDuration;
- (double)animationDragCoefficient;
- (double)annotationViewHeight;
- (double)bannerCornerRadius;
- (double)bannerStatusMessageDisplayLength;
- (double)beginEndLabelsTopPadding;
- (double)borderLayerThickness;
- (double)bottomAccessoryContentContainerHeight;
- (double)bottomAccessoryDescriptionHeight;
- (double)cancelButtonBottomAlignmentOffset;
- (double)centerClusterWidthCard;
- (double)centerClusterWidthJumpButton;
- (double)centerClusterWidthLibrary;
- (double)centerContentTranscriptViewMaxWidth;
- (double)centerContentTranscriptViewWidthMultiplier;
- (double)centerContentViewBottomPadding;
- (double)centerContentViewTopPadding;
- (double)collectionViewEditModeAnimationDuration;
- (double)compactStylePlayheadMultiplier;
- (double)compactStyleTimeBarDefaultHeight;
- (double)compactStyleTimeBarHeightInset;
- (double)compactWaveformWaveVerticalPadding;
- (double)contentUnavailableViewAnimationDuration;
- (double)descriptionCompactViewTitleToSecondaryPadding;
- (double)descriptionViewSecondaryLabelAlpha;
- (double)descriptionViewTitleToSecondaryPadding;
- (double)dimDescriptionViewAnimationDuration;
- (double)doneEditingButtonSidePadding;
- (double)dynamicIslandStatusMessageDisplayLength;
- (double)editButtonContentLeftRightPadding;
- (double)editButtonContentTopBottomPadding;
- (double)editButtonImageTitlePadding;
- (double)editRecordingViewImageSize;
- (double)editRecordingViewLeadingAndTrailingImagePadding;
- (double)editToolbarButtonHorizontalInset;
- (double)editToolbarButtonTopInset;
- (double)editToolbarCompactHeight;
- (double)editToolbarHeight;
- (double)editToolbarTitleTopInset;
- (double)editingProgressIndicatorDiameterCell;
- (double)editingProgressIndicatorDiameterPlayback;
- (double)editingProgressOuterRingThicknessCell;
- (double)editingProgressOuterRingThicknessPlayback;
- (double)folderSelectionCollectionViewTopPadding;
- (double)fullScreenDescriptionHeight;
- (double)inOutButtonCornerRadius;
- (double)jumpBackwardForwardButtonSpacing;
- (double)knobWidthMultiplier;
- (double)libraryCellDescriptionHeight;
- (double)libraryCellDescriptionViewShuttleBarPadding;
- (double)libraryCellShuttleBarHeight;
- (double)maximumDecibelDisplayRange;
- (double)maximumPrimaryColumnWidth;
- (double)minimumDecibelDisplayRange;
- (double)minimumPrimaryColumnWidth;
- (double)minimumSecondaryColumnWidth;
- (double)overviewKnobWidthMultiplier;
- (double)overviewPlayheadHeightInset;
- (double)overviewPlayheadWidthMultiplier;
- (double)overviewWaveformCornerRadius;
- (double)overviewWaveformHeight;
- (double)overviewWaveformHorizontalSpacing;
- (double)overviewWaveformMinimumDurationToDisplayWhenRecording;
- (double)overviewWaveformWaveVerticalPadding;
- (double)overviewWaveformWaveWidth;
- (double)paddingBetweenButtonsAndDescriptionView;
- (double)platterCheckmarkHeightMultiplier;
- (double)platterCompactLeadingViewHeightMultiplier;
- (double)platterCustomLeadingViewHeightMultiplier;
- (double)platterCustomLeadingViewLeadingPadding;
- (double)platterCustomLeadingViewToTrailingViewMinimumPadding;
- (double)platterEmptyViewToCheckmarkTransitionDuration;
- (double)platterMinimalViewWidth;
- (double)platterMinimalWaveformViewHeight;
- (double)platterStopButtonHeight;
- (double)platterStopButtonStateTransitionDuration;
- (double)platterWaveformMinimumRoundedSliceWidthPerSide;
- (double)platterWaveformPercentageOfRoundedSlices;
- (double)platterWaveformSlicePadding;
- (double)platterWaveformSliceScaleFactorForExpandedMode;
- (double)platterWaveformSliceWidth;
- (double)platterWaveformWidthCompact;
- (double)playbackSettingsButtonExtraActivePoints;
- (double)playbackSettingsCollectionViewCellMinHeight;
- (double)playbackSettingsCollectionViewContentInsetBottom;
- (double)playbackSettingsPopoverBottomPadding;
- (double)playbackSpeedSliderHeight;
- (double)playbackSpeedSliderTickCornerRadius;
- (double)playbackViewControlSectionHeight;
- (double)playbackViewTimeSectionBottomPadding;
- (double)playbackViewTimeSectionHeight;
- (double)playbackViewTopPadding;
- (double)playbackViewVerticalSpacingAboveOverviewWaveform;
- (double)playbackViewVerticalSpacingBelowOverviewWaveform;
- (double)playbackViewWaveformOverviewSidePadding;
- (double)playbackViewWidthToCollapseToolbarButtons;
- (double)playheadWidthMultiplier;
- (double)positionReadoutHeight;
- (double)positionReadoutLabelYOffset;
- (double)presentedViewsMinimumWidth;
- (double)primaryColumnWidth;
- (double)progressTextFontSize;
- (double)progressTextYSpacing;
- (double)progressViewDisplayDismissTime;
- (double)recordingCellStackViewVerticalLayoutMargin;
- (double)recordingControlAlphaWhenPressed;
- (double)recordingControlAnimationDuration;
- (double)recordingControlDiameter;
- (double)recordingControlExtraHitOutset;
- (double)recordingControlHeightForDiameter:(double)a3;
- (double)recordingControlInnerSquareWidthScaleFactor;
- (double)recordingControlLozengeFixedWidthScaleFactor;
- (double)recordingControlOuterRingGapScaleFactor;
- (double)recordingControlOuterRingThicknessScaleFactor;
- (double)recordingControlPauseGapScaleFactor;
- (double)recordingControlPauseStrokeCornerRadiusScaleFactor;
- (double)recordingControlSectionHeight;
- (double)recordingControlSquareCornerRadiusScaleFactor;
- (double)recordingNameLabelPadding;
- (double)recordingSectionDoneButtonDisabledOpacity;
- (double)recordingViewExpandedTranscriptAdditionalSpaceBetweenOverviewAndTimeLabel;
- (double)recordingViewSpaceBetweenToolbarAndDescriptionView;
- (double)recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview;
- (double)recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview;
- (double)selectionBarWidth;
- (double)selectionHighlightToKnobInset;
- (double)selectionHitTestSlop;
- (double)selectionKnobRadius;
- (double)selectionMiddleTimeBaselineInset;
- (double)selectionOverlayAlpha;
- (double)selectionOverlayBorderWidth;
- (double)selectionTimeBaseLineOffset;
- (double)selectionTimeInsetNormal;
- (double)selectionTimeInsetWhenSelected;
- (double)shuttleBarAdditionalSliderSpacingLibrary;
- (double)shuttleBarButtonContainerHeightCard;
- (double)shuttleBarButtonContainerHeightLibrary;
- (double)shuttleBarHeight;
- (double)shuttleBarShouldForceProportionalDistribution;
- (double)sidebarCollectionViewCellAXHyphenationFactor;
- (double)sidebarCollectionViewTopPadding;
- (double)splitViewSeparatorWidth;
- (double)timeLineMajorTickHeight;
- (double)timeLineMinorTickHeight;
- (double)timeLineTickWidth;
- (double)toggleButtonCornerRadius;
- (double)topMarginForCardView;
- (double)topMarginMinSafeAreaTopInsetForCardView;
- (double)topScreenSpacerHeight;
- (double)transcriptViewHorizontalMargins;
- (double)transcriptViewParagraphSpacing;
- (double)transportButtonAnimationDuration;
- (double)transportButtonAnimationJumpCircleRadius;
- (double)transportButtonAnimationPlayCircleRadius;
- (double)transportButtonAnimationShrinkFactor;
- (double)trimDeleteButtonCornerRadius;
- (double)trimDeleteButtonLeftPaddingDistance;
- (double)virtualNavBarButtonItemSpacing;
- (double)watchWaveformSlicePadding;
- (double)watchWaveformSliceWidth;
- (double)waveformExtraBlurEffectRadius;
- (double)waveformHorizontalSpacing;
- (double)waveformViewBlurEffectRadius;
- (double)waveformWaveVerticalPadding;
- (double)waveformWaveWidth;
- (id)_platterTimeLabelFontWithTextStyle:(id)a3 traitCollection:(id)a4;
- (id)_roundedThemePrimaryBackgroundColor;
- (id)accessibilityLargeSizes;
- (id)backgroundColor;
- (id)bannerBackgroundColor;
- (id)cardGoBackwardImage;
- (id)cardGoForwardImage;
- (id)cardPauseImage;
- (id)cardPlayImage;
- (id)copyTranscriptImage;
- (id)copyTranscriptImageName;
- (id)createNewFolderImage;
- (id)creationDateLabelFont;
- (id)creationDateLabelFontForRecordingCollectionViewCell;
- (id)deleteContextMenuButtonImage;
- (id)descriptionViewScalableTitleFontForCardView;
- (id)descriptionViewScalableTitleFontForRecordingCollectionViewCell;
- (id)duplicateActivitySystemImageName;
- (id)durationLabelFont;
- (id)durationLabelFontForCompactRecordingView;
- (id)editButtonImage;
- (id)editRecordingActivitySystemImageName;
- (id)editingControlButtonLabelFont;
- (id)editingToolbarButtonDisabledTextColor;
- (id)editingToolbarButtonTextColor;
- (id)editingToolbarCancelButtonLabelFont;
- (id)editingToolbarImageSymbolConfiguration;
- (id)editingToolbarMaximumContentSizeCategory;
- (id)editingToolbarSaveButtonLabelFont;
- (id)editingToolbarTitleLabelFont;
- (id)editingToolbarTitleTextColor;
- (id)ellipsisCircleImage;
- (id)ellipsisImage;
- (id)emptyLibraryTextScalableSecondaryFont;
- (id)expandCompactRecordingCardPropertyAnimator;
- (id)favoriteActivitySystemImageName:(BOOL)a3;
- (id)favoriteImage;
- (id)favoriteImageName;
- (id)filledMoveToFolderImage;
- (id)folderSelectionCollectionViewBackgroundColor;
- (id)folderSelectionCollectionViewCellColor;
- (id)folderSelectionNavBarNewFolderImageTintColor;
- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4;
- (id)inOutButtonBackgroundColor;
- (id)inOutButtonTextColor;
- (id)libraryGoBackwardImage;
- (id)libraryGoForwardImage;
- (id)libraryPauseImage;
- (id)libraryPlayImage;
- (id)mainLabelColor;
- (id)maxTrackTintColor;
- (id)minTrackTintColor;
- (id)moveToFolderActivitySystemImageName;
- (id)moveToFolderImage;
- (id)multiTrackIndicatorImage;
- (id)multitrackImageForLayerNumber:(unint64_t)a3 rounded:(BOOL)a4 slash:(BOOL)a5 circleFill:(BOOL)a6;
- (id)multitrackImageForWelcome;
- (id)notFavoriteImage;
- (id)notFavoriteImageName;
- (id)platterKeyColor;
- (id)platterTimeLabelCompactModeFontForTraitCollection:(id)a3;
- (id)platterTimeLabelCustomModeFontForTraitCollection:(id)a3;
- (id)platterWaveformActiveSliceColor;
- (id)platterWaveformInactiveSliceColor;
- (id)platterWaveformStatusMessageSliceColor;
- (id)playbackCardPrimaryLabelFontColor;
- (id)playbackCardSecondaryLabelFontColor;
- (id)playbackCardTimeLabelFontColor;
- (id)playbackPositionBarColor;
- (id)playbackSettingsImage;
- (id)playbackSpeedRegularTrackColor;
- (id)playbackSpeedSliderImageColor;
- (id)playbackSpeedSliderMaximumValueImage;
- (id)playbackSpeedSliderMinimumValueImage;
- (id)playbackSpeedTintedTrackColor;
- (id)playbackViewBackgroundColor;
- (id)playbackViewTimeLabelFont;
- (id)playbackViewToolbarImageSymbolConfiguration;
- (id)recentlyDeletedNonDefaultButtonTextColor;
- (id)recordPositionBarColor;
- (id)recordingCardBackgroundColor;
- (id)recordingCardBottomAccessoryBackgroundColor;
- (id)recordingCardBottomGradientColor;
- (id)recordingCardDefaultBackgroundColor;
- (id)recordingCardTimeLabelFontColor;
- (id)recordingCardTopBorderColor1;
- (id)recordingCardTopBorderColor2;
- (id)recordingCardTopGradientColor;
- (id)recordingCollectionViewCellCustomBackgroundColor;
- (id)recordingCollectionViewCellTextColor;
- (id)recordingCollectionViewSelectedCellTextColor;
- (id)recordingControlFontColor;
- (id)recordingControlInnerColor;
- (id)recordingControlInnerColorResume;
- (id)recordingControlOuterColor;
- (id)recordingControlTextFont;
- (id)recordingSectionCancelButtonInnerColor;
- (id)recordingSectionDoneAndCancelButtonTextColor;
- (id)recordingSectionDoneButtonInnerColor;
- (id)recordingsCollectionViewBackgroundColor;
- (id)recordingsCollectionViewEditButtonDimmedColor;
- (id)recordingsContentUnavailableImage;
- (id)renameContextMenuButtonImage;
- (id)replaceSelectionOverlayColor;
- (id)secondaryTransportControlsColorForLibrary;
- (id)selectionOverlayColor;
- (id)selectionOverlayEndpointBarColor;
- (id)separateLayersImageName;
- (id)shareToolbarMenuImage;
- (id)shuttleBarImageSymbolConfiguration;
- (id)sidebarCollectionViewBackgroundColor;
- (id)sidebarCollectionViewCellDropTargetBackgroundColor;
- (id)sidebarNavBarNewFolderImageTintColor;
- (id)splitViewSeparatorColor;
- (id)standardInteractionTintColor;
- (id)swipeTrashImage;
- (id)timeLineLabelFont;
- (id)timeLineMajorPlaybackMarkerColor;
- (id)timeLineMinorPlaybackMarkerColor;
- (id)timelinePlaybackTimeColor;
- (id)transcriptViewFont;
- (id)transcriptViewPlaybackDefaultTextColor;
- (id)transcriptViewPlaybackHighlightedTextColor;
- (id)transcriptViewRecordingDefaultTextColor;
- (id)transcriptViewRecordingHighlightedLastWordTextColor;
- (id)transcriptViewRecordingHighlightedSecondToLastWordTextColor;
- (id)transcriptionImage;
- (id)transcriptionToggleImage;
- (id)transportButtonAnimationCircleColor;
- (id)transportControlsColorForLibrary;
- (id)transportControlsColorForPlaybackCard;
- (id)transportControlsColorForRecordingCard;
- (id)trashBottomToolbarImage;
- (id)trashImage;
- (id)trimButtonTintColor;
- (id)trimDeleteButtonBackgroundColor;
- (id)trimDeleteButtonFont;
- (id)trimDeleteButtonTextColor;
- (id)trimImage;
- (id)trimImageName;
- (id)undoImageName;
- (id)watchAppTintColor;
- (id)waveformColorForSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5;
- (id)waveformCompactHighlightedBackgroundColor;
- (id)waveformPlaybackBackgroundColor;
- (id)waveformPlaybackHighlightedBackgroundColor;
- (id)waveformRecordingColor;
- (id)waveformStandardColor;
- (int64_t)_horizontalSizeClassFromSplitView;
- (int64_t)currentUserInterfaceStyle;
- (int64_t)folderSelectionCollectionViewListAppearance;
- (int64_t)recordingsCollectionViewLayoutListAppearance;
- (int64_t)sidebarCollectionViewListAppearance;
- (unint64_t)platterCompactViewSliceCount;
- (unint64_t)platterMinimalViewSliceCount;
- (unint64_t)supportedInterfaceOrientations;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)set_horizontalSizeClassFromSplitView:(int64_t)a3;
@end

@implementation RCRecorderStyleProvider

- (double)centerClusterWidthCard
{
  v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  if ([(RCRecorderStyleProvider *)self _isWideIPad])
  {
    [(RCRecorderStyleProvider *)self centerClusterWidthJumpButton];
  }
  else
  {
    unsigned int v7 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = v5 + -58.0;
    if (v7) {
      return 260.0;
    }
  }
  return result;
}

- (id)durationLabelFontForCompactRecordingView
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled];
  double v3 = 17.0;
  if (v2) {
    double v3 = 15.0;
  }
  double v4 = +[UIFont scaledMonospacedSystemFontOfSize:v3];

  return v4;
}

- (id)recordingCardBottomAccessoryBackgroundColor
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016E90;
  v4[3] = &unk_100221728;
  objc_copyWeak(&v5, &location);
  unsigned int v2 = +[UIColor colorWithDynamicProvider:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)splitViewSeparatorColor
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001BBF8;
  v4[3] = &unk_100221728;
  objc_copyWeak(&v5, &location);
  unsigned int v2 = +[UIColor colorWithDynamicProvider:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (BOOL)usesLargeTitles
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)supportsRecordingViewElevatedUserInterfaceLevelOverride
{
  return [(RCRecorderStyleProvider *)self _isIphone];
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 30;
  }
  else {
    return 6;
  }
}

- (id)sidebarCollectionViewBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self recordingsCollectionViewSupportsListAppearanceSidebar])
  {
    double v3 = [(RCRecorderStyleProvider *)self recordingCardBottomAccessoryBackgroundColor];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (double)primaryColumnWidth
{
  return 320.0;
}

- (double)maximumPrimaryColumnWidth
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 600.0;
  }

  [(RCRecorderStyleProvider *)self primaryColumnWidth];
  return result;
}

- (double)doneEditingButtonSidePadding
{
  return 16.0;
}

- (id)undoImageName
{
  return @"arrow.uturn.backward";
}

- (id)trimImageName
{
  return @"selection.pin.in.out";
}

- (double)transcriptViewParagraphSpacing
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 16.0;
  if (v2) {
    return 18.0;
  }
  return result;
}

- (id)transcriptViewFont
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double v3 = (id *)&UIFontTextStyleTitle2;
  if (!v2) {
    double v3 = (id *)&UIFontTextStyleTitle3;
  }
  id v4 = *v3;
  id v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:v4];
  UIFontDescriptorAttributeName v14 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v12 = UIFontWeightTrait;
  v6 = +[NSNumber numberWithDouble:UIFontWeightMedium];
  v13 = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15 = v7;
  v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v9 = [v5 fontDescriptorByAddingAttributes:v8];

  v10 = +[UIFont fontWithDescriptor:v9 size:0.0];

  return v10;
}

+ (id)sharedStyleProvider
{
  if (qword_10026A740 != -1) {
    dispatch_once(&qword_10026A740, &stru_1002216C0);
  }
  unsigned int v2 = (void *)qword_10026A738;

  return v2;
}

- (id)recordingCollectionViewCellTextColor
{
  return +[UIColor labelColor];
}

- (double)descriptionViewSecondaryLabelAlpha
{
  return 0.5;
}

- (BOOL)_isIphone
{
  unsigned int v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 0;

  return v3;
}

- (id)transcriptionImage
{
  return +[UIImage systemImageNamed:@"quote.bubble"];
}

- (id)multiTrackIndicatorImage
{
  return +[UIImage systemImageNamed:@"square.2.layers.3d"];
}

- (id)durationLabelFont
{
  return +[UIFont scaledMonospacedSystemFontOfSize:15.0];
}

- (id)creationDateLabelFont
{
  return +[UIFont scaledSystemFontOfSize:15.0 weight:UIFontWeightSemibold];
}

- (BOOL)isAccessibilityLargerTextSizeEnabled
{
  BOOL v3 = +[UIApplication sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];

  id v5 = [(RCRecorderStyleProvider *)self accessibilityLargeSizes];
  LOBYTE(v3) = [v5 containsObject:v4];

  return (char)v3;
}

- (id)accessibilityLargeSizes
{
  v4[0] = UIContentSizeCategoryAccessibilityMedium;
  v4[1] = UIContentSizeCategoryAccessibilityLarge;
  v4[2] = UIContentSizeCategoryAccessibilityExtraLarge;
  v4[3] = UIContentSizeCategoryAccessibilityExtraExtraLarge;
  void v4[4] = UIContentSizeCategoryAccessibilityExtraExtraExtraLarge;
  unsigned int v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (double)descriptionViewTitleToSecondaryPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 3.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

- (BOOL)usesTitleLabelPerfOptimization
{
  return [(RCRecorderStyleProvider *)self _isIphone];
}

- (BOOL)showsProgressInRecordingCollectionViewCell
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (double)recordingCellStackViewVerticalLayoutMargin
{
  return 11.0;
}

- (double)libraryCellShuttleBarHeight
{
  return 110.0;
}

- (double)libraryCellDescriptionViewShuttleBarPadding
{
  return 18.0;
}

- (double)libraryCellDescriptionHeight
{
  return 60.0;
}

- (id)formattedDateStringFromDate:(id)a3 forUUID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = +[RCDateFormatter sharedDateFormatter];
  v8 = [v7 formattedDateStringFromDate:v6 forUUID:v5];

  return v8;
}

- (BOOL)expandsRecordingsCollectionViewItemOnSelection
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 0;
  }
  else {
    return ![(RCRecorderStyleProvider *)self _isIOSMac];
  }
}

- (id)descriptionViewScalableTitleFontForRecordingCollectionViewCell
{
  return +[UIFont scaledSystemFontOfSize:17.0 weight:UIFontWeightSemibold];
}

- (id)creationDateLabelFontForRecordingCollectionViewCell
{
  return +[UIFont scaledSystemFontOfSize:15.0 weight:UIFontWeightRegular];
}

- (BOOL)_isWideIpadOrIOSMac
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  return v3 | [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (id)recordingCollectionViewCellCustomBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self librarySupportsBlueCellSelectionStyle])
  {
    unsigned int v2 = 0;
  }
  else
  {
    unsigned int v2 = +[UIColor systemBackgroundColor];
  }

  return v2;
}

- (BOOL)_isWideIPad
{
  char v3 = ![(RCRecorderStyleProvider *)self _isCompactWidth];
  return [(RCRecorderStyleProvider *)self _isIpad] & v3;
}

- (BOOL)_isIpad
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 0;
  }
  char v3 = +[UIDevice currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == (id)1;

  return v2;
}

- (BOOL)_isIOSMac
{
  return 0;
}

- (BOOL)_isCompactWidth
{
  return (id)[(RCRecorderStyleProvider *)self _horizontalSizeClassFromSplitView] == (id)1;
}

- (int64_t)_horizontalSizeClassFromSplitView
{
  return self->__horizontalSizeClassFromSplitView;
}

- (BOOL)librarySupportsBlueCellSelectionStyle
{
  if ([(RCRecorderStyleProvider *)self recordingsCollectionViewSupportsListAppearanceSidebar])
  {
    return 1;
  }

  return [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (id)playbackCardPrimaryLabelFontColor
{
  return +[UIColor labelColor];
}

- (id)descriptionViewScalableTitleFontForCardView
{
  double v3 = UIFontWeightSemibold;
  double v4 = 28.0;
  if (![(RCRecorderStyleProvider *)self _isIOSMac])
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isWideIPad];
    double v4 = v5 ? 34.0 : 22.0;
    if (v5) {
      double v3 = UIFontWeightBold;
    }
  }
  if ([(RCRecorderStyleProvider *)self isAccessibilityLargerTextSizeEnabled])
  {
    if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
      double v4 = v4 * 0.85;
    }
    else {
      double v4 = 20.0;
    }
  }

  return +[UIFont scaledSystemFontOfSize:v4 weight:v3];
}

- (id)recordingControlTextFont
{
  return +[UIFont systemFontOfSize:15.0 weight:UIFontWeightBold];
}

- (id)recordingControlFontColor
{
  return +[UIColor whiteColor];
}

- (id)recordingControlInnerColor
{
  return +[UIColor systemRedColor];
}

- (double)recordingControlSectionHeight
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 94.8051948;
  }
  if (![(RCRecorderStyleProvider *)self _isWatch]) {
    return 96.0;
  }
  [(RCRecorderStyleProvider *)self recordingControlDiameter];
  -[RCRecorderStyleProvider recordingControlHeightForDiameter:](self, "recordingControlHeightForDiameter:");
  return v4 + 24.0;
}

- (BOOL)_isWatch
{
  BOOL v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)4;

  return v3;
}

- (double)topScreenSpacerHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 30.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (double)shuttleBarHeight
{
  return 88.0;
}

- (double)recordingViewWaveformOverviewSpaceBetweenTimelabelAndOverview
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 0.0;
  if (v2) {
    return 24.0;
  }
  return result;
}

- (double)recordingViewWaveformOverviewSpaceBetweenMainWaveformAndOverview
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isWideIPad];
  double result = 22.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 116.0;
    if (v5) {
      return 49.3506494;
    }
  }
  return result;
}

- (double)positionReadoutHeight
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 76.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 70.0;
  if (v4) {
    return 151.948052;
  }
  return result;
}

- (double)overviewWaveformHeight
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 48.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 57.0;
  if (v4) {
    return 61.038961;
  }
  return result;
}

- (double)fullScreenDescriptionHeight
{
  unsigned int v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 preferredContentSizeCategory];

  NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryAccessibilityLarge);
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v3, UIContentSizeCategoryExtraLarge);
  double v6 = 50.0;
  if (v5 == NSOrderedDescending) {
    double v6 = 90.0;
  }
  if (v4 == NSOrderedDescending) {
    double v7 = 152.0;
  }
  else {
    double v7 = v6;
  }

  return v7;
}

- (double)editToolbarHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 50.0;
  if (v2) {
    return 75.0;
  }
  return result;
}

- (double)editToolbarCompactHeight
{
  return 30.0;
}

- (double)bottomAccessoryDescriptionHeight
{
  return 70.0;
}

- (double)bottomAccessoryContentContainerHeight
{
  return 94.0;
}

- (id)editingToolbarButtonTextColor
{
  if ([(RCRecorderStyleProvider *)self hostsTransportAndDoneButtonInBottomSection])
  {
    +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  else
  {
    +[UIColor systemBlueColor];
  unsigned int v2 = };

  return v2;
}

- (id)trimButtonTintColor
{
  return +[UIColor systemBlueColor];
}

- (double)toggleButtonCornerRadius
{
  return 7.0;
}

- (NSDirectionalEdgeInsets)toggleButtonContentInsets
{
  [(RCRecorderStyleProvider *)self editButtonContentTopBottomPadding];
  double v3 = 2.5;
  double v4 = 2.5;
  double v5 = v2;
  result.trailing = v4;
  result.bottom = v5;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)editButtonContentTopBottomPadding
{
  return 7.0;
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInRecordingCard
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)usesSplitBehavior
{
  return ![(RCRecorderStyleProvider *)self _isCompactWidth];
}

- (id)transportControlsColorForRecordingCard
{
  return +[UIColor labelColor];
}

- (id)transportButtonAnimationCircleColor
{
  return +[UIColor secondarySystemFillColor];
}

- (id)transcriptionToggleImage
{
  return +[UIImage systemImageNamed:@"quote.bubble.fill"];
}

- (BOOL)transcriptViewShouldUseWidthMultiplier
{
  return ![(RCRecorderStyleProvider *)self _isCompactWidth];
}

- (id)transcriptViewPlaybackHighlightedTextColor
{
  return +[UIColor labelColor];
}

- (id)transcriptViewPlaybackDefaultTextColor
{
  return +[UIColor secondaryLabelColor];
}

- (double)transcriptViewHorizontalMargins
{
  return 24.0;
}

- (BOOL)supportsCompactRecordingCard
{
  return ![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
}

- (id)standardInteractionTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    double v2 = 0;
  }
  else
  {
    double v2 = +[UIColor systemBlueColor];
  }

  return v2;
}

- (double)splitViewSeparatorWidth
{
  return 0.5;
}

- (BOOL)sidebarPresentsWithGesture
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (void)set_horizontalSizeClassFromSplitView:(int64_t)a3
{
  self->__horizontalSizeClassFromSplitView = a3;
}

- (BOOL)setSplitViewHorizontalSizeClass:(int64_t)a3
{
  BOOL v5 = [(RCRecorderStyleProvider *)self _horizontalSizeClassFromSplitView] != a3;
  [(RCRecorderStyleProvider *)self set_horizontalSizeClassFromSplitView:a3];
  return v5;
}

- (int64_t)recordingsCollectionViewLayoutListAppearance
{
  if ([(RCRecorderStyleProvider *)self _recordingsListShouldUsePlainAppearance])
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (id)recordingsCollectionViewBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (double)recordingViewSpaceBetweenToolbarAndDescriptionView
{
  if (![(RCRecorderStyleProvider *)self _isWideIPad]) {
    return 0.0;
  }

  [(RCRecorderStyleProvider *)self playbackViewTopPadding];
  return result;
}

- (id)recordingControlOuterColor
{
  return +[UIColor colorWithDynamicProvider:&stru_100221748];
}

- (double)recordingControlAnimationDuration
{
  return 0.2;
}

- (double)positionReadoutLabelYOffset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (UIEdgeInsets)playbackViewTitleTextInsets
{
  double v2 = 0.0;
  double v3 = -12.0;
  double v4 = 0.0;
  double v5 = -5.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)playbackViewTimeLabelFont
{
  if ([(RCRecorderStyleProvider *)self _isWatch])
  {
    double v3 = UIFontWeightRegular;
    double v4 = 35.0;
  }
  else
  {
    if ([(RCRecorderStyleProvider *)self _isIpad])
    {
      double v3 = UIFontWeightBold;
      uint64_t v5 = 0x4041000000000000;
    }
    else
    {
      double v3 = UIFontWeightSemibold;
      [(RCRecorderStyleProvider *)self _isIOSMac];
      uint64_t v5 = 0x4045000000000000;
    }
    double v4 = *(double *)&v5;
  }

  return +[UIFont monospacedDigitSystemFontOfSize:v4 weight:v3];
}

- (id)playbackSettingsImage
{
  return +[UIImage systemImageNamed:@"slider.horizontal.3"];
}

- (double)playbackSettingsButtonExtraActivePoints
{
  return 10.0;
}

- (id)playbackCardTimeLabelFontColor
{
  return +[UIColor labelColor];
}

- (double)paddingBetweenButtonsAndDescriptionView
{
  return 4.0;
}

- (double)minimumPrimaryColumnWidth
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    return 182.0;
  }

  [(RCRecorderStyleProvider *)self primaryColumnWidth];
  return result;
}

- (BOOL)hasPlaybackCard
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 1;
  }

  return [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (id)ellipsisCircleImage
{
  return +[UIImage systemImageNamed:@"ellipsis.circle"];
}

- (id)editingToolbarSaveButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
}

- (id)editingToolbarMaximumContentSizeCategory
{
  return UIContentSizeCategoryExtraLarge;
}

- (id)editingToolbarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:3];
}

- (double)editRecordingViewLeadingAndTrailingImagePadding
{
  return 14.0;
}

- (double)editRecordingViewImageSize
{
  return 34.0;
}

- (double)descriptionCompactViewTitleToSecondaryPadding
{
  return 5.0;
}

- (id)createNewFolderImage
{
  return +[UIImage systemImageNamed:@"folder.badge.plus"];
}

- (BOOL)allowsInteractiveCardSizing
{
  return ![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
}

- (double)actionButtonExtraXAxisActiveWidth
{
  return 5.0;
}

- (BOOL)_recordingsListShouldUsePlainAppearance
{
  if ([(RCRecorderStyleProvider *)self _isCompactWidth]) {
    return 1;
  }

  return [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)appIsRightToLeft
{
  double v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == (id)1;

  return v3;
}

- (double)recordingControlAlphaWhenPressed
{
  return 0.5;
}

- (double)recordingControlExtraHitOutset
{
  return 20.0;
}

- (double)collectionViewEditModeAnimationDuration
{
  return 0.3;
}

- (double)contentUnavailableViewAnimationDuration
{
  return 0.2;
}

- (double)animationDragCoefficient
{
  UIAnimationDragCoefficient();
  return v2;
}

- (double)centerClusterWidthJumpButton
{
  if ([(RCRecorderStyleProvider *)self _isWideIPad])
  {
    double v3 = 198.0;
  }
  else if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    double v3 = 260.0;
  }
  else
  {
    double v3 = 296.0;
  }
  [(RCRecorderStyleProvider *)self jumpBackwardForwardButtonSpacing];
  return v3 + v4 * 2.0;
}

- (double)centerClusterWidthLibrary
{
  return 165.0;
}

- (CGSize)centerClusterControlSize
{
  double v2 = 55.0;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)centerClusterControlSizeRecentlyDeleted
{
  double v2 = 1.79769313e308;
  double v3 = 66.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)playbackSettingsCollectionViewContentInsetBottom
{
  return -2.0;
}

- (double)playbackSettingsCollectionViewCellMinHeight
{
  return 50.0;
}

- (double)cancelButtonBottomAlignmentOffset
{
  return 151.0;
}

- (double)overviewWaveformCornerRadius
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 5.19480519;
  if (!v2) {
    return 4.0;
  }
  return result;
}

- (double)selectionOverlayBorderWidth
{
  return 2.0;
}

- (double)shuttleBarShouldForceProportionalDistribution
{
  return (double)[(RCRecorderStyleProvider *)self _isWideIPad];
}

- (double)shuttleBarButtonContainerHeightCard
{
  return 88.0;
}

- (double)shuttleBarButtonContainerHeightLibrary
{
  return 56.0;
}

- (double)shuttleBarAdditionalSliderSpacingLibrary
{
  return 12.0;
}

- (double)topMarginMinSafeAreaTopInsetForCardView
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
  double result = 32.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (double)topMarginForCardView
{
  return 12.0;
}

- (double)borderLayerThickness
{
  return 0.5;
}

- (double)recordingViewExpandedTranscriptAdditionalSpaceBetweenOverviewAndTimeLabel
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 50.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (double)virtualNavBarButtonItemSpacing
{
  return 22.0;
}

- (id)trimDeleteButtonTextColor
{
  return +[UIColor blackColor];
}

- (id)trimDeleteButtonBackgroundColor
{
  return +[UIColor systemYellowColor];
}

- (double)trimDeleteButtonCornerRadius
{
  return 8.0;
}

- (double)trimDeleteButtonLeftPaddingDistance
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 15.5844156;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (CGSize)trimDeleteButtonLeftSize
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double v3 = 80.0;
  if (v2) {
    double v3 = 116.883117;
  }
  double v4 = 32.0;
  if (v2) {
    double v4 = 36.3636364;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)inOutButtonTextColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

- (id)inOutButtonBackgroundColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.15];
}

- (double)inOutButtonCornerRadius
{
  return 8.0;
}

- (double)overviewPlayheadHeightInset
{
  return 1.0;
}

- (double)recordingNameLabelPadding
{
  return 0.0;
}

- (double)dimDescriptionViewAnimationDuration
{
  return 0.2;
}

- (id)expandCompactRecordingCardPropertyAnimator
{
  id v2 = [objc_alloc((Class)UISpringTimingParameters) initWithDampingRatio:1.0 initialVelocity:0.0];
  id v3 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v2 timingParameters:0.5];

  return v3;
}

- (double)waveformViewBlurEffectRadius
{
  return 4.0;
}

- (double)waveformExtraBlurEffectRadius
{
  return 5.0;
}

- (double)jumpBackwardForwardButtonSpacing
{
  id v3 = +[UIApplication sharedApplication];
  double v4 = [v3 delegate];
  uint64_t v5 = [v4 window];

  BOOL v6 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v5) {
    BOOL v7 = !v6;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [v5 frame];
    BOOL v6 = v8 >= 700.0;
  }
  if (v6) {
    double v9 = 35.0;
  }
  else {
    double v9 = 0.0;
  }

  return v9;
}

- (double)playbackViewTimeSectionHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 70.0;
  if (v2) {
    return 150.649351;
  }
  return result;
}

- (double)playbackViewTimeSectionBottomPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIpad];
  double result = 0.0;
  if (v2) {
    return 18.0;
  }
  return result;
}

- (double)playbackViewControlSectionHeight
{
  if (![(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return 92.0;
  }

  [(RCRecorderStyleProvider *)self recordingControlSectionHeight];
  return result;
}

- (double)playbackViewTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self presentsTitleAndAdditionalEditingControlsInPlaybackCard];
  double result = 50.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

- (double)playbackViewWaveformOverviewSidePadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 42.0;
  if (v2) {
    return 42.8571429;
  }
  return result;
}

- (double)playbackViewVerticalSpacingAboveOverviewWaveform
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isIpad];
  double result = 22.0;
  if ((v3 & 1) == 0)
  {
    unsigned int v5 = [(RCRecorderStyleProvider *)self _isIOSMac];
    double result = 62.0;
    if (v5) {
      return 49.3506494;
    }
  }
  return result;
}

- (double)playbackViewVerticalSpacingBelowOverviewWaveform
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 41.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)_isPortrait
{
  unsigned int v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 delegate];
  double v4 = [v3 window];
  unsigned int v5 = [v4 windowScene];
  BOOL v6 = (char *)[v5 interfaceOrientation] - 1 < (char *)2;

  return v6;
}

- (BOOL)_isLandscape
{
  unsigned int v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 delegate];
  double v4 = [v3 window];
  unsigned int v5 = [v4 windowScene];
  BOOL v6 = (char *)[v5 interfaceOrientation] - 3 < (char *)2;

  return v6;
}

- (UIEdgeInsets)playbackViewEdgeInsets
{
  if ([(RCRecorderStyleProvider *)self _isIpad])
  {
    [(RCRecorderStyleProvider *)self _isPortrait];
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
    double top = 0.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)playbackViewFullScreenEdgeInsets
{
  if ([(RCRecorderStyleProvider *)self _isIpad])
  {
    [(RCRecorderStyleProvider *)self _isPortrait];
    double top = 24.0;
    double right = 0.0;
    double bottom = 0.0;
    double left = 0.0;
  }
  else
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)playbackViewWidthToCollapseToolbarButtons
{
  return 500.0;
}

- (id)transcriptViewRecordingDefaultTextColor
{
  return +[UIColor labelColor];
}

- (id)transcriptViewRecordingHighlightedLastWordTextColor
{
  return +[UIColor systemRedColor];
}

- (id)transcriptViewRecordingHighlightedSecondToLastWordTextColor
{
  return +[UIColor colorWithDynamicProvider:&stru_100221700];
}

- (double)playbackSettingsPopoverBottomPadding
{
  return 30.0;
}

- (double)playbackSpeedSliderHeight
{
  return 4.0;
}

- (CGSize)playbackSpeedSliderTickSize
{
  [(RCRecorderStyleProvider *)self playbackSpeedSliderHeight];
  double v3 = v2 * 3.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)playbackSpeedSliderTickCornerRadius
{
  return 2.0;
}

- (BOOL)transportButtonsAnimateWithCircle
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (double)transportButtonAnimationJumpCircleRadius
{
  return 32.5;
}

- (double)transportButtonAnimationPlayCircleRadius
{
  return 32.5;
}

- (double)transportButtonAnimationShrinkFactor
{
  return 0.8;
}

- (double)transportButtonAnimationDuration
{
  return 0.2;
}

- (double)recordingControlDiameter
{
  return 60.0;
}

- (double)recordingControlHeightForDiameter:(double)a3
{
  return a3 + -2.0;
}

- (double)recordingControlOuterRingThicknessScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 3.0 / v2;
}

- (double)recordingControlOuterRingGapScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 6.0 / v2;
}

- (double)recordingControlInnerSquareWidthScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 24.0 / v2;
}

- (double)recordingControlSquareCornerRadiusScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 4.0 / v2;
}

- (double)recordingControlPauseGapScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 4.0 / v2;
}

- (double)recordingControlPauseStrokeCornerRadiusScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 2.0 / v2;
}

- (double)recordingControlLozengeFixedWidthScaleFactor
{
  [(RCRecorderStyleProvider *)self _originalRecordingControlDiameter];
  return 86.0 / v2;
}

- (double)_originalRecordingControlDiameter
{
  return 60.0;
}

- (CGSize)actionMenuImageSize
{
  double v2 = 32.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)minimumDecibelDisplayRange
{
  return -72.0;
}

- (double)maximumDecibelDisplayRange
{
  return 0.0;
}

- (double)centerContentTranscriptViewWidthMultiplier
{
  return 0.85;
}

- (double)centerContentTranscriptViewMaxWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 930.0;
  if (v2) {
    return 1024.0;
  }
  return result;
}

- (double)centerContentViewTopPadding
{
  if ([(RCRecorderStyleProvider *)self _isIpad]) {
    return 58.0;
  }
  unsigned int v4 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 36.0;
  if (v4) {
    return 0.0;
  }
  return result;
}

- (double)centerContentViewBottomPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 24.0;
  }
  return result;
}

- (double)waveformWaveWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)waveformHorizontalSpacing
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isIOSMac];
  [(RCRecorderStyleProvider *)self waveformWaveWidth];
  double result = v4 + 3.0;
  if (v3) {
    return result / 0.77;
  }
  return result;
}

- (double)overviewWaveformWaveWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)overviewWaveformHorizontalSpacing
{
  unsigned int v3 = [(RCRecorderStyleProvider *)self _isIOSMac];
  [(RCRecorderStyleProvider *)self overviewWaveformWaveWidth];
  double result = v4 + 1.0;
  if (v3) {
    return result / 0.77;
  }
  return result;
}

- (double)waveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)overviewWaveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)compactWaveformWaveVerticalPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 23.3766234;
  if (!v2) {
    return 18.0;
  }
  return result;
}

- (CAFrameRateRange)displayRefreshRate:(BOOL)a3
{
  BOOL v3 = a3;
  CAFrameRateRange result = CAFrameRateRangeMake(48.0, 120.0, 48.0);
  if (!v3)
  {
    result.minimum = CAFrameRateRangeDefault.minimum;
    result.maximum = CAFrameRateRangeDefault.maximum;
    result.preferred = CAFrameRateRangeDefault.preferred;
  }
  return result;
}

- (double)beginEndLabelsTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 6.49350649;
  if (!v2) {
    return 5.0;
  }
  return result;
}

- (double)overviewWaveformMinimumDurationToDisplayWhenRecording
{
  return 20.0;
}

- (double)timeLineTickWidth
{
  return 1.0;
}

- (double)timeLineMajorTickHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.987013;
  if (!v2) {
    return 10.0;
  }
  return result;
}

- (double)timeLineMinorTickHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 6.49350649;
  if (!v2) {
    return 5.0;
  }
  return result;
}

- (double)annotationViewHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 35.0649351;
  if (!v2) {
    return 27.0;
  }
  return result;
}

- (double)editToolbarTitleTopInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 12.5;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (double)editToolbarButtonTopInset
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 6.0;
  if (v2) {
    return 9.0;
  }
  return result;
}

- (double)editToolbarButtonHorizontalInset
{
  return 17.0;
}

- (double)selectionKnobRadius
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 4.54545455;
  if (!v2) {
    return 3.5;
  }
  return result;
}

- (double)selectionBarWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 1.2987013;
  if (!v2) {
    return 1.0;
  }
  return result;
}

- (double)selectionHighlightToKnobInset
{
  return 0.0;
}

- (double)selectionMiddleTimeBaselineInset
{
  return 7.0;
}

- (double)selectionTimeBaseLineOffset
{
  return 4.0;
}

- (double)selectionTimeInsetWhenSelected
{
  return 60.0;
}

- (double)selectionTimeInsetNormal
{
  return 0.0;
}

- (double)selectionHitTestSlop
{
  return 10.0;
}

- (double)selectionOverlayAlpha
{
  return 1.0;
}

- (double)playheadWidthMultiplier
{
  return 1.0;
}

- (double)knobWidthMultiplier
{
  return 1.0;
}

- (double)overviewPlayheadWidthMultiplier
{
  return 0.714;
}

- (double)overviewKnobWidthMultiplier
{
  return 1.857;
}

- (double)compactStylePlayheadMultiplier
{
  return 0.143;
}

- (double)compactStyleTimeBarDefaultHeight
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 63.0;
  if (v2) {
    return 81.8181818;
  }
  return result;
}

- (double)compactStyleTimeBarHeightInset
{
  return 17.0;
}

- (double)editButtonImageTitlePadding
{
  return 8.0;
}

- (double)editButtonContentLeftRightPadding
{
  [(RCRecorderStyleProvider *)self editButtonContentTopBottomPadding];
  return v2 + 3.0;
}

- (id)libraryPlayImage
{
  double v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:32.0];
  BOOL v3 = +[UIImage systemImageNamed:@"play.fill"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardPlayImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 42.0;
  if (v2) {
    double v4 = 50.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"play.fill"];
  BOOL v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)libraryPauseImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:32.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"pause.fill"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardPauseImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 42.0;
  if (v2) {
    double v4 = 50.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"pause.fill"];
  BOOL v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)libraryGoBackwardImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"gobackward.15"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardGoBackwardImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 25.0;
  if (v2) {
    double v4 = 31.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"gobackward.15"];
  BOOL v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)libraryGoForwardImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"goforward.15"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)cardGoForwardImage
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIPad];
  if (v2) {
    uint64_t v3 = 4;
  }
  else {
    uint64_t v3 = 5;
  }
  double v4 = 25.0;
  if (v2) {
    double v4 = 31.0;
  }
  unsigned int v5 = +[UIImageSymbolConfiguration configurationWithPointSize:v3 weight:2 scale:v4];
  BOOL v6 = +[UIImage systemImageNamed:@"goforward.15"];
  BOOL v7 = [v6 imageWithSymbolConfiguration:v5];

  return v7;
}

- (id)ellipsisImage
{
  unsigned int v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"ellipsis"];
  double v4 = [v3 imageWithSymbolConfiguration:v2];

  return v4;
}

- (id)trashImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)copyTranscriptImage
{
  id v2 = [(RCRecorderStyleProvider *)self copyTranscriptImageName];
  uint64_t v3 = +[UIImage systemImageNamed:v2];

  return v3;
}

- (id)copyTranscriptImageName
{
  return @"text.quote";
}

- (id)swipeTrashImage
{
  id v2 = +[UIImageSymbolConfiguration configurationWithPointSize:5 weight:2 scale:22.0];
  uint64_t v3 = +[UIImage systemImageNamed:@"trash.fill" withConfiguration:v2];

  return v3;
}

- (id)filledMoveToFolderImage
{
  return +[UIImage systemImageNamed:@"folder.fill"];
}

- (id)moveToFolderImage
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    id v2 = 0;
  }
  else
  {
    id v2 = +[UIImage systemImageNamed:@"folder"];
  }

  return v2;
}

- (id)trimImage
{
  return +[UIImage systemImageNamed:@"selection.pin.in.out"];
}

- (id)separateLayersImageName
{
  return @"arrow.trianglehead.branch";
}

- (id)favoriteImageName
{
  return @"heart.fill";
}

- (id)notFavoriteImageName
{
  return @"heart";
}

- (id)favoriteImage
{
  id v2 = [(RCRecorderStyleProvider *)self favoriteImageName];
  uint64_t v3 = +[UIImage systemImageNamed:v2];

  return v3;
}

- (id)notFavoriteImage
{
  id v2 = [(RCRecorderStyleProvider *)self notFavoriteImageName];
  uint64_t v3 = +[UIImage systemImageNamed:v2];

  return v3;
}

- (id)playbackSpeedSliderMinimumValueImage
{
  return +[UIImage systemImageNamed:@"tortoise"];
}

- (id)playbackSpeedSliderMaximumValueImage
{
  return +[UIImage systemImageNamed:@"hare"];
}

- (id)multitrackImageForWelcome
{
  return +[UIImage systemImageNamed:@"plus.circle.fill"];
}

- (id)multitrackImageForLayerNumber:(unint64_t)a3 rounded:(BOOL)a4 slash:(BOOL)a5 circleFill:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double v9 = +[NSString stringWithFormat:@"%lu", a3];
  v10 = v9;
  if (!v8)
  {
    if (!v7) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v12 = [v10 stringByAppendingString:@".slash"];

    v10 = (void *)v12;
    if (!v6) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  uint64_t v11 = [v9 stringByAppendingString:@".rounded"];

  v10 = (void *)v11;
  if (v7) {
    goto LABEL_6;
  }
LABEL_3:
  if (!v6)
  {
LABEL_11:
    v16 = +[NSLocale numberingSystem];
    if ([v16 isEqualToString:@"deva"])
    {
      CFStringRef v17 = @".hi";
    }
    else
    {
      if (![v16 isEqualToString:@"arab"]) {
        goto LABEL_16;
      }
      CFStringRef v17 = @".ar";
    }
    uint64_t v18 = [v10 stringByAppendingString:v17];

    v10 = (void *)v18;
LABEL_16:
    v15 = +[UIImage imageNamed:v10];

    UIFontDescriptorAttributeName v14 = v10;
    if (v15) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
LABEL_7:
  int v13 = v6 & ~(v8 || v7);
  UIFontDescriptorAttributeName v14 = [v10 stringByAppendingString:@".circle.fill"];

  if (!v13)
  {
    v10 = v14;
    goto LABEL_11;
  }
  v15 = +[UIImage systemImageNamed:v14];
  if (v15) {
    goto LABEL_20;
  }
LABEL_17:
  v19 = OSLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_10016AF6C((uint64_t)v14, v19);
  }

LABEL_20:

  return v15;
}

- (id)editButtonImage
{
  return +[UIImage systemImageNamed:@"waveform"];
}

- (id)renameContextMenuButtonImage
{
  return +[UIImage systemImageNamed:@"pencil"];
}

- (id)deleteContextMenuButtonImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)shareToolbarMenuImage
{
  return +[UIImage systemImageNamed:@"square.and.arrow.up"];
}

- (id)trashBottomToolbarImage
{
  return +[UIImage systemImageNamed:@"trash"];
}

- (id)recordingsContentUnavailableImage
{
  return +[UIImage systemImageNamed:@"folder"];
}

- (id)mainLabelColor
{
  return +[UIColor blackColor];
}

- (id)playbackViewBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (id)_roundedThemePrimaryBackgroundColor
{
  return +[UIColor clearColor];
}

- (id)transportControlsColorForLibrary
{
  return +[UIColor labelColor];
}

- (id)secondaryTransportControlsColorForLibrary
{
  return +[UIColor systemBlueColor];
}

- (id)recordingCardBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (id)recordingCardTimeLabelFontColor
{
  return +[UIColor colorWithWhite:0.901960784 alpha:1.0];
}

- (id)recordingCardTopGradientColor
{
  return +[UIColor colorWithWhite:0.1 alpha:1.0];
}

- (id)recordingCardBottomGradientColor
{
  return +[UIColor colorWithWhite:0.05 alpha:1.0];
}

- (id)recordingCardTopBorderColor1
{
  return +[UIColor colorWithWhite:0.165 alpha:1.0];
}

- (id)recordingCardTopBorderColor2
{
  return +[UIColor clearColor];
}

- (id)editingToolbarButtonDisabledTextColor
{
  id v2 = +[UIColor systemGrayColor];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

- (id)editingToolbarTitleTextColor
{
  return +[UIColor labelColor];
}

- (id)recordingsCollectionViewEditButtonDimmedColor
{
  return +[UIColor systemGrayColor];
}

- (id)sidebarNavBarNewFolderImageTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    id v2 = +[UIColor secondaryLabelColor];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)sidebarCollectionViewCellDropTargetBackgroundColor
{
  return 0;
}

- (id)folderSelectionCollectionViewCellColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    id v2 = +[UIColor systemBackgroundColor];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)folderSelectionCollectionViewBackgroundColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    id v2 = +[UIColor secondarySystemBackgroundColor];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)folderSelectionNavBarNewFolderImageTintColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac])
  {
    id v2 = +[UIColor secondaryLabelColor];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (int64_t)sidebarCollectionViewListAppearance
{
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return 3;
  }
  else {
    return 2;
  }
}

- (BOOL)sidebarCollectionViewShowsSeparators
{
  return ![(RCRecorderStyleProvider *)self supportsAccompaniedSidebarStyle];
}

- (BOOL)sidebarCollectionViewNeedsDisclosureAccessory
{
  return ![(RCRecorderStyleProvider *)self supportsAccompaniedSidebarStyle];
}

- (double)sidebarCollectionViewCellAXHyphenationFactor
{
  return 0.2;
}

- (double)sidebarCollectionViewTopPadding
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 0.0;
  if (v2) {
    return 7.0;
  }
  return result;
}

- (int64_t)folderSelectionCollectionViewListAppearance
{
  return 2;
}

- (BOOL)folderSelectionCollectionViewShowsSeparators
{
  return 1;
}

- (BOOL)folderSelectionCollectionViewNeedsDisclosureAccessory
{
  return 0;
}

- (BOOL)folderSelectionCollectionViewHeaderCellUsesAccompaniedSidebarStyle
{
  return 0;
}

- (double)folderSelectionCollectionViewTopPadding
{
  return 0.0;
}

- (double)presentedViewsMinimumWidth
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double result = 500.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (id)watchAppTintColor
{
  return +[UIColor colorWithRed:0.988235294 green:0.239215686 blue:0.223529412 alpha:1.0];
}

- (id)playbackCardSecondaryLabelFontColor
{
  return +[UIColor colorWithRed:0.298039216 green:0.298039216 blue:0.298039216 alpha:1.0];
}

- (id)recordingControlInnerColorResume
{
  unsigned int v2 = +[UIColor systemRedColor];
  [v2 alphaComponent];
  double v4 = [v2 colorWithAlphaComponent:v3 * 0.3];

  return v4;
}

- (id)recordingSectionDoneButtonInnerColor
{
  return +[UIColor systemGray4Color];
}

- (id)recordingSectionDoneAndCancelButtonTextColor
{
  return +[UIColor labelColor];
}

- (id)recordingSectionCancelButtonInnerColor
{
  return +[UIColor systemGray5Color];
}

- (double)recordingSectionDoneButtonDisabledOpacity
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac];
  double result = 0.2;
  if (v2) {
    return 0.575;
  }
  return result;
}

- (id)recordingCollectionViewSelectedCellTextColor
{
  if ([(RCRecorderStyleProvider *)self librarySupportsBlueCellSelectionStyle]) {
    +[UIColor systemWhiteColor];
  }
  else {
  double v3 = [(RCRecorderStyleProvider *)self recordingCollectionViewCellTextColor];
  }

  return v3;
}

- (id)backgroundColor
{
  return +[UIColor colorWithRed:0.08 green:0.08 blue:0.08 alpha:1.0];
}

- (id)waveformRecordingColor
{
  if (qword_10026A750 != -1) {
    dispatch_once(&qword_10026A750, &stru_100221768);
  }
  unsigned int v2 = (void *)qword_10026A748;

  return v2;
}

- (id)waveformCompactHighlightedBackgroundColor
{
  return +[UIColor colorWithRed:0.121568627 green:0.121568627 blue:0.121568627 alpha:0.0];
}

- (id)timelinePlaybackTimeColor
{
  return +[UIColor tertiaryLabelColor];
}

- (id)timeLineMinorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (id)timeLineMajorPlaybackMarkerColor
{
  return +[UIColor tertiarySystemFillColor];
}

- (id)playbackPositionBarColor
{
  if ([(RCRecorderStyleProvider *)self _isIOSMac]) {
    +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
  }
  else {
  unsigned int v2 = +[UIColor systemBlueColor];
  }

  return v2;
}

- (id)recordPositionBarColor
{
  return +[UIColor colorWithRed:1.0 green:0.231372549 blue:0.188235294 alpha:1.0];
}

- (id)selectionOverlayColor
{
  unsigned int v2 = +[UIColor systemYellowColor];
  double v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

- (id)selectionOverlayEndpointBarColor
{
  return +[UIColor systemYellowColor];
}

- (id)replaceSelectionOverlayColor
{
  return +[UIColor colorWithRed:0.164705882 green:0.031372549 blue:0.031372549 alpha:1.0];
}

- (id)playbackSpeedSliderImageColor
{
  return +[UIColor secondaryLabelColor];
}

- (id)playbackSpeedRegularTrackColor
{
  return +[UIColor systemFillColor];
}

- (id)playbackSpeedTintedTrackColor
{
  return +[UIColor systemBlueColor];
}

- (id)recentlyDeletedNonDefaultButtonTextColor
{
  return +[UIColor whiteColor];
}

- (id)transportControlsColorForPlaybackCard
{
  return +[UIColor colorWithDynamicProvider:&stru_100221788];
}

- (id)recordingCardDefaultBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (id)minTrackTintColor
{
  return +[UIColor colorWithDynamicProvider:&stru_1002217A8];
}

- (id)maxTrackTintColor
{
  return +[UIColor colorWithDynamicProvider:&stru_1002217C8];
}

- (id)waveformStandardColor
{
  return +[UIColor colorWithDynamicProvider:&stru_1002217E8];
}

- (id)waveformColorForSelected:(BOOL)a3 muted:(BOOL)a4 trimMode:(BOOL)a5
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100045540;
  v7[3] = &unk_100221808;
  BOOL v8 = a5;
  BOOL v9 = a4;
  BOOL v10 = a3;
  unsigned int v5 = +[UIColor colorWithDynamicProvider:v7];

  return v5;
}

- (id)waveformPlaybackBackgroundColor
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000457F8;
  v4[3] = &unk_100221728;
  objc_copyWeak(&v5, &location);
  unsigned int v2 = +[UIColor colorWithDynamicProvider:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)waveformPlaybackHighlightedBackgroundColor
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000459D8;
  v4[3] = &unk_100221728;
  objc_copyWeak(&v5, &location);
  unsigned int v2 = +[UIColor colorWithDynamicProvider:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)editingControlButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
}

- (id)editingToolbarCancelButtonLabelFont
{
  return +[UIFont systemFontOfSize:17.0 weight:UIFontWeightRegular];
}

- (id)editingToolbarTitleLabelFont
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWatch];
  double v3 = 17.0;
  if (v2) {
    double v3 = 21.0;
  }
  double v4 = &UIFontWeightMedium;
  if (!v2) {
    double v4 = &UIFontWeightSemibold;
  }
  id v5 = +[UIFont systemFontOfSize:v3 weight:*v4];

  return v5;
}

- (id)emptyLibraryTextScalableSecondaryFont
{
  return +[UIFont scaledSystemFontOfSize:16.0];
}

- (id)timeLineLabelFont
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isIOSMac];
  double v3 = 15.5844156;
  if (!v2) {
    double v3 = 12.0;
  }

  return +[UIFont systemFontOfSize:v3];
}

- (id)trimDeleteButtonFont
{
  return +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
}

- (double)progressViewDisplayDismissTime
{
  return 0.5;
}

- (double)editingProgressIndicatorDiameterCell
{
  return 26.0;
}

- (double)editingProgressIndicatorDiameterPlayback
{
  return 52.0;
}

- (double)editingProgressOuterRingThicknessCell
{
  return 2.0;
}

- (double)editingProgressOuterRingThicknessPlayback
{
  return 4.0;
}

- (double)progressTextFontSize
{
  return 15.0;
}

- (double)progressTextYSpacing
{
  return 12.0;
}

- (double)activityWaveformTimeWindowDuration
{
  unsigned int v2 = [(RCRecorderStyleProvider *)self _isWatch];
  double result = 2.4;
  if (!v2) {
    return 2.0;
  }
  return result;
}

- (double)activityWaveformRunningAverageDuration
{
  [(RCRecorderStyleProvider *)self activityWaveformTimeWindowDuration];
  return v2 + 0.5;
}

- (double)watchWaveformSliceWidth
{
  return 2.0;
}

- (double)watchWaveformSlicePadding
{
  return 2.0;
}

- (CGSize)bannerSize
{
  double v2 = 82.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)bannerCornerRadius
{
  return 18.0;
}

- (id)bannerBackgroundColor
{
  double v2 = +[UIColor blackColor];
  double v3 = [v2 colorWithAlphaComponent:0.9];

  return v3;
}

- (double)bannerStatusMessageDisplayLength
{
  return 1.0;
}

- (id)platterKeyColor
{
  return +[UIColor colorWithRed:0.9988 green:0.271 blue:0.2263 alpha:1.0];
}

- (id)platterTimeLabelCustomModeFontForTraitCollection:(id)a3
{
  return [(RCRecorderStyleProvider *)self _platterTimeLabelFontWithTextStyle:UIFontTextStyleTitle3 traitCollection:a3];
}

- (id)platterTimeLabelCompactModeFontForTraitCollection:(id)a3
{
  return [(RCRecorderStyleProvider *)self _platterTimeLabelFontWithTextStyle:UIFontTextStyleSubheadline traitCollection:a3];
}

- (id)_platterTimeLabelFontWithTextStyle:(id)a3 traitCollection:(id)a4
{
  double v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a3 compatibleWithTraitCollection:a4];
  [v4 pointSize];
  id v5 = +[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:");

  return v5;
}

- (double)platterStopButtonHeight
{
  return 57.0;
}

- (double)platterStopButtonStateTransitionDuration
{
  return 1.0;
}

- (double)dynamicIslandStatusMessageDisplayLength
{
  return 3.0;
}

- (unint64_t)platterMinimalViewSliceCount
{
  return 10;
}

- (unint64_t)platterCompactViewSliceCount
{
  return 16;
}

- (double)platterWaveformSliceWidth
{
  return 1.6;
}

- (double)platterWaveformSlicePadding
{
  return 1.2;
}

- (double)platterWaveformSliceScaleFactorForExpandedMode
{
  return 2.3;
}

- (double)platterWaveformPercentageOfRoundedSlices
{
  return 0.3;
}

- (double)platterWaveformMinimumRoundedSliceWidthPerSide
{
  return 5.0;
}

- (double)platterWaveformWidthCompact
{
  unint64_t v3 = [(RCRecorderStyleProvider *)self platterCompactViewSliceCount];
  [(RCRecorderStyleProvider *)self platterWaveformSliceWidth];
  double v5 = v4;
  [(RCRecorderStyleProvider *)self platterWaveformSlicePadding];
  return v6 * (double)v3 + (double)v3 * v5;
}

- (id)platterWaveformActiveSliceColor
{
  return +[UIColor colorWithRed:1.0 green:0.349019608 blue:0.345098039 alpha:1.0];
}

- (id)platterWaveformInactiveSliceColor
{
  return +[UIColor colorWithWhite:1.0 alpha:0.3];
}

- (id)platterWaveformStatusMessageSliceColor
{
  return +[UIColor systemWhiteColor];
}

- (double)platterEmptyViewToCheckmarkTransitionDuration
{
  return 0.3;
}

- (double)platterCompactLeadingViewHeightMultiplier
{
  return 0.53;
}

- (double)platterCustomLeadingViewLeadingPadding
{
  return 18.0;
}

- (double)platterCustomLeadingViewHeightMultiplier
{
  return 0.55;
}

- (double)platterCustomLeadingViewToTrailingViewMinimumPadding
{
  return -5.0;
}

- (double)platterMinimalWaveformViewHeight
{
  return 20.0;
}

- (double)platterCheckmarkHeightMultiplier
{
  return 0.7;
}

- (double)platterMinimalViewWidth
{
  return 45.0;
}

- (BOOL)explicitlyScrollsToRecordingsCollectionViewItemOnSelection
{
  if ([(RCRecorderStyleProvider *)self _isWideIpadOrIOSMac]) {
    return +[UIKeyboard isInHardwareKeyboardMode] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)supportsSheetPresentationSPI
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)presentsTitleAndAdditionalEditingControlsInPlaybackCard
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)usesNavBarLargeTitleAndSearchBarHosting
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)_isIpadOrIOSMac
{
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self _isIpad];
  return v3 | [(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)usesVectorGlyph
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (BOOL)supportsDisplaceSplitBehavior
{
  return ![(RCRecorderStyleProvider *)self _isIOSMac];
}

- (double)minimumSecondaryColumnWidth
{
  return 384.0;
}

- (id)playbackViewToolbarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody scale:3];
}

- (id)shuttleBarImageSymbolConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:3 scale:17.0];
}

- (id)duplicateActivitySystemImageName
{
  return @"plus.square.on.square";
}

- (id)editRecordingActivitySystemImageName
{
  return @"waveform";
}

- (id)moveToFolderActivitySystemImageName
{
  return @"folder";
}

- (id)favoriteActivitySystemImageName:(BOOL)a3
{
  if (a3) {
    [(RCRecorderStyleProvider *)self favoriteImageName];
  }
  else {
  unsigned __int8 v3 = [(RCRecorderStyleProvider *)self notFavoriteImageName];
  }

  return v3;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

@end