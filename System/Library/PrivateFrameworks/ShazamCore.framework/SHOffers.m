@interface SHOffers
- (NSDictionary)offerResponse;
- (NSString)campaignSubtitle;
- (NSString)defaultSubtitle;
- (SHOffers)initWithOfferResponse:(id)a3;
- (SHTokenizedURL)defaultURL;
- (SHTokenizedURL)shazamURL;
- (id)campaignURLForTrackID:(id)a3 bundleID:(id)a4 token:(id)a5;
- (id)configForOfferNamed:(id)a3 bundleID:(id)a4;
- (id)defaultURLForBundleID:(id)a3;
- (id)subtitleForOfferNamed:(id)a3 bundleID:(id)a4;
- (id)urlForOfferNamed:(id)a3 bundleID:(id)a4;
- (id)valueForSpecializedKey:(id)a3 forBundleID:(id)a4 inDictionary:(id)a5;
@end

@implementation SHOffers

- (SHOffers)initWithOfferResponse:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHOffers;
  v6 = [(SHOffers *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_offerResponse, a3);
  }

  return v7;
}

- (NSString)defaultSubtitle
{
  return (NSString *)[(SHOffers *)self subtitleForOfferNamed:@"default" bundleID:&stru_26DAEBAC8];
}

- (NSString)campaignSubtitle
{
  return (NSString *)[(SHOffers *)self subtitleForOfferNamed:@"campaign" bundleID:&stru_26DAEBAC8];
}

- (id)defaultURLForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [SHTokenizedURL alloc];
  v6 = [(SHOffers *)self urlForOfferNamed:@"default" bundleID:v4];

  v7 = [(SHTokenizedURL *)v5 initWithString:v6];
  v8 = [(SHTokenizedURL *)v7 URLRepresentation];

  return v8;
}

- (id)campaignURLForTrackID:(id)a3 bundleID:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [SHTokenizedURL alloc];
  v12 = [(SHOffers *)self urlForOfferNamed:@"campaign" bundleID:v10];

  v13 = [(SHTokenizedURL *)v11 initWithString:v12];
  if ([(SHTokenizedURL *)v13 containsToken:10]
    && [(SHTokenizedURL *)v13 containsToken:9])
  {
    [(SHTokenizedURL *)v13 updateToken:9 withValue:v8];
    [(SHTokenizedURL *)v13 updateToken:10 withValue:v9];
    v14 = [(SHTokenizedURL *)v13 URLRepresentation];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)urlForOfferNamed:(id)a3 bundleID:(id)a4
{
  id v4 = [(SHOffers *)self configForOfferNamed:a3 bundleID:a4];
  id v5 = [v4 objectForKeyedSubscript:@"url"];

  return v5;
}

- (id)subtitleForOfferNamed:(id)a3 bundleID:(id)a4
{
  id v4 = [(SHOffers *)self configForOfferNamed:a3 bundleID:a4];
  id v5 = [v4 objectForKeyedSubscript:@"copy"];

  v6 = [v5 objectForKeyedSubscript:@"subtitle"];

  return v6;
}

- (id)configForOfferNamed:(id)a3 bundleID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SHOffers *)self offerResponse];
  id v9 = [(SHOffers *)self valueForSpecializedKey:v7 forBundleID:v6 inDictionary:v8];

  return v9;
}

- (id)valueForSpecializedKey:(id)a3 forBundleID:(id)a4 inDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [NSString stringWithFormat:@"%@.%@", v7, a4];
  id v10 = [v8 objectForKeyedSubscript:v9];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 objectForKeyedSubscript:v7];
  }
  v13 = v12;

  return v13;
}

- (SHTokenizedURL)shazamURL
{
  return self->_shazamURL;
}

- (NSDictionary)offerResponse
{
  return self->_offerResponse;
}

- (SHTokenizedURL)defaultURL
{
  return self->_defaultURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_offerResponse, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
}

@end