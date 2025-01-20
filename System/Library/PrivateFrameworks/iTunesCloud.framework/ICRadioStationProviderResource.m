@interface ICRadioStationProviderResource
- (ICRadioStationProviderResource)initWithRadioStationProviderResourceDictionary:(id)a3;
- (NSString)bundleIdentifier;
- (NSURL)url;
@end

@implementation ICRadioStationProviderResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)url
{
  return self->_url;
}

- (ICRadioStationProviderResource)initWithRadioStationProviderResourceDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioStationProviderResource;
  v5 = [(ICRadioStationProviderResource *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"url"];
    uint64_t v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    v9 = [v4 objectForKeyedSubscript:@"bundle-id"];
    uint64_t v10 = [v9 copy];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;
  }
  return v5;
}

@end