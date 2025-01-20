@interface CSDFaceTimeIDSProviderDelegate
- (BOOL)canUpgradeChat:(id)a3;
- (BOOL)hasCallStartedConnectingWithUUID:(id)a3;
- (BOOL)isManagingCallWithUUID:(id)a3;
- (BOOL)isMediaAllowedForChat:(id)a3;
- (BOOL)isMomentsAvailableForChat:(id)a3;
- (BOOL)isUpgradingCallWithUUID:(id)a3;
- (CSDConversationServerBag)conversationServerBag;
- (CSDFaceTimeIDSProviderDelegate)init;
- (CSDFaceTimeIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4;
- (CSDFaceTimeIDSProviderDelegate)initWithQueue:(id)a3;
- (CSDFaceTimeIDSProviderDelegateCapabilities)capabilities;
- (CSDFaceTimeIDSProviderDelegateServerBag)serverBag;
- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate;
- (NSMutableSet)chatsPendingUpgrade;
- (NSOrderedSet)telephonySenderIdentities;
- (NSSet)accounts;
- (OS_dispatch_queue)queue;
- (TUCallProviderManager)callProviderManager;
- (TUFeatureFlags)featureFlags;
- (double)upgradeTimeout;
- (id)ISOCountryCodeForCallWithUUID:(id)a3;
- (id)ISOCountryCodeForChat:(id)a3;
- (id)accountWithUUID:(id)a3 service:(id)a4;
- (id)callForConversation:(id)a3 withSessionToken:(id)a4;
- (id)callUpdateForChat:(id)a3;
- (id)facetimeIDSServiceGenerator;
- (id)isAccountActive;
- (id)outgoingChatGenerator;
- (id)outgoingSessionProviderGenerator;
- (id)upgradeCallForConversation:(id)a3 withSessionToken:(id)a4;
- (id)upgradeSessionUUIDForCallWithUUID:(id)a3;
- (void)chatEnded:(id)a3;
- (void)chatStartedConnecting:(id)a3;
- (void)endCallWithUUID:(id)a3;
- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3;
- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3;
- (void)endCallWithUUIDAsLocalHangup:(id)a3;
- (void)inviteIDSPeersWithAction:(id)a3 destinations:(id)a4 joinCallActionToFulfill:(id)a5 completion:(id)a6;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)providerDidBegin:(id)a3;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)setAccounts:(id)a3;
- (void)setConversationServerBag:(id)a3;
- (void)setFaceTimeDemuxerDelegate:(id)a3;
- (void)setFacetimeIDSServiceGenerator:(id)a3;
- (void)setIsAccountActive:(id)a3;
- (void)setOutgoingChatGenerator:(id)a3;
- (void)setOutgoingSessionProviderGenerator:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setTelephonySenderIdentities:(id)a3;
- (void)setUpgradeTimeout:(double)a3;
- (void)updateProviderConfigurationWithAccounts:(id)a3;
- (void)updateProviderConfigurationWithAccounts:(id)a3 senderIdentities:(id)a4;
- (void)updateProviderConfigurationWithSenderIdentities:(id)a3;
- (void)upgradeChatIfNecessary:(id)a3;
@end

@implementation CSDFaceTimeIDSProviderDelegate

- (CSDFaceTimeIDSProviderDelegate)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDFaceTimeIDSProviderDelegate.m", 47, @"%s is not available. Use an available initializer instead.", "-[CSDFaceTimeIDSProviderDelegate init]");

  return 0;
}

- (CSDFaceTimeIDSProviderDelegate)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CSDFaceTimeIDSProviderDelegateCapabilities);
  v6 = [(CSDFaceTimeIDSProviderDelegate *)self initWithCapabilities:v5 queue:v4];

  return v6;
}

- (CSDFaceTimeIDSProviderDelegate)initWithCapabilities:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CSDFaceTimeIDSProviderDelegate;
  v9 = [(CSDAbstractIDSProviderDelegate *)&v36 initWithCapabilities:v7 queue:v8];
  v10 = v9;
  if (v9)
  {
    p_queue = &v9->_queue;
    objc_storeStrong((id *)&v9->_queue, a4);
    v12 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v10->_featureFlags;
    v10->_featureFlags = v12;

    objc_storeStrong((id *)&v10->_capabilities, a3);
    uint64_t v14 = +[FTServerBag sharedInstance];
    serverBag = v10->_serverBag;
    v10->_serverBag = (CSDFaceTimeIDSProviderDelegateServerBag *)v14;

    if (([(CSDFaceTimeIDSProviderDelegateServerBag *)v10->_serverBag isLoaded] & 1) == 0) {
      [(CSDFaceTimeIDSProviderDelegateServerBag *)v10->_serverBag startBagLoad];
    }
    v16 = objc_alloc_init(CSDSharedConversationServerBag);
    conversationServerBag = v10->_conversationServerBag;
    v10->_conversationServerBag = (CSDConversationServerBag *)v16;

    id facetimeIDSServiceGenerator = v10->_facetimeIDSServiceGenerator;
    v10->_id facetimeIDSServiceGenerator = &stru_100506938;

    id isAccountActive = v10->_isAccountActive;
    v10->_id isAccountActive = &stru_100506978;

    objc_initWeak(&location, v10);
    v30 = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472;
    v32 = sub_1000A4330;
    v33 = &unk_1005069A0;
    objc_copyWeak(&v34, &location);
    v20 = objc_retainBlock(&v30);
    id outgoingSessionProviderGenerator = v10->_outgoingSessionProviderGenerator;
    v10->_id outgoingSessionProviderGenerator = v20;

    id outgoingChatGenerator = v10->_outgoingChatGenerator;
    v10->_id outgoingChatGenerator = &stru_1005069E0;

    v23 = +[CSDFaceTimeAudioIDSService sharedInstance];
    [v23 addServiceDelegate:v10 queue:*p_queue];

    v24 = +[CSDFaceTimeVideoIDSService sharedInstance];
    [v24 addServiceDelegate:v10 queue:*p_queue];

    uint64_t v25 = +[NSMutableSet set];
    chatsPendingUpgrade = v10->_chatsPendingUpgrade;
    v10->_chatsPendingUpgrade = (NSMutableSet *)v25;

    v10->_upgradeTimeout = 5.0;
    v27 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    callProviderManager = v10->_callProviderManager;
    v10->_callProviderManager = v27;

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)accountWithUUID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeIDSProviderDelegate *)self callProviderManager];
  v9 = [v8 faceTimeProvider];
  v10 = [v9 senderIdentityForUUID:v6];

  if (!v10)
  {
    v11 = [(CSDFaceTimeIDSProviderDelegate *)self callProviderManager];
    v12 = [v11 faceTimeProvider];
    v10 = [v12 senderIdentityForAccountUUID:v6];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = [v7 service];
  uint64_t v14 = [v13 accounts];

  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    id v27 = v6;
    id v28 = v7;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "loginID", v27);
        v20 = TUHandleForIDSCanonicalAddress();

        v21 = [v10 handle];
        unsigned int v22 = [v21 isEqualToHandle:v20];

        if (v22)
        {
          v23 = [(CSDFaceTimeIDSProviderDelegate *)self isAccountActive];
          int v24 = ((uint64_t (**)(void, void *))v23)[2](v23, v18);

          if (v24)
          {
            id v15 = v18;
            uint64_t v25 = sub_100008DCC();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v6 = v27;
              id v34 = v27;
              __int16 v35 = 2112;
              id v36 = v15;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found matching account: %@ for uuid: %@", buf, 0x16u);
            }
            else
            {
              id v6 = v27;
            }
            id v7 = v28;
          }
          else
          {
            uint64_t v25 = sub_100008DCC();
            id v7 = v28;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v6 = v27;
              id v34 = v27;
              __int16 v35 = 2112;
              id v36 = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Found matching account: %@ for uuid: %@ but it was not active and cannot be used for FaceTime.", buf, 0x16u);
              id v15 = 0;
            }
            else
            {
              id v15 = 0;
              id v6 = v27;
            }
          }

          goto LABEL_21;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v15) {
        continue;
      }
      break;
    }
    id v6 = v27;
    id v7 = v28;
  }
LABEL_21:

  return v15;
}

- (void)inviteIDSPeersWithAction:(id)a3 destinations:(id)a4 joinCallActionToFulfill:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v74 = a4;
  id v11 = a5;
  v12 = (void (**)(id, void *, void))a6;
  v13 = [(CSDFaceTimeIDSProviderDelegate *)self serverBag];
  unsigned int v14 = [v13 isLoaded];

  if (v14)
  {
    id v15 = [(CSDFaceTimeIDSProviderDelegate *)self serverBag];
    unsigned __int8 v16 = [v15 isQuickRelaySupported];

    if ((v16 & 1) == 0)
    {
      v17 = sub_100008DCC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Server bag does not support quick relay", buf, 2u);
      }

      v18 = sub_100008DCC();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Not attempting to use IDSSession for outgoing FT call because server bag does not allow quick relay invitations", buf, 2u);
      }

      v12[2](v12, &__NSArray0__struct, 0);
      goto LABEL_42;
    }
  }
  else
  {
    v19 = sub_100008DCC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Server bag is not loaded. Assuming we can make a FaceTime call over quick relay", buf, 2u);
    }
  }
  v20 = [v10 handle];
  v21 = [(CSDAbstractIDSProviderDelegate *)self waitingChatWithHandle:v20 isOutgoing:0];

  if (v21)
  {
    unsigned int v22 = sub_100008DCC();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v79 = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Tried to make an outgoing call when we already had a ringing call with the same destination: %@", buf, 0xCu);
    }

    v12[2](v12, &__NSArray0__struct, 1);
    [v10 fail];
    [v11 fail];
    v23 = [v21 UUID];
    id v24 = [objc_alloc((Class)CXAnswerCallAction) initWithCallUUID:v23];
    id v25 = [objc_alloc((Class)CXTransaction) initWithAction:v24];
    v26 = sub_100008DCC();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Requesting transaction to answer already-ringing call", buf, 2u);
    }

    id v27 = [(CSDFaceTimeIDSProviderDelegate *)self faceTimeDemuxerDelegate];
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1000A51F4;
    v75[3] = &unk_100505418;
    id v76 = v23;
    v77 = self;
    id v28 = v23;
    [v27 providerDelegate:self requestedTransaction:v25 completion:v75];
  }
  else
  {
    long long v29 = [(CSDFaceTimeIDSProviderDelegate *)self facetimeIDSServiceGenerator];
    ((void (**)(void, id))v29)[2](v29, [v10 isVideo]);
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    long long v30 = [v10 localSenderIdentityUUID];
    v73 = v11;
    if (v30)
    {
      long long v31 = [v10 localSenderIdentityUUID];
      long long v32 = [(CSDFaceTimeIDSProviderDelegate *)self accountWithUUID:v31 service:v24];
      v33 = v32;
      if (v32)
      {
        id v34 = v32;
      }
      else
      {
        id v34 = [v24 account];
      }
      id v25 = v34;

      id v11 = v73;
    }
    else
    {
      id v25 = [v24 account];
    }

    __int16 v35 = [(CSDFaceTimeIDSProviderDelegate *)self isAccountActive];
    int v36 = ((uint64_t (**)(void, id))v35)[2](v35, v25);

    if (v36)
    {
      id v71 = v24;
      v72 = objc_msgSend(v25, "csd_ISOCountryCode");
      if ([v72 length])
      {
        v37 = objc_opt_class();
        v38 = [v10 handle];
        v39 = [v38 tuHandle];
        v40 = [v37 handleByFullyQualifyingHandle:v39 usingCountryCode:v72];
        v41 = [v40 value];
        v42 = [v41 IDSFormattedDestinationID];

        id v11 = v73;
      }
      else
      {
        v42 = 0;
      }
      if ([v42 length])
      {
        v84[0] = IDSSessionTransportTypeKey;
        v84[1] = IDSSessionWaitForPreConnectionDataKey;
        v85[0] = &off_100523AB8;
        v85[1] = &__kCFBooleanTrue;
        v85[2] = &__kCFBooleanTrue;
        v84[2] = IDSSessionAlwaysSkipSelfKey;
        v84[3] = IDSSessionInvitationIsRetryKey;
        v44 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v10 isRetry]);
        v85[3] = v44;
        uint64_t v45 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:4];

        v46 = sub_100008DCC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v79 = v25;
          __int16 v80 = 2112;
          id v81 = v74;
          __int16 v82 = 2112;
          uint64_t v83 = v45;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Starting FaceTime IDS chat using account: %@ destinations: %@ options: %@", buf, 0x20u);
        }

        v70 = v42;
        if ([v11 screenShareRequestType])
        {
          v47 = [(CSDFaceTimeIDSProviderDelegate *)self featureFlags];
          id v48 = [v47 requestToScreenShareEnabled];
        }
        else
        {
          id v48 = 0;
        }
        v50 = [(CSDFaceTimeIDSProviderDelegate *)self outgoingSessionProviderGenerator];
        v51 = [(CSDFaceTimeIDSProviderDelegate *)self queue];
        v69 = ((void (**)(void, id, id, uint64_t, id, void *))v50)[2](v50, v25, v74, v45, v48, v51);

        id v52 = [[CSDExternalIDSDualSession alloc] initAsInitiatorWithSessionProvider:v69];
        v53 = [(CSDFaceTimeIDSProviderDelegate *)self callProviderManager];
        v68 = [v53 faceTimeProvider];

        [v10 isVideo];
        [v10 isUpgrade];
        v65 = v52;
        [v52 setInvitationTimeout:(double)TUOutgoingInvitationTimeoutForCallProviderAndIsUpgrade()];
        v54 = [(CSDFaceTimeIDSProviderDelegate *)self outgoingChatGenerator];
        v64 = [v10 callUUID];
        [v10 handle];
        v55 = id v67 = v25;
        [v55 tuHandle];
        v56 = v66 = (void *)v45;
        id v57 = [v10 isVideo];
        id v58 = [v10 isRelay];
        v59 = [v10 localSenderIdentityUUID];
        v60 = ((void (**)(void, id, void *, void *, id, id, void *))v54)[2](v54, v52, v64, v56, v57, v58, v59);

        id v25 = v67;
        [v60 setDelegate:self];
        objc_msgSend(v60, "setShouldSuppressInCallUI:", objc_msgSend(v10, "shouldSuppressInCallUI"));
        [v60 startWithVideoAspectRatioDescriptor:v10 inviteCompletion:v12];
        [(CSDAbstractIDSProviderDelegate *)self updateCacheWithChat:v60];
        v61 = [(CSDAbstractIDSProviderDelegate *)self provider];
        v62 = [v10 callUUID];
        v63 = [(CSDFaceTimeIDSProviderDelegate *)self callUpdateForChat:v60];
        [v61 reportCallWithUUID:v62 updated:v63];

        [v10 fulfill];
        [v73 fulfill];

        id v11 = v73;
        v21 = 0;
        id v24 = v71;
        v42 = v70;
      }
      else
      {
        v49 = sub_100008DCC();
        id v24 = v71;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_1003A96B0(v10, (uint64_t)v42, v49);
        }

        v12[2](v12, &__NSArray0__struct, 0);
      }
    }
    else
    {
      v43 = sub_100008DCC();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        sub_1003A9754();
      }

      v12[2](v12, &__NSArray0__struct, 0);
    }
  }

LABEL_42:
}

- (id)callUpdateForChat:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)CXCallUpdate) initWithFaceTimeIDSChat:v4];
  id v6 = [(CSDFaceTimeIDSProviderDelegate *)self ISOCountryCodeForChat:v4];

  [v5 setISOCountryCode:v6];

  return v5;
}

- (id)upgradeCallForConversation:(id)a3 withSessionToken:(id)a4
{
  id v5 = [(CSDFaceTimeIDSProviderDelegate *)self callForConversation:a3 withSessionToken:a4];
  if ([(CSDFaceTimeIDSProviderDelegate *)self canUpgradeChat:v5])
  {
    [(CSDFaceTimeIDSProviderDelegate *)self upgradeChatIfNecessary:v5];
    id v6 = sub_100008DCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Found a chat to upgrade: %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = [v5 UUID];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)callForConversation:(id)a3 withSessionToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [(CSDAbstractIDSProviderDelegate *)self chats];
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      unsigned int v14 = [v13 remoteFromID];
      id v21 = 0;
      id v15 = [v14 _stripPotentialTokenURIWithToken:&v21];
      id v16 = v21;

      if (v16)
      {
        if ([v16 isEqualToData:v7])
        {
          id v18 = v13;

          if (!v18) {
            goto LABEL_18;
          }
          v19 = sub_100008DCC();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v27 = v18;
            __int16 v28 = 2112;
            id v29 = v6;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found existing chat: %@ for conversation: %@", buf, 0x16u);
          }
          goto LABEL_21;
        }
      }
      else
      {
        v17 = sub_100008DCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1003A98B4(v30, v13, &v31, v17);
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

LABEL_18:
  v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    sub_1003A983C((uint64_t)v6, v19);
  }
  id v18 = 0;
LABEL_21:

  return v18;
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v5 = a4;
  id v6 = [v5 callUUID];
  id v7 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v6];

  if ([(CSDFaceTimeIDSProviderDelegate *)self canUpgradeChat:v7])
  {
    [(CSDFaceTimeIDSProviderDelegate *)self upgradeChatIfNecessary:v7];
  }
  else
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Failing action %@ we determined that chat %@ cannot be upgraded.", (uint8_t *)&v9, 0x16u);
    }

    [v5 fail];
  }
}

- (id)ISOCountryCodeForCallWithUUID:(id)a3
{
  id v4 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:a3];
  if (v4)
  {
    id v5 = [(CSDFaceTimeIDSProviderDelegate *)self ISOCountryCodeForChat:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)ISOCountryCodeForChat:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isVideo];
  id v6 = off_100502BD8;
  if (!v5) {
    id v6 = off_100502BC8;
  }
  id v7 = [(__objc2_class *)*v6 sharedInstance];
  if (v7)
  {
    id v8 = [v4 localSenderIdentityUUID];
    if (v8)
    {
      int v9 = [(CSDFaceTimeIDSProviderDelegate *)self accountWithUUID:v8 service:v7];
      id v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        id v11 = [v7 account];
      }
      v13 = v11;
    }
    else
    {
      v13 = [v7 account];
    }
    uint64_t v12 = objc_msgSend(v13, "csd_ISOCountryCode");
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)isManagingCallWithUUID:(id)a3
{
  v3 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isUpgradingCallWithUUID:(id)a3
{
  BOOL v4 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:a3];
  if (v4)
  {
    unsigned int v5 = [(CSDFaceTimeIDSProviderDelegate *)self chatsPendingUpgrade];
    unsigned __int8 v6 = [v5 containsObject:v4];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)canUpgradeChat:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDFaceTimeIDSProviderDelegate *)self chatsPendingUpgrade];
  unsigned int v6 = [v5 containsObject:v4];

  if (v4
    && [v4 isConnected]
    && [v4 isVideo]
    && [v4 isSendingVideo])
  {
    unsigned int v7 = [v4 isSendingAudio] & (v6 ^ 1);
  }
  else
  {
    unsigned int v7 = 0;
  }
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v9 = &stru_100517F40;
    }
    else {
      CFStringRef v9 = @"Not";
    }
    int v11 = 138413826;
    CFStringRef v12 = v9;
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 1024;
    unsigned int v16 = [v4 isConnected];
    __int16 v17 = 1024;
    unsigned int v18 = [v4 isVideo];
    __int16 v19 = 1024;
    unsigned int v20 = [v4 isSendingVideo];
    __int16 v21 = 1024;
    unsigned int v22 = [v4 isSendingAudio];
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Auto-upgrading because chatToUpgrade is %@, isConnected: %d, isVideo: %d, isSendingVideo: %d, isSendingAudio: %d isChatPendingUpgrade: %d", (uint8_t *)&v11, 0x34u);
  }

  return v7;
}

- (void)upgradeChatIfNecessary:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Upgrading chat: %@", buf, 0xCu);
  }

  unsigned int v6 = [(CSDFaceTimeIDSProviderDelegate *)self chatsPendingUpgrade];
  [v6 addObject:v4];

  [(CSDFaceTimeIDSProviderDelegate *)self upgradeTimeout];
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  CFStringRef v9 = [(CSDFaceTimeIDSProviderDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A5CC4;
  block[3] = &unk_100504EC0;
  id v12 = v4;
  id v10 = v4;
  dispatch_after(v8, v9, block);
}

- (id)upgradeSessionUUIDForCallWithUUID:(id)a3
{
  v3 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:a3];
  id v4 = [v3 upgradeSessionUUID];

  return v4;
}

- (BOOL)hasCallStartedConnectingWithUUID:(id)a3
{
  v3 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:a3];
  id v4 = [v3 dateStartedConnecting];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)endCallWithUUIDAsAnsweredElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v4];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithAnsweredElsewhere];
  }
  else
  {
    double v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v8 = [v4 UUIDString];
      CFStringRef v9 = [(CSDAbstractIDSProviderDelegate *)self chats];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      __int16 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find chat with UUID %@. All chats: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)endCallWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v4];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 end];
  }
  else
  {
    double v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v8 = [v4 UUIDString];
      CFStringRef v9 = [(CSDAbstractIDSProviderDelegate *)self chats];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      __int16 v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find chat with UUID %@. All chats: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)endCallWithUUIDAsLocalHangup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v4];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithLocalHangup];
    if ([v6 isConnected])
    {
      double v7 = sub_100008DCC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        dispatch_time_t v8 = [v4 UUIDString];
        CFStringRef v9 = [(CSDAbstractIDSProviderDelegate *)self chats];
        int v13 = 138412546;
        id v14 = v8;
        __int16 v15 = 2112;
        unsigned int v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found chat with UUID %@. Ending it: %@", (uint8_t *)&v13, 0x16u);
      }
      [v6 end];
    }
  }
  else
  {
    int v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [v4 UUIDString];
      __int16 v12 = [(CSDAbstractIDSProviderDelegate *)self chats];
      int v13 = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      unsigned int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find chat with UUID %@. All chats: %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)endCallWithUUIDAsDeclinedElsewhere:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDAbstractIDSProviderDelegate *)self chatWithUUID:v4];
  unsigned int v6 = v5;
  if (v5)
  {
    [v5 cancelInvitationWithDeclinedElsewhere];
  }
  else
  {
    double v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v8 = [v4 UUIDString];
      CFStringRef v9 = [(CSDAbstractIDSProviderDelegate *)self chats];
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find chat with UUID %@. All chats: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)isMediaAllowedForChat:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CSDFaceTimeIDSProviderDelegate *)self faceTimeDemuxerDelegate];
  unsigned int v6 = [v4 UUID];
  unsigned __int8 v7 = [v5 providerDelegate:self isManagingCallWithUUID:v6];

  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)CSDFaceTimeIDSProviderDelegate;
    BOOL v8 = [(CSDAbstractIDSProviderDelegate *)&v12 isMediaAllowedForChat:v4];
  }
  else
  {
    CFStringRef v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = [v4 UUID];
      *(_DWORD *)buf = 138412290;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Not allowing media for chat as the call provider is not managing a call with UUID: %@", buf, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (void)chatStartedConnecting:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(-[CSDFaceTimeIDSProviderDelegate superclass](self, "superclass"), "instancesRespondToSelector:", "chatStartedConnecting:"))
  {
    v11.receiver = self;
    v11.super_class = (Class)CSDFaceTimeIDSProviderDelegate;
    [(CSDFaceTimeIDSProviderDelegate *)&v11 chatStartedConnecting:v4];
  }
  if ([v4 isOutgoing])
  {
    BOOL v5 = [(CSDFaceTimeIDSProviderDelegate *)self faceTimeDemuxerDelegate];
    unsigned int v6 = [v4 UUID];
    unsigned __int8 v7 = [v4 dateStartedConnecting];
    [v5 providerDelegate:self callWithUUID:v6 startedConnectingAtDate:v7];

    BOOL v8 = [(CSDFaceTimeIDSProviderDelegate *)self callUpdateForChat:v4];
    CFStringRef v9 = [(CSDAbstractIDSProviderDelegate *)self provider];
    int v10 = [v4 UUID];
    [v9 reportCallWithUUID:v10 updated:v8];
  }
}

- (void)chatEnded:(id)a3
{
  id v4 = a3;
  [(CSDAbstractIDSProviderDelegate *)self updateCacheWithChat:v4];
  BOOL v5 = [(CSDFaceTimeIDSProviderDelegate *)self chatsPendingUpgrade];
  unsigned __int8 v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    unsigned __int8 v7 = [(CSDFaceTimeIDSProviderDelegate *)self faceTimeDemuxerDelegate];
    BOOL v8 = [v4 UUID];
    CFStringRef v9 = [v4 dateEnded];
    id v10 = [v4 endedReason];
    objc_super v11 = [v4 failureContext];
    [v7 providerDelegate:self callWithUUID:v8 endedAtDate:v9 withReason:v10 failureContext:v11];

    if (objc_msgSend(-[CSDFaceTimeIDSProviderDelegate superclass](self, "superclass"), "instancesRespondToSelector:", "chatEnded:"))
    {
      v14.receiver = self;
      v14.super_class = (Class)CSDFaceTimeIDSProviderDelegate;
      [(CSDAbstractIDSProviderDelegate *)&v14 chatEnded:v4];
    }
  }
  objc_super v12 = +[CSDReportingController sharedInstance];
  [v12 chatReceived:v4];

  int v13 = [(CSDFaceTimeIDSProviderDelegate *)self chatsPendingUpgrade];
  [v13 removeObject:v4];
}

- (BOOL)isMomentsAvailableForChat:(id)a3
{
  v3 = [(CSDFaceTimeIDSProviderDelegate *)self capabilities];
  unsigned __int8 v4 = [v3 isMomentsAvailable];

  return v4;
}

- (void)updateProviderConfigurationWithAccounts:(id)a3
{
  id v6 = a3;
  id v4 = [(CSDFaceTimeIDSProviderDelegate *)self accounts];

  if (v4 != v6)
  {
    [(CSDFaceTimeIDSProviderDelegate *)self setAccounts:v6];
    BOOL v5 = [(CSDFaceTimeIDSProviderDelegate *)self telephonySenderIdentities];
    [(CSDFaceTimeIDSProviderDelegate *)self updateProviderConfigurationWithAccounts:v6 senderIdentities:v5];
  }
}

- (void)updateProviderConfigurationWithSenderIdentities:(id)a3
{
  id v6 = a3;
  id v4 = [(CSDFaceTimeIDSProviderDelegate *)self telephonySenderIdentities];

  if (v4 != v6)
  {
    [(CSDFaceTimeIDSProviderDelegate *)self setTelephonySenderIdentities:v6];
    BOOL v5 = [(CSDFaceTimeIDSProviderDelegate *)self accounts];
    [(CSDFaceTimeIDSProviderDelegate *)self updateProviderConfigurationWithAccounts:v5 senderIdentities:v6];
  }
}

- (void)updateProviderConfigurationWithAccounts:(id)a3 senderIdentities:(id)a4
{
  id v30 = a3;
  id v5 = a4;
  id v28 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v5;
    __int16 v45 = 2112;
    id v46 = v30;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Matching sender identities %@ to IDS accounts %@", buf, 0x16u);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v31)
  {
    uint64_t v29 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v38 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v32 = v7;
        BOOL v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v9 = v30;
        id v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v34;
          while (2)
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v9);
              }
              objc_super v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              __int16 v15 = [v8 account];
              unsigned int v16 = [v15 UUID];

              __int16 v17 = [v14 matchingSim];
              unsigned int v18 = [v17 SIMIdentifier];
              __int16 v19 = [v16 UUIDString];
              unsigned int v20 = [v18 isEqualToString:v19];

              if (v20)
              {
                [v28 addObject:v8];

                goto LABEL_18;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_18:

        uint64_t v7 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v31);
  }

  __int16 v21 = [(CSDAbstractIDSProviderDelegate *)self provider];
  unsigned int v22 = [v21 configuration];
  id v23 = [v22 copy];

  [v23 setPrioritizedSenderIdentities:v28];
  unsigned int v24 = sub_100008DCC();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v23;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updating FaceTime provider with configuration %@", buf, 0xCu);
  }

  long long v25 = [(CSDAbstractIDSProviderDelegate *)self provider];
  [v25 setConfiguration:v23];
}

- (void)providerDidBegin:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDFaceTimeIDSProviderDelegate;
  [(CSDAbstractIDSProviderDelegate *)&v7 providerDidBegin:a3];
  id v4 = +[CSDFaceTimeVideoIDSService sharedInstance];
  id v5 = [v4 service];
  id v6 = [v5 accounts];
  [(CSDFaceTimeIDSProviderDelegate *)self updateProviderConfigurationWithAccounts:v6];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "service: %@ activeAccountsChanged: %@", (uint8_t *)&v9, 0x16u);
  }

  [(CSDFaceTimeIDSProviderDelegate *)self updateProviderConfigurationWithAccounts:v7];
}

- (CSDFaceTimeProviderDelegateManagerDelegate)faceTimeDemuxerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceTimeDemuxerDelegate);

  return (CSDFaceTimeProviderDelegateManagerDelegate *)WeakRetained;
}

- (void)setFaceTimeDemuxerDelegate:(id)a3
{
}

- (NSSet)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDFaceTimeIDSProviderDelegateCapabilities)capabilities
{
  return self->_capabilities;
}

- (NSOrderedSet)telephonySenderIdentities
{
  return self->_telephonySenderIdentities;
}

- (void)setTelephonySenderIdentities:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)conversationServerBag
{
  return self->_conversationServerBag;
}

- (void)setConversationServerBag:(id)a3
{
}

- (NSMutableSet)chatsPendingUpgrade
{
  return self->_chatsPendingUpgrade;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDFaceTimeIDSProviderDelegateServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (id)facetimeIDSServiceGenerator
{
  return self->_facetimeIDSServiceGenerator;
}

- (void)setFacetimeIDSServiceGenerator:(id)a3
{
}

- (id)isAccountActive
{
  return self->_isAccountActive;
}

- (void)setIsAccountActive:(id)a3
{
}

- (id)outgoingSessionProviderGenerator
{
  return self->_outgoingSessionProviderGenerator;
}

- (void)setOutgoingSessionProviderGenerator:(id)a3
{
}

- (id)outgoingChatGenerator
{
  return self->_outgoingChatGenerator;
}

- (void)setOutgoingChatGenerator:(id)a3
{
}

- (double)upgradeTimeout
{
  return self->_upgradeTimeout;
}

- (void)setUpgradeTimeout:(double)a3
{
  self->_upgradeTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outgoingChatGenerator, 0);
  objc_storeStrong(&self->_outgoingSessionProviderGenerator, 0);
  objc_storeStrong(&self->_isAccountActive, 0);
  objc_storeStrong(&self->_facetimeIDSServiceGenerator, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_chatsPendingUpgrade, 0);
  objc_storeStrong((id *)&self->_conversationServerBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_telephonySenderIdentities, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_accounts, 0);

  objc_destroyWeak((id *)&self->_faceTimeDemuxerDelegate);
}

@end