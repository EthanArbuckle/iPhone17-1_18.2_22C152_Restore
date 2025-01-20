@interface SHEndpoints
- (NSDictionary)endpoints;
- (NSString)suggestedLanguage;
- (SHEndpoints)initWithConfiguration:(id)a3 suggestedLanguage:(id)a4;
- (id)hapticsURLPathForClientIdentifier:(id)a3 songResourceIDType:(int64_t)a4;
- (id)lookupURLPathForClientIdentifier:(id)a3;
- (id)matchURLPathForClientIdentifier:(id)a3;
@end

@implementation SHEndpoints

- (SHEndpoints)initWithConfiguration:(id)a3 suggestedLanguage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SHEndpoints;
  v8 = [(SHEndpoints *)&v13 init];
  if (v8)
  {
    v9 = (void *)[v6 mutableCopy];
    [v9 setValue:@"/v1/catalog/{storefront}/songs/{id}?fields=name,hapticsAssetUrl,durationInMillis,spatialOffsets&format[resources]=map&extend=spatialOffsets" forKey:@"song-haptics-adamid"];
    [v9 setValue:@"/v1/catalog/{storefront}/songs?filter[isrc]={id}&fields=name,hapticsAssetUrl,durationInMillis,spatialOffsets&format[resources]=map&extend=spatialOffsets" forKey:@"song-haptics-isrc"];
    uint64_t v10 = [v9 copy];
    endpoints = v8->_endpoints;
    v8->_endpoints = (NSDictionary *)v10;

    objc_storeStrong((id *)&v8->_suggestedLanguage, a4);
  }

  return v8;
}

- (id)matchURLPathForClientIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@.%@", @"match", a3];
  v5 = [(SHEndpoints *)self endpoints];
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [(SHEndpoints *)self endpoints];
  v8 = v7;
  if (v6) {
    v9 = v4;
  }
  else {
    v9 = @"match";
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  return v10;
}

- (id)lookupURLPathForClientIdentifier:(id)a3
{
  v4 = [NSString stringWithFormat:@"%@.%@", @"lookup", a3];
  v5 = [(SHEndpoints *)self endpoints];
  id v6 = [v5 objectForKeyedSubscript:v4];
  id v7 = [(SHEndpoints *)self endpoints];
  v8 = v7;
  if (v6) {
    v9 = v4;
  }
  else {
    v9 = @"lookup";
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:v9];

  return v10;
}

- (id)hapticsURLPathForClientIdentifier:(id)a3 songResourceIDType:(int64_t)a4
{
  id v7 = a3;
  if (a4 == 2)
  {
    v8 = [NSString stringWithFormat:@"%@.%@", @"song-haptics-isrc", v7];
    v9 = [(SHEndpoints *)self endpoints];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];
    v11 = [(SHEndpoints *)self endpoints];
    if (!v10)
    {
      v12 = @"song-haptics-isrc";
      goto LABEL_8;
    }
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_10;
    }
    v8 = [NSString stringWithFormat:@"%@.%@", @"song-haptics-adamid", v7];
    v9 = [(SHEndpoints *)self endpoints];
    uint64_t v10 = [v9 objectForKeyedSubscript:v8];
    v11 = [(SHEndpoints *)self endpoints];
    if (!v10)
    {
      v12 = @"song-haptics-adamid";
LABEL_8:
      objc_super v13 = v11;
      goto LABEL_9;
    }
  }
  objc_super v13 = v11;
  v12 = v8;
LABEL_9:
  v4 = [v13 objectForKeyedSubscript:v12];

LABEL_10:
  return v4;
}

- (NSString)suggestedLanguage
{
  return self->_suggestedLanguage;
}

- (NSDictionary)endpoints
{
  return self->_endpoints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_suggestedLanguage, 0);
}

@end