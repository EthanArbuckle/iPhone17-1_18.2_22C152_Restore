@interface SKGProcessorContext
+ (id)sharedContext;
- (BOOL)enableCalendarEventClassification;
- (BOOL)enableDocumentUnderstanding;
- (BOOL)enableEmbeddings;
- (BOOL)enableEventUpdater;
- (BOOL)enableExtractions;
- (BOOL)enableKeyphrases;
- (BOOL)enableMegadomePeople;
- (BOOL)enablePeople;
- (BOOL)enableSuggestedEvents;
- (SKGProcessorContext)init;
- (SKGProcessorContext)initWithPreferredLanguages:(id)a3 locale:(id)a4;
- (id)bundleIdentifier;
- (id)cleanupAttributes;
- (id)docUnderstandingExtractionAttributes;
- (id)docUnderstandingFetchAttributes;
- (id)docUnderstandingIncludeBundles;
- (id)docUnderstandingItemDomainIds;
- (id)docUnderstandingTrackingAttributes;
- (id)embeddingExcludeBundles;
- (id)embeddingExcludeContentTypes;
- (id)embeddingExcludeDomainIdentifier;
- (id)embeddingExtractionAttributes;
- (id)embeddingFetchAttributes;
- (id)embeddingTrackingAttributes;
- (id)excludeBundles;
- (id)fetchAttributes;
- (id)keyphraseExcludeBundles;
- (id)keyphraseExtractionAttributes;
- (id)keyphraseFetchAttributes;
- (id)keyphraseTrackingAttributes;
- (id)peopleExtractionAttributes;
- (id)peopleFetchAttributes;
- (id)peoplePreferredBundles;
- (id)suggestedEventsAllowListAttributes;
- (id)suggestedEventsExtractionAttributes;
- (id)suggestedEventsFetchAttributes;
- (id)suggestedEventsIncludeBundles;
- (id)suggestedEventsTrackingAttributes;
- (int64_t)documentUnderstandingVersion;
- (int64_t)embeddingModelVersion;
- (int64_t)embeddingVersion;
- (int64_t)graphVersion;
- (int64_t)keyphraseVersion;
- (int64_t)knowledgeVersion;
- (int64_t)maxArchiveSize;
- (int64_t)maxEntityCount;
- (int64_t)maxGraphSize;
- (int64_t)maxItemBatchCount;
- (int64_t)maxJournalItemCount;
- (int64_t)maxJournalSize;
- (int64_t)maxJournalSizeForPurge;
- (int64_t)maxQueryItemCount;
- (int64_t)releaseVersion;
- (int64_t)suggestedEventsVersion;
- (int64_t)textVersion;
- (void)commonInitWithBundleIdentifier:(id)a3;
- (void)setMaxArchiveSize:(int64_t)a3;
- (void)setMaxEntityCount:(int64_t)a3;
- (void)setMaxGraphSize:(int64_t)a3;
- (void)setMaxItemBatchCount:(int64_t)a3;
- (void)setMaxJournalItemCount:(int64_t)a3;
- (void)setMaxJournalSize:(int64_t)a3;
- (void)setMaxJournalSizeForPurge:(int64_t)a3;
- (void)setMaxQueryItemCount:(int64_t)a3;
@end

@implementation SKGProcessorContext

uint64_t __36__SKGProcessorContext_sharedContext__block_invoke()
{
  sharedContext_sSharedContext = objc_alloc_init(SKGProcessorContext);
  return MEMORY[0x270F9A758]();
}

- (SKGProcessorContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKGProcessorContext;
  v2 = [(SKGProcessorContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(SKGProcessorContext *)v2 commonInitWithBundleIdentifier:@"com.apple.spotlight.contacts"];
  }
  return v3;
}

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1) {
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedContext_sSharedContext;
  return v2;
}

- (BOOL)enableSuggestedEvents
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableKeyphrases
{
  return 1;
}

- (BOOL)enableEmbeddings
{
  if (!_os_feature_enabled_impl() || !_os_feature_enabled_impl()) {
    return 0;
  }
  v2 = [MEMORY[0x263F78CD0] sharedInstance];
  char v3 = [v2 deviceCanGenerateEmbeddings];

  return v3;
}

- (BOOL)enableDocumentUnderstanding
{
  return _os_feature_enabled_impl();
}

- (id)keyphraseExcludeBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SKGProcessorContext_keyphraseExcludeBundles__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (keyphraseExcludeBundles_onceToken != -1) {
    dispatch_once(&keyphraseExcludeBundles_onceToken, block);
  }
  return (id)keyphraseExcludeBundles_gKeyphraseExcludeBundles;
}

- (void)commonInitWithBundleIdentifier:(id)a3
{
}

- (SKGProcessorContext)initWithPreferredLanguages:(id)a3 locale:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SKGProcessorContext;
  v4 = [(SKGProcessorContext *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(SKGProcessorContext *)v4 commonInitWithBundleIdentifier:@"com.apple.cslinguistics"];
  }
  return v5;
}

- (BOOL)enablePeople
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableCalendarEventClassification
{
  if (enableCalendarEventClassification_onceEnableCalendarEventClassificationFFToken != -1) {
    dispatch_once(&enableCalendarEventClassification_onceEnableCalendarEventClassificationFFToken, &__block_literal_global_45);
  }
  return enableCalendarEventClassification_sCalendarEventClassificationEnabled;
}

uint64_t __56__SKGProcessorContext_enableCalendarEventClassification__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  enableCalendarEventClassification_sCalendarEventClassificationEnabled = result;
  return result;
}

- (BOOL)enableExtractions
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableMegadomePeople
{
  return _os_feature_enabled_impl();
}

- (BOOL)enableEventUpdater
{
  return _os_feature_enabled_impl();
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (int64_t)knowledgeVersion
{
  return 2;
}

- (int64_t)embeddingVersion
{
  return 3;
}

- (int64_t)embeddingModelVersion
{
  return [MEMORY[0x263F78CD0] version];
}

- (int64_t)keyphraseVersion
{
  return 13;
}

- (int64_t)suggestedEventsVersion
{
  return 1;
}

- (int64_t)documentUnderstandingVersion
{
  return 1;
}

- (int64_t)releaseVersion
{
  return 3;
}

- (int64_t)textVersion
{
  return 2;
}

- (int64_t)graphVersion
{
  return 26;
}

- (int64_t)maxGraphSize
{
  return 1000000000;
}

- (int64_t)maxArchiveSize
{
  return 1000000000;
}

- (int64_t)maxJournalSize
{
  return 1000000000;
}

- (int64_t)maxJournalSizeForPurge
{
  return 0x100000000;
}

- (int64_t)maxEntityCount
{
  return 10;
}

- (int64_t)maxQueryItemCount
{
  return 100000;
}

- (int64_t)maxItemBatchCount
{
  return 500;
}

- (int64_t)maxJournalItemCount
{
  return 60000;
}

- (id)fetchAttributes
{
  return &unk_270B14EC0;
}

- (id)excludeBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__SKGProcessorContext_excludeBundles__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (excludeBundles_onceExcludeToken != -1) {
    dispatch_once(&excludeBundles_onceExcludeToken, block);
  }
  return (id)excludeBundles_gExcludeBundles;
}

void __37__SKGProcessorContext_excludeBundles__block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  [v5 addObject:v2];

  [v5 addObject:@"com.apple.spotlight.contacts"];
  [v5 addObject:@"com.apple.searchd"];
  [v5 addObject:@"com.apple.suggestd"];
  [v5 addObject:@"com.apple.cslinguistics"];
  [v5 addObject:@"com.apple.corespotlight.InternalTestsHost"];
  [v5 addObject:@"com.apple.corespotlight.TestsHost"];
  [v5 addObject:@"com.apple.pommesctl"];
  [v5 addObject:@"com.apple.usernotificationsd"];
  uint64_t v3 = [v5 allObjects];
  v4 = (void *)excludeBundles_gExcludeBundles;
  excludeBundles_gExcludeBundles = v3;
}

- (id)cleanupAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SKGProcessorContext_cleanupAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (cleanupAttributes_onceCleanToken != -1) {
    dispatch_once(&cleanupAttributes_onceCleanToken, block);
  }
  return (id)cleanupAttributes_gAllCleanupAttrs;
}

void __40__SKGProcessorContext_cleanupAttributes__block_invoke(uint64_t a1)
{
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2 = [*(id *)(a1 + 32) embeddingTrackingAttributes];
  [v8 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 32) keyphraseTrackingAttributes];
  [v8 addObjectsFromArray:v3];

  v4 = [*(id *)(a1 + 32) suggestedEventsTrackingAttributes];
  [v8 addObjectsFromArray:v4];

  id v5 = [*(id *)(a1 + 32) docUnderstandingTrackingAttributes];
  [v8 addObjectsFromArray:v5];

  uint64_t v6 = [v8 allObjects];
  objc_super v7 = (void *)cleanupAttributes_gAllCleanupAttrs;
  cleanupAttributes_gAllCleanupAttrs = v6;
}

- (id)embeddingFetchAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SKGProcessorContext_embeddingFetchAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (embeddingFetchAttributes_onceToken != -1) {
    dispatch_once(&embeddingFetchAttributes_onceToken, block);
  }
  return (id)embeddingFetchAttributes_gAllEmbeddingAttrs;
}

void __47__SKGProcessorContext_embeddingFetchAttributes__block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2 = [*(id *)(a1 + 32) fetchAttributes];
  [v6 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 32) embeddingExtractionAttributes];
  [v6 addObjectsFromArray:v3];

  uint64_t v4 = [v6 allObjects];
  id v5 = (void *)embeddingFetchAttributes_gAllEmbeddingAttrs;
  embeddingFetchAttributes_gAllEmbeddingAttrs = v4;
}

- (id)embeddingExtractionAttributes
{
  return &unk_270B14ED8;
}

- (id)embeddingTrackingAttributes
{
  return &unk_270B14EF0;
}

- (id)embeddingExcludeBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SKGProcessorContext_embeddingExcludeBundles__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (embeddingExcludeBundles_onceEmbExcludeToken != -1) {
    dispatch_once(&embeddingExcludeBundles_onceEmbExcludeToken, block);
  }
  return (id)embeddingExcludeBundles_gEmbeddingExcludeBundles;
}

void __46__SKGProcessorContext_embeddingExcludeBundles__block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v2 = [*(id *)(a1 + 32) excludeBundles];
  [v5 addObjectsFromArray:v2];

  [v5 addObjectsFromArray:&unk_270B14F08];
  uint64_t v3 = [v5 allObjects];
  uint64_t v4 = (void *)embeddingExcludeBundles_gEmbeddingExcludeBundles;
  embeddingExcludeBundles_gEmbeddingExcludeBundles = v3;
}

- (id)embeddingExcludeContentTypes
{
  if (embeddingExcludeContentTypes_onceEmbExcludeToken != -1) {
    dispatch_once(&embeddingExcludeContentTypes_onceEmbExcludeToken, &__block_literal_global_275);
  }
  v2 = (void *)embeddingExcludeContentTypes_gEmbeddingExcludeContentTypes;
  return v2;
}

void __51__SKGProcessorContext_embeddingExcludeContentTypes__block_invoke()
{
  v9[14] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1DDA0];
  v9[0] = *MEMORY[0x263F1DB48];
  v9[1] = v0;
  uint64_t v1 = *MEMORY[0x263F1DA98];
  v9[2] = *MEMORY[0x263F1DD88];
  v9[3] = v1;
  uint64_t v2 = *MEMORY[0x263F1DA30];
  v9[4] = *MEMORY[0x263F1DAC0];
  v9[5] = v2;
  uint64_t v3 = *MEMORY[0x263F1DC28];
  v9[6] = *MEMORY[0x263F1DB18];
  v9[7] = v3;
  uint64_t v4 = *MEMORY[0x263F1DA50];
  v9[8] = *MEMORY[0x263F1D9B8];
  v9[9] = v4;
  uint64_t v5 = *MEMORY[0x263F1DCB0];
  v9[10] = *MEMORY[0x263F1D9C0];
  v9[11] = v5;
  uint64_t v6 = *MEMORY[0x263F1DA58];
  v9[12] = *MEMORY[0x263F1DDA8];
  v9[13] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:14];
  id v8 = (void *)embeddingExcludeContentTypes_gEmbeddingExcludeContentTypes;
  embeddingExcludeContentTypes_gEmbeddingExcludeContentTypes = v7;
}

- (id)embeddingExcludeDomainIdentifier
{
  if (embeddingExcludeDomainIdentifier_onceEmbExcludeToken != -1) {
    dispatch_once(&embeddingExcludeDomainIdentifier_onceEmbExcludeToken, &__block_literal_global_278);
  }
  uint64_t v2 = (void *)embeddingExcludeDomainIdentifier_gEmbeddingDomainIdentifier;
  return v2;
}

void __55__SKGProcessorContext_embeddingExcludeDomainIdentifier__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v2 addObjectsFromArray:&unk_270B14F20];
  uint64_t v0 = [v2 allObjects];
  uint64_t v1 = (void *)embeddingExcludeDomainIdentifier_gEmbeddingDomainIdentifier;
  embeddingExcludeDomainIdentifier_gEmbeddingDomainIdentifier = v0;
}

- (id)keyphraseExtractionAttributes
{
  return &unk_270B14F38;
}

- (id)keyphraseFetchAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__SKGProcessorContext_keyphraseFetchAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (keyphraseFetchAttributes_onceToken != -1) {
    dispatch_once(&keyphraseFetchAttributes_onceToken, block);
  }
  return (id)keyphraseFetchAttributes_gAllKeyphraseAttrs;
}

void __47__SKGProcessorContext_keyphraseFetchAttributes__block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v2 = [*(id *)(a1 + 32) fetchAttributes];
  [v6 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 32) keyphraseExtractionAttributes];
  [v6 addObjectsFromArray:v3];

  uint64_t v4 = [v6 allObjects];
  uint64_t v5 = (void *)keyphraseFetchAttributes_gAllKeyphraseAttrs;
  keyphraseFetchAttributes_gAllKeyphraseAttrs = v4;
}

- (id)keyphraseTrackingAttributes
{
  return &unk_270B14F50;
}

void __46__SKGProcessorContext_keyphraseExcludeBundles__block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v2 = [*(id *)(a1 + 32) excludeBundles];
  [v5 addObjectsFromArray:v2];

  [v5 addObjectsFromArray:&unk_270B14F68];
  uint64_t v3 = [v5 allObjects];
  uint64_t v4 = (void *)keyphraseExcludeBundles_gKeyphraseExcludeBundles;
  keyphraseExcludeBundles_gKeyphraseExcludeBundles = v3;
}

- (id)suggestedEventsExtractionAttributes
{
  return &unk_270B14F80;
}

- (id)suggestedEventsFetchAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SKGProcessorContext_suggestedEventsFetchAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (suggestedEventsFetchAttributes_onceToken != -1) {
    dispatch_once(&suggestedEventsFetchAttributes_onceToken, block);
  }
  return (id)suggestedEventsFetchAttributes_gAllSuggestedEventsAttrs;
}

void __53__SKGProcessorContext_suggestedEventsFetchAttributes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) fetchAttributes];
  id v2 = [*(id *)(a1 + 32) suggestedEventsExtractionAttributes];
  uint64_t v3 = [v5 arrayByAddingObjectsFromArray:v2];
  uint64_t v4 = (void *)suggestedEventsFetchAttributes_gAllSuggestedEventsAttrs;
  suggestedEventsFetchAttributes_gAllSuggestedEventsAttrs = v3;
}

- (id)suggestedEventsTrackingAttributes
{
  return &unk_270B14F98;
}

- (id)suggestedEventsAllowListAttributes
{
  if (suggestedEventsAllowListAttributes_onceToken != -1) {
    dispatch_once(&suggestedEventsAllowListAttributes_onceToken, &__block_literal_global_337);
  }
  id v2 = (void *)suggestedEventsAllowListAttributes_gAttrs;
  return v2;
}

void __57__SKGProcessorContext_suggestedEventsAllowListAttributes__block_invoke()
{
  id v2 = objc_alloc_init(MEMORY[0x263F02AE8]);
  uint64_t v0 = [v2 getAllUniqueEventAttributes];
  uint64_t v1 = (void *)suggestedEventsAllowListAttributes_gAttrs;
  suggestedEventsAllowListAttributes_gAttrs = v0;
}

- (id)suggestedEventsIncludeBundles
{
  return &unk_270B14FB0;
}

- (id)peopleExtractionAttributes
{
  return &unk_270B14FC8;
}

- (id)peopleFetchAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SKGProcessorContext_peopleFetchAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (peopleFetchAttributes_onceToken != -1) {
    dispatch_once(&peopleFetchAttributes_onceToken, block);
  }
  return (id)peopleFetchAttributes_gAllPeopleAttrs;
}

void __44__SKGProcessorContext_peopleFetchAttributes__block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v2 = [*(id *)(a1 + 32) fetchAttributes];
  [v6 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 32) peopleExtractionAttributes];
  [v6 addObjectsFromArray:v3];

  [v6 addObjectsFromArray:&unk_270B14FE0];
  uint64_t v4 = [v6 allObjects];
  id v5 = (void *)peopleFetchAttributes_gAllPeopleAttrs;
  peopleFetchAttributes_gAllPeopleAttrs = v4;
}

- (id)peoplePreferredBundles
{
  return &unk_270B14FF8;
}

- (id)docUnderstandingFetchAttributes
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__SKGProcessorContext_docUnderstandingFetchAttributes__block_invoke;
  block[3] = &unk_265520F88;
  block[4] = self;
  if (docUnderstandingFetchAttributes_onceToken != -1) {
    dispatch_once(&docUnderstandingFetchAttributes_onceToken, block);
  }
  return (id)docUnderstandingFetchAttributes_gAllDocUnderstandingAttrs;
}

void __54__SKGProcessorContext_docUnderstandingFetchAttributes__block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v2 = [*(id *)(a1 + 32) fetchAttributes];
  [v6 addObjectsFromArray:v2];

  uint64_t v3 = [*(id *)(a1 + 32) docUnderstandingExtractionAttributes];
  [v6 addObjectsFromArray:v3];

  [v6 addObjectsFromArray:&unk_270B15010];
  uint64_t v4 = [v6 allObjects];
  id v5 = (void *)docUnderstandingFetchAttributes_gAllDocUnderstandingAttrs;
  docUnderstandingFetchAttributes_gAllDocUnderstandingAttrs = v4;
}

- (id)docUnderstandingExtractionAttributes
{
  return &unk_270B15028;
}

- (id)docUnderstandingTrackingAttributes
{
  return &unk_270B15040;
}

- (id)docUnderstandingIncludeBundles
{
  return &unk_270B15058;
}

- (id)docUnderstandingItemDomainIds
{
  return &unk_270B15070;
}

- (void)setMaxGraphSize:(int64_t)a3
{
  self->_maxGraphSize = a3;
}

- (void)setMaxArchiveSize:(int64_t)a3
{
  self->_maxArchiveSize = a3;
}

- (void)setMaxJournalSize:(int64_t)a3
{
  self->_maxJournalSize = a3;
}

- (void)setMaxJournalSizeForPurge:(int64_t)a3
{
  self->_maxJournalSizeForPurge = a3;
}

- (void)setMaxEntityCount:(int64_t)a3
{
  self->_maxEntityCount = a3;
}

- (void)setMaxQueryItemCount:(int64_t)a3
{
  self->_maxQueryItemCount = a3;
}

- (void)setMaxItemBatchCount:(int64_t)a3
{
  self->_maxItemBatchCount = a3;
}

- (void)setMaxJournalItemCount:(int64_t)a3
{
  self->_maxJournalItemCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightResourcesRoot, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end