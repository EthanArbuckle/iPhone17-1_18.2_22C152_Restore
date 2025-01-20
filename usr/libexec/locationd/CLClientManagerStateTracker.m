@interface CLClientManagerStateTracker
+ (const)trackerStateTypeName;
+ (unint64_t)trackerStateSize;
- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5;
- (BOOL)locationRestricted;
- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4;
- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4;
- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5;
- (int)locationServicesEnabledStatus;
- (void)dealloc;
- (void)identifier;
- (void)setLocationRestricted:(BOOL)a3;
- (void)setLocationServicesEnabledStatus:(int)a3;
- (void)updateState:(id)a3;
@end

@implementation CLClientManagerStateTracker

- (int)locationServicesEnabledStatus
{
  return self->_state.locationServicesEnabledStatus;
}

- (BOOL)locationRestricted
{
  return self->_state.locationRestricted;
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4
{
  return [(CLClientManagerStateTracker *)self initInSilo:a3 withIdentifier:a4 state:0];
}

- (id)initInSilo:(id)a3 withIdentifier:(void *)a4 state:(id)a5
{
  [a3 assertInside];
  id v9 = [a3 queue];

  return [(CLClientManagerStateTracker *)self initWithQueue:v9 identifier:a4 state:a5];
}

- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4
{
  return [(CLClientManagerStateTracker *)self initWithQueue:a3 identifier:a4 state:0];
}

- (CLClientManagerStateTracker)initWithQueue:(id)a3 identifier:(void *)a4 state:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CLClientManagerStateTracker;
  v7 = [(CLClientManagerStateTracker *)&v14 initWithQueue:a3];
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
    sub_101A6D014();
  }
  else
  {
    v7->_inTransaction = 1;
    (*((void (**)(id, CLClientManagerStateTracker *))a5 + 2))(a5, v7);
    v8->_inTransaction = 0;
    if (qword_102419530 == -1) {
      goto LABEL_5;
    }
  }
  dispatch_once(&qword_102419530, &stru_1022C9768);
LABEL_5:
  id v9 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(CLClientManagerStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2082;
    v20 = "state_transition";
    __int16 v21 = 2082;
    v22 = "ClientManager";
    __int16 v23 = 2050;
    id v24 = v10;
    __int16 v25 = 2082;
    v26 = "init";
    __int16 v27 = 1040;
    *(_DWORD *)v28 = 8;
    *(_WORD *)&v28[4] = 2098;
    *(void *)&v28[6] = &v8->_state;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"new\":%{public, location:_CLClientManagerStateTrackerState}.*P}", buf, 0x4Au);
LABEL_7:
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022C9768);
    }
  }
  v11 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(CLClientManagerStateTracker *)v8 identifier];
    *(_DWORD *)buf = 68290562;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2082;
    v20 = "state_transition";
    __int16 v21 = 2082;
    v22 = "ClientManager";
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
    dispatch_once(&qword_102419530, &stru_1022C9768);
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
    id v12 = "ClientManager";
    __int16 v13 = 2050;
    objc_super v14 = [(CLClientManagerStateTracker *)self identifier];
    __int16 v15 = 2082;
    int v16 = "lifecycle";
    __int16 v17 = 2050;
    v18 = self;
    __int16 v19 = 2050;
    uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":\"%{public}p\", \"new\":\"%{public}p\"}", buf, 0x4Eu);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLClientManagerStateTracker;
  [(CLClientManagerStateTracker *)&v4 dealloc];
}

- (void)setLocationServicesEnabledStatus:(int)a3
{
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022C9768);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLClientManagerStateTracker *)self identifier];
      int locationServicesEnabledStatus = self->_state.locationServicesEnabledStatus;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2082;
      id v12 = "state_transition";
      __int16 v13 = 2082;
      objc_super v14 = "ClientManager";
      __int16 v15 = 2050;
      int v16 = v6;
      __int16 v17 = 2082;
      v18 = "locationServicesEnabledStatus";
      __int16 v19 = 1026;
      int v20 = locationServicesEnabledStatus;
      __int16 v21 = 1026;
      int v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}d, \"new\":%{public}d}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.int locationServicesEnabledStatus = a3;
}

- (void)setLocationRestricted:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_inTransaction)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022C9768);
    }
    v5 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(CLClientManagerStateTracker *)self identifier];
      BOOL locationRestricted = self->_state.locationRestricted;
      v8[0] = 68290562;
      v8[1] = 0;
      __int16 v9 = 2082;
      id v10 = "";
      __int16 v11 = 2082;
      id v12 = "state_transition";
      __int16 v13 = 2082;
      objc_super v14 = "ClientManager";
      __int16 v15 = 2050;
      int v16 = v6;
      __int16 v17 = 2082;
      v18 = "locationRestricted";
      __int16 v19 = 1026;
      BOOL v20 = locationRestricted;
      __int16 v21 = 1026;
      BOOL v22 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public}hhd, \"new\":%{public}hhd}", (uint8_t *)v8, 0x46u);
    }
  }
  self->_state.BOOL locationRestricted = v3;
}

- (void)updateState:(id)a3
{
  p__CLClientManagerStateTrackerState state = &self->_state;
  _CLClientManagerStateTrackerState state = self->_state;
  if (self->_inTransaction)
  {
    sub_101A6D17C();
  }
  else
  {
    BOOL v3 = self;
    self->_inTransaction = 1;
    (*((void (**)(id, CLClientManagerStateTracker *))a3 + 2))(a3, self);
    v3->_inTransaction = 0;
    if (qword_102419530 == -1) {
      goto LABEL_3;
    }
  }
  dispatch_once(&qword_102419530, &stru_1022C9768);
LABEL_3:
  v5 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68291074;
    int v8 = 0;
    __int16 v9 = 2082;
    id v10 = "";
    __int16 v11 = 2082;
    id v12 = "state_transition";
    __int16 v13 = 2082;
    objc_super v14 = "ClientManager";
    __int16 v15 = 2050;
    id v16 = [(CLClientManagerStateTracker *)v3 identifier];
    __int16 v17 = 2082;
    v18 = "allStates";
    __int16 v19 = 1040;
    int v20 = 8;
    __int16 v21 = 2098;
    BOOL v22 = &state;
    __int16 v23 = 1040;
    int v24 = 8;
    __int16 v25 = 2098;
    v26 = p_state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"state transition\", \"event\":%{public, location:escape_only}s, \"state\":%{public, location:escape_only}s, \"id\":\"%{public}p\", \"property\":%{public, location:escape_only}s, \"old\":%{public, location:_CLClientManagerStateTrackerState}.*P, \"new\":%{public, location:_CLClientManagerStateTrackerState}.*P}", buf, 0x5Au);
  }
}

- (BOOL)dumpState:(void *)a3 withSize:(unint64_t)a4 hints:(os_state_hints_s *)a5
{
  if (a4 <= 7)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_1022C9768);
    }
    int v6 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_FAULT))
    {
      int v9 = 68289538;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      __int16 v13 = 2050;
      uint64_t v14 = 8;
      __int16 v15 = 2050;
      unint64_t v16 = a4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v9, 0x26u);
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_1022C9768);
      }
    }
    __int16 v7 = qword_102419538;
    if (os_signpost_enabled((os_log_t)qword_102419538))
    {
      int v9 = 68289538;
      int v10 = 0;
      __int16 v11 = 2082;
      id v12 = "";
      __int16 v13 = 2050;
      uint64_t v14 = 8;
      __int16 v15 = 2050;
      unint64_t v16 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "state dump failure", "{\"msg%{public}.0s\":\"state dump failure\", \"expected_size\":%{public}lld, \"provided_size\":%{public}lld}", (uint8_t *)&v9, 0x26u);
    }
  }
  else
  {
    *(_CLClientManagerStateTrackerState *)a3 = self->_state;
  }
  return a4 > 7;
}

+ (unint64_t)trackerStateSize
{
  return 8;
}

+ (const)trackerStateTypeName
{
  return "_CLClientManagerStateTrackerState";
}

- (void)identifier
{
  return self->_identifier;
}

@end