@interface PKDiscoveryMediaRemoteAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)sha1Hex;
- (NSURL)url;
- (PKDiscoveryMediaRemoteAsset)initWithCoder:(id)a3;
- (PKDiscoveryMediaRemoteAsset)initWithDictionary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDiscoveryMediaRemoteAsset

- (PKDiscoveryMediaRemoteAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryMediaRemoteAsset;
  v5 = [(PKDiscoveryMediaRemoteAsset *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKURLForKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"sha1"];
    sha1Hex = v5->_sha1Hex;
    v5->_sha1Hex = (NSString *)v8;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  url = self->_url;
  uint64_t v6 = (NSURL *)v4[2];
  if (!url || !v6)
  {
    if (url == v6) {
      goto LABEL_5;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  sha1Hex = self->_sha1Hex;
  uint64_t v8 = (NSString *)v4[1];
  if (sha1Hex && v8) {
    char v9 = -[NSString isEqual:](sha1Hex, "isEqual:");
  }
  else {
    char v9 = sha1Hex == v8;
  }
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_url];
  [v3 safelyAddObject:self->_sha1Hex];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_sha1Hex forKey:@"sha1"];
}

- (PKDiscoveryMediaRemoteAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKDiscoveryMediaRemoteAsset;
  id v5 = [(PKDiscoveryMediaRemoteAsset *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sha1"];
    sha1Hex = v5->_sha1Hex;
    v5->_sha1Hex = (NSString *)v8;
  }
  return v5;
}

- (NSString)sha1Hex
{
  return self->_sha1Hex;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_sha1Hex, 0);
}

@end