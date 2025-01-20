@interface SMSessionStateSyncMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (SMSessionManagerState)sessionManagerState;
- (SMSessionStateSyncMessage)initWithCoder:(id)a3;
- (SMSessionStateSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionManagerState:(id)a5 stateTransitionType:(unint64_t)a6;
- (SMSessionStateSyncMessage)initWithDictionary:(id)a3;
- (SMSessionStateSyncMessage)initWithSessionManagerState:(id)a3 stateTransitionType:(unint64_t)a4;
- (id)outputToDictionary;
- (unint64_t)stateTransitionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionStateSyncMessage

- (SMSessionStateSyncMessage)initWithSessionManagerState:(id)a3 stateTransitionType:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [MEMORY[0x263F08C38] UUID];
  v9 = [(SMSessionStateSyncMessage *)self initWithDate:v7 messageID:v8 sessionManagerState:v6 stateTransitionType:a4];

  return v9;
}

- (SMSessionStateSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionManagerState:(id)a5 stateTransitionType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v11)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v12)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: sessionManagerState";
    goto LABEL_16;
  }
  if (![v12 sessionState])
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: sessionManagerState.sessionState";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  v14 = [v13 configuration];
  v15 = [v14 sessionID];
  v21.receiver = self;
  v21.super_class = (Class)SMSessionStateSyncMessage;
  v16 = [(SMMessage *)&v21 initWithDate:v10 messageID:v11 sessionID:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_sessionManagerState, a5);
    v16->_stateTransitionType = a6;
  }
  self = v16;
  v17 = self;
LABEL_18:

  return v17;
}

- (SMSessionStateSyncMessage)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v44) = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v44, 2u);
    }
    goto LABEL_14;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v28 = 0;
      goto LABEL_15;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = NSStringFromSelector(a2);
    int v44 = 138413058;
    v45 = v23;
    __int16 v46 = 2112;
    v47 = v24;
    __int16 v48 = 1024;
    int v49 = [(id)objc_opt_class() messageType];
    __int16 v50 = 1024;
    int v51 = v8;
    v25 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v26 = v12;
    uint32_t v27 = 34;
LABEL_33:
    _os_log_error_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v44, v27);

    goto LABEL_14;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v31 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v31);
    v24 = NSStringFromSelector(a2);
    int v44 = 138412802;
    v45 = v23;
    __int16 v46 = 2112;
    v47 = v24;
    __int16 v48 = 1024;
    int v49 = v10;
    v25 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v26 = v12;
    uint32_t v27 = 28;
    goto LABEL_33;
  }
  id v11 = [v6 valueForKey:@"sendDate"];
  id v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    v16 = [v6 valueForKey:@"messageID"];
    v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      v18 = [[SMSessionManagerState alloc] initWithDictionary:v6];
      if (v18)
      {
        v19 = [v6 valueForKey:@"stateTransitionType"];
        v20 = v19;
        if (v19)
        {
          uint64_t v21 = (int)[v19 intValue];
        }
        else
        {
          v30 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v41 = (objc_class *)objc_opt_class();
            v42 = NSStringFromClass(v41);
            v43 = NSStringFromSelector(a2);
            int v44 = 138412546;
            v45 = v42;
            __int16 v46 = 2112;
            v47 = v43;
            _os_log_error_impl(&dword_25B6E0000, v30, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing stateTransitionType", (uint8_t *)&v44, 0x16u);
          }
          uint64_t v21 = 0;
        }
        self = [(SMSessionStateSyncMessage *)self initWithDate:v14 messageID:v17 sessionManagerState:v18 stateTransitionType:v21];
        v28 = self;
      }
      else
      {
        v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          v40 = NSStringFromSelector(a2);
          int v44 = 138412546;
          v45 = v39;
          __int16 v46 = 2112;
          v47 = v40;
          _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache, %@, %@, sessionManagerState is nil", (uint8_t *)&v44, 0x16u);
        }
        v28 = 0;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      v18 = (SMSessionManagerState *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v18->super, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        v37 = NSStringFromSelector(a2);
        int v44 = 138412546;
        v45 = v36;
        __int16 v46 = 2112;
        v47 = v37;
        _os_log_error_impl(&dword_25B6E0000, &v18->super, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v44, 0x16u);
      }
      v28 = 0;
    }
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      v34 = NSStringFromSelector(a2);
      int v44 = 138412546;
      v45 = v33;
      __int16 v46 = 2112;
      v47 = v34;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v44, 0x16u);
    }
    v28 = 0;
  }

LABEL_15:
  return v28;
}

- (id)outputToDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)SMSessionStateSyncMessage;
  v3 = [(SMMessage *)&v8 outputToDictionary];
  v4 = [(SMSessionStateSyncMessage *)self sessionManagerState];
  id v5 = [v4 outputToDictionary];
  [v3 addEntriesFromDictionary:v5];

  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionStateSyncMessage stateTransitionType](self, "stateTransitionType"));
  [v3 setObject:v6 forKey:@"stateTransitionType"];

  return v3;
}

+ (unint64_t)messageType
{
  return 7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v10 = "-[SMSessionStateSyncMessage encodeWithCoder:]";
      __int16 v11 = 1024;
      int v12 = 132;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SMSessionStateSyncMessage;
  [(SMMessage *)&v8 encodeWithCoder:v4];
  id v6 = [(SMSessionStateSyncMessage *)self sessionManagerState];
  [v4 encodeObject:v6 forKey:@"sessionState"];

  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SMSessionStateSyncMessage stateTransitionType](self, "stateTransitionType"));
  [v4 encodeObject:v7 forKey:@"stateTransitionType"];
}

- (SMSessionStateSyncMessage)initWithCoder:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v39) = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v39, 2u);
    }
    goto LABEL_14;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v23 = 0;
      goto LABEL_15;
    }
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = NSStringFromSelector(a2);
    int v39 = 138413058;
    v40 = v17;
    __int16 v41 = 2112;
    v42 = v18;
    __int16 v43 = 1024;
    int v44 = [(id)objc_opt_class() messageType];
    __int16 v45 = 1024;
    int v46 = v7;
    v19 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v20 = v9;
    uint32_t v21 = 34;
LABEL_33:
    _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v39, v21);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 != 1)
  {
    int v22 = v8;
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v26 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v26);
    v18 = NSStringFromSelector(a2);
    int v39 = 138412802;
    v40 = v17;
    __int16 v41 = 2112;
    v42 = v18;
    __int16 v43 = 1024;
    int v44 = v22;
    v19 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v20 = v9;
    uint32_t v21 = 28;
    goto LABEL_33;
  }
  v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
  if (v9)
  {
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (v10)
    {
      __int16 v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        int v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionState"];
        uint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"stateTransitionType"];
        v14 = v13;
        if (v13)
        {
          uint64_t v15 = (int)[v13 intValue];
        }
        else
        {
          v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v36 = (objc_class *)objc_opt_class();
            v37 = NSStringFromClass(v36);
            v38 = NSStringFromSelector(a2);
            int v39 = 138412546;
            v40 = v37;
            __int16 v41 = 2112;
            v42 = v38;
            _os_log_error_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing stateTransitionType", (uint8_t *)&v39, 0x16u);
          }
          uint64_t v15 = 0;
        }
        self = [(SMSessionStateSyncMessage *)self initWithDate:v10 messageID:v9 sessionManagerState:v12 stateTransitionType:v15];

        v23 = self;
      }
      else
      {
        int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          v35 = NSStringFromSelector(a2);
          int v39 = 138412546;
          v40 = v34;
          __int16 v41 = 2112;
          v42 = v35;
          _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v39, 0x16u);
        }
        v23 = 0;
      }
    }
    else
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = NSStringFromSelector(a2);
        int v39 = 138412546;
        v40 = v31;
        __int16 v41 = 2112;
        v42 = v32;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v39, 0x16u);
      }
      v23 = 0;
    }
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint32_t v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      v29 = NSStringFromSelector(a2);
      int v39 = 138412546;
      v40 = v28;
      __int16 v41 = 2112;
      v42 = v29;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v39, 0x16u);
    }
    v23 = 0;
  }

LABEL_15:
  return v23;
}

- (SMSessionManagerState)sessionManagerState
{
  return self->_sessionManagerState;
}

- (unint64_t)stateTransitionType
{
  return self->_stateTransitionType;
}

- (void).cxx_destruct
{
}

@end