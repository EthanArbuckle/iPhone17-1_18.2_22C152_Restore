@interface KmlOwnerSharingManager
- (int64_t)getTotalNumberOfSharedKeys;
- (void)dealloc;
- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4;
- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10;
- (void)handleOwnerKeySharingCancelledWithStatus:(id)a3;
- (void)handlePasscodeRetryRequestedForInvitation:(id)a3;
- (void)handleSendMessageResult:(id)a3;
- (void)handleSentInvitationWithIdentifier:(id)a3;
- (void)handleSharingCompleteForInvitationIdentifier:(id)a3 localShare:(BOOL)a4 bindingAttestationUsed:(BOOL)a5 status:(id)a6;
- (void)handleTransportSetupResult:(id)a3;
@end

@implementation KmlOwnerSharingManager

- (void)dealloc
{
  objc_storeWeak((id *)&self->_delegate, 0);
  oksQueue = self->_oksQueue;
  self->_oksQueue = 0;

  v4.receiver = self;
  v4.super_class = (Class)KmlOwnerSharingManager;
  [(KmlOwnerSharingManager *)&v4 dealloc];
}

- (void)handleSentInvitationWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    oksQueue = self->_oksQueue;
    v13[0] = (uint64_t)_NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = (uint64_t)sub_100353A70;
    v13[3] = (uint64_t)&unk_10040D1A0;
    v13[4] = (uint64_t)self;
    id v14 = v4;
    dispatch_async(oksQueue, v13);
  }
  else
  {
    if (self) {
      sharingManagerId = self->_sharingManagerId;
    }
    else {
      sharingManagerId = 0;
    }
    id v8 = [(NSUUID *)sharingManagerId UUIDString];
    id v9 = [v8 UTF8String];
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1571, (uint64_t)v9, @"Invitation ID is nil", v10, v11, v12, v13[0]);
  }
}

- (void)handlePasscodeRetryRequestedForInvitation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    oksQueue = self->_oksQueue;
    v13[0] = (uint64_t)_NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = (uint64_t)sub_100353D14;
    v13[3] = (uint64_t)&unk_10040D1A0;
    v13[4] = (uint64_t)self;
    id v14 = v4;
    dispatch_async(oksQueue, v13);
  }
  else
  {
    if (self) {
      sharingManagerId = self->_sharingManagerId;
    }
    else {
      sharingManagerId = 0;
    }
    id v8 = [(NSUUID *)sharingManagerId UUIDString];
    id v9 = [v8 UTF8String];
    KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1597, (uint64_t)v9, @"Invitation ID is nil", v10, v11, v12, v13[0]);
  }
}

- (int64_t)getTotalNumberOfSharedKeys
{
  return self->_totalSharedKeys;
}

- (void)handleOwnerKeySharingCancelledWithStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self) {
      sharingManagerId = self->_sharingManagerId;
    }
    else {
      sharingManagerId = 0;
    }
    v6 = sharingManagerId;
    id v7 = [(NSUUID *)v6 UUIDString];
    id v8 = [v7 UTF8String];
    KmlSharingLogFunc(OS_LOG_TYPE_DEBUG, (uint64_t)"KmlOwnerSharingManager.m", 1631, (uint64_t)v8, @"Failed to cancel sharing due to %@", v9, v10, v11, (uint64_t)v4);
  }
  else
  {
    if (self) {
      uint64_t v12 = self->_sharingManagerId;
    }
    else {
      uint64_t v12 = 0;
    }
    id v7 = [(NSUUID *)v12 UUIDString];
    id v13 = [v7 UTF8String];
    KmlSharingLogFunc(OS_LOG_TYPE_DEBUG, (uint64_t)"KmlOwnerSharingManager.m", 1629, (uint64_t)v13, @"Sharing cancelled successfully.", v14, v15, v16, v19);
  }

  oksQueue = self->_oksQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100354060;
  block[3] = &unk_10040D1A0;
  block[4] = self;
  id v21 = v4;
  id v18 = v4;
  dispatch_async(oksQueue, block);
}

- (void)handleSharingCompleteForInvitationIdentifier:(id)a3 localShare:(BOOL)a4 bindingAttestationUsed:(BOOL)a5 status:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  oksQueue = self->_oksQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100354190;
  v15[3] = &unk_10041A8E0;
  v15[4] = self;
  id v16 = v10;
  BOOL v18 = a4;
  BOOL v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(oksQueue, v15);
}

- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10
{
  id v12 = a7;
  id v13 = a10;
  oksQueue = self->_oksQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100354698;
  block[3] = &unk_10041A908;
  block[4] = self;
  id v18 = v13;
  int64_t v20 = a8;
  int64_t v21 = a9;
  id v19 = v12;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(oksQueue, block);
}

- (void)handleSendMessageResult:(id)a3
{
  if (self) {
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  }
  id v8 = [(KmlOwnerSharingManager *)self UUIDString];
  id v3 = [v8 UTF8String];
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1792, (uint64_t)v3, @"We should not be sending any messages. So don't expect a result either.", v4, v5, v6, v7);
}

- (void)handleTransportSetupResult:(id)a3
{
  if (self) {
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  }
  id v8 = [(KmlOwnerSharingManager *)self UUIDString];
  id v3 = [v8 UTF8String];
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1798, (uint64_t)v3, @"We should not be setting up transport. So don't expect a result either.", v4, v5, v6, v7);
}

- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4
{
  if (self) {
    self = (KmlOwnerSharingManager *)self->_sharingManagerId;
  }
  id v9 = [(KmlOwnerSharingManager *)self UUIDString];
  id v4 = [v9 UTF8String];
  KmlSharingLogFunc(OS_LOG_TYPE_INFO, (uint64_t)"KmlOwnerSharingManager.m", 1805, (uint64_t)v4, @"We don't handle cross platform sharing messages here.", v5, v6, v7, v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingSessions, 0);
  objc_storeStrong((id *)&self->_friendCrossPlatformIdentifier, 0);
  objc_storeStrong((id *)&self->_friendIdsIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerkeyIdStr, 0);
  objc_storeStrong((id *)&self->_sharingManagerId, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_sharingRecordsUpdater, 0);
  objc_storeStrong((id *)&self->_sharingInvitationsCrossPlatform, 0);
  objc_storeStrong((id *)&self->_sharingInvitationsForIds, 0);
  objc_storeStrong((id *)&self->_sharingConfigs, 0);
  objc_storeStrong((id *)&self->_oksQueue, 0);
  objc_storeStrong((id *)&self->_sharingResult, 0);
  objc_storeStrong((id *)&self->_vehicleEnteredPasscode, 0);
  objc_storeStrong((id *)&self->_passcodeSeed, 0);
  objc_storeStrong((id *)&self->_ourBindingAttestation, 0);
  objc_storeStrong((id *)&self->_authorizationId, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_ownerId, 0);

  objc_storeStrong((id *)&self->_ownerEndPoint, 0);
}

@end