@interface ATXProactiveSuggestionUIFeedbackQuery
- (ATXProactiveSuggestionUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 uiPublisher:(id)a7 blendingModelPublisher:(id)a8 contextPublisher:(id)a9 hyperParameters:(id)a10;
- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters;
- (BMBookmarkablePublisher)blendingModelPublisher;
- (BMBookmarkablePublisher)contextPublisher;
- (BMBookmarkablePublisher)uiPublisher;
- (NSDate)startDateForResults;
- (NSSet)clientModelIds;
- (NSURL)bookmarkURLPath;
- (id)uiFeedbackPublisher;
- (id)uiFeedbackPublisherChain;
- (unsigned)consumerSubTypeToConsider;
- (void)enumerateUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4;
- (void)setBlendingModelPublisher:(id)a3;
- (void)setContextPublisher:(id)a3;
- (void)setHyperParameters:(id)a3;
- (void)setUiPublisher:(id)a3;
@end

@implementation ATXProactiveSuggestionUIFeedbackQuery

- (ATXProactiveSuggestionUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 uiPublisher:(id)a7 blendingModelPublisher:(id)a8 contextPublisher:(id)a9 hyperParameters:(id)a10
{
  id v15 = a3;
  id v28 = a5;
  id v16 = a6;
  id v27 = a7;
  id v26 = a8;
  id v17 = a9;
  id v18 = a10;
  v29.receiver = self;
  v29.super_class = (Class)ATXProactiveSuggestionUIFeedbackQuery;
  v19 = [(ATXProactiveSuggestionUIFeedbackQuery *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    clientModelIds = v19->_clientModelIds;
    v19->_clientModelIds = (NSSet *)v20;

    v19->_consumerSubTypeToConsider = a4;
    objc_storeStrong((id *)&v19->_startDateForResults, a5);
    uint64_t v22 = [v16 copy];
    bookmarkURLPath = v19->_bookmarkURLPath;
    v19->_bookmarkURLPath = (NSURL *)v22;

    objc_storeStrong((id *)&v19->_uiPublisher, a7);
    objc_storeStrong((id *)&v19->_blendingModelPublisher, a8);
    objc_storeStrong((id *)&v19->_contextPublisher, a9);
    objc_storeStrong((id *)&v19->_hyperParameters, a10);
  }

  return v19;
}

- (id)uiFeedbackPublisher
{
  [(NSDate *)self->_startDateForResults timeIntervalSinceReferenceDate];
  double v4 = v3;
  v5 = objc_opt_new();
  v6 = [v5 publisherFromStartTime:v4];

  v7 = [[ATXProactiveSuggestionUIFeedbackPublisher alloc] initWithClientModelPublisher:v6 blendingModelPublisher:self->_blendingModelPublisher uiPublisher:self->_uiPublisher contextPublisher:self->_contextPublisher validUICacheConsumerSubType:self->_consumerSubTypeToConsider validClientModelIds:self->_clientModelIds hyperParameters:self->_hyperParameters];
  return v7;
}

- (id)uiFeedbackPublisherChain
{
  v2 = [(ATXProactiveSuggestionUIFeedbackQuery *)self uiFeedbackPublisher];
  double v3 = [v2 uiFeedbackPublisher];

  return v3;
}

- (void)enumerateUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ATXProactiveSuggestionUIFeedbackQuery *)self uiFeedbackPublisherChain];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F4B618] bookmarkFromURLPath:self->_bookmarkURLPath maxFileSize:3000000 versionNumber:&unk_1F0627AC0];
    v10 = [v9 bookmark];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke;
    v18[3] = &unk_1E5F00850;
    v18[4] = self;
    id v19 = v7;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke_9;
    v16[3] = &unk_1E5F00878;
    v16[4] = self;
    id v17 = v6;
    id v11 = (id)[v8 sinkWithBookmark:v10 completion:v18 receiveInput:v16];
  }
  else
  {
    v12 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:]((uint64_t)self, v12);
    }

    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v14);
    id v15 = [v13 errorWithDomain:v9 code:1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

void __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 error];
  v8 = (void *)MEMORY[0x1B3E6F520]();
  uint64_t v9 = [v5 state];
  int v10 = v9 == 0;
  if (!v9 && !v7)
  {
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      id v11 = (void *)[objc_alloc(MEMORY[0x1E4F4B618]) initWithURLPath:*(void *)(*(void *)(a1 + 32) + 32) versionNumber:&unk_1F0627AC0 bookmark:v6 metadata:0];
      id v19 = 0;
      int v10 = [v11 saveBookmarkWithError:&v19];
      id v7 = v19;
      v12 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412802;
        v21 = v14;
        __int16 v22 = 1024;
        int v23 = v10;
        __int16 v24 = 2112;
        id v25 = v7;
        _os_log_impl(&dword_1AE67F000, v12, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);
      }
    }
    else
    {
      id v7 = 0;
      int v10 = 1;
    }
  }
  id v15 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138412802;
    v21 = v17;
    __int16 v22 = 1024;
    int v23 = v10;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_impl(&dword_1AE67F000, v15, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);
  }
  id v18 = (void *)MEMORY[0x1B3E6F520]();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __93__ATXProactiveSuggestionUIFeedbackQuery_enumerateUIFeedbackResultsWithBlock_completionBlock___block_invoke_9(uint64_t a1, void *a2)
{
  id v10 = a2;
  double v3 = (void *)MEMORY[0x1B3E6F520]();
  double v4 = [v10 session];
  id v5 = [v4 sessionStartDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  [*(id *)(*(void *)(a1 + 32) + 24) timeIntervalSinceReferenceDate];
  double v9 = v8;

  if (v7 >= v9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (unsigned)consumerSubTypeToConsider
{
  return self->_consumerSubTypeToConsider;
}

- (NSSet)clientModelIds
{
  return self->_clientModelIds;
}

- (NSDate)startDateForResults
{
  return self->_startDateForResults;
}

- (NSURL)bookmarkURLPath
{
  return self->_bookmarkURLPath;
}

- (BMBookmarkablePublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
}

- (BMBookmarkablePublisher)contextPublisher
{
  return self->_contextPublisher;
}

- (void)setContextPublisher:(id)a3
{
}

- (ATXUniversalBlendingLayerHyperParametersProtocol)hyperParameters
{
  return self->_hyperParameters;
}

- (void)setHyperParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_contextPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_bookmarkURLPath, 0);
  objc_storeStrong((id *)&self->_startDateForResults, 0);
  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

- (void)enumerateUIFeedbackResultsWithBlock:(uint64_t)a1 completionBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_ERROR, "%@ - could not create uiFeedbackPublisherChain, returning early", (uint8_t *)&v5, 0xCu);
}

@end