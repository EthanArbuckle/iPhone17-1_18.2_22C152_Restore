@interface SSVPlaybackAsset
- (BOOL)isEqual:(id)a3;
- (NSArray)sinfs;
- (NSDictionary)assetDictionary;
- (NSString)URLString;
- (NSString)downloadKey;
- (NSString)flavor;
- (SSVPlaybackAsset)initWithAssetDictionary:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SSVPlaybackAsset

- (SSVPlaybackAsset)initWithAssetDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackAsset;
  v5 = [(SSVPlaybackAsset *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (NSString)downloadKey
{
  v2 = [(NSDictionary *)self->_assetDictionary objectForKey:@"downloadKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)flavor
{
  v2 = [(NSDictionary *)self->_assetDictionary objectForKey:@"flavor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)sinfs
{
  v2 = [(NSDictionary *)self->_assetDictionary objectForKey:@"sinfs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (NSString)URLString
{
  v2 = [(NSDictionary *)self->_assetDictionary objectForKey:@"URL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackAsset;
  id v4 = [(SSVPlaybackAsset *)&v9 description];
  v5 = [(SSVPlaybackAsset *)self flavor];
  uint64_t v6 = [(SSVPlaybackAsset *)self URLString];
  v7 = [v3 stringWithFormat:@"%@ [Flavor: %@, URL: %@]", v4, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(SSVPlaybackAsset *)self URLString];
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVPlaybackAsset;
    id v5 = [(SSVPlaybackAsset *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = [(SSVPlaybackAsset *)self URLString];
    objc_super v8 = [v4 URLString];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSDictionary)assetDictionary
{
  return self->_assetDictionary;
}

- (void).cxx_destruct
{
}

@end