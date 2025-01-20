@interface SPSearchFeedbackSender
+ (id)feedbackListeners;
+ (id)feedbackQueue;
+ (void)_gatherFeedbackListeners;
+ (void)initialize;
+ (void)synchronizedBlock:(id)a3;
+ (void)updateFeedbackListeners;
@end

@implementation SPSearchFeedbackSender

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = dispatch_queue_attr_make_initially_inactive(0);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("feedback queue", v5);
    v7 = (void *)sFeedbackQueue;
    sFeedbackQueue = (uint64_t)v6;

    v8 = sFeedbackQueue;
    dispatch_activate(v8);
  }
}

+ (id)feedbackQueue
{
  return (id)sFeedbackQueue;
}

+ (void)_gatherFeedbackListeners
{
  if (_gatherFeedbackListeners_onceToken != -1) {
    dispatch_once(&_gatherFeedbackListeners_onceToken, &__block_literal_global_210);
  }
  id v17 = (id)objc_opt_new();
  v2 = +[SPCoreParsecInterface sharedFeedbackListener];
  if (v2)
  {
    id v3 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v2];
    if ([v3 supportedTypes]) {
      [v17 addObject:v3];
    }
  }
  else
  {
    id v3 = 0;
  }
  if (NSClassFromString(&cfstr_Atxsearchfeedb.isa))
  {
    id v4 = objc_alloc_init(MEMORY[0x263F250C8]);

    if (v4)
    {
      v5 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v4];

      if ([v5 supportedTypes]) {
        [v17 addObject:v5];
      }
      id v3 = v5;
    }
  }
  else
  {
    id v4 = v2;
  }
  if (_gatherFeedbackListeners_suggestionsFeedbackListener)
  {
    dispatch_queue_t v6 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:](SPFeedbackListenerWrapper, "wrapperWithFeedbackListener:");

    if ([v6 supportedTypes]) {
      [v17 addObject:v6];
    }
  }
  else
  {
    dispatch_queue_t v6 = v3;
  }
  v7 = +[SDFeedbackInterceptor sharedInstance];

  if (v7)
  {
    v8 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v7];

    if ([v8 supportedTypes]) {
      [v17 addObject:v8];
    }
  }
  else
  {
    v8 = v6;
  }
  v9 = +[SDCoreSpotlightFeedbackHandler sharedInstance];

  if (v9)
  {
    v10 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v9];

    if ([v10 supportedTypes]) {
      [v17 addObject:v10];
    }
  }
  else
  {
    v10 = v8;
  }
  v11 = objc_opt_new();

  if (v11)
  {
    v12 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v11];

    if ([v12 supportedTypes]) {
      [v17 addObject:v12];
    }
  }
  else
  {
    v12 = v10;
  }
  v13 = objc_opt_new();

  if (v13)
  {
    v14 = +[SPFeedbackListenerWrapper wrapperWithFeedbackListener:v13];

    if ([v14 supportedTypes]) {
      [v17 addObject:v14];
    }
  }
  else
  {
    v14 = v12;
  }
  uint64_t v15 = [v17 copy];
  v16 = (void *)sFeedbackListeners;
  sFeedbackListeners = v15;
}

uint64_t __50__SPSearchFeedbackSender__gatherFeedbackListeners__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F7BE30]);
  uint64_t v1 = _gatherFeedbackListeners_suggestionsFeedbackListener;
  _gatherFeedbackListeners_suggestionsFeedbackListener = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

+ (void)updateFeedbackListeners
{
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v3, v4))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E5D7000, v3, v4, "[FEEDBACK-DEBUG] (gatherFeedbackListeners) updateFeedbackListeners called", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SPSearchFeedbackSender_updateFeedbackListeners__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)sFeedbackQueue, block);
}

uint64_t __49__SPSearchFeedbackSender_updateFeedbackListeners__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gatherFeedbackListeners];
}

+ (id)feedbackListeners
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SPSearchFeedbackSender_feedbackListeners__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (feedbackListeners_onceToken != -1) {
    dispatch_once(&feedbackListeners_onceToken, block);
  }
  v2 = (void *)sFeedbackListeners;

  return v2;
}

uint64_t __43__SPSearchFeedbackSender_feedbackListeners__block_invoke(uint64_t a1)
{
  uint64_t result = [(id)sFeedbackListeners count];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _gatherFeedbackListeners];
  }
  return result;
}

+ (void)synchronizedBlock:(id)a3
{
}

@end