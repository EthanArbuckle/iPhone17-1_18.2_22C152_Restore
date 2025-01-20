@interface BKAssetID
+ (id)identifierWithAssetID:(id)a3;
- (BKAssetID)initWithAssetID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporary;
- (NSString)assetID;
- (NSString)description;
- (NSString)permanentAssetID;
- (NSString)permanentOrTemporaryAssetID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation BKAssetID

+ (id)identifierWithAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAssetID:v4];

  return v5;
}

- (BKAssetID)initWithAssetID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAssetID;
  v6 = [(BKAssetID *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_assetID, a3);
  }

  return v7;
}

- (NSString)permanentOrTemporaryAssetID
{
  id v2 = [(NSString *)self->_assetID copy];

  return (NSString *)v2;
}

- (NSString)permanentAssetID
{
  id v2 = [(NSString *)self->_assetID copy];

  return (NSString *)v2;
}

- (BOOL)isTemporary
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  assetID = self->_assetID;

  return [v4 initWithAssetID:assetID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4[1] isEqual:self->_assetID];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_assetID hash];
}

- (NSString)description
{
  return self->_assetID;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void).cxx_destruct
{
}

@end