@interface PDProvisioningContinuityHostManager
- (BOOL)_canHandleDiscoveryRequest:(id)a3;
- (PDProvisioningContinuityHostManager)initWithHandle:(id)a3 databaseManager:(id)a4 remoteInterfacePresenter:(id)a5 notificationManager:(id)a6;
- (id)_requestedPassForRequest:(id)a3;
- (id)invalidationHandler;
- (void)_handleOutstandingMessage:(id)a3 messageHandled:(id)a4;
- (void)_invalidateWithReason:(id)a3;
- (void)_presentContinuityPromptNotificationForPass:(id)a3;
- (void)_presentRemoteContinuityAlert;
- (void)_removePromptNotification;
- (void)_verifyProximityAdvertisement:(id)a3 completion:(id)a4;
- (void)setInvalidationHandler:(id)a3;
- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4;
@end

@implementation PDProvisioningContinuityHostManager

- (PDProvisioningContinuityHostManager)initWithHandle:(id)a3 databaseManager:(id)a4 remoteInterfacePresenter:(id)a5 notificationManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PDProvisioningContinuityHostManager;
  v15 = [(PDProvisioningContinuityHostManager *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_handle, a3);
    objc_storeStrong((id *)&v16->_databaseManager, a4);
    objc_storeStrong((id *)&v16->_remoteInterfacePresenter, a5);
    objc_storeStrong((id *)&v16->_userNotificationManager, a6);
    v16->_isValid = 1;
    objc_initWeak(&location, v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100350DD4;
    v20[3] = &unk_100735E20;
    objc_copyWeak(&v21, &location);
    [v11 setInvalidationHandler:v20];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100350E1C;
    v18[3] = &unk_100735E20;
    objc_copyWeak(&v19, &location);
    [v11 setMessageReceivedHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v16;
}

- (void)_handleOutstandingMessage:(id)a3 messageHandled:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_initWeak(&location, self);
  if (v6)
  {
    id v8 = [v6 type];
    if (v8 == (id)1001)
    {
      v7[2](v7, 1);
      id v12 = [(PDProvisioningContinuityHostManager *)self _requestedPassForRequest:v6];
      id v13 = v12;
      if (v12)
      {
        id v14 = [v12 uniqueID];
        requestedPassUniqueID = self->_requestedPassUniqueID;
        self->_requestedPassUniqueID = v14;

        [(PDProvisioningContinuityHostManager *)self _presentContinuityPromptNotificationForPass:v13];
      }
      else
      {
        v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDProvisioningContinuityHostManager: Unable to find pass for invitation request", buf, 2u);
        }

        [(PDProvisioningContinuityHostManager *)self _invalidateWithReason:@"unable to find requested pass"];
      }

      goto LABEL_16;
    }
    if (v8 == (id)2001)
    {
      id v9 = v6;
      if ([(PDProvisioningContinuityHostManager *)self _canHandleDiscoveryRequest:v9])
      {
        v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDProvisioningContinuityHostManager: handling discovery request", buf, 2u);
        }

        v7[2](v7, 1);
        id v11 = [v9 advertisement];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100351170;
        v17[3] = &unk_10074A6D8;
        v17[4] = self;
        objc_copyWeak(&v18, &location);
        [(PDProvisioningContinuityHostManager *)self _verifyProximityAdvertisement:v11 completion:v17];

        objc_destroyWeak(&v18);
      }
      else
      {
        v7[2](v7, 1);
        [(PDProvisioningContinuityHostManager *)self _invalidateWithReason:@"can't handle discovery request"];
      }
LABEL_16:
    }
  }
  else
  {
    v7[2](v7, 1);
  }
  objc_destroyWeak(&location);
}

- (void)_invalidateWithReason:(id)a3
{
  id v4 = a3;
  if (self->_isValid)
  {
    self->_isValid = 0;
    v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDProvisioningContinuityHostManager: invalidating with reason: %@", (uint8_t *)&v10, 0xCu);
    }

    handle = self->_handle;
    if (handle)
    {
      [(PDSharingChannelHandle *)handle setInvalidationHandler:0];
      [(PDSharingChannelHandle *)self->_handle closeWithCompletion:0];
      [(PDSharingChannelHandle *)self->_handle invalidate];
      v7 = self->_handle;
      self->_handle = 0;
    }
    [(PDProvisioningContinuityHostManager *)self _removePromptNotification];
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2]();
      id v9 = self->_invalidationHandler;
      self->_invalidationHandler = 0;
    }
  }
}

- (BOOL)_canHandleDiscoveryRequest:(id)a3
{
  return [a3 continuityType] == (id)1;
}

- (void)_verifyProximityAdvertisement:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    handle = self->_handle;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1003514D4;
    v9[3] = &unk_10074A700;
    id v10 = v6;
    [(PDSharingChannelHandle *)handle startProximityDetectionForAdvertisement:a3 completion:v9];
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v6 + 2))(v6, 1, 0);
  }
}

- (void)_presentContinuityPromptNotificationForPass:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100351588;
  v7[3] = &unk_10074A728;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(PDSharingChannelHandle *)handle remoteDeviceInformation:v7];
}

- (void)_removePromptNotification
{
  if (self->_promptNotification)
  {
    -[PDUserNotificationManager removeUserNotification:](self->_userNotificationManager, "removeUserNotification:");
    promptNotification = self->_promptNotification;
    self->_promptNotification = 0;
  }
}

- (void)_presentRemoteContinuityAlert
{
  v3 = self->_requestedPassUniqueID;
  if (v3)
  {
    objc_initWeak(&location, self);
    handle = self->_handle;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100351840;
    v5[3] = &unk_10074A778;
    objc_copyWeak(&v8, &location);
    id v6 = v3;
    v7 = self;
    [(PDSharingChannelHandle *)handle detachHandleForTransfer:v5];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PDProvisioningContinuityHostManager *)self _invalidateWithReason:@"no identified pass to present remote alert for"];
  }
}

- (id)_requestedPassForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 personalizedVehicleIdentifier];
  if (!v5)
  {
LABEL_26:
    databaseManager = self->_databaseManager;
    v25 = [v4 passTypeIdentifier];
    v26 = [v4 passSerialNumber];
    v27 = [(PDDatabaseManager *)databaseManager passWithPassTypeID:v25 serialNumber:v26];
    objc_super v23 = [v27 secureElementPass];

    goto LABEL_27;
  }
  id v6 = +[PKAppleAccountManager sharedInstance];
  v36 = [v6 appleAccountInformation];

  [(PDDatabaseManager *)self->_databaseManager credentialIdentifiersForAid];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = [v7 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (!v30)
  {
    objc_super v23 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = *(void *)v42;
  v32 = v7;
  id v33 = v4;
  uint64_t v29 = *(void *)v42;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v42 != v8) {
        objc_enumerationMutation(v7);
      }
      uint64_t v31 = v9;
      uint64_t v10 = *(void *)(*((void *)&v41 + 1) + 8 * v9);
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v34 = v10;
      id obj = [v7 objectForKeyedSubscript:v29];
      id v11 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
      if (!v11) {
        goto LABEL_20;
      }
      id v12 = v11;
      uint64_t v13 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v38 != v13) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v16 = [(PDDatabaseManager *)self->_databaseManager appletSubcredentialWithIdentifier:v15];
          v17 = PKCreatePersonalVehicleIdentifier();
          id v18 = v17;
          if (!v17)
          {
LABEL_15:

            continue;
          }
          id v19 = v17;
          if (v5 == v19)
          {
          }
          else
          {
            unsigned __int8 v20 = [v5 isEqualToString:v19];

            if ((v20 & 1) == 0) {
              goto LABEL_15;
            }
          }
          id v21 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithPaymentApplicationIdentifier:v34 subcredentialIdentifier:v15];
          v22 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v21];
          objc_super v23 = [v22 secureElementPass];

          if (v23)
          {

            id v7 = v32;
            id v4 = v33;
            goto LABEL_25;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v12) {
          continue;
        }
        break;
      }
LABEL_20:

      uint64_t v9 = v31 + 1;
      id v7 = v32;
      id v4 = v33;
      uint64_t v8 = v29;
    }
    while ((id)(v31 + 1) != v30);
    objc_super v23 = 0;
    id v30 = [v32 countByEnumeratingWithState:&v41 objects:v46 count:16];
  }
  while (v30);
LABEL_25:

  if (!v23) {
    goto LABEL_26;
  }
LABEL_27:

  return v23;
}

- (void)userNotificationActionPerformed:(unint64_t)a3 notificationIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(PDUserNotification *)self->_promptNotification notificationIdentifier];
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 == v7)
  {
  }
  else
  {
    if (!v7 || !v6)
    {

      goto LABEL_11;
    }
    unsigned int v9 = [v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PDProvisioningContinuityHostManager: user prompt notification tapped", v11, 2u);
  }

  [(PDProvisioningContinuityHostManager *)self _removePromptNotification];
  [(PDProvisioningContinuityHostManager *)self _presentRemoteContinuityAlert];
LABEL_11:
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_promptNotification, 0);
  objc_storeStrong((id *)&self->_requestedPassUniqueID, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end