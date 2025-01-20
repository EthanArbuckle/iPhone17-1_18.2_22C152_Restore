@interface CSDThumperCapabilitiesMonitor
- (BOOL)shouldEnrollDefaultPairedDeviceForAccountID:(id)a3;
- (BOOL)shouldUnenrollDefaultPairedDeviceForAccountID:(id)a3;
- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault;
- (CSDThumperCapabilitiesMonitor)init;
- (CSDThumperCapabilitiesMonitorDataSource)dataSource;
- (NPSDomainAccessor)domainAccessor;
- (OS_dispatch_queue)queue;
- (id)thumperCapabilitiesStatesForPreferenceKey:(__CFString *)a3;
- (void)_checkIfDevicesShouldBeUnenrolled;
- (void)_thumperIsNoLongerEnabledForAccountID:(id)a3;
- (void)_thumperIsNoLongerSupportedForAccountID:(id)a3;
- (void)_thumperIsNowEnabledForAccountID:(id)a3;
- (void)_updateDefaultPairedDeviceUniqueIDDefault;
- (void)_updateThumperCallingPreferences;
- (void)didAddCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didRemoveCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)enrollDefaultPairedDevice;
- (void)enrollDefaultPairedDeviceForAccountID:(id)a3;
- (void)handleIDSDeviceListChangedNotification:(id)a3;
- (void)removeEmergencyAddressDisclaimerOnSecondaryDevice;
- (void)removeReminderNotificationOnSecondaryDevice;
- (void)saveThumperCapabilitiesStates:(id)a3 forPreferenceKey:(__CFString *)a4;
- (void)setDataSource:(id)a3;
- (void)setDomainAccessor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3;
- (void)showEmergencyAddressDisclaimerOnSecondaryDevice;
- (void)showReminderNotificationOnSecondaryDevice;
- (void)unenrollDefaultPairedDeviceForAccountID:(id)a3;
- (void)updateState;
@end

@implementation CSDThumperCapabilitiesMonitor

- (CSDThumperCapabilitiesMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSDThumperCapabilitiesMonitor;
  v2 = [(CSDThumperCapabilitiesMonitor *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.telephonyutilities.callservicesd.thumpercapabilitiesmonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    +[TUCallCapabilities addDelegate:v2 queue:v2->_queue];
    v5 = +[NSNotificationCenter defaultCenter];
    v6 = +[CSDThumperIDSService sharedInstance];
    [v5 addObserver:v2 selector:"handleIDSDeviceListChangedNotification:" name:@"CSDIDSDeviceListChangedNotification" object:v6];
  }
  return v2;
}

- (void)updateState
{
  dispatch_queue_t v3 = [(CSDThumperCapabilitiesMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FC54;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)CUTWeakLinkClass()) initWithDomain:TUBundleIdentifierCallServicesDaemon];
    v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (BOOL)thumperCallingAllowedOnDefaultPairedDeviceDefault
{
  unsigned __int8 v6 = 0;
  v2 = [(CSDThumperCapabilitiesMonitor *)self domainAccessor];
  unsigned int v3 = [v2 BOOLForKey:@"thumperCallingAllowedOnDefaultPairedDevice" keyExistsAndHasValidFormat:&v6];

  v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    int v8 = v6;
    __int16 v9 = 1024;
    unsigned int v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "thumperCallingAllowedOnDefaultPairedDeviceDefault keyExists: %d isAllowed: %d", buf, 0xEu);
  }

  if (v6) {
    return v3;
  }
  else {
    return 1;
  }
}

- (void)setThumperCallingAllowedOnDefaultPairedDeviceDefault:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    CFStringRef v11 = @"thumperCallingAllowedOnDefaultPairedDevice";
    __int16 v12 = 1024;
    BOOL v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting %@ default to %d", (uint8_t *)&v10, 0x12u);
  }

  unsigned __int8 v6 = [(CSDThumperCapabilitiesMonitor *)self domainAccessor];
  [v6 setBool:v3 forKey:@"thumperCallingAllowedOnDefaultPairedDevice"];

  v7 = [(CSDThumperCapabilitiesMonitor *)self domainAccessor];
  int v8 = [v7 synchronize];

  if (v8)
  {
    __int16 v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1003A8950((uint64_t)v8, v9);
    }
  }
}

- (void)_thumperIsNoLongerSupportedForAccountID:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Thumper available notification on secondary device for account ID %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDThumperCapabilitiesMonitor *)self removeReminderNotificationOnSecondaryDevice];
}

- (void)_thumperIsNowEnabledForAccountID:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Displaying Thumper enabled disclaimer on secondary device for account ID %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDThumperCapabilitiesMonitor *)self showEmergencyAddressDisclaimerOnSecondaryDevice];
}

- (void)_thumperIsNoLongerEnabledForAccountID:(id)a3
{
  id v4 = a3;
  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Thumper enabled disclaimer on secondary device for account ID %@", (uint8_t *)&v6, 0xCu);
  }

  [(CSDThumperCapabilitiesMonitor *)self removeEmergencyAddressDisclaimerOnSecondaryDevice];
}

- (void)_updateThumperCallingPreferences
{
  if (+[TUCallCapabilities areCTCapabilitiesValid])
  {
    v38 = self;
    BOOL v3 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
    id v4 = [v3 thumperCallingCapabilitiesStateByUUID];

    v50 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v43 = v4;
    v5 = [v4 allKeys];
    id v6 = [v5 countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v60;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v60 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          CFStringRef v11 = [v4 objectForKeyedSubscript:v10];
          __int16 v12 = [v11 publiclyAccessibleCopy];

          BOOL v13 = [v12 accountID];
          if (v13)
          {
            [v50 setObject:v12 forKeyedSubscript:v13];
          }
          else
          {
            v14 = sub_100008DCC();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v66 = v10;
              __int16 v67 = 2112;
              v68 = v12;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not obtain Thumper account identifier for sender identity UUID %@ from data source capabilities state %@", buf, 0x16u);
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v59 objects:v69 count:16];
      }
      while (v7);
    }

    unsigned int v42 = +[TUCallCapabilities supportsPrimaryCalling];
    v15 = v38;
    v44 = [(CSDThumperCapabilitiesMonitor *)v38 thumperCapabilitiesStatesForPreferenceKey:@"thumperCallingCapabilitiesStates"];
    v16 = sub_100008DCC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v66 = v44;
      __int16 v67 = 2112;
      v68 = v50;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Comparing cached Thumper capabilities state %@ with data source capabilities state %@", buf, 0x16u);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v17 = [v50 allKeys];
    id v45 = [v17 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v45)
    {
      char v40 = 0;
      char v37 = 0;
      uint64_t v41 = *(void *)v56;
      *(void *)&long long v18 = 138412290;
      long long v36 = v18;
      v39 = v17;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(void *)v56 != v41) {
            objc_enumerationMutation(v17);
          }
          v20 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
          v21 = objc_msgSend(v50, "objectForKeyedSubscript:", v20, v36);
          unsigned int v22 = [v21 isAssociated];
          unsigned int v23 = [v21 isSupported];
          unsigned int v49 = [v21 isEnabled];
          unsigned int v48 = [v21 supportsDefaultPairedDevice];
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v24 = v44;
          id v25 = [v24 countByEnumeratingWithState:&v51 objects:v63 count:16];
          if (v25)
          {
            unsigned int v46 = v23;
            unsigned int v47 = v22;
            uint64_t v26 = *(void *)v52;
            while (2)
            {
              for (k = 0; k != v25; k = (char *)k + 1)
              {
                if (*(void *)v52 != v26) {
                  objc_enumerationMutation(v24);
                }
                v28 = *(void **)(*((void *)&v51 + 1) + 8 * (void)k);
                v29 = [v28 accountID];
                int v30 = TUStringsAreCaseInsensitiveEqual();

                if (v30)
                {
                  LODWORD(v25) = [v28 isAssociated];
                  unsigned int v31 = [v28 isSupported];
                  unsigned int v32 = [v28 supportsDefaultPairedDevice];
                  goto LABEL_31;
                }
              }
              id v25 = [v24 countByEnumeratingWithState:&v51 objects:v63 count:16];
              if (v25) {
                continue;
              }
              break;
            }
            unsigned int v31 = 0;
            unsigned int v32 = 0;
LABEL_31:
            v17 = v39;
            unsigned int v23 = v46;
            unsigned int v22 = v47;
          }
          else
          {
            unsigned int v31 = 0;
            unsigned int v32 = 0;
          }

          if (v42)
          {
            if (v48 != v32)
            {
              if (v48) {
                [(CSDThumperCapabilitiesMonitor *)v38 enrollDefaultPairedDeviceForAccountID:v20];
              }
              else {
                [(CSDThumperCapabilitiesMonitor *)v38 unenrollDefaultPairedDeviceForAccountID:v20];
              }
            }
          }
          else
          {
            unsigned int v33 = v22 ^ v25 | v23 ^ v31;
            if ((v22 & v23 & v33 ^ 1 | v49))
            {
              v40 |= v33;
            }
            else
            {
              v34 = sub_100008DCC();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v36;
                v66 = v20;
                _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Should show Thumper available notification for account ID %@", buf, 0xCu);
              }

              char v40 = 1;
              char v37 = 1;
            }
          }
        }
        id v45 = [v17 countByEnumeratingWithState:&v55 objects:v64 count:16];
      }
      while (v45);

      v15 = v38;
      if (!(v42 & 1 | ((v40 & 1) == 0)))
      {
        if (v37) {
          [(CSDThumperCapabilitiesMonitor *)v38 showReminderNotificationOnSecondaryDevice];
        }
        else {
          [(CSDThumperCapabilitiesMonitor *)v38 removeReminderNotificationOnSecondaryDevice];
        }
      }
    }
    else
    {
    }
    v35 = [v50 allValues];
    [(CSDThumperCapabilitiesMonitor *)v15 saveThumperCapabilitiesStates:v35 forPreferenceKey:@"thumperCallingCapabilitiesStates"];
  }
}

- (void)_updateDefaultPairedDeviceUniqueIDDefault
{
  CFStringRef v3 = (const __CFString *)TUBundleIdentifierTelephonyUtilitiesFramework;
  id v4 = (void *)CFPreferencesCopyAppValue(@"PreviousDefaultPairedDeviceUniqueID", TUBundleIdentifierTelephonyUtilitiesFramework);
  v5 = +[CSDThumperIDSService sharedInstance];
  id v6 = [v5 defaultPairedDevice];
  id v7 = [v6 uniqueIDOverride];

  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    __int16 v12 = v4;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Default paired device unique ID was %@ and is now %@", (uint8_t *)&v11, 0x16u);
  }

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((TUStringsAreEqualOrNil() & 1) == 0)
    {
      CFPreferencesSetAppValue(@"PreviousDefaultPairedDeviceUniqueID", v7, v3);
      CFPreferencesAppSynchronize(v3);
      __int16 v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Check if devices should be enrolled now that the default paired device changed.", (uint8_t *)&v11, 2u);
      }

      if ([v4 length])
      {
        int v10 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
        [v10 removeThumperRegisteredDeviceID:v4 forThumperAccountID:0];
      }
      if ([v7 length]) {
        [(CSDThumperCapabilitiesMonitor *)self enrollDefaultPairedDevice];
      }
    }
  }
}

- (void)_checkIfDevicesShouldBeUnenrolled
{
  if (+[TUCallCapabilities supportsPrimaryCalling])
  {
    CFStringRef v3 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
    if (v3)
    {
      id v4 = sub_100008DCC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking to see if any devices have been removed from this iCloud account.", buf, 2u);
      }

      v5 = +[CSDThumperIDSService sharedInstance];
      id v6 = [v5 devices];
      id v7 = [v6 valueForKey:@"uniqueIDOverride"];
      uint64_t v8 = +[NSSet setWithArray:v7];

      if ([v8 count])
      {
        [v3 localThumperAccounts];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id obj = (id)objc_claimAutoreleasedReturnValue();
        id v20 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
        if (v20)
        {
          uint64_t v19 = *(void *)v27;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v27 != v19) {
                objc_enumerationMutation(obj);
              }
              uint64_t v21 = v9;
              int v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              int v11 = [v10 allowedSecondaryDeviceIDs];
              id v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v23;
                do
                {
                  for (i = 0; i != v13; i = (char *)i + 1)
                  {
                    if (*(void *)v23 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
                    if (([v8 containsObject:v16] & 1) == 0)
                    {
                      v17 = sub_100008DCC();
                      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412290;
                        uint64_t v31 = v16;
                        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Device with the uniqueID %@ will be unpaired from Thumper because it is no longer on the IDSService.", buf, 0xCu);
                      }

                      [v3 removeThumperRegisteredDeviceID:v16 forThumperAccountID:0];
                    }
                  }
                  id v13 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
                }
                while (v13);
              }

              uint64_t v9 = v21 + 1;
            }
            while ((id)(v21 + 1) != v20);
            id v20 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
          }
          while (v20);
        }
      }
    }
  }
}

- (void)didAddCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = (CSDThumperCapabilitiesMonitor *)a3;
  v5 = [(CSDThumperCapabilitiesMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = self;
      __int16 v14 = 2112;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling add capabilities for sender identity UUID %@", (uint8_t *)&v12, 0x16u);
    }

    uint64_t v8 = [v6 thumperCallingCapabilitiesStateByUUID];
    uint64_t v9 = [v8 objectForKeyedSubscript:v4];

    int v10 = sub_100008DCC();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Thumper calling preferences update initiated by add capabilities for sender identity UUID %@", (uint8_t *)&v12, 0xCu);
      }

      [(CSDThumperCapabilitiesMonitor *)self _updateThumperCallingPreferences];
    }
    else
    {
      if (v11)
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Skipping Thumper preferences update; Thumper capabilities state does not exist for UUID %@",
          (uint8_t *)&v12,
          0xCu);
      }
    }
  }
}

- (void)didRemoveCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = (CSDThumperCapabilitiesMonitor *)a3;
  v5 = [(CSDThumperCapabilitiesMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      long long v27 = self;
      __int16 v28 = 2112;
      long long v29 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling remove capabilities for sender identity UUID %@", buf, 0x16u);
    }
    id v20 = self;

    [v6 secondaryThumperAccounts];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "accountID", v20);
          if (v13)
          {
            __int16 v14 = +[CTXPCContextInfo csd_unknownContextInfoForAccountID:v13];
            v15 = v14;
            if (v14)
            {
              uint64_t v16 = [v14 uuid];
              unsigned __int8 v17 = [v16 isEqual:v4];

              if (v17)
              {

                uint64_t v19 = sub_100008DCC();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  long long v27 = v4;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Skipping Thumper calling preferences update; unknown context info found for sender identity UUID %@",
                    buf,
                    0xCu);
                }

                goto LABEL_21;
              }
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v27 = v4;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Thumper calling preferences update initiated by remove capabilities for sender identity UUID %@", buf, 0xCu);
    }

    [(CSDThumperCapabilitiesMonitor *)v20 _updateThumperCallingPreferences];
LABEL_21:
  }
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDThumperCapabilitiesMonitor *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling change Thumper calling capabilities for sender identity with UUID %@", (uint8_t *)&v7, 0x16u);
  }

  [(CSDThumperCapabilitiesMonitor *)self _updateThumperCallingPreferences];
}

- (void)handleIDSDeviceListChangedNotification:(id)a3
{
  id v4 = [(CSDThumperCapabilitiesMonitor *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071218;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)showReminderNotificationOnSecondaryDevice
{
  v2 = sub_100008DCC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Show a reminder to the user that thumper is now available.", buf, 2u);
  }

  CFStringRef v3 = TUBundle();
  id v4 = TUStringKeyForNetwork();
  v5 = [v3 localizedStringForKey:v4 value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v6 = TUBundle();
  int v7 = [v6 localizedStringForKey:@"NOT_NOW" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v8 = TUBundle();
  __int16 v9 = [v8 localizedStringForKey:@"TURN_ON" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v10 = TUThumperCarrierName();
  id v11 = [v10 length];
  +[TUCallCapabilities supportsThumperCallingOverCellularData];
  TUBundle();
  if (v11) {
    int v12 = {;
  }
    id v13 = TUStringKeyForNetworkAndProduct();
    __int16 v14 = [v12 localizedStringForKey:v13 value:&stru_100517F40 table:@"TelephonyUtilities"];
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v10);
  }
  else {
    int v12 = {;
  }
    id v13 = TUStringKeyForNetworkAndProduct();
    v15 = [v12 localizedStringForKey:v13 value:&stru_100517F40 table:@"TelephonyUtilities"];
  }

  +[IMUserNotification userNotificationWithIdentifier:@"com.apple.telephonyutilities.callservicesd.thumperpushhandler.secondarydevicethumpersupported" title:v5 message:v15 defaultButton:v9 alternateButton:v7 otherButton:0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071538;
  block[3] = &unk_100504F10;
  long long v18 = @"com.apple.telephonyutilities.callservicesd.thumperpushhandler.secondarydevicethumpersupported";
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v19;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removeReminderNotificationOnSecondaryDevice
{
}

- (void)showEmergencyAddressDisclaimerOnSecondaryDevice
{
  CFStringRef v3 = sub_100008DCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Show a disclaimer to the user about their emergency address info now that thumper is enabled.", buf, 2u);
  }

  [(CSDThumperCapabilitiesMonitor *)self removeReminderNotificationOnSecondaryDevice];
  id v4 = TUBundle();
  v5 = [v4 localizedStringForKey:@"THUMPER_EMERGENCY_ADDRESS_INFO_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v6 = TUBundle();
  int v7 = [v6 localizedStringForKey:@"THUMPER_EMERGENCY_ADDRESS_INFO_MESSAGE" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v8 = TUBundle();
  __int16 v9 = [v8 localizedStringForKey:@"PREFERENCES_BUTTON_TITLE" value:&stru_100517F40 table:@"TelephonyUtilities"];

  id v10 = TUBundle();
  id v11 = [v10 localizedStringForKey:@"OK" value:&stru_100517F40 table:@"TelephonyUtilities"];

  +[IMUserNotification userNotificationWithIdentifier:@"com.apple.telephonyutilities.callservicesd.thumperpushhandler.secondarydevicethumperenabled" title:v5 message:v7 defaultButton:v11 alternateButton:v9 otherButton:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100071988;
  v13[3] = &unk_100504F10;
  __int16 v14 = @"com.apple.telephonyutilities.callservicesd.thumperpushhandler.secondarydevicethumperenabled";
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v15;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)removeEmergencyAddressDisclaimerOnSecondaryDevice
{
}

- (void)saveThumperCapabilitiesStates:(id)a3 forPreferenceKey:(__CFString *)a4
{
  id v6 = a3;
  int v7 = [(CSDThumperCapabilitiesMonitor *)self queue];
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    id v19 = a4;
    id v8 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v6;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          __int16 v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v13);
          id v21 = 0;
          id v15 = [v14 archivedDataWithError:&v21];
          id v16 = v21;
          unsigned __int8 v17 = v16;
          if (v15)
          {
            [v8 addObject:v15];
          }
          else if (v16)
          {
            long long v18 = sub_100008DCC();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              long long v27 = v17;
              _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Archiving Thumper capabilities state object failed with error %@", buf, 0xCu);
            }
          }
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v11);
    }

    a4 = v19;
    id v6 = v20;
  }
  else
  {
    id v8 = 0;
  }
  CFPreferencesSetAppValue(a4, v8, TUBundleIdentifierTelephonyUtilitiesFramework);
}

- (id)thumperCapabilitiesStatesForPreferenceKey:(__CFString *)a3
{
  id v4 = [(CSDThumperCapabilitiesMonitor *)self queue];
  dispatch_assert_queue_V2(v4);

  v5 = (void *)CFPreferencesCopyAppValue(a3, TUBundleIdentifierTelephonyUtilitiesFramework);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = +[NSMutableArray array];
      int v7 = v5;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
      if (!v8) {
        goto LABEL_24;
      }
      id v9 = v8;
      uint64_t v10 = *(void *)v21;
      while (1)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = 0;
            id v13 = +[TUThumperCTCapabilitiesState unarchivedObjectFromData:v12 error:&v19];
            __int16 v14 = v19;
            if (v13)
            {
              [v6 addObject:v13];
            }
            else
            {
              id v16 = sub_100008DCC();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                long long v25 = v14;
                _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Unarchiving Thumper capabilities state object failed with error %@", buf, 0xCu);
              }
            }
          }
          else
          {
            __int16 v14 = sub_100008DCC();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              goto LABEL_17;
            }
            id v15 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            long long v25 = v15;
            __int16 v26 = 2112;
            uint64_t v27 = v12;
            id v13 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Archived object was of unexpected class %@: %@", buf, 0x16u);
          }

LABEL_17:
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (!v9) {
          goto LABEL_24;
        }
      }
    }
    int v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1003A89C8((uint64_t)v5, v7);
    }
    id v6 = 0;
LABEL_24:
  }
  else
  {
    id v6 = 0;
  }
  id v17 = [v6 copy];

  return v17;
}

- (void)enrollDefaultPairedDevice
{
  CFStringRef v3 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 localThumperAccounts];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v9) accountID];
          id v11 = [v4 thumperCallingCapabilitiesStateForAccountID:v10];
          if ([v11 supportsDefaultPairedDevice]) {
            [(CSDThumperCapabilitiesMonitor *)self enrollDefaultPairedDeviceForAccountID:v10];
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)enrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v4)
  {
    v5 = +[CSDThumperIDSService sharedInstance];
    id v6 = [v5 defaultPairedDevice];
    id v7 = [v6 uniqueIDOverride];

    if ([v7 length]
      && [(CSDThumperCapabilitiesMonitor *)self shouldEnrollDefaultPairedDeviceForAccountID:v8])
    {
      [v4 removeThumperRegisteredDeviceID:v7 forThumperAccountID:0];
      [v4 addThumperRegisteredDeviceID:v7 forThumperAccountID:v8];
    }
  }
}

- (void)unenrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v4)
  {
    v5 = +[CSDThumperIDSService sharedInstance];
    id v6 = [v5 defaultPairedDevice];
    id v7 = [v6 uniqueIDOverride];

    if ([v7 length]
      && (!v8
       || [(CSDThumperCapabilitiesMonitor *)self shouldUnenrollDefaultPairedDeviceForAccountID:v8]))
    {
      [v4 removeThumperRegisteredDeviceID:v7 forThumperAccountID:v8];
    }
  }
}

- (BOOL)shouldEnrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v5)
  {
    id v6 = +[CSDThumperIDSService sharedInstance];
    id v7 = [v6 defaultPairedDevice];
    id v8 = [v7 uniqueIDOverride];

    id v9 = [v5 thumperCallingCapabilitiesStateForAccountID:v4];
    if (+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling")&& [v8 length]&& (objc_msgSend(v5, "isThumperRegisteredDeviceID:forThumperAccountID:", v8, v4) & 1) == 0&& -[CSDThumperCapabilitiesMonitor thumperCallingAllowedOnDefaultPairedDeviceDefault](self, "thumperCallingAllowedOnDefaultPairedDeviceDefault")&& objc_msgSend(v9, "isSupported")&& objc_msgSend(v9, "isEnabled"))
    {
      unsigned __int8 v10 = [v9 supportsDefaultPairedDevice];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)shouldUnenrollDefaultPairedDeviceForAccountID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDThumperCapabilitiesMonitor *)self dataSource];
  if (v5)
  {
    id v6 = +[CSDThumperIDSService sharedInstance];
    id v7 = [v6 defaultPairedDevice];
    id v8 = [v7 uniqueIDOverride];

    id v9 = [v5 thumperCallingCapabilitiesStateForAccountID:v4];
    if (+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling")&& [v8 length]&& objc_msgSend(v5, "isThumperRegisteredDeviceID:forThumperAccountID:", v8, v4))
    {
      if ([(CSDThumperCapabilitiesMonitor *)self thumperCallingAllowedOnDefaultPairedDeviceDefault])
      {
        unsigned int v10 = [v9 supportsDefaultPairedDevice] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (CSDThumperCapabilitiesMonitorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (CSDThumperCapabilitiesMonitorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end