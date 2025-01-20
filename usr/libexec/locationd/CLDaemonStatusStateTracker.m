@interface CLDaemonStatusStateTracker
+ (const)trackerStateTypeName;
+ (unint64_t)trackerStateSize;
- (BOOL)airplaneMode;
- (BOOL)batterySaverModeEnabled;
- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5;
- (BOOL)restrictedMode;
- (Battery)batteryData;
- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4;
- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5;
- (id).cxx_construct;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5;
- (int)reachability;
- (int)thermalLevel;
- (int)thermalPressure;
- (void)dealloc;
- (void)identifier;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setBatteryData:(Battery *)a3;
- (void)setBatterySaverModeEnabled:(BOOL)a3;
- (void)setReachability:(int)a3;
- (void)setRestrictedMode:(BOOL)a3;
- (void)setThermalLevel:(int)a3;
- (void)setThermalPressure:(int)a3;
- (void)updateState:(id)a3;
@end

@implementation CLDaemonStatusStateTracker

- (BOOL)airplaneMode
{
  return self->_state.airplaneMode;
}

- (int)reachability
{
  return self->_state.reachability;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return [(CLDaemonStatusStateTracker *)self initInSilo:a3 withIdentifier:a4 state:0];
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  [a3 assertInside];
  id v9 = [a3 queue];

  return [(CLDaemonStatusStateTracker *)self initWithQueue:v9 identifier:a4 state:a5];
}

- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return [(CLDaemonStatusStateTracker *)self initWithQueue:a3 identifier:a4 state:0];
}

- (CLDaemonStatusStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CLDaemonStatusStateTracker;
  v7 = [(CLDaemonStatusStateTracker *)&v14 initWithQueue:a3];
  v8 = v7;
  if (!v7) {
    return v8;
  }
  v7->_identifier = a4;
  if (!a5) {
    goto LABEL_7;
  }
  if (v7->_inTransaction)
  {
    sub_101A67A18();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLDaemonStatusStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_102419530 == -1) {
      goto LABEL_5;
    }
  }
  dispatch_once(&qword_102419530, &stru_1022BE6F8);
LABEL_5:
  id v9 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CLDaemonStatusStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2082;
    v20 = "state_transition";
    __int16 v21 = 2082;
    v22 = "DaemonStatus";
    __int16 v23 = 2050;
    id v24 = v10;
    __int16 v25 = 2082;
    v26 = "init";
    __int16 v27 = 1040;
    *(_DWORD *)v28 = 40;
    *(_WORD *)&v28[4] = 2098;
    *(void *)&v28[6] = &v8->_state;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLDaemonStatusStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
  }
  v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(CLDaemonStatusStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2082;
    v20 = "state_transition";
    __int16 v21 = 2082;
    v22 = "DaemonStatus";
    __int16 v23 = 2050;
    id v24 = v12;
    __int16 v25 = 2082;
    v26 = "lifecycle";
    __int16 v27 = 2050;
    *(void *)v28 = 0;
    *(_WORD *)&v28[8] = 2050;
    *(void *)&v28[10] = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  return v8;
}

- (void)dealloc
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_1022BE6F8);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68290562;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2082;
    id v10 = "state_transition";
    __int16 v11 = 2082;
    id v12 = "DaemonStatus";
    __int16 v13 = 2050;
    objc_super v14 = [(CLDaemonStatusStateTracker *)self identifier];
    __int16 v15 = 2082;
    int v16 = "lifecycle";
    __int16 v17 = 2050;
    v18 = self;
    __int16 v19 = 2050;
    uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonStatusStateTracker;
  [(CLDaemonStatusStateTracker *)&v4 dealloc];
}

- (Battery)batteryData
{
  *retstr = *(Battery *)&self->wasConnected;
  return self;
}

- (void)setBatteryData:(Battery *)a3
{
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 68291074;
      v7[1] = 0;
      __int16 v8 = 2082;
      __int16 v9 = "";
      __int16 v10 = 2082;
      __int16 v11 = "state_transition";
      __int16 v12 = 2082;
      __int16 v13 = "DaemonStatus";
      __int16 v14 = 2050;
      __int16 v15 = [(CLDaemonStatusStateTracker *)self identifier];
      __int16 v16 = 2082;
      __int16 v17 = "batteryData";
      __int16 v18 = 1040;
      int v19 = 24;
      __int16 v20 = 2098;
      p_state = &self->_state;
      __int16 v22 = 1040;
      int v23 = 24;
      __int16 v24 = 2098;
      __int16 v25 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLDaemonStatus_Type::Battery}.*P, \"new\":%{public, location:CLDaemonStatus_Type::Battery}.*P}", (uint8_t *)v7, 0x5Au);
    }
  }
  uint64_t v6 = *(void *)&a3->wasConnected;
  *(_OWORD *)&self->_state.batteryData.level = *(_OWORD *)&a3->level;
  *(void *)&self->_state.batteryData.wasConnected = v6;
}

- (void)setReachability:(int)a3
{
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      uint64_t reachability = self->_state.reachability;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "reachability";
      __int16 v19 = 2050;
      uint64_t v20 = reachability;
      __int16 v21 = 2050;
      uint64_t v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:CLDaemonStatus_Type::Reachability}lld, \"new\":%{public, location:CLDaemonStatus_Type::Reachability}lld}", (uint8_t *)v8, 0x4Eu);
    }
  }
  self->_state.uint64_t reachability = a3;
}

- (int)thermalLevel
{
  return self->_state.thermalLevel;
}

- (void)setThermalLevel:(int)a3
{
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      int thermalLevel = self->_state.thermalLevel;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "thermalLevel";
      __int16 v19 = 1026;
      int v20 = thermalLevel;
      __int16 v21 = 1026;
      int v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}d, \"new\":%{public}d}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.int thermalLevel = a3;
}

- (int)thermalPressure
{
  return self->_state.thermalPressure;
}

- (void)setThermalPressure:(int)a3
{
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      int thermalPressure = self->_state.thermalPressure;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "thermalPressure";
      __int16 v19 = 1026;
      int v20 = thermalPressure;
      __int16 v21 = 1026;
      int v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}d, \"new\":%{public}d}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.int thermalPressure = a3;
}

- (void)setAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      BOOL airplaneMode = self->_state.airplaneMode;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "airplaneMode";
      __int16 v19 = 1026;
      BOOL v20 = airplaneMode;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL airplaneMode = v3;
}

- (BOOL)batterySaverModeEnabled
{
  return self->_state.batterySaverModeEnabled;
}

- (void)setBatterySaverModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      BOOL batterySaverModeEnabled = self->_state.batterySaverModeEnabled;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "batterySaverModeEnabled";
      __int16 v19 = 1026;
      BOOL v20 = batterySaverModeEnabled;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL batterySaverModeEnabled = v3;
}

- (BOOL)restrictedMode
{
  return self->_state.restrictedMode;
}

- (void)setRestrictedMode:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(CLDaemonStatusStateTracker *)self identifier];
      BOOL restrictedMode = self->_state.restrictedMode;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      __int16 v10 = "";
      __int16 v11 = 2082;
      __int16 v12 = "state_transition";
      __int16 v13 = 2082;
      __int16 v14 = "DaemonStatus";
      __int16 v15 = 2050;
      __int16 v16 = v6;
      __int16 v17 = 2082;
      __int16 v18 = "restrictedMode";
      __int16 v19 = 1026;
      BOOL v20 = restrictedMode;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL restrictedMode = v3;
}

- (void)updateState:(id)a3
{
  p_state = &self->_state;
  long long v5 = *(_OWORD *)&self->_state.batteryData.wasConnected;
  long long v7 = *(_OWORD *)&self->_state.batteryData.level;
  long long v8 = v5;
  uint64_t v9 = *(void *)&self->_state.thermalPressure;
  if (self->_inTransaction)
  {
    ((void (*)(CLDaemonStatusStateTracker *, SEL, id))sub_101A67B94)(self, a2, a3);
  }
  else
  {
    BOOL v3 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLDaemonStatusStateTracker *))a3 + 2))(a3, self);
    v3->_inTransaction = 0;
    if (qword_102419530 == -1) {
      goto LABEL_3;
    }
  }
  dispatch_once(&qword_102419530, &stru_1022BE6F8);
LABEL_3:
  uint64_t v6 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68291074;
    int v11 = 0;
    __int16 v12 = 2082;
    __int16 v13 = "";
    __int16 v14 = 2082;
    __int16 v15 = "state_transition";
    __int16 v16 = 2082;
    __int16 v17 = "DaemonStatus";
    __int16 v18 = 2050;
    id v19 = [(CLDaemonStatusStateTracker *)v3 identifier];
    __int16 v20 = 2082;
    __int16 v21 = "allStates";
    __int16 v22 = 1040;
    int v23 = 40;
    __int16 v24 = 2098;
    __int16 v25 = &v7;
    __int16 v26 = 1040;
    int v27 = 40;
    __int16 v28 = 2098;
    v29 = p_state;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLDaemonStatusStateTrackerState}.*P, \"new\":%{public, location:_CLDaemonStatusStateTrackerState}.*P}", buf, 0x5Au);
  }
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  if (a4 <= 0x27)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022BE6F8);
    }
    long long v8 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v11 = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2050;
      uint64_t v16 = 40;
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v11, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022BE6F8);
      }
    }
    uint64_t v9 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v11 = 68289538;
      int v12 = 0;
      __int16 v13 = 2082;
      __int16 v14 = "";
      __int16 v15 = 2050;
      uint64_t v16 = 40;
      __int16 v17 = 2050;
      unint64_t v18 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v11, 0x26u);
    }
  }
  else
  {
    uint64_t v6 = *(void *)&self->_state.thermalPressure;
    long long v7 = *(_OWORD *)&self->_state.batteryData.wasConnected;
    *(_OWORD *)a3 = *(_OWORD *)&self->_state.batteryData.level;
    *((_OWORD *)a3 + 1) = v7;
    *((void *)a3 + 4) = v6;
  }
  return a4 > 0x27;
}

+ (unint64_t)trackerStateSize
{
  return 40;
}

+ (const)trackerStateTypeName
{
  return "_CLDaemonStatusStateTrackerState";
}

- (void)identifier
{
  return self->_identifier;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0xBFF0000000000000;
  *((_WORD *)self + 12) = 0;
  *((_DWORD *)self + 7) = 0;
  *((unsigned char *)self + 32) = 0;
  *((_DWORD *)self + 9) = 0;
  return self;
}

@end