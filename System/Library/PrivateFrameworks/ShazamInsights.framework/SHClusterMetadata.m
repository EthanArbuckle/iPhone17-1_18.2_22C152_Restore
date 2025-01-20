@interface SHClusterMetadata
- (NSDate)creationDate;
- (NSString)storefront;
- (NSString)uniqueHash;
- (SHClusterMetadata)initWithType:(int64_t)a3 storefront:(id)a4 uniqueHash:(id)a5 creationDate:(id)a6;
- (int64_t)clusterType;
@end

@implementation SHClusterMetadata

- (SHClusterMetadata)initWithType:(int64_t)a3 storefront:(id)a4 uniqueHash:(id)a5 creationDate:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SHClusterMetadata;
  v14 = [(SHClusterMetadata *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_clusterType = a3;
    objc_storeStrong((id *)&v14->_storefront, a4);
    objc_storeStrong((id *)&v15->_uniqueHash, a5);
    objc_storeStrong((id *)&v15->_creationDate, a6);
  }

  return v15;
}

- (NSString)uniqueHash
{
  return self->_uniqueHash;
}

- (NSString)storefront
{
  return self->_storefront;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)clusterType
{
  return self->_clusterType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_uniqueHash, 0);
}

@end