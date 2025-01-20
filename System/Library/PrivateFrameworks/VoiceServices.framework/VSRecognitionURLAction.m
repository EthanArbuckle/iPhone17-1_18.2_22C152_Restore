@interface VSRecognitionURLAction
- (id)URL;
- (id)perform;
- (int)completionType;
- (void)dealloc;
- (void)setURL:(id)a3;
@end

@implementation VSRecognitionURLAction

- (id)perform
{
  userInfoValues[1] = *(void **)MEMORY[0x263EF8340];
  if (self->_url)
  {
    v3 = VSGetLogDefault();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      url = self->_url;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = url;
      _os_log_impl(&dword_20CABC000, v3, OS_LOG_TYPE_INFO, "Dispatching open URL: %@", buf, 0xCu);
    }
    id v5 = [(VSRecognitionAction *)self _session];
    v6 = self->_url;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __33__VSRecognitionURLAction_perform__block_invoke;
    v11[3] = &unk_2640E8548;
    v11[4] = self;
    [v5 _notifyDelegateOpenURL:v6 completion:v11];
    return 0;
  }
  else
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    *(void *)buf = *MEMORY[0x263EFFC48];
    userInfoValues[0] = @"no URL to launch";
    CFErrorRef v7 = CFErrorCreateWithUserInfoKeysAndValues(v8, @"VSErrorDomain", -4005, (const void *const *)buf, (const void *const *)userInfoValues, 1);
    [(VSRecognitionAction *)self completeWithNextAction:0 error:v7];
    v9 = v7;
  }
  return v7;
}

void __33__VSRecognitionURLAction_perform__block_invoke(uint64_t a1, uint64_t a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __33__VSRecognitionURLAction_perform__block_invoke_2;
  v3[3] = &unk_2640E8BA0;
  uint64_t v2 = *(void *)(a1 + 32);
  v3[4] = a2;
  v3[5] = v2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __33__VSRecognitionURLAction_perform__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = VSGetLogDefault();
    BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v3)
    {
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_error_impl(&dword_20CABC000, v2, OS_LOG_TYPE_ERROR, "Open URL failed: %@", (uint8_t *)&v6, 0xCu);
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return [*(id *)(a1 + 40) completeWithNextAction:0 error:v4];
}

- (id)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
  url = self->_url;
  if (url != a3)
  {

    self->_url = (NSURL *)a3;
  }
}

- (int)completionType
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VSRecognitionURLAction;
  [(VSRecognitionAction *)&v3 dealloc];
}

@end