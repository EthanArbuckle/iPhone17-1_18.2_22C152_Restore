@interface PDTransitNotificationService
- (BOOL)_hasExistingTransitPassesForMarket:(id)a3;
- (BOOL)_shouldSendDCIRenotifyNotificationForTransitMarket:(id)a3;
- (BOOL)_shouldSendNotificationsPassingBaseRequirementsForTransitMarket:(id)a3;
- (BOOL)_shouldSendOpenLoopRenotifyNotificationForTransitMarket:(id)a3;
- (BOOL)_shouldTrigger;
- (PDTransitNotificationService)initWithPaymentWebServiceCoordinator:(id)a3 notificationManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 expressPassManager:(id)a7 upgradeController:(id)a8;
- (PDUserNotificationManager)userNotificationManager;
- (id)_eligibleMarketNames:(id)a3;
- (id)_existingTransitPassesForMarket:(id)a3;
- (id)_expressPaymentNetworkNamesForPass:(id)a3;
- (id)_expressUpgradeableOpenLoopPassesForMarket:(id)a3;
- (id)_hasSentRenotifyNotificationForRenotifyCampaign:(id)a3;
- (id)_sentRenotifyNotificationsForRenotifiyIdentifier:(id)a3;
- (id)_startTime;
- (id)_transitProducts:(id)a3 forMarket:(id)a4;
- (id)createCurrentNotificationRegistrationState;
- (unint64_t)_eligibleNotificationsForTransitMarket:(id)a3;
- (unint64_t)_hasSentNotificationForMarket:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_availableProductsForNotifiableMarkets:(id)a3 filteredForTargetDevice:(id)a4 completion:(id)a5;
- (void)_beginReportingIfNecessary;
- (void)_checkForNotification;
- (void)_cleanupLocationMonitoring;
- (void)_clearTransitNotificationHistory;
- (void)_connect;
- (void)_endReportingIfNecessary;
- (void)_expressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 expressUpgrade:(BOOL)a6 isReferredFromWatch:(BOOL)a7 completion:(id)a8;
- (void)_expressRenotifiableOpenLoopPassesForViableMarkets:(id)a3 completion:(id)a4;
- (void)_expressUpgradesAvailableNotificationForPass:(id)a3 completion:(id)a4;
- (void)_multipleProductsNotificationForMarket:(id)a3 renotify:(BOOL)a4 completion:(id)a5;
- (void)_postNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 transitProducts:(id)a5 upgradeableOpenLoopPasses:(id)a6 renotifiableProducts:(id)a7 renotifiablePasses:(id)a8 completion:(id)a9;
- (void)_productNotificationMessageForMarket:(id)a3 product:(id)a4 renotify:(BOOL)a5 completion:(id)a6;
- (void)_recordNotificationType:(unint64_t)a3 sentForMarket:(id)a4;
- (void)_recordNotificationType:(unint64_t)a3 sentForMarkets:(id)a4;
- (void)_reportEvent:(id)a3 forMarket:(id)a4 eligibleMarkets:(id)a5 pass:(id)a6;
- (void)_reportExpressEnable:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5;
- (void)_reportExpressModeEnableFailed:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5;
- (void)_reportExpressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 pageTag:(id)a6 isReferredFromWatch:(BOOL)a7;
- (void)_scheduleCheckIn;
- (void)_schedulePromotedExpressModeNotificationDemotion:(id)a3;
- (void)_shouldScheduleNotificationActivity:(id)a3;
- (void)_startLocationMonitoring;
- (void)_unscheduleCheckIn;
- (void)_upgradeFromNotificationCountToNotificationTypes;
- (void)checkForNotification;
- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)noteAccountRemoved;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4;
- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4;
- (void)registerObserver:(id)a3;
- (void)sentTransitNotificationStateWithHandler:(id)a3;
- (void)setUserNotificationManager:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateRegistrationForTriggerEvents;
@end

@implementation PDTransitNotificationService

- (PDTransitNotificationService)initWithPaymentWebServiceCoordinator:(id)a3 notificationManager:(id)a4 userNotificationManager:(id)a5 databaseManager:(id)a6 expressPassManager:(id)a7 upgradeController:(id)a8
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PDTransitNotificationService;
  v18 = [(PDTransitNotificationService *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a3);
    objc_storeStrong((id *)&v19->_notificationManager, a4);
    objc_storeStrong((id *)&v19->_userNotificationManager, a5);
    objc_storeStrong((id *)&v19->_databaseManager, a6);
    objc_storeStrong((id *)&v19->_expressPassManager, a7);
    objc_storeStrong((id *)&v19->_upgradeController, a8);
    v19->_observersLock._os_unfair_lock_opaque = 0;
    uint64_t v20 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v19->_observers;
    v19->_observers = (NSHashTable *)v20;

    [(PDTransitNotificationService *)v19 _upgradeFromNotificationCountToNotificationTypes];
    [(PDTransitNotificationService *)v19 _connect];
  }

  return v19;
}

- (void)checkForNotification
{
  v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: checking for market support in response to API", v4, 2u);
  }

  [(PDTransitNotificationService *)self _checkForNotification];
}

- (void)noteAccountRemoved
{
  [(PDTransitNotificationService *)self _clearTransitNotificationHistory];
  upgradeController = self->_upgradeController;
  [(PDExpressTransitUpgradeController *)upgradeController resetDefaultPassExpressUpgradeAttempt];
}

- (void)_checkForNotification
{
  if (+[PKWalletVisibility isWalletVisible])
  {
    v3 = +[NSProcessInfo processInfo];
    unsigned int v4 = [v3 isLowPowerModeEnabled];

    if (v4)
    {
      v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Skipping check because of low power mode", buf, 2u);
      }
    }
    else
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10037DD1C;
      v6[3] = &unk_100737AC0;
      id v7 = (id)PDOSTransactionCreate("PDTransitNotificationService.check");
      v8 = self;
      v5 = v7;
      [(PDTransitNotificationService *)self _shouldScheduleNotificationActivity:v6];
    }
  }
}

- (void)postUpgradedPassNotificationForMarket:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: requested post upgraded Pass Notification for market:%@ pass with uniqueID:%@", buf, 0x16u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10037DFC4;
  v13[3] = &unk_10074C0E8;
  v13[4] = self;
  id v14 = v6;
  id v15 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v6, 0);
  id v16 = v7;
  id v10 = v7;
  id v11 = v15;
  id v12 = v6;
  [(PDTransitNotificationService *)self _expressNotificationForMarket:v12 eligibleMarkets:v11 pass:v10 expressUpgrade:1 isReferredFromWatch:1 completion:v13];
}

- (void)postUpgradesAvailableNotificationForMarket:(id)a3 pass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 uniqueID];
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: requested post Upgrade Selection Notification for for market:%@ pass with uniqueID:%@", buf, 0x16u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10037E270;
  v12[3] = &unk_10074C110;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [(PDTransitNotificationService *)self _expressUpgradesAvailableNotificationForPass:v10 completion:v12];
}

- (id)createCurrentNotificationRegistrationState
{
  if (![(PDTransitNotificationService *)self _shouldTrigger]) {
    return 0;
  }
  v2 = objc_alloc_init(PDNotificationStreamRegistrationState);
  id v3 = objc_alloc((Class)NSSet);
  id v4 = objc_msgSend(v3, "initWithObjects:", PKDarwinNotificationEventLockStateChanged, PKDarwinNotificationEventAirplaneModeStateChanged, 0);
  [(PDNotificationStreamRegistrationState *)v2 setNotificationNames:v4 forStream:0];

  return v2;
}

- (void)handleNotificationWithName:(id)a3 event:(id)a4 forStream:(int64_t)a5
{
  id v6 = a3;
  if (([v6 isEqualToString:PKDarwinNotificationEventLockStateChanged] & 1) != 0
    || [v6 isEqualToString:PKDarwinNotificationEventAirplaneModeStateChanged])
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: checking for market support due to lock status change", v8, 2u);
    }

    [(PDTransitNotificationService *)self _checkForNotification];
  }
}

- (void)updateRegistrationForTriggerEvents
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_registeredForImmediateTriggerEvents);
  unsigned int v4 = [(PDTransitNotificationService *)self _shouldTrigger];
  if (((v4 ^ ((v3 & 1) == 0)) & 1) == 0)
  {
    unsigned int v5 = v4;
    if (v3)
    {
      [(PDNotificationStreamManager *)self->_notificationManager unregisterConsumer:self];
      [(PDTransitNotificationService *)self _unscheduleCheckIn];
    }
    if (v5)
    {
      [(PDNotificationStreamManager *)self->_notificationManager registerConsumer:self];
      [(PDTransitNotificationService *)self _scheduleCheckIn];
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v10 = 0;
        id v7 = "PDTransitNotificationService: registered for triggers";
        v8 = (uint8_t *)&v10;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        id v7 = "PDTransitNotificationService: not registered triggers";
        v8 = (uint8_t *)&v9;
        goto LABEL_9;
      }
    }

    atomic_store(v5, (unsigned __int8 *)&self->_registeredForImmediateTriggerEvents);
  }
}

- (BOOL)_shouldTrigger
{
  if ((PKIsPhone() & 1) != 0 || (int v2 = PKIsWatch()) != 0) {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)_shouldScheduleNotificationActivity:(id)a3
{
  id v4 = a3;
  unsigned int v5 = PDDefaultQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10037E694;
  v7[3] = &unk_10072E598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (unint64_t)_eligibleNotificationsForTransitMarket:(id)a3
{
  id v4 = a3;
  if ([(PDTransitNotificationService *)self _shouldSendNotificationsPassingBaseRequirementsForTransitMarket:v4])
  {
    uint64_t v5 = [v4 renotifyDCICampaignIdentifier];
    uint64_t v6 = [v4 renotifyOpenLoopCampaignIdentifier];
    BOOL v7 = (v5 | v6) != 0;
    if (PKIgnoreOpenLoopExpressUpgradeLimits())
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: ignoring market notification limits due to internal setting toggled ON", (uint8_t *)&v22, 2u);
      }

      goto LABEL_13;
    }
    unint64_t v10 = [(PDTransitNotificationService *)self _hasSentNotificationForMarket:v4];
    if (!v10)
    {
LABEL_13:
      if (![(PDTransitNotificationService *)self _hasExistingTransitPassesForMarket:v4])
      {
        if ([(PDExpressTransitUpgradeController *)self->_upgradeController hasAttemptedDefaultPassExpressUpgrade])
        {
          int v14 = PKIgnoreOpenLoopExpressUpgradeLimits();
          id v15 = PKLogFacilityTypeGetObject();
          BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            if (v16)
            {
              LOWORD(v22) = 0;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: ignoring market express upgrade limits due to internal setting toggled ON. Supporting DCI, Open-Loop Express Upgrade, and Open-Loop renotify.", (uint8_t *)&v22, 2u);
            }

            unint64_t v9 = 11;
          }
          else
          {
            if (v16)
            {
              int v22 = 138412290;
              unint64_t v23 = (unint64_t)v4;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send Open-Loop Initial notification for %@ because an automatic express upgrade has been made previously.", (uint8_t *)&v22, 0xCu);
            }

            if (v6)
            {
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                int v22 = 138412290;
                unint64_t v23 = v6;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Open-Loop renotify campaign exists: %@. Supporting DCI or Open-Loop renotify as eligible initial notifications", (uint8_t *)&v22, 0xCu);
              }

              unint64_t v9 = 9;
            }
            else
            {
              unint64_t v9 = 1;
            }
          }
        }
        else
        {
          unint64_t v9 = 3;
        }
        goto LABEL_40;
      }
      id v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        unint64_t v23 = (unint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send initial market notification for %@.\nWe already have a valid transit pass - marking the market as suppressed to prevent future initial notification attempts", (uint8_t *)&v22, 0xCu);
      }

      [(PDTransitNotificationService *)self _recordNotificationType:1 sentForMarket:v4];
      goto LABEL_39;
    }
    unint64_t v11 = v10;
    if (!(v5 | v6))
    {
      __int16 v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        unint64_t v23 = (unint64_t)v4;
        __int16 v24 = 2048;
        unint64_t v25 = v11;
        id v18 = "PDTransitNotificationService: should not send market notification for %@.\n"
              "Notification of type (%lu) has already been sent and no renotify campaigns exist.";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v22, 0x16u);
      }
LABEL_38:

      goto LABEL_39;
    }
    if (v5)
    {
      id v12 = [(PDTransitNotificationService *)self _hasSentRenotifyNotificationForRenotifyCampaign:v5];
      if (!v12) {
        goto LABEL_42;
      }
      BOOL v7 = (BOOL)v12;
      if (!v6)
      {

        goto LABEL_35;
      }
    }
    else if (!v6)
    {
      goto LABEL_35;
    }
    __int16 v19 = [(PDTransitNotificationService *)self _hasSentRenotifyNotificationForRenotifyCampaign:v6];

    if (v5) {
    if (v19)
    }
    {
LABEL_35:
      __int16 v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412546;
        unint64_t v23 = (unint64_t)v4;
        __int16 v24 = 2048;
        unint64_t v25 = v11;
        id v18 = "PDTransitNotificationService: should not send market notificaiton for %@.\n"
              "Notification of type (%lu) has already been sent and all active renotify campaigns have been sent";
        goto LABEL_37;
      }
      goto LABEL_38;
    }
LABEL_42:
    if ([(PDTransitNotificationService *)self _shouldSendDCIRenotifyNotificationForTransitMarket:v4])
    {
      if (![(PDTransitNotificationService *)self _hasExistingTransitPassesForMarket:v4])goto LABEL_47; {
      v21 = PKLogFacilityTypeGetObject();
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 138412290;
        unint64_t v23 = (unint64_t)v4;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send DCI renotify notification for %@.\nWe already have a valid transit pass - marking as suppressed to prevent future DCI renotify notification attempts", (uint8_t *)&v22, 0xCu);
      }

      [(PDTransitNotificationService *)self _recordNotificationType:2 sentForMarket:v4];
      if ([(PDTransitNotificationService *)self _shouldSendOpenLoopRenotifyNotificationForTransitMarket:v4])
      {
LABEL_47:
        unint64_t v9 = 12;
        goto LABEL_40;
      }
LABEL_39:
      unint64_t v9 = 0;
LABEL_40:

      goto LABEL_41;
    }
    if ([(PDTransitNotificationService *)self _shouldSendOpenLoopRenotifyNotificationForTransitMarket:v4])
    {
      unint64_t v9 = 8;
      goto LABEL_40;
    }
    __int16 v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 134218242;
      unint64_t v23 = v11;
      __int16 v24 = 2112;
      unint64_t v25 = (unint64_t)v4;
      id v18 = "PDTransitNotificationService: should not send market notification as all valid cases fell through with sent type %lu for %@";
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  unint64_t v9 = 0;
LABEL_41:

  return v9;
}

- (BOOL)_shouldSendNotificationsPassingBaseRequirementsForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  uint64_t v6 = [v5 context];
  BOOL v7 = [v6 configuration];
  if (!v7)
  {
    unint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v16 = "PDTransitNotificationService: should not send notification because region config is missing";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
LABEL_11:
    BOOL v15 = 0;
    goto LABEL_24;
  }
  if ([v4 type] != (id)1)
  {
    unint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v16 = "PDTransitNotificationService: should not send notification because market is not transit";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = [v4 region];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  unint64_t v9 = [v4 expressCredentialTypes];
  int v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  __int16 v24 = sub_10037F7E8;
  unint64_t v25 = &unk_10074C188;
  v28 = &v29;
  id v26 = v6;
  unint64_t v10 = v8;
  v27 = v10;
  [v9 enumerateObjectsUsingBlock:&v22];
  v21 = v9;
  if (*((unsigned char *)v30 + 24))
  {
    unint64_t v11 = objc_msgSend(v5, "targetDevice", v9, v22, v23, v24, v25, v26);
    id v12 = [v11 deviceRegion];
    id v13 = [v11 cellularNetworkRegion];
    unsigned int v14 = [v4 shouldConsiderCellularRegion];
    if (PKEqualObjects() & 1) != 0 || v14 && (PKEqualObjects())
    {
      BOOL v15 = 1;
    }
    else
    {
      id v18 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v19 = @"NO";
        *(_DWORD *)buf = 138413314;
        id v34 = v4;
        __int16 v35 = 2112;
        if (v14) {
          CFStringRef v19 = @"YES";
        }
        v36 = v12;
        __int16 v37 = 2112;
        v38 = v13;
        __int16 v39 = 2112;
        v40 = v10;
        __int16 v41 = 2112;
        CFStringRef v42 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send notification for %@.\nDevice region: %@ cellularRegion: %@ marketRegion: %@ shouldConsiderCellularRegion: %@", buf, 0x34u);
      }

      BOOL v15 = 0;
    }
  }
  else
  {
    __int16 v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send notification for %@ because it didn't meet threshold", buf, 0xCu);
    }

    BOOL v15 = *((unsigned char *)v30 + 24) != 0;
  }

  _Block_object_dispose(&v29, 8);
LABEL_24:

  return v15;
}

- (BOOL)_shouldSendDCIRenotifyNotificationForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 renotifyDCICampaignIdentifier];
  if (!v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send DCI renotify notification for %@.\nNo campaign identifier exists for the market", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_8;
  }
  uint64_t v6 = [(PDTransitNotificationService *)self _hasSentRenotifyNotificationForRenotifyCampaign:v5];
  BOOL v7 = v6 == 0;
  if (v6)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send DCI renotify notification for %@.\nThe campaign has already been notified within another market (%@)", (uint8_t *)&v10, 0x16u);
    }

LABEL_8:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldSendOpenLoopRenotifyNotificationForTransitMarket:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 renotifyOpenLoopCampaignIdentifier];
  if (!v5)
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      unint64_t v9 = "PDTransitNotificationService: should not send Open-Loop renotify campaign notification for %@ because no camp"
           "aign identifier exists for the market";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
    }
LABEL_12:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  if (![(PDExpressTransitUpgradeController *)self->_upgradeController hasAttemptedDefaultPassExpressUpgrade])
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      unint64_t v9 = "PDTransitNotificationService: should not send Open-Loop renotify campaign notification for %@ because no auto"
           "matic express upgrade has ever been made";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v6 = [(PDTransitNotificationService *)self _hasSentRenotifyNotificationForRenotifyCampaign:v5];
  BOOL v7 = v6 == 0;
  if (v6)
  {
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      unsigned int v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: should not send Open-Loop renotify campaign notification for %@ because the campaign has already been notified within another market (%@)", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

- (void)_startLocationMonitoring
{
  if (self->_monitoringLocation)
  {
    int v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v3 = "PDTransitNotificationService: already monitoring location";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!PKRelevancyLocationServicesEnabled())
  {
    int v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unsigned __int8 v3 = "PDTransitNotificationService: could not monitor location due to authorization";
      goto LABEL_12;
    }
LABEL_13:

    return;
  }
  if (!self->_locationManager)
  {
    id v5 = objc_alloc((Class)CLLocationManager);
    uint64_t v6 = PKPassRelevancyBundle();
    BOOL v7 = [v6 bundlePath];
    id v8 = PDDefaultQueue();
    unint64_t v9 = (CLLocationManager *)[v5 initWithEffectiveBundlePath:v7 delegate:self onQueue:v8];
    locationManager = self->_locationManager;
    self->_locationManager = v9;

    [(CLLocationManager *)self->_locationManager setDesiredAccuracy:500.0];
  }
  int v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: started monitoring location", buf, 2u);
  }

  id v12 = +[NSDate date];
  lastCheckDate = self->_lastCheckDate;
  self->_lastCheckDate = v12;

  [(CLLocationManager *)self->_locationManager setDelegate:self];
  [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  self->_monitoringLocation = 1;
  unsigned int v14 = (OS_os_transaction *)PDOSTransactionCreate("PDTransitNotificationService.location_monitor");
  locationMonitorTransaction = self->_locationMonitorTransaction;
  self->_locationMonitorTransaction = v14;

  BOOL v16 = PDDefaultQueue();
  __int16 v17 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v16);
  locationTimer = self->_locationTimer;
  self->_locationTimer = v17;

  CFStringRef v19 = self->_locationTimer;
  dispatch_time_t v20 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v21 = self->_locationTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10037FDDC;
  handler[3] = &unk_10072E1E8;
  handler[4] = self;
  dispatch_source_set_event_handler(v21, handler);
  dispatch_resume((dispatch_object_t)self->_locationTimer);
}

- (void)_cleanupLocationMonitoring
{
  locationTimer = self->_locationTimer;
  if (locationTimer) {
    dispatch_source_cancel(locationTimer);
  }
  [(CLLocationManager *)self->_locationManager setDelegate:0];
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationMonitorTransaction = self->_locationMonitorTransaction;
  self->_locationMonitorTransaction = 0;

  self->_monitoringLocation = 0;
}

- (void)_postNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 transitProducts:(id)a5 upgradeableOpenLoopPasses:(id)a6 renotifiableProducts:(id)a7 renotifiablePasses:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1003802C0;
  v46[3] = &unk_10074C1D8;
  v46[4] = self;
  id v21 = a9;
  id v48 = v21;
  id v22 = v15;
  id v47 = v22;
  uint64_t v23 = objc_retainBlock(v46);
  if ((unint64_t)[v17 count] >= 2 && PKIsPhone())
  {
    __int16 v24 = self;
    id v25 = v22;
    uint64_t v26 = 0;
LABEL_4:
    [(PDTransitNotificationService *)v24 _multipleProductsNotificationForMarket:v25 renotify:v26 completion:v23];
    goto LABEL_21;
  }
  if ([v17 count] == (id)1 && PKIsPhone())
  {
    v27 = [v17 anyObject];
    [(PDTransitNotificationService *)self _productNotificationMessageForMarket:v22 product:v27 renotify:0 completion:v23];

    goto LABEL_21;
  }
  if (![v18 count])
  {
    if ((unint64_t)[v19 count] < 2 || !PKIsPhone())
    {
      if ([v19 count] == (id)1 && PKIsPhone())
      {
        [v19 anyObject];
        v36 = id v35 = v20;
        [(PDTransitNotificationService *)self _productNotificationMessageForMarket:v22 product:v36 renotify:1 completion:v23];
      }
      else
      {
        if (![v20 count]) {
          goto LABEL_21;
        }
        [v20 anyObject];
        v36 = id v35 = v20;
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_100380670;
        v39[3] = &unk_10074C278;
        v40 = v23;
        [(PDTransitNotificationService *)self _expressNotificationForMarket:v22 eligibleMarkets:v16 pass:v36 expressUpgrade:0 isReferredFromWatch:0 completion:v39];
      }
      id v20 = v35;
      goto LABEL_21;
    }
    __int16 v24 = self;
    id v25 = v22;
    uint64_t v26 = 1;
    goto LABEL_4;
  }
  id v37 = v20;
  id v38 = v19;
  v28 = v16;
  uint64_t v29 = [v18 anyObject];
  v30 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = [v29 uniqueID];
    *(_DWORD *)buf = 138412290;
    v50 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: upgrading open loop pass for express mode %@", buf, 0xCu);
  }
  atomic_store(1u, (unsigned __int8 *)&self->_upgradePending);
  upgradeController = self->_upgradeController;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100380484;
  v41[3] = &unk_10074C250;
  v41[4] = self;
  id v42 = v22;
  id v43 = v28;
  id v44 = v29;
  v45 = v23;
  id v33 = v29;
  id v16 = v28;
  id v34 = v33;
  [(PDExpressTransitUpgradeController *)upgradeController upgradePass:v33 completionHandler:v41];

  id v20 = v37;
  id v19 = v38;
LABEL_21:
}

- (void)_multipleProductsNotificationForMarket:(id)a3 renotify:(BOOL)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v8)
  {
    if ((PKIsPhone() & 1) == 0)
    {
      unint64_t v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Multiple product notification attempted with non phone device. Please file a radar", buf, 2u);
      }
      goto LABEL_15;
    }
    unint64_t v9 = [v7 notificationAssetIdentifier];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10038095C;
    v23[3] = &unk_10074C2A0;
    BOOL v26 = a4;
    id v10 = v7;
    id v24 = v10;
    id v25 = v8;
    int v11 = objc_retainBlock(v23);
    if (v9)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        id v16 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        id v17 = +[PKMobileAssetManager sharedInstance];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100380AEC;
        v19[3] = &unk_10074C2C8;
        id v20 = v16;
        BOOL v22 = a4;
        id v21 = v11;
        id v18 = v16;
        [v17 fetchMarketNotificationAssetsForIdentifier:v9 isDiscretionary:0 completionHandler:v19];

        goto LABEL_14;
      }
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        __int16 v13 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in multiple transit p"
              "roducts notification.";
        unsigned int v14 = v12;
        uint32_t v15 = 2;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
    else
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        __int16 v13 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
        unsigned int v14 = v12;
        uint32_t v15 = 12;
        goto LABEL_11;
      }
    }

    ((void (*)(void *, void, void))v11[2])(v11, 0, 0);
LABEL_14:

LABEL_15:
  }
}

- (void)_productNotificationMessageForMarket:(id)a3 product:(id)a4 renotify:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ((PKIsPhone() & 1) == 0)
    {
      __int16 v13 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Product notification attempted with non phone device. Please file a radar", buf, 2u);
      }
      goto LABEL_17;
    }
    id v12 = [v10 displayName];
    __int16 v13 = v12;
    if (!v12)
    {
      (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);
LABEL_17:

      goto LABEL_18;
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1003810EC;
    v28[3] = &unk_10074C2F0;
    BOOL v33 = a5;
    __int16 v13 = v12;
    uint64_t v29 = v13;
    id v14 = v9;
    id v30 = v14;
    id v31 = v10;
    id v32 = v11;
    uint32_t v15 = objc_retainBlock(v28);
    id v16 = [v14 notificationAssetIdentifier];
    if (v16)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        id v21 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        BOOL v22 = +[PKMobileAssetManager sharedInstance];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10038133C;
        v24[3] = &unk_10074C2C8;
        id v25 = v21;
        BOOL v27 = a5;
        BOOL v26 = v15;
        id v23 = v21;
        [v22 fetchMarketNotificationAssetsForIdentifier:v16 isDiscretionary:0 completionHandler:v24];

        goto LABEL_16;
      }
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v18 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in product notification.";
        id v19 = v17;
        uint32_t v20 = 2;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v14;
        id v18 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
        id v19 = v17;
        uint32_t v20 = 12;
        goto LABEL_13;
      }
    }

    ((void (*)(void *, void, void))v15[2])(v15, 0, 0);
LABEL_16:

    goto LABEL_17;
  }
LABEL_18:
}

- (void)_expressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 expressUpgrade:(BOOL)a6 isReferredFromWatch:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = (void (**)(id, void))a8;
  if (v17)
  {
    id v18 = [v14 notificationAssetIdentifier];
    id v19 = [v16 localizedDescription];
    if (!v19)
    {
      BOOL v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v50 = v14;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: No name to display for pass - cannot generate an express notification for market:%@ ", buf, 0xCu);
      }

      v17[2](v17, 0);
      goto LABEL_18;
    }
    id v20 = [v14 expressUpgradeHideDisableAction];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100381908;
    v38[3] = &unk_10074C318;
    BOOL v47 = a6;
    id v31 = v14;
    id v39 = v31;
    id v46 = v20;
    v45 = v17;
    id v40 = v19;
    id v41 = v16;
    id v32 = v15;
    id v42 = v15;
    id v43 = self;
    BOOL v48 = a7;
    id v21 = v18;
    id v44 = v21;
    BOOL v22 = objc_retainBlock(v38);
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v21;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: will create open loop notification with market asset: %@", buf, 0xCu);
    }

    if (v21)
    {
      if (!PKForceDefaultEmbeddedMarketStrings())
      {
        id v28 = (void *)PDOSTransactionCreate("PDTransitNotificationService.fetch_assets");
        uint64_t v29 = +[PKMobileAssetManager sharedInstance];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100381D2C;
        v33[3] = &unk_10074C340;
        id v34 = v28;
        id v35 = v31;
        BOOL v37 = a6;
        v36 = v22;
        id v30 = v28;
        [v29 fetchMarketNotificationAssetsForIdentifier:v21 isDiscretionary:0 completionHandler:v33];

        goto LABEL_17;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v24 = "PDTransitNotificationService: Internal Setting forcing default embedded strings used in express notification.";
        id v25 = v23;
        uint32_t v26 = 2;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v31;
      id v24 = "PDTransitNotificationService: No market notification asset identifier exists for market: %@";
      id v25 = v23;
      uint32_t v26 = 12;
      goto LABEL_14;
    }

    ((void (*)(void *, void, void))v22[2])(v22, 0, 0);
LABEL_17:
    id v15 = v32;

LABEL_18:
  }
}

- (void)_expressUpgradesAvailableNotificationForPass:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, id))a4;
  if (v6)
  {
    id v7 = [v5 localizedDescription];
    if (v7)
    {
      int v8 = PKIsWatch();
      BOOL v9 = v8 == 0;
      if (v8) {
        id v10 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_NOTIFICATION_TITLE_WATCH";
      }
      else {
        id v10 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_NOTIFICATION_TITLE";
      }
      if (v9) {
        id v11 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_MESSAGE_FORMAT";
      }
      else {
        id v11 = @"TRANSIT_OPEN_LOOP_EXPRESS_SELECTION_MESSAGE_FORMAT_WATCH";
      }
      id v12 = PKLocalizedTransitString(&v10->isa);
      __int16 v13 = PKLocalizedTransitString(&v11->isa);
      id v14 = PKStringWithValidatedFormat();
      id v15 = [PDPassExpressUpgradesAvailableUserNotification alloc];
      id v16 = objc_msgSend(v5, "uniqueID", v7);
      id v17 = [(PDGenericUserNotification *)v15 initWithTitle:v12 message:v14 forPassUniqueIdentifier:v16];

      id v18 = objc_alloc((Class)NSString);
      id v19 = [v18 initWithFormat:@"prefs:root=PASSBOOK&path=%@", PKURLActionExpressTransitSettings];
      [(PDUserNotification *)v17 setCustomActionURLString:v19];
      v6[2](v6, v17);
    }
    else
    {
      id v20 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: No name to display for pass - cannot generate an express selection required notification", buf, 2u);
      }

      v6[2](v6, 0);
    }
  }
}

- (void)sentTransitNotificationStateWithHandler:(id)a3
{
  unsigned __int8 v3 = (void (**)(id, id, id, id))a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v17 = [v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];

  id v5 = [v17 objectForKeyedSubscript:@"MarketGeoDCINotifications"];
  uint64_t v6 = [v17 objectForKeyedSubscript:@"MarketGeoUpgradeNotifications"];
  id v7 = [v17 objectForKeyedSubscript:@"MarketGeoRenotifyNotifications"];
  id v8 = objc_alloc((Class)NSSet);
  BOOL v9 = [v5 allKeys];
  id v10 = [v8 initWithArray:v9];

  id v11 = objc_alloc((Class)NSSet);
  id v12 = [v6 allKeys];
  id v13 = [v11 initWithArray:v12];

  id v14 = objc_alloc((Class)NSSet);
  id v15 = [v7 allKeys];
  id v16 = [v14 initWithArray:v15];

  v3[2](v3, v10, v13, v16);
}

- (void)_upgradeFromNotificationCountToNotificationTypes
{
  int v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 dictionaryForKey:@"PDTransitMarketGeoNotificationSent"];
  if (v3)
  {
    id v4 = [v2 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];

    if (!v4)
    {
      id v5 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Migrating notification state from count based to type based", buf, 2u);
      }

      id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v7 = v3;
      id v8 = [v7 countByEnumeratingWithState:&v13 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          id v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
            id v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v13 objects:v20 count:16];
        }
        while (v9);
      }

      CFStringRef v18 = @"MarketGeoSuppressedNotifications";
      id v19 = v6;
      id v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v2 setObject:v12 forKey:@"PDTransitNotificationServiceSentNotifications"];
    }
    objc_msgSend(v2, "removeObjectForKey:", @"PDTransitMarketGeoNotificationSent", (void)v13);
  }
}

- (unint64_t)_hasSentNotificationForMarket:(id)a3
{
  unsigned __int8 v3 = [a3 identifier];
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];

  id v6 = [v5 objectForKeyedSubscript:@"MarketGeoSuppressedNotifications"];
  if ([v6 containsObject:v3])
  {
    unint64_t v7 = 1;
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:@"MarketGeoDCINotifications"];
    id v9 = [v8 objectForKeyedSubscript:v3];

    if (v9)
    {
      unint64_t v7 = 100;
    }
    else
    {
      uint64_t v10 = [v5 objectForKeyedSubscript:@"MarketGeoUpgradeNotifications"];
      id v11 = [v10 objectForKeyedSubscript:v3];

      if (v11) {
        unint64_t v7 = 101;
      }
      else {
        unint64_t v7 = 0;
      }
    }
  }

  return v7;
}

- (id)_hasSentRenotifyNotificationForRenotifyCampaign:(id)a3
{
  id v4 = a3;
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];

  unint64_t v7 = [v6 objectForKeyedSubscript:@"MarketGeoSuppressedNotifications"];
  id v8 = v7;
  if (v4)
  {
    if ([v7 containsObject:v4])
    {
      id v9 = @"SuppressedRenotify";
    }
    else
    {
      uint64_t v10 = [(PDTransitNotificationService *)self _sentRenotifyNotificationsForRenotifiyIdentifier:v4];
      if ([v10 count])
      {
        id v9 = [v10 firstObject];
      }
      else
      {
        id v9 = 0;
      }
    }
  }
  else
  {
    id v9 = @"NullRenotify";
  }

  return v9;
}

- (id)_sentRenotifyNotificationsForRenotifiyIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  id v5 = [v4 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];

  id v6 = [v5 objectForKeyedSubscript:@"MarketGeoRenotifyNotifications"];
  unint64_t v7 = v6;
  id v8 = 0;
  if (v3 && v6)
  {
    id v9 = [v6 allKeys];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003828A4;
    v12[3] = &unk_10074C368;
    id v13 = v3;
    uint64_t v10 = +[NSPredicate predicateWithBlock:v12];
    id v8 = [v9 filteredArrayUsingPredicate:v10];
  }
  return v8;
}

- (void)_recordNotificationType:(unint64_t)a3 sentForMarket:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v6, 0);

  [(PDTransitNotificationService *)self _recordNotificationType:a3 sentForMarkets:v7];
}

- (void)_recordNotificationType:(unint64_t)a3 sentForMarkets:(id)a4
{
  id v5 = a4;
  id v6 = +[NSUserDefaults standardUserDefaults];
  id v7 = [v6 dictionaryForKey:@"PDTransitNotificationServiceSentNotifications"];
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v9 = [v8 objectForKeyedSubscript:@"MarketGeoSuppressedNotifications"];
  id v10 = [v9 mutableCopy];

  if (!v10) {
    id v10 = objc_alloc_init((Class)NSMutableArray);
  }
  id v42 = v10;
  id v11 = [v8 objectForKeyedSubscript:@"MarketGeoDCINotifications"];
  id v12 = [v11 mutableCopy];

  if (!v12) {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v13 = [v8 objectForKeyedSubscript:@"MarketGeoUpgradeNotifications"];
  id v14 = [v13 mutableCopy];

  if (!v14) {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v41 = v14;
  id v39 = v8;
  long long v15 = [v8 objectForKeyedSubscript:@"MarketGeoRenotifyNotifications"];
  id v16 = [v15 mutableCopy];

  id v17 = v42;
  if (!v16) {
    id v16 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v43 = v16;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = v5;
  id v19 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v45;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        id v24 = [v23 identifier];
        id v25 = 0;
        if ((uint64_t)a3 > 99)
        {
          switch(a3)
          {
            case 'd':
              uint32_t v26 = +[NSDate date];
              [v12 setObject:v26 forKeyedSubscript:v24];

              goto LABEL_23;
            case 'e':
              id v32 = +[NSDate date];
              [v41 setObject:v32 forKeyedSubscript:v24];

              goto LABEL_34;
            case 'f':
              uint64_t v28 = [v23 renotifyDCICampaignIdentifier];
              goto LABEL_26;
            case 'g':
              uint64_t v28 = [v23 renotifyOpenLoopCampaignIdentifier];
LABEL_26:
              id v25 = (void *)v28;
              goto LABEL_27;
            default:
              goto LABEL_42;
          }
        }
        if (a3 != 1)
        {
          if (a3 == 2)
          {
LABEL_23:
            uint64_t v27 = [v23 renotifyDCICampaignIdentifier];
          }
          else
          {
            if (a3 != 3) {
              goto LABEL_42;
            }
LABEL_34:
            uint64_t v27 = [v23 renotifyOpenLoopCampaignIdentifier];
          }
          id v25 = (void *)v27;
          char v31 = 1;
          if (!v27) {
            goto LABEL_42;
          }
LABEL_36:
          if (v31)
          {
            if (([v17 containsObject:v25] & 1) == 0)
            {
              if (![v43 count]
                || (-[PDTransitNotificationService _sentRenotifyNotificationsForRenotifiyIdentifier:](self, "_sentRenotifyNotificationsForRenotifiyIdentifier:", v25), v33 = objc_claimAutoreleasedReturnValue(), v34 = [v33 count], v33, id v17 = v42, !v34))
              {
                [v17 addObject:v25];
              }
            }
          }
          else
          {
            id v35 = +[NSString stringWithFormat:@"%@%@%@", v25, @":", v24];
            v36 = +[NSDate date];
            [v43 setObject:v36 forKeyedSubscript:v35];

            id v17 = v42;
          }
          goto LABEL_42;
        }
LABEL_27:
        uint64_t v29 = [v12 objectForKey:v24];
        if (v29)
        {
        }
        else
        {
          id v30 = [v41 objectForKey:v24];

          if (!v30) {
            [v17 addObject:v24];
          }
        }
        char v31 = 0;
        if (v25) {
          goto LABEL_36;
        }
LABEL_42:
      }
      id v20 = [v18 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v20);
  }

  if ([v17 count]) {
    [v39 setObject:v17 forKeyedSubscript:@"MarketGeoSuppressedNotifications"];
  }
  if ([v12 count]) {
    [v39 setObject:v12 forKeyedSubscript:@"MarketGeoDCINotifications"];
  }
  if ([v41 count]) {
    [v39 setObject:v41 forKeyedSubscript:@"MarketGeoUpgradeNotifications"];
  }
  if ([v43 count]) {
    [v39 setObject:v43 forKeyedSubscript:@"MarketGeoRenotifyNotifications"];
  }
  BOOL v37 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Updating sent dictionary to:\n%@", buf, 0xCu);
  }

  id v38 = +[NSUserDefaults standardUserDefaults];
  [v38 setObject:v39 forKey:@"PDTransitNotificationServiceSentNotifications"];
}

- (void)_clearTransitNotificationHistory
{
  int v2 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Clearing transit notification history", v4, 2u);
  }

  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObjectForKey:@"PDTransitNotificationServiceSentNotifications"];
}

- (id)_existingTransitPassesForMarket:(id)a3
{
  id v4 = a3;
  id v5 = [v4 expressCredentialTypes];
  id v6 = [v4 expressTransitNetworks];

  id v7 = [(PDDatabaseManager *)self->_databaseManager transitPasses];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003830BC;
  v12[3] = &unk_10074C390;
  id v13 = v5;
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  id v10 = [v7 objectsPassingTest:v12];

  return v10;
}

- (BOOL)_hasExistingTransitPassesForMarket:(id)a3
{
  id v3 = [(PDTransitNotificationService *)self _existingTransitPassesForMarket:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_observersLock = &self->_observersLock;
    os_unfair_lock_lock(&self->_observersLock);
    id v6 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(p_observersLock);
    id v7 = PDDefaultQueue();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100383418;
    v9[3] = &unk_10072FDC8;
    id v10 = v6;
    id v11 = v4;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

- (void)_connect
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10038359C;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  if (qword_100808ED0 != -1) {
    dispatch_once(&qword_100808ED0, block);
  }
}

- (void)_scheduleCheckIn
{
  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10038366C;
  v3[3] = &unk_100743188;
  v3[4] = self;
  [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v3];
}

- (void)_schedulePromotedExpressModeNotificationDemotion:(id)a3
{
  id v3 = a3;
  if ([v3 promotionActive])
  {
    id v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v3 promoteEndDate];
      unint64_t v6 = (unint64_t)[v3 notificationType];
      if (v6 > 0x51) {
        CFStringRef v7 = @"unknown";
      }
      else {
        CFStringRef v7 = off_10074C668[v6];
      }
      int v11 = 138412802;
      id v12 = v5;
      __int16 v13 = 2112;
      CFStringRef v14 = v7;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling Activity for %@ to demote %@'s promoted status: %@", (uint8_t *)&v11, 0x20u);
    }
    id v8 = [v3 promoteEndDate];
    id v9 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v8];

    [v9 setRepeating:1];
    [v9 setRepeatInterval:3600.0];
    [v9 setReason:@"PDTransitNotificationServiceDemoteExpressMode"];
    id v10 = [v3 notificationIdentifier];
    PDScheduledActivityRegister();
  }
}

- (void)_unscheduleCheckIn
{
  [(PDTransitNotificationService *)self _connect];
  PDScheduledActivityRemove();
}

- (id)_startTime
{
  int v2 = +[NSCalendar currentCalendar];
  id v3 = +[NSDate date];
  id v4 = [v2 dateByAddingUnit:16 value:1 toDate:v3 options:0];

  id v5 = [v2 components:28 fromDate:v4];
  [v5 setHour:arc4random_uniform(6u)];
  [v5 setMinute:arc4random_uniform(0x3Cu)];
  [v5 setSecond:arc4random_uniform(0x3Cu)];
  unint64_t v6 = +[NSTimeZone localTimeZone];
  [v5 setTimeZone:v6];

  CFStringRef v7 = [v2 dateFromComponents:v5];

  return v7;
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"PDTransitNotificationServiceCheckIn"])
  {
    id v8 = PKCurrentRegion();
    id v9 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebServiceContext];
    id v10 = [v9 configuration];
    unsigned int v11 = [v10 shouldEnableTransitServiceCheckInForRegion:v8];

    id v12 = PKLogFacilityTypeGetObject();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: scheduled check in running", buf, 2u);
      }

      [(PDTransitNotificationService *)self _checkForNotification];
    }
    else
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: scheduled check in ran but asked to be unscheduled", buf, 2u);
      }

      [(PDTransitNotificationService *)self _unscheduleCheckIn];
    }
  }
  else
  {
    CFStringRef v14 = [v7 reason];
    if (v14 == @"PDTransitNotificationServiceDemoteExpressMode"
      || (__int16 v15 = v14) != 0
      && (unsigned int v16 = [(__CFString *)v14 isEqualToString:@"PDTransitNotificationServiceDemoteExpressMode"], v15, v15, v16))
    {
      id v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: Demote Express Mode Notification check running", buf, 2u);
      }

      userNotificationManager = self->_userNotificationManager;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100383DDC;
      v19[3] = &unk_10073A3F0;
      void v19[4] = self;
      id v20 = v6;
      [(PDUserNotificationManager *)userNotificationManager userNotificationWithIdentifier:v20 completion:v19];
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if (+[PKWalletVisibility isWalletVisible])
  {
    id v6 = [v5 lastObject];
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v63 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: did update location %@", buf, 0xCu);
    }

    [v6 horizontalAccuracy];
    double v9 = v8;
    id v10 = [v6 timestamp];
    [v10 timeIntervalSinceNow];
    double v12 = v11;

    if (self->_monitoringLocation && v9 <= 500.0 && fabs(v12) < 300.0)
    {
      id v42 = v5;
      dispatch_source_cancel((dispatch_source_t)self->_locationTimer);
      locationTimer = self->_locationTimer;
      self->_locationTimer = 0;

      CFStringRef v14 = dispatch_group_create();
      id v38 = objc_alloc_init((Class)NSMutableSet);
      id v15 = objc_alloc_init((Class)NSMutableSet);
      id v34 = objc_alloc_init((Class)NSMutableSet);
      id v33 = objc_alloc_init((Class)NSMutableSet);
      id v36 = objc_alloc_init((Class)NSMutableSet);
      dispatch_group_enter(v14);
      unsigned int v16 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
      id v17 = [v16 context];
      id v18 = [v17 configuration];

      id v19 = (void *)PDOSTransactionCreate("PDTransitNotificationService.configure");
      id v40 = v18;
      id v20 = [v18 marketsURL];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1003843E4;
      v51[3] = &unk_10074C408;
      id v52 = v19;
      id v41 = v6;
      id v31 = v6;
      id v53 = v31;
      v54 = self;
      id v32 = v14;
      v55 = v32;
      id v56 = v16;
      id v21 = v15;
      id v57 = v21;
      id v22 = v34;
      id v58 = v22;
      id v23 = v33;
      id v59 = v23;
      id v24 = v38;
      id v60 = v24;
      id v25 = v36;
      id v61 = v25;
      id v39 = v16;
      id v37 = v19;
      +[PKPaymentMarketsConfiguration paymentMarketsConfigurationWithURL:v20 forDeviceClass:0 version:0 completion:v51];

      uint32_t v26 = PDDefaultQueue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100384A8C;
      block[3] = &unk_10072FF98;
      id v44 = v21;
      id v45 = v22;
      id v46 = v23;
      id v47 = v25;
      id v48 = v24;
      id v49 = v31;
      id v50 = self;
      id v35 = v24;
      id v27 = v25;
      id v28 = v23;
      id v29 = v22;
      id v30 = v21;
      dispatch_group_notify(v32, v26, block);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: stopping location monitoring", buf, 2u);
      }

      [(PDTransitNotificationService *)self _cleanupLocationMonitoring];
      id v7 = v32;
      id v6 = v41;
      id v5 = v42;
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: discarding location", buf, 2u);
    }
  }
}

- (void)_availableProductsForNotifiableMarkets:(id)a3 filteredForTargetDevice:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003850E0;
  v17[3] = &unk_10074C480;
  v17[4] = &v18;
  [v8 enumerateObjectsUsingBlock:v17];
  if (*((unsigned char *)v19 + 24))
  {
    double v11 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100385188;
    v14[3] = &unk_1007346F0;
    id v15 = v9;
    id v16 = v10;
    [v11 staticFilteredProductsWithDiagnosticReason:@"Transit Notification Service - Location update" completion:v14];
  }
  else
  {
    double v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: No markets require products request", v13, 2u);
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
  _Block_object_dispose(&v18, 8);
}

- (id)_transitProducts:(id)a3 forMarket:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 closedLoopExpressCredentialTypes];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100385358;
  v12[3] = &unk_10074C4F8;
  id v13 = v5;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = objc_alloc_init((Class)NSMutableSet);
  id v7 = v15;
  id v8 = v14;
  id v9 = v5;
  [v6 enumerateObjectsUsingBlock:v12];

  id v10 = [v7 copy];
  return v10;
}

- (id)_expressUpgradeableOpenLoopPassesForMarket:(id)a3
{
  id v4 = a3;
  if (PKIgnoreOpenLoopExpressUpgradeLimits())
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: ignoring open loop upgrade check if upgrade has been previously attempted due to internal setting toggled ON", buf, 2u);
    }

    goto LABEL_9;
  }
  if (![(PDExpressTransitUpgradeController *)self->_upgradeController hasAttemptedDefaultPassExpressUpgrade])
  {
LABEL_9:
    id v6 = [(PDTransitNotificationService *)self _defaultPassUniqueIdentifier];
    if (v6)
    {
      id v8 = [(PDDatabaseManager *)self->_databaseManager passWithUniqueIdentifier:v6];
      if (v8)
      {
        id v9 = [v4 openLoopExpressCredentialTypes];
        id v10 = +[NSSet setWithObject:v8];
        double v11 = [v10 allObjects];
        id v15 = _NSConcreteStackBlock;
        uint64_t v16 = 3221225472;
        id v17 = sub_1003858F8;
        uint64_t v18 = &unk_10074C520;
        id v19 = self;
        double v12 = v9;
        uint64_t v20 = v12;
        id v13 = objc_msgSend(v11, "pk_objectsPassingTest:", &v15);

        if (objc_msgSend(v13, "count", v15, v16, v17, v18, v19))
        {
          id v7 = +[NSSet setWithArray:v13];
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        double v12 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: no upgradeable open loop passes as the default pass cannot be found", buf, 2u);
        }
        id v7 = 0;
      }
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: no upgradeable open loop passes as there is no default pass", buf, 2u);
      }
      id v7 = 0;
    }

    goto LABEL_23;
  }
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDTransitNotificationService: no upgradeable open loop passes because an upgrade has already been attempted", buf, 2u);
  }
  id v7 = 0;
LABEL_23:

  return v7;
}

- (void)_expressRenotifiableOpenLoopPassesForViableMarkets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    expressPassManager = self->_expressPassManager;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100385C34;
    v10[3] = &unk_100731D58;
    v10[4] = self;
    id v12 = v7;
    id v11 = v6;
    sub_10018E054((uint64_t)expressPassManager, 1, v10);
  }
}

- (void)_beginReportingIfNecessary
{
  uint64_t v3 = PKAnalyticsSubjectWalletGeolocation;
  id v4 = +[PKAnalyticsReporter reporterForSubject:PKAnalyticsSubjectWalletGeolocation];

  if (!v4)
  {
    self->_didBeginReportingSubject = 1;
    +[PKAnalyticsReporter beginSubjectReporting:v3];
  }
}

- (void)_endReportingIfNecessary
{
  if (self->_didBeginReportingSubject)
  {
    self->_didBeginReportingSubject = 0;
    +[PKAnalyticsReporter endSubjectReporting:PKAnalyticsSubjectWalletGeolocation];
  }
}

- (void)_reportExpressEnable:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:PKAnalyticsReportEventTypeExpressModeEnable forKey:PKAnalyticsReportEventKey];
  [v11 setObject:PKAnalyticsReportExpressModeChangePageTag forKey:PKAnalyticsReportPageTagKey];
  [(PDTransitNotificationService *)self _reportEvent:v11 forMarket:v10 eligibleMarkets:v9 pass:v8];
}

- (void)_reportExpressModeEnableFailed:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  [v11 setObject:PKAnalyticsReportEventTypeExpressModeEnableFailed forKey:PKAnalyticsReportEventKey];
  [v11 setObject:PKAnalyticsReportExpressModeChangePageTag forKey:PKAnalyticsReportPageTagKey];
  [(PDTransitNotificationService *)self _reportEvent:v11 forMarket:v10 eligibleMarkets:v9 pass:v8];
}

- (void)_reportExpressNotificationForMarket:(id)a3 eligibleMarkets:(id)a4 pass:(id)a5 pageTag:(id)a6 isReferredFromWatch:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  [v17 setObject:PKAnalyticsReportEventTypeViewDidAppear forKey:PKAnalyticsReportEventKey];
  [v17 safelySetObject:v12 forKey:PKAnalyticsReportPageTagKey];

  uint64_t v16 = &PKAnalyticsReportReferralSourceWatchApp;
  if (!v7) {
    uint64_t v16 = &PKAnalyticsReportReferralSourceWallet;
  }
  [v17 setObject:*v16 forKey:PKAnalyticsReportReferralSourceKey];
  [(PDTransitNotificationService *)self _reportEvent:v17 forMarket:v15 eligibleMarkets:v14 pass:v13];
}

- (void)_reportEvent:(id)a3 forMarket:(id)a4 eligibleMarkets:(id)a5 pass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v47 = a5;
  id v12 = a6;
  id v13 = v12;
  if (!v10 || !v12) {
    goto LABEL_27;
  }
  id v14 = [v12 passType];
  if ((unint64_t)v14 + 1 >= 3) {
    id v15 = (__CFString *)PKAnalyticsReportUnknownValue;
  }
  else {
    id v15 = off_10074C8F8[(void)v14 + 1];
  }
  [v10 setObject:v15 forKeyedSubscript:PKAnalyticsReportPassTypeKey];

  unint64_t v16 = (unint64_t)[v13 style];
  if (v16 < 0xD && ((0x13FFu >> v16) & 1) != 0) {
    id v17 = off_10074C910[v16];
  }
  else {
    id v17 = (__CFString *)PKAnalyticsReportUnknownValue;
  }
  [v10 setObject:v17 forKeyedSubscript:PKAnalyticsReportPassStyleKey];

  uint64_t v18 = [v13 nfcPayload];
  PKAnalyticsReportSwitchToggleResultValue();
  id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v19 forKeyedSubscript:PKAnalyticsReportPassHasNFCKey];

  id v20 = v13;
  if ([v20 passType] == (id)1)
  {
    char v21 = [v20 secureElementPass];
    id v22 = [v21 cardType];
    if ((unint64_t)v22 <= 4) {
      id v19 = (__CFString *)*(id *)*(&off_10074C978 + (void)v22);
    }
  }
  else
  {
    id v19 = @"other";
  }

  [v10 setObject:v19 forKeyedSubscript:PKAnalyticsReportPassProductTypeKey];
  id v23 = [v20 secureElementPass];
  if ([v23 isIdentityPass])
  {
    id v24 = (char *)[v23 identityType];
    if ((unint64_t)(v24 - 1) < 3)
    {
      id v25 = *(&off_10074C9A0 + (void)(v24 - 1));
      goto LABEL_22;
    }
  }
  else if ([v23 isAccessPass])
  {
    id v26 = [v23 accessType];
    if ((unint64_t)v26 < 7)
    {
      id v25 = *(&off_10074C9B8 + (void)v26);
      goto LABEL_22;
    }
  }
  id v25 = PKAnalyticsReportUnknownValue;
LABEL_22:

  [v10 setObject:v25 forKeyedSubscript:PKAnalyticsReportPassProductSubtypeKey];
  id v27 = [v20 secureElementPass];
  id v28 = [v27 devicePaymentApplications];
  [v28 count];

  id v29 = PKAnalyticsReportSwitchToggleResultValue();

  [v10 setObject:v29 forKeyedSubscript:PKAnalyticsReportCoBadgeEnableKey];
  id v30 = [v20 secureElementPass];
  id v31 = PKAnalyticsReportUnknownValue;
  id v32 = [v30 organizationName];
  if ([v32 length])
  {
    unint64_t v33 = (unint64_t)[v30 cardType];
    if (v33 <= 4 && ((1 << v33) & 0x16) != 0)
    {
      id v34 = v32;

      id v31 = v34;
    }
  }

  [v10 setObject:v31 forKeyedSubscript:PKAnalyticsReportIssuerNameKey];
LABEL_27:

  [v13 devicePaymentApplications];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  id v36 = [v35 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v36)
  {
    id v37 = v36;
    id v38 = 0;
    uint64_t v39 = *(void *)v49;
    while (2)
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(void *)v49 != v39) {
          objc_enumerationMutation(v35);
        }
        id v41 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (v38 && v38 != [*(id *)(*((void *)&v48 + 1) + 8 * i) paymentType])
        {

          id v42 = @"multiple";
          goto LABEL_39;
        }
        id v38 = [v41 paymentType];
      }
      id v37 = [v35 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }

  PKPaymentMethodTypeToString();
  id v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_39:

  [v10 safelySetObject:v42 forKey:PKAnalyticsReportPaymentMethodTypeKey];
  id v43 = [v11 analyticsReportingNameValue];
  [v10 safelySetObject:v43 forKey:PKAnalyticsReportMarketNameKey];

  id v44 = [v11 region];
  [v10 safelySetObject:v44 forKey:PKAnalyticsReportMarketRegionKey];

  id v45 = [(PDTransitNotificationService *)self _eligibleMarketNames:v47];
  [v10 safelySetObject:v45 forKey:PKAnalyticsReportEligibleMarketsKey];

  id v46 = [(PDTransitNotificationService *)self _expressPaymentNetworkNamesForPass:v13];
  [v10 setObject:v46 forKey:PKAnalyticsReportPaymentNetworkNameKey];

  +[PKAnalyticsReporter subject:PKAnalyticsSubjectWalletGeolocation sendEvent:v10];
}

- (id)_eligibleMarketNames:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
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
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "analyticsReportingNameValue", (void)v13);
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 componentsJoinedByString:PKAnalyticsReportArraySeparator];

  return v11;
}

- (id)_expressPaymentNetworkNamesForPass:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v24 = v4;
  id v6 = [v4 paymentPass];
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  id v37 = sub_100020C9C;
  id v38 = sub_100021140;
  id v39 = objc_alloc_init((Class)NSMutableSet);
  id v7 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  uint64_t v8 = [v7 targetDevice];

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100386E40;
  v32[3] = &unk_10074C5C0;
  id v9 = v8;
  id v33 = v9;
  id v26 = objc_retainBlock(v32);
  id v25 = [objc_alloc((Class)PKExpressPassInformation) initForPaymentPass:v6 withTechologyTest:v26];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100386EA0;
  v31[3] = &unk_10074C5E8;
  v31[4] = &v34;
  [v25 enumerateCredentialsWithHandler:v31];
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v9 upgradeRequestForPass:v4];
    id v11 = [v10 paymentApplicationIdentifiers];

    if (v11) {
      [(id)v35[5] addObjectsFromArray:v11];
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = (id)v35[5];
  id v13 = [v12 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    uint64_t v15 = PKAnalyticsReportUnknownValue;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        id v17 = [v6 devicePaymentApplicationForAID:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        uint64_t v18 = v17;
        if (v17)
        {
          [v17 paymentNetworkIdentifier];
          uint64_t v19 = PKPaymentNetworkNameForPaymentCredentialType();
          id v20 = (void *)v19;
          if (v19) {
            uint64_t v21 = v19;
          }
          else {
            uint64_t v21 = v15;
          }
          [v5 addObject:v21];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v13);
  }

  if (![v5 count]) {
    [v5 addObject:PKAnalyticsReportUnknownValue];
  }
  id v22 = [v5 componentsJoinedByString:PKAnalyticsReportArraySeparator];

  _Block_object_dispose(&v34, 8);
  return v22;
}

- (PDUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setUserNotificationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCheckDate, 0);
  objc_storeStrong((id *)&self->_locationTimer, 0);
  objc_storeStrong((id *)&self->_locationMonitorTransaction, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_upgradeController, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationConfiguration, 0);
}

@end