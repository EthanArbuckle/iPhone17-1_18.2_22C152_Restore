@interface PDSharingManager
- (BOOL)hasActiveExternallySharedPasses;
- (BOOL)hasShareableEntitlementsForPassIdentifier:(id)a3;
- (BOOL)hasSharesForPassIdentifier:(id)a3;
- (PDSharingChannelManager)channelManager;
- (PDSharingManager)init;
- (PDSharingManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 notificationManager:(id)a5 pushNotificationManager:(id)a6 cardFileManager:(id)a7 subcredentialManager:(id)a8 applicationMessageManager:(id)a9 remoteInterfacePresenter:(id)a10 idsSharingService:(id)a11 cloudStoreDelegate:(id)a12 delegate:(id)a13;
- (id)entitlementsForPassIdentifier:(id)a3;
- (id)pendingShareActivationForShareIdentifier:(id)a3;
- (id)pendingShareActivations;
- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4;
- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3;
- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4;
- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5;
- (void)deleteSharingMessage:(id)a3;
- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5;
- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4;
- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)finishedStatefulProvisioningAttemptWithSuccess:(BOOL)a3 operation:(id)a4 share:(id)a5;
- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4;
- (void)insertPassMessage:(id)a3 pass:(id)a4;
- (void)passAdded:(id)a3;
- (void)passUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5 oldEntitlements:(id)a6;
- (void)passUpdated:(id)a3 oldShares:(id)a4;
- (void)passWillBeRemoved:(id)a3;
- (void)pendingCredentialsBeingProvisioned:(id)a3;
- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4;
- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4;
- (void)processCLICommands:(id)a3 completion:(id)a4;
- (void)provisioningOperationsDidUpdate;
- (void)rejectShareForMailboxAddress:(id)a3;
- (void)relinquishInvitation:(id)a3 completion:(id)a4;
- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4;
- (void)revokePendingCredentialsForReaderIdentifier:(id)a3 completion:(id)a4;
- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6;
- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)sharesForPassIdentifier:(id)a3 completion:(id)a4;
- (void)start;
- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)userDidDismissPendingShareActivationForShareIdentifier:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4;
@end

@implementation PDSharingManager

- (PDSharingManager)init
{
  return 0;
}

- (PDSharingManager)initWithWebServiceCoordinator:(id)a3 databaseManager:(id)a4 notificationManager:(id)a5 pushNotificationManager:(id)a6 cardFileManager:(id)a7 subcredentialManager:(id)a8 applicationMessageManager:(id)a9 remoteInterfacePresenter:(id)a10 idsSharingService:(id)a11 cloudStoreDelegate:(id)a12 delegate:(id)a13
{
  id v52 = a3;
  id obj = a4;
  id v51 = a4;
  id v53 = a5;
  id v45 = a6;
  id v50 = a6;
  id v54 = a7;
  id v49 = a8;
  id v19 = a9;
  id v48 = a10;
  v20 = v19;
  id v21 = a11;
  id v47 = a12;
  id v22 = a13;
  v55.receiver = self;
  v55.super_class = (Class)PDSharingManager;
  v23 = [(PDSharingManager *)&v55 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v24->_databaseManager, obj);
    objc_storeStrong((id *)&v24->_userNotificationManager, a5);
    objc_storeStrong((id *)&v24->_pushNotificationManager, v45);
    objc_storeStrong((id *)&v24->_subcredentialManager, a8);
    objc_storeStrong((id *)&v24->_remoteInterfacePresenter, a10);
    objc_storeStrong((id *)&v24->_cloudStoreDelegate, a12);
    objc_storeWeak((id *)&v24->_delegate, v22);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.passd.sharingmanager", 0);
    queue = v24->_queue;
    v24->_queue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("com.apple.passd.sharingmanager", 0);
    replyQueue = v24->_replyQueue;
    v24->_replyQueue = (OS_dispatch_queue *)v27;

    v29 = [[PDCarKeySharingManagementService alloc] initWithWebServiceCoordinator:v24->_webServiceCoordinator cardFileManager:v54 cloudStoreDelegate:v24->_cloudStoreDelegate delegate:v24];
    carKeyManagementService = v24->_carKeyManagementService;
    v24->_carKeyManagementService = v29;

    v31 = [[PDGeneralSharingManagementService alloc] initWithWebServiceCoordinator:v24->_webServiceCoordinator];
    sharingManagementService = v24->_sharingManagementService;
    v24->_sharingManagementService = v31;

    v33 = objc_alloc_init(PDHomeShareManagementService);
    homeManagementService = v24->_homeManagementService;
    v24->_homeManagementService = v33;

    v35 = [[PDSharingChannelManager alloc] initWithWebServiceCoordinator:v24->_webServiceCoordinator databaseManager:v24->_databaseManager pushNotificationManager:v24->_pushNotificationManager idsSharingService:v21];
    channelManager = v24->_channelManager;
    v24->_channelManager = v35;

    [(PDSharingChannelManager *)v24->_channelManager addDelegate:v24];
    v37 = [[PDSharingStatefulProvisioningManager alloc] initWithQueue:v24->_queue replyQueue:v24->_replyQueue databaseManager:v24->_databaseManager delegate:v24];
    statefulProvisioningManager = v24->_statefulProvisioningManager;
    v24->_statefulProvisioningManager = v37;

    v39 = [[PDSharingUserCommunicationManager alloc] initWithNotificationManager:v53 applicationMessageManager:v20 delegate:v24];
    userCommunicationManager = v24->_userCommunicationManager;
    v24->_userCommunicationManager = v39;

    v41 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    continuityManagers = v24->_continuityManagers;
    v24->_continuityManagers = v41;

    [(PDUserNotificationManager *)v24->_userNotificationManager removeUserNotificationsOfType:79];
  }

  return v24;
}

- (void)start
{
}

- (void)checkInvitationStatusForMailboxAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EE2B8;
    block[3] = &unk_10072E9D8;
    id v11 = v6;
    v12 = self;
    id v13 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    v9 = PDBasicError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (void)retrieveShareInvitationForMailboxAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EE470;
    block[3] = &unk_10072E9D8;
    id v11 = v6;
    v12 = self;
    id v13 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    v9 = PDBasicError();
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v9);
  }
}

- (void)relinquishInvitation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF39C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)deleteSharingMessage:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000EF6BC;
    v8[3] = &unk_10072E198;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
  else
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error: unable to delete message, missing message", buf, 2u);
    }
  }
}

- (void)rejectShareForMailboxAddress:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000EF984;
    v7[3] = &unk_10072E198;
    id v8 = v4;
    id v9 = self;
    dispatch_async(queue, v7);
  }
}

- (void)prewarmCreateShareForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EFED0;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)createShareForPartialShareInvitation:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000F0738;
  v43[3] = &unk_100736420;
  v43[4] = self;
  id v10 = a5;
  id v44 = v10;
  id v11 = objc_retainBlock(v43);
  id v12 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10002087C;
  v41[4] = sub_100020F30;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10002087C;
  v39[4] = sub_100020F30;
  id v40 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000F083C;
  v38[3] = &unk_10072E5C0;
  v38[4] = self;
  [v12 addOperation:v38];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000F091C;
  v32[3] = &unk_100736448;
  id v13 = v8;
  id v33 = v13;
  v34 = self;
  v36 = v39;
  v37 = v41;
  v14 = v11;
  id v35 = v14;
  [v12 addOperation:v32];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000F0B58;
  v28[3] = &unk_100736498;
  v31 = v39;
  id v15 = v13;
  id v29 = v15;
  v30 = self;
  [v12 addOperation:v28];
  v16 = +[NSNull null];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000F0E18;
  v21[3] = &unk_100736510;
  id v17 = v15;
  id v22 = v17;
  v26 = v41;
  dispatch_queue_t v27 = v39;
  id v18 = v9;
  id v23 = v18;
  id v19 = v14;
  v24 = self;
  id v25 = v19;
  id v20 = [v12 evaluateWithInput:v16 completion:v21];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
}

- (void)createShareInvitationForPartialShareInvitation:(id)a3 existingTransportIdentifier:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x3032000000;
  v55[3] = sub_10002087C;
  v55[4] = sub_100020F30;
  id v56 = 0;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = sub_10002087C;
  v53[4] = sub_100020F30;
  id v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = sub_10002087C;
  v51[4] = sub_100020F30;
  id v52 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000F1A54;
  v50[3] = &unk_10072E5C0;
  v50[4] = self;
  [v14 addOperation:v50];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_1000F1B34;
  v45[3] = &unk_100736538;
  id v47 = v53;
  v45[4] = self;
  id v15 = v10;
  id v46 = v15;
  id v48 = v55;
  id v49 = v51;
  [v14 addOperation:v45];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000F1D34;
  v42[3] = &unk_100730BC0;
  v42[4] = self;
  id v44 = v53;
  id v16 = v15;
  id v43 = v16;
  [v14 addOperation:v42];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_10002087C;
  v40[4] = sub_100020F30;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10002087C;
  v38[4] = sub_100020F30;
  id v39 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000F1E94;
  v29[3] = &unk_100736588;
  id v17 = v16;
  id v30 = v17;
  id v33 = v55;
  v34 = v53;
  id v18 = v12;
  id v31 = v18;
  id v35 = v51;
  v36 = v38;
  id v19 = v11;
  id v32 = v19;
  v37 = v40;
  [v14 addOperation:v29];
  id v20 = +[NSNull null];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000F2144;
  v23[3] = &unk_1007365D8;
  v23[4] = self;
  id v25 = v40;
  v26 = v38;
  dispatch_queue_t v27 = v53;
  id v21 = v13;
  id v24 = v21;
  v28 = v51;
  id v22 = [v14 evaluateWithInput:v20 completion:v23];

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

  _Block_object_dispose(v55, 8);
}

- (void)updateShareForPassIdentifier:(id)a3 share:(id)a4 authorization:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F33D4;
  block[3] = &unk_100734360;
  void block[4] = self;
  id v20 = v10;
  id v22 = v12;
  id v23 = v13;
  id v21 = v11;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)revokeShareForPassIdentifier:(id)a3 share:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v14 = a4;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = +[NSArray arrayWithObjects:&v14 count:1];

  -[PDSharingManager revokeSharesForPassIdentifier:shares:shouldCascade:completion:](self, "revokeSharesForPassIdentifier:shares:shouldCascade:completion:", v12, v13, v6, v10, v14);
}

- (void)revokeSharesForPassIdentifier:(id)a3 shares:(id)a4 shouldCascade:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F3ADC;
  block[3] = &unk_10072E3F0;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  BOOL v21 = a5;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(queue, block);
}

- (void)createSingleUseShareURLWithMessage:(id)a3 timeToLive:(unint64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F43CC;
  block[3] = &unk_10072E9D8;
  id v13 = v7;
  id v14 = self;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

- (void)cacheSharingMessageFromMailboxAddress:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = +[PKSharingRelayChannelDescriptor existingChannelForURL:v6];
    [(PDSharingChannelManager *)self->_channelManager cacheSharingMessageForDescriptor:v9 message:v8];
  }
  else
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error: unable to cache message, missing mailboxAddress or message", v11, 2u);
    }
  }
}

- (BOOL)hasActiveExternallySharedPasses
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000F492C;
  v5[3] = &unk_10072FAC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4A28;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (BOOL)hasSharesForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4BCC;
  block[3] = &unk_100731208;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (BOOL)hasShareableEntitlementsForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4CE0;
  block[3] = &unk_100731208;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)entitlementsForPassIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_10002087C;
  id v16 = sub_100020F30;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4E28;
  block[3] = &unk_100731208;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)displayableSharesForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F4F3C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)displayableEntitlementsForPassIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F5420;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F56A0;
  block[3] = &unk_10072F7D0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)passAdded:(id)a3
{
}

- (void)passUpdated:(id)a3 oldShares:(id)a4
{
}

- (void)passUpdated:(id)a3 oldPass:(id)a4 oldShares:(id)a5 oldEntitlements:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10) {
    char v13 = [v10 passActivationState] != (id)2;
  }
  else {
    char v13 = 0;
  }
  if ([v10 passActivationState])
  {
    char v14 = 0;
    id v15 = v17;
  }
  else
  {
    id v16 = [v17 passActivationState];
    id v15 = v17;
    char v14 = v16 == 0;
  }
  sub_1000F5B8C((uint64_t)self, v15, v13, v11, v14, v12);
}

- (void)passWillBeRemoved:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F5FF4;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendSharingMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000F6368;
  v15[3] = &unk_100730578;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)acceptCarKeyShareForMessage:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000F674C;
  v23[3] = &unk_100736990;
  v23[4] = self;
  id v10 = a5;
  id v24 = v10;
  id v11 = objc_retainBlock(v23);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F6840;
  block[3] = &unk_1007369E0;
  id v18 = v8;
  id v19 = self;
  id v21 = v11;
  id v22 = v10;
  id v20 = v9;
  id v13 = v9;
  id v14 = v10;
  id v15 = v11;
  id v16 = v8;
  dispatch_async(queue, block);
}

- (void)didReceiveActivationCodeFailureForCredentialIdentifier:(id)a3 attemptsRemaining:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if (PKV2SharingFlowEnabled())
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    v9[2](v9, 1);
  }
  else
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F7AA8;
    block[3] = &unk_10072F7D0;
    void block[4] = self;
    id v13 = v8;
    unint64_t v14 = a4;
    dispatch_async(queue, block);
    v9[2](v9, 1);
  }
}

- (void)pendingShareActivationForShareIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F7CAC;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)pendingCredentialsBeingProvisioned:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F86E4;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)revokePendingCredentialsForReaderIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F894C;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)finishedStatefulProvisioningAttemptWithSuccess:(BOOL)a3 operation:(id)a4 share:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v11 = @"Yes";
    }
    else {
      CFStringRef v11 = @"No";
    }
    id v12 = [v9 identifier];
    int v23 = 138412546;
    CFStringRef v24 = v11;
    __int16 v25 = 2112;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "StatefulProvisioningManager: finished attempt with success: %@ for share %@", (uint8_t *)&v23, 0x16u);
  }
  if (!v6)
  {
    id v13 = [v9 subcredentialIdentifier];
    [(PDAppletSubcredentialManager *)self->_subcredentialManager revokeSubcredentialForIdentifier:v13 withCompletion:0];
  }
  unint64_t v14 = [v8 transportIdentifier];
  id v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v17 = [v9 credentialShares];
    id v18 = [v17 firstObject];
    id v16 = [v18 channelTransportIdentifier];
  }
  id v19 = +[PKSharingRelayChannelDescriptor existingChannelForMailboxIdentifier:v16];
  id v20 = [(PDSharingChannelManager *)self->_channelManager handleForDescriptor:v19 queue:self->_queue];
  if (v20)
  {
    if (v6 && ([v8 isForegroundOperation] & 1) == 0) {
      sub_1000F80E4((id *)&self->super.isa, v9, (uint64_t)v16);
    }
    sub_1000EF81C((uint64_t)self, v20);
  }
  databaseManager = self->_databaseManager;
  id v22 = [v9 identifier];
  [(PDDatabaseManager *)databaseManager deletePassShareWithIdentifier:v22];
}

- (void)provisioningOperationsDidUpdate
{
}

- (id)pendingShareActivations
{
  if (PKV2SharingFlowEnabled())
  {
    id v3 = &__NSArray0__struct;
  }
  else
  {
    id v4 = objc_alloc_init((Class)NSMutableArray);
    queue = self->_queue;
    id v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    id v10 = sub_1000F8FB4;
    CFStringRef v11 = &unk_10072E198;
    id v12 = self;
    id v6 = v4;
    id v13 = v6;
    dispatch_sync(queue, &v8);
    if (objc_msgSend(v6, "count", v8, v9, v10, v11, v12)) {
      id v3 = [v6 copy];
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

- (id)pendingShareActivationForShareIdentifier:(id)a3
{
  id v4 = a3;
  if (PKV2SharingFlowEnabled())
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    unint64_t v14 = sub_10002087C;
    id v15 = sub_100020F30;
    id v16 = 0;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000F9244;
    block[3] = &unk_100731208;
    id v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(queue, block);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v5;
}

- (void)userDidDismissPendingShareActivationForShareIdentifier:(id)a3
{
  id v4 = a3;
  if ((PKV2SharingFlowEnabled() & 1) == 0)
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000F9340;
    v6[3] = &unk_10072E198;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(queue, v6);
  }
}

- (void)insertPassMessage:(id)a3 pass:(id)a4
{
  id v9 = a3;
  databaseManager = self->_databaseManager;
  id v7 = [a4 uniqueID];
  id v8 = [(PDDatabaseManager *)databaseManager insertOrUpdatePaymentMessage:v9 forPassUniqueIdentifier:v7 paymentApplication:0 performTruncation:0];
}

- (void)handleOutstandingShareMessage:(id)a3 transportIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)[v8 type];
  if (v7 <= 1001)
  {
    if (v7 == 1) {
      goto LABEL_10;
    }
    if (v7 == 1001)
    {
      sub_1000F9504((uint64_t)self, v8, v6);
      goto LABEL_10;
    }
LABEL_8:
    sub_1000F968C((uint64_t)self, v8, v6);
    goto LABEL_10;
  }
  if (v7 != 1002)
  {
    if (v7 == 2001)
    {
      sub_1000F5798((uint64_t)self, v8, v6);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  sub_1000F95C8((uint64_t)self, v8, v6);
LABEL_10:
}

- (void)channelWasRemotelyTerminatedWithTransportIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000FCB00;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)processCLICommands:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_ui())
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000FCFC8;
    block[3] = &unk_1007315D8;
    id v10 = v6;
    uint64_t v11 = self;
    id v12 = v7;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, const __CFString *))v7 + 2))(v7, @"Unsupported on non internal builds");
  }
}

- (PDSharingChannelManager)channelManager
{
  return self->_channelManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channelManager, 0);
  objc_storeStrong((id *)&self->_continuityManagers, 0);
  objc_storeStrong((id *)&self->_carKeyManagementService, 0);
  objc_storeStrong((id *)&self->_homeManagementService, 0);
  objc_storeStrong((id *)&self->_sharingManagementService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cloudStoreDelegate, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_subcredentialManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_userCommunicationManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_statefulProvisioningManager, 0);
}

@end