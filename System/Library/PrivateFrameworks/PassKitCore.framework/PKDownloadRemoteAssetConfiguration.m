@interface PKDownloadRemoteAssetConfiguration
+ (id)configurationWithCloudStoreDelegate:(id)a3;
+ (id)configurationWithCloudStoreDelegate:(id)a3 seids:(id)a4;
+ (id)configurationWithSEIDs:(id)a3;
- (BOOL)ignoreRequiredAssetDownloadFailures;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDownloadRemoteAssetConfiguration:(id)a3;
- (NSArray)seids;
- (NSString)suffix;
- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate;
- (PKDownloadRemoteAssetConfiguration)init;
- (double)screenScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setCloudStoreCoordinatorDelegate:(id)a3;
- (void)setIgnoreRequiredAssetDownloadFailures:(BOOL)a3;
- (void)setScreenScale:(double)a3;
- (void)setSeids:(id)a3;
- (void)setSuffix:(id)a3;
@end

@implementation PKDownloadRemoteAssetConfiguration

- (PKDownloadRemoteAssetConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKDownloadRemoteAssetConfiguration;
  return [(PKDownloadRemoteAssetConfiguration *)&v3 init];
}

+ (id)configurationWithSEIDs:(id)a3
{
  objc_super v3 = (NSArray *)a3;
  v4 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  seids = v4->_seids;
  v4->_seids = v3;

  return v4;
}

+ (id)configurationWithCloudStoreDelegate:(id)a3
{
  objc_super v3 = (PKCloudStoreCoordinatorDelegate *)a3;
  v4 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  cloudStoreCoordinatorDelegate = v4->_cloudStoreCoordinatorDelegate;
  v4->_cloudStoreCoordinatorDelegate = v3;

  return v4;
}

+ (id)configurationWithCloudStoreDelegate:(id)a3 seids:(id)a4
{
  v5 = (PKCloudStoreCoordinatorDelegate *)a3;
  v6 = (NSArray *)a4;
  v7 = objc_alloc_init(PKDownloadRemoteAssetConfiguration);
  cloudStoreCoordinatorDelegate = v7->_cloudStoreCoordinatorDelegate;
  v7->_cloudStoreCoordinatorDelegate = v5;
  v9 = v5;

  seids = v7->_seids;
  v7->_seids = v6;

  return v7;
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"seids: '%@'; ", self->_seids];
  objc_msgSend(v6, "appendFormat:", @"cloudStoreCoordinatorDelegate: '%@'; ",
    self->_cloudStoreCoordinatorDelegate);
  v7 = [NSNumber numberWithDouble:self->_screenScale];
  [v6 appendFormat:@"screenScale: '%@'; ", v7];

  [v6 appendFormat:@"suffix: '%@'; ", self->_suffix];
  v8 = [NSNumber numberWithBool:self->_ignoreRequiredAssetDownloadFailures];
  [v6 appendFormat:@"ignoreRequiredAssetDownloadFailures: '%@'; ", v8];

  [v6 appendFormat:@">"];
  v9 = [NSString stringWithString:v6];

  return v9;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if (self->_seids) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_cloudStoreCoordinatorDelegate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_suffix) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = (unint64_t)self->_screenScale - v5 + 32 * v5;
  unint64_t v7 = self->_ignoreRequiredAssetDownloadFailures - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKDownloadRemoteAssetConfiguration *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDownloadRemoteAssetConfiguration *)self isEqualToDownloadRemoteAssetConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToDownloadRemoteAssetConfiguration:(id)a3
{
  v4 = (double *)a3;
  seids = self->_seids;
  BOOL v6 = (NSArray *)*((void *)v4 + 2);
  if (seids) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (seids != v6) {
      goto LABEL_20;
    }
  }
  else if ((-[NSArray isEqual:](seids, "isEqual:") & 1) == 0)
  {
    goto LABEL_20;
  }
  cloudStoreCoordinatorDelegate = self->_cloudStoreCoordinatorDelegate;
  v9 = (PKCloudStoreCoordinatorDelegate *)*((void *)v4 + 3);
  if (cloudStoreCoordinatorDelegate && v9)
  {
    if ((-[PKCloudStoreCoordinatorDelegate isEqual:](cloudStoreCoordinatorDelegate, "isEqual:") & 1) == 0) {
      goto LABEL_20;
    }
  }
  else if (cloudStoreCoordinatorDelegate != v9)
  {
    goto LABEL_20;
  }
  if (self->_screenScale != v4[4]) {
    goto LABEL_20;
  }
  suffix = self->_suffix;
  v11 = (NSString *)*((void *)v4 + 5);
  if (!suffix || !v11)
  {
    if (suffix == v11) {
      goto LABEL_18;
    }
LABEL_20:
    BOOL v12 = 0;
    goto LABEL_21;
  }
  if ((-[NSString isEqual:](suffix, "isEqual:") & 1) == 0) {
    goto LABEL_20;
  }
LABEL_18:
  BOOL v12 = self->_ignoreRequiredAssetDownloadFailures == *((unsigned __int8 *)v4 + 8);
LABEL_21:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PKDownloadRemoteAssetConfiguration allocWithZone:a3] init];
  uint64_t v5 = [(NSArray *)self->_seids copy];
  seids = v4->_seids;
  v4->_seids = (NSArray *)v5;

  objc_storeStrong((id *)&v4->_cloudStoreCoordinatorDelegate, self->_cloudStoreCoordinatorDelegate);
  v4->_screenScale = self->_screenScale;
  uint64_t v7 = [(NSString *)self->_suffix copy];
  suffix = v4->_suffix;
  v4->_suffix = (NSString *)v7;

  v4->_ignoreRequiredAssetDownloadFailures = self->_ignoreRequiredAssetDownloadFailures;
  return v4;
}

- (NSArray)seids
{
  return self->_seids;
}

- (void)setSeids:(id)a3
{
}

- (PKCloudStoreCoordinatorDelegate)cloudStoreCoordinatorDelegate
{
  return self->_cloudStoreCoordinatorDelegate;
}

- (void)setCloudStoreCoordinatorDelegate:(id)a3
{
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (void)setSuffix:(id)a3
{
}

- (BOOL)ignoreRequiredAssetDownloadFailures
{
  return self->_ignoreRequiredAssetDownloadFailures;
}

- (void)setIgnoreRequiredAssetDownloadFailures:(BOOL)a3
{
  self->_ignoreRequiredAssetDownloadFailures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_cloudStoreCoordinatorDelegate, 0);
  objc_storeStrong((id *)&self->_seids, 0);
}

@end