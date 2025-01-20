@interface SBFAnalyticsClient
+ (id)sharedInstance;
- (NSString)significantTimeChangedNotificationName;
- (SBFAnalyticsClient)initWithBackend:(id)a3;
- (void)_noteSignificantTimeChanged:(id)a3;
- (void)emitEvent:(unint64_t)a3;
- (void)emitEvent:(unint64_t)a3 withPayload:(id)a4;
- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4;
- (void)setSignificantTimeChangedNotificationName:(id)a3;
@end

@implementation SBFAnalyticsClient

- (void)emitEvent:(unint64_t)a3 withPayload:(id)a4
{
  backend = self->_backend;
  id v7 = a4;
  v8 = [[SBAnalyticsContextProvider alloc] initWithEventPayload:v7 backend:self->_backend];

  [(SBFAnalyticsBackend *)backend handleEvent:a3 withContext:v8];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_14);
  }
  v2 = (void *)sharedInstance___client;
  return v2;
}

- (void)emitEvent:(unint64_t)a3
{
}

void __36__SBFAnalyticsClient_sharedInstance__block_invoke()
{
  v0 = [SBFAnalyticsClient alloc];
  id v3 = +[SBFAnalyticsBackend sharedInstance];
  uint64_t v1 = [(SBFAnalyticsClient *)v0 initWithBackend:v3];
  v2 = (void *)sharedInstance___client;
  sharedInstance___client = v1;
}

- (SBFAnalyticsClient)initWithBackend:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFAnalyticsClient;
  v6 = [(SBFAnalyticsClient *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backend, a3);
  }

  return v7;
}

- (void)registerForQueryName:(unint64_t)a3 handler:(id)a4
{
}

- (void)setSignificantTimeChangedNotificationName:(id)a3
{
  if (self->_significantTimeChangedNotificationName != a3)
  {
    v4 = (void *)MEMORY[0x1E4F28EB8];
    id v5 = a3;
    id v8 = [v4 defaultCenter];
    [v8 removeObserver:self name:self->_significantTimeChangedNotificationName object:0];
    v6 = (NSString *)[v5 copy];

    significantTimeChangedNotificationName = self->_significantTimeChangedNotificationName;
    self->_significantTimeChangedNotificationName = v6;

    [v8 addObserver:self selector:sel__noteSignificantTimeChanged_ name:self->_significantTimeChangedNotificationName object:0];
  }
}

- (void)_noteSignificantTimeChanged:(id)a3
{
}

- (NSString)significantTimeChangedNotificationName
{
  return self->_significantTimeChangedNotificationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantTimeChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_backend, 0);
}

@end