@interface CSDConversationManagerXPCServer
- (BOOL)_shouldSend:(id)a3;
- (CSDClientManager)clientManager;
- (CSDConversationManager)conversationManager;
- (CSDConversationManagerXPCServer)initWithConversationManager:(id)a3 featureFlags:(id)a4;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)_conversationsByGroupUUIDFilteredForClient:(id)a3;
- (id)_filter:(id)a3 withClient:(id)a4;
- (int)clientsShouldConnectToken;
- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4;
- (void)activateLink:(id)a3 completionHandler:(id)a4;
- (void)activatedConversationLinks:(id)a3;
- (void)activityAuthorizedBundleIdentifierState:(id)a3;
- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5;
- (void)addCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6;
- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4;
- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5;
- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5;
- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)buzzMember:(id)a3 conversationUUID:(id)a4;
- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4;
- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4;
- (void)conversationManager:(id)a3 activatedConversationLinksChanged:(id)a4;
- (void)conversationManager:(id)a3 activeParticipant:(id)a4 addedHighlightToConversation:(id)a5 highlightIdentifier:(id)a6 oldHighlightIdentifier:(id)a7 isFirstAdd:(BOOL)a8;
- (void)conversationManager:(id)a3 activeParticipant:(id)a4 removedHighlightFrom:(id)a5 highlightIdentifier:(id)a6;
- (void)conversationManager:(id)a3 activityAuthorizationChangedForBundleIdentifier:(id)a4;
- (void)conversationManager:(id)a3 addedCollaborationDictionary:(id)a4 forConversation:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 buzzedMember:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 collaborationStateChanged:(int64_t)a5 highlightIdentifier:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeSceneAssociationForActivitySession:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeStateForActivitySession:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 mediaPrioritiesDidChangeForParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 didReact:(id)a6;
- (void)conversationManager:(id)a3 conversation:(id)a4 participantDidStopReacting:(id)a5;
- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5;
- (void)conversationManager:(id)a3 conversationChanged:(id)a4;
- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5;
- (void)conversationManager:(id)a3 conversationUpdateMessagesGroupPhoto:(id)a4;
- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5;
- (void)conversationManager:(id)a3 remoteScreenShareEndedWithReason:(id)a4;
- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4;
- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5;
- (void)conversationManager:(id)a3 updateIncomingPendingConversationsByGroupUUID:(id)a4;
- (void)conversationsByGroupUUID:(id)a3;
- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)dealloc;
- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3;
- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5;
- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4;
- (void)getInactiveLinkWithCompletionHandler:(id)a3;
- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3;
- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4;
- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5;
- (void)getScreenSharingAvailableWithCompletionHandler:(id)a3;
- (void)getSharePlayAvailableWithCompletionHandler:(id)a3;
- (void)incomingPendingConversationsByGroupUUID:(id)a3;
- (void)invalidate;
- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5;
- (void)joinConversationWithRequest:(id)a3;
- (void)kickMember:(id)a3 conversationUUID:(id)a4;
- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6;
- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4;
- (void)leaveConversationWithUUID:(id)a3;
- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4;
- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4;
- (void)notifyClientsOfConversationsByGroupUUIDUpdate;
- (void)notifyClientsOfMediaPrioritiesChangedForConversation:(id)a3;
- (void)notifyClientsToConnectIfNecessary;
- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4;
- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4;
- (void)pseudonymsByCallUUID:(id)a3;
- (void)refreshActiveConversations;
- (void)registerClient:(id)a3;
- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3;
- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4;
- (void)removeCollaborationIdentifier:(id)a3 forConversationUUID:(id)a4;
- (void)removeConversationNoticeWithUUID:(id)a3;
- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6;
- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4;
- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3;
- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4;
- (void)setAutoSharePlayEnabled:(BOOL)a3;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4;
- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4;
- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4;
- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5;
- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5;
- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4;
- (void)setSupportsMessagesGroupProviding:(BOOL)a3;
- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5;
- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7;
- (void)unregisterClient:(id)a3;
- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4;
- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4;
- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4;
- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3;
@end

@implementation CSDConversationManagerXPCServer

- (CSDConversationManagerXPCServer)initWithConversationManager:(id)a3 featureFlags:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CSDConversationManagerXPCServer;
  v9 = [(CSDConversationManagerXPCServer *)&v22 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.conversationmanagerxpcserver", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_conversationManager, a3);
    objc_storeStrong((id *)&v9->_featureFlags, a4);
    [(CSDConversationManager *)v9->_conversationManager addDelegate:v9 queue:v9->_queue];
    v12 = [[CSDClientManager alloc] initWithSerialQueue:v9->_queue];
    clientManager = v9->_clientManager;
    v9->_clientManager = v12;

    v14 = v9->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001783C8;
    block[3] = &unk_100504EC0;
    v15 = v9;
    v21 = v15;
    dispatch_sync(v14, block);
    v16 = [(CSDConversationManagerXPCServer *)v15 queue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100178784;
    v18[3] = &unk_100504EC0;
    v19 = v15;
    dispatch_async(v16, v18);
  }
  return v9;
}

- (void)dealloc
{
  notify_cancel(self->_clientsShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)CSDConversationManagerXPCServer;
  [(CSDConversationManagerXPCServer *)&v3 dealloc];
}

- (void)invalidate
{
  objc_super v3 = [(CSDConversationManagerXPCServer *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001788D0;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)notifyClientsToConnectIfNecessary
{
  objc_super v3 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v3);

  v4 = [(CSDConversationManagerXPCServer *)self conversationManager];
  v5 = [v4 conversationsByUUID];
  id v6 = [v5 count];

  int clientsShouldConnectToken = self->_clientsShouldConnectToken;
  if (v6)
  {
    notify_set_state(clientsShouldConnectToken, 1uLL);
    notify_post("CSDConversationManagerClientsShouldConnectNotification");
  }
  else
  {
    notify_set_state(clientsShouldConnectToken, 0);
  }
}

- (BOOL)_shouldSend:(id)a3
{
  id v4 = a3;
  v5 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v6 = [v5 currentClient];

  if ([v6 isRemote])
  {
    id v7 = [v4 provider];
    unsigned __int8 v8 = [v7 isDefaultProvider];

    if ((v8 & 1) != 0
      || ([(CSDConversationManagerXPCServer *)self featureFlags],
          v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 groupFacetimeAsAServiceEnabled],
          v9,
          !v10))
    {
      v12 = +[FTDeviceSupport sharedInstance];
      if (![v12 isGreenTea])
      {
        unsigned __int8 v15 = 1;
        goto LABEL_11;
      }
      v13 = [v4 remoteMembers];
      unsigned __int8 v15 = (unint64_t)[v13 count] < 2;
    }
    else
    {
      v11 = +[CSDConversationProviderManager sharedInstance];
      v12 = [v11 providerIdentifiersForClient:v6];

      if (![v12 count])
      {
        unsigned __int8 v15 = 0;
        goto LABEL_11;
      }
      v13 = [v4 provider];
      v14 = [v13 identifier];
      unsigned __int8 v15 = [v12 containsObject:v14];
    }
LABEL_11:

    goto LABEL_12;
  }
  unsigned __int8 v15 = 1;
LABEL_12:

  return v15;
}

- (id)_conversationsByGroupUUIDFilteredForClient:(id)a3
{
  id v4 = a3;
  v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v7 = [v6 conversationsByGroupUUID];
  if (v4)
  {
    uint64_t v8 = [(CSDConversationManagerXPCServer *)self _filter:v7 withClient:v4];

    id v7 = (void *)v8;
  }

  return v7;
}

- (id)_filter:(id)a3 withClient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isRemote])
  {
    id v7 = +[CSDConversationProviderManager sharedInstance];
    id v28 = v6;
    uint64_t v8 = [v7 providerIdentifiersForClient:v6];

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v5;
    unsigned int v10 = [v5 allValues];
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (!v11) {
      goto LABEL_17;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v16 = [v15 provider];
        unsigned int v17 = [v16 isDefaultProvider];

        if (v17)
        {
          v18 = +[FTDeviceSupport sharedInstance];
          if (([v18 isGreenTea] & 1) == 0)
          {

LABEL_14:
            id v24 = [v15 copy];
            v25 = [v15 groupUUID];
            [v9 setObject:v24 forKeyedSubscript:v25];

            continue;
          }
          v19 = [v15 remoteMembers];
          id v20 = [v19 count];

          if ((unint64_t)v20 <= 1) {
            goto LABEL_14;
          }
        }
        else
        {
          v21 = [v15 provider];
          objc_super v22 = [v21 identifier];
          unsigned int v23 = [v8 containsObject:v22];

          if (v23) {
            goto LABEL_14;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v12)
      {
LABEL_17:

        id v26 = [v9 copy];
        id v6 = v28;
        id v5 = v29;
        goto LABEL_19;
      }
    }
  }
  id v26 = v5;
LABEL_19:

  return v26;
}

- (void)conversationsByGroupUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v8 = [v6 currentClient];

  id v7 = [(CSDConversationManagerXPCServer *)self _conversationsByGroupUUIDFilteredForClient:v8];
  v4[2](v4, v7);
}

- (void)incomingPendingConversationsByGroupUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v6 = [v7 incomingPendingConversationsByGroupUUID];
  v4[2](v4, v6);
}

- (void)pseudonymsByCallUUID:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v6 = [v7 pseudonymsByCallUUID];
  v4[2](v4, v6);
}

- (void)activityAuthorizedBundleIdentifierState:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v7 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v6 = [v7 activityAuthorizedBundleIdentifierState];
  v4[2](v4, v6);
}

- (void)activatedConversationLinks:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v10 = 0;
  id v7 = [v6 activatedConversationLinksWithError:&v10];
  id v8 = v10;

  if (v8)
  {
    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003AE814((uint64_t)v8, v9);
    }
  }
  else
  {
    v4[2](v4, v7);
  }
}

- (void)addRemoteMembers:(id)a3 otherInvitedHandles:(id)a4 toConversationWithUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v12 addRemoteMembers:v10 otherInvitedHandles:v9 toConversationWithUUID:v8];
}

- (void)createActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v10 = [v9 currentClient];

  uint64_t v16 = 0;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100179448;
  v15[3] = &unk_100507FD8;
  v15[4] = &v16;
  sub_1000085AC(v10, @"override-activity-verification", v15, 0, (uint64_t)"-[CSDConversationManagerXPCServer createActivitySession:onConversationWithUUID:]");
  if (!*((unsigned char *)v17 + 24)
    || ([v6 bundleIdentifier], id v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    id v12 = [v10 processBundleIdentifier];
    [v6 setBundleIdentifier:v12];
  }
  uint64_t v13 = [v6 bundleIdentifier];

  if (v13)
  {
    v14 = [(CSDConversationManagerXPCServer *)self conversationManager];
    [v14 createActivitySession:v6 onConversationWithUUID:v7 withCompletion:&stru_100508DD0];
  }
  else
  {
    v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1003AE88C(v14);
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (void)leaveActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 leaveActivitySession:v7 onConversationWithUUID:v6];
}

- (void)endActivitySession:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 endActivitySession:v7 onConversationWithUUID:v6];
}

- (void)setUsingAirplay:(BOOL)a3 onActivitySession:(id)a4 onConversationWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v11 = [v10 currentClient];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017969C;
  v14[3] = &unk_100506C18;
  BOOL v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  sub_1000085AC(v11, @"modify-activity-session-airplay", v14, 0, (uint64_t)"-[CSDConversationManagerXPCServer setUsingAirplay:onActivitySession:onConversationWithUUID:]");
}

- (void)presentDismissalAlertForActivitySessionWithUUID:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 presentDismissalAlertForActivitySessionWithUUID:v7 onConversationWithUUID:v6];
}

- (void)setActivityAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 setActivityAuthorization:v4 forBundleID:v6];
}

- (void)setAutoSharePlayEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 setAutoSharePlayEnabled:v3];
}

- (void)launchApplicationForActivitySessionUUID:(id)a3 authorizedExternally:(BOOL)a4 forceBackground:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v12);

  if (v8)
  {
    id v13 = [(CSDConversationManagerXPCServer *)self clientManager];
    v14 = [v13 currentClient];

    uint64_t v18 = 0;
    char v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100179A08;
    v17[3] = &unk_100507FD8;
    v17[4] = &v18;
    sub_1000085AC(v14, @"supports-external-shareplay-authorization", v17, 0, (uint64_t)"-[CSDConversationManagerXPCServer launchApplicationForActivitySessionUUID:authorizedExternally:forceBackground:completionHandler:]");
    BOOL v15 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v15 = 0;
  }
  id v16 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v16 launchApplicationForActivitySessionUUID:v10 authorizedExternally:v15 forceBackground:v7 completionHandler:v11];
}

- (void)joinConversationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 joinConversationWithRequest:v4];
}

- (void)leaveConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 leaveConversationWithUUID:v4];
}

- (void)buzzMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 buzzMember:v7 conversationUUID:v6];
}

- (void)kickMember:(id)a3 conversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 kickMember:v7 conversationUUID:v6];
}

- (void)setDownlinkMuted:(BOOL)a3 forRemoteParticipantsInConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 setDownlinkMuted:v4 forRemoteParticipantsOnConversationWithUUID:v6];
}

- (void)addScreenSharingType:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 addScreenSharingType:a3 forConversationUUID:v6];
}

- (void)getLatestRemoteScreenShareAttributesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 getLatestRemoteScreenShareAttributesWithCompletionHandler:v4];
}

- (void)getActiveLinksWithCreatedOnly:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 getActiveLinksWithCreatedOnly:v4 completionHandler:v6];
}

- (void)generateLinkForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 generateLinkForConversationUUID:v7 completionHandler:v6];
}

- (void)generateLinkWithInvitedMemberHandles:(id)a3 linkLifetimeScope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v11 generateLinkWithInvitedMemberHandles:v9 linkLifetimeScope:a4 completionHandler:v8];
}

- (void)addInvitedMemberHandles:(id)a3 toConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v12 addInvitedMemberHandles:v10 toConversationLink:v9 completionHandler:v8];
}

- (void)activateConversationNoticeWithActionURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 activateConversationNoticeWithActionURL:v7 bundleIdentifier:v6];
}

- (void)removeConversationNoticeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 removeConversationNoticeWithUUID:v4];
}

- (void)refreshActiveConversations
{
  BOOL v3 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v4 refreshActiveParticipantsList];
}

- (void)getSharePlayAvailableWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  v4[2](v4, [v6 isSharePlayAvailable]);
}

- (void)getScreenSharingAvailableWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  v4[2](v4, [v6 isScreenSharingAvailable]);
}

- (void)fetchUpcomingNoticeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 fetchUpcomingNoticeWithCompletionHandler:v4];
}

- (void)invalidateLink:(id)a3 deleteReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v11 invalidateLink:v9 deleteReason:a4 completionHandler:v8];
}

- (void)renewLink:(id)a3 expirationDate:(id)a4 reason:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v13 renewLink:v12 expirationDate:v11 reason:a5 completionHandler:v10];
}

- (void)checkLinkValidity:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 checkLinkValidity:v7 completionHandler:v6];
}

- (void)getInactiveLinkWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 getInactiveLinkWithCompletionHandler:v4];
}

- (void)activateLink:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 activateLink:v7 completionHandler:v6];
}

- (void)setLinkName:(id)a3 forConversationLink:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v12 setLinkName:v10 forConversationLink:v9 completionHandler:v8];
}

- (void)scheduleConversationLinkCheckInInitial:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 scheduleConversationLinkCheckInInitial:v3];
}

- (void)linkSyncStateIncludeLinks:(BOOL)a3 WithCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 linkSyncStateIncludeLinks:v4 WithCompletion:v6];
}

- (void)approvePendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 approvePendingMember:v7 forConversationUUID:v6];
}

- (void)rejectPendingMember:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 rejectPendingMember:v7 forConversationUUID:v6];
}

- (void)setIgnoreLetMeInRequests:(BOOL)a3 forConversationUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 setIgnoreLetMeInRequests:v4 forConversationUUID:v6];
}

- (void)updateConversationWithUUID:(id)a3 participantPresentationContexts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 updateParticipantPresentationContexts:v6 onConversationWithUUID:v7];
}

- (void)setGridDisplayMode:(unint64_t)a3 forConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 setGridDisplayMode:a3 forConversationWithUUID:v6];
}

- (void)registerClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017AB74;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017AC7C;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setLocalParticipantAudioVideoMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v7 setLocalParticipantAudioVideoMode:a3 forConversationUUID:v6];
}

- (void)updateLocalParticipantToAVLessWithPresentationMode:(unint64_t)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v7 updateLocalParticipantToAVLessWithPresentationMode:a3 forConversationUUID:v6];
}

- (void)registerMessagesGroupUUIDForConversationUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v5 registerMessagesGroupUUIDForConversationUUID:v4];
}

- (void)startTrackingCollaborationWithIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v17 startTrackingCollaborationWithIdentifier:v16 collaborationURL:v15 cloudKitAppBundleIDs:v14 forConversationUUID:v13 completionHandler:v12];
}

- (void)addCollaborationIdentifier:(id)a3 collaborationURL:(id)a4 cloudKitAppBundleIDs:(id)a5 forConversationUUID:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v14 addHighlightIdentifier:v13 collaborationURL:v12 cloudKitAppBundleIDs:v11 forConversationUUID:v10];
}

- (void)removeCollaborationIdentifier:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 removeHighlightIdentifier:v7 forConversationUUID:v6];
}

- (void)markCollaborationWithIdentifierOpened:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 markCollaborationWithIdentifierOpened:v7 forConversationUUID:v6];
}

- (void)addCollaborationDictionary:(id)a3 forConversationWithUUID:(id)a4 fromMe:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v12 = [v11 currentClient];
  id v13 = (void *)TUEntitlementsModifyPendingCollaborationCapability;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10017B1A8;
  v16[3] = &unk_100506C18;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  BOOL v19 = a5;
  id v14 = v9;
  id v15 = v8;
  sub_1000085AC(v12, v13, v16, 0, (uint64_t)"-[CSDConversationManagerXPCServer addCollaborationDictionary:forConversationWithUUID:fromMe:]");
}

- (void)getNeedsDisclosureOfCollaborationInitiator:(id)a3 forConversationUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v13 = [v12 currentClient];
  id v14 = (void *)TUEntitlementsAccessCollaborationDisclosuresCapability;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10017B3A4;
  v20[3] = &unk_100505F18;
  v20[4] = self;
  id v21 = v8;
  id v22 = v9;
  id v23 = v10;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10017B3FC;
  v18[3] = &unk_100505738;
  id v19 = v23;
  id v15 = v23;
  id v16 = v9;
  id v17 = v8;
  sub_1000085AC(v13, v14, v20, v18, (uint64_t)"-[CSDConversationManagerXPCServer getNeedsDisclosureOfCollaborationInitiator:forConversationUUID:completionHandler:]");
}

- (void)addDisclosedCollaborationInitiator:(id)a3 toConversationUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v10 = [v9 currentClient];
  id v11 = (void *)TUEntitlementsAccessCollaborationDisclosuresCapability;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017B604;
  v14[3] = &unk_100504FE0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v12 = v7;
  id v13 = v6;
  sub_1000085AC(v10, v11, v14, 0, (uint64_t)"-[CSDConversationManagerXPCServer addDisclosedCollaborationInitiator:toConversationUUID:]");
}

- (void)setSupportsMessagesGroupProviding:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSDConversationManagerXPCServer *)self clientManager];
  id v5 = [v4 currentClient];

  [v5 setSupportsMessagesGroupProviding:v3];
}

- (void)getMessagesGroupDetailsForConversationUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  id v9 = [v8 conversationsByUUID];
  id v10 = [v9 objectForKeyedSubscript:v6];

  if (!v10)
  {
    id v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find conversation with conversationUUID %@", buf, 0xCu);
    }

    goto LABEL_9;
  }
  if (![(CSDConversationManagerXPCServer *)self _shouldSend:v10])
  {
LABEL_9:
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
    goto LABEL_18;
  }
  id v11 = [v10 messagesGroupUUID];
  if (v11)
  {
    id v12 = [(CSDConversationManagerXPCServer *)self clientManager];
    id v13 = [v12 clientsPassingTest:&stru_100508DF0];
    id v14 = [v13 firstObject];

    if (v14)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10017BA7C;
      v23[3] = &unk_100508E18;
      id v24 = v11;
      id v25 = v7;
      [v14 performBlock:v23];

      id v15 = v24;
    }
    else
    {
      uint64_t v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] No Messages group provider was registered", buf, 2u);
      }

      uint64_t v21 = TUConversationManagerMessagesErrorDomain;
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"No messages group details provider available";
      id v22 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v15 = +[NSError errorWithDomain:v21 code:1 userInfo:v22];

      (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v15);
    }
  }
  else
  {
    id v17 = sub_100008DCC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[WARN] Conversation with conversationUUID %@ is not associated with a Messages group", buf, 0xCu);
    }

    uint64_t v18 = TUConversationManagerMessagesErrorDomain;
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    CFStringRef v29 = @"Conversation is not associated with a Messages group";
    id v19 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    id v14 = +[NSError errorWithDomain:v18 code:2 userInfo:v19];

    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v14);
  }

LABEL_18:
}

- (void)updateMessagesGroupName:(id)a3 onConversationWithUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 updateMessagesGroupName:v7 onConversationWithUUID:v6];
}

- (void)updateMessagesGroupPhotoOnConversationWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v6 updateMessagesGroupPhotoOnConversationWithUUID:v4];
}

- (void)requestParticipantToShareScreen:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 requestParticipantToShareScreen:v7 forConversationUUID:v6];
}

- (void)cancelOrDenyScreenShareRequest:(id)a3 forConversationUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 cancelOrDenyScreenShareRequest:v7 forConversationUUID:v6];
}

- (void)setScreenEnabled:(BOOL)a3 withScreenShareAttributes:(id)a4 forConversationWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v11 setScreenEnabled:v6 screenShareAttributes:v9 forConversationWithUUID:v8];
}

- (void)prepareConversationWithUUID:(id)a3 withHandoffContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v9 prepareConversationWithUUID:v7 withHandoffContext:v6];
}

- (void)setSharePlayHandedOff:(BOOL)a3 onConversationWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDConversationManagerXPCServer *)self conversationManager];
  [v8 setSharePlayHandedOff:v4 onConversationWithUUID:v6];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v9);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v10 = [(CSDConversationManagerXPCServer *)self clientManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017BF84;
  v14[3] = &unk_100508E40;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:addedMembersLocally:");
  [v10 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 buzzedMember:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v9);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v10 = [(CSDConversationManagerXPCServer *)self clientManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017C0A8;
  v14[3] = &unk_100508E40;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:buzzedMember:");
  [v10 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversationUpdateMessagesGroupPhoto:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v6);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v7 = [(CSDConversationManagerXPCServer *)self clientManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017C1AC;
  v10[3] = &unk_100508E68;
  id v11 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("conversationUpdatedMessagesGroupPhoto:");
  [v7 performBlockOnClients:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 updateIncomingPendingConversationsByGroupUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v6);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v7 = [(CSDConversationManagerXPCServer *)self clientManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017C2B0;
  v10[3] = &unk_100508E68;
  id v11 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("updateIncomingPendingConversationsByGroupUUID:");
  [v7 performBlockOnClients:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 activatedConversationLinksChanged:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v6);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v7 = [(CSDConversationManagerXPCServer *)self clientManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017C3B4;
  v10[3] = &unk_100508E68;
  id v11 = v5;
  id v8 = v5;
  id v9 = NSStringFromSelector("updateActivatedConversationLinks:");
  [v7 performBlockOnClients:v10 coalescedByIdentifier:v9];
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
}

- (void)conversationManager:(id)a3 removedConversationWithUUID:(id)a4
{
}

- (void)notifyClientsOfConversationsByGroupUUIDUpdate
{
  BOOL v3 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  BOOL v4 = [(CSDConversationManagerXPCServer *)self clientManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017C494;
  v6[3] = &unk_100508E68;
  v6[4] = self;
  id v5 = NSStringFromSelector("updateConversationsByGroupUUID:");
  [v4 performBlockOnClients:v6 coalescedByIdentifier:v5];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 mediaPrioritiesDidChangeForParticipant:(id)a5
{
}

- (void)notifyClientsOfMediaPrioritiesChangedForConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDConversationManagerXPCServer *)self clientManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10017C618;
  v9[3] = &unk_100508E68;
  id v10 = v4;
  id v7 = v4;
  id v8 = NSStringFromSelector("mediaPrioritiesChangedForConversation:");
  [v6 filterClientsUsingPredicate:&stru_100508E88 andPerformBlock:v9 coalescedByIdentifier:v8];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 didReact:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v12);

  id v13 = [(CSDConversationManagerXPCServer *)self clientManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10017C77C;
  v18[3] = &unk_100508ED0;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  id v17 = NSStringFromSelector("conversation:participant:didReact:");
  [v13 filterClientsUsingPredicate:&stru_100508EA8 andPerformBlock:v18 coalescedByIdentifier:v17];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participantDidStopReacting:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDConversationManagerXPCServer *)self clientManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017C8B8;
  v14[3] = &unk_100508E40;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("conversation:participantDidStopReacting:");
  [v10 filterClientsUsingPredicate:&stru_100508EF0 andPerformBlock:v14 coalescedByIdentifier:v13];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 participant:(id)a5 addedNotice:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v12 = [(CSDConversationManagerXPCServer *)self clientManager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10017C9F0;
  v17[3] = &unk_100508ED0;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  id v16 = NSStringFromSelector("conversationManager:conversation:participant:addedNotice:");
  [v12 performBlockOnClients:v17 coalescedByIdentifier:v16];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 receivedActivitySessionEvent:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017CB00;
  v13[3] = &unk_100508E40;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("conversationManager:conversation:receivedActivitySessionEvent:");
  [v9 performBlockOnClients:v13 coalescedByIdentifier:v12];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 appLaunchState:(unint64_t)a5 forActivitySession:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v11 = [(CSDConversationManagerXPCServer *)self clientManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017CBF4;
  v14[3] = &unk_100508F18;
  id v16 = v10;
  unint64_t v17 = a5;
  id v15 = v9;
  id v12 = v10;
  id v13 = v9;
  [v11 performBlockOnClients:v14];
}

- (void)conversationManager:(id)a3 activityAuthorizationChangedForBundleIdentifier:(id)a4
{
  id v5 = a3;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v6 = [(CSDConversationManagerXPCServer *)self clientManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10017CCE4;
  v9[3] = &unk_100508E68;
  id v10 = v5;
  id v7 = v5;
  id v8 = NSStringFromSelector("updateActivityAuthorizedBundleIdentifierState:");
  [v6 performBlockOnClients:v9 coalescedByIdentifier:v8];
}

- (void)conversationManager:(id)a3 trackedPendingMember:(id)a4 forConversationLink:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017CE44;
  v13[3] = &unk_100508E40;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("receivedTrackedPendingMember:forConversationLink:");
  [v9 performBlockOnClients:v13 coalescedByIdentifier:v12];
}

- (void)conversationManager:(id)a3 conversationScreenSharingChanged:(id)a4 forParticipant:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017CF28;
  v12[3] = &unk_100508E40;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockOnClients:v12];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeStateForActivitySession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10017D02C;
  v13[3] = &unk_100508E40;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = NSStringFromSelector("conversation:didChangeStateForActivitySession:");
  [v9 performBlockOnClients:v13 coalescedByIdentifier:v12];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 didChangeSceneAssociationForActivitySession:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self clientManager];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017D110;
  v12[3] = &unk_100508E40;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 performBlockOnClients:v12];
}

- (void)conversationManager:(id)a3 remoteScreenShareAttributesChanged:(id)a4 isLocallySharing:(BOOL)a5
{
  id v7 = a4;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v8 = [(CSDConversationManagerXPCServer *)self clientManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017D204;
  v11[3] = &unk_100508F40;
  id v12 = v7;
  BOOL v13 = a5;
  id v9 = v7;
  id v10 = NSStringFromSelector("remoteScreenShareAttributesChanged:isLocallySharing:");
  [v8 performBlockOnClients:v11 coalescedByIdentifier:v10];
}

- (void)conversationManager:(id)a3 remoteScreenShareEndedWithReason:(id)a4
{
  id v5 = a4;
  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v6 = [(CSDConversationManagerXPCServer *)self clientManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10017D2F4;
  v9[3] = &unk_100508E68;
  id v10 = v5;
  id v7 = v5;
  id v8 = NSStringFromSelector("remoteScreenShareEndedWithReason:");
  [v6 performBlockOnClients:v9 coalescedByIdentifier:v8];
}

- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4
{
  id v5 = [(CSDConversationManagerXPCServer *)self clientManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017D3AC;
  v7[3] = &unk_100508F60;
  BOOL v8 = a4;
  id v6 = NSStringFromSelector("sharePlayAvailableChanged:");
  [v5 performBlockOnClients:v7 coalescedByIdentifier:v6];
}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v5 = [(CSDConversationManagerXPCServer *)self clientManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017D464;
  v7[3] = &unk_100508F60;
  BOOL v8 = a4;
  id v6 = NSStringFromSelector("screenSharingAvailableChanged:");
  [v5 performBlockOnClients:v7 coalescedByIdentifier:v6];
}

- (void)conversationManager:(id)a3 activeParticipant:(id)a4 addedHighlightToConversation:(id)a5 highlightIdentifier:(id)a6 oldHighlightIdentifier:(id)a7 isFirstAdd:(BOOL)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  unint64_t v17 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v17);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v18 = [(CSDConversationManagerXPCServer *)self clientManager];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10017D5E4;
  v24[3] = &unk_100508F88;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  BOOL v29 = a8;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = NSStringFromSelector("activeParticipant:addedHighlightToConversation:highlightIdentifier:oldHighlightIdentifier:isFirstAdd:");
  [v18 performBlockOnClients:v24 coalescedByIdentifier:v23];
}

- (void)conversationManager:(id)a3 activeParticipant:(id)a4 removedHighlightFrom:(id)a5 highlightIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v12);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v13 = [(CSDConversationManagerXPCServer *)self clientManager];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10017D73C;
  v18[3] = &unk_100508ED0;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  unint64_t v17 = NSStringFromSelector("activeParticipant:removedHighlightFromConversation:highlightIdentifier:");
  [v13 performBlockOnClients:v18 coalescedByIdentifier:v17];
}

- (void)conversationManager:(id)a3 conversation:(id)a4 collaborationStateChanged:(int64_t)a5 highlightIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  id v11 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v11);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v12 = [(CSDConversationManagerXPCServer *)self clientManager];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10017D874;
  v16[3] = &unk_100508F18;
  id v18 = v10;
  int64_t v19 = a5;
  id v17 = v9;
  id v13 = v10;
  id v14 = v9;
  id v15 = NSStringFromSelector("conversation:collaborationStateChanged:highlightIdentifier:");
  [v12 performBlockOnClients:v16 coalescedByIdentifier:v15];
}

- (void)conversationManager:(id)a3 addedCollaborationDictionary:(id)a4 forConversation:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(CSDConversationManagerXPCServer *)self queue];
  dispatch_assert_queue_V2(v9);

  [(CSDConversationManagerXPCServer *)self notifyClientsToConnectIfNecessary];
  id v10 = [(CSDConversationManagerXPCServer *)self clientManager];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017D99C;
  v14[3] = &unk_100508E40;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = NSStringFromSelector("addedCollaborationDictionary:forConversation:");
  [v10 performBlockOnClients:v14 coalescedByIdentifier:v13];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDClientManager)clientManager
{
  return self->_clientManager;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_int clientsShouldConnectToken = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_clientManager, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end