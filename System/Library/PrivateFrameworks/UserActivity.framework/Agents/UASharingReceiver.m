@interface UASharingReceiver
- (BOOL)_addItem:(id)a3 scheduleUpdates:(BOOL)a4;
- (BOOL)active;
- (BOOL)addItem:(id)a3 scheduleUpdates:(BOOL)a4;
- (BOOL)addSFActivityScanner:(id)a3;
- (BOOL)fetchMoreAppSuggestions;
- (BOOL)forceScanning;
- (BOOL)receiving;
- (BOOL)removeItem:(id)a3;
- (BOOL)removeSFActivityScanner:(id)a3;
- (BOOL)resume;
- (BOOL)suspend;
- (BOOL)terminate;
- (NSSet)activeDevices;
- (NSSet)sfActivityScanners;
- (NSTimer)remotePboardTimer;
- (SFPeerDevice)lastSeenPasteboardDevice;
- (UADispatchScheduler)periodicCleanup;
- (UASharingReceiver)initWithManager:(id)a3;
- (id)receivedItems;
- (id)sfActivityScanner;
- (id)sharingBTLESuggestedItemForAdvertisementPayload:(id)a3 forDevice:(id)a4;
- (id)statusString;
- (int64_t)lastSeenPasteboardVersionBit;
- (void)activityScanner:(id)a3 foundDeviceWithDevice:(id)a4;
- (void)activityScanner:(id)a3 lostDeviceWithDevice:(id)a4;
- (void)activityScanner:(id)a3 receivedAdvertisement:(id)a4;
- (void)addNewItemsFromPayloads:(id)a3 device:(id)a4 scanner:(id)a5 force:(BOOL)a6;
- (void)clearRemotePasteboardAvailable:(id)a3;
- (void)fetchMoreAppSuggestionsFromDevice:(id)a3;
- (void)foundDevice:(id)a3;
- (void)lostDevice:(id)a3;
- (void)lostDeviceWithUUID:(id)a3;
- (void)periodicCleanupFunc;
- (void)receiveAdvertisement:(id)a3 scanner:(id)a4;
- (void)removeAllFromDevice:(id)a3;
- (void)setForceScanning:(BOOL)a3;
- (void)setLastSeenPasteboardDevice:(id)a3;
- (void)setLastSeenPasteboardVersionBit:(int64_t)a3;
- (void)setRemotePboardTimer:(id)a3;
- (void)setScanningForTypes:(id)a3;
@end

@implementation UASharingReceiver

- (UASharingReceiver)initWithManager:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)UASharingReceiver;
  v3 = [(UAReceiver *)&v20 initWithManager:a3 name:@"SharingReceiver"];
  if (v3)
  {
    uint64_t v4 = +[NSMutableSet set];
    sfActivityScanners = v3->_sfActivityScanners;
    v3->_sfActivityScanners = (NSMutableSet *)v4;

    uint64_t v6 = +[NSMutableSet set];
    activeDevices = v3->_activeDevices;
    v3->_activeDevices = (NSMutableSet *)v6;

    uint64_t v8 = +[NSMutableSet set];
    receivedItems = v3->_receivedItems;
    v3->_receivedItems = (NSMutableSet *)v8;

    uint64_t v10 = +[NSMutableSet set];
    recentlyLostDeviceIDs = v3->_recentlyLostDeviceIDs;
    v3->_recentlyLostDeviceIDs = (NSMutableSet *)v10;

    v12 = [(UACornerActionManagerHandler *)v3 manager];
    v13 = [v12 mainDispatchQ];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004DDE0;
    v18[3] = &unk_1000C4CF0;
    v14 = v3;
    v19 = v14;
    uint64_t v15 = +[UADispatchScheduler dispatchScheduler:@"SharingReceiverPeriodic" frequency:v13 queue:v18 block:0.0];
    periodicCleanup = v14->_periodicCleanup;
    v14->_periodicCleanup = (UADispatchScheduler *)v15;
  }
  return v3;
}

- (BOOL)receiving
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_receivedItems count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)setScanningForTypes:(id)a3
{
  id v4 = a3;
  v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v4 description];
    v7 = sub_100063FF0(v6);
    *(_DWORD *)buf = 138543362;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "setScanningForTypes:%{public}@", buf, 0xCu);
  }
  if (v4
    || ([(UAReceiver *)self scanningForTypes],
        v5 = objc_claimAutoreleasedReturnValue(),
        ![v5 count]))
  {
    uint64_t v8 = [(UAReceiver *)self scanningForTypes];
    unsigned __int8 v9 = [v4 isEqual:v8];

    if (v4)
    {
      if (v9) {
        goto LABEL_37;
      }
      goto LABEL_12;
    }

    if (v9)
    {
      id v4 = 0;
      goto LABEL_37;
    }
  }
  else
  {
  }
  uint64_t v10 = +[NSSet set];

  id v4 = (id)v10;
LABEL_12:
  v29.receiver = self;
  v29.super_class = (Class)UASharingReceiver;
  [(UAReceiver *)&v29 setScanningForTypes:v4];
  if ([v4 containsObject:off_1000E5C68]) {
    v11 = "userActivity ";
  }
  else {
    v11 = "";
  }
  if ([v4 containsObject:off_1000E5C70]) {
    v12 = "clipboard ";
  }
  else {
    v12 = "";
  }
  if ([v4 count]) {
    v13 = "";
  }
  else {
    v13 = "-";
  }
  unsigned int v14 = [(UACornerActionManagerHandler *)self suspended];
  uint64_t v15 = " SUSPENDED";
  if (!v14) {
    uint64_t v15 = "";
  }
  v16 = +[NSString stringWithFormat:@"SCANNING:%s%s%s%s", v11, v12, v13, v15];
  +[ActivityManagerDebuggingManager appendRecentAction:v16];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v17 = [(UASharingReceiver *)self sfActivityScanners];
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([(UACornerActionManagerHandler *)self suspended])
        {
          sub_10004E174(v22, 0);
        }
        else
        {
          v23 = [(UACornerActionManagerHandler *)self manager];
          if ([v23 activityReceivingAllowed]) {
            v24 = v4;
          }
          else {
            v24 = 0;
          }
          sub_10004E174(v22, v24);
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }

LABEL_37:
}

- (id)receivedItems
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableSet *)v2->_receivedItems allObjects];
  objc_sync_exit(v2);

  return v3;
}

- (NSSet)activeDevices
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_activeDevices copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)active
{
  v5.receiver = self;
  v5.super_class = (Class)UASharingReceiver;
  if (![(UACornerActionManagerHandler *)&v5 active]) {
    return 0;
  }
  v2 = +[UAUserActivityDefaults sharedDefaults];
  unsigned __int8 v3 = [v2 activityBTLESharingEnabled];

  return v3;
}

- (NSSet)sfActivityScanners
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_sfActivityScanners copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)addSFActivityScanner:(id)a3
{
  id v5 = a3;
  uint64_t v6 = sub_10000BA18(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 138543362;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "UASharingReceiver, adding activity scanner %{public}@.", (uint8_t *)&v14, 0xCu);
  }

  if (v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    unsigned __int8 v8 = [(NSMutableSet *)v7->_sfActivityScanners containsObject:v5];
    if ((v8 & 1) == 0)
    {
      [(NSMutableSet *)v7->_sfActivityScanners addObject:v5];
      unsigned __int8 v9 = [(UACornerActionManagerHandler *)v7 suspended];
      if (v9)
      {
        int v10 = 0;
        v11 = 0;
      }
      else
      {
        id v3 = [(UACornerActionManagerHandler *)v7 manager];
        if ([v3 activityReceivingAllowed])
        {
          v11 = [(UAReceiver *)v7 scanningForTypes];
          int v10 = 1;
        }
        else
        {
          int v10 = 0;
          v11 = 0;
        }
      }
      sub_10004E174(v5, v11);
      if (v10) {

      }
      if ((v9 & 1) == 0) {
    }
      }
    objc_sync_exit(v7);

    char v12 = v8 ^ 1;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)removeSFActivityScanner:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "UASharingReceiver, removing activity scanner %{public}@.", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v6 = self;
  objc_sync_enter(v6);
  unsigned int v7 = [(NSMutableSet *)v6->_sfActivityScanners containsObject:v4];
  if (v7)
  {
    sub_10004E174(v4, 0);
    [(NSMutableSet *)v6->_sfActivityScanners removeObject:v4];
  }
  objc_sync_exit(v6);

  return v7;
}

- (id)sfActivityScanner
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UASharingReceiver *)self sfActivityScanners];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_class())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v3 = v6;
            goto LABEL_12;
          }
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (BOOL)suspend
{
  v17.receiver = self;
  v17.super_class = (Class)UASharingReceiver;
  BOOL v3 = [(UACornerActionManagerHandler *)&v17 suspend];
  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(UASharingReceiver *)self sfActivityScanners];
    id v5 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          long long v10 = sub_10000BA18(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            id v19 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UASharingReceiver, suspending activity scanner %{public}@.", buf, 0xCu);
          }

          sub_10004E174(v9, 0);
        }
        id v6 = [v4 countByEnumeratingWithState:&v13 objects:v20 count:16];
      }
      while (v6);
    }

    long long v11 = [(UASharingReceiver *)self periodicCleanup];
    [v11 suspend];
  }
  return v3;
}

- (BOOL)resume
{
  v18.receiver = self;
  v18.super_class = (Class)UASharingReceiver;
  BOOL v3 = [(UACornerActionManagerHandler *)&v18 resume];
  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [(UASharingReceiver *)self sfActivityScanners];
    id v5 = [v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v10 = sub_10000BA18(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UASharingReceiver, resuming activity scanner %{public}@.", buf, 0xCu);
          }

          long long v11 = [(UAReceiver *)self scanningForTypes];
          sub_10004E174(v9, v11);
        }
        id v6 = [v4 countByEnumeratingWithState:&v14 objects:v21 count:16];
      }
      while (v6);
    }

    char v12 = [(UASharingReceiver *)self periodicCleanup];
    [v12 resume];
  }
  return v3;
}

- (void)activityScanner:(id)a3 foundDeviceWithDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = [v7 uniqueID];
    *(_DWORD *)buf = 138478083;
    long long v16 = v9;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "foundDevice, deviceIdentifier=%{private}@ scanner=%{public}@", buf, 0x16u);
  }
  long long v10 = [(UACornerActionManagerHandler *)self manager];
  long long v11 = [v10 mainDispatchQ];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004EDA4;
  v13[3] = &unk_1000C5BB0;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  dispatch_async(v11, v13);
}

- (void)foundDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueID];
    *(_DWORD *)buf = 138477827;
    uint64_t v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "foundDevice, deviceIdentifier=%{private}@", buf, 0xCu);
  }
  if (v4)
  {
    id v7 = self;
    objc_sync_enter(v7);
    long long v8 = [(UASharingReceiver *)v7 activeDevices];
    unsigned __int8 v9 = [v8 containsObject:v4];

    if (v9)
    {
      recentlyLostDeviceIDs = v7->_recentlyLostDeviceIDs;
      long long v11 = [v4 uniqueID];
      LODWORD(recentlyLostDeviceIDs) = [(NSMutableSet *)recentlyLostDeviceIDs containsObject:v11];

      if (recentlyLostDeviceIDs)
      {
        id v12 = v7->_recentlyLostDeviceIDs;
        long long v13 = [v4 uniqueID];
        [(NSMutableSet *)v12 removeObject:v13];
      }
    }
    else
    {
      id v14 = [v4 uniqueID];
      long long v15 = [v4 name];
      unsigned int v16 = [v4 isDefaultPairedDevice];
      __int16 v17 = "";
      if (v16) {
        __int16 v17 = " defaultPaired";
      }
      id v18 = +[NSString stringWithFormat:@"SCANNING:Found device %@ %@%s", v14, v15, v17];
      +[ActivityManagerDebuggingManager appendRecentAction:v18];

      [(NSMutableSet *)v7->_activeDevices addObject:v4];
    }
    objc_sync_exit(v7);
  }
}

- (void)activityScanner:(id)a3 lostDeviceWithDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v9 = [v7 uniqueID];
    *(_DWORD *)buf = 138478083;
    id v18 = v9;
    __int16 v19 = 2114;
    id v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "lostDevice, deviceIdentifier=%{private}@ scanner=%{public}@", buf, 0x16u);
  }
  recentlyLostDeviceIDs = self->_recentlyLostDeviceIDs;
  long long v11 = [v7 uniqueID];
  [(NSMutableSet *)recentlyLostDeviceIDs addObject:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004F178;
  v14[3] = &unk_1000C5D50;
  id v15 = v7;
  unsigned int v16 = self;
  id v12 = v7;
  id v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v14 block:5.0];
}

- (void)lostDevice:(id)a3
{
  id v4 = a3;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 uniqueID];
    *(_DWORD *)buf = 138477827;
    long long v25 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "lostDevice, deviceIdentifier=%{private}@", buf, 0xCu);
  }
  id v7 = [v4 uniqueID];

  if (v7)
  {
    long long v8 = self;
    objc_sync_enter(v8);
    unsigned __int8 v9 = [v4 uniqueID];
    long long v10 = [v4 name];
    unsigned int v11 = [v4 isDefaultPairedDevice];
    id v12 = "";
    if (v11) {
      id v12 = " defaultPaired";
    }
    id v13 = +[NSString stringWithFormat:@"SCANNING:Lost device %@ %@%s", v9, v10, v12];
    +[ActivityManagerDebuggingManager appendRecentAction:v13];

    [(NSMutableSet *)v8->_activeDevices removeObject:v4];
    id v14 = [v4 uniqueID];
    [(UASharingReceiver *)v8 removeAllFromDevice:v14];

    id v15 = +[UAUserActivityDefaults sharedDefaults];
    if ([v15 ignoreLostDevice])
    {
    }
    else
    {
      unsigned int v16 = [v4 uniqueID];
      __int16 v17 = [(UASharingReceiver *)v8 lastSeenPasteboardDevice];
      id v18 = [v17 uniqueID];
      unsigned int v19 = [v16 isEqualToString:v18];

      if (v19)
      {
        [(UASharingReceiver *)v8 setLastSeenPasteboardDevice:0];
        id v20 = [(UACornerActionManagerHandler *)v8 manager];
        v21 = [v20 pasteboardController];
        [v21 setRemotePasteboardAvalibility:0 withDataRequester:0];

        v22 = +[UADiagnosticManager sharedManager];
        [v22 submitRemotePasteboardBecameUnavailable:1];

        v23 = [(UASharingReceiver *)v8 remotePboardTimer];
        [v23 invalidate];

        [(UASharingReceiver *)v8 setRemotePboardTimer:0];
      }
    }
    objc_sync_exit(v8);
  }
}

- (void)lostDeviceWithUUID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(UASharingReceiver *)self activeDevices];
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
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v11 = [v10 uniqueID];
        unsigned int v12 = [v11 isEqual:v4];

        if (v12) {
          [(UASharingReceiver *)self lostDevice:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)_addItem:(id)a3 scheduleUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6)
  {
    BOOL v33 = 0;
    goto LABEL_26;
  }
  BOOL v38 = v4;
  obj = self;
  objc_sync_enter(obj);
  id v7 = [v6 bundleIdentifier];
  uint64_t v8 = [v6 peerDevice];
  unsigned __int8 v9 = [v8 uniqueID];
  v41 = [v7 stringByAppendingString:v9];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v10 = obj->_receivedItems;
  id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v43 objects:v55 count:16];
  if (!v11)
  {

    v42 = 0;
LABEL_22:
    [(NSMutableSet *)obj->_receivedItems addObject:v6];
    BOOL v33 = 1;
    goto LABEL_23;
  }
  v42 = 0;
  char v40 = 0;
  uint64_t v12 = *(void *)v44;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(v10);
      }
      long long v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
      long long v15 = [v14 uuid];
      long long v16 = [v6 uuid];
      unsigned int v17 = [v15 isEqual:v16];

      if (v17)
      {
        id v18 = [v6 removeAfter];
        [v14 setRemoveAfter:v18];

        unsigned int v19 = [v6 when];
        [v14 setWhen:v19];

        id v20 = [v6 currentUntilDate];
        [v14 setCurrentUntilDate:v20];

        objc_msgSend(v14, "setActive:", objc_msgSend(v6, "active"));
        char v40 = 1;
      }
      else
      {
        [v14 resignCurrent];
        v21 = [v14 bundleIdentifier];
        v22 = [v14 peerDevice];
        v23 = [v22 uniqueID];
        v24 = [v21 stringByAppendingString:v23];

        if ([v24 isEqualToString:v41])
        {
          id v25 = v14;

          v42 = v25;
        }
      }
    }
    id v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v43 objects:v55 count:16];
  }
  while (v11);

  if (v42)
  {
    long long v26 = sub_10000BA18(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      long long v27 = [v42 uuid];
      long long v28 = [v27 UUIDString];
      id v29 = [v6 statusString];
      v30 = [v6 uuid];
      v31 = [v30 UUIDString];
      v32 = [v6 statusString];
      *(_DWORD *)buf = 138544131;
      v48 = v28;
      __int16 v49 = 2113;
      id v50 = v29;
      __int16 v51 = 2114;
      v52 = v31;
      __int16 v53 = 2113;
      v54 = v32;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "removing item %{public}@/%{private}@ because another item (%{public}@/%{private}@) with the same bundleID and deviceID is being added", buf, 0x2Au);
    }
    [(NSMutableSet *)obj->_receivedItems removeObject:v42];
  }
  if ((v40 & 1) == 0) {
    goto LABEL_22;
  }
  BOOL v33 = 0;
LABEL_23:
  if (v38)
  {
    v34 = [(UACornerActionManagerHandler *)obj manager];
    [v34 scheduleBestAppDetermination];

    v35 = [(UASharingReceiver *)obj periodicCleanup];
    v36 = [v6 removeAfter];
    [v35 scheduleAt:v36];
  }
  objc_sync_exit(obj);

LABEL_26:
  return v33;
}

- (BOOL)addItem:(id)a3 scheduleUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6) {
    return 0;
  }
  id v7 = v6;
  uint64_t v8 = [v6 activityType];
  unsigned int v9 = [v8 isEqualToString:UAUserActivityTypeNowPlaying];

  if (v9)
  {
    long long v10 = dispatch_get_global_queue(0, 0);
    MRMediaRemoteGetActiveOrigin();

    BOOL v11 = 0;
  }
  else
  {
    BOOL v11 = [(UASharingReceiver *)self _addItem:v7 scheduleUpdates:v4];
  }

  return v11;
}

- (BOOL)removeItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [(NSMutableSet *)v5->_receivedItems containsObject:v4];
  if (v6)
  {
    [(NSMutableSet *)v5->_receivedItems removeObject:v4];
    id v7 = [(UACornerActionManagerHandler *)v5 manager];
    [v7 scheduleBestAppDetermination];
  }
  objc_sync_exit(v5);

  return v6;
}

- (void)removeAllFromDevice:(id)a3
{
  id v47 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v5 = [(UASharingReceiver *)v4 receivedItems];
  id v6 = [v5 countByEnumeratingWithState:&v48 objects:v56 count:16];
  p_isa = (id *)&v4->super.super.super.isa;
  if (!v6)
  {

    objc_sync_exit(v4);
    goto LABEL_28;
  }
  char v9 = 0;
  uint64_t v46 = *(void *)v49;
  *(void *)&long long v7 = 138543618;
  long long v44 = v7;
  id obj = v5;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v49 != v46) {
        objc_enumerationMutation(obj);
      }
      BOOL v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
      uint64_t v12 = objc_msgSend(v11, "peerDevice", v44);
      long long v13 = [v12 uniqueID];
      unsigned int v14 = [v13 isEqual:v47];

      if (v14)
      {
        long long v15 = +[NSDate date];
        if (([v11 isPayloadRequested] & 1) == 0
          && ![v11 isPayloadAvailable])
        {
          goto LABEL_11;
        }
        long long v16 = [v11 removeAfter];
        if (!v16) {
          goto LABEL_11;
        }
        [v15 timeIntervalSinceReferenceDate];
        double v18 = v17;
        unsigned int v19 = [v11 removeAfter];
        [v19 timeIntervalSinceReferenceDate];
        BOOL v21 = v18 > v20;

        if (!v21)
        {
          id v25 = [v11 currentUntilDate];
          if (!v25) {
            goto LABEL_16;
          }
          [v15 timeIntervalSinceReferenceDate];
          double v27 = v26;
          long long v28 = [v11 currentUntilDate];
          [v28 timeIntervalSinceReferenceDate];
          BOOL v30 = v27 > v29;

          if (!v30)
          {
LABEL_16:
            v31 = +[NSDate dateWithTimeInterval:v15 sinceDate:-1.0];
            [v11 setCurrentUntilDate:v31];
          }
          uint64_t v32 = +[UAUserActivityDefaults sharedDefaults];
          [(id)v32 receivedBTLEItemTimeToLiveAfterDeviceLostIfPayloadIsQueued];
          BOOL v33 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:");

          [v33 timeIntervalSinceReferenceDate];
          double v35 = v34;
          v36 = [v11 removeAfter];
          [v36 timeIntervalSinceReferenceDate];
          LOBYTE(v32) = v35 > v37;

          if ((v32 & 1) == 0) {
            [v11 setRemoveAfter:v33];
          }
          BOOL v38 = sub_10000BA18(0);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            v39 = [v11 uuid];
            char v40 = [v39 UUIDString];
            v41 = [v11 removeAfter];
            *(_DWORD *)buf = v44;
            __int16 v53 = v40;
            __int16 v54 = 2114;
            id v55 = v41;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "Retaining %{public}@ in _receivedItems because it's .payloadRequested or .payloadAvailable, so that it remains available for a bit, until %{public}@.", buf, 0x16u);
          }
          v42 = [p_isa periodicCleanup];
          long long v43 = [v11 removeAfter];
          [v42 scheduleAt:v43];
        }
        else
        {
LABEL_11:
          v22 = sub_10000BA18(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v23 = [v11 uuid];
            v24 = [v23 UUIDString];
            *(_DWORD *)buf = 138543619;
            __int16 v53 = v24;
            __int16 v54 = 2113;
            id v55 = v47;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "REMOVING: %{public}@ because it's on device %{private}@", buf, 0x16u);
          }
          [p_isa[8] removeObject:v11];
        }

        char v9 = 1;
      }
    }
    id v6 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  }
  while (v6);

  objc_sync_exit(p_isa);
  if (v9)
  {
    p_isa = [p_isa manager];
    [p_isa scheduleBestAppDetermination];
LABEL_28:
  }
}

- (void)periodicCleanupFunc
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SharingBTLEReceiver: Running periodicCleanupFunc to check for received items whose .removeAfter has passed.", buf, 2u);
  }

  v23 = +[NSDate date];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = [(UASharingReceiver *)v2 receivedItems];
  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v6 = 138543618;
    long long v22 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v10 = objc_msgSend(v9, "removeAfter", v22);
        if (!v10) {
          goto LABEL_11;
        }
        BOOL v11 = [v9 removeAfter];
        [v11 timeIntervalSinceReferenceDate];
        double v13 = v12;
        [v23 timeIntervalSinceReferenceDate];
        BOOL v15 = v13 > v14;

        if (v15)
        {
          long long v16 = [(UASharingReceiver *)v2 periodicCleanup];
          double v17 = [v9 removeAfter];
          [v16 scheduleAt:v17];
        }
        else
        {
LABEL_11:
          double v18 = sub_10000BA18(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            unsigned int v19 = [v9 uuid];
            double v20 = [v19 UUIDString];
            BOOL v21 = [v9 removeAfter];
            *(_DWORD *)buf = v22;
            double v29 = v20;
            __int16 v30 = 2114;
            v31 = v21;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Removing %{public}@ from .receivedItems because .removeAfter, %{public}@ has expired.", buf, 0x16u);
          }
          [(UASharingReceiver *)v2 removeItem:v9];
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (id)sharingBTLESuggestedItemForAdvertisementPayload:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(UASharingReceiver *)self receivedItems];
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        BOOL v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (!v7) {
          goto LABEL_19;
        }
        double v12 = [v7 uniqueID];
        double v13 = [v11 peerDevice];
        double v14 = [v13 uniqueID];
        unsigned int v15 = [v12 isEqual:v14];

        if (v15)
        {
LABEL_19:
          if (!v6
            || ([v11 advertisementPayload],
                long long v16 = objc_claimAutoreleasedReturnValue(),
                unsigned int v17 = [v6 isEqualHashedPayloadBytes:v16],
                v16,
                v17))
          {
            id v8 = v11;
            goto LABEL_14;
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v8;
}

- (void)activityScanner:(id)a3 receivedAdvertisement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478083;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "activityScanner:receivedAdvertisement: %{private}@,%{public}@)", buf, 0x16u);
  }

  uint64_t v9 = [(UACornerActionManagerHandler *)self manager];
  long long v10 = [v9 mainDispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050B3C;
  block[3] = &unk_1000C4F10;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v10, block);
}

- (void)receiveAdvertisement:(id)a3 scanner:(id)a4
{
  id v261 = a3;
  id v258 = a4;
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v261 advertisementPayload];
    sub_100003070(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [v261 options];
    uint64_t v9 = [v8 description];
    sub_100063FF0(v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = [v261 device];
    id v12 = [v11 name];
    double v13 = [v261 device];
    id v14 = [v13 uniqueID];
    *(_DWORD *)buf = 138544131;
    *(void *)v283 = v7;
    *(_WORD *)&v283[8] = 2114;
    *(void *)&v283[10] = v10;
    *(_WORD *)&v283[18] = 2113;
    *(void *)v284 = v12;
    *(_WORD *)&v284[8] = 2113;
    *(void *)v285 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Received Ad: %{public}@ opts=%{public}@ from %{private}@/%{private}@", buf, 0x2Au);
  }
  if (!v261) {
    sub_10007DAA8();
  }
  id v15 = [v261 device];
  if (!v15) {
    sub_10007DAD4();
  }

  long long v16 = [(UACornerActionManagerHandler *)self manager];
  unsigned __int8 v17 = [v16 activityReceivingAllowed];

  if (v17)
  {
    __int16 v18 = [(UACornerActionManagerHandler *)self manager];
    unsigned int v19 = [v18 isSharingModeBlockingReceiving];

    if (v19)
    {
      oslog = sub_10000BA18(0);
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        long long v20 = [v261 advertisementPayload];
        long long v21 = sub_100003070(v20);
        long long v22 = [v261 device];
        long long v23 = [v22 uniqueID];
        *(_DWORD *)buf = 138543619;
        *(void *)v283 = v21;
        *(_WORD *)&v283[8] = 2113;
        *(void *)&v283[10] = v23;
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEBUG, "Ignoring received advertisement because we are currently in a sharing mode that disallows it, %{public}@ from %{private}@", buf, 0x16u);
      }
      goto LABEL_47;
    }
    long long v28 = [(UASharingReceiver *)self activeDevices];
    double v29 = [v261 device];
    int v30 = [v28 containsObject:v29];

    if ((v30 & 1) == 0)
    {
      v31 = sub_10000BA18(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = [v261 device];
        *(_DWORD *)buf = 138477827;
        *(void *)v283 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "SIMULATING foundDeviceForIdentifier: %{private}@", buf, 0xCu);
      }
      BOOL v33 = [v261 device];
      [(UASharingReceiver *)self foundDevice:v33];
    }
    double v34 = [v261 device];
    double v35 = [v34 productBuildVersion];
    v36 = [v35 substringToIndex:3];
    uint64_t v37 = (uint64_t)[v36 integerValue];

    BOOL v38 = [v261 device];
    oslog = [v38 modelIdentifier];

    v39 = +[UAUserActivityDefaults sharedDefaults];
    if ([v39 multiHandoffEnabled])
    {
      unsigned __int8 v40 = [oslog containsString:@"Mac"];
      if (v37 > 17) {
        unsigned __int8 v41 = v40;
      }
      else {
        unsigned __int8 v41 = 0;
      }
      if ((v41 & 1) != 0
        || ((unsigned __int8 v42 = [oslog containsString:@"iPhone"], v37 > 15)
          ? (unsigned __int8 v43 = v42)
          : (unsigned __int8 v43 = 0),
            (v43 & 1) != 0))
      {
        unsigned int v44 = 1;
      }
      else
      {
        unsigned int v44 = [oslog containsString:@"iPad"] & (v37 > 15);
      }
    }
    else
    {
      unsigned int v44 = 0;
    }

    long long v45 = [v261 advertisementPayload];
    if (!v45
      || ([v261 advertisementPayload],
          uint64_t v46 = objc_claimAutoreleasedReturnValue(),
          BOOL v47 = sub_10006722C(v46),
          v46,
          v45,
          v47))
    {
      long long v48 = sub_10000BA18(0);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Received advertisement.advertisementPayload == nil", buf, 2u);
      }

      long long v49 = [v261 device];
      v262 = [v49 uniqueID];

      if (v44
        && (+[UAUserActivityDefaults sharedDefaults],
            long long v50 = objc_claimAutoreleasedReturnValue(),
            unsigned int v51 = [v50 multiHandoffEnabled],
            v50,
            v51))
      {
        v52 = self;
        objc_sync_enter(v52);
        long long v277 = 0u;
        long long v278 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        __int16 v53 = v52->_receivedItems;
        id v54 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v277 objects:v291 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v278;
          do
          {
            for (i = 0; i != v54; i = (char *)i + 1)
            {
              if (*(void *)v278 != v55) {
                objc_enumerationMutation(v53);
              }
              v57 = *(void **)(*((void *)&v277 + 1) + 8 * i);
              v58 = [v57 peerDevice];
              v59 = [v58 uniqueID];
              unsigned int v60 = [v59 isEqualToString:v262];

              if (v60) {
                [v57 setActive:0];
              }
            }
            id v54 = [(NSMutableSet *)v53 countByEnumeratingWithState:&v277 objects:v291 count:16];
          }
          while (v54);
        }

        objc_sync_exit(v52);
      }
      else
      {
        [(UASharingReceiver *)self removeAllFromDevice:v262];
      }
      v61 = [(UASharingReceiver *)self lastSeenPasteboardDevice];
      v62 = [v61 uniqueID];
      v63 = [v261 device];
      v64 = [v63 uniqueID];
      unsigned int v65 = [v62 isEqualToString:v64];

      if (v65)
      {
        [(UASharingReceiver *)self setLastSeenPasteboardDevice:0];
        v66 = [(UACornerActionManagerHandler *)self manager];
        v67 = [v66 pasteboardController];
        [v67 setRemotePasteboardAvalibility:0 withDataRequester:0];

        v68 = +[UADiagnosticManager sharedManager];
        [v68 submitRemotePasteboardBecameUnavailable:3];

        v69 = [(UASharingReceiver *)self remotePboardTimer];
        [v69 invalidate];

        [(UASharingReceiver *)self setRemotePboardTimer:0];
      }

      id v263 = [(UACornerActionManagerHandler *)self manager];
      [v263 scheduleBestAppDetermination];
      id v261 = 0;
LABEL_46:

      goto LABEL_47;
    }
    v262 = [[SharingBTLEAdvertisementPayload alloc] initWithSFActivityAdvertisement:v261];
    v70 = [(SharingBTLEAdvertisementPayload *)v262 options];
    v71 = [v70 objectForKeyedSubscript:@"UAPasteboardAvailable"];
    if ([v71 BOOLValue])
    {
      v72 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v73 = [v72 clipboardSharingEnabled];

      if (v73)
      {
        v74 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "[PBOARD] Received pboard available advertisement", buf, 2u);
        }

        v75 = [(SharingBTLEAdvertisementPayload *)v262 options];
        v76 = [v75 objectForKeyedSubscript:@"UAPasteboardVersionBit"];
        unsigned int v77 = [v76 BOOLValue];

        v78 = [(UASharingReceiver *)self lastSeenPasteboardDevice];
        v79 = [v261 device];
        LODWORD(v76) = [v78 isEqual:v79];

        v80 = sub_10000BA18(@"pasteboard-server");
        uint64_t v81 = v77;
        BOOL v82 = os_log_type_enabled(v80, OS_LOG_TYPE_INFO);
        if (!v76)
        {
          if (v82)
          {
            *(_WORD *)buf = 0;
            v83 = "[PBOARD] Ad is from new device, notify client";
            goto LABEL_67;
          }
LABEL_68:

          v95 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "[PBOARD] Notify client of new remote pboard and reset timmer", buf, 2u);
          }

          v96 = [v261 device];
          [(UASharingReceiver *)self setLastSeenPasteboardDevice:v96];

          [(UASharingReceiver *)self setLastSeenPasteboardVersionBit:v81];
          v97 = objc_alloc_init(UASharedPasteboardDataRequester);
          v98 = [v261 device];
          [(UASharedPasteboardDataRequester *)v97 setPeer:v98];

          [(UASharedPasteboardDataRequester *)v97 setScanner:v258];
          v99 = [(UACornerActionManagerHandler *)self manager];
          v100 = [v99 pasteboardController];
          [v100 setRemotePasteboardAvalibility:1 withDataRequester:v97];

          v101 = +[UADiagnosticManager sharedManager];
          [v101 submitRemotePasteboardBecameAvailable];

          v102 = +[UAUserActivityDefaults sharedDefaults];
          [v102 remotePasteboardAvailableTimeout];
          double v104 = v103;

          v105 = [(UASharingReceiver *)self remotePboardTimer];
          [v105 invalidate];

          v106 = +[NSTimer timerWithTimeInterval:self target:"clearRemotePasteboardAvailable:" selector:0 userInfo:0 repeats:v104];
          [(UASharingReceiver *)self setRemotePboardTimer:v106];

          v107 = +[NSRunLoop mainRunLoop];
          v108 = [(UASharingReceiver *)self remotePboardTimer];
          [v107 addTimer:v108 forMode:NSRunLoopCommonModes];

          goto LABEL_71;
        }
        if (v82)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "[PBOARD] Ad is from last seen device", buf, 2u);
        }

        if ((id)[(UASharingReceiver *)self lastSeenPasteboardVersionBit] != (id)v77)
        {
          v80 = sub_10000BA18(@"pasteboard-server");
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v83 = "[PBOARD] Pboard version bit flipped, notify client";
LABEL_67:
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, v83, buf, 2u);
            goto LABEL_68;
          }
          goto LABEL_68;
        }
LABEL_71:
        v109 = sub_10000BA18(0);
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
        {
          v110 = [v261 device];
          v111 = [v110 name];
          v112 = [v261 device];
          v113 = [v112 uniqueID];
          *(_DWORD *)buf = 138543875;
          *(void *)v283 = v262;
          *(_WORD *)&v283[8] = 2113;
          *(void *)&v283[10] = v111;
          *(_WORD *)&v283[18] = 2113;
          *(void *)v284 = v113;
          _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEBUG, " -- Looking for activity matching advertisingPayload %{public}@, from %{private}@/%{private}@", buf, 0x20u);
        }
        v114 = [v261 device];
        v115 = [(UASharingReceiver *)self sharingBTLESuggestedItemForAdvertisementPayload:v262 forDevice:v114];

        if (v115)
        {
          v116 = [v115 bundleIdentifier];
          BOOL v117 = v116 == 0;

          if (!v117)
          {
LABEL_75:
            id v263 = v115;
LABEL_76:
            v118 = [(SharingBTLEAdvertisementPayload *)v262 description];
            v119 = [v263 activityType];
            v120 = [v263 dynamicActivityType];
            v121 = [v261 device];
            v122 = [v121 name];
            v123 = [v261 device];
            v124 = [v123 uniqueID];
            v125 = +[NSString stringWithFormat:@"SCANNING:Received %@ %@ %@ from %@/%@", v118, v119, v120, v122, v124];
            +[ActivityManagerDebuggingManager appendRecentAction:v125];

            LODWORD(v125) = -[SharingBTLEAdvertisementPayload compareOptionBits:](v262, "compareOptionBits:", [v263 optionBits]);
            v126 = sub_10000BA18(0);
            BOOL v127 = os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG);
            if (v125)
            {
              if (v127)
              {
                v128 = [v261 advertisementPayload];
                sub_100003070(v128);
                id v129 = (id)objc_claimAutoreleasedReturnValue();
                v130 = [v261 device];
                v131 = [v130 uniqueID];
                v132 = [v263 uuid];
                v133 = [v132 UUIDString];
                *(_DWORD *)buf = 138544131;
                *(void *)v283 = v129;
                *(_WORD *)&v283[8] = 2113;
                *(void *)&v283[10] = v131;
                *(_WORD *)&v283[18] = 2114;
                *(void *)v284 = v133;
                *(_WORD *)&v284[8] = 2113;
                *(void *)v285 = v263;
                _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEBUG, " -- Found matching advertisingPayload to item already received from this device, %{public}@/%{private}@, so using it. %{public}@/%{private}@", buf, 0x2Au);
              }
              if ([v263 isPayloadAvailable])
              {
                v134 = [v263 advertisementPayload];
                v135 = [v134 time];
                v136 = [(SharingBTLEAdvertisementPayload *)v262 time];
                unsigned __int8 v137 = [v135 isEqual:v136];

                if ((v137 & 1) == 0)
                {
                  v138 = sub_10000BA18(0);
                  if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                  {
                    v139 = [v263 uuid];
                    v140 = [v139 UUIDString];
                    *(_DWORD *)buf = 138543619;
                    *(void *)v283 = v140;
                    *(_WORD *)&v283[8] = 2113;
                    *(void *)&v283[10] = v263;
                    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, " -- Clearing payload of item %{public}@/%{private}@ because the last active time from that device has changed.", buf, 0x16u);
                  }
                  v141 = +[NSDate dateWithTimeIntervalSinceNow:8.0];
                  [v263 setDontPrefetchBefore:v141];

                  [v263 clearPayload];
                }
              }
              v142 = self;
              objc_sync_enter(v142);
              long long v273 = 0u;
              long long v274 = 0u;
              long long v275 = 0u;
              long long v276 = 0u;
              v143 = v142->_receivedItems;
              id v144 = [(NSMutableSet *)v143 countByEnumeratingWithState:&v273 objects:v290 count:16];
              if (v144)
              {
                uint64_t v145 = *(void *)v274;
                do
                {
                  for (j = 0; j != v144; j = (char *)j + 1)
                  {
                    if (*(void *)v274 != v145) {
                      objc_enumerationMutation(v143);
                    }
                    [*(id *)(*((void *)&v273 + 1) + 8 * (void)j) resignCurrent];
                  }
                  id v144 = [(NSMutableSet *)v143 countByEnumeratingWithState:&v273 objects:v290 count:16];
                }
                while (v144);
              }

              objc_sync_exit(v142);
              [v263 updateFromSFAdvertisement:v261];
              v147 = [(UACornerActionManagerHandler *)v142 manager];
              [v147 scheduleBestAppDetermination];
              goto LABEL_108;
            }
            if (v127)
            {
              unsigned __int8 obja = [v263 optionBits];
              v148 = [v263 options];
              v149 = [v148 description];
              v150 = sub_100063FF0(v149);
              unsigned int v253 = [(SharingBTLEAdvertisementPayload *)v262 optionBits];
              v151 = [(SharingBTLEAdvertisementPayload *)v262 options];
              v152 = [v151 description];
              v153 = sub_100063FF0(v152);
              v154 = [v261 advertisementPayload];
              v155 = sub_100003070(v154);
              *(_DWORD *)buf = 67110403;
              *(_DWORD *)v283 = obja;
              *(_WORD *)&v283[4] = 2114;
              *(void *)&v283[6] = v150;
              *(_WORD *)&v283[14] = 1024;
              *(_DWORD *)&v283[16] = v253;
              *(_WORD *)v284 = 2114;
              *(void *)&v284[2] = v153;
              *(_WORD *)v285 = 2114;
              *(void *)&v285[2] = v155;
              *(_WORD *)v286 = 2113;
              *(void *)&v286[2] = v263;
              _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEBUG, " -- Because the optionBits in the packet changed, from %x%{public}@ to %x%{public}@, discarding current item and starting fresh, %{public}@ / %{private}@", buf, 0x36u);
            }
            [(UASharingReceiver *)self removeItem:v263];
            v147 = v263;
            goto LABEL_107;
          }
          v156 = [v261 advertisementPayload];
          v157 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:v261 optionBits:sub_1000671C4(v156) scanner:v258 receiver:self];

          v158 = [v157 bundleIdentifier];

          if (!v158)
          {

            goto LABEL_75;
          }
          v159 = sub_10000BA18(0);
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            v160 = [v157 bundleIdentifier];
            *(_DWORD *)buf = 138543619;
            *(void *)v283 = v262;
            *(_WORD *)&v283[8] = 2113;
            *(void *)&v283[10] = v160;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEBUG, "SFRECEIVER: Replacing received advertisement %{public}@ because it matches a new bundleIdentifier %{private}@", buf, 0x16u);
          }
          id v263 = v157;

          if (v263) {
            goto LABEL_76;
          }
        }
        if ([(SharingBTLEAdvertisementPayload *)v262 advertisementKind] == 2)
        {
          v161 = [v261 device];
          v147 = [(UASharingReceiver *)self sharingBTLESuggestedItemForAdvertisementPayload:0 forDevice:v161];

          if (v147)
          {
            v162 = [v147 advertisementPayload];
            BOOL v163 = [v162 advertisementKind] == 2;

            if (v163)
            {
              v164 = [v261 advertisementPayload];
              v165 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:v261 optionBits:sub_1000671C4(v164) scanner:v258 receiver:self];

              v166 = [v165 bundleIdentifier];
              v167 = [v147 bundleIdentifier];
              LODWORD(v164) = [v166 isEqual:v167];

              v168 = sub_10000BA18(0);
              BOOL v169 = os_log_type_enabled(v168, OS_LOG_TYPE_DEBUG);
              if (v164)
              {
                if (v169)
                {
                  v170 = [0 bundleIdentifier];
                  v171 = [v261 advertisementPayload];
                  v172 = sub_100003070(v171);
                  v173 = [v261 device];
                  v174 = [v173 uniqueID];
                  *(_DWORD *)buf = 138478595;
                  *(void *)v283 = v170;
                  *(_WORD *)&v283[8] = 2114;
                  *(void *)&v283[10] = v172;
                  *(_WORD *)&v283[18] = 2113;
                  *(void *)v284 = v174;
                  *(_WORD *)&v284[8] = 2113;
                  *(void *)v285 = 0;
                  _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_DEBUG, " -- Matching dns- item to previously received one, mapping to %{private}@, for item already received from this device, %{public}@/%{private}@, so using it. %{private}@", buf, 0x2Au);
                }
                id v263 = v147;
                [v263 updateFromSFAdvertisement:v261];
                v175 = [(UACornerActionManagerHandler *)self manager];
                [v175 scheduleBestAppDetermination];
              }
              else
              {
                if (v169)
                {
                  v249 = [v147 advertisementPayload];
                  *(_DWORD *)buf = 138543875;
                  *(void *)v283 = v249;
                  *(_WORD *)&v283[8] = 2114;
                  *(void *)&v283[10] = v262;
                  *(_WORD *)&v283[18] = 2113;
                  *(void *)v284 = v147;
                  _os_log_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_DEBUG, " -- New advertisement of DNS type didn't seem to match to same app as  previous one, %{public}@ vs %{public}@, so can't use it. %{private}@", buf, 0x20u);
                }
                [(UASharingReceiver *)self removeItem:v147];
                id v263 = 0;
              }

LABEL_108:
              id v181 = [(UACornerActionManagerHandler *)self manager];
              v182 = [v181 pingController];
              if (v182)
              {
                BOOL v183 = [(SharingBTLEAdvertisementPayload *)v262 advertisementKind] == 5;

                if (!v183) {
                  goto LABEL_112;
                }
                v184 = [v261 advertisementPayload];
                v185 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:v261 optionBits:sub_1000671C4(v184) scanner:v258 receiver:self];

                v270[0] = _NSConcreteStackBlock;
                v270[1] = 3221225472;
                v270[2] = sub_100052C98;
                v270[3] = &unk_1000C4CC8;
                id v271 = v185;
                v272 = self;
                id v263 = v271;
                [v271 requestPayloadWithCompletionHandler:v270];
                id v181 = v271;
              }

LABEL_112:
              if (!v263)
              {
                v186 = [v261 advertisementPayload];
                unsigned int v187 = sub_1000671C4(v186);

                v188 = [(UASharingReceiver *)self activeDevices];
                BOOL v189 = (unint64_t)[v188 count] > 1;

                if (v189) {
                  uint64_t v190 = v187 | 0x40;
                }
                else {
                  uint64_t v190 = v187;
                }
                id v263 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithSFAdvertisement:v261 optionBits:v190 scanner:v258 receiver:self];
                v191 = sub_10000BA18(0);
                if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
                {
                  v192 = [v261 advertisementPayload];
                  sub_100003070(v192);
                  id v193 = (id)objc_claimAutoreleasedReturnValue();
                  v194 = [v263 activityType];
                  v251 = [v263 bundleIdentifier];
                  v254 = [v263 uuid];
                  id objb = [v254 UUIDString];
                  v252 = [v261 device];
                  v250 = [v252 name];
                  v195 = [v261 device];
                  v196 = [v195 uniqueID];
                  v197 = [v261 options];
                  v198 = [v197 description];
                  sub_100063FF0(v198);
                  id v199 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544899;
                  *(void *)v283 = v193;
                  *(_WORD *)&v283[8] = 2113;
                  *(void *)&v283[10] = v194;
                  *(_WORD *)&v283[18] = 2113;
                  *(void *)v284 = v251;
                  *(_WORD *)&v284[8] = 2114;
                  *(void *)v285 = objb;
                  *(_WORD *)&v285[8] = 2113;
                  *(void *)v286 = v250;
                  *(_WORD *)&v286[8] = 2113;
                  v287 = v196;
                  __int16 v288 = 2114;
                  id v289 = v199;
                  _os_log_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_DEFAULT, "# RECEIVED advertisement, %{public}@ type=%{private}@ -> %{private}@, %{public}@, from %{private}@/%{private}@ options=%{public}@", buf, 0x48u);
                }
                if ((v44 & 1) == 0)
                {
                  v200 = [v261 device];
                  v201 = [v200 uniqueID];
                  [(UASharingReceiver *)self removeAllFromDevice:v201];
                }
                [(UASharingReceiver *)self addItem:v263 scheduleUpdates:1];
                v202 = +[UADiagnosticManager sharedManager];
                v203 = [v263 activityType];
                [v202 submitUserActivityWasDiscovered:v203];
              }
              v204 = +[UAUserActivityDefaults sharedDefaults];
              if ([v204 multiHandoffEnabled])
              {
                v205 = [(SharingBTLEAdvertisementPayload *)v262 options];
                v206 = [v205 objectForKeyedSubscript:UAUserActivityAutoPullActivitiesListKey];
                unsigned int v207 = [v206 BOOLValue];

                if (v207)
                {
                  v208 = [v261 device];
                  v209 = [v208 uniqueID];
                  unsigned __int8 v210 = [v209 isEqualToString:self->_lastAutoPullActivitiesRequesterId];

                  if ((v210 & 1) == 0)
                  {
                    v211 = sub_10000BA18(0);
                    if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_DEFAULT, "received UAUserActivityAutoPullActivitiesListKey bit on, fetching more app suggestions", buf, 2u);
                    }

                    v212 = [v261 device];
                    v213 = [v212 uniqueID];
                    lastAutoPullActivitiesRequesterId = self->_lastAutoPullActivitiesRequesterId;
                    self->_lastAutoPullActivitiesRequesterId = v213;

                    v215 = [v261 device];
                    [(UASharingReceiver *)self fetchMoreAppSuggestionsFromDevice:v215];
                    goto LABEL_130;
                  }
                  goto LABEL_131;
                }
              }
              else
              {
              }
              v216 = [v261 device];
              v217 = [v216 uniqueID];
              unsigned int v218 = [v217 isEqualToString:self->_lastAutoPullActivitiesRequesterId];

              if (v218)
              {
                v215 = self->_lastAutoPullActivitiesRequesterId;
                self->_lastAutoPullActivitiesRequesterId = 0;
LABEL_130:
              }
LABEL_131:
              if ([v263 active])
              {
                v219 = self;
                objc_sync_enter(v219);
                long long v266 = 0u;
                long long v267 = 0u;
                long long v268 = 0u;
                long long v269 = 0u;
                id obj = v219;
                v220 = v219->_receivedItems;
                id v221 = [(NSMutableSet *)v220 countByEnumeratingWithState:&v266 objects:v281 count:16];
                if (v221)
                {
                  uint64_t v222 = *(void *)v267;
                  do
                  {
                    for (k = 0; k != v221; k = (char *)k + 1)
                    {
                      if (*(void *)v267 != v222) {
                        objc_enumerationMutation(v220);
                      }
                      v224 = *(void **)(*((void *)&v266 + 1) + 8 * (void)k);
                      if (([v224 isEqual:v263] & 1) == 0)
                      {
                        v225 = [v224 peerDevice];
                        v226 = [v225 uniqueID];
                        v227 = [v263 peerDevice];
                        v228 = [v227 uniqueID];
                        unsigned int v229 = [v226 isEqualToString:v228];

                        if (v229) {
                          [v224 setActive:0];
                        }
                      }
                    }
                    id v221 = [(NSMutableSet *)v220 countByEnumeratingWithState:&v266 objects:v281 count:16];
                  }
                  while (v221);
                }

                objc_sync_exit(obj);
              }
              if (v263)
              {
                v230 = +[UAUserActivityDefaults sharedDefaults];
                unsigned int v231 = [v230 debugEnablePrefetch];

                if (v231)
                {
                  [(SharingBTLEAdvertisementPayload *)v262 isCurrent];
                  v232 = sub_10000BA18(0);
                  if (os_log_type_enabled(v232, OS_LOG_TYPE_DEFAULT))
                  {
                    v233 = [v263 uuid];
                    v234 = [v233 UUIDString];
                    id v235 = [v263 statusString];
                    *(_DWORD *)buf = 138543619;
                    *(void *)v283 = v234;
                    *(_WORD *)&v283[8] = 2113;
                    *(void *)&v283[10] = v235;
                    _os_log_impl((void *)&_mh_execute_header, v232, OS_LOG_TYPE_DEFAULT, "*** Checking whether to do a pre-emptive fetch of the payload for item %{public}@/%{private}@", buf, 0x16u);
                  }
                  v236 = [v263 dontPrefetchBefore];
                  if (v236)
                  {
                    v237 = [v263 dontPrefetchBefore];
                    BOOL v238 = sub_100063CFC(v237);

                    if (v238) {
                      [v263 setDontPrefetchBefore:0];
                    }
                  }
                  v239 = [v263 dontPrefetchBefore];

                  if (v239)
                  {
                    v240 = sub_10000BA18(0);
                    if (os_log_type_enabled(v240, OS_LOG_TYPE_DEFAULT))
                    {
                      v241 = [v263 uuid];
                      v242 = [v241 UUIDString];
                      id v243 = [v263 statusString];
                      v244 = [v263 dontPrefetchBefore];
                      *(_DWORD *)buf = 138543875;
                      *(void *)v283 = v242;
                      *(_WORD *)&v283[8] = 2113;
                      *(void *)&v283[10] = v243;
                      *(_WORD *)&v283[18] = 2114;
                      *(void *)v284 = v244;
                      _os_log_impl((void *)&_mh_execute_header, v240, OS_LOG_TYPE_DEFAULT, "*** Ignoring prefetch for item %{public}@/%{private}@ because dontPrefetchBefore=%{public}@", buf, 0x20u);
                    }
                  }
                  if (([v263 isPayloadRequested] & 1) == 0
                    && ([v263 isPayloadAvailable] & 1) == 0)
                  {
                    v245 = sub_10000BA18(0);
                    if (os_log_type_enabled(v245, OS_LOG_TYPE_DEFAULT))
                    {
                      v246 = [v263 uuid];
                      v247 = [v246 UUIDString];
                      id v248 = [v263 statusString];
                      *(_DWORD *)buf = 138543619;
                      *(void *)v283 = v247;
                      *(_WORD *)&v283[8] = 2113;
                      *(void *)&v283[10] = v248;
                      _os_log_impl((void *)&_mh_execute_header, v245, OS_LOG_TYPE_DEFAULT, "*** Scheduling a pre-emptive fetch of the payload for item %{public}@/%{private}@", buf, 0x16u);
                    }
                    v264[0] = _NSConcreteStackBlock;
                    v264[1] = 3221225472;
                    v264[2] = sub_100052EF0;
                    v264[3] = &unk_1000C5DF0;
                    id v265 = v263;
                    id v263 = v265;
                    [v265 requestPayloadWithCompletionHandler:v264];
                  }
                }
              }
              goto LABEL_46;
            }
          }
        }
        else
        {
          v147 = [(SharingBTLEAdvertisementPayload *)v262 description];
          v176 = [v261 device];
          v177 = [v176 name];
          v178 = [v261 device];
          v179 = [v178 uniqueID];
          v180 = +[NSString stringWithFormat:@"SCANNING:Received %@ (no match) from %@/%@", v147, v177, v179];
          +[ActivityManagerDebuggingManager appendRecentAction:v180];
        }
LABEL_107:
        id v263 = 0;
        goto LABEL_108;
      }
    }
    else
    {
    }
    v84 = [(UASharingReceiver *)self lastSeenPasteboardDevice];
    if (v84)
    {
      v85 = [(UASharingReceiver *)self lastSeenPasteboardDevice];
      v86 = [v85 uniqueID];
      v87 = [v261 device];
      v88 = [v87 uniqueID];
      unsigned int v89 = [v86 isEqualToString:v88];

      if (v89)
      {
        v90 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "[PBOARD] Recived add w/o remote pboard for last seen device, notify client and clear timmer", buf, 2u);
        }

        [(UASharingReceiver *)self setLastSeenPasteboardDevice:0];
        v91 = [(UACornerActionManagerHandler *)self manager];
        v92 = [v91 pasteboardController];
        [v92 setRemotePasteboardAvalibility:0 withDataRequester:0];

        v93 = +[UADiagnosticManager sharedManager];
        [v93 submitRemotePasteboardBecameUnavailable:3];

        v94 = [(UASharingReceiver *)self remotePboardTimer];
        [v94 invalidate];

        [(UASharingReceiver *)self setRemotePboardTimer:0];
      }
    }
    goto LABEL_71;
  }
  oslog = sub_10000BA18(0);
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    long long v24 = [v261 advertisementPayload];
    long long v25 = sub_100003070(v24);
    long long v26 = [v261 device];
    long long v27 = [v26 uniqueID];
    *(_DWORD *)buf = 138543619;
    *(void *)v283 = v25;
    *(_WORD *)&v283[8] = 2113;
    *(void *)&v283[10] = v27;
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Ignoring received ActivityContinuation because the current profile disallows it, %{public}@ from %{private}@", buf, 0x16u);
  }
LABEL_47:
}

- (BOOL)fetchMoreAppSuggestions
{
  long long v20 = [(UASharingReceiver *)self sfActivityScanner];
  char v35 = 0;
  uint64_t v34 = 0;
  unsigned int v19 = +[NSData dataWithBytes:&v34 length:8];
  v2 = +[UAUserActivityDefaults sharedDefaults];
  [v2 handoffPayloadRequestTimout];
  double v4 = v3;

  objc_initWeak(&location, self);
  id v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(UASharingReceiver *)self activeDevices];
    id v7 = [v6 count];
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "issuing handoff-more_items command for %lu devices", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x2020000000;
  id v33 = 0;
  id v8 = [(UASharingReceiver *)self activeDevices];
  id v9 = [v8 count];

  id v33 = v9;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = [(UASharingReceiver *)self activeDevices];
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v26;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10005332C;
        v21[3] = &unk_1000C5E18;
        p_long long buf = &buf;
        objc_copyWeak(&v24, &location);
        v21[4] = v14;
        id v22 = v20;
        [v22 activityPayloadFromDevice:v14 forAdvertisementPayload:v19 command:@"handoff-more_items" timeout:(uint64_t)v4 withCompletionHandler:v21];

        objc_destroyWeak(&v24);
      }
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  id v15 = [(UASharingReceiver *)self activeDevices];
  BOOL v16 = [v15 count] != 0;

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(&location);

  return v16;
}

- (void)fetchMoreAppSuggestionsFromDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(UASharingReceiver *)self sfActivityScanner];
  char v21 = 0;
  uint64_t v20 = 0;
  id v6 = +[NSData dataWithBytes:&v20 length:8];
  id v7 = +[UAUserActivityDefaults sharedDefaults];
  [v7 handoffPayloadRequestTimout];
  double v9 = v8;

  objc_initWeak(&location, self);
  id v10 = sub_10000BA18(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "issuing handoff-more_items command for device %@", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000535CC;
  v13[3] = &unk_1000C5E40;
  objc_copyWeak(&v16, &location);
  id v11 = v4;
  id v14 = v11;
  id v12 = v5;
  id v15 = v12;
  [v12 activityPayloadFromDevice:v11 forAdvertisementPayload:v6 command:@"handoff-more_items" timeout:(uint64_t)v9 withCompletionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)addNewItemsFromPayloads:(id)a3 device:(id)a4 scanner:(id)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  id v40 = a3;
  id v10 = a4;
  id v44 = a5;
  v39 = +[NSMutableArray array];
  unsigned __int8 v54 = 0;
  [v40 getBytes:&v54 length:1];
  if ((unint64_t)[v40 length] >= 2)
  {
    unint64_t v11 = 1;
    do
    {
      id v12 = objc_msgSend(v40, "subdataWithRange:", v11, v54);
      [v39 addObject:v12];

      v11 += v54;
    }
    while (v11 < (unint64_t)[v40 length]);
  }
  double v13 = sub_10000BA18(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v39 count];
    id v15 = [v10 description];
    *(_DWORD *)long long buf = 134218242;
    id v58 = v14;
    __int16 v59 = 2112;
    unsigned int v60 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "got back %lu items for handoff-more_items command from device %@", buf, 0x16u);
  }
  if ([v39 count] || v6)
  {
    long long v45 = +[NSMutableSet set];
    id v41 = +[NSMutableSet set];
    id v16 = self;
    objc_sync_enter(v16);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v16->_receivedItems;
    id v17 = [(NSMutableSet *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v51;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          char v21 = [v20 peerDevice];
          id v22 = [v21 uniqueID];
          long long v23 = [v10 uniqueID];
          unsigned int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            if ([v20 active])
            {
              long long v25 = [v20 bundleIdentifier];
              BOOL v26 = v25 == 0;

              if (!v26)
              {
                long long v27 = [v20 bundleIdentifier];
                [v45 addObject:v27];
              }
            }
          }
          else
          {
            [v41 addObject:v20];
          }
        }
        id v17 = [(NSMutableSet *)obj countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v17);
    }

    objc_storeStrong((id *)&v16->_receivedItems, v41);
    objc_sync_exit(v16);

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obja = v39;
    id v28 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (v28)
    {
      double v29 = 0;
      uint64_t v30 = *(void *)v47;
      do
      {
        v31 = 0;
        uint64_t v32 = v29;
        do
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(obja);
          }
          id v33 = +[SharingBTLESuggestedItem cornerActionBTLEItemWithPayload:*(void *)(*((void *)&v46 + 1) + 8 * (void)v31) device:v10 options:&__NSDictionary0__struct optionBits:sub_1000671C4(*(void **)(*((void *)&v46 + 1) + 8 * (void)v31)) scanner:v44 receiver:v16];
          uint64_t v34 = [v33 bundleIdentifier];
          objc_msgSend(v33, "setActive:", objc_msgSend(v45, "containsObject:", v34));

          char v35 = [v33 when];
          BOOL v36 = [v32 compare:v35] == (id)1;

          if (v36)
          {
            uint64_t v37 = [v32 dateByAddingTimeInterval:1.0];
            [v33 setWhen:v37];
          }
          double v29 = [v33 when];

          [(UASharingReceiver *)v16 addItem:v33 scheduleUpdates:0];
          v31 = (char *)v31 + 1;
          uint64_t v32 = v29;
        }
        while (v28 != v31);
        id v28 = [obja countByEnumeratingWithState:&v46 objects:v55 count:16];
      }
      while (v28);
    }
    BOOL v38 = [(UACornerActionManagerHandler *)v16 manager];
    [v38 scheduleBestAppDetermination];
  }
}

- (id)statusString
{
  v71 = +[NSMutableString string];
  unsigned int v3 = [(UACornerActionManagerHandler *)self suspended];
  id v4 = "SUSPENDED";
  if (!v3) {
    id v4 = "";
  }
  unsigned int v73 = v4;
  if ([(UASharingReceiver *)self active]) {
    id v5 = "";
  }
  else {
    id v5 = "DISABLED";
  }
  BOOL v6 = [(UAReceiver *)self scanningForTypes];
  if ([v6 containsObject:off_1000E5C68]) {
    CFStringRef v7 = @" UA";
  }
  else {
    CFStringRef v7 = &stru_1000C6800;
  }
  double v8 = [(UAReceiver *)self scanningForTypes];
  if ([v8 containsObject:off_1000E5C70]) {
    CFStringRef v9 = @" Clip";
  }
  else {
    CFStringRef v9 = &stru_1000C6800;
  }
  id v10 = [(UASharingReceiver *)self sfActivityScanner];
  if (v10) {
    CFStringRef v11 = &stru_1000C6800;
  }
  else {
    CFStringRef v11 = @"(NO SFActivityScanner) ";
  }
  id v12 = [(UACornerActionManagerHandler *)self manager];
  unsigned int v13 = [v12 isBluetoothEnabled];
  CFStringRef v14 = @" (Bluetooth disabled)";
  if (v13) {
    CFStringRef v14 = &stru_1000C6800;
  }
  CFStringRef v56 = v7;
  id v15 = v71;
  [v71 appendFormat:@"SharingBTLE receiver %s%s%@%@ %@%@", v73, v5, v56, v9, v11, v14];

  id v16 = [(UASharingReceiver *)self sfActivityScanners];
  id v17 = [v16 count];

  if (v17 != (id)1)
  {
    uint64_t v18 = [(UASharingReceiver *)self sfActivityScanners];
    objc_msgSend(v71, "appendFormat:", @"%ld scanners", objc_msgSend(v18, "count"));
  }
  [v71 appendString:@"\n"];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  unsigned int v60 = self;
  id obj = [(UASharingReceiver *)self receivedItems];
  id v61 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v81;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v81 != v59) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(*((void *)&v80 + 1) + 8 * v19);
        char v21 = v20;
        uint64_t v70 = v19;
        if (v20
          && ([v20 scanner], id v22 = objc_claimAutoreleasedReturnValue(), v22, v22))
        {
          long long v23 = [v21 scanner];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          CFStringRef v25 = &stru_1000C6800;
          if ((isKindOfClass & 1) == 0)
          {
            BOOL v26 = [v21 scanner];
            objc_opt_class();
            char v27 = objc_opt_isKindOfClass();

            if (v27)
            {
              id v28 = [v21 scanner];
              double v29 = [v28 controller];
              CFStringRef v25 = [(id)objc_opt_class() description];
            }
          }
        }
        else
        {
          CFStringRef v25 = &stru_1000C6800;
        }

        uint64_t v30 = [v21 activityType];
        v69 = [v21 dynamicActivityType];
        if (v69)
        {
          v64 = [v21 dynamicActivityType];
          v62 = +[NSString stringWithFormat:@":%@", v64];
          CFStringRef v66 = v62;
        }
        else
        {
          CFStringRef v66 = &stru_1000C6800;
        }
        v31 = [v21 bundleIdentifier];
        uint64_t v32 = [v21 uuid];
        id v74 = [v32 UUIDString];
        v68 = [v21 advertisementPayload];
        v72 = [v68 description];
        v67 = [v21 peerDevice];
        id v33 = [v67 name];
        uint64_t v34 = [v21 when];
        char v35 = [v21 removeAfter];
        BOOL v36 = (__CFString *)v25;
        if (v35)
        {
          unsigned int v65 = [v21 removeAfter];
          sub_10007C018(v65);
          CFStringRef v37 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          v63 = (__CFString *)v37;
        }
        else
        {
          CFStringRef v37 = @"-";
        }
        if ([v21 isPayloadRequested]) {
          BOOL v38 = " (PayloadReq)";
        }
        else {
          BOOL v38 = "";
        }
        unsigned int v39 = [v21 isPayloadAvailable];
        id v40 = " (PayloadAv)";
        if (!v39) {
          id v40 = "";
        }
        v57 = v38;
        id v15 = v71;
        [v71 appendFormat:@" - %@%@%@ app:%@ %@ data=%@, from %@ at %@ remove at %@%s%s\n", v36, v30, v66, v31, v74, v72, v33, v34, v37, v57, v40];
        if (v35)
        {
        }
        if (v69)
        {
        }
        uint64_t v19 = v70 + 1;
      }
      while (v61 != (id)(v70 + 1));
      id v61 = [obj countByEnumeratingWithState:&v80 objects:v85 count:16];
    }
    while (v61);
  }

  [v15 appendFormat:@" ActiveDevices:"];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v75 = [(UASharingReceiver *)v60 activeDevices];
  id v41 = [v75 countByEnumeratingWithState:&v76 objects:v84 count:16];
  if (v41)
  {
    id v42 = v41;
    uint64_t v43 = *(void *)v77;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v77 != v43) {
          objc_enumerationMutation(v75);
        }
        long long v45 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        long long v46 = [v45 uniqueID];
        long long v47 = [(UASharingReceiver *)v60 lastSeenPasteboardDevice];
        long long v48 = [v47 uniqueID];
        unsigned int v49 = [v46 isEqualToString:v48];
        long long v50 = &stru_1000C6800;
        if (v49) {
          long long v50 = @", pb";
        }
        long long v51 = v50;

        long long v52 = [v45 name];
        long long v53 = [v45 modelIdentifier];
        id v15 = v71;
        [v71 appendFormat:@"(%@,%@%@)", v52, v53, v51];
      }
      id v42 = [v75 countByEnumeratingWithState:&v76 objects:v84 count:16];
    }
    while (v42);
  }

  [v15 appendString:@"\n"];
  id v54 = [v15 copy];

  return v54;
}

- (BOOL)terminate
{
  unsigned int v3 = [(UASharingReceiver *)self periodicCleanup];
  [v3 reset];

  id v4 = [(UASharingReceiver *)self periodicCleanup];
  [v4 waitUntilComplete];

  return 1;
}

- (void)clearRemotePasteboardAvailable:(id)a3
{
  [(UASharingReceiver *)self setLastSeenPasteboardDevice:0];
  id v4 = [(UACornerActionManagerHandler *)self manager];
  id v5 = [v4 pasteboardController];
  [v5 setRemotePasteboardAvalibility:0 withDataRequester:0];

  BOOL v6 = +[UADiagnosticManager sharedManager];
  [v6 submitRemotePasteboardBecameUnavailable:2];

  CFStringRef v7 = [(UASharingReceiver *)self remotePboardTimer];
  [v7 invalidate];

  [(UASharingReceiver *)self setRemotePboardTimer:0];
}

- (BOOL)forceScanning
{
  return self->_forceScanning;
}

- (void)setForceScanning:(BOOL)a3
{
  self->_forceScanning = a3;
}

- (UADispatchScheduler)periodicCleanup
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 104, 1);
}

- (SFPeerDevice)lastSeenPasteboardDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastSeenPasteboardDevice:(id)a3
{
}

- (int64_t)lastSeenPasteboardVersionBit
{
  return self->_lastSeenPasteboardVersionBit;
}

- (void)setLastSeenPasteboardVersionBit:(int64_t)a3
{
  self->_lastSeenPasteboardVersionBit = a3;
}

- (NSTimer)remotePboardTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRemotePboardTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePboardTimer, 0);
  objc_storeStrong((id *)&self->_lastSeenPasteboardDevice, 0);
  objc_storeStrong((id *)&self->_periodicCleanup, 0);
  objc_storeStrong((id *)&self->_recentlyLostDeviceIDs, 0);
  objc_storeStrong((id *)&self->_lastAutoPullActivitiesRequesterId, 0);
  objc_storeStrong((id *)&self->_activeDevices, 0);
  objc_storeStrong((id *)&self->_receivedItems, 0);

  objc_storeStrong((id *)&self->_sfActivityScanners, 0);
}

@end