@interface PDContinuityPaymentService
- (PDContinuityPaymentService)initWithConnection:(id)a3;
- (PDContinuityPaymentService)initWithConnection:(id)a3 server:(id)a4;
- (PKIDSManager)idsManager;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)canMakePaymentsWithRemoteDevicesWithHandler:(id)a3;
- (void)cancelRemotePaymentRequest:(id)a3 handler:(id)a4;
- (void)clearConnectionReference;
- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3;
- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4;
- (void)fetchRemoteDevicesWithHandler:(id)a3;
- (void)hasRemoteDevicesWithHandler:(id)a3;
- (void)managerDevicesDidChange:(id)a3;
- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 handler:(id)a4;
- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 handler:(id)a6;
- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 handler:(id)a5;
- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5;
- (void)sendRemotePaymentRequest:(id)a3 handler:(id)a4;
- (void)setIdsManager:(id)a3;
- (void)updatePaymentDevicesWithHandler:(id)a3;
@end

@implementation PDContinuityPaymentService

- (PDContinuityPaymentService)initWithConnection:(id)a3
{
  return 0;
}

- (PDContinuityPaymentService)initWithConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PDContinuityPaymentService;
  v8 = [(PDContinuityPaymentService *)&v19 initWithConnection:v6];
  if (v8)
  {
    v9 = (PKEntitlementWhitelist *)[objc_alloc((Class)PKEntitlementWhitelist) initWithConnection:v6];
    whitelist = v8->_whitelist;
    v8->_whitelist = v9;

    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    requests = v8->_requests;
    v8->_requests = v11;

    v13 = sub_100011FE8((uint64_t)v7);
    uint64_t v14 = sub_100011FD0((uint64_t)v13);
    remoteInterfacePresenter = v8->_remoteInterfacePresenter;
    v8->_remoteInterfacePresenter = (PDRemoteInterfacePresenter *)v14;

    v16 = PKContinuityPaymentServiceInterface();
    [v6 setRemoteObjectInterface:v16];

    v17 = PDContinuityPaymentServiceInterface();
    [v6 setExportedInterface:v17];

    [v6 setExportedObject:v8];
  }

  return v8;
}

- (id)remoteObjectProxy
{
  v4.receiver = self;
  v4.super_class = (Class)PDContinuityPaymentService;
  v2 = [(PDContinuityPaymentService *)&v4 remoteObjectProxy];
  return v2;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDContinuityPaymentService;
  v3 = [(PDContinuityPaymentService *)&v5 remoteObjectProxyWithErrorHandler:a3];
  return v3;
}

- (void)clearConnectionReference
{
  [(PDContinuityPaymentService *)self setIdsManager:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_requests;
  id v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v7);
        v9 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Connection cleared, cancelling outstanding remote payment requests", buf, 2u);
        }

        id v10 = [(PKIDSManager *)self->_idsManager cancelRemotePaymentRequest:v8 completion:0];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)PDContinuityPaymentService;
  [(PDContinuityPaymentService *)&v11 clearConnectionReference];
}

- (void)setIdsManager:(id)a3
{
  id v5 = (PKIDSManager *)a3;
  p_idsManager = &self->_idsManager;
  idsManager = self->_idsManager;
  uint64_t v8 = v5;
  if (idsManager != v5)
  {
    if (idsManager) {
      [(PKIDSManager *)idsManager removeDelegate:self];
    }
    objc_storeStrong((id *)&self->_idsManager, a3);
    if (*p_idsManager) {
      [(PKIDSManager *)*p_idsManager addDelegate:self];
    }
  }
}

- (void)updatePaymentDevicesWithHandler:(id)a3
{
  id v7 = a3;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    [(PKIDSManager *)idsManager discoverRemoteDevicesWithProximity:1];
    id v5 = v7;
    if (!v7) {
      goto LABEL_9;
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
  else
  {
    uint64_t v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v6);
    }
  }
  id v5 = v7;
LABEL_9:
}

- (void)sendPaymentSetupRequest:(id)a3 appDisplayName:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B30B8;
    v14[3] = &unk_1007378B8;
    id v15 = v10;
    id v12 = [(PKIDSManager *)idsManager sendSetupRequest:v8 appDisplayName:v9 completion:v14];
  }
  else
  {
    long long v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendRemotePaymentRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && self->_idsManager)
  {
    [(NSMutableSet *)self->_requests addObject:v6];
    idsManager = self->_idsManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003B320C;
    v11[3] = &unk_1007378B8;
    id v12 = v7;
    id v9 = [(PKIDSManager *)idsManager sendRemotePaymentRequest:v6 completion:v11];
  }
  else
  {
    id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
}

- (void)sendPayment:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B335C;
    v14[3] = &unk_1007378B8;
    id v15 = v10;
    id v12 = [(PKIDSManager *)idsManager sendPayment:v8 forRemotePaymentRequest:v9 completion:v14];
  }
  else
  {
    long long v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B34AC;
    v14[3] = &unk_1007378B8;
    id v15 = v10;
    id v12 = [(PKIDSManager *)idsManager sendPaymentHostUpdate:v8 forRemotePaymentRequest:v9 completion:v14];
  }
  else
  {
    long long v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B35FC;
    v14[3] = &unk_1007378B8;
    id v15 = v10;
    id v12 = [(PKIDSManager *)idsManager sendPaymentClientUpdate:v8 forRemotePaymentRequest:v9 completion:v14];
  }
  else
  {
    long long v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentResult:(id)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1003B374C;
    v14[3] = &unk_1007378B8;
    id v15 = v10;
    id v12 = [(PKIDSManager *)idsManager sendPaymentResult:v8 forRemotePaymentRequest:v9 completion:v14];
  }
  else
  {
    long long v13 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v10) {
      (*((void (**)(id, void *))v10 + 2))(v10, v13);
    }
  }
}

- (void)sendPaymentStatus:(int64_t)a3 forRemotePaymentRequest:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)PKPaymentAuthorizationResult);
  [v10 setStatus:a3];
  [(PDContinuityPaymentService *)self sendPaymentResult:v10 forRemotePaymentRequest:v9 handler:v8];
}

- (void)requestInstrumentThumbnail:(id)a3 forRemoteDevice:(id)a4 size:(CGSize)a5 handler:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1003B3954;
    v17[3] = &unk_1007372C8;
    id v18 = v13;
    id v15 = -[PKIDSManager requestInstrumentThumbnail:forRemoteDevice:size:completion:](idsManager, "requestInstrumentThumbnail:forRemoteDevice:size:completion:", v11, v12, v17, width, height);
  }
  else
  {
    long long v16 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v13) {
      (*((void (**)(id, void, void *))v13 + 2))(v13, 0, v16);
    }
  }
}

- (void)presentContinuityPaymentInterfaceWithRequestIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && (idsManager = self->_idsManager) != 0)
  {
    id v9 = [(PKIDSManager *)idsManager requestForIdentifier:v6];
    if (v9)
    {
      remoteInterfacePresenter = self->_remoteInterfacePresenter;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1003B3AF0;
      v12[3] = &unk_1007304D8;
      id v13 = v7;
      sub_10020A624((uint64_t)remoteInterfacePresenter, v9, v12);
    }
    else
    {
      id v11 = +[NSError errorWithDomain:PKPassKitErrorDomain code:1 userInfo:0];
      if (v7) {
        (*((void (**)(id, void *))v7 + 2))(v7, v11);
      }
    }
  }
  else
  {
    id v9 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v9);
    }
  }
}

- (void)cancelRemotePaymentRequest:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess]
    && self->_idsManager)
  {
    [(NSMutableSet *)self->_requests removeObject:v6];
    idsManager = self->_idsManager;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003B3CF0;
    v11[3] = &unk_1007378B8;
    id v12 = v7;
    id v9 = [(PKIDSManager *)idsManager cancelRemotePaymentRequest:v6 completion:v11];
  }
  else
  {
    id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v7) {
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
  }
}

- (void)hasRemoteDevicesWithHandler:(id)a3
{
  id v7 = (uint64_t (**)(id, id, void))a3;
  if ((([(PKEntitlementWhitelist *)self->_whitelist inAppPayments] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments])
    && (idsManager = self->_idsManager) != 0)
  {
    id v5 = v7;
    if (!v7) {
      goto LABEL_10;
    }
    idsManager = (PKIDSManager *)v7[2](v7, [(PKIDSManager *)idsManager hasRemoteDevices], 0);
  }
  else
  {
    id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v7) {
      ((uint64_t (**)(id, id, void *))v7)[2](v7, 0, v6);
    }
  }
  id v5 = v7;
LABEL_10:
  _objc_release_x1(idsManager, v5);
}

- (void)canMakePaymentsWithRemoteDevicesWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if ((([(PKEntitlementWhitelist *)self->_whitelist inAppPayments] & 1) != 0
     || [(PKEntitlementWhitelist *)self->_whitelist supportsWebPayments])
    && (idsManager = self->_idsManager) != 0)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = [(PKIDSManager *)idsManager remoteDevices];
    uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) canMakePayments])
          {
            uint64_t v7 = 1;
            goto LABEL_17;
          }
        }
        uint64_t v7 = (uint64_t)[v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    if (v4) {
      v4[2](v4, v7, 0);
    }
  }
  else
  {
    id v10 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
    if (v4) {
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v10);
    }
  }
}

- (void)fetchRemoteDevicesWithHandler:(id)a3
{
  uint64_t v8 = (void (**)(void))a3;
  if (([(PKEntitlementWhitelist *)self->_whitelist paymentAllAccess] & 1) != 0
    || [(PKEntitlementWhitelist *)self->_whitelist inAppPaymentsPrivate])
  {
    idsManager = self->_idsManager;
    if (idsManager)
    {
      id v5 = v8;
      if (!v8) {
        goto LABEL_10;
      }
      id v6 = [(PKIDSManager *)idsManager remoteDevices];
      uint64_t v7 = v8[2];
      goto LABEL_8;
    }
  }
  id v6 = +[NSError errorWithDomain:PKPassKitErrorDomain code:4 userInfo:0];
  if (v8)
  {
    uint64_t v7 = v8[2];
LABEL_8:
    v7();
  }

  id v5 = v8;
LABEL_10:
  _objc_release_x1(idsManager, v5);
}

- (void)didReceivePayment:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  [v8 didReceivePayment:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentResult:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  [v8 didReceivePaymentResult:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentHostUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  [v8 didReceivePaymentHostUpdate:v7 forRemotePaymentRequest:v6];
}

- (void)didReceivePaymentClientUpdate:(id)a3 forRemotePaymentRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  [v8 didReceivePaymentClientUpdate:v7 forRemotePaymentRequest:v6];
}

- (void)didReceiveCancellationForRemotePaymentRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  [v5 didReceiveCancellationForRemotePaymentRequest:v4];
}

- (void)managerDevicesDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [(PDContinuityPaymentService *)self remoteObjectProxy];
  id v5 = [v4 remoteDevices];

  [v6 didReceiveUpdatedPaymentDevices:v5];
}

- (PKIDSManager)idsManager
{
  return self->_idsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_whitelist, 0);
}

@end