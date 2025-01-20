@interface PGSearchThumbnailMomentAssetPairUUID
+ (BOOL)supportsSecureCoding;
- (NSString)assetUUID;
- (NSString)momentUUID;
- (PGSearchThumbnailMomentAssetPairUUID)initWithAssetUUID:(id)a3 momentUUID:(id)a4;
- (PGSearchThumbnailMomentAssetPairUUID)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PGSearchThumbnailMomentAssetPairUUID

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentUUID, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
}

- (NSString)momentUUID
{
  return self->_momentUUID;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (void)encodeWithCoder:(id)a3
{
  assetUUID = self->_assetUUID;
  id v5 = a3;
  [v5 encodeObject:assetUUID forKey:@"assetUUID"];
  [v5 encodeObject:self->_momentUUID forKey:@"momentUUID"];
}

- (PGSearchThumbnailMomentAssetPairUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSearchThumbnailMomentAssetPairUUID;
  id v5 = [(PGSearchThumbnailMomentAssetPairUUID *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetUUID"];
    assetUUID = v5->_assetUUID;
    v5->_assetUUID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"momentUUID"];
    momentUUID = v5->_momentUUID;
    v5->_momentUUID = (NSString *)v8;
  }
  return v5;
}

- (PGSearchThumbnailMomentAssetPairUUID)initWithAssetUUID:(id)a3 momentUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGSearchThumbnailMomentAssetPairUUID;
  v9 = [(PGSearchThumbnailMomentAssetPairUUID *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUUID, a3);
    objc_storeStrong((id *)&v10->_momentUUID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end