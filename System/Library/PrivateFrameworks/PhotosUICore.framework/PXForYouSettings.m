@interface PXForYouSettings
+ (NSArray)keyPathsAffectingGadgetVisibility;
+ (PXForYouSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowGIFPlayback;
- (BOOL)allowLoopPlayback;
- (BOOL)allowVideoPlayback;
- (BOOL)alwaysShowSuggestionRenderingOverlay;
- (BOOL)delayEditRenders;
- (BOOL)disableSharedAlbumTopMargin;
- (BOOL)forceDisplayReportJunk;
- (BOOL)forcePortraitBias;
- (BOOL)showCMMInvitations;
- (BOOL)showContentSyndication;
- (BOOL)showFooter;
- (BOOL)showHorizontalGadget;
- (BOOL)showMemories;
- (BOOL)showRecentInterestSuggestions;
- (BOOL)showSharedAlbumActivity;
- (BOOL)showSharedLibraryInvitations;
- (BOOL)showSharedLibrarySharingSuggestions;
- (BOOL)showSurveyQuestions;
- (BOOL)showSurveyQuestionsWithProfile;
- (BOOL)showVerticalSampleGadgets;
- (BOOL)useCachedEditRenders;
- (BOOL)useMockData;
- (BOOL)useSquareSharedAlbumActivity;
- (double)minimumVisibilityForVideoPlayback;
- (id)parentSettings;
- (int64_t)version;
- (unint64_t)maxMemoriesToFetch;
- (unint64_t)maxSimultaneousVideoCount;
- (void)setAllowGIFPlayback:(BOOL)a3;
- (void)setAllowLoopPlayback:(BOOL)a3;
- (void)setAllowVideoPlayback:(BOOL)a3;
- (void)setAlwaysShowSuggestionRenderingOverlay:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDelayEditRenders:(BOOL)a3;
- (void)setDisableSharedAlbumTopMargin:(BOOL)a3;
- (void)setForceDisplayReportJunk:(BOOL)a3;
- (void)setForcePortraitBias:(BOOL)a3;
- (void)setMaxMemoriesToFetch:(unint64_t)a3;
- (void)setMaxSimultaneousVideoCount:(unint64_t)a3;
- (void)setMinimumVisibilityForVideoPlayback:(double)a3;
- (void)setShowCMMInvitations:(BOOL)a3;
- (void)setShowContentSyndication:(BOOL)a3;
- (void)setShowFooter:(BOOL)a3;
- (void)setShowHorizontalGadget:(BOOL)a3;
- (void)setShowMemories:(BOOL)a3;
- (void)setShowRecentInterestSuggestions:(BOOL)a3;
- (void)setShowSharedAlbumActivity:(BOOL)a3;
- (void)setShowSharedLibraryInvitations:(BOOL)a3;
- (void)setShowSharedLibrarySharingSuggestions:(BOOL)a3;
- (void)setShowSurveyQuestions:(BOOL)a3;
- (void)setShowSurveyQuestionsWithProfile:(BOOL)a3;
- (void)setShowVerticalSampleGadgets:(BOOL)a3;
- (void)setUseCachedEditRenders:(BOOL)a3;
- (void)setUseMockData:(BOOL)a3;
- (void)setUseSquareSharedAlbumActivity:(BOOL)a3;
@end

@implementation PXForYouSettings

- (void)setDefaultValues
{
  v6.receiver = self;
  v6.super_class = (Class)PXForYouSettings;
  [(PTSettings *)&v6 setDefaultValues];
  uint64_t v3 = 1;
  [(PXForYouSettings *)self setShowMemories:1];
  [(PXForYouSettings *)self setShowSharedAlbumActivity:1];
  [(PXForYouSettings *)self setShowCMMInvitations:1];
  [(PXForYouSettings *)self setShowRecentInterestSuggestions:1];
  [(PXForYouSettings *)self setShowFooter:0];
  int HasInternalUI = PFOSVariantHasInternalUI();
  if ((HasInternalUI & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [v5 BOOLForKey:@"photosChallengeProfileEnabled"];
  }
  [(PXForYouSettings *)self setShowSurveyQuestions:v3];
  [(PXForYouSettings *)self setShowSurveyQuestionsWithProfile:HasInternalUI ^ 1u];
  [(PXForYouSettings *)self setShowVerticalSampleGadgets:0];
  [(PXForYouSettings *)self setShowHorizontalGadget:0];
  [(PXForYouSettings *)self setShowSharedLibraryInvitations:1];
  [(PXForYouSettings *)self setShowSharedLibrarySharingSuggestions:1];
  [(PXForYouSettings *)self setShowContentSyndication:1];
  [(PXForYouSettings *)self setUseMockData:0];
  [(PXForYouSettings *)self setForceDisplayReportJunk:0];
  [(PXForYouSettings *)self setForcePortraitBias:0];
  [(PXForYouSettings *)self setUseSquareSharedAlbumActivity:1];
  [(PXForYouSettings *)self setDisableSharedAlbumTopMargin:1];
  [(PXForYouSettings *)self setAlwaysShowSuggestionRenderingOverlay:0];
  [(PXForYouSettings *)self setUseCachedEditRenders:1];
  [(PXForYouSettings *)self setDelayEditRenders:0];
  [(PXForYouSettings *)self setAllowVideoPlayback:0];
  [(PXForYouSettings *)self setAllowLoopPlayback:1];
  [(PXForYouSettings *)self setAllowGIFPlayback:1];
  [(PXForYouSettings *)self setMaxSimultaneousVideoCount:5];
  [(PXForYouSettings *)self setMinimumVisibilityForVideoPlayback:15.0];
  [(PXForYouSettings *)self setMaxMemoriesToFetch:13];
}

- (void)setUseSquareSharedAlbumActivity:(BOOL)a3
{
  self->_useSquareSharedAlbumActivity = a3;
}

- (void)setUseMockData:(BOOL)a3
{
  self->_useMockData = a3;
}

- (void)setUseCachedEditRenders:(BOOL)a3
{
  self->_useCachedEditRenders = a3;
}

- (void)setShowVerticalSampleGadgets:(BOOL)a3
{
  self->_showVerticalSampleGadgets = a3;
}

- (void)setShowSurveyQuestionsWithProfile:(BOOL)a3
{
  self->_showSurveyQuestionsWithProfile = a3;
}

- (void)setShowSurveyQuestions:(BOOL)a3
{
  self->_showSurveyQuestions = a3;
}

- (void)setShowSharedLibrarySharingSuggestions:(BOOL)a3
{
  self->_showSharedLibrarySharingSuggestions = a3;
}

- (void)setShowSharedLibraryInvitations:(BOOL)a3
{
  self->_showSharedLibraryInvitations = a3;
}

- (void)setShowSharedAlbumActivity:(BOOL)a3
{
  self->_showSharedAlbumActivity = a3;
}

- (void)setShowRecentInterestSuggestions:(BOOL)a3
{
  self->_showRecentInterestSuggestions = a3;
}

- (void)setShowMemories:(BOOL)a3
{
  self->_showMemories = a3;
}

- (void)setShowHorizontalGadget:(BOOL)a3
{
  self->_showHorizontalGadget = a3;
}

- (void)setShowFooter:(BOOL)a3
{
  self->_showFooter = a3;
}

- (void)setShowContentSyndication:(BOOL)a3
{
  self->_showContentSyndication = a3;
}

- (void)setShowCMMInvitations:(BOOL)a3
{
  self->_showCMMInvitations = a3;
}

- (void)setMinimumVisibilityForVideoPlayback:(double)a3
{
  self->_minimumVisibilityForVideoPlayback = a3;
}

- (void)setMaxSimultaneousVideoCount:(unint64_t)a3
{
  self->_maxSimultaneousVideoCount = a3;
}

- (void)setMaxMemoriesToFetch:(unint64_t)a3
{
  self->_maxMemoriesToFetch = a3;
}

- (void)setForcePortraitBias:(BOOL)a3
{
  self->_forcePortraitBias = a3;
}

- (void)setForceDisplayReportJunk:(BOOL)a3
{
  self->_forceDisplayReportJunk = a3;
}

- (void)setDisableSharedAlbumTopMargin:(BOOL)a3
{
  self->_disableSharedAlbumTopMargin = a3;
}

- (void)setDelayEditRenders:(BOOL)a3
{
  self->_delayEditRenders = a3;
}

- (void)setAlwaysShowSuggestionRenderingOverlay:(BOOL)a3
{
  self->_alwaysShowSuggestionRenderingOverlay = a3;
}

- (void)setAllowVideoPlayback:(BOOL)a3
{
  self->_allowVideoPlayback = a3;
}

- (void)setAllowLoopPlayback:(BOOL)a3
{
  self->_allowLoopPlayback = a3;
}

- (void)setAllowGIFPlayback:(BOOL)a3
{
  self->_allowGIFPlayback = a3;
}

+ (id)settingsControllerModule
{
  v79[12] = *MEMORY[0x1E4F143B8];
  v72 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v73 = [v72 photoLibraryURL];
  v70 = (void *)MEMORY[0x1E4F94160];
  v68 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Memories" valueKeyPath:@"showMemories"];
  v79[0] = v68;
  v2 = (void *)MEMORY[0x1E4F941F0];
  v66 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", objc_msgSend(MEMORY[0x1E4F8AAB0], "sharedStreamsEnabledForPhotoLibraryURL:", v73));
  v63 = objc_msgSend(v2, "px_rowWithTitle:valueKeyPath:condition:", @"Show Shared Album Activity", @"showSharedAlbumActivity", v66);
  v79[1] = v63;
  v61 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show CMM Invitations" valueKeyPath:@"showCMMInvitations"];
  v79[2] = v61;
  v60 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show Recent Interest Suggestions" valueKeyPath:@"showRecentInterestSuggestions"];
  v79[3] = v60;
  uint64_t v3 = (void *)MEMORY[0x1E4F941F0];
  v59 = NSStringFromSelector(sel_showSharedLibraryInvitations);
  v58 = [v3 rowWithTitle:@"Show Shared Library Invitations" valueKeyPath:v59];
  v79[4] = v58;
  v4 = (void *)MEMORY[0x1E4F941F0];
  v57 = NSStringFromSelector(sel_showSharedLibrarySharingSuggestions);
  v56 = [v4 rowWithTitle:@"Show Shared Library Sharing Suggestions" valueKeyPath:v57];
  v79[5] = v56;
  v5 = (void *)MEMORY[0x1E4F941F0];
  objc_super v6 = NSStringFromSelector(sel_showContentSyndication);
  v7 = [v5 rowWithTitle:@"Show Shared With You" valueKeyPath:v6];
  v79[6] = v7;
  v8 = (void *)MEMORY[0x1E4F941F0];
  v9 = NSStringFromSelector(sel_showSurveyQuestions);
  v10 = [v8 rowWithTitle:@"Show Survey Questions" valueKeyPath:v9];
  v79[7] = v10;
  v11 = (void *)MEMORY[0x1E4F941F0];
  v12 = NSStringFromSelector(sel_showSurveyQuestionsWithProfile);
  v13 = [v11 rowWithTitle:@"Show Survey Questions With Profile" valueKeyPath:v12];
  v79[8] = v13;
  v14 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show For You Footer" valueKeyPath:@"showFooter"];
  v79[9] = v14;
  v15 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show V Sample Gadgets" valueKeyPath:@"showVerticalSampleGadgets"];
  v79[10] = v15;
  v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Show H Sample Gadget" valueKeyPath:@"showHorizontalGadget"];
  v79[11] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:12];
  v71 = [v70 sectionWithRows:v17];

  v18 = (void *)MEMORY[0x1E4F94160];
  v19 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Allow Video Playback" valueKeyPath:@"allowVideoPlayback"];
  v78[0] = v19;
  v20 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Allow Loop Playback" valueKeyPath:@"allowLoopPlayback"];
  v78[1] = v20;
  v21 = [MEMORY[0x1E4F941A0] rowWithTitle:@"Max Simultaneous Loops" valueKeyPath:@"maxSimultaneousVideoCount"];
  v22 = [v21 possibleValues:&unk_1F02D4408 titles:&unk_1F02D4420];
  v23 = [v22 conditionFormat:@"allowLoopPlayback == YES"];
  v78[2] = v23;
  v24 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Allow GIF Playback" valueKeyPath:@"allowGIFPlayback"];
  v78[3] = v24;
  v25 = [MEMORY[0x1E4F941B8] rowWithTitle:@"Video Playback Visibility Threshold" valueKeyPath:@"minimumVisibilityForVideoPlayback"];
  v26 = [v25 minValue:0.0 maxValue:40.0];
  v78[4] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:5];
  v69 = [v18 sectionWithRows:v27];

  v64 = (void *)MEMORY[0x1E4F94160];
  v67 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Mock Data" valueKeyPath:@"useMockData"];
  v77[0] = v67;
  v28 = (void *)MEMORY[0x1E4F941F0];
  v62 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", objc_msgSend(MEMORY[0x1E4F8AAB0], "sharedStreamsEnabledForPhotoLibraryURL:", v73));
  v29 = objc_msgSend(v28, "px_rowWithTitle:valueKeyPath:condition:", @"Force Display Report Junk", @"forceDisplayReportJunk", v62);
  v77[1] = v29;
  v30 = (void *)MEMORY[0x1E4F941F0];
  v31 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", objc_msgSend(MEMORY[0x1E4F8AAB0], "sharedStreamsEnabledForPhotoLibraryURL:", v73));
  v32 = objc_msgSend(v30, "px_rowWithTitle:valueKeyPath:condition:", @"Force Portrait Bias", @"forcePortraitBias", v31);
  v77[2] = v32;
  v33 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Square Shared Album Activity" valueKeyPath:@"useSquareSharedAlbumActivity"];
  v77[3] = v33;
  v34 = [MEMORY[0x1E4F941F0] rowWithTitle:@"No Shared Album Top Margin" valueKeyPath:@"disableSharedAlbumTopMargin"];
  v77[4] = v34;
  v35 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Always Show Suggestion Rendering Overlay" valueKeyPath:@"alwaysShowSuggestionRenderingOverlay"];
  v77[5] = v35;
  v36 = [MEMORY[0x1E4F94108] rowWithTitle:@"Max Recent Memories" valueKeyPath:@"maxMemoriesToFetch"];
  v37 = objc_msgSend(MEMORY[0x1E4F1C978], "px_integersFrom:to:", 2, 13);
  v38 = objc_msgSend(v36, "px_possibleValues:", v37);
  v77[6] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:7];
  v65 = [v64 sectionWithRows:v39];

  v40 = (void *)MEMORY[0x1E4F94160];
  v41 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Delay Renders" valueKeyPath:@"delayEditRenders"];
  v76[0] = v41;
  v42 = [MEMORY[0x1E4F941C0] rowWithTitle:@"Use Cached Renders" valueKeyPath:@"useCachedEditRenders"];
  v76[1] = v42;
  v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v44 = [v40 sectionWithRows:v43];

  v45 = (void *)MEMORY[0x1E4F94198];
  v46 = [MEMORY[0x1E4F941B0] actionWithHandler:&__block_literal_global_117107];
  v47 = [v45 rowWithTitle:@"Simulate Next Day" action:v46];

  v48 = (void *)MEMORY[0x1E4F94160];
  v75 = v47;
  v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
  v50 = [v48 sectionWithRows:v49];

  v51 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v52 = (void *)MEMORY[0x1E4F94160];
  v74[0] = v71;
  v74[1] = v65;
  v74[2] = v69;
  v74[3] = v44;
  v74[4] = v50;
  v74[5] = v51;
  v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:6];
  v54 = [v52 moduleWithTitle:@"For You" contents:v53];

  return v54;
}

uint64_t __48__PXForYouSettings_UI__settingsControllerModule__block_invoke()
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F28EA0]) initWithName:@"PXForYouSimluatedNextDateNotification" object:0 userInfo:0];
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotification:v0];

  return 1;
}

- (unint64_t)maxMemoriesToFetch
{
  return self->_maxMemoriesToFetch;
}

- (BOOL)useCachedEditRenders
{
  return self->_useCachedEditRenders;
}

- (BOOL)delayEditRenders
{
  return self->_delayEditRenders;
}

- (BOOL)alwaysShowSuggestionRenderingOverlay
{
  return self->_alwaysShowSuggestionRenderingOverlay;
}

- (BOOL)disableSharedAlbumTopMargin
{
  return self->_disableSharedAlbumTopMargin;
}

- (BOOL)useSquareSharedAlbumActivity
{
  return self->_useSquareSharedAlbumActivity;
}

- (BOOL)forcePortraitBias
{
  return self->_forcePortraitBias;
}

- (BOOL)forceDisplayReportJunk
{
  return self->_forceDisplayReportJunk;
}

- (BOOL)useMockData
{
  return self->_useMockData;
}

- (double)minimumVisibilityForVideoPlayback
{
  return self->_minimumVisibilityForVideoPlayback;
}

- (unint64_t)maxSimultaneousVideoCount
{
  return self->_maxSimultaneousVideoCount;
}

- (BOOL)allowGIFPlayback
{
  return self->_allowGIFPlayback;
}

- (BOOL)allowLoopPlayback
{
  return self->_allowLoopPlayback;
}

- (BOOL)allowVideoPlayback
{
  return self->_allowVideoPlayback;
}

- (BOOL)showContentSyndication
{
  return self->_showContentSyndication;
}

- (BOOL)showSharedLibrarySharingSuggestions
{
  return self->_showSharedLibrarySharingSuggestions;
}

- (BOOL)showSharedLibraryInvitations
{
  return self->_showSharedLibraryInvitations;
}

- (BOOL)showHorizontalGadget
{
  return self->_showHorizontalGadget;
}

- (BOOL)showVerticalSampleGadgets
{
  return self->_showVerticalSampleGadgets;
}

- (BOOL)showFooter
{
  return self->_showFooter;
}

- (BOOL)showSurveyQuestionsWithProfile
{
  return self->_showSurveyQuestionsWithProfile;
}

- (BOOL)showSurveyQuestions
{
  return self->_showSurveyQuestions;
}

- (BOOL)showRecentInterestSuggestions
{
  return self->_showRecentInterestSuggestions;
}

- (BOOL)showCMMInvitations
{
  return self->_showCMMInvitations;
}

- (BOOL)showSharedAlbumActivity
{
  return self->_showSharedAlbumActivity;
}

- (BOOL)showMemories
{
  return self->_showMemories;
}

- (int64_t)version
{
  return 2;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

+ (NSArray)keyPathsAffectingGadgetVisibility
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = NSStringFromSelector(sel_showMemories);
  v13[0] = v2;
  uint64_t v3 = NSStringFromSelector(sel_showSharedAlbumActivity);
  v13[1] = v3;
  v4 = NSStringFromSelector(sel_showRecentInterestSuggestions);
  v13[2] = v4;
  v5 = NSStringFromSelector(sel_showCMMInvitations);
  v13[3] = v5;
  objc_super v6 = NSStringFromSelector(sel_showSurveyQuestions);
  v13[4] = v6;
  v7 = NSStringFromSelector(sel_showSurveyQuestionsWithProfile);
  v13[5] = v7;
  v8 = NSStringFromSelector(sel_showFooter);
  v13[6] = v8;
  v9 = NSStringFromSelector(sel_showVerticalSampleGadgets);
  v13[7] = v9;
  v10 = NSStringFromSelector(sel_showHorizontalGadget);
  v13[8] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return (NSArray *)v11;
}

+ (PXForYouSettings)sharedInstance
{
  if (sharedInstance_onceToken_155102 != -1) {
    dispatch_once(&sharedInstance_onceToken_155102, &__block_literal_global_155103);
  }
  v2 = (void *)sharedInstance_sharedInstance_155104;
  return (PXForYouSettings *)v2;
}

void __34__PXForYouSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 forYou];
  v1 = (void *)sharedInstance_sharedInstance_155104;
  sharedInstance_sharedInstance_155104 = v0;
}

@end