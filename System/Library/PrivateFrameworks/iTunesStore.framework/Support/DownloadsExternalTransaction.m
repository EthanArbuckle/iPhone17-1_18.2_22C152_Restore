@interface DownloadsExternalTransaction
- (DownloadsChangeset)changeset;
- (DownloadsExternalTransaction)initWithSessionDescriptor:(id)a3;
- (void)addDownloadChangeTypes:(int64_t)a3;
- (void)dealloc;
- (void)removeExternalValuesForAssetID:(int64_t)a3;
- (void)removeExternalValuesForDownloadID:(int64_t)a3;
- (void)setBytesDownloaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5;
- (void)setBytesUploaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5;
- (void)setExternalPropertyValues:(id)a3 forAssetWithID:(int64_t)a4;
- (void)setExternalPropertyValues:(id)a3 forDownloadWithID:(int64_t)a4;
- (void)setRestoreReason:(id)a3;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofAssetID:(int64_t)a5;
- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5;
- (void)unionChangeset:(id)a3;
@end

@implementation DownloadsExternalTransaction

- (DownloadsExternalTransaction)initWithSessionDescriptor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DownloadsExternalTransaction;
  v4 = -[DownloadsSession initWithSessionDescriptor:](&v6, "initWithSessionDescriptor:");
  if (v4)
  {
    v4->_changeset = objc_alloc_init(DownloadsChangeset);
    v4->_externalState = (ExternalDownloadState *)[a3 externalState];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DownloadsExternalTransaction;
  [(DownloadsSession *)&v3 dealloc];
}

- (void)addDownloadChangeTypes:(int64_t)a3
{
}

- (void)removeExternalValuesForAssetID:(int64_t)a3
{
}

- (void)removeExternalValuesForDownloadID:(int64_t)a3
{
}

- (void)setBytesDownloaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5
{
}

- (void)setBytesUploaded:(int64_t)a3 forAssetID:(int64_t)a4 ofDownloadID:(int64_t)a5
{
}

- (void)setExternalPropertyValues:(id)a3 forAssetWithID:(int64_t)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        -[DownloadsExternalTransaction setValue:forExternalProperty:ofAssetID:](self, "setValue:forExternalProperty:ofAssetID:", [a3 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)], *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), a4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setExternalPropertyValues:(id)a3 forDownloadWithID:(int64_t)a4
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(a3);
        }
        -[DownloadsExternalTransaction setValue:forExternalProperty:ofDownloadID:](self, "setValue:forExternalProperty:ofDownloadID:", [a3 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10)], *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), a4);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setRestoreReason:(id)a3
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofAssetID:(int64_t)a5
{
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4 ofDownloadID:(int64_t)a5
{
}

- (void)unionChangeset:(id)a3
{
  if (a3) {
    -[DownloadsChangeset unionChangeset:](self->_changeset, "unionChangeset:");
  }
}

- (DownloadsChangeset)changeset
{
  return self->_changeset;
}

@end