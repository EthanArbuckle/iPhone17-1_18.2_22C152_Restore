@interface KmlOwnerSharingSession
- (void)dealloc;
- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4;
- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10;
- (void)handleSendMessageResult:(id)a3;
- (void)handleTransportSetupResult:(id)a3;
@end

@implementation KmlOwnerSharingSession

- (void)dealloc
{
  objc_storeWeak((id *)&self->_sessionDelegate, 0);
  sessionQueue = self->_sessionQueue;
  self->_sessionQueue = 0;

  ksTransport = self->_ksTransport;
  self->_ksTransport = 0;

  objc_storeWeak((id *)&self->_reporterDelegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)KmlOwnerSharingSession;
  [(KmlOwnerSharingSession *)&v5 dealloc];
}

- (void)handleIncomingMessage:(id)a3 metaData:(id)a4 bindingAttestation:(id)a5 keyIdentifier:(id)a6 uuid:(id)a7 messageType:(int64_t)a8 targetDeviceType:(int64_t)a9 remoteIdsIdentifier:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a10;
  sessionQueue = self->_sessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F4BA4;
  block[3] = &unk_100419928;
  block[4] = self;
  id v27 = v15;
  id v31 = v16;
  int64_t v32 = a8;
  id v28 = v18;
  id v29 = v19;
  id v30 = v17;
  id v21 = v16;
  id v22 = v17;
  id v23 = v19;
  id v24 = v18;
  id v25 = v15;
  dispatch_async(sessionQueue, block);
}

- (void)handleTransportSetupResult:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F545C;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

- (void)handleSendMessageResult:(id)a3
{
  id v4 = a3;
  sessionQueue = self->_sessionQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002F5610;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sessionQueue, v7);
}

- (void)handleCrossPlatformSharingMessage:(id)a3 fromMailboxIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sessionQueue = self->_sessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002F5888;
  block[3] = &unk_10040D2C0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(sessionQueue, block);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_storeStrong((id *)&self->_sharingInvitation, 0);
  objc_storeStrong((id *)&self->_sharingInvitationId, 0);
  objc_destroyWeak((id *)&self->_cancelDelegate);
  objc_destroyWeak((id *)&self->_reporterDelegate);
  objc_storeStrong((id *)&self->_versionInformation, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_deviceConfig, 0);
  objc_storeStrong((id *)&self->_friendKeyIdStr, 0);
  objc_storeStrong((id *)&self->_friendKeyId, 0);
  objc_storeStrong((id *)&self->_sharingResult, 0);
  objc_storeStrong((id *)&self->_ksTransport, 0);
  objc_storeStrong((id *)&self->_epAuthResponse, 0);
  objc_storeStrong((id *)&self->_ownerEndPoint, 0);
  objc_storeStrong((id *)&self->_ourBindingAttestation, 0);
  objc_storeStrong((id *)&self->_bindingAttestation, 0);
  objc_storeStrong((id *)&self->_keyConfigInTLV, 0);
  objc_storeStrong((id *)&self->_entitlementsInTLV, 0);
  objc_storeStrong((id *)&self->_keyConfigInASN1, 0);
  objc_storeStrong((id *)&self->_entitlementsInASN1, 0);
  objc_storeStrong((id *)&self->_signedResponse, 0);
  objc_storeStrong((id *)&self->_signingRequest, 0);

  objc_storeStrong((id *)&self->_sharingConfig, 0);
}

@end