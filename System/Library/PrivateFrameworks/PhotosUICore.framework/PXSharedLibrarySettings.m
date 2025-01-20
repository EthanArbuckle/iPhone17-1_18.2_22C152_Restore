@interface PXSharedLibrarySettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)alwaysConfirmMoveToPersonalLibrary;
- (BOOL)alwaysConfirmMoveToSharedLibrary;
- (BOOL)alwaysConfirmRemoveSharedLibrarySuggestion;
- (BOOL)confirmMoveToPersonalLibraryFromSharedLibraryPreview;
- (BOOL)enableAutoShareWithParticipants;
- (BOOL)enableIncompleteUIElements;
- (BOOL)enableOneUpBadge;
- (BOOL)forceLegacyDevicesFallback;
- (BOOL)includeNonLegacyDevicesInFallback;
- (BOOL)mockPersonSuggestionForSetupAssistant;
- (BOOL)showDebugAlbums;
- (BOOL)showMoveToLibraryActionsInShareSheet;
- (BOOL)showPersonalLibraryContentOnly;
- (BOOL)showPreviewAssetsOnlyFilter;
- (BOOL)showPreviewCancelButton;
- (BOOL)showSampleGadgets;
- (BOOL)simulateLegacyDevicesRemoteFailure;
- (BOOL)simulateSlowLegacyDevicesFetchInFallback;
- (double)sharingSuggestionsLegibilityStrength;
- (double)sharingSuggestionsMinimumTimeSinceLastAsset;
- (double)sharingSuggestionsMinimumTimeSinceLastBannerDismiss;
- (id)parentSettings;
- (int64_t)exitingDataSourceType;
- (int64_t)invitationsDataSourceType;
- (int64_t)previewDataSourceType;
- (int64_t)sharedLibraryDataSourceType;
- (int64_t)sharingSuggestionsBannerFirstCheckThreshold;
- (int64_t)sharingSuggestionsBannerUnreadCountThreshold;
- (int64_t)simulateErrorType;
- (int64_t)sourceLibraryInfoType;
- (void)setAlwaysConfirmMoveToPersonalLibrary:(BOOL)a3;
- (void)setAlwaysConfirmMoveToSharedLibrary:(BOOL)a3;
- (void)setAlwaysConfirmRemoveSharedLibrarySuggestion:(BOOL)a3;
- (void)setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:(BOOL)a3;
- (void)setDefaultValues;
- (void)setEnableAutoShareWithParticipants:(BOOL)a3;
- (void)setEnableIncompleteUIElements:(BOOL)a3;
- (void)setEnableOneUpBadge:(BOOL)a3;
- (void)setExitingDataSourceType:(int64_t)a3;
- (void)setForceLegacyDevicesFallback:(BOOL)a3;
- (void)setIncludeNonLegacyDevicesInFallback:(BOOL)a3;
- (void)setInvitationsDataSourceType:(int64_t)a3;
- (void)setMockPersonSuggestionForSetupAssistant:(BOOL)a3;
- (void)setPreviewDataSourceType:(int64_t)a3;
- (void)setSharedLibraryDataSourceType:(int64_t)a3;
- (void)setSharingSuggestionsBannerFirstCheckThreshold:(int64_t)a3;
- (void)setSharingSuggestionsBannerUnreadCountThreshold:(int64_t)a3;
- (void)setSharingSuggestionsLegibilityStrength:(double)a3;
- (void)setSharingSuggestionsMinimumTimeSinceLastAsset:(double)a3;
- (void)setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:(double)a3;
- (void)setShowDebugAlbums:(BOOL)a3;
- (void)setShowMoveToLibraryActionsInShareSheet:(BOOL)a3;
- (void)setShowPersonalLibraryContentOnly:(BOOL)a3;
- (void)setShowPreviewAssetsOnlyFilter:(BOOL)a3;
- (void)setShowPreviewCancelButton:(BOOL)a3;
- (void)setShowSampleGadgets:(BOOL)a3;
- (void)setSimulateErrorType:(int64_t)a3;
- (void)setSimulateLegacyDevicesRemoteFailure:(BOOL)a3;
- (void)setSimulateSlowLegacyDevicesFetchInFallback:(BOOL)a3;
- (void)setSourceLibraryInfoType:(int64_t)a3;
@end

@implementation PXSharedLibrarySettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_92090 != -1) {
    dispatch_once(&sharedInstance_onceToken_92090, &__block_literal_global_92091);
  }
  v2 = (void *)sharedInstance_sharedInstance_92092;
  return v2;
}

- (int64_t)sharingSuggestionsBannerFirstCheckThreshold
{
  return self->_sharingSuggestionsBannerFirstCheckThreshold;
}

- (void)setDefaultValues
{
  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibrarySettings;
  [(PTSettings *)&v19 setDefaultValues];
  [(PXSharedLibrarySettings *)self setShowPreviewCancelButton:0];
  [(PXSharedLibrarySettings *)self setShowMoveToLibraryActionsInShareSheet:0];
  [(PXSharedLibrarySettings *)self setShowPersonalLibraryContentOnly:1];
  [(PXSharedLibrarySettings *)self setAlwaysConfirmMoveToSharedLibrary:0];
  [(PXSharedLibrarySettings *)self setAlwaysConfirmMoveToPersonalLibrary:0];
  [(PXSharedLibrarySettings *)self setAlwaysConfirmRemoveSharedLibrarySuggestion:0];
  [(PXSharedLibrarySettings *)self setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:0];
  [(PXSharedLibrarySettings *)self setEnableIncompleteUIElements:0];
  [(PXSharedLibrarySettings *)self setEnableAutoShareWithParticipants:0];
  [(PXSharedLibrarySettings *)self setEnableOneUpBadge:1];
  [(PXSharedLibrarySettings *)self setMockPersonSuggestionForSetupAssistant:0];
  [(PXSharedLibrarySettings *)self setInvitationsDataSourceType:0];
  [(PXSharedLibrarySettings *)self setPreviewDataSourceType:0];
  [(PXSharedLibrarySettings *)self setSharedLibraryDataSourceType:0];
  [(PXSharedLibrarySettings *)self setExitingDataSourceType:0];
  [(PXSharedLibrarySettings *)self setSourceLibraryInfoType:0];
  [(PXSharedLibrarySettings *)self setSimulateErrorType:0];
  [(PXSharedLibrarySettings *)self setShowSampleGadgets:0];
  [(PXSharedLibrarySettings *)self setShowDebugAlbums:0];
  v3 = PXSharedUserDefaults();
  v4 = [v3 objectForKey:@"PXSharedLibrarySharingSuggestionsBannerFirstCheckThreshold"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v4 integerValue] < 0) {
    uint64_t v5 = 7;
  }
  else {
    uint64_t v5 = [v4 integerValue];
  }
  [(PXSharedLibrarySettings *)self setSharingSuggestionsBannerFirstCheckThreshold:v5];
  v6 = PXSharedUserDefaults();
  v7 = [v6 objectForKey:@"PXSharedLibrarySharingSuggestionsBannerUnreadCountThreshold"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 integerValue] >= 1) {
    uint64_t v8 = [v7 integerValue];
  }
  else {
    uint64_t v8 = 10;
  }
  [(PXSharedLibrarySettings *)self setSharingSuggestionsBannerUnreadCountThreshold:v8];
  [(PXSharedLibrarySettings *)self setSharingSuggestionsLegibilityStrength:0.8];
  v9 = PXSharedUserDefaults();
  v10 = [v9 objectForKey:@"PXSharedLibrarySharingSuggestionsMinimumTimeSinceLastBannerDismiss"];

  objc_opt_class();
  double v11 = 86400.0;
  if (objc_opt_isKindOfClass())
  {
    [v10 doubleValue];
    if (v12 > 0.0)
    {
      [v10 doubleValue];
      double v11 = v13;
    }
  }
  [(PXSharedLibrarySettings *)self setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:v11];
  v14 = PXSharedUserDefaults();
  v15 = [v14 objectForKey:@"PXSharedLibrarySharingSuggestionsMinimumTimeSinceLastAsset"];

  objc_opt_class();
  double v16 = 7200.0;
  if (objc_opt_isKindOfClass())
  {
    [v15 doubleValue];
    if (v17 > 0.0)
    {
      [v15 doubleValue];
      double v16 = v18;
    }
  }
  [(PXSharedLibrarySettings *)self setSharingSuggestionsMinimumTimeSinceLastAsset:v16];
  [(PXSharedLibrarySettings *)self setForceLegacyDevicesFallback:0];
  [(PXSharedLibrarySettings *)self setIncludeNonLegacyDevicesInFallback:0];
  [(PXSharedLibrarySettings *)self setSimulateSlowLegacyDevicesFetchInFallback:0];
  [(PXSharedLibrarySettings *)self setSimulateLegacyDevicesRemoteFailure:0];
}

- (void)setSourceLibraryInfoType:(int64_t)a3
{
  self->_sourceLibraryInfoType = a3;
}

- (void)setSimulateSlowLegacyDevicesFetchInFallback:(BOOL)a3
{
  self->_simulateSlowLegacyDevicesFetchInFallback = a3;
}

- (void)setSimulateLegacyDevicesRemoteFailure:(BOOL)a3
{
  self->_simulateLegacyDevicesRemoteFailure = a3;
}

- (void)setSimulateErrorType:(int64_t)a3
{
  self->_simulateErrorType = a3;
}

- (void)setShowSampleGadgets:(BOOL)a3
{
  self->_showSampleGadgets = a3;
}

- (void)setShowPreviewCancelButton:(BOOL)a3
{
  self->_showPreviewCancelButton = a3;
}

- (void)setShowPersonalLibraryContentOnly:(BOOL)a3
{
  self->_showPersonalLibraryContentOnly = a3;
}

- (void)setShowMoveToLibraryActionsInShareSheet:(BOOL)a3
{
  self->_showMoveToLibraryActionsInShareSheet = a3;
}

- (void)setShowDebugAlbums:(BOOL)a3
{
  self->_showDebugAlbums = a3;
}

- (void)setSharingSuggestionsMinimumTimeSinceLastBannerDismiss:(double)a3
{
  self->_sharingSuggestionsMinimumTimeSinceLastBannerDismiss = a3;
}

- (void)setSharingSuggestionsMinimumTimeSinceLastAsset:(double)a3
{
  self->_sharingSuggestionsMinimumTimeSinceLastAsset = a3;
}

- (void)setSharingSuggestionsLegibilityStrength:(double)a3
{
  self->_sharingSuggestionsLegibilityStrength = a3;
}

- (void)setSharingSuggestionsBannerUnreadCountThreshold:(int64_t)a3
{
  self->_sharingSuggestionsBannerUnreadCountThreshold = a3;
}

- (void)setSharingSuggestionsBannerFirstCheckThreshold:(int64_t)a3
{
  self->_sharingSuggestionsBannerFirstCheckThreshold = a3;
}

- (void)setSharedLibraryDataSourceType:(int64_t)a3
{
  self->_sharedLibraryDataSourceType = a3;
}

- (void)setPreviewDataSourceType:(int64_t)a3
{
  self->_previewDataSourceType = a3;
}

- (void)setMockPersonSuggestionForSetupAssistant:(BOOL)a3
{
  self->_mockPersonSuggestionForSetupAssistant = a3;
}

- (void)setInvitationsDataSourceType:(int64_t)a3
{
  self->_invitationsDataSourceType = a3;
}

- (void)setIncludeNonLegacyDevicesInFallback:(BOOL)a3
{
  self->_includeNonLegacyDevicesInFallback = a3;
}

- (void)setForceLegacyDevicesFallback:(BOOL)a3
{
  self->_forceLegacyDevicesFallback = a3;
}

- (void)setExitingDataSourceType:(int64_t)a3
{
  self->_exitingDataSourceType = a3;
}

- (void)setEnableOneUpBadge:(BOOL)a3
{
  self->_enableOneUpBadge = a3;
}

- (void)setEnableIncompleteUIElements:(BOOL)a3
{
  self->_enableIncompleteUIElements = a3;
}

- (void)setEnableAutoShareWithParticipants:(BOOL)a3
{
  self->_enableAutoShareWithParticipants = a3;
}

- (void)setConfirmMoveToPersonalLibraryFromSharedLibraryPreview:(BOOL)a3
{
  self->_confirmMoveToPersonalLibraryFromSharedLibraryPreview = a3;
}

- (void)setAlwaysConfirmRemoveSharedLibrarySuggestion:(BOOL)a3
{
  self->_alwaysConfirmRemoveSharedLibrarySuggestion = a3;
}

- (void)setAlwaysConfirmMoveToSharedLibrary:(BOOL)a3
{
  self->_alwaysConfirmMoveToSharedLibrary = a3;
}

- (void)setAlwaysConfirmMoveToPersonalLibrary:(BOOL)a3
{
  self->_alwaysConfirmMoveToPersonalLibrary = a3;
}

- (int64_t)previewDataSourceType
{
  return self->_previewDataSourceType;
}

- (int64_t)invitationsDataSourceType
{
  return self->_invitationsDataSourceType;
}

- (int64_t)sharedLibraryDataSourceType
{
  return self->_sharedLibraryDataSourceType;
}

- (int64_t)exitingDataSourceType
{
  return self->_exitingDataSourceType;
}

void __41__PXSharedLibrarySettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 sharedLibrarySettings];
  v1 = (void *)sharedInstance_sharedInstance_92092;
  sharedInstance_sharedInstance_92092 = v0;
}

- (BOOL)simulateLegacyDevicesRemoteFailure
{
  return self->_simulateLegacyDevicesRemoteFailure;
}

- (BOOL)simulateSlowLegacyDevicesFetchInFallback
{
  return self->_simulateSlowLegacyDevicesFetchInFallback;
}

- (BOOL)includeNonLegacyDevicesInFallback
{
  return self->_includeNonLegacyDevicesInFallback;
}

- (BOOL)forceLegacyDevicesFallback
{
  return self->_forceLegacyDevicesFallback;
}

- (BOOL)showDebugAlbums
{
  return self->_showDebugAlbums;
}

- (BOOL)showSampleGadgets
{
  return self->_showSampleGadgets;
}

- (double)sharingSuggestionsMinimumTimeSinceLastAsset
{
  return self->_sharingSuggestionsMinimumTimeSinceLastAsset;
}

- (double)sharingSuggestionsMinimumTimeSinceLastBannerDismiss
{
  return self->_sharingSuggestionsMinimumTimeSinceLastBannerDismiss;
}

- (double)sharingSuggestionsLegibilityStrength
{
  return self->_sharingSuggestionsLegibilityStrength;
}

- (int64_t)sharingSuggestionsBannerUnreadCountThreshold
{
  return self->_sharingSuggestionsBannerUnreadCountThreshold;
}

- (int64_t)simulateErrorType
{
  return self->_simulateErrorType;
}

- (int64_t)sourceLibraryInfoType
{
  return self->_sourceLibraryInfoType;
}

- (BOOL)mockPersonSuggestionForSetupAssistant
{
  return self->_mockPersonSuggestionForSetupAssistant;
}

- (BOOL)enableOneUpBadge
{
  return self->_enableOneUpBadge;
}

- (BOOL)enableAutoShareWithParticipants
{
  return self->_enableAutoShareWithParticipants;
}

- (BOOL)enableIncompleteUIElements
{
  return self->_enableIncompleteUIElements;
}

- (BOOL)confirmMoveToPersonalLibraryFromSharedLibraryPreview
{
  return self->_confirmMoveToPersonalLibraryFromSharedLibraryPreview;
}

- (BOOL)alwaysConfirmRemoveSharedLibrarySuggestion
{
  return self->_alwaysConfirmRemoveSharedLibrarySuggestion;
}

- (BOOL)alwaysConfirmMoveToPersonalLibrary
{
  return self->_alwaysConfirmMoveToPersonalLibrary;
}

- (BOOL)alwaysConfirmMoveToSharedLibrary
{
  return self->_alwaysConfirmMoveToSharedLibrary;
}

- (void)setShowPreviewAssetsOnlyFilter:(BOOL)a3
{
  self->_showPreviewAssetsOnlyFilter = a3;
}

- (BOOL)showPreviewAssetsOnlyFilter
{
  return self->_showPreviewAssetsOnlyFilter;
}

- (BOOL)showPersonalLibraryContentOnly
{
  return self->_showPersonalLibraryContentOnly;
}

- (BOOL)showMoveToLibraryActionsInShareSheet
{
  return self->_showMoveToLibraryActionsInShareSheet;
}

- (BOOL)showPreviewCancelButton
{
  return self->_showPreviewCancelButton;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v191[1] = *MEMORY[0x1E4F143B8];
  int v2 = _os_feature_enabled_impl();
  v3 = (void *)MEMORY[0x1E4F940F8];
  v4 = @"Disabled";
  if (v2) {
    v4 = @"Enabled";
  }
  uint64_t v5 = [NSString stringWithFormat:@"%@: %@", @"GoldilocksLocalMode", v4];
  v6 = _FeatureFlagToggleRowAction(@"GoldilocksLocalMode");
  v7 = [v3 rowWithTitle:v5 action:v6];

  if (v2) {
    [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else {
  v180 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  uint64_t v8 = _ImageForStateAndBackgroundColor(v2, v180);
  [v7 setStaticImage:v8];

  v9 = (void *)MEMORY[0x1E4F94160];
  v181 = v7;
  v191[0] = v7;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:1];
  v182 = [v9 sectionWithRows:v10 title:@"Feature Flags Status"];

  uint64_t v11 = PXSharedLibrarySettingsSimulateErrorTypes();
  uint64_t v12 = PXSharedLibrarySettingsSimulateErrorTypeTitles();
  v176 = (void *)MEMORY[0x1E4F94160];
  double v13 = (void *)MEMORY[0x1E4F941F0];
  v173 = NSStringFromSelector(sel_showMoveToLibraryActionsInShareSheet);
  v170 = [v13 rowWithTitle:@"Show Move Library Actions on Share Sheet" valueKeyPath:v173];
  v190[0] = v170;
  v14 = (void *)MEMORY[0x1E4F941F0];
  v166 = NSStringFromSelector(sel_showPreviewCancelButton);
  v162 = [v14 rowWithTitle:@"Show Preview Cancel Button" valueKeyPath:v166];
  v190[1] = v162;
  v15 = (void *)MEMORY[0x1E4F941F0];
  v158 = NSStringFromSelector(sel_showPersonalLibraryContentOnly);
  v154 = [v15 rowWithTitle:@"Show Personal Library Only" valueKeyPath:v158];
  v190[2] = v154;
  double v16 = (void *)MEMORY[0x1E4F941F0];
  v150 = NSStringFromSelector(sel_alwaysConfirmMoveToSharedLibrary);
  v147 = [v16 rowWithTitle:@"Always Confirm Move To Shared Library" valueKeyPath:v150];
  v190[3] = v147;
  double v17 = (void *)MEMORY[0x1E4F941F0];
  v144 = NSStringFromSelector(sel_alwaysConfirmMoveToPersonalLibrary);
  v142 = [v17 rowWithTitle:@"Always Confirm Move To Personal Library" valueKeyPath:v144];
  v190[4] = v142;
  double v18 = (void *)MEMORY[0x1E4F941F0];
  v140 = NSStringFromSelector(sel_alwaysConfirmRemoveSharedLibrarySuggestion);
  v138 = [v18 rowWithTitle:@"Always Confirm Remove Shared Library Suggestion" valueKeyPath:v140];
  v190[5] = v138;
  objc_super v19 = (void *)MEMORY[0x1E4F941F0];
  v136 = NSStringFromSelector(sel_confirmMoveToPersonalLibraryFromSharedLibraryPreview);
  v134 = [v19 rowWithTitle:@"Confirm Move To Personal Library from Preview" valueKeyPath:v136];
  v190[6] = v134;
  v20 = (void *)MEMORY[0x1E4F941F0];
  v132 = NSStringFromSelector(sel_enableIncompleteUIElements);
  v130 = [v20 rowWithTitle:@"Enable Incomplete UI" valueKeyPath:v132];
  v190[7] = v130;
  v21 = (void *)MEMORY[0x1E4F941F0];
  v129 = NSStringFromSelector(sel_enableAutoShareWithParticipants);
  v128 = [v21 rowWithTitle:@"Enable Auto Share with Participants" valueKeyPath:v129];
  v190[8] = v128;
  v22 = (void *)MEMORY[0x1E4F941F0];
  v23 = NSStringFromSelector(sel_enableOneUpBadge);
  v24 = [v22 rowWithTitle:@"Enable OneUp Badge" valueKeyPath:v23];
  v190[9] = v24;
  v25 = (void *)MEMORY[0x1E4F941F0];
  v26 = NSStringFromSelector(sel_showDebugAlbums);
  v27 = [v25 rowWithTitle:@"Show Debug Albums" valueKeyPath:v26];
  v190[10] = v27;
  v28 = (void *)MEMORY[0x1E4F941F0];
  v29 = NSStringFromSelector(sel_mockPersonSuggestionForSetupAssistant);
  v30 = [v28 rowWithTitle:@"Mock Person Suggestion" valueKeyPath:v29];
  v190[11] = v30;
  v31 = (void *)MEMORY[0x1E4F94108];
  v32 = NSStringFromSelector(sel_simulateErrorType);
  v33 = [v31 rowWithTitle:@"Error Simulation" valueKeyPath:v32];
  v178 = (void *)v12;
  v179 = (void *)v11;
  v34 = [v33 possibleValues:v11 titles:v12];
  v190[12] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:13];
  v177 = [v176 sectionWithRows:v35 title:@"Settings"];

  v174 = (void *)MEMORY[0x1E4F94160];
  v36 = (void *)MEMORY[0x1E4F94108];
  v171 = NSStringFromSelector(sel_invitationsDataSourceType);
  v167 = [v36 rowWithTitle:@"Invitations" valueKeyPath:v171];
  v163 = [v167 possibleValues:&unk_1F02D4708 titles:&unk_1F02D4720];
  v189[0] = v163;
  v37 = (void *)MEMORY[0x1E4F94108];
  v159 = NSStringFromSelector(sel_previewDataSourceType);
  v155 = [v37 rowWithTitle:@"Preview" valueKeyPath:v159];
  v151 = [v155 possibleValues:&unk_1F02D4738 titles:&unk_1F02D4750];
  v189[1] = v151;
  v38 = (void *)MEMORY[0x1E4F94108];
  v39 = NSStringFromSelector(sel_sharedLibraryDataSourceType);
  v40 = [v38 rowWithTitle:@"Shared Library" valueKeyPath:v39];
  v41 = [v40 possibleValues:&unk_1F02D4768 titles:&unk_1F02D4780];
  v189[2] = v41;
  v42 = (void *)MEMORY[0x1E4F94108];
  v43 = NSStringFromSelector(sel_exitingDataSourceType);
  v44 = [v42 rowWithTitle:@"Exiting" valueKeyPath:v43];
  v45 = [v44 possibleValues:&unk_1F02D4798 titles:&unk_1F02D47B0];
  v189[3] = v45;
  v46 = (void *)MEMORY[0x1E4F94108];
  v47 = NSStringFromSelector(sel_sourceLibraryInfoType);
  v48 = [v46 rowWithTitle:@"Source Library" valueKeyPath:v47];
  v49 = [v48 possibleValues:&unk_1F02D47C8 titles:&unk_1F02D47E0];
  v189[4] = v49;
  v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:5];
  v175 = [v174 sectionWithRows:v50 title:@"Data Source"];

  v51 = (void *)MEMORY[0x1E4F94160];
  v52 = (void *)MEMORY[0x1E4F940F8];
  v53 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_496];
  v54 = [v52 rowWithTitle:@"Copy URL" action:v53];
  v188[0] = v54;
  v55 = (void *)MEMORY[0x1E4F940F8];
  v56 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_479];
  v57 = [v55 rowWithTitle:@"Reset Local Mode LibraryScopes" action:v56];
  v188[1] = v57;
  v58 = (void *)MEMORY[0x1E4F940F8];
  v59 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_138761];
  v60 = [v58 rowWithTitle:@"Reset Camera Sharing Preferences" action:v59];
  v188[2] = v60;
  v61 = (void *)MEMORY[0x1E4F940F8];
  v62 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_364];
  v63 = [v61 rowWithTitle:@"Reset Invitation Dates" action:v62];
  v188[3] = v63;
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:4];
  v172 = [v51 sectionWithRows:v64 title:@"Actions"];

  v168 = (void *)MEMORY[0x1E4F94160];
  v65 = (void *)MEMORY[0x1E4F941B8];
  v164 = NSStringFromSelector(sel_sharingSuggestionsBannerFirstCheckThreshold);
  v160 = [v65 rowWithTitle:@"Banner First Check Threshold" valueKeyPath:v164];
  v156 = [v160 minValue:0.0 maxValue:30.0];
  v152 = objc_msgSend(v156, "px_increment:", 1.0);
  v187[0] = v152;
  v66 = (void *)MEMORY[0x1E4F941B8];
  v148 = NSStringFromSelector(sel_sharingSuggestionsBannerUnreadCountThreshold);
  v145 = [v66 rowWithTitle:@"Banner Unread Threshold" valueKeyPath:v148];
  v143 = [v145 minValue:0.0 maxValue:100.0];
  v141 = objc_msgSend(v143, "px_increment:", 5.0);
  v187[1] = v141;
  v67 = (void *)MEMORY[0x1E4F941B8];
  v139 = NSStringFromSelector(sel_sharingSuggestionsMinimumTimeSinceLastBannerDismiss);
  v137 = [v67 rowWithTitle:@"Banner Timeout After Dismiss" valueKeyPath:v139];
  v135 = [v137 minValue:0.0 maxValue:604800.0];
  v133 = objc_msgSend(v135, "px_increment:", 86400.0);
  v187[2] = v133;
  v68 = (void *)MEMORY[0x1E4F941B8];
  v131 = NSStringFromSelector(sel_sharingSuggestionsMinimumTimeSinceLastAsset);
  v69 = [v68 rowWithTitle:@"Banner Timeout After Last Asset" valueKeyPath:v131];
  v70 = [v69 minValue:0.0 maxValue:86400.0];
  v71 = objc_msgSend(v70, "px_increment:", 3600.0);
  v187[3] = v71;
  v72 = (void *)MEMORY[0x1E4F941D8];
  v73 = NSStringFromSelector(sel_sharingSuggestionsLegibilityStrength);
  v74 = [v72 rowWithTitle:@"Legibility Strength" valueKeyPath:v73];
  v75 = [v74 minValue:0.0 maxValue:2.0];
  v76 = objc_msgSend(v75, "px_increment:", 0.05);
  v187[4] = v76;
  v77 = (void *)MEMORY[0x1E4F940F8];
  v78 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_399];
  v79 = [v77 rowWithTitle:@"Reset Stored Dates" action:v78];
  v187[5] = v79;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:6];
  v169 = [v168 sectionWithRows:v80 title:@"Sharing Suggestions"];

  int v81 = _os_feature_enabled_impl();
  v82 = (void *)MEMORY[0x1E4F940F8];
  if (v81) {
    v83 = @"Enabled";
  }
  else {
    v83 = @"Disabled";
  }
  v84 = [NSString stringWithFormat:@"%@: %@", @"GoldilocksLegacyDevices", v83];
  v85 = _FeatureFlagToggleRowAction(@"GoldilocksLegacyDevices");
  v86 = [v82 rowWithTitle:v84 action:v85];

  if (v81) {
    [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else {
  v161 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  v87 = _ImageForStateAndBackgroundColor(v81, v161);
  [v86 setStaticImage:v87];

  v88 = (void *)MEMORY[0x1E4F94160];
  v165 = v86;
  v186[0] = v86;
  v89 = (void *)MEMORY[0x1E4F941F0];
  v90 = NSStringFromSelector(sel_simulateLegacyDevicesRemoteFailure);
  v91 = [v89 rowWithTitle:@"Simulate Remote UI Failure" valueKeyPath:v90];
  v186[1] = v91;
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:2];
  v157 = [v88 sectionWithRows:v92 title:@"Legacy Devices"];

  int v93 = _os_feature_enabled_impl();
  v94 = (void *)MEMORY[0x1E4F940F8];
  if (v93) {
    v95 = @"Enabled";
  }
  else {
    v95 = @"Disabled";
  }
  v96 = [NSString stringWithFormat:@"%@: %@", @"GoldilocksLegacyDevicesFallback", v95];
  v97 = _FeatureFlagToggleRowAction(@"GoldilocksLegacyDevicesFallback");
  v98 = [v94 rowWithTitle:v96 action:v97];

  if (v93) {
    [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else {
  v153 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  v99 = _ImageForStateAndBackgroundColor(v93, v153);
  [v98 setStaticImage:v99];

  v100 = (void *)MEMORY[0x1E4F94160];
  v185[0] = v98;
  v149 = v98;
  v101 = (void *)MEMORY[0x1E4F941F0];
  v102 = NSStringFromSelector(sel_forceLegacyDevicesFallback);
  v103 = [v101 rowWithTitle:@"Force Fallback" valueKeyPath:v102];
  v185[1] = v103;
  v104 = (void *)MEMORY[0x1E4F941F0];
  v105 = NSStringFromSelector(sel_includeNonLegacyDevicesInFallback);
  v106 = [v104 rowWithTitle:@"Show Supported Devices" valueKeyPath:v105];
  v185[2] = v106;
  v107 = (void *)MEMORY[0x1E4F941F0];
  v108 = NSStringFromSelector(sel_simulateSlowLegacyDevicesFetchInFallback);
  v109 = [v107 rowWithTitle:@"Simulate Slow Fetch" valueKeyPath:v108];
  v185[3] = v109;
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:4];
  v146 = [v100 sectionWithRows:v110 title:@"Legacy Devices Fallback"];

  v111 = (void *)MEMORY[0x1E4F94160];
  v112 = (void *)MEMORY[0x1E4F940F8];
  v113 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_511];
  v114 = [v112 rowWithTitle:@"Generate Camera Switch Questions" action:v113];
  v184[0] = v114;
  v115 = (void *)MEMORY[0x1E4F940F8];
  v116 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_534];
  v117 = [v115 rowWithTitle:@"Generate Suggestion Questions" action:v116];
  v184[1] = v117;
  v118 = (void *)MEMORY[0x1E4F940F8];
  v119 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_540];
  v120 = [v118 rowWithTitle:@"Evaluate & Send Metrics" action:v119];
  v184[2] = v120;
  v121 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:3];
  v122 = [v111 sectionWithRows:v121 title:@"Photos Challenge Questions"];

  v123 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v124 = (void *)MEMORY[0x1E4F94160];
  v183[0] = v182;
  v183[1] = v177;
  v183[2] = v175;
  v183[3] = v172;
  v183[4] = v169;
  v183[5] = v157;
  v183[6] = v146;
  v183[7] = v122;
  v183[8] = v123;
  v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:9];
  v126 = [v124 moduleWithTitle:@"Shared Library" contents:v125];

  return v126;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke_3()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v1 = objc_msgSend(v0, "px_sharedLibrarySharingSuggestionsCountsManager");
  [v1 clearStoredDates];

  return 1;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke_2()
{
  return 1;
}

uint64_t __55__PXSharedLibrarySettings_UI__settingsControllerModule__block_invoke()
{
  return 1;
}

@end