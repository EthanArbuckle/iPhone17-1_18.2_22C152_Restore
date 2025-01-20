@interface CloudContentTasteUpdateRequestListener
+ (id)sharedContentTasteRequestListener;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CloudContentTasteUpdateRequestListener)init;
- (id)_adjustedContentTasteForLibraryEndpoint:(int64_t)a3;
- (id)_contentTasteRequestHandlerForConfiguration:(id)a3 outError:(id *)a4;
- (id)_init;
- (void)_cancelAllContentTasteRequestHandlers;
- (void)_postContentTasteChangesForPendingItems;
- (void)_updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)handleContentTasteChangedNotification;
- (void)handleMusicAppInstalled;
- (void)handleMusicAppRemoved;
- (void)removeContentTasteOperationsForConnectionConfiguration:(id)a3;
- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7 withCompletionHandler:(id)a8;
- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 persistentID:(int64_t)a6 timeStamp:(id)a7 configuration:(id)a8 withCompletionHandler:(id)a9;
- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 configuration:(id)a5 withCompletionHandler:(id)a6;
- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8;
- (void)start;
- (void)stop;
- (void)updateContentTasteForConnectionConfiguration:(id)a3 invalidateLocalCache:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 configuration:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation CloudContentTasteUpdateRequestListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTasteRequestHandlerToDSIDMap, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_postContentTasteChangesForPendingItems
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_musicAppIsInstalled)
  {
    if (MSVDeviceSupportsMultipleLibraries())
    {
      v3 = +[ICUserIdentityStore defaultIdentityStore];
      id v21 = 0;
      v4 = [v3 userIdentitiesForAllStoreAccountsWithError:&v21];
      v5 = v21;
    }
    else
    {
      v3 = +[ICUserIdentity activeAccount];
      v29 = v3;
      v4 = +[NSArray arrayWithObjects:&v29 count:1];
      v5 = 0;
    }

    v6 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v7 = [v4 count];
      *(_DWORD *)buf = 138543874;
      v24 = self;
      __int16 v25 = 1024;
      unsigned int v26 = v7;
      __int16 v27 = 2114;
      v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %d user identities, error=%{public}@", buf, 0x1Cu);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v12);
          id v14 = objc_alloc((Class)ICConnectionConfiguration);
          id v15 = objc_msgSend(v14, "initWithUserIdentity:", v13, (void)v17);
          id v16 = [(CloudContentTasteUpdateRequestListener *)self _contentTasteRequestHandlerForConfiguration:v15 outError:0];

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v5 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ not processing pending changes as music app is not installed", buf, 0xCu);
    }
  }
}

- (void)_cancelAllContentTasteRequestHandlers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  contentTasteRequestHandlerToDSIDMap = self->_contentTasteRequestHandlerToDSIDMap;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100122650;
  v4[3] = &unk_1001BEE50;
  v4[4] = self;
  [(NSMutableDictionary *)contentTasteRequestHandlerToDSIDMap enumerateKeysAndObjectsUsingBlock:v4];
}

- (void)_updateContentTasteForItem:(id)a3 invalidatingLocalCache:(BOOL)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  accessQueue = self->_accessQueue;
  id v13 = a5;
  dispatch_assert_queue_V2(accessQueue);
  id v20 = 0;
  id v14 = [(CloudContentTasteUpdateRequestListener *)self _contentTasteRequestHandlerForConfiguration:v13 outError:&v20];

  id v15 = v20;
  if (v15 || !v14)
  {
    if (v11)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1001228D0;
      block[3] = &unk_1001BEC48;
      id v19 = v11;
      id v18 = v15;
      dispatch_async(callbackQueue, block);
    }
  }
  else
  {
    [v14 updateContentTasteForItem:v10 invalidatingLocalCache:v8 completionHandler:v11];
  }
}

- (id)_adjustedContentTasteForLibraryEndpoint:(int64_t)a3
{
  if (a3 == 1)
  {
    int64_t v3 = 2;
  }
  else
  {
    int64_t v3 = a3;
    if (a3)
    {
      v5 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138543618;
        id v9 = self;
        __int16 v10 = 1024;
        int v11 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@ Unsupported content taste value=%d to send to library APIs", (uint8_t *)&v8, 0x12u);
      }
    }
    else
    {
      int64_t v3 = 1;
    }
  }
  v6 = +[NSNumber numberWithInteger:v3];

  return v6;
}

- (id)_contentTasteRequestHandlerForConfiguration:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  unsigned int v7 = [v6 userIdentityStore];
  int v8 = [v6 userIdentity];
  id v14 = 0;
  id v9 = [v7 DSIDForUserIdentity:v8 outError:&v14];
  id v10 = v14;

  if (v9 && !v10 && [v9 longLongValue])
  {
    int v11 = [(NSMutableDictionary *)self->_contentTasteRequestHandlerToDSIDMap objectForKey:v9];
    if (!v11)
    {
      int v11 = [[ICContentTasteRequestHandler alloc] initWithConfiguration:v6];
      [(NSMutableDictionary *)self->_contentTasteRequestHandlerToDSIDMap setObject:v11 forKey:v9];
    }
  }
  else
  {
    v12 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v16 = self;
      __int16 v17 = 2048;
      id v18 = v6;
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@ Could not get DSID from configuration=%p, error=%{public}@", buf, 0x20u);
    }

    int v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [v5 processIdentifier];
  BOOL v7 = sub_1000C4430(v5, @"com.apple.itunesstored.private");
  if (v7)
  {
    int v8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___ICUpdateContentTasteRequestListener];
    [v5 setExportedInterface:v8];
    [v5 setExportedObject:self];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100122E10;
    v13[3] = &unk_1001BEE28;
    v13[4] = self;
    unsigned int v14 = v6;
    [v5 setInterruptionHandler:v13];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100122ED4;
    v11[3] = &unk_1001BEE28;
    v11[4] = self;
    unsigned int v12 = v6;
    [v5 setInvalidationHandler:v11];
    [v5 resume];
    id v9 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ got connection request from pid %i", buf, 0x12u);
    }
  }
  else
  {
    int v8 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = self;
      __int16 v17 = 1024;
      unsigned int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@ pid %i is not entitled to connect to content taste update service", buf, 0x12u);
    }
  }

  return v7;
}

- (void)updateContentTasteForMediaItemsAndInvalidateLocalCache:(BOOL)a3 configuration:(id)a4 withCompletionHandler:(id)a5
{
}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001230B4;
  block[3] = &unk_1001BEDB0;
  void block[4] = self;
  id v22 = v15;
  int64_t v25 = a4;
  int64_t v26 = a3;
  id v23 = v14;
  id v24 = v16;
  int64_t v27 = a5;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  dispatch_async(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forArtistStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[NSDate date];
  [(CloudContentTasteUpdateRequestListener *)self setContentTaste:a3 forMediaItem:8 storeIdentifier:a4 configuration:v11 timeStamp:v12 withCompletionHandler:v10];
}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100123FF8;
  block[3] = &unk_1001BEDB0;
  void block[4] = self;
  id v22 = v15;
  int64_t v25 = a4;
  int64_t v26 = a3;
  id v23 = v14;
  id v24 = v16;
  int64_t v27 = a5;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  dispatch_async(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forAlbumStoreID:(int64_t)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = +[NSDate date];
  [(CloudContentTasteUpdateRequestListener *)self setContentTaste:a3 forMediaItem:3 storeIdentifier:a4 configuration:v11 timeStamp:v12 withCompletionHandler:v10];
}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 persistentID:(int64_t)a5 timeStamp:(id)a6 configuration:(id)a7 withCompletionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124A64;
  block[3] = &unk_1001BED88;
  void block[4] = self;
  id v24 = v14;
  id v27 = v17;
  int64_t v28 = a3;
  int64_t v29 = a5;
  id v25 = v16;
  id v26 = v15;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  id v22 = v14;
  dispatch_async(accessQueue, block);
}

- (void)setContentTaste:(int64_t)a3 forPlaylistGlobalID:(id)a4 configuration:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[NSDate date];
  [(CloudContentTasteUpdateRequestListener *)self setContentTaste:a3 forPlaylistGlobalID:v12 persistentID:0 timeStamp:v13 configuration:v11 withCompletionHandler:v10];
}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 persistentID:(int64_t)a6 timeStamp:(id)a7 configuration:(id)a8 withCompletionHandler:(id)a9
{
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  accessQueue = self->_accessQueue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100125500;
  v22[3] = &unk_1001BED38;
  int64_t v26 = a4;
  int64_t v27 = a5;
  v22[4] = self;
  id v23 = v16;
  id v24 = v15;
  id v25 = v17;
  int64_t v28 = a3;
  int64_t v29 = a6;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  dispatch_async(accessQueue, v22);
}

- (void)setContentTaste:(int64_t)a3 forMediaItem:(int64_t)a4 storeIdentifier:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7 withCompletionHandler:(id)a8
{
  id v13 = a8;
  id v14 = a6;
  id v15 = +[NSDate date];
  [(CloudContentTasteUpdateRequestListener *)self setContentTaste:a3 forMediaItem:a4 storeIdentifier:a5 persistentID:0 timeStamp:v15 configuration:v14 withCompletionHandler:v13];
}

- (void)removeContentTasteOperationsForConnectionConfiguration:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126108;
  v7[3] = &unk_1001BECC0;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)updateContentTasteForConnectionConfiguration:(id)a3 invalidateLocalCache:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012643C;
  block[3] = &unk_1001BEC98;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(accessQueue, block);
}

- (void)handleContentTasteChangedNotification
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126738;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)handleMusicAppRemoved
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126874;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)handleMusicAppInstalled
{
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001269B8;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)stop
{
  int64_t v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping ....", buf, 0xCu);
  }

  [(NSXPCListener *)self->_listener invalidate];
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126B98;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)start
{
  int64_t v3 = os_log_create("com.apple.amp.itunescloudd", "ContentTaste");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting ....", buf, 0xCu);
  }

  [(NSXPCListener *)self->_listener resume];
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100126CAC;
  block[3] = &unk_1001BEC20;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (id)_init
{
  v12.receiver = self;
  v12.super_class = (Class)CloudContentTasteUpdateRequestListener;
  v2 = [(CloudContentTasteUpdateRequestListener *)&v12 init];
  if (v2)
  {
    v2->_musicAppIsInstalled = ICSystemApplicationIsInstalled();
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.amp.iTunesCloud.CloudContentTasteUpdateRequestListener.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.amp.iTunesCloud.CloudContentTasteUpdateRequestListener.callbackQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    contentTasteRequestHandlerToDSIDMap = v2->_contentTasteRequestHandlerToDSIDMap;
    v2->_contentTasteRequestHandlerToDSIDMap = (NSMutableDictionary *)v7;

    id v9 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.itunescloud.contenttaste"];
    listener = v2->_listener;
    v2->_listener = v9;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
  }
  return v2;
}

- (CloudContentTasteUpdateRequestListener)init
{
  return 0;
}

+ (id)sharedContentTasteRequestListener
{
  if (qword_1001F3AB8 != -1) {
    dispatch_once(&qword_1001F3AB8, &stru_1001BEBF8);
  }
  v2 = (void *)qword_1001F3AB0;

  return v2;
}

@end