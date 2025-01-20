@interface PXMemoriesRelatedSettings
+ (BOOL)isAssetCountAcceptableForMemoryLensPlayback:(int64_t)a3;
+ (BOOL)isAssetCountAcceptableForMemoryPlayback:(int64_t)a3;
+ (id)schedulerOptionsFromTimelineSchedulerMode:(unint64_t)a3;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (void)_generateQuestionsWithOptions:(int64_t)a3 count:(unint64_t)a4 inModuleController:(id)a5;
+ (void)_presentAlertForMemoriesGenerationResult:(id)a3 error:(id)a4 inModuleController:(id)a5;
+ (void)_presentAlertWithTitle:(id)a3 andMessage:(id)a4 inModuleController:(id)a5;
- (BOOL)enableDiscoveryFeed;
- (BOOL)enableIPadWideHeader;
- (BOOL)enableMemoriesLivingOnFeedback;
- (BOOL)fakePeopleProximity;
- (BOOL)includeChillMixInMusicForYou;
- (BOOL)includeGetUpMixInMusicForYou;
- (BOOL)recoverBlacklistedMemories;
- (BOOL)showLocalMemories;
- (BOOL)showMemoryTitleLayer;
- (BOOL)useOnlyMusicForTopicInTopPickSuggestions;
- (double)refreshPhotoKitTimeout;
- (double)widgetRefreshTimeInterval;
- (id)parentSettings;
- (int64_t)minimumNumberOfCuratedAssetsForInterestingMoments;
- (int64_t)minimumNumberOfCuratedAssetsForMemories;
- (int64_t)minimumNumberOfCuratedAssetsForMovieHeader;
- (int64_t)subtitleFontSize;
- (unint64_t)deleteBehavior;
- (unint64_t)discoveryRankingMode;
- (unint64_t)timelineContentMode;
- (unint64_t)timelineSchedulerMode;
- (unint64_t)widgetSize;
- (void)performPostSaveActions;
- (void)setDefaultValues;
- (void)setDeleteBehavior:(unint64_t)a3;
- (void)setDiscoveryRankingMode:(unint64_t)a3;
- (void)setEnableDiscoveryFeed:(BOOL)a3;
- (void)setEnableIPadWideHeader:(BOOL)a3;
- (void)setEnableMemoriesLivingOnFeedback:(BOOL)a3;
- (void)setFakePeopleProximity:(BOOL)a3;
- (void)setIncludeChillMixInMusicForYou:(BOOL)a3;
- (void)setIncludeGetUpMixInMusicForYou:(BOOL)a3;
- (void)setMinimumNumberOfCuratedAssetsForInterestingMoments:(int64_t)a3;
- (void)setMinimumNumberOfCuratedAssetsForMemories:(int64_t)a3;
- (void)setMinimumNumberOfCuratedAssetsForMovieHeader:(int64_t)a3;
- (void)setRecoverBlacklistedMemories:(BOOL)a3;
- (void)setRefreshPhotoKitTimeout:(double)a3;
- (void)setShowLocalMemories:(BOOL)a3;
- (void)setShowMemoryTitleLayer:(BOOL)a3;
- (void)setSubtitleFontSize:(int64_t)a3;
- (void)setTimelineContentMode:(unint64_t)a3;
- (void)setTimelineSchedulerMode:(unint64_t)a3;
- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3;
- (void)setWidgetRefreshTimeInterval:(double)a3;
- (void)setWidgetSize:(unint64_t)a3;
@end

@implementation PXMemoriesRelatedSettings

- (void)setDefaultValues
{
  v17.receiver = self;
  v17.super_class = (Class)PXMemoriesRelatedSettings;
  [(PTSettings *)&v17 setDefaultValues];
  int HasInternalUI = PFOSVariantHasInternalUI();
  [(PXMemoriesRelatedSettings *)self setFakePeopleProximity:0];
  [(PXMemoriesRelatedSettings *)self setShowLocalMemories:0];
  [(PXMemoriesRelatedSettings *)self setUseOnlyMusicForTopicInTopPickSuggestions:0];
  [(PXMemoriesRelatedSettings *)self setIncludeChillMixInMusicForYou:0];
  [(PXMemoriesRelatedSettings *)self setIncludeGetUpMixInMusicForYou:0];
  [(PXMemoriesRelatedSettings *)self setRefreshPhotoKitTimeout:3.0];
  [(PXMemoriesRelatedSettings *)self setWidgetRefreshTimeInterval:900.0];
  if (HasInternalUI)
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 persistentDomainForName:*MEMORY[0x1E4F283E0]];
    v6 = (void *)[v5 mutableCopy];

    v7 = [v6 valueForKey:@"PGMinimumNumberOfCuratedAssetsForMemories"];
    uint64_t v8 = [v7 integerValue];

    v9 = [v6 valueForKey:@"PGMinimumNumberOfCuratedAssetsForInterestingMoments"];
    uint64_t v10 = [v9 integerValue];

    [(PXMemoriesRelatedSettings *)self setMinimumNumberOfCuratedAssetsForMemories:v8];
    [(PXMemoriesRelatedSettings *)self setMinimumNumberOfCuratedAssetsForInterestingMoments:v10];
    v11 = [v6 valueForKey:@"PXMemoriesLivingOnFeedbackUIEnabled"];
    v12 = v11;
    if (v11) {
      uint64_t v13 = [v11 BOOLValue];
    }
    else {
      uint64_t v13 = 1;
    }
    [(PXMemoriesRelatedSettings *)self setEnableMemoriesLivingOnFeedback:v13];
    v14 = [v6 valueForKey:@"PXTimelineSchedulerMode"];
    v15 = v14;
    if (v14) {
      uint64_t v16 = [v14 unsignedIntegerValue];
    }
    else {
      uint64_t v16 = 0;
    }
    [(PXMemoriesRelatedSettings *)self setTimelineSchedulerMode:v16];
  }
  [(PXMemoriesRelatedSettings *)self setTimelineContentMode:0];
  [(PXMemoriesRelatedSettings *)self setWidgetSize:0];
  [(PXMemoriesRelatedSettings *)self setMinimumNumberOfCuratedAssetsForMovieHeader:5];
  [(PXMemoriesRelatedSettings *)self setDeleteBehavior:0];
  [(PXMemoriesRelatedSettings *)self setRecoverBlacklistedMemories:0];
  [(PXMemoriesRelatedSettings *)self setShowMemoryTitleLayer:0];
  [(PXMemoriesRelatedSettings *)self setEnableIPadWideHeader:0];
  [(PXMemoriesRelatedSettings *)self setEnableDiscoveryFeed:0];
  [(PXMemoriesRelatedSettings *)self setDiscoveryRankingMode:0];
  [(PXMemoriesRelatedSettings *)self setSubtitleFontSize:20];
}

- (void)setWidgetSize:(unint64_t)a3
{
  self->_widgetSize = a3;
}

- (void)setWidgetRefreshTimeInterval:(double)a3
{
  self->_widgetRefreshTimeInterval = a3;
}

- (void)setUseOnlyMusicForTopicInTopPickSuggestions:(BOOL)a3
{
  self->_useOnlyMusicForTopicInTopPickSuggestions = a3;
}

- (void)setTimelineSchedulerMode:(unint64_t)a3
{
  self->_timelineSchedulerMode = a3;
}

- (void)setTimelineContentMode:(unint64_t)a3
{
  self->_timelineContentMode = a3;
}

- (void)setSubtitleFontSize:(int64_t)a3
{
  self->_subtitleFontSize = a3;
}

- (void)setShowMemoryTitleLayer:(BOOL)a3
{
  self->_showMemoryTitleLayer = a3;
}

- (void)setShowLocalMemories:(BOOL)a3
{
  self->_showLocalMemories = a3;
}

- (void)setRefreshPhotoKitTimeout:(double)a3
{
  self->_refreshPhotoKitTimeout = a3;
}

- (void)setRecoverBlacklistedMemories:(BOOL)a3
{
  self->_recoverBlacklistedMemories = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForMovieHeader:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForMovieHeader = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForMemories:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForMemories = a3;
}

- (void)setMinimumNumberOfCuratedAssetsForInterestingMoments:(int64_t)a3
{
  self->_minimumNumberOfCuratedAssetsForInterestingMoments = a3;
}

- (void)setIncludeGetUpMixInMusicForYou:(BOOL)a3
{
  self->_includeGetUpMixInMusicForYou = a3;
}

- (void)setIncludeChillMixInMusicForYou:(BOOL)a3
{
  self->_includeChillMixInMusicForYou = a3;
}

- (void)setFakePeopleProximity:(BOOL)a3
{
  self->_fakePeopleProximity = a3;
}

- (void)setEnableMemoriesLivingOnFeedback:(BOOL)a3
{
  self->_enableMemoriesLivingOnFeedback = a3;
}

- (void)setEnableIPadWideHeader:(BOOL)a3
{
  self->_enableIPadWideHeader = a3;
}

- (void)setEnableDiscoveryFeed:(BOOL)a3
{
  self->_enableDiscoveryFeed = a3;
}

- (void)setDiscoveryRankingMode:(unint64_t)a3
{
  self->_discoveryRankingMode = a3;
}

- (void)setDeleteBehavior:(unint64_t)a3
{
  self->_deleteBehavior = a3;
}

- (unint64_t)discoveryRankingMode
{
  return self->_discoveryRankingMode;
}

- (BOOL)enableDiscoveryFeed
{
  return self->_enableDiscoveryFeed;
}

- (unint64_t)timelineSchedulerMode
{
  return self->_timelineSchedulerMode;
}

- (unint64_t)widgetSize
{
  return self->_widgetSize;
}

- (unint64_t)timelineContentMode
{
  return self->_timelineContentMode;
}

- (int64_t)subtitleFontSize
{
  return self->_subtitleFontSize;
}

- (BOOL)enableIPadWideHeader
{
  return self->_enableIPadWideHeader;
}

- (BOOL)showMemoryTitleLayer
{
  return self->_showMemoryTitleLayer;
}

- (BOOL)recoverBlacklistedMemories
{
  return self->_recoverBlacklistedMemories;
}

- (unint64_t)deleteBehavior
{
  return self->_deleteBehavior;
}

- (int64_t)minimumNumberOfCuratedAssetsForMovieHeader
{
  return self->_minimumNumberOfCuratedAssetsForMovieHeader;
}

- (int64_t)minimumNumberOfCuratedAssetsForMemories
{
  return self->_minimumNumberOfCuratedAssetsForMemories;
}

- (int64_t)minimumNumberOfCuratedAssetsForInterestingMoments
{
  return self->_minimumNumberOfCuratedAssetsForInterestingMoments;
}

- (double)widgetRefreshTimeInterval
{
  return self->_widgetRefreshTimeInterval;
}

- (double)refreshPhotoKitTimeout
{
  return self->_refreshPhotoKitTimeout;
}

- (BOOL)includeGetUpMixInMusicForYou
{
  return self->_includeGetUpMixInMusicForYou;
}

- (BOOL)includeChillMixInMusicForYou
{
  return self->_includeChillMixInMusicForYou;
}

- (BOOL)useOnlyMusicForTopicInTopPickSuggestions
{
  return self->_useOnlyMusicForTopicInTopPickSuggestions;
}

- (BOOL)showLocalMemories
{
  return self->_showLocalMemories;
}

- (BOOL)fakePeopleProximity
{
  return self->_fakePeopleProximity;
}

- (BOOL)enableMemoriesLivingOnFeedback
{
  return self->_enableMemoriesLivingOnFeedback;
}

- (void)performPostSaveActions
{
  v21.receiver = self;
  v21.super_class = (Class)PXMemoriesRelatedSettings;
  [(PXSettings *)&v21 performPostSaveActions];
  if (PFOSVariantHasInternalUI())
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 synchronize];
    uint64_t v4 = *MEMORY[0x1E4F283E0];
    v5 = [v3 persistentDomainForName:*MEMORY[0x1E4F283E0]];
    v6 = (void *)[v5 mutableCopy];

    if (!v6)
    {
      v6 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    int64_t v7 = [(PXMemoriesRelatedSettings *)self minimumNumberOfCuratedAssetsForMemories];
    int64_t v8 = [(PXMemoriesRelatedSettings *)self minimumNumberOfCuratedAssetsForInterestingMoments];
    v9 = [v6 valueForKey:@"PGMinimumNumberOfCuratedAssetsForMemories"];
    uint64_t v10 = [v9 integerValue];

    BOOL v11 = v7 == v10;
    BOOL v12 = v7 != v10;
    if (!v11)
    {
      if (v7)
      {
        uint64_t v13 = [NSNumber numberWithInteger:v7];
        [v6 setObject:v13 forKey:@"PGMinimumNumberOfCuratedAssetsForMemories"];
      }
      else
      {
        [v6 removeObjectForKey:@"PGMinimumNumberOfCuratedAssetsForMemories"];
      }
    }
    v14 = [v6 valueForKey:@"PGMinimumNumberOfCuratedAssetsForInterestingMoments"];
    uint64_t v15 = [v14 integerValue];

    if (v8 != v15)
    {
      if (v8)
      {
        uint64_t v16 = [NSNumber numberWithInteger:v8];
        [v6 setObject:v16 forKey:@"PGMinimumNumberOfCuratedAssetsForInterestingMoments"];
      }
      else
      {
        [v6 removeObjectForKey:@"PGMinimumNumberOfCuratedAssetsForInterestingMoments"];
      }
      BOOL v12 = 1;
    }
    unint64_t v17 = [(PXMemoriesRelatedSettings *)self timelineSchedulerMode];
    v18 = [v6 valueForKey:@"PXTimelineSchedulerMode"];
    v19 = v18;
    if (v17)
    {
      if (v17 != [v18 unsignedIntegerValue])
      {
        v20 = [NSNumber numberWithUnsignedInteger:v17];
        [v6 setObject:v20 forKey:@"PXTimelineSchedulerMode"];

        goto LABEL_19;
      }
    }
    else if (v18)
    {
      [v6 removeObjectForKey:@"PXTimelineSchedulerMode"];
      goto LABEL_19;
    }
    if (!v12)
    {
LABEL_20:

      return;
    }
LABEL_19:
    [v3 setPersistentDomain:v6 forName:v4];
    goto LABEL_20;
  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (BOOL)isAssetCountAcceptableForMemoryLensPlayback:(int64_t)a3
{
  uint64_t v4 = +[PXLemonadeSettings sharedInstance];
  if ([v4 minimumNumberOfAssetsForPlaybackAsMemory] <= a3)
  {
    v6 = +[PXLemonadeSettings sharedInstance];
    BOOL v5 = [v6 maximumNumberOfAssetsForPlaybackAsMemory] >= a3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)isAssetCountAcceptableForMemoryPlayback:(int64_t)a3
{
  uint64_t v4 = +[PXMemoriesRelatedSettings sharedInstance];
  BOOL v6 = [v4 minimumNumberOfCuratedAssetsForMovieHeader] <= a3 && *MEMORY[0x1E4F398C8] >= a3;

  return v6;
}

+ (id)schedulerOptionsFromTimelineSchedulerMode:(unint64_t)a3
{
  uint64_t v4 = objc_alloc_init(PXTimelineSchedulerOptions);
  BOOL v5 = v4;
  switch(a3)
  {
    case 0uLL:
      double v6 = 3600.0;
      goto LABEL_8;
    case 1uLL:
      [(PXTimelineSchedulerOptions *)v4 setTimelineEntryDuration:10800.0];
      [(PXTimelineSchedulerOptions *)v5 timelineEntryDuration];
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      int64_t v7 = &unk_1F02D3BC8;
      goto LABEL_6;
    case 2uLL:
      [(PXTimelineSchedulerOptions *)v4 setTimelineEntryDuration:86400.0];
      [(PXTimelineSchedulerOptions *)v5 timelineEntryDuration];
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      int64_t v7 = &unk_1F02D3BE0;
      goto LABEL_6;
    case 3uLL:
      [(PXTimelineSchedulerOptions *)v4 setTimelineEntryDuration:21600.0];
      [(PXTimelineSchedulerOptions *)v5 timelineEntryDuration];
      -[PXTimelineSchedulerOptions setBestContentEntryDuration:](v5, "setBestContentEntryDuration:");
      int64_t v7 = &unk_1F02D3BF8;
LABEL_6:
      [(PXTimelineSchedulerOptions *)v5 setBestContentStartTimeHours:v7];
      break;
    case 4uLL:
      double v6 = 1800.0;
LABEL_8:
      [(PXTimelineSchedulerOptions *)v4 setTimelineEntryDuration:v6];
      [(PXTimelineSchedulerOptions *)v5 setBestContentEntryDuration:7200.0];
      break;
    default:
      break;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_63188 != -1) {
    dispatch_once(&sharedInstance_onceToken_63188, &__block_literal_global_63189);
  }
  v2 = (void *)sharedInstance_sharedInstance_63190;
  return v2;
}

void __43__PXMemoriesRelatedSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 memoriesRelated];
  v1 = (void *)sharedInstance_sharedInstance_63190;
  sharedInstance_sharedInstance_63190 = v0;
}

+ (void)_presentAlertWithTitle:(id)a3 andMessage:(id)a4 inModuleController:(id)a5
{
  int64_t v7 = (void *)MEMORY[0x1E4FB1418];
  id v8 = a5;
  id v10 = [v7 alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v9 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
  [v10 addAction:v9];

  [v8 presentViewController:v10 animated:1 completion:0];
}

+ (void)_presentAlertForMemoriesGenerationResult:(id)a3 error:(id)a4 inModuleController:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  id v9 = a3;
  [v8 dismissViewControllerAnimated:0 completion:0];
  id v10 = [v9 objectForKeyedSubscript:@"PHMemoryIdentifiersKey"];

  uint64_t v11 = [v10 count];
  if (v15)
  {
    BOOL v12 = [v15 description];
    uint64_t v13 = @"Error while generating memories";
  }
  else
  {
    v14 = @"memories";
    if (v11 == 1) {
      v14 = @"memory";
    }
    uint64_t v13 = [NSString stringWithFormat:@"Generated %lu %@.", v11, v14];
    BOOL v12 = 0;
  }
  [a1 _presentAlertWithTitle:v13 andMessage:v12 inModuleController:v8];
}

+ (void)_generateQuestionsWithOptions:(int64_t)a3 count:(unint64_t)a4 inModuleController:(id)a5
{
  id v8 = a5;
  id v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Generating New Questions..." message:0 preferredStyle:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke;
  v11[3] = &unk_1E5DD01C8;
  id v12 = v8;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  id v15 = a1;
  id v10 = v8;
  [v10 presentViewController:v9 animated:1 completion:v11];
}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F8B018]];

  uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F8AFE0]];

  BOOL v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  double v6 = [v5 photoAnalysisClient];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_2;
  v10[3] = &unk_1E5DB78F8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = v9;
  [v6 requestGenerateQuestionsWithOptions:v2 reply:v10];
}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  px_dispatch_on_main_queue();
}

void __88__PXMemoriesRelatedSettings_UI___generateQuestionsWithOptions_count_inModuleController___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:0];
  id v2 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8B008]];
  char v3 = [v2 BOOLValue];

  objc_msgSend(NSString, "stringWithFormat:", @"Successfully Generated %lu Questions.", *(void *)(a1 + 56));
  uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3)
  {
    id v6 = @"You may need to relaunch Photos to view.";
  }
  else
  {

    id v7 = *(void **)(a1 + 48);
    if (v7)
    {
      id v6 = [v7 localizedDescription];
    }
    else
    {
      id v6 = @"You may need to rebuild your graph.";
    }
    id v5 = @"Question Generation Failed";
  }
  id v8 = v5;
  [*(id *)(a1 + 64) _presentAlertWithTitle:v5 andMessage:v6 inModuleController:*(void *)(a1 + 32)];
}

+ (id)settingsControllerModule
{
  uint64_t v225 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F940F8];
  v208[0] = MEMORY[0x1E4F143A8];
  v208[1] = 3221225472;
  v208[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke;
  v208[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v208[4] = a1;
  uint64_t v4 = [MEMORY[0x1E4F94190] actionWithHandler:v208];
  v186 = [v3 rowWithTitle:@"Graph Service Status" action:v4];

  id v5 = (void *)MEMORY[0x1E4F940F8];
  v207[0] = MEMORY[0x1E4F143A8];
  v207[1] = 3221225472;
  v207[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2;
  v207[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v207[4] = a1;
  id v6 = [MEMORY[0x1E4F94190] actionWithHandler:v207];
  v185 = [v5 rowWithTitle:@"Invalidate Transient Caches" action:v6];

  id v7 = (void *)MEMORY[0x1E4F940F8];
  v206[0] = MEMORY[0x1E4F143A8];
  v206[1] = 3221225472;
  v206[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3;
  v206[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v206[4] = a1;
  id v8 = [MEMORY[0x1E4F94190] actionWithHandler:v206];
  v184 = [v7 rowWithTitle:@"Invalidate Persistent Caches" action:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F940F8];
  id v10 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_82424];
  v183 = [v9 rowWithTitle:@"Trigger Graph Rebuild" action:v10];

  id v11 = (void *)MEMORY[0x1E4F940F8];
  v205[0] = MEMORY[0x1E4F143A8];
  v205[1] = 3221225472;
  v205[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6;
  v205[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v205[4] = a1;
  uint64_t v12 = [MEMORY[0x1E4F94190] actionWithHandler:v205];
  v182 = [v11 rowWithTitle:@"Launch Highlights Enrichment" action:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4F940F8];
  v204[0] = MEMORY[0x1E4F143A8];
  v204[1] = 3221225472;
  v204[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9;
  v204[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v204[4] = a1;
  unint64_t v14 = [MEMORY[0x1E4F94190] actionWithHandler:v204];
  v181 = [v13 rowWithTitle:@"Launch Month / Year Enrichment" action:v14];

  v180 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:output:", @"Statistics", &__block_literal_global_246_82429);
  v179 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Library Estimates", &__block_literal_global_252);
  v178 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Export Graph", &__block_literal_global_258_82432);
  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v200 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v203 = 0u;
  uint64_t v16 = [&unk_1F02D3FA0 countByEnumeratingWithState:&v200 objects:v224 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v201;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v201 != v18) {
          objc_enumerationMutation(&unk_1F02D3FA0);
        }
        v20 = *(void **)(*((void *)&v200 + 1) + 8 * i);
        if ([v20 integerValue])
        {
          objc_super v21 = [v20 description];
          [v15 addObject:v21];
        }
        else
        {
          [v15 addObject:@"Default"];
        }
      }
      uint64_t v17 = [&unk_1F02D3FA0 countByEnumeratingWithState:&v200 objects:v224 count:16];
    }
    while (v17);
  }
  v22 = (void *)MEMORY[0x1E4F94130];
  v23 = +[PXContextualMemoriesSettingsTableViewController title];
  uint64_t v24 = objc_msgSend(v22, "px_rowWithTitle:action:", v23, &__block_literal_global_305);

  v25 = (void *)MEMORY[0x1E4F94160];
  v223[0] = v186;
  v223[1] = v185;
  v223[2] = v184;
  v223[3] = v183;
  v223[4] = v182;
  v223[5] = v181;
  v223[6] = v180;
  v223[7] = v179;
  v223[8] = v178;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Local Memories" valueKeyPath:@"showLocalMemories"];
  v223[9] = v26;
  v153 = (void *)v24;
  v223[10] = v24;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v223 count:11];
  v177 = [v25 sectionWithRows:v27 title:@"General"];

  v176 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Existing Memories Inspector", &__block_literal_global_323);
  v175 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Exercise Memory Generation", &__block_literal_global_333);
  v174 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Memory Generation Logs - Last Day", &__block_literal_global_378);
  v173 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Memory Generation Logs - All", &__block_literal_global_388);
  v172 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Existing Suggestions Inspector", &__block_literal_global_394_82443);
  v171 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Suggesters Inspector", &__block_literal_global_404);
  v170 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Exercise Suggestion Generation", &__block_literal_global_414);
  v169 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Suggestion Generation Logs - Last Day", &__block_literal_global_433);
  v168 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Suggestion Generation Logs - All", &__block_literal_global_442_82448);
  v167 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Score Lab", &__block_literal_global_448);
  v28 = (void *)MEMORY[0x1E4F940F8];
  v199[0] = MEMORY[0x1E4F143A8];
  v199[1] = 3221225472;
  v199[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_453;
  v199[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v199[4] = a1;
  v29 = [MEMORY[0x1E4F94190] actionWithHandler:v199];
  v166 = [v28 rowWithTitle:@"Create Contextual Memory" action:v29];

  v30 = (void *)MEMORY[0x1E4F940F8];
  v198[0] = MEMORY[0x1E4F143A8];
  v198[1] = 3221225472;
  v198[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_16;
  v198[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v198[4] = a1;
  v31 = [MEMORY[0x1E4F94190] actionWithHandler:v198];
  v165 = [v30 rowWithTitle:@"Statistics" action:v31];

  v32 = (void *)MEMORY[0x1E4F940F8];
  v197[0] = MEMORY[0x1E4F143A8];
  v197[1] = 3221225472;
  v197[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_19;
  v197[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v197[4] = a1;
  v33 = [MEMORY[0x1E4F94190] actionWithHandler:v197];
  uint64_t v34 = [v32 rowWithTitle:@"Generate Questions" action:v33];

  v35 = (void *)MEMORY[0x1E4F940F8];
  v196[0] = MEMORY[0x1E4F143A8];
  v196[1] = 3221225472;
  v196[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_20;
  v196[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v196[4] = a1;
  v36 = [MEMORY[0x1E4F94190] actionWithHandler:v196];
  uint64_t v37 = [v35 rowWithTitle:@"Clear Unanswered Questions" action:v36];

  v38 = (void *)MEMORY[0x1E4F940F8];
  v195[0] = MEMORY[0x1E4F143A8];
  v195[1] = 3221225472;
  v195[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_23;
  v195[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v195[4] = a1;
  v39 = [MEMORY[0x1E4F94190] actionWithHandler:v195];
  uint64_t v40 = [v38 rowWithTitle:@"🔮 Generate Music Quality Questions" action:v39];

  v41 = (void *)MEMORY[0x1E4F940F8];
  v194[0] = MEMORY[0x1E4F143A8];
  v194[1] = 3221225472;
  v194[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_24;
  v194[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v194[4] = a1;
  v42 = [MEMORY[0x1E4F94190] actionWithHandler:v194];
  uint64_t v43 = [v41 rowWithTitle:@"🔮 Generate Social Group Questions" action:v42];

  v44 = (void *)MEMORY[0x1E4F94160];
  v222[0] = v165;
  v151 = (void *)v37;
  v152 = (void *)v34;
  v222[1] = v34;
  v222[2] = v37;
  v149 = (void *)v43;
  v150 = (void *)v40;
  v222[3] = v40;
  v222[4] = v43;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v222 count:5];
  v164 = [v44 sectionWithRows:v45 title:@"Photos Challenge"];

  v46 = (void *)MEMORY[0x1E4F940F8];
  v193[0] = MEMORY[0x1E4F143A8];
  v193[1] = 3221225472;
  v193[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_25;
  v193[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v193[4] = a1;
  v47 = [MEMORY[0x1E4F94190] actionWithHandler:v193];
  uint64_t v48 = [v46 rowWithTitle:@"Music Curation Cache Status" action:v47];

  v49 = (void *)MEMORY[0x1E4F940F8];
  v192[0] = MEMORY[0x1E4F143A8];
  v192[1] = 3221225472;
  v192[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_528;
  v192[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v192[4] = a1;
  v50 = [MEMORY[0x1E4F94190] actionWithHandler:v192];
  uint64_t v51 = [v49 rowWithTitle:@"Music Curation Clear Cache" action:v50];

  v52 = (void *)MEMORY[0x1E4F94160];
  v147 = (void *)v51;
  v148 = (void *)v48;
  v221[0] = v48;
  v221[1] = v51;
  v53 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use only human-curated for Top Picks" valueKeyPath:@"useOnlyMusicForTopicInTopPickSuggestions"];
  v221[2] = v53;
  v54 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Include Chill Mix in Music For You" valueKeyPath:@"includeChillMixInMusicForYou"];
  v221[3] = v54;
  v55 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Include Get Up Mix in Music For You" valueKeyPath:@"includeGetUpMixInMusicForYou"];
  v221[4] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v221 count:5];
  v145 = [v52 sectionWithRows:v56 title:@"Music Curation"];

  uint64_t v57 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Meanings Inspector", &__block_literal_global_574);
  v58 = (void *)MEMORY[0x1E4F94160];
  v146 = (void *)v57;
  uint64_t v220 = v57;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v220 count:1];
  v163 = [v58 sectionWithRows:v59 title:@"Meanings"];

  v60 = (void *)MEMORY[0x1E4F94160];
  v219[0] = v176;
  v219[1] = v175;
  v219[2] = v174;
  v219[3] = v173;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:4];
  v162 = [v60 sectionWithRows:v61 title:@"Memory Debug"];

  v62 = (void *)MEMORY[0x1E4F94160];
  v218[0] = v172;
  v218[1] = v171;
  v218[2] = v170;
  v218[3] = v169;
  v218[4] = v168;
  v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:5];
  v161 = [v62 sectionWithRows:v63 title:@"Suggestion Debug"];

  v64 = (void *)MEMORY[0x1E4F94160];
  v217 = v167;
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v217 count:1];
  v160 = [v64 sectionWithRows:v65 title:@"Curation Lab"];

  v66 = (void *)MEMORY[0x1E4F94160];
  v216[0] = v166;
  v67 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Fake People Proximity" valueKeyPath:@"fakePeopleProximity"];
  v216[1] = v67;
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:2];
  v159 = [v66 sectionWithRows:v68 title:@"Contextual"];

  v69 = (void *)MEMORY[0x1E4F940F8];
  v191[0] = MEMORY[0x1E4F143A8];
  v191[1] = 3221225472;
  v191[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_600;
  v191[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v191[4] = a1;
  v70 = [MEMORY[0x1E4F94190] actionWithHandler:v191];
  v158 = [v69 rowWithTitle:@"Remove All Memories" action:v70];

  v71 = (void *)MEMORY[0x1E4F940F8];
  v190[0] = MEMORY[0x1E4F143A8];
  v190[1] = 3221225472;
  v190[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_614;
  v190[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v190[4] = a1;
  v72 = [MEMORY[0x1E4F94190] actionWithHandler:v190];
  v157 = [v71 rowWithTitle:@"Create New Memories" action:v72];

  v73 = (void *)MEMORY[0x1E4F940F8];
  v74 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_626];
  uint64_t v75 = [v73 rowWithTitle:@"Reset Rejected Memories" action:v74];

  v76 = (void *)MEMORY[0x1E4F940F8];
  v189[0] = MEMORY[0x1E4F143A8];
  v189[1] = 3221225472;
  v189[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_639;
  v189[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v189[4] = a1;
  v77 = [MEMORY[0x1E4F94190] actionWithHandler:v189];
  uint64_t v78 = [v76 rowWithTitle:@"Create Memories Notification" action:v77];

  v79 = (void *)MEMORY[0x1E4F940F8];
  v188[0] = MEMORY[0x1E4F143A8];
  v188[1] = 3221225472;
  v188[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_653;
  v188[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v188[4] = a1;
  v80 = [MEMORY[0x1E4F94190] actionWithHandler:v188];
  uint64_t v81 = [v79 rowWithTitle:@"Simulate Memories Notification" action:v80];

  v82 = (void *)MEMORY[0x1E4F940F8];
  v187[0] = MEMORY[0x1E4F143A8];
  v187[1] = 3221225472;
  v187[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_667;
  v187[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v187[4] = a1;
  v83 = [MEMORY[0x1E4F94190] actionWithHandler:v187];
  uint64_t v84 = [v82 rowWithTitle:@"Reset Memories Notification State" action:v83];

  v85 = (void *)MEMORY[0x1E4F94160];
  v215[0] = v158;
  v215[1] = v157;
  v143 = (void *)v78;
  v144 = (void *)v75;
  v215[2] = v75;
  v215[3] = v78;
  v141 = (void *)v84;
  v142 = (void *)v81;
  v215[4] = v81;
  v215[5] = v84;
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v215 count:6];
  v156 = [v85 sectionWithRows:v86 title:@"Memories"];

  v154 = (void *)MEMORY[0x1E4F94160];
  v139 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Memories Living On Feedback" valueKeyPath:@"enableMemoriesLivingOnFeedback"];
  v214[0] = v139;
  v137 = [MEMORY[0x1E4F94108] rowWithTitle:@"Min # for Memories" valueKeyPath:@"minimumNumberOfCuratedAssetsForMemories"];
  v135 = [v137 possibleValues:&unk_1F02D3FA0 titles:v15];
  v214[1] = v135;
  v133 = [MEMORY[0x1E4F94108] rowWithTitle:@"Min # for Interesting Moments" valueKeyPath:@"minimumNumberOfCuratedAssetsForInterestingMoments"];
  v131 = [v133 possibleValues:&unk_1F02D3FA0 titles:v15];
  v214[2] = v131;
  v129 = [MEMORY[0x1E4F94108] rowWithTitle:@"Min # for Movie Header" valueKeyPath:@"minimumNumberOfCuratedAssetsForMovieHeader"];
  v87 = [v129 possibleValues:&unk_1F02D3FA0 titles:v15];
  v214[3] = v87;
  v88 = [MEMORY[0x1E4F94108] rowWithTitle:@"Delete Behavior" valueKeyPath:@"deleteBehavior"];
  v89 = [v88 possibleValues:&unk_1F02D3FB8 titles:&unk_1F02D3FD0];
  v214[4] = v89;
  v90 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Memory Title Layer" valueKeyPath:@"showMemoryTitleLayer"];
  v214[5] = v90;
  v91 = [MEMORY[0x1E4F941F0] rowWithTitle:@"iPad Wide Header" valueKeyPath:@"enableIPadWideHeader"];
  v214[6] = v91;
  v92 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Subtitle font size" valueKeyPath:@"subtitleFontSize"];
  v93 = [v92 minValue:10.0 maxValue:30.0];
  v94 = objc_msgSend(v93, "px_increment:", 1.0);
  v214[7] = v94;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v214 count:8];
  v155 = [v154 sectionWithRows:v95 title:@"Memories UI"];

  uint64_t v96 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:output:", @"Generate Timeline", &__block_literal_global_752);
  uint64_t v97 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:action:", @"Timeline Inspector", &__block_literal_global_770);
  v98 = +[PXTimelineSize sizeDescriptionForSizeClass:0];
  v213[0] = v98;
  v99 = +[PXTimelineSize sizeDescriptionForSizeClass:1];
  v213[1] = v99;
  v100 = +[PXTimelineSize sizeDescriptionForSizeClass:2];
  v213[2] = v100;
  v101 = +[PXTimelineSize sizeDescriptionForSizeClass:3];
  v213[3] = v101;
  uint64_t v102 = [MEMORY[0x1E4F1C978] arrayWithObjects:v213 count:4];

  v103 = [MEMORY[0x1E4F94108] rowWithTitle:@"Widget Size" valueKeyPath:@"widgetSize"];
  v136 = (void *)v102;
  uint64_t v104 = [v103 possibleValues:&unk_1F02D3FE8 titles:v102];

  v105 = [MEMORY[0x1E4F94108] rowWithTitle:@"Content Mode" valueKeyPath:@"timelineContentMode"];
  uint64_t v106 = [v105 possibleValues:&unk_1F02D4000 titles:&unk_1F02D4018];

  v107 = [MEMORY[0x1E4F94108] rowWithTitle:@"Scheduler Mode" valueKeyPath:@"timelineSchedulerMode"];
  uint64_t v108 = [v107 possibleValues:&unk_1F02D4030 titles:&unk_1F02D4048];

  v109 = (void *)MEMORY[0x1E4F94160];
  v138 = (void *)v97;
  v140 = (void *)v96;
  v212[0] = v96;
  v212[1] = v97;
  v132 = (void *)v106;
  v134 = (void *)v104;
  v212[2] = v104;
  v212[3] = v106;
  v130 = (void *)v108;
  v212[4] = v108;
  v110 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:5];
  v111 = [v109 sectionWithRows:v110 title:@"Timeline"];

  uint64_t v112 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Enable Discovery Feed" valueKeyPath:@"enableDiscoveryFeed"];
  v113 = [MEMORY[0x1E4F94108] rowWithTitle:@"Ranking Mode" valueKeyPath:@"discoveryRankingMode"];
  v114 = [v113 possibleValues:&unk_1F02D4060 titles:&unk_1F02D4078];

  v115 = (void *)MEMORY[0x1E4F94160];
  v128 = (void *)v112;
  v211[0] = v112;
  v211[1] = v114;
  v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:2];
  v117 = [v115 sectionWithRows:v116 title:@"Discovery"];

  v118 = objc_msgSend(MEMORY[0x1E4F940F8], "px_rowWithTitle:continuousOutputProducer:", @"Continuous Service Status", &__block_literal_global_867);
  v119 = (void *)MEMORY[0x1E4F94160];
  v210 = v118;
  v120 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
  v121 = [v119 sectionWithRows:v120 title:@"Debug"];

  v122 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  id v123 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v209[0] = v177;
  v209[1] = v164;
  v209[2] = v163;
  v209[3] = v162;
  v209[4] = v161;
  v209[5] = v160;
  v209[6] = v159;
  v209[7] = v156;
  v209[8] = v155;
  v209[9] = v111;
  v209[10] = v117;
  v209[11] = v121;
  v209[12] = v122;
  v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:v209 count:13];
  v125 = (void *)[v123 initWithArray:v124];

  if (v145) {
    [v125 insertObject:v145 atIndex:2];
  }
  id v127 = [MEMORY[0x1E4F94160] moduleWithTitle:@"Memories & Related" contents:v125];

  return v127;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v11 = 0;
  id v6 = [v5 graphStatusDescription:&v11];
  id v7 = v11;

  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = [v7 localizedDescription];
    [v8 _presentAlertWithTitle:@"Graph Service Status" andMessage:v9 inModuleController:v4];
  }
  else
  {
    [v8 _presentAlertWithTitle:@"Graph Service Status" andMessage:v6 inModuleController:v4];
  }

  return v7 != 0;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v10 = 0;
  [v5 invalidateTransientGraphCachesAndReturnError:&v10];
  id v6 = v10;

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v6 localizedDescription];
    [v7 _presentAlertWithTitle:@"Error while invalidating transient caches" andMessage:v8 inModuleController:v4];
  }
  return v6 == 0;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v10 = 0;
  [v5 invalidatePersistentGraphCachesAndReturnError:&v10];
  id v6 = v10;

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    id v8 = [v6 localizedDescription];
    [v7 _presentAlertWithTitle:@"Error while invalidating persistent caches" andMessage:v8 inModuleController:v4];
  }
  return v6 == 0;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) _presentAlertWithTitle:@"Starting Enrichment" andMessage:@"This will take a while…" inModuleController:v4];
  id v5 = dispatch_get_global_queue(25, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7;
  v9[3] = &unk_1E5DD08D8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v6;
  id v7 = v4;
  dispatch_async(v5, v9);

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [*(id *)(a1 + 32) _presentAlertWithTitle:@"Starting Enrichment" andMessage:@"This will take a few seconds…" inModuleController:v4];
  id v5 = +[PXContextualMemoriesSettingsController sharedController];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10;
  v9[3] = &unk_1E5DB77A8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v4;
  uint64_t v11 = v6;
  id v7 = v4;
  [v5 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:v9];

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_453(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Generating Contextual Memory..." message:0 preferredStyle:1];
  [v4 presentViewController:v5 animated:1 completion:0];
  uint64_t v6 = +[PXContextualMemoriesSettingsController sharedController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_458;
  v10[3] = &unk_1E5DB77A8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v7;
  id v8 = v4;
  [v6 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:v10];

  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_16(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  char v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v4 = [v3 librarySpecificFetchOptions];

  id v5 = [MEMORY[0x1E4F39250] fetchAnsweredQuestionsWithOptions:v4 validQuestionsOnly:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        unsigned int v11 = [*(id *)(*((void *)&v29 + 1) + 8 * i) type];
        uint64_t v12 = @"Unknown";
        if (v11 <= 0x1E) {
          uint64_t v12 = off_1E5DB7918[v11];
        }
        uint64_t v13 = v12;
        uint64_t v14 = [v6 objectForKeyedSubscript:v13];
        id v15 = (void *)v14;
        if (v14) {
          uint64_t v16 = (void *)v14;
        }
        else {
          uint64_t v16 = &unk_1F02D7348;
        }
        id v17 = v16;

        uint64_t v18 = NSNumber;
        uint64_t v19 = [v17 integerValue];

        v20 = [v18 numberWithInteger:v19 + 1];
        [v6 setObject:v20 forKeyedSubscript:v13];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  objc_super v21 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"\n"];
  v22 = objc_msgSend(NSString, "stringWithFormat:", @"Total Answered: %lu\n\n", objc_msgSend(obj, "count"));
  [v21 appendString:v22];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_17;
  v28[3] = &unk_1E5DCB200;
  id v23 = v21;
  v28[4] = v23;
  [v6 enumerateKeysAndObjectsUsingBlock:v28];
  id v24 = v26;
  id v25 = v23;
  px_dispatch_on_main_queue();
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v4 librarySpecificFetchOptions];
  id v5 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:objc_claimAutoreleasedReturnValue() validQuestionsOnly:0];
  id v10 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_21;
  v11[3] = &unk_1E5DD36F8;
  void v11[4] = v5;
  id v6 = v5;
  [v4 performChangesAndWait:v11 error:&v10];
  id v7 = v10;
  id v8 = v3;
  id v9 = v7;
  px_dispatch_on_main_queue();
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1;
}

BOOL __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = dispatch_group_create();
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__82662;
  long long v32 = __Block_byref_object_dispose__82663;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = __Block_byref_object_copy__82662;
  id v26 = __Block_byref_object_dispose__82663;
  id v27 = 0;
  dispatch_group_enter(v7);
  id v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v9 = [v8 photoAnalysisClient];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_514;
  v18[3] = &unk_1E5DB7838;
  v20 = &v28;
  objc_super v21 = &v22;
  id v10 = v7;
  uint64_t v19 = v10;
  [v9 requestMusicCacheStatusWithReply:v18];

  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v10, v11);
  uint64_t v12 = v29[5];
  uint64_t v13 = *(void **)(a1 + 32);
  if (v12)
  {
    [v13 _presentAlertWithTitle:@"Music Cache Status" andMessage:v29[5] inModuleController:v6];
  }
  else
  {
    uint64_t v14 = [(id)v23[5] localizedDescription];
    id v15 = (void *)v14;
    if (v14) {
      uint64_t v16 = (__CFString *)v14;
    }
    else {
      uint64_t v16 = @"Unknown Error";
    }
    [v13 _presentAlertWithTitle:@"Error" andMessage:v16 inModuleController:v6];
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v12 != 0;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_528(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Are you sure? This action cannot be undone." preferredStyle:0];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_536;
  id v15 = &unk_1E5DB7860;
  uint64_t v7 = *(void *)(a1 + 32);
  id v16 = v4;
  uint64_t v17 = v7;
  id v8 = v4;
  id v9 = [v6 actionWithTitle:@"Remove All Songs from Music Cache" style:2 handler:&v12];
  objc_msgSend(v5, "addAction:", v9, v12, v13, v14, v15);

  id v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v10];

  [v8 presentViewController:v5 animated:1 completion:0];
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_600(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:@"Are you sure? This action cannot be undone." preferredStyle:0];
  id v6 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_604;
  id v15 = &unk_1E5DB7860;
  uint64_t v7 = *(void *)(a1 + 32);
  id v16 = v4;
  uint64_t v17 = v7;
  id v8 = v4;
  id v9 = [v6 actionWithTitle:@"Delete All Memories" style:2 handler:&v12];
  objc_msgSend(v5, "addAction:", v9, v12, v13, v14, v15);

  id v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v5 addAction:v10];

  [v8 presentViewController:v5 animated:1 completion:0];
  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_614(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Generating Memories..." message:0 preferredStyle:1];
  [v4 presentViewController:v5 animated:1 completion:0];
  id v6 = +[PXContextualMemoriesSettingsController sharedController];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_618;
  v10[3] = &unk_1E5DB77A8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v4;
  uint64_t v12 = v7;
  id v8 = v4;
  [v6 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:v10];

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_639(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Generating Memories Notification..." message:0 preferredStyle:1];
  [v4 presentViewController:v5 animated:1 completion:0];
  id v6 = objc_alloc_init(MEMORY[0x1E4F39180]);
  [v6 setReason:2];
  [v6 setExtraParameters:&unk_1F02DB3B0];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v6 setPhotoLibrary:v7];

  id v8 = (void *)MEMORY[0x1E4F39160];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_648;
  v12[3] = &unk_1E5DB7810;
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v4;
  uint64_t v14 = v9;
  id v10 = v4;
  [v8 generateMemoriesWithOptions:v6 completion:v12];

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_653(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v14 = @"notificationState";
  id v6 = [NSNumber numberWithInt:1];
  v15[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_657;
  v11[3] = &unk_1E5DB7810;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v4;
  uint64_t v13 = v8;
  id v9 = v4;
  [v5 simulateMemoriesNotificationWithOptions:v7 reply:v11];

  return 1;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_667(uint64_t a1, uint64_t a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v14 = @"notificationState";
  id v6 = [NSNumber numberWithInt:0];
  v15[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_668;
  v11[3] = &unk_1E5DB7810;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v4;
  uint64_t v13 = v8;
  id v9 = v4;
  [v5 simulateMemoriesNotificationWithOptions:v7 reply:v11];

  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_864(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[PXPhotoAnalysisStatusController sharedStatusController];
  [v6 update];
  uint64_t v7 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_869;
  block[3] = &unk_1E5DCAF58;
  id v13 = v5;
  id v14 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_869(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F143A8];
    id v4 = MEMORY[0x1E4F14428];
    do
    {
      v5[0] = v3;
      v5[1] = 3221225472;
      v5[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_870;
      v5[3] = &unk_1E5DD3280;
      id v7 = *(id *)(a1 + 48);
      id v6 = *(id *)(a1 + 32);
      dispatch_sync(v4, v5);
      [MEMORY[0x1E4F29060] sleepForTimeInterval:2.0];

      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    while ((result & 1) != 0);
  }
  return result;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_870(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = NSString;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v3 stringWithFormat:@"=== %@ ===\n", v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v13 = 0;
  id v7 = [v6 graphStatusDescription:&v13];
  id v8 = v13;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [v8 localizedDescription];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 32) stateDescription];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_768(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v13 = +[PXMemoriesRelatedSettings sharedInstance];
  uint64_t v3 = [v13 timelineContentMode];
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v5 = [v13 widgetSize];
  +[PXTimelineSize widgetSizeForSizeClass:v5];
  if (v3)
  {
    id v8 = -[PXTimelineContentModeTableViewController initWithContentMode:widgetSizeClass:]([PXTimelineContentModeTableViewController alloc], "initWithContentMode:widgetSizeClass:", v3, [v13 widgetSize]);
  }
  else
  {
    double v9 = v6;
    double v10 = v7;
    uint64_t v11 = +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v4, v5);
    id v12 = -[PXTimelineDataSource initWithPhotoLibrary:forWidgetSize:]([PXTimelineDataSource alloc], "initWithPhotoLibrary:forWidgetSize:", v4, v9, v10);
    id v8 = -[PXSettingsTimelineInspectorViewController initWithWidgetSizeClass:timeline:dataSource:]([PXSettingsTimelineInspectorViewController alloc], "initWithWidgetSizeClass:timeline:dataSource:", [v13 widgetSize], v11, v12);
  }
  [v2 pushViewController:v8 animated:1];
}

__CFString *__57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_750()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  v1 = +[PXWidgetTimeline timelineFromLibrary:forWidgetSize:timelineSize:](PXWidgetTimeline, "timelineFromLibrary:forWidgetSize:timelineSize:", v0, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  if ([v1 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    objc_msgSend(v2, "appendFormat:", @"%lu Timeline Entries Generated\n", objc_msgSend(v1, "count"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_760;
    v5[3] = &unk_1E5DB7888;
    uint64_t v3 = (__CFString *)v2;
    double v6 = v3;
    [v1 enumerateObjectsUsingBlock:v5];
  }
  else
  {
    uint64_t v3 = @"No TimelineEntries Generated.";
  }

  return v3;
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"TimelineEntry[%lu] %@\n", a3, a2];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_668(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = [a3 description];
    uint64_t v5 = @"Resetting Notification State failed";
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = @"Resetting Notification State done";
  }
  id v6 = (id)v4;
  [*(id *)(a1 + 40) _presentAlertWithTitle:v5 andMessage:v4 inModuleController:*(void *)(a1 + 32)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_657(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = [a3 description];
    uint64_t v5 = @"Simulation failed";
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = @"Simulation done";
  }
  id v6 = (id)v4;
  [*(id *)(a1 + 40) _presentAlertWithTitle:v5 andMessage:v4 inModuleController:*(void *)(a1 + 32)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_648(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_649(uint64_t a1)
{
  return [*(id *)(a1 + 56) _presentAlertForMemoriesGenerationResult:*(void *)(a1 + 32) error:*(void *)(a1 + 40) inModuleController:*(void *)(a1 + 48)];
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_624(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v12 = 0;
  char v5 = PXMemoriesResetRejected(v4, 0, &v12);
  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    id v7 = (void *)MEMORY[0x1E4FB1418];
    id v8 = [NSString stringWithFormat:@"Error %@", v6];
    id v9 = [v7 alertControllerWithTitle:@"Resetting rejected Memories failed" message:v8 preferredStyle:1];

    double v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:0];
    [v9 addAction:v10];

    [v3 presentViewController:v9 animated:0 completion:0];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_error_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Resetting rejected Memories failed with error %@", buf, 0xCu);
    }
  }
  return 1;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_618(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F39180];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setReason:1];
  id v6 = [v4 date];
  [v5 setDate:v6];

  id v7 = [v4 location];
  [v5 setLocation:v7];

  id v8 = [v4 peopleNames];

  [v5 setPeopleNames:v8];
  id v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v5 setPhotoLibrary:v9];

  double v10 = (void *)MEMORY[0x1E4F39160];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_619;
  v13[3] = &unk_1E5DB7810;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v11 = (id)v12;
  long long v14 = v12;
  [v10 generateMemoriesWithOptions:v5 completion:v13];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_619(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12_620(uint64_t a1)
{
  return [*(id *)(a1 + 56) _presentAlertForMemoriesGenerationResult:*(void *)(a1 + 32) error:*(void *)(a1 + 40) inModuleController:*(void *)(a1 + 48)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_604(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = [v2 librarySpecificFetchOptions];
  [v3 setIncludeRejectedMemories:1];
  [v3 setIncludePendingMemories:1];
  id v4 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:4 subtype:0x7FFFFFFFFFFFFFFFLL options:v3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8_606;
  v11[3] = &unk_1E5DD36F8;
  id v5 = v4;
  id v12 = v5;
  id v10 = 0;
  [v2 performChangesAndWait:v11 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    id v9 = [v6 localizedDescription];
    [v8 _presentAlertWithTitle:@"Error while removing memories" andMessage:v9 inModuleController:*(void *)(a1 + 32)];
  }
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8_606(uint64_t a1)
{
  return [MEMORY[0x1E4F39170] deleteMemories:*(void *)(a1 + 32)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_572(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(PXSettingsMeaningsTableViewController);
  [v2 pushViewController:v3 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_536(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_group_create();
  uint64_t v20 = 0;
  objc_super v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__82662;
  uint64_t v24 = __Block_byref_object_dispose__82663;
  id v25 = 0;
  dispatch_group_enter(v4);
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = [v5 photoAnalysisClient];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_537;
  uint64_t v17 = &unk_1E5DB7780;
  uint64_t v19 = &v20;
  id v7 = v4;
  uint64_t v18 = v7;
  [v6 requestClearMusicCacheWithOptions:0 reply:&v14];

  dispatch_time_t v8 = dispatch_time(0, 60000000000);
  dispatch_group_wait(v7, v8);
  id v9 = (void *)v21[5];
  if (v9)
  {
    id v10 = *(void **)(a1 + 40);
    uint64_t v11 = objc_msgSend(v9, "localizedDescription", v14, v15, v16, v17);
    id v12 = (void *)v11;
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    else {
      id v13 = @"Unknown Error";
    }
    [v10 _presentAlertWithTitle:@"Error" andMessage:v13 inModuleController:*(void *)(a1 + 32)];
  }
  objc_msgSend(*(id *)(a1 + 40), "_presentAlertWithTitle:andMessage:inModuleController:", @"Clear Music Cache", @"Complete", *(void *)(a1 + 32), v14, v15, v16, v17);

  _Block_object_dispose(&v20, 8);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_537(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_514(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_time_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_21(uint64_t a1)
{
  return [MEMORY[0x1E4F39258] deleteQuestions:*(void *)(a1 + 32)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_22(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 localizedDescription];
    id v4 = @"Clearing Unanswered Questions Failed";
  }
  else
  {
    id v3 = @"You may need to relaunch Photos to view.";
    id v4 = @"Successfully Cleared Unanswered Questions";
  }
  id v5 = v3;
  [*(id *)(a1 + 48) _presentAlertWithTitle:v4 andMessage:v3 inModuleController:*(void *)(a1 + 40)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_17(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 appendString:a2];
  uint64_t v7 = *(void **)(a1 + 32);
  dispatch_time_t v8 = NSString;
  uint64_t v9 = [v6 integerValue];

  objc_msgSend(v8, "stringWithFormat:", @": %lu\n", v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v7 appendString:v10];
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_18(uint64_t a1)
{
  return [*(id *)(a1 + 48) _presentAlertWithTitle:@"Photos Challenge Statistics" andMessage:*(void *)(a1 + 32) inModuleController:*(void *)(a1 + 40)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13_458(uint64_t a1, void *a2)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F39180];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setReason:1];
  id v6 = [v4 date];
  [v5 setDate:v6];

  uint64_t v7 = [v4 location];
  [v5 setLocation:v7];

  dispatch_time_t v8 = [v4 peopleNames];

  [v5 setPeopleNames:v8];
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v5 setPhotoLibrary:v9];

  v18[0] = @"contextual";
  v17[0] = @"category";
  v17[1] = @"startDate";
  id v10 = [MEMORY[0x1E4F1C9C8] distantPast];
  v18[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v5 setExtraParameters:v11];

  id v12 = (void *)MEMORY[0x1E4F39160];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14_467;
  v15[3] = &unk_1E5DB7810;
  long long v14 = *(_OWORD *)(a1 + 32);
  id v13 = (id)v14;
  long long v16 = v14;
  [v12 generateMemoriesWithOptions:v5 completion:v15];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14_467(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  id v9 = v5;
  px_dispatch_on_main_queue();
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_15_468(uint64_t a1)
{
  return [*(id *)(a1 + 56) _presentAlertForMemoriesGenerationResult:*(void *)(a1 + 32) error:*(void *)(a1 + 40) inModuleController:*(void *)(a1 + 48)];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11_446(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = objc_alloc_init(PXScoreLabViewController);
  id v3 = [(PXScoreLabViewController *)v4 navigationItem];
  [v3 setTitle:@"Score Lab"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10_440(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [[PXLogsViewController alloc] initWithSubsystem:@"com.apple.PhotosGraph" category:@"suggestions" startDate:0];
  id v3 = [(PXLogsViewController *)v4 navigationItem];
  [v3 setTitle:@"Suggestion Generation Logs"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_9_431(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  id v3 = a2;
  id v7 = [v2 dateWithTimeIntervalSinceNow:-86400.0];
  id v4 = [[PXLogsViewController alloc] initWithSubsystem:@"com.apple.PhotosGraph" category:@"suggestions" startDate:v7];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateStyle:0];
  [v5 setTimeStyle:1];
  [(PXLogsViewController *)v4 setDateFormatter:v5];
  id v6 = [(PXLogsViewController *)v4 navigationItem];
  [v6 setTitle:@"Suggestion Generation Logs"];

  [v3 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_6_412(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [[PXLogsViewController alloc] initLiveWithSubsystem:@"com.apple.PhotosGraph" category:@"suggestions"];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:0];
  [v3 setTimeStyle:1];
  [v6 setDateFormatter:v3];
  id v4 = [v6 navigationItem];
  [v4 setTitle:@"Suggestion Generation"];

  [v2 pushViewController:v6 animated:1];
  id v5 = +[PXContextualMemoriesSettingsController sharedController];
  [v5 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:&__block_literal_global_423];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7_421(uint64_t a1, void *a2)
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F39228];
  id v3 = a2;
  id v4 = objc_msgSend(v2, "px_deprecated_appPhotoLibrary");
  uint64_t v5 = *MEMORY[0x1E4F8B0A8];
  v9[0] = *MEMORY[0x1E4F8B0E8];
  v9[1] = v5;
  v10[0] = MEMORY[0x1E4F1CC28];
  v10[1] = MEMORY[0x1E4F1CC38];
  v9[2] = *MEMORY[0x1E4F8B100];
  id v6 = [v3 date];

  v10[2] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  id v8 = [v4 photoAnalysisClient];
  [v8 generateSuggestionsWithOptions:v7 reply:&__block_literal_global_427];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5_402(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = objc_alloc_init(PXSuggestersDebugViewController);
  id v3 = [(PXSuggestersDebugViewController *)v4 navigationItem];
  [v3 setTitle:@"Suggesters"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_392(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = objc_alloc_init(PXExistingSuggestionsDebugViewController);
  id v3 = [(PXExistingSuggestionsDebugViewController *)v4 navigationItem];
  [v3 setTitle:@"Existing Suggestions"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_386(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [[PXLogsViewController alloc] initWithSubsystem:@"com.apple.PhotosGraph" category:@"memory" startDate:0];
  id v3 = [(PXLogsViewController *)v4 navigationItem];
  [v3 setTitle:@"Memory Generation Logs"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_376(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [PXLogsViewController alloc];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-86400.0];
  id v7 = [(PXLogsViewController *)v3 initWithSubsystem:@"com.apple.PhotosGraph" category:@"memory" startDate:v4];

  id v5 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v5 setDateStyle:0];
  [v5 setTimeStyle:1];
  [(PXLogsViewController *)v7 setDateFormatter:v5];
  id v6 = [(PXLogsViewController *)v7 navigationItem];
  [v6 setTitle:@"Memory Generation Logs"];

  [v2 pushViewController:v7 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_3_331(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v6 = [[PXLogsViewController alloc] initLiveWithSubsystem:@"com.apple.PhotosGraph" category:@"memory"];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v3 setDateStyle:0];
  [v3 setTimeStyle:1];
  [v6 setDateFormatter:v3];
  id v4 = [v6 navigationItem];
  [v4 setTitle:@"Memory Generation"];

  [v2 pushViewController:v6 animated:1];
  id v5 = +[PXContextualMemoriesSettingsController sharedController];
  [v5 requestUpdatedContextualMemoriesSettingsWithOptions:0 completionHandler:&__block_literal_global_347];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4_345(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [v12 date];

  if (v4)
  {
    id v5 = [v12 date];
    [v3 setObject:v5 forKeyedSubscript:@"PHMemoryOptionDateKey"];
  }
  id v6 = [v12 location];

  if (v6)
  {
    id v7 = [v12 location];
    [v3 setObject:v7 forKeyedSubscript:@"PHMemoryOptionLocationKey"];
  }
  id v8 = [v12 peopleNames];

  if (v8)
  {
    id v9 = [v12 peopleNames];
    [v3 setObject:v9 forKeyedSubscript:@"PHMemoryOptionPeopleNamesKey"];
  }
  [v3 setObject:&unk_1F02D7510 forKeyedSubscript:@"PHMemoryOptionReasonKey"];
  uint64_t v10 = MEMORY[0x1E4F1CC28];
  [v3 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"PHMemoryOptionGenerateSuggestionsKey"];
  [v3 setObject:v10 forKeyedSubscript:@"PHMemoryOptionCommitChangesKey"];
  id v11 = [v2 photoAnalysisClient];
  [v11 generateMemoriesWithOptions:v3 reply:&__block_literal_global_372_82773];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_2_321(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = objc_alloc_init(PXExistingMemoriesDebugViewController);
  id v3 = [(PXExistingMemoriesDebugViewController *)v4 navigationItem];
  [v3 setTitle:@"Existing Memories"];

  [v2 pushViewController:v4 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_303(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(PXContextualMemoriesSettingsTableViewController);
  [v2 pushViewController:v3 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(PXSettingsGraphExportViewController);
  [v2 pushViewController:v3 animated:1];
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(PXSettingsHighlightEstimatesExportViewController);
  [v2 pushViewController:v3 animated:1];
}

id __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_13()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = 0;
  v1 = [v0 graphStatisticsDescription:&v6];
  id v2 = v6;

  if (v2)
  {
    id v3 = [v2 localizedDescription];
  }
  else
  {
    id v3 = v1;
  }
  id v4 = v3;

  return v4;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11;
  block[3] = &unk_1E5DD0D90;
  id v9 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v7;
  long long v10 = v7;
  id v6 = v3;
  dispatch_async(v4, block);
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_11(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) date];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) date];
    [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F8AEA8]];
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v9 = 0;
  [v5 requestHighlightCollectionEnrichmentWithOptions:v2 error:&v9];
  id v6 = v9;

  id v7 = *(id *)(a1 + 40);
  id v8 = v6;
  px_dispatch_on_main_queue();
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_12(void *a1)
{
  id v2 = (void *)a1[6];
  id v3 = (void *)a1[4];
  if (v3)
  {
    id v5 = [v3 localizedDescription];
    [v2 _presentAlertWithTitle:@"Month / Year Enrichment Finished" andMessage:v5 inModuleController:a1[5]];
  }
  else
  {
    uint64_t v4 = a1[5];
    [v2 _presentAlertWithTitle:@"Month / Year Enrichment Finished" andMessage:&stru_1F00B0030 inModuleController:v4];
  }
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_7(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  id v6 = 0;
  [v2 requestHighlightEnrichmentWithOptions:MEMORY[0x1E4F1CBF0] error:&v6];
  id v3 = v6;

  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  px_dispatch_on_main_queue();
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_8(void *a1)
{
  id v2 = (void *)a1[6];
  id v3 = (void *)a1[4];
  if (v3)
  {
    id v5 = [v3 localizedDescription];
    [v2 _presentAlertWithTitle:@"Enrichment Finished" andMessage:v5 inModuleController:a1[5]];
  }
  else
  {
    uint64_t v4 = a1[5];
    [v2 _presentAlertWithTitle:@"Enrichment Finished" andMessage:&stru_1F00B0030 inModuleController:v4];
  }
}

uint64_t __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  id v6 = objc_alloc(MEMORY[0x1E4F8AA20]);
  id v7 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
  id v8 = [v7 photoAnalysisClient];
  id v9 = (void *)[v6 initWithServiceProvider:v8];

  long long v10 = dispatch_group_create();
  dispatch_group_enter(v10);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5;
  v15[3] = &unk_1E5DB7780;
  uint64_t v17 = &v18;
  id v11 = v10;
  long long v16 = v11;
  [v9 performGraphRebuildWithOptions:MEMORY[0x1E4F1CC08] operationID:&stru_1F00B0030 reply:v15];
  dispatch_time_t v12 = dispatch_time(0, -1);
  dispatch_group_wait(v11, v12);
  uint64_t v13 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v13;
}

void __57__PXMemoriesRelatedSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end