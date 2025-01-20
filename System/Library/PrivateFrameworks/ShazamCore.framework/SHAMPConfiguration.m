@interface SHAMPConfiguration
- (SHAMPConfiguration)initWithResponse:(id)a3;
- (SHOffers)offers;
- (SHStreamingProviders)streamingProviders;
- (id)offerResponseFromResponse:(id)a3;
- (id)streamingProvidersResponseFromResponse:(id)a3;
@end

@implementation SHAMPConfiguration

- (SHAMPConfiguration)initWithResponse:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHAMPConfiguration;
  v5 = [(SHAMPConfiguration *)&v15 init];
  if (v5)
  {
    v6 = [SHOffers alloc];
    v7 = [(SHAMPConfiguration *)v5 offerResponseFromResponse:v4];
    uint64_t v8 = [(SHOffers *)v6 initWithOfferResponse:v7];
    offers = v5->_offers;
    v5->_offers = (SHOffers *)v8;

    v10 = [SHStreamingProviders alloc];
    v11 = [(SHAMPConfiguration *)v5 streamingProvidersResponseFromResponse:v4];
    uint64_t v12 = [(SHStreamingProviders *)v10 initWithResponse:v11];
    streamingProviders = v5->_streamingProviders;
    v5->_streamingProviders = (SHStreamingProviders *)v12;
  }
  return v5;
}

- (id)offerResponseFromResponse:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"results"];
  id v4 = [v3 objectForKeyedSubscript:@"appleMusicOffers"];

  return v4;
}

- (id)streamingProvidersResponseFromResponse:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"results"];
  id v4 = [v3 objectForKeyedSubscript:@"streamingProviders"];

  return v4;
}

- (SHOffers)offers
{
  return self->_offers;
}

- (SHStreamingProviders)streamingProviders
{
  return self->_streamingProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingProviders, 0);
  objc_storeStrong((id *)&self->_offers, 0);
}

@end