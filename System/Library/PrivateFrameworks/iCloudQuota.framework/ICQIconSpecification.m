@interface ICQIconSpecification
+ (BOOL)supportsSecureCoding;
- (ICQIconSpecification)initWithCoder:(id)a3;
- (ICQIconSpecification)initWithDictionary:(id)a3;
- (ICQImageURL)imageURL;
- (NSString)assetID;
- (NSString)bundleID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICQIconSpecification

- (ICQIconSpecification)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQIconSpecification;
  v5 = [(ICQIconSpecification *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"assetId"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v8;

    v10 = [ICQImageURL alloc];
    v11 = [v4 objectForKeyedSubscript:@"urls"];
    uint64_t v12 = [(ICQImageURL *)v10 initFromDictionary:v11];
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v12;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ICQIconSpecification *)self bundleID];
  [v4 encodeObject:v5 forKey:@"bundleId"];

  uint64_t v6 = [(ICQIconSpecification *)self assetID];
  [v4 encodeObject:v6 forKey:@"assetId"];

  id v7 = [(ICQIconSpecification *)self imageURL];
  [v4 encodeObject:v7 forKey:@"urls"];
}

- (ICQIconSpecification)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQIconSpecification;
  v5 = [(ICQIconSpecification *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleId"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetId"];
    assetID = v5->_assetID;
    v5->_assetID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urls"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v10;
  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end