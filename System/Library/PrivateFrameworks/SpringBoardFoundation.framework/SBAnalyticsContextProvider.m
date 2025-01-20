@interface SBAnalyticsContextProvider
- (NSString)description;
- (SBAnalyticsContextProvider)initWithEventPayload:(id)a3 backend:(id)a4;
- (SBSAnalyticsState)eventPayload;
- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4;
@end

@implementation SBAnalyticsContextProvider

- (SBSAnalyticsState)eventPayload
{
  return self->_eventPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backend, 0);
  objc_storeStrong((id *)&self->_eventPayload, 0);
}

- (SBAnalyticsContextProvider)initWithEventPayload:(id)a3 backend:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBAnalyticsContextProvider;
  v8 = [(SBAnalyticsContextProvider *)&v16 init];
  if (v8)
  {
    double v9 = CACurrentMediaTime();
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA76B0]];
    v11 = v10;
    if (v10)
    {
      [v10 doubleValue];
      double v9 = v12;
    }
    uint64_t v13 = [MEMORY[0x1E4FA6990] withTimestamp:v6 payload:v9];
    eventPayload = v8->_eventPayload;
    v8->_eventPayload = (SBSAnalyticsState *)v13;

    objc_storeStrong((id *)&v8->_backend, a4);
  }

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(SBAnalyticsContextProvider *)self eventPayload];
  id v5 = (id)[v3 appendObject:v4 withName:@"eventPayload"];

  id v6 = [v3 build];

  return (NSString *)v6;
}

- (void)stateForQueryName:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  backend = self->_backend;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBAnalyticsContextProvider_stateForQueryName_completion___block_invoke;
  v9[3] = &unk_1E548D578;
  id v10 = v6;
  id v8 = v6;
  [(SBFAnalyticsBackend *)backend stateForQueryName:a3 completion:v9];
}

void __59__SBAnalyticsContextProvider_stateForQueryName_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FA6990];
  id v4 = a2;
  id v5 = [v3 withTimestamp:v4 payload:CACurrentMediaTime()];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end