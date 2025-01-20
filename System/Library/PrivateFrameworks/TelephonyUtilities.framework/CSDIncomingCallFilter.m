@interface CSDIncomingCallFilter
- (BOOL)_doNotDisturbAllowsCallFromSourceAddress:(id)a3 providerIdentifier:(id)a4;
- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3;
- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3 countryCode:(id)a4;
- (BOOL)isOnEmergencyCall;
- (CNContactStore)contactStore;
- (CSDCallCenterObserver)callCenterObserver;
- (CSDCallDirectoryManager)callDirectoryManager;
- (CSDDeviceLockStateObserver)deviceLockObserver;
- (CSDIncomingCallFilter)init;
- (CSDIncomingCallFilter)initWithDataSource:(id)a3 deviceLockObserver:(id)a4 callCenterObserver:(id)a5 callDirectoryStoreBuilder:(id)a6 callDirectoryManager:(id)a7 contactStore:(id)a8 queue:(id)a9;
- (CSDIncomingCallFilterDataSource)dataSource;
- (CXCallDirectorySanitizer)callDirectorySanitizer;
- (CXCallDirectoryStore)callDirectoryStore;
- (NSString)emergencyProviderIdentifier;
- (OS_dispatch_queue)queue;
- (TUCallProviderManager)callProviderManager;
- (double)twoTimeCallthroughInterval;
- (id)_callDirectoryPhoneNumberVariantsForSourceAddress:(id)a3 countryCode:(id)a4;
- (id)_callFilterBlock;
- (id)_callFilterIdentifier;
- (id)blockedByExtension:(id)a3;
- (void)callsChangedForCallCenterObserver:(id)a3;
- (void)setCallDirectoryManager:(id)a3;
- (void)setCallDirectoryStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setOnEmergencyCall:(BOOL)a3;
- (void)setTwoTimeCallthroughInterval:(double)a3;
@end

@implementation CSDIncomingCallFilter

- (CSDIncomingCallFilter)init
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_100141F20;
  v14 = sub_100141F30;
  id v15 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141F38;
  block[3] = &unk_100505B90;
  v8 = self;
  v9 = &v10;
  dispatch_queue_t v7 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.incomingcallfilter", 0);
  v2 = v8;
  v3 = v7;
  dispatch_sync(v3, block);
  v4 = (CSDIncomingCallFilter *)(id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (CSDIncomingCallFilter)initWithDataSource:(id)a3 deviceLockObserver:(id)a4 callCenterObserver:(id)a5 callDirectoryStoreBuilder:(id)a6 callDirectoryManager:(id)a7 contactStore:(id)a8 queue:(id)a9
{
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v16 = a6;
  id v33 = a7;
  id v17 = a8;
  id v18 = a9;
  v41.receiver = self;
  v41.super_class = (Class)CSDIncomingCallFilter;
  v19 = [(CSDIncomingCallFilter *)&v41 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a9);
    objc_storeStrong((id *)&v20->_dataSource, a3);
    dataSource = v20->_dataSource;
    v22 = [(CSDIncomingCallFilter *)v20 _callFilterBlock];
    [(CSDIncomingCallFilterDataSource *)dataSource setFilterBlock:v22];

    v20->_twoTimeCallthroughInterval = 180.0;
    objc_storeStrong((id *)&v20->_deviceLockObserver, a4);
    objc_storeStrong((id *)&v20->_callCenterObserver, a5);
    [(CSDCallCenterObserver *)v20->_callCenterObserver setTriggers:1];
    [(CSDCallCenterObserver *)v20->_callCenterObserver setDelegate:v20];
    v23 = (CXCallDirectorySanitizer *)objc_alloc_init((Class)CXCallDirectorySanitizer);
    callDirectorySanitizer = v20->_callDirectorySanitizer;
    v20->_callDirectorySanitizer = v23;

    v25 = (TUCallProviderManager *)objc_alloc_init((Class)TUCallProviderManager);
    callProviderManager = v20->_callProviderManager;
    v20->_callProviderManager = v25;

    v27 = [(TUCallProviderManager *)v20->_callProviderManager emergencyProvider];
    v28 = [v27 identifier];
    v29 = (NSString *)[v28 copy];
    emergencyProviderIdentifier = v20->_emergencyProviderIdentifier;
    v20->_emergencyProviderIdentifier = v29;

    objc_storeStrong((id *)&v20->_callDirectoryManager, a7);
    objc_storeStrong((id *)&v20->_contactStore, a8);
    objc_initWeak(&location, v20);
    deviceLockObserver = v20->_deviceLockObserver;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001423BC;
    v37[3] = &unk_1005084F8;
    objc_copyWeak(&v39, &location);
    id v38 = v16;
    [(CSDDeviceLockStateObserver *)deviceLockObserver performBlockAfterFirstUnlock:v37];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v20;
}

- (id)_callFilterBlock
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100142510;
  v4[3] = &unk_100508520;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (id)_callFilterIdentifier
{
  return +[NSString stringWithFormat:@"%@.%@.%p", TUBundleIdentifierCallServicesDaemon, objc_opt_class(), self];
}

- (BOOL)_doNotDisturbAllowsCallFromSourceAddress:(id)a3 providerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  v8 = [(CSDIncomingCallFilter *)self queue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10014287C;
  v12[3] = &unk_100508548;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v12);

  LOBYTE(self) = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)self;
}

- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIncomingCallFilter *)self dataSource];
  id v6 = [v5 networkCountryCode];
  LOBYTE(self) = [(CSDIncomingCallFilter *)self callDirectoryAllowsCallFromSourceAddress:v4 countryCode:v6];

  return (char)self;
}

- (BOOL)callDirectoryAllowsCallFromSourceAddress:(id)a3 countryCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 destinationIdIsPhoneNumber])
  {
    v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "sourceAddress is phone number, continuing", buf, 2u);
    }

    id v9 = [(CSDIncomingCallFilter *)self contactStore];
    id v10 = [v9 contactForDestinationId:v6];

    v11 = sub_100008DCC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "contact=%@", buf, 0xCu);
    }

    if (v10)
    {
      LOBYTE(v12) = 1;
LABEL_39:

      goto LABEL_40;
    }
    id v13 = [v6 copy];
    id v14 = [(CSDIncomingCallFilter *)self callDirectoryStore];

    if (v14)
    {
      id v15 = [(CSDIncomingCallFilter *)self _callDirectoryPhoneNumberVariantsForSourceAddress:v6 countryCode:v7];
      uint64_t v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "phoneNumberVariants: %@", buf, 0xCu);
      }

      if ([v15 count])
      {
        id v17 = [(CSDIncomingCallFilter *)self callDirectoryStore];
        id v41 = 0;
        unsigned __int8 v18 = [v17 containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:v15 error:&v41];
        id v19 = v41;

        if (v19)
        {
          v20 = sub_100008DCC();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1003AD2B0();
          }
        }
        id v34 = v19;
        id v36 = v7;
        LOBYTE(v12) = v18 ^ 1;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v21 = v15;
        id v22 = [v21 countByEnumeratingWithState:&v37 objects:v42 count:16];
        unsigned __int8 v35 = v18;
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = *(void *)v38;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v38 != v24) {
                objc_enumerationMutation(v21);
              }
              v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              id v27 = objc_msgSend(v26, "length", v34);
              if (v27 > [v6 length])
              {
                id v28 = [v26 copy];

                id v13 = v28;
              }
            }
            id v23 = [v21 countByEnumeratingWithState:&v37 objects:v42 count:16];
          }
          while (v23);
        }

        id v10 = 0;
        id v7 = v36;
        if (v35) {
          goto LABEL_34;
        }
        goto LABEL_30;
      }
    }
    LOBYTE(v12) = 1;
LABEL_30:
    v29 = [(CSDIncomingCallFilter *)self callDirectoryManager];

    if (v29)
    {
      v30 = sub_100008DCC();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v13;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "callDirectory allowed call, checking live blocking info using qualifiedNumber: %@", buf, 0xCu);
      }

      v31 = [(CSDIncomingCallFilter *)self callDirectoryManager];
      unsigned int v12 = [v31 fetchLiveBlockingInfoForHandle:v13] ^ 1;
    }
LABEL_34:
    if ((v12 & 1) == 0)
    {
      v32 = sub_100008DCC();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v6;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Disallowing call from source address %@ since blocked by call directory or live caller id lookup", buf, 0xCu);
      }
    }
    goto LABEL_39;
  }
  LOBYTE(v12) = 1;
LABEL_40:

  return v12;
}

- (id)blockedByExtension:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSDIncomingCallFilter *)self callDirectoryStore];
  if (!v5
    || (v6 = (void *)v5, unsigned int v7 = [v4 destinationIdIsPhoneNumber], v6, !v7))
  {
LABEL_13:
    uint64_t v17 = [(CSDIncomingCallFilter *)self callDirectoryManager];
    if (v17
      && (unsigned __int8 v18 = (void *)v17, v19 = [v4 destinationIdIsPhoneNumber], v18, v19))
    {
      v20 = sub_100008DCC();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "callDirectory allowed call, checking live blocking info", buf, 2u);
      }

      id v21 = [(CSDIncomingCallFilter *)self callDirectoryManager];
      id v14 = [v21 firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:v4];
    }
    else
    {
      id v14 = 0;
    }
    goto LABEL_19;
  }
  v8 = [(CSDIncomingCallFilter *)self dataSource];
  id v9 = [v8 networkCountryCode];
  id v10 = [(CSDIncomingCallFilter *)self _callDirectoryPhoneNumberVariantsForSourceAddress:v4 countryCode:v9];

  v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "phoneNumberVariants: %@", buf, 0xCu);
  }

  if (![v10 count])
  {

    goto LABEL_13;
  }
  unsigned int v12 = [(CSDIncomingCallFilter *)self callDirectoryStore];
  id v13 = [v10 objectAtIndexedSubscript:0];
  id v23 = 0;
  id v14 = [v12 firstEnabledBlockingExtensionIdentifierForPhoneNumber:v13 error:&v23];
  id v15 = v23;

  if (v15)
  {
    uint64_t v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1003AD2B0();
    }
  }
  if (!v14) {
    goto LABEL_13;
  }
LABEL_19:

  return v14;
}

- (id)_callDirectoryPhoneNumberVariantsForSourceAddress:(id)a3 countryCode:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSMutableArray array];
  id v9 = [objc_alloc((Class)TUPhoneNumber) initWithDigits:v7 countryCode:v6];

  id v10 = [v9 digits];

  if (v10)
  {
    v11 = [(CSDIncomingCallFilter *)self callDirectorySanitizer];
    unsigned int v12 = [v9 digits];
    id v10 = [v11 canonicalizedPhoneNumber:v12];

    if (v10) {
      [v8 addObject:v10];
    }
  }
  id v13 = [v9 unformattedInternationalRepresentation];
  if (v13)
  {
    id v14 = [(CSDIncomingCallFilter *)self callDirectorySanitizer];
    id v15 = [v14 canonicalizedPhoneNumber:v13];

    if (!v15) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v10)
  {
    id v16 = +[NSLocale ITUCountryCodeForISOCountryCode:v6];
    if (v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v15 = +[NSString stringWithFormat:@"%ld%@", v16, v10];
LABEL_10:
      [v8 addObject:v15];
LABEL_11:
    }
  }
  id v17 = [v8 copy];

  return v17;
}

- (BOOL)isOnEmergencyCall
{
  v3 = [(CSDIncomingCallFilter *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_onEmergencyCall;
}

- (void)setOnEmergencyCall:(BOOL)a3
{
  uint64_t v5 = [(CSDIncomingCallFilter *)self queue];
  dispatch_assert_queue_V2(v5);

  self->_onEmergencyCall = a3;
}

- (void)callsChangedForCallCenterObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[TUCallCenter sharedInstance];
  id v6 = [v5 queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100143428;
  v8[3] = &unk_100504F10;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (double)twoTimeCallthroughInterval
{
  return self->_twoTimeCallthroughInterval;
}

- (void)setTwoTimeCallthroughInterval:(double)a3
{
  self->_twoTimeCallthroughInterval = a3;
}

- (CXCallDirectoryStore)callDirectoryStore
{
  return self->_callDirectoryStore;
}

- (void)setCallDirectoryStore:(id)a3
{
}

- (CSDIncomingCallFilterDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSString)emergencyProviderIdentifier
{
  return self->_emergencyProviderIdentifier;
}

- (TUCallProviderManager)callProviderManager
{
  return self->_callProviderManager;
}

- (CSDDeviceLockStateObserver)deviceLockObserver
{
  return self->_deviceLockObserver;
}

- (CSDCallCenterObserver)callCenterObserver
{
  return self->_callCenterObserver;
}

- (CXCallDirectorySanitizer)callDirectorySanitizer
{
  return self->_callDirectorySanitizer;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (CSDCallDirectoryManager)callDirectoryManager
{
  return self->_callDirectoryManager;
}

- (void)setCallDirectoryManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDirectoryManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_callDirectorySanitizer, 0);
  objc_storeStrong((id *)&self->_callCenterObserver, 0);
  objc_storeStrong((id *)&self->_deviceLockObserver, 0);
  objc_storeStrong((id *)&self->_callProviderManager, 0);
  objc_storeStrong((id *)&self->_emergencyProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_callDirectoryStore, 0);
}

@end