@interface MRDBrowsableContentServer
- (BOOL)_messageCanLaunchApp:(id)a3;
- (BOOL)_messageRequiresMediaServerBlessing:(id)a3;
- (BOOL)_takeProcessAssertionForClient:(id)a3 withReason:(id)a4;
- (MRDBrowsableContentAPICoordinator)apiCoordinator;
- (MRDBrowsableContentServer)init;
- (void)_clearQueuedBeginLoadingMessagesForApp:(id)a3;
- (void)_clientDidRegisterCanBeNowPlaying:(id)a3;
- (void)_clientDidUnregisterCanBeNowPlaying:(id)a3;
- (void)_enqueueCompletion:(id)a3 forUnavailableDestinationApp:(id)a4;
- (void)_handleBeginLoadingBrowsableContentMessage:(id)a3 fromClient:(id)a4;
- (void)_handleBrowsableContentDidFinishLoadingFromClient:(id)a3 indexPath:(id)a4 withError:(id)a5;
- (void)_handleGetAppsSupportingBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRequestPlaybackInitializationMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSupportedAPIsDidChangeForClient:(id)a3;
- (void)_relayMessage:(id)a3 toClientWithBundleIDAndReply:(id)a4;
- (void)_scheduleEndProcessAssertionForClient:(id)a3;
- (void)_sendInitiatePlaybackMessage:(id)a3;
- (void)_sendQueuedBeginLoadingMessagesForAvailableApp:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
@end

@implementation MRDBrowsableContentServer

- (MRDBrowsableContentServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)MRDBrowsableContentServer;
  v2 = [(MRDBrowsableContentServer *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedInitiatePlaybackMessages = v2->_queuedInitiatePlaybackMessages;
    v2->_queuedInitiatePlaybackMessages = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedRelayableMessages = v2->_queuedRelayableMessages;
    v2->_queuedRelayableMessages = v5;

    v7 = objc_alloc_init(MRDBrowsableContentAPICoordinator);
    apiCoordinator = v2->_apiCoordinator;
    v2->_apiCoordinator = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queuedBeginLoadingBlocks = v2->_queuedBeginLoadingBlocks;
    v2->_queuedBeginLoadingBlocks = v9;

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"_clientDidRegisterCanBeNowPlaying:" name:kMRMediaRemoteNowPlayingApplicationDidRegisterCanBeNowPlaying object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"_clientDidUnregisterCanBeNowPlaying:" name:kMRMediaRemoteNowPlayingApplicationDidUnregisterCanBeNowPlaying object:0];
  }
  return v2;
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x500000000000001uLL:
      [(MRDBrowsableContentServer *)self _handleBeginLoadingBrowsableContentMessage:xdict fromClient:v6];
      break;
    case 0x500000000000002uLL:
    case 0x500000000000003uLL:
    case 0x500000000000004uLL:
    case 0x500000000000005uLL:
    case 0x50000000000000AuLL:
      v7 = MRCreateStringFromXPCMessage();
      [(MRDBrowsableContentServer *)self _relayMessage:xdict toClientWithBundleIDAndReply:v7];

      break;
    case 0x500000000000006uLL:
      [(MRDBrowsableContentServer *)self _handleRequestPlaybackInitializationMessage:xdict fromClient:v6];
      break;
    case 0x500000000000007uLL:
      [(MRDBrowsableContentServer *)self _handleGetSupportedBrowsableContentAPIsMessage:xdict fromClient:v6];
      break;
    case 0x500000000000008uLL:
      [(MRDBrowsableContentServer *)self _handleSetSupportedBrowsableContentAPIsMessage:xdict fromClient:v6];
      break;
    case 0x500000000000009uLL:
      [(MRDBrowsableContentServer *)self _handleGetAppsSupportingBrowsableContentAPIsMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
}

- (void)_handleBeginLoadingBrowsableContentMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = MRCreateStringFromXPCMessage();
  v9 = +[MRDMediaRemoteServer server];
  v10 = v9;
  if (v8) {
    [v9 clientForBundleIdentifier:v8];
  }
  else {
  v11 = [v9 localNowPlayingClient];
  }

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100062800;
  v20 = &unk_1004182D0;
  id v21 = v6;
  v22 = self;
  id v12 = v6;
  v13 = objc_retainBlock(&v17);
  if (v11 && objc_msgSend(v11, "canBeNowPlaying", v17, v18, v19, v20, v21, v22))
  {
    objc_super v14 = [v11 bundleIdentifier];
    [(MRDBrowsableContentServer *)self _clearQueuedBeginLoadingMessagesForApp:v14];

    ((void (*)(void ***, void *))v13[2])(v13, v11);
  }
  else
  {
    v15 = objc_msgSend(v11, "bundleIdentifier", v17, v18, v19, v20);

    if (v15)
    {
      Error = [v11 bundleIdentifier];
      [(MRDBrowsableContentServer *)self _enqueueCompletion:v13 forUnavailableDestinationApp:Error];
    }
    else
    {
      Error = (void *)MRMediaRemoteCreateError();
      -[MRDBrowsableContentServer _handleBrowsableContentDidFinishLoadingFromClient:indexPath:withError:](self, "_handleBrowsableContentDidFinishLoadingFromClient:indexPath:withError:", v7, 0, 0, Error);
    }
  }
}

- (void)_enqueueCompletion:(id)a3 forUnavailableDestinationApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Client %@ not available. Enqueuing beginLoading message", (uint8_t *)&v12, 0xCu);
  }

  queuedBeginLoadingBlocks = self->_queuedBeginLoadingBlocks;
  id v10 = [v7 copy];

  id v11 = objc_retainBlock(v10);
  [(NSMutableDictionary *)queuedBeginLoadingBlocks setObject:v11 forKey:v6];
}

- (void)_sendQueuedBeginLoadingMessagesForAvailableApp:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_queuedBeginLoadingBlocks objectForKey:v4];
  if (v5)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client %@ now available. Dequeuing beginLoading message", (uint8_t *)&v10, 0xCu);
    }

    id v7 = +[MRDMediaRemoteServer server];
    v8 = [v7 clientForBundleIdentifier:v4];

    if (v8)
    {
      ((void (**)(void, void *))v5)[2](v5, v8);
    }
    else
    {
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client %@ not available even though it can be now playing app", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  [(MRDBrowsableContentServer *)self _clearQueuedBeginLoadingMessagesForApp:v4];
}

- (void)_clearQueuedBeginLoadingMessagesForApp:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_queuedBeginLoadingBlocks objectForKey:v4];

  if (v5)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Clearing beginLoading message for client %@", (uint8_t *)&v7, 0xCu);
    }

    [(NSMutableDictionary *)self->_queuedBeginLoadingBlocks removeObjectForKey:v4];
  }
}

- (void)_clientDidRegisterCanBeNowPlaying:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetPlayerPathFromUserInfo();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if ([v7 isLocal])
  {
    v5 = [v7 client];
    id v6 = [v5 bundleIdentifier];
    [(MRDBrowsableContentServer *)self _sendQueuedBeginLoadingMessagesForAvailableApp:v6];
  }
}

- (void)_clientDidUnregisterCanBeNowPlaying:(id)a3
{
  id v4 = [a3 userInfo];
  MRGetPlayerPathFromUserInfo();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if ([v7 isLocal])
  {
    v5 = [v7 client];
    id v6 = [v5 bundleIdentifier];
    [(MRDBrowsableContentServer *)self _clearQueuedBeginLoadingMessagesForApp:v6];
  }
}

- (void)_handleRequestPlaybackInitializationMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v6 = (void *)MRCreateDataFromXPCMessage();
  MRCreateStringFromXPCMessage();
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v8 = +[MRDMediaRemoteServer server];
    v9 = [v8 localNowPlayingClient];

    int v10 = [v9 bundleIdentifier];
    id v7 = [v10 copy];
  }
  id v11 = [[MRDInitiatePlaybackMessage alloc] initWithBundleID:v7 indexPathData:v6];

  int v12 = [(MRDInitiatePlaybackMessage *)v11 bundleID];
  id v13 = v12;
  if (v12)
  {
    if (sub_100167BD8(v12))
    {
      [(MRDBrowsableContentServer *)self _sendInitiatePlaybackMessage:v11];
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000630E4;
      v16[3] = &unk_1004175B8;
      v16[4] = self;
      v17 = v11;
      id v18 = v13;
      sub_100167D14(v18, 0, v16);
    }
  }
  else
  {
    objc_super v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Warning: cannot handle initiate playback message without a bundle ID.", v15, 2u);
    }
  }
}

- (void)_handleGetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  MRCreateStringFromXPCMessage();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  sub_10001432C(v5, (uint64_t)"MRXPC_CONTENT_API_MASK_KEY", 1, [(MRDBrowsableContentAPICoordinator *)self->_apiCoordinator supportedAPIsForApplication:v6], 0);
}

- (void)_handleSetSupportedBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 bundleIdentifier];
  [(MRDBrowsableContentAPICoordinator *)self->_apiCoordinator setSupportedAPIs:xpc_dictionary_get_uint64(v7, "MRXPC_CONTENT_API_MASK_KEY") forApplication:v8];
  sub_1001679D8(v7, 0);

  [(MRDBrowsableContentServer *)self _handleSupportedAPIsDidChangeForClient:v6];
}

- (void)_handleGetAppsSupportingBrowsableContentAPIsMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a3;
  id v7 = [(MRDBrowsableContentAPICoordinator *)self->_apiCoordinator applicationsSupportingAPIs:xpc_dictionary_get_uint64(v5, "MRXPC_CONTENT_API_MASK_KEY")];
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:200 options:0 error:0];
  sub_1001678A4(v5, (uint64_t)"MRXPC_BUNDLE_ID_ARRAY_DATA_KEY", v6, 0);
}

- (void)_relayMessage:(id)a3 toClientWithBundleIDAndReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MRDMediaRemoteServer server];
  v9 = v8;
  if (v7) {
    [v8 clientForBundleIdentifier:v7];
  }
  else {
  int v10 = [v8 localNowPlayingClient];
  }

  if (v10)
  {
    if ([(MRDBrowsableContentServer *)self _messageRequiresMediaServerBlessing:v6])
    {
      id v11 = [v10 bundleIdentifier];
      unsigned __int8 v12 = sub_100169F18(v11);

      if ((v12 & 1) == 0)
      {
        id v13 = _MRLogForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error preparing client %{public}@ for browsable content message relay.", buf, 0xCu);
        }
      }
      objc_super v14 = _MRLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Beginning task assertion for client %@ in preparation for playback initiated by the browsable content system.", buf, 0xCu);
      }

      v15 = [MRDTaskAssertion alloc];
      id v16 = [v10 pid];
      v17 = [v10 bundleIdentifier];
      id v18 = [(MRDTaskAssertion *)v15 initWithType:3 pid:v16 bundleID:v17 name:@"BrowsableContent playback initiated"];

      [(MRDTaskAssertion *)v18 invalidateInDuration:5.0];
    }
    [v10 relayXPCMessage:v6 andReply:1];
  }
  else
  {
    unsigned int v19 = [(MRDBrowsableContentServer *)self _messageCanLaunchApp:v6];
    if (v7 && v19)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100063694;
      v21[3] = &unk_1004175B8;
      v21[4] = self;
      id v22 = v6;
      id v23 = v7;
      sub_100167D14(v23, 0, v21);
    }
    else
    {
      v20 = _MRLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Warning: could not relay browsable content message. No client found for bundle ID %@.", buf, 0xCu);
      }
    }
  }
}

- (void)_sendInitiatePlaybackMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleID];
  if ((sub_100169F18(v5) & 1) == 0)
  {
    id v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error preparing client %@ for playback initialization.", (uint8_t *)&v15, 0xCu);
    }
  }
  id v7 = +[MRDMediaRemoteServer server];
  id v8 = [v7 clientForBundleIdentifier:v5];

  if (v8)
  {
    [(MRDBrowsableContentServer *)self _takeProcessAssertionForClient:v8 withReason:@"Sending initiatePlaybackMessage"];
    v9 = [v4 indexPathData];
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "MRXPC_MESSAGE_ID_KEY", 0x500000000000006uLL);
    id v11 = [v4 bundleID];
    xpc_dictionary_set_string(v10, "MRXPC_BUNDLE_ID_KEY", (const char *)[v11 UTF8String]);

    unsigned __int8 v12 = v9;
    xpc_dictionary_set_data(v10, "MRXPC_INDEXPATH_DATA_KEY", [v12 bytes], (size_t)[v12 length]);
    id v13 = [v8 connection];
    objc_super v14 = [v13 connection];
    xpc_connection_send_message(v14, v10);

    [(MRDBrowsableContentServer *)self _scheduleEndProcessAssertionForClient:v8];
  }
  else
  {
    unsigned __int8 v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: no client found for bundle ID %@. Dropping initiate playback message.", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_handleBrowsableContentDidFinishLoadingFromClient:(id)a3 indexPath:(id)a4 withError:(id)a5
{
  unint64_t var1 = a4.var1;
  var0 = a4.var0;
  id v8 = a3;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSData) initWithBytes:var0 length:8 * var1];
  uint64_t v19 = kMRMediaRemoteIndexPathDataUserInfoKey;
  id v20 = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  id v12 = [v11 mutableCopy];

  if (v9)
  {
    id v13 = [v9 localizedDescription];
    if (v13) {
      [v12 setObject:v13 forKey:kMRMediaRemoteBrowsableContentErrorLocalizedDescriptionKey];
    }
    objc_super v14 = [v9 domain];
    if (v14)
    {
      [v12 setObject:v14 forKey:kMRMediaRemoteBrowsableContentErrorDomainKey];
      int v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 code]);
      [v12 setObject:v15 forKey:kMRMediaRemoteBrowsableContentErrorCodeKey];
    }
  }
  id v16 = [v8 bundleIdentifier];

  if (v16)
  {
    v17 = [v8 bundleIdentifier];
    [v12 setObject:v17 forKey:kMRMediaRemoteBrowsableContentBundleIdentifierUserInfoKey];
  }
  id v18 = +[MRDMediaRemoteServer server];
  [v18 postClientNotificationNamed:kMRMediaRemoteApplicationFinishedLoadingContentNotification userInfo:v12];
}

- (void)_handleSupportedAPIsDidChangeForClient:(id)a3
{
  id v26 = a3;
  id v4 = [v26 bundleIdentifier];
  id v5 = [(NSMutableArray *)self->_queuedInitiatePlaybackMessages copy];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v33;
    *(void *)&long long v7 = 138412546;
    long long v25 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "bundleID", v25);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          objc_super v14 = _MRLogForCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v38 = v11;
            __int16 v39 = 2112;
            id v40 = v26;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending queued initiate playback message %@ to client %@.", buf, 0x16u);
          }

          [(MRDBrowsableContentServer *)self _sendInitiatePlaybackMessage:v11];
          [(NSMutableArray *)self->_queuedInitiatePlaybackMessages removeObject:v11];
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v8);
  }

  id v15 = [(NSMutableArray *)self->_queuedRelayableMessages copy];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
        id v22 = MRCreateStringFromXPCMessage();
        if ([v22 isEqualToString:v4])
        {
          id v23 = _MRLogForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v38 = v21;
            __int16 v39 = 2112;
            id v40 = v4;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Sending queued relayable message %@ to client %@", buf, 0x16u);
          }

          [(MRDBrowsableContentServer *)self _relayMessage:v21 toClientWithBundleIDAndReply:v4];
          [(NSMutableArray *)self->_queuedRelayableMessages removeObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  v24 = +[MRDMediaRemoteServer server];
  [v24 postClientNotificationNamed:kMRMediaRemoteBrowsableContentAPIChangedNotification userInfo:0];
}

- (BOOL)_takeProcessAssertionForClient:(id)a3 withReason:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v7 = _MRLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 bundleIdentifier];
    int v17 = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Browsable Content Server: Taking process assertion for %@.", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v9 = [MRDTaskAssertion alloc];
  id v10 = [v5 pid];
  id v11 = [v5 bundleIdentifier];
  id v12 = [(MRDTaskAssertion *)v9 initWithType:3 pid:v10 bundleID:v11 name:v6];

  unsigned int v13 = [(MRDTaskAssertion *)v12 isValid];
  if (v13)
  {
    [v5 setCurrentTaskAssertion:v12];
  }
  else
  {
    objc_super v14 = _MRLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v5 bundleIdentifier];
      int v17 = 138412290;
      id v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unable to take task assertion for %@.", (uint8_t *)&v17, 0xCu);
    }
  }

  return v13;
}

- (void)_scheduleEndProcessAssertionForClient:(id)a3
{
  id v3 = [a3 currentTaskAssertion];
  [v3 invalidateInDuration:10.0];
}

- (BOOL)_messageCanLaunchApp:(id)a3
{
  return (xpc_dictionary_get_uint64(a3, "MRXPC_MESSAGE_ID_KEY") & 0x500000000000000) != 0;
}

- (BOOL)_messageRequiresMediaServerBlessing:(id)a3
{
  return xpc_dictionary_get_uint64(a3, "MRXPC_MESSAGE_ID_KEY") == 0x500000000000006;
}

- (MRDBrowsableContentAPICoordinator)apiCoordinator
{
  return self->_apiCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiCoordinator, 0);
  objc_storeStrong((id *)&self->_queuedBeginLoadingBlocks, 0);
  objc_storeStrong((id *)&self->_queuedRelayableMessages, 0);

  objc_storeStrong((id *)&self->_queuedInitiatePlaybackMessages, 0);
}

@end