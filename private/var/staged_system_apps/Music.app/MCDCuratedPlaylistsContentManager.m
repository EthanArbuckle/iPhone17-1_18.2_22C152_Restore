@interface MCDCuratedPlaylistsContentManager
- (BOOL)wantsGridCellAtIndexPath:(id)a3;
- (id)_modelRequest;
- (id)itemAtIndexPath:(id)a3;
- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4;
- (void)_initiatePlaybackForItem:(id)a3;
@end

@implementation MCDCuratedPlaylistsContentManager

- (BOOL)wantsGridCellAtIndexPath:(id)a3
{
  return 0;
}

- (int64_t)allowedNumberOfItemsForDisplayWithResponse:(id)a3 inSection:(int64_t)a4
{
  v6 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v7 = [v6 results];
  id v8 = [v7 numberOfItemsInSection:a4];

  int64_t result = [(MCDBrowseContentManager *)self maximumNumberOfItemsForDisplay];
  if ((uint64_t)v8 < result) {
    return (int64_t)v8;
  }
  return result;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4 = a3;
  v5 = [(MCDFuseContentManager *)self lastReceivedResponse];
  v6 = [v5 results];
  v7 = [v6 itemsInSectionAtIndex:0];
  id v8 = [v4 row];

  v9 = [v7 objectAtIndexedSubscript:v8];

  return v9;
}

- (void)_initiatePlaybackForItem:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(MCDFuseContentManager *)self playbackManager];
    v5 = [v8 playlist];
    v6 = [(MCDFuseContentManager *)self viewController];
    v7 = [v6 combinedPlayActivityFeatureName];
    [v4 initiatePlaybackForPlaylist:v5 lastResponse:0 shuffled:0 playActivityFeatureName:v7];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    id v4 = [(MCDFuseContentManager *)self playbackManager];
    v5 = [(MCDFuseContentManager *)self viewController];
    v6 = [v5 combinedPlayActivityFeatureName];
    [v4 initiatePlaybackForPlaylist:v8 lastResponse:0 shuffled:0 playActivityFeatureName:v6];
  }

LABEL_6:
}

- (id)_modelRequest
{
  v3 = objc_alloc_init(MusicStoreCuratorPlaylistsRequest);
  id v4 = [(MCDFuseContentManager *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(MCDFuseContentManager *)self dataSource];
    -[MusicStoreCuratorPlaylistsRequest setCuratorStoreAdamID:](v3, "setCuratorStoreAdamID:", [v6 curatorID]);
  }

  return v3;
}

@end