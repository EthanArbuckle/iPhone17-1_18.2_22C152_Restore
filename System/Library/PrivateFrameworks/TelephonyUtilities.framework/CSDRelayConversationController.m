@interface CSDRelayConversationController
- (CSDRelayConversationController)initWithQueue:(id)a3 messenger:(id)a4 callCenter:(id)a5 featureFlags:(id)a6;
- (CSDRelayMessagingController)messagingController;
- (OS_dispatch_queue)queue;
- (TUCallCenter)callCenter;
- (TUFeatureFlags)featureFlags;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 conversationUpdatedMessagesGroupUUID:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)mediaController:(id)a3 participantMediaPrioritiesChangedForConversation:(id)a4;
- (void)setCallCenter:(id)a3;
- (void)setMessagingController:(id)a3;
@end

@implementation CSDRelayConversationController

- (CSDRelayConversationController)initWithQueue:(id)a3 messenger:(id)a4 callCenter:(id)a5 featureFlags:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CSDRelayConversationController;
  v15 = [(CSDRelayConversationController *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messagingController, a4);
    objc_storeStrong((id *)&v16->_queue, a3);
    objc_storeStrong((id *)&v16->_callCenter, a5);
    objc_storeStrong((id *)&v16->_featureFlags, a6);
    v17 = [v13 conversationManager];
    v18 = [(CSDRelayConversationController *)v16 queue];
    [v17 addDelegate:v16 queue:v18];

    v19 = [v13 conversationManager];
    v20 = [v19 mediaController];
    [v20 addDelegate:v16];
  }
  return v16;
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v5 = a4;
  v6 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v8 = [v7 gftOnWatch];

  if (v8)
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController added active conversation %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = [(CSDRelayConversationController *)self messagingController];
    [v10 sendConversationToClientForConversation:v5 withConversationMessageType:0];
  }
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v5 = a4;
  v6 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v8 = [v7 gftOnWatch];

  if (v8)
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController removed active conversation %@", (uint8_t *)&v11, 0xCu);
    }

    v10 = [(CSDRelayConversationController *)self messagingController];
    [v10 sendConversationToClientForConversation:v5 withConversationMessageType:2];
  }
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a4;
  unsigned int v8 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v10 = [v9 gftOnWatch];

  if (v10)
  {
    int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController state changed for conversation %@", (uint8_t *)&v13, 0xCu);
    }

    if (a5)
    {
      id v12 = [(CSDRelayConversationController *)self messagingController];
      [v12 sendConversationToClientForConversation:v7 withConversationMessageType:1];
    }
  }
}

- (void)conversationManager:(id)a3 conversationUpdatedMessagesGroupUUID:(id)a4
{
  id v5 = a4;
  v6 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v8 = [v7 gftOnWatch];

  if (v8)
  {
    v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController updated messages group UUID for conversation %@", (uint8_t *)&v11, 0xCu);
    }

    unsigned int v10 = [(CSDRelayConversationController *)self messagingController];
    [v10 sendConversationToClientForConversation:v5 withConversationMessageType:1];
  }
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a4;
  unsigned int v8 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v10 = [v9 gftOnWatch];

  if (a5 && v10)
  {
    int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController remote members changed for conversation %@", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [(CSDRelayConversationController *)self messagingController];
    [v12 sendConversationToClientForConversation:v7 withConversationMessageType:1];
  }
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a4;
  unsigned int v8 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v10 = [v9 gftOnWatch];

  if (a5 && v10)
  {
    int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController activeRemoteParticipants changed for conversation %@", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [(CSDRelayConversationController *)self messagingController];
    [v12 sendConversationToClientForConversation:v7 withConversationMessageType:1];
  }
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v7 = a4;
  unsigned int v8 = [(CSDRelayConversationController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v10 = [v9 gftOnWatch];

  if (a5 && v10)
  {
    int v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSDRelayConversationController avMode changed for conversation %@", (uint8_t *)&v13, 0xCu);
    }

    id v12 = [(CSDRelayConversationController *)self messagingController];
    [v12 sendConversationToClientForConversation:v7 withConversationMessageType:1];
  }
}

- (void)mediaController:(id)a3 participantMediaPrioritiesChangedForConversation:(id)a4
{
  id v5 = a4;
  v6 = [(CSDRelayConversationController *)self featureFlags];
  unsigned int v7 = [v6 gftOnWatch];

  if (v7
    && [v5 hostedOnCurrentDevice]
    && ([v5 endpointOnCurrentDevice] & 1) == 0)
  {
    unsigned int v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prominence changed for %@", buf, 0xCu);
    }

    v9 = [(CSDRelayConversationController *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001770A0;
    v10[3] = &unk_100504F10;
    v10[4] = self;
    id v11 = v5;
    dispatch_async(v9, v10);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDRelayMessagingController)messagingController
{
  return self->_messagingController;
}

- (void)setMessagingController:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_messagingController, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end