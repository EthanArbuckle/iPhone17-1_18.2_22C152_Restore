@interface _SESRKESession
+ (BOOL)isDebugAllowAllEndpointsEnabled;
+ (id)_debugGetReaderIdentifiersForAllEndpoints:(id *)a3;
+ (id)getAllowedVehicleIdentifiersForConnection:(id)a3 error:(id *)a4;
+ (id)validateEntitlements:(id)a3;
- (BOOL)isReaderAllowed:(id)a3;
- (NSString)clientBundleIdentifier;
- (_NSRange)subscriptionRange;
- (_SESRKESession)initWithRemoteObject:(id)a3 subscriptionRange:(_NSRange)a4 queue:(id)a5;
- (id)updateAllowlistedVehicles;
- (void)cancelRKEFunction:(unint64_t)a3 readerIdentifier:(id)a4 reply:(id)a5;
- (void)continueExecutingRKEFunction:(unint64_t)a3 action:(unint64_t)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 reply:(id)a7;
- (void)didCreateKey:(id)a3;
- (void)didInvalidateWithError:(id)a3;
- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6;
- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4;
- (void)endSession:(id)a3;
- (void)endSessionInternal:(id)a3;
- (void)getVehicleReports:(id)a3;
- (void)isPassiveEntryAvailable:(id)a3 reply:(id)a4;
- (void)releaseRemoteObject;
- (void)sendEvent:(id)a3 keyIdentifier:(id)a4;
- (void)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 reply:(id)a5;
- (void)sendRKEFunction:(unint64_t)a3 action:(unint64_t)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setDidEndCallback:(id)a3;
- (void)setSubscriptionRange:(_NSRange)a3;
- (void)sign:(id)a3 readerIdentifier:(id)a4 reply:(id)a5;
- (void)start;
- (void)wakeUpClientIfBackgrounded;
@end

@implementation _SESRKESession

- (_SESRKESession)initWithRemoteObject:(id)a3 subscriptionRange:(_NSRange)a4 queue:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)_SESRKESession;
  v7 = [(_SESSession *)&v14 initWithRemoteObject:a3 queue:a5];
  v8 = v7;
  if (v7)
  {
    v7->_subscriptionRange.NSUInteger location = location;
    v7->_subscriptionRange.NSUInteger length = length;
    allowlistedVehicleIdentifiers = v7->_allowlistedVehicleIdentifiers;
    v7->_allowlistedVehicleIdentifiers = 0;

    currentPeerUUID = v8->_currentPeerUUID;
    v8->_currentPeerUUID = 0;

    uint64_t v11 = +[NSString stringWithFormat:@"%@", v8];
    sessionID = v8->_sessionID;
    v8->_sessionID = (NSString *)v11;
  }
  return v8;
}

+ (id)validateEntitlements:(id)a3
{
  v3 = +[_SESSessionClientInfo withConnection:a3];
  if ([v3 rkeSessionEntitlement])
  {
    v4 = 0;
  }
  else
  {
    v5 = SESDefaultLogObject();
    v7 = [v3 clientName];
    v4 = SESCreateAndLogError();
  }

  return v4;
}

- (void)setDidEndCallback:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SESRKESession;
  [(_SESSession *)&v3 setDidEndCallback:a3];
}

- (void)releaseRemoteObject
{
  objc_super v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  v4.receiver = self;
  v4.super_class = (Class)_SESRKESession;
  [(_SESSession *)&v4 releaseRemoteObject];
}

- (void)start
{
  objc_super v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = SESDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SESRKESession start %@", buf, 0xCu);
  }

  v5 = [(_SESRKESession *)self updateAllowlistedVehicles];
  if (v5)
  {
    [(_SESRKESession *)self endSessionInternal:v5];
  }
  else
  {
    v6 = SESDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      allowlistedVehicleIdentifiers = self->_allowlistedVehicleIdentifiers;
      *(_DWORD *)buf = 138412290;
      v28 = (_SESRKESession *)allowlistedVehicleIdentifiers;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Allowed vehicle identifiers %@", buf, 0xCu);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v8 = self->_allowlistedVehicleIdentifiers;
    id v9 = [(NSSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          objc_super v14 = +[AlishaExternal shared];
          v15 = [v14 getEndpointWithReaderIdentifier:v13];

          v16 = [v15 bleUUID];

          if (v16)
          {
            v17 = [v15 bleUUID];
            v18 = +[NSUUID ses_withUUIDString:v17];

            v19 = +[AlishaExternal shared];
            [v19 resetDisconnectionHistoryFor:v18];

            if (self->_subscriptionRange.location && self->_subscriptionRange.length)
            {
              v20 = +[AlishaExternal shared];
              [v20 subscribeToVehicleFunctionStatusEventsWithRange:self->_subscriptionRange.location, self->_subscriptionRange.length, v18];
            }
          }
        }
        id v10 = [(NSSet *)v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    v21.receiver = self;
    v21.super_class = (Class)_SESRKESession;
    [(_SESSession *)&v21 start];
    v5 = 0;
  }
}

+ (BOOL)isDebugAllowAllEndpointsEnabled
{
  int v2 = SESInternalVariant();
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.seserviced"];
    unsigned __int8 v4 = [v3 BOOLForKey:@"debug.carkey.allow.all.endpoints"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (id)_debugGetReaderIdentifiersForAllEndpoints:(id *)a3
{
  id v3 = +[AlishaExternal shared];
  unsigned __int8 v4 = [v3 getAllEndpoints];

  v5 = [v4 allObjects];
  v6 = TransformIf();

  v7 = +[NSSet setWithArray:v6];

  return v7;
}

+ (id)getAllowedVehicleIdentifiersForConnection:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[PKPassLibrary isPassLibraryAvailable])
  {
    v6 = +[_SESSessionClientInfo withConnection:v5];
    v7 = [v6 clientName];

    if (v7)
    {
      v8 = objc_opt_new();
      id v9 = [v6 clientName];
      id v10 = [v8 passUniqueIDsForAssociatedApplicationIdentifier:v9];

      uint64_t v11 = [v8 passes];
      v49 = _NSConcreteStackBlock;
      uint64_t v50 = 3221225472;
      v51 = sub_100041E58;
      v52 = &unk_10040D570;
      id v12 = v10;
      id v53 = v12;
      uint64_t v13 = TransformIf();

      objc_super v14 = objc_opt_new();
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v15 = v13;
      id v39 = [v15 countByEnumeratingWithState:&v45 objects:v57 count:16];
      if (v39)
      {
        id v36 = v5;
        id obj = v15;
        id v33 = v12;
        v34 = v8;
        v35 = v6;
        char v16 = 0;
        uint64_t v38 = *(void *)v46;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v46 != v38) {
              objc_enumerationMutation(obj);
            }
            uint64_t v40 = v17;
            v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
            long long v41 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            v19 = [v18 devicePrimaryPaymentApplication:v33, v34, v35, v36];
            v20 = [v19 subcredentials];

            id v21 = [v20 countByEnumeratingWithState:&v41 objects:v56 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v42;
              do
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(void *)v42 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  long long v25 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                  if (([v25 supportedRadioTechnologies] & 2) != 0)
                  {
                    v26 = [v25 pairedReaderIdentifier];
                    v27 = [v26 hexStringAsData];

                    if (v27)
                    {
                      [v14 addObject:v27];
                    }
                    else
                    {
                      v28 = SESDefaultLogObject();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                      {
                        v29 = [v25 asDictionary];
                        *(_DWORD *)buf = 138412290;
                        v55 = v29;
                        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Skipping credential with invalid paired reader ID %@", buf, 0xCu);
                      }
                      char v16 = 1;
                    }
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v41 objects:v56 count:16];
              }
              while (v22);
            }

            uint64_t v17 = v40 + 1;
          }
          while ((id)(v40 + 1) != v39);
          id v39 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
        }
        while (v39);
        id v15 = obj;

        v6 = v35;
        id v5 = v36;
        id v12 = v33;
        v8 = v34;
        if (v16) {
          +[SESTapToRadar requestTapToRadar:@"Car Key pass with invalid paired reader ID" client:@"PassNoPairedReaderID"];
        }
      }
      else
      {
      }
    }
    else
    {
      if (a4)
      {
        v31 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_super v14 = 0;
    }
  }
  else
  {
    if (a4)
    {
      v30 = SESDefaultLogObject();
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_super v14 = 0;
  }

  return v14;
}

- (void)endSessionInternal:(id)a3
{
  id v4 = a3;
  id v5 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v58 = self;
    *(_WORD *)&v58[8] = 2112;
    *(void *)&v58[10] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESRKESession endSessionInternal %@ error %@", buf, 0x16u);
  }
  v34 = v4;

  sub_100052B14((uint64_t)self->_rbsAssertionTimer);
  [(RBSAssertion *)self->_rbsAssertion invalidate];
  v7 = +[AlishaExternal shared];
  v37 = [v7 getEnduringRKERequestsInProgress];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = self->_allowlistedVehicleIdentifiers;
  id v40 = [(NSSet *)obj countByEnumeratingWithState:&v53 objects:v60 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v54;
    id v36 = self;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v10 = +[AlishaExternal shared];
        uint64_t v11 = [v10 getEndpointWithReaderIdentifier:v9];

        id v12 = [v11 bleUUID];

        if (v12)
        {
          long long v41 = v11;
          long long v42 = i;
          long long v48 = _NSConcreteStackBlock;
          uint64_t v49 = 3221225472;
          uint64_t v50 = sub_100042488;
          v51 = &unk_10040D598;
          uint64_t v38 = v11;
          v52 = v38;
          uint64_t v13 = Filter();
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v14 = [v13 countByEnumeratingWithState:&v44 objects:v59 count:16];
          if (v14)
          {
            id v15 = v14;
            uint64_t v16 = *(void *)v45;
            do
            {
              for (j = 0; j != v15; j = (char *)j + 1)
              {
                if (*(void *)v45 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
                v19 = +[AlishaExternal shared];
                id v20 = [v18 functionIdentifier];
                id v21 = [v18 keyIdentifier];
                id v22 = [v19 cancelRKERequestWithFunctionIdentifier:v20 keyIdentifier:v21];

                uint64_t v23 = SESDefaultLogObject();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  unsigned int v24 = [v18 functionIdentifier];
                  long long v25 = [v18 keyIdentifier];
                  v26 = [v25 asHexString];
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v58 = v24;
                  *(_WORD *)&v58[4] = 2112;
                  *(void *)&v58[6] = v26;
                  *(_WORD *)&v58[14] = 2112;
                  *(void *)&v58[16] = v22;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Cancelled function 0x%X key %@ error %@", buf, 0x1Cu);
                }
              }
              id v15 = [v13 countByEnumeratingWithState:&v44 objects:v59 count:16];
            }
            while (v15);
          }
          self = v36;
          if (v36->_subscriptionRange.location && v36->_subscriptionRange.length)
          {
            v27 = +[AlishaExternal shared];
            v28 = [v38 bleUUID];
            v29 = +[NSUUID ses_withUUIDString:v28];
            [v27 subscribeToVehicleFunctionStatusEventsWithRange:0, 0, v29];
          }
          v30 = v52;
          uint64_t v11 = v41;
          i = v42;
        }
        else
        {
          v30 = SESDefaultLogObject();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = [v9 asHexString];
            *(_DWORD *)buf = 138412290;
            *(void *)v58 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Couldn't find endpoint for vehicle ID %@", buf, 0xCu);
          }
        }
      }
      id v40 = [(NSSet *)obj countByEnumeratingWithState:&v53 objects:v60 count:16];
    }
    while (v40);
  }

  if (self->_currentPeerUUID)
  {
    v32 = +[AlishaExternal shared];
    [v32 removeHighPriorityRequestFor:self->_currentPeerUUID client:self->_sessionID];

    currentPeerUUID = self->_currentPeerUUID;
    self->_currentPeerUUID = 0;
  }
  v43.receiver = self;
  v43.super_class = (Class)_SESRKESession;
  [(_SESSession *)&v43 endSessionInternal:v34];
}

- (void)endSession:(id)a3
{
  id v4 = a3;
  id v5 = [(_SESSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000425A0;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)isPassiveEntryAvailable:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004273C;
  block[3] = &unk_10040BEE8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)sendRKEFunction:(unint64_t)a3 action:(unint64_t)a4 readerIdentifier:(id)a5 authorization:(id)a6 isEnduring:(BOOL)a7 isHandlingExternal:(BOOL)a8 completion:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v18 = [(_SESSession *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042A80;
  block[3] = &unk_10040D610;
  unint64_t v26 = a3;
  unint64_t v27 = a4;
  block[4] = self;
  id v23 = v15;
  BOOL v28 = a7;
  BOOL v29 = a8;
  id v24 = v16;
  id v25 = v17;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  dispatch_async(v18, block);
}

- (void)cancelRKEFunction:(unint64_t)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(_SESSession *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100043180;
  v13[3] = &unk_10040D638;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)continueExecutingRKEFunction:(unint64_t)a3 action:(unint64_t)a4 arbitraryData:(id)a5 readerIdentifier:(id)a6 reply:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = [(_SESSession *)self queue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100043560;
  v19[3] = &unk_10040D660;
  unint64_t v23 = a3;
  unint64_t v24 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(v15, v19);
}

- (void)sendPassthroughMessage:(id)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_SESSession *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000439B8;
  v15[3] = &unk_10040D360;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)getVehicleReports:(id)a3
{
  id v4 = a3;
  id v5 = [(_SESSession *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043E68;
  v7[3] = &unk_10040BE80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)sign:(id)a3 readerIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(_SESSession *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100044274;
  v15[3] = &unk_10040B910;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(v11, v15);
}

- (BOOL)isReaderAllowed:(id)a3
{
  return [(NSSet *)self->_allowlistedVehicleIdentifiers containsObject:a3];
}

- (id)updateAllowlistedVehicles
{
  int v2 = self;
  objc_sync_enter(v2);
  if (+[_SESRKESession isDebugAllowAllEndpointsEnabled])
  {
    id v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting all endpoints as allowed", buf, 2u);
    }

    id v11 = 0;
    uint64_t v4 = +[_SESRKESession _debugGetReaderIdentifiersForAllEndpoints:&v11];
    id v5 = v11;
    allowlistedVehicleIdentifiers = v2->_allowlistedVehicleIdentifiers;
    v2->_allowlistedVehicleIdentifiers = (NSSet *)v4;
  }
  else
  {
    allowlistedVehicleIdentifiers = [(_SESSession *)v2 connection];
    id v10 = 0;
    uint64_t v7 = +[_SESRKESession getAllowedVehicleIdentifiersForConnection:allowlistedVehicleIdentifiers error:&v10];
    id v5 = v10;
    id v8 = v2->_allowlistedVehicleIdentifiers;
    v2->_allowlistedVehicleIdentifiers = (NSSet *)v7;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)didInvalidateWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = SESDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESRKESession %@ didInvalidateWithError %@", (uint8_t *)&v8, 0x16u);
  }

  if ([(_SESSession *)self isActive])
  {
    uint64_t v7 = [(_SESSession *)self remoteObject];
    [v7 didInvalidateWithError:v4];
  }
  [(_SESRKESession *)self endSessionInternal:v4];
}

- (void)didCreateKey:(id)a3
{
  id v4 = (_SESRKESession *)a3;
  id v5 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(_SESSession *)self isActive])
  {
    id v6 = [(_SESRKESession *)self updateAllowlistedVehicles];
    if (v6)
    {
      uint64_t v7 = SESDefaultLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        unint64_t v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to update list of allowlisted vehicles %@", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      int v8 = +[AlishaExternal shared];
      uint64_t v7 = [v8 getEndpointWithKeyIdentifier:v4];

      if (v7)
      {
        allowlistedVehicleIdentifiers = self->_allowlistedVehicleIdentifiers;
        __int16 v10 = [v7 readerIdentifier];
        unsigned __int8 v11 = [(NSSet *)allowlistedVehicleIdentifiers containsObject:v10];

        id v12 = SESDefaultLogObject();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
        if (v11)
        {
          if (v13)
          {
            id v14 = [v7 publicKeyIdentifier];
            id v15 = [v14 asHexString];
            id v16 = [v7 readerIdentifier];
            id v17 = [v16 asHexString];
            int v22 = 138412802;
            unint64_t v23 = self;
            __int16 v24 = 2112;
            id v25 = v15;
            __int16 v26 = 2112;
            unint64_t v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Calling client of %@ to handle new key %@ readerIdentifier %@", (uint8_t *)&v22, 0x20u);
          }
          id v18 = [(_SESSession *)self remoteObject];
          id v19 = [v7 publicKeyIdentifier];
          id v20 = [v7 readerIdentifier];
          [v18 didCreateKey:v19 forVehicle:v20];

          [(_SESRKESession *)self wakeUpClientIfBackgrounded];
        }
        else
        {
          if (v13)
          {
            int v22 = 138412290;
            unint64_t v23 = self;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dropping notification due to vehicle not allowed in the active session %@", (uint8_t *)&v22, 0xCu);
          }
        }
      }
      else
      {
        id v21 = SESDefaultLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412290;
          unint64_t v23 = v4;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Dropping notification due to missing endpoint %@", (uint8_t *)&v22, 0xCu);
        }
      }
    }
  }
}

- (void)sendEvent:(id)a3 keyIdentifier:(id)a4
{
  id v6 = (_SESRKESession *)a3;
  id v7 = a4;
  int v8 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    id v18 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SESRKESession %@ sendEvent", (uint8_t *)&v17, 0xCu);
  }

  if ([(_SESSession *)self isActive])
  {
    __int16 v10 = +[AlishaExternal shared];
    unsigned __int8 v11 = [v10 getEndpointWithKeyIdentifier:v7];

    if (v11)
    {
      id v12 = [v11 readerIdentifier];
      if ([(NSSet *)self->_allowlistedVehicleIdentifiers containsObject:v12])
      {
        if (qword_10045CD58 != -1) {
          dispatch_once(&qword_10045CD58, &stru_10040D6F8);
        }
        BOOL v13 = [(_SESRKESession *)v6 objectForKeyedSubscript:@"xpcEventName"];
        if ([(id)qword_10045CD50 containsObject:v13])
        {
          id v14 = SESDefaultLogObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412290;
            id v18 = v6;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Sending event via session delegate %@", (uint8_t *)&v17, 0xCu);
          }

          id v15 = [(_SESSession *)self remoteObject];
          [v15 sendEvent:v6 fromVehicle:v12];

          [(_SESRKESession *)self wakeUpClientIfBackgrounded];
        }
      }
      else
      {
        BOOL v13 = SESDefaultLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Dropping event due to vehicle not in the active session", (uint8_t *)&v17, 2u);
        }
      }
    }
    else
    {
      id v12 = SESDefaultLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v16 = [v7 asHexString];
        int v17 = 138412290;
        id v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dropping event due to missing endpoint %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    unsigned __int8 v11 = SESDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Dropping event due to session not active %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)didReceivePassthroughMessage:(id)a3 keyIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = SESDefaultLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v19 = 138412290;
    id v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "SESRKESession %@ didReceivePassthroughMessage", (uint8_t *)&v19, 0xCu);
  }

  if ([(_SESSession *)self isActive])
  {
    __int16 v10 = +[AlishaExternal shared];
    unsigned __int8 v11 = [v10 getEndpointWithKeyIdentifier:v7];

    if (v11)
    {
      id v12 = [v11 readerIdentifier];
      if ([(NSSet *)self->_allowlistedVehicleIdentifiers containsObject:v12])
      {
        BOOL v13 = [(_SESSession *)self remoteObject];
        [v13 didReceivePassthroughMessage:v6 fromVehicle:v12];

        [(_SESRKESession *)self wakeUpClientIfBackgrounded];
LABEL_15:

        goto LABEL_16;
      }
      id v14 = SESDefaultLogObject();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_14:

        goto LABEL_15;
      }
      LOWORD(v19) = 0;
      id v15 = "Dropping passthrough message due to vehicle not in the active session";
      id v16 = v14;
      os_log_type_t v17 = OS_LOG_TYPE_INFO;
      uint32_t v18 = 2;
    }
    else
    {
      id v12 = SESDefaultLogObject();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      id v14 = [v7 asHexString];
      int v19 = 138412290;
      id v20 = (_SESRKESession *)v14;
      id v15 = "No endpoint matching key %@";
      id v16 = v12;
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      uint32_t v18 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, (uint8_t *)&v19, v18);
    goto LABEL_14;
  }
  unsigned __int8 v11 = SESDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring passthrough message received with no active session", (uint8_t *)&v19, 2u);
  }
LABEL_16:
}

- (void)didReceiveContinuationRequestFor:(id)a3 actionIdentifier:(id)a4 arbitraryData:(id)a5 keyIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v14);

  id v15 = +[AlishaExternal shared];
  id v16 = [v15 getEndpointWithKeyIdentifier:v13];

  if (v16)
  {
    os_log_type_t v17 = [v16 readerIdentifier];
    unsigned __int8 v18 = [(NSSet *)self->_allowlistedVehicleIdentifiers containsObject:v17];
    int v19 = SESDefaultLogObject();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18)
    {
      if (v20)
      {
        id v21 = [v17 asHexString];
        int v24 = 138413058;
        id v25 = v21;
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        id v29 = v11;
        __int16 v30 = 1024;
        BOOL v31 = v12 != 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Calling client to handle continuation request for %@ function %@ action %@ with arbitraryData %d", (uint8_t *)&v24, 0x26u);
      }
      int v22 = [(_SESSession *)self remoteObject];
      [v22 didReceiveContinuationRequestFor:v10 actionIdentifier:v11 arbitraryData:v12 fromVehicle:v17];

      [(_SESRKESession *)self wakeUpClientIfBackgrounded];
    }
    else
    {
      if (v20)
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Dropping confirmation request due to vehicle not in the active session", (uint8_t *)&v24, 2u);
      }
    }
  }
  else
  {
    os_log_type_t v17 = SESDefaultLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v23 = [v13 asHexString];
      int v24 = 138412290;
      id v25 = v23;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "No endpoint matching key %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)wakeUpClientIfBackgrounded
{
  id v3 = [(_SESSession *)self queue];
  dispatch_assert_queue_V2(v3);

  sub_100052B14((uint64_t)self->_rbsAssertionTimer);
  unsigned __int8 v4 = [(_SESSession *)self isBackgrounded];
  rbsAssertion = self->_rbsAssertion;
  if (v4)
  {
    if (rbsAssertion)
    {
      rbsAssertionTimer = self->_rbsAssertionTimer;
      sub_1000529D8((uint64_t)rbsAssertionTimer, 1.0);
    }
    else
    {
      uint64_t v14 = FBSOpenApplicationOptionKeyActivateSuspended;
      id v15 = &__kCFBooleanTrue;
      id v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      id v10 = +[FBSOpenApplicationOptions optionsWithDictionary:v9];

      id v11 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
      id v12 = [(_SESRKESession *)self clientBundleIdentifier];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100045B28;
      v13[3] = &unk_10040D748;
      v13[4] = self;
      [v11 openApplication:v12 withOptions:v10 completion:v13];
    }
  }
  else if (rbsAssertion)
  {
    [(RBSAssertion *)rbsAssertion invalidate];
    id v7 = self->_rbsAssertion;
    self->_rbsAssertion = 0;

    int v8 = self->_rbsAssertionTimer;
    self->_rbsAssertionTimer = 0;
  }
}

- (_NSRange)subscriptionRange
{
  p_subscriptionRange = &self->_subscriptionRange;
  NSUInteger location = self->_subscriptionRange.location;
  NSUInteger length = p_subscriptionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSubscriptionRange:(_NSRange)a3
{
  self->_subscriptionRange = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_rbsAssertionTimer, 0);
  objc_storeStrong((id *)&self->_rbsAssertion, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_currentPeerUUID, 0);

  objc_storeStrong((id *)&self->_allowlistedVehicleIdentifiers, 0);
}

@end