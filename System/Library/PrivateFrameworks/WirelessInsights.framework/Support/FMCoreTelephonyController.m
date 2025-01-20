@interface FMCoreTelephonyController
+ (id)cellInfoToFMCongestionCell:(id)a3 atTime:(id)a4 inSlot:(id)a5 error:(id *)a6;
+ (id)cellInfoToFMServingCell:(id)a3 atTime:(id)a4 inSlot:(id)a5 error:(id *)a6;
- (BOOL)airplaneModeActive;
- (BOOL)isDataContextUuid:(id)a3;
- (FMCoreTelephonyController)initWithFMModel:(id)a3;
- (FMModel)fmModel;
- (FMSubscriptionContext)dataContext;
- (NSMutableDictionary)uuidToContextMap;
- (TelephonyStateRelay)ctRelay;
- (dispatch_queue_s)queue;
- (id)CTSubscriptionSlotToSubscriptionID:(int64_t)a3;
- (id)CTXPCServiceSubscriptionContextToFMSubscriptionContext:(id)a3;
- (id)getRegistrationStatus:(id)a3;
- (id)getSubscriptionContextsInUse;
- (void)dealloc;
- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)removeAsDelegate;
- (void)setAirplaneModeActive:(BOOL)a3;
- (void)setCtRelay:(id)a3;
- (void)setDataContext:(id)a3;
- (void)setFmModel:(id)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)setUuidToContextMap:(id)a3;
- (void)updateUuidContextMap;
@end

@implementation FMCoreTelephonyController

- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(FMCoreTelephonyController *)self fmModel];
  v11 = [(FMCoreTelephonyController *)self CTXPCServiceSubscriptionContextToFMSubscriptionContext:v8];
  switch(a4)
  {
    case 0:
      if (v8 && v10)
      {
        v12 = [v8 uuid];
        v13 = [v9 legacyInfo];
        [v10 handleCellMonitorUpdate:v12 info:v13];
        goto LABEL_8;
      }
      break;
    case 1:
      if (v8 && v10)
      {
        v12 = [v8 uuid];
        v13 = [v9 bars];
        [v10 handleSignalStrengthChanged:v12 bars:v13];
LABEL_8:

        goto LABEL_24;
      }
      break;
    case 2:
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_1001429C0();
      }
      [(FMCoreTelephonyController *)self updateUuidContextMap];
      if (v10) {
        goto LABEL_23;
      }
      break;
    case 3:
      if (v8) {
        [(FMCoreTelephonyController *)self setDataContext:v11];
      }
      break;
    case 6:
      if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
        sub_10014298C();
      }
      [(FMCoreTelephonyController *)self updateUuidContextMap];
      if (v10)
      {
LABEL_23:
        v12 = [(FMCoreTelephonyController *)self getSubscriptionContextsInUse];
        [v10 populateSubscriptionContextsInUse:v12];
        goto LABEL_24;
      }
      break;
    case 7:
      -[FMCoreTelephonyController setAirplaneModeActive:](self, "setAirplaneModeActive:", [v9 BOOLValue]);
      if (v10) {
        objc_msgSend(v10, "handleAirplaneModeActiveChanged:", objc_msgSend(v9, "BOOLValue"));
      }
      break;
    case 8:
      if (v8 && v10)
      {
        v12 = [v8 uuid];
        [v10 handleRegistrationStatusChanged:v12 registrationStatus:v9];
LABEL_24:
      }
      break;
    default:
      break;
  }
}

- (FMModel)fmModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fmModel);

  return (FMModel *)WeakRetained;
}

- (id)CTXPCServiceSubscriptionContextToFMSubscriptionContext:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(FMCoreTelephonyController *)self ctRelay];
    id v19 = 0;
    v6 = [v5 getHomeCarrierMCC:v4 error:&v19];
    id v7 = v19;

    id v8 = [(FMCoreTelephonyController *)self ctRelay];
    id v18 = v7;
    id v9 = [v8 getHomeCarrierMNC:v4 error:&v18];
    id v10 = v18;

    v11 = +[NSString stringWithFormat:@"%@.%@", v6, v9];
    if (v10 || !v6 || !v9 || ![v6 length] || !objc_msgSend(v9, "length"))
    {
      v12 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v21 = v4;
        __int16 v22 = 2112;
        id v23 = v10;
        __int16 v24 = 2112;
        v25 = v6;
        __int16 v26 = 2112;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FederatedMobility[FMCoreTelephonyController]:#I Failed to fetch home PLMN for context %@: %@ (mcc %@, mnc %@)", buf, 0x2Au);
      }

      v11 = 0;
    }
    v13 = [FMSubscriptionContext alloc];
    v14 = [v4 uuid];
    v15 = -[FMCoreTelephonyController CTSubscriptionSlotToSubscriptionID:](self, "CTSubscriptionSlotToSubscriptionID:", [v4 slotID]);
    id v16 = [(FMSubscriptionContext *)v13 init:v14 subscriptionID:v15 plmn:v11];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)CTSubscriptionSlotToSubscriptionID:(int64_t)a3
{
  if (a3 == 2) {
    return &off_1001C38B0;
  }
  if (a3) {
    return &off_1001C3880;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR)) {
    sub_1001429F4();
  }
  return &off_1001C3898;
}

+ (id)cellInfoToFMServingCell:(id)a3 atTime:(id)a4 inSlot:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorCellRadioAccessTechnology expectedClass:objc_opt_class() error:a6];
  if (*a6)
  {
    id v13 = 0;
  }
  else
  {
    v14 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorCellId expectedClass:objc_opt_class() error:a6];
    if (*a6)
    {
      id v13 = 0;
    }
    else
    {
      v15 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorMNC expectedClass:objc_opt_class() error:a6];
      if (*a6)
      {
        id v13 = 0;
      }
      else
      {
        uint64_t v16 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorMCC expectedClass:objc_opt_class() error:a6];
        v17 = (void *)v16;
        if (*a6)
        {
          id v13 = 0;
        }
        else
        {
          v32 = (void *)v16;
          id v18 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorBandInfo expectedClass:objc_opt_class() error:a6];
          if (*a6)
          {
            id v13 = 0;
            v17 = v32;
          }
          else
          {
            id v31 = v18;
            v17 = v32;
            id v19 = +[WISTelephonyUtils getLacOrTacFromCellInfo:v9 error:a6];
            if (*a6)
            {
              id v13 = 0;
            }
            else
            {
              id v28 = v19;
              v30 = +[WISTelephonyUtils getArfcnFromCellInfo:v9 error:a6];
              if (*a6)
              {

                *a6 = 0;
                v30 = &off_1001C3868;
              }
              v20 = +[WISTelephonyUtils getBandwidthFromCellInfo:v9 error:a6];
              id v21 = v20;
              if (*a6
                || (v29 = v20, v22 = [v20 isEqualToNumber:&off_1001C3880], id v21 = v29, v22))
              {

                v29 = 0;
                *a6 = 0;
              }
              id v23 = +[WISTelephonyUtils getPciFromCellInfo:v9 error:a6];
              if (*a6)
              {

                v27 = 0;
                *a6 = 0;
              }
              else
              {
                v27 = v23;
              }
              __int16 v24 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorDeploymentType expectedClass:objc_opt_class() error:a6];
              v25 = v24;
              if (*a6)
              {

                v25 = 0;
                *a6 = 0;
              }
              id v13 = [[FMServingCell alloc] init:v10 subscriptionID:v11 radioAccessTechnology:v12 cellID:v14 mnc:v15 mcc:v32 bandInfo:v31 tacOrLac:v28 arfcnOrUarfcn:v30 bandwidth:v29 pci:v27 deploymentType:v25];

              id v19 = v28;
            }

            id v18 = v31;
          }
        }
      }
    }
  }

  return v13;
}

+ (id)cellInfoToFMCongestionCell:(id)a3 atTime:(id)a4 inSlot:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorMNC expectedClass:objc_opt_class() error:a6];
  if (*a6)
  {
    id v13 = 0;
  }
  else
  {
    v14 = +[WISTelephonyUtils extractCellInfoValue:v9 key:kCTCellMonitorMCC expectedClass:objc_opt_class() error:a6];
    if (*a6)
    {
      id v13 = 0;
    }
    else
    {
      v15 = +[WISTelephonyUtils getGciFromCellInfo:v9 error:a6];
      if (*a6)
      {
        id v13 = 0;
      }
      else
      {
        uint64_t v16 = +[WISTelephonyUtils getRATFromCellInfo:v9 error:a6];
        if (*a6)
        {
          id v13 = 0;
        }
        else
        {
          v17 = +[WISTelephonyUtils getArfcnFromCellInfo:v9 error:a6];
          id v18 = v17;
          if (*a6)
          {

            id v18 = 0;
            *a6 = 0;
          }
          id v13 = [[FMCongestionCell alloc] init:v10 subscriptionID:v11 mcc:v14 mnc:v12 gci:v15 rat:v16 arfcnOrUarfcn:v18];
        }
      }
    }
  }

  return v13;
}

- (FMCoreTelephonyController)initWithFMModel:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FMCoreTelephonyController;
  v5 = [(FMCoreTelephonyController *)&v18 init];
  v6 = v5;
  if (!v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
      sub_100142798();
    }
    goto LABEL_11;
  }
  [(FMCoreTelephonyController *)v5 setFmModel:v4];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [(FMCoreTelephonyController *)v6 setUuidToContextMap:v7];

  [(FMCoreTelephonyController *)v6 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.CoreTelephonyController", 0)];
  if (![(FMCoreTelephonyController *)v6 queue])
  {
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  id v8 = +[TelephonyStateRelay sharedInstance];
  [(FMCoreTelephonyController *)v6 setCtRelay:v8];

  id v9 = [(FMCoreTelephonyController *)v6 ctRelay];
  id v10 = [v9 coreTelephonyClient];

  if (!v10)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001427CC();
    }
    goto LABEL_11;
  }
  objc_initWeak(&location, v6);
  id v11 = [v4 _initSyncGroup];
  v12 = [(FMCoreTelephonyController *)v6 queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000449B8;
  v15[3] = &unk_1001B6880;
  objc_copyWeak(&v16, &location);
  dispatch_group_async(v11, v12, v15);
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_10014280C();
  }
  id v13 = v6;
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_12:

  return v13;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100142840();
  }
  if ([(FMCoreTelephonyController *)self queue]) {
    dispatch_release((dispatch_object_t)[(FMCoreTelephonyController *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FMCoreTelephonyController;
  [(FMCoreTelephonyController *)&v3 dealloc];
}

- (void)removeAsDelegate
{
  id v3 = [(FMCoreTelephonyController *)self ctRelay];
  [v3 removeTelephonyStateDelegate:self];
}

- (BOOL)isDataContextUuid:(id)a3
{
  id v4 = a3;
  v5 = [(FMCoreTelephonyController *)self dataContext];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 uuid];
    unsigned __int8 v8 = [v7 isEqual:v4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)getSubscriptionContextsInUse
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(FMCoreTelephonyController *)self uuidToContextMap];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100044EAC;
  v12 = &unk_1001B68A8;
  id v13 = self;
  id v5 = v3;
  id v14 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  v6 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100142874(buf, (uint64_t)objc_msgSend(v5, "count", v9, v10, v11, v12, v13), v6);
  }
  id v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12, v13);

  return v7;
}

- (id)getRegistrationStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(FMCoreTelephonyController *)self uuidToContextMap];
    v6 = [v5 objectForKey:v4];

    if (v6)
    {
      id v7 = [(FMCoreTelephonyController *)self ctRelay];
      unsigned __int8 v8 = [v7 coreTelephonyClient];
      id v16 = 0;
      id v9 = [v8 copyRegistrationStatus:v6 error:&v16];
      id v10 = v16;

      if (v10)
      {
        id v11 = *(NSObject **)(qword_1001D8080 + 136);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = [v10 localizedDescription];
          sub_100142934(v12, buf, v11);
        }
        id v13 = 0;
      }
      else
      {
        id v13 = v9;
      }
    }
    else
    {
      id v14 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_1001428BC((uint64_t)v4, v14);
      }
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)updateUuidContextMap
{
  id v3 = [(FMCoreTelephonyController *)self ctRelay];
  id v4 = [v3 coreTelephonyClient];
  id v24 = 0;
  id v19 = [v4 getSubscriptionInfoWithError:&v24];
  id v5 = v24;

  if (v5)
  {
    v6 = *(NSObject **)(qword_1001D8080 + 136);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v5 localizedDescription];
      sub_100142AB0(v7, buf, v6);
    }
  }
  else
  {
    unsigned __int8 v8 = [(FMCoreTelephonyController *)self uuidToContextMap];
    [v8 removeAllObjects];

    id v9 = [v19 subscriptionsInUse];
    id v10 = +[WISTelephonyUtils sanitizedSubscriptions:v9];

    if (v10)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v10;
      id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v21;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v21 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
            id v16 = [(FMCoreTelephonyController *)self uuidToContextMap];
            v17 = [v15 uuid];
            [v16 setObject:v15 forKey:v17];
          }
          id v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v12);
      }

      objc_super v18 = *(NSObject **)(qword_1001D8080 + 136);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100142A68(buf, (uint64_t)[v11 count], v18);
      }
    }
    else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG))
    {
      sub_100142A34();
    }
  }
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (TelephonyStateRelay)ctRelay
{
  return (TelephonyStateRelay *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCtRelay:(id)a3
{
}

- (void)setFmModel:(id)a3
{
}

- (FMSubscriptionContext)dataContext
{
  return (FMSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDataContext:(id)a3
{
}

- (BOOL)airplaneModeActive
{
  return self->_airplaneModeActive;
}

- (void)setAirplaneModeActive:(BOOL)a3
{
  self->_airplaneModeActive = a3;
}

- (NSMutableDictionary)uuidToContextMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUuidToContextMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidToContextMap, 0);
  objc_storeStrong((id *)&self->_dataContext, 0);
  objc_destroyWeak((id *)&self->_fmModel);

  objc_storeStrong((id *)&self->_ctRelay, 0);
}

@end