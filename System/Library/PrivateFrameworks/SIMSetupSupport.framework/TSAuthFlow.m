@interface TSAuthFlow
- (BOOL)isLocalConvertFlow;
- (NSData)externalizedContext;
- (NSString)descriptor;
- (TSAuthFlow)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)firstViewController:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setIsLocalConvertFlow:(BOOL)a3;
@end

@implementation TSAuthFlow

- (TSAuthFlow)initWithExternalizedContext:(id)a3 descriptor:(id)a4 isLocalConvertFlow:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TSAuthFlow;
  v11 = [(TSSIMSetupFlow *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_externalizedContext, a3);
    objc_storeStrong((id *)&v12->_descriptor, a4);
    v12->_isLocalConvertFlow = a5;
  }

  return v12;
}

- (id)firstViewController
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (+[TSUtilities isSecureIntentUIRequired:self->_externalizedContext])
  {
    v3 = [[TSSecureIntentGestureViewController alloc] initWithExternalizedContext:self->_externalizedContext descriptor:self->_descriptor isLocalConvertFlow:self->_isLocalConvertFlow];
    [(TSSecureIntentGestureViewController *)v3 setDelegate:self];
    [(TSSIMSetupFlow *)self setTopViewController:v3];
  }
  else
  {
    v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[TSAuthFlow firstViewController]";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "skip secure intent ui @%s", (uint8_t *)&v8, 0xCu);
    }

    v5 = +[TSCoreTelephonyClientCache sharedInstance];
    id v6 = (id)[v5 updateSecureIntentData:self->_externalizedContext];

    v3 = 0;
  }
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(TSAuthFlow *)self firstViewController];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (NSData)externalizedContext
{
  return (NSData *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExternalizedContext:(id)a3
{
}

- (NSString)descriptor
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)isLocalConvertFlow
{
  return self->_isLocalConvertFlow;
}

- (void)setIsLocalConvertFlow:(BOOL)a3
{
  self->_isLocalConvertFlow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end