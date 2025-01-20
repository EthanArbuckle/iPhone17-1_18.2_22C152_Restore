@interface PPXBLDownloadAsset
- (BLDownloadStatus)downloadStatus;
- (BOOL)isAudiobook;
- (BOOL)isParent;
- (NSArray)children;
- (NSMutableArray)childAssets;
- (NSString)downloadID;
- (NSString)identifier;
- (NSString)storeID;
- (NSString)temporaryAssetID;
- (NSURL)permlink;
- (PPXBLDownloadAsset)initWithBLDownloadStatus:(id)a3 isParent:(BOOL)a4;
- (PPXBLDownloadAsset)parent;
- (void)addChild:(id)a3;
- (void)removeFromParent;
- (void)setChildAssets:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadStatus:(id)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsParent:(BOOL)a3;
- (void)setParent:(id)a3;
- (void)setPermlink:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTemporaryAssetID:(id)a3;
@end

@implementation PPXBLDownloadAsset

- (PPXBLDownloadAsset)initWithBLDownloadStatus:(id)a3 isParent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PPXBLDownloadAsset;
  v7 = [(PPXBLDownloadAsset *)&v26 init];
  if (v7)
  {
    uint64_t v8 = [v6 downloadID];
    downloadID = v7->_downloadID;
    v7->_downloadID = (NSString *)v8;

    v7->_isAudiobook = [v6 isAudiobook];
    v7->_isParent = v4;
    if (v4)
    {
      v10 = [v6 storePlaylistID];
      uint64_t v11 = [v10 stringValue];
      storeID = v7->_storeID;
      v7->_storeID = (NSString *)v11;

      uint64_t v13 = objc_opt_new();
      childAssets = v7->_childAssets;
      v7->_childAssets = (NSMutableArray *)v13;
    }
    else
    {
      v15 = [v6 storeID];
      id v16 = [v15 longLongValue];

      if (v16)
      {
        childAssets = [v6 storeID];
        uint64_t v17 = [childAssets stringValue];
        v18 = v7->_storeID;
        v7->_storeID = (NSString *)v17;
      }
      else
      {
        v20 = [v6 permLink];

        if (!v20) {
          goto LABEL_7;
        }
        v21 = [v6 permLink];
        uint64_t v22 = +[NSURL URLWithString:v21];
        permlink = v7->_permlink;
        v7->_permlink = (NSURL *)v22;

        v24 = v7->_permlink;
        if (v24)
        {
          uint64_t v25 = [(NSURL *)v24 identifierFromPermlink];
          childAssets = v7->_temporaryAssetID;
          v7->_temporaryAssetID = (NSString *)v25;
        }
        else
        {
          childAssets = v7->_temporaryAssetID;
          v7->_temporaryAssetID = 0;
        }
      }
    }
  }
LABEL_7:

  return v7;
}

- (NSString)identifier
{
  v3 = [(PPXBLDownloadAsset *)self storeID];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PPXBLDownloadAsset *)self temporaryAssetID];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (void)addChild:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(PPXBLDownloadAsset *)self childAssets];
  [v4 addObject:v5];

  [v5 setParent:self];
}

- (void)removeFromParent
{
  v3 = [(PPXBLDownloadAsset *)self parent];
  BOOL v4 = [v3 childAssets];
  [v4 removeObject:self];

  [(PPXBLDownloadAsset *)self setParent:0];
}

- (NSArray)children
{
  v2 = [(PPXBLDownloadAsset *)self childAssets];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (NSString)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)temporaryAssetID
{
  return self->_temporaryAssetID;
}

- (void)setTemporaryAssetID:(id)a3
{
}

- (NSURL)permlink
{
  return self->_permlink;
}

- (void)setPermlink:(id)a3
{
}

- (NSMutableArray)childAssets
{
  return self->_childAssets;
}

- (void)setChildAssets:(id)a3
{
}

- (BLDownloadStatus)downloadStatus
{
  return self->_downloadStatus;
}

- (void)setDownloadStatus:(id)a3
{
}

- (PPXBLDownloadAsset)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (PPXBLDownloadAsset *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)isParent
{
  return self->_isParent;
}

- (void)setIsParent:(BOOL)a3
{
  self->_isParent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_downloadStatus, 0);
  objc_storeStrong((id *)&self->_childAssets, 0);
  objc_storeStrong((id *)&self->_permlink, 0);
  objc_storeStrong((id *)&self->_temporaryAssetID, 0);
  objc_storeStrong((id *)&self->_storeID, 0);

  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end