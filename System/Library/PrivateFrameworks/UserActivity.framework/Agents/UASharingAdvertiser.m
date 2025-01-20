@interface UASharingAdvertiser
- (BOOL)_advertisePayload:(id)a3;
- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5;
- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5 sfAdvertiser:(id)a6;
- (BOOL)_updateAdvertisement;
- (BOOL)active;
- (BOOL)addSFActivityAdvertiser:(id)a3;
- (BOOL)advertiseItem:(id)a3 force:(BOOL)a4;
- (BOOL)advertising;
- (BOOL)okToSuspendAdvertising;
- (BOOL)pasteboardAvailible;
- (BOOL)pasteboardBitValue;
- (BOOL)pboardBitToAdvertise;
- (BOOL)peerDeviceCanAcceptNewerPayload:(id)a3;
- (BOOL)removeSFActivityAdvertiser:(id)a3;
- (BOOL)resume;
- (BOOL)scheduleAdvertisementUpdate;
- (BOOL)scheduleAdvertisementUpdate:(double)a3;
- (BOOL)shouldAdvertiseHandoff;
- (BOOL)shouldAdvertisePasteboard;
- (BOOL)suspend;
- (BOOL)userIsCurrent;
- (NSDate)beginTimeForNonActiveAdvertisement;
- (NSDate)dontAdvertiseAsCurrentUntil;
- (NSDate)lastAdvertismentTime;
- (NSDate)lastUserActiveTime;
- (NSMutableArray)advertisementTimes;
- (NSMutableDictionary)currentAdvertisedItemOtherAdvertisedItems;
- (NSSet)pairedDevices;
- (NSSet)sfActivityAdvertisers;
- (OS_dispatch_group)helpersDispatchGroup;
- (OS_dispatch_queue)dispatchQ;
- (PowerManagerIdleTracker)userIsCurrentIdleTracker;
- (SharingBTLEAdvertisementPayload)currentAdvertisementPayload;
- (SharingBTLEAdvertisementPayload)lastAdvertisementPayload;
- (UADispatchScheduler)nextScheduleUpdate;
- (UADispatchScheduler)periodicUpdate;
- (UASharingAdvertiser)initWithManager:(id)a3 advertiser:(id)a4;
- (UATimedPowerAssertions)preventIdleSleepAssertion;
- (UAUserActivityInfo)currentAdvertisedItem;
- (id)advertisableItems;
- (id)advertisingItems;
- (id)currentAdvertisedBytes;
- (id)dataForMoreAppSuggestions;
- (id)sfActivityAdvertiser;
- (id)statusString;
- (int64_t)lastAdvertisedGeneration;
- (unint64_t)changeAdvertisementThreadSpinCount;
- (void)_periodicIdleUpdate;
- (void)_refreshPairedSFPeerDevices;
- (void)_updatePairedDeviceCapabilities;
- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 command:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7;
- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 handoffCommand:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7;
- (void)activityAdvertiser:(id)a3 didSendPayloadForActivityIdentifier:(id)a4 toDevice:(id)a5 error:(id)a6;
- (void)activityAdvertiser:(id)a3 pairedDevicesChangedNotification:(id)a4;
- (void)advertisePayload:(id)a3 force:(BOOL)a4;
- (void)moveAdvertisementToNonActive;
- (void)removeAdvertisement;
- (void)removeIOPowerManagerUserIdleNotifications;
- (void)scheduleIOPowerManagerUserIdleNotifications;
- (void)setAdvertisableItems:(id)a3;
- (void)setAdvertisementTimes:(id)a3;
- (void)setBeginTimeForNonActiveAdvertisement:(id)a3;
- (void)setChangeAdvertisementThreadSpinCount:(unint64_t)a3;
- (void)setCurrentAdvertisedItem:(id)a3;
- (void)setCurrentAdvertisedItemOtherAdvertisedItems:(id)a3;
- (void)setCurrentAdvertisementPayload:(id)a3;
- (void)setDontAdvertiseAsCurrentUntil:(id)a3;
- (void)setLastAdvertisedGeneration:(int64_t)a3;
- (void)setLastAdvertisementPayload:(id)a3;
- (void)setLastAdvertismentTime:(id)a3;
- (void)setLastUserActiveTime:(id)a3;
- (void)setPairedDevices:(id)a3;
- (void)setPboardBitToAdvertise:(BOOL)a3;
- (void)setPreventIdleSleepAssertion:(id)a3;
- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3;
- (void)setUserIsCurrent:(BOOL)a3;
- (void)setUserIsCurrentIdleTracker:(id)a3;
- (void)updateAdvertisingPowerAssertion:(double)a3;
@end

@implementation UASharingAdvertiser

- (void)removeIOPowerManagerUserIdleNotifications
{
  id v2 = [(UASharingAdvertiser *)self userIsCurrentIdleTracker];
  [v2 setEnabled:0];
}

- (BOOL)shouldAdvertiseHandoff
{
  id v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers))
  {
    BYTE1(v2->_sfAdvertisers) = 0;
    v3 = [(UASharingAdvertiser *)v2 dispatchQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CD60;
    block[3] = &unk_1000C4D40;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  char v4 = BYTE2(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)scheduleAdvertisementUpdate:(double)a3
{
  char v4 = [(UASharingAdvertiser *)self nextScheduleUpdate];
  unsigned __int8 v5 = [v4 scheduleNext:a3];

  return v5;
}

- (void)advertisePayload:(id)a3 force:(BOOL)a4
{
  id v6 = a3;
  v7 = [(UASharingAdvertiser *)self dispatchQ];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F44C;
  block[3] = &unk_1000C6078;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5
{
  BOOL v6 = a4;
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = [(UASharingAdvertiser *)self dispatchQ];
  dispatch_assert_queue_V2(v10);

  if (v8)
  {
    if (v6) {
      goto LABEL_7;
    }
    BOOL v11 = [(__CFString *)v8 advertisementPayload];
    v12 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    v13 = [v12 advertisementPayload];
    unsigned __int8 v14 = [v11 isEqual:v13];

    if ((v14 & 1) == 0)
    {
LABEL_7:
      v18 = sub_10000BA18(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
        v20 = (void *)v19;
        CFStringRef v21 = &stru_1000C6800;
        *(_DWORD *)buf = 138544130;
        CFStringRef v51 = v8;
        if (v6) {
          CFStringRef v21 = @" FORCE";
        }
        __int16 v52 = 2114;
        uint64_t v53 = v19;
        __int16 v54 = 2114;
        CFStringRef v55 = v21;
        __int16 v56 = 2112;
        id v57 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "ADVERTISING: %{public}@ (old=%{public}@)%{public}@ %@", buf, 0x2Au);
      }
      v34 = +[UAUserActivityDefaults sharedDefaults];
      [v34 minimumTimeForAnAdvertisementToLive];
      -[UASharingAdvertiser updateAdvertisingPowerAssertion:](self, "updateAdvertisingPowerAssertion:");

      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v17 = [(UASharingAdvertiser *)self sfActivityAdvertisers];
      id v35 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
      id v36 = v35;
      if (v35)
      {
        uint64_t v37 = *(void *)v45;
        do
        {
          v38 = 0;
          do
          {
            if (*(void *)v45 != v37) {
              objc_enumerationMutation(v17);
            }
            [(UASharingAdvertiser *)self _advertisePayload:v8 force:v6 name:v9 sfAdvertiser:*(void *)(*((void *)&v44 + 1) + 8 * (void)v38)];
            v38 = (char *)v38 + 1;
          }
          while (v36 != v38);
          id v36 = [v17 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v36);
      }

      [(UASharingAdvertiser *)self setCurrentAdvertisementPayload:v8];
      v15 = +[NSDate date];
      [(UASharingAdvertiser *)self setLastAdvertismentTime:v15];
      LOBYTE(v17) = 1;
    }
    else
    {
      v15 = sub_10000BA18(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
        *(_DWORD *)buf = 138543618;
        CFStringRef v51 = v8;
        __int16 v52 = 2114;
        uint64_t v53 = (uint64_t)v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "ADVERTISING: Matched current advertisement, so not updating(%{public}@ vs %{public}@)", buf, 0x16u);
      }
      LOBYTE(v17) = 0;
    }

    v33 = [(__CFString *)v8 validUntil];
    [v33 timeIntervalSinceNow];
    -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:");
LABEL_39:

    goto LABEL_40;
  }
  if (v6
    || ([(UASharingAdvertiser *)self currentAdvertisementPayload],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    v22 = sub_10000BA18(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      CFStringRef v23 = &stru_1000C6800;
      if (v6) {
        CFStringRef v23 = @"FORCE";
      }
      *(_DWORD *)buf = 138543362;
      CFStringRef v51 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "ADVERTISING: Changing advertisement to nil because it's been removed, %{public}@", buf, 0xCu);
    }

    v24 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    if (v24) {

    }
    v25 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    BOOL v26 = v25 == 0;

    if (!v26)
    {
      v27 = +[UAUserActivityDefaults sharedDefaults];
      [v27 minimumTimeToLiveAfterRemovingAdvertisement];
      -[UASharingAdvertiser updateAdvertisingPowerAssertion:](self, "updateAdvertisingPowerAssertion:");
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v28 = [(UASharingAdvertiser *)self sfActivityAdvertisers];
    id v29 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v41;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v41 != v30) {
            objc_enumerationMutation(v28);
          }
          [(UASharingAdvertiser *)self _advertisePayload:0 force:1 name:0 sfAdvertiser:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        }
        id v29 = [v28 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v29);
    }

    v32 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    [(UASharingAdvertiser *)self setLastAdvertisementPayload:v32];

    [(UASharingAdvertiser *)self setCurrentAdvertisementPayload:0];
    v33 = +[NSDate date];
    [(UASharingAdvertiser *)self setLastAdvertismentTime:v33];
    LOBYTE(v17) = 1;
    goto LABEL_39;
  }
LABEL_40:

  return (char)v17;
}

- (BOOL)shouldAdvertisePasteboard
{
  id v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers))
  {
    BYTE1(v2->_sfAdvertisers) = 0;
    v3 = [(UASharingAdvertiser *)v2 dispatchQ];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006CD68;
    block[3] = &unk_1000C4D40;
    block[4] = v2;
    dispatch_async(v3, block);
  }
  char v4 = BYTE3(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v4;
}

- (void)removeAdvertisement
{
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    char v4 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    *(_DWORD *)buf = 138477827;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "removeAdvertisement, currentAdvertisementPayload=%{private}@", buf, 0xCu);
  }
  unsigned __int8 v5 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
  BOOL v6 = [v5 advertisementPayload];
  v7 = sub_100003070(v6);
  id v8 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  id v9 = [v8 uuid];
  id v10 = [v9 UUIDString];
  unsigned int v11 = [(UACornerActionManagerHandler *)self suspended];
  v12 = "";
  if (v11) {
    v12 = " SUSPENDED";
  }
  v13 = +[NSString stringWithFormat:@"ADVERTISING:- (was %@/%@)%s", v7, v10, v12];
  +[ActivityManagerDebuggingManager appendRecentAction:v13];

  uint64_t v14 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  [(UASharingAdvertiser *)self advertisePayload:0 force:v14 != 0];

  [(UASharingAdvertiser *)self setCurrentAdvertisedItem:0];
  [(UASharingAdvertiser *)self setCurrentAdvertisementPayload:0];
  [(UASharingAdvertiser *)self setLastAdvertismentTime:0];
  [(UASharingAdvertiser *)self setCurrentAdvertisedItemOtherAdvertisedItems:0];
  [(UASharingAdvertiser *)self removeIOPowerManagerUserIdleNotifications];
  v15 = [(UASharingAdvertiser *)self preventIdleSleepAssertion];
  LOBYTE(v14) = v15 == 0;

  if ((v14 & 1) == 0)
  {
    v16 = [(UASharingAdvertiser *)self preventIdleSleepAssertion];
    [v16 releaseAssertion];

    [(UASharingAdvertiser *)self setPreventIdleSleepAssertion:0];
  }
}

- (UAUserActivityInfo)currentAdvertisedItem
{
  return (UAUserActivityInfo *)objc_getProperty(self, a2, 89, 1);
}

- (void)setAdvertisableItems:(id)a3
{
  id v29 = a3;
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    char v4 = [v29 description];
    unsigned __int8 v5 = sub_100063FF0(v4);
    *(_DWORD *)buf = 138543362;
    id v36 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "setAdvertisableItems:(%{public}@)", buf, 0xCu);
  }
  if (v29)
  {
    BOOL v6 = [v29 firstObject];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      id v8 = +[NSMutableArray array];
      if ([(UASharingAdvertiser *)self shouldAdvertisePasteboard])
      {
        id v9 = +[UAUserActivityDefaults sharedDefaults];
        unsigned int v10 = [v9 clipboardSharingEnabled];
      }
      else
      {
        unsigned int v10 = 0;
      }
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v14 = v29;
      id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15)
      {
        char v16 = 0;
        unsigned __int8 v17 = 0;
        uint64_t v18 = *(void *)v31;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v14);
            }
            v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v10) {
                [v8 addObject:v20];
              }
            }
            else if (!(v16 & 1 | (([v20 eligibleForHandoff] & 1) == 0)))
            {
              [v8 insertObject:v20 atIndex:0];
              if (v17)
              {
                char v16 = 1;
                unsigned __int8 v17 = 1;
              }
              else
              {
                CFStringRef v21 = [v20 activityType];
                unsigned __int8 v17 = [v21 isEqual:NSUserActivityTypeBrowsingWeb];

                char v16 = 1;
              }
            }
          }
          id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);

        if (v17) {
          goto LABEL_29;
        }
      }
      else
      {
      }
      v22 = [(UASharingAdvertiser *)self advertisableItems];
      unsigned __int8 v23 = [v8 isEqual:v22];

      if (v23)
      {
LABEL_37:

        goto LABEL_38;
      }
LABEL_29:
      v24 = self;
      objc_sync_enter(v24);
      id v25 = [v8 count];
      if (v25) {
        id v26 = [v8 copy];
      }
      else {
        id v26 = 0;
      }
      objc_storeStrong((id *)(&v24->super._shouldAdvertiseAutoPullActivityList + 1), v26);
      if (v25) {

      }
      objc_sync_exit(v24);
      v27 = sub_10000BA18(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "ADVERTISING: Scheduling an update to check the advertisement, because we've changed the list of advertised items.", buf, 2u);
      }

      [(UASharingAdvertiser *)v24 scheduleAdvertisementUpdate];
      goto LABEL_37;
    }
  }
  unsigned int v11 = self;
  objc_sync_enter(v11);
  v12 = *(void **)(&v11->super._shouldAdvertiseAutoPullActivityList + 1);
  *(void *)(&v11->super._shouldAdvertiseAutoPullActivityList + 1) = 0;

  objc_sync_exit(v11);
  v13 = sub_10000BA18(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "--- Scheduling an update to check the advertisement, because we've cleared the list of advertisable items.", buf, 2u);
  }

  [(UASharingAdvertiser *)v11 scheduleAdvertisementUpdate];
LABEL_38:
}

- (BOOL)_updateAdvertisement
{
  v3 = sub_10000BA18(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "_updateAdvertisement, entering.", buf, 2u);
  }

  char v4 = [(UASharingAdvertiser *)self dispatchQ];
  dispatch_assert_queue_V2(v4);

  dispatch_group_enter(*(dispatch_group_t *)&self->_shouldAdvertiseHandoff);
  [(UASharingAdvertiser *)self setChangeAdvertisementThreadSpinCount:(char *)[(UASharingAdvertiser *)self changeAdvertisementThreadSpinCount] + 1];
  unsigned __int8 v5 = [(UACornerActionManagerHandler *)self manager];
  if ([v5 isBluetoothEnabled])
  {
  }
  else
  {
    BOOL v6 = +[UAUserActivityDefaults sharedDefaults];
    unsigned __int8 v7 = [v6 shouldIgnoreBluetoothDisabled];

    if ((v7 & 1) == 0)
    {
      id v15 = [(UASharingAdvertiser *)self currentAdvertisedItem];
      BOOL v16 = v15 == 0;

      unsigned int v10 = sub_10000BA18(0);
      BOOL v17 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (!v16)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing .currentAdvertisedItem because Bluetooth is not enabled.", buf, 2u);
        }
        goto LABEL_32;
      }
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UPDATEADVERTISEMENT: called while bluetooth is disabled", buf, 2u);
      }
      goto LABEL_28;
    }
  }
  id v8 = [(UACornerActionManagerHandler *)self manager];
  unsigned int v9 = [v8 isBatterySaverModeEnabled];

  if (v9)
  {
    unsigned int v10 = sub_10000BA18(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Not advertising because this device is in batterSaverModeEnabled == YES", buf, 2u);
    }
LABEL_32:

    [(UASharingAdvertiser *)self removeAdvertisement];
    goto LABEL_84;
  }
  if ([(UACornerActionManagerHandler *)self suspended])
  {
    unsigned int v11 = [(UASharingAdvertiser *)self currentAdvertisedItem];
    BOOL v12 = v11 == 0;

    unsigned int v10 = sub_10000BA18(0);
    BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v12)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UPDATEADVERTISEMENT: called while we are suspended", buf, 2u);
      }
    }
    else if (v13)
    {
      id v14 = [(UASharingAdvertiser *)self currentAdvertisedItem];
      *(_DWORD *)buf = 138543362;
      id v90 = v14;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ADVERTISING: Removing advertisement %{public}@ because advertising is suspended", buf, 0xCu);
    }
    goto LABEL_32;
  }
  uint64_t v18 = [(UACornerActionManagerHandler *)self manager];
  unsigned int v19 = [v18 activityAdvertisingAllowed];

  if (v19)
  {
    v20 = [(UACornerActionManagerHandler *)self manager];
    id v21 = [v20 pinnedUserActivityInfoItem];

    uint64_t v22 = +[UAUserActivityDefaults sharedDefaults];
    [(id)v22 lastActiveItemRemovalDelay];
    double v24 = v23;

    id v25 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
    LOBYTE(v22) = v25 == 0;

    if ((v22 & 1) == 0)
    {
      id v26 = +[NSDate date];
      v27 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
      [v26 timeIntervalSinceDate:v27];
      double v29 = v28;

      long long v30 = sub_10000BA18(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
        long long v32 = +[NSNumber numberWithDouble:v24 - v29];
        *(_DWORD *)buf = 138412546;
        id v90 = v31;
        __int16 v91 = 2112;
        id v92 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "We have a non-active advertisement, started at: %@, %@s till removal", buf, 0x16u);
      }
      if (v29 >= v24)
      {
        long long v43 = sub_10000BA18(0);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          long long v44 = [(UASharingAdvertiser *)self currentAdvertisedItem];
          *(_DWORD *)buf = 138543362;
          id v90 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Removing non-active advertisment (%{public}@)", buf, 0xCu);
        }
        [(UASharingAdvertiser *)self setBeginTimeForNonActiveAdvertisement:0];
        [(UASharingAdvertiser *)self removeAdvertisement];
      }
      else
      {
        long long v33 = sub_10000BA18(0);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          v34 = [(UASharingAdvertiser *)self currentAdvertisedItem];
          *(_DWORD *)buf = 138543362;
          id v90 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Rescheduling update to remove advertisment (%{public}@)", buf, 0xCu);
        }
        [(UASharingAdvertiser *)self scheduleAdvertisementUpdate:v24 - v29];
      }
    }
    if (!v21)
    {
      long long v45 = sub_10000BA18(0);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "UPDATEADVERTISEMENT: looking for a new activity to advertise", buf, 2u);
      }

      if ([(UASharingAdvertiser *)self shouldAdvertisePasteboard])
      {
        long long v46 = +[UAUserActivityDefaults sharedDefaults];
        unsigned int v47 = [v46 clipboardSharingEnabled];
      }
      else
      {
        unsigned int v47 = 0;
      }
      unsigned int v48 = [(UASharingAdvertiser *)self shouldAdvertiseHandoff];
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      v49 = [(UASharingAdvertiser *)self advertisableItems];
      id v21 = 0;
      id v50 = [v49 countByEnumeratingWithState:&v84 objects:v88 count:16];
      if (v50)
      {
        uint64_t v51 = *(void *)v85;
        while (2)
        {
          for (i = 0; i != v50; i = (char *)i + 1)
          {
            if (*(void *)v85 != v51) {
              objc_enumerationMutation(v49);
            }
            uint64_t v53 = *(void **)(*((void *)&v84 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (v47)
              {
                id v54 = v53;

                id v21 = v54;
              }
            }
            else
            {
              if (v21) {
                unsigned int v55 = 0;
              }
              else {
                unsigned int v55 = v48;
              }
              if (v55 == 1)
              {
                id v21 = v53;
                goto LABEL_64;
              }
            }
          }
          id v50 = [v49 countByEnumeratingWithState:&v84 objects:v88 count:16];
          if (v50) {
            continue;
          }
          break;
        }
      }
LABEL_64:
    }
    __int16 v56 = [(UASharingAdvertiser *)self advertisableItems];
    BOOL v57 = v56 == 0;

    if (!v57)
    {
      v58 = sub_10000BA18(0);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v59 = [(UASharingAdvertiser *)self advertisableItems];
        *(_DWORD *)buf = 138412546;
        id v90 = v59;
        __int16 v91 = 2112;
        id v92 = v21;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "self.advertisableItems is %@, itemToAdvertise is %@", buf, 0x16u);
      }
    }
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v66 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
      BOOL v67 = v66 == 0;

      if (!v67) {
        [(UASharingAdvertiser *)self setBeginTimeForNonActiveAdvertisement:0];
      }
    }
    else
    {
      v60 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
      BOOL v61 = v60 == 0;

      if (!v61)
      {
        v62 = [(UACornerActionManagerHandler *)self manager];
        v63 = [(UASharingAdvertiser *)self currentAdvertisedItem];
        unsigned int v64 = [v62 shouldItemBeAdvertised:v63];

        if (v64)
        {
          uint64_t v65 = [(UASharingAdvertiser *)self currentAdvertisedItem];

          id v21 = (id)v65;
        }
        else
        {
          v68 = sub_10000BA18(0);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            v69 = [(UASharingAdvertiser *)self currentAdvertisedItem];
            v70 = [v69 uuid];
            id v71 = [v70 UUIDString];
            v72 = [(UASharingAdvertiser *)self currentAdvertisedItem];
            v73 = [v72 activityType];
            *(_DWORD *)buf = 138543619;
            id v90 = v71;
            __int16 v91 = 2113;
            id v92 = v73;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "UPDATEADVERTISEMENT: Removing current advertisement item, %{public}@/%{private}@, because its process is gone", buf, 0x16u);
          }
          [(UASharingAdvertiser *)self removeAdvertisement];
        }
      }
      if (!v21)
      {
        v78 = [(UASharingAdvertiser *)self currentAdvertisedItem];
        BOOL v79 = v78 == 0;

        if (v79)
        {
          id v21 = 0;
        }
        else
        {
          v80 = +[UAUserActivityDefaults sharedDefaults];
          unsigned int v81 = [v80 multiHandoffEnabled];

          v82 = sub_10000BA18(0);
          BOOL v83 = os_log_type_enabled(v82, OS_LOG_TYPE_INFO);
          if (v81)
          {
            if (v83)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "UPDATEADVERTISEMENT: No item available to advertise, so switching to advertising existing advertisement nonactively.", buf, 2u);
            }

            id v21 = 0;
            [(UASharingAdvertiser *)self moveAdvertisementToNonActive];
          }
          else
          {
            if (v83)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "UPDATEADVERTISEMENT: No item available to advertise, so", buf, 2u);
            }

            id v21 = 0;
            [(UASharingAdvertiser *)self removeAdvertisement];
          }
        }
        goto LABEL_83;
      }
    }
    v74 = sub_10000BA18(0);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = [v21 uuid];
      v76 = [v75 UUIDString];
      *(_DWORD *)buf = 138543362;
      id v90 = v76;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "UPDATEADVERTISEMENT: choose to advertise (%{public}@)", buf, 0xCu);
    }
    [(UASharingAdvertiser *)self advertiseItem:v21 force:0];
LABEL_83:

    goto LABEL_84;
  }
  id v35 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  BOOL v36 = v35 == 0;

  unsigned int v10 = sub_10000BA18(0);
  BOOL v37 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v36)
  {
    if (v37)
    {
      v38 = [(UASharingAdvertiser *)self currentAdvertisedItem];
      v39 = [v38 uuid];
      id v40 = [v39 UUIDString];
      long long v41 = [(UASharingAdvertiser *)self currentAdvertisedItem];
      long long v42 = [v41 activityType];
      *(_DWORD *)buf = 138543619;
      id v90 = v40;
      __int16 v91 = 2113;
      id v92 = v42;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UPDATEADVERTISEMENT: Removing current advertisement item, %{public}@/%{private}@, because self.activityAdvertisingAllowed == NO", buf, 0x16u);
    }
    goto LABEL_32;
  }
  if (v37)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "UPDATEADVERTISEMENT: Reached default case, not performing any action", buf, 2u);
  }
LABEL_28:

LABEL_84:
  dispatch_group_leave(*(dispatch_group_t *)&self->_shouldAdvertiseHandoff);
  return 0;
}

- (NSDate)beginTimeForNonActiveAdvertisement
{
  return *(NSDate **)((char *)&self->_lastAdvertisedGeneration + 1);
}

- (id)advertisableItems
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)(&v2->super._shouldAdvertiseAutoPullActivityList + 1) copy];
  objc_sync_exit(v2);

  return v3;
}

- (PowerManagerIdleTracker)userIsCurrentIdleTracker
{
  return (PowerManagerIdleTracker *)objc_getProperty(self, a2, 185, 1);
}

- (void)setLastAdvertismentTime:(id)a3
{
}

- (void)setCurrentAdvertisementPayload:(id)a3
{
}

- (void)setCurrentAdvertisedItemOtherAdvertisedItems:(id)a3
{
}

- (void)setCurrentAdvertisedItem:(id)a3
{
}

- (void)setChangeAdvertisementThreadSpinCount:(unint64_t)a3
{
  *(NSMutableArray **)((char *)&self->_advertisementTimes + 1) = (NSMutableArray *)a3;
}

- (BOOL)scheduleAdvertisementUpdate
{
  return [(UASharingAdvertiser *)self scheduleAdvertisementUpdate:0.0];
}

- (UATimedPowerAssertions)preventIdleSleepAssertion
{
  return (UATimedPowerAssertions *)objc_getProperty(self, a2, 177, 1);
}

- (UADispatchScheduler)nextScheduleUpdate
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 105, 1);
}

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 97, 1);
}

- (SharingBTLEAdvertisementPayload)currentAdvertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 129, 1);
}

- (unint64_t)changeAdvertisementThreadSpinCount
{
  return *(unint64_t *)((char *)&self->_advertisementTimes + 1);
}

- (UASharingAdvertiser)initWithManager:(id)a3 advertiser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)UASharingAdvertiser;
  id v8 = [(UAAdvertiser *)&v38 initWithManager:v6 name:@"SharingAdvertiser"];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("UASharingAdvertiser", 0);
    unsigned int v10 = *(void **)(v8 + 97);
    *(void *)(v8 + 97) = v9;

    dispatch_group_t v11 = dispatch_group_create();
    BOOL v12 = *(void **)(v8 + 73);
    *(void *)(v8 + 73) = v11;

    uint64_t v13 = +[NSMutableSet set];
    id v14 = *(void **)(v8 + 57);
    *(void *)(v8 + 57) = v13;

    [v8 addSFActivityAdvertiser:v7];
    uint64_t v15 = +[NSArray array];
    BOOL v16 = *(void **)(v8 + 49);
    *(void *)(v8 + 49) = v15;

    id v17 = objc_alloc_init((Class)NSMutableArray);
    [v8 setAdvertisementTimes:v17];

    uint64_t v18 = [v8 dispatchQ];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000F43C;
    v36[3] = &unk_1000C4D40;
    unsigned int v19 = v8;
    BOOL v37 = v19;
    uint64_t v20 = +[UADispatchScheduler dispatchScheduler:@"sharingUpdate" frequency:v18 queue:v36 block:1.84467441e19];
    id v21 = *(void **)(v19 + 105);
    *(void *)(v19 + 105) = v20;

    uint64_t v22 = [v19 dispatchQ];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10006A380;
    v34[3] = &unk_1000C4D40;
    double v23 = v19;
    id v35 = v23;
    uint64_t v24 = +[UADispatchScheduler dispatchScheduler:@"advertisingPeriodic" frequency:v22 queue:v34 block:1.84467441e19];
    id v25 = *(void **)(v23 + 113);
    *(void *)(v23 + 113) = v24;

    v23[65] = 1;
    id v26 = [v23 manager];
    v27 = [v26 mainDispatchQ];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10006A388;
    v32[3] = &unk_1000C5040;
    double v28 = v23;
    long long v33 = v28;
    uint64_t v29 = +[PowerManagerIdleTracker idleTracker:@"AdvertiserCurrent" queue:v27 interval:v32 block:8.0];
    long long v30 = *(void **)(v28 + 185);
    *(void *)(v28 + 185) = v29;

    v28[66] = 1;
    v28[67] = 1;
  }
  return (UASharingAdvertiser *)v8;
}

- (BOOL)advertising
{
  id v2 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)advertisingItems
{
  BOOL v3 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  if (v3)
  {
    char v4 = [(UASharingAdvertiser *)self currentAdvertisedItem];
    unsigned __int8 v5 = +[NSArray arrayWithObject:v4];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)currentAdvertisedBytes
{
  id v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(UASharingAdvertiser *)v2 currentAdvertisementPayload];

  if (v3)
  {
    char v4 = [(UASharingAdvertiser *)v2 currentAdvertisementPayload];
    unsigned __int8 v5 = [v4 advertisementPayload];
    id v6 = [v5 copy];
  }
  else
  {
    id v6 = 0;
  }
  objc_sync_exit(v2);

  return v6;
}

- (void)updateAdvertisingPowerAssertion:(double)a3
{
  char v4 = self;
  objc_sync_enter(v4);
  unsigned __int8 v5 = [(UASharingAdvertiser *)v4 preventIdleSleepAssertion];

  if (v5)
  {
    id v6 = [(UASharingAdvertiser *)v4 preventIdleSleepAssertion];
    [v6 updateTimeUntilAssertionRelease:a3];
  }
  else
  {
    id v7 = [UATimedPowerAssertions alloc];
    id v6 = [(UASharingAdvertiser *)v4 currentAdvertisedItem];
    id v8 = [v6 uuid];
    dispatch_queue_t v9 = [(UACornerActionManagerHandler *)v4 manager];
    unsigned int v10 = [v9 mainDispatchQ];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10006A794;
    v12[3] = &unk_1000C5040;
    v12[4] = v4;
    dispatch_group_t v11 = [(UATimedPowerAssertions *)v7 initWithName:@"BTLEAdvertisement" delta:v8 activityUUID:v10 queue:v12 runAtCompletion:a3];
    [(UASharingAdvertiser *)v4 setPreventIdleSleepAssertion:v11];
  }
  objc_sync_exit(v4);
}

- (BOOL)_advertisePayload:(id)a3
{
  return [(UASharingAdvertiser *)self _advertisePayload:a3 force:0 name:0];
}

- (BOOL)_advertisePayload:(id)a3 force:(BOOL)a4 name:(id)a5 sfAdvertiser:(id)a6
{
  id v9 = a3;
  unsigned int v10 = (__CFString *)a5;
  id v11 = a6;
  BOOL v12 = [(UASharingAdvertiser *)self dispatchQ];
  dispatch_assert_queue_V2(v12);

  v24[0] = SFActivityAdvertiserOptionVersionKey;
  v24[1] = SFActivityAdvertiserOptionMinorVersionKey;
  v25[0] = &off_1000CC9F0;
  v25[1] = &off_1000CC9F0;
  v24[2] = SFActivityAdvertiserOptionFlagCopyPasteKey;
  uint64_t v13 = &__kCFBooleanFalse;
  if (v9 && [v9 containsPasteboard]) {
    uint64_t v13 = &__kCFBooleanTrue;
  }
  v24[3] = @"name";
  CFStringRef v14 = @"-";
  if (v10) {
    CFStringRef v14 = v10;
  }
  v25[2] = v13;
  v25[3] = v14;
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  if (v11)
  {
    BOOL v16 = sub_10000BA18(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v9 time];
      int v20 = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      double v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "advertising %@, when = %@", (uint8_t *)&v20, 0x16u);
    }
    if (v9)
    {
      uint64_t v18 = [v9 advertisementPayload];
    }
    else
    {
      uint64_t v18 = 0;
    }
    [v11 advertiseAdvertisementPayload:v18 options:v15];
    if (v9) {
  }
    }
  return v11 != 0;
}

- (BOOL)advertiseItem:(id)a3 force:(BOOL)a4
{
  id v151 = a3;
  v147 = self;
  unsigned __int8 v5 = [(UASharingAdvertiser *)self dispatchQ];
  dispatch_assert_queue_V2(v5);

  v150 = +[NSDate date];
  id v6 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v7 = [v6 multiHandoffEnabled];
  if (v151) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = v7;
  }
  int v145 = v8;
  if (v8 == 1)
  {
    unsigned int v9 = [(UAAdvertiser *)v147 shouldAdvertiseAutoPullActivityList];

    if (!v9) {
      goto LABEL_123;
    }
    unsigned int v10 = [(UACornerActionManagerHandler *)v147 manager];
    id v11 = [v10 advertiseableItems];
    BOOL v12 = [v11 anyObject];

    uint64_t v13 = sub_10000BA18(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v157 = *(double *)&v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "itemToAdvertise is nil but we need to advertise an auto pull request, so choosing item %@ out of corner manager's possible advertiseable items to advertise", buf, 0xCu);
    }

    if (v12)
    {
      id v151 = [objc_alloc((Class)UAUserActivityInfo) initWithUserActivityInfo:v12];
    }
    else
    {
      id v151 = 0;
    }
  }
  else
  {
  }
  if (v151)
  {
    [(UASharingAdvertiser *)v147 scheduleIOPowerManagerUserIdleNotifications];
    unsigned int v14 = [(UASharingAdvertiser *)v147 userIsCurrent];
    uint64_t v15 = [v151 options];
    unsigned int v141 = v14;
    id v149 = [v15 mutableCopy];

    if (!v149)
    {
      id v149 = +[NSMutableDictionary dictionary];
    }
    if ([(UASharingAdvertiser *)v147 shouldAdvertisePasteboard])
    {
      if ([(UASharingAdvertiser *)v147 pasteboardAvailible])
      {
        [v149 setObject:&__kCFBooleanTrue forKey:@"UAPasteboardAvailable"];
        BOOL v16 = +[NSNumber numberWithBool:[(UASharingAdvertiser *)v147 pasteboardBitValue]];
        [v149 setObject:v16 forKey:@"UAPasteboardVersionBit"];
      }
      else
      {
        [v149 removeObjectForKey:@"UAPasteboardAvailable"];
        [v149 removeObjectForKey:@"UAPasteboardVersionBit"];
      }
    }
    long long v154 = 0u;
    long long v155 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    id v17 = [(UACornerActionManagerHandler *)v147 manager];
    uint64_t v18 = [v17 advertiseableItems];
    unsigned int v19 = [v18 allObjects];

    id v20 = [v19 countByEnumeratingWithState:&v152 objects:v168 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v153;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v153 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(void **)(*((void *)&v152 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v23 uuid];
            id v25 = [v151 uuid];
            if ([v24 isEqual:v25])
            {
            }
            else
            {
              id v26 = [v23 when];
              [(__CFString *)v150 timeIntervalSinceDate:v26];
              BOOL v28 = v27 < 600.0;

              if (v28) {
                [v149 setObject:&__kCFBooleanTrue forKey:@"UAUserActivityAdvertiserHasMoreActivities"];
              }
            }
          }
        }
        id v20 = [v19 countByEnumeratingWithState:&v152 objects:v168 count:16];
      }
      while (v20);
    }

    uint64_t v29 = [(UASharingAdvertiser *)v147 beginTimeForNonActiveAdvertisement];
    if (v29) {
      int v30 = 1;
    }
    else {
      int v30 = v145;
    }

    if (v30)
    {
      long long v31 = sub_10000BA18(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v157 = *(double *)&v151;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setting UAUserActivityItemIsNotActiveKey = 1 for item %@", buf, 0xCu);
      }
      long long v32 = &__kCFBooleanTrue;
    }
    else
    {
      long long v31 = sub_10000BA18(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v157 = *(double *)&v151;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "setting UAUserActivityItemIsNotActiveKey = 0 for item %@", buf, 0xCu);
      }
      long long v32 = &__kCFBooleanFalse;
    }

    [v149 setObject:v32 forKey:@"UAUserActivityItemIsNotActiveKey"];
    uint64_t v33 = v141;
    if ([(UAAdvertiser *)v147 shouldAdvertiseAutoPullActivityList])
    {
      v34 = sub_10000BA18(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v157 = *(double *)&v151;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "setting UAUserActivityAutoPullActivitiesListKey = 1 for item %@", buf, 0xCu);
      }

      [v149 setObject:&__kCFBooleanTrue forKey:UAUserActivityAutoPullActivitiesListKey];
      uint64_t v33 = v141;
    }
    [v151 setOptions:v149];
    id v35 = [SharingBTLEAdvertisementPayload alloc];
    if (v33)
    {
      BOOL v36 = 0;
    }
    else
    {
      BOOL v36 = [(UASharingAdvertiser *)v147 lastUserActiveTime];
    }
    v146 = [(SharingBTLEAdvertisementPayload *)v35 initWithItem:v151 isCurrent:v33 when:v36 versionFlags:5];
    if ((v33 & 1) == 0) {

    }
    if (a4) {
      goto LABEL_60;
    }
    BOOL v37 = [(UASharingAdvertiser *)v147 currentAdvertisedItem];
    if (!v37) {
      goto LABEL_60;
    }
    objc_super v38 = [(UASharingAdvertiser *)v147 currentAdvertisedItem];
    v39 = [v38 uuid];
    id v40 = [v151 uuid];
    if ([v39 isEqual:v40])
    {
      long long v41 = [(UASharingAdvertiser *)v147 currentAdvertisementPayload];
      if (v41)
      {
        long long v42 = [(UASharingAdvertiser *)v147 currentAdvertisementPayload];
        if ([(SharingBTLEAdvertisementPayload *)v146 isEqual:v42])
        {
          unsigned int v43 = [(SharingBTLEAdvertisementPayload *)v146 isCurrent];
          long long v44 = [(UASharingAdvertiser *)v147 currentAdvertisementPayload];
          unsigned int v45 = [v44 isCurrent];

          if (((v43 ^ v45) & 1) == 0) {
            goto LABEL_122;
          }
LABEL_60:
          long long v46 = sub_10000BA18(0);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v47 = [v151 uuid];
            unsigned int v48 = [v47 UUIDString];
            v49 = [v151 logString];
            *(_DWORD *)buf = 138543619;
            double v157 = *(double *)&v48;
            __int16 v158 = 2113;
            v159 = v49;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "ADVERTISING: Advertising new item or updating user-idle time in previous advertisement, %{public}@/%{private}@", buf, 0x16u);
          }
          id v50 = [(SharingBTLEAdvertisementPayload *)v146 advertisementPayload];
          v143 = sub_100003070(v50);
          uint64_t v51 = [v151 activityType];
          __int16 v52 = [v151 dynamicActivityType];
          if (v52)
          {
            uint64_t v53 = [v151 dynamicActivityType];
          }
          else
          {
            uint64_t v53 = &stru_1000C6800;
          }
          id v54 = [v151 uuid];
          unsigned int v55 = [v54 UUIDString];
          __int16 v56 = +[NSString stringWithFormat:@"ADVERTISING:%@ %@ %@/ %@", v143, v51, v53, v55];
          +[ActivityManagerDebuggingManager appendRecentAction:v56];

          if (v52) {
          BOOL v57 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
          }
          if (v57)
          {
            v58 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
            [v58 timeIntervalSinceNow];
            BOOL v60 = v59 > 0.0;

            if (v60)
            {
              [(UASharingAdvertiser *)v147 setLastAdvertismentTime:0];
              BOOL v61 = sub_10000BA18(0);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "lastAdvertismentTime is in the future, this is wrong and is probably because the system clock has changed", buf, 2u);
              }
            }
          }
          v62 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
          if (v62)
          {
            v63 = +[UAUserActivityDefaults sharedDefaults];
            [v63 minimumIntervalBetweenAdvertisements];
            BOOL v65 = v64 > 0.0;

            if (v65)
            {
              v66 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
              [(__CFString *)v150 timeIntervalSinceDate:v66];
              double v68 = v67;

              if (v68 < 0.0)
              {
                v69 = sub_10000BA18(0);
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
                {
                  v70 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
                  *(_DWORD *)buf = 138543618;
                  double v157 = *(double *)&v150;
                  __int16 v158 = 2114;
                  v159 = v70;
                  _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "ADVERTISING: Time since last advertisement seems to have gone backwards, now=%{public}@ last=%{public}@", buf, 0x16u);
                }
                double v68 = 0.0;
              }
              id v71 = +[UAUserActivityDefaults sharedDefaults];
              [v71 minimumIntervalBetweenAdvertisements];
              BOOL v73 = v68 < v72;

              if (v73)
              {
                if (![v151 eligibleToAlwaysAdvertise])
                {
                  v137 = sub_10000BA18(0);
                  if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
                  {
                    v138 = [(UASharingAdvertiser *)v147 lastAdvertismentTime];
                    *(_DWORD *)buf = 134218498;
                    double v157 = v68;
                    __int16 v158 = 2114;
                    v159 = v150;
                    __int16 v160 = 2114;
                    v161 = v138;
                    _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "ADVERTISING: Setting supressAdvertisementChange = YES because the client attempted to change advertisement too quickly, %f since lastAdvertisementTime (now=%{public}@ last=%{public}@)", buf, 0x20u);
                  }
                  v75 = +[UAUserActivityDefaults sharedDefaults];
                  [(__CFString *)v75 minimumIntervalBetweenAdvertisements];
                  [(UASharingAdvertiser *)v147 scheduleAdvertisementUpdate:v139 - v68];
                  goto LABEL_119;
                }
                v74 = sub_10000BA18(0);
                if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "ADVERTISING: Allowing application to change advertisement even though the interval is too short because .eligibleToAlwaysAdvertise = YES", buf, 2u);
                }
              }
            }
          }
          v75 = +[UAUserActivityDefaults sharedDefaults];
          [(__CFString *)v75 maximumAdvertisementsTimeInterval];
          if (v76 <= 0.0) {
            goto LABEL_95;
          }
          v77 = [(UASharingAdvertiser *)v147 advertisementTimes];
          BOOL v78 = [v77 count] == 0;

          if (v78) {
            goto LABEL_96;
          }
          BOOL v79 = +[UAUserActivityDefaults sharedDefaults];
          [v79 maximumAdvertisementsTimeInterval];
          v75 = +[NSDate dateWithTimeInterval:v150 sinceDate:-v80];

          unsigned int v81 = sub_10000BA18(0);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
          {
            v82 = [(UASharingAdvertiser *)v147 advertisementTimes];
            id v83 = [v82 count];
            long long v84 = [(UASharingAdvertiser *)v147 advertisementTimes];
            long long v85 = [v84 description];
            sub_100063FF0(v85);
            long long v86 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            double v157 = *(double *)&v83;
            __int16 v158 = 2114;
            v159 = v86;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "ADVERTISING: self.advertisementTimes=%ld %{public}@", buf, 0x16u);
          }
          while (1)
          {
            long long v87 = [(UASharingAdvertiser *)v147 advertisementTimes];
            if (![v87 count]) {
              break;
            }
            v88 = [(UASharingAdvertiser *)v147 advertisementTimes];
            v89 = [v88 firstObject];
            BOOL v90 = [(__CFString *)v75 compare:v89] == (id)-1;

            if (v90) {
              goto LABEL_94;
            }
            __int16 v91 = sub_10000BA18(0);
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            {
              id v92 = [(UASharingAdvertiser *)v147 advertisementTimes];
              v93 = [v92 objectAtIndex:0];
              *(_DWORD *)buf = 138543618;
              double v157 = *(double *)&v93;
              __int16 v158 = 2114;
              v159 = v75;
              _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "ADVERTISING: Removing first item, %{public}@, becaues it is earlier than %{public}@", buf, 0x16u);
            }
            v94 = [(UASharingAdvertiser *)v147 advertisementTimes];
            [v94 removeObjectAtIndex:0];
          }
LABEL_94:
          v95 = [(UASharingAdvertiser *)v147 advertisementTimes];
          id v96 = [v95 count];
          v97 = +[UAUserActivityDefaults sharedDefaults];
          BOOL v98 = v96 < [v97 maximumAdvertisementsPerTimeInterval];

          if (v98)
          {
LABEL_95:

LABEL_96:
            [(UASharingAdvertiser *)v147 setCurrentAdvertisedItem:v151];
            [(UASharingAdvertiser *)v147 setLastAdvertismentTime:v150];
            v99 = [v151 provenance];
            [(UASharingAdvertiser *)v147 _advertisePayload:v146 force:0 name:v99];

            v100 = [(UASharingAdvertiser *)v147 advertisementTimes];
            [v100 addObject:v150];

            v101 = [v151 activityType];
            unsigned int v102 = [v101 isEqual:NSUserActivityTypeBrowsingWeb];

            if (v102)
            {
              v103 = +[UAUserActivityDefaults sharedDefaults];
              [v103 advertisedItemWhichIsWebBrowserIntervalToRememberEarlierActivities];
              double v105 = v104;

              if (v105 > 0.0)
              {
                v106 = +[NSDate dateWithTimeIntervalSinceNow:v105];
                v107 = sub_10000BA18(0);
                if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138478083;
                  double v157 = *(double *)&v146;
                  __int16 v158 = 2114;
                  v159 = v106;
                  _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_DEBUG, "OLDWEB: Adding item %{private}@, date=%{public}@", buf, 0x16u);
                }

                v108 = [(UASharingAdvertiser *)v147 currentAdvertisedItemOtherAdvertisedItems];
                BOOL v109 = v108 == 0;

                if (v109)
                {
                  v110 = +[NSMutableDictionary dictionary];
                  [(UASharingAdvertiser *)v147 setCurrentAdvertisedItemOtherAdvertisedItems:v110];
                }
                v111 = [(UASharingAdvertiser *)v147 currentAdvertisedItemOtherAdvertisedItems];
                [v111 setObject:v106 forKey:v146];

                v112 = [(UASharingAdvertiser *)v147 periodicUpdate];
                [v112 scheduleAt:v106];
              }
            }
            v113 = [(UASharingAdvertiser *)v147 nextScheduleUpdate];
            [v113 scheduleNext:248.0];

            v114 = sub_10000BA18(0);
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
            {
              v115 = [v151 uuid];
              v148 = [v115 UUIDString];
              v144 = [v151 activityType];
              v116 = [v151 dynamicActivityType];
              if (v116)
              {
                uint64_t v51 = [v151 dynamicActivityType];
                v117 = +[NSString stringWithFormat:@":%@", v51];
              }
              else
              {
                v117 = &stru_1000C6800;
              }
              id v118 = +[NSDate date];
              v119 = [v151 options];
              v120 = [v119 description];
              v121 = v115;
              sub_100063FF0(v120);
              id v122 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544643;
              double v157 = *(double *)&v146;
              __int16 v158 = 2114;
              v159 = v148;
              __int16 v160 = 2113;
              v161 = v144;
              __int16 v162 = 2113;
              v163 = v117;
              __int16 v164 = 2114;
              id v165 = v118;
              __int16 v166 = 2114;
              id v167 = v122;
              _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "ADVERTISING:%{public}@ %{public}@ type=%{private}@%{private}@ at %{public}@ opts=%{public}@", buf, 0x3Eu);

              if (v116)
              {
              }
            }
LABEL_121:

LABEL_122:
            goto LABEL_123;
          }
          v123 = sub_10000BA18(0);
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
          {
            v124 = +[UAUserActivityDefaults sharedDefaults];
            id v125 = [v124 maximumAdvertisementsPerTimeInterval];
            v126 = +[UAUserActivityDefaults sharedDefaults];
            [v126 maximumAdvertisementsTimeInterval];
            v128 = v127;
            v129 = [(UASharingAdvertiser *)v147 advertisementTimes];
            v130 = [v129 firstObject];
            *(_DWORD *)buf = 134218754;
            double v157 = *(double *)&v125;
            __int16 v158 = 2048;
            v159 = v128;
            __int16 v160 = 2114;
            v161 = v130;
            __int16 v162 = 2114;
            v163 = v150;
            _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEBUG, "ADVERTISING: Setting supressAdvertisementChange = YES because the advertisement too quickly, %ld in last %f seconds (earliest=%{public}@ now=%{public}@)", buf, 0x2Au);
          }
          v131 = [(UASharingAdvertiser *)v147 advertisementTimes];
          v132 = [v131 firstObject];
          [(__CFString *)v150 timeIntervalSinceDate:v132];
          double v134 = v133;

          if (v134 < 0.0)
          {
            v135 = +[UAUserActivityDefaults sharedDefaults];
            [v135 minimumIntervalBetweenAdvertisements];
            if (v136 > -v134) {
              double v136 = -v134;
            }
            [(UASharingAdvertiser *)v147 scheduleAdvertisementUpdate:v136];
          }
LABEL_119:

          v114 = sub_10000BA18(0);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "ADVERTISING: Since supressAdvertisementChange == YES, not actually changing the active advertisement and relying on it happening again in the near future.", buf, 2u);
          }
          goto LABEL_121;
        }
      }
    }

    goto LABEL_60;
  }
LABEL_123:

  return 0;
}

- (void)moveAdvertisementToNonActive
{
  id v3 = +[NSDate date];
  -[UASharingAdvertiser setBeginTimeForNonActiveAdvertisement:](self, "setBeginTimeForNonActiveAdvertisement:");

  id v4 = +[UAUserActivityDefaults sharedDefaults];
  [v4 lastActiveItemRemovalDelay];
  -[UASharingAdvertiser scheduleAdvertisementUpdate:](self, "scheduleAdvertisementUpdate:");
}

- (void)setBeginTimeForNonActiveAdvertisement:(id)a3
{
}

- (void)_periodicIdleUpdate
{
  id v3 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
  if (v3)
  {
    id v4 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = +[NSDate date];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      unsigned int v7 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
      unsigned int v8 = [v7 allKeys];

      id obj = v8;
      id v9 = [v8 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v9)
      {
        uint64_t v11 = *(void *)v25;
        *(void *)&long long v10 = 138478339;
        long long v22 = v10;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v25 != v11) {
              objc_enumerationMutation(obj);
            }
            uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            unsigned int v14 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
            uint64_t v15 = [v14 objectForKey:v13];

            BOOL v16 = sub_10000BA18(0);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543875;
              uint64_t v29 = v15;
              __int16 v30 = 2113;
              long long v31 = v13;
              __int16 v32 = 2114;
              uint64_t v33 = v6;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "OLDWEB: Checking expiration of %{public}@ of %{private}@, expireBefore=%{public}@", buf, 0x20u);
            }

            [v15 timeIntervalSinceReferenceDate];
            double v18 = v17;
            [v6 timeIntervalSinceReferenceDate];
            if (v18 <= v19)
            {
              uint64_t v21 = sub_10000BA18(0);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v22;
                uint64_t v29 = v13;
                __int16 v30 = 2114;
                long long v31 = v6;
                __int16 v32 = 2114;
                uint64_t v33 = v15;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "OLDWEB: Removing (old) NSUserActivityTypeBrowsingWeb item, %{private}@, because it is older than %{public}@ (expired at %{public}@", buf, 0x20u);
              }

              id v20 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
              [v20 removeObjectForKey:v13];
            }
            else
            {
              id v20 = [(UASharingAdvertiser *)self periodicUpdate];
              [v20 scheduleAt:v15];
            }
          }
          id v9 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v9);
      }
    }
  }
}

- (BOOL)peerDeviceCanAcceptNewerPayload:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v25 = 0;
  if (!v3) {
    goto LABEL_13;
  }
  id v5 = [v3 productBuildVersion];
  if (!v5) {
    goto LABEL_13;
  }
  id v6 = [v4 productBuildVersion];
  if (![v6 UTF8String])
  {

    goto LABEL_13;
  }
  id v7 = [v4 productBuildVersion];
  BOOL v8 = sscanf((const char *)[v7 UTF8String], "%ld%c%ld", &v27, &v25, &v26) == 3;

  if (!v8) {
    goto LABEL_13;
  }
  id v9 = sub_10000BA18(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    long long v10 = [v4 productName];
    uint64_t v11 = [v4 productVersion];
    BOOL v12 = [v4 productBuildVersion];
    *(_DWORD *)buf = 138544642;
    uint64_t v29 = v10;
    __int16 v30 = 2114;
    long long v31 = v11;
    __int16 v32 = 2114;
    uint64_t v33 = v12;
    __int16 v34 = 2048;
    uint64_t v35 = v27;
    __int16 v36 = 1024;
    int v37 = v25;
    __int16 v38 = 2048;
    uint64_t v39 = v26;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "-- CHECKING %{public}@ version %{public}@, %{public}@ = %ld.%c.%ld", buf, 0x3Au);
  }
  uint64_t v13 = [v4 productName];
  unsigned int v14 = [v13 isEqual:@"iPhone OS"];

  if (!v14)
  {
    id v20 = [v4 productName];
    if (([v20 isEqual:@"macOS"] & 1) == 0)
    {
      uint64_t v21 = [v4 productName];
      if (![v21 isEqual:@"Mac OS X"])
      {
        double v23 = [v4 productName];
        unsigned __int8 v24 = [v23 isEqual:@"OS X"];

        if ((v24 & 1) == 0) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
LABEL_19:
    if (v27 > 15) {
      goto LABEL_13;
    }
    if (v27 != 15)
    {
LABEL_29:
      BOOL v18 = 0;
      goto LABEL_14;
    }
    BOOL v15 = v25 == 65;
    if (v25 <= 65)
    {
      uint64_t v16 = v26;
      uint64_t v17 = 39;
      goto LABEL_23;
    }
LABEL_13:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  if (v27 > 13) {
    goto LABEL_13;
  }
  if (v27 != 13) {
    goto LABEL_29;
  }
  BOOL v15 = v25 == 65;
  if (v25 > 65) {
    goto LABEL_13;
  }
  uint64_t v16 = v26;
  uint64_t v17 = 125;
LABEL_23:
  BOOL v18 = v15 && v16 > v17;
LABEL_14:

  return v18;
}

- (NSSet)sfActivityAdvertisers
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [*(id *)((char *)&v2->_advertisableItems + 1) copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)addSFActivityAdvertiser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    unsigned __int8 v6 = [*(id *)((char *)&v5->_advertisableItems + 1) containsObject:v4];
    if ((v6 & 1) == 0)
    {
      [*(id *)((char *)&v5->_advertisableItems + 1) addObject:v4];
      [v4 setDelegate:v5];
    }
    char v7 = v6 ^ 1;
    objc_sync_exit(v5);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)removeSFActivityAdvertiser:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  unsigned int v6 = [*(id *)((char *)&v5->_advertisableItems + 1) containsObject:v4];
  if (v6)
  {
    [v4 setDelegate:0];
    [*(id *)((char *)&v5->_advertisableItems + 1) removeObject:v4];
  }
  objc_sync_exit(v5);

  return v6;
}

- (id)sfActivityAdvertiser
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(UASharingAdvertiser *)self sfActivityAdvertisers];
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
        unsigned int v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
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

- (void)_refreshPairedSFPeerDevices
{
  id v2 = self;
  objc_sync_enter(v2);
  BYTE1(v2->_sfAdvertisers) = 0;
  objc_sync_exit(v2);
  long long v10 = v2;

  long long v11 = +[NSMutableSet set];
  id v3 = dispatch_group_create();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(UASharingAdvertiser *)v2 sfActivityAdvertisers];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      char v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector())
        {
          dispatch_group_enter(v3);
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          v12[2] = sub_10006CFEC;
          v12[3] = &unk_1000C60A0;
          id v13 = v11;
          unsigned int v14 = v3;
          [v8 fetchSFPeerDevicesWithCompletionHandler:v12];
        }
        char v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  long long v9 = v10;
  objc_sync_enter(v9);
  [(UASharingAdvertiser *)v9 setPairedDevices:v11];
  objc_sync_exit(v9);
}

- (void)_updatePairedDeviceCapabilities
{
  unsigned __int8 v24 = self;
  objc_sync_enter(v24);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = *(id *)((char *)&v24->_helpersDispatchGroup + 1);
  int v2 = 0;
  int v3 = 0;
  id v4 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(obj);
        }
        char v7 = *(void **)(*((void *)&v25 + 1) + 8 * (void)v6);
        if ((v3 & 1) != 0
          || ([*(id *)(*((void *)&v25 + 1) + 8 * (void)v6) isDefaultPairedDevice] & 1) != 0
          || sub_10006D4EC(v7, @"macOS", 0x14u)
          || sub_10006D4EC(v7, @"Mac OS X", 0xEu))
        {
          BOOL v8 = 1;
          if (v2) {
            goto LABEL_13;
          }
        }
        else
        {
          BOOL v8 = sub_10006D4EC(v7, @"iPhone OS", 0xCu);
          if (v2) {
            goto LABEL_13;
          }
        }
        if (sub_10006D4EC(v7, @"macOS", 0x14u) || sub_10006D4EC(v7, @"Mac OS X", 0x10u))
        {
LABEL_13:
          BOOL v9 = 1;
          goto LABEL_14;
        }
        BOOL v9 = sub_10006D4EC(v7, @"iPhone OS", 0xEu);
LABEL_14:
        long long v10 = +[NSString stringWithFormat:@"%c%c%c%c", 120, 114, 79, 83];
        BOOL v11 = sub_10006D4EC(v7, @"visionOS", 0x14u) || sub_10006D4EC(v7, v10, 0x14u);
        BOOL v12 = sub_10000BA18(0);
        int v3 = v8 || v11;
        int v2 = v9 || v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          id v13 = (const char *)[*(id *)((char *)&v24->_helpersDispatchGroup + 1) count];
          uint64_t v14 = sub_10006D5BC(*(void **)((char *)&v24->_helpersDispatchGroup + 1));
          long long v15 = (void *)v14;
          *(_DWORD *)buf = 134218754;
          long long v16 = "NO";
          if (v3) {
            long long v17 = "YES";
          }
          else {
            long long v17 = "NO";
          }
          __int16 v30 = v13;
          if (v2) {
            long long v16 = "YES";
          }
          __int16 v31 = 2114;
          uint64_t v32 = v14;
          __int16 v33 = 2082;
          __int16 v34 = v17;
          __int16 v35 = 2082;
          __int16 v36 = v16;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "PEERS: %ld/%{public}@, advertiseHandoff=%{public}s pastboard=%{public}s", buf, 0x2Au);
        }
        if (v3 & v2)
        {
          int v2 = 1;
          int v3 = 1;
          goto LABEL_33;
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v18 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
      id v4 = v18;
    }
    while (v18);
  }
LABEL_33:

  double v19 = v24;
  if (BYTE2(v24->_sfAdvertisers) != v3 || BYTE3(v24->_sfAdvertisers) != v2)
  {
    id v20 = sub_10000BA18(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = "";
      long long v22 = "Handoff";
      if (!v3) {
        long long v22 = "";
      }
      if (v2) {
        uint64_t v21 = "Pasteboard";
      }
      *(_DWORD *)buf = 136446466;
      __int16 v30 = v22;
      __int16 v31 = 2082;
      uint64_t v32 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PEERS: Our peers ability to received handoff or pasteboard advertisements has changed; scheduling an check for o"
        "ur advertisement. %{public}s/%{public}s",
        buf,
        0x16u);
    }

    double v19 = v24;
    BYTE2(v24->_sfAdvertisers) = v3;
    BYTE3(v24->_sfAdvertisers) = v2;
    [(UASharingAdvertiser *)v24 scheduleAdvertisementUpdate:0.1];
  }
  objc_sync_exit(v19);
}

- (NSSet)pairedDevices
{
  int v2 = self;
  objc_sync_enter(v2);
  if (BYTE1(v2->_sfAdvertisers)) {
    [(UASharingAdvertiser *)v2 _refreshPairedSFPeerDevices];
  }
  id v3 = [*(id *)((char *)&v2->_helpersDispatchGroup + 1) copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)setPairedDevices:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10000BA18(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [v4 count];
    char v7 = sub_10006D5BC(v4);
    *(_DWORD *)buf = 134218243;
    id v13 = v6;
    __int16 v14 = 2113;
    long long v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Setting pairedDevices=%ld/%{private}@", buf, 0x16u);
  }
  BOOL v8 = self;
  objc_sync_enter(v8);
  BYTE1(v8->_sfAdvertisers) = 0;
  if (!v4
    || ([v4 isEqual:*(OS_dispatch_group **)((char *)&v8->_helpersDispatchGroup + 1)] & 1) == 0)
  {
    BOOL v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"PAIRED_DEVICES:Changed, now have %ld devices paired.", [v4 count]);
    +[ActivityManagerDebuggingManager appendRecentAction:v9];

    if (v4)
    {
      id v10 = [v4 copy];
    }
    else
    {
      id v10 = +[NSSet set];
    }
    BOOL v11 = v10;
    objc_storeStrong((id *)((char *)&v8->_helpersDispatchGroup + 1), v10);

    [(UASharingAdvertiser *)v8 _updatePairedDeviceCapabilities];
  }
  objc_sync_exit(v8);
}

- (void)setShouldAdvertiseAutoPullActivityList:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[UAUserActivityDefaults sharedDefaults];
  unsigned int v6 = [v5 multiHandoffEnabled];

  if (v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)UASharingAdvertiser;
    [(UAAdvertiser *)&v8 setShouldAdvertiseAutoPullActivityList:v3];
    char v7 = [(UACornerActionManagerHandler *)self manager];
    [v7 scheduleUpdatingAdvertisableItems];
  }
}

- (id)dataForMoreAppSuggestions
{
  BOOL v3 = [(UACornerActionManagerHandler *)self manager];
  id v4 = [v3 advertiseableItems];
  uint64_t v5 = [v4 allObjects];

  unsigned int v6 = +[NSMutableData data];
  if ([(UASharingAdvertiser *)self userIsCurrent])
  {
    char v7 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
    if (v7)
    {
    }
    else
    {
      __int16 v33 = [(UASharingAdvertiser *)self currentAdvertisedItem];

      if (v33)
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v34 = v5;
        id v35 = [v34 countByEnumeratingWithState:&v48 objects:v59 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v49;
          while (2)
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(void *)v49 != v36) {
                objc_enumerationMutation(v34);
              }
              __int16 v38 = *(void **)(*((void *)&v48 + 1) + 8 * i);
              uint64_t v39 = [(UASharingAdvertiser *)self currentAdvertisedItem];
              unsigned int v40 = [v39 isEqual:v38];

              if (v40)
              {
                long long v41 = +[NSDate date];
                [v38 setWhen:v41];

                goto LABEL_4;
              }
            }
            id v35 = [v34 countByEnumeratingWithState:&v48 objects:v59 count:16];
            if (v35) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
LABEL_4:
  long long v42 = [v5 sortedArrayUsingComparator:&stru_1000C60C0];

  objc_super v8 = +[NSDate date];
  BOOL v9 = sub_10000BA18(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "dataForMoreAppSuggestions:", buf, 2u);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = v42;
  id v10 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
        if ([(UASharingAdvertiser *)self userIsCurrent])
        {
          __int16 v14 = [(UASharingAdvertiser *)self beginTimeForNonActiveAdvertisement];
          if (v14)
          {
          }
          else
          {
            long long v15 = [(UASharingAdvertiser *)self currentAdvertisedItem];
            unsigned __int8 v16 = [v15 isEqual:v13];

            if (v16)
            {
              uint64_t v17 = 1;
              goto LABEL_20;
            }
          }
        }
        id v18 = [v13 when];
        [v8 timeIntervalSinceDate:v18];
        BOOL v20 = v19 > 600.0;

        if (v20)
        {
          uint64_t v21 = sub_10000BA18(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            long long v22 = [v13 bundleIdentifier];
            double v23 = [v13 when];
            *(_DWORD *)buf = 138412802;
            uint64_t v53 = v22;
            __int16 v54 = 2112;
            unsigned int v55 = v23;
            __int16 v56 = 2048;
            uint64_t v57 = 10;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "skipping %@ because its .when (%@) is older than %lum:", buf, 0x20u);
          }
          goto LABEL_25;
        }
        uint64_t v17 = 0;
LABEL_20:
        unsigned __int8 v24 = [SharingBTLEAdvertisementPayload alloc];
        long long v25 = [v13 when];
        uint64_t v21 = [(SharingBTLEAdvertisementPayload *)v24 initWithItem:v13 isCurrent:v17 when:v25 versionFlags:5];

        long long v26 = sub_10000BA18(0);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          long long v27 = [v13 bundleIdentifier];
          long long v28 = [v13 when];
          *(_DWORD *)buf = 138412546;
          uint64_t v53 = v27;
          __int16 v54 = 2112;
          unsigned int v55 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
        }
        if (![v6 length])
        {
          buf[0] = 0;
          uint64_t v29 = [v21 advertisementPayload];
          unsigned __int8 v30 = [v29 length];

          buf[0] = v30;
          [v6 appendBytes:buf length:1];
        }
        __int16 v31 = [v21 advertisementPayload];
        [v6 appendData:v31];

LABEL_25:
      }
      id v10 = [obj countByEnumeratingWithState:&v44 objects:v58 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 command:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7
{
  id v67 = a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = a6;
  id v15 = a7;
  unsigned __int8 v16 = sub_10000BA18(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [v14 name];
    *(_DWORD *)buf = 138543875;
    id v72 = v12;
    __int16 v73 = 2114;
    v74 = v13;
    __int16 v75 = 2113;
    double v76 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[Sharing Advertiser] Payload request for ad: %{public}@, command: %{public}@, from: %{private}@", buf, 0x20u);
  }
  v66 = +[NSData dataWithBytes:"pbpaste!" length:8];
  if (!v13)
  {
    if ([v66 isEqual:v12]) {
      id v13 = @"pbpaste";
    }
    else {
      id v13 = 0;
    }
  }
  id v18 = +[NSData dataWithBytes:"pbtypes!" length:8];
  double v19 = v18;
  if (!v13)
  {
    if ([v18 isEqual:v12]) {
      id v13 = @"pbtypes";
    }
    else {
      id v13 = 0;
    }
  }
  BOOL v20 = sub_100003070(v12);
  uint64_t v21 = [v14 uniqueID];
  long long v22 = (void *)v21;
  CFStringRef v23 = @"-";
  if (v13) {
    CFStringRef v23 = v13;
  }
  unsigned __int8 v24 = +[NSString stringWithFormat:@"PAYLOAD_REQUESTED:%@, %@ from %@", v20, v23, v21];
  +[ActivityManagerDebuggingManager appendRecentAction:v24];

  if (v13 && ![(__CFString *)v13 isEqual:@"HANDOFF"])
  {
    if ([(__CFString *)v13 isEqualToString:@"handoff-more_items"])
    {
      long long v25 = sub_10000BA18(0);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "activityPayloadForAdvertisementPayload: got handoff-more_items command", buf, 2u);
      }

      id v26 = [(UASharingAdvertiser *)self dataForMoreAppSuggestions];
      long long v27 = sub_10000BA18(0);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v28 = [v26 description];
        uint64_t v29 = (__CFString *)[v26 length];
        *(_DWORD *)buf = 138412546;
        id v72 = v28;
        __int16 v73 = 2048;
        v74 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "payload: %@ (%lu bytes long)", buf, 0x16u);
      }
      (*((void (**)(id, void, id, void))v15 + 2))(v15, 0, v26, 0);
      [(UASharingAdvertiser *)self setShouldAdvertiseAutoPullActivityList:0];
      goto LABEL_44;
    }
    if ([(__CFString *)v13 isEqualToString:@"pbpaste"])
    {
      unsigned __int8 v30 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v31 = [v30 clipboardSharingEnabled];

      if (v31)
      {
        uint64_t v32 = [(UACornerActionManagerHandler *)self manager];
        __int16 v33 = [v32 pasteboardController];
        BOOL v34 = v33 == 0;

        if (v34) {
          goto LABEL_45;
        }
        id v35 = sub_10000BA18(@"pasteboard-server");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v36 = [v14 uniqueID];
          int v37 = [v14 name];
          *(_DWORD *)buf = 138543619;
          id v72 = v36;
          __int16 v73 = 2113;
          v74 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "[PBOARD] Paste Requested from remote %{public}@/%{private}@", buf, 0x16u);
        }
        __int16 v38 = [(UACornerActionManagerHandler *)self manager];
        uint64_t v39 = [v38 pasteboardController];
        v63 = [v39 uuid];

        unsigned int v40 = [(UACornerActionManagerHandler *)self manager];
        long long v41 = [v40 pasteboardController];
        long long v42 = v70;
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472;
        v70[2] = sub_10006EEC0;
        v70[3] = &unk_1000C60E8;
        v70[5] = v15;
        id v26 = v63;
        v70[4] = v26;
        [v41 startServiceForPasteVersion:1 handler:v70];
        goto LABEL_40;
      }
LABEL_43:
      id v26 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-105 userInfo:0];
      (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v26);
      goto LABEL_44;
    }
    if ([(__CFString *)v13 isEqualToString:@"pbpaste2"])
    {
      unsigned int v43 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v44 = [v43 clipboardSharingEnabled];

      if (!v44) {
        goto LABEL_43;
      }
      long long v45 = [(UACornerActionManagerHandler *)self manager];
      long long v46 = [v45 pasteboardController];
      BOOL v47 = v46 == 0;

      if (v47) {
        goto LABEL_45;
      }
      long long v48 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        long long v49 = [v14 uniqueID];
        long long v50 = [v14 name];
        *(_DWORD *)buf = 138543619;
        id v72 = v49;
        __int16 v73 = 2113;
        v74 = v50;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "[PBOARD] Paste V2 Requested from remote %{public}@/%{private}@", buf, 0x16u);
      }
      long long v51 = [(UACornerActionManagerHandler *)self manager];
      __int16 v52 = [v51 pasteboardController];
      double v64 = [v52 uuid];

      unsigned int v40 = [(UACornerActionManagerHandler *)self manager];
      long long v41 = [v40 pasteboardController];
      long long v42 = v69;
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_10006EEDC;
      v69[3] = &unk_1000C60E8;
      v69[5] = v15;
      id v26 = v64;
      v69[4] = v26;
      [v41 startServiceForPasteVersion:2 handler:v69];
    }
    else
    {
      if (![(__CFString *)v13 isEqualToString:@"pbtypes"])
      {
        id v26 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-115 userInfo:0];
        (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v26);
        goto LABEL_44;
      }
      uint64_t v53 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v54 = [v53 clipboardSharingEnabled];

      if (!v54) {
        goto LABEL_43;
      }
      unsigned int v55 = [(UACornerActionManagerHandler *)self manager];
      __int16 v56 = [v55 pasteboardController];
      BOOL v57 = v56 == 0;

      if (v57) {
        goto LABEL_45;
      }
      v58 = sub_10000BA18(@"pasteboard-server");
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        double v59 = [v14 uniqueID];
        BOOL v60 = [v14 name];
        *(_DWORD *)buf = 138543619;
        id v72 = v59;
        __int16 v73 = 2113;
        v74 = v60;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "[PBOARD] Types Requested from remote %{public}@/%{private}@", buf, 0x16u);
      }
      BOOL v61 = [(UACornerActionManagerHandler *)self manager];
      v62 = [v61 pasteboardController];
      BOOL v65 = [v62 uuid];

      unsigned int v40 = [(UACornerActionManagerHandler *)self manager];
      long long v41 = [v40 pasteboardController];
      long long v42 = v68;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10006EEF8;
      v68[3] = &unk_1000C60E8;
      v68[5] = v15;
      id v26 = v65;
      v68[4] = v26;
      [v41 getLocalPasteboardInfoData:v68];
    }
LABEL_40:

LABEL_44:
    goto LABEL_45;
  }
  [(UASharingAdvertiser *)self activityAdvertiser:v67 activityPayloadForAdvertisementPayload:v12 handoffCommand:v13 requestedByDevice:v14 withCompletionHandler:v15];
LABEL_45:
}

- (void)activityAdvertiser:(id)a3 activityPayloadForAdvertisementPayload:(id)a4 handoffCommand:(id)a5 requestedByDevice:(id)a6 withCompletionHandler:(id)a7
{
  id v175 = a3;
  v179 = (SharingBTLEAdvertisementPayload *)a4;
  v176 = (__CFString *)a5;
  id v177 = a6;
  id v178 = a7;
  id v12 = sub_10000BA18(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v176) {
      CFStringRef v13 = v176;
    }
    else {
      CFStringRef v13 = @"-";
    }
    id v14 = [v177 name];
    double v15 = [v177 productVersion];
    unsigned __int8 v16 = [v177 productBuildVersion];
    *(_DWORD *)buf = 138544387;
    v193 = v179;
    __int16 v194 = 2114;
    CFStringRef v195 = v13;
    __int16 v196 = 2113;
    v197 = v14;
    __int16 v198 = 2114;
    double v199 = v15;
    __int16 v200 = 2114;
    id v201 = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Advertising: advertiserData=%{public}@ command=%{public}@ peer=%{private}@ %{public}@/%{public}@", buf, 0x34u);
  }
  uint64_t v17 = [(UACornerActionManagerHandler *)self manager];
  unsigned int v18 = [v17 activityAdvertisingAllowed];

  if (v18)
  {
    double v19 = sub_100064548();
    BOOL v20 = [[SharingBTLEAdvertisementPayload alloc] initWithAdvertisedBytes:v179];
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    uint64_t v21 = [(UACornerActionManagerHandler *)self manager];
    long long v22 = [v21 advertiseableItems];
    CFStringRef v23 = [v22 allObjects];

    id v24 = [v23 countByEnumeratingWithState:&v188 objects:v205 count:16];
    if (!v24)
    {
      v180 = 0;
      goto LABEL_27;
    }
    v180 = 0;
    uint64_t v25 = *(void *)v189;
LABEL_9:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v189 != v25) {
        objc_enumerationMutation(v23);
      }
      long long v27 = *(void **)(*((void *)&v188 + 1) + 8 * v26);
      if ([(SharingBTLEAdvertisementPayload *)v20 matchesItem:v27]) {
        break;
      }
      long long v28 = [v27 activityType];
      unsigned int v29 = [v28 isEqual:NSUserActivityTypeBrowsingWeb];

      if (v29)
      {
        unsigned __int8 v30 = v27;

        v180 = v30;
      }
      if (v24 == (id)++v26)
      {
        id v24 = [v23 countByEnumeratingWithState:&v188 objects:v205 count:16];
        if (v24) {
          goto LABEL_9;
        }
LABEL_27:

LABEL_28:
        __int16 v38 = sub_10000BA18(0);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          v193 = v20;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "-- the advertisingPayload requested %{public}@ does not match any advertiseable item", buf, 0xCu);
        }

        if (v180)
        {
          uint64_t v39 = +[NSDate date];
          unsigned int v40 = sub_10000BA18(0);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            long long v41 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
            long long v42 = [v41 allKeys];
            *(_DWORD *)buf = 138477827;
            v193 = v42;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "OLDWEB: Checking against previous advertised NSUSerActivityTypeBrowsingWeb items, %{private}@", buf, 0xCu);
          }
          long long v186 = 0u;
          long long v187 = 0u;
          long long v184 = 0u;
          long long v185 = 0u;
          unsigned int v43 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
          unsigned int v44 = [v43 allKeys];

          id v45 = [v44 countByEnumeratingWithState:&v184 objects:v204 count:16];
          if (v45)
          {
            uint64_t v46 = *(void *)v185;
            while (2)
            {
              for (i = 0; i != v45; i = (char *)i + 1)
              {
                if (*(void *)v185 != v46) {
                  objc_enumerationMutation(v44);
                }
                long long v48 = *(void **)(*((void *)&v184 + 1) + 8 * i);
                long long v49 = [(UASharingAdvertiser *)self currentAdvertisedItemOtherAdvertisedItems];
                long long v50 = [v49 objectForKey:v48];

                if (v50
                  && [v50 compare:v39] == (id)-1
                  && [v48 isEqualHashedPayloadBytes:v20])
                {
                  uint64_t v53 = sub_10000BA18(0);
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                  {
                    v173 = [0 activityType];
                    unsigned int v54 = [0 uuid];
                    unsigned int v55 = [v54 UUIDString];
                    sub_100003070(v179);
                    __int16 v56 = (SharingBTLEAdvertisementPayload *)objc_claimAutoreleasedReturnValue();
                    sub_10007C018(v50);
                    double v57 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    *(_DWORD *)buf = 138478595;
                    v193 = v173;
                    __int16 v194 = 2114;
                    CFStringRef v195 = v55;
                    __int16 v196 = 2114;
                    v197 = v56;
                    __int16 v198 = 2114;
                    double v199 = v57;
                    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "OLDWEB: the current advertised item, %{private}@/%{public}@, is a NSUserActivityTypeBrowsingWeb, and a previous advertisement %{public}@ from %{public}@ matches the requested payload.", buf, 0x2Au);
                  }
                  __int16 v33 = v180;

                  v180 = v33;
                  goto LABEL_51;
                }
              }
              id v45 = [v44 countByEnumeratingWithState:&v184 objects:v204 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }
        }
        long long v51 = (void *)_LSCreateHashedBytesForAdvertisingFromString();
        if (_LSCompareHashedBytesFromAdvertisingStrings())
        {

          __int16 v52 = sub_10000BA18(0);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v193 = v179;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "RESPONDING: Unable to locate a userActivity for the payloadData %{public}@ so returning nil/nil and an error as the payload for the requesting device.", buf, 0xCu);
          }

          +[NSError errorWithDomain:UAContinuityErrorDomain code:-107 userInfo:0];
          uint64_t v32 = 0;
          dispatch_semaphore_t dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void, void))v178 + 2))(v178, 0, 0);
          long long v51 = v180;
          v180 = v20;
        }
        else
        {
          v77 = +[UAUserActivityDefaults sharedDefaults];
          if ((uint64_t)[v77 maximumActivityPayloadSizeInBytes] < 1)
          {
            dispatch_semaphore_t dsema = +[NSMutableData data];
          }
          else
          {
            BOOL v78 = +[UAUserActivityDefaults sharedDefaults];
            +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", [v78 maximumActivityPayloadSizeInBytes]);
            dispatch_semaphore_t dsema = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue();
          }
          v143 = +[UAUserActivityDefaults sharedDefaults];
          -[NSObject increaseLengthBy:](dsema, "increaseLengthBy:", [v143 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes]);

          v144 = +[UAUserActivityDefaults sharedDefaults];
          id v145 = [v144 debugValidateSampleResponseMaximumActivityPayloadSizeInBytes];
          v146 = +[UAUserActivityDefaults sharedDefaults];
          LODWORD(v145) = (uint64_t)v145 > (uint64_t)[v146 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes];

          if (v145)
          {
            v147 = +[UAUserActivityDefaults sharedDefaults];
            unsigned int v148 = [v147 debugValidateSampleResponseMaximumActivityPayloadSizeInBytes];
            id v149 = +[UAUserActivityDefaults sharedDefaults];
            -[NSObject increaseLengthBy:](dsema, "increaseLengthBy:", arc4random_uniform(v148 - [v149 debugValidateSampleResponseMinimumActivityPayloadSizeInBytes]));
          }
          dispatch_semaphore_t v150 = dsema;
          if ([dsema length])
          {
            id v151 = dsema;
            dispatch_semaphore_t v150 = dsema;
            arc4random_buf([v151 mutableBytes], (size_t)[v151 length]);
          }
          long long v152 = +[NSDictionary dictionaryWithObject:v150 forKey:@"randomdata"];
          long long v153 = +[NSKeyedArchiver archivedDataWithRootObject:v152 requiringSecureCoding:1 error:0];

          long long v154 = [UserActivityToBTLEPayload alloc];
          long long v155 = +[NSUUID UUID];
          v156 = +[NSDate date];
          id v157 = [(UserActivityToBTLEPayload *)v154 init:v155 title:@"Sample" date:v156 userInfoPayload:v153 teamID:@"NO-TEAM-ID" activityType:@"com.apple.fetchsamplepayloadactivity"];

          __int16 v158 = [v157 encodeAsData];
          v159 = sub_10000BA18(0);
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v160 = (SharingBTLEAdvertisementPayload *)[v158 length];
            v161 = [v177 uniqueID];
            *(_DWORD *)buf = 134218243;
            v193 = v160;
            __int16 v194 = 2113;
            CFStringRef v195 = v161;
            _os_log_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEFAULT, "SAMPLEPAYLOAD: Sending %ld bytes to device %{private}@", buf, 0x16u);
          }
          __int16 v162 = [v157 uniqueIdentifier];
          (*((void (**)(id, void *, void *, void))v178 + 2))(v178, v162, v158, 0);

          uint64_t v32 = v20;
LABEL_120:
        }
LABEL_122:

        goto LABEL_123;
      }
    }
    __int16 v33 = v27;
    BOOL v34 = sub_10000BA18(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      id v35 = [(SharingBTLEAdvertisementPayload *)v33 activityType];
      uint64_t v36 = [(SharingBTLEAdvertisementPayload *)v33 uuid];
      int v37 = [v36 UUIDString];
      *(_DWORD *)buf = 138478339;
      v193 = v35;
      __int16 v194 = 2114;
      CFStringRef v195 = v37;
      __int16 v196 = 2114;
      v197 = v20;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "-- advertiseable item %{private}@/%{public}@ matches the advertisingPayload requested %{public}@, so using it.", buf, 0x20u);
    }
    if (!v33) {
      goto LABEL_28;
    }
LABEL_51:
    dispatch_semaphore_t v170 = dispatch_semaphore_create(0);
    v58 = sub_10000BA18(@"signposts");
    double v59 = v58;
    if (v33 != (SharingBTLEAdvertisementPayload *)-1 && os_signpost_enabled(v58))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v33, "handoffFetch", "", buf, 2u);
    }

    v181[0] = _NSConcreteStackBlock;
    v181[1] = 3221225472;
    v181[2] = sub_100070E2C;
    v181[3] = &unk_1000C6110;
    uint64_t v32 = v33;
    v182 = v32;
    dispatch_semaphore_t dsema = v170;
    dispatch_semaphore_t v183 = dsema;
    if ([(SharingBTLEAdvertisementPayload *)v32 requestPayloadWithCompletionHandler:v181])
    {
      BOOL v60 = +[UAUserActivityDefaults sharedDefaults];
      [v60 maximumTimeoutToWaitForClientProcessToUpdateActivityInformation];
      dispatch_time_t v62 = dispatch_time(0, (uint64_t)(v61 * 1000000000.0));
      double v63 = COERCE_DOUBLE(dispatch_semaphore_wait(dsema, v62));

      if (v63 != 0.0)
      {
        double v64 = sub_10000BA18(0);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          sub_100003070(v179);
          BOOL v65 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue();
          v66 = [(SharingBTLEAdvertisementPayload *)v32 activityType];
          id v67 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
          double v68 = [v67 UUIDString];
          *(_DWORD *)buf = 138544131;
          v193 = v65;
          __int16 v194 = 2113;
          CFStringRef v195 = v66;
          __int16 v196 = 2114;
          v197 = v68;
          __int16 v198 = 2048;
          double v199 = v63;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "Failure updating userActivity information from client application for activity %{public}@/%{private}@  %{public}@, using (possibly stale) payload instead, status=%ld.", buf, 0x2Au);
        }
        v69 = [(SharingBTLEAdvertisementPayload *)v32 payloadForIdentifier:UAUserActivityUserInfoPayload];
        if (v69
          || ([(SharingBTLEAdvertisementPayload *)v32 webpageURL],
              (v69 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          v163 = [(SharingBTLEAdvertisementPayload *)v32 payloadForIdentifier:UAUserActivityStreamsPayload];
          BOOL v164 = v163 == 0;

          if (v164)
          {

            goto LABEL_116;
          }
        }
      }
    }
    if (v32)
    {
      v171 = [(SharingBTLEAdvertisementPayload *)v32 payloadForIdentifier:UAUserActivityUserInfoPayload];
      v70 = +[UAUserActivityDefaults sharedDefaults];
      unsigned int v71 = [v70 debugForceNewPayloadEncoder];

      if (v71)
      {
        id v72 = sub_10000BA18(0);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          __int16 v73 = [v177 name];
          v74 = [v177 productVersion];
          __int16 v75 = [v177 productBuildVersion];
          *(_DWORD *)buf = 138478339;
          v193 = v73;
          __int16 v194 = 2114;
          CFStringRef v195 = v74;
          __int16 v196 = 2114;
          v197 = v75;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "-- Forcing new payload encoder to peer %{private}@/%{public}@ %{public}@ because debugForceNewPayloadEncoder == YES", buf, 0x20u);
        }
      }
      else
      {
        double v76 = +[UAUserActivityDefaults sharedDefaults];
        if ([v76 debugForceOldPayloadEncoder])
        {
        }
        else
        {
          unsigned __int8 v79 = [(UASharingAdvertiser *)self peerDeviceCanAcceptNewerPayload:v177];

          if (v79) {
            goto LABEL_74;
          }
        }
        double v80 = +[UAUserActivityInfo encodedInfoToOldEncodedInfo:v171];
        unsigned int v81 = sub_10000BA18(0);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          v82 = [v177 name];
          id v83 = [v177 productName];
          long long v84 = [v177 productBuildVersion];
          double v85 = COERCE_DOUBLE([v80 length]);
          id v86 = [v171 length];
          *(_DWORD *)buf = 138478851;
          v193 = v82;
          __int16 v194 = 2114;
          CFStringRef v195 = v83;
          __int16 v196 = 2114;
          v197 = v84;
          __int16 v198 = 2048;
          double v199 = v85;
          __int16 v200 = 2048;
          id v201 = v86;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "-- Falling back to 'old' format of payload to support pre Blacktail era device, %{private}@/%{public}@ %{public}@ (size=%ld vs %ld)", buf, 0x34u);
        }
        id v72 = v171;
        v171 = v80;
      }

LABEL_74:
      long long v87 = [(SharingBTLEAdvertisementPayload *)v32 encodedUserInfoError];
      BOOL v88 = v87 == 0;

      if (v88)
      {
        v95 = [UserActivityToBTLEPayload alloc];
        id v96 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
        v97 = +[UAUserActivityDefaults sharedDefaults];
        unsigned __int8 v98 = [v97 dontSendActivityTitle];
        if (v98)
        {
          v99 = &stru_1000C6800;
        }
        else
        {
          v99 = [(SharingBTLEAdvertisementPayload *)v32 title];
        }
        v100 = [(SharingBTLEAdvertisementPayload *)v32 teamIdentifier];
        v101 = [(SharingBTLEAdvertisementPayload *)v32 activityType];
        v174 = [(UserActivityToBTLEPayload *)v95 init:v96 title:v99 date:0 userInfoPayload:v171 teamID:v100 activityType:v101];

        if ((v98 & 1) == 0) {
        uint64_t v102 = [(SharingBTLEAdvertisementPayload *)v32 webpageURL];
        }
        [(UserActivityToBTLEPayload *)v174 setWebpageURL:v102];

        v103 = [(SharingBTLEAdvertisementPayload *)v32 persistentIdentifier];
        LOBYTE(v102) = v103 == 0;

        if ((v102 & 1) == 0)
        {
          double v104 = [(SharingBTLEAdvertisementPayload *)v32 persistentIdentifier];
          [(UserActivityToBTLEPayload *)v174 addAdditionalItem:v104 forKey:@"persistentID"];
        }
        double v105 = [(SharingBTLEAdvertisementPayload *)v32 targetContentIdentifier];
        BOOL v106 = v105 == 0;

        if (!v106)
        {
          v107 = sub_10000BA18(0);
          if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
          {
            v108 = [(SharingBTLEAdvertisementPayload *)v32 targetContentIdentifier];
            *(_DWORD *)buf = 138739971;
            v193 = v108;
            _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_INFO, "- Adding targetContentIdentifie=%{sensitive}@ to additionalItems payload", buf, 0xCu);
          }
          BOOL v109 = [(SharingBTLEAdvertisementPayload *)v32 targetContentIdentifier];
          [(UserActivityToBTLEPayload *)v174 addAdditionalItem:v109 forKey:@"targetContentID"];
        }
        v94 = [(SharingBTLEAdvertisementPayload *)v32 payloadForIdentifier:UAUserActivityStreamsPayload];
        [(UserActivityToBTLEPayload *)v174 setStreamsData:v94];
      }
      else
      {
        v89 = sub_10000BA18(0);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v90 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
          __int16 v91 = [v90 UUIDString];
          id v92 = [(SharingBTLEAdvertisementPayload *)v32 encodedUserInfoError];
          *(_DWORD *)buf = 138543618;
          v193 = v91;
          __int16 v194 = 2114;
          CFStringRef v195 = v92;
          _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "-- ENCODING error from client instead of payload, %{public}@ / %{public}@", buf, 0x16u);
        }
        v93 = [UserActivityToBTLEPayload alloc];
        v94 = [(SharingBTLEAdvertisementPayload *)v32 encodedUserInfoError];
        v174 = [(UserActivityToBTLEPayload *)v93 initWithNSError:v94];
      }

      v110 = [(UserActivityToBTLEPayload *)v174 encodeAsData];
      if (!v110) {
        goto LABEL_103;
      }
      v111 = +[UAUserActivityDefaults sharedDefaults];
      if ((uint64_t)[v111 maximumActivityPayloadSizeInBytes] <= 0)
      {
      }
      else
      {
        id v112 = [v110 length];
        v113 = +[UAUserActivityDefaults sharedDefaults];
        LODWORD(v112) = v112 > [v113 maximumActivityPayloadSizeInBytes];

        if (v112)
        {
          v114 = sub_10000BA18(0);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            v115 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
            v116 = [v115 UUIDString];
            v117 = [(SharingBTLEAdvertisementPayload *)v32 logString];
            id v118 = (SharingBTLEAdvertisementPayload *)[v110 length];
            v119 = +[UAUserActivityDefaults sharedDefaults];
            double v120 = COERCE_DOUBLE([v119 maximumActivityPayloadSizeInBytes]);
            *(_DWORD *)buf = 138544131;
            v193 = v116;
            __int16 v194 = 2113;
            CFStringRef v195 = v117;
            __int16 v196 = 2048;
            v197 = v118;
            __int16 v198 = 2048;
            double v199 = v120;
            _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "** The payload for user activity item %{public}@/%{private}@ was %ld bytes, larger than the maximum %ld, and so this user activity cannot be sent to the requesting device.", buf, 0x2Au);
          }
          v121 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v110 length]);
          id v122 = +[NSDictionary dictionaryWithObjectsAndKeys:v121, @"EncodedPayloadSize", 0];
          v123 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-110 userInfo:v122];

          v124 = [[UserActivityToBTLEPayload alloc] initWithNSError:v123];
          uint64_t v125 = [(UserActivityToBTLEPayload *)v124 encodeAsData];

          v110 = (void *)v125;
          goto LABEL_102;
        }
      }
      v123 = +[UAUserActivityDefaults sharedDefaults];
      if ([v123 activityPayloadWarningSizeInBytes])
      {
        v126 = +[UAUserActivityDefaults sharedDefaults];
        id v127 = [v126 activityPayloadWarningSizeInBytes];
        LODWORD(v127) = v127 < [v110 length];

        if (!v127)
        {
LABEL_103:
          double v134 = sub_10000BA18(0);
          if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
          {
            sub_100003070(v179);
            v135 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue();
            double v136 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
            v137 = [v136 UUIDString];
            v138 = [(SharingBTLEAdvertisementPayload *)v32 activityType];
            double v139 = sub_100064548();
            id v140 = [v110 length];
            unsigned int v141 = sub_10000F05C(v110, 40);
            *(_DWORD *)buf = 138544643;
            v193 = v135;
            __int16 v194 = 2114;
            CFStringRef v195 = v137;
            __int16 v196 = 2114;
            v197 = v138;
            __int16 v198 = 2048;
            double v199 = v139 - v19;
            __int16 v200 = 2048;
            id v201 = v140;
            __int16 v202 = 2113;
            v203 = v141;
            _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_DEFAULT, "PAYLOAD:Responding to SFAdvertiser with data for advertisement %{public}@ activity %{public}@ type=%{public}@, fetchTime=%g data=%ld/%{private}@", buf, 0x3Eu);
          }
          v142 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
          (*((void (**)(id, void *, void *, void))v178 + 2))(v178, v142, v110, 0);

LABEL_119:
          long long v153 = v182;
          long long v51 = v180;
          v180 = v20;
          goto LABEL_120;
        }
        v123 = sub_10000BA18(0);
        if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
        {
          v128 = [(SharingBTLEAdvertisementPayload *)v32 uuid];
          v129 = [v128 UUIDString];
          v130 = [(SharingBTLEAdvertisementPayload *)v32 logString];
          v131 = (SharingBTLEAdvertisementPayload *)[v110 length];
          v132 = +[UAUserActivityDefaults sharedDefaults];
          double v133 = COERCE_DOUBLE([v132 activityPayloadWarningSizeInBytes]);
          *(_DWORD *)buf = 138544131;
          v193 = v129;
          __int16 v194 = 2113;
          CFStringRef v195 = v130;
          __int16 v196 = 2048;
          v197 = v131;
          __int16 v198 = 2048;
          double v199 = v133;
          _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "*** The payload for the user activity item %{public}@/%{private}@ is %ld bytes, larger than the recommended maximum %ld, which may cause slow transfers.", buf, 0x2Au);
        }
      }
      v124 = v174;
LABEL_102:

      v174 = v124;
      goto LABEL_103;
    }
LABEL_116:
    id v165 = sub_10000BA18(0);
    if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
    {
      sub_100003070(v179);
      __int16 v166 = (SharingBTLEAdvertisementPayload *)(id)objc_claimAutoreleasedReturnValue();
      id v167 = [0 activityType];
      v168 = [0 uuid];
      v169 = [v168 UUIDString];
      *(_DWORD *)buf = 138543875;
      v193 = v166;
      __int16 v194 = 2113;
      CFStringRef v195 = v167;
      __int16 v196 = 2114;
      v197 = v169;
      _os_log_impl((void *)&_mh_execute_header, v165, OS_LOG_TYPE_ERROR, "Failure after updating userActivity information from client application for activity %{public}@/%{private}@ %{public}@; the activity disappeared/is no longer current and so cannot be handedOff.",
        buf,
        0x20u);
    }
    +[NSError errorWithDomain:UAContinuityErrorDomain code:-107 userInfo:0];
    v171 = uint64_t v32 = 0;
    (*((void (**)(id, void, void))v178 + 2))(v178, 0, 0);
    goto LABEL_119;
  }
  unsigned int v31 = sub_10000BA18(0);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failing request because self.activityAdvertisingAllowed == NO", buf, 2u);
  }

  if (v178)
  {
    uint64_t v32 = +[NSError errorWithDomain:UAContinuityErrorDomain code:-107 userInfo:0];
    (*((void (**)(id, void, void, SharingBTLEAdvertisementPayload *))v178 + 2))(v178, 0, 0, v32);
    goto LABEL_122;
  }
LABEL_123:
}

- (void)activityAdvertiser:(id)a3 didSendPayloadForActivityIdentifier:(id)a4 toDevice:(id)a5 error:(id)a6
{
  id v7 = a4;
  objc_super v8 = sub_10000BA18(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = [v7 UUIDString];
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "User activity %{public}@ was resumed on another device, so inform (if desired) the author of the activity on this device", buf, 0xCu);
  }
  id v10 = [(UACornerActionManagerHandler *)self manager];
  unsigned __int8 v11 = [v10 activityAdvertisingAllowed];

  if ((v11 & 1) == 0)
  {
    id v12 = sub_10000BA18(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failing because self.activityAdvertisingAllowed == NO, ignoring notification.", buf, 2u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [(UASharingAdvertiser *)self advertisingItems];
    id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v12);
          }
          unsigned __int8 v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v17 = [v16 uuid];
          unsigned int v18 = [v17 isEqual:v7];

          if (v18)
          {
            [v16 wasResumedOnAnotherDeviceWithCompletionHandler:&stru_1000C6130];
            goto LABEL_17;
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (void)activityAdvertiser:(id)a3 pairedDevicesChangedNotification:(id)a4
{
  id v5 = a4;
  unsigned int v6 = sub_10000BA18(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 count];
    objc_super v8 = sub_10006D5BC(v5);
    *(_DWORD *)buf = 134218243;
    id v14 = v7;
    __int16 v15 = 2113;
    unsigned __int8 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "PAIRED DEVICES CHANGED: Now is %ld/%{private}@", buf, 0x16u);
  }
  BOOL v9 = [(UASharingAdvertiser *)self dispatchQ];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100071464;
  v11[3] = &unk_1000C4DD0;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, v11);
}

- (BOOL)okToSuspendAdvertising
{
  v8.receiver = self;
  v8.super_class = (Class)UASharingAdvertiser;
  unsigned __int8 v3 = [(UAAdvertiser *)&v8 okToSuspendAdvertising];
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = [(UASharingAdvertiser *)v4 currentAdvertisedItem];
  unsigned __int8 v6 = [v5 eligibleToAlwaysAdvertise];

  objc_sync_exit(v4);
  return v3 & ~v6;
}

- (BOOL)active
{
  v5.receiver = self;
  v5.super_class = (Class)UASharingAdvertiser;
  if (![(UACornerActionManagerHandler *)&v5 active]) {
    return 0;
  }
  int v2 = +[UAUserActivityDefaults sharedDefaults];
  unsigned __int8 v3 = [v2 activityBTLESharingEnabled];

  return v3;
}

- (BOOL)suspend
{
  v7.receiver = self;
  v7.super_class = (Class)UASharingAdvertiser;
  BOOL v3 = [(UACornerActionManagerHandler *)&v7 suspend];
  if (v3)
  {
    [(UASharingAdvertiser *)self setUserIsCurrent:0];
    [(UASharingAdvertiser *)self removeAdvertisement];
    id v4 = [(UASharingAdvertiser *)self nextScheduleUpdate];
    [v4 suspend];

    objc_super v5 = [(UASharingAdvertiser *)self periodicUpdate];
    [v5 suspend];
  }
  return v3;
}

- (BOOL)resume
{
  v10.receiver = self;
  v10.super_class = (Class)UASharingAdvertiser;
  BOOL v3 = [(UACornerActionManagerHandler *)&v10 resume];
  if (v3)
  {
    [(UASharingAdvertiser *)self advertisePayload:0 force:0];
    BYTE1(self->_sfAdvertisers) = 1;
    id v4 = [(UASharingAdvertiser *)self nextScheduleUpdate];
    [v4 reset];

    objc_super v5 = [(UASharingAdvertiser *)self nextScheduleUpdate];
    [v5 resume];

    [(UASharingAdvertiser *)self scheduleAdvertisementUpdate];
    unsigned __int8 v6 = [(UASharingAdvertiser *)self periodicUpdate];
    [v6 resume];

    objc_super v7 = [(UASharingAdvertiser *)self periodicUpdate];
    [v7 reset];

    objc_super v8 = [(UASharingAdvertiser *)self periodicUpdate];
    [v8 scheduleNext:0.1];
  }
  return v3;
}

- (BOOL)userIsCurrent
{
  int v2 = self;
  objc_sync_enter(v2);
  char v3 = BYTE4(v2->_sfAdvertisers);
  objc_sync_exit(v2);

  return v3;
}

- (void)setUserIsCurrent:(BOOL)a3
{
  int v3 = a3;
  id obj = self;
  objc_sync_enter(obj);
  if (BYTE4(obj->_sfAdvertisers) != v3)
  {
    BYTE4(obj->_sfAdvertisers) = v3;
    id v4 = [(UASharingAdvertiser *)obj currentAdvertisementPayload];

    if (v4 || v3) {
      [(UASharingAdvertiser *)obj scheduleAdvertisementUpdate];
    }
  }
  objc_sync_exit(obj);
}

- (void)scheduleIOPowerManagerUserIdleNotifications
{
  id v2 = [(UASharingAdvertiser *)self userIsCurrentIdleTracker];
  [v2 setEnabled:1];
}

- (BOOL)pasteboardAvailible
{
  int v3 = +[UAUserActivityDefaults sharedDefaults];
  LODWORD(v4) = [v3 clipboardSharingEnabled];

  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    objc_super v5 = [(UASharingAdvertiser *)self advertisableItems];
    id v4 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v5);
          }
          objc_super v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v9 = [v8 pasteboardTypes];
            LOBYTE(v4) = [v9 count] != 0;

            goto LABEL_12;
          }
        }
        id v4 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return (char)v4;
}

- (BOOL)pasteboardBitValue
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(UASharingAdvertiser *)self advertisableItems];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_super v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 generation];
          if (v8 != (id)[(UASharingAdvertiser *)self lastAdvertisedGeneration])
          {
            [(UASharingAdvertiser *)self setLastAdvertisedGeneration:v8];
            [(UASharingAdvertiser *)self setPboardBitToAdvertise:[(UASharingAdvertiser *)self pboardBitToAdvertise] ^ 1];
          }
          goto LABEL_12;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return [(UASharingAdvertiser *)self pboardBitToAdvertise];
}

- (id)statusString
{
  double v59 = +[NSMutableString stringWithFormat:@"Sharing.framework Advertiser:"];
  int v3 = [(UASharingAdvertiser *)self sfActivityAdvertiser];

  if (!v3) {
    [v59 appendString:@"(No SFActivityAdvertiser) "];
  }
  id v4 = [(UACornerActionManagerHandler *)self manager];
  unsigned __int8 v5 = [v4 isBluetoothEnabled];

  if ((v5 & 1) == 0)
  {
    BOOL v9 = +[UAUserActivityDefaults sharedDefaults];
    unsigned int v10 = [v9 shouldIgnoreBluetoothDisabled];

    if (v10) {
      CFStringRef v8 = @" ** Bluetooth is disabled but IgnoreBluetoothDisabled is set, so the activity will be advertised. **";
    }
    else {
      CFStringRef v8 = @" ** Bluetooth is disabled so no activity will be advertised. **";
    }
    goto LABEL_9;
  }
  uint64_t v6 = [(UACornerActionManagerHandler *)self manager];
  unsigned __int8 v7 = [v6 isBatterySaverModeEnabled];

  if (v7)
  {
    CFStringRef v8 = @" ** LowPowerMode is enabled so no activity will be advertised. **";
LABEL_9:
    [v59 appendString:v8];
    goto LABEL_10;
  }
  long long v22 = [(UACornerActionManagerHandler *)self manager];
  unsigned __int8 v23 = [v22 activityAdvertisingAllowed];

  if ((v23 & 1) == 0)
  {
    CFStringRef v8 = @" ** Activity advertising is disabled on this device. **";
    goto LABEL_9;
  }
  if ([(UACornerActionManagerHandler *)self suspended])
  {
    CFStringRef v8 = @"** SUSPENDED:";
    goto LABEL_9;
  }
LABEL_10:
  long long v11 = [(UASharingAdvertiser *)self sfActivityAdvertisers];
  id v12 = [v11 count];

  if (v12 != (id)1)
  {
    long long v13 = [(UASharingAdvertiser *)self sfActivityAdvertisers];
    objc_msgSend(v59, "appendFormat:", @"%ld sfActivityAdvertisers", objc_msgSend(v13, "count"));
  }
  __int16 v56 = [(UASharingAdvertiser *)self nextScheduleUpdate];
  id v14 = [v56 runCount];
  unsigned int v55 = [(UASharingAdvertiser *)self nextScheduleUpdate];
  double v57 = sub_100064288((unint64_t)[v55 nextTime]);
  unsigned int v54 = [(UASharingAdvertiser *)self periodicUpdate];
  id v15 = [v54 runCount];
  unsigned __int8 v16 = [(UASharingAdvertiser *)self periodicUpdate];
  uint64_t v17 = sub_100064288((unint64_t)[v16 nextTime]);
  if ([(UASharingAdvertiser *)self userIsCurrent]) {
    CFStringRef v18 = @"(current) ";
  }
  else {
    CFStringRef v18 = &stru_1000C6800;
  }
  unsigned __int8 v19 = [(UASharingAdvertiser *)self userIsCurrent];
  long long v20 = &stru_1000C6800;
  if (v19)
  {
    int v21 = 0;
  }
  else
  {
    uint64_t v53 = [(UASharingAdvertiser *)self lastUserActiveTime];
    if (v53)
    {
      __int16 v52 = [(UASharingAdvertiser *)self lastUserActiveTime];
      sub_10007C018(v52);
      long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v21 = 1;
    }
    else
    {
      int v21 = 0;
      uint64_t v53 = 0;
    }
  }
  id v24 = +[UAUserActivityDefaults sharedDefaults];
  if ([v24 clipboardSharingEnabled])
  {
    unsigned int v25 = [(UASharingAdvertiser *)self pasteboardAvailible];
    CFStringRef v26 = @"+ Advertising Local Pasteboard.";
    if (!v25) {
      CFStringRef v26 = &stru_1000C6800;
    }
  }
  else
  {
    CFStringRef v26 = @"ClipboardSharingDisabled";
  }
  [v59 appendFormat:@", run=%ld times/%@ periodic=%ld/%@ %@%@%@\n", v14, v57, v15, v17, v18, v20, v26];

  if (v21)
  {
  }
  if ((v19 & 1) == 0) {

  }
  long long v27 = [(UASharingAdvertiser *)self currentAdvertisedItem];
  if (v27
    && ([(UASharingAdvertiser *)self currentAdvertisementPayload],
        long long v28 = objc_claimAutoreleasedReturnValue(),
        v28,
        v28))
  {
    unsigned int v29 = [v27 activityType];
    unsigned __int8 v30 = [v27 dynamicActivityType];
    if (v30)
    {
      id v14 = [v27 dynamicActivityType];
      v58 = +[NSString stringWithFormat:@":%@", v14];
    }
    else
    {
      v58 = &stru_1000C6800;
    }
    uint64_t v32 = [v27 uuid];
    __int16 v33 = [v32 UUIDString];
    BOOL v34 = [(UASharingAdvertiser *)self currentAdvertisementPayload];
    id v35 = [(UASharingAdvertiser *)self lastAdvertismentTime];
    uint64_t v36 = sub_10007C018(v35);
    [v59 appendFormat:@" ADVERTISING: %@%@ %@ /, data=%@, at %@\n", v29, v58, v33, v34, v36];

    if (!v30) {
      goto LABEL_43;
    }
  }
  else
  {
    unsigned int v31 = [(UASharingAdvertiser *)self lastAdvertisementPayload];

    if (!v31)
    {
      [v59 appendString:@" LAST: nil\n"];
      goto LABEL_44;
    }
    unsigned int v29 = [(UASharingAdvertiser *)self lastAdvertisementPayload];
    unsigned __int8 v30 = [(UASharingAdvertiser *)self lastAdvertismentTime];
    sub_10007C018(v30);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v59 appendFormat:@" LAST:%@, at %@\n", v29, v14];
  }

LABEL_43:
LABEL_44:
  int v37 = [(UASharingAdvertiser *)self sfActivityAdvertiser];

  if (v37)
  {
    __int16 v38 = dispatch_group_create();
    dispatch_group_enter(v38);
    uint64_t v39 = [(UASharingAdvertiser *)self sfActivityAdvertiser];
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10007266C;
    v64[3] = &unk_1000C6158;
    id v40 = v59;
    id v65 = v40;
    v66 = self;
    long long v41 = v38;
    id v67 = v41;
    [v39 fetchLoginIDWithCompletionHandler:v64];

    dispatch_group_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    long long v42 = +[NSMutableString string];
    unsigned int v43 = +[NSMutableString string];
    dispatch_group_enter(v41);
    unsigned int v44 = [(UASharingAdvertiser *)self sfActivityAdvertiser];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_100072768;
    v60[3] = &unk_1000C6180;
    id v45 = v42;
    double v61 = v45;
    uint64_t v46 = v43;
    dispatch_time_t v62 = v46;
    BOOL v47 = v41;
    double v63 = v47;
    [v44 fetchSFPeerDevicesWithCompletionHandler:v60];

    dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
    CFStringRef v48 = &stru_1000C6800;
    if (v45) {
      CFStringRef v49 = v45;
    }
    else {
      CFStringRef v49 = &stru_1000C6800;
    }
    if (v46) {
      CFStringRef v48 = v46;
    }
    [v40 appendFormat:@"%@%@\n", v49, v48];
  }
  id v50 = [v59 copy];

  return v50;
}

- (OS_dispatch_group)helpersDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 73, 1);
}

- (UADispatchScheduler)periodicUpdate
{
  return (UADispatchScheduler *)objc_getProperty(self, a2, 113, 1);
}

- (NSDate)dontAdvertiseAsCurrentUntil
{
  return (NSDate *)objc_getProperty(self, a2, 121, 1);
}

- (void)setDontAdvertiseAsCurrentUntil:(id)a3
{
}

- (NSDate)lastAdvertismentTime
{
  return (NSDate *)objc_getProperty(self, a2, 137, 1);
}

- (SharingBTLEAdvertisementPayload)lastAdvertisementPayload
{
  return (SharingBTLEAdvertisementPayload *)objc_getProperty(self, a2, 145, 1);
}

- (void)setLastAdvertisementPayload:(id)a3
{
}

- (NSMutableDictionary)currentAdvertisedItemOtherAdvertisedItems
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 153, 1);
}

- (NSMutableArray)advertisementTimes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 161, 1);
}

- (void)setAdvertisementTimes:(id)a3
{
}

- (void)setPreventIdleSleepAssertion:(id)a3
{
}

- (void)setUserIsCurrentIdleTracker:(id)a3
{
}

- (NSDate)lastUserActiveTime
{
  return (NSDate *)objc_getProperty(self, a2, 193, 1);
}

- (void)setLastUserActiveTime:(id)a3
{
}

- (int64_t)lastAdvertisedGeneration
{
  return *(int64_t *)((char *)&self->_lastUserActiveTime + 1);
}

- (void)setLastAdvertisedGeneration:(int64_t)a3
{
  *(NSDate **)((char *)&self->_lastUserActiveTime + 1) = (NSDate *)a3;
}

- (BOOL)pboardBitToAdvertise
{
  return BYTE5(self->_sfAdvertisers) & 1;
}

- (void)setPboardBitToAdvertise:(BOOL)a3
{
  BYTE5(self->_sfAdvertisers) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lastAdvertisedGeneration + 1), 0);
  objc_storeStrong((id *)((char *)&self->_userIsCurrentIdleTracker + 1), 0);
  objc_storeStrong((id *)((char *)&self->_preventIdleSleepAssertion + 1), 0);
  objc_storeStrong((id *)((char *)&self->_changeAdvertisementThreadSpinCount + 1), 0);
  objc_storeStrong((id *)((char *)&self->_currentAdvertisedItemOtherAdvertisedItems + 1), 0);
  objc_storeStrong((id *)((char *)&self->_lastAdvertisementPayload + 1), 0);
  objc_storeStrong((id *)((char *)&self->_lastAdvertismentTime + 1), 0);
  objc_storeStrong((id *)((char *)&self->_currentAdvertisementPayload + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dontAdvertiseAsCurrentUntil + 1), 0);
  objc_storeStrong((id *)((char *)&self->_periodicUpdate + 1), 0);
  objc_storeStrong((id *)((char *)&self->_nextScheduleUpdate + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dispatchQ + 1), 0);
  objc_storeStrong((id *)((char *)&self->_currentAdvertisedItem + 1), 0);
  objc_storeStrong((id *)((char *)&self->_pairedDevices + 1), 0);
  objc_storeStrong((id *)((char *)&self->_helpersDispatchGroup + 1), 0);
  objc_storeStrong((id *)&self->_shouldAdvertiseHandoff, 0);
  objc_storeStrong((id *)((char *)&self->_advertisableItems + 1), 0);

  objc_storeStrong((id *)(&self->super._shouldAdvertiseAutoPullActivityList + 1), 0);
}

@end