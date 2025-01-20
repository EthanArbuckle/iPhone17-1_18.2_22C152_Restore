@interface CLAvengerReconciler
- (CLAvengerReconciler)initWithQueue:(id)a3;
- (id)attemptReconciliationWithAddress:(id)a3 advertisementData:(id)a4;
- (void)dealloc;
- (void)didFetchUnknownBeacons:(id)a3;
- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3;
- (void)initKeyReconciler;
- (void)recreateKeyReconciler;
- (void)tearDownKeyReconciler;
@end

@implementation CLAvengerReconciler

- (id)attemptReconciliationWithAddress:(id)a3 advertisementData:(id)a4
{
  if (a3)
  {
    id v7 = [a3 mutableCopy];
    [v7 appendData:a4];
    unsigned int v24 = 0;
    unsigned __int8 v23 = -1;
    unsigned __int8 v22 = 0;
    id v8 = [(SPKeyReconciler *)self->_keyReconciler reconcileKey:v7 matchedIndex:&v24 sequence:&v23 error:&v22];
    id v9 = [(NSMutableDictionary *)self->_nonownerAddressToUUIDMap objectForKeyedSubscript:a3];
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_102332370);
    }
    v10 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      nonownerAddressToUUIDMap = self->_nonownerAddressToUUIDMap;
      *(_DWORD *)buf = 68290051;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2113;
      id v30 = v8;
      __int16 v31 = 2113;
      id v32 = v9;
      __int16 v33 = 2113;
      id v34 = a3;
      __int16 v35 = 2113;
      v36 = nonownerAddressToUUIDMap;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled: \", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"uuidMap\":%{private, location:escape_only}@}", buf, 0x3Au);
    }
    if (v8)
    {
      if (v9)
      {
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_102332370);
        }
        v12 = qword_102419568;
        if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68289539;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          __int16 v29 = 2113;
          id v30 = v8;
          __int16 v31 = 2113;
          id v32 = v9;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled to both owner and nonowner\", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_102419560 != -1) {
            dispatch_once(&qword_102419560, &stru_102332370);
          }
        }
        v13 = qword_102419568;
        if (os_signpost_enabled((os_log_t)qword_102419568))
        {
          *(_DWORD *)buf = 68289539;
          int v26 = 0;
          __int16 v27 = 2082;
          v28 = "";
          __int16 v29 = 2113;
          id v30 = v8;
          __int16 v31 = 2113;
          id v32 = v9;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#CLAvengerReconciler advertisement reconciled to both owner and nonowner", "{\"msg%{public}.0s\":\"#CLAvengerReconciler advertisement reconciled to both owner and nonowner\", \"ownerUUID\":%{private, location:escape_only}@, \"nonownerUUID\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
      v14 = [CLAvengerScannerReconciledInformation alloc];
      v15 = [(CLAvengerScannerReconciledInformation *)v14 initWithOwnerInformation:v8 matchedIndex:v24 sequence:v23 error:v22];
    }
    else
    {
      v18 = [CLAvengerScannerReconciledInformation alloc];
      if (v9) {
        v15 = [(CLAvengerScannerReconciledInformation *)v18 initWithNonOwnerInformation:v9];
      }
      else {
        v15 = [(CLAvengerScannerReconciledInformation *)v18 initUnknown];
      }
    }
    v17 = v15;
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_102332370);
    }
    v19 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [(CLAvengerScannerReconciledInformation *)v17 description];
      *(_DWORD *)buf = 68289283;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      __int16 v29 = 2113;
      id v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler: creating CLAvengerScannerReconciledInformation\", \"reconciledInformation.description\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_102419570 != -1) {
      dispatch_once(&qword_102419570, &stru_102332350);
    }
    v16 = qword_102419578;
    if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v26 = 0;
      __int16 v27 = 2082;
      v28 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerReconciler: onAvengerAdvertisement - no address\"}", buf, 0x12u);
    }
    return 0;
  }
  return v17;
}

- (CLAvengerReconciler)initWithQueue:(id)a3
{
  if (os_variant_is_darwinos()) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)CLAvengerReconciler;
  v6 = [(CLAvengerReconciler *)&v8 init];
  v5 = v6;
  if (v6)
  {
    v6->_queue = (OS_dispatch_queue *)a3;
    [(CLAvengerReconciler *)v6 initKeyReconciler];
  }
  return v5;
}

- (void)dealloc
{
  [(CLAvengerReconciler *)self tearDownKeyReconciler];
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerReconciler;
  [(CLAvengerReconciler *)&v3 dealloc];
}

- (void)initKeyReconciler
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10161DC84;
  handler[3] = &unk_1022B3858;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch("SPKeyReconcilerFilesUpdatedNotification", &self->_keyReconcilerFilesUpdateNotificationToken, queue, handler);
  v4 = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10161DCB0;
  v13[3] = &unk_1022B3858;
  objc_copyWeak(&v14, &location);
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &self->_firstUnlockNotificationToken, v4, v13);
  v5 = (SPBeaconManager *)objc_alloc_init((Class)SPBeaconManager);
  self->_beaconManager = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10161DE88;
  v12[3] = &unk_1023322A0;
  v12[4] = self;
  [(SPBeaconManager *)v5 createKeyReconcilerWithCompletion:v12];
  self->_ownerSession = (SPOwnerSession *)objc_opt_new();
  self->_nonownerAddressToUUIDMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFStringGetCString(SPUnknownBeaconsSetChangedNotification, buffer, 256, 0x8000100u);
  v6 = self->_queue;
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_10161E004;
  v10 = &unk_1022B3858;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(buffer, &self->_unknownBeaconsSetChangedNotificationToken, v6, &v7);
  -[CLAvengerReconciler fetchAllUnknownBeaconsWithCompletion:](self, "fetchAllUnknownBeaconsWithCompletion:", &stru_1023322E0, v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)recreateKeyReconciler
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_102332350);
  }
  objc_super v3 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v7 = 0;
    __int16 v8 = 2082;
    id v9 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerReconciler: recreating reconciler\"}", buf, 0x12u);
  }
  beaconManager = self->_beaconManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10161E170;
  v5[3] = &unk_1023322A0;
  v5[4] = self;
  [(SPBeaconManager *)beaconManager createKeyReconcilerWithCompletion:v5];
}

- (void)tearDownKeyReconciler
{
  if (notify_is_valid_token(self->_keyReconcilerFilesUpdateNotificationToken))
  {
    notify_cancel(self->_keyReconcilerFilesUpdateNotificationToken);
    self->_keyReconcilerFilesUpdateNotificationToken = -1;
  }
  if (notify_is_valid_token(self->_firstUnlockNotificationToken))
  {
    notify_cancel(self->_firstUnlockNotificationToken);
    self->_firstUnlockNotificationToken = -1;
  }

  self->_beaconManager = 0;
  self->_keyReconciler = 0;
  if (notify_is_valid_token(self->_unknownBeaconsSetChangedNotificationToken))
  {
    notify_cancel(self->_unknownBeaconsSetChangedNotificationToken);
    self->_unknownBeaconsSetChangedNotificationToken = -1;
  }

  self->_ownerSession = 0;
  self->_nonownerAddressToUUIDMap = 0;
}

- (void)fetchAllUnknownBeaconsWithCompletion:(id)a3
{
  if (qword_102419570 != -1) {
    dispatch_once(&qword_102419570, &stru_102332350);
  }
  v5 = qword_102419578;
  if (os_log_type_enabled((os_log_t)qword_102419578, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)68289026;
    __int16 v10 = 2082;
    id v11 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#CLAvengerReconciler fetching unknown beacons\"}", (uint8_t *)&buf, 0x12u);
  }
  objc_initWeak(&buf, self);
  ownerSession = self->_ownerSession;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10161E538;
  v7[3] = &unk_102332330;
  v7[4] = self;
  objc_copyWeak(&v8, &buf);
  v7[5] = a3;
  [(SPOwnerSession *)ownerSession unknownBeaconsForUUIDs:&__NSArray0__struct completion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&buf);
}

- (void)didFetchUnknownBeacons:(id)a3
{
  [(NSMutableDictionary *)self->_nonownerAddressToUUIDMap removeAllObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = a3;
  id v6 = [a3 countByEnumeratingWithState:&v16 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 68289539;
    long long v15 = v7;
    do
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        if (qword_102419560 != -1) {
          dispatch_once(&qword_102419560, &stru_102332370);
        }
        v12 = qword_102419568;
        if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
        {
          id v13 = [[[v11 identifier] UUIDString];
          id v14 = [[[v11 identifier] UUIDString];
          *(_DWORD *)id buf = v15;
          int v21 = 0;
          __int16 v22 = 2082;
          unsigned __int8 v23 = "";
          __int16 v24 = 2113;
          id v25 = v13;
          __int16 v26 = 2113;
          id v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLAvengerReconciler got unknown beacon\", \"beacon.uuid\":%{private, location:escape_only}@, \"beacon.identifier\":%{private, location:escape_only}@}", buf, 0x26u);
        }
        [self->_nonownerAddressToUUIDMap setObject:objc_msgSend(v11, "identifier", v15) forKey:objc_msgSend(v11, "advertisement")];
        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v16 objects:v28 count:16];
    }
    while (v8);
  }
}

@end