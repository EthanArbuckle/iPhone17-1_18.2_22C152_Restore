@interface CSDTelephonyCallCapabilities
- (BOOL)areCapabilitiesValid;
- (BOOL)isEmergencyCallbackModeEnabled;
- (BOOL)isEmergencyCallbackPossible;
- (BOOL)shouldUpdateSubscriptions;
- (CSDCoreTelephonyClient)coreTelephonyClient;
- (CSDEmergencyCallbackCapabilities)emergencyCallbackCapabilities;
- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3;
- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3 coreTelephonyClient:(id)a4 emergencyCallbackCapabilities:(id)a5;
- (CSDTelephonyCallCapabilitiesDelegate)delegate;
- (NSArray)localThumperAccounts;
- (NSArray)secondaryThumperAccounts;
- (NSDictionary)senderIdentityCapabilitiesStateByUUID;
- (NSMutableDictionary)lastSavedAccountIDByCapability;
- (NSSet)subscriptions;
- (NSString)associatedThumperAccountID;
- (NSString)debugDescription;
- (NSString)localThumperDeviceID;
- (OS_dispatch_queue)queue;
- (id)_senderIdentityCapabilitiesStateForSubscription:(id)a3;
- (id)_subscriptionWithUUID:(id)a3;
- (id)primaryThumperAccountUsingDevices:(id)a3 outgoingCallerIDURI:(id)a4 requireMatchingCallerIDURI:(BOOL)a5 requireAvailableDeviceSlots:(BOOL)a6;
- (id)secondaryThumperAccountForAccountID:(id)a3;
- (id)secondaryThumperAccountForRegisteredDeviceID:(id)a3;
- (id)telephonySubscriptionLabelIdentifierForSenderIdentityUUID:(id)a3;
- (void)_updateCallCapabilitiesForSubscription:(id)a3 capabilitiesState:(id)a4;
- (void)_updateEmergencyCallbackModeEnabledState;
- (void)_updateState;
- (void)_updateSubscriptions;
- (void)_updateSystemCapabilitiesStateForSubscription:(id)a3 capabilitiesState:(id)a4;
- (void)_updateThumperAccountState;
- (void)client:(id)a3 capabilitiesDidChange:(id)a4;
- (void)client:(id)a3 subscription:(id)a4 callCapabilitiesDidChange:(id)a5;
- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5;
- (void)emergencyCallbackModeDidChangeForAllSubscriptionsForClient:(id)a3;
- (void)endEmergencyCallbackMode;
- (void)invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshVoLTECallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)setAssociatedThumperAccountID:(id)a3;
- (void)setCallCapabilities:(id)a3 forSenderIdentityCapabilitiesState:(id)a4;
- (void)setCapabilitiesValid:(BOOL)a3;
- (void)setCapabilityInfo:(id)a3 forSubscription:(id)a4 senderIdentityCapabilitiesState:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setEmergencyCallbackModeEnabled:(BOOL)a3;
- (void)setLocalThumperAccounts:(id)a3;
- (void)setLocalThumperDeviceID:(id)a3;
- (void)setSecondaryThumperAccounts:(id)a3;
- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5;
- (void)setThumperCallingAssociatedAccountID:(id)a3;
- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4;
- (void)subscriptionsDidChangeForClient:(id)a3;
@end

@implementation CSDTelephonyCallCapabilities

- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = [[CSDCoreTelephonyClient alloc] initWithQueue:v4 shouldRegisterForECBMNotification:1];
  v6 = [[CSDEmergencyCallbackCapabilities alloc] initWithQueue:v4];
  v7 = [(CSDTelephonyCallCapabilities *)self initWithQueue:v4 coreTelephonyClient:v5 emergencyCallbackCapabilities:v6];

  return v7;
}

- (CSDTelephonyCallCapabilities)initWithQueue:(id)a3 coreTelephonyClient:(id)a4 emergencyCallbackCapabilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CSDTelephonyCallCapabilities;
  v12 = [(CSDTelephonyCallCapabilities *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    uint64_t v14 = +[NSSet set];
    subscriptions = v13->_subscriptions;
    v13->_subscriptions = (NSSet *)v14;

    senderIdentityCapabilitiesStateByUUID = v13->_senderIdentityCapabilitiesStateByUUID;
    v13->_senderIdentityCapabilitiesStateByUUID = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v17 = +[NSMutableDictionary dictionary];
    lastSavedAccountIDByCapability = v13->_lastSavedAccountIDByCapability;
    v13->_lastSavedAccountIDByCapability = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v13->_coreTelephonyClient, a4);
    [(CSDCoreTelephonyClient *)v13->_coreTelephonyClient setDelegate:v13];
    objc_storeStrong((id *)&v13->_emergencyCallbackCapabilities, a5);
    objc_initWeak(&location, v13);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1001A2858;
    v23[3] = &unk_100505698;
    objc_copyWeak(&v24, &location);
    [(CSDEmergencyCallbackCapabilities *)v13->_emergencyCallbackCapabilities setEmergencyCallbackCapabilitiesDidChange:v23];
    queue = v13->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001A28B0;
    block[3] = &unk_100504EC0;
    v22 = v13;
    dispatch_async(queue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p>\n", objc_opt_class(), self];
  id v4 = v3;
  if (self->_capabilitiesValid) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"    Are capabilities valid: %@\n", v5];
  v6 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  [v4 appendFormat:@"    Sender identity capabilities: %@\n", v6];

  v7 = [(CSDTelephonyCallCapabilities *)self emergencyCallbackCapabilities];
  [v4 appendFormat:@"    Emergency callback capabilities: %@\n", v7];

  v8 = [(CSDTelephonyCallCapabilities *)self localThumperDeviceID];
  [v4 appendFormat:@"    Thumper local device ID: %@\n", v8];

  id v9 = [(CSDTelephonyCallCapabilities *)self localThumperAccounts];
  [v4 appendFormat:@"    Thumper local accounts: %@\n", v9];

  id v10 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  [v4 appendFormat:@"    Thumper secondary accounts: %@\n", v10];

  return (NSString *)v4;
}

- (BOOL)areCapabilitiesValid
{
  v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_capabilitiesValid;
}

- (NSArray)localThumperAccounts
{
  v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  localThumperAccounts = self->_localThumperAccounts;

  return localThumperAccounts;
}

- (NSArray)secondaryThumperAccounts
{
  v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  secondaryThumperAccounts = self->_secondaryThumperAccounts;

  return secondaryThumperAccounts;
}

- (void)setSecondaryThumperAccounts:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = self->_secondaryThumperAccounts;
  if ((TUObjectsAreEqualOrNil() & 1) == 0)
  {
    v7 = (NSArray *)[v4 copy];
    secondaryThumperAccounts = self->_secondaryThumperAccounts;
    self->_secondaryThumperAccounts = v7;

    id v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = self->_secondaryThumperAccounts;
      int v11 = 138412546;
      v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Secondary Thumper accounts changed from %@ to %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (BOOL)isEmergencyCallbackModeEnabled
{
  v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_emergencyCallbackModeEnabled;
}

- (BOOL)isEmergencyCallbackPossible
{
  v2 = [(CSDTelephonyCallCapabilities *)self emergencyCallbackCapabilities];
  unsigned __int8 v3 = [v2 emergencyCallbackPossible];

  return v3;
}

- (id)primaryThumperAccountUsingDevices:(id)a3 outgoingCallerIDURI:(id)a4 requireMatchingCallerIDURI:(BOOL)a5 requireAvailableDeviceSlots:(BOOL)a6
{
  BOOL v51 = a6;
  id v8 = a3;
  id v50 = a4;
  id v9 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v9);

  id v10 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  v46 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v61;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v61 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v17 = [v16 uniqueIDOverride];

        if (v17)
        {
          v18 = [v16 uniqueIDOverride];
          [v46 setObject:v16 forKeyedSubscript:v18];
        }
        else
        {
          v18 = sub_100008DCC();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v67 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Skipping device %@ because uniqueIDOverride is nil", buf, 0xCu);
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v60 objects:v72 count:16];
    }
    while (v13);
  }

  v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v67 = v10;
    __int16 v68 = 2112;
    id v69 = v11;
    __int16 v70 = 2112;
    id v71 = v50;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Attempting to find primary Thumper account in accounts: %@ devices: %@ outgoingCallerIDURI: %@", buf, 0x20u);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v20 = v10;
  id v45 = [v20 countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (!v45)
  {

    v37 = 0;
    v35 = 0;
    id v21 = 0;
    v38 = 0;
    goto LABEL_52;
  }
  id obj = v20;
  id v21 = 0;
  v48 = 0;
  v49 = 0;
  uint64_t v44 = *(void *)v57;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v57 != v44) {
        objc_enumerationMutation(obj);
      }
      uint64_t v47 = v22;
      v23 = *(void **)(*((void *)&v56 + 1) + 8 * v22);
      id v24 = [v23 phoneNumberURI];
      v25 = [v23 primaryDeviceID];
      objc_super v26 = [v46 objectForKeyedSubscript:v25];

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v27 = [v26 linkedUserURIs];
      v28 = (char *)[v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v28)
      {
        v29 = v28;
        uint64_t v30 = *(void *)v53;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(void *)v53 != v30) {
              objc_enumerationMutation(v27);
            }
            if (TUStringsAreCaseInsensitiveEqual()
              && (!v51 || (uint64_t)[v23 availableDeviceSlots] >= 1))
            {
              id v32 = v23;

              if ([v26 isDefaultPairedDevice])
              {
                id v33 = v32;

                v48 = v33;
              }
              if (TUStringsAreCaseInsensitiveEqual())
              {
                id v21 = v32;

                v49 = v21;
              }
              else
              {
                id v21 = v32;
              }
            }
          }
          v29 = (char *)[v27 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v29);
      }

      uint64_t v22 = v47 + 1;
    }
    while ((id)(v47 + 1) != v45);
    id v45 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
  }
  while (v45);

  if (v48)
  {
    v34 = sub_100008DCC();
    v35 = v49;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v48;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Found default paired device; setting primary Thumper account to %@",
        buf,
        0xCu);
    }

    id v36 = v48;
    v37 = v36;
  }
  else if (v49)
  {
    v39 = sub_100008DCC();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v50;
      __int16 v68 = 2112;
      id v69 = v49;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Found matching outgoing caller ID %@; setting primary Thumper account to %@",
        buf,
        0x16u);
    }

    id v36 = v49;
    v35 = v36;
    v37 = 0;
  }
  else
  {
    v37 = 0;
    if (!v21 || a5)
    {
      v35 = 0;
      v38 = 0;
      goto LABEL_51;
    }
    v40 = sub_100008DCC();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v67 = v50;
      __int16 v68 = 2112;
      id v69 = obj;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "No primary Thumper account found for outgoingRelayCallerID %@ but requireMatchingCallerID is NO. Arbitrarily choosing last Thumper account from list: %@", buf, 0x16u);
    }

    id v36 = v21;
    id v21 = v36;
    v37 = 0;
    v35 = 0;
  }
  v38 = v36;
LABEL_51:
  id v20 = obj;
LABEL_52:

  return v38;
}

- (void)setVoLTECallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v6];
  if (v8)
  {
    id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    [v9 setSubscription:v8 capability:kCTCapabilityAgent enabled:v4 info:0];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CSDTelephonyCallCapabilities *)self subscriptions];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find subscription with UUID %@. All subscriptions: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)setWiFiCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v6];
  if (v8)
  {
    id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    [v9 setSubscription:v8 capability:kCTCapabilityAgent2 enabled:v4 info:0];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CSDTelephonyCallCapabilities *)self subscriptions];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find subscription with UUID %@. All subscriptions: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)setWiFiCallingRoamingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v6];
  if (v8)
  {
    id v9 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
    id v10 = [v9 objectForKeyedSubscript:v6];

    id v11 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    uint64_t v12 = kCTCapabilityAgent2;
    id v13 = [v10 wiFiCallingCapabilitiesState];
    id v14 = [v13 isEnabled];
    uint64_t v22 = kPSWifiCallingRoamingEnabled;
    v15 = +[NSNumber numberWithBool:v4];
    v23 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v11 setSubscription:v8 capability:v12 enabled:v14 info:v16];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [(CSDTelephonyCallCapabilities *)self subscriptions];
      int v18 = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v17;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find subscription with UUID %@. All subscriptions: %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)setThumperCallingEnabled:(BOOL)a3 forSenderIdentityWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v6];
  if (v8)
  {
    id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    [v9 setSubscription:v8 capability:kCTCapabilityPhoneServices enabled:v4 info:0];
  }
  else
  {
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(CSDTelephonyCallCapabilities *)self subscriptions];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find subscription with UUID %@. All subscriptions: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (NSString)associatedThumperAccountID
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(CSDTelephonyCallCapabilities *)self lastSavedAccountIDByCapability];
  CFStringRef v5 = [v4 objectForKeyedSubscript:kPSAssociatedAccountID];

  return (NSString *)v5;
}

- (void)setAssociatedThumperAccountID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = kPSAssociatedAccountID;
  v7 = [(CSDTelephonyCallCapabilities *)self lastSavedAccountIDByCapability];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if ((TUStringsAreEqualOrNil() & 1) == 0)
  {
    id v9 = [(CSDTelephonyCallCapabilities *)self lastSavedAccountIDByCapability];
    [v9 setObject:v4 forKeyedSubscript:v6];

    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      int v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Associated Thumper account ID changed from \"%@\" to \"%@\"", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)setThumperCallingAssociatedAccountID:(id)a3
{
  id v4 = (__CFString *)a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDTelephonyCallCapabilities *)self associatedThumperAccountID];
  v7 = sub_100008DCC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v4;
    __int16 v17 = 2112;
    int v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Comparing specified Thumper account ID %@ to cached associated Thumper account ID %@", buf, 0x16u);
  }

  if ((TUStringsAreCaseInsensitiveEqualOrNil() & 1) == 0)
  {
    id v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending CommCenter a request to set associated Thumper account ID to \"%@\"", buf, 0xCu);
    }

    id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    uint64_t v10 = kCTCapabilityPhoneServices;
    if (v4) {
      CFStringRef v11 = v4;
    }
    else {
      CFStringRef v11 = &stru_100517F40;
    }
    uint64_t v13 = kPSAssociatedAccountID;
    CFStringRef v14 = v11;
    int v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v9 setCapability:v10 enabled:0 info:v12];
  }
}

- (void)setThumperCallingAllowed:(BOOL)a3 onSecondaryDeviceWithID:(id)a4 forSenderIdentityWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v10);

  CFStringRef v11 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v9];
  if (v11)
  {
    int v12 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
    uint64_t v13 = v12;
    if (v6) {
      [v12 addSecondaryThumperDeviceWithIDSDeviceIdentifier:v8 toSubscription:v11];
    }
    else {
      [v12 removeSecondaryThumperDeviceWithIDSDeviceIdentifier:v8 fromSubscription:v11];
    }
  }
  else
  {
    CFStringRef v14 = sub_100008DCC();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [(CSDTelephonyCallCapabilities *)self subscriptions];
      int v16 = 138412546;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find subscription with UUID %@. All subscriptions: %@", (uint8_t *)&v16, 0x16u);
    }
  }
}

- (void)invalidateAndRefreshWiFiCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  id v11 = [v6 objectForKeyedSubscript:v4];

  v7 = [v11 wiFiCallingCapabilitiesState];
  [v7 invalidateProvisioningURL];

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v4];

  id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityAgent2];

  uint64_t v10 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)invalidateAndRefreshVoLTECallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  id v11 = [v6 objectForKeyedSubscript:v4];

  v7 = [v11 voLTECallingCapabilitiesState];
  [v7 invalidateProvisioningURL];

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v4];

  id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityAgent];

  uint64_t v10 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)invalidateAndRefreshThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  BOOL v6 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  id v11 = [v6 objectForKeyedSubscript:v4];

  v7 = [v11 thumperCallingCapabilitiesState];
  [v7 invalidateProvisioningURL];

  id v8 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:v4];

  id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  [v9 recheckAccountStatusForSubscription:v8 capability:kCTCapabilityPhoneServices];

  uint64_t v10 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v10 telephonyCallCapabilitiesChanged];
}

- (void)endEmergencyCallbackMode
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  [v4 endEmergencyCallbackMode];
}

- (id)secondaryThumperAccountForAccountID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v6 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 accountID];
        int v12 = TUStringsAreCaseInsensitiveEqual();

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)secondaryThumperAccountForRegisteredDeviceID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v6 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 containsRegisteredDeviceID:v4])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)telephonySubscriptionLabelIdentifierForSenderIdentityUUID:(id)a3
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self _subscriptionWithUUID:a3];
  id v4 = [v3 labelID];

  return v4;
}

- (void)setCallCapabilities:(id)a3 forSenderIdentityCapabilitiesState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 isCSCallingAvailable];
  uint64_t v10 = [v6 csCallingCapabilitiesState];
  [v10 setCurrentlyAvailable:v9];

  id v11 = [v7 isVoLTECallingAvailable];
  long long v12 = [v6 voLTECallingCapabilitiesState];
  [v12 setCurrentlyAvailable:v11];

  id v13 = [v7 isWiFiCallingAvailable];
  long long v14 = [v6 wiFiCallingCapabilitiesState];
  [v14 setCurrentlyAvailable:v13];

  id v15 = [v7 isWiFiCallingAvailable];
  long long v16 = [v6 thumperCallingCapabilitiesState];
  [v16 setCurrentlyAvailable:v15];

  id v17 = [v7 isWiFiEmergencyCallingAllowed];
  __int16 v18 = [v6 wiFiCallingCapabilitiesState];
  [v18 setEmergencySupported:v17];

  id v19 = [v7 isWiFiEmergencyCallingAvailable];
  id v20 = [v6 wiFiCallingCapabilitiesState];

  [v20 setEmergencyCurrentlyAvailable:v19];
}

- (void)setCapabilityInfo:(id)a3 forSubscription:(id)a4 senderIdentityCapabilitiesState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v11);

  long long v12 = sub_100008DCC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received request to set capability information %@ capabilityInfo for subscription %@", buf, 0x16u);
  }

  id v13 = [v8 objectForKeyedSubscript:kCTCapabilityAgent];
  if (v13)
  {
    id v14 = [objc_alloc((Class)TUCTCapabilitiesState) initWithCapabilityInfo:v13];
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating VoLTE capability state with %@", buf, 0xCu);
    }

    [v10 setVoLTECallingCapabilitiesState:v14];
  }
  long long v16 = [v8 objectForKeyedSubscript:kCTCapabilityAgent2];
  if (v16)
  {
    id v17 = [objc_alloc((Class)TUCTCapabilitiesState) initWithCapabilityInfo:v16];
    __int16 v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating VoWiFi capability state with %@", buf, 0xCu);
    }

    [v10 setWiFiCallingCapabilitiesState:v17];
  }
  id v19 = [v8 objectForKeyedSubscript:kCTCapabilityPhoneServices];
  if (v19)
  {
    id v20 = [objc_alloc((Class)TUThumperCTCapabilitiesState) initWithCapabilityInfo:v19];
    id v21 = [v20 accountID];
    uint64_t v22 = [(CSDTelephonyCallCapabilities *)self associatedThumperAccountID];
    [v20 setAssociated:TUStringsAreCaseInsensitiveEqual()];

    if ([v20 isEnabled])
    {
      id v32 = v9;
      v23 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
      id v24 = [v23 telephonySubscriptions];
      id v25 = [v24 count];
      if (v25 == (id)1 || !objc_msgSend(v32, "csd_isTelephony"))
      {
        [v20 setSupportsDefaultPairedDevice:v25 == (id)1];
      }
      else
      {
        v31 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
        uint64_t v30 = [v31 preferredVoiceSubscriptionUUID];
        objc_super v26 = [v32 uuid];
        objc_msgSend(v20, "setSupportsDefaultPairedDevice:", objc_msgSend(v30, "isEqual:"));
      }
      id v9 = v32;
    }
    else
    {
      [v20 setSupportsDefaultPairedDevice:0];
    }
    v27 = sub_100008DCC();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updating Thumper capability state with %@", buf, 0xCu);
    }

    [v10 setThumperCallingCapabilitiesState:v20];
  }
  uint64_t v28 = [v8 objectForKeyedSubscript:kSimultaneousCallAndDataCurrentlySupported];
  uint64_t v29 = [v8 objectForKeyedSubscript:kSuspendInternetOnBBCall];
  if (v28 | v29) {
    [(CSDTelephonyCallCapabilities *)self _updateSystemCapabilitiesStateForSubscription:v9 capabilitiesState:v10];
  }
  if (v13 || v16 || v19) {
    [(CSDTelephonyCallCapabilities *)self _updateCallCapabilitiesForSubscription:v9 capabilitiesState:v10];
  }
}

- (id)_subscriptionWithUUID:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CSDTelephonyCallCapabilities *)self subscriptions];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 uuid];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_updateState
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDTelephonyCallCapabilities *)self _updateThumperAccountState];

  [(CSDTelephonyCallCapabilities *)self _updateSubscriptions];
}

- (void)_updateSubscriptions
{
  v2 = self;
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDTelephonyCallCapabilities *)v2 coreTelephonyClient];
  CFStringRef v5 = [v4 subscriptions];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSSet set];
  }
  uint64_t v8 = v7;

  long long v53 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v8 count]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v14 = [v13 uuid];
        long long v15 = [(CSDTelephonyCallCapabilities *)v2 _senderIdentityCapabilitiesStateForSubscription:v13];
        if (v15)
        {
          [(CSDTelephonyCallCapabilities *)v2 _updateSystemCapabilitiesStateForSubscription:v13 capabilitiesState:v15];
          [v53 setObject:v15 forKeyedSubscript:v14];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
    }
    while (v10);
  }

  v46 = +[NSMutableSet set];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v47 = [(CSDTelephonyCallCapabilities *)v2 secondaryThumperAccounts];
  id v52 = [v47 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v59;
    v49 = v2;
    do
    {
      for (j = 0; j != v52; j = (char *)j + 1)
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(v47);
        }
        long long v17 = *(void **)(*((void *)&v58 + 1) + 8 * (void)j);
        __int16 v18 = [v17 accountID];
        if ([v18 length])
        {
          id v50 = v17;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v19 = [v53 allValues];
          id v20 = [v19 countByEnumeratingWithState:&v54 objects:v66 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v55;
LABEL_21:
            uint64_t v23 = 0;
            while (1)
            {
              if (*(void *)v55 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
              id v25 = [v24 thumperCallingCapabilitiesState];
              objc_super v26 = [v25 accountID];
              char v27 = TUStringsAreCaseInsensitiveEqualOrNil();

              if (v27) {
                break;
              }
              if (v21 == (id)++v23)
              {
                id v21 = [v19 countByEnumeratingWithState:&v54 objects:v66 count:16];
                v2 = v49;
                if (v21) {
                  goto LABEL_21;
                }
                goto LABEL_27;
              }
            }
            id v28 = v24;

            v2 = v49;
            if (v28) {
              goto LABEL_32;
            }
          }
          else
          {
LABEL_27:
          }
          uint64_t v29 = +[CTXPCContextInfo csd_unknownContextInfoForAccountID:v18];
          if (v29)
          {
            [v46 addObject:v29];
            id v30 = objc_alloc((Class)TUSenderIdentityCapabilitiesState);
            v31 = [v29 uuid];
            id v32 = [v30 initWithSenderIdentityUUID:v31];

            id v33 = [v50 accountID];
            id v34 = [v32 thumperCallingCapabilitiesState];
            [v34 setAccountID:v33];

            __int16 v35 = [v50 allowedSecondaryDeviceIDs];
            id v36 = [v32 thumperCallingCapabilitiesState];
            [v36 setApprovedSecondaryDeviceIDs:v35];

            v37 = [v50 accountID];
            v38 = [(CSDTelephonyCallCapabilities *)v2 associatedThumperAccountID];
            uint64_t v39 = TUStringsAreCaseInsensitiveEqual();
            v40 = [v32 thumperCallingCapabilitiesState];
            [v40 setAssociated:v39];

            v41 = [v50 primaryDeviceID];
            v42 = [v32 thumperCallingCapabilitiesState];
            [v42 setLocalDeviceID:v41];

            v43 = [v32 thumperCallingCapabilitiesState];
            [v43 setSupported:1];

            uint64_t v44 = [v32 senderIdentityUUID];
            [v53 setObject:v32 forKeyedSubscript:v44];
          }
          id v28 = 0;
LABEL_32:
        }
      }
      id v52 = [v47 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v52);
  }

  id v45 = [obj setByAddingObjectsFromSet:v46];
  [(CSDTelephonyCallCapabilities *)v2 setSubscriptions:v45];

  [(CSDTelephonyCallCapabilities *)v2 setSenderIdentityCapabilitiesStateByUUID:v53];
  [(CSDTelephonyCallCapabilities *)v2 _updateEmergencyCallbackModeEnabledState];
}

- (void)_updateCallCapabilitiesForSubscription:(id)a3 capabilitiesState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  id v10 = [v9 callCapabilitiesForSubscription:v6];

  uint64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    long long v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrieved new telephony call capabilities for subscription %@: %@", (uint8_t *)&v12, 0x16u);
  }

  [(CSDTelephonyCallCapabilities *)self setCallCapabilities:v10 forSenderIdentityCapabilitiesState:v7];
}

- (id)_senderIdentityCapabilitiesStateForSubscription:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = +[NSMutableDictionary dictionary];
  uint64_t v7 = kCTCapabilityAgent;
  uint64_t v8 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  id v9 = [v8 capabilityInfoForSubscription:v4 capability:v7];
  [v6 setObject:v9 forKeyedSubscript:v7];

  uint64_t v10 = kCTCapabilityAgent2;
  uint64_t v11 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  int v12 = [v11 capabilityInfoForSubscription:v4 capability:v10];
  [v6 setObject:v12 forKeyedSubscript:v10];

  uint64_t v13 = kCTCapabilityPhoneServices;
  __int16 v14 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  long long v15 = [v14 capabilityInfoForSubscription:v4 capability:v13];
  [v6 setObject:v15 forKeyedSubscript:v13];

  if ([v6 count])
  {
    id v16 = objc_alloc((Class)TUSenderIdentityCapabilitiesState);
    long long v17 = [v4 uuid];
    id v18 = [v16 initWithSenderIdentityUUID:v17];

    [(CSDTelephonyCallCapabilities *)self setCapabilityInfo:v6 forSubscription:v4 senderIdentityCapabilitiesState:v18];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_updateSystemCapabilitiesStateForSubscription:(id)a3 capabilitiesState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  uint64_t v10 = [v9 systemCapabilitiesForSubscription:v6];

  uint64_t v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    long long v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Retrieved new system capabilities for subscription %@: %@", (uint8_t *)&v14, 0x16u);
  }

  int v12 = [v10 objectForKeyedSubscript:kSimultaneousCallAndDataCurrentlySupported];
  if ([v12 BOOLValue])
  {
    uint64_t v13 = [v10 objectForKeyedSubscript:kSuspendInternetOnBBCall];
    objc_msgSend(v7, "setSupportsSimultaneousVoiceAndData:", objc_msgSend(v13, "BOOLValue") ^ 1);
  }
  else
  {
    [v7 setSupportsSimultaneousVoiceAndData:0];
  }
}

- (void)_updateEmergencyCallbackModeEnabledState
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  id v5 = [v4 isEmergencyCallbackModeEnabled];

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"disabled";
    if (v5) {
      CFStringRef v7 = @"enabled";
    }
    int v8 = 138412290;
    CFStringRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Setting new emergency callback mode %@.", (uint8_t *)&v8, 0xCu);
  }

  [(CSDTelephonyCallCapabilities *)self setEmergencyCallbackModeEnabled:v5];
}

- (void)_updateThumperAccountState
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v3);

  id v45 = self;
  id v4 = [(CSDTelephonyCallCapabilities *)self coreTelephonyClient];
  id v5 = [v4 thumperDeviceInfo];

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v59 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating Thumper account state with %@", buf, 0xCu);
  }

  [(CSDTelephonyCallCapabilities *)v45 setCapabilitiesValid:v5 != 0];
  CFStringRef v7 = [(CSDThumperAccount *)v5 objectForKeyedSubscript:kPSDeviceId];
  objc_opt_class();
  v42 = v7;
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v7 uppercaseString];
    CFStringRef v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v59 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updated local Thumper device ID to %@", buf, 0xCu);
    }

    [(CSDTelephonyCallCapabilities *)v45 setLocalThumperDeviceID:v8];
  }
  else
  {
    int v8 = 0;
  }
  id v47 = +[NSMutableArray array];
  v46 = +[NSMutableArray array];
  uint64_t v10 = [(CSDThumperAccount *)v5 objectForKeyedSubscript:kPSThumperCalling];

  uint64_t v44 = v5;
  uint64_t v11 = [(CSDThumperAccount *)v5 objectForKeyedSubscript:kPSAccountList];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v12 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v53;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(v11);
        }
        __int16 v16 = *(CSDThumperAccount **)(*((void *)&v52 + 1) + 8 * (void)v15);
        long long v17 = [[CSDThumperAccount alloc] initWithDictionaryRepresentation:v16];
        id v18 = v17;
        if (v17)
        {
          id v19 = [(CSDThumperAccount *)v17 primaryDeviceID];
          int v20 = TUStringsAreCaseInsensitiveEqual();

          if (v20)
          {
            id v21 = v47;
LABEL_23:
            [(CSDThumperAccount *)v21 addObject:v18];
            goto LABEL_24;
          }
          uint64_t v23 = sub_100008DCC();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (v10)
          {
            if (v24)
            {
              *(_DWORD *)buf = 138412290;
              long long v59 = v18;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Adding thumperAccount %@ to secondaryThumperAccounts", buf, 0xCu);
            }

            id v21 = v46;
            goto LABEL_23;
          }
          if (v24)
          {
            *(_DWORD *)buf = 138412290;
            long long v59 = v18;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Not adding thumperAccount %@ to accounts list", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v22 = sub_100008DCC();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v59 = v16;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Could not initialize Thumper account with Thumper account dictionary: %@", buf, 0xCu);
          }
        }
LABEL_24:

        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v25 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
      id v13 = v25;
    }
    while (v25);
  }
  objc_super v26 = [(CSDThumperAccount *)v47 sortedArrayUsingComparator:&stru_1005096E0];
  [(CSDTelephonyCallCapabilities *)v45 setLocalThumperAccounts:v26];

  char v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v59 = v47;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Updated local Thumper accounts to %@", buf, 0xCu);
  }

  id v28 = [(CSDThumperAccount *)v46 sortedArrayUsingComparator:&stru_100509700];
  [(CSDTelephonyCallCapabilities *)v45 setSecondaryThumperAccounts:v28];

  uint64_t v29 = sub_100008DCC();
  id v30 = v44;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v59 = v46;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Updated secondary Thumper accounts to %@", buf, 0xCu);
  }

  id v31 = kPSAssociatedAccountID;
  id v32 = [(CSDThumperAccount *)v44 objectForKeyedSubscript:v31];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CSDTelephonyCallCapabilities *)v45 setAssociatedThumperAccountID:v32];
    id v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v59 = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Found associated Thumper account ID; updated associated Thumper account ID to %@",
        buf,
        0xCu);
    }
LABEL_50:

    goto LABEL_51;
  }
  if ([(CSDThumperAccount *)v8 length])
  {
    id v33 = [(CSDTelephonyCallCapabilities *)v45 secondaryThumperAccounts];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v34 = [v33 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v34)
    {
      id v35 = v34;
      id v41 = v31;
      v43 = v32;
      uint64_t v36 = *(void *)v49;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          if (objc_msgSend(v38, "containsRegisteredDeviceID:", v8, v41))
          {
            uint64_t v39 = [v38 accountID];
            [(CSDTelephonyCallCapabilities *)v45 setAssociatedThumperAccountID:v39];
            v40 = sub_100008DCC();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              long long v59 = v39;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Found matching secondary Thumper account; updated associated Thumper account ID to %@",
                buf,
                0xCu);
            }
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v35);
      id v32 = v43;
      id v30 = v44;
      id v31 = v41;
    }
    goto LABEL_50;
  }
LABEL_51:
}

- (void)subscriptionsDidChangeForClient:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100008DCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Subscriptions changed for client: %@", (uint8_t *)&v8, 0xCu);
  }

  [(CSDTelephonyCallCapabilities *)self _updateSubscriptions];
  CFStringRef v7 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v7 telephonyCallCapabilitiesChanged];
}

- (void)client:(id)a3 subscription:(id)a4 callCapabilitiesDidChange:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  int v8 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  uint64_t v10 = [v7 uuid];

  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    [(CSDTelephonyCallCapabilities *)self setCallCapabilities:v13 forSenderIdentityCapabilitiesState:v11];
    id v12 = [(CSDTelephonyCallCapabilities *)self delegate];
    [v12 telephonyCallCapabilitiesChanged];
  }
}

- (void)client:(id)a3 capabilitiesDidChange:(id)a4
{
  id v5 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CSDTelephonyCallCapabilities *)self shouldUpdateSubscriptions])
  {
    [(CSDTelephonyCallCapabilities *)self _updateSubscriptions];
    id v6 = [(CSDTelephonyCallCapabilities *)self delegate];
    [v6 telephonyCallCapabilitiesChanged];
  }
}

- (void)client:(id)a3 subscription:(id)a4 capabilitiesDidChange:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  int v8 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(CSDTelephonyCallCapabilities *)self senderIdentityCapabilitiesStateByUUID];
  uint64_t v10 = [v13 uuid];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if ([(CSDTelephonyCallCapabilities *)self shouldUpdateSubscriptions] || !v11) {
    [(CSDTelephonyCallCapabilities *)self _updateSubscriptions];
  }
  else {
    [(CSDTelephonyCallCapabilities *)self setCapabilityInfo:v7 forSubscription:v13 senderIdentityCapabilitiesState:v11];
  }
  id v12 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v12 telephonyCallCapabilitiesChanged];
}

- (void)emergencyCallbackModeDidChangeForAllSubscriptionsForClient:(id)a3
{
  id v4 = [(CSDTelephonyCallCapabilities *)self queue];
  dispatch_assert_queue_V2(v4);

  [(CSDTelephonyCallCapabilities *)self _updateEmergencyCallbackModeEnabledState];
  id v5 = [(CSDTelephonyCallCapabilities *)self delegate];
  [v5 telephonyCallCapabilitiesChanged];
}

- (BOOL)shouldUpdateSubscriptions
{
  unsigned __int8 v3 = [(CSDTelephonyCallCapabilities *)self associatedThumperAccountID];
  id v4 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  [(CSDTelephonyCallCapabilities *)self _updateThumperAccountState];
  id v5 = [(CSDTelephonyCallCapabilities *)self associatedThumperAccountID];
  id v6 = [(CSDTelephonyCallCapabilities *)self secondaryThumperAccounts];
  if ((TUStringsAreCaseInsensitiveEqualOrNil() & 1) == 0)
  {
    int v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v9 = "Subscription cache requires an update; associated Thumper account ID changed";
      uint64_t v10 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
LABEL_9:

    BOOL v7 = 1;
    goto LABEL_10;
  }
  if (([v4 isEqualToArray:v6] & 1) == 0)
  {
    int v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v9 = "Subscription cache requires an update; secondary Thumper accounts changed";
      uint64_t v10 = (uint8_t *)&v12;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  BOOL v7 = 0;
LABEL_10:

  return v7;
}

- (CSDTelephonyCallCapabilitiesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDTelephonyCallCapabilitiesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setCapabilitiesValid:(BOOL)a3
{
  self->_capabilitiesValid = a3;
}

- (NSDictionary)senderIdentityCapabilitiesStateByUUID
{
  return self->_senderIdentityCapabilitiesStateByUUID;
}

- (void)setSenderIdentityCapabilitiesStateByUUID:(id)a3
{
}

- (NSString)localThumperDeviceID
{
  return self->_localThumperDeviceID;
}

- (void)setLocalThumperDeviceID:(id)a3
{
}

- (void)setLocalThumperAccounts:(id)a3
{
}

- (void)setEmergencyCallbackModeEnabled:(BOOL)a3
{
  self->_emergencyCallbackModeEnabled = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSSet)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSMutableDictionary)lastSavedAccountIDByCapability
{
  return self->_lastSavedAccountIDByCapability;
}

- (CSDCoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (CSDEmergencyCallbackCapabilities)emergencyCallbackCapabilities
{
  return self->_emergencyCallbackCapabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emergencyCallbackCapabilities, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_lastSavedAccountIDByCapability, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localThumperAccounts, 0);
  objc_storeStrong((id *)&self->_localThumperDeviceID, 0);
  objc_storeStrong((id *)&self->_senderIdentityCapabilitiesStateByUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_secondaryThumperAccounts, 0);
}

@end