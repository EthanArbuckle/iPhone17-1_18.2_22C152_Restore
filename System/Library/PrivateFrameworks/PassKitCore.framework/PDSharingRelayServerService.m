@interface PDSharingRelayServerService
- (PDSharingRelayServerService)init;
- (PDSharingRelayServerService)initWithWebServiceCoordinator:(id)a3 domainService:(id)a4 pushNotificationManager:(id)a5 delegate:(id)a6;
- (id)endpointOfType:(unint64_t)a3 region:(id)a4;
- (id)relayEndpointForMailboxAddress:(id)a3;
- (unint64_t)type;
- (void)_updatePassbookAssosiatedDomainsForSharing;
- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4;
- (void)closeEndpoint:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)pingEndpoint:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishEndpoint:(id)a3 completion:(id)a4;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDSharingRelayServerService

- (PDSharingRelayServerService)init
{
  return 0;
}

- (PDSharingRelayServerService)initWithWebServiceCoordinator:(id)a3 domainService:(id)a4 pushNotificationManager:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PDSharingRelayServerService;
  v15 = [(PDSharingRelayServerService *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_webServiceCoordinator, a3);
    objc_storeStrong((id *)&v16->_domainService, a4);
    objc_storeStrong((id *)&v16->_delegate, a6);
    v17 = objc_alloc_init(PDAppAttestService);
    appAttestService = v16->_appAttestService;
    v16->_appAttestService = v17;

    objc_storeStrong((id *)&v16->_pushNotificationManager, a5);
    v16->_lock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    availablePushNotificationTokens = v16->_availablePushNotificationTokens;
    v16->_availablePushNotificationTokens = v19;

    [(PDSharingRelayServerService *)v16 _updatePassbookAssosiatedDomainsForSharing];
    [(PDPaymentWebServiceCoordinator *)v16->_webServiceCoordinator registerObserver:v16];
  }

  return v16;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDSharingRelayServerService;
  [(PDSharingRelayServerService *)&v3 dealloc];
}

- (id)relayEndpointForMailboxAddress:(id)a3
{
  id v4 = a3;
  v5 = [[PDSharingRelayServerEndpoint alloc] initWithProvisioningType:0];
  sub_1001C02D4((uint64_t)self, v5, v4);
  [(PDSharingRelayServerEndpoint *)v5 setMailboxStatus:0];
  v6 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebServiceContext];
  v7 = [v6 configuration];
  v8 = PKCurrentRegion();
  v9 = [v7 allowedRelayServerHostsForRegion:v8];

  v10 = [(PDSharingRelayServerEndpoint *)v5 relayServerHost];
  id v11 = [v10 host];

  unsigned int v12 = [v9 containsObject:v11];
  id v13 = PKLogFacilityTypeGetObject();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      v15 = PKSharingLoggableMailboxAddress();
      int v18 = 138543619;
      v19 = v15;
      __int16 v20 = 2113;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "RelayServer: Evaluated %{public}@ and created endpoint %{private}@", (uint8_t *)&v18, 0x16u);
    }
    v16 = v5;
  }
  else
  {
    if (v14)
    {
      int v18 = 138543362;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "RelayServer: Evaluated %{public}@, but host not allowed.", (uint8_t *)&v18, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (id)endpointOfType:(unint64_t)a3 region:(id)a4
{
  id v6 = a4;
  v7 = [[PDSharingRelayServerEndpoint alloc] initWithProvisioningType:a3];
  v8 = sub_1001C04D4((uint64_t)self, v6);

  [(PDSharingRelayServerEndpoint *)v7 setRelayServerHost:v8];
  return v7;
}

- (unint64_t)type
{
  return 1;
}

- (void)pingEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 transportIdentifier];
    v10 = PKSharingLoggableMailboxAddress();
    *(_DWORD *)buf = 138543362;
    objc_super v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RelayServer: pinging remote mailbox %{public}@", buf, 0xCu);
  }
  id v11 = [PDSharingRelayServerPingMailboxRequest alloc];
  unsigned int v12 = [v6 transportIdentifier];
  id v13 = [v6 relayServerHost];
  BOOL v14 = [(PDSharingRelayServerRequest *)v11 initWithMailboxIdentifier:v12 relayServerHost:v13];

  uint64_t v15 = objc_opt_class();
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001C0870;
  v18[3] = &unk_10073D910;
  id v19 = v6;
  id v20 = v7;
  id v16 = v7;
  id v17 = v6;
  sub_1001C0980((uint64_t)self, v14, v15, v18);
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([v10 doesRemoteMailboxExist]) {
    sub_1001C0AEC((PDSharingMailboxPayload *)self, v10, v9, v8);
  }
  else {
    sub_1001C0DB8((PDSharingMailboxPayload *)self, v10, v9, 0, v8);
  }
}

- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ([v6 mailboxStatus] == (id)4)
  {
    id v8 = PDBasicError();
    v7[2](v7, 0, v8);
  }
  else
  {
    id v9 = [PDSharingRelayServerGetMailboxRequest alloc];
    id v10 = [v6 transportIdentifier];
    id v11 = [v6 relayServerHost];
    unsigned int v12 = [(PDSharingRelayServerRequest *)v9 initWithMailboxIdentifier:v10 relayServerHost:v11];

    id v13 = sub_1001C16A4((uint64_t)self, v6);
    [(PDSharingRelayServerRequest *)v12 setDeviceClaim:v13];

    uint64_t v14 = objc_opt_class();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C2660;
    v15[3] = &unk_10073DA28;
    v15[4] = self;
    id v16 = v6;
    id v17 = v7;
    sub_1001C0980((uint64_t)self, v12, v14, v15);
  }
}

- (void)closeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 transportIdentifier];
    id v10 = PKSharingLoggableMailboxAddress();
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "RelayServer: Deleting remote mailbox %{public}@", buf, 0xCu);
  }
  id v11 = [PDSharingRelayServerDeleteMailboxRequest alloc];
  unsigned int v12 = [v6 transportIdentifier];
  id v13 = [v6 relayServerHost];
  uint64_t v14 = [(PDSharingRelayServerRequest *)v11 initWithMailboxIdentifier:v12 relayServerHost:v13];

  uint64_t v15 = [v6 deviceClaim];
  [(PDSharingRelayServerRequest *)v14 setDeviceClaim:v15];

  uint64_t v16 = objc_opt_class();
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001C2CDC;
  v19[3] = &unk_10073DA50;
  id v20 = v6;
  v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v6;
  sub_1001C0980((uint64_t)self, v14, v16, v19);
}

- (void)relinquishEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char IsActive = PDSharingRelayServerEndpointStatusIsActive((unint64_t)[v6 mailboxStatus]);
  id v9 = PKLogFacilityTypeGetObject();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (IsActive)
  {
    if (v10)
    {
      id v11 = [v6 transportIdentifier];
      unsigned int v12 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RelayServer: relinquishing remote mailbox %@", buf, 0xCu);
    }
    id v13 = [PDSharingRelayServerRelinquishMailboxRequest alloc];
    uint64_t v14 = [v6 transportIdentifier];
    uint64_t v15 = [v6 relayServerHost];
    uint64_t v16 = [(PDSharingRelayServerRequest *)v13 initWithMailboxIdentifier:v14 relayServerHost:v15];

    id v17 = [v6 deviceClaim];
    [(PDSharingRelayServerRequest *)v16 setDeviceClaim:v17];

    uint64_t v18 = objc_opt_class();
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1001C30DC;
    v21[3] = &unk_10073DA50;
    id v22 = v6;
    v23 = self;
    id v24 = v7;
    sub_1001C0980((uint64_t)self, v16, v18, v21);
  }
  else
  {
    if (v10)
    {
      id v19 = [v6 transportIdentifier];
      id v20 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138543362;
      v26 = v20;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "RelayServer: cannot relinquish inactive remote mailbox %{public}@", buf, 0xCu);
    }
    PDBasicError();
    uint64_t v16 = (PDSharingRelayServerRelinquishMailboxRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, PDSharingRelayServerRelinquishMailboxRequest *))v7 + 2))(v7, 0, v16);
  }
}

- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if ([v7 doesRemoteMailboxExist])
  {
    BOOL v10 = [v7 relayServerHost];
    if (v10)
    {
      id v11 = [objc_alloc((Class)NSURLComponents) initWithURL:v10 resolvingAgainstBaseURL:0];
      [v11 setScheme:@"https"];
      uint64_t v12 = PKSharingRelayServerRequestVersion;
      uint64_t v13 = PKSharingRelayServerMailboxURI;
      uint64_t v14 = [v7 transportIdentifier];
      uint64_t v15 = +[NSString stringWithFormat:@"/v%@/%@/%@", v12, v13, v14];
      [v11 setPath:v15];

      uint64_t v16 = [v7 payloadEncryptionPassword];
      id v17 = [v16 base64EncodedStringWithOptions:0];
      [v11 setFragment:v17];

      id v18 = objc_alloc_init((Class)NSMutableArray);
      if (v8)
      {
        id v19 = (char *)[v8 vertical] - 1;
        if ((unint64_t)v19 <= 2)
        {
          id v20 = *(id *)*(&off_10073DB58 + (void)v19);
          if (v20)
          {
            v21 = v20;
            id v22 = objc_alloc((Class)NSURLQueryItem);
            id v23 = [v22 initWithName:PKSharingURLVerticalKey value:v21];
            [v18 addObject:v23];
          }
        }
      }
      [v11 setQueryItems:v18];
      id v24 = [v11 URL];
      if (v24)
      {
        v9[2](v9, v24, 0);
      }
      else
      {
        v31 = PDBasicError();
        ((void (**)(id, void *, void *))v9)[2](v9, 0, v31);
      }
    }
    else
    {
      v28 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [v7 transportIdentifier];
        v30 = PKSharingLoggableMailboxAddress();
        *(_DWORD *)buf = 138543362;
        v33 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "RelayServer: Unable to generate share url for mailbox %{public}@ because it is missing a host", buf, 0xCu);
      }
      id v11 = +[NSError pkSharingError:1];
      ((void (**)(id, void *, id))v9)[2](v9, 0, v11);
    }
  }
  else
  {
    v25 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = [v7 transportIdentifier];
      v27 = PKSharingLoggableMailboxAddress();
      *(_DWORD *)buf = 138543362;
      v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "RelayServer: Unable to generate share url for mailbox %{public}@ because it doesn't exist on server", buf, 0xCu);
    }
    BOOL v10 = +[NSError pkSharingError:1];
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v10);
  }
}

- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = (void (**)(void, void))v8;
  if (a3 == 2)
  {
    BOOL v10 = sub_1001C3868((uint64_t)self, 0);
    os_unfair_lock_lock(&self->_lock);
    id v11 = [(NSMutableDictionary *)self->_availablePushNotificationTokens objectForKeyedSubscript:v10];
    id v12 = [v11 count];

    os_unfair_lock_unlock(&self->_lock);
    BOOL v13 = a4 >= (unint64_t)v12;
    unint64_t v14 = a4 - (void)v12;
    if (v14 != 0 && v13)
    {
      id v15 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
      v22[0] = 0;
      v22[1] = v22;
      v22[2] = 0x3032000000;
      v22[3] = sub_10002098C;
      v22[4] = sub_100020FB8;
      id v23 = 0;
      do
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1001C3A10;
        v21[3] = &unk_100730D50;
        void v21[4] = self;
        v21[5] = v22;
        [v15 addOperation:v21];
        --v14;
      }
      while (v14);
      uint64_t v16 = +[NSNull null];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1001C3B80;
      v18[3] = &unk_10073DAA0;
      id v20 = v22;
      id v19 = v9;
      id v17 = [v15 evaluateWithInput:v16 completion:v18];

      _Block_object_dispose(v22, 8);
    }
    else
    {
      v9[2](v9, 1);
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
  }
}

- (void)_updatePassbookAssosiatedDomainsForSharing
{
  v21 = [(PDPaymentWebServiceCoordinator *)self->_webServiceCoordinator sharedWebServiceContext];
  v2 = [v21 configuration];
  objc_super v3 = PKCurrentRegion();
  id v4 = [v2 relayServerHostsToHandleUniversalLinksForRegion:v3];

  v5 = objc_alloc_init(PDDynamicAssociatedDomainPattern);
  id v6 = +[NSString stringWithFormat:@"/v%@/%@/*", PKSharingRelayServerRequestVersion, PKSharingRelayServerMailboxURI];
  [(PDDynamicAssociatedDomainPattern *)v5 setUri:v6];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    id v12 = (PDDynamicAssociatedDomain *)PKWalletUniversalLinkHostName;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = (PDDynamicAssociatedDomain *)*(id *)(*((void *)&v22 + 1) + 8 * i);
        id v15 = v12;
        if (v14 == v12) {
          goto LABEL_15;
        }
        uint64_t v16 = v14;
        if (v14) {
          BOOL v17 = v12 == 0;
        }
        else {
          BOOL v17 = 1;
        }
        if (v17)
        {

LABEL_14:
          id v15 = [[PDDynamicAssociatedDomain alloc] initWithHost:v16];
          v26 = v5;
          id v19 = +[NSArray arrayWithObjects:&v26 count:1];
          [(PDDynamicAssociatedDomain *)v15 setPatterns:v19];

          [v7 addObject:v15];
LABEL_15:

          continue;
        }
        unsigned __int8 v18 = [(PDDynamicAssociatedDomain *)v14 isEqualToString:v12];

        if ((v18 & 1) == 0) {
          goto LABEL_14;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  [(PDDynamicAssociatedDomainService *)self->_domainService setAdditionalAssociatedDomains:v7 completion:&stru_10073DB38];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availablePushNotificationTokens, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_appAttestService, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_domainService, 0);
  objc_storeStrong((id *)&self->_webServiceCoordinator, 0);
}

@end