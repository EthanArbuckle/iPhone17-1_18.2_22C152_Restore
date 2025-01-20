@interface PLFileSystemImportAsset
- (BOOL)isCameraKit;
- (BOOL)isInterruptedLockedResourceTransfer;
- (NSSet)urls;
- (NSURL)lockedResourceTransferMarkerFileURL;
- (PLAlbumProtocol)destinationAlbum;
- (PLAssetJournalEntryPayload)assetPayload;
- (PLFileSystemImportAsset)initWithAssetPayload:(id)a3;
- (PLFileSystemImportAsset)initWithDestinationAlbum:(id)a3 assetKind:(int)a4;
- (PLLockedResourceTransferRecovery)lockedResourceTransferRecovery;
- (id)description;
- (int)assetKind;
- (int64_t)compare:(id)a3;
- (void)addURL:(id)a3;
- (void)addURLs:(id)a3;
- (void)setAssetKind:(int)a3;
- (void)setDestinationAlbum:(id)a3;
- (void)setLockedResourceTransferRecovery:(id)a3;
@end

@implementation PLFileSystemImportAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedResourceTransferRecovery, 0);
  objc_storeStrong((id *)&self->_lockedResourceTransferMarkerFileURL, 0);
  objc_storeStrong((id *)&self->_assetPayload, 0);
  objc_storeStrong((id *)&self->_destinationAlbum, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setLockedResourceTransferRecovery:(id)a3
{
}

- (PLLockedResourceTransferRecovery)lockedResourceTransferRecovery
{
  return self->_lockedResourceTransferRecovery;
}

- (NSURL)lockedResourceTransferMarkerFileURL
{
  return self->_lockedResourceTransferMarkerFileURL;
}

- (PLAssetJournalEntryPayload)assetPayload
{
  return self->_assetPayload;
}

- (void)setAssetKind:(int)a3
{
  self->_assetKind = a3;
}

- (int)assetKind
{
  return self->_assetKind;
}

- (void)setDestinationAlbum:(id)a3
{
}

- (PLAlbumProtocol)destinationAlbum
{
  return self->_destinationAlbum;
}

- (BOOL)isInterruptedLockedResourceTransfer
{
  return self->_lockedResourceTransferMarkerFileURL != 0;
}

- (void)addURLs:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PLFileSystemImportAsset *)self addURL:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addURL:(id)a3
{
  id v6 = a3;
  id v13 = v6;
  if (!v6)
  {
    long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLFileSystemImportAsset.m", 123, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];

    id v6 = 0;
  }
  uint64_t v7 = [v6 pathExtension];
  uint64_t v8 = +[PLLockedResourceTransferRecovery lockedTransferRecoveryMarkerFileExtension];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    objc_storeStrong((id *)&self->_lockedResourceTransferMarkerFileURL, a3);
  }
  else
  {
    [(NSMutableSet *)self->_urls addObject:v13];
    if (!self->_path)
    {
      long long v10 = [v13 path];
      path = self->_path;
      self->_path = v10;

      self->_pathContainsDCIM = [(NSString *)self->_path containsString:@"DCIM"];
    }
  }
}

- (NSSet)urls
{
  return (NSSet *)self->_urls;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSMutableSet *)self->_urls allObjects];
  id v6 = [v5 componentsJoinedByString:@", "];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p (%@)>", v4, self, v6];

  return v7;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = a3;
  int v5 = [(PLFileSystemImportAsset *)self assetKind];
  if (v5 == [v4 assetKind])
  {
    if (!self->_pathContainsDCIM || *((unsigned char *)v4 + 16))
    {
      if (self->_pathContainsDCIM || !*((unsigned char *)v4 + 16))
      {
        path = self->_path;
        uint64_t v10 = v4[1];
        long long v11 = path;
        uint64_t v12 = [(NSString *)v11 compare:v10];
        if (v12 == -1)
        {
          int64_t v6 = 1;
        }
        else
        {
          int64_t v6 = v12;
          if (v12 == 1) {
            int64_t v6 = -1;
          }
        }
      }
      else
      {
        int64_t v6 = 1;
      }
    }
    else
    {
      int64_t v6 = -1;
    }
  }
  else
  {
    unsigned int v7 = [(PLFileSystemImportAsset *)self assetKind];
    if (v7 < [v4 assetKind]) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
  }

  return v6;
}

- (BOOL)isCameraKit
{
  return [(PLFileSystemImportAsset *)self assetKind] == 1;
}

- (PLFileSystemImportAsset)initWithAssetPayload:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLFileSystemImportAsset;
  int64_t v6 = [(PLFileSystemImportAsset *)&v10 init];
  if (v6)
  {
    unsigned int v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    urls = v6->_urls;
    v6->_urls = v7;

    objc_storeStrong((id *)&v6->_assetPayload, a3);
    -[PLFileSystemImportAsset setAssetKind:](v6, "setAssetKind:", objc_msgSend(MEMORY[0x1E4F8BA10], "mapSavedAssetType:unknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:unrecognized:", objc_msgSend(v5, "savedAssetType"), 0, 0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0,
        0,
        0,
        0,
        4,
        0));
  }

  return v6;
}

- (PLFileSystemImportAsset)initWithDestinationAlbum:(id)a3 assetKind:(int)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLFileSystemImportAsset;
  uint64_t v8 = [(PLFileSystemImportAsset *)&v12 init];
  if (v8)
  {
    int v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    urls = v8->_urls;
    v8->_urls = v9;

    objc_storeStrong((id *)&v8->_destinationAlbum, a3);
    v8->_assetKind = a4;
  }

  return v8;
}

@end