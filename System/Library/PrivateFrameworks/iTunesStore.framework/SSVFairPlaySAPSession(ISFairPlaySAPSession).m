@interface SSVFairPlaySAPSession(ISFairPlaySAPSession)
+ (id)sharedDefaultSession;
+ (id)sharedPrimeSession;
@end

@implementation SSVFairPlaySAPSession(ISFairPlaySAPSession)

+ (id)sharedDefaultSession
{
  if (sharedDefaultSession_sOnce != -1) {
    dispatch_once(&sharedDefaultSession_sOnce, &__block_literal_global_12);
  }
  v0 = (void *)sharedDefaultSession_sSession;

  return v0;
}

+ (id)sharedPrimeSession
{
  if (sharedPrimeSession_sOnce != -1) {
    dispatch_once(&sharedPrimeSession_sOnce, &__block_literal_global_2);
  }
  v0 = (void *)sharedPrimeSession_sSession;

  return v0;
}

@end