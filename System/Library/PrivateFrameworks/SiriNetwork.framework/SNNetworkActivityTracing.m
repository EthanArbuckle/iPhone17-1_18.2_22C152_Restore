@interface SNNetworkActivityTracing
+ (id)sharedInstance;
- (SNNetworkActivityTracingInternal)underlyingNetworkActivityTracingInternal;
- (id)_init;
- (void)currentNetworkActivityTokenWithCompletion:(id)a3;
- (void)networkActivityActivate:(int64_t)a3 completion:(id)a4;
- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4 completion:(id)a5;
- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5 completion:(id)a6;
- (void)networkActivityTracingCancel:(id)a3;
- (void)setUnderlyingNetworkActivityTracingInternal:(id)a3;
@end

@implementation SNNetworkActivityTracing

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sSharedInstance;

  return v2;
}

void __42__SNNetworkActivityTracing_sharedInstance__block_invoke()
{
  id v0 = [[SNNetworkActivityTracing alloc] _init];
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)SNNetworkActivityTracing;
  v2 = [(SNNetworkActivityTracing *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[SNNetworkActivityTracingInternal shared];
    underlyingNetworkActivityTracingInternal = v2->_underlyingNetworkActivityTracingInternal;
    v2->_underlyingNetworkActivityTracingInternal = (SNNetworkActivityTracingInternal *)v3;
  }
  return v2;
}

- (void)networkActivityStart:(int64_t)a3 activate:(BOOL)a4 completion:(id)a5
{
}

- (void)networkActivityActivate:(int64_t)a3 completion:(id)a4
{
}

- (void)networkActivityStop:(int64_t)a3 withReason:(int64_t)a4 andError:(id)a5 completion:(id)a6
{
}

- (void)networkActivityTracingCancel:(id)a3
{
}

- (void)currentNetworkActivityTokenWithCompletion:(id)a3
{
}

- (SNNetworkActivityTracingInternal)underlyingNetworkActivityTracingInternal
{
  return self->_underlyingNetworkActivityTracingInternal;
}

- (void)setUnderlyingNetworkActivityTracingInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end