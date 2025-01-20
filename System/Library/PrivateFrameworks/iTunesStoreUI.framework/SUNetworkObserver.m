@interface SUNetworkObserver
+ (id)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (NSString)partnerIdentifier;
- (SUNetworkObserver)init;
- (void)_cancelStartupTimer;
- (void)_handleNetworkTypeChange:(id)a3;
- (void)_handleUsingNetworkChange:(id)a3;
- (void)_mainThreadHandleNetworkTypeChange:(id)a3;
- (void)_mainThreadScheduleNetworkActivityUpdate;
- (void)_mainThreadSetPartnerIdentifier:(id)a3;
- (void)_networkTypeChanged:(id)a3;
- (void)_networkUsageStateChanged:(id)a3;
- (void)_partnerHeaderChanged:(id)a3;
- (void)_startupTimer:(id)a3;
- (void)_storeServicesNetworkStartNotification:(id)a3;
- (void)_storeServicesNetworkStopNotification:(id)a3;
- (void)_updateNetworkActivityIndicator;
- (void)checkPartnerAvailability;
- (void)dealloc;
- (void)setPartnerIdentifier:(id)a3;
- (void)setPartnersEnabled:(BOOL)a3;
- (void)startNetworkAvailabilityTimer;
@end

@implementation SUNetworkObserver

- (SUNetworkObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SUNetworkObserver;
  v2 = [(SUNetworkObserver *)&v6 init];
  if (v2)
  {
    v2->_partnerIdentifier = (NSString *)@"origin";
    v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel__partnerHeaderChanged_ name:*MEMORY[0x263F893E8] object:0];
    [v3 addObserver:v2 selector:sel__storeServicesNetworkStartNotification_ name:*MEMORY[0x263F7BCD8] object:0];
    [v3 addObserver:v2 selector:sel__storeServicesNetworkStopNotification_ name:*MEMORY[0x263F7BCE0] object:0];
    uint64_t v4 = [MEMORY[0x263F894C0] sharedInstance];
    [v3 addObserver:v2 selector:sel__networkTypeChanged_ name:*MEMORY[0x263F89418] object:v4];
    [v3 addObserver:v2 selector:sel__networkUsageStateChanged_ name:*MEMORY[0x263F89420] object:v4];
  }
  return v2;
}

- (void)dealloc
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F893E8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F7BCD8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F7BCE0] object:0];
  uint64_t v4 = [MEMORY[0x263F894C0] sharedInstance];
  [v3 removeObserver:self name:*MEMORY[0x263F89418] object:v4];
  [v3 removeObserver:self name:*MEMORY[0x263F89420] object:v4];
  [(SUNetworkObserver *)self _cancelStartupTimer];

  self->_partnerIdentifier = 0;
  v5.receiver = self;
  v5.super_class = (Class)SUNetworkObserver;
  [(SUNetworkObserver *)&v5 dealloc];
}

+ (void)setSharedInstance:(id)a3
{
  if ((id)__SharedInstance_0 != a3)
  {

    __SharedInstance_0 = (uint64_t)a3;
  }
}

+ (id)sharedInstance
{
  id result = (id)__SharedInstance_0;
  if (!__SharedInstance_0)
  {
    id result = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance_0 = (uint64_t)result;
  }
  return result;
}

- (void)checkPartnerAvailability
{
  uint64_t v2 = [MEMORY[0x263F7B358] contextWithBagType:0];
  id v3 = (id)[objc_alloc(MEMORY[0x263F894B0]) initWithBagContext:v2];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v3);
}

- (NSString)partnerIdentifier
{
  if (self->_partnersEnabled) {
    return self->_partnerIdentifier;
  }
  else {
    return (NSString *)@"origin";
  }
}

- (void)setPartnerIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!-[NSString isEqualToString:](self->_partnerIdentifier, "isEqualToString:"))
  {
    objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v11 = 138412546;
      uint64_t v12 = objc_opt_class();
      __int16 v13 = 2112;
      id v14 = a3;
      LODWORD(v10) = 22;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v11, v10);
        free(v9);
        SSFileLog();
      }
    }

    self->_partnerIdentifier = (NSString *)a3;
    if (self->_partnersEnabled) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUPartnerChangedNotification", self->_partnerIdentifier);
    }
  }
}

- (void)setPartnersEnabled:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_partnersEnabled != a3)
  {
    BOOL v3 = a3;
    objc_super v5 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (v7)
    {
      int v12 = 138412546;
      uint64_t v13 = objc_opt_class();
      __int16 v14 = 1024;
      BOOL v15 = v3;
      LODWORD(v11) = 18;
      uint64_t v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(NSString, "stringWithCString:encoding:", v8, 4, &v12, v11);
        free(v9);
        SSFileLog();
      }
    }
    self->_partnersEnabled = v3;
    partnerIdentifier = self->_partnerIdentifier;
    if (partnerIdentifier)
    {
      if (![(NSString *)partnerIdentifier isEqualToString:@"origin"]) {
        objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"SUPartnerChangedNotification", -[SUNetworkObserver partnerIdentifier](self, "partnerIdentifier"));
      }
    }
  }
}

- (void)startNetworkAvailabilityTimer
{
  if (!self->_startupTimer) {
    self->_startupTimer = (NSTimer *)(id)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__startupTimer_ selector:0 userInfo:0 repeats:12.0];
  }
}

- (void)_networkTypeChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];

  [(SUNetworkObserver *)self _handleNetworkTypeChange:v4];
}

- (void)_networkUsageStateChanged:(id)a3
{
  uint64_t v4 = [a3 userInfo];

  [(SUNetworkObserver *)self _handleUsingNetworkChange:v4];
}

- (void)_partnerHeaderChanged:(id)a3
{
  uint64_t v4 = (void *)[(SUNetworkObserver *)self mainThreadProxy];
  objc_super v5 = (void *)[a3 userInfo];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F893F0]];

  [v4 _mainThreadSetPartnerIdentifier:v6];
}

- (void)_storeServicesNetworkStartNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SUNetworkObserver__storeServicesNetworkStartNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__60__SUNetworkObserver__storeServicesNetworkStartNotification___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 40);
  id result = *(void **)(a1 + 32);
  if (result[5] == 1) {
    return (void *)[result _updateNetworkActivityIndicator];
  }
  return result;
}

- (void)_storeServicesNetworkStopNotification:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SUNetworkObserver__storeServicesNetworkStopNotification___block_invoke;
  block[3] = &unk_264812130;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void *__59__SUNetworkObserver__storeServicesNetworkStopNotification___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 40);
  BOOL v3 = v2 < 1;
  uint64_t v4 = v2 - 1;
  if (!v3)
  {
    *(void *)(v1 + 40) = v4;
    id result = (void *)result[4];
    if (!result[5]) {
      return (void *)[result _mainThreadScheduleNetworkActivityUpdate];
    }
  }
  return result;
}

- (void)_cancelStartupTimer
{
  self->_startupTimer = 0;
}

- (void)_handleNetworkTypeChange:(id)a3
{
  uint64_t v4 = (void *)[(SUNetworkObserver *)self mainThreadProxy];

  [v4 _mainThreadHandleNetworkTypeChange:a3];
}

- (void)_handleUsingNetworkChange:(id)a3
{
  BOOL v3 = (void *)[(SUNetworkObserver *)self mainThreadProxy];

  [v3 _mainThreadScheduleNetworkActivityUpdate];
}

- (void)_mainThreadHandleNetworkTypeChange:(id)a3
{
  [(SUNetworkObserver *)self _cancelStartupTimer];
  uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v4 postNotificationName:@"SUNetworkTypeChangedNotification" object:self];
}

- (void)_mainThreadScheduleNetworkActivityUpdate
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateNetworkActivityIndicator object:0];

  [(SUNetworkObserver *)self performSelector:sel__updateNetworkActivityIndicator withObject:0 afterDelay:0.25];
}

- (void)_mainThreadSetPartnerIdentifier:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [a3 rangeOfString:@"."];
    if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
      a3 = (id)[a3 substringToIndex:v5];
    }
    [(SUNetworkObserver *)self setPartnerIdentifier:a3];
  }
}

- (void)_startupTimer:(id)a3
{
}

- (void)_updateNetworkActivityIndicator
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  BOOL v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  if (self->_storeServicesNetworkUsageCount <= 0) {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F894C0], "sharedInstance"), "isUsingNetwork");
  }
  else {
    uint64_t v4 = 1;
  }

  [v3 setNetworkActivityIndicatorVisible:v4];
}

@end