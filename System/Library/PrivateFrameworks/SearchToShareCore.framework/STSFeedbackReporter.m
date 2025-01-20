@interface STSFeedbackReporter
+ (STSFeedbackReporter)sharedInstance;
- (PARSession)parsecSession;
- (id)didStartNetworkRequest:(id)a3 query:(id)a4 queryId:(unint64_t)a5;
- (void)didClearRecents;
- (void)didClearSearchBarInput;
- (void)didEndNetworkRequest:(id)a3 infoDict:(id)a4;
- (void)didEngageCategoryResult:(id)a3 suggestion:(id)a4;
- (void)didEngageProviderLogo;
- (void)didEngageResult:(id)a3;
- (void)didGoToSearch:(id)a3;
- (void)didLoadCategoryResults:(id)a3 recents:(id)a4 queryId:(unint64_t)a5;
- (void)didLoadResults:(id)a3 indexPaths:(id)a4 queryId:(unint64_t)a5;
- (void)didPreviewResult:(id)a3 peek:(BOOL)a4;
- (void)didPreviewResultLongPress:(id)a3;
- (void)didReportConcern:(id)a3 punchout:(id)a4;
- (void)didSearchWithCustomQuery:(id)a3;
- (void)didSearchWithSuggestedQuery:(id)a3;
- (void)didShowProactiveCategories:(id)a3 conversationId:(id)a4;
- (void)didShowProactiveSuggestions:(id)a3 conversationId:(id)a4;
- (void)didShowQuerySuggestions:(id)a3 queryId:(unint64_t)a4;
- (void)didShowResults:(id)a3 scrolling:(BOOL)a4;
- (void)didShowResults:(id)a3 trigger:(unint64_t)a4;
- (void)searchBarDidCancel;
- (void)searchViewDidAppearWithEvent:(unint64_t)a3;
- (void)searchViewDidDisappear;
- (void)setParsecSession:(id)a3;
@end

@implementation STSFeedbackReporter

+ (STSFeedbackReporter)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (STSFeedbackReporter *)v2;
}

uint64_t __37__STSFeedbackReporter_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

  return MEMORY[0x270F9A758](v0, v1);
}

- (void)searchViewDidAppearWithEvent:(unint64_t)a3
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F67A18]) initWithEvent:a3];
  [(PARSession *)self->_parsecSession reportFeedback:v4 queryId:+[STSSearchModel clientQueryId]];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Seassion started", v5, 2u);
  }
}

- (void)didLoadCategoryResults:(id)a3 recents:(id)a4 queryId:(unint64_t)a5
{
  id v16 = a3;
  id v7 = a4;
  v8 = objc_msgSend(v7, "sts_map:", &__block_literal_global_6);
  v9 = objc_msgSend(v16, "sts_map:", &__block_literal_global_9);
  if ([v7 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x263F679E0]);
    [v10 setBundleIdentifier:@"com.apple.hashtagimages.categorylist.recents"];
    [v10 setResults:v7];
  }
  else
  {
    id v10 = 0;
  }
  if ([v16 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x263F679E0]);
    [v11 setBundleIdentifier:@"com.apple.hashtagimages.categorylist.categories"];
    [v11 setResults:v16];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v8 count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263F67A40]), "initWithResults:section:localSectionPosition:personalizationScore:", v8, v10, objc_msgSend(v12, "count"), 0.0);
    [v12 addObject:v13];
  }
  if ([v9 count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x263F67A40]), "initWithResults:section:localSectionPosition:personalizationScore:", v9, v11, objc_msgSend(v12, "count"), 0.0);
    [v12 addObject:v14];
  }
  if ([v12 count])
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F679B8]) initWithSections:v12 blendingDuration:0.0];
    [(PARSession *)self->_parsecSession reportFeedback:v15 queryId:+[STSSearchModel clientQueryId]];
  }
}

id __62__STSFeedbackReporter_didLoadCategoryResults_recents_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = (objc_class *)MEMORY[0x263F679D8];
  id v5 = a2;
  v6 = (void *)[[v4 alloc] initWithResult:v5 hiddenResults:0 duplicateResults:0 localResultPosition:a3];

  return v6;
}

id __62__STSFeedbackReporter_didLoadCategoryResults_recents_queryId___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = (objc_class *)MEMORY[0x263F679D8];
  id v5 = a2;
  v6 = (void *)[[v4 alloc] initWithResult:v5 hiddenResults:0 duplicateResults:0 localResultPosition:a3];

  return v6;
}

- (void)didLoadResults:(id)a3 indexPaths:(id)a4 queryId:(unint64_t)a5
{
  v20[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __57__STSFeedbackReporter_didLoadResults_indexPaths_queryId___block_invoke;
  v18[3] = &unk_264A063A0;
  id v19 = v7;
  id v8 = v7;
  id v9 = a3;
  id v10 = objc_msgSend(v9, "sts_map:", v18);
  id v11 = objc_alloc_init(MEMORY[0x263F679E0]);
  id v12 = [v9 firstObject];
  v13 = [v12 sectionBundleIdentifier];
  [v11 setBundleIdentifier:v13];

  [v11 setResults:v9];
  v14 = (void *)[objc_alloc(MEMORY[0x263F67A40]) initWithResults:v10 section:v11 localSectionPosition:0 personalizationScore:0.0];
  id v15 = objc_alloc(MEMORY[0x263F679B8]);
  v20[0] = v14;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  v17 = (void *)[v15 initWithSections:v16 blendingDuration:0.0];

  [(PARSession *)self->_parsecSession reportFeedback:v17 queryId:+[STSSearchModel clientQueryId]];
}

id __57__STSFeedbackReporter_didLoadResults_indexPaths_queryId___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F679D8];
  id v6 = a2;
  id v7 = [v5 alloc];
  id v8 = [*(id *)(a1 + 32) objectAtIndex:a3];
  id v9 = objc_msgSend(v7, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v6, 0, 0, objc_msgSend(v8, "row"));

  return v9;
}

- (void)didShowResults:(id)a3 scrolling:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id v6 = (objc_class *)MEMORY[0x263F67AD8];
  id v7 = a3;
  id v8 = (id)[[v6 alloc] initWithResults:v7 triggerEvent:v5];

  [(PARSession *)self->_parsecSession reportFeedback:v8 queryId:+[STSSearchModel clientQueryId]];
}

- (void)didShowResults:(id)a3 trigger:(unint64_t)a4
{
  id v6 = (objc_class *)MEMORY[0x263F67AD8];
  id v7 = a3;
  id v8 = (id)[[v6 alloc] initWithResults:v7 triggerEvent:a4];

  [(PARSession *)self->_parsecSession reportFeedback:v8 queryId:+[STSSearchModel clientQueryId]];
}

- (void)didPreviewResult:(id)a3 peek:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (objc_class *)MEMORY[0x263F679C8];
  id v7 = a3;
  id v8 = [v6 alloc];
  if (v4) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = 6;
  }
  id v10 = (id)[v8 initWithResult:v7 triggerEvent:v9 destination:3];

  [(PARSession *)self->_parsecSession reportFeedback:v10 queryId:+[STSSearchModel clientQueryId]];
}

- (void)didPreviewResultLongPress:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x263F679C8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithResult:v5 triggerEvent:7 destination:3];

  [(PARSession *)self->_parsecSession reportFeedback:v6 queryId:+[STSSearchModel clientQueryId]];
}

- (void)didShowProactiveSuggestions:(id)a3 conversationId:(id)a4
{
  v21[3] = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a4;
  id v7 = a3;
  [(STSFeedbackReporter *)self didShowQuerySuggestions:v7 queryId:0];
  id v8 = &stru_26E2ACAA8;
  if (v6) {
    id v8 = v6;
  }
  uint64_t v9 = v8;

  id v10 = objc_msgSend(v7, "sts_map:", &__block_literal_global_28);

  v20[0] = @"name";
  v20[1] = @"predictions";
  id v11 = (void *)MEMORY[0x263EFFA68];
  if (v10) {
    id v11 = v10;
  }
  v21[0] = @"com.apple.suggestd.predictionsshowed";
  v21[1] = v11;
  void v20[2] = @"conversationId";
  v21[2] = v9;
  id v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v13 = (void *)[objc_alloc(MEMORY[0x263F67860]) initWithType:0 jsonFeedback:v12];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [(__CFString *)v9 UTF8String];
    id v15 = [v10 componentsJoinedByString:@", "];
    int v16 = 136315394;
    uint64_t v17 = v14;
    __int16 v18 = 2080;
    uint64_t v19 = [v15 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Showed predictions(%s): %s", (uint8_t *)&v16, 0x16u);
  }
}

uint64_t __66__STSFeedbackReporter_didShowProactiveSuggestions_conversationId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)didShowQuerySuggestions:(id)a3 queryId:(unint64_t)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v6 = objc_msgSend(a3, "sts_map:", &__block_literal_global_48);
  id v7 = objc_msgSend(v6, "sts_map:", &__block_literal_global_66);
  id v8 = objc_alloc_init(MEMORY[0x263F679E0]);
  [v8 setBundleIdentifier:@"com.apple.hashtagimages.querysuggestions"];
  [v8 setResults:v6];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F67A40]) initWithResults:v7 section:v8 localSectionPosition:0 personalizationScore:0.0];
  id v10 = objc_alloc(MEMORY[0x263F679B8]);
  v14[0] = v9;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  id v12 = (void *)[v10 initWithSections:v11 blendingDuration:0.0];

  [(PARSession *)self->_parsecSession reportFeedback:v12 queryId:a4];
  v13 = (void *)[objc_alloc(MEMORY[0x263F67AD8]) initWithResults:v6 triggerEvent:1];
  [(PARSession *)self->_parsecSession reportFeedback:v13 queryId:+[STSSearchModel clientQueryId]];
}

id __55__STSFeedbackReporter_didShowQuerySuggestions_queryId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 suggestion];
  BOOL v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  id v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  id v6 = [v5 componentsJoinedByString:@"_"];
  id v7 = objc_alloc_init(MEMORY[0x263F67A08]);
  id v8 = (void *)MEMORY[0x263F67A90];
  uint64_t v9 = [v2 suggestion];
  id v10 = [v8 textWithString:v9];
  [v7 setTitle:v10];

  id v11 = [NSString stringWithFormat:@"msgs-sug:%@", v6];
  [v7 setIdentifier:v11];

  id v12 = [v2 fbr];

  [v7 setFbr:v12];
  [v7 setSectionBundleIdentifier:@"com.apple.hashtagimages.querysuggestions"];
  [v7 setResultBundleId:@"com.apple.hashtagimages.querysuggestions.suggestion"];
  [v7 setType:1];

  return v7;
}

id __55__STSFeedbackReporter_didShowQuerySuggestions_queryId___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v4 = (objc_class *)MEMORY[0x263F679D8];
  id v5 = a2;
  id v6 = (void *)[[v4 alloc] initWithResult:v5 hiddenResults:0 duplicateResults:0 localResultPosition:a3];

  return v6;
}

- (void)didShowProactiveCategories:(id)a3 conversationId:(id)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  id v5 = (__CFString *)a4;
  uint64_t v6 = objc_msgSend(a3, "sts_map:", &__block_literal_global_68);
  id v7 = (void *)v6;
  v18[0] = @"name";
  v18[1] = @"categories";
  uint64_t v8 = MEMORY[0x263EFFA68];
  if (v6) {
    uint64_t v8 = v6;
  }
  v19[0] = @"com.apple.suggestd.categoriesshowed";
  v19[1] = v8;
  v18[2] = @"conversationId";
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = &stru_26E2ACAA8;
  }
  v19[2] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  id v11 = (void *)[objc_alloc(MEMORY[0x263F67860]) initWithType:0 jsonFeedback:v10];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(__CFString *)v5 UTF8String];
    id v13 = [v7 componentsJoinedByString:@", "];
    int v14 = 136315394;
    uint64_t v15 = v12;
    __int16 v16 = 2080;
    uint64_t v17 = [v13 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Showed categories(%s): %s", (uint8_t *)&v14, 0x16u);
  }
}

__CFString *__65__STSFeedbackReporter_didShowProactiveCategories_conversationId___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 prediction];
  v3 = [v2 identifier];
  BOOL v4 = v3;
  if (!v3) {
    v3 = @"unknown";
  }
  id v5 = v3;

  return v5;
}

- (void)didSearchWithCustomQuery:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = [v3 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Search custom query: %s", (uint8_t *)&v5, 0xCu);
  }
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F67A68]) initWithInput:v3 triggerEvent:2];
  ADClientAddValueForScalarKey();
}

- (void)didSearchWithSuggestedQuery:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)[objc_alloc(MEMORY[0x263F67A80]) initWithSuggestion:v4];
  uint64_t v6 = [v4 suggestion];
  uint64_t v7 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v8 = [v6 componentsSeparatedByCharactersInSet:v7];

  uint64_t v9 = [v8 componentsJoinedByString:@"_"];
  id v10 = objc_alloc_init(MEMORY[0x263F67A08]);
  id v11 = (void *)MEMORY[0x263F67A90];
  uint64_t v12 = [v4 suggestion];
  id v13 = [v11 textWithString:v12];
  [v10 setTitle:v13];

  int v14 = [NSString stringWithFormat:@"msgs-sug:%@", v9];
  [v10 setIdentifier:v14];

  uint64_t v15 = [v4 fbr];
  [v10 setFbr:v15];

  [v10 setSectionBundleIdentifier:@"com.apple.hashtagimages.querysuggestions"];
  [v10 setResultBundleId:@"com.apple.hashtagimages.querysuggestions.suggestion"];
  [v10 setType:1];
  __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F679C8]) initWithResult:v10 triggerEvent:2 destination:0];
  objc_msgSend(v16, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v16];
  ADClientAddValueForScalarKey();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v4 suggestion];
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = [v17 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Search suggestion %s", buf, 0xCu);
  }
}

- (void)didEngageResult:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (void *)[objc_alloc(MEMORY[0x263F679C8]) initWithResult:v4 triggerEvent:2 destination:4];
  objc_msgSend(v5, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v5];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [v4 title];
    id v7 = [v6 text];
    int v8 = 136315138;
    uint64_t v9 = [v7 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Engaged result %s", (uint8_t *)&v8, 0xCu);
  }
}

- (void)didEngageCategoryResult:(id)a3 suggestion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)[objc_alloc(MEMORY[0x263F679C8]) initWithResult:v6 triggerEvent:2 destination:0];
  objc_msgSend(v8, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v8];
  uint64_t v9 = [v7 prediction];

  if (v9)
  {
    uint64_t v10 = [v7 prediction];

    id v7 = (id)v10;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v6 title];
    id v12 = [v11 text];
    int v13 = 136315138;
    uint64_t v14 = [v12 UTF8String];
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Engaged category %s", (uint8_t *)&v13, 0xCu);
  }
}

- (void)didEngageProviderLogo
{
  id v3 = objc_alloc_init(MEMORY[0x263F679B0]);
  [v3 setLabel:@"non_parsec_result"];
  id v4 = objc_alloc_init(MEMORY[0x263F67A08]);
  [v4 setIdentifier:@"com.apple.other:search_web"];
  [v4 setPunchout:v3];
  int v5 = (void *)[objc_alloc(MEMORY[0x263F679C8]) initWithResult:v4 triggerEvent:2 destination:2];
  objc_msgSend(v5, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v5];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Engaged provider logo", v6, 2u);
  }
}

- (void)searchBarDidCancel
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F67A20]) initWithEvent:4];
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession searchViewDidDisappear:v3];
}

- (void)searchViewDidDisappear
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263F67A20]) initWithEvent:11];
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession searchViewDidDisappear:v3];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Feedback: Session ended", v4, 2u);
  }
}

- (id)didStartNetworkRequest:(id)a3 query:(id)a4 queryId:(unint64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x263F67A60];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 alloc];
  id v11 = [v9 absoluteString];

  id v12 = (void *)[v10 initWithInput:v8 url:v11 headers:MEMORY[0x263EFFA78] triggerEvent:15 endpoint:7];
  objc_msgSend(v12, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession didStartSearch:v12];

  return v12;
}

- (void)didEndNetworkRequest:(id)a3 infoDict:(id)a4
{
  id v15 = a4;
  parsecSession = self->_parsecSession;
  id v7 = a3;
  id v8 = [(PARSession *)parsecSession bag];
  if ([v8 imageTimingFeedbackEnabled])
  {
    id v9 = [v15 objectForKey:@"STSImageDownloadOperationTimingData"];
  }
  else
  {
    id v9 = 0;
  }

  id v10 = objc_alloc(MEMORY[0x263F67890]);
  id v11 = [v15 objectForKey:@"STSImageDownloadOperationSize"];
  uint64_t v12 = (int)[v11 intValue];
  int v13 = [v15 objectForKey:@"STSImageDownloadOperationStatusCode"];
  uint64_t v14 = objc_msgSend(v10, "initWithStartSearch:responseSize:statusCode:networkTimingData:", v7, v12, (int)objc_msgSend(v13, "intValue"), v9);

  objc_msgSend(v14, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession didEndSearch:v14];
}

- (void)didClearRecents
{
  id v4 = objc_alloc_init(MEMORY[0x263F679E0]);
  id v3 = (void *)[objc_alloc(MEMORY[0x263F67A30]) initWithSection:v4 triggerEvent:4];
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v3];
}

- (void)didClearSearchBarInput
{
  id v3 = (id)[objc_alloc(MEMORY[0x263F67800]) initWithEvent:1];
  objc_msgSend(v3, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v3];
}

- (void)didGoToSearch:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F67878];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithInput:v5 endpoint:6];

  objc_msgSend(v6, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v6];
}

- (void)didReportConcern:(id)a3 punchout:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F67AC8];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithSelection:v7 result:v8 cardSection:0 resultSections:0 uploadedDataIdentifier:0 userReportRequestType:2];

  objc_msgSend(v9, "setQueryId:", +[STSSearchModel clientQueryId](STSSearchModel, "clientQueryId"));
  [(PARSession *)self->_parsecSession reportEvent:v9];
}

- (PARSession)parsecSession
{
  return self->_parsecSession;
}

- (void)setParsecSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end