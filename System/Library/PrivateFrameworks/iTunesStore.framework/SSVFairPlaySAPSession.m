@interface SSVFairPlaySAPSession
@end

@implementation SSVFairPlaySAPSession

void __67__SSVFairPlaySAPSession_ISFairPlaySAPSession__sharedDefaultSession__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F7B388]);
  ISFairPlaySAPSessionURLBag();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithURLBag:v3 SAPVersion:0];
  v2 = (void *)sharedDefaultSession_sSession;
  sharedDefaultSession_sSession = v1;
}

void __65__SSVFairPlaySAPSession_ISFairPlaySAPSession__sharedPrimeSession__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F7B388]);
  ISFairPlaySAPSessionURLBag();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 initWithURLBag:v3 SAPVersion:1];
  v2 = (void *)sharedPrimeSession_sSession;
  sharedPrimeSession_sSession = v1;
}

@end