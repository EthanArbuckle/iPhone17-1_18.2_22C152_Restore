@interface ATXProactiveSuggestionGroupedUIFeedbackQuery
- (ATXProactiveSuggestionGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 hyperParameters:(id)a7;
- (id)uiFeedbackPublisherChainForShortcutsEditor;
- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4;
- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4;
- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4 uiFeedbackPublisherChain:(id)a5;
@end

@implementation ATXProactiveSuggestionGroupedUIFeedbackQuery

- (ATXProactiveSuggestionGroupedUIFeedbackQuery)initWithClientModelIds:(id)a3 consumerSubTypeToConsider:(unsigned __int8)a4 startDateForResults:(id)a5 bookmarkURLPath:(id)a6 hyperParameters:(id)a7
{
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [v13 timeIntervalSinceReferenceDate];
  double v17 = v16;
  v18 = -[ATXProactiveSuggestionGroupedUIFeedbackQuery uiPublisherForConsumerSubType:startTime:](self, "uiPublisherForConsumerSubType:startTime:", v10);
  v19 = objc_opt_new();
  v20 = [v19 publisherFromStartTime:v10 consumerSubType:v17];

  if (v18)
  {
    self = [(ATXProactiveSuggestionUIFeedbackQuery *)self initWithClientModelIds:v12 consumerSubTypeToConsider:v10 startDateForResults:v13 bookmarkURLPath:v14 uiPublisher:v18 blendingModelPublisher:v20 contextPublisher:0 hyperParameters:v15];
    v21 = self;
  }
  else
  {
    v22 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery initWithClientModelIds:consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:]((uint64_t)self, v10, v22);
    }

    v21 = 0;
  }

  return v21;
}

- (id)uiPublisherForConsumerSubType:(unsigned __int8)a3 startTime:(double)a4
{
  if (a3 == 43)
  {
    v5 = objc_opt_new();
    v6 = [v5 genericEventPublisherFromStartTime:43 consumerSubType:a4];
  }
  else
  {
    v8 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery uiPublisherForConsumerSubType:startTime:](a3, v8);
    }

    v6 = 0;
  }
  return v6;
}

- (id)uiFeedbackPublisherChainForShortcutsEditor
{
  v3 = [ATXShortcutsEditorGroupedUIFeedbackPublisher alloc];
  v4 = [(ATXProactiveSuggestionUIFeedbackQuery *)self uiFeedbackPublisherChain];
  v5 = [(ATXShortcutsEditorGroupedUIFeedbackPublisher *)v3 initWithUIFeedbackPublisher:v4];
  v6 = [(ATXShortcutsEditorGroupedUIFeedbackPublisher *)v5 shortcutsEditorUIFeedbackPublisher];

  return v6;
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ([(ATXProactiveSuggestionUIFeedbackQuery *)self consumerSubTypeToConsider] != 43)
  {
    uint64_t v10 = __atxlog_handle_blending();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXProactiveSuggestionGroupedUIFeedbackQuery enumerateGroupedUIFeedbackResultsWithBlock:completionBlock:](v10);
    }

    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v11 = [NSString alloc];
    id v12 = objc_msgSend(MEMORY[0x1E4F4B680], "stringForConsumerSubtype:", -[ATXProactiveSuggestionUIFeedbackQuery consumerSubTypeToConsider](self, "consumerSubTypeToConsider"));
    id v13 = (void *)[v11 initWithFormat:@"Unknown consumerSubType specified: %@", v12];
    v29[0] = v13;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = (void **)v29;
    double v16 = &v28;
    goto LABEL_10;
  }
  uint64_t v8 = [(ATXProactiveSuggestionGroupedUIFeedbackQuery *)self uiFeedbackPublisherChainForShortcutsEditor];
  if (!v8)
  {
    double v17 = __atxlog_handle_blending_ecosystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXProactiveSuggestionUIFeedbackQuery enumerateUIFeedbackResultsWithBlock:completionBlock:]((uint64_t)self, v17);
    }

    uint64_t v26 = *MEMORY[0x1E4F28568];
    id v18 = [NSString alloc];
    v19 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v19);
    id v13 = (void *)[v18 initWithFormat:@"%@ - could not create uiFeedbackPublisherChain, returning early", v12, v26];
    v27 = v13;
    id v14 = (void *)MEMORY[0x1E4F1C9E8];
    id v15 = &v27;
    double v16 = &v26;
LABEL_10:
    v9 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];

    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    id v21 = [NSString alloc];
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = (void *)[v21 initWithFormat:@"%@", v23];
    v25 = (void *)[v20 initWithDomain:v24 code:-1 userInfo:v9];

    v7[2](v7, v25);
    goto LABEL_11;
  }
  v9 = (void *)v8;
  [(ATXProactiveSuggestionGroupedUIFeedbackQuery *)self enumerateGroupedUIFeedbackResultsWithBlock:v6 completionBlock:v7 uiFeedbackPublisherChain:v8];
LABEL_11:
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(id)a3 completionBlock:(id)a4 uiFeedbackPublisherChain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x1E4F4B618];
  id v12 = [(ATXProactiveSuggestionUIFeedbackQuery *)self bookmarkURLPath];
  id v13 = [NSNumber numberWithUnsignedInteger:4];
  id v14 = [v11 bookmarkFromURLPath:v12 maxFileSize:3000000 versionNumber:v13];

  id v15 = [v14 bookmark];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke;
  v21[3] = &unk_1E5F00850;
  v21[4] = self;
  id v22 = v9;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke_22;
  v19[3] = &unk_1E5F01040;
  v19[4] = self;
  id v20 = v8;
  id v16 = v8;
  id v17 = v9;
  id v18 = (id)[v10 sinkWithBookmark:v15 completion:v21 receiveInput:v19];
}

void __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = [v6 error];
  uint64_t v8 = [v6 state];

  int v9 = v8 == 0;
  if (!v8 && !v7)
  {
    id v7 = [*(id *)(a1 + 32) bookmarkURLPath];

    if (v7)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F4B618]);
      id v11 = [*(id *)(a1 + 32) bookmarkURLPath];
      id v12 = [NSNumber numberWithUnsignedInteger:4];
      id v13 = (void *)[v10 initWithURLPath:v11 versionNumber:v12 bookmark:v5 metadata:0];

      id v20 = 0;
      int v9 = [v13 saveBookmarkWithError:&v20];
      id v7 = v20;
      id v14 = __atxlog_handle_blending_ecosystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (objc_class *)objc_opt_class();
        id v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138412802;
        id v22 = v16;
        __int16 v23 = 1024;
        int v24 = v9;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl(&dword_1AE67F000, v14, OS_LOG_TYPE_DEFAULT, "%@ - saved new bookmark with success: %u, error: %@", buf, 0x1Cu);
      }
    }
    else
    {
      int v9 = 1;
    }
  }
  id v17 = __atxlog_handle_blending_ecosystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412802;
    id v22 = v19;
    __int16 v23 = 1024;
    int v24 = v9;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl(&dword_1AE67F000, v17, OS_LOG_TYPE_DEFAULT, "%@ - invoking completion handler with success: %u, error: %@", buf, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __132__ATXProactiveSuggestionGroupedUIFeedbackQuery_enumerateGroupedUIFeedbackResultsWithBlock_completionBlock_uiFeedbackPublisherChain___block_invoke_22(uint64_t a1, void *a2)
{
  id v10 = a2;
  v3 = (void *)MEMORY[0x1B3E6F520]();
  v4 = [v10 startDateOfFirstSession];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [*(id *)(a1 + 32) startDateForResults];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  if (v6 >= v9) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)initWithClientModelIds:(NSObject *)a3 consumerSubTypeToConsider:startDateForResults:bookmarkURLPath:hyperParameters:.cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v5 = (objc_class *)objc_opt_class();
  double v6 = NSStringFromClass(v5);
  id v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
  int v8 = 138412546;
  double v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_fault_impl(&dword_1AE67F000, a3, OS_LOG_TYPE_FAULT, "%@ - could not find iOS ui publisher for consumerSubType: %@", (uint8_t *)&v8, 0x16u);
}

- (void)uiPublisherForConsumerSubType:(unsigned __int8)a1 startTime:(NSObject *)a2 .cold.1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a1];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_fault_impl(&dword_1AE67F000, a2, OS_LOG_TYPE_FAULT, "Tried to access BiomeUIStream for grouped UI feedback results for an incompatible consumerSubType: %@", (uint8_t *)&v4, 0xCu);
}

- (void)enumerateGroupedUIFeedbackResultsWithBlock:(os_log_t)log completionBlock:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AE67F000, log, OS_LOG_TYPE_FAULT, "Unknown consumerSubType specified.", v1, 2u);
}

@end