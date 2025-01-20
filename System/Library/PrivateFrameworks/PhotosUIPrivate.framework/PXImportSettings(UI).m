@interface PXImportSettings(UI)
+ (id)settingsControllerModule;
@end

@implementation PXImportSettings(UI)

+ (id)settingsControllerModule
{
  v121[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F941A8];
  v1 = (void *)MEMORY[0x1E4F941C0];
  v2 = NSStringFromSelector(sel_importSourceSimulationViaDiagnosticsEnabled);
  v3 = [v1 rowWithTitle:@"Simulate Import Source via Diagnostics" valueKeyPath:v2];
  v121[0] = v3;
  v4 = (void *)MEMORY[0x1E4F941C0];
  v5 = NSStringFromSelector(sel_simulateEmptyImportSource);
  v6 = [v4 rowWithTitle:@"Simulate Empty Source" valueKeyPath:v5];
  v121[1] = v6;
  v7 = (void *)MEMORY[0x1E4F941C0];
  v8 = NSStringFromSelector(sel_showImportItemFilenames);
  v9 = [v7 rowWithTitle:@"Show Filenames" valueKeyPath:v8];
  v121[2] = v9;
  v10 = (void *)MEMORY[0x1E4F941C0];
  v11 = NSStringFromSelector(sel_loadActualThumbnails);
  v12 = [v10 rowWithTitle:@"Load Actual Thumbnails" valueKeyPath:v11];
  v121[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:4];
  v113 = [v0 sectionWithRows:v13 title:@"General"];

  v111 = (void *)MEMORY[0x1E4F941A8];
  v14 = (void *)MEMORY[0x1E4F941C0];
  v108 = NSStringFromSelector(sel_interactive1upPresentationEnabled);
  v104 = [v14 rowWithTitle:@"Interactive 1up gesture" valueKeyPath:v108];
  v120[0] = v104;
  v15 = (void *)MEMORY[0x1E4F941C0];
  v100 = NSStringFromSelector(sel_lazyLoadAllAssets);
  v96 = [v15 rowWithTitle:@"Lazy Load Thumbnails" valueKeyPath:v100];
  v120[1] = v96;
  v16 = (void *)MEMORY[0x1E4F941C0];
  v94 = NSStringFromSelector(sel_groupItemsByEXIFDate);
  v92 = [v16 rowWithTitle:@"Group Items by EXIF Date" valueKeyPath:v94];
  v120[2] = v92;
  v17 = (void *)MEMORY[0x1E4F941C0];
  v90 = NSStringFromSelector(sel_showNewestItemsInGridUntilScrolled);
  v88 = [v17 rowWithTitle:@"Show Newest Items First" valueKeyPath:v90];
  v120[3] = v88;
  v18 = (void *)MEMORY[0x1E4F94108];
  v87 = NSStringFromSelector(sel_alreadyImportedTruncationMode);
  v86 = [v18 rowWithTitle:@"Already-Imported Truncation Mode" valueKeyPath:v87];
  v85 = [v86 possibleValues:&unk_1F078B828 titles:&unk_1F078B840];
  v120[4] = v85;
  v19 = (void *)MEMORY[0x1E4F94108];
  v20 = NSStringFromSelector(sel_assetEnumerationBehavior);
  v21 = [v19 rowWithTitle:@"Asset Load Behavior (Default: Interval)" valueKeyPath:v20];
  v22 = [v21 possibleValues:&unk_1F078B858 titles:&unk_1F078B870];
  v120[5] = v22;
  v23 = (void *)MEMORY[0x1E4F941D8];
  v24 = NSStringFromSelector(sel_assetEnumerationBatchInterval);
  v25 = [v23 rowWithTitle:@"Load Interval (Default: 0.25)" valueKeyPath:v24];
  v26 = [v25 minValue:0.1 maxValue:3.0];
  v120[6] = v26;
  v27 = (void *)MEMORY[0x1E4F941D8];
  v28 = NSStringFromSelector(sel_assetEnumerationBatchSize);
  v29 = [v27 rowWithTitle:@"Load Size (Integer) (Default: 10)" valueKeyPath:v28];
  v30 = [v29 minValue:1.0 maxValue:50.0];
  v120[7] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:8];
  v112 = [v111 sectionWithRows:v31 title:@"Import Grid"];

  v109 = (void *)MEMORY[0x1E4F941A8];
  v32 = (void *)MEMORY[0x1E4F941C0];
  v105 = NSStringFromSelector(sel_usePhotosOneUp);
  v101 = [v32 rowWithTitle:@"Use Main Photos 1-Up" valueKeyPath:v105];
  v119[0] = v101;
  v33 = (void *)MEMORY[0x1E4F941C0];
  v97 = NSStringFromSelector(sel_hide1UpToolbarAndMarginsForCollapsedAlreadyImportedItem);
  v34 = [v33 rowWithTitle:@"Remove 1-up toolbar & margins for single, unselectable imported item", v97 valueKeyPath];
  v119[1] = v34;
  v35 = (void *)MEMORY[0x1E4F941C0];
  v36 = NSStringFromSelector(sel_longPressForOneUpInCompactMode);
  v37 = [v35 rowWithTitle:@"Require long press to enter 1-up in compact modes" valueKeyPath:v36];
  v119[2] = v37;
  v38 = (void *)MEMORY[0x1E4F941C0];
  v39 = NSStringFromSelector(sel_longPressForOneUpInPadSpec);
  v40 = [v38 rowWithTitle:@"Require long press to enter 1-up on non-compact modes" valueKeyPath:v39];
  v119[3] = v40;
  v41 = (void *)MEMORY[0x1E4F941C0];
  v42 = NSStringFromSelector(sel_useThumbnailSizesAsImageSizeHints);
  v43 = [v41 rowWithTitle:@"Use thumbnail images as 1-up image size hints" valueKeyPath:v42];
  v119[4] = v43;
  v44 = (void *)MEMORY[0x1E4F941C0];
  v45 = NSStringFromSelector(sel_loadRetinaThumbnails);
  v46 = [v44 rowWithTitle:@"Load retina thumbnails" valueKeyPath:v45];
  v119[5] = v46;
  v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:6];
  v110 = [v109 sectionWithRows:v47 title:@"Import 1-UP"];

  v106 = (void *)MEMORY[0x1E4F941A8];
  v48 = (void *)MEMORY[0x1E4F941C0];
  v102 = NSStringFromSelector(sel_disableAssetDeletion);
  v98 = [v48 rowWithTitle:@"Simulate Asset Deletions" valueKeyPath:v102];
  v118[0] = v98;
  v49 = (void *)MEMORY[0x1E4F94108];
  v95 = NSStringFromSelector(sel_simulatedBatteryLevel);
  v93 = [v49 rowWithTitle:@"Simulated Battery Level for Import" valueKeyPath:v95];
  v91 = [v93 possibleValues:&unk_1F078B888 titles:&unk_1F078B8A0];
  v118[1] = v91;
  v50 = (void *)MEMORY[0x1E4F941B8];
  v89 = NSStringFromSelector(sel_delayBeforeShowingPreparationAlert);
  v51 = [v50 rowWithTitle:@"Delay before preparation alert" valueKeyPath:v89];
  v52 = [v51 minValue:0.0 maxValue:5.0];
  v118[2] = v52;
  v53 = (void *)MEMORY[0x1E4F941C0];
  v54 = NSStringFromSelector(sel_simulateLongDiskSpacePreparation);
  v55 = [v53 rowWithTitle:@"Always show import preparation spinner" valueKeyPath:v54];
  v118[3] = v55;
  v56 = (void *)MEMORY[0x1E4F94108];
  v57 = NSStringFromSelector(sel_simulatedDiskSpace);
  v58 = [v56 rowWithTitle:@"Simulated Disk Space Availability" valueKeyPath:v57];
  v59 = [v58 possibleValues:&unk_1F078B8B8 titles:&unk_1F078B8D0];
  v118[4] = v59;
  v60 = (void *)MEMORY[0x1E4F941C0];
  v61 = NSStringFromSelector(sel_showProgressTitles);
  v62 = [v60 rowWithTitle:@"Show Progress In Titles" valueKeyPath:v61];
  v118[5] = v62;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v118 count:6];
  v107 = [v106 sectionWithRows:v63 title:@"Actions"];

  v64 = (void *)MEMORY[0x1E4F941A8];
  v65 = (void *)MEMORY[0x1E4F941C0];
  v66 = NSStringFromSelector(sel_externalOneUpForceEnable);
  v67 = [v65 rowWithTitle:@"Force Enable" valueKeyPath:v66];
  v117[0] = v67;
  v68 = (void *)MEMORY[0x1E4F941C0];
  v69 = NSStringFromSelector(sel_externalOneUpSimulateDeletionFailure);
  v70 = [v68 rowWithTitle:@"Simulate Deletion Failure" valueKeyPath:v69];
  v117[1] = v70;
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
  v99 = [v64 sectionWithRows:v71 title:@"Camera External 1-Up"];

  v103 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Show Debug Import History Grid", &__block_literal_global_102756);
  v72 = (void *)MEMORY[0x1E4F94160];
  v116 = v103;
  v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
  v74 = [v72 sectionWithRows:v73 title:@"Import History"];

  v75 = (void *)MEMORY[0x1E4F94160];
  v76 = (void *)MEMORY[0x1E4F940F8];
  v77 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v78 = [v76 rowWithTitle:@"Restore Defaults" action:v77];
  v115 = v78;
  v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  v80 = [v75 sectionWithRows:v79];

  v81 = (void *)MEMORY[0x1E4F94160];
  v114[0] = v113;
  v114[1] = v112;
  v114[2] = v110;
  v114[3] = v107;
  v114[4] = v74;
  v114[5] = v99;
  v114[6] = v80;
  v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v114 count:7];
  v83 = [v81 moduleWithTitle:@"Import" contents:v82];

  return v83;
}

@end