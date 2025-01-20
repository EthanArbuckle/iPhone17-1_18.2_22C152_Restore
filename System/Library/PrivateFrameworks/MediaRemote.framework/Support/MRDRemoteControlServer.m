@interface MRDRemoteControlServer
- (BOOL)_applicationIsRunning:(id)a3;
- (BOOL)_checkAndMaybeUpdateNowPlayingAppStackPopRateLimitingWithInterval:(double)a3;
- (BOOL)_clearQueuedCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4;
- (BOOL)_isCommandCacheCreating:(unsigned int)a3;
- (BOOL)_isCommandCacheable:(unsigned int)a3;
- (MRDCommandClientRestriction)commandClientsRestriction;
- (MRDRemoteControlServer)init;
- (NSArray)remoteControlClients;
- (NSMutableDictionary)applicationConnections;
- (id)_attributedCommand:(id)a3 forClient:(id)a4;
- (id)_contextuallyAwareDestinationAppDisplayIDForCommand:(id)a3;
- (id)_createBroadcastCommandPlayerPathForClient:(id)a3;
- (id)_createBroadcastCommandResponseFromStatuses:(id)a3 forClient:(id)a4;
- (id)_destinationClientForRemoteControlCommand:(id)a3;
- (id)_effectiveContextIDForCommand:(id)a3;
- (id)_enqueuedCommandsForDisplayID:(id)a3;
- (id)_onQueue_createAndActivateConnection:(id)a3 forClient:(id)a4;
- (id)_onQueue_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7;
- (id)_persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:(id)a3 forClient:(id)a4 error:(id *)a5;
- (id)_populateApplicationSpecificDataForPrepareForSetQueueCommand:(id)a3 forClient:(id)a4;
- (id)_remoteControlContextForCommand:(id)a3;
- (id)_resolveCommandBeforeSend:(id)a3 toClient:(id)a4 error:(id *)a5;
- (id)_resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:(id)a3;
- (void)_cleanUpPersistedSessionForSessionPreloadCommand:(id)a3;
- (void)_clearAllQueuedCommandsForReason:(id)a3;
- (void)_clientDidConnectNotification:(id)a3;
- (void)_enqueueCommand:(id)a3 forApplication:(id)a4 withCompletion:(id)a5;
- (void)_enqueueCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4;
- (void)_forwardCommand:(id)a3 completion:(id)a4;
- (void)_handleApplicationConnectionDidInvalidateNotification:(id)a3;
- (void)_handleBroadcastCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCloseApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleDismissMediaControlsCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleGetPendingCommandsMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3;
- (void)_handlePresentMediaControlsCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handlePrewarmMediaControlsCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleRestrictCommandClientsMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendApplicationConnectionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendCommandMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4;
- (void)_handleSendPlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4;
- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4;
- (void)_performCommandProcessingAfterSend:(id)a3;
- (void)_sendExternalCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendLocalCommand:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendQueuedCommandsForDestinationClient:(id)a3;
- (void)_sendRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withCompletion:(id)a5;
- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withLegacyCompletion:(id)a5;
- (void)_shouldIgnoreCommand:(id)a3 completion:(id)a4;
- (void)broadcastRemoteControlCommand:(id)a3;
- (void)broadcastRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)clearContextsForClient:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)handleClientBoundApplicationConnectionMessage:(id)a3;
- (void)handleInvalidateApplicationConnectionMessage:(id)a3;
- (void)handleServerBoundApplicationConnectionMessage:(id)a3;
- (void)handleXPCMessage:(id)a3 fromClient:(id)a4;
- (void)phoneCallObserver:(id)a3 callDidChange:(id)a4;
- (void)registerIncomingApplicationConnection:(id)a3 clientBoundMessageHandler:(id)a4 completion:(id)a5;
- (void)sendRemoteControlCommand:(id)a3;
- (void)sendRemoteControlCommand:(id)a3 completion:(id)a4;
- (void)sendRemoteControlCommand:(id)a3 toClients:(id)a4 completion:(id)a5;
- (void)setCommandClientsRestriction:(id)a3;
@end

@implementation MRDRemoteControlServer

- (void)_sendQueuedCommandsForDestinationClient:(id)a3
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100026230;
  v27 = sub_100026240;
  id v28 = 0;
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_1000063DC;
  v19 = &unk_100416870;
  id v4 = a3;
  id v20 = v4;
  v21 = self;
  v22 = &v23;
  msv_dispatch_sync_on_queue();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)v24[5];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        kdebug_trace();
        v10 = _MRLogForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v30 = v9;
          __int16 v31 = 2114;
          id v32 = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending previously queued command %{public}@ to client %{public}@.", buf, 0x16u);
        }

        v11 = [v9 _completionHandler];
        [(MRDRemoteControlServer *)self _sendRemoteControlCommand:v9 toDestinationClient:v4 withCompletion:v11];
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v33 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)_clientDidConnectNotification:(id)a3
{
  id v4 = [a3 object];
  [(MRDRemoteControlServer *)self _sendQueuedCommandsForDestinationClient:v4];
}

- (MRDRemoteControlServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)MRDRemoteControlServer;
  v2 = [(MRDRemoteControlServer *)&v22 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mediaremote.MRDRemoteControlServer", v3);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandQueuesForDisplayIDs = v2->_commandQueuesForDisplayIDs;
    v2->_commandQueuesForDisplayIDs = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    remoteControlContexts = v2->_remoteControlContexts;
    v2->_remoteControlContexts = v8;

    uint64_t v10 = +[NSMutableDictionary dictionary];
    redirectionCache = v2->_redirectionCache;
    v2->_redirectionCache = (NSMutableDictionary *)v10;

    long long v12 = objc_alloc_init(MRDPhoneCallObserver);
    callObserver = v2->_callObserver;
    v2->_callObserver = v12;

    [(MRDPhoneCallObserver *)v2->_callObserver setDelegate:v2];
    long long v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.mediaremote.MRDMediaRemoteUIService", v15);
    remoteAlertWorkerQueue = v2->_remoteAlertWorkerQueue;
    v2->_remoteAlertWorkerQueue = (OS_dispatch_queue *)v16;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_clientDidConnectNotification:" name:@"MRDMediaRemoteClientDidConnect" object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_handlePlayerIsPlayingDidChangeNotification:" name:kMRMediaRemotePlayerIsPlayingDidChangeNotification object:0];

    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"_handleApplicationConnectionDidInvalidateNotification:" name:@"MRDApplicationConnectionDidInvalidateNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (notify_is_valid_token(self->_fadeOutNotificationToken)) {
    notify_cancel(self->_fadeOutNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)MRDRemoteControlServer;
  [(MRDRemoteControlServer *)&v4 dealloc];
}

- (void)sendRemoteControlCommand:(id)a3
{
}

- (void)sendRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  if ([v6 isAVRCPCommand])
  {
    if ([(MRDPhoneCallObserver *)self->_callObserver callControllerWillHandleCommandForBargeCalls:v6])
    {
      id v8 = [objc_alloc((Class)MRCommandResult) initWithHandlerStatuses:&off_100438578 sendError:0];
      v9 = _MRLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Yielding AVRCP command to bargeCallHandler", buf, 2u);
      }

      if (v7) {
        v7[2](v7, v8);
      }
    }
    else
    {
      qos_class_t v10 = qos_class_self();
      callObserver = self->_callObserver;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000256F8;
      v12[3] = &unk_100416208;
      long long v15 = v7;
      qos_class_t v16 = v10;
      id v13 = v6;
      long long v14 = self;
      [(MRDPhoneCallObserver *)callObserver handleMediaRemoteCommand:v13 completion:v12];
    }
  }
  else
  {
    [(MRDRemoteControlServer *)self _sendRemoteControlCommand:v6 completion:v7];
  }
}

- (void)_sendRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  v9 = [v6 commandID];
  qos_class_t v10 = (char *)[v9 hash];

  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "SendCommandDaemon", "", (uint8_t *)&buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100025CA0;
  v24[3] = &unk_100416258;
  id v11 = v6;
  id v25 = v11;
  v26 = self;
  id v12 = v7;
  id v27 = v12;
  id v13 = objc_retainBlock(v24);
  id v14 = [v11 mutableCopy];
  if (-[MRDRemoteControlServer _isCommandCacheCreating:](self, "_isCommandCacheCreating:", [v11 commandType]))
  {
    long long v15 = [(MRDRemoteControlServer *)self _effectiveContextIDForCommand:v11];
    if (v15)
    {
      qos_class_t v16 = _MRLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Got a cache creating command from assistant, context: %{public}@.", (uint8_t *)&buf, 0xCu);
      }

      id v23 = v15;
      msv_dispatch_sync_on_queue();
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  if (-[MRDRemoteControlServer _isCommandCacheable:](self, "_isCommandCacheable:", [v11 commandType]))
  {
    uint64_t v17 = [(MRDRemoteControlServer *)self _effectiveContextIDForCommand:v11];
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
      id v20 = v11;
      id v22 = v12;
      id v21 = v14;
      msv_dispatch_sync_on_queue();
    }
  }
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    [(MRDRemoteControlServer *)self _forwardCommand:v14 completion:v13];
  }
  _Block_object_dispose(&buf, 8);
}

- (void)broadcastRemoteControlCommand:(id)a3
{
}

- (void)broadcastRemoteControlCommand:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, uint64_t, void))a4;
  id v7 = [v11 playerPath];
  id v8 = [v7 origin];
  unsigned int v9 = [v8 isLocal];

  if (v9)
  {
    qos_class_t v10 = [(MRDRemoteControlServer *)self remoteControlClients];
    [(MRDRemoteControlServer *)self sendRemoteControlCommand:v11 toClients:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 3, 0);
  }
}

- (void)sendRemoteControlCommand:(id)a3 toClients:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100026A6C;
  v19[3] = &unk_1004162D0;
  id v20 = a5;
  id v10 = v20;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100026B58;
  v14[3] = &unk_100416398;
  id v15 = v8;
  id v16 = v9;
  uint64_t v17 = self;
  v18 = objc_retainBlock(v19);
  id v11 = v9;
  id v12 = v18;
  id v13 = v8;
  [(MRDRemoteControlServer *)self _shouldIgnoreCommand:v13 completion:v14];
}

- (void)clearContextsForClient:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  msv_dispatch_sync_on_queue();
}

- (NSArray)remoteControlClients
{
  v2 = +[MRDMediaRemoteServer server];
  id v3 = [v2 allClients];

  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "canBeNowPlaying", (void)v12)) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return (NSArray *)v4;
}

- (void)registerIncomingApplicationConnection:(id)a3 clientBoundMessageHandler:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002790C;
  v15[3] = &unk_100416438;
  id v16 = v8;
  uint64_t v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v15);
}

- (void)handleClientBoundApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027D48;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v7);
}

- (void)handleServerBoundApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027E7C;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v7);
}

- (void)handleInvalidateApplicationConnectionMessage:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027FB0;
  v7[3] = &unk_1004158D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v7);
}

- (void)handleXPCMessage:(id)a3 fromClient:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  switch(xpc_dictionary_get_uint64(xdict, "MRXPC_MESSAGE_ID_KEY"))
  {
    case 0x400000000000001uLL:
      [(MRDRemoteControlServer *)self _handleSendCommandMessage:xdict fromClient:v6];
      break;
    case 0x400000000000002uLL:
      [(MRDRemoteControlServer *)self _handleBroadcastCommandMessage:xdict fromClient:v6];
      break;
    case 0x400000000000003uLL:
      [(MRDRemoteControlServer *)self _handlePrewarmMediaControlsCommandMessage:xdict fromClient:v6];
      break;
    case 0x400000000000004uLL:
      [(MRDRemoteControlServer *)self _handlePresentMediaControlsCommandMessage:xdict fromClient:v6];
      break;
    case 0x400000000000005uLL:
      [(MRDRemoteControlServer *)self _handleDismissMediaControlsCommandMessage:xdict fromClient:v6];
      break;
    case 0x400000000000006uLL:
      [(MRDRemoteControlServer *)self _handleGetPendingCommandsMessage:xdict fromClient:v6];
      break;
    case 0x400000000000007uLL:
      [(MRDRemoteControlServer *)self _handleSendPlaybackSessionMessage:xdict fromClient:v6];
      break;
    case 0x400000000000008uLL:
      [(MRDRemoteControlServer *)self _handleSendPlaybackSessionMigrateBeginMessage:xdict fromClient:v6];
      break;
    case 0x400000000000009uLL:
      [(MRDRemoteControlServer *)self _handleSendPlaybackSessionMigrateEndMessage:xdict fromClient:v6];
      break;
    case 0x40000000000000AuLL:
      [(MRDRemoteControlServer *)self _handleTriggerAudioFadeMessage:xdict fromClient:v6];
      break;
    case 0x40000000000000DuLL:
      [(MRDRemoteControlServer *)self _handleRestrictCommandClientsMessage:xdict fromClient:v6];
      break;
    case 0x40000000000000EuLL:
      [(MRDRemoteControlServer *)self _handleCreateApplicationConnectionMessage:xdict fromClient:v6];
      break;
    case 0x40000000000000FuLL:
      [(MRDRemoteControlServer *)self _handleSendApplicationConnectionMessage:xdict fromClient:v6];
      break;
    case 0x400000000000010uLL:
      [(MRDRemoteControlServer *)self _handleCloseApplicationConnectionMessage:xdict fromClient:v6];
      break;
    default:
      break;
  }
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000282E0;
  v7[3] = &unk_1004158D8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (void)_handleSendCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = sub_100028558(v6, v7);
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received command from client %{public}@: %{public}@", buf, 0x16u);
  }

  id v10 = _MRLogForCategory();
  id v11 = [v8 commandID];
  id v12 = (char *)[v11 hash];

  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v12, "SendCommandXPCToDaemon", "", buf, 2u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100028790;
  v15[3] = &unk_100416460;
  id v16 = v6;
  id v17 = v8;
  id v13 = v8;
  id v14 = v6;
  [(MRDRemoteControlServer *)self sendRemoteControlCommand:v13 completion:v15];
}

- (void)_handleBroadcastCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100028558(v6, v7);
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v14 = v7;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received broadcast command from client %{public}@: %{public}@", buf, 0x16u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028A10;
  v11[3] = &unk_1004164C8;
  id v12 = v6;
  id v10 = v6;
  [(MRDRemoteControlServer *)self broadcastRemoteControlCommand:v8 completion:v11];
}

- (void)_handlePrewarmMediaControlsCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)MRCreateDataFromXPCMessage();
  id v9 = xpc_dictionary_get_value(v7, "MRXPC_MEDIA_CONTROLS_XPC_ENDPOINT_KEY");

  remoteAlertWorkerQueue = self->_remoteAlertWorkerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028BF8;
  block[3] = &unk_1004159B8;
  id v15 = v6;
  id v16 = v8;
  id v17 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v6;
  dispatch_async((dispatch_queue_t)remoteAlertWorkerQueue, block);
}

- (void)_handlePresentMediaControlsCommandMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _MRLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 displayName];
    *(_DWORD *)long long buf = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Presenting remoteUIService for client: %@", buf, 0xCu);
  }
  remoteAlertWorkerQueue = self->_remoteAlertWorkerQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100028ED0;
  v13[3] = &unk_1004158D8;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async((dispatch_queue_t)remoteAlertWorkerQueue, v13);
}

- (void)_handleDismissMediaControlsCommandMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 displayName];
    *(_DWORD *)long long buf = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Destroying remoteUIService for client: %@", buf, 0xCu);
  }
  remoteAlertWorkerQueue = self->_remoteAlertWorkerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100029150;
  block[3] = &unk_100415CC8;
  id v11 = v5;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)remoteAlertWorkerQueue, block);
}

- (void)_handleGetPendingCommandsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  MRCreatePlayerPathFromXPCMessage();
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002922C;
  v10[3] = &unk_1004164F0;
  v10[4] = self;
  id v11 = v6;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v12;
  id v9 = v6;
  sub_100014324(v7, v10);
}

- (void)_handleSendPlaybackSessionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MRDMediaRemoteServer server];
  id v9 = [v8 nowPlayingServer];
  id v10 = [v9 queryExistingPlayerPathForXPCMessage:v6 forClient:v7];

  id v11 = [v10 unresolvedPlayerPath];
  id v12 = [v11 client];
  id v13 = [v12 bundleIdentifier];

  id v14 = +[MRUserSettings currentSettings];
  [v14 launchApplicationTimeoutInterval];
  double v16 = v15;

  id v17 = [v10 playerPath];
  id v18 = [v17 origin];
  unsigned __int8 v19 = [v18 isLocal];

  if (v19)
  {
    if (v13)
    {
      serialQueue = self->_serialQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100029818;
      block[3] = &unk_1004158D8;
      void block[4] = self;
      id v21 = v13;
      id v31 = v21;
      dispatch_async((dispatch_queue_t)serialQueue, block);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10002988C;
      v25[3] = &unk_100416518;
      id v26 = v6;
      id v27 = v7;
      id v28 = self;
      id v29 = v21;
      sub_1001693F4(v29, 0, v25, v16);

      id v22 = v31;
LABEL_8:

      goto LABEL_9;
    }
    sub_100014324(v6, &stru_100416558);
  }
  else
  {
    id v23 = [v10 xpcClient];

    if (!v23)
    {
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000297C0;
      v32[3] = &unk_100415DC8;
      id v33 = v10;
      sub_100014324(v6, v32);
      id v22 = v33;
      goto LABEL_8;
    }
    v24 = [v10 xpcClient];
    [v24 relayXPCMessage:v6 andReply:1];
  }
LABEL_9:
}

- (void)_handleSendPlaybackSessionMigrateBeginMessage:(id)a3 fromClient:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[MRDMediaRemoteServer server];
  id v8 = [v7 nowPlayingServer];
  id v13 = [v8 queryExistingPlayerPathForXPCMessage:v6 forClient:v5];

  id v9 = MRCreateProtobufFromXPCMessage();
  id v10 = [v9 request];
  id v11 = [v9 playerPath];
  [v5 addPendingPlaybackSessionMigrateEvent:v10 playerPath:v11];

  id v12 = [v13 xpcClient];
  [v12 relayXPCMessage:v6 andReply:1];
}

- (void)_handleSendPlaybackSessionMigrateEndMessage:(id)a3 fromClient:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  id v6 = +[MRDMediaRemoteServer server];
  id v7 = [v6 nowPlayingServer];
  id v8 = [v7 queryExistingPlayerPathForXPCMessage:v13 forClient:v5];

  id v9 = MRCreateProtobufFromXPCMessage();
  id v10 = [v9 request];
  unsigned int v11 = [v5 removePendingPlaybackSessionMigrateEvent:v10];

  if (v11)
  {
    id v12 = [v8 xpcClient];
    [v12 relayXPCMessage:v13 andReply:1];
  }
  else
  {
    sub_100014324(v13, 0);
  }
}

- (void)_handleTriggerAudioFadeMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[MRDMediaRemoteServer server];
  id v9 = [v8 nowPlayingServer];
  id v10 = [v9 queryExistingPlayerPathForXPCMessage:v6 forClient:v7];

  unsigned int v11 = [v10 playerPath];
  id v12 = [v11 origin];
  unsigned __int8 v13 = [v12 isLocal];

  if (v13)
  {
    id v14 = MRCreateProtobufFromXPCMessage();
    if ([v14 fadeType])
    {
      double v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = [v10 playerPath];
        id v17 = [v16 client];
        id v18 = [v17 bundleIdentifier];
        *(_DWORD *)long long buf = 138477827;
        v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Requesting fade in on next playback for client %{private}@", buf, 0xCu);
      }
      unsigned __int8 v19 = +[AVSystemController sharedAVSystemController];
      __int16 v20 = [v10 playerPath];
      id v21 = [v20 client];
      id v22 = [v21 bundleIdentifier];
      [v19 setAttribute:v22 forKey:AVSystemController_AllowAppToFadeInTemporarilyAttribute error:0];

      sub_100014324(v6, &stru_100416630);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      id v25 = objc_alloc((Class)MRBlockGuard);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10002A3B0;
      v39[3] = &unk_1004165A0;
      objc_copyWeak(&v41, (id *)buf);
      id v26 = v6;
      id v40 = v26;
      id v27 = [v25 initWithTimeout:@"Did not receive fade out notification" reason:v39 handler:1.0];
      serialQueue = self->_serialQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10002A498;
      handler[3] = &unk_100416610;
      id v29 = v27;
      id v36 = v29;
      objc_copyWeak(&v38, (id *)buf);
      id v37 = v26;
      notify_register_dispatch("com.apple.mediaexperience.fadeoutappliedforplaybackhandoff", &self->_fadeOutNotificationToken, (dispatch_queue_t)serialQueue, handler);
      char v30 = +[MRUserSettings currentSettings];
      LODWORD(v26) = [v30 supportMultiplayerHost];

      if (v26)
      {
        id v31 = [v10 playerPath];
        id v32 = [v31 player];

        id v33 = +[AVSystemController sharedAVSystemController];
        v34 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v32 audioSessionID]);
        [v33 setAttribute:v34 forKey:AVSystemController_InterruptAudioSessionIDForHandoff error:0];
      }
      else
      {
        id v32 = +[AVSystemController sharedAVSystemController];
        [v32 setAttribute:0 forKey:AVSystemController_AppToInterruptCurrentNowPlayingSessionAttribute error:0];
      }

      objc_destroyWeak(&v38);
      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    id v23 = [v10 xpcClient];

    if (v23)
    {
      xpc_dictionary_set_uint64(v6, "MRXPC_MESSAGE_ID_KEY", 0x70000000000000AuLL);
      v24 = [v10 xpcClient];
      [v24 relayXPCMessage:v6 andReply:1];
    }
  }
}

- (void)_handleRestrictCommandClientsMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 entitlements] & 0x800) == 0)
  {
    id v8 = _MRLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10032AAC0(v8);
    }

    sub_1001679D8(v6, 3u);
  }
  id v9 = (void *)MRCreateDataFromXPCMessage();
  id v10 = MRCreateArrayFromData();
  *(void *)&long long v11 = -1;
  *((void *)&v11 + 1) = -1;
  *(_OWORD *)long long buf = v11;
  *(_OWORD *)&uint8_t buf[16] = v11;
  id v12 = +[NSData dataWithBytes:buf length:32];
  memset(buf, 0, sizeof(buf));
  unsigned __int8 v13 = +[NSData dataWithBytes:buf length:32];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002AAFC;
  v29[3] = &unk_100416698;
  id v14 = v12;
  id v30 = v14;
  id v15 = v13;
  id v31 = v15;
  uint64_t v16 = objc_msgSend(v10, "msv_filter:", v29);
  id v17 = (void *)v16;
  id v18 = &__NSArray0__struct;
  if (v16) {
    id v18 = (void *)v16;
  }
  id v19 = v18;

  __int16 v20 = +[NSSet setWithArray:v19];

  id v21 = [v20 count];
  id v22 = [(MRDRemoteControlServer *)self commandClientsRestriction];
  if (v21)
  {
    id v23 = +[MRDCommandClientRestriction restrictedTo:v20 by:v7];
    [(MRDRemoteControlServer *)self setCommandClientsRestriction:v23];

    v24 = _MRLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [(MRDRemoteControlServer *)self commandClientsRestriction];
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[RestrictedCommandClients Mode] %@ requested to enable restrictions: %@. Previous state: %@", buf, 0x20u);
    }
  }
  else
  {
    [(MRDRemoteControlServer *)self setCommandClientsRestriction:0];
    v24 = _MRLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[RestrictedCommandClients Mode] %@ requested to disable restriction. Previous state: %@", buf, 0x16u);
    }
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002AB50;
  v27[3] = &unk_100415DC8;
  id v28 = v20;
  id v26 = v20;
  sub_100014324(v6, v27);
}

- (void)_handleCreateApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MRCreateProtobufFromXPCMessage();
  id v9 = [v8 context];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100026230;
  v18[4] = sub_100026240;
  id v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002ADB8;
  block[3] = &unk_1004166E0;
  id v17 = v18;
  void block[4] = self;
  id v11 = v9;
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, block);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10002AE08;
  v13[3] = &unk_100416708;
  void v13[4] = v18;
  sub_100014324(v6, v13);

  _Block_object_dispose(v18, 8);
}

- (void)_handleCloseApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v5 = MRCreateProtobufFromXPCMessage();
  id v6 = [v5 context];
  id v7 = [v5 error];
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AF5C;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, block);
}

- (void)_handleSendApplicationConnectionMessage:(id)a3 fromClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MRCreateProtobufFromXPCMessage();
  id v9 = [v8 context];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100026230;
  id v33 = sub_100026240;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_100026230;
  id v27 = sub_100026240;
  id v28 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B2AC;
  block[3] = &unk_100416730;
  id v22 = &v29;
  void block[4] = self;
  id v11 = v9;
  id v21 = v11;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, block);
  id v12 = (void *)v30[5];
  if (v12)
  {
    id v13 = [v12 type];
    id v14 = (void *)v30[5];
    if (v13 == (id)1) {
      [v14 handleClientBoundMessage:v8];
    }
    else {
      [v14 handleServerBoundMessage:v8];
    }
  }
  else
  {
    id v15 = _MRLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = [v11 identifier];
      sub_10032AB04(v16, buf, v15);
    }

    id v17 = [objc_alloc((Class)NSError) initWithMRError:1];
    id v18 = (void *)v24[5];
    v24[5] = (uint64_t)v17;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002B330;
  v19[3] = &unk_100416708;
  void v19[4] = &v23;
  sub_100014324(v6, v19);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

- (id)_onQueue_createAndActivateConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id v8 = [v6 destinationPlayerPath];
  id v9 = +[MRDMediaRemoteServer server];
  uint64_t v10 = [v9 nowPlayingServer];
  id v36 = v8;
  id v11 = [v8 origin];
  id v12 = [(id)v10 originClientForOrigin:v11];

  id v13 = [v6 destinationPlayerPath];
  LOBYTE(v10) = [v13 isResolved];

  if (v10) {
    goto LABEL_7;
  }
  id v14 = [v6 destinationPlayerPath];
  unsigned int v15 = [v14 isSystemMediaApplication];

  if (v15)
  {
    id v16 = objc_alloc((Class)MRClient);
    id v17 = [v12 deviceInfo];
    uint64_t v18 = [v17 systemMediaApplication];
  }
  else
  {
    id v19 = [v6 destinationPlayerPath];
    unsigned int v20 = [v19 isSystemPodcastsApplication];

    if (!v20) {
      goto LABEL_7;
    }
    id v16 = objc_alloc((Class)MRClient);
    id v17 = [v12 deviceInfo];
    uint64_t v18 = [v17 systemPodcastApplication];
  }
  id v21 = (void *)v18;
  id v22 = [v16 initWithBundleIdentifier:v18];
  uint64_t v23 = [v6 destinationPlayerPath];
  [v23 setClient:v22];

LABEL_7:
  id v24 = objc_alloc((Class)MRApplicationConnectionRequestInfo);
  uint64_t v25 = +[MRDMediaRemoteServer server];
  id v26 = [v25 deviceInfo];
  id v27 = [v7 createNowPlayingClient];
  id v28 = [v24 initWithDeviceInfo:v26 client:v27];

  uint64_t v29 = [v12 createNewApplicationConnectionCallback];
  if (v29)
  {
    id v30 = [[MRDApplicationConnection alloc] initWithContext:v6];
    objc_initWeak(&location, v7);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10002B7A4;
    v41[3] = &unk_100416758;
    objc_copyWeak(&v42, &location);
    [(MRDApplicationConnection *)v30 setClientBoundMessageHandler:v41];
    uint64_t v31 = [(MRDRemoteControlServer *)self applicationConnections];
    id v32 = [v6 identifier];
    [v31 setObject:v30 forKeyedSubscript:v32];

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002B88C;
    v37[3] = &unk_1004167A8;
    v37[4] = self;
    id v38 = v6;
    id v39 = v7;
    id v33 = v30;
    id v40 = v33;
    ((void (**)(void, MRDApplicationConnection *, id, void *))v29)[2](v29, v33, v28, v37);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    id v34 = 0;
  }
  else
  {
    id v34 = [objc_alloc((Class)NSError) initWithMRError:14];
  }

  return v34;
}

- (void)_handlePlayerIsPlayingDidChangeNotification:(id)a3
{
  id v12 = a3;
  id v4 = [v12 userInfo];
  id v5 = MRGetOriginFromUserInfo();

  if ([v5 isLocal])
  {
    id v6 = [v12 userInfo];
    id v7 = [v6 objectForKeyedSubscript:kMRMediaRemoteNowPlayingApplicationIsPlayingUserInfoKey];
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      id v9 = [v12 userInfo];
      uint64_t v10 = MRGetPlayerPathFromUserInfo();

      id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@ started playback", v10];
      [(MRDRemoteControlServer *)self _clearAllQueuedCommandsForReason:v11];
    }
  }
}

- (void)_handleApplicationConnectionDidInvalidateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [v4 userInfo];

  id v7 = [v6 objectForKeyedSubscript:@"MRDApplicationConnectionInvalidationReasonKey"];

  unsigned int v8 = [v5 identifier];
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    unsigned int v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[MRDRemoteControlServer] applicationConnectionDidInvalidate - connection: %@, reason: %@", buf, 0x16u);
  }

  serialQueue = self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002BD40;
  v12[3] = &unk_1004158D8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  dispatch_async_and_wait((dispatch_queue_t)serialQueue, v12);
}

- (void)phoneCallObserver:(id)a3 callDidChange:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002BE0C;
  v4[3] = &unk_1004167D0;
  v4[4] = self;
  objc_msgSend(a3, "numberOfActivePhoneCalls:", v4, a4);
}

- (void)_forwardCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 playerPath];
  unsigned int v8 = [v7 origin];
  if ([v8 isLocal])
  {
    id v9 = +[MRUserSettings currentSettings];
    unsigned __int8 v10 = [v9 supportMultiplayerHost];

    id v11 = v12;
    if ((v10 & 1) == 0)
    {
      [(MRDRemoteControlServer *)self _sendLocalCommand:v12 withCompletionHandler:v6];
      goto LABEL_6;
    }
  }
  else
  {

    id v11 = v12;
  }
  [(MRDRemoteControlServer *)self _sendExternalCommand:v11 withCompletionHandler:v6];
LABEL_6:
}

- (void)_sendLocalCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v7 commandType];
  id v9 = +[MRDMediaRemoteServer server];
  id v10 = [v7 mutableCopy];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002C020;
  v14[3] = &unk_1004167F8;
  unsigned int v19 = v8;
  id v15 = v10;
  id v16 = v9;
  id v17 = self;
  id v18 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v10;
  [(MRDRemoteControlServer *)self _shouldIgnoreCommand:v13 completion:v14];
}

- (void)_sendExternalCommand:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned int v8 = +[MRDMediaRemoteServer server];
  id v9 = [v6 playerPath];
  id v10 = [v9 origin];
  id v11 = [v8 clientWithRegisteredCustomOrigin:v10];
  if (v11)
  {
    [(MRDRemoteControlServer *)self _sendRemoteControlCommand:v6 toDestinationClient:v11 withCompletion:v7];
  }
  else
  {
    id v12 = _MRLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      id v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "The client that registered the custom origin %{public}@ no longer exists, so this command will be ignored.", (uint8_t *)&v14, 0xCu);
    }

    if (v7)
    {
      id v13 = +[MRCommandResult commandResultWithSendError:6];
      v7[2](v7, v13);
    }
  }
}

- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withLegacyCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C6B4;
  v9[3] = &unk_100416820;
  id v10 = a5;
  id v8 = v10;
  [(MRDRemoteControlServer *)self _sendRemoteControlCommand:a3 toDestinationClient:a4 withCompletion:v9];
}

- (void)_sendRemoteControlCommand:(id)a3 toDestinationClient:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)MRBlockGuard);
  id v12 = [v8 commandID];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002C92C;
  v28[3] = &unk_100415FA8;
  id v13 = v10;
  id v29 = v13;
  id v14 = [v11 initWithTimeout:v12 reason:v28 handler:0.0];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002C998;
  v25[3] = &unk_100416848;
  id v26 = v14;
  id v27 = v13;
  id v15 = v13;
  id v16 = v14;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002CA00;
  v20[3] = &unk_100416398;
  id v21 = v8;
  id v22 = self;
  id v23 = v9;
  id v24 = objc_retainBlock(v25);
  id v17 = v9;
  id v18 = v24;
  id v19 = v8;
  [(MRDRemoteControlServer *)self _shouldIgnoreCommand:v19 completion:v20];
}

- (void)_enqueueCommand:(id)a3 forApplication:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v8 _setCompletionHandler:v10];
  [(MRDRemoteControlServer *)self _enqueueCommand:v8 forUnavailableApplicationWithDisplayID:v9];
  id v11 = _MRLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v34 = v9;
    __int16 v35 = 2114;
    id v36 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Destination app %{public}@ not available for command %{public}@, and command requested a launch. Enqueueing command for later execution.", buf, 0x16u);
  }

  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = sub_10002DD04;
  id v28 = &unk_100415990;
  id v29 = self;
  id v30 = v8;
  id v31 = v9;
  id v32 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = objc_retainBlock(&v25);
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  id v17 = [v14 commandID];
  [v16 setObject:v17 forKeyedSubscript:kMRMediaRemoteOptionCommandID];

  id v18 = [v14 senderID];
  [v16 setObject:v18 forKeyedSubscript:kMRMediaRemoteOptionSenderID];

  id v19 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 appOptions]);
  [v16 setObject:v19 forKeyedSubscript:kMRMediaRemoteOptionSendOptionsNumber];

  unsigned int v20 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v14 commandType]);
  [v16 setObject:v20 forKeyedSubscript:kMRMediaRemoteOptionCommandType];

  id v21 = objc_alloc((Class)NSString);
  [v14 commandType];
  id v22 = (void *)MRMediaRemoteCopyCommandDescription();
  id v23 = [v14 commandID];
  id v24 = [v21 initWithFormat:@"command<%@>=%@", v22, v23, v25, v26, v27, v28, v29];

  sub_100167FD0(v13, v24, v16, v15);
}

- (void)_enqueueCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4
{
  id v26 = a4;
  id v5 = a3;
  kdebug_trace();
  id v6 = [v5 mutableCopy];
  id v7 = objc_alloc((Class)MRPlayerPath);
  id v8 = [v5 playerPath];
  id v9 = [v8 origin];
  id v10 = objc_alloc((Class)MRClient);
  id v11 = [v5 playerPath];
  id v12 = [v11 client];
  id v13 = [v12 bundleIdentifier];
  id v14 = [v10 initWithBundleIdentifier:v13];
  id v15 = [v5 unresolvedPlayerPath];

  id v16 = [v15 player];
  id v17 = [v7 initWithOrigin:v9 client:v14 player:v16];
  [v6 setPlayerPath:v17];

  id v30 = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472;
  id v32 = sub_10002E508;
  id v33 = &unk_1004159B8;
  id v34 = self;
  id v35 = v26;
  id v36 = v6;
  msv_dispatch_sync_on_queue();
  id v18 = +[MRUserSettings currentSettings];
  [v18 queuedCommandsTimeoutInterval];
  double v20 = v19;

  dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E588;
  block[3] = &unk_1004159B8;
  void block[4] = self;
  id v28 = v35;
  id v29 = v36;
  id v23 = v36;
  id v24 = v35;
  dispatch_after(v21, (dispatch_queue_t)serialQueue, block);
}

- (BOOL)_clearQueuedCommand:(id)a3 forUnavailableApplicationWithDisplayID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  serialQueue = self->_serialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E87C;
  v12[3] = &unk_100416960;
  void v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync((dispatch_queue_t)serialQueue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)_clearAllQueuedCommandsForReason:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002E98C;
  v7[3] = &unk_1004158D8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, v7);
}

- (id)_enqueuedCommandsForDisplayID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_100026230;
  uint64_t v16 = sub_100026240;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EDC4;
  block[3] = &unk_100416730;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:(id)a3
{
  id v4 = a3;
  id v5 = [v4 destinationAppDisplayID];
  if (([v5 isEqualToString:kMRMediaRemoteSystemMediaApplicationDisplayIdentifier] & 1) != 0
    || [v5 isEqualToString:@"com.apple.Fuse"])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    goto LABEL_4;
  }
  if ([v5 isEqualToString:kMRMediaRemoteSystemPodcastApplicationDisplayIdentifier])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_4;
  }
  if ([v5 isEqualToString:kMRMediaRemoteSystemBooksApplicationDisplayIdentifier])
  {
    uint64_t v6 = MRMediaRemoteCopyLocalDeviceSystemBooksApplicationDisplayID();
    goto LABEL_4;
  }
  if ([v4 isContextSensitive])
  {
    uint64_t v6 = [(MRDRemoteControlServer *)self _contextuallyAwareDestinationAppDisplayIDForCommand:v4];
LABEL_4:
    id v7 = (id)v6;
    if (v6) {
      goto LABEL_6;
    }
  }
  id v7 = v5;
LABEL_6:
  if ([v7 isEqualToString:@"com.apple.mediaremoted"])
  {
    id v8 = v5;

    id v7 = v8;
  }

  return v7;
}

- (id)_destinationClientForRemoteControlCommand:(id)a3
{
  id v4 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  id v6 = [v4 destinationAppProcessID];
  uint64_t v7 = [(MRDRemoteControlServer *)self _resolvedLocalDeviceDestinationAppDisplayIdentifierForCommand:v4];
  id v8 = (void *)v7;
  if (v6)
  {
    if (!v7
      || ([v4 destinationAppDisplayID],
          id v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v8 isEqualToString:v9],
          v9,
          v10))
    {
      uint64_t v11 = [v5 clientForPID:v6];
LABEL_7:
      uint64_t v12 = (void *)v11;
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v11 = [v5 clientForBundleIdentifier:v8];
    goto LABEL_7;
  }
  if (v7) {
    goto LABEL_6;
  }
  if ([v4 isNavigational])
  {
    uint64_t v12 = [v5 frontmostClient];
    if (!v12)
    {
LABEL_21:
      uint64_t v11 = [v5 localNowPlayingClient];
      goto LABEL_7;
    }
  }
  else
  {
    if (![v4 isContextSensitive]) {
      goto LABEL_21;
    }
    uint64_t v14 = [(MRDRemoteControlServer *)self _contextuallyAwareDestinationAppDisplayIDForCommand:v4];
    if (v14)
    {
      id v15 = _MRLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = [v4 contextID];
        int v17 = 138543618;
        uint64_t v18 = v14;
        __int16 v19 = 2114;
        double v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using previously routed app %{public}@ for context %{public}@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v12 = [v5 clientForBundleIdentifier:v14];
    }
    else
    {
      uint64_t v12 = 0;
    }

    if (!v12) {
      goto LABEL_21;
    }
  }
LABEL_8:

  return v12;
}

- (id)_remoteControlContextForCommand:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100026230;
  uint64_t v14 = sub_100026240;
  id v15 = 0;
  id v4 = [v3 contextID];
  id v5 = v4;
  if (v4)
  {
    id v8 = v4;
    id v9 = v3;
    msv_dispatch_sync_on_queue();
  }
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)_contextuallyAwareDestinationAppDisplayIDForCommand:(id)a3
{
  id v4 = a3;
  id v5 = [(MRDRemoteControlServer *)self _remoteControlContextForCommand:v4];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 routedCommands];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v7 reverseObjectEnumerator];
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v12 isContextSensitive])
          {
            id v13 = [v12 routedAppDisplayID];
            id v9 = [v13 copy];

            goto LABEL_12;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    goto LABEL_17;
  }
  if ([v4 isContextSensitive])
  {
    uint64_t v7 = _MRLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10032ACA0();
    }
    id v9 = 0;
LABEL_17:

    goto LABEL_18;
  }
  id v9 = 0;
LABEL_18:

  return v9;
}

- (void)_shouldIgnoreCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_23;
  }
  unsigned int v8 = [v6 commandType];
  if (!sub_1001677A0(v8))
  {
LABEL_9:
    unsigned int v10 = 0;
    goto LABEL_10;
  }
  if (![v6 isAVRCPCommand])
  {
    if (sub_100167788(v8))
    {
      uint64_t v11 = +[MRDMediaRemoteServer server];
      unsigned int v10 = [v11 shouldSendCommandsDuringPhoneCall] ^ 1;

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v9 = _MRLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Command is an AVRCP command: skipping straight to call observer check to determine whether we should ignore the command or not.", buf, 2u);
  }

  unsigned int v10 = 1;
LABEL_10:
  uint64_t v12 = +[MRUserSettings currentSettings];
  if ([v12 supportExpanseMigration])
  {
    id v13 = +[MRExpanseManager sharedManager];
    unsigned int v14 = [v13 expanseSessionActive];

    v10 &= ~v14;
  }
  else
  {
  }
  if (![v6 alwaysIgnoreDuringSharePlay]) {
    goto LABEL_20;
  }
  long long v15 = +[MRUserSettings currentSettings];
  if (([v15 supportExpanseMigration] & 1) == 0)
  {

LABEL_20:
    if (([v6 alwaysIgnoreDuringCall] | v10) == 1)
    {
      callObserver = self->_callObserver;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10002F7C8;
      v20[3] = &unk_1004169B0;
      id v22 = v7;
      id v21 = v6;
      [(MRDPhoneCallObserver *)callObserver numberOfActivePhoneCalls:v20];
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    goto LABEL_23;
  }
  long long v16 = +[MRExpanseManager sharedManager];
  unsigned int v17 = [v16 expanseSessionHasActiveActivity];

  if (!v17) {
    goto LABEL_20;
  }
  long long v18 = _MRLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Ignoring command because of active SharePlay activity.", buf, 2u);
  }

  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
LABEL_23:
}

- (BOOL)_checkAndMaybeUpdateNowPlayingAppStackPopRateLimitingWithInterval:(double)a3
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F9A0;
  block[3] = &unk_1004169D8;
  void block[4] = self;
  void block[5] = &v7;
  *(double *)&block[6] = a3;
  dispatch_sync((dispatch_queue_t)serialQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_applicationIsRunning:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  msv_dispatch_sync_on_queue();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_createBroadcastCommandResponseFromStatuses:(id)a3 forClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)_MRSendCommandResultMessageProtobuf);
  id v8 = objc_alloc_init((Class)_MRNowPlayingPlayerPathProtobuf);
  [v7 setPlayerPath:v8];

  char v9 = +[MROrigin localOrigin];
  char v10 = [v9 protobuf];
  uint64_t v11 = [v7 playerPath];
  [v11 setOrigin:v10];

  id v12 = objc_alloc_init((Class)_MRNowPlayingClientProtobuf);
  id v13 = [v7 playerPath];
  [v13 setClient:v12];

  id v14 = [v6 pid];
  long long v15 = [v7 playerPath];
  long long v16 = [v15 client];
  [v16 setProcessIdentifier:v14];

  unsigned int v17 = [v6 bundleIdentifier];
  long long v18 = [v7 playerPath];
  __int16 v19 = [v18 client];
  [v19 setBundleIdentifier:v17];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v5;
  id v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v7, "addHandlerReturnStatus:", objc_msgSend(v25, "intValue", (void)v27));
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  return v7;
}

- (id)_createBroadcastCommandPlayerPathForClient:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)MRClient);
  id v5 = [v3 pid];

  [v4 setProcessIdentifier:v5];
  id v6 = objc_alloc((Class)MRPlayerPath);
  id v7 = +[MROrigin localOrigin];
  id v8 = [v6 initWithOrigin:v7 client:v4 player:0];

  return v8;
}

- (BOOL)_isCommandCacheCreating:(unsigned int)a3
{
  return (a3 - 121 < 0xD) & (0x1013u >> (a3 - 121));
}

- (BOOL)_isCommandCacheable:(unsigned int)a3
{
  BOOL result = 1;
  if (a3 > 0x1A || ((1 << a3) & 0x6000001) == 0) {
    return a3 == 134;
  }
  return result;
}

- (id)_effectiveContextIDForCommand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 optionValueForKey:kMRMediaRemoteOptionIsRedirectingCommand];
  unsigned __int8 v5 = [v4 BOOLValue];

  if (v5)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = [v3 optionValueForKey:kMRMediaRemoteOptionCommandSequenceUUID];
    if ([v7 length])
    {
      id v8 = v7;
    }
    else
    {
      id v8 = [v3 optionValueForKey:kMRMediaRemoteOptionContextID];
    }
    id v6 = v8;
  }

  return v6;
}

- (id)_resolveCommandBeforeSend:(id)a3 toClient:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 mutableCopy];
  uint64_t v11 = kMRMediaRemoteOptionClientPreferredLanguages;
  id v12 = [v10 optionValueForKey:kMRMediaRemoteOptionClientPreferredLanguages];

  if (!v12)
  {
    id v13 = +[NSLocale preferredLanguages];
    id v14 = [v13 componentsJoinedByString:@","];

    [v10 setOptionValue:v14 forKey:v11];
  }
  if ([v8 commandType] == 136)
  {
    id v15 = [(MRDRemoteControlServer *)self _persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:v10 forClient:v9 error:a5];
  }
  else if ([v8 commandType] == 132)
  {
    id v15 = [(MRDRemoteControlServer *)self _populateApplicationSpecificDataForPrepareForSetQueueCommand:v10 forClient:v9];
  }
  else
  {
    [v8 commandType];
    if (MRMediaRemoteCommandSupportsAttribution())
    {
      id v15 = [(MRDRemoteControlServer *)self _attributedCommand:v10 forClient:v9];
    }
    else
    {
      id v15 = v8;
    }
  }
  long long v16 = v15;

  return v16;
}

- (void)_performCommandProcessingAfterSend:(id)a3
{
  id v4 = a3;
  if ([v4 commandType] == 136) {
    [(MRDRemoteControlServer *)self _cleanUpPersistedSessionForSessionPreloadCommand:v4];
  }
}

- (id)_populateApplicationSpecificDataForPrepareForSetQueueCommand:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 optionValueForKey:kMRMediaRemoteOptionPrepareForSetQueueIsProactive];
  unsigned __int8 v6 = [v5 BOOLValue];

  id v7 = [v4 optionValueForKey:kMRMediaRemoteOptionPrepareForSetQueueProactiveReason];
  if ((v6 & 1) == 0)
  {
    id v10 = _MRLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v4;
      id v21 = "Not populating PPFSQ command options - command is not proactive - command: %@";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
    }
LABEL_12:

    id v22 = v4;
    goto LABEL_34;
  }
  id v8 = [v4 playerPath];
  unsigned __int8 v9 = [v8 isSystemMediaApplication];

  id v10 = _MRLogForCategory();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v9 & 1) == 0)
  {
    if (v11)
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v4;
      id v21 = "Not populating PPFSQ command options - playerPath is not systemMediaApplication - command: %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  if (v11)
  {
    *(_DWORD *)long long buf = 138412546;
    id v54 = v7;
    __int16 v55 = 2112;
    id v56 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ready to populate PPFSQ, reason: %@, command: %@", buf, 0x16u);
  }

  id v12 = +[MRDMediaRemoteServer server];
  id v13 = [v12 nowPlayingServer];
  id v14 = [v13 localOriginClient];

  id v15 = [v14 nowPlayingClients];
  long long v16 = objc_msgSend(v15, "msv_firstWhere:", &stru_100416A40);

  unsigned int v17 = [v16 activePlayerClient];
  long long v18 = [v17 supportedRemoteControlCommands];
  __int16 v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    uint64_t v23 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    id v20 = [v14 defaultSupportedCommandsForClient:v23];
  }
  id v24 = objc_msgSend(v20, "msv_firstWhere:", &stru_100416A80);
  uint64_t v25 = [v24 options];
  id v26 = [v25 objectForKeyedSubscript:kMRMediaRemoteCommandInfoProactiveCommandOptions];

  if (v26)
  {
    v43 = v24;
    id v44 = v20;
    v45 = v17;
    v46 = v16;
    v47 = v14;
    v48 = v7;
    id v27 = objc_alloc_init((Class)NSMutableArray);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v42 = v26;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          id v34 = [v4 options];
          id v35 = [v34 objectForKeyedSubscript:v33];

          if (v35)
          {
            id v36 = _MRLogForCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v54 = v33;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Not setting key '%@' for PPFSQ - key already populated", buf, 0xCu);
            }
          }
          else
          {
            id v37 = [v28 objectForKeyedSubscript:v33];
            [v4 setOptionValue:v37 forKey:v33];

            [v27 addObject:v33];
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v30);
    }

    id v38 = _MRLogForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      id v39 = [v27 count];
      *(_DWORD *)long long buf = 138412802;
      id v54 = v4;
      __int16 v55 = 2048;
      id v56 = v39;
      __int16 v57 = 2112;
      id v58 = v27;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Finished populating PPFSQ command options for command %@ - populated %lu keys: %@", buf, 0x20u);
    }

    id v22 = [v4 copy];
    id v14 = v47;
    id v7 = v48;
    unsigned int v17 = v45;
    long long v16 = v46;
    id v24 = v43;
    id v20 = v44;
    id v26 = v42;
  }
  else
  {
    id v40 = _MRLogForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Not populating PPFSQ command options - no data provided - command: %@", buf, 0xCu);
    }

    id v22 = v4;
  }

LABEL_34:

  return v22;
}

- (id)_persistPlaybackSessionAndUpdateOptionsForSessionPreloadCommand:(id)a3 forClient:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = kMRMediaRemoteOptionPlaybackSessionData;
  id v10 = [v7 optionValueForKey:kMRMediaRemoteOptionPlaybackSessionData];
  id v11 = [objc_alloc((Class)MRPlaybackSession) initWithData:v10];
  id v12 = v11;
  if (v11
    && ([v11 identifier], id v13 = objc_claimAutoreleasedReturnValue(), v13, v13))
  {
    id v14 = NSTemporaryDirectory();
    id v15 = +[NSURL fileURLWithPath:v14];

    long long v16 = +[NSFileManager defaultManager];
    id v32 = 0;
    [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v32];
    id v17 = v32;

    if (v17)
    {
      if (a5)
      {
        id v17 = v17;
        id v18 = 0;
        *a5 = v17;
      }
      else
      {
        id v18 = 0;
      }
    }
    else
    {
      __int16 v19 = [v12 identifier];
      id v20 = [v15 URLByAppendingPathComponent:v19];

      id v21 = [v12 playbackSessionData];
      id v31 = 0;
      [v21 writeToURL:v20 options:1 error:&v31];
      id v17 = v31;

      if (v17)
      {
        id v18 = 0;
        if (a5) {
          *a5 = v17;
        }
      }
      else
      {
        if (v8) {
          [v8 realToken];
        }
        id v22 = [v20 path];
        [v22 UTF8String];
        uint64_t v23 = (void *)sandbox_extension_issue_file_to_process();

        id v24 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, 0, 0, 0, 0);
        free(v23);
        uint64_t v25 = [v20 path];
        [v7 setOptionValue:v25 forKey:kMRMediaRemoteOptionPlaybackSessionFilePath];

        id v26 = [v12 identifier];
        [v7 setOptionValue:v26 forKey:kMRMediaRemoteOptionPlaybackSessionIdentifier];

        id v27 = [v12 type];
        [v7 setOptionValue:v27 forKey:kMRMediaRemoteOptionPlaybackSessionType];

        id v28 = [v12 revision];
        [v7 setOptionValue:v28 forKey:kMRMediaRemoteOptionPlaybackSessionRevision];

        id v29 = [v12 metadata];
        [v7 setOptionValue:v29 forKey:kMRMediaRemoteOptionPlaybackSessionMetadata];

        [v7 setOptionValue:0 forKey:v9];
        [v7 setOptionValue:v24 forKey:kMRMediaRemoteOptionSandboxExtensionToken];
        id v18 = [v7 copy];
      }
    }
  }
  else
  {
    id v18 = 0;
    if (a5) {
      *a5 = [objc_alloc((Class)NSError) initWithMRError:2];
    }
  }

  return v18;
}

- (void)_cleanUpPersistedSessionForSessionPreloadCommand:(id)a3
{
  id v5 = [a3 optionValueForKey:kMRMediaRemoteOptionPlaybackSessionFilePath];
  id v3 = +[NSURL fileURLWithPath:v5];
  id v4 = +[NSFileManager defaultManager];
  [v4 removeItemAtURL:v3 error:0];
}

- (id)_onQueue_presentDialogWithTitle:(id)a3 message:(id)a4 defaultButtonTitle:(id)a5 alternateButtonTitle:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc_init((Class)MSVSystemDialogOptions);
  [v17 setAlertHeader:v16];

  [v17 setAlertMessage:v15];
  [v17 setDefaultButtonTitle:v14];

  [v17 setAlternateButtonTitle:v13];
  [v17 setShowAsTopmost:1];
  [v17 setForceModalAlertAppearance:1];
  [v17 setShowOnLockscreen:1];
  [v17 setDismissOverlaysOnLockscreen:0];
  id v18 = [objc_alloc((Class)MSVSystemDialog) initWithOptions:v17];
  [(MSVSystemDialog *)self->_remoteControlDialog dismiss];
  objc_storeStrong((id *)&self->_remoteControlDialog, v18);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100030DB0;
  v24[3] = &unk_100416988;
  id v19 = v18;
  id v25 = v19;
  id v26 = v12;
  id v20 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);
  id v21 = v26;
  id v22 = v19;

  return v22;
}

- (id)_attributedCommand:(id)a3 forClient:(id)a4
{
  id v4 = a3;
  id v5 = +[MRDMediaRemoteServer server];
  unsigned __int8 v6 = [v5 nowPlayingServer];
  id v7 = [v4 playerPath];
  id v8 = [v6 queryExistingPlayerPath:v7];

  uint64_t v9 = [v8 originClient];
  id v10 = [v9 deviceInfo];
  id v11 = [v10 buildVersion];
  unsigned int v12 = [v11 hasPrefix:@"21J"];

  if (!v12)
  {
    id v13 = [v4 playerPath];
    id v14 = [v13 client];
    id v15 = [v14 bundleIdentifier];
    int IsSystemMediaApplication = MRMediaRemoteApplicationIsSystemMediaApplication();

    if (IsSystemMediaApplication)
    {
      id v17 = [v4 options];
      id v18 = [v17 objectForKeyedSubscript:kMRMediaRemoteOptionOriginatedFromRemoteDevice];
      unsigned int v19 = [v18 BOOLValue];

      if (v19)
      {
        uint64_t v20 = kMRMediaRemoteOptionApplicationUserIdentity;
        id v21 = [v4 optionValueForKey:kMRMediaRemoteOptionApplicationUserIdentity];
        id v22 = [objc_alloc((Class)MRUserIdentity) initWithProtobufData:v21];
        if (v22)
        {
          uint64_t v23 = v22;
          id v24 = [v8 playerClient];
          id v25 = [v24 participantDataSource];
          id v26 = [v25 donateAttribution:v23];

          [v4 setOptionValue:v26 forKey:kMRMediaRemoteOptionAssociatedParticipantIdentifier];
          [v4 setOptionValue:0 forKey:v20];
          id v27 = v4;

          goto LABEL_14;
        }
      }
      else
      {
        id v28 = [v4 options];
        id v21 = [v28 objectForKeyedSubscript:kMRMediaRemoteOptionHomeKitUserIdentifier];

        id v29 = +[MRDMusicUserStateCenter sharedCenter];
        id v30 = v29;
        if (v21) {
          [v29 identityForHomeUserIdentifier:v21];
        }
        else {
        id v31 = [v29 localActiveIdentity];
        }

        if (v31)
        {
          id v32 = [v4 playerPath];
          id v33 = [v32 origin];
          unsigned int v34 = [v33 isLocal];

          if (v34)
          {
            id v35 = +[MRPlaybackQueueParticipant expectedIdentifierForUserIdentity:v31 withRandomData:0];
            id v36 = &kMRMediaRemoteOptionAssociatedParticipantIdentifier;
          }
          else
          {
            id v35 = [v31 protobufData];
            id v36 = &kMRMediaRemoteOptionApplicationUserIdentity;
          }
          [v4 setOptionValue:v35 forKey:*v36];

          id v39 = v4;
          goto LABEL_14;
        }
      }
    }
  }
  id v37 = v4;
LABEL_14:

  return v4;
}

- (NSMutableDictionary)applicationConnections
{
  applicationConnections = self->_applicationConnections;
  if (!applicationConnections)
  {
    id v4 = +[NSMutableDictionary dictionary];
    id v5 = self->_applicationConnections;
    self->_applicationConnections = v4;

    applicationConnections = self->_applicationConnections;
  }

  return applicationConnections;
}

- (MRDCommandClientRestriction)commandClientsRestriction
{
  return self->_commandClientsRestriction;
}

- (void)setCommandClientsRestriction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandClientsRestriction, 0);
  objc_storeStrong((id *)&self->_applicationConnections, 0);
  objc_storeStrong((id *)&self->_lastNowPlayingAppStackPopDueToFailedLaunchDate, 0);
  objc_storeStrong((id *)&self->_remoteControlDialog, 0);
  objc_storeStrong((id *)&self->_redirectionCache, 0);
  objc_storeStrong((id *)&self->_remoteAlertWorkerQueue, 0);
  objc_storeStrong((id *)&self->_callObserver, 0);
  objc_storeStrong((id *)&self->_remoteControlContexts, 0);
  objc_storeStrong((id *)&self->_pendingSendPlaybackSessionDisplayIDs, 0);
  objc_storeStrong((id *)&self->_commandQueuesForDisplayIDs, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end