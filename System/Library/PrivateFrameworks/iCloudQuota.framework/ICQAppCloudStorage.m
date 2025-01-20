@interface ICQAppCloudStorage
+ (BOOL)supportsSecureCoding;
- (ICQAppCloudStorage)initWithCoder:(id)a3;
- (NSNumber)storageUsed;
- (NSString)bundleID;
- (NSURL)liftUIURL;
- (NSURL)ruiURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setLiftUIURL:(id)a3;
- (void)setRuiURL:(id)a3;
- (void)setStorageUsed:(id)a3;
@end

@implementation ICQAppCloudStorage

- (id)description
{
  return (id)[NSString stringWithFormat:@"bundleID: %@, storageUsed: %@, ruiURL: %@, liftUIURL: %@", self->_bundleID, self->_storageUsed, self->_ruiURL, self->_liftUIURL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQAppCloudStorage);
  [(ICQAppCloudStorage *)v4 setBundleID:self->_bundleID];
  [(ICQAppCloudStorage *)v4 setStorageUsed:self->_storageUsed];
  [(ICQAppCloudStorage *)v4 setRuiURL:self->_ruiURL];
  [(ICQAppCloudStorage *)v4 setLiftUIURL:self->_liftUIURL];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_storageUsed forKey:@"storageUsed"];
  [v5 encodeObject:self->_ruiURL forKey:@"ruiURL"];
  [v5 encodeObject:self->_liftUIURL forKey:@"liftUIURL"];
}

- (ICQAppCloudStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICQAppCloudStorage;
  id v5 = [(ICQAppCloudStorage *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageUsed"];
    storageUsed = v5->_storageUsed;
    v5->_storageUsed = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ruiURL"];
    ruiURL = v5->_ruiURL;
    v5->_ruiURL = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"liftUIURL"];
    liftUIURL = v5->_liftUIURL;
    v5->_liftUIURL = (NSURL *)v12;
  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSNumber)storageUsed
{
  return self->_storageUsed;
}

- (void)setStorageUsed:(id)a3
{
}

- (NSURL)ruiURL
{
  return self->_ruiURL;
}

- (void)setRuiURL:(id)a3
{
}

- (NSURL)liftUIURL
{
  return self->_liftUIURL;
}

- (void)setLiftUIURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftUIURL, 0);
  objc_storeStrong((id *)&self->_ruiURL, 0);
  objc_storeStrong((id *)&self->_storageUsed, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end