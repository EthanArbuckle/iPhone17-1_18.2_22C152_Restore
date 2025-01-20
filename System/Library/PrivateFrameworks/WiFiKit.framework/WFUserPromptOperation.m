@interface WFUserPromptOperation
+ (id)sharedMapTable;
- (NSDictionary)options;
- (NSDictionary)userResponse;
- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4;
- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4 flags:(unint64_t)a5;
- (double)timeout;
- (int64_t)result;
- (unint64_t)flags;
- (void)_notification:(__CFUserNotification *)a3 didFinishWithResponse:(unint64_t)a4;
- (void)_showPrompt;
- (void)setFlags:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setResult:(int64_t)a3;
- (void)setTimeout:(double)a3;
- (void)start;
@end

@implementation WFUserPromptOperation

- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4 flags:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFUserPromptOperation;
  v10 = [(WFUserPromptOperation *)&v13 init];
  v11 = v10;
  if (v9 && v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_timeout = a4;
    v11->_flags = a5;
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (WFUserPromptOperation)initWithOptions:(id)a3 timeout:(double)a4
{
  return [(WFUserPromptOperation *)self initWithOptions:a3 timeout:0 flags:a4];
}

- (void)start
{
  v3.receiver = self;
  v3.super_class = (Class)WFUserPromptOperation;
  [(WFOperation *)&v3 start];
  [(WFUserPromptOperation *)self performSelectorOnMainThread:sel__showPrompt withObject:0 waitUntilDone:0];
}

- (void)_showPrompt
{
  SInt32 error = 0;
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  [(WFUserPromptOperation *)self timeout];
  CFTimeInterval v5 = v4;
  CFOptionFlags v6 = [(WFUserPromptOperation *)self flags];
  CFDictionaryRef v7 = [(WFUserPromptOperation *)self options];
  v8 = CFUserNotificationCreate(v3, v5, v6, &error, v7);

  if (v8
    && (CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v3, v8, (CFUserNotificationCallBack)_UserNotificationDidFinish, 0)) != 0)
  {
    v10 = RunLoopSource;
    v11 = [(id)objc_opt_class() sharedMapTable];
    [v11 setObject:self forKey:v8];

    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v10, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRelease(v10);
  }
  else
  {
    self->_result = -1;
    [(WFOperation *)self finish];
  }
}

- (void)_notification:(__CFUserNotification *)a3 didFinishWithResponse:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFDictionaryRef v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7 && os_log_type_enabled(v7, v8))
  {
    int v15 = 136315394;
    v16 = "-[WFUserPromptOperation _notification:didFinishWithResponse:]";
    __int16 v17 = 2048;
    unint64_t v18 = a4;
    _os_log_impl(&dword_226071000, v7, v8, "%s: response %lu", (uint8_t *)&v15, 0x16u);
  }

  if (a3)
  {
    CFUserNotificationGetResponseDictionary(a3);
    id v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    userResponse = self->_userResponse;
    self->_userResponse = v9;

    if (self->_userResponse)
    {
      v11 = WFLogForCategory(0);
      os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
      if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
      {
        objc_super v13 = self->_userResponse;
        int v15 = 136315394;
        v16 = "-[WFUserPromptOperation _notification:didFinishWithResponse:]";
        __int16 v17 = 2112;
        unint64_t v18 = (unint64_t)v13;
        _os_log_impl(&dword_226071000, v11, v12, "%s: user response %@", (uint8_t *)&v15, 0x16u);
      }
    }
  }
  if (a4 <= 3) {
    [(WFUserPromptOperation *)self setResult:qword_226113948[a4]];
  }
  v14 = [(id)objc_opt_class() sharedMapTable];
  [v14 removeObjectForKey:a3];

  if (a3) {
    CFRelease(a3);
  }
  [(WFOperation *)self finish];
}

+ (id)sharedMapTable
{
  if (sharedMapTable_onceToken != -1) {
    dispatch_once(&sharedMapTable_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedMapTable_mapTable;
  return v2;
}

uint64_t __39__WFUserPromptOperation_sharedMapTable__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:2 valueOptions:0 capacity:0];
  uint64_t v1 = sharedMapTable_mapTable;
  sharedMapTable_mapTable = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSDictionary)userResponse
{
  return self->_userResponse;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
}

@end