@interface SFUserAlert
+ (BOOL)supportsSecureCoding;
- (BOOL)asBanner;
- (BOOL)hasDefaultButton;
- (BOOL)textInput;
- (NSDictionary)additionalInfo;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)otherButtonTitle;
- (NSString)textInputTitle;
- (NSString)title;
- (NSURL)iconURL;
- (NSURL)soundURL;
- (OS_dispatch_queue)dispatchQueue;
- (SFUserAlert)init;
- (SFUserAlert)initWithCoder:(id)a3;
- (__CFUserNotification)createNotification;
- (double)timeout;
- (id)_defaultDictionary;
- (id)_mergedDict;
- (id)description;
- (id)dictionaryResponseHandler;
- (id)errorHandler;
- (id)responseHandler;
- (id)textResponseHandler;
- (void)_ensureXPCStarted;
- (void)_handleResponseForNotification:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_postNotification:(__CFUserNotification *)a3;
- (void)_present;
- (void)_presentBanner;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)present;
- (void)setAdditionalInfo:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setAsBanner:(BOOL)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDictionaryResponseHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setHasDefaultButton:(BOOL)a3;
- (void)setIconURL:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOtherButtonTitle:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSoundURL:(id)a3;
- (void)setTextInput:(BOOL)a3;
- (void)setTextInputTitle:(id)a3;
- (void)setTextResponseHandler:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTitle:(id)a3;
- (void)updateNotification;
- (void)userNotificationDictionaryResponse:(id)a3;
- (void)userNotificationError:(id)a3;
- (void)userNotificationResponse:(int)a3;
- (void)userNotificationTextResponse:(id)a3;
@end

@implementation SFUserAlert

- (SFUserAlert)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFUserAlert;
  v2 = [(SFUserAlert *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = SFMainQueue(v2);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_hasDefaultButton = 1;
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFUserAlert;
  [(SFUserAlert *)&v2 dealloc];
}

- (id)description
{
  NSAppendPrintF();
  id v8 = 0;
  objc_super v7 = [(SFUserAlert *)self _mergedDict];
  NSAppendPrintF();
  id v3 = v8;

  NSAppendPrintF();
  id v4 = v3;

  return v4;
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__SFUserAlert_invalidate__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__SFUserAlert_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)present
{
  if (self->_asBanner) {
    [(SFUserAlert *)self _presentBanner];
  }
  else {
    [(SFUserAlert *)self _present];
  }
}

- (void)_present
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__SFUserAlert__present__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void *__23__SFUserAlert__present__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 32) createNotification];
  result = *(void **)(a1 + 32);
  if (result[2])
  {
    return objc_msgSend(result, "_postNotification:");
  }
  return result;
}

- (void)_handleResponseForNotification:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  int v17 = (a4 & 3) + 1;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke;
  block[3] = &unk_1E5BBEF68;
  block[4] = self;
  void block[5] = v16;
  dispatch_async(dispatchQueue, block);
  objc_super v7 = CFUserNotificationGetResponseDictionary(a3);
  if (v7)
  {
    id v8 = self->_dispatchQueue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_2;
    v14[3] = &unk_1E5BBBD18;
    v14[4] = self;
    v14[5] = v7;
    dispatch_async(v8, v14);
  }
  if (self->_textInput && self->_textInputTitle)
  {
    ResponseValue = (__CFString *)CFUserNotificationGetResponseValue(a3, (CFStringRef)*MEMORY[0x1E4F1DA28], 0);
    if (ResponseValue) {
      ResponseValue = (__CFString *)[(__CFString *)ResponseValue copy];
    }
    v10 = self->_dispatchQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_3;
    v12[3] = &unk_1E5BBBD18;
    v12[4] = self;
    v13 = ResponseValue;
    v11 = ResponseValue;
    dispatch_async(v10, v12);
  }
  _Block_object_dispose(v16, 8);
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

uint64_t __52__SFUserAlert__handleResponseForNotification_flags___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)_postNotification:(__CFUserNotification *)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__SFUserAlert__postNotification___block_invoke;
  aBlock[3] = &unk_1E5BBC910;
  aBlock[4] = self;
  aBlock[5] = a3;
  id v4 = _Block_copy(aBlock);
  v5 = v4;
  double timeout = self->_timeout;
  if (timeout >= 0.0)
  {
    (*((void (**)(void *))v4 + 2))(v4);
    goto LABEL_3;
  }
  if (gLogCategory_SFUserAlert <= 90)
  {
    if (gLogCategory_SFUserAlert != -1)
    {
LABEL_6:
      double v15 = timeout;
      LogPrintF();
      goto LABEL_8;
    }
    if (_LogCategory_Initialize())
    {
      double timeout = self->_timeout;
      goto LABEL_6;
    }
  }
LABEL_8:
  errorHandler = (void (**)(id, void *))self->_errorHandler;
  if (errorHandler)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28760];
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v10 = [NSString stringWithUTF8String:DebugGetErrorString()];
    v11 = (void *)v10;
    v12 = @"?";
    if (v10) {
      v12 = (__CFString *)v10;
    }
    v18[0] = v12;
    v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, *(void *)&v15);
    v14 = [v8 errorWithDomain:v9 code:-6737 userInfo:v13];
    errorHandler[2](errorHandler, v14);
  }
LABEL_3:
}

void __33__SFUserAlert__postNotification___block_invoke(uint64_t a1)
{
  callbackRoutingDict();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v2 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 40)];
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:v2];
  if (gLogCategory_SFUserAlert <= 50 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  *(void *)(*(void *)(a1 + 32) + 32) = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)notificationResponseHandler, 0);
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, *(CFRunLoopSourceRef *)(*(void *)(a1 + 32) + 32), (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
}

- (void)_presentBanner
{
  if (gLogCategory_SFUserAlert <= 90 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)_defaultDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKeyedSubscript:*MEMORY[0x1E4F1D990]];
  }
  message = self->_message;
  if (message) {
    [v4 setObject:message forKeyedSubscript:*MEMORY[0x1E4F1D9A8]];
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle) {
    [v4 setObject:defaultButtonTitle forKeyedSubscript:*MEMORY[0x1E4F1D9E0]];
  }
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle) {
    [v4 setObject:alternateButtonTitle forKeyedSubscript:*MEMORY[0x1E4F1D9D0]];
  }
  otherButtonTitle = self->_otherButtonTitle;
  if (otherButtonTitle) {
    [v4 setObject:otherButtonTitle forKeyedSubscript:*MEMORY[0x1E4F1DA10]];
  }
  if (self->_textInput)
  {
    textInputTitle = self->_textInputTitle;
    if (textInputTitle)
    {
      [v4 setObject:textInputTitle forKeyedSubscript:*MEMORY[0x1E4F1DA20]];
      [v4 setObject:&stru_1EF9BDC68 forKeyedSubscript:*MEMORY[0x1E4F1DA28]];
    }
  }

  return v4;
}

- (__CFUserNotification)createNotification
{
  SInt32 error = 0;
  CFDictionaryRef v3 = [(SFUserAlert *)self _mergedDict];
  if (!self->_title)
  {
    int v10 = -6737;
    SInt32 error = -6737;
    if (gLogCategory_SFUserAlert > 90) {
      goto LABEL_28;
    }
    if (gLogCategory_SFUserAlert == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      int v10 = -6737;
      goto LABEL_28;
    }
LABEL_18:
    LogPrintF();
    goto LABEL_25;
  }
  double timeout = self->_timeout;
  if (timeout < 0.0)
  {
    int v10 = -6737;
    SInt32 error = -6737;
    if (gLogCategory_SFUserAlert > 90) {
      goto LABEL_28;
    }
    if (gLogCategory_SFUserAlert == -1 && !_LogCategory_Initialize()) {
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (self->_hasDefaultButton) {
    CFOptionFlags v5 = 3;
  }
  else {
    CFOptionFlags v5 = 35;
  }
  if (gLogCategory_SFUserAlert <= 50)
  {
    if (gLogCategory_SFUserAlert != -1 || (v6 = _LogCategory_Initialize(), double timeout = self->_timeout, v6))
    {
      LogPrintF();
      double timeout = self->_timeout;
    }
  }
  CFUserNotificationRef v7 = CFUserNotificationCreate(0, timeout, v5, &error, v3);
  if (!error)
  {
    id v8 = v7;
    goto LABEL_12;
  }
  if (gLogCategory_SFUserAlert <= 90 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  int v10 = -6700;
  SInt32 error = -6700;
LABEL_28:
  if (self->_errorHandler)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__SFUserAlert_createNotification__block_invoke;
    block[3] = &unk_1E5BBEE88;
    block[4] = self;
    int v13 = v10;
    dispatch_async(dispatchQueue, block);
  }
  id v8 = 0;
LABEL_12:

  return v8;
}

void __33__SFUserAlert_createNotification__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 56);
  uint64_t v2 = *(int *)(a1 + 40);
  if (v2)
  {
    CFDictionaryRef v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28760];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithUTF8String:DebugGetErrorString()];
    int v6 = (void *)v5;
    CFUserNotificationRef v7 = @"?";
    if (v5) {
      CFUserNotificationRef v7 = (__CFString *)v5;
    }
    v13[0] = v7;
    id v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1, v1 + 16);
    uint64_t v9 = [v3 errorWithDomain:v4 code:v2 userInfo:v8];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v9);
  }
  else
  {
    int v10 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 56);
    v10(v11, 0);
  }
}

- (id)_mergedDict
{
  CFDictionaryRef v3 = [(SFUserAlert *)self _defaultDictionary];
  uint64_t v4 = (void *)[(NSDictionary *)self->_additionalInfo mutableCopy];
  uint64_t v5 = v4;
  int v6 = v3;
  if (v4)
  {
    [v4 addEntriesFromDictionary:v3];
    int v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (void)updateNotification
{
  cfNotif = self->_cfNotif;
  if (cfNotif)
  {
    if (self->_hasDefaultButton) {
      CFOptionFlags v4 = 3;
    }
    else {
      CFOptionFlags v4 = 35;
    }
    CFDictionaryRef v5 = [(SFUserAlert *)self _mergedDict];
    CFDictionaryRef dictionary = v5;
    if (gLogCategory_SFUserAlert <= 50)
    {
      if (gLogCategory_SFUserAlert != -1 || (v6 = _LogCategory_Initialize(), CFDictionaryRef v5 = dictionary, v6))
      {
        LogPrintF();
        CFDictionaryRef v5 = dictionary;
      }
    }
    CFUserNotificationUpdate(cfNotif, self->_timeout, v4, v5);
  }
}

- (void)_ensureXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_xpcCnx)
  {
    CFDictionaryRef v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.SharingServices" options:0];
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    CFDictionaryRef v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA125E0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v5];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__SFUserAlert__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E5BBC870;
    v8[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __32__SFUserAlert__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E5BBC870;
    v7[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v7];
    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA393E0];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v6];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_SFUserAlert <= 10 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

uint64_t __32__SFUserAlert__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __32__SFUserAlert__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SFUserAlert__interrupted__block_invoke;
  block[3] = &unk_1E5BBC870;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__SFUserAlert__interrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled)
  {
    if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_invalidateCalled = 1;
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      [(NSXPCConnection *)xpcCnx invalidate];
      CFOptionFlags v4 = self->_xpcCnx;
      self->_xpcCnx = 0;
    }
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__SFUserAlert__invalidate__block_invoke;
    block[3] = &unk_1E5BBC870;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

uint64_t __26__SFUserAlert__invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __27__SFUserAlert__invalidated__block_invoke;
      block[3] = &unk_1E5BBC870;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
    cfNotif = self->_cfNotif;
    if (cfNotif)
    {
      CFUserNotificationCancel(cfNotif);
      CFDictionaryRef v5 = self->_cfNotif;
      if (v5)
      {
        CFRelease(v5);
        self->_cfNotif = 0;
      }
    }
    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;

    id textResponseHandler = self->_textResponseHandler;
    self->_id textResponseHandler = 0;

    id dictionaryResponseHandler = self->_dictionaryResponseHandler;
    self->_id dictionaryResponseHandler = 0;

    self->_invalidateDone = 1;
  }
}

void __27__SFUserAlert__invalidated__block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (gLogCategory_SFUserAlert <= 50 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    CFDictionaryRef v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F28760];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    uint64_t v5 = [NSString stringWithUTF8String:DebugGetErrorString()];
    int v6 = (void *)v5;
    id v7 = @"?";
    if (v5) {
      id v7 = (__CFString *)v5;
    }
    v11[0] = v7;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = [v3 errorWithDomain:v4 code:-6762 userInfo:v8];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v9);
  }
}

- (void)userNotificationError:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__SFUserAlert_userNotificationError___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __37__SFUserAlert_userNotificationError___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)userNotificationResponse:(int)a3
{
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__SFUserAlert_userNotificationResponse___block_invoke;
  block[3] = &unk_1E5BBEE88;
  block[4] = self;
  int v7 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFUserAlert_userNotificationResponse___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned int *)(a1 + 40));
  }
  return result;
}

- (void)userNotificationTextResponse:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__SFUserAlert_userNotificationTextResponse___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __44__SFUserAlert_userNotificationTextResponse___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

- (void)userNotificationDictionaryResponse:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFUserAlert <= 30 && (gLogCategory_SFUserAlert != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SFUserAlert_userNotificationDictionaryResponse___block_invoke;
  v7[3] = &unk_1E5BBBD18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __50__SFUserAlert_userNotificationDictionaryResponse___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 80);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 40));
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  additionalInfo = self->_additionalInfo;
  id v14 = v4;
  if (additionalInfo)
  {
    [v4 encodeObject:additionalInfo forKey:@"ai"];
    id v4 = v14;
  }
  if (self->_asBanner)
  {
    [v14 encodeBool:1 forKey:@"ab"];
    id v4 = v14;
  }
  iconURL = self->_iconURL;
  if (iconURL)
  {
    [v14 encodeObject:iconURL forKey:@"iu"];
    id v4 = v14;
  }
  message = self->_message;
  if (message)
  {
    [v14 encodeObject:message forKey:@"me"];
    id v4 = v14;
  }
  soundURL = self->_soundURL;
  if (soundURL)
  {
    [v14 encodeObject:soundURL forKey:@"su"];
    id v4 = v14;
  }
  if (self->_textInput)
  {
    [v14 encodeBool:1 forKey:@"tin"];
    id v4 = v14;
  }
  textInputTitle = self->_textInputTitle;
  if (textInputTitle)
  {
    [v14 encodeObject:textInputTitle forKey:@"tint"];
    id v4 = v14;
  }
  if (self->_timeout != 0.0)
  {
    objc_msgSend(v14, "encodeDouble:forKey:", @"to");
    id v4 = v14;
  }
  title = self->_title;
  if (title)
  {
    [v14 encodeObject:title forKey:@"ti"];
    id v4 = v14;
  }
  if (self->_hasDefaultButton)
  {
    [v14 encodeBool:1 forKey:@"hdb"];
    id v4 = v14;
  }
  defaultButtonTitle = self->_defaultButtonTitle;
  if (defaultButtonTitle)
  {
    [v14 encodeObject:defaultButtonTitle forKey:@"dbt"];
    id v4 = v14;
  }
  alternateButtonTitle = self->_alternateButtonTitle;
  if (alternateButtonTitle)
  {
    [v14 encodeObject:alternateButtonTitle forKey:@"abt"];
    id v4 = v14;
  }
  otherButtonTitle = self->_otherButtonTitle;
  if (otherButtonTitle)
  {
    [v14 encodeObject:otherButtonTitle forKey:@"obt"];
    id v4 = v14;
  }
}

- (SFUserAlert)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFUserAlert;
  uint64_t v5 = [(SFUserAlert *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ai"];
    additionalInfo = v5->_additionalInfo;
    v5->_additionalInfo = (NSDictionary *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iu"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"su"];
    soundURL = v5->_soundURL;
    v5->_soundURL = (NSURL *)v10;

    v5->_asBanner = [v4 decodeBoolForKey:@"ab"];
    v5->_hasDefaultButton = [v4 decodeBoolForKey:@"hdb"];
    v5->_textInput = [v4 decodeBoolForKey:@"tin"];
    [v4 decodeDoubleForKey:@"to"];
    v5->_double timeout = v12;
    id v13 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v15 = v14;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v16 = v15;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v17 = v16;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v18 = v17;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (id)textResponseHandler
{
  return self->_textResponseHandler;
}

- (void)setTextResponseHandler:(id)a3
{
}

- (id)dictionaryResponseHandler
{
  return self->_dictionaryResponseHandler;
}

- (void)setDictionaryResponseHandler:(id)a3
{
}

- (NSDictionary)additionalInfo
{
  return self->_additionalInfo;
}

- (void)setAdditionalInfo:(id)a3
{
}

- (BOOL)asBanner
{
  return self->_asBanner;
}

- (void)setAsBanner:(BOOL)a3
{
  self->_asBanner = a3;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSURL)soundURL
{
  return self->_soundURL;
}

- (void)setSoundURL:(id)a3
{
}

- (BOOL)textInput
{
  return self->_textInput;
}

- (void)setTextInput:(BOOL)a3
{
  self->_textInput = a3;
}

- (NSString)textInputTitle
{
  return self->_textInputTitle;
}

- (void)setTextInputTitle:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)hasDefaultButton
{
  return self->_hasDefaultButton;
}

- (void)setHasDefaultButton:(BOOL)a3
{
  self->_hasDefaultButton = a3;
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void)setOtherButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textInputTitle, 0);
  objc_storeStrong((id *)&self->_soundURL, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong(&self->_dictionaryResponseHandler, 0);
  objc_storeStrong(&self->_textResponseHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end