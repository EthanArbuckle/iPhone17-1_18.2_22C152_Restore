@interface TSIDSTransferFlow
- (BOOL)isWebsheetFlow;
- (CoreTelephonyClient)client;
- (PRXCardContentProviding)secureIntentProxCard;
- (TSIDSTransferFlow)init;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)firstViewController:(id)a3;
- (void)handleTransferringWatchdogExpiry;
- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6;
- (void)setClient:(id)a3;
- (void)setIsWebsheetFlow:(BOOL)a3;
- (void)setSecureIntentProxCard:(id)a3;
- (void)transferEventUpdate:(id)a3;
@end

@implementation TSIDSTransferFlow

- (TSIDSTransferFlow)init
{
  v8.receiver = self;
  v8.super_class = (Class)TSIDSTransferFlow;
  v2 = [(TSSIMSetupFlow *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    uint64_t v4 = [v3 initWithQueue:MEMORY[0x263EF83A0]];
    client = v2->_client;
    v2->_client = (CoreTelephonyClient *)v4;

    [(CoreTelephonyClient *)v2->_client setDelegate:v2];
  }
  v7.receiver = v2;
  v7.super_class = (Class)TSIDSTransferFlow;
  return [(TSSIMSetupFlow *)&v7 init];
}

- (id)firstViewController
{
  id v3 = [TSIDSSimTransferringViewController alloc];
  uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"PRXCARD_TRANSFERRING_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 localizedStringForKey:@"PRXCARD_TRANSFERRING_SUBTITLE" value:&stru_26DBE8E78 table:@"Localizable"];
  objc_super v8 = [(TSIDSSimTransferringViewController *)v3 initWithTitle:v5 subtitle:v7];

  [(TSIDSSimTransferringViewController *)v8 setDelegate:self];
  [(TSSIMSetupFlow *)self setTopViewController:v8];
  if (!self->_transferringWatchDogTimer)
  {
    v9 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_handleTransferringWatchdogExpiry selector:0 userInfo:0 repeats:120.0];
    transferringWatchDogTimer = self->_transferringWatchDogTimer;
    self->_transferringWatchDogTimer = v9;
  }
  return v8;
}

- (void)firstViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(TSIDSTransferFlow *)self firstViewController];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)nextViewControllerFrom:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) == 0 || ([v4 isSecureIntentFailed]) {
      goto LABEL_7;
    }
LABEL_8:
    id v6 = objc_alloc_init(TSPRXSIMTransferCompleteViewController);
    goto LABEL_9;
  }
  if ([(TSIDSTransferFlow *)self isWebsheetFlow]) {
    goto LABEL_8;
  }
  id v5 = [(TSIDSTransferFlow *)self secureIntentProxCard];

  if (!v5)
  {
LABEL_7:
    objc_super v7 = 0;
    goto LABEL_10;
  }
  id v6 = [(TSIDSTransferFlow *)self secureIntentProxCard];
LABEL_9:
  objc_super v7 = v6;
LABEL_10:

  return v7;
}

- (void)handleTransferringWatchdogExpiry
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    objc_super v8 = "-[TSIDSTransferFlow handleTransferringWatchdogExpiry]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "handle 2 min transferring watchdog timer expired @%s", (uint8_t *)&v7, 0xCu);
  }

  id v4 = [(TSSIMSetupFlow *)self topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(TSSIMSetupFlow *)self topViewController];
    [(TSSIMSetupFlow *)self viewControllerDidComplete:v6];
  }
}

- (void)launchSecureIntentUI:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t))a6;
  if (+[TSUtilities isSecureIntentUIRequired:v10])
  {
    v13 = [[TSSecureIntentGestureViewController alloc] initWithExternalizedContext:v10 descriptor:v11 isLocalConvertFlow:v7];
    [(TSIDSTransferFlow *)self setSecureIntentProxCard:v13];
  }
  else
  {
    v14 = _TSLogDomain();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[TSIDSTransferFlow launchSecureIntentUI:descriptor:isLocalConvertFlow:completion:]";
      _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "secure intent gesture is not required. skip @%s", (uint8_t *)&v17, 0xCu);
    }

    id v15 = (id)[(CoreTelephonyClient *)self->_client updateSecureIntentData:v10];
  }
  v16 = [(TSSIMSetupFlow *)self topViewController];
  [(TSSIMSetupFlow *)self viewControllerDidComplete:v16];

  v12[2](v12, 1);
}

- (void)transferEventUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v4;
    __int16 v16 = 2080;
    int v17 = "-[TSIDSTransferFlow transferEventUpdate:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "transfer event : %@ @%s", (uint8_t *)&v14, 0x16u);
  }

  id v6 = [v4 objectForKey:@"kTransferWebsheet"];

  if (v6)
  {
    [(TSIDSTransferFlow *)self setIsWebsheetFlow:1];
    BOOL v7 = [(TSSIMSetupFlow *)self topViewController];
    [(TSSIMSetupFlow *)self viewControllerDidComplete:v7];
  }
  objc_super v8 = [v4 objectForKey:@"kTransferInformationSent"];

  if (v8)
  {
    [(CoreTelephonyClient *)self->_client setDelegate:0];
    uint64_t v9 = [(TSSIMSetupFlow *)self topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v11 = [(TSSIMSetupFlow *)self topViewController];
      [(TSSIMSetupFlow *)self viewControllerDidComplete:v11];
    }
  }
  v12 = [v4 objectForKey:@"UpdateProxCardVisibility"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 BOOLValue])
      {
        v13 = _TSLogDomain();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[TSIDSTransferFlow transferEventUpdate:](v13);
        }
      }
      else
      {
        v13 = [(TSSIMSetupFlow *)self topViewController];
        [(TSSIMSetupFlow *)self viewControllerDidComplete:v13];
      }
    }
  }
}

- (PRXCardContentProviding)secureIntentProxCard
{
  return (PRXCardContentProviding *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSecureIntentProxCard:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (BOOL)isWebsheetFlow
{
  return self->_isWebsheetFlow;
}

- (void)setIsWebsheetFlow:(BOOL)a3
{
  self->_isWebsheetFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_secureIntentProxCard, 0);
  objc_storeStrong((id *)&self->_transferringWatchDogTimer, 0);
}

- (void)transferEventUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSIDSTransferFlow transferEventUpdate:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Unexpected transferEventUpdate for resuming prox card @%s", (uint8_t *)&v1, 0xCu);
}

@end