@interface BTAVRCP_XpcSession
- (BOOL)isForwarding;
- (BOOL)isRewinding;
- (BTAVRCP_Library)lazyLibrary;
- (BTAVRCP_NowPlayingInfo)lazyNowPlayingInfo;
- (id)attributeIDsFromArgs:(id)a3;
- (id)library;
- (id)nowPlayingInfo;
- (unsigned)getNowPlayingAttributeIDs:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)getMediaPlayersFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 replyBlock:(id)a5;
- (void)handleChangePathMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetElementAttributesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetFolderItemsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetImageMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetImagePropertiesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetItemAttributesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetPlayStatusMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetSettingsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleGetTotalNumberOfItemsMsg:(id)a3 replyBlock:(id)a4;
- (void)handleMsg:(id)a3;
- (void)handlePlayItemMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForPlaybackStateChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForPlayerChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForSettingsChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleRegisterForTrackChangesMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSearchMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSendCommandMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetAddressedPlayerMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetBrowsedPlayerMsg:(id)a3 replyBlock:(id)a4;
- (void)handleSetSettingsMsg:(id)a3 replyBlock:(id)a4;
- (void)libraryDidChange;
- (void)playbackQueueDidChange;
- (void)playbackStateDidChange:(int64_t)a3;
- (void)playerDidChange:(int)a3;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5;
- (void)setIsForwarding:(BOOL)a3;
- (void)setIsRewinding:(BOOL)a3;
- (void)setLazyLibrary:(id)a3;
- (void)setLazyNowPlayingInfo:(id)a3;
- (void)settingsDidChange:(id)a3;
- (void)trackDidChange:(unint64_t)a3;
@end

@implementation BTAVRCP_XpcSession

- (void)dealloc
{
  if ([(BTAVRCP_XpcSession *)self isRewinding]) {
    MRMediaRemoteSendCommand();
  }
  if ([(BTAVRCP_XpcSession *)self isForwarding]) {
    MRMediaRemoteSendCommand();
  }
  v3.receiver = self;
  v3.super_class = (Class)BTAVRCP_XpcSession;
  [(BTAVRCP_XpcSession *)&v3 dealloc];
}

- (id)nowPlayingInfo
{
  objc_super v3 = [(BTAVRCP_XpcSession *)self lazyNowPlayingInfo];

  if (!v3)
  {
    v4 = objc_alloc_init(BTAVRCP_NowPlayingInfo);
    [(BTAVRCP_XpcSession *)self setLazyNowPlayingInfo:v4];

    v5 = [(BTAVRCP_XpcSession *)self lazyNowPlayingInfo];
    [v5 setDelegate:self];
  }

  return [(BTAVRCP_XpcSession *)self lazyNowPlayingInfo];
}

- (id)library
{
  objc_super v3 = [(BTAVRCP_XpcSession *)self lazyLibrary];

  if (!v3)
  {
    v4 = objc_alloc_init(BTAVRCP_Library);
    [(BTAVRCP_XpcSession *)self setLazyLibrary:v4];

    v5 = [(BTAVRCP_XpcSession *)self lazyLibrary];
    [v5 setDelegate:self];
  }

  return [(BTAVRCP_XpcSession *)self lazyLibrary];
}

- (void)handleSendCommandMsg:(id)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = a3;
  LODWORD(a3) = xpc_dictionary_get_int64(v7, "kCommand");
  string = xpc_dictionary_get_string(v7, "kSource");

  v17[0] = kMRMediaRemoteOptionSourceID;
  v9 = +[NSString stringWithUTF8String:string];
  v17[1] = kMRMediaRemoteOptionRemoteControlInterfaceIdentifier;
  v18[0] = v9;
  v18[1] = @"com.apple.AVRCP";
  v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

  switch((int)a3)
  {
    case 8:
      v11 = self;
      uint64_t v12 = 1;
      goto LABEL_4;
    case 9:
      v11 = self;
      uint64_t v12 = 0;
LABEL_4:
      [(BTAVRCP_XpcSession *)v11 setIsForwarding:v12];
      break;
    case 10:
      v13 = self;
      uint64_t v14 = 1;
      goto LABEL_7;
    case 11:
      v13 = self;
      uint64_t v14 = 0;
LABEL_7:
      [(BTAVRCP_XpcSession *)v13 setIsRewinding:v14];
      break;
    default:
      break;
  }
  v15 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unsigned int v16 = [v15 isLocalOrigin];

  if (v16) {
    MRMediaRemoteSendCommand();
  }
  v6[2](v6, 4, 0);
}

- (void)handleSetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  v8 = (void (**)(id, uint64_t, void))a4;
  id v5 = a3;
  int int64 = xpc_dictionary_get_int64(v5, "kRepeatMode");
  int v7 = xpc_dictionary_get_int64(v5, "kShuffleMode");

  if (int64 != -1) {
    MRMediaRemoteSetRepeatMode();
  }
  if (v7 != -1) {
    MRMediaRemoteSetShuffleMode();
  }
  v8[2](v8, 4, 0);
}

- (void)handleGetSettingsMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *))a4;
  v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unint64_t v7 = (unint64_t)[v6 settings];

  v11[0] = @"kRepeatMode";
  v8 = +[NSNumber numberWithInt:v7];
  v11[1] = @"kShuffleMode";
  v12[0] = v8;
  v9 = +[NSNumber numberWithInt:HIDWORD(v7)];
  v12[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v5[2](v5, 4, v10);
}

- (void)handleGetPlayStatusMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, id))a4;
  id v12 = +[NSMutableDictionary dictionary];
  v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unint64_t v7 = [v6 trackDuration];
  [v12 setValue:v7 forKey:@"kTrackDuration"];

  v8 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v9 = [v8 trackPosition];
  [v12 setValue:v9 forKey:@"kTrackPosition"];

  v10 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v10 playbackState]);
  [v12 setValue:v11 forKey:@"kPlaybackState"];

  v5[2](v5, 4, v12);
}

- (void)handleGetElementAttributesMsg:(id)a3 replyBlock:(id)a4
{
  v22 = (void (**)(id, uint64_t, void *))a4;
  id v5 = +[NSMutableDictionary dictionary];
  v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unint64_t v7 = [v6 trackTitle];

  if (v7) {
    [v5 setValue:v7 forKey:@"kTitle"];
  }
  v8 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v9 = [v8 trackAlbum];

  if (v9) {
    [v5 setValue:v9 forKey:@"kAlbum"];
  }
  v10 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v11 = [v10 trackArtist];

  if (v11) {
    [v5 setValue:v11 forKey:@"kArtist"];
  }
  id v12 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v13 = [v12 trackGenre];

  if (v13) {
    [v5 setValue:v13 forKey:@"kGenre"];
  }
  uint64_t v14 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v15 = [v14 trackQueueIndex];

  if (v15) {
    [v5 setValue:v15 forKey:@"kQueueIndex"];
  }
  unsigned int v16 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v17 = [v16 trackQueueCount];

  if (v17) {
    [v5 setValue:v17 forKey:@"kQueueCount"];
  }
  v18 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v19 = [v18 trackDuration];

  if (v19) {
    [v5 setValue:v19 forKey:@"kDuration"];
  }
  v20 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v21 = [v20 trackImageHandle];

  if (v21) {
    [v5 setValue:v21 forKey:@"kImageHandle"];
  }
  v22[2](v22, 4, v5);
}

- (void)handleRegisterForChangesMsg:(id)a3 replyBlock:(id)a4
{
  v6 = (void (**)(id, uint64_t, void))a4;
  id v5 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v6[2](v6, 4, 0);
}

- (void)handleRegisterForPlayerChangesMsg:(id)a3 replyBlock:(id)a4
{
  CFStringRef v10 = @"kPlayerId";
  id v6 = a4;
  unint64_t v7 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v8 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 playerId]);
  v11 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);
}

- (void)handleRegisterForPlaybackStateChangesMsg:(id)a3 replyBlock:(id)a4
{
  CFStringRef v10 = @"kPlaybackState";
  id v6 = a4;
  unint64_t v7 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 playbackState]);
  v11 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);
}

- (void)handleRegisterForTrackChangesMsg:(id)a3 replyBlock:(id)a4
{
  CFStringRef v10 = @"kUid";
  id v6 = a4;
  unint64_t v7 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  v8 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v7 trackId]);
  v11 = v8;
  v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  (*((void (**)(id, uint64_t, void *))a4 + 2))(v6, 4, v9);
}

- (void)handleRegisterForSettingsChangesMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, uint64_t, void *))a4;
  id v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unint64_t v7 = (unint64_t)[v6 settings];

  v11[0] = @"kRepeatMode";
  v8 = +[NSNumber numberWithInt:v7];
  v11[1] = @"kShuffleMode";
  v12[0] = v8;
  v9 = +[NSNumber numberWithInt:HIDWORD(v7)];
  v12[1] = v9;
  CFStringRef v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
  v5[2](v5, 4, v10);
}

- (void)handleSetAddressedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  unint64_t v7 = (void (**)(void))a4;
  xpc_dictionary_get_int64(a3, "kPlayerId");
  id v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  [v6 playerId];

  v7[2]();
}

- (void)handleSetBrowsedPlayerMsg:(id)a3 replyBlock:(id)a4
{
  id v12 = a4;
  LODWORD(a3) = xpc_dictionary_get_int64(a3, "kPlayerId");
  id v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unsigned int v7 = [v6 playerId];

  if (v7 == a3)
  {
    v8 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
    unsigned int v9 = [v8 isBrowsablePlayer];

    if (v9)
    {
      CFStringRef v10 = [(BTAVRCP_XpcSession *)self library];
      [v10 getCurrentPath:v12];

      goto LABEL_7;
    }
    v11 = (void (*)(void))v12[2];
  }
  else
  {
    v11 = (void (*)(void))v12[2];
  }
  v11();
LABEL_7:
}

- (void)handleChangePathMsg:(id)a3 replyBlock:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  __int16 int64 = xpc_dictionary_get_int64(xdict, "kUidCounter");
  if (xpc_dictionary_get_BOOL(xdict, "kDotDot")) {
    int64_t v8 = 0;
  }
  else {
    int64_t v8 = xpc_dictionary_get_int64(xdict, "kUid");
  }
  if (int64)
  {
    v6[2](v6, 5, 0);
  }
  else
  {
    unsigned int v9 = [(BTAVRCP_XpcSession *)self library];
    [v9 changePath:v8 replyBlock:v6];
  }
}

- (void)handleGetFolderItemsMsg:(id)a3 replyBlock:(id)a4
{
  unsigned int v16 = a4;
  id v6 = a3;
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  unsigned int v8 = xpc_dictionary_get_int64(v6, "kStartItem");
  LODWORD(v9) = xpc_dictionary_get_int64(v6, "kEndItem");
  CFStringRef v10 = [(BTAVRCP_XpcSession *)self attributeIDsFromArgs:v6];

  if (v8 <= v9)
  {
    if (v8 + 20 <= v9) {
      uint64_t v9 = v8 + 19;
    }
    else {
      uint64_t v9 = v9;
    }
    if ([v10 containsObject:&off_100019AF0]) {
      id v12 = &off_100019BE8;
    }
    else {
      id v12 = 0;
    }
    switch(int64)
    {
      case 0:
        [(BTAVRCP_XpcSession *)self getMediaPlayersFromStart:v8 toEnd:v9 replyBlock:v16];
        break;
      case 1:
        v13 = [(BTAVRCP_XpcSession *)self library];
        [v13 getVFSItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
        goto LABEL_17;
      case 2:
        v13 = [(BTAVRCP_XpcSession *)self library];
        [v13 getSearchItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
        goto LABEL_17;
      case 3:
        uint64_t v14 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
        unsigned int v15 = [v14 isMusicApp];

        if (!v15) {
          goto LABEL_2;
        }
        v13 = [(BTAVRCP_XpcSession *)self library];
        [v13 getNowPlayingItemsFromStart:v8 toEnd:v9 attributeIDs:v12 replyBlock:v16];
LABEL_17:

        break;
      default:
        v11 = (void (*)(void))v16[2];
        goto LABEL_3;
    }
  }
  else
  {
LABEL_2:
    v11 = (void (*)(void))v16[2];
LABEL_3:
    v11();
  }
}

- (void)handleGetItemAttributesMsg:(id)a3 replyBlock:(id)a4
{
  v19 = (void (**)(id, uint64_t, void *))a4;
  id v6 = a3;
  unsigned int v7 = +[NSMutableDictionary dictionary];
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  int64_t v9 = xpc_dictionary_get_int64(v6, "kUid");
  __int16 v10 = xpc_dictionary_get_int64(v6, "kUidCounter");
  v11 = [(BTAVRCP_XpcSession *)self attributeIDsFromArgs:v6];

  if (v10)
  {
    uint64_t v12 = 5;
    goto LABEL_15;
  }
  switch(int64)
  {
    case 3:
      if (v9 == -1)
      {
        uint64_t v12 = 9;
      }
      else
      {
        if (!v9
          || ([(BTAVRCP_XpcSession *)self nowPlayingInfo],
              unsigned int v15 = objc_claimAutoreleasedReturnValue(),
              id v16 = [v15 trackId],
              v15,
              (id)v9 == v16))
        {
          uint64_t v12 = [(BTAVRCP_XpcSession *)self getNowPlayingAttributeIDs:v11 reply:v7];
          break;
        }
        v17 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
        unsigned int v18 = [v17 isMusicApp];

        if (v18)
        {
          v13 = [(BTAVRCP_XpcSession *)self library];
          id v14 = [v13 getNowPlayingItemWithUid:v9 attributeIDs:v11 reply:v7];
          goto LABEL_12;
        }
        uint64_t v12 = 11;
      }
      break;
    case 2:
      v13 = [(BTAVRCP_XpcSession *)self library];
      id v14 = [v13 getSearchItemWithUid:v9 attributeIDs:v11 reply:v7];
      goto LABEL_12;
    case 1:
      v13 = [(BTAVRCP_XpcSession *)self library];
      id v14 = [v13 getVFSItemWithUid:v9 attributeIDs:v11 reply:v7];
LABEL_12:
      uint64_t v12 = (uint64_t)v14;

      break;
    default:
      uint64_t v12 = 10;
      break;
  }
LABEL_15:
  v19[2](v19, v12, v7);
}

- (void)handleSearchMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  string = xpc_dictionary_get_string(a3, "kSearchString");
  id v9 = [(BTAVRCP_XpcSession *)self library];
  unsigned int v8 = +[NSString stringWithUTF8String:string];
  [v9 search:v8 replyBlock:v6];
}

- (void)handleGetTotalNumberOfItemsMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = (void (**)(id, uint64_t, void *))a4;
  switch(xpc_dictionary_get_int64(a3, "kScope"))
  {
    case 0u:
      uint64_t v7 = 1;
      break;
    case 1u:
      unsigned int v8 = [(BTAVRCP_XpcSession *)self library];
      id v9 = [v8 getVFSItemsCount];
      goto LABEL_7;
    case 2u:
      unsigned int v8 = [(BTAVRCP_XpcSession *)self library];
      id v9 = [v8 getSearchItemsCount];
      goto LABEL_7;
    case 3u:
      __int16 v10 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
      unsigned int v11 = [v10 isMusicApp];

      if (!v11) {
        goto LABEL_8;
      }
      unsigned int v8 = [(BTAVRCP_XpcSession *)self library];
      id v9 = [v8 getNowPlayingItemsCount];
LABEL_7:
      uint64_t v7 = (uint64_t)v9;

      break;
    default:
LABEL_8:
      uint64_t v7 = 0;
      break;
  }
  CFStringRef v14 = @"kNumItems";
  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:v7];
  unsigned int v15 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v6[2](v6, 4, v13);
}

- (void)handlePlayItemMsg:(id)a3 replyBlock:(id)a4
{
  unsigned int v15 = (void (**)(id, uint64_t, void))a4;
  id v6 = a3;
  char int64 = xpc_dictionary_get_int64(v6, "kScope");
  int64_t v8 = xpc_dictionary_get_int64(v6, "kUid");
  __int16 v9 = xpc_dictionary_get_int64(v6, "kUidCounter");

  if (v9)
  {
    uint64_t v10 = 5;
    goto LABEL_13;
  }
  switch(int64)
  {
    case 3:
      v13 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
      unsigned int v14 = [v13 isMusicApp];

      if (v14)
      {
        unsigned int v11 = [(BTAVRCP_XpcSession *)self library];
        id v12 = [v11 playNowPlayingItemWithUid:v8];
        goto LABEL_10;
      }
      uint64_t v10 = 9;
      break;
    case 2:
      unsigned int v11 = [(BTAVRCP_XpcSession *)self library];
      id v12 = [v11 playSearchItemWithUid:v8];
      goto LABEL_10;
    case 1:
      unsigned int v11 = [(BTAVRCP_XpcSession *)self library];
      id v12 = [v11 playVFSItemWithUid:v8];
LABEL_10:
      uint64_t v10 = (uint64_t)v12;

      break;
    default:
      uint64_t v10 = 10;
      break;
  }
LABEL_13:
  v15[2](v15, v10, 0);
}

- (void)handleGetImagePropertiesMsg:(id)a3 replyBlock:(id)a4
{
  id v5 = (void (**)(id, void, id))a4;
  id v12 = +[NSMutableDictionary dictionary];
  id v6 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  uint64_t v7 = [v6 encodings];
  [v12 setValue:v7 forKey:@"kEncodings"];

  int64_t v8 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  __int16 v9 = [v8 widths];
  [v12 setValue:v9 forKey:@"kWidths"];

  uint64_t v10 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unsigned int v11 = [v10 heights];
  [v12 setValue:v11 forKey:@"kHeights"];

  v5[2](v5, 0, v12);
}

- (void)handleGetImageMsg:(id)a3 replyBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v7, "kWidth");
  int64_t v9 = xpc_dictionary_get_int64(v7, "kHeight");

  uint64_t v10 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unsigned int v11 = [v10 widths];
  id v12 = +[NSNumber numberWithUnsignedLongLong:int64];
  [v11 indexOfObject:v12];

  v13 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  unsigned int v14 = [v13 heights];
  unsigned int v15 = +[NSNumber numberWithUnsignedLongLong:v9];
  [v14 indexOfObject:v15];

  id v16 = (const void *)MRPlaybackQueueRequestCreate();
  MRMediaRemoteGetLocalOrigin();
  v17 = (const void *)MRNowPlayingPlayerPathCreate();
  MRPlaybackQueueRequestSetIncludeArtwork();
  id v18 = v6;
  MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync();
  if (v16) {
    CFRelease(v16);
  }
  if (v17) {
    CFRelease(v17);
  }
}

- (void)handleMsg:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "kMsgId");
  id v6 = xpc_dictionary_get_value(v4, "kMsgArgs");
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_100006D50;
  v11[3] = &unk_100018A50;
  v11[4] = self;
  id v12 = v4;
  id v7 = v4;
  int64_t v8 = objc_retainBlock(v11);
  int64_t v9 = +[NSString stringWithFormat:@"handle%sMsg:replyBlock:", string];
  uint64_t v10 = NSSelectorFromString(v9);

  [self v10:v6 v8];
}

- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5
{
  unsigned int v5 = a4;
  id v8 = a5;
  xpc_object_t xdict = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_int64(xdict, "kMsgStatus", v5);
  int64_t v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "kMsgArgs", v9);
  [(BTXpcSession *)self sendReply:xdict];
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  id v8 = v6;
  int64_t v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "kMsgId", v9);
  if (v11)
  {
    uint64_t v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v7, "kMsgArgs", v10);
  }
  [(BTXpcSession *)self sendMsg:v7];
}

- (void)playerDidChange:(int)a3
{
  CFStringRef v6 = @"kPlayerId";
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(BTAVRCP_XpcSession *)self sendMsg:@"PlayerDidChange" args:v5];
}

- (void)playbackStateDidChange:(int64_t)a3
{
  CFStringRef v6 = @"kPlaybackState";
  id v4 = +[NSNumber numberWithInteger:a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(BTAVRCP_XpcSession *)self sendMsg:@"PlaybackStateDidChange" args:v5];
}

- (void)trackDidChange:(unint64_t)a3
{
  CFStringRef v6 = @"kUid";
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  xpc_object_t v7 = v4;
  unsigned int v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [(BTAVRCP_XpcSession *)self sendMsg:@"TrackDidChange" args:v5];
}

- (void)settingsDidChange:(id)a3
{
  uint64_t var1 = a3.var1;
  v8[0] = @"kRepeatMode";
  unsigned int v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
  v8[1] = @"kShuffleMode";
  v9[0] = v5;
  CFStringRef v6 = +[NSNumber numberWithInt:var1];
  v9[1] = v6;
  xpc_object_t v7 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [(BTAVRCP_XpcSession *)self sendMsg:@"SettingsDidChange" args:v7];
}

- (void)playbackQueueDidChange
{
}

- (void)libraryDidChange
{
  [(BTAVRCP_XpcSession *)self sendMsg:@"LibraryDidChange" args:0];
  id v3 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
  -[BTAVRCP_XpcSession trackDidChange:](self, "trackDidChange:", [v3 trackId]);
}

- (id)attributeIDsFromArgs:(id)a3
{
  id v3 = xpc_dictionary_get_value(a3, "kAttributeIDs");
  if (v3) {
    id v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)getMediaPlayersFromStart:(unint64_t)a3 toEnd:(unint64_t)a4 replyBlock:(id)a5
{
  if (a3)
  {
    unsigned int v5 = (void (*)(void))*((void *)a5 + 2);
    id v6 = a5;
    v5();
  }
  else
  {
    v22[0] = @"kPlayerId";
    id v8 = (void (**)(id, uint64_t, void *))a5;
    int64_t v9 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
    uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 playerId]);
    v23[0] = v10;
    v22[1] = @"kPlaybackState";
    id v11 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
    id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 playbackState]);
    v23[1] = v12;
    v22[2] = @"kIsBrowsable";
    v13 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
    unsigned int v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 isBrowsablePlayer]);
    v23[2] = v14;
    v22[3] = @"kName";
    unsigned int v15 = [(BTAVRCP_XpcSession *)self nowPlayingInfo];
    id v16 = [v15 playerName];
    v23[3] = v16;
    id v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

    id v19 = v6;
    CFStringRef v20 = @"kItems";
    v17 = +[NSArray arrayWithObjects:&v19 count:1];
    v21 = v17;
    id v18 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v8[2](v8, 4, v18);
  }
}

- (unsigned)getNowPlayingAttributeIDs:(id)a3 reply:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000075B8;
  v7[3] = &unk_100018A78;
  v7[4] = self;
  id v8 = a4;
  id v5 = v8;
  [a3 enumerateAttributeIDs:v7];

  return 4;
}

- (BTAVRCP_NowPlayingInfo)lazyNowPlayingInfo
{
  return self->_lazyNowPlayingInfo;
}

- (void)setLazyNowPlayingInfo:(id)a3
{
}

- (BTAVRCP_Library)lazyLibrary
{
  return self->_lazyLibrary;
}

- (void)setLazyLibrary:(id)a3
{
}

- (BOOL)isForwarding
{
  return self->_isForwarding;
}

- (void)setIsForwarding:(BOOL)a3
{
  self->_isForwarding = a3;
}

- (BOOL)isRewinding
{
  return self->_isRewinding;
}

- (void)setIsRewinding:(BOOL)a3
{
  self->_isRewinding = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyLibrary, 0);

  objc_storeStrong((id *)&self->_lazyNowPlayingInfo, 0);
}

@end