@interface SPPARSession
+ (id)spotlightPARSession;
@end

@implementation SPPARSession

+ (id)spotlightPARSession
{
  if (spotlightPARSession_onceToken != -1) {
    dispatch_once(&spotlightPARSession_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)spotlightPARSession_gSession;
  return v2;
}

void __35__SPPARSession_spotlightPARSession__block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F36D70]) initWithId:@"com.apple.spotlight" userAgent:@"spotlight/1.0" factory:0];
  uint64_t v0 = [MEMORY[0x263F36D68] sessionWithConfiguration:v2];
  v1 = (void *)spotlightPARSession_gSession;
  spotlightPARSession_gSession = v0;
}

@end