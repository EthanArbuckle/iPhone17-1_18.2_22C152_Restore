@interface CSDCarrierBundleProviderController
- (CSDCarrierBundleProviderController)init;
- (CSDCarrierBundleProviderControllerDelegate)delegate;
- (CoreTelephonyClient)telephonyClient;
- (NSArray)serviceProviders;
- (NSArray)serviceProvidersWithCarrierNumbers;
- (OS_dispatch_queue)queue;
- (id)arrayOfStringsForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)carrierNumbersForSubscriptionContext:(id)a3;
- (id)fetchServiceProviders;
- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5;
- (id)spamIdentifiersForSubscriptionUUID:(id)a3;
- (void)carrierBundleChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setServiceProviders:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation CSDCarrierBundleProviderController

- (CSDCarrierBundleProviderController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSDCarrierBundleProviderController;
  v2 = [(CSDCarrierBundleProviderController *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("CSDCarrierBundlePhoneNumberProviderController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:v2->_queue];
    telephonyClient = v2->_telephonyClient;
    v2->_telephonyClient = v6;

    [(CoreTelephonyClient *)v2->_telephonyClient setDelegate:v2];
    v8 = v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100067224;
    block[3] = &unk_100504EC0;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

- (NSArray)serviceProviders
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000673A0;
  v11 = sub_1000673B0;
  id v12 = 0;
  v3 = [(CSDCarrierBundleProviderController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000673B8;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)serviceProvidersWithCarrierNumbers
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000673A0;
  v11 = sub_1000673B0;
  id v12 = 0;
  v3 = [(CSDCarrierBundleProviderController *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000674E8;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setServiceProviders:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCarrierBundleProviderController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100067658;
  v7[3] = &unk_100504F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)fetchServiceProviders
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(CSDCarrierBundleProviderController *)self telephonyClient];
  id v34 = 0;
  v5 = [v4 getSubscriptionInfoWithError:&v34];
  id v6 = v34;
  uint64_t v7 = [v5 subscriptionsInUse];

  if (v7 || ([v6 domain], v24 = objc_claimAutoreleasedReturnValue(), v24, !v24))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v8)
    {
      id v9 = v8;
      v26 = v7;
      id v27 = v6;
      uint64_t v10 = *(void *)v31;
      v11 = &OBJC_IVAR___CSDAbstractFaceTimeConversationProviderDelegate__provider;
      v28 = self;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v14 = [v13 uuid];
          id v15 = objc_alloc((Class)(v11 + 678));
          v16 = [(CSDCarrierBundleProviderController *)self carrierNumbersForSubscriptionContext:v13];
          id v17 = [v15 initWithUUID:v14 carrierPhoneNumbers:v16];

          [v3 addObject:v17];
          v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            [v17 uuid];
            id v19 = v3;
            v21 = v20 = v11;
            [v17 carrierPhoneNumbers];
            v23 = uint64_t v22 = v10;
            *(_DWORD *)buf = 138412546;
            v36 = v21;
            __int16 v37 = 2112;
            v38 = v23;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "added service provider uuid=%@ carrierPhoneNumbers=%@", buf, 0x16u);

            uint64_t v10 = v22;
            v11 = v20;
            id v3 = v19;
            self = v28;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v9);
      uint64_t v7 = v26;
      id v6 = v27;
    }
  }
  else
  {
    obj = sub_100008DCC();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_1003A889C((uint64_t)v6, self, obj);
    }
  }

  return v3;
}

- (id)spamIdentifiersForSubscriptionUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDCarrierBundleProviderController *)self telephonyClient];
  id v28 = 0;
  id v6 = [v5 getSubscriptionInfoWithError:&v28];
  id v7 = v28;
  id v8 = [v6 subscriptionsInUse];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v24 + 1) + 8 * v13);
      id v15 = [v14 uuid];
      unsigned __int8 v16 = [v15 isEqual:v4];

      if (v16) {
        break;
      }
      if (v11 == (id)++v13)
      {
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v18 = v14;

    if (!v18)
    {
      id v17 = 0;
      goto LABEL_21;
    }
    id v23 = v7;
    id v17 = [(CSDCarrierBundleProviderController *)self arrayOfStringsForKeyHierarchy:&off_100523C20 subscriptionContext:v18 error:&v23];
    id v19 = v23;

    if (v17)
    {
      v20 = sub_100008DCC();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      *(_DWORD *)buf = 138412546;
      id v30 = v17;
      __int16 v31 = 2112;
      id v32 = v18;
      v21 = "Retrieved spamIdentifiersForSubscriptionContext '%@' for subscription %@";
    }
    else
    {
      if (!v19) {
        goto LABEL_20;
      }
      v20 = sub_100008DCC();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_DWORD *)buf = 138412546;
      id v30 = v18;
      __int16 v31 = 2112;
      id v32 = v19;
      v21 = "Retrieving spamIdentifiersForSubscriptionContext for subscription %@ failed with error %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0x16u);
    goto LABEL_19;
  }
LABEL_9:
  id v17 = 0;
  id v18 = v9;
  id v19 = v7;
LABEL_20:

  id v7 = v19;
LABEL_21:

  return v17;
}

- (id)carrierNumbersForSubscriptionContext:(id)a3
{
  id v4 = a3;
  id v11 = 0;
  v5 = [(CSDCarrierBundleProviderController *)self arrayOfStringsForKeyHierarchy:&off_100523C38 subscriptionContext:v4 error:&v11];
  id v6 = v11;
  id v7 = v6;
  if (v5)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v4;
      id v9 = "Retrieved carrier phone number '%@' for subscription %@";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v7;
      id v9 = "Retrieving carrier phone number for subscription %@ failed with error %@";
      goto LABEL_7;
    }
  }

LABEL_9:

  return v5;
}

- (id)objectForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
  id v11 = [(CSDCarrierBundleProviderController *)self telephonyClient];
  id v12 = [v11 copyCarrierBundleValue:v8 keyHierarchy:v9 bundleType:v10 error:a5];

  return v12;
}

- (id)arrayOfStringsForKeyHierarchy:(id)a3 subscriptionContext:(id)a4 error:(id *)a5
{
  v5 = [(CSDCarrierBundleProviderController *)self objectForKeyHierarchy:a3 subscriptionContext:a4 error:a5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)carrierBundleChange:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Carrier bundle changed for subscription context %@.", buf, 0xCu);
  }

  id v6 = [(CSDCarrierBundleProviderController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068068;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v6, block);
}

- (void)subscriptionInfoDidChange
{
  id v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Subscription info changed", buf, 2u);
  }

  id v4 = [(CSDCarrierBundleProviderController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100068190;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v4, block);
}

- (CSDCarrierBundleProviderControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDCarrierBundleProviderControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CoreTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceProviders, 0);
}

@end