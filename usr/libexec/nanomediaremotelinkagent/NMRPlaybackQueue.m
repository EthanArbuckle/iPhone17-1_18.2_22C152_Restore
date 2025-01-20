@interface NMRPlaybackQueue
- ($0AC6E346AE4835514AAA8AC86D8F4844)_rangeOfItemsNeedingMetadataForMediaRemoteQueue:(void *)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)observedRange;
- (BOOL)_needsMetadataForMediaRemoteItem:(void *)a3;
- (BOOL)_needsUpdateForMediaRemoteQueue:(void *)a3;
- (NMROrigin)origin;
- (NMRPlaybackQueue)init;
- (NMRPlaybackQueueDelegate)delegate;
- (NSData)fullPlaybackQueueData;
- (id)_contentItemIdentifiers;
- (id)_itemWithIdentifier:(id)a3;
- (id)_metadataForItemWithIdentifier:(id)a3;
- (id)deltaPlaybackQueueDataFromPreviousData:(id)a3 invalidatedMetadataIdentifiers:(id)a4;
- (void)_mediaRemotePlaybackQueueWithRange:(id)a3 includeMetadata:(BOOL)a4;
- (void)_refreshCurrentPlaybackQueueFromMediaRemoteWithCompletion:(id)a3;
- (void)_updateMetadataWithMediaRemoteItems:(id)a3;
- (void)_updateWithMediaRemoteQueue:(void *)a3;
- (void)beginObservingMediaRemotePlaybackQueueForOrigin:(id)a3;
- (void)copyFullMediaRemotePlaybackQueueIncludingMetadata:(BOOL)a3;
- (void)copyMediaRemotePlaybackQueueWithRange:(id)a3 includeMetadata:(BOOL)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setNowPlayingInfo:(id)a3;
- (void)setObservedRange:(id)a3;
- (void)setOrigin:(id)a3;
- (void)updateWithData:(id)a3;
@end

@implementation NMRPlaybackQueue

- (NMRPlaybackQueue)init
{
  v16.receiver = self;
  v16.super_class = (Class)NMRPlaybackQueue;
  v2 = [(NMRPlaybackQueue *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    upNextPlaybackQueue = v2->_upNextPlaybackQueue;
    v2->_upNextPlaybackQueue = (_NMRPlaybackQueue *)v3;

    v2->_observedRange = ($5CFEE62CA76FAE445C6F9DBCEE669C70)xmmword_100041820;
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.NanoMediaRemote.PlaybackQueue", v5);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v6;

    objc_initWeak(&location, v2);
    v8 = [NMRMediaRemoteUpdater alloc];
    v9 = v2->_serialQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100010EF4;
    v13[3] = &unk_100044DD8;
    objc_copyWeak(&v14, &location);
    v10 = [(NMRMediaRemoteUpdater *)v8 initWithQueue:v9 updateBlock:v13];
    playbackQueueUpdater = v2->_playbackQueueUpdater;
    v2->_playbackQueueUpdater = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveEveryObserver(LocalCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)NMRPlaybackQueue;
  [(NMRPlaybackQueue *)&v4 dealloc];
}

- (void)beginObservingMediaRemotePlaybackQueueForOrigin:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_origin, a3);
  if (!self->_observingMediaRemote)
  {
    self->_observingMediaRemote = 1;
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_1000110A8, kMRPlaybackQueueContentItemsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_100011210, kMRNowPlayingPlaybackQueueChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFNotificationCenterAddObserver(LocalCenter, self, (CFNotificationCallback)sub_100011210, kMRMediaRemoteNowPlayingApplicationDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  [(NMRMediaRemoteUpdater *)self->_playbackQueueUpdater executeUpdateBlock];
}

- (NSData)fullPlaybackQueueData
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100011434;
  v10 = sub_100011444;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001144C;
  v5[3] = &unk_100044E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

- (void)copyFullMediaRemotePlaybackQueueIncludingMetadata:(BOOL)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  serialQueue = self->_serialQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011548;
  v6[3] = &unk_100044E28;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  objc_super v4 = (void *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)copyMediaRemotePlaybackQueueWithRange:(id)a3 includeMetadata:(BOOL)a4
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011648;
  block[3] = &unk_100044E50;
  block[4] = self;
  block[5] = &v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 v8 = a3;
  BOOL v9 = a4;
  dispatch_sync(serialQueue, block);
  v5 = (void *)v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)deltaPlaybackQueueDataFromPreviousData:(id)a3 invalidatedMetadataIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  $0AC6E346AE4835514AAA8AC86D8F4844 v8 = sub_10002C428(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Building delta queue from previous data", buf, 2u);
  }

  *(void *)buf = 0;
  v20 = buf;
  uint64_t v21 = 0x3032000000;
  v22 = sub_100011434;
  v23 = sub_100011444;
  id v24 = 0;
  serialQueue = self->_serialQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011808;
  v14[3] = &unk_100044EA0;
  id v15 = v6;
  objc_super v16 = self;
  id v17 = v7;
  v18 = buf;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(serialQueue, v14);
  id v12 = *((id *)v20 + 5);

  _Block_object_dispose(buf, 8);

  return v12;
}

- (void)updateWithData:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012298;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- (void)setNowPlayingInfo:(id)a3
{
  id v5 = a3;
  nowPlayingInfo = self->_nowPlayingInfo;
  p_nowPlayingInfo = &self->_nowPlayingInfo;
  id v8 = v5;
  if ((-[NSDictionary isEqual:](nowPlayingInfo, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_nowPlayingInfo, a3);
  }
}

- (void)_refreshCurrentPlaybackQueueFromMediaRemoteWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(NMRPlaybackQueue *)self observedRange];
  uint64_t v7 = v6;
  id v8 = sub_10002C428(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v13 = v5;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requesting playback queue information for range: %ld -> %ld", buf, 0x16u);
  }

  [(NMRPlaybackQueue *)self _contentItemIdentifiers];
  BOOL v9 = (const void *)MRPlaybackQueueRequestCreateWithCurrentState();
  MRPlaybackQueueRequestSetIncludeMetadata();
  [(NMROrigin *)self->_origin mediaRemoteOrigin];
  id v10 = (const void *)MRNowPlayingPlayerPathCreate();
  id v11 = v4;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
  CFRelease(v9);
  CFRelease(v10);
}

- (id)_contentItemIdentifiers
{
  v2 = [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue contentItems];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identifier:v11];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_mediaRemotePlaybackQueueWithRange:(id)a3 includeMetadata:(BOOL)a4
{
  BOOL v23 = a4;
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_nowPlayingInfo)
  {
    uint64_t v7 = [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue contentItems];
    v22 = objc_opt_new();
    signed int v8 = [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue location];
    id v9 = [v7 count];
    if (var1 >= 1)
    {
      int64_t v10 = v8;
      uint64_t v11 = (uint64_t)v9 + v8 - 1;
      uint64_t v12 = -(uint64_t)v8;
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        if ((var0 & 0x8000000000000000) == 0)
        {
          if (var0 < v10 || var0 > v11) {
            break;
          }
          long long v14 = v7;
          uint64_t v15 = [v7 objectAtIndexedSubscript:v12 + var0];
          objc_super v16 = (const void *)sub_100012758(v15, v23);
          if (!var0) {
            MRContentItemSetNowPlayingInfo();
          }

          if (v16)
          {
            [v22 addObject:v16];
            CFRelease(v16);
            if (var0 < v13) {
              uint64_t v13 = var0;
            }
          }
          uint64_t v7 = v14;
        }
        ++var0;
        --var1;
      }
      while (var1);
    }
    [v22 count];
    id v17 = (void *)MRPlaybackQueueCreate();
    v18 = sub_10002C428(2);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

    if (v19)
    {
      v20 = sub_10002C428(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        sub_100031244((uint64_t)v17, v20);
      }
    }
  }
  else
  {
    uint64_t v7 = sub_10002C428(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No now playing info yet, returning nil queue representation.", buf, 2u);
    }
    id v17 = 0;
  }

  return v17;
}

- (void)_updateWithMediaRemoteQueue:(void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3)
  {
    uint64_t Range = MRPlaybackQueueGetRange();
    id v6 = objc_opt_new();
    uint64_t v7 = (void *)MRPlaybackQueueCopyContentItems();
    uint64_t v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    uint64_t v15 = sub_1000131A0;
    objc_super v16 = &unk_100044F18;
    id v17 = self;
    id v8 = v6;
    id v18 = v8;
    [v7 enumerateObjectsUsingBlock:&v13];
    id v9 = objc_opt_new();
    [v9 setLocation:Range, v13, v14, v15, v16, v17];
    [v9 setContentItems:v8];
    p_upNextPlaybackQueue = (void **)&self->_upNextPlaybackQueue;
    objc_storeStrong((id *)&self->_upNextPlaybackQueue, v9);
    uint64_t v11 = sub_10002C428(2);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = sub_100011FF0(*p_upNextPlaybackQueue);
      *(_DWORD *)buf = 138412290;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Updated with new mediaRemote info, queue is now %@", buf, 0xCu);
    }
  }
  else
  {
    self->_upNextPlaybackQueue = (_NMRPlaybackQueue *)objc_opt_new();
    _objc_release_x1();
  }
}

- (void)_updateMetadataWithMediaRemoteItems:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013418;
  v7[3] = &unk_100044CB8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_rangeOfItemsNeedingMetadataForMediaRemoteQueue:(void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t Range = MRPlaybackQueueGetRange();
  uint64_t v6 = v5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = Range + v5;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = Range;
  uint64_t v7 = (void *)MRPlaybackQueueCopyContentItems();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100013814;
  v15[3] = &unk_100044F40;
  v15[7] = Range;
  v15[8] = v6;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  [v7 enumerateObjectsUsingBlock:v15];
  int64_t v8 = v17[3];
  int64_t v9 = v21[3];
  BOOL v10 = v8 < v9;
  uint64_t v11 = v8 - v9;
  if (v10) {
    uint64_t v11 = -1;
  }
  int64_t v12 = v11 + 1;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  int64_t v13 = v9;
  int64_t v14 = v12;
  result.int64_t var1 = v14;
  result.int64_t var0 = v13;
  return result;
}

- (BOOL)_needsUpdateForMediaRemoteQueue:(void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (a3)
  {
    uint64_t Range = MRPlaybackQueueGetRange();
    uint64_t v7 = v6;
    if (Range == [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue location]
      && ([(_NMRPlaybackQueue *)self->_upNextPlaybackQueue contentItems],
          int64_t v8 = objc_claimAutoreleasedReturnValue(),
          id v9 = [v8 count],
          v8,
          (id)v7 == v9))
    {
      BOOL v10 = (void *)MRPlaybackQueueCopyContentItems();
      uint64_t v11 = [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue contentItems];
      if (v7 < 1)
      {
        BOOL v13 = 0;
      }
      else
      {
        uint64_t v12 = 0;
        BOOL v13 = 1;
        do
        {
          [v10 objectAtIndexedSubscript:v12];

          int64_t v14 = [v11 objectAtIndexedSubscript:v12];
          uint64_t v15 = MRContentItemGetIdentifier();
          uint64_t v16 = [v14 identifier];
          unsigned __int8 v17 = [v15 isEqualToString:v16];

          if ((v17 & 1) == 0) {
            break;
          }
          BOOL v13 = ++v12 < v7;
        }
        while (v7 != v12);
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    return [(_NMRPlaybackQueue *)self->_upNextPlaybackQueue contentItemsCount] != 0;
  }
  return v13;
}

- (BOOL)_needsMetadataForMediaRemoteItem:(void *)a3
{
  id v4 = MRContentItemGetIdentifier();
  uint64_t v5 = [(NMRPlaybackQueue *)self _metadataForItemWithIdentifier:v4];
  LOBYTE(self) = v5 == 0;

  return (char)self;
}

- (id)_metadataForItemWithIdentifier:(id)a3
{
  id v3 = [(NMRPlaybackQueue *)self _itemWithIdentifier:a3];
  id v4 = [v3 metadata];

  return v4;
}

- (id)_itemWithIdentifier:(id)a3
{
  upNextPlaybackQueue = self->_upNextPlaybackQueue;
  id v4 = a3;
  uint64_t v5 = [(_NMRPlaybackQueue *)upNextPlaybackQueue contentItems];
  uint64_t v6 = sub_100011EA4(v4, v5);

  return v6;
}

- (NMRPlaybackQueueDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NMRPlaybackQueueDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)observedRange
{
  int64_t length = self->_observedRange.length;
  int64_t location = self->_observedRange.location;
  result.int64_t var1 = length;
  result.int64_t var0 = location;
  return result;
}

- (void)setObservedRange:(id)a3
{
  self->_observeduint64_t Range = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- (NMROrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_playbackQueueUpdater, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_upNextPlaybackQueue, 0);
}

@end