@interface PLSyncAssetGroup
- (NSDate)date;
- (NSMutableArray)assetPairs;
- (NSString)UUID;
- (id)description;
- (void)setAssetPairs:(id)a3;
- (void)setDate:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation PLSyncAssetGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPairs, 0);
  objc_storeStrong((id *)&self->_date, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setAssetPairs:(id)a3
{
}

- (NSMutableArray)assetPairs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUUID:(id)a3
{
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PLSyncAssetGroup;
  v3 = [(PLSyncAssetGroup *)&v9 description];
  v4 = [(PLSyncAssetGroup *)self UUID];
  v5 = [(PLSyncAssetGroup *)self date];
  v6 = [(PLSyncAssetGroup *)self assetPairs];
  v7 = [v3 stringByAppendingFormat:@" uuid:%@ date:%@ files:%d", v4, v5, objc_msgSend(v6, "count")];

  return v7;
}

@end