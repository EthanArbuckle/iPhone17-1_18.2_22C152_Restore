@interface WISRatDataUsageMetric
+ (id)getSharedInstance;
- (RatDataUsageState)state;
- (TelephonyStateRelay)ctRelay;
- (WISRatDataUsageMetric)init;
- (dispatch_queue_s)queue;
- (nw_path_monitor)networkPathMonitor;
- (void)cellularRadioTechChangedForContext:(id)a3 To:(id)a4;
- (void)currentDataContextChangedTo:(id)a3;
- (void)dealloc;
- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5;
- (void)interfaceCostExpensiveChangedForContext:(id)a3 To:(BOOL)a4;
- (void)lowDataModeChangedForContext:(id)a3 To:(BOOL)a4;
- (void)networkPathMonitorUpdate:(nw_path *)a3;
- (void)populateActiveDataContextInfo;
- (void)populateInfoForContext:(id)a3;
- (void)registrationStatusChangedForContext:(id)a3 To:(id)a4;
- (void)satelliteRegistrationStatusChangedForContext:(id)a3 To:(BOOL)a4;
- (void)setCtRelay:(id)a3;
- (void)setNetworkPathMonitor:(nw_path_monitor *)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
- (void)setState:(id)a3;
- (void)stewieStateChangedTo:(id)a3;
- (void)subscriptionInfoDidChange;
@end

@implementation WISRatDataUsageMetric

- (void)handleUpdate:(id)a3 forKey:(int)a4 withState:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  v9 = v8;
  switch(a4)
  {
    case 3:
      if (v10) {
        [(WISRatDataUsageMetric *)self currentDataContextChangedTo:v10];
      }
      break;
    case 6:
      [(WISRatDataUsageMetric *)self subscriptionInfoDidChange];
      break;
    case 8:
      if (v10 && v8) {
        [(WISRatDataUsageMetric *)self registrationStatusChangedForContext:v10 To:v8];
      }
      break;
    case 9:
      if (v10 && v8) {
        [(WISRatDataUsageMetric *)self cellularRadioTechChangedForContext:v10 To:v8];
      }
      break;
    case 10:
      if (v10 && v8) {
        -[WISRatDataUsageMetric lowDataModeChangedForContext:To:](self, "lowDataModeChangedForContext:To:", v10, [v8 BOOLValue]);
      }
      break;
    case 11:
      if (v10 && v8) {
        -[WISRatDataUsageMetric interfaceCostExpensiveChangedForContext:To:](self, "interfaceCostExpensiveChangedForContext:To:", v10, [v8 BOOLValue]);
      }
      break;
    case 12:
      if (v8) {
        [(WISRatDataUsageMetric *)self stewieStateChangedTo:v8];
      }
      break;
    case 13:
      if (v10 && v8) {
        -[WISRatDataUsageMetric satelliteRegistrationStatusChangedForContext:To:](self, "satelliteRegistrationStatusChangedForContext:To:", v10, [v8 BOOLValue]);
      }
      break;
    default:
      break;
  }
}

+ (id)getSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025C7C;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7C28 != -1) {
    dispatch_once(&qword_1001D7C28, block);
  }
  v2 = (void *)qword_1001D7C20;

  return v2;
}

- (WISRatDataUsageMetric)init
{
  v14.receiver = self;
  v14.super_class = (Class)WISRatDataUsageMetric;
  v2 = [(WISRatDataUsageMetric *)&v14 init];
  if (v2
    && ([(WISRatDataUsageMetric *)v2 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.RatDataUsageMetric", 0)], [(WISRatDataUsageMetric *)v2 queue]))
  {
    v3 = +[TelephonyStateRelay sharedInstance];
    [(WISRatDataUsageMetric *)v2 setCtRelay:v3];

    [(WISRatDataUsageMetric *)v2 setNetworkPathMonitor:nw_path_monitor_create()];
    v4 = [(WISRatDataUsageMetric *)v2 networkPathMonitor];
    update_handler[0] = _NSConcreteStackBlock;
    update_handler[1] = 3221225472;
    update_handler[2] = sub_100025ECC;
    update_handler[3] = &unk_1001B5F00;
    v5 = v2;
    v13 = v5;
    nw_path_monitor_set_update_handler(v4, update_handler);
    nw_path_monitor_set_queue((nw_path_monitor_t)[(WISRatDataUsageMetric *)v5 networkPathMonitor], (dispatch_queue_t)[(WISRatDataUsageMetric *)v5 queue]);
    v6 = [(WISRatDataUsageMetric *)v5 queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100025ED8;
    v10[3] = &unk_1001B5F28;
    v7 = v5;
    v11 = v7;
    dispatch_async(v6, v10);
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  if ([(WISRatDataUsageMetric *)self networkPathMonitor])
  {
    nw_path_monitor_cancel((nw_path_monitor_t)[(WISRatDataUsageMetric *)self networkPathMonitor]);
    nw_release([(WISRatDataUsageMetric *)self networkPathMonitor]);
  }
  if ([(WISRatDataUsageMetric *)self queue]) {
    dispatch_release((dispatch_object_t)[(WISRatDataUsageMetric *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)WISRatDataUsageMetric;
  [(WISRatDataUsageMetric *)&v3 dealloc];
}

- (void)populateActiveDataContextInfo
{
  objc_super v3 = [(WISRatDataUsageMetric *)self ctRelay];
  v4 = [v3 coreTelephonyClient];
  id v7 = 0;
  v5 = [v4 getCurrentDataSubscriptionContextSync:&v7];
  id v6 = v7;

  if (v6 || !v5)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001410C0();
    }
  }
  else
  {
    [(WISRatDataUsageMetric *)self populateInfoForContext:v5];
  }
}

- (void)populateInfoForContext:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v4 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_100141214();
  }
  v5 = [(WISRatDataUsageMetric *)self ctRelay];
  id v25 = 0;
  id v6 = [v5 copyCTRegistrationStatus:v4 error:&v25];
  id v7 = v25;

  if (v7 || !v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1001411D0();
    }
    [(WISRatDataUsageMetric *)self setState:0];
  }
  else
  {
    id v8 = [(WISRatDataUsageMetric *)self ctRelay];
    id v24 = 0;
    id v9 = [v8 getLowDataMode:v4 error:&v24];
    id v7 = v24;

    if (v7)
    {
      if ([v7 code] != (id)45)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v7 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_10014118C();
        }
        [(WISRatDataUsageMetric *)self setState:0];
        goto LABEL_27;
      }

      id v9 = 0;
    }
    id v10 = [(WISRatDataUsageMetric *)self ctRelay];
    id v23 = 0;
    uint64_t v11 = (uint64_t)[v10 getInterfaceCostExpensive:v4 error:&v23];
    id v7 = v23;

    if (!v7) {
      goto LABEL_11;
    }
    if ([v7 code] == (id)45)
    {

      uint64_t v11 = 1;
LABEL_11:
      v12 = [(WISRatDataUsageMetric *)self ctRelay];
      id v22 = 0;
      id v21 = [v12 copyCTRegistrationDisplayStatus:v4 error:&v22];
      id v7 = v22;

      if (v7 || !v21)
      {
        if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
        {
          [v7 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_100141104();
        }
        [(WISRatDataUsageMetric *)self setState:0];
      }
      else
      {
        id v13 = [v21 isSatelliteSystem];
        objc_super v14 = [(WISRatDataUsageMetric *)self ctRelay];
        v15 = [v14 getStewieState];
        id v16 = [v15 isStewieActive];

        v17 = [RatDataUsageState alloc];
        v18 = [v4 uuid];
        v19 = [(RatDataUsageState *)v17 initWithContext:v18 cellularRegistrationState:v6 isCellularLowDataModeEnabled:v9 isCellularInterfaceExpensive:v11 isSatelliteSystem:v13 isStewieActive:v16];
        [(WISRatDataUsageMetric *)self setState:v19];

        v20 = [(WISRatDataUsageMetric *)self ctRelay];
        [v20 getRadioAccessTechnology:v4 delegate:self];
      }
      goto LABEL_27;
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_100141148();
    }
    [(WISRatDataUsageMetric *)self setState:0];
  }
LABEL_27:
}

- (void)networkPathMonitorUpdate:(nw_path *)a3
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100141348();
  }
  v5 = [(WISRatDataUsageMetric *)self state];

  if (v5) {
    goto LABEL_7;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100141314();
  }
  [(WISRatDataUsageMetric *)self populateActiveDataContextInfo];
  id v6 = [(WISRatDataUsageMetric *)self state];

  if (v6)
  {
LABEL_7:
    id v7 = nw_path_copy_interface();
    id v8 = v7;
    if (v7)
    {
      uint64_t type = nw_interface_get_type(v7);
      nw_release(v8);
    }
    else
    {
      uint64_t type = 0;
    }
    uint64_t interface_index = nw_path_get_interface_index();
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    int v24 = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000268CC;
    v15[3] = &unk_1001B5F50;
    int v16 = type;
    v15[4] = &v17;
    v15[5] = &v21;
    v15[6] = &v25;
    nw_path_enumerate_interfaces((nw_path_t)a3, v15);
    if (v8) {
      uint64_t v11 = [[NetworkInterfaceInfo alloc] initWithIndex:interface_index type:type];
    }
    else {
      uint64_t v11 = 0;
    }
    if (*((unsigned char *)v26 + 24))
    {
      v12 = [NetworkInterfaceInfo alloc];
      id v13 = [(NetworkInterfaceInfo *)v12 initWithIndex:*((unsigned int *)v22 + 6) type:*((unsigned int *)v18 + 6)];
    }
    else
    {
      id v13 = 0;
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
      sub_100141290();
    }
    objc_super v14 = [(WISRatDataUsageMetric *)self state];
    [v14 updateNetworkPathsToPrimary:v11 secondary:v13];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    sub_10014125C();
  }
}

- (void)subscriptionInfoDidChange
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_1001413B4();
  }
  objc_super v3 = [(WISRatDataUsageMetric *)self state];
  [v3 submitToCA];

  [(WISRatDataUsageMetric *)self setState:0];
  [(WISRatDataUsageMetric *)self populateActiveDataContextInfo];
}

- (void)currentDataContextChangedTo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_1001413E8();
  }
  v5 = [(WISRatDataUsageMetric *)self state];
  [v5 submitToCA];

  [(WISRatDataUsageMetric *)self setState:0];
  [(WISRatDataUsageMetric *)self populateInfoForContext:v4];
}

- (void)registrationStatusChangedForContext:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(WISRatDataUsageMetric *)self state];
  id v10 = [v9 contextUUID];
  unsigned __int8 v11 = [v8 isEqual:v10];

  if (v11)
  {
    v12 = [(WISRatDataUsageMetric *)self state];
    [v12 updateRegistrationStateTo:v7];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_10014141C();
  }
}

- (void)cellularRadioTechChangedForContext:(id)a3 To:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 uuid];
  id v9 = [(WISRatDataUsageMetric *)self state];
  id v10 = [v9 contextUUID];
  unsigned __int8 v11 = [v8 isEqual:v10];

  if (v11)
  {
    v12 = [(WISRatDataUsageMetric *)self state];
    [v12 updateCellularRadioTechTo:v7];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_100141464();
  }
}

- (void)lowDataModeChangedForContext:(id)a3 To:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uuid];
  id v8 = [(WISRatDataUsageMetric *)self state];
  id v9 = [v8 contextUUID];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if (v10)
  {
    unsigned __int8 v11 = [(WISRatDataUsageMetric *)self state];
    [v11 updateIsLowDataModeEnabledTo:v4];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_1001414AC();
  }
}

- (void)interfaceCostExpensiveChangedForContext:(id)a3 To:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uuid];
  id v8 = [(WISRatDataUsageMetric *)self state];
  id v9 = [v8 contextUUID];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if (v10)
  {
    unsigned __int8 v11 = [(WISRatDataUsageMetric *)self state];
    [v11 updateIsCellularInterfaceExpensiveTo:v4];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_1001414F4();
  }
}

- (void)satelliteRegistrationStatusChangedForContext:(id)a3 To:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uuid];
  id v8 = [(WISRatDataUsageMetric *)self state];
  id v9 = [v8 contextUUID];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if (v10)
  {
    unsigned __int8 v11 = [(WISRatDataUsageMetric *)self state];
    [v11 updateIsSatelliteSystemTo:v4];
  }
  else if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG))
  {
    [v6 uuid];
    objc_claimAutoreleasedReturnValue();
    sub_10014153C();
  }
}

- (void)stewieStateChangedTo:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 48), OS_LOG_TYPE_DEBUG)) {
    sub_100141584();
  }
  v5 = [(WISRatDataUsageMetric *)self state];
  objc_msgSend(v5, "updateIsStewieActiveTo:", objc_msgSend(v4, "isStewieActive"));
}

- (TelephonyStateRelay)ctRelay
{
  return (TelephonyStateRelay *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCtRelay:(id)a3
{
}

- (nw_path_monitor)networkPathMonitor
{
  return self->_networkPathMonitor;
}

- (void)setNetworkPathMonitor:(nw_path_monitor *)a3
{
  self->_networkPathMonitor = a3;
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (RatDataUsageState)state
{
  return (RatDataUsageState *)objc_getProperty(self, a2, 32, 1);
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_ctRelay, 0);
}

@end