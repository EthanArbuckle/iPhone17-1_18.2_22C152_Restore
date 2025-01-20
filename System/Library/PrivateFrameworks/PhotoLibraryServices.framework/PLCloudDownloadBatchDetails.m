@interface PLCloudDownloadBatchDetails
- (BOOL)hasResourceChanges;
- (BOOL)needsWidgetTimelineReload;
- (NSArray)cmmUUIDsToNotify;
- (NSSet)confirmedResourceIDs;
- (int64_t)numberOfPhotos;
- (int64_t)numberOfVideos;
- (void)setCmmUUIDsToNotify:(id)a3;
- (void)setConfirmedResourceIDs:(id)a3;
- (void)setHasResourceChanges:(BOOL)a3;
- (void)setNeedsWidgetTimelineReload:(BOOL)a3;
- (void)setNumberOfPhotos:(int64_t)a3;
- (void)setNumberOfVideos:(int64_t)a3;
- (void)unionBatchDetails:(id)a3;
@end

@implementation PLCloudDownloadBatchDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_confirmedResourceIDs, 0);
  objc_storeStrong((id *)&self->_cmmUUIDsToNotify, 0);
}

- (void)setConfirmedResourceIDs:(id)a3
{
}

- (NSSet)confirmedResourceIDs
{
  return self->_confirmedResourceIDs;
}

- (void)setCmmUUIDsToNotify:(id)a3
{
}

- (NSArray)cmmUUIDsToNotify
{
  return self->_cmmUUIDsToNotify;
}

- (void)setNumberOfVideos:(int64_t)a3
{
  self->_numberOfVideos = a3;
}

- (int64_t)numberOfVideos
{
  return self->_numberOfVideos;
}

- (void)setNumberOfPhotos:(int64_t)a3
{
  self->_numberOfPhotos = a3;
}

- (int64_t)numberOfPhotos
{
  return self->_numberOfPhotos;
}

- (void)setNeedsWidgetTimelineReload:(BOOL)a3
{
  self->_needsWidgetTimelineReload = a3;
}

- (BOOL)needsWidgetTimelineReload
{
  return self->_needsWidgetTimelineReload;
}

- (void)setHasResourceChanges:(BOOL)a3
{
  self->_hasResourceChanges = a3;
}

- (BOOL)hasResourceChanges
{
  return self->_hasResourceChanges;
}

- (void)unionBatchDetails:(id)a3
{
  id v15 = a3;
  if ([(PLCloudDownloadBatchDetails *)self hasResourceChanges]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [v15 hasResourceChanges];
  }
  [(PLCloudDownloadBatchDetails *)self setHasResourceChanges:v4];
  if ([(PLCloudDownloadBatchDetails *)self needsWidgetTimelineReload]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v15 needsWidgetTimelineReload];
  }
  [(PLCloudDownloadBatchDetails *)self setNeedsWidgetTimelineReload:v5];
  -[PLCloudDownloadBatchDetails setNumberOfPhotos:](self, "setNumberOfPhotos:", [v15 numberOfPhotos] + -[PLCloudDownloadBatchDetails numberOfPhotos](self, "numberOfPhotos"));
  -[PLCloudDownloadBatchDetails setNumberOfVideos:](self, "setNumberOfVideos:", [v15 numberOfVideos] + -[PLCloudDownloadBatchDetails numberOfVideos](self, "numberOfVideos"));
  uint64_t v6 = [(PLCloudDownloadBatchDetails *)self cmmUUIDsToNotify];
  v7 = (void *)v6;
  if (v6) {
    v8 = (void *)v6;
  }
  else {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v9 = [v15 cmmUUIDsToNotify];
  v10 = [v8 arrayByAddingObjectsFromArray:v9];
  [(PLCloudDownloadBatchDetails *)self setCmmUUIDsToNotify:v10];

  v11 = [(PLCloudDownloadBatchDetails *)self confirmedResourceIDs];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  v13 = [v15 confirmedResourceIDs];
  v14 = [v12 setByAddingObjectsFromSet:v13];

  if (!v11) {
  [(PLCloudDownloadBatchDetails *)self setConfirmedResourceIDs:v14];
  }
}

@end