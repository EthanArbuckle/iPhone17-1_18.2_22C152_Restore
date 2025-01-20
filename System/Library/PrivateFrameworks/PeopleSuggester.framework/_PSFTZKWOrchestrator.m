@interface _PSFTZKWOrchestrator
- (_PSFTZKWConfig)config;
- (_PSFTZKWOrchestrator)initWithKNNModel:(id)a3 interactionStore:(id)a4;
- (id)_getBlendingLayerSuggestionsWithContext:(id)a3;
- (id)_getDirectSuggestionsWithContext:(id)a3;
- (id)_getDirectSuggestionsWithContext:(id)a3 withTimeout:(double)a4;
- (id)getSuggestionsWithPredictionContext:(id)a3;
- (void)_createFaceTimeInteractionModelWithKNNModel:(id)a3;
- (void)_createFallbackInteractionModelWithKNNModel:(id)a3;
- (void)_createStructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4;
- (void)_createUnstructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5;
- (void)_createUnstructuredReminderModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5;
- (void)populateCaches;
- (void)updateConfigWithTrialData:(id)a3;
@end

@implementation _PSFTZKWOrchestrator

- (void)_createStructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v15 = [[_PSCalendarEventPredictor alloc] initWithEventStore:v7 contactStore:v6];

  v8 = [_PSCalendarEventPredictorDelegateWrapper alloc];
  v9 = [(_PSFTZKWConfig *)self->_config calendarEventConfig];
  v10 = [(_PSCalendarEventPredictorDelegateWrapper *)v8 initWithCalendarEventPredictor:v15 config:v9];
  calendarDelegateWrapper = self->_calendarDelegateWrapper;
  self->_calendarDelegateWrapper = v10;

  if ([(_PSFTZKWConfig *)self->_config useBlendingLayer]
    && ProactiveSuggestionClientModelLibraryCore_1())
  {
    id v12 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
    v13 = [getATXProactiveSuggestionClientModelClass_0() clientModelIdFromClientModelType:29];
    v14 = (void *)[v12 initWithClientModelId:v13 requestDelegate:self->_calendarDelegateWrapper];

    if (v14) {
      [(NSMutableArray *)self->_clientModels addObject:v14];
    }
  }
}

- (void)_createUnstructuredCalendarModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v16 = [[_PSSuggestionFromTextPredictor alloc] initWithEventStore:v8 interactionStore:v7];

  v9 = [_PSSuggestionFromTextPredictorDelegateWrapper alloc];
  v10 = [(_PSFTZKWConfig *)self->_config unstructuredCalendarConfig];
  v11 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)v9 initWithTextPredictor:v16 calendarConfig:v10];
  unstructuredCalendarDelegateWrapper = self->_unstructuredCalendarDelegateWrapper;
  self->_unstructuredCalendarDelegateWrapper = v11;

  if ([(_PSFTZKWConfig *)self->_config useBlendingLayer]
    && ProactiveSuggestionClientModelLibraryCore_1())
  {
    id v13 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
    v14 = [getATXProactiveSuggestionClientModelClass_0() clientModelIdFromClientModelType:30];
    v15 = (void *)[v13 initWithClientModelId:v14 requestDelegate:self->_unstructuredCalendarDelegateWrapper];

    [(NSMutableArray *)self->_clientModels addObject:v15];
  }
}

- (void)_createUnstructuredReminderModelWithEventStore:(id)a3 contactStore:(id)a4 interactionStore:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v16 = [[_PSSuggestionFromTextPredictor alloc] initWithEventStore:v8 interactionStore:v7];

  v9 = [_PSSuggestionFromTextPredictorDelegateWrapper alloc];
  v10 = [(_PSFTZKWConfig *)self->_config unstructuredRemindersConfig];
  v11 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)v9 initWithTextPredictor:v16 remindersConfig:v10];
  unstructuredRemindersDelegateWrapper = self->_unstructuredRemindersDelegateWrapper;
  self->_unstructuredRemindersDelegateWrapper = v11;

  if ([(_PSFTZKWConfig *)self->_config useBlendingLayer]
    && ProactiveSuggestionClientModelLibraryCore_1())
  {
    id v13 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
    v14 = [getATXProactiveSuggestionClientModelClass_0() clientModelIdFromClientModelType:31];
    v15 = (void *)[v13 initWithClientModelId:v14 requestDelegate:self->_unstructuredRemindersDelegateWrapper];

    [(NSMutableArray *)self->_clientModels addObject:v15];
  }
}

- (void)_createFaceTimeInteractionModelWithKNNModel:(id)a3
{
  id v4 = a3;
  v5 = [_PSKNNZKWATXDelegateWrapper alloc];
  id v6 = [(_PSFTZKWConfig *)self->_config faceTimeInteractionsConfig];
  id v7 = [(_PSKNNZKWATXDelegateWrapper *)v5 initWithKNNModel:v4 primaryInteractionsConfig:v6];

  faceTimeInteractionModelDelegateWrapper = self->_faceTimeInteractionModelDelegateWrapper;
  self->_faceTimeInteractionModelDelegateWrapper = v7;

  if ([(_PSFTZKWConfig *)self->_config useBlendingLayer]
    && ProactiveSuggestionClientModelLibraryCore_1())
  {
    id v9 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
    v10 = [getATXProactiveSuggestionClientModelClass_0() clientModelIdFromClientModelType:32];
    id v11 = (id)[v9 initWithClientModelId:v10 requestDelegate:self->_faceTimeInteractionModelDelegateWrapper];

    [(NSMutableArray *)self->_clientModels addObject:v11];
  }
}

- (void)_createFallbackInteractionModelWithKNNModel:(id)a3
{
  id v4 = a3;
  v5 = [_PSKNNZKWATXDelegateWrapper alloc];
  id v6 = [(_PSFTZKWConfig *)self->_config fallbackInteractionsConfig];
  id v7 = [(_PSKNNZKWATXDelegateWrapper *)v5 initWithKNNModel:v4 fallbackInteractionConfig:v6];

  fallbackInteractionModelDelegateWrapper = self->_fallbackInteractionModelDelegateWrapper;
  self->_fallbackInteractionModelDelegateWrapper = v7;

  if ([(_PSFTZKWConfig *)self->_config useBlendingLayer]
    && ProactiveSuggestionClientModelLibraryCore_1())
  {
    id v9 = objc_alloc((Class)getATXProactiveSuggestionClientModelClass_0());
    v10 = [getATXProactiveSuggestionClientModelClass_0() clientModelIdFromClientModelType:33];
    id v11 = (id)[v9 initWithClientModelId:v10 requestDelegate:self->_fallbackInteractionModelDelegateWrapper];

    [(NSMutableArray *)self->_clientModels addObject:v11];
  }
}

- (_PSFTZKWOrchestrator)initWithKNNModel:(id)a3 interactionStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_PSFTZKWOrchestrator;
  id v8 = [(_PSFTZKWOrchestrator *)&v22 init];
  if (v8)
  {
    uint64_t v9 = objc_opt_new();
    clientModels = v8->_clientModels;
    v8->_clientModels = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    config = v8->_config;
    v8->_config = (_PSFTZKWConfig *)v11;

    objc_storeStrong((id *)&v8->_interactionStore, a4);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    id v13 = (void *)getEKEventStoreClass_softClass;
    uint64_t v31 = getEKEventStoreClass_softClass;
    if (!getEKEventStoreClass_softClass)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getEKEventStoreClass_block_invoke;
      v26 = &unk_1E5ADE858;
      v27 = &v28;
      __getEKEventStoreClass_block_invoke((uint64_t)&v23);
      id v13 = (void *)v29[3];
    }
    v14 = v13;
    _Block_object_dispose(&v28, 8);
    v15 = (void *)[[v14 alloc] initWithEKOptions:128];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v16 = (void *)getCNContactStoreClass_softClass_8;
    uint64_t v31 = getCNContactStoreClass_softClass_8;
    if (!getCNContactStoreClass_softClass_8)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __getCNContactStoreClass_block_invoke_8;
      v26 = &unk_1E5ADE858;
      v27 = &v28;
      __getCNContactStoreClass_block_invoke_8((uint64_t)&v23);
      v16 = (void *)v29[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v28, 8);
    v18 = objc_opt_new();
    [(_PSFTZKWOrchestrator *)v8 _createStructuredCalendarModelWithEventStore:v15 contactStore:v18];
    [(_PSFTZKWOrchestrator *)v8 _createUnstructuredCalendarModelWithEventStore:v15 contactStore:v18 interactionStore:v7];
    [(_PSFTZKWOrchestrator *)v8 _createUnstructuredReminderModelWithEventStore:v15 contactStore:v18 interactionStore:v7];
    [(_PSFTZKWOrchestrator *)v8 _createFaceTimeInteractionModelWithKNNModel:v6];
    [(_PSFTZKWOrchestrator *)v8 _createFallbackInteractionModelWithKNNModel:v6];
    uint64_t v19 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"ps_ft_zkw_orchestrator"];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v19;
  }
  return v8;
}

- (void)updateConfigWithTrialData:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___PSFTZKWOrchestrator_updateConfigWithTrialData___block_invoke;
  block[3] = &unk_1E5ADE940;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)_getBlendingLayerSuggestionsWithContext:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v4 = (void *)getATXInteractionSuggestionRequestClass_softClass;
  uint64_t v26 = getATXInteractionSuggestionRequestClass_softClass;
  if (!getATXInteractionSuggestionRequestClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getATXInteractionSuggestionRequestClass_block_invoke;
    v21 = &unk_1E5ADE858;
    objc_super v22 = &v23;
    ProactiveSuggestionClientModelLibraryCore_1();
    v24[3] = (uint64_t)objc_getClass("ATXInteractionSuggestionRequest");
    getATXInteractionSuggestionRequestClass_softClass = *(void *)(v22[1] + 24);
    id v4 = (void *)v24[3];
  }
  v5 = v4;
  _Block_object_dispose(&v23, 8);
  id v6 = (void *)[[v5 alloc] initWithOriginatorId:@"PeopleSuggester" consumerSubType:42 psPredictionContext:v3 timeout:5.0];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v7 = (void *)getATXProactiveSuggestionConsumerClass_softClass;
  uint64_t v26 = getATXProactiveSuggestionConsumerClass_softClass;
  if (!getATXProactiveSuggestionConsumerClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getATXProactiveSuggestionConsumerClass_block_invoke;
    v21 = &unk_1E5ADE858;
    objc_super v22 = &v23;
    ProactiveSuggestionClientModelLibraryCore_1();
    v24[3] = (uint64_t)objc_getClass("ATXProactiveSuggestionConsumer");
    getATXProactiveSuggestionConsumerClass_softClass = *(void *)(v22[1] + 24);
    id v7 = (void *)v24[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v23, 8);
  uint64_t v9 = (void *)[[v8 alloc] initWithConsumerSubType:42];
  v10 = [v9 layoutForRequest:v6];
  if (!v10)
  {
    v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEFAULT, "nil value returned from blending layer, either models timed out or there was no suggestions given", (uint8_t *)&v18, 2u);
    }
    goto LABEL_16;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v11 = (void *)getATXSuggestionLayoutClass_softClass;
  uint64_t v26 = getATXSuggestionLayoutClass_softClass;
  if (!getATXSuggestionLayoutClass_softClass)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    v20 = __getATXSuggestionLayoutClass_block_invoke;
    v21 = &unk_1E5ADE858;
    objc_super v22 = &v23;
    ProactiveSuggestionClientModelLibraryCore_1();
    v24[3] = (uint64_t)objc_getClass("ATXSuggestionLayout");
    getATXSuggestionLayoutClass_softClass = *(void *)(v22[1] + 24);
    uint64_t v11 = (void *)v24[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v23, 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSFTZKWOrchestrator _getBlendingLayerSuggestionsWithContext:]((uint64_t)v10, v14);
    }
LABEL_16:
    v16 = MEMORY[0x1E4F1CBF0];
    goto LABEL_17;
  }
  id v13 = [v10 oneByOneSuggestions];
  v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_34);

  v15 = MEMORY[0x1E4F1CBF0];
  if (v14) {
    v15 = v14;
  }
  v16 = v15;
LABEL_17:

  return v16;
}

- (id)_getDirectSuggestionsWithContext:(id)a3
{
  return [(_PSFTZKWOrchestrator *)self _getDirectSuggestionsWithContext:a3 withTimeout:5.0];
}

- (id)_getDirectSuggestionsWithContext:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  [v7 setObject:self->_calendarDelegateWrapper forKeyedSubscript:&unk_1EF6759D8];
  [v7 setObject:self->_unstructuredCalendarDelegateWrapper forKeyedSubscript:&unk_1EF6759F0];
  [v7 setObject:self->_unstructuredRemindersDelegateWrapper forKeyedSubscript:&unk_1EF675A08];
  [v7 setObject:self->_faceTimeInteractionModelDelegateWrapper forKeyedSubscript:&unk_1EF675A20];
  [v7 setObject:self->_fallbackInteractionModelDelegateWrapper forKeyedSubscript:&unk_1EF675A38];
  id v8 = objc_opt_new();
  if ([&unk_1EF676500 count])
  {
    unint64_t v9 = 0;
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:v9];
      [v8 setObject:v10 forKeyedSubscript:v11];

      ++v9;
    }
    while (v9 < [&unk_1EF676500 count]);
  }
  uint64_t v33 = 0;
  v34 = (os_unfair_lock_s *)&v33;
  uint64_t v35 = 0x2810000000;
  v36 = &unk_1A3285F7A;
  int v37 = 0;
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __69___PSFTZKWOrchestrator__getDirectSuggestionsWithContext_withTimeout___block_invoke;
  uint64_t v26 = &unk_1E5AE10D0;
  id v27 = &unk_1EF676500;
  id v22 = v7;
  id v28 = v22;
  id v12 = v6;
  id v29 = v12;
  uint64_t v31 = &v33;
  id v13 = v8;
  id v30 = v13;
  double v32 = a4;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  if (_getDirectSuggestionsWithContext_withTimeout___pasOnceToken9 != -1) {
    dispatch_once(&_getDirectSuggestionsWithContext_withTimeout___pasOnceToken9, &__block_literal_global_49);
  }
  v15 = (id)_getDirectSuggestionsWithContext_withTimeout___pasExprOnceResult;
  dispatch_async(v15, v14);
  if (a4 <= 0.0)
  {
    dispatch_time_t v16 = 0;
  }
  else if (a4 <= 9223372040.0)
  {
    dispatch_time_t v16 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  }
  else
  {
    dispatch_time_t v16 = -1;
  }
  dispatch_block_wait(v14, v16);
  id v17 = objc_opt_new();
  os_unfair_lock_lock(v34 + 8);
  for (unint64_t i = 0; i < objc_msgSend(&unk_1EF676500, "count", v22, block, v24, v25, v26); ++i)
  {
    uint64_t v19 = [NSNumber numberWithUnsignedInteger:i];
    v20 = [v13 objectForKeyedSubscript:v19];
    [v17 addObjectsFromArray:v20];
  }
  os_unfair_lock_unlock(v34 + 8);

  _Block_object_dispose(&v33, 8);

  return v17;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__18;
  dispatch_time_t v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___PSFTZKWOrchestrator_getSuggestionsWithPredictionContext___block_invoke;
  block[3] = &unk_1E5ADEF08;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)populateCaches
{
  id v3 = objc_opt_new();
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  [v3 setSuggestionDate:v4];

  v5 = +[_PSConstants facetimeBundleId];
  [v3 setBundleID:v5];

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___PSFTZKWOrchestrator_populateCaches__block_invoke;
  block[3] = &unk_1E5AE10F8;
  objc_copyWeak(&v10, &location);
  id v9 = v3;
  id v6 = v3;
  dispatch_block_t v7 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_UTILITY, 0, block);
  dispatch_async((dispatch_queue_t)self->_queue, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (_PSFTZKWConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_clientModels, 0);
  objc_storeStrong((id *)&self->_fallbackInteractionModelDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_faceTimeInteractionModelDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_unstructuredRemindersDelegateWrapper, 0);
  objc_storeStrong((id *)&self->_unstructuredCalendarDelegateWrapper, 0);

  objc_storeStrong((id *)&self->_calendarDelegateWrapper, 0);
}

- (void)_getBlendingLayerSuggestionsWithContext:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Encountered layout of unknown class: %@", (uint8_t *)&v5, 0xCu);
}

@end