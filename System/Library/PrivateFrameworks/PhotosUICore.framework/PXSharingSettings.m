@interface PXSharingSettings
+ (PXSharingSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowCopyingVideos;
- (BOOL)allowFallbacksWhilePreparing;
- (BOOL)disableMailDrop;
- (BOOL)disableMetadataCorrections;
- (BOOL)enableNewActionContextMenu;
- (BOOL)enableOneUpAnimation;
- (BOOL)excludeLivenessByDefaultWhenSharing;
- (BOOL)excludeLocationByDefaultWhenSharing;
- (BOOL)forceAccessibilityDescriptionMetadataBaking;
- (BOOL)forceCaptionMetadataBaking;
- (BOOL)forceDateTimeMetadataBaking;
- (BOOL)forceLocationMetadataBaking;
- (BOOL)provideGenericTypeIdentifiersForNilActivityTypes;
- (BOOL)savePhotosBundlesToFilesWithoutExtractingMedia;
- (BOOL)sendAsAssetBundlesByDefaultWhenSharing;
- (BOOL)sendAssetURLsToMessages;
- (BOOL)shouldUpdateFileCreationDatesForRegularExports;
- (BOOL)shouldUpdateFileCreationDatesForUnmodifiedOriginalExports;
- (BOOL)showConfidentialityWarnings;
- (BOOL)showFileRadarButtonOnInternalInstalls;
- (BOOL)showGlobalLivenessExclusionSwitch;
- (BOOL)showGlobalLocationExclusionSwitch;
- (BOOL)showInternalGIFExport;
- (BOOL)showSendAsAssetBundlesForCMM;
- (BOOL)showSendAsAssetBundlesForIndividualItems;
- (BOOL)showSingleVideoDurationInShareSheetHeader;
- (BOOL)showUnmodifiedOriginalsExportSwitch;
- (BOOL)simulateCPLNotReadyError;
- (BOOL)simulateDownloadFailure;
- (BOOL)simulateError;
- (BOOL)simulateLowDiskSpaceError;
- (BOOL)simulateMaxFilesizeLimitForGIFsInSharedAlbumsError;
- (BOOL)simulateMismatchedExportCounts;
- (BOOL)simulateSyndicatedResourceUnavailable;
- (BOOL)simulateUserCloudNotAuthenticated;
- (id)debugDescription;
- (id)parentSettings;
- (int64_t)locationBakingComparisonStrategy;
- (int64_t)sharingHeaderLocationDisplayStyle;
- (int64_t)simulatedErrorType;
- (unint64_t)confidentialityWarningsVersion;
- (unint64_t)maxMailPhotoLimit;
- (unint64_t)maxMessagesAssetLimit;
- (void)defaultValueDidChangeForKey:(id)a3;
- (void)setAllowCopyingVideos:(BOOL)a3;
- (void)setAllowFallbacksWhilePreparing:(BOOL)a3;
- (void)setConfidentialityWarningsVersion:(unint64_t)a3;
- (void)setDefaultValues;
- (void)setDisableMailDrop:(BOOL)a3;
- (void)setDisableMetadataCorrections:(BOOL)a3;
- (void)setEnableNewActionContextMenu:(BOOL)a3;
- (void)setEnableOneUpAnimation:(BOOL)a3;
- (void)setExcludeLivenessByDefaultWhenSharing:(BOOL)a3;
- (void)setExcludeLocationByDefaultWhenSharing:(BOOL)a3;
- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3;
- (void)setForceCaptionMetadataBaking:(BOOL)a3;
- (void)setForceDateTimeMetadataBaking:(BOOL)a3;
- (void)setForceLocationMetadataBaking:(BOOL)a3;
- (void)setLocationBakingComparisonStrategy:(int64_t)a3;
- (void)setMaxMailPhotoLimit:(unint64_t)a3;
- (void)setMaxMessagesAssetLimit:(unint64_t)a3;
- (void)setProvideGenericTypeIdentifiersForNilActivityTypes:(BOOL)a3;
- (void)setSavePhotosBundlesToFilesWithoutExtractingMedia:(BOOL)a3;
- (void)setSendAsAssetBundlesByDefaultWhenSharing:(BOOL)a3;
- (void)setSendAssetURLsToMessages:(BOOL)a3;
- (void)setSharingHeaderLocationDisplayStyle:(int64_t)a3;
- (void)setShouldUpdateFileCreationDatesForRegularExports:(BOOL)a3;
- (void)setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:(BOOL)a3;
- (void)setShowConfidentialityWarnings:(BOOL)a3;
- (void)setShowFileRadarButtonOnInternalInstalls:(BOOL)a3;
- (void)setShowGlobalLivenessExclusionSwitch:(BOOL)a3;
- (void)setShowGlobalLocationExclusionSwitch:(BOOL)a3;
- (void)setShowInternalGIFExport:(BOOL)a3;
- (void)setShowSendAsAssetBundlesForCMM:(BOOL)a3;
- (void)setShowSendAsAssetBundlesForIndividualItems:(BOOL)a3;
- (void)setShowSingleVideoDurationInShareSheetHeader:(BOOL)a3;
- (void)setShowUnmodifiedOriginalsExportSwitch:(BOOL)a3;
- (void)setSimulateCPLNotReadyError:(BOOL)a3;
- (void)setSimulateDownloadFailure:(BOOL)a3;
- (void)setSimulateError:(BOOL)a3;
- (void)setSimulateLowDiskSpaceError:(BOOL)a3;
- (void)setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:(BOOL)a3;
- (void)setSimulateMismatchedExportCounts:(BOOL)a3;
- (void)setSimulateSyndicatedResourceUnavailable:(BOOL)a3;
- (void)setSimulateUserCloudNotAuthenticated:(BOOL)a3;
- (void)setSimulatedErrorType:(int64_t)a3;
@end

@implementation PXSharingSettings

- (void)setDefaultValues
{
  [(PXSharingSettings *)self setShowConfidentialityWarnings:1];
  [(PXSharingSettings *)self setConfidentialityWarningsVersion:7];
  [(PXSharingSettings *)self setDisableMailDrop:0];
  [(PXSharingSettings *)self setMaxMessagesAssetLimit:20];
  [(PXSharingSettings *)self setMaxMailPhotoLimit:5];
  [(PXSharingSettings *)self setShowInternalGIFExport:0];
  [(PXSharingSettings *)self setAllowCopyingVideos:0];
  [(PXSharingSettings *)self setShowFileRadarButtonOnInternalInstalls:1];
  [(PXSharingSettings *)self setSimulatedErrorType:0];
  [(PXSharingSettings *)self setEnableNewActionContextMenu:1];
  [(PXSharingSettings *)self setEnableOneUpAnimation:1];
  [(PXSharingSettings *)self setAllowFallbacksWhilePreparing:0];
  [(PXSharingSettings *)self setLocationBakingComparisonStrategy:0];
  [(PXSharingSettings *)self setDisableMetadataCorrections:0];
  [(PXSharingSettings *)self setForceDateTimeMetadataBaking:0];
  [(PXSharingSettings *)self setForceLocationMetadataBaking:0];
  [(PXSharingSettings *)self setForceCaptionMetadataBaking:0];
  [(PXSharingSettings *)self setForceAccessibilityDescriptionMetadataBaking:0];
  [(PXSharingSettings *)self setSendAssetURLsToMessages:0];
  [(PXSharingSettings *)self setSimulateError:0];
  [(PXSharingSettings *)self setSimulateDownloadFailure:0];
  [(PXSharingSettings *)self setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:0];
  [(PXSharingSettings *)self setSimulateCPLNotReadyError:0];
  [(PXSharingSettings *)self setSimulateLowDiskSpaceError:0];
  [(PXSharingSettings *)self setSimulateUserCloudNotAuthenticated:0];
  [(PXSharingSettings *)self setSimulateSyndicatedResourceUnavailable:0];
  [(PXSharingSettings *)self setSimulateMismatchedExportCounts:0];
  [(PXSharingSettings *)self setShowSingleVideoDurationInShareSheetHeader:1];
  [(PXSharingSettings *)self setSharingHeaderLocationDisplayStyle:0];
  [(PXSharingSettings *)self setProvideGenericTypeIdentifiersForNilActivityTypes:1];
  [(PXSharingSettings *)self setShowUnmodifiedOriginalsExportSwitch:0];
  [(PXSharingSettings *)self setShowGlobalLivenessExclusionSwitch:0];
  [(PXSharingSettings *)self setShowGlobalLocationExclusionSwitch:1];
  [(PXSharingSettings *)self setExcludeLivenessByDefaultWhenSharing:0];
  [(PXSharingSettings *)self setExcludeLocationByDefaultWhenSharing:0];
  [(PXSharingSettings *)self setShowSendAsAssetBundlesForCMM:1];
  [(PXSharingSettings *)self setShowSendAsAssetBundlesForIndividualItems:1];
  [(PXSharingSettings *)self setSendAsAssetBundlesByDefaultWhenSharing:0];
  [(PXSharingSettings *)self setSavePhotosBundlesToFilesWithoutExtractingMedia:0];
  [(PXSharingSettings *)self setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:1];
  [(PXSharingSettings *)self setShouldUpdateFileCreationDatesForRegularExports:1];
}

- (void)setSimulatedErrorType:(int64_t)a3
{
  self->_simulatedErrorType = a3;
}

- (void)setSimulateUserCloudNotAuthenticated:(BOOL)a3
{
  self->_simulateUserCloudNotAuthenticated = a3;
}

- (void)setSimulateSyndicatedResourceUnavailable:(BOOL)a3
{
  self->_simulateSyndicatedResourceUnavailable = a3;
}

- (void)setSimulateMismatchedExportCounts:(BOOL)a3
{
  self->_simulateMismatchedExportCounts = a3;
}

- (void)setSimulateMaxFilesizeLimitForGIFsInSharedAlbumsError:(BOOL)a3
{
  self->_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError = a3;
}

- (void)setSimulateLowDiskSpaceError:(BOOL)a3
{
  self->_simulateLowDiskSpaceError = a3;
}

- (void)setSimulateError:(BOOL)a3
{
  self->_simulateError = a3;
}

- (void)setSimulateDownloadFailure:(BOOL)a3
{
  self->_simulateDownloadFailure = a3;
}

- (void)setSimulateCPLNotReadyError:(BOOL)a3
{
  self->_simulateCPLNotReadyError = a3;
}

- (void)setShowUnmodifiedOriginalsExportSwitch:(BOOL)a3
{
  self->_showUnmodifiedOriginalsExportSwitch = a3;
}

- (void)setShowSingleVideoDurationInShareSheetHeader:(BOOL)a3
{
  self->_showSingleVideoDurationInShareSheetHeader = a3;
}

- (void)setShowSendAsAssetBundlesForIndividualItems:(BOOL)a3
{
  self->_showSendAsAssetBundlesForIndividualItems = a3;
}

- (void)setShowSendAsAssetBundlesForCMM:(BOOL)a3
{
  self->_showSendAsAssetBundlesForCMM = a3;
}

- (void)setShowInternalGIFExport:(BOOL)a3
{
  self->_showInternalGIFExport = a3;
}

- (void)setShowGlobalLocationExclusionSwitch:(BOOL)a3
{
  self->_showGlobalLocationExclusionSwitch = a3;
}

- (void)setShowGlobalLivenessExclusionSwitch:(BOOL)a3
{
  self->_showGlobalLivenessExclusionSwitch = a3;
}

- (void)setShowFileRadarButtonOnInternalInstalls:(BOOL)a3
{
  self->_showFileRadarButtonOnInternalInstalls = a3;
}

- (void)setShowConfidentialityWarnings:(BOOL)a3
{
  self->_showConfidentialityWarnings = a3;
}

- (void)setShouldUpdateFileCreationDatesForUnmodifiedOriginalExports:(BOOL)a3
{
  self->_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports = a3;
}

- (void)setSharingHeaderLocationDisplayStyle:(int64_t)a3
{
  self->_sharingHeaderLocationDisplayStyle = a3;
}

- (void)setSendAssetURLsToMessages:(BOOL)a3
{
  self->_sendAssetURLsToMessages = a3;
}

- (void)setSendAsAssetBundlesByDefaultWhenSharing:(BOOL)a3
{
  self->_sendAsAssetBundlesByDefaultWhenSharing = a3;
}

- (void)setSavePhotosBundlesToFilesWithoutExtractingMedia:(BOOL)a3
{
  self->_savePhotosBundlesToFilesWithoutExtractingMedia = a3;
}

- (void)setProvideGenericTypeIdentifiersForNilActivityTypes:(BOOL)a3
{
  self->_provideGenericTypeIdentifiersForNilActivityTypes = a3;
}

- (void)setMaxMessagesAssetLimit:(unint64_t)a3
{
  self->_maxMessagesAssetLimit = a3;
}

- (void)setMaxMailPhotoLimit:(unint64_t)a3
{
  self->_maxMailPhotoLimit = a3;
}

- (void)setLocationBakingComparisonStrategy:(int64_t)a3
{
  self->_locationBakingComparisonStrategy = a3;
}

- (void)setForceLocationMetadataBaking:(BOOL)a3
{
  self->_forceLocationMetadataBaking = a3;
}

- (void)setForceDateTimeMetadataBaking:(BOOL)a3
{
  self->_forceDateTimeMetadataBaking = a3;
}

- (void)setForceCaptionMetadataBaking:(BOOL)a3
{
  self->_forceCaptionMetadataBaking = a3;
}

- (void)setForceAccessibilityDescriptionMetadataBaking:(BOOL)a3
{
  self->_forceAccessibilityDescriptionMetadataBaking = a3;
}

- (void)setExcludeLocationByDefaultWhenSharing:(BOOL)a3
{
  self->_excludeLocationByDefaultWhenSharing = a3;
}

- (void)setExcludeLivenessByDefaultWhenSharing:(BOOL)a3
{
  self->_excludeLivenessByDefaultWhenSharing = a3;
}

- (void)setEnableOneUpAnimation:(BOOL)a3
{
  self->_enableOneUpAnimation = a3;
}

- (void)setEnableNewActionContextMenu:(BOOL)a3
{
  self->_enableNewActionContextMenu = a3;
}

- (void)setDisableMetadataCorrections:(BOOL)a3
{
  self->_disableMetadataCorrections = a3;
}

- (void)setDisableMailDrop:(BOOL)a3
{
  self->_disableMailDrop = a3;
}

- (void)setConfidentialityWarningsVersion:(unint64_t)a3
{
  self->_confidentialityWarningsVersion = a3;
}

- (void)setAllowFallbacksWhilePreparing:(BOOL)a3
{
  self->_allowFallbacksWhilePreparing = a3;
}

- (void)setAllowCopyingVideos:(BOOL)a3
{
  self->_allowCopyingVideos = a3;
}

- (void)setShouldUpdateFileCreationDatesForRegularExports:(BOOL)a3
{
  self->_shouldUpdateFileCreationDatesForRegularExports = a3;
}

+ (id)settingsControllerModule
{
  v181[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v3 = (void *)MEMORY[0x1E4F941F0];
  v4 = NSStringFromSelector(sel_showConfidentialityWarnings);
  v5 = [v3 rowWithTitle:@"Show Confidentiality Warnings" valueKeyPath:v4];
  v181[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:1];
  v171 = [v2 sectionWithRows:v6 title:@"Warnings"];

  v169 = (void *)MEMORY[0x1E4F94160];
  v7 = (void *)MEMORY[0x1E4F941F0];
  v167 = NSStringFromSelector(sel_disableMailDrop);
  v164 = [v7 rowWithTitle:@"Disable Mail Drop" valueKeyPath:v167];
  v180[0] = v164;
  v8 = (void *)MEMORY[0x1E4F941B8];
  v160 = NSStringFromSelector(sel_maxMessagesAssetLimit);
  v156 = [v8 rowWithTitle:@"Messages Asset Limit" valueKeyPath:v160];
  v151 = [v156 minValue:0.0 maxValue:50.0];
  v146 = objc_msgSend(v151, "px_increment:", 1.0);
  v180[1] = v146;
  v9 = (void *)MEMORY[0x1E4F941B8];
  v141 = NSStringFromSelector(sel_maxMailPhotoLimit);
  v137 = [v9 rowWithTitle:@"Mail Image Limit (if no MailDrop)" valueKeyPath:v141];
  v133 = [v137 minValue:0.0 maxValue:50.0];
  v10 = objc_msgSend(v133, "px_increment:", 1.0);
  v180[2] = v10;
  v11 = (void *)MEMORY[0x1E4F941F0];
  v12 = NSStringFromSelector(sel_showInternalGIFExport);
  v13 = [v11 rowWithTitle:@"Show Autoloop -> GIF" valueKeyPath:v12];
  v180[3] = v13;
  v14 = (void *)MEMORY[0x1E4F941F0];
  v15 = NSStringFromSelector(sel_enableNewActionContextMenu);
  v16 = [v14 rowWithTitle:@"Enable New Action Context Menu" valueKeyPath:v15];
  v180[4] = v16;
  v17 = (void *)MEMORY[0x1E4F941F0];
  v18 = NSStringFromSelector(sel_enableOneUpAnimation);
  v19 = [v17 rowWithTitle:@"Enable 1up animation" valueKeyPath:v18];
  v180[5] = v19;
  v20 = (void *)MEMORY[0x1E4F941F0];
  v21 = NSStringFromSelector(sel_allowCopyingVideos);
  v22 = [v20 rowWithTitle:@"Allow Copying Videos" valueKeyPath:v21];
  v180[6] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:7];
  v170 = [v169 sectionWithRows:v23 title:@"Share Sheet"];

  v24 = (void *)MEMORY[0x1E4F94160];
  v25 = (void *)MEMORY[0x1E4F941F0];
  v26 = NSStringFromSelector(sel_showSingleVideoDurationInShareSheetHeader);
  v27 = [v25 rowWithTitle:@"Show Duration For Single Video" valueKeyPath:v26];
  v179[0] = v27;
  v28 = (void *)MEMORY[0x1E4F94108];
  v29 = NSStringFromSelector(sel_sharingHeaderLocationDisplayStyle);
  v30 = [v28 rowWithTitle:@"Location Display Style" valueKeyPath:v29];
  v31 = [v30 possibleValues:&unk_1F02D3388 titles:&unk_1F02D33A0];
  v179[1] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
  v168 = [v24 sectionWithRows:v32 title:@"Share Sheet Header Options"];

  v165 = (void *)MEMORY[0x1E4F94160];
  v33 = (void *)MEMORY[0x1E4F941F0];
  v161 = NSStringFromSelector(sel_provideGenericTypeIdentifiersForNilActivityTypes);
  v157 = [v33 rowWithTitle:@"Fast UTType for nil activity types" valueKeyPath:v161];
  v178[0] = v157;
  v34 = (void *)MEMORY[0x1E4F941F0];
  v152 = NSStringFromSelector(sel_showUnmodifiedOriginalsExportSwitch);
  v147 = [v34 rowWithTitle:@"Unmodified Export Switch" valueKeyPath:v152];
  v178[1] = v147;
  v35 = (void *)MEMORY[0x1E4F941F0];
  v142 = NSStringFromSelector(sel_showGlobalLivenessExclusionSwitch);
  v138 = [v35 rowWithTitle:@"Show Liveness Switch" valueKeyPath:v142];
  v178[2] = v138;
  v36 = (void *)MEMORY[0x1E4F941F0];
  v134 = NSStringFromSelector(sel_showGlobalLocationExclusionSwitch);
  v130 = [v36 rowWithTitle:@"Show Location Switch" valueKeyPath:v134];
  v178[3] = v130;
  v37 = (void *)MEMORY[0x1E4F941F0];
  v127 = NSStringFromSelector(sel_excludeLivenessByDefaultWhenSharing);
  v125 = [v37 rowWithTitle:@"Exclude Liveness" valueKeyPath:v127];
  v178[4] = v125;
  v38 = (void *)MEMORY[0x1E4F941F0];
  v123 = NSStringFromSelector(sel_excludeLocationByDefaultWhenSharing);
  v39 = [v38 rowWithTitle:@"Exclude Location" valueKeyPath:v123];
  v178[5] = v39;
  v40 = (void *)MEMORY[0x1E4F941F0];
  v41 = NSStringFromSelector(sel_showSendAsAssetBundlesForCMM);
  v42 = [v40 rowWithTitle:@"Show \"All Photos Data\" option for CMM" valueKeyPath:v41];
  v178[6] = v42;
  v43 = (void *)MEMORY[0x1E4F941F0];
  v44 = NSStringFromSelector(sel_showSendAsAssetBundlesForIndividualItems);
  v45 = [v43 rowWithTitle:@"Show \"All Photos Data\" option for Individual Items" valueKeyPath:v44];
  v178[7] = v45;
  v46 = (void *)MEMORY[0x1E4F941F0];
  v47 = NSStringFromSelector(sel_sendAsAssetBundlesByDefaultWhenSharing);
  v48 = [v46 rowWithTitle:@"Send All Photos Data" valueKeyPath:v47];
  v178[8] = v48;
  v49 = (void *)MEMORY[0x1E4F941F0];
  v50 = NSStringFromSelector(sel_savePhotosBundlesToFilesWithoutExtractingMedia);
  v51 = [v49 rowWithTitle:@"Allow All Photos Data for \"Save To Files\"" valueKeyPath:v50];
  v178[9] = v51;
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v178 count:10];
  v166 = [v165 sectionWithRows:v52 title:@"Metadata Preferences (Share Sheet Secondary Actions)"];

  v162 = (void *)MEMORY[0x1E4F94160];
  v53 = (void *)MEMORY[0x1E4F941F0];
  v158 = NSStringFromSelector(sel_allowFallbacksWhilePreparing);
  v153 = [v53 rowWithTitle:@"Allow fallbacks during prepare" valueKeyPath:v158];
  v177[0] = v153;
  v54 = (void *)MEMORY[0x1E4F94108];
  v148 = NSStringFromSelector(sel_locationBakingComparisonStrategy);
  v143 = [v54 rowWithTitle:@"Location Baking Comparison" valueKeyPath:v148];
  v139 = [v143 possibleValues:&unk_1F02D33B8 titles:&unk_1F02D33D0];
  v177[1] = v139;
  v55 = (void *)MEMORY[0x1E4F941F0];
  v135 = NSStringFromSelector(sel_disableMetadataCorrections);
  v131 = [v55 rowWithTitle:@"Disable Metadata Corrections" valueKeyPath:v135];
  v177[2] = v131;
  v56 = (void *)MEMORY[0x1E4F941F0];
  v128 = NSStringFromSelector(sel_forceDateTimeMetadataBaking);
  v57 = [v56 rowWithTitle:@"Always Bake Creation Date" valueKeyPath:v128];
  v177[3] = v57;
  v58 = (void *)MEMORY[0x1E4F941F0];
  v59 = NSStringFromSelector(sel_forceLocationMetadataBaking);
  v60 = [v58 rowWithTitle:@"Always Bake Location" valueKeyPath:v59];
  v177[4] = v60;
  v61 = (void *)MEMORY[0x1E4F941F0];
  v62 = NSStringFromSelector(sel_forceCaptionMetadataBaking);
  v63 = [v61 rowWithTitle:@"Always Bake Caption" valueKeyPath:v62];
  v177[5] = v63;
  v64 = (void *)MEMORY[0x1E4F941F0];
  v65 = NSStringFromSelector(sel_forceAccessibilityDescriptionMetadataBaking);
  v66 = [v64 rowWithTitle:@"Always Bake AX Description" valueKeyPath:v65];
  v177[6] = v66;
  v67 = (void *)MEMORY[0x1E4F941F0];
  v68 = NSStringFromSelector(sel_sendAssetURLsToMessages);
  v69 = [v67 rowWithTitle:@"Send Asset URLs to Messages" valueKeyPath:v68];
  v177[7] = v69;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v177 count:8];
  v163 = [v162 sectionWithRows:v70 title:@"Export Pipeline"];

  uint64_t v71 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"simulateError != 0"];
  v154 = (void *)MEMORY[0x1E4F94160];
  v72 = (void *)MEMORY[0x1E4F941F0];
  v149 = NSStringFromSelector(sel_simulateError);
  v144 = [v72 rowWithTitle:@"Simulate Error" valueKeyPath:v149];
  v176[0] = v144;
  v73 = (void *)MEMORY[0x1E4F941F0];
  v140 = NSStringFromSelector(sel_simulateDownloadFailure);
  v136 = [v73 rowWithTitle:@"Download Failure" valueKeyPath:v140];
  v132 = [v136 condition:v71];
  v176[1] = v132;
  v74 = (void *)MEMORY[0x1E4F941F0];
  v129 = NSStringFromSelector(sel_simulateCPLNotReadyError);
  v126 = [v74 rowWithTitle:@"CPL Not Ready error" valueKeyPath:v129];
  v124 = [v126 condition:v71];
  v176[2] = v124;
  v75 = (void *)MEMORY[0x1E4F941F0];
  v122 = NSStringFromSelector(sel_simulateLowDiskSpaceError);
  v121 = [v75 rowWithTitle:@"Low Disk Space" valueKeyPath:v122];
  v120 = [v121 condition:v71];
  v176[3] = v120;
  v76 = (void *)MEMORY[0x1E4F941F0];
  v119 = NSStringFromSelector(sel_simulateUserCloudNotAuthenticated);
  v118 = [v76 rowWithTitle:@"iCloud Settings Require Review" valueKeyPath:v119];
  v77 = (void *)v71;
  v78 = [v118 condition:v71];
  v176[4] = v78;
  v79 = (void *)MEMORY[0x1E4F941F0];
  v80 = NSStringFromSelector(sel_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError);
  v81 = [v79 rowWithTitle:@"GIF -> Shared Albums file limit" valueKeyPath:v80];
  v159 = v77;
  v82 = [v81 condition:v77];
  v176[5] = v82;
  v83 = (void *)MEMORY[0x1E4F941F0];
  v84 = NSStringFromSelector(sel_simulateSyndicatedResourceUnavailable);
  v85 = [v83 rowWithTitle:@"Syndicated resource unavailable" valueKeyPath:v84];
  v86 = [v85 condition:v77];
  v176[6] = v86;
  v87 = (void *)MEMORY[0x1E4F941F0];
  v88 = NSStringFromSelector(sel_simulateMismatchedExportCounts);
  v89 = [v87 rowWithTitle:@"Mismatched count failure (uses fallback)" valueKeyPath:v88];
  v176[7] = v89;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v176 count:8];
  v155 = [v154 sectionWithRows:v90 title:@"Simulation"];

  v91 = (void *)MEMORY[0x1E4F94160];
  v92 = (void *)MEMORY[0x1E4F94108];
  v93 = NSStringFromSelector(sel_simulatedErrorType);
  v94 = [v92 rowWithTitle:@"Error Type Override" valueKeyPath:v93];
  v95 = [v94 possibleValues:&unk_1F02D33E8 titles:&unk_1F02D3400];
  v175[0] = v95;
  v96 = (void *)MEMORY[0x1E4F941F0];
  v97 = NSStringFromSelector(sel_showFileRadarButtonOnInternalInstalls);
  v98 = [v96 rowWithTitle:@"Show Radar Button (Internal OS)" valueKeyPath:v97];
  v175[1] = v98;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
  v150 = [v91 sectionWithRows:v99 title:@"Error Presentation UI"];

  v100 = (void *)MEMORY[0x1E4F94160];
  v101 = (void *)MEMORY[0x1E4F941F0];
  v102 = NSStringFromSelector(sel_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports);
  v103 = [v101 rowWithTitle:@"Unmodified Originals" valueKeyPath:v102];
  v174[0] = v103;
  v104 = (void *)MEMORY[0x1E4F941F0];
  v105 = NSStringFromSelector(sel_shouldUpdateFileCreationDatesForRegularExports);
  v106 = [v104 rowWithTitle:@"Share Sheet" valueKeyPath:v105];
  v174[1] = v106;
  v107 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
  v145 = [v100 sectionWithRows:v107 title:@"File Creation Date Set During Export"];

  v108 = (void *)MEMORY[0x1E4F94160];
  v109 = (void *)MEMORY[0x1E4F940F8];
  v110 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v111 = [v109 rowWithTitle:@"Restore Defaults" action:v110];
  v173 = v111;
  v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v173 count:1];
  v113 = [v108 sectionWithRows:v112];

  v114 = (void *)MEMORY[0x1E4F94160];
  v172[0] = v171;
  v172[1] = v170;
  v172[2] = v168;
  v172[3] = v166;
  v172[4] = v163;
  v172[5] = v155;
  v172[6] = v150;
  v172[7] = v145;
  v172[8] = v113;
  v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:9];
  v116 = [v114 moduleWithTitle:@"Sharing Settings" contents:v115];

  return v116;
}

- (BOOL)shouldUpdateFileCreationDatesForRegularExports
{
  return self->_shouldUpdateFileCreationDatesForRegularExports;
}

- (BOOL)shouldUpdateFileCreationDatesForUnmodifiedOriginalExports
{
  return self->_shouldUpdateFileCreationDatesForUnmodifiedOriginalExports;
}

- (BOOL)savePhotosBundlesToFilesWithoutExtractingMedia
{
  return self->_savePhotosBundlesToFilesWithoutExtractingMedia;
}

- (BOOL)sendAsAssetBundlesByDefaultWhenSharing
{
  return self->_sendAsAssetBundlesByDefaultWhenSharing;
}

- (BOOL)showSendAsAssetBundlesForIndividualItems
{
  return self->_showSendAsAssetBundlesForIndividualItems;
}

- (BOOL)showSendAsAssetBundlesForCMM
{
  return self->_showSendAsAssetBundlesForCMM;
}

- (BOOL)excludeLocationByDefaultWhenSharing
{
  return self->_excludeLocationByDefaultWhenSharing;
}

- (BOOL)excludeLivenessByDefaultWhenSharing
{
  return self->_excludeLivenessByDefaultWhenSharing;
}

- (BOOL)showGlobalLocationExclusionSwitch
{
  return self->_showGlobalLocationExclusionSwitch;
}

- (BOOL)showGlobalLivenessExclusionSwitch
{
  return self->_showGlobalLivenessExclusionSwitch;
}

- (BOOL)showUnmodifiedOriginalsExportSwitch
{
  return self->_showUnmodifiedOriginalsExportSwitch;
}

- (BOOL)provideGenericTypeIdentifiersForNilActivityTypes
{
  return self->_provideGenericTypeIdentifiersForNilActivityTypes;
}

- (int64_t)sharingHeaderLocationDisplayStyle
{
  return self->_sharingHeaderLocationDisplayStyle;
}

- (BOOL)showSingleVideoDurationInShareSheetHeader
{
  return self->_showSingleVideoDurationInShareSheetHeader;
}

- (int64_t)simulatedErrorType
{
  return self->_simulatedErrorType;
}

- (BOOL)showFileRadarButtonOnInternalInstalls
{
  return self->_showFileRadarButtonOnInternalInstalls;
}

- (BOOL)simulateMismatchedExportCounts
{
  return self->_simulateMismatchedExportCounts;
}

- (BOOL)simulateSyndicatedResourceUnavailable
{
  return self->_simulateSyndicatedResourceUnavailable;
}

- (BOOL)simulateMaxFilesizeLimitForGIFsInSharedAlbumsError
{
  return self->_simulateMaxFilesizeLimitForGIFsInSharedAlbumsError;
}

- (BOOL)simulateUserCloudNotAuthenticated
{
  return self->_simulateUserCloudNotAuthenticated;
}

- (BOOL)simulateLowDiskSpaceError
{
  return self->_simulateLowDiskSpaceError;
}

- (BOOL)simulateCPLNotReadyError
{
  return self->_simulateCPLNotReadyError;
}

- (BOOL)simulateDownloadFailure
{
  return self->_simulateDownloadFailure;
}

- (BOOL)simulateError
{
  return self->_simulateError;
}

- (BOOL)sendAssetURLsToMessages
{
  return self->_sendAssetURLsToMessages;
}

- (BOOL)forceAccessibilityDescriptionMetadataBaking
{
  return self->_forceAccessibilityDescriptionMetadataBaking;
}

- (BOOL)forceCaptionMetadataBaking
{
  return self->_forceCaptionMetadataBaking;
}

- (BOOL)forceLocationMetadataBaking
{
  return self->_forceLocationMetadataBaking;
}

- (BOOL)forceDateTimeMetadataBaking
{
  return self->_forceDateTimeMetadataBaking;
}

- (BOOL)disableMetadataCorrections
{
  return self->_disableMetadataCorrections;
}

- (int64_t)locationBakingComparisonStrategy
{
  return self->_locationBakingComparisonStrategy;
}

- (BOOL)allowFallbacksWhilePreparing
{
  return self->_allowFallbacksWhilePreparing;
}

- (BOOL)enableOneUpAnimation
{
  return self->_enableOneUpAnimation;
}

- (BOOL)enableNewActionContextMenu
{
  return self->_enableNewActionContextMenu;
}

- (unint64_t)confidentialityWarningsVersion
{
  return self->_confidentialityWarningsVersion;
}

- (BOOL)allowCopyingVideos
{
  return self->_allowCopyingVideos;
}

- (BOOL)showInternalGIFExport
{
  return self->_showInternalGIFExport;
}

- (unint64_t)maxMailPhotoLimit
{
  return self->_maxMailPhotoLimit;
}

- (unint64_t)maxMessagesAssetLimit
{
  return self->_maxMessagesAssetLimit;
}

- (BOOL)disableMailDrop
{
  return self->_disableMailDrop;
}

- (BOOL)showConfidentialityWarnings
{
  return self->_showConfidentialityWarnings;
}

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = [(PXSharingSettings *)self description];
  v5 = [v3 stringWithString:v4];

  BOOL v6 = [(PXSharingSettings *)self showConfidentialityWarnings];
  v7 = @"NO";
  if (v6) {
    v7 = @"YES";
  }
  v8 = v7;
  [v5 appendFormat:@"\n\tShow Confidentiality Warnings: %@", v8];

  objc_msgSend(v5, "appendFormat:", @"\n\tConfidentiality Warnings Version: %ld", -[PXSharingSettings confidentialityWarningsVersion](self, "confidentialityWarningsVersion"));
  return v5;
}

- (void)defaultValueDidChangeForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"confidentialityWarningsVersion"])
  {
    [(PXSharingSettings *)self setShowConfidentialityWarnings:1];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXSharingSettings;
    [(PXSettings *)&v5 defaultValueDidChangeForKey:v4];
  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (PXSharingSettings)sharedInstance
{
  if (sharedInstance_onceToken_156937 != -1) {
    dispatch_once(&sharedInstance_onceToken_156937, &__block_literal_global_156938);
  }
  v2 = (void *)sharedInstance_sharedInstance_156939;
  return (PXSharingSettings *)v2;
}

void __35__PXSharingSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 sharingSettings];
  v1 = (void *)sharedInstance_sharedInstance_156939;
  sharedInstance_sharedInstance_156939 = v0;
}

@end