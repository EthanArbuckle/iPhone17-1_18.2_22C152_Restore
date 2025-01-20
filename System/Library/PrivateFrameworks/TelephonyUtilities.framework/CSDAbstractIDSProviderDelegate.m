@interface CSDAbstractIDSProviderDelegate
+ (id)handleByFullyQualifyingHandle:(id)a3 usingCountryCode:(id)a4;
- (BOOL)isCellularDataAllowedForChat:(id)a3;
- (BOOL)isCellularDataPreferredForChat:(id)a3;
- (BOOL)isMediaAllowedForChat:(id)a3;
- (BOOL)isWiFiAllowedForChat:(id)a3;
- (BOOL)shouldAcceptIncomingInvite;
- (BOOL)shouldOverrideNetworkAsAvailable;
- (CGSize)localPortraitAspectRatioForChat:(id)a3;
- (CSDAbstractIDSProviderDelegate)init;
- (CSDAbstractIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4;
- (CSDIDSProviderDelegateCapabilities)capabilities;
- (CXProvider)provider;
- (NSMutableOrderedSet)mutableChats;
- (OS_dispatch_queue)queue;
- (id)callUpdateForChat:(id)a3;
- (id)callUpdateForPendingChat:(id)a3;
- (id)chatWithUUID:(id)a3;
- (id)chats;
- (id)incomingChatGenerator;
- (id)incomingSessionProviderGenerator;
- (id)providerDidBegin;
- (id)waitingChatWithHandle:(id)a3 isOutgoing:(BOOL)a4;
- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3;
- (void)chat:(id)a3 changedBytesOfDataUsed:(int64_t)a4;
- (void)chat:(id)a3 inputFrequencyLevelChangedTo:(id)a4;
- (void)chat:(id)a3 inputLevelChangedTo:(float)a4;
- (void)chat:(id)a3 outputFrequencyLevelChangedTo:(id)a4;
- (void)chat:(id)a3 outputLevelChangedTo:(float)a4;
- (void)chatConnected:(id)a3;
- (void)chatEnded:(id)a3;
- (void)chatSentInvitation:(id)a3;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7;
- (void)setIncomingChatGenerator:(id)a3;
- (void)setIncomingSessionProviderGenerator:(id)a3;
- (void)setProvider:(id)a3;
- (void)setProviderDidBegin:(id)a3;
- (void)updateCacheWithChat:(id)a3;
@end

@implementation CSDAbstractIDSProviderDelegate

- (CSDAbstractIDSProviderDelegate)init
{
  v3 = objc_alloc_init(CSDIDSProviderDelegateCapabilities);
  v4 = [(CSDAbstractIDSProviderDelegate *)self initWithCapabilities:v3 queue:&_dispatch_main_q];

  return v4;
}

- (CSDAbstractIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSDAbstractIDSProviderDelegate;
  v9 = [(CSDAbstractIDSProviderDelegate *)&v24 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capabilities, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    uint64_t v11 = +[NSMutableOrderedSet orderedSet];
    mutableChats = v10->_mutableChats;
    v10->_mutableChats = (NSMutableOrderedSet *)v11;

    id incomingSessionProviderGenerator = v10->_incomingSessionProviderGenerator;
    v10->_id incomingSessionProviderGenerator = &stru_100506870;

    objc_initWeak(&location, v10);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_10009DA00;
    v21 = &unk_100506898;
    objc_copyWeak(&v22, &location);
    v14 = objc_retainBlock(&v18);
    id incomingChatGenerator = v10->_incomingChatGenerator;
    v10->_id incomingChatGenerator = v14;

    v16 = +[NSUserDefaults tu_defaults];
    v10->_shouldOverrideNetworkAsAvailable = [v16 BOOLForKey:@"NetworkAvailabilityCheckOverrideValue"];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)chats
{
  v2 = [(CSDAbstractIDSProviderDelegate *)self mutableChats];
  v3 = [v2 array];
  id v4 = [v3 copy];

  return v4;
}

- (id)chatWithUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CSDAbstractIDSProviderDelegate *)self mutableChats];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 UUID];
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateCacheWithChat:(id)a3
{
  id v4 = a3;
  v5 = [v4 dateEnded];

  id v6 = [(CSDAbstractIDSProviderDelegate *)self mutableChats];
  id v7 = v6;
  if (v5) {
    [v6 removeObject:v4];
  }
  else {
    [v6 addObject:v4];
  }
}

+ (id)handleByFullyQualifyingHandle:(id)a3 usingCountryCode:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if ([v7 type] == (id)2)
  {
    v9 = [v7 value];
    v10 = +[TUPhoneNumber phoneNumberWithDigits:v9 countryCode:v6];

    unsigned int v11 = [v10 unformattedInternationalRepresentation];
    v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Used country code '%@' to determine international phone number representation: %@", (uint8_t *)&v14, 0x16u);
    }

    id v8 = v7;
    if (v11)
    {
      id v8 = objc_msgSend(objc_alloc((Class)TUHandle), "initWithType:value:", objc_msgSend(v7, "type"), v11);
    }
  }

  return v8;
}

- (BOOL)shouldAcceptIncomingInvite
{
  v3 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned int v4 = [v3 isWiFiAvailable];

  id v5 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned int v6 = [v5 isWiFiAllowed];

  id v7 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned int v8 = [v7 isCellularDataAvailable];

  v9 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned int v10 = [v9 isCellularDataAllowed];

  BOOL v11 = (v4 & v6 & 1) != 0
     || (v8 & v10 & 1) != 0
     || [(CSDAbstractIDSProviderDelegate *)self shouldOverrideNetworkAsAvailable];
  v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (v11) {
      CFStringRef v13 = @"allowed";
    }
    else {
      CFStringRef v13 = @"ignored";
    }
    int v15 = 138413570;
    CFStringRef v16 = v13;
    __int16 v17 = 1024;
    unsigned int v18 = v4;
    __int16 v19 = 1024;
    unsigned int v20 = v6;
    __int16 v21 = 1024;
    unsigned int v22 = v8;
    __int16 v23 = 1024;
    unsigned int v24 = v10;
    __int16 v25 = 1024;
    unsigned int v26 = [(CSDAbstractIDSProviderDelegate *)self shouldOverrideNetworkAsAvailable];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Determined that invite should be %@ - (isWiFiAvailable=%d isWiFiAllowed=%d isCellularDataAvailable=%d isCellularDataAllowed=%d shouldOverrideNetworkAsAvailable=%d)", (uint8_t *)&v15, 0x2Au);
  }

  return v11;
}

- (void)service:(id)a3 account:(id)a4 incomingPendingMessageOfType:(int64_t)a5 fromID:(id)a6 context:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  CFStringRef v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    int64_t v34 = (int64_t)v12;
    __int16 v35 = 2112;
    id v36 = v13;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    id v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invite received for service %@ account %@ from (fromID=%@) with context: %@", buf, 0x2Au);
  }

  __int16 v17 = sub_100008DCC();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    id v30 = v12;
    if (v18)
    {
      *(_DWORD *)buf = 134217984;
      int64_t v34 = a5;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Recieved pending message of type %ld", buf, 0xCu);
    }

    __int16 v19 = (void *)IDSCopyAddressDestinationForDestination();
    __int16 v17 = IDSCopyRawAddressForDestination();

    unsigned int v20 = +[TUHandle handleWithDestinationID:v17];
    __int16 v21 = [CSDIDSPendingChat alloc];
    unsigned int v22 = +[NSUUID UUID];
    __int16 v23 = [v15 serviceIdentifier];
    unsigned int v24 = -[CSDIDSPendingChat initWithUUID:isVideo:handle:](v21, "initWithUUID:isVideo:handle:", v22, [v23 containsString:@"audio"] ^ 1, v20);

    if (a5 == 6)
    {
      if (![(CSDAbstractIDSProviderDelegate *)self shouldAcceptIncomingInvite])
      {
LABEL_13:

        id v12 = v30;
        goto LABEL_14;
      }
      __int16 v25 = [(CSDAbstractIDSProviderDelegate *)self callUpdateForPendingChat:v24];
      unsigned int v26 = [(CSDAbstractIDSProviderDelegate *)self provider];
      v27 = [(CSDIDSPendingChat *)v24 uuid];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10009E380;
      v31[3] = &unk_100506100;
      v32 = v24;
      [v26 reportNewIncomingCallWithUUID:v27 update:v25 completion:v31];

      v28 = v32;
    }
    else
    {
      __int16 v25 = [(CSDAbstractIDSProviderDelegate *)self provider];
      v28 = [(CSDIDSPendingChat *)v24 uuid];
      v29 = +[NSDate date];
      [v25 reportCallWithUUID:v28 endedAtDate:v29 reason:3];
    }
    goto LABEL_13;
  }
  if (v18)
  {
    *(_DWORD *)buf = 134217984;
    int64_t v34 = a5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not handling pending message of type: %ld", buf, 0xCu);
  }
LABEL_14:
}

- (id)callUpdateForPendingChat:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CXCallUpdate);
  objc_msgSend(v4, "setHasVideo:", objc_msgSend(v3, "isVideo"));
  id v5 = [v3 handle];

  unsigned int v6 = +[CXHandle handleWithTUHandle:v5];
  [v4 setRemoteHandle:v6];

  [v4 setRequiresAuthentication:1];

  return v4;
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6 withContext:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [[CSDMessagingCallMessage alloc] initWithData:v14];
  CFStringRef v16 = sub_100008DCC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v94 = 2112;
    id v95 = v11;
    __int16 v96 = 2112;
    id v97 = v13;
    __int16 v98 = 2112;
    v99 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invite received for session %@ account %@ from (fromID=%@) with data: %@", buf, 0x2Au);
  }

  if ([(CSDMessagingCallMessage *)v15 type] != 1)
  {
    __int16 v19 = sub_100008DCC();
    BOOL v60 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v60)
      {
        id v61 = (id)[(CSDMessagingCallMessage *)v15 type];
        if (v61 >= 3)
        {
          v62 = +[NSString stringWithFormat:@"(unknown: %i)", v61];
        }
        else
        {
          v62 = *(&off_1005068B8 + (int)v61);
        }
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v62;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Ignoring incoming invite since message with type=%@ was not an invite.", buf, 0xCu);
      }
      goto LABEL_35;
    }
    if (!v60) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    v63 = "[WARN] Ignoring incoming invite since accompanying message was nil";
    v64 = v19;
    uint32_t v65 = 2;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, v63, buf, v65);
    goto LABEL_35;
  }
  if (![(CSDAbstractIDSProviderDelegate *)self shouldAcceptIncomingInvite])
  {
    __int16 v19 = sub_100008DCC();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(void *)buf = 67109120;
    v63 = "Ignoring incoming invite since shouldAcceptIncomingInvite is %d";
    v64 = v19;
    uint32_t v65 = 8;
    goto LABEL_25;
  }
  __int16 v17 = [(CSDAbstractIDSProviderDelegate *)self incomingSessionProviderGenerator];
  BOOL v18 = [(CSDAbstractIDSProviderDelegate *)self queue];
  __int16 v19 = ((void (**)(void, id, void *))v17)[2](v17, v12, v18);

  id v20 = [[CSDExternalIDSDualSession alloc] initAsReceiverWithSessionProvider:v19 remoteFromID:v13 remoteProtocolVersion:[(CSDMessagingCallMessage *)v15 protocolVersion]];
  [v20 setInvitationTimeout:(double)TUIncomingInvitationTimeout()];
  __int16 v21 = (void *)IDSCopyAddressDestinationForDestination();
  uint64_t v22 = IDSCopyRawAddressForDestination();

  v81 = (void *)v22;
  id v83 = [objc_alloc((Class)CXHandle) initWithDestinationID:v22];
  __int16 v23 = -[CSDAbstractIDSProviderDelegate waitingChatWithHandle:isOutgoing:](self, "waitingChatWithHandle:isOutgoing:");
  unsigned int v24 = v23;
  v84 = self;
  v82 = v20;
  if (!v23) {
    goto LABEL_7;
  }
  __int16 v25 = [v23 sessionUUID];
  [v20 UUID];
  id v26 = v14;
  v27 = v15;
  id v28 = v13;
  id v29 = v11;
  id v30 = v12;
  v32 = v31 = v24;
  v33 = (char *)[v25 caseInsensitiveCompare:v32];

  unsigned int v24 = v31;
  id v12 = v30;
  id v11 = v29;
  id v13 = v28;
  id v15 = v27;
  id v14 = v26;
  id v20 = v82;

  BOOL v34 = v33 + 1 == 0;
  self = v84;
  if (v34)
  {
    v72 = sub_100008DCC();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Declining this invite because we found a sending chat with the same destination: %@", buf, 0xCu);
    }

    [v82 declineInvitation];
  }
  else
  {
LABEL_7:
    v78 = v24;
    v79 = v19;
    id v80 = v14;
    __int16 v35 = [(CSDAbstractIDSProviderDelegate *)self incomingChatGenerator];
    id v36 = [v83 tuHandle];
    BOOL v37 = [(CSDMessagingCallMessage *)v15 protoWantsVideo];
    id v38 = [(CSDMessagingCallMessage *)v15 inviteData];
    __int16 v39 = [v38 faceTimeInviteDictionary];
    id v40 = v20;
    v41 = v84;
    v42 = ((void (**)(void, id, void *, BOOL, void *))v35)[2](v35, v40, v36, v37, v39);

    [v42 setDelegate:v84];
    objc_msgSend(v42, "setRemoteMomentsAvailable:", -[CSDMessagingCallMessage isMomentsAvailable](v15, "isMomentsAvailable"));
    objc_msgSend(v42, "setShouldSuppressInCallUI:", -[CSDMessagingCallMessage shouldSuppressInCallUI](v15, "shouldSuppressInCallUI"));
    v43 = [(CSDAbstractIDSProviderDelegate *)v84 callUpdateForChat:v42];
    v44 = [v11 loginID];
    id v45 = [v44 length];

    if (v45)
    {
      id v76 = v11;
      v77 = v43;
      v73 = v42;
      id v74 = v13;
      id v75 = v12;
      v46 = [v11 loginID];
      v47 = TUHandleForIDSCanonicalAddress();

      v48 = [(CSDAbstractIDSProviderDelegate *)v84 provider];
      v49 = [v48 configuration];
      v50 = [v49 prioritizedSenderIdentities];

      long long v90 = 0u;
      long long v91 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v51 = v50;
      id v52 = [v51 countByEnumeratingWithState:&v88 objects:v92 count:16];
      if (v52)
      {
        id v53 = v52;
        uint64_t v54 = *(void *)v89;
        while (2)
        {
          for (i = 0; i != v53; i = (char *)i + 1)
          {
            if (*(void *)v89 != v54) {
              objc_enumerationMutation(v51);
            }
            v56 = *(void **)(*((void *)&v88 + 1) + 8 * i);
            v57 = [v56 handle];
            v58 = [v57 tuHandle];
            unsigned int v59 = [v58 isEqualToHandle:v47];

            if (v59)
            {
              v66 = [v56 UUID];
              [v77 setLocalSenderIdentityUUID:v66];

              v67 = [v56 account];
              v68 = [v67 UUID];
              [v77 setLocalSenderIdentityAccountUUID:v68];

              goto LABEL_29;
            }
          }
          id v53 = [v51 countByEnumeratingWithState:&v88 objects:v92 count:16];
          if (v53) {
            continue;
          }
          break;
        }
      }
LABEL_29:

      id v12 = v75;
      id v11 = v76;
      v42 = v73;
      id v13 = v74;
      v41 = v84;
      v43 = v77;
    }
    v69 = [(CSDAbstractIDSProviderDelegate *)v41 provider];
    v70 = [v42 UUID];
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_10009EC78;
    v85[3] = &unk_1005055F8;
    v85[4] = v41;
    id v86 = v42;
    id v20 = v82;
    id v87 = v82;
    id v71 = v42;
    [v69 reportNewIncomingCallWithUUID:v70 update:v43 completion:v85];

    __int16 v19 = v79;
    id v14 = v80;
    unsigned int v24 = v78;
  }

LABEL_35:
}

- (id)waitingChatWithHandle:(id)a3 isOutgoing:(BOOL)a4
{
  int v4 = a4;
  id v6 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(CSDAbstractIDSProviderDelegate *)self mutableChats];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v7);
      }
      id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      id v13 = [v12 dateStartedConnecting];
      if (v13) {
        goto LABEL_11;
      }
      id v13 = [v12 handle];
      id v14 = [v6 tuHandle];
      if ((TUHandlesAreCanonicallyEqual() & 1) == 0)
      {

LABEL_11:
        continue;
      }
      unsigned int v15 = [v12 isOutgoing];

      if (v15 == v4)
      {
        id v16 = v12;
        goto LABEL_15;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v9);
LABEL_14:
  id v16 = 0;
LABEL_15:

  return v16;
}

- (int)TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (id)callUpdateForChat:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CXCallUpdate) initWithIDSChat:v3];

  return v4;
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provider: %@", (uint8_t *)&v8, 0xCu);
  }

  [(CSDAbstractIDSProviderDelegate *)self setProvider:v4];
  id v6 = [(CSDAbstractIDSProviderDelegate *)self providerDidBegin];

  if (v6)
  {
    id v7 = [(CSDAbstractIDSProviderDelegate *)self providerDidBegin];
    v7[2]();
  }
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "provider: %@", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = [(CSDAbstractIDSProviderDelegate *)self mutableChats];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) end];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v12, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  uint64_t v9 = [v8 dateConnected];

  if (v9)
  {
    uint64_t v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1003A94F0((uint64_t)v8, v10);
    }

    if (([v5 isComplete] & 1) == 0) {
      [v5 fail];
    }
  }
  else
  {
    if ([v5 downgradeToAudio])
    {
      [v8 setVideo:0];
      [v8 setSendingVideo:0];
    }
    long long v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Calling answer on chat %@", (uint8_t *)&v12, 0xCu);
    }

    [v8 answerWithVideoAspectRatioDescriptor:v5];
  }
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling end on chat %@", (uint8_t *)&v10, 0xCu);
  }

  [v8 end];
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v15, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  uint64_t v9 = [v8 dateConnected];

  if (v9)
  {
    unsigned int v10 = [v5 isOnHold];
    id v11 = sub_100008DCC();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (!v12) {
        goto LABEL_14;
      }
      int v15 = 138412290;
      id v16 = v8;
      id v13 = "Setting sendingAudio to NO for chat %@";
    }
    else
    {
      if (!v12) {
        goto LABEL_14;
      }
      int v15 = 138412290;
      id v16 = v8;
      id v13 = "Setting sendingAudio to YES for chat %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
LABEL_14:

    [v8 setSendingAudio:v10 ^ 1];
    if (([v5 isComplete] & 1) == 0) {
      [v5 fulfill];
    }
    goto LABEL_16;
  }
  long long v14 = sub_100008DCC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_1003A9568((uint64_t)v8, v14);
  }

  if (([v5 isComplete] & 1) == 0) {
    [v5 fail];
  }
LABEL_16:
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v5 = a4;
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12[0] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  uint64_t v9 = sub_100008DCC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v10 = [v5 isSendingVideo];
    int v11 = 67109378;
    LODWORD(v12[0]) = v10;
    WORD2(v12[0]) = 2112;
    *(void *)((char *)v12 + 6) = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling setIsSendingVideo with %d for chat %@", (uint8_t *)&v11, 0x12u);
  }

  objc_msgSend(v8, "setSendingVideo:", objc_msgSend(v5, "isSendingVideo"));
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v6, 0xCu);
  }

  [v4 fail];
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  [v5 videoPresentationSize];
  objc_msgSend(v8, "setRemoteVideoPresentationSize:");
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  objc_msgSend(v8, "setRemoteVideoPresentationState:", -[CSDAbstractIDSProviderDelegate TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:](self, "TUCallRemoteVideoPresentationStateFromCXVideoPresentationState:", objc_msgSend(v5, "videoPresentationState")));
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  objc_msgSend(v8, "setRelaying:", objc_msgSend(v5, "isRelaying"));
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v5 = a4;
  int v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "action: %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = [v5 callUUID];
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v7];

  objc_msgSend(v8, "setMuted:", objc_msgSend(v5, "isMuted"));
  if (([v5 isComplete] & 1) == 0) {
    [v5 fulfill];
  }
}

- (BOOL)isMediaAllowedForChat:(id)a3
{
  return 1;
}

- (BOOL)isWiFiAllowedForChat:(id)a3
{
  id v3 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned __int8 v4 = [v3 isWiFiAllowed];

  return v4;
}

- (BOOL)isCellularDataAllowedForChat:(id)a3
{
  id v3 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned __int8 v4 = [v3 isCellularDataAllowed];

  return v4;
}

- (BOOL)isCellularDataPreferredForChat:(id)a3
{
  id v3 = [(CSDAbstractIDSProviderDelegate *)self capabilities];
  unsigned __int8 v4 = [v3 isCellularDataPreferred];

  return v4;
}

- (CGSize)localPortraitAspectRatioForChat:(id)a3
{
  id v3 = [(id)CUTWeakLinkClass() mainDisplay];
  [v3 bounds];
  if (v4 <= v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  if (v4 <= v5) {
    double v7 = v5;
  }
  else {
    double v7 = v4;
  }
  unsigned int v8 = TUBinaryGCD();
  double v9 = v6 / (double)v8;
  double v10 = v7 / (double)v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)chatSentInvitation:(id)a3
{
  id v9 = a3;
  if ([v9 isOutgoing])
  {
    double v4 = [(CSDAbstractIDSProviderDelegate *)self provider];
    double v5 = [v9 UUID];
    [v4 reportOutgoingCallWithUUID:v5 sentInvitationAtDate:0];

    double v6 = [(CSDAbstractIDSProviderDelegate *)self callUpdateForChat:v9];
    objc_msgSend(v6, "setMayRequireBreakBeforeMake:", objc_msgSend(v9, "mayRequireBreakBeforeMake"));
    double v7 = [(CSDAbstractIDSProviderDelegate *)self provider];
    unsigned int v8 = [v9 UUID];
    [v7 reportCallWithUUID:v8 updated:v6];
  }
}

- (void)chatConnected:(id)a3
{
  id v4 = a3;
  double v5 = [(CSDAbstractIDSProviderDelegate *)self callUpdateForChat:v4];
  objc_msgSend(v5, "setVideoStreamToken:", objc_msgSend(v4, "videoStreamToken"));
  double v6 = [(CSDAbstractIDSProviderDelegate *)self provider];
  double v7 = [v4 UUID];
  [v6 reportCallWithUUID:v7 updated:v5];

  LODWORD(v7) = [v4 isOutgoing];
  unsigned int v8 = [(CSDAbstractIDSProviderDelegate *)self provider];
  if (v7)
  {
    id v9 = [v4 UUID];
    double v10 = [v4 dateConnected];
    [v8 reportOutgoingCallWithUUID:v9 connectedAtDate:v10];
  }
  else
  {
    uint64_t v11 = objc_opt_class();
    double v12 = [v4 UUID];
    id v13 = [v8 pendingCallActionsOfClass:v11 withCallUUID:v12];

    if ([v13 count])
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v15)
      {
        id v16 = v15;
        unsigned int v24 = v5;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            long long v20 = sub_100008DCC();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v19;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Chat with matching UUID connected; attempting to fulfill pending answer call action %@",
                buf,
                0xCu);
            }

            if (([v19 isComplete] & 1) == 0)
            {
              long long v21 = [v4 dateConnected];
              if (v21)
              {
                [v19 fulfillWithDateConnected:v21];
              }
              else
              {
                uint64_t v22 = sub_100008DCC();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v30 = v19;
                  _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Chat did not provide a connection date; Failing answer call action %@",
                    buf,
                    0xCu);
                }

                [v19 fail];
              }
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v16);
        double v5 = v24;
      }
    }
    else
    {
      long long v14 = sub_100008DCC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [v4 UUID];
        *(_DWORD *)buf = 138412290;
        id v30 = v23;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] No pending answer call actions found with UUID: %@", buf, 0xCu);
      }
    }
  }
}

- (void)chatEnded:(id)a3
{
  id v4 = a3;
  [(CSDAbstractIDSProviderDelegate *)self updateCacheWithChat:v4];
  double v5 = [(CSDAbstractIDSProviderDelegate *)self provider];
  uint64_t v6 = objc_opt_class();
  double v7 = [v4 UUID];
  unsigned int v8 = [v5 pendingCallActionsOfClass:v6 withCallUUID:v7];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v15 = sub_100008DCC();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v4;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failing answer call action for call because it disconnected before connecting: %@", buf, 0xCu);
        }

        if (([v14 isComplete] & 1) == 0) {
          [v14 fail];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v11);
  }
}

- (void)chat:(id)a3 changedBytesOfDataUsed:(int64_t)a4
{
  id v6 = a3;
  id v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
  double v7 = [v6 UUID];
  unsigned int v8 = [v6 crossDeviceIdentifier];

  [v9 reportCallWithUUID:v7 crossDeviceIdentifier:v8 changedBytesOfDataUsed:a4];
}

- (void)chat:(id)a3 inputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
  unsigned int v8 = [v7 UUID];

  [v9 reportCallWithUUID:v8 changedFrequencyData:v6 forDirection:2];
}

- (void)chat:(id)a3 outputFrequencyLevelChangedTo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
  unsigned int v8 = [v7 UUID];

  [v9 reportCallWithUUID:v8 changedFrequencyData:v6 forDirection:1];
}

- (void)chat:(id)a3 inputLevelChangedTo:(float)a4
{
  id v6 = a3;
  id v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
  id v7 = [v6 UUID];

  *(float *)&double v8 = a4;
  [v9 reportCallWithUUID:v7 changedMeterLevel:2 forDirection:v8];
}

- (void)chat:(id)a3 outputLevelChangedTo:(float)a4
{
  id v6 = a3;
  id v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
  id v7 = [v6 UUID];

  *(float *)&double v8 = a4;
  [v9 reportCallWithUUID:v7 changedMeterLevel:1 forDirection:v8];
}

- (CSDIDSProviderDelegateCapabilities)capabilities
{
  return self->_capabilities;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (NSMutableOrderedSet)mutableChats
{
  return self->_mutableChats;
}

- (BOOL)shouldOverrideNetworkAsAvailable
{
  return self->_shouldOverrideNetworkAsAvailable;
}

- (id)providerDidBegin
{
  return self->_providerDidBegin;
}

- (void)setProviderDidBegin:(id)a3
{
}

- (id)incomingSessionProviderGenerator
{
  return self->_incomingSessionProviderGenerator;
}

- (void)setIncomingSessionProviderGenerator:(id)a3
{
}

- (id)incomingChatGenerator
{
  return self->_incomingChatGenerator;
}

- (void)setIncomingChatGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_incomingChatGenerator, 0);
  objc_storeStrong(&self->_incomingSessionProviderGenerator, 0);
  objc_storeStrong(&self->_providerDidBegin, 0);
  objc_storeStrong((id *)&self->_mutableChats, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end