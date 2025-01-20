@interface KmlTestClientReporter
- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6;
- (KmlTestClientReporter)init;
- (void)cleanup;
- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6;
- (void)finishedSharingForKey:(id)a3 result:(id)a4;
- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4;
- (void)registerCrossPlatformMessageSendHandler:(id)a3;
- (void)registerFriendSideInvitationUnusableHandler:(id)a3;
- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3;
- (void)registerFriendSideSharingTestCompletion:(id)a3;
- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3;
- (void)registerOwnerSideInvitationRequestHandler:(id)a3;
- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4;
- (void)reportUnusableInvitation:(id)a3 reason:(id)a4;
- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3;
- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4;
- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5;
@end

@implementation KmlTestClientReporter

- (KmlTestClientReporter)init
{
  v12.receiver = self;
  v12.super_class = (Class)KmlTestClientReporter;
  v2 = [(KmlTestClientReporter *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    callbackInfoSet = v2->_callbackInfoSet;
    v2->_callbackInfoSet = (NSMutableSet *)v3;

    id friendCompletionHandler = v2->_friendCompletionHandler;
    v2->_id friendCompletionHandler = 0;

    id friendInvitationHandler = v2->_friendInvitationHandler;
    v2->_id friendInvitationHandler = 0;

    id ownerInvitationRequestHandler = v2->_ownerInvitationRequestHandler;
    v2->_id ownerInvitationRequestHandler = 0;

    id friendInvitationUnusableHandler = v2->_friendInvitationUnusableHandler;
    v2->_id friendInvitationUnusableHandler = 0;

    id crossPlatformSendMessageHandler = v2->_crossPlatformSendMessageHandler;
    v2->_id crossPlatformSendMessageHandler = 0;

    id friendPasscodeRetryRequestHandler = v2->_friendPasscodeRetryRequestHandler;
    v2->_id friendPasscodeRetryRequestHandler = 0;

    *(void *)&v2->_cleanUpCount = 0;
  }
  return v2;
}

- (void)cleanup
{
  [(NSMutableSet *)self->_callbackInfoSet removeAllObjects];
  callbackInfoSet = self->_callbackInfoSet;
  self->_callbackInfoSet = 0;

  *(void *)&self->_cleanUpCount = 0;
  id friendCompletionHandler = self->_friendCompletionHandler;
  self->_id friendCompletionHandler = 0;

  id friendInvitationHandler = self->_friendInvitationHandler;
  self->_id friendInvitationHandler = 0;

  id ownerInvitationRequestHandler = self->_ownerInvitationRequestHandler;
  self->_id ownerInvitationRequestHandler = 0;

  id friendInvitationUnusableHandler = self->_friendInvitationUnusableHandler;
  self->_id friendInvitationUnusableHandler = 0;

  id crossPlatformSendMessageHandler = self->_crossPlatformSendMessageHandler;
  self->_id crossPlatformSendMessageHandler = 0;

  id friendPasscodeRetryRequestHandler = self->_friendPasscodeRetryRequestHandler;
  self->_id friendPasscodeRetryRequestHandler = 0;
}

- (void)registerFriendSideSharingTestInvitationUUIDHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideSharingTestInvitationUUIDHandler:]", 162, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id friendInvitationHandler = self->_friendInvitationHandler;
  self->_id friendInvitationHandler = v9;
}

- (void)registerFriendSideSharingTestCompletion:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideSharingTestCompletion:]", 168, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id friendCompletionHandler = self->_friendCompletionHandler;
  self->_id friendCompletionHandler = v9;
}

- (void)registerOwnerSideSharingTestInvitations:(id)a3 callback:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerOwnerSideSharingTestInvitations:callback:]", 174, &stru_100421848, v8, v9, v10, v11, v13);
  v14 = objc_alloc_init(KmlTestClientCallbackInfo);
  objc_super v12 = [(KmlTestClientCallbackInfo *)v14 invitationSet];
  [v12 addObjectsFromArray:v7];

  [(KmlTestClientCallbackInfo *)v14 setOwnerCompletionHandler:v6];
  [(NSMutableSet *)self->_callbackInfoSet addObject:v14];
  ++self->_totalCallbacks;
}

- (void)registerOwnerSideInvitationRequestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerOwnerSideInvitationRequestHandler:]", 184, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id ownerInvitationRequestHandler = self->_ownerInvitationRequestHandler;
  self->_id ownerInvitationRequestHandler = v9;
}

- (void)registerFriendSideInvitationUnusableHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSideInvitationUnusableHandler:]", 190, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id friendInvitationUnusableHandler = self->_friendInvitationUnusableHandler;
  self->_id friendInvitationUnusableHandler = v9;
}

- (void)registerFriendSidePasscodeRetryRequestHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerFriendSidePasscodeRetryRequestHandler:]", 196, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id friendPasscodeRetryRequestHandler = self->_friendPasscodeRetryRequestHandler;
  self->_id friendPasscodeRetryRequestHandler = v9;
}

- (void)registerCrossPlatformMessageSendHandler:(id)a3
{
  id v4 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter registerCrossPlatformMessageSendHandler:]", 202, &stru_100421848, v5, v6, v7, v8, v11);
  id v9 = objc_retainBlock(v4);

  id crossPlatformSendMessageHandler = self->_crossPlatformSendMessageHandler;
  self->_id crossPlatformSendMessageHandler = v9;
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6
{
  id friendInvitationHandler = (void (**)(id, id, id, id))self->_friendInvitationHandler;
  if (friendInvitationHandler) {
    friendInvitationHandler[2](friendInvitationHandler, a3, a4, a5);
  }
  else {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveSharingInvitationWithIdentifier:uuid:metadata:ownerIdsId:]", 209, @"A callback is not registered. Can't report to test client", (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
  }
}

- (void)finishedSharingForKey:(id)a3 result:(id)a4
{
  id friendCompletionHandler = (void (**)(id, id, id))self->_friendCompletionHandler;
  if (friendCompletionHandler) {
    friendCompletionHandler[2](friendCompletionHandler, a3, a4);
  }
  else {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter finishedSharingForKey:result:]", 219, @"A callback is not registered. Can't report to test client", v4, v5, v6, v7, v9);
  }
}

- (void)reportUnusableInvitation:(id)a3 reason:(id)a4
{
  id friendInvitationUnusableHandler = (void (**)(id, id, id))self->_friendInvitationUnusableHandler;
  if (friendInvitationUnusableHandler) {
    friendInvitationUnusableHandler[2](friendInvitationUnusableHandler, a3, a4);
  }
  else {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter reportUnusableInvitation:reason:]", 230, @"A callback is not registered. Can't report to test client", v4, v5, v6, v7, v9);
  }
}

- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter requestAuthorizationForSharingInvitationIdentifier:]", 239, @"Not implemented", v3, v4, v5, v6, v7);
}

- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (__CFString *)a4;
  id v10 = a5;
  if ([(NSMutableSet *)self->_callbackInfoSet count])
  {
    id v41 = v10;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v15 = self->_callbackInfoSet;
    id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v43;
LABEL_4:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v43 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v42 + 1) + 8 * v19);
        v21 = [v20 invitationSet];
        unsigned __int8 v22 = [v21 containsObject:v8];

        if (v22) {
          break;
        }
        if (v17 == (id)++v19)
        {
          id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v17) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v23 = v20;

      if (!v23) {
        goto LABEL_17;
      }
      id v10 = v41;
      KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 257, @"Sharing completed for Invitation ID: %@, friend key Id : %@, error: %@", v24, v25, v26, v27, (uint64_t)v8);
      if (v9) {
        CFStringRef v28 = v9;
      }
      else {
        CFStringRef v28 = @"null";
      }
      v29 = [v23 results];
      [v29 setObject:v28 forKeyedSubscript:v8];

      v30 = [v23 invitationSet];
      [v30 removeObject:v8];

      v31 = [v23 invitationSet];
      id v32 = [v31 count];

      if (!v32)
      {
        KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 261, @"Heard from all invitiations. Reporting back", v33, v34, v35, v36, v40);
        v37 = [v23 ownerCompletionHandler];
        v38 = [v23 results];
        ((void (**)(void, void *))v37)[2](v37, v38);

        [(NSMutableSet *)self->_callbackInfoSet removeObject:v23];
      }
    }
    else
    {
LABEL_10:

      id v23 = 0;
LABEL_17:
      id v10 = v41;
    }
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sharingCompleteForInvitationIdentifier:friendKeyIdentifier:status:]", 245, @"A callback is not registered. Can't report to test client", v11, v12, v13, v14, v39);
  }
}

- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveInvitationRequestWithUuid:ownerKeyIdentifier:friendKeyIdentifier:targetType:]", 270, &stru_100421848, v12, v13, v14, v15, v22);
  id ownerInvitationRequestHandler = (void (**)(id, id, id, id))self->_ownerInvitationRequestHandler;
  if (ownerInvitationRequestHandler) {
    ownerInvitationRequestHandler[2](ownerInvitationRequestHandler, v9, v10, v11);
  }
  else {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter didReceiveInvitationRequestWithUuid:ownerKeyIdentifier:friendKeyIdentifier:targetType:]", 272, @"A callback is not registered. Can't report to test client", v16, v17, v18, v19, v23);
  }

  return ownerInvitationRequestHandler != 0;
}

- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 282, @"Message to send: %@", v8, v9, v10, v11, (uint64_t)v7);
  id v21 = 0;
  uint64_t v12 = [v7 encodeWithError:&v21];

  id v13 = v21;
  uint64_t v18 = v13;
  if (v13)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 294, @"Failed to encode message with - %@", v14, v15, v16, v17, (uint64_t)v13);
  }
  else if (self->_crossPlatformSendMessageHandler)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 287, @"Cross platform send handler available", v14, v15, v16, v17, v20);
    (*((void (**)(void))self->_crossPlatformSendMessageHandler + 2))();
  }
  else
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter sendCrossPlatformSharingMessage:toMailboxIdentifier:]", 290, @"Use Mock Cross platform channel over IDS", v14, v15, v16, v17, v20);
    uint64_t v19 = sub_10031DB48();
    sub_10031EAEC((uint64_t)v19, v12, v6);
  }
}

- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4
{
  id friendPasscodeRetryRequestHandler = (void (**)(id, id, unint64_t))self->_friendPasscodeRetryRequestHandler;
  if (friendPasscodeRetryRequestHandler) {
    friendPasscodeRetryRequestHandler[2](friendPasscodeRetryRequestHandler, a3, a4);
  }
  else {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlTestClientReporter passcodeRetryRequestedFor:retriesLeft:]", 301, @"A callback is not registered. Can't report to test client", v4, v5, v6, v7, v9);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_friendPasscodeRetryRequestHandler, 0);
  objc_storeStrong(&self->_crossPlatformSendMessageHandler, 0);
  objc_storeStrong(&self->_friendInvitationUnusableHandler, 0);
  objc_storeStrong(&self->_ownerInvitationRequestHandler, 0);
  objc_storeStrong(&self->_friendInvitationHandler, 0);
  objc_storeStrong(&self->_friendCompletionHandler, 0);

  objc_storeStrong((id *)&self->_callbackInfoSet, 0);
}

@end