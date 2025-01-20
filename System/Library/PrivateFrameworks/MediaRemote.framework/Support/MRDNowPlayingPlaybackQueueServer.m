@interface MRDNowPlayingPlaybackQueueServer
- (id)_resolveRequest:(id)a3 withCapabilities:(unint64_t)a4;
- (unsigned)_cachingPolicyForRequest:(id)a3;
- (void)handlePlaybackQueueRequest:(id)a3 fromClient:(id)a4;
- (void)relayArtworkRequest:(id)a3 forContentItems:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 andNotifyXPCClient:(id)a7;
- (void)relayPlaybackQueueRequest:(id)a3 withMessage:(id)a4 toNowPlayingClient:(id)a5 backToXpcClient:(id)a6 completion:(id)a7;
- (void)sendPlaybackQueueResponse:(id)a3 forRequest:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 toXpcClient:(id)a7;
@end

@implementation MRDNowPlayingPlaybackQueueServer

- (void)handlePlaybackQueueRequest:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MRCreatePlaybackQueueRequestFromXPCMessage();
  v9 = +[NSDate now];
  id v10 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"handlePlaybackQueueRequest", v8];
  v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v46 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000B697C;
  v43[3] = &unk_10041AD68;
  id v12 = v9;
  id v44 = v12;
  v13 = objc_retainBlock(v43);
  v14 = +[MRDMediaRemoteServer server];
  v15 = [v14 nowPlayingServer];
  v16 = [v15 queryExistingPlayerPathForXPCMessage:v6 forClient:v7];

  if ([v16 error])
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1000B6D98;
    v41[3] = &unk_100415DC8;
    id v17 = v16;
    id v42 = v17;
    sub_100014324(v6, v41);
    id v18 = objc_msgSend(objc_alloc((Class)NSError), "initWithMRError:", objc_msgSend(v17, "error"));
    v19 = [v17 unresolvedPlayerPath];
    ((void (*)(void *, void *, void *, void, id))v13[2])(v13, v8, v19, 0, v18);

    v20 = v42;
  }
  else
  {
    id v34 = v12;
    v21 = [v16 playerClient];
    v33 = v8;
    v20 = -[MRDNowPlayingPlaybackQueueServer _resolveRequest:withCapabilities:](self, "_resolveRequest:withCapabilities:", v8, [v21 playbackQueueCapabilities]);

    objc_msgSend(v7, "setHasRequestedLegacyNowPlayingInfo:", objc_msgSend(v20, "isLegacyNowPlayingInfoRequest") | objc_msgSend(v7, "hasRequestedLegacyNowPlayingInfo"));
    v22 = [v7 playbackQueueRequests];
    [v16 playerPath];
    v24 = v23 = self;
    v25 = [v22 subscriptionControllerForPlayerPath:v24];

    [v25 addRequest:v20];
    v26 = [v16 playerClient];
    v27 = [v26 playerPath];

    v32 = v23;
    id v28 = (id)[(MRDNowPlayingPlaybackQueueServer *)v23 _cachingPolicyForRequest:v20];
    v29 = [v16 playerClient];
    id v40 = 0;
    v30 = [v29 playbackQueueForRequest:v20 cachingPolicy:v28 playerPath:v27 partiallyCachedItems:&v40];
    id v31 = v40;

    if (v30)
    {
      [(MRDNowPlayingPlaybackQueueServer *)v32 sendPlaybackQueueResponse:v30 forRequest:v20 withMessage:v6 fromNowPlayingClient:v16 toXpcClient:v7];
      ((void (*)(void *, void *, void *, void *, void))v13[2])(v13, v20, v27, v30, 0);
      if ([v31 count]) {
        [(MRDNowPlayingPlaybackQueueServer *)v32 relayArtworkRequest:v20 forContentItems:v31 withMessage:v6 fromNowPlayingClient:v16 andNotifyXPCClient:v7];
      }
    }
    else
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000B6DF0;
      v35[3] = &unk_10041AD90;
      id v36 = v25;
      id v37 = v20;
      v39 = v13;
      id v38 = v27;
      [(MRDNowPlayingPlaybackQueueServer *)v32 relayPlaybackQueueRequest:v37 withMessage:v6 toNowPlayingClient:v16 backToXpcClient:v7 completion:v35];
    }
    id v12 = v34;
    v8 = v33;
  }
}

- (void)sendPlaybackQueueResponse:(id)a3 forRequest:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 toXpcClient:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = [a7 playbackQueueRequests];
  v16 = [v12 playerPath];

  id v17 = [v15 subscriptionControllerForPlayerPath:v16];

  [v17 subscribeToPlaybackQueue:v11 forRequest:v14];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000B6F9C;
  v19[3] = &unk_100415DC8;
  id v20 = v11;
  id v18 = v11;
  sub_100014324(v13, v19);
}

- (void)relayPlaybackQueueRequest:(id)a3 withMessage:(id)a4 toNowPlayingClient:(id)a5 backToXpcClient:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  v16 = +[NSDate now];
  id v17 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"relayPlaybackQueueRequest", v11];
  id v18 = [v12 xpcClient];
  v19 = [v18 displayName];

  if (v19)
  {
    id v20 = [v12 xpcClient];
    v21 = [v20 displayName];
    [v17 appendFormat:@" for %@", v21];
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v47 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000B732C;
  v41[3] = &unk_10041ADB8;
  id v23 = v12;
  id v42 = v23;
  id v24 = v11;
  id v43 = v24;
  id v44 = v16;
  id v45 = v13;
  id v35 = v13;
  id v25 = v16;
  v26 = objc_retainBlock(v41);
  v27 = [v23 playerPath];
  id v28 = [v14 playbackQueueRequests];

  v29 = [v28 subscriptionControllerForPlayerPath:v27];

  xpc_dictionary_set_uint64(v15, "MRXPC_MESSAGE_ID_KEY", 0x700000000000002uLL);
  MRAddPlayerPathToXPCMessage();
  MRAddPlaybackQueueRequestToXPCMessage();
  v30 = [v23 xpcClient];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000B7754;
  v36[3] = &unk_10041ADE0;
  id v37 = v29;
  id v38 = v24;
  id v39 = v23;
  id v40 = v26;
  id v31 = v26;
  id v32 = v23;
  id v33 = v24;
  id v34 = v29;
  [v30 relayXPCMessage:v15 andReply:1 resultCallback:v36];
}

- (void)relayArtworkRequest:(id)a3 forContentItems:(id)a4 withMessage:(id)a5 fromNowPlayingClient:(id)a6 andNotifyXPCClient:(id)a7
{
  id v11 = a3;
  id v34 = a5;
  id v12 = a6;
  id v33 = a7;
  id v13 = a4;
  id v14 = +[NSDate now];
  [v12 playerPath];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1000B7BF0;
  v39[3] = &unk_10041AE08;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v40 = v15;
  id v16 = v11;
  id v41 = v16;
  id v17 = v14;
  id v42 = v17;
  id v18 = objc_retainBlock(v39);
  v19 = objc_msgSend(v13, "msv_map:", &stru_10041AE48);

  id v20 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%@<%@>", @"requestArtworkForContentItems", v16];
  v21 = v20;
  if (v15) {
    [v20 appendFormat:@" for %@", v15];
  }
  if (v19) {
    [v21 appendFormat:@" because %@", v19];
  }
  v22 = _MRLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v44 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  if ([v19 count])
  {
    id v23 = [objc_alloc((Class)MRPlaybackQueueRequest) initWithIdentifiers:v19];
    [v16 artworkWidth];
    objc_msgSend(v23, "setArtworkWidth:");
    [v16 artworkHeight];
    objc_msgSend(v23, "setArtworkHeight:");
    id v24 = +[NSUUID UUID];
    id v25 = [v24 UUIDString];
    [v23 setRequestIdentifier:v25];

    id v26 = objc_alloc((Class)NSString);
    v27 = [v16 label];
    id v28 = [v16 requestIdentifier];
    id v29 = [v26 initWithFormat:@"ArtworkRequest for %@<%@>", v27, v28];
    [v23 setLabel:v29];

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000B7F74;
    v35[3] = &unk_10041AEB0;
    id v36 = v15;
    v30 = v33;
    id v37 = v33;
    id v38 = v18;
    id v31 = v34;
    [(MRDNowPlayingPlaybackQueueServer *)self relayPlaybackQueueRequest:v23 withMessage:v34 toNowPlayingClient:v12 backToXpcClient:v37 completion:v35];
  }
  else
  {
    ((void (*)(void *, void, void))v18[2])(v18, 0, 0);
    v30 = v33;
    id v31 = v34;
  }
}

- (unsigned)_cachingPolicyForRequest:(id)a3
{
  unsigned int result = [a3 cachingPolicy];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (id)_resolveRequest:(id)a3 withCapabilities:(unint64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  id v7 = v5;
  if (!a4)
  {
    id v7 = [v5 copy];
    if ([v7 rangeContainsNowPlayingItem])
    {
      if ([v7 location]) {
        [v7 setLocation:0];
      }
      if (![v7 length]) {
        goto LABEL_12;
      }
      uint64_t v8 = 1;
    }
    else
    {
      if ([v7 hasLocation]) {
        [v7 setLocation:0];
      }
      if (![v7 hasLength]) {
        goto LABEL_12;
      }
      uint64_t v8 = 0;
    }
    [v7 setLength:v8];
LABEL_12:
  }

  return v7;
}

@end