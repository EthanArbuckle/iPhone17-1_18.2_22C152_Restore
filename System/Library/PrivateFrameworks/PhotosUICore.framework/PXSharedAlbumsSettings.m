@interface PXSharedAlbumsSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)activityEntryAllowsMultipleLikeContributors;
- (BOOL)activityEntryFeedAutoplaysVideosInline;
- (BOOL)activityEntryFeedCompactCellsOpen1upLimitedToEntryAssets;
- (BOOL)activityEntryFeedDrawDebugBackgrounds;
- (BOOL)activityEntryFeedFollowsReadableWidth;
- (BOOL)activityEntryFeedUseOnlyCompactCells;
- (BOOL)allowEmptyAddressesForDebugging;
- (BOOL)alwaysShowSpatialMediaDataLossAlertForSpatialMedia;
- (BOOL)lemonadeActivityShelfAlwaysAppearUnread;
- (BOOL)lemonadeActivityShelfAvatarAppearsAsOverlay;
- (BOOL)lemonadeActivityShelfPreventUpdatingUnreadState;
- (BOOL)lemonadeActivityShelfShouldOpenActivityFeedModallyByItself;
- (BOOL)lemonadeActivityShelfUseActivityEntries;
- (BOOL)shouldSimulateSharedAlbumsUnavailable;
- (BOOL)showParticipantCountBadges;
- (BOOL)simulateEmptyActivityEntries;
- (double)activityEntryFeedReadableWidth;
- (id)parentSettings;
- (int64_t)activityEntryAssetsAddedBatchingBehavior;
- (int64_t)activityEntryFeedCompactCellDisplayStyle;
- (int64_t)activityEntryFeedLoadMoreBatchSize;
- (int64_t)lemonadeActivityFeedMultipleAssetsBehavior;
- (int64_t)lemonadeActivityShelfPlaceholderBehavior;
- (int64_t)shelfBehavior;
- (int64_t)simulatedSubscriptionError;
- (void)setAllowEmptyAddressesForDebugging:(BOOL)a3;
- (void)setDefaultValues;
@end

@implementation PXSharedAlbumsSettings

- (int64_t)shelfBehavior
{
  return self->_shelfBehavior;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_35036 != -1) {
    dispatch_once(&sharedInstance_onceToken_35036, &__block_literal_global_35037);
  }
  v2 = (void *)sharedInstance_sharedInstance_35038;
  return v2;
}

- (int64_t)lemonadeActivityShelfPlaceholderBehavior
{
  return self->_lemonadeActivityShelfPlaceholderBehavior;
}

- (BOOL)shouldSimulateSharedAlbumsUnavailable
{
  return self->_shouldSimulateSharedAlbumsUnavailable;
}

void __40__PXSharedAlbumsSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 sharedAlbumsSettings];
  v1 = (void *)sharedInstance_sharedInstance_35038;
  sharedInstance_sharedInstance_35038 = v0;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedAlbumsSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_shouldSimulateSharedAlbumsUnavailable = 0;
  self->_activityEntryAllowsMultipleLikeContributors = 1;
  self->_activityEntryAssetsAddedBatchingBehavior = 2;
  self->_shelfBehavior = 1;
  self->_showParticipantCountBadges = 0;
  self->_lemonadeActivityShelfUseActivityEntries = 1;
  self->_lemonadeActivityShelfPlaceholderBehavior = 0;
  self->_lemonadeActivityShelfAlwaysAppearUnread = 0;
  self->_lemonadeActivityShelfAvatarAppearsAsOverlay = 1;
  self->_lemonadeActivityShelfPreventUpdatingUnreadState = 0;
  self->_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself = 0;
  self->_activityEntryFeedLoadMoreBatchSize = 75;
  self->_lemonadeActivityFeedMultipleAssetsBehavior = 1;
  self->_activityEntryFeedUseOnlyCompactCells = 0;
  self->_activityEntryFeedCompactCellDisplayStyle = 1;
  self->_activityEntryFeedAutoplaysVideosInline = 1;
  self->_activityEntryFeedCompactCellsOpen1upLimitedToEntryAssets = 1;
  self->_activityEntryFeedFollowsReadableWidth = 1;
  self->_activityEntryFeedReadableWidth = 800.0;
  self->_activityEntryFeedDrawDebugBackgrounds = 0;
  self->_allowEmptyAddressesForDebugging = 0;
  self->_alwaysShowSpatialMediaDataLossAlertForSpatialMedia = 0;
  self->_simulateEmptyActivityEntries = 0;
  self->_simulatedSubscriptionError = 0;
}

- (int64_t)simulatedSubscriptionError
{
  return self->_simulatedSubscriptionError;
}

- (BOOL)alwaysShowSpatialMediaDataLossAlertForSpatialMedia
{
  return self->_alwaysShowSpatialMediaDataLossAlertForSpatialMedia;
}

- (void)setAllowEmptyAddressesForDebugging:(BOOL)a3
{
  self->_allowEmptyAddressesForDebugging = a3;
}

- (BOOL)allowEmptyAddressesForDebugging
{
  return self->_allowEmptyAddressesForDebugging;
}

- (BOOL)simulateEmptyActivityEntries
{
  return self->_simulateEmptyActivityEntries;
}

- (BOOL)activityEntryFeedDrawDebugBackgrounds
{
  return self->_activityEntryFeedDrawDebugBackgrounds;
}

- (double)activityEntryFeedReadableWidth
{
  return self->_activityEntryFeedReadableWidth;
}

- (BOOL)activityEntryFeedFollowsReadableWidth
{
  return self->_activityEntryFeedFollowsReadableWidth;
}

- (BOOL)activityEntryFeedCompactCellsOpen1upLimitedToEntryAssets
{
  return self->_activityEntryFeedCompactCellsOpen1upLimitedToEntryAssets;
}

- (BOOL)activityEntryFeedAutoplaysVideosInline
{
  return self->_activityEntryFeedAutoplaysVideosInline;
}

- (int64_t)activityEntryFeedCompactCellDisplayStyle
{
  return self->_activityEntryFeedCompactCellDisplayStyle;
}

- (BOOL)activityEntryFeedUseOnlyCompactCells
{
  return self->_activityEntryFeedUseOnlyCompactCells;
}

- (int64_t)lemonadeActivityFeedMultipleAssetsBehavior
{
  return self->_lemonadeActivityFeedMultipleAssetsBehavior;
}

- (int64_t)activityEntryFeedLoadMoreBatchSize
{
  return self->_activityEntryFeedLoadMoreBatchSize;
}

- (BOOL)lemonadeActivityShelfShouldOpenActivityFeedModallyByItself
{
  return self->_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself;
}

- (BOOL)lemonadeActivityShelfPreventUpdatingUnreadState
{
  return self->_lemonadeActivityShelfPreventUpdatingUnreadState;
}

- (BOOL)lemonadeActivityShelfAvatarAppearsAsOverlay
{
  return self->_lemonadeActivityShelfAvatarAppearsAsOverlay;
}

- (BOOL)lemonadeActivityShelfAlwaysAppearUnread
{
  return self->_lemonadeActivityShelfAlwaysAppearUnread;
}

- (BOOL)lemonadeActivityShelfUseActivityEntries
{
  return self->_lemonadeActivityShelfUseActivityEntries;
}

- (BOOL)showParticipantCountBadges
{
  return self->_showParticipantCountBadges;
}

- (int64_t)activityEntryAssetsAddedBatchingBehavior
{
  return self->_activityEntryAssetsAddedBatchingBehavior;
}

- (BOOL)activityEntryAllowsMultipleLikeContributors
{
  return self->_activityEntryAllowsMultipleLikeContributors;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v139[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v4 = (void *)MEMORY[0x1E4F941F0];
  v5 = NSStringFromSelector(sel_shouldSimulateSharedAlbumsUnavailable);
  v6 = [v4 rowWithTitle:@"Simulate Disabled" valueKeyPath:v5];
  v139[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:1];
  v8 = [v3 sectionWithRows:v7 title:@"General"];
  [v2 addObject:v8];

  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F941F0];
  v11 = NSStringFromSelector(sel_activityEntryAllowsMultipleLikeContributors);
  v12 = [v10 rowWithTitle:@"Allow multiple contributors for Like entries" valueKeyPath:v11];
  v138[0] = v12;
  v13 = (void *)MEMORY[0x1E4F94108];
  v14 = NSStringFromSelector(sel_activityEntryAssetsAddedBatchingBehavior);
  v15 = [v13 rowWithTitle:@"Assets Batch Behavior" valueKeyPath:v14];
  v16 = [v15 possibleValues:&unk_1F02D35E0 titles:&unk_1F02D35F8];
  v138[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
  v18 = [v9 sectionWithRows:v17 title:@"Shared Albums Activity"];
  v130 = v2;
  [v2 addObject:v18];

  v19 = (void *)MEMORY[0x1E4F94160];
  v20 = (void *)MEMORY[0x1E4F94108];
  v21 = NSStringFromSelector(sel_shelfBehavior);
  v22 = [v20 rowWithTitle:@"Appearance" valueKeyPath:v21];
  v23 = [v22 possibleValues:&unk_1F02D3610 titles:&unk_1F02D3628];
  v137[0] = v23;
  v24 = (void *)MEMORY[0x1E4F941F0];
  v25 = NSStringFromSelector(sel_showParticipantCountBadges);
  v26 = [v24 rowWithTitle:@"Participant count badges" valueKeyPath:v25];
  v137[1] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:2];
  v28 = [v19 sectionWithRows:v27 title:@"Lemonade Shelf"];
  [v2 addObject:v28];

  v114 = (void *)MEMORY[0x1E4F94160];
  v29 = (void *)MEMORY[0x1E4F941F0];
  v128 = NSStringFromSelector(sel_lemonadeActivityShelfUseActivityEntries);
  v126 = [v29 rowWithTitle:@"Modern Activities" valueKeyPath:v128];
  v136[0] = v126;
  v30 = (void *)MEMORY[0x1E4F941F0];
  v124 = NSStringFromSelector(sel_lemonadeActivityShelfAlwaysAppearUnread);
  v122 = [v30 rowWithTitle:@"Always Appear Unread" valueKeyPath:v124];
  v136[1] = v122;
  v31 = (void *)MEMORY[0x1E4F941F0];
  v120 = NSStringFromSelector(sel_lemonadeActivityShelfAvatarAppearsAsOverlay);
  v118 = [v31 rowWithTitle:@"Overlay Avatar over Image" valueKeyPath:v120];
  v136[2] = v118;
  v32 = (void *)MEMORY[0x1E4F941F0];
  v116 = NSStringFromSelector(sel_lemonadeActivityShelfPreventUpdatingUnreadState);
  v112 = [v32 rowWithTitle:@"Don't Update Unread When Seen" valueKeyPath:v116];
  v136[3] = v112;
  v33 = (void *)MEMORY[0x1E4F940F8];
  v110 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_538];
  v108 = [v33 rowWithTitle:@"Force ☁️🔁 Unread to yesterday" action:v110];
  v106 = [v108 conditionFormat:@"lemonadeActivityShelfPreventUpdatingUnreadState == 0"];
  v136[4] = v106;
  v34 = (void *)MEMORY[0x1E4F940F8];
  v35 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_542];
  v36 = [v34 rowWithTitle:@"Force ☁️🔁 Unread to some activities" action:v35];
  v37 = [v36 conditionFormat:@"lemonadeActivityShelfPreventUpdatingUnreadState == 0"];
  v136[5] = v37;
  v38 = (void *)MEMORY[0x1E4F94108];
  v39 = NSStringFromSelector(sel_lemonadeActivityShelfPlaceholderBehavior);
  v40 = [v38 rowWithTitle:@"Placeholders" valueKeyPath:v39];
  v41 = [v40 possibleValues:&unk_1F02D3640 titles:&unk_1F02D3658];
  v136[6] = v41;
  v42 = (void *)MEMORY[0x1E4F941F0];
  v43 = NSStringFromSelector(sel_lemonadeActivityShelfShouldOpenActivityFeedModallyByItself);
  v44 = [v42 rowWithTitle:@"Open Activity Feed Alone" valueKeyPath:v43];
  v136[7] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:8];
  v46 = [v114 sectionWithRows:v45 title:@"Lemonade Shelf"];
  [v130 addObject:v46];

  v47 = (void *)MEMORY[0x1E4F94160];
  v48 = (void *)MEMORY[0x1E4F941D8];
  v129 = NSStringFromSelector(sel_activityEntryFeedLoadMoreBatchSize);
  v127 = [v48 rowWithTitle:@"Fetch Batch Size" valueKeyPath:v129];
  v125 = [v127 minValue:4.0 maxValue:200.0];
  v135[0] = v125;
  v49 = (void *)MEMORY[0x1E4F94108];
  v123 = NSStringFromSelector(sel_lemonadeActivityFeedMultipleAssetsBehavior);
  v121 = [v49 rowWithTitle:@"Show Multiple Photos as" valueKeyPath:v123];
  v119 = [v121 possibleValues:&unk_1F02D3670 titles:&unk_1F02D3688];
  v135[1] = v119;
  v50 = (void *)MEMORY[0x1E4F941F0];
  v117 = NSStringFromSelector(sel_activityEntryFeedUseOnlyCompactCells);
  v115 = [v50 rowWithTitle:@"All Compact Cells" valueKeyPath:v117];
  v135[2] = v115;
  v51 = (void *)MEMORY[0x1E4F94108];
  v113 = NSStringFromSelector(sel_activityEntryFeedCompactCellDisplayStyle);
  v111 = [v51 rowWithTitle:@"Compact Cell Style" valueKeyPath:v113];
  v109 = [v111 possibleValues:&unk_1F02D36A0 titles:&unk_1F02D36B8];
  v135[3] = v109;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v107 = NSStringFromSelector(sel_activityEntryFeedAutoplaysVideosInline);
  v105 = [v52 rowWithTitle:@"Auto Plays Videos" valueKeyPath:v107];
  v135[4] = v105;
  v53 = (void *)MEMORY[0x1E4F941F0];
  v104 = NSStringFromSelector(sel_activityEntryFeedCompactCellsOpen1upLimitedToEntryAssets);
  v103 = [v53 rowWithTitle:@"(Compact Cells) Limit 1up to Entry-only Assets" valueKeyPath:v104];
  v135[5] = v103;
  v54 = (void *)MEMORY[0x1E4F941F0];
  v55 = NSStringFromSelector(sel_activityEntryFeedFollowsReadableWidth);
  v56 = [v54 rowWithTitle:@"Pad Readable Width" valueKeyPath:v55];
  v135[6] = v56;
  v57 = (void *)MEMORY[0x1E4F941D8];
  v58 = NSStringFromSelector(sel_activityEntryFeedReadableWidth);
  v59 = [v57 rowWithTitle:@" -> Width" valueKeyPath:v58];
  v60 = [v59 minValue:0.0 maxValue:1200.0];
  v61 = [v60 conditionFormat:@"activityEntryFeedFollowsReadableWidth != 0"];
  v135[7] = v61;
  v62 = (void *)MEMORY[0x1E4F941F0];
  v63 = NSStringFromSelector(sel_activityEntryFeedDrawDebugBackgrounds);
  v64 = [v62 rowWithTitle:@"Debug Backgrounds" valueKeyPath:v63];
  v135[8] = v64;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:9];
  v66 = [v47 sectionWithRows:v65 title:@"Main Activity Feed"];
  [v130 addObject:v66];

  v67 = (void *)MEMORY[0x1E4F94160];
  v68 = (void *)MEMORY[0x1E4F941F0];
  v69 = NSStringFromSelector(sel_simulateEmptyActivityEntries);
  v70 = [v68 rowWithTitle:@"Simulate empty activities" valueKeyPath:v69];
  v134 = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1];
  v72 = [v67 sectionWithRows:v71 title:@"Activities"];
  [v130 addObject:v72];

  v73 = (void *)MEMORY[0x1E4F94160];
  v74 = (void *)MEMORY[0x1E4F941F0];
  v75 = NSStringFromSelector(sel_alwaysShowSpatialMediaDataLossAlertForSpatialMedia);
  v76 = [v74 rowWithTitle:@"Always Show Spatial Media Data Loss Alert" valueKeyPath:v75];
  v133[0] = v76;
  v77 = (void *)MEMORY[0x1E4F940F8];
  v78 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_546];
  v79 = [v77 rowWithTitle:@"Reset Spatial Media Data Loss Alert Pref" action:v78];
  v133[1] = v79;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:2];
  v81 = [v73 sectionWithRows:v80 title:@"Posting UI"];
  [v130 addObject:v81];

  v82 = (void *)MEMORY[0x1E4F94160];
  v83 = (void *)MEMORY[0x1E4F94108];
  v84 = NSStringFromSelector(sel_simulatedSubscriptionError);
  v85 = [v83 rowWithTitle:@"Subscription Error" valueKeyPath:v84];
  v86 = [v85 possibleValues:&unk_1F02D36D0 titles:&unk_1F02D36E8];
  v132[0] = v86;
  v87 = (void *)MEMORY[0x1E4F941F0];
  v88 = NSStringFromSelector(sel_allowEmptyAddressesForDebugging);
  v89 = [v87 rowWithTitle:@"Allow Empty Addresses For Debugging" valueKeyPath:v88];
  v132[1] = v89;
  v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
  v91 = [v82 sectionWithRows:v90 title:@"Error Simulation"];
  [v130 addObject:v91];

  v92 = (void *)MEMORY[0x1E4F94160];
  v93 = (void *)MEMORY[0x1E4F940F8];
  v94 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_548];
  v95 = [v93 rowWithTitle:@"Activity Prototype" action:v94];
  v131[0] = v95;
  v96 = (void *)MEMORY[0x1E4F940F8];
  v97 = [MEMORY[0x1E4F94170] action];
  v98 = [v96 rowWithTitle:@"Restore Defaults Settings" action:v97];
  v131[1] = v98;
  v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:2];
  v100 = [v92 sectionWithRows:v99];
  [v130 addObject:v100];

  v101 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Shared Albums" contents:v130];

  return v101;
}

@end