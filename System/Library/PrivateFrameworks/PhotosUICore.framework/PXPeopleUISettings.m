@interface PXPeopleUISettings
+ (PXPeopleUISettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)alwaysShowBanner;
- (BOOL)alwaysShowBootstrap;
- (BOOL)alwaysShowMe;
- (BOOL)debugFadeLayer;
- (BOOL)displayBootstrapSuggestionType;
- (BOOL)displayReviewMorePhotosDate;
- (BOOL)displayReviewMorePhotosSuggestionType;
- (BOOL)enableBootstrapDemoMode;
- (BOOL)enableReviewPhotosDemoMode;
- (BOOL)forceReviewMorePhotosInterimLoading;
- (BOOL)ignoreAttributionFiltering;
- (BOOL)ignoreNegativeSuggestionFeedback;
- (BOOL)mockEmptyContentUpdates;
- (BOOL)mockProcessingUpdates;
- (BOOL)showReviewPhotosObjectType;
- (BOOL)showUUIDIfNoName;
- (BOOL)useBootstrapMockDataSource;
- (BOOL)useGridZeroForDetails;
- (BOOL)useReviewPhotosMockDataSource;
- (NSString)debugContactIdentifier;
- (id)parentSettings;
- (int64_t)debugBannerAttribution;
- (int64_t)debugBannerStyle;
- (int64_t)negativeFeedbackWaitPeriodMinutes;
- (void)setAlwaysShowBanner:(BOOL)a3;
- (void)setAlwaysShowBootstrap:(BOOL)a3;
- (void)setAlwaysShowMe:(BOOL)a3;
- (void)setDebugBannerAttribution:(int64_t)a3;
- (void)setDebugBannerStyle:(int64_t)a3;
- (void)setDebugContactIdentifier:(id)a3;
- (void)setDebugFadeLayer:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDisplayBootstrapSuggestionType:(BOOL)a3;
- (void)setDisplayReviewMorePhotosDate:(BOOL)a3;
- (void)setDisplayReviewMorePhotosSuggestionType:(BOOL)a3;
- (void)setEnableBootstrapDemoMode:(BOOL)a3;
- (void)setEnableReviewPhotosDemoMode:(BOOL)a3;
- (void)setForceReviewMorePhotosInterimLoading:(BOOL)a3;
- (void)setIgnoreAttributionFiltering:(BOOL)a3;
- (void)setIgnoreNegativeSuggestionFeedback:(BOOL)a3;
- (void)setMockEmptyContentUpdates:(BOOL)a3;
- (void)setMockProcessingUpdates:(BOOL)a3;
- (void)setNegativeFeedbackWaitPeriodMinutes:(int64_t)a3;
- (void)setShowReviewPhotosObjectType:(BOOL)a3;
- (void)setShowUUIDIfNoName:(BOOL)a3;
- (void)setUseBootstrapMockDataSource:(BOOL)a3;
- (void)setUseGridZeroForDetails:(BOOL)a3;
- (void)setUseReviewPhotosMockDataSource:(BOOL)a3;
@end

@implementation PXPeopleUISettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleUISettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPeopleUISettings *)self setAlwaysShowBanner:0];
  [(PXPeopleUISettings *)self setDebugBannerStyle:0];
  [(PXPeopleUISettings *)self setDebugBannerAttribution:0];
  [(PXPeopleUISettings *)self setIgnoreNegativeSuggestionFeedback:0];
  [(PXPeopleUISettings *)self setNegativeFeedbackWaitPeriodMinutes:1440];
  [(PXPeopleUISettings *)self setIgnoreAttributionFiltering:0];
  [(PXPeopleUISettings *)self setMockProcessingUpdates:0];
  [(PXPeopleUISettings *)self setMockEmptyContentUpdates:0];
  [(PXPeopleUISettings *)self setAlwaysShowMe:0];
  [(PXPeopleUISettings *)self setUseGridZeroForDetails:0];
  [(PXPeopleUISettings *)self setDebugFadeLayer:0];
  [(PXPeopleUISettings *)self setShowUUIDIfNoName:0];
  [(PXPeopleUISettings *)self setEnableReviewPhotosDemoMode:0];
  [(PXPeopleUISettings *)self setUseReviewPhotosMockDataSource:0];
  [(PXPeopleUISettings *)self setShowReviewPhotosObjectType:0];
  [(PXPeopleUISettings *)self setForceReviewMorePhotosInterimLoading:0];
  [(PXPeopleUISettings *)self setDisplayReviewMorePhotosSuggestionType:0];
  [(PXPeopleUISettings *)self setDisplayReviewMorePhotosDate:0];
  [(PXPeopleUISettings *)self setAlwaysShowBootstrap:0];
  [(PXPeopleUISettings *)self setEnableBootstrapDemoMode:0];
  [(PXPeopleUISettings *)self setUseBootstrapMockDataSource:0];
  [(PXPeopleUISettings *)self setDisplayBootstrapSuggestionType:0];
}

- (void)setUseReviewPhotosMockDataSource:(BOOL)a3
{
  self->_useReviewPhotosMockDataSource = a3;
}

- (void)setUseGridZeroForDetails:(BOOL)a3
{
  self->_useGridZeroForDetails = a3;
}

- (void)setUseBootstrapMockDataSource:(BOOL)a3
{
  self->_useBootstrapMockDataSource = a3;
}

- (void)setShowUUIDIfNoName:(BOOL)a3
{
  self->_showUUIDIfNoName = a3;
}

- (void)setShowReviewPhotosObjectType:(BOOL)a3
{
  self->_showReviewPhotosObjectType = a3;
}

- (void)setNegativeFeedbackWaitPeriodMinutes:(int64_t)a3
{
  self->_negativeFeedbackWaitPeriodMinutes = a3;
}

- (void)setMockProcessingUpdates:(BOOL)a3
{
  self->_mockProcessingUpdates = a3;
}

- (void)setMockEmptyContentUpdates:(BOOL)a3
{
  self->_mockEmptyContentUpdates = a3;
}

- (void)setIgnoreNegativeSuggestionFeedback:(BOOL)a3
{
  self->_ignoreNegativeSuggestionFeedback = a3;
}

- (void)setIgnoreAttributionFiltering:(BOOL)a3
{
  self->_ignoreAttributionFiltering = a3;
}

- (void)setForceReviewMorePhotosInterimLoading:(BOOL)a3
{
  self->_forceReviewMorePhotosInterimLoading = a3;
}

- (void)setEnableReviewPhotosDemoMode:(BOOL)a3
{
  self->_enableReviewPhotosDemoMode = a3;
}

- (void)setEnableBootstrapDemoMode:(BOOL)a3
{
  self->_enableBootstrapDemoMode = a3;
}

- (void)setDisplayReviewMorePhotosSuggestionType:(BOOL)a3
{
  self->_displayReviewMorePhotosSuggestionType = a3;
}

- (void)setDisplayReviewMorePhotosDate:(BOOL)a3
{
  self->_displayReviewMorePhotosDate = a3;
}

- (void)setDisplayBootstrapSuggestionType:(BOOL)a3
{
  self->_displayBootstrapSuggestionType = a3;
}

- (void)setDebugFadeLayer:(BOOL)a3
{
  self->_debugFadeLayer = a3;
}

- (void)setDebugBannerStyle:(int64_t)a3
{
  self->_debugBannerStyle = a3;
}

- (void)setDebugBannerAttribution:(int64_t)a3
{
  self->_debugBannerAttribution = a3;
}

- (void)setAlwaysShowMe:(BOOL)a3
{
  self->_alwaysShowMe = a3;
}

- (void)setAlwaysShowBootstrap:(BOOL)a3
{
  self->_alwaysShowBootstrap = a3;
}

- (void)setAlwaysShowBanner:(BOOL)a3
{
  self->_alwaysShowBanner = a3;
}

void __36__PXPeopleUISettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 peopleUISettings];
  v1 = (void *)sharedInstance_sharedInstance_231883;
  sharedInstance_sharedInstance_231883 = v0;
}

+ (PXPeopleUISettings)sharedInstance
{
  if (sharedInstance_onceToken_231881 != -1) {
    dispatch_once(&sharedInstance_onceToken_231881, &__block_literal_global_231882);
  }
  id v2 = (void *)sharedInstance_sharedInstance_231883;
  return (PXPeopleUISettings *)v2;
}

+ (id)settingsControllerModule
{
}

- (void).cxx_destruct
{
}

- (BOOL)displayBootstrapSuggestionType
{
  return self->_displayBootstrapSuggestionType;
}

- (BOOL)useBootstrapMockDataSource
{
  return self->_useBootstrapMockDataSource;
}

- (BOOL)enableBootstrapDemoMode
{
  return self->_enableBootstrapDemoMode;
}

- (BOOL)alwaysShowBootstrap
{
  return self->_alwaysShowBootstrap;
}

- (BOOL)displayReviewMorePhotosDate
{
  return self->_displayReviewMorePhotosDate;
}

- (BOOL)displayReviewMorePhotosSuggestionType
{
  return self->_displayReviewMorePhotosSuggestionType;
}

- (BOOL)forceReviewMorePhotosInterimLoading
{
  return self->_forceReviewMorePhotosInterimLoading;
}

- (BOOL)showReviewPhotosObjectType
{
  return self->_showReviewPhotosObjectType;
}

- (BOOL)useReviewPhotosMockDataSource
{
  return self->_useReviewPhotosMockDataSource;
}

- (BOOL)enableReviewPhotosDemoMode
{
  return self->_enableReviewPhotosDemoMode;
}

- (BOOL)showUUIDIfNoName
{
  return self->_showUUIDIfNoName;
}

- (BOOL)debugFadeLayer
{
  return self->_debugFadeLayer;
}

- (BOOL)useGridZeroForDetails
{
  return self->_useGridZeroForDetails;
}

- (BOOL)alwaysShowMe
{
  return self->_alwaysShowMe;
}

- (BOOL)mockEmptyContentUpdates
{
  return self->_mockEmptyContentUpdates;
}

- (BOOL)mockProcessingUpdates
{
  return self->_mockProcessingUpdates;
}

- (void)setDebugContactIdentifier:(id)a3
{
}

- (NSString)debugContactIdentifier
{
  return self->_debugContactIdentifier;
}

- (BOOL)ignoreAttributionFiltering
{
  return self->_ignoreAttributionFiltering;
}

- (int64_t)negativeFeedbackWaitPeriodMinutes
{
  return self->_negativeFeedbackWaitPeriodMinutes;
}

- (BOOL)ignoreNegativeSuggestionFeedback
{
  return self->_ignoreNegativeSuggestionFeedback;
}

- (int64_t)debugBannerAttribution
{
  return self->_debugBannerAttribution;
}

- (int64_t)debugBannerStyle
{
  return self->_debugBannerStyle;
}

- (BOOL)alwaysShowBanner
{
  return self->_alwaysShowBanner;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end