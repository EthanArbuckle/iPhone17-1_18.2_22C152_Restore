@interface SMLowPowerModeWarningStateUpdateMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (SMLowPowerModeWarningStateUpdateMessage)initWithCoder:(id)a3;
- (SMLowPowerModeWarningStateUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 lowPowerModeWarningState:(int64_t)a6;
- (SMLowPowerModeWarningStateUpdateMessage)initWithDictionary:(id)a3;
- (SMLowPowerModeWarningStateUpdateMessage)initWithSessionID:(id)a3 lowPowerModeWarningState:(int64_t)a4;
- (id)outputToDictionary;
- (int64_t)lowPowerModeWarningState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMLowPowerModeWarningStateUpdateMessage

- (SMLowPowerModeWarningStateUpdateMessage)initWithSessionID:(id)a3 lowPowerModeWarningState:(int64_t)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  v8 = [v6 now];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [(SMLowPowerModeWarningStateUpdateMessage *)self initWithDate:v8 messageID:v9 sessionID:v7 lowPowerModeWarningState:a4];

  return v10;
}

- (SMLowPowerModeWarningStateUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 lowPowerModeWarningState:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_14;
  }
  if (!v11)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v12)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v15 = 0;
    goto LABEL_15;
  }
  v19.receiver = self;
  v19.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  v14 = [(SMMessage *)&v19 initWithDate:v10 messageID:v11 sessionID:v12];
  if (v14) {
    v14->_lowPowerModeWarningState = a6;
  }
  self = v14;
  v15 = self;
LABEL_15:

  return v15;
}

- (SMLowPowerModeWarningStateUpdateMessage)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v46) = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v46, 2u);
    }
    goto LABEL_14;
  }
  id v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_14:
      v30 = 0;
      goto LABEL_15;
    }
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = NSStringFromSelector(a2);
    int v46 = 138413058;
    v47 = v25;
    __int16 v48 = 2112;
    v49 = v26;
    __int16 v50 = 1024;
    int v51 = [(id)objc_opt_class() messageType];
    __int16 v52 = 1024;
    int v53 = v8;
    v27 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v28 = v12;
    uint32_t v29 = 34;
LABEL_33:
    _os_log_error_impl(&dword_25B6E0000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v46, v29);

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
    v33 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v33);
    v26 = NSStringFromSelector(a2);
    int v46 = 138412802;
    v47 = v25;
    __int16 v48 = 2112;
    v49 = v26;
    __int16 v50 = 1024;
    int v51 = v10;
    v27 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v28 = v12;
    uint32_t v29 = 28;
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
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      objc_super v19 = [v6 valueForKey:@"sessionID"];
      v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        v21 = [v6 valueForKey:@"lowPowerModeWarningState"];
        v22 = v21;
        if (v21)
        {
          uint64_t v23 = (int)[v21 intValue];
        }
        else
        {
          v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            v45 = NSStringFromSelector(a2);
            int v46 = 138412546;
            v47 = v44;
            __int16 v48 = 2112;
            v49 = v45;
            _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", (uint8_t *)&v46, 0x16u);
          }
          uint64_t v23 = 0;
        }
        self = [(SMLowPowerModeWarningStateUpdateMessage *)self initWithDate:v14 messageID:v17 sessionID:v20 lowPowerModeWarningState:v23];
        v30 = self;
      }
      else
      {
        v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          v42 = NSStringFromSelector(a2);
          int v46 = 138412546;
          v47 = v41;
          __int16 v48 = 2112;
          v49 = v42;
          _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v46, 0x16u);
        }
        v30 = 0;
      }
    }
    else
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = NSStringFromSelector(a2);
        int v46 = 138412546;
        v47 = v38;
        __int16 v48 = 2112;
        v49 = v39;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v46, 0x16u);
      }
      v30 = 0;
    }
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      v36 = NSStringFromSelector(a2);
      int v46 = 138412546;
      v47 = v35;
      __int16 v48 = 2112;
      v49 = v36;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v46, 0x16u);
    }
    v30 = 0;
  }

LABEL_15:
  return v30;
}

- (id)outputToDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  v3 = [(SMMessage *)&v6 outputToDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMLowPowerModeWarningStateUpdateMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  [v3 setObject:v4 forKey:@"lowPowerModeWarningState"];

  return v3;
}

+ (unint64_t)messageType
{
  return 20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[SMLowPowerModeWarningStateUpdateMessage encodeWithCoder:]";
      __int16 v10 = 1024;
      int v11 = 122;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SMLowPowerModeWarningStateUpdateMessage;
  [(SMMessage *)&v7 encodeWithCoder:v4];
  objc_super v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMLowPowerModeWarningStateUpdateMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  [v4 encodeObject:v6 forKey:@"lowPowerModeWarningState"];
}

- (SMLowPowerModeWarningStateUpdateMessage)initWithCoder:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = v5;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v38) = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v38, 2u);
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
      v22 = 0;
      goto LABEL_15;
    }
    id v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    int v38 = 138413058;
    v39 = v16;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 1024;
    int v43 = [(id)objc_opt_class() messageType];
    __int16 v44 = 1024;
    int v45 = v7;
    id v18 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    objc_super v19 = v9;
    uint32_t v20 = 34;
LABEL_33:
    _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v38, v20);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 != 1)
  {
    int v21 = v8;
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v25 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v25);
    v17 = NSStringFromSelector(a2);
    int v38 = 138412802;
    v39 = v16;
    __int16 v40 = 2112;
    v41 = v17;
    __int16 v42 = 1024;
    int v43 = v21;
    id v18 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    objc_super v19 = v9;
    uint32_t v20 = 28;
    goto LABEL_33;
  }
  v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
  if (v9)
  {
    __int16 v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (v10)
    {
      int v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        uint64_t v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"lowPowerModeWarningState"];
        v13 = v12;
        if (v12)
        {
          uint64_t v14 = (int)[v12 intValue];
        }
        else
        {
          v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v35 = (objc_class *)objc_opt_class();
            v36 = NSStringFromClass(v35);
            v37 = NSStringFromSelector(a2);
            int v38 = 138412546;
            v39 = v36;
            __int16 v40 = 2112;
            v41 = v37;
            _os_log_error_impl(&dword_25B6E0000, v24, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", (uint8_t *)&v38, 0x16u);
          }
          uint64_t v14 = 0;
        }
        self = [(SMLowPowerModeWarningStateUpdateMessage *)self initWithDate:v9 messageID:v10 sessionID:v11 lowPowerModeWarningState:v14];
        v22 = self;
      }
      else
      {
        v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          v33 = NSStringFromClass(v32);
          v34 = NSStringFromSelector(a2);
          int v38 = 138412546;
          v39 = v33;
          __int16 v40 = 2112;
          v41 = v34;
          _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);
        }
        v22 = 0;
      }
    }
    else
    {
      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint32_t v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v30;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);
      }
      v22 = 0;
    }
  }
  else
  {
    __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = NSStringFromSelector(a2);
      int v38 = 138412546;
      v39 = v27;
      __int16 v40 = 2112;
      v41 = v28;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v38, 0x16u);
    }
    v22 = 0;
  }

LABEL_15:
  return v22;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

@end