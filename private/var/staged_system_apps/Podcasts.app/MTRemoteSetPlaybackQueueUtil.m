@interface MTRemoteSetPlaybackQueueUtil
+ (id)_entityForFetchRequest:(id)a3;
+ (int64_t)requestStatusForMediaRemoteStatus:(unsigned int)a3;
+ (void)_destinationForRequest:(id)a3 completion:(id)a4;
+ (void)convertActiveEndpointToBufferedAirPlayWithCompletion:(id)a3;
+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 enqueuer:(id)a5 accountLookupFailed:(BOOL)a6 startPlayback:(BOOL)a7 upNextQueueIntent:(unint64_t)a8 completion:(id)a9;
+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 sessionIdentifierOverride:(id)a5 enqueuer:(id)a6 accountLookupFailed:(BOOL)a7 startPlayback:(BOOL)a8 upNextQueueIntent:(unint64_t)a9 completion:(id)a10;
+ (void)insertEpisodeUuids:(id)a3 intoPlaybackQueueAtPosition:(int)a4;
+ (void)insertPlayerItems:(id)a3 intoPlaybackQueueAtPosition:(int)a4;
+ (void)performRequestAsBufferedAirPlay:(id)a3;
+ (void)pickRouteAndSwitchToLocalCard:(id)a3 completion:(id)a4;
+ (void)promptBeforePerformingRequestAsBufferedAirPlay:(id)a3 queueStatus:(unint64_t)a4;
+ (void)sendPlaybackQueueToLocalDestination:(_MRSystemAppPlaybackQueue *)a3 context:(id)a4 completion:(id)a5;
+ (void)setRemotePlaybackQueue:(id)a3 completion:(id)a4;
@end

@implementation MTRemoteSetPlaybackQueueUtil

+ (void)setRemotePlaybackQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 manifest];
  v9 = [v6 context];
  unsigned int v10 = [v9 isInteractive];

  uint64_t v20 = 0;
  v11 = +[MTPlaybackIdentifierUtil sharedInstance];
  id v12 = [v11 playbackQueueWithAccountInfoForManifest:v8 queueStatus:&v20];

  if (v20)
  {
    if (v10) {
      [a1 promptBeforePerformingRequestAsBufferedAirPlay:v6];
    }
    else {
      [a1 performRequestAsBufferedAirPlay:v6];
    }
  }
  else
  {
    [v6 startPlayback];
    MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback();
    v13 = [v6 context];
    [v13 upNextQueueIntent];

    MRSystemAppPlaybackQueueSetReplaceIntent();
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000ECEC4;
    v14[3] = &unk_100551230;
    id v15 = v6;
    id v16 = v7;
    id v17 = v12;
    id v18 = a1;
    char v19 = v10;
    [a1 _destinationForRequest:v15 completion:v14];
  }
}

+ (void)sendPlaybackQueueToLocalDestination:(_MRSystemAppPlaybackQueue *)a3 context:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc((Class)MPCAssistantRemoteControlDestination);
  id v10 = [v9 initWithAppBundleID:kMTApplicationBundleIdentifier playerID:kPodcastsPlayerID origin:0];
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  ExternalRepresentation = (void *)MRSystemAppPlaybackQueueCreateExternalRepresentation();
  if (ExternalRepresentation) {
    [v11 setObject:ExternalRepresentation forKey:kMRMediaRemoteOptionSystemAppPlaybackQueueData];
  }
  if (v7) {
    [v11 setObject:v7 forKey:kMRMediaRemoteOptionContextID];
  }
  id v13 = objc_alloc_init((Class)MPCAssistantCommand);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000ED414;
  v15[3] = &unk_100551258;
  id v16 = v8;
  id v17 = a1;
  id v14 = v8;
  [v13 sendCommand:122 toDestination:v10 withOptions:v11 completion:v15];
}

+ (void)promptBeforePerformingRequestAsBufferedAirPlay:(id)a3 queueStatus:(unint64_t)a4
{
  id v6 = a3;
  if (isTV())
  {
    [a1 performRequestAsBufferedAirPlay:v6];
  }
  else
  {
    id v7 = +[MTPlayerController defaultInstance];
    id v8 = [v7 playerPath];
    id v9 = [v8 route];

    id v10 = [v6 manifest];
    id v11 = [v10 currentItem];
    id v12 = [v11 episode];

    id v13 = [v12 podcast];
    id v14 = [v13 provider];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000ED68C;
    v15[3] = &unk_100551280;
    id v17 = a1;
    id v16 = v6;
    +[MTEpisodeUnavailableUtil promptBeforePerformingIntentAsBufferedAirPlayForRoute:v9 provider:v14 queueStatus:a4 completion:v15];
  }
}

+ (void)performRequestAsBufferedAirPlay:(id)a3
{
  id v4 = a3;
  v5 = [v4 completion];
  unsigned __int8 v6 = [v4 startPlayback];
  id v7 = [v4 context];
  id v8 = [v7 source];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000ED7F0;
  v13[3] = &unk_1005512A8;
  unsigned __int8 v16 = v6;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  [v4 setCompletion:v13];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000ED890;
  v11[3] = &unk_10054DE48;
  id v12 = v4;
  id v10 = v4;
  [a1 convertActiveEndpointToBufferedAirPlayWithCompletion:v11];
}

+ (void)convertActiveEndpointToBufferedAirPlayWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = +[MTPlayerController defaultInstance];
  unsigned __int8 v6 = [v5 playerPath];
  id v7 = [v6 route];

  [a1 pickRouteAndSwitchToLocalCard:v7 completion:v4];
}

+ (void)pickRouteAndSwitchToLocalCard:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)MPAVRoutingController) initWithName:@"PodcastsRemoteSetPlaybackQueueUtil"];
  if (!v5)
  {
    id v5 = +[MPAVRoutingController systemRoute];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EDAA8;
  v9[3] = &unk_1005502D0;
  id v10 = v6;
  id v8 = v6;
  [v7 selectRoute:v5 operation:0 completion:v9];
}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 enqueuer:(id)a5 accountLookupFailed:(BOOL)a6 startPlayback:(BOOL)a7 upNextQueueIntent:(unint64_t)a8 completion:(id)a9
{
}

+ (void)decodeAndSetPlaybackQueueForController:(id)a3 fromIdentifiers:(id)a4 sessionIdentifierOverride:(id)a5 enqueuer:(id)a6 accountLookupFailed:(BOOL)a7 startPlayback:(BOOL)a8 upNextQueueIntent:(unint64_t)a9 completion:(id)a10
{
  uint64_t v11 = a7;
  id v15 = a3;
  id v32 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a10;
  unsigned int v19 = +[PFClientUtil isRunningOnHomepod];
  if (v17 && v19)
  {
    uint64_t v20 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Overriding active account, enqueuer: %@", buf, 0xCu);
    }
    BOOL v21 = a8;

    v22 = +[MTAccountController sharedInstance];
    [v22 setAccountOverride:v17];

    goto LABEL_7;
  }
  BOOL v21 = a8;
  v23 = +[MTAccountController sharedInstance];
  [v23 setAccountOverride:0];

  if (v17)
  {
LABEL_7:
    v24 = +[MTAccountController sharedInstance];
    uint64_t v11 = [v24 isPrimaryUserActiveAccount] ^ 1;
  }
  v25 = [v15 upNextController];
  id v26 = [v25 count];

  v27 = [v15 upNextController];
  id v28 = [v27 upNextOffset];

  if (a9 || v26 == v28)
  {
    v31 = +[MTPlaybackIdentifierUtil sharedInstance];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000EDEB0;
    v33[3] = &unk_1005512F8;
    v30 = v32;
    id v34 = v32;
    id v37 = v18;
    uint64_t v38 = 7;
    id v35 = v16;
    unint64_t v39 = a9;
    BOOL v40 = v21;
    id v36 = v15;
    [v31 fetchPlayerItemsForPlaybackQueueRequestIdentifiers:v34 initiatedByAnotherUser:v11 completion:v33];
  }
  else
  {
    v29 = _MTLogCategoryMediaRemote();
    v30 = v32;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v32;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Asking for queue confirmation for identifiers %@", buf, 0xCu);
    }

    if (v18) {
      (*((void (**)(id, uint64_t, uint64_t))v18 + 2))(v18, 8, 7);
    }
  }
}

+ (void)insertEpisodeUuids:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), (void)v14);
        if (v13) {
          [v7 addObject:v13];
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [a1 insertPlayerItems:v7 intoPlaybackQueueAtPosition:v4];
}

+ (void)insertPlayerItems:(id)a3 intoPlaybackQueueAtPosition:(int)a4
{
  id v5 = a3;
  id v6 = +[MTPlayerController defaultInstance];
  id v7 = +[MTPlaybackIdentifierUtil sharedInstance];
  id v8 = [v7 playbackQueueWithAccountInfoForPlayerItems:v5];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EE3AC;
  v9[3] = &unk_100551358;
  void v9[4] = v8;
  int v10 = a4;
  [v6 resolveActivePlayerPathWithCompletion:v9];
}

+ (int64_t)requestStatusForMediaRemoteStatus:(unsigned int)a3
{
  int64_t result = 1;
  switch(a3)
  {
    case 0u:
    case 3u:
      return result;
    case 1u:
      int64_t result = 3;
      break;
    case 2u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      goto LABEL_4;
    case 0xAu:
      int64_t result = 4;
      break;
    default:
      if (a3 == 101) {
        int64_t result = 8;
      }
      else {
LABEL_4:
      }
        int64_t result = 0;
      break;
  }
  return result;
}

+ (void)_destinationForRequest:(id)a3 completion:(id)a4
{
  id v4 = a4;
  id v5 = +[MTPlayerController defaultInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000EE69C;
  v7[3] = &unk_100551380;
  id v8 = v4;
  id v6 = v4;
  [v5 resolveActivePlayerPathWithCompletion:v7];
}

+ (id)_entityForFetchRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[MTDB sharedInstance];
  id v5 = [v4 mainOrPrivateContext];

  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_10005701C;
  v30 = sub_1000572D8;
  id v31 = 0;
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10005701C;
  v24 = sub_1000572D8;
  id v25 = 0;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_1000EE9F4;
  long long v15 = &unk_100550AA0;
  id v18 = &v20;
  id v6 = v5;
  id v16 = v6;
  id v7 = v3;
  id v17 = v7;
  unsigned int v19 = &v26;
  [v6 performBlockAndWait:&v12];
  if (v27[5])
  {
    id v8 = _MTLogCategoryMediaRemote();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = v27[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error fetching episodeGuid while setting play queue: %@", buf, 0xCu);
    }

    int v10 = 0;
  }
  else
  {
    int v10 = [v21[5] firstObject:v12, v13, v14, v15, v16];
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v10;
}

@end