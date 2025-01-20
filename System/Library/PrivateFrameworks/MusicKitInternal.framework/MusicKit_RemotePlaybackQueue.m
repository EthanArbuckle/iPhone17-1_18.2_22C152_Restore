@interface MusicKit_RemotePlaybackQueue
+ (id)extractDialogFromCommandResult:(id)a3 error:(id *)a4;
- (MusicKit_RemotePlaybackQueue)initWithReplaceQueueIntent:(int64_t)a3;
- (id)mrPlayerPathFromPlaybackPath:(id)a3 error:(id *)a4;
- (int)mrReplaceIntentFromMusicKitReplaceQueueIntent:(int64_t)a3;
- (int64_t)replaceQueueIntent;
- (void)setReplaceQueueIntent:(int64_t)a3;
@end

@implementation MusicKit_RemotePlaybackQueue

- (MusicKit_RemotePlaybackQueue)initWithReplaceQueueIntent:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MusicKit_RemotePlaybackQueue;
  result = [(MusicKit_RemotePlaybackQueue *)&v5 init];
  if (result) {
    result->_replaceQueueIntent = a3;
  }
  return result;
}

- (int)mrReplaceIntentFromMusicKitReplaceQueueIntent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return a3;
  }
  else {
    return 0;
  }
}

- (id)mrPlayerPathFromPlaybackPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 route];
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "endpoint"), "origin");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F385C8];
    v9 = [v5 representedBundleID];
    v10 = [v5 playerID];
    v11 = [v8 playerPathWithCustomOrigin:v7 bundleID:v9 playerID:v10];

    v12 = objc_msgSend(v11, "musicKit_playerPath_mrPlayerPath");
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "musicKit_remotePlaybackEndpointDoesNotExist");
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)extractDialogFromCommandResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [v5 resultStatuses];
  uint64_t v7 = objc_msgSend(v6, "msv_firstWhere:", &__block_literal_global_5);

  if (v7)
  {
    v8 = [v7 dialog];
  }
  else
  {
    v9 = [v5 resultStatuses];
    v10 = objc_msgSend(v9, "msv_firstWhere:", &__block_literal_global_7);

    if (a4 && v10)
    {
      *a4 = [v10 commandError];
    }

    v8 = 0;
  }

  return v8;
}

- (int64_t)replaceQueueIntent
{
  return self->_replaceQueueIntent;
}

- (void)setReplaceQueueIntent:(int64_t)a3
{
  self->_replaceQueueIntent = a3;
}

@end