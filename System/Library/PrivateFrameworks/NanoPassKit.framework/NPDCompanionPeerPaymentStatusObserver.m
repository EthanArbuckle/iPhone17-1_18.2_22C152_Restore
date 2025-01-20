@interface NPDCompanionPeerPaymentStatusObserver
- (BOOL)_shouldCheckPeerPaymentStatus;
- (NPDCompanionPeerPaymentStatusObserver)initWithRemoteAdminConnectionServiceAgent:(id)a3;
- (NPKRemoteAdminConnectionServiceAgent)serviceAgent;
- (NPSDomainAccessor)globalDomainAccessor;
- (void)_compareCompanionAndWatchPeerPaymentRegistrationStatus;
- (void)handleCompanionPeerPaymentWebServiceContextChanged;
- (void)handleWatchRequestForCompanionPeerPaymentRegistrationState;
- (void)setGlobalDomainAccessor:(id)a3;
- (void)setServiceAgent:(id)a3;
@end

@implementation NPDCompanionPeerPaymentStatusObserver

- (NPDCompanionPeerPaymentStatusObserver)initWithRemoteAdminConnectionServiceAgent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NPDCompanionPeerPaymentStatusObserver;
  v6 = [(NPDCompanionPeerPaymentStatusObserver *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceAgent, a3);
    uint64_t v8 = NPKDomainAccessorForDomain();
    globalDomainAccessor = v7->_globalDomainAccessor;
    v7->_globalDomainAccessor = (NPSDomainAccessor *)v8;
  }
  return v7;
}

- (void)handleCompanionPeerPaymentWebServiceContextChanged
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Companion peer payment web service context changed", v6, 2u);
    }
  }
  [(NPDCompanionPeerPaymentStatusObserver *)self _compareCompanionAndWatchPeerPaymentRegistrationStatus];
}

- (void)handleWatchRequestForCompanionPeerPaymentRegistrationState
{
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Notice: Handling watch request for companion peer payment registration state", v6, 2u);
    }
  }
  [(NPDCompanionPeerPaymentStatusObserver *)self _compareCompanionAndWatchPeerPaymentRegistrationStatus];
}

- (BOOL)_shouldCheckPeerPaymentStatus
{
  v3 = PKCurrentRegion();
  int v4 = NPKShouldAllowPeerPaymentRegistrationForWebService();

  id v5 = [(NPDCompanionPeerPaymentStatusObserver *)self globalDomainAccessor];
  unsigned int v6 = [v5 BOOLForKey:PKUserHasDisabledPeerPaymentKey];

  v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109376;
      v11[1] = v4;
      __int16 v12 = 1024;
      unsigned int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Should allow peer payment registration: %d; peer payment disabled: %d",
        (uint8_t *)v11,
        0xEu);
    }
  }
  return v4 & (v6 ^ 1);
}

- (void)_compareCompanionAndWatchPeerPaymentRegistrationStatus
{
  if (![(NPDCompanionPeerPaymentStatusObserver *)self _shouldCheckPeerPaymentStatus])
  {
    BOOL v8 = pk_Payment_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (!v9) {
      return;
    }
    int v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notice: Not checking companion peer payment registration state", v22, 2u);
    }
    goto LABEL_26;
  }
  v3 = +[PKPeerPaymentWebService sharedService];
  int v4 = v3;
  if (v3 && ([v3 needsRegistration] & 1) == 0)
  {
    v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      __int16 v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Notice: Companion peer payment web service is registered. Checking watch peer payment web service…", v26, 2u);
      }
    }
    unsigned int v13 = NPKPeerPaymentWebServiceContextPath();
    v7 = +[PKPeerPaymentWebServiceContext contextWithArchive:v13];

    id v14 = objc_alloc((Class)PKPeerPaymentWebService);
    id v15 = objc_alloc_init((Class)NPKPeerPaymentWebServiceCompanionTargetDevice);
    id v16 = [v14 initWithContext:v7 targetDevice:v15];

    unsigned int v17 = [v16 needsRegistration];
    v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      if (v19)
      {
        v20 = pk_Payment_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Notice: Watch peer payment web service needs registration. Informing watch that companion is registered.", v25, 2u);
        }
      }
      v21 = [(NPDCompanionPeerPaymentStatusObserver *)self serviceAgent];
      [v21 handleCompanionPeerPaymentRegistration];
    }
    else
    {
      if (!v19)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v21 = pk_Payment_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Notice: Companion and watch are both registered.", v24, 2u);
      }
    }

    goto LABEL_24;
  }
  id v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion peer payment web service is not registered", buf, 2u);
    }
    goto LABEL_25;
  }
LABEL_26:
}

- (NPKRemoteAdminConnectionServiceAgent)serviceAgent
{
  return self->_serviceAgent;
}

- (void)setServiceAgent:(id)a3
{
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);
  objc_storeStrong((id *)&self->_serviceAgent, 0);
}

@end