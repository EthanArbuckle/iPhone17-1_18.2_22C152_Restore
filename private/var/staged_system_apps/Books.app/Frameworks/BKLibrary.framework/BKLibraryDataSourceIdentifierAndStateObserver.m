@interface BKLibraryDataSourceIdentifierAndStateObserver
- (BKLibraryDataSourceIdentifierAndStateObserver)initWithAssetID:(id)a3 notify:(id)a4;
- (NSString)assetID;
- (id)notifyBlock;
- (void)notify;
@end

@implementation BKLibraryDataSourceIdentifierAndStateObserver

- (BKLibraryDataSourceIdentifierAndStateObserver)initWithAssetID:(id)a3 notify:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKLibraryDataSourceIdentifierAndStateObserver;
  v9 = [(BKLibraryDataSourceIdentifierAndStateObserver *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetID, a3);
    id v11 = objc_retainBlock(v8);
    id notifyBlock = v10->_notifyBlock;
    v10->_id notifyBlock = v11;
  }
  return v10;
}

- (void)notify
{
  v3 = [(BKLibraryDataSourceIdentifierAndStateObserver *)self notifyBlock];
  if (v3)
  {
    id v4 = v3;
    ((void (**)(void, BKLibraryDataSourceIdentifierAndStateObserver *))v3)[2](v3, self);
    v3 = (void (**)(void, void))v4;
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (id)notifyBlock
{
  return self->_notifyBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifyBlock, 0);

  objc_storeStrong((id *)&self->_assetID, 0);
}

@end