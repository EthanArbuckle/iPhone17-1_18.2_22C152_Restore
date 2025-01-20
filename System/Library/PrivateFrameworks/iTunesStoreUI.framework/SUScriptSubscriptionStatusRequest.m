@interface SUScriptSubscriptionStatusRequest
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSString)carrierBundleProvisioningStyleName;
- (NSString)reasonName;
- (NSString)reasonNameDeepLink;
- (NSString)serviceName;
- (NSString)serviceNameAppleMusic;
- (SUScriptSubscriptionStatusRequest)init;
- (id)_className;
- (id)ignoreCache;
- (id)scriptAttributeKeys;
- (id)wantsPartialResults;
- (void)_handleRequestCompletionWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 scriptCallbackFunction:(id)a5;
- (void)performRequestWithCallbackFunction:(id)a3;
- (void)setCarrierBundleProvisioningStyleName:(id)a3;
- (void)setIgnoreCache:(id)a3;
- (void)setReasonName:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setWantsPartialResults:(id)a3;
@end

@implementation SUScriptSubscriptionStatusRequest

- (SUScriptSubscriptionStatusRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSubscriptionStatusRequest;
  result = [(SUScriptObject *)&v3 init];
  if (result) {
    result->_carrierBundleProvisioningStyle = 1;
  }
  return result;
}

- (id)_className
{
  return @"iTunesSubscriptionStatusRequest";
}

- (NSString)carrierBundleProvisioningStyleName
{
  [(SUScriptObject *)self lock];
  unint64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
  [(SUScriptObject *)self unlock];
  if (carrierBundleProvisioningStyle > 2) {
    v4 = 0;
  }
  else {
    v4 = *off_264814848[carrierBundleProvisioningStyle];
  }

  return (NSString *)v4;
}

- (id)ignoreCache
{
  [(SUScriptObject *)self lock];
  BOOL ignoreCache = self->_ignoreCache;
  [(SUScriptObject *)self unlock];
  v4 = (void **)MEMORY[0x263EFFB40];
  if (!ignoreCache) {
    v4 = (void **)MEMORY[0x263EFFB38];
  }
  v5 = *v4;

  return v5;
}

- (NSString)reasonName
{
  [(SUScriptObject *)self lock];
  int64_t reason = self->_reason;
  [(SUScriptObject *)self unlock];
  if (reason == 1)
  {
    v4 = [(SUScriptSubscriptionStatusRequest *)self reasonNameDeepLink];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (NSString)serviceName
{
  [(SUScriptObject *)self lock];
  int64_t service = self->_service;
  [(SUScriptObject *)self unlock];
  if (service == 1)
  {
    v4 = [(SUScriptSubscriptionStatusRequest *)self serviceNameAppleMusic];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setCarrierBundleProvisioningStyleName:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v5 isEqualToString:@"never"])
    {
      int64_t v4 = 0;
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"once"]) {
      goto LABEL_8;
    }
    if ([v5 isEqualToString:@"always"])
    {
      int64_t v4 = 2;
      goto LABEL_9;
    }
  }
  [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
LABEL_8:
  int64_t v4 = 1;
LABEL_9:
  [(SUScriptObject *)self lock];
  if (self->_carrierBundleProvisioningStyle != v4) {
    self->_unint64_t carrierBundleProvisioningStyle = v4;
  }
  [(SUScriptObject *)self unlock];
}

- (void)setIgnoreCache:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v5 BOOLValue];
    [(SUScriptObject *)self lock];
    if (self->_ignoreCache != v4) {
      self->_BOOL ignoreCache = v4;
    }
    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (void)setReasonName:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(SUScriptSubscriptionStatusRequest *)self reasonNameDeepLink],
        int v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v7 isEqualToString:v4],
        v4,
        (v5 & 1) != 0))
  {
    int64_t v6 = 1;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    int64_t v6 = 0;
  }
  [(SUScriptObject *)self lock];
  if (self->_reason != v6) {
    self->_int64_t reason = v6;
  }
  [(SUScriptObject *)self unlock];
}

- (void)setServiceName:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(SUScriptSubscriptionStatusRequest *)self serviceNameAppleMusic],
        int v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v7 isEqualToString:v4],
        v4,
        (v5 & 1) != 0))
  {
    int64_t v6 = 1;
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    int64_t v6 = 0;
  }
  [(SUScriptObject *)self lock];
  if (self->_service != v6) {
    self->_int64_t service = v6;
  }
  [(SUScriptObject *)self unlock];
}

- (id)wantsPartialResults
{
  [(SUScriptObject *)self lock];
  BOOL wantsPartialResults = self->_wantsPartialResults;
  [(SUScriptObject *)self unlock];
  int v4 = (void **)MEMORY[0x263EFFB40];
  if (!wantsPartialResults) {
    int v4 = (void **)MEMORY[0x263EFFB38];
  }
  char v5 = *v4;

  return v5;
}

- (void)setWantsPartialResults:(id)a3
{
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v5 BOOLValue];
    [(SUScriptObject *)self lock];
    if (self->_wantsPartialResults != v4) {
      self->_BOOL wantsPartialResults = v4;
    }
    [(SUScriptObject *)self unlock];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

- (NSString)reasonNameDeepLink
{
  return (NSString *)@"deepLink";
}

- (NSString)serviceNameAppleMusic
{
  return (NSString *)@"AppleMusic";
}

- (void)performRequestWithCallbackFunction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[SUScriptFunction alloc] initWithScriptObject:v4];
    [(SUScriptFunction *)v5 setThisObject:self];
    [(SUScriptObject *)self lock];
    int64_t service = self->_service;
    int64_t reason = self->_reason;
    int64_t carrierBundleProvisioningStyle = self->_carrierBundleProvisioningStyle;
    BOOL ignoreCache = self->_ignoreCache;
    BOOL wantsPartialResults = self->_wantsPartialResults;
    [(SUScriptObject *)self unlock];
    if (!service) {
      [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
    }
    BOOL v11 = reason == 1;
    v12 = (void *)[objc_alloc(getICStoreRequestContextClass()) initWithBlock:&__block_literal_global_12];
    v13 = (void *)[objc_alloc(getICMusicSubscriptionStatusRequestClass()) initWithStoreRequestContext:v12];
    [v13 setCarrierBundleProvisioningStyle:carrierBundleProvisioningStyle];
    [v13 setReason:v11];
    if (ignoreCache)
    {
      [v13 setShouldIgnoreCache:1];
    }
    else
    {
      [v13 setAllowsFallbackToExpiredStatus:1];
      [v13 setAllowsFallbackToStatusNeedingReload:1];
    }
    v14 = [(objc_class *)getICMusicSubscriptionStatusControllerClass() sharedStatusController];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke_2;
    v16[3] = &unk_264814828;
    BOOL v18 = ignoreCache;
    BOOL v19 = wantsPartialResults;
    v16[4] = self;
    v17 = v5;
    v15 = v5;
    [v14 performSubscriptionStatusRequest:v13 withStatusHandler:v16];
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
}

void __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke(uint64_t a1, void *a2)
{
  v2 = getICUserIdentityClass_0;
  id v3 = a2;
  id v4 = [(objc_class *)v2() activeAccount];
  [v3 setIdentity:v4];

  id v5 = [(objc_class *)getICUserIdentityStoreClass() defaultIdentityStore];
  [v3 setIdentityStore:v5];

  [v3 setAllowsExpiredBags:1];
  id v6 = (id)[objc_alloc(getICURLResponseAuthenticationProviderClass()) initWithUserInteractionLevel:1];
  [v3 setAuthenticationProvider:v6];
}

void __72__SUScriptSubscriptionStatusRequest_performRequestWithCallbackFunction___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v12 = [v5 subscriptionStatus];
  char v6 = [v5 isFinalResponse];

  if (a3 && !*(unsigned char *)(a1 + 48))
  {
    v9 = [(objc_class *)getICUserIdentityClass_0() autoupdatingActiveAccount];
    v10 = [(objc_class *)getICMusicSubscriptionStatusMonitorClass_0() sharedMonitorForIdentity:v9];
    uint64_t v11 = [v10 subscriptionStatus];

    uint64_t v7 = 1;
    v8 = (void *)v11;
  }
  else if (v6)
  {
    uint64_t v7 = 1;
    v8 = v12;
  }
  else
  {
    v8 = v12;
    if (!*(unsigned char *)(a1 + 49)) {
      goto LABEL_9;
    }
    uint64_t v7 = 0;
  }
  id v13 = v8;
  [*(id *)(a1 + 32) _handleRequestCompletionWithSubscriptionStatus:v8 isFinal:v7 scriptCallbackFunction:*(void *)(a1 + 40)];
  v8 = v13;
LABEL_9:
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  id v5 = [(id)__KeyMapping_54 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusRequest;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_39, 1);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptSubscriptionStatusRequest;
    id v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptSubscriptionStatusRequest;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  id v3 = [(id)__KeyMapping_54 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_39 = (uint64_t)sel_performRequestWithCallbackFunction_;
    unk_2681B53E0 = @"perform";
    v2 = (void *)__KeyMapping_54;
    __KeyMapping_54 = (uint64_t)&unk_26DBD7C88;
  }
}

- (void)_handleRequestCompletionWithSubscriptionStatus:(id)a3 isFinal:(BOOL)a4 scriptCallbackFunction:(id)a5
{
  BOOL v5 = a4;
  id v10 = a5;
  id v7 = a3;
  v8 = [[SUScriptSubscriptionStatusResponse alloc] initWithSubscriptionStatus:v7 isFinal:v5];

  v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v8, 0);
  [v10 callWithArguments:v9];

  if (v5) {
    [v10 setThisObject:0];
  }
}

@end