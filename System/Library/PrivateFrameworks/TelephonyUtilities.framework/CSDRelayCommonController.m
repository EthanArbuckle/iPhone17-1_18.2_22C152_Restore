@interface CSDRelayCommonController
- (CSDRelayCommonController)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (void)handlePlayDTMFToneForKeyMessage:(id)a3;
- (void)handleRequestActionMessage:(id)a3;
- (void)handleRequestedAnswerMessage:(id)a3 withBehavior:(int64_t)a4;
- (void)handleSetTTYTypeMessage:(id)a3;
- (void)handleSetUplinkMutedMessage:(id)a3;
- (void)handleSuppressRingtoneMessage:(id)a3;
- (void)handleUpdateSystemVolumeMessageFromHost:(id)a3;
@end

@implementation CSDRelayCommonController

- (CSDRelayCommonController)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDRelayCommonController;
  v6 = [(CSDRelayCommonController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 callWithUniqueProxyIdentifier:v3];

  return v5;
}

- (void)handleRequestedAnswerMessage:(id)a3 withBehavior:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)TUAnswerRequest);
  v7 = [v5 uniqueProxyIdentifier];
  id v11 = [v6 initWithUniqueProxyIdentifier:v7];

  [v11 setBehavior:a4];
  v8 = [v5 sourceIdentifier];
  [v11 setSourceIdentifier:v8];

  objc_super v9 = [v5 endpointIDSDestination];

  [v11 setEndpointIDSDestination:v9];
  v10 = +[TUCallCenter sharedInstance];
  [v10 answerWithRequest:v11];
}

- (void)handlePlayDTMFToneForKeyMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayCommonController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    id v7 = [v4 DTMFKey];
    if ([v6 isHostedOnCurrentDevice]) {
      [v6 playRemoteDTMFToneForKey:v7];
    }
    else {
      [v6 playLocalDTMFToneForKey:v7];
    }
  }
  else
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [v4 uniqueProxyIdentifier];
      v10 = [(CSDRelayController *)self allCalls];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)handleSetTTYTypeMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[TUCallCenter sharedInstance];
  id v6 = [v4 uniqueProxyIdentifier];
  id v7 = [v5 callWithUniqueProxyIdentifier:v6];

  if (v7)
  {
    objc_msgSend(v7, "setTtyType:", objc_msgSend(v4, "ttyType"));
  }
  else
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [v4 uniqueProxyIdentifier];
      v10 = [(CSDRelayController *)self allCalls];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)handleSetUplinkMutedMessage:(id)a3
{
  id v4 = a3;
  id v5 = +[TUCallCenter sharedInstance];
  id v6 = [v4 uniqueProxyIdentifier];
  id v7 = [v5 callWithUniqueProxyIdentifier:v6];

  if (v7)
  {
    v8 = [v7 provider];
    unsigned int v9 = [v8 isTinCanProvider];

    if (v9)
    {
      [v4 messageSendTime];
      double v11 = v10;
      [v7 uplinkMutedSetTime];
      if (v11 <= v12)
      {
        v16 = sub_100008DCC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          [v4 messageSendTime];
          v18 = v17;
          [v7 uplinkMutedSetTime];
          int v20 = 138412802;
          id v21 = v4;
          __int16 v22 = 2048;
          v23 = v18;
          __int16 v24 = 2048;
          uint64_t v25 = v19;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignoring %@ because messageSendTime (%f) <= call.uplinkMutedSetTime (%f)", (uint8_t *)&v20, 0x20u);
        }
      }
      else
      {
        objc_msgSend(v7, "setUplinkMuted:", objc_msgSend(v4, "isUplinkMuted"));
        [v4 messageSendTime];
        objc_msgSend(v7, "setUplinkMutedSetTime:");
      }
    }
    else
    {
      objc_msgSend(v7, "setUplinkMuted:", objc_msgSend(v4, "isUplinkMuted"));
    }
  }
  else
  {
    __int16 v13 = sub_100008DCC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [v4 uniqueProxyIdentifier];
      v15 = [(CSDRelayController *)self allCalls];
      int v20 = 138412546;
      id v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)handleSuppressRingtoneMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 uniqueProxyIdentifier];
  id v6 = [(CSDRelayCommonController *)self callWithUniqueProxyIdentifier:v5];

  if (v6)
  {
    [v6 suppressRingtoneDueToRemoteSuppression];
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v4 uniqueProxyIdentifier];
      unsigned int v9 = [(CSDRelayController *)self allCalls];
      int v10 = 138412546;
      double v11 = v8;
      __int16 v12 = 2112;
      __int16 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find call with uniqueProxyIdentifier %@. All current calls: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)handleUpdateSystemVolumeMessageFromHost:(id)a3
{
  id v7 = a3;
  if ([v7 hasSystemVolume])
  {
    [v7 systemVolume];
    int v4 = v3;
    id v5 = +[TUAudioSystemController sharedAudioSystemController];
    LODWORD(v6) = v4;
    [v5 setActiveCategoryVolume:v6];
  }
}

- (void)handleRequestActionMessage:(id)a3
{
  id v4 = a3;
  int v5 = [v4 requestActionType];
  if (v5 > 35)
  {
    if (v5 == 36)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 2;
      goto LABEL_10;
    }
    if (v5 == 46)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 4;
      goto LABEL_10;
    }
  }
  else
  {
    if (v5 == 19)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 0;
      goto LABEL_10;
    }
    if (v5 == 20)
    {
      double v6 = self;
      id v7 = v4;
      uint64_t v8 = 1;
LABEL_10:
      [(CSDRelayCommonController *)v6 handleRequestedAnswerMessage:v7 withBehavior:v8];
      goto LABEL_14;
    }
  }
  unsigned int v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring received request action message because it has a request action type we don't know how to handle: %@", (uint8_t *)&v10, 0xCu);
  }

LABEL_14:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end