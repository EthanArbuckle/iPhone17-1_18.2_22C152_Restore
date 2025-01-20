@interface BKUbiquitousDocumentsOngoingMigrationObserver
- (BKUbiquitousDocumentsOngoingMigrationObserver)initWithAssetIDs:(id)a3 notify:(id)a4;
- (NSSet)assetIDs;
- (id)notifyBlock;
- (void)notify;
- (void)setNotifyBlock:(id)a3;
@end

@implementation BKUbiquitousDocumentsOngoingMigrationObserver

- (BKUbiquitousDocumentsOngoingMigrationObserver)initWithAssetIDs:(id)a3 notify:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKUbiquitousDocumentsOngoingMigrationObserver;
  v9 = [(BKUbiquitousDocumentsOngoingMigrationObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetIDs, a3);
    id v11 = objc_retainBlock(v8);
    id notifyBlock = v10->_notifyBlock;
    v10->_id notifyBlock = v11;
  }
  return v10;
}

- (void)notify
{
  v2 = [(BKUbiquitousDocumentsOngoingMigrationObserver *)self notifyBlock];
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }
}

- (NSSet)assetIDs
{
  return self->_assetIDs;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void)setNotifyBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);

  objc_storeStrong((id *)&self->_assetIDs, 0);
}

@end