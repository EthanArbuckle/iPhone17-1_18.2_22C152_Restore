@interface KmlWalletReporter
- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6;
- (KmlWalletReporter)init;
- (void)dealloc;
- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6;
- (void)finishedSharingForKey:(id)a3 result:(id)a4;
- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4;
- (void)reportUnusableInvitation:(id)a3 reason:(id)a4;
- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3;
- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4;
- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5;
@end

@implementation KmlWalletReporter

- (KmlWalletReporter)init
{
  v9.receiver = self;
  v9.super_class = (Class)KmlWalletReporter;
  v2 = [(KmlWalletReporter *)&v9 init];
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init((Class)PKPaymentService);
    service = v2->_service;
    v2->_service = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.sesd.kml.reporter", v5);
    reporterQueue = v2->_reporterQueue;
    v2->_reporterQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)dealloc
{
  service = self->_service;
  self->_service = 0;

  v4.receiver = self;
  v4.super_class = (Class)KmlWalletReporter;
  [(KmlWalletReporter *)&v4 dealloc];
}

- (void)didReceiveSharingInvitationWithIdentifier:(id)a3 uuid:(id)a4 metadata:(id)a5 ownerIdsId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF07C;
  block[3] = &unk_10040D5C0;
  block[4] = self;
  id v20 = v10;
  id v21 = v13;
  id v22 = v11;
  id v23 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_async(reporterQueue, block);
}

- (void)finishedSharingForKey:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)PKAppletSubcredential) initWithKeyInformation:v5];

  reporterQueue = self->_reporterQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1002FF1BC;
  v9[3] = &unk_10040D1A0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(reporterQueue, v9);
}

- (void)reportUnusableInvitation:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = [a4 code];
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF2E8;
  block[3] = &unk_10040D970;
  block[4] = self;
  id v11 = v6;
  BOOL v12 = v7 == (id)110;
  id v9 = v6;
  dispatch_async(reporterQueue, block);
}

- (void)requestAuthorizationForSharingInvitationIdentifier:(id)a3
{
  KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlWalletReporter requestAuthorizationForSharingInvitationIdentifier:]", 89, @"Not implemented", v3, v4, v5, v6, v7);
}

- (void)sharingCompleteForInvitationIdentifier:(id)a3 friendKeyIdentifier:(id)a4 status:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  reporterQueue = self->_reporterQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002FF460;
  v15[3] = &unk_100419A98;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(reporterQueue, v15);
}

- (BOOL)didReceiveInvitationRequestWithUuid:(id)a3 ownerKeyIdentifier:(id)a4 friendKeyIdentifier:(id)a5 targetType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init((Class)PKAppletSubcredentialSharingInvitationRequest);
  [v13 setSharingSessionIdentifier:v10];
  [v13 setCredentialIdentifier:v11];
  [v13 setSharedCredentialIdentifier:v12];
  [v13 setDeviceType:a6 != 2];
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_reporterQueue);
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF6A0;
  block[3] = &unk_100419AE8;
  block[4] = self;
  id v18 = v13;
  id v19 = &v20;
  id v15 = v13;
  dispatch_sync(reporterQueue, block);
  LOBYTE(v13) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v13;
}

- (void)sendCrossPlatformSharingMessage:(id)a3 toMailboxIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 genericData];
  id v9 = [v8 asDictionary];

  id v10 = +[NSMutableDictionary dictionary];
  id v11 = [v7 additionalData];
  id v12 = [v11 asDictionary];
  [v10 setObject:v12 forKeyedSubscript:@"carKey"];

  id v13 = [v7 genericData];

  id v14 = (char *)[v13 messageType];
  if ((unint64_t)(v14 - 1) >= 7) {
    id v14 = 0;
  }
  id v15 = [objc_alloc((Class)PKSharingGenericMessage) initWithFormat:2 type:v14 genericSharingDict:v9 appleSharingDict:v10];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_reporterQueue);
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FF938;
  block[3] = &unk_10040D2C0;
  block[4] = self;
  id v20 = v6;
  id v21 = v15;
  id v17 = v15;
  id v18 = v6;
  dispatch_sync(reporterQueue, block);
}

- (void)passcodeRetryRequestedFor:(id)a3 retriesLeft:(unint64_t)a4
{
  id v6 = a3;
  reporterQueue = self->_reporterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002FFA5C;
  block[3] = &unk_10040D970;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(reporterQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_reporterQueue, 0);
}

@end