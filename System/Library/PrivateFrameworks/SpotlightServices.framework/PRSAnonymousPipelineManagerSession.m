@interface PRSAnonymousPipelineManagerSession
+ (id)sharedManager;
- (PARSession)session;
- (PRSAnonymousPipelineManagerSession)init;
- (void)sendCustomFeedback:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation PRSAnonymousPipelineManagerSession

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_34);
  }
  v2 = (void *)sharedManager_session;
  return v2;
}

uint64_t __51__PRSAnonymousPipelineManagerSession_sharedManager__block_invoke()
{
  sharedManager_session = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (PRSAnonymousPipelineManagerSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)PRSAnonymousPipelineManagerSession;
  v2 = [(PRSAnonymousPipelineManager *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PRSAnonymousPipelineManager *)v2 setDelegate:0];
  }
  return v3;
}

- (void)sendCustomFeedback:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(PRSAnonymousPipelineManagerSession *)self session];

  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 infoDictionary];
    v8 = [v7 objectForKeyedSubscript:@"CFBundleVersion"];

    v9 = [NSString stringWithFormat:@"Metadata/%@", v8];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F5CBE0]) initWithId:@"com.apple.spotlight.metadata" userAgent:v9];
    v11 = [MEMORY[0x1E4F5CBD8] sessionWithConfiguration:v10];
    [(PRSAnonymousPipelineManagerSession *)self setSession:v11];
  }
  id v12 = [(PRSAnonymousPipelineManagerSession *)self session];
  [v12 sendCustomFeedback:v4];
}

- (PARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end