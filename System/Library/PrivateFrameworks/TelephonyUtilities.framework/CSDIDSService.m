@interface CSDIDSService
+ (CSDIDSService)sharedInstance;
- (BOOL)checkValidityForSelfPseudonymString:(id)a3;
- (BOOL)defaultPairedDeviceExists;
- (BOOL)hasActiveAccounts;
- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3;
- (BOOL)pairedDeviceExists;
- (BOOL)relayCapableDeviceExists;
- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9;
- (BOOL)telephonyCapableDeviceExists;
- (CSDIDSService)initWithName:(id)a3;
- (CSDIDSService)initWithName:(id)a3 service:(id)a4;
- (CSDIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5;
- (IDSAccount)account;
- (IDSAccountController)accountController;
- (IDSDevice)defaultPairedDevice;
- (IDSDevice)pairedDevice;
- (IDSIDQueryController)idsQueryController;
- (IDSService)idsService;
- (IDSServicePseudonymDelegate)delegate;
- (NSArray)allAliases;
- (NSArray)devices;
- (NSSet)aliases;
- (NSSet)availableOutgoingRelayCallerIDs;
- (NSString)callerID;
- (NSString)countryCode;
- (NSString)debugDescription;
- (NSString)localDeviceUniqueID;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (id)accountForTelephonySubscriptionLabelIdentifier:(id)a3;
- (id)accountWithCallerID:(id)a3;
- (id)anyActiveAccount;
- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13;
- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4;
- (id)deviceForFromID:(id)a3;
- (id)deviceWithUniqueID:(id)a3;
- (id)devicesWithCapability:(id)a3;
- (id)idsDeviceID;
- (id)pseudonymForPseudonymString:(id)a3;
- (unint64_t)registrationRestrictionReason;
- (void)_noteAction:(int64_t)a3 onHandle:(id)a4 completionHandle:(id)a5;
- (void)_update;
- (void)accountController:(id)a3 accountAdded:(id)a4;
- (void)accountController:(id)a3 accountDisabled:(id)a4;
- (void)accountController:(id)a3 accountEnabled:(id)a4;
- (void)accountController:(id)a3 accountRemoved:(id)a4;
- (void)addFirewallEntriesForHandleToDate:(id)a3;
- (void)addFirewallEntriesForHandles:(id)a3 lastSeenDate:(id)a4;
- (void)addFirewallEntryForHandle:(id)a3 lastSeenDate:(id)a4;
- (void)addServiceDelegate:(id)a3 queue:(id)a4;
- (void)checkValidityForPseudonymString:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleActiveAccountsChanged:(id)a3;
- (void)noteApprovedHandle:(id)a3 completionHandle:(id)a4;
- (void)noteDismissedHandle:(id)a3 completionHandle:(id)a4;
- (void)provisionPseudonymForHandle:(id)a3 featureID:(id)a4 scopeID:(id)a5 expiryDuration:(double)a6 allowedServices:(id)a7 completionHandler:(id)a8;
- (void)removeAllFirewallEntries;
- (void)removeFirewallEntries:(id)a3;
- (void)removeServiceDelegate:(id)a3;
- (void)renewPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)renewPseudonymString:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5;
- (void)retrieveFirewallAndAddEntries:(id)a3;
- (void)revokePseudonym:(id)a3 completionHandler:(id)a4;
- (void)revokePseudonymString:(id)a3 completionHandler:(id)a4;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 didUpdatePseudonymsWithChanges:(id)a4;
- (void)service:(id)a3 nearbyDevicesChanged:(id)a4;
- (void)setAvailableOutgoingRelayCallerIDs:(id)a3;
- (void)setDefaultPairedDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setIdsQueryController:(id)a3;
- (void)setPairedDevice:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRelayCapableDeviceExists:(BOOL)a3;
- (void)setTelephonyCapableDeviceExists:(BOOL)a3;
- (void)update;
@end

@implementation CSDIDSService

+ (CSDIDSService)sharedInstance
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CSDIDSService.m" lineNumber:66 description:@"All CSDIDSService subclasses must override +sharedInstance"];

  return 0;
}

- (CSDIDSService)initWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)IDSService) initWithService:v4];
  v6 = [(CSDIDSService *)self initWithName:v4 service:v5];

  return v6;
}

- (CSDIDSService)initWithName:(id)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IDSIDQueryController sharedInstance];
  v9 = [(CSDIDSService *)self initWithName:v7 service:v6 queryController:v8];

  return v9;
}

- (CSDIDSService)initWithName:(id)a3 service:(id)a4 queryController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)CSDIDSService;
  v11 = [(CSDIDSService *)&v34 init];
  if (v11)
  {
    id v12 = +[NSString stringWithFormat:@"com.apple.telephonyutilities.callservicesd.%@", objc_opt_class()];
    dispatch_queue_t v13 = dispatch_queue_create((const char *)[v12 UTF8String], 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    v15 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v15;

    v17 = (IDSAccountController *)[objc_alloc((Class)IDSAccountController) initWithService:v8];
    accountController = v11->_accountController;
    v11->_accountController = v17;

    [(IDSAccountController *)v11->_accountController addDelegate:v11 queue:v11->_queue];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v19 = [(IDSAccountController *)v11->_accountController accounts];
    id v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)v23) addRegistrationDelegate:v11 queue:v11->_queue];
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        id v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v21);
    }

    objc_storeStrong((id *)&v11->_idsService, a4);
    objc_storeStrong((id *)&v11->_idsQueryController, a5);
    v24 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v11->_featureFlags;
    v11->_featureFlags = v24;

    [(CSDIDSService *)v11 addServiceDelegate:v11 queue:v11->_queue];
    v26 = v11->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001C7C44;
    block[3] = &unk_100504EC0;
    v29 = v11;
    dispatch_async(v26, block);
  }
  return v11;
}

- (NSString)callerID
{
  return 0;
}

- (void)dealloc
{
  v3 = [(CSDIDSService *)self idsService];
  [v3 removeDelegate:self];

  v4.receiver = self;
  v4.super_class = (Class)CSDIDSService;
  [(CSDIDSService *)&v4 dealloc];
}

- (NSString)debugDescription
{
  v3 = +[NSMutableString stringWithFormat:@"%@\n", self];
  objc_super v4 = [(CSDIDSService *)self devices];
  [v3 appendFormat:@"    devices: %@\n", v4];

  id v5 = [(CSDIDSService *)self availableOutgoingRelayCallerIDs];
  [v3 appendFormat:@"    availableOutgoingRelayCallerIDs: %@\n", v5];

  id v6 = [(CSDIDSService *)self defaultPairedDevice];
  [v3 appendFormat:@"    defaultPairedDevice: %@\n", v6];

  id v7 = [(CSDIDSService *)self pairedDevice];
  [v3 appendFormat:@"    pairedDevice: %@\n", v7];

  if ([(CSDIDSService *)self telephonyCapableDeviceExists]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  [v3 appendFormat:@"    telephonyCapableDeviceExists: %@\n", v8];
  if ([(CSDIDSService *)self relayCapableDeviceExists]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v3 appendFormat:@"    relayCapableDeviceExists: %@\n", v9];

  return (NSString *)v3;
}

- (NSArray)allAliases
{
  v3 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v4 = [(CSDIDSService *)self idsService];
  id v5 = [v4 accounts];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) vettedAliases];
        [v3 addObjectsFromArray:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v3 copy];

  return (NSArray *)v11;
}

- (id)anyActiveAccount
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(CSDIDSService *)self idsService];
  v3 = [v2 accounts];

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 canSend])
        {
          id v10 = v9;

          id v6 = v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)hasActiveAccounts
{
  v2 = [(CSDIDSService *)self idsService];
  v3 = [v2 accounts];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)accountWithCallerID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self anyActiveAccount];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [(CSDIDSService *)self idsService];
    CFStringRef v9 = [v8 accounts];
    id v7 = [v9 anyObject];
  }
  if (!v4)
  {
    long long v14 = 0;
    goto LABEL_41;
  }
  id v34 = v7;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = [(CSDIDSService *)self idsService];
  id v11 = [v10 accounts];

  id v12 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v12)
  {
    long long v14 = 0;
    goto LABEL_40;
  }
  id v13 = v12;
  long long v14 = 0;
  uint64_t v15 = *(void *)v48;
  uint64_t v35 = *(void *)v48;
  v36 = v11;
  do
  {
    long long v16 = 0;
    id v38 = v13;
    do
    {
      if (*(void *)v48 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v47 + 1) + 8 * (void)v16);
      if ([v17 canSend] && objc_msgSend(v4, "destinationIdIsPseudonym"))
      {
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v18 = [v17 pseudonyms];
        id v19 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
        if (v19)
        {
          id v20 = v19;
          v37 = v14;
          uint64_t v21 = *(void *)v44;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v44 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = [*(id *)(*((void *)&v43 + 1) + 8 * i) URI];
              v24 = [v23 prefixedURI];
              unsigned __int8 v25 = [v24 isEqualToString:v4];

              if (v25)
              {
                id v11 = v36;
                long long v14 = v37;
                uint64_t v15 = v35;
                goto LABEL_32;
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v43 objects:v52 count:16];
            if (v20) {
              continue;
            }
            break;
          }
          id v11 = v36;
          long long v14 = v37;
          uint64_t v15 = v35;
LABEL_33:
          id v13 = v38;
        }
      }
      else
      {
        if (![v17 canSend]) {
          goto LABEL_35;
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        v18 = [v17 aliasStrings];
        id v26 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v40;
          while (2)
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v18);
              }
              if ([*(id *)(*((void *)&v39 + 1) + 8 * (void)j) isEqualToString:v4])
              {
LABEL_32:
                id v30 = v17;

                long long v14 = v30;
                goto LABEL_33;
              }
            }
            id v27 = [v18 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v27) {
              continue;
            }
            goto LABEL_33;
          }
        }
      }

LABEL_35:
      long long v16 = (char *)v16 + 1;
    }
    while (v16 != v13);
    id v13 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
  }
  while (v13);
LABEL_40:

  id v7 = v34;
LABEL_41:
  if (v14) {
    long long v31 = v14;
  }
  else {
    long long v31 = v7;
  }
  id v32 = v31;

  return v32;
}

- (IDSAccount)account
{
  v3 = [(CSDIDSService *)self callerID];
  id v4 = [(CSDIDSService *)self accountWithCallerID:v3];

  return (IDSAccount *)v4;
}

- (id)idsDeviceID
{
  v2 = [(CSDIDSService *)self account];
  v3 = [v2 loginID];
  id v4 = [v3 IDSFormattedDestinationID];

  return v4;
}

- (void)addServiceDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDIDSService *)self idsService];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeServiceDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self idsService];
  [v5 removeDelegate:v4];
}

- (BOOL)sendData:(id)a3 fromAccount:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a4;
  id v18 = [a7 mutableCopy];
  id v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = objc_alloc_init((Class)NSMutableDictionary);
  }
  uint64_t v21 = v20;

  uint64_t v22 = [[CSDMessagingConversationMessage alloc] initWithData:v15];
  v23 = v22;
  if (v22 && [(CSDMessagingConversationMessage *)v22 type] >= 30)
  {
    int64_t v35 = a6;
    v36 = a8;
    uint64_t v24 = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    uint64_t v25 = [v21 objectForKeyedSubscript:IDSSendMessageOptionRequireAllRegistrationPropertiesKey];
    if (!v25) {
      goto LABEL_9;
    }
    id v26 = (void *)v25;
    [v21 objectForKeyedSubscript:v24];
    v27 = id v34 = self;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    self = v34;
    if (isKindOfClass)
    {
      v29 = [v21 objectForKeyedSubscript:v24];
      id v30 = [v29 mutableCopy];

      self = v34;
      [v30 addObject:IDSRegistrationPropertySupportsSelfOneToOneInvites];
    }
    else
    {
LABEL_9:
      id v30 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSelfOneToOneInvites];
    }
    [v21 setObject:v30 forKeyedSubscript:v24];

    a6 = v35;
    a8 = v36;
  }
  long long v31 = [(CSDIDSService *)self service];
  unsigned __int8 v32 = [v31 sendData:v15 fromAccount:v17 toDestinations:v16 priority:a6 options:v21 identifier:a8 error:a9];

  return v32;
}

- (NSSet)aliases
{
  v2 = [(CSDIDSService *)self idsService];
  v3 = [v2 aliases];

  return (NSSet *)v3;
}

- (id)createGroupSessionProviderWithGroupID:(id)a3 participantDestinationIDs:(id)a4 callerID:(id)a5 account:(id)a6 queue:(id)a7 isOneToOneModeEnabled:(BOOL)a8 localMember:(id)a9 avLess:(BOOL)a10 isScreenSharingRequest:(BOOL)a11 ABTestConfiguration:(id)a12 isInitiator:(BOOL)a13
{
  BOOL v31 = a8;
  HIDWORD(v30) = a11;
  id v18 = a12;
  id v19 = a9;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  uint64_t v25 = [CSDIDSGroupSessionProvider alloc];
  unsigned __int8 v26 = [v19 isLightweightMember];

  LOBYTE(v30) = a13;
  *(_WORD *)((char *)&v29 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v29) = v26;
  id v27 = -[CSDIDSGroupSessionProvider initWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled:isLightweightMember:avLess:isScreenSharingRequest:ABTestConfiguration:isInitiator:](v25, "initWithGroupID:participantDestinationIDs:callerID:account:queue:isOneToOneModeEnabled:isLightweightMember:avLess:isScreenSharingRequest:ABTestConfiguration:isInitiator:", v24, v23, v22, v21, v20, v31, v29, v18, v30);

  return v27;
}

- (id)accountForTelephonySubscriptionLabelIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self idsService];
  id v6 = [v5 accountMatchingSimIdentifier:v4];

  return v6;
}

- (BOOL)isServiceEnabledForTelephonySubscriptionLabelIdentifier:(id)a3
{
  v3 = [(CSDIDSService *)self accountForTelephonySubscriptionLabelIdentifier:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)addFirewallEntriesForHandleToDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self featureFlags];
  unsigned int v6 = [v5 offrampEnabled];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding firewall entries for dictionary: %@", buf, 0xCu);
    }

    +[NSMutableArray array];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001C8C50;
    v10[3] = &unk_10050A178;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v11;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    id v9 = [v8 copy];
    [(CSDIDSService *)self retrieveFirewallAndAddEntries:v9];
  }
}

- (void)addFirewallEntryForHandle:(id)a3 lastSeenDate:(id)a4
{
  id v6 = a4;
  id v7 = +[NSArray arrayWithObject:a3];
  [(CSDIDSService *)self addFirewallEntriesForHandles:v7 lastSeenDate:v6];
}

- (void)addFirewallEntriesForHandles:(id)a3 lastSeenDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDIDSService *)self featureFlags];
  unsigned int v9 = [v8 offrampEnabled];

  if (v9)
  {
    id v21 = self;
    id v10 = sub_100008DCC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Adding firewall entries with time %@ for handles: %@", buf, 0x16u);
    }

    id v23 = +[NSMutableArray array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v22 = v6;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v17 = objc_msgSend(v16, "normalizedValue", v21);
          id v18 = +[IDSURI URIWithUnprefixedURI:v17];

          if (v18)
          {
            id v19 = [objc_alloc((Class)IDSFirewallEntry) initWithURI:v18 andLastSeenDate:v7];
            if (v19) {
              [v23 addObject:v19];
            }
          }
          else
          {
            id v19 = sub_100008DCC();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v30 = v16;
              __int16 v31 = 2112;
              id v32 = 0;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not adding handle %@ to firewall since uri %@ is nil", buf, 0x16u);
            }
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v13);
    }

    id v20 = [v23 copy];
    [(CSDIDSService *)v21 retrieveFirewallAndAddEntries:v20];

    id v6 = v22;
  }
}

- (void)retrieveFirewallAndAddEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self featureFlags];
  unsigned int v6 = [v5 offrampEnabled];

  if (v6)
  {
    id v7 = [(CSDIDSService *)self service];
    id v8 = [(CSDIDSService *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001C9110;
    v9[3] = &unk_10050A1A0;
    id v10 = v4;
    [v7 retrieveFirewallWithQueue:v8 completion:v9];
  }
}

- (void)removeAllFirewallEntries
{
  v3 = [(CSDIDSService *)self featureFlags];
  unsigned int v4 = [v3 offrampEnabled];

  if (v4)
  {
    id v5 = sub_100008DCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing all IDSFirewall entries", v8, 2u);
    }

    unsigned int v6 = [(CSDIDSService *)self service];
    id v7 = [(CSDIDSService *)self queue];
    [v6 retrieveFirewallWithQueue:v7 completion:&stru_10050A1E0];
  }
}

- (void)removeFirewallEntries:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self featureFlags];
  unsigned int v6 = [v5 offrampEnabled];

  if (v6)
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Removing handles from IDSFirewall: %@", buf, 0xCu);
    }

    id v8 = [(CSDIDSService *)self service];
    unsigned int v9 = [(CSDIDSService *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001C9754;
    v10[3] = &unk_10050A1A0;
    id v11 = v4;
    [v8 retrieveFirewallWithQueue:v9 completion:v10];
  }
}

- (NSArray)devices
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001C9C10;
  id v11 = sub_1001C9C20;
  id v12 = 0;
  v3 = [(CSDIDSService *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001C9C28;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (id)deviceWithUniqueID:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(CSDIDSService *)self devices];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    id v10 = 0;
    id v11 = v8;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v10);

      id v12 = [v8 uniqueIDOverride];
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      id v10 = (char *)v10 + 1;
      id v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (id)deviceForFromID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDIDSService *)self idsService];
  id v6 = [v5 deviceForFromID:v4];

  return v6;
}

- (id)devicesWithCapability:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(CSDIDSService *)self devices];
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 capabilities];
        id v13 = [v12 valueForCapability:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];

  return v14;
}

- (id)deviceDestinationsWithCapability:(id)a3 localHandle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v45 = +[NSMutableArray array];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = [(CSDIDSService *)self devices];
  id v9 = [v8 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v51;
    long long v39 = v8;
    id v40 = v6;
    uint64_t v38 = *(void *)v51;
    do
    {
      id v12 = 0;
      id v42 = v10;
      do
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v12);
        id v14 = [v13 capabilities];
        id v15 = [v14 valueForCapability:v6];

        if (v15)
        {
          long long v16 = [v13 destination];
          long long v17 = [v16 destinationURIs];
          id v18 = [v17 count];

          if (v18)
          {
            long long v43 = v16;
            long long v44 = v12;
            long long v19 = [v16 destinationURIs];
            id v20 = [v19 anyObject];
            id v21 = (void *)IDSCopyAddressDestinationForDestination();
            id v22 = (void *)IDSCopyRawAddressForDestination();
            id v23 = +[TUHandle normalizedHandleWithDestinationID:v22];

            long long v24 = v23;
            if (([v23 isEquivalentToHandle:v7] & 1) == 0)
            {
              long long v41 = v23;
              long long v25 = objc_msgSend(v13, "csd_aliasStrings");
              long long v46 = 0u;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v49 = 0u;
              id v26 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
              if (v26)
              {
                id v27 = v26;
                uint64_t v28 = *(void *)v47;
                do
                {
                  for (i = 0; i != v27; i = (char *)i + 1)
                  {
                    if (*(void *)v47 != v28) {
                      objc_enumerationMutation(v25);
                    }
                    uint64_t v30 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                    __int16 v31 = +[TUHandle normalizedHandleWithDestinationID:v30];
                    if ([v31 isEquivalentToHandle:v7])
                    {
                      id v32 = sub_100008DCC();
                      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                      {
                        long long v33 = objc_msgSend(v13, "csd_destinationForAlias:", v30);
                        *(_DWORD *)buf = 138412546;
                        v55 = v33;
                        __int16 v56 = 2112;
                        v57 = v13;
                        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Adding copyIDtoken:%@ to capable destinations for device: %@", buf, 0x16u);
                      }
                      id v34 = objc_msgSend(v13, "csd_destinationForAlias:", v30);
                      [v45 addObject:v34];
                    }
                  }
                  id v27 = [v25 countByEnumeratingWithState:&v46 objects:v58 count:16];
                }
                while (v27);
              }

              id v8 = v39;
              id v6 = v40;
              uint64_t v11 = v38;
              long long v24 = v41;
            }
            int64_t v35 = [v13 destination];
            [v45 addObject:v35];

            id v10 = v42;
            long long v16 = v43;
            id v12 = v44;
          }
        }
        id v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v10 = [v8 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v10);
  }

  id v36 = [v45 copy];

  return v36;
}

- (BOOL)telephonyCapableDeviceExists
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CSDIDSService *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001CA414;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)relayCapableDeviceExists
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(CSDIDSService *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001CA500;
  v5[3] = &unk_100505008;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)defaultPairedDeviceExists
{
  v2 = [(CSDIDSService *)self defaultPairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)pairedDeviceExists
{
  v2 = [(CSDIDSService *)self pairedDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSSet)availableOutgoingRelayCallerIDs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001C9C10;
  uint64_t v11 = sub_1001C9C20;
  id v12 = 0;
  BOOL v3 = [(CSDIDSService *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CA698;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (IDSDevice)defaultPairedDevice
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001C9C10;
  uint64_t v11 = sub_1001C9C20;
  id v12 = 0;
  BOOL v3 = [(CSDIDSService *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CA7C8;
  v6[3] = &unk_100505008;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSDevice *)v4;
}

- (IDSDevice)pairedDevice
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1001C9C10;
  uint64_t v11 = sub_1001C9C20;
  id v12 = 0;
  BOOL v3 = [(CSDIDSService *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001CA8F8;
  v6[3] = &unk_100506E98;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (IDSDevice *)v4;
}

- (NSString)countryCode
{
  BOOL v3 = [(CSDIDSService *)self account];
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 accountInfo];
    int v19 = 138412290;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Determining country code using account info %@", (uint8_t *)&v19, 0xCu);
  }
  unsigned int v6 = [v3 accountType];
  if (v6 == 1)
  {
    uint64_t v8 = +[FTDeviceSupport sharedInstance];
    unsigned int v9 = [v8 isTelephonyDevice];

    if (v9)
    {
      id v10 = +[FTDeviceSupport sharedInstance];
      uint64_t v11 = [v10 telephoneNumber];

      uint64_t v7 = 0;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v6)
  {
LABEL_8:
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  uint64_t v7 = [(CSDIDSService *)self callerID];
LABEL_9:
  uint64_t v11 = 0;
LABEL_10:
  id v12 = IMCountryCodeForNumber();
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v15 = IMCountryCodeForNumber();
    long long v16 = v15;
    if (v15)
    {
      id v14 = v15;
    }
    else
    {
      long long v17 = [v3 regionBasePhoneNumber];
      IMCountryCodeForNumber();
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSString *)v14;
}

- (NSString)localDeviceUniqueID
{
  v2 = (void *)IDSCopyLocalDeviceUniqueID();

  return (NSString *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (void)provisionPseudonymForHandle:(id)a3 featureID:(id)a4 scopeID:(id)a5 expiryDuration:(double)a6 allowedServices:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  long long v17 = [(CSDIDSService *)self service];
  id v18 = [v17 pseudonymPropertiesWithFeatureID:v16 scopeID:v15 expiryDurationInSeconds:a6];

  int v19 = sub_100008DCC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = [v13 value];
    id v21 = [(CSDIDSService *)self service];
    id v22 = [v21 serviceIdentifier];
    id v23 = IDSLoggableDescriptionForHandleOnService();
    *(_DWORD *)buf = 138412546;
    id v32 = v23;
    __int16 v33 = 2112;
    id v34 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Asking IDS to generated a pseudonym for unprefixedURI: %@ and properties: %@", buf, 0x16u);
  }
  long long v24 = [(CSDIDSService *)self service];
  id v25 = objc_alloc((Class)IDSURI);
  id v26 = [v13 value];
  id v27 = [v25 initWithUnprefixedURI:v26];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1001CADB0;
  v29[3] = &unk_10050A118;
  id v30 = v14;
  id v28 = v14;
  [v24 provisionPseudonymForURI:v27 withProperties:v18 completion:v29];
}

- (void)revokePseudonymString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = [(CSDIDSService *)self pseudonymForPseudonymString:v6];
  if (v8)
  {
    [(CSDIDSService *)self revokePseudonym:v8 completionHandler:v7];
  }
  else
  {
    unsigned int v9 = sub_100008DCC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(CSDIDSService *)self service];
      uint64_t v11 = [v10 pseudonymURIMap];
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No IDSPseudonym matching string %@ was found. All pseudonym URIs: %@", (uint8_t *)&v12, 0x16u);
    }
    v7[2](v7, 1, 0);
  }
}

- (void)revokePseudonym:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asking IDS to revoke pseudonym: %@", (uint8_t *)&v10, 0xCu);
  }

  unsigned int v9 = [(CSDIDSService *)self service];
  [v9 revokePseudonym:v6 completion:v7];
}

- (void)renewPseudonymString:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(CSDIDSService *)self pseudonymForPseudonymString:v8];
  if (v11)
  {
    [(CSDIDSService *)self renewPseudonym:v11 expirationDate:v9 completionHandler:v10];
  }
  else
  {
    int v12 = sub_100008DCC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No pseudonym matching %@ was found.", (uint8_t *)&v13, 0xCu);
    }

    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
  }
}

- (void)renewPseudonym:(id)a3 expirationDate:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Asking IDS to renew pseudonym: %@", buf, 0xCu);
  }

  int v12 = [(CSDIDSService *)self service];
  [v10 timeIntervalSince1970];
  double v14 = v13;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001CB374;
  v16[3] = &unk_10050A118;
  id v17 = v9;
  id v15 = v9;
  [v12 renewPseudonym:v8 forUpdatedExpiryEpoch:v16 completion:v14];
}

- (void)checkValidityForPseudonymString:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    if ([(CSDIDSService *)self checkValidityForSelfPseudonymString:v6])
    {
      v7[2](v7, 1);
    }
    else
    {
      id v8 = [(CSDIDSService *)self idsQueryController];
      id v9 = [(CSDIDSService *)self name];
      id v10 = [(CSDIDSService *)self queue];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001CB584;
      v13[3] = &unk_10050A228;
      id v11 = v7;
      double v14 = v11;
      unsigned __int8 v12 = [v8 refreshIDStatusForDestination:v6 service:v9 listenerID:@"CSDIDSServiceQueryListenerID" queue:v10 completionBlock:v13];

      if ((v12 & 1) == 0) {
        v11[2](v11, 0);
      }
    }
  }
}

- (BOOL)checkValidityForSelfPseudonymString:(id)a3
{
  BOOL v3 = [(CSDIDSService *)self pseudonymForPseudonymString:a3];
  id v4 = v3;
  if (v3) {
    unsigned int v5 = objc_msgSend(v3, "csd_isExpired") ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)pseudonymForPseudonymString:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDIDSService *)self service];
  id v6 = [objc_alloc((Class)IDSURI) initWithPrefixedURI:v4];

  id v7 = [v5 pseudonymForPseudonymURI:v6];

  return v7;
}

- (void)noteApprovedHandle:(id)a3 completionHandle:(id)a4
{
}

- (void)noteDismissedHandle:(id)a3 completionHandle:(id)a4
{
}

- (void)_noteAction:(int64_t)a3 onHandle:(id)a4 completionHandle:(id)a5
{
  id v8 = a5;
  id v9 = [a4 normalizedValue];
  id v10 = +[IDSURI URIWithPrefixedURI:v9];

  if ([v10 FZIDType] == (id)4)
  {
    id v11 = [(CSDIDSService *)self callerID];
    unsigned __int8 v12 = +[IDSURI URIWithPrefixedURI:v11];

    double v13 = [(CSDIDSService *)self service];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001CB7F4;
    v14[3] = &unk_10050A250;
    id v15 = v8;
    [v13 reportAction:a3 ofTempURI:v10 fromURI:v12 withCompletion:v14];
  }
  else if (v8)
  {
    (*((void (**)(id, void))v8 + 2))(v8, 0);
  }
}

- (void)accountController:(id)a3 accountAdded:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSService *)self queue];
  [v5 addRegistrationDelegate:self queue:v6];
}

- (void)accountController:(id)a3 accountEnabled:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDIDSService *)self queue];
  [v5 addRegistrationDelegate:self queue:v6];
}

- (void)accountController:(id)a3 accountDisabled:(id)a4
{
}

- (void)accountController:(id)a3 accountRemoved:(id)a4
{
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
}

- (void)handleActiveAccountsChanged:(id)a3
{
  id v4 = sub_100008DCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: Active accounts changed", (uint8_t *)&v6, 0xCu);
  }

  [(CSDIDSService *)self _update];
  id v5 = [(CSDIDSService *)self delegate];
  [v5 activeAccountsChangedForService:self];
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Devices changed", (uint8_t *)&v6, 0xCu);
  }

  [(CSDIDSService *)self _update];
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@: Nearby devices changed", (uint8_t *)&v6, 0xCu);
  }

  [(CSDIDSService *)self _update];
}

- (void)service:(id)a3 didUpdatePseudonymsWithChanges:(id)a4
{
  id v5 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "changeType", v15);
        if (!v12)
        {
          double v13 = [(CSDIDSService *)self delegate];
          double v14 = [v11 pseudonym];
          [v13 service:self pseudonymRemoved:v14];
          goto LABEL_13;
        }
        if (v12 == (id)2)
        {
          double v13 = [(CSDIDSService *)self delegate];
          double v14 = [v11 pseudonym];
          [v13 service:self pseudonymUpdated:v14];
LABEL_13:

          goto LABEL_14;
        }
        if (v12 != (id)1) {
          continue;
        }
        double v13 = sub_100008DCC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v15;
          id v21 = self;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Told that a pseudonym was added to our account.", buf, 0xCu);
        }
LABEL_14:
      }
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
}

- (unint64_t)registrationRestrictionReason
{
  v2 = [(CSDIDSService *)self idsService];
  id v3 = [v2 registrationRestrictionReason];

  return (unint64_t)v3;
}

- (void)update
{
  id v3 = [(CSDIDSService *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CBDBC;
  block[3] = &unk_100504EC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)_update
{
  p_pairedDevice = &self->_pairedDevice;
  __int16 v31 = self->_pairedDevice;
  id v4 = +[NSMutableSet set];
  defaultPairedDevice = self->_defaultPairedDevice;
  self->_defaultPairedDevice = 0;

  id v6 = *p_pairedDevice;
  id v32 = (id *)p_pairedDevice;
  *p_pairedDevice = 0;

  *(_WORD *)&self->_BOOL telephonyCapableDeviceExists = 0;
  long long v7 = [(CSDIDSService *)self idsService];
  id v8 = [v7 devices];
  devices = self->_devices;
  self->_devices = v8;

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obj = self->_devices;
  id v10 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v58 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v40;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v14 isDefaultPairedDevice]) {
          objc_storeStrong((id *)&self->_defaultPairedDevice, v14);
        }
        if ([v14 isPairedDevice]) {
          objc_storeStrong(v32, v14);
        }
        if ([v14 supportsPhoneCalls]) {
          self->_BOOL telephonyCapableDeviceExists = 1;
        }
        if (![v14 isDefaultPairedDevice]
          || [v14 isPairedDevice])
        {
          self->_BOOL relayCapableDeviceExists = 1;
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v15 = [v14 linkedUserURIs];
        id v16 = [v15 countByEnumeratingWithState:&v35 objects:v57 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v36;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(v15);
              }
              id v20 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) _stripFZIDPrefix];
              [v4 addObject:v20];
            }
            id v17 = [v15 countByEnumeratingWithState:&v35 objects:v57 count:16];
          }
          while (v17);
        }
      }
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v39 objects:v58 count:16];
    }
    while (v11);
  }

  id v21 = (NSSet *)[v4 copy];
  availableOutgoingRelayCallerIDs = self->_availableOutgoingRelayCallerIDs;
  self->_availableOutgoingRelayCallerIDs = v21;

  id v23 = sub_100008DCC();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    obja = self->_availableOutgoingRelayCallerIDs;
    BOOL v24 = self->_defaultPairedDevice != 0;
    BOOL v25 = self->_pairedDevice != 0;
    BOOL telephonyCapableDeviceExists = self->_telephonyCapableDeviceExists;
    BOOL relayCapableDeviceExists = self->_relayCapableDeviceExists;
    id v28 = [(NSArray *)self->_devices arrayByApplyingSelector:"name"];
    uint64_t v29 = [v28 componentsJoinedByString:@"\", \""];
    *(_DWORD *)buf = 138413826;
    long long v44 = self;
    __int16 v45 = 1024;
    BOOL v46 = v24;
    __int16 v47 = 1024;
    BOOL v48 = v25;
    __int16 v49 = 1024;
    BOOL v50 = telephonyCapableDeviceExists;
    __int16 v51 = 1024;
    BOOL v52 = relayCapableDeviceExists;
    __int16 v53 = 2112;
    v54 = obja;
    __int16 v55 = 2112;
    __int16 v56 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ updated state: defaultPairedDeviceExists=%d, pairedDeviceExists=%d, telephonyCapableDeviceExists=%d, relayCapableDeviceExists=%d, availableOutgoingRelayCallerIDs=%@ deviceNames=\"%@\"", buf, 0x38u);
  }
  if (v31 != *v32) {
    -[CSDIDSService _handlePairedDeviceChangedFrom:to:](self, "_handlePairedDeviceChangedFrom:to:", v31);
  }
  id v30 = +[NSNotificationCenter defaultCenter];
  [v30 postNotificationName:@"CSDIDSDeviceListChangedNotification" object:self];
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSAccountController)accountController
{
  return self->_accountController;
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (IDSIDQueryController)idsQueryController
{
  return self->_idsQueryController;
}

- (void)setIdsQueryController:(id)a3
{
}

- (IDSServicePseudonymDelegate)delegate
{
  return self->_delegate;
}

- (void)setTelephonyCapableDeviceExists:(BOOL)a3
{
  self->_BOOL telephonyCapableDeviceExists = a3;
}

- (void)setRelayCapableDeviceExists:(BOOL)a3
{
  self->_BOOL relayCapableDeviceExists = a3;
}

- (void)setDevices:(id)a3
{
}

- (void)setPairedDevice:(id)a3
{
}

- (void)setDefaultPairedDevice:(id)a3
{
}

- (void)setAvailableOutgoingRelayCallerIDs:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_availableOutgoingRelayCallerIDs, 0);
  objc_storeStrong((id *)&self->_defaultPairedDevice, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_idsQueryController, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end