@interface PXCompleteMyMomentSettings
+ (PXCompleteMyMomentSettings)sharedInstance;
+ (id)_enableAllCmmImprovementsAction;
+ (id)_enabledAllCmmImprovementsActionPredicate;
+ (id)settingsControllerModule;
+ (id)transientProperties;
- (BOOL)allowLayoutTransitionGesture;
- (BOOL)allowOneUpGesture;
- (BOOL)allowSwipeSelection;
- (BOOL)alwaysSortAfterAddMore;
- (BOOL)alwaysTapToRetry;
- (BOOL)autoAcceptBubbles;
- (BOOL)directSendMessages;
- (BOOL)disableClickyOrb;
- (BOOL)disableCopyAction;
- (BOOL)disableDescriptiveWaiting;
- (BOOL)disableDetailView;
- (BOOL)disableOneUpDescriptiveAdd;
- (BOOL)disablePrintAction;
- (BOOL)disableShareAction;
- (BOOL)disableShareSheetAutomaticBehaviorIfADPEnabled;
- (BOOL)disableShowInAllPhotosAction;
- (BOOL)emulatesEmptyMomentShare;
- (BOOL)fakeMomentShareURL;
- (BOOL)graphSuggestionEnabled;
- (BOOL)preventNilTitles;
- (BOOL)sectionHeadersShouldFloat;
- (BOOL)shouldBakeInIfAdjustedByThirdParty;
- (BOOL)shouldBakeInIfContainsPenultimateResources;
- (BOOL)shouldBakeInIfCropped;
- (BOOL)shouldBakeInIfLivePhotoMuted;
- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled;
- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled;
- (BOOL)shouldBakeInIfTimelineTrimmed;
- (BOOL)shouldIncludeSpatialOvercaptureResources;
- (BOOL)shouldShowInlineAddButton;
- (BOOL)showAttachedHeaderView;
- (BOOL)showDebugStatus;
- (BOOL)showFloatingBanner;
- (BOOL)showMergeCandidateSuggestionsAfterBootstrapNaming;
- (BOOL)showMessage;
- (BOOL)showMessageTextEntryGadget;
- (BOOL)showOtherTitle;
- (BOOL)showPeopleSuggestions;
- (BOOL)showProgressBannerView;
- (BOOL)showProgressBannerViewPaused;
- (BOOL)showProgressInGrid;
- (BOOL)showSectionHeaders;
- (BOOL)showSenderField;
- (BOOL)showStatusFooter;
- (BOOL)showSubtitle;
- (BOOL)showTitle;
- (BOOL)showURLInBubble;
- (BOOL)simulateAllMomentSharesAreNew;
- (BOOL)simulateCPLAlertOnPublish;
- (BOOL)simulateDelays;
- (BOOL)simulateImport;
- (BOOL)simulateImportFailure;
- (BOOL)simulateMomentShareBubbleError;
- (BOOL)simulateMomentShareCreationError;
- (BOOL)simulateShouldPromptUserToIgnoreBudgets;
- (BOOL)useDebugColors;
- (PXCMMWorkflowCoordinator)workflowCoordinator;
- (double)peopleSuggestionsTimeout;
- (id)parentSettings;
- (int64_t)cmmShareSheetBehavior;
- (int64_t)initialLayoutType;
- (int64_t)invitationsDataSourceType;
- (int64_t)overrideNumberOfColumnsInLandscape;
- (int64_t)overrideNumberOfColumnsInPortrait;
- (int64_t)peopleSuggestionsDataSourceType;
- (int64_t)publishTransport;
- (int64_t)reviewFlow;
- (int64_t)reviewFlowDataSourceType;
- (int64_t)shareSheetLinkAssetCountThreshold;
- (int64_t)sharingLinkType;
- (int64_t)simulateCPLCMMFeatureState;
- (int64_t)simulateCPLFeatureState;
- (int64_t)simulateCloudPhotosExitState;
- (int64_t)simulateCloudPhotosState;
- (int64_t)simulateCloudState;
- (int64_t)simulateFeatureFlagState;
- (int64_t)simulateFetchErrorType;
- (int64_t)simulateSystemPhotoLibraryState;
- (int64_t)simulatedMomentShareBubbleErrorType;
- (int64_t)simulatedMomentShareCreationErrorType;
- (unint64_t)shareSheetLinkSpatialImageFileSizeThresholdMB;
- (unint64_t)shareSheetLinkSpatialVideoFileSizeThresholdMB;
- (unint64_t)shareSheetLinkTotalFileSizeThresholdMB;
- (void)setAllowLayoutTransitionGesture:(BOOL)a3;
- (void)setAllowOneUpGesture:(BOOL)a3;
- (void)setAllowSwipeSelection:(BOOL)a3;
- (void)setAlwaysSortAfterAddMore:(BOOL)a3;
- (void)setAlwaysTapToRetry:(BOOL)a3;
- (void)setAutoAcceptBubbles:(BOOL)a3;
- (void)setCmmShareSheetBehavior:(int64_t)a3;
- (void)setDefaultValues;
- (void)setDirectSendMessages:(BOOL)a3;
- (void)setDisableClickyOrb:(BOOL)a3;
- (void)setDisableCopyAction:(BOOL)a3;
- (void)setDisableDescriptiveWaiting:(BOOL)a3;
- (void)setDisableDetailView:(BOOL)a3;
- (void)setDisableOneUpDescriptiveAdd:(BOOL)a3;
- (void)setDisablePrintAction:(BOOL)a3;
- (void)setDisableShareAction:(BOOL)a3;
- (void)setDisableShareSheetAutomaticBehaviorIfADPEnabled:(BOOL)a3;
- (void)setDisableShowInAllPhotosAction:(BOOL)a3;
- (void)setEmulatesEmptyMomentShare:(BOOL)a3;
- (void)setFakeMomentShareURL:(BOOL)a3;
- (void)setGraphSuggestionEnabled:(BOOL)a3;
- (void)setInitialLayoutType:(int64_t)a3;
- (void)setInvitationsDataSourceType:(int64_t)a3;
- (void)setOverrideNumberOfColumnsInLandscape:(int64_t)a3;
- (void)setOverrideNumberOfColumnsInPortrait:(int64_t)a3;
- (void)setPeopleSuggestionsDataSourceType:(int64_t)a3;
- (void)setPeopleSuggestionsTimeout:(double)a3;
- (void)setPreventNilTitles:(BOOL)a3;
- (void)setPublishTransport:(int64_t)a3;
- (void)setReviewFlow:(int64_t)a3;
- (void)setReviewFlowDataSourceType:(int64_t)a3;
- (void)setSectionHeadersShouldFloat:(BOOL)a3;
- (void)setShareSheetLinkAssetCountThreshold:(int64_t)a3;
- (void)setShareSheetLinkSpatialImageFileSizeThresholdMB:(unint64_t)a3;
- (void)setShareSheetLinkSpatialVideoFileSizeThresholdMB:(unint64_t)a3;
- (void)setShareSheetLinkTotalFileSizeThresholdMB:(unint64_t)a3;
- (void)setSharingLinkType:(int64_t)a3;
- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3;
- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3;
- (void)setShouldBakeInIfCropped:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3;
- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3;
- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3;
- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3;
- (void)setShouldIncludeSpatialOvercaptureResources:(BOOL)a3;
- (void)setShouldShowInlineAddButton:(BOOL)a3;
- (void)setShowAttachedHeaderView:(BOOL)a3;
- (void)setShowDebugStatus:(BOOL)a3;
- (void)setShowFloatingBanner:(BOOL)a3;
- (void)setShowMergeCandidateSuggestionsAfterBootstrapNaming:(BOOL)a3;
- (void)setShowMessage:(BOOL)a3;
- (void)setShowMessageTextEntryGadget:(BOOL)a3;
- (void)setShowOtherTitle:(BOOL)a3;
- (void)setShowPeopleSuggestions:(BOOL)a3;
- (void)setShowProgressBannerView:(BOOL)a3;
- (void)setShowProgressBannerViewPaused:(BOOL)a3;
- (void)setShowProgressInGrid:(BOOL)a3;
- (void)setShowSectionHeaders:(BOOL)a3;
- (void)setShowSenderField:(BOOL)a3;
- (void)setShowStatusFooter:(BOOL)a3;
- (void)setShowSubtitle:(BOOL)a3;
- (void)setShowTitle:(BOOL)a3;
- (void)setShowURLInBubble:(BOOL)a3;
- (void)setSimulateAllMomentSharesAreNew:(BOOL)a3;
- (void)setSimulateCPLAlertOnPublish:(BOOL)a3;
- (void)setSimulateCPLCMMFeatureState:(int64_t)a3;
- (void)setSimulateCPLFeatureState:(int64_t)a3;
- (void)setSimulateCloudPhotosExitState:(int64_t)a3;
- (void)setSimulateCloudPhotosState:(int64_t)a3;
- (void)setSimulateCloudState:(int64_t)a3;
- (void)setSimulateDelays:(BOOL)a3;
- (void)setSimulateFeatureFlagState:(int64_t)a3;
- (void)setSimulateFetchErrorType:(int64_t)a3;
- (void)setSimulateImport:(BOOL)a3;
- (void)setSimulateImportFailure:(BOOL)a3;
- (void)setSimulateMomentShareBubbleError:(BOOL)a3;
- (void)setSimulateMomentShareCreationError:(BOOL)a3;
- (void)setSimulateShouldPromptUserToIgnoreBudgets:(BOOL)a3;
- (void)setSimulateSystemPhotoLibraryState:(int64_t)a3;
- (void)setSimulatedMomentShareBubbleErrorType:(int64_t)a3;
- (void)setSimulatedMomentShareCreationErrorType:(int64_t)a3;
- (void)setUseDebugColors:(BOOL)a3;
- (void)setWorkflowCoordinator:(id)a3;
- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6;
@end

@implementation PXCompleteMyMomentSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXCompleteMyMomentSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXCompleteMyMomentSettings *)self setAlwaysSortAfterAddMore:0];
  [(PXCompleteMyMomentSettings *)self setInvitationsDataSourceType:0];
  [(PXCompleteMyMomentSettings *)self setPreventNilTitles:1];
  [(PXCompleteMyMomentSettings *)self setSimulateMomentShareCreationError:0];
  [(PXCompleteMyMomentSettings *)self setSimulatedMomentShareCreationErrorType:0];
  [(PXCompleteMyMomentSettings *)self setShowTitle:1];
  [(PXCompleteMyMomentSettings *)self setShowSubtitle:0];
  [(PXCompleteMyMomentSettings *)self setShowOtherTitle:0];
  [(PXCompleteMyMomentSettings *)self setShowMessage:0];
  [(PXCompleteMyMomentSettings *)self setShowSenderField:0];
  [(PXCompleteMyMomentSettings *)self setShowPeopleSuggestions:0];
  [(PXCompleteMyMomentSettings *)self setShowMergeCandidateSuggestionsAfterBootstrapNaming:0];
  [(PXCompleteMyMomentSettings *)self setReviewFlow:0];
  [(PXCompleteMyMomentSettings *)self setInitialLayoutType:0];
  [(PXCompleteMyMomentSettings *)self setAllowLayoutTransitionGesture:0];
  [(PXCompleteMyMomentSettings *)self setPublishTransport:0];
  [(PXCompleteMyMomentSettings *)self setPeopleSuggestionsDataSourceType:1];
  [(PXCompleteMyMomentSettings *)self setShouldShowInlineAddButton:1];
  [(PXCompleteMyMomentSettings *)self setAllowOneUpGesture:1];
  [(PXCompleteMyMomentSettings *)self setShowFloatingBanner:1];
  [(PXCompleteMyMomentSettings *)self setShowProgressInGrid:0];
  [(PXCompleteMyMomentSettings *)self setAllowSwipeSelection:1];
  [(PXCompleteMyMomentSettings *)self setSimulateImport:0];
  [(PXCompleteMyMomentSettings *)self setSimulateImportFailure:0];
  [(PXCompleteMyMomentSettings *)self setShowProgressBannerView:0];
  [(PXCompleteMyMomentSettings *)self setShowProgressBannerViewPaused:0];
  [(PXCompleteMyMomentSettings *)self setShowAttachedHeaderView:1];
  [(PXCompleteMyMomentSettings *)self setShowSectionHeaders:1];
  [(PXCompleteMyMomentSettings *)self setSectionHeadersShouldFloat:0];
  [(PXCompleteMyMomentSettings *)self setShowStatusFooter:1];
  [(PXCompleteMyMomentSettings *)self setDirectSendMessages:0];
  [(PXCompleteMyMomentSettings *)self setFakeMomentShareURL:0];
  [(PXCompleteMyMomentSettings *)self setAutoAcceptBubbles:0];
  [(PXCompleteMyMomentSettings *)self setSimulateDelays:0];
  [(PXCompleteMyMomentSettings *)self setShowURLInBubble:0];
  [(PXCompleteMyMomentSettings *)self setShowDebugStatus:0];
  [(PXCompleteMyMomentSettings *)self setAlwaysTapToRetry:0];
  [(PXCompleteMyMomentSettings *)self setOverrideNumberOfColumnsInPortrait:0];
  [(PXCompleteMyMomentSettings *)self setOverrideNumberOfColumnsInLandscape:0];
  [(PXCompleteMyMomentSettings *)self setUseDebugColors:0];
  [(PXCompleteMyMomentSettings *)self setSimulateMomentShareBubbleError:0];
  [(PXCompleteMyMomentSettings *)self setSimulatedMomentShareBubbleErrorType:0];
  [(PXCompleteMyMomentSettings *)self setShowMessageTextEntryGadget:0];
  [(PXCompleteMyMomentSettings *)self setSharingLinkType:0];
  [(PXCompleteMyMomentSettings *)self setGraphSuggestionEnabled:1];
  [(PXCompleteMyMomentSettings *)self setPeopleSuggestionsTimeout:1.0];
  [(PXCompleteMyMomentSettings *)self setCmmShareSheetBehavior:1];
  [(PXCompleteMyMomentSettings *)self setDisableShareSheetAutomaticBehaviorIfADPEnabled:0];
  [(PXCompleteMyMomentSettings *)self setShareSheetLinkAssetCountThreshold:12];
  [(PXCompleteMyMomentSettings *)self setShareSheetLinkTotalFileSizeThresholdMB:400];
  [(PXCompleteMyMomentSettings *)self setShareSheetLinkSpatialVideoFileSizeThresholdMB:100];
  [(PXCompleteMyMomentSettings *)self setShareSheetLinkSpatialImageFileSizeThresholdMB:20];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfLivePhotoPlaybackDisabled:1];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfLivePhotoMuted:1];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfAdjustedByThirdParty:1];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfCropped:1];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfTimelineTrimmed:1];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfPortraitDepthEffectEnabled:0];
  [(PXCompleteMyMomentSettings *)self setShouldBakeInIfContainsPenultimateResources:1];
  [(PXCompleteMyMomentSettings *)self setShouldIncludeSpatialOvercaptureResources:0];
  [(PXCompleteMyMomentSettings *)self setSimulateShouldPromptUserToIgnoreBudgets:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCPLAlertOnPublish:0];
  [(PXCompleteMyMomentSettings *)self setEmulatesEmptyMomentShare:0];
  [(PXCompleteMyMomentSettings *)self setDisableDescriptiveWaiting:0];
  [(PXCompleteMyMomentSettings *)self setDisableOneUpDescriptiveAdd:0];
  [(PXCompleteMyMomentSettings *)self setDisableClickyOrb:0];
  [(PXCompleteMyMomentSettings *)self setDisablePrintAction:0];
  [(PXCompleteMyMomentSettings *)self setDisableShareAction:0];
  [(PXCompleteMyMomentSettings *)self setDisableShowInAllPhotosAction:0];
  [(PXCompleteMyMomentSettings *)self setDisableCopyAction:0];
  [(PXCompleteMyMomentSettings *)self setDisableDetailView:0];
  [(PXCompleteMyMomentSettings *)self setSimulateAllMomentSharesAreNew:0];
  [(PXCompleteMyMomentSettings *)self setSimulateFeatureFlagState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCloudState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCloudPhotosState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCPLFeatureState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCPLCMMFeatureState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateSystemPhotoLibraryState:0];
  [(PXCompleteMyMomentSettings *)self setSimulateCloudPhotosExitState:0];
}

- (void)setUseDebugColors:(BOOL)a3
{
  self->_useDebugColors = a3;
}

- (void)setSimulatedMomentShareCreationErrorType:(int64_t)a3
{
  self->_simulatedMomentShareCreationErrorType = a3;
}

- (void)setSimulatedMomentShareBubbleErrorType:(int64_t)a3
{
  self->_simulatedMomentShareBubbleErrorType = a3;
}

- (void)setSimulateSystemPhotoLibraryState:(int64_t)a3
{
  self->_simulateSystemPhotoLibraryState = a3;
}

- (void)setSimulateShouldPromptUserToIgnoreBudgets:(BOOL)a3
{
  self->_simulateShouldPromptUserToIgnoreBudgets = a3;
}

- (void)setSimulateMomentShareCreationError:(BOOL)a3
{
  self->_simulateMomentShareCreationError = a3;
}

- (void)setSimulateMomentShareBubbleError:(BOOL)a3
{
  self->_simulateMomentShareBubbleError = a3;
}

- (void)setSimulateImportFailure:(BOOL)a3
{
  self->_simulateImportFailure = a3;
}

- (void)setSimulateImport:(BOOL)a3
{
  self->_simulateImport = a3;
}

- (void)setSimulateFeatureFlagState:(int64_t)a3
{
  self->_simulateFeatureFlagState = a3;
}

- (void)setSimulateDelays:(BOOL)a3
{
  self->_simulateDelays = a3;
}

- (void)setSimulateCloudState:(int64_t)a3
{
  self->_simulateCloudState = a3;
}

- (void)setSimulateCloudPhotosState:(int64_t)a3
{
  self->_simulateCloudPhotosState = a3;
}

- (void)setSimulateCloudPhotosExitState:(int64_t)a3
{
  self->_simulateCloudPhotosExitState = a3;
}

- (void)setSimulateCPLFeatureState:(int64_t)a3
{
  self->_simulateCPLFeatureState = a3;
}

- (void)setSimulateCPLCMMFeatureState:(int64_t)a3
{
  self->_simulateCPLCMMFeatureState = a3;
}

- (void)setSimulateCPLAlertOnPublish:(BOOL)a3
{
  self->_simulateCPLAlertOnPublish = a3;
}

- (void)setSimulateAllMomentSharesAreNew:(BOOL)a3
{
  self->_simulateAllMomentSharesAreNew = a3;
}

- (void)setShowURLInBubble:(BOOL)a3
{
  self->_showURLInBubble = a3;
}

- (void)setShowTitle:(BOOL)a3
{
  self->_showTitle = a3;
}

- (void)setShowSubtitle:(BOOL)a3
{
  self->_showSubtitle = a3;
}

- (void)setShowStatusFooter:(BOOL)a3
{
  self->_showStatusFooter = a3;
}

- (void)setShowSenderField:(BOOL)a3
{
  self->_showSenderField = a3;
}

- (void)setShowSectionHeaders:(BOOL)a3
{
  self->_showSectionHeaders = a3;
}

- (void)setShowProgressInGrid:(BOOL)a3
{
  self->_showProgressInGrid = a3;
}

- (void)setShowProgressBannerViewPaused:(BOOL)a3
{
  self->_showProgressBannerViewPaused = a3;
}

- (void)setShowProgressBannerView:(BOOL)a3
{
  self->_showProgressBannerView = a3;
}

- (void)setShowPeopleSuggestions:(BOOL)a3
{
  self->_showPeopleSuggestions = a3;
}

- (void)setShowOtherTitle:(BOOL)a3
{
  self->_showOtherTitle = a3;
}

- (void)setShowMessageTextEntryGadget:(BOOL)a3
{
  self->_showMessageTextEntryGadget = a3;
}

- (void)setShowMessage:(BOOL)a3
{
  self->_showMessage = a3;
}

- (void)setShowMergeCandidateSuggestionsAfterBootstrapNaming:(BOOL)a3
{
  self->_showMergeCandidateSuggestionsAfterBootstrapNaming = a3;
}

- (void)setShowFloatingBanner:(BOOL)a3
{
  self->_showFloatingBanner = a3;
}

- (void)setShowDebugStatus:(BOOL)a3
{
  self->_showDebugStatus = a3;
}

- (void)setShowAttachedHeaderView:(BOOL)a3
{
  self->_showAttachedHeaderView = a3;
}

- (void)setShouldShowInlineAddButton:(BOOL)a3
{
  self->_shouldShowInlineAddButton = a3;
}

- (void)setShouldIncludeSpatialOvercaptureResources:(BOOL)a3
{
  self->_shouldIncludeSpatialOvercaptureResources = a3;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (void)setSharingLinkType:(int64_t)a3
{
  self->_sharingLinkType = a3;
}

- (void)setShareSheetLinkTotalFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkTotalFileSizeThresholdMB = a3;
}

- (void)setShareSheetLinkSpatialVideoFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkSpatialVideoFileSizeThresholdMB = a3;
}

- (void)setShareSheetLinkSpatialImageFileSizeThresholdMB:(unint64_t)a3
{
  self->_shareSheetLinkSpatialImageFileSizeThresholdMB = a3;
}

- (void)setShareSheetLinkAssetCountThreshold:(int64_t)a3
{
  self->_shareSheetLinkAssetCountThreshold = a3;
}

- (void)setSectionHeadersShouldFloat:(BOOL)a3
{
  self->_sectionHeadersShouldFloat = a3;
}

- (void)setReviewFlow:(int64_t)a3
{
  self->_reviewFlow = a3;
}

- (void)setPublishTransport:(int64_t)a3
{
  self->_publishTransport = a3;
}

- (void)setPreventNilTitles:(BOOL)a3
{
  self->_preventNilTitles = a3;
}

- (void)setPeopleSuggestionsTimeout:(double)a3
{
  self->_peopleSuggestionsTimeout = a3;
}

- (void)setPeopleSuggestionsDataSourceType:(int64_t)a3
{
  self->_peopleSuggestionsDataSourceType = a3;
}

- (void)setOverrideNumberOfColumnsInPortrait:(int64_t)a3
{
  self->_overrideNumberOfColumnsInPortrait = a3;
}

- (void)setOverrideNumberOfColumnsInLandscape:(int64_t)a3
{
  self->_overrideNumberOfColumnsInLandscape = a3;
}

- (void)setInvitationsDataSourceType:(int64_t)a3
{
  self->_invitationsDataSourceType = a3;
}

- (void)setInitialLayoutType:(int64_t)a3
{
  self->_initialLayoutType = a3;
}

- (void)setGraphSuggestionEnabled:(BOOL)a3
{
  self->_graphSuggestionEnabled = a3;
}

- (void)setFakeMomentShareURL:(BOOL)a3
{
  self->_fakeMomentShareURL = a3;
}

- (void)setEmulatesEmptyMomentShare:(BOOL)a3
{
  self->_emulatesEmptyMomentShare = a3;
}

- (void)setDisableShowInAllPhotosAction:(BOOL)a3
{
  self->_disableShowInAllPhotosAction = a3;
}

- (void)setDisableShareSheetAutomaticBehaviorIfADPEnabled:(BOOL)a3
{
  self->_disableShareSheetAutomaticBehaviorIfADPEnabled = a3;
}

- (void)setDisableShareAction:(BOOL)a3
{
  self->_disableShareAction = a3;
}

- (void)setDisablePrintAction:(BOOL)a3
{
  self->_disablePrintAction = a3;
}

- (void)setDisableOneUpDescriptiveAdd:(BOOL)a3
{
  self->_disableOneUpDescriptiveAdd = a3;
}

- (void)setDisableDetailView:(BOOL)a3
{
  self->_disableDetailView = a3;
}

- (void)setDisableDescriptiveWaiting:(BOOL)a3
{
  self->_disableDescriptiveWaiting = a3;
}

- (void)setDisableCopyAction:(BOOL)a3
{
  self->_disableCopyAction = a3;
}

- (void)setDisableClickyOrb:(BOOL)a3
{
  self->_disableClickyOrb = a3;
}

- (void)setDirectSendMessages:(BOOL)a3
{
  self->_directSendMessages = a3;
}

- (void)setCmmShareSheetBehavior:(int64_t)a3
{
  self->_cmmShareSheetBehavior = a3;
}

- (void)setAutoAcceptBubbles:(BOOL)a3
{
  self->_autoAcceptBubbles = a3;
}

- (void)setAlwaysTapToRetry:(BOOL)a3
{
  self->_alwaysTapToRetry = a3;
}

- (void)setAlwaysSortAfterAddMore:(BOOL)a3
{
  self->_alwaysSortAfterAddMore = a3;
}

- (void)setAllowSwipeSelection:(BOOL)a3
{
  self->_allowSwipeSelection = a3;
}

- (void)setAllowOneUpGesture:(BOOL)a3
{
  self->_allowOneUpGesture = a3;
}

- (void)setAllowLayoutTransitionGesture:(BOOL)a3
{
  self->_allowLayoutTransitionGesture = a3;
}

- (void)workflowCoordinator:(id)a3 workflowViewController:(id)a4 didFinishSession:(id)a5 withActivityState:(unint64_t)a6
{
  id v7 = a4;
  v8 = [(PXCompleteMyMomentSettings *)self workflowCoordinator];
  [v8 setDelegate:0];

  [(PXCompleteMyMomentSettings *)self setWorkflowCoordinator:0];
  id v9 = [v7 presentingViewController];

  [v9 dismissViewControllerAnimated:1 completion:0];
}

- (PXCMMWorkflowCoordinator)workflowCoordinator
{
  objc_getAssociatedObject(self, (const void *)PXCMMWorkflowCoordinatorAssociationKey);
  objc_super v3 = (PXCMMWorkflowCoordinator *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_super v3 = objc_alloc_init(PXCMMWorkflowCoordinator);
    [(PXCMMWorkflowCoordinator *)v3 setDelegate:self];
    objc_setAssociatedObject(self, (const void *)PXCMMWorkflowCoordinatorAssociationKey, v3, (void *)1);
  }
  return v3;
}

- (void)setWorkflowCoordinator:(id)a3
{
}

+ (id)_enabledAllCmmImprovementsActionPredicate
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"disableDescriptiveWaiting == YES || disableOneUpDescriptiveAdd == YES || disableClickyOrb == YES || disablePrintAction == YES || disableShareAction == YES || disableShowInAllPhotosAction == YES || disableCopyAction == YES || disableDetailView == YES"];
}

+ (id)_enableAllCmmImprovementsAction
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PXCompleteMyMomentSettings_UI___enableAllCmmImprovementsAction__block_invoke;
  v4[3] = &__block_descriptor_48_e33_B24__0_8__PTUIModuleController_16l;
  v4[4] = a2;
  v4[5] = a1;
  v2 = [MEMORY[0x1E4F94190] actionWithHandler:v4];
  return v2;
}

uint64_t __65__PXCompleteMyMomentSettings_UI___enableAllCmmImprovementsAction__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 settings];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v6 handleFailureInMethod:v7, v8, @"PXCompleteMyMomentSettings+UI.m", 273, @"%@ should be an instance inheriting from %@, but it is nil", @"moduleController.settings", v10 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v13);
    v14 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
    [v6 handleFailureInMethod:v11, v12, @"PXCompleteMyMomentSettings+UI.m", 273, @"%@ should be an instance inheriting from %@, but it is %@", @"moduleController.settings", v10, v14 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  [v4 setDisableDescriptiveWaiting:0];
  [v4 setDisableOneUpDescriptiveAdd:0];
  [v4 setDisableClickyOrb:0];
  [v4 setDisablePrintAction:0];
  [v4 setDisableShareAction:0];
  [v4 setDisableShowInAllPhotosAction:0];
  [v4 setDisableCopyAction:0];
  [v4 setDisableDetailView:0];

  return 1;
}

+ (id)transientProperties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PXCompleteMyMomentSettings_UI__transientProperties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transientProperties_onceToken_121036 != -1) {
    dispatch_once(&transientProperties_onceToken_121036, block);
  }
  v2 = (void *)transientProperties_transientProperties_121037;
  return v2;
}

void __53__PXCompleteMyMomentSettings_UI__transientProperties__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___PXCompleteMyMomentSettings;
  v1 = objc_msgSendSuper2(&v5, sel_transientProperties);
  v2 = NSStringFromSelector(sel_workflowCoordinator);
  uint64_t v3 = [v1 setByAddingObject:v2];
  v4 = (void *)transientProperties_transientProperties_121037;
  transientProperties_transientProperties_121037 = v3;
}

+ (id)settingsControllerModule
{
  v213[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  uint64_t v3 = [MEMORY[0x1E4F94108] rowWithTitle:@"Share Sheet Behavior" valueKeyPath:@"cmmShareSheetBehavior"];
  v4 = [v3 possibleValues:&unk_1F02D4480 titles:&unk_1F02D4498];
  v213[0] = v4;
  objc_super v5 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Asset Count Threshold" valueKeyPath:@"shareSheetLinkAssetCountThreshold"];
  v6 = [v5 minValue:0.0 maxValue:20.0];
  uint64_t v7 = objc_msgSend(v6, "px_increment:", 1.0);
  v213[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Asset Total Size Threshold (MB)" valueKeyPath:@"shareSheetLinkTotalFileSizeThresholdMB"];
  id v9 = [v8 minValue:0.0 maxValue:500.0];
  v10 = objc_msgSend(v9, "px_increment:", 10.0);
  v213[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v213 count:3];
  v199 = [v2 sectionWithRows:v11 title:@"Share Sheet"];

  uint64_t v12 = (void *)MEMORY[0x1E4F94160];
  v13 = [MEMORY[0x1E4F94108] rowWithTitle:@"Sharing Link Type" valueKeyPath:@"sharingLinkType"];
  v14 = [v13 possibleValues:&unk_1F02D44B0 titles:&unk_1F02D44C8];
  v212[0] = v14;
  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Graph Suggestions" valueKeyPath:@"graphSuggestionEnabled"];
  v212[1] = v15;
  v16 = (void *)MEMORY[0x1E4F941D8];
  v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"graphSuggestionEnabled == YES"];
  v18 = objc_msgSend(v16, "px_rowWithTitle:valueKeyPath:condition:", @"People Graph Timeout", @"peopleSuggestionsTimeout", v17);
  v19 = [v18 minValue:0.0 maxValue:10.0];
  v20 = objc_msgSend(v19, "px_increment:", 1.0);
  v212[2] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:3];
  v198 = [v12 sectionWithRows:v21 title:@"Compose Recipient Settings"];

  v175 = (void *)MEMORY[0x1E4F94160];
  v193 = [MEMORY[0x1E4F94108] rowWithTitle:@"Publish Transport" valueKeyPath:@"publishTransport"];
  v190 = [v193 possibleValues:&unk_1F02D44E0 titles:&unk_1F02D44F8];
  v211[0] = v190;
  v187 = [MEMORY[0x1E4F94108] rowWithTitle:@"People Suggestions DS" valueKeyPath:@"peopleSuggestionsDataSourceType"];
  v184 = [v187 possibleValues:&unk_1F02D4510 titles:&unk_1F02D4528];
  v211[1] = v184;
  v181 = [MEMORY[0x1E4F94108] rowWithTitle:@"Initial grid layout" valueKeyPath:@"initialLayoutType"];
  v178 = [v181 possibleValues:&unk_1F02D4540 titles:&unk_1F02D4558];
  v211[2] = v178;
  v172 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow one up" valueKeyPath:@"allowOneUpGesture"];
  v211[3] = v172;
  v168 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Allow Swipe Selection" valueKeyPath:@"allowSwipeSelection"];
  v211[4] = v168;
  v165 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Descriptive Add" valueKeyPath:@"disableOneUpDescriptiveAdd"];
  v211[5] = v165;
  v162 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Descriptive Waiting" valueKeyPath:@"disableDescriptiveWaiting"];
  v211[6] = v162;
  v158 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Clicky Orb" valueKeyPath:@"disableClickyOrb"];
  v211[7] = v158;
  v153 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Share Action" valueKeyPath:@"disableShareAction"];
  v211[8] = v153;
  v22 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Print Action" valueKeyPath:@"disablePrintAction"];
  v211[9] = v22;
  v23 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Show in All Photos" valueKeyPath:@"disableShowInAllPhotosAction"];
  v211[10] = v23;
  v24 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Copy Action" valueKeyPath:@"disableCopyAction"];
  v211[11] = v24;
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Disable Detail View" valueKeyPath:@"disableDetailView"];
  v211[12] = v25;
  v26 = (void *)MEMORY[0x1E4F940F8];
  v27 = [a1 _enableAllCmmImprovementsAction];
  v28 = [v26 rowWithTitle:@"Enable Azul CMM Additions" action:v27];
  v29 = [a1 _enabledAllCmmImprovementsActionPredicate];
  v30 = [v28 condition:v29];
  v211[13] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:14];
  v197 = [v175 sectionWithRows:v31 title:@"Review Settings"];

  v194 = (void *)MEMORY[0x1E4F94160];
  v32 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Empty Moment Share" valueKeyPath:@"emulatesEmptyMomentShare"];
  v210[0] = v32;
  v33 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Budget Prompt During Publish" valueKeyPath:@"simulateShouldPromptUserToIgnoreBudgets"];
  v210[1] = v33;
  v34 = [MEMORY[0x1E4F941F0] rowWithTitle:@"CPL Alert During Publish" valueKeyPath:@"simulateCPLAlertOnPublish"];
  v210[2] = v34;
  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Asset Import" valueKeyPath:@"simulateImport"];
  v210[3] = v35;
  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Import Failure" valueKeyPath:@"simulateImportFailure"];
  v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"simulateImport == YES"];
  v38 = [v36 condition:v37];
  v210[4] = v38;
  v39 = (void *)MEMORY[0x1E4F941F0];
  v40 = NSStringFromSelector(sel_simulateAllMomentSharesAreNew);
  v41 = [v39 rowWithTitle:@"All Moment Shares Are New" valueKeyPath:v40];
  v210[5] = v41;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:6];
  v195 = [v194 sectionWithRows:v42 title:@"Simulation"];

  v191 = (void *)MEMORY[0x1E4F94160];
  v188 = [MEMORY[0x1E4F94108] rowWithTitle:@"Review Flow" valueKeyPath:@"reviewFlow"];
  v185 = [v188 possibleValues:&unk_1F02D4570 titles:&unk_1F02D4588];
  v209[0] = v185;
  v182 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Layout transition gesture" valueKeyPath:@"allowLayoutTransitionGesture"];
  v209[1] = v182;
  v179 = [MEMORY[0x1E4F94108] rowWithTitle:@"Assets Data Source" valueKeyPath:@"reviewFlowDataSourceType"];
  v176 = [v179 possibleValues:&unk_1F02D45A0 titles:&unk_1F02D45B8];
  v209[2] = v176;
  v173 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Inline Header View" valueKeyPath:@"showAttachedHeaderView"];
  v209[3] = v173;
  v169 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Floating Banner" valueKeyPath:@"showFloatingBanner"];
  v209[4] = v169;
  v43 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Section Headers" valueKeyPath:@"showSectionHeaders"];
  v209[5] = v43;
  v44 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Section Headers Float" valueKeyPath:@"sectionHeadersShouldFloat"];
  v209[6] = v44;
  v45 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Progress in Grid" valueKeyPath:@"showProgressInGrid"];
  v209[7] = v45;
  v46 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Inline add button" valueKeyPath:@"shouldShowInlineAddButton"];
  v209[8] = v46;
  v47 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Sort All after AddMore" valueKeyPath:@"alwaysSortAfterAddMore"];
  v209[9] = v47;
  v48 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Progress Banner View" valueKeyPath:@"showProgressBannerView"];
  v209[10] = v48;
  v49 = (void *)MEMORY[0x1E4F941F0];
  v50 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"showProgressBannerView == YES"];
  v51 = objc_msgSend(v49, "px_rowWithTitle:valueKeyPath:condition:", @"Show Progress Banner View Paused", @"showProgressBannerViewPaused", v50);
  v209[11] = v51;
  v52 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Test Review Flow", &__block_literal_global_121123);
  v209[12] = v52;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v209 count:13];
  v192 = [v191 sectionWithRows:v53 title:@"Review UI Debug"];

  v54 = (void *)MEMORY[0x1E4F94160];
  v55 = [MEMORY[0x1E4F94108] rowWithTitle:@"Datasource" valueKeyPath:@"invitationsDataSourceType"];
  v56 = [v55 possibleValues:&unk_1F02D45D0 titles:&unk_1F02D45E8];
  v208[0] = v56;
  v57 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Prevent Nil Titles" valueKeyPath:@"preventNilTitles"];
  v208[1] = v57;
  v58 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Simulate Going-To-Expire CMM Notification", &__block_literal_global_599);
  v208[2] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:3];
  v189 = [v54 sectionWithRows:v59 title:@"Invitations"];

  v60 = (void *)MEMORY[0x1E4F94160];
  v61 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Test Incoming Controller", &__block_literal_global_622);
  v207 = v61;
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v207 count:1];
  v180 = [v60 sectionWithRows:v62 title:@"Incoming"];

  v186 = PXCMMSettingsSimulateFetchErrorTypes();
  v183 = PXCMMSettingsSimulateFetchErrorTypeTitles();
  uint64_t v63 = PXCMMSettingsSimulateErrorTypes();
  uint64_t v64 = PXCMMSettingsSimulateErrorTypeTitles();
  v170 = (void *)MEMORY[0x1E4F94160];
  v65 = (void *)MEMORY[0x1E4F94108];
  v166 = NSStringFromSelector(sel_simulateFetchErrorType);
  v163 = [v65 rowWithTitle:@"Fetch Error" valueKeyPath:v166];
  v159 = [v163 possibleValues:v186 titles:v183];
  v206[0] = v159;
  v66 = (void *)MEMORY[0x1E4F941F0];
  v154 = NSStringFromSelector(sel_simulateMomentShareCreationError);
  v149 = [v66 rowWithTitle:@"Create Error" valueKeyPath:v154];
  v206[1] = v149;
  v67 = (void *)MEMORY[0x1E4F94108];
  v145 = NSStringFromSelector(sel_simulatedMomentShareCreationErrorType);
  v142 = [v67 rowWithTitle:@"Create Error Type" valueKeyPath:v145];
  v174 = (void *)v64;
  v177 = (void *)v63;
  v139 = [v142 possibleValues:v63 titles:v64];
  v68 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"simulateMomentShareCreationError != 0"];
  v69 = [v139 condition:v68];
  v206[2] = v69;
  v70 = (void *)MEMORY[0x1E4F941F0];
  v71 = NSStringFromSelector(sel_simulateMomentShareBubbleError);
  v72 = [v70 rowWithTitle:@"Message Bubble Error" valueKeyPath:v71];
  v206[3] = v72;
  v73 = (void *)MEMORY[0x1E4F94108];
  v74 = NSStringFromSelector(sel_simulatedMomentShareBubbleErrorType);
  v75 = [v73 rowWithTitle:@"Message Bubble Error Type" valueKeyPath:v74];
  v76 = [v75 possibleValues:v63 titles:v64];
  v77 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"simulateMomentShareBubbleError != 0"];
  v78 = [v76 condition:v77];
  v206[4] = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:5];
  v171 = [v170 sectionWithRows:v79 title:@"Error Simulation"];

  uint64_t v80 = PXCMMSimulateCapabilitySourceStates();
  uint64_t v81 = PXCMMSimulateCapabilitySourceStateTitles();
  v160 = (void *)MEMORY[0x1E4F94160];
  v82 = (void *)MEMORY[0x1E4F94108];
  v155 = NSStringFromSelector(sel_simulateFeatureFlagState);
  v150 = [v82 rowWithTitle:@"Feature Flag State" valueKeyPath:v155];
  v146 = [v150 possibleValues:v80 titles:v81];
  v205[0] = v146;
  v83 = (void *)MEMORY[0x1E4F94108];
  v143 = NSStringFromSelector(sel_simulateCloudState);
  v140 = [v83 rowWithTitle:@"Cloud State" valueKeyPath:v143];
  v137 = [v140 possibleValues:v80 titles:v81];
  v205[1] = v137;
  v84 = (void *)MEMORY[0x1E4F94108];
  v136 = NSStringFromSelector(sel_simulateCloudPhotosState);
  v135 = [v84 rowWithTitle:@"Cloud Photos State" valueKeyPath:v136];
  v134 = [v135 possibleValues:v80 titles:v81];
  v205[2] = v134;
  v85 = (void *)MEMORY[0x1E4F94108];
  v133 = NSStringFromSelector(sel_simulateCPLFeatureState);
  v132 = [v85 rowWithTitle:@"CPL Feature State" valueKeyPath:v133];
  v131 = [v132 possibleValues:v80 titles:v81];
  v205[3] = v131;
  v86 = (void *)MEMORY[0x1E4F94108];
  v130 = NSStringFromSelector(sel_simulateCPLCMMFeatureState);
  v87 = [v86 rowWithTitle:@"CPL CMM Feature State" valueKeyPath:v130];
  v88 = [v87 possibleValues:v80 titles:v81];
  v205[4] = v88;
  v89 = (void *)MEMORY[0x1E4F94108];
  v90 = NSStringFromSelector(sel_simulateSystemPhotoLibraryState);
  v91 = [v89 rowWithTitle:@"System Photo Library State" valueKeyPath:v90];
  uint64_t v92 = v80;
  v164 = (void *)v81;
  v167 = (void *)v80;
  v93 = [v91 possibleValues:v80 titles:v81];
  v205[5] = v93;
  v94 = (void *)MEMORY[0x1E4F94108];
  v95 = NSStringFromSelector(sel_simulateCloudPhotosExitState);
  v96 = [v94 rowWithTitle:@"CPL Exit State" valueKeyPath:v95];
  v97 = [v96 possibleValues:v92 titles:v81];
  v205[6] = v97;
  v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:7];
  v161 = [v160 sectionWithRows:v98 title:@"Capabilities Simulation"];

  v156 = (void *)MEMORY[0x1E4F94160];
  v151 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Direct Send" valueKeyPath:@"directSendMessages"];
  v204[0] = v151;
  v147 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fake PHMomentShare URL" valueKeyPath:@"fakeMomentShareURL"];
  v204[1] = v147;
  v144 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Auto Accept Bubbles" valueKeyPath:@"autoAcceptBubbles"];
  v204[2] = v144;
  v141 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Simulate Delays" valueKeyPath:@"simulateDelays"];
  v204[3] = v141;
  v138 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show URL In Bubble" valueKeyPath:@"showURLInBubble"];
  v204[4] = v138;
  v99 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Debug Status" valueKeyPath:@"showDebugStatus"];
  v204[5] = v99;
  v100 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Tap to Retry" valueKeyPath:@"alwaysTapToRetry"];
  v204[6] = v100;
  v101 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Columns in Portrait (Override)" valueKeyPath:@"overrideNumberOfColumnsInPortrait"];
  v102 = [v101 minValue:0.0 maxValue:8.0];
  v103 = objc_msgSend(v102, "px_increment:", 1.0);
  v204[7] = v103;
  v104 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Columns in Landscape (Override)" valueKeyPath:@"overrideNumberOfColumnsInLandscape"];
  v105 = [v104 minValue:0.0 maxValue:8.0];
  v106 = objc_msgSend(v105, "px_increment:", 1.0);
  v204[8] = v106;
  v107 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Debug Colors" valueKeyPath:@"useDebugColors"];
  v204[9] = v107;
  v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:10];
  v157 = [v156 sectionWithRows:v108 title:@"Messages Extension"];

  v109 = (void *)MEMORY[0x1E4F94160];
  v110 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Message Text Entry" valueKeyPath:@"showMessageTextEntryGadget"];
  v203 = v110;
  v111 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v203 count:1];
  v152 = [v109 sectionWithRows:v111 title:@"Messages Debug Sections"];

  v112 = (void *)MEMORY[0x1E4F94160];
  v113 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Live Photo Disabled" valueKeyPath:@"shouldBakeInIfLivePhotoPlaybackDisabled"];
  v202[0] = v113;
  v114 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Live Photo Muted" valueKeyPath:@"shouldBakeInIfLivePhotoMuted"];
  v202[1] = v114;
  v115 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Has 3rd Party Adjustments" valueKeyPath:@"shouldBakeInIfAdjustedByThirdParty"];
  v202[2] = v115;
  v116 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Cropped" valueKeyPath:@"shouldBakeInIfCropped"];
  v202[3] = v116;
  v117 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Timeline Trimmed" valueKeyPath:@"shouldBakeInIfTimelineTrimmed"];
  v202[4] = v117;
  v118 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Portrait Effect Applied" valueKeyPath:@"shouldBakeInIfPortraitDepthEffectEnabled"];
  v202[5] = v118;
  v119 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Has Penultimate Resources" valueKeyPath:@"shouldBakeInIfContainsPenultimateResources"];
  v202[6] = v119;
  v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:7];
  v148 = [v112 sectionWithRows:v120 title:@"Automatically Bake In Adjustments If:"];

  v121 = (void *)MEMORY[0x1E4F94160];
  v122 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Include Spatial Overcapture Resources" valueKeyPath:@"shouldIncludeSpatialOvercaptureResources"];
  v201 = v122;
  v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
  v124 = [v121 sectionWithRows:v123 title:@"Asset Creation Options"];

  v125 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v200[0] = v199;
  v200[1] = v197;
  v200[2] = v195;
  v200[3] = v198;
  v200[4] = v192;
  v200[5] = v189;
  v200[6] = v171;
  v200[7] = v161;
  v200[8] = v180;
  v200[9] = v157;
  v200[10] = v152;
  v200[11] = v148;
  v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v200 count:12];
  v127 = (void *)[v126 mutableCopy];

  [v127 addObject:v124];
  [v127 addObject:v125];
  v128 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Complete My Moment" contents:v127];

  return v128;
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_2_620(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [PXCMMSharedAlbumsInvitationsDataSourceManager alloc];
  v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v6 = [(PXCMMSharedAlbumsInvitationsDataSourceManager *)v3 initWithPhotoLibrary:v4];

  objc_super v5 = [[PXDebugCMMIncomingTableViewController alloc] initWithDataSourceManager:v6];
  objc_msgSend(v2, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v5, 1, 0, 0);
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [MEMORY[0x1E4F391B0] invitedMomentSharesExpiringInDays:50];
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__121316;
    v19 = __Block_byref_object_dispose__121317;
    id v20 = 0;
    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v4];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_602;
    v12[3] = &unk_1E5DBC340;
    id v7 = v6;
    id v13 = v7;
    v14 = &v15;
    [v3 enumerateObjectsUsingBlock:v12];
    if (v5 < 2)
    {
      uint64_t v8 = @"You have an invitation that is about to expire.";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"You have %lu invitations that are about to expire.", v5);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    id v9 = [MEMORY[0x1E4F39228] sharedMomentSharePhotoLibrary];
    v10 = [v9 assetsdClient];
    uint64_t v11 = [v10 notificationClient];

    [v11 asyncNotifyExpiringMomentShareWithUUIDs:v7 thumbnailImageData:v16[5] notificationTitle:@"Complete My Moment" notificationSubtitle:v8];
    _Block_object_dispose(&v15, 8);
  }
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke_602(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = v3;
  unint64_t v5 = [v3 uuid];
  [v4 addObject:v5];

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v6 = [v11 preview];
    id v7 = [v6 previewImageData];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

void __58__PXCompleteMyMomentSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F39228];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v2, "px_deprecated_appPhotoLibrary");
  id v11 = 0;
  unint64_t v5 = PXCMMCreateDebugCMMContext(v4, &v11);
  id v6 = v11;

  if (v5)
  {
    id v7 = +[PXCompleteMyMomentSettings sharedInstance];
    uint64_t v8 = [v7 workflowCoordinator];

    uint64_t v9 = [v8 workflowViewControllerWithContext:v5 embedInNavigationControllerOfClass:objc_opt_class()];
  }
  else
  {
    uint64_t v8 = [v6 debugDescription];
    uint64_t v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"No context was created" message:v8 preferredStyle:1];
    v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
    [v9 addAction:v10];
  }
  [v3 presentViewController:v9 animated:1 completion:0];
}

- (int64_t)simulateCloudPhotosExitState
{
  return self->_simulateCloudPhotosExitState;
}

- (int64_t)simulateSystemPhotoLibraryState
{
  return self->_simulateSystemPhotoLibraryState;
}

- (int64_t)simulateCPLCMMFeatureState
{
  return self->_simulateCPLCMMFeatureState;
}

- (int64_t)simulateCPLFeatureState
{
  return self->_simulateCPLFeatureState;
}

- (int64_t)simulateCloudPhotosState
{
  return self->_simulateCloudPhotosState;
}

- (int64_t)simulateCloudState
{
  return self->_simulateCloudState;
}

- (int64_t)simulateFeatureFlagState
{
  return self->_simulateFeatureFlagState;
}

- (void)setSimulateFetchErrorType:(int64_t)a3
{
  self->_simulateFetchErrorType = a3;
}

- (int64_t)simulateFetchErrorType
{
  return self->_simulateFetchErrorType;
}

- (BOOL)shouldIncludeSpatialOvercaptureResources
{
  return self->_shouldIncludeSpatialOvercaptureResources;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

- (double)peopleSuggestionsTimeout
{
  return self->_peopleSuggestionsTimeout;
}

- (BOOL)graphSuggestionEnabled
{
  return self->_graphSuggestionEnabled;
}

- (int64_t)sharingLinkType
{
  return self->_sharingLinkType;
}

- (BOOL)showMessageTextEntryGadget
{
  return self->_showMessageTextEntryGadget;
}

- (int64_t)simulatedMomentShareBubbleErrorType
{
  return self->_simulatedMomentShareBubbleErrorType;
}

- (BOOL)simulateMomentShareBubbleError
{
  return self->_simulateMomentShareBubbleError;
}

- (BOOL)useDebugColors
{
  return self->_useDebugColors;
}

- (int64_t)overrideNumberOfColumnsInLandscape
{
  return self->_overrideNumberOfColumnsInLandscape;
}

- (int64_t)overrideNumberOfColumnsInPortrait
{
  return self->_overrideNumberOfColumnsInPortrait;
}

- (BOOL)alwaysTapToRetry
{
  return self->_alwaysTapToRetry;
}

- (BOOL)showDebugStatus
{
  return self->_showDebugStatus;
}

- (BOOL)showURLInBubble
{
  return self->_showURLInBubble;
}

- (BOOL)simulateDelays
{
  return self->_simulateDelays;
}

- (BOOL)autoAcceptBubbles
{
  return self->_autoAcceptBubbles;
}

- (BOOL)fakeMomentShareURL
{
  return self->_fakeMomentShareURL;
}

- (BOOL)directSendMessages
{
  return self->_directSendMessages;
}

- (BOOL)showProgressBannerViewPaused
{
  return self->_showProgressBannerViewPaused;
}

- (BOOL)showProgressBannerView
{
  return self->_showProgressBannerView;
}

- (BOOL)showProgressInGrid
{
  return self->_showProgressInGrid;
}

- (BOOL)showStatusFooter
{
  return self->_showStatusFooter;
}

- (BOOL)sectionHeadersShouldFloat
{
  return self->_sectionHeadersShouldFloat;
}

- (BOOL)showSectionHeaders
{
  return self->_showSectionHeaders;
}

- (BOOL)showFloatingBanner
{
  return self->_showFloatingBanner;
}

- (BOOL)showAttachedHeaderView
{
  return self->_showAttachedHeaderView;
}

- (BOOL)shouldShowInlineAddButton
{
  return self->_shouldShowInlineAddButton;
}

- (BOOL)allowLayoutTransitionGesture
{
  return self->_allowLayoutTransitionGesture;
}

- (void)setReviewFlowDataSourceType:(int64_t)a3
{
  self->_reviewFlowDataSourceType = a3;
}

- (int64_t)reviewFlowDataSourceType
{
  return self->_reviewFlowDataSourceType;
}

- (int64_t)reviewFlow
{
  return self->_reviewFlow;
}

- (BOOL)simulateAllMomentSharesAreNew
{
  return self->_simulateAllMomentSharesAreNew;
}

- (BOOL)disableDetailView
{
  return self->_disableDetailView;
}

- (BOOL)disableCopyAction
{
  return self->_disableCopyAction;
}

- (BOOL)disableShowInAllPhotosAction
{
  return self->_disableShowInAllPhotosAction;
}

- (BOOL)disableShareAction
{
  return self->_disableShareAction;
}

- (BOOL)disablePrintAction
{
  return self->_disablePrintAction;
}

- (BOOL)disableClickyOrb
{
  return self->_disableClickyOrb;
}

- (BOOL)disableDescriptiveWaiting
{
  return self->_disableDescriptiveWaiting;
}

- (BOOL)disableOneUpDescriptiveAdd
{
  return self->_disableOneUpDescriptiveAdd;
}

- (BOOL)emulatesEmptyMomentShare
{
  return self->_emulatesEmptyMomentShare;
}

- (BOOL)simulateCPLAlertOnPublish
{
  return self->_simulateCPLAlertOnPublish;
}

- (BOOL)simulateShouldPromptUserToIgnoreBudgets
{
  return self->_simulateShouldPromptUserToIgnoreBudgets;
}

- (BOOL)simulateImportFailure
{
  return self->_simulateImportFailure;
}

- (BOOL)simulateImport
{
  return self->_simulateImport;
}

- (BOOL)allowSwipeSelection
{
  return self->_allowSwipeSelection;
}

- (BOOL)allowOneUpGesture
{
  return self->_allowOneUpGesture;
}

- (int64_t)initialLayoutType
{
  return self->_initialLayoutType;
}

- (int64_t)peopleSuggestionsDataSourceType
{
  return self->_peopleSuggestionsDataSourceType;
}

- (int64_t)publishTransport
{
  return self->_publishTransport;
}

- (BOOL)showMergeCandidateSuggestionsAfterBootstrapNaming
{
  return self->_showMergeCandidateSuggestionsAfterBootstrapNaming;
}

- (BOOL)showPeopleSuggestions
{
  return self->_showPeopleSuggestions;
}

- (BOOL)showSenderField
{
  return self->_showSenderField;
}

- (BOOL)showMessage
{
  return self->_showMessage;
}

- (BOOL)showOtherTitle
{
  return self->_showOtherTitle;
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (BOOL)showTitle
{
  return self->_showTitle;
}

- (int64_t)simulatedMomentShareCreationErrorType
{
  return self->_simulatedMomentShareCreationErrorType;
}

- (BOOL)simulateMomentShareCreationError
{
  return self->_simulateMomentShareCreationError;
}

- (BOOL)preventNilTitles
{
  return self->_preventNilTitles;
}

- (int64_t)invitationsDataSourceType
{
  return self->_invitationsDataSourceType;
}

- (BOOL)alwaysSortAfterAddMore
{
  return self->_alwaysSortAfterAddMore;
}

- (unint64_t)shareSheetLinkSpatialImageFileSizeThresholdMB
{
  return self->_shareSheetLinkSpatialImageFileSizeThresholdMB;
}

- (unint64_t)shareSheetLinkSpatialVideoFileSizeThresholdMB
{
  return self->_shareSheetLinkSpatialVideoFileSizeThresholdMB;
}

- (unint64_t)shareSheetLinkTotalFileSizeThresholdMB
{
  return self->_shareSheetLinkTotalFileSizeThresholdMB;
}

- (int64_t)shareSheetLinkAssetCountThreshold
{
  return self->_shareSheetLinkAssetCountThreshold;
}

- (BOOL)disableShareSheetAutomaticBehaviorIfADPEnabled
{
  return self->_disableShareSheetAutomaticBehaviorIfADPEnabled;
}

- (int64_t)cmmShareSheetBehavior
{
  return self->_cmmShareSheetBehavior;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXCompleteMyMomentSettings)sharedInstance
{
  if (sharedInstance_onceToken_144906 != -1) {
    dispatch_once(&sharedInstance_onceToken_144906, &__block_literal_global_144907);
  }
  id v2 = (void *)sharedInstance_sharedInstance_144908;
  return (PXCompleteMyMomentSettings *)v2;
}

void __44__PXCompleteMyMomentSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 completeMyMoment];
  v1 = (void *)sharedInstance_sharedInstance_144908;
  sharedInstance_sharedInstance_144908 = v0;
}

@end