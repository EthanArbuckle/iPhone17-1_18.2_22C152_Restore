@interface CACSignPostLog
+ (id)_sFetchElementsLog;
+ (id)sharedInstance;
+ (id)sharedLog;
+ (void)CommandStringExecuted:(id)a3 success:(BOOL)a4;
+ (void)CommandStringReceived:(id)a3;
+ (void)FetchElementsEventBeganWithReason:(id)a3 expectedDelay:(double)a4;
+ (void)FetchElementsEventCompletedWithNumberOfElements:(unint64_t)a3 numberOfElementsAlreadyCached:(unint64_t)a4;
- (unint64_t)currentPerfID;
- (void)setCurrentPerfID:(unint64_t)a3;
@end

@implementation CACSignPostLog

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance_sSharedInstance;
  return v2;
}

uint64_t __32__CACSignPostLog_sharedInstance__block_invoke()
{
  sharedInstance_sSharedInstance = objc_alloc_init(CACSignPostLog);
  return MEMORY[0x270F9A758]();
}

+ (id)sharedLog
{
  if (sharedLog_onceToken != -1) {
    dispatch_once(&sharedLog_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedLog_signpostLog;
  return v2;
}

uint64_t __27__CACSignPostLog_sharedLog__block_invoke()
{
  sharedLog_signpostLog = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "SignPosts");
  return MEMORY[0x270F9A758]();
}

+ (id)_sFetchElementsLog
{
  if (_sFetchElementsLog_onceToken != -1) {
    dispatch_once(&_sFetchElementsLog_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)_sFetchElementsLog_signpostLog;
  return v2;
}

uint64_t __36__CACSignPostLog__sFetchElementsLog__block_invoke()
{
  _sFetchElementsLog_signpostLog = (uint64_t)os_log_create("com.apple.speech.SpeechRecognitionCommandAndControl", "FetchElements");
  return MEMORY[0x270F9A758]();
}

+ (void)FetchElementsEventBeganWithReason:(id)a3 expectedDelay:(double)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[CACSignPostLog _sFetchElementsLog];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = +[CACSignPostLog _sFetchElementsLog];
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2048;
    double v14 = a4;
    _os_signpost_emit_with_name_impl(&dword_238377000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FetchElements", "Requesting elements refreshed with reason %@; expected delay: %f",
      (uint8_t *)&v11,
      0x16u);
  }

  v10 = CACLogElementCollection();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2048;
    double v14 = a4;
    _os_log_impl(&dword_238377000, v10, OS_LOG_TYPE_INFO, "FetchElements: Requesting elements refreshed with reason %@; expected delay: %f",
      (uint8_t *)&v11,
      0x16u);
  }
}

+ (void)FetchElementsEventCompletedWithNumberOfElements:(unint64_t)a3 numberOfElementsAlreadyCached:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v6 = +[CACSignPostLog _sFetchElementsLog];
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = +[CACSignPostLog _sFetchElementsLog];
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    int v10 = 134218240;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_signpost_emit_with_name_impl(&dword_238377000, v9, OS_SIGNPOST_INTERVAL_END, v7, "FetchElements", "%lu elements fetched; %lu elements already cached",
      (uint8_t *)&v10,
      0x16u);
  }
}

+ (void)CommandStringReceived:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[CACSignPostLog sharedLog];
  if (os_signpost_enabled(v4))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_signpost_emit_with_name_impl(&dword_238377000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandStringReceived", "Starting to execute command with identifier %@", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)CommandStringExecuted:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[CACSignPostLog sharedLog];
  if (os_signpost_enabled(v6))
  {
    uint64_t v7 = @"NO";
    if (v4) {
      uint64_t v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    unint64_t v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_238377000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CommandStringExecuted", "Finished executing command with identifier %@; success: %@",
      (uint8_t *)&v8,
      0x16u);
  }
}

- (unint64_t)currentPerfID
{
  return self->_currentPerfID;
}

- (void)setCurrentPerfID:(unint64_t)a3
{
  self->_currentPerfID = a3;
}

@end