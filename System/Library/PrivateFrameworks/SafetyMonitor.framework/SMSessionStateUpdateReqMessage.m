@interface SMSessionStateUpdateReqMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (NSUUID)deviceToRequest;
- (SMSessionStateUpdateReqMessage)initWithCoder:(id)a3;
- (SMSessionStateUpdateReqMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 deviceToRequest:(id)a6;
- (SMSessionStateUpdateReqMessage)initWithDictionary:(id)a3;
- (id)initSessionID:(id)a3 deviceToRequest:(id)a4;
- (id)outputToDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionStateUpdateReqMessage

+ (unint64_t)messageType
{
  return 16;
}

- (SMSessionStateUpdateReqMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 deviceToRequest:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
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
    v19 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (!v13)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: deviceToRequest";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  v21.receiver = self;
  v21.super_class = (Class)SMSessionStateUpdateReqMessage;
  v15 = [(SMMessage *)&v21 initWithDate:v10 messageID:v11 sessionID:v12];
  v16 = v15;
  if (v15) {
    objc_storeStrong((id *)&v15->_deviceToRequest, a6);
  }
  self = v16;
  v17 = self;
LABEL_18:

  return v17;
}

- (id)initSessionID:(id)a3 deviceToRequest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [MEMORY[0x263F08C38] UUID];
  id v10 = [(SMSessionStateUpdateReqMessage *)self initWithDate:v8 messageID:v9 sessionID:v7 deviceToRequest:v6];

  return v10;
}

- (SMSessionStateUpdateReqMessage)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
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
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = NSStringFromSelector(a2);
    int v46 = 138413058;
    v47 = v26;
    __int16 v48 = 2112;
    v49 = v27;
    __int16 v50 = 1024;
    int v51 = [(id)objc_opt_class() messageType];
    __int16 v52 = 1024;
    int v53 = v8;
    v28 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v29 = v12;
    uint32_t v30 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_ERROR, v28, (uint8_t *)&v46, v30);

    goto LABEL_14;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 == 1)
  {
    id v11 = [v6 valueForKey:@"sendDate"];
    id v12 = v11;
    if (!v11)
    {
      v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = NSStringFromSelector(a2);
        int v46 = 138412546;
        v47 = v38;
        __int16 v48 = 2112;
        v49 = v39;
        _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v46, 0x16u);
      }
      v24 = 0;
      goto LABEL_30;
    }
    id v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    v16 = [v6 valueForKey:@"messageID"];
    v17 = (void *)[v15 initWithUUIDString:v16];

    if (!v17)
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v40 = (objc_class *)objc_opt_class();
        v41 = NSStringFromClass(v40);
        v42 = NSStringFromSelector(a2);
        int v46 = 138412546;
        v47 = v41;
        __int16 v48 = 2112;
        v49 = v42;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v46, 0x16u);
      }
      v24 = 0;
      goto LABEL_29;
    }
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    v19 = [v6 valueForKey:@"sessionID"];
    v20 = [v18 initWithUUIDString:v19];

    if (v20)
    {
      id v21 = objc_alloc(MEMORY[0x263F08C38]);
      v22 = [v6 valueForKey:@"deviceToRequest"];
      v23 = [v21 initWithUUIDString:v22];

      if (v23)
      {
        self = [(SMSessionStateUpdateReqMessage *)self initWithDate:v14 messageID:v17 sessionID:v20 deviceToRequest:v23];
        v24 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      v35 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        v45 = NSStringFromSelector(a2);
        int v46 = 138412546;
        v47 = v44;
        __int16 v48 = 2112;
        v49 = v45;
        _os_log_error_impl(&dword_25B6E0000, v35, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing deviceToRequest", (uint8_t *)&v46, 0x16u);
      }
      v23 = 0;
    }
    else
    {
      v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        v34 = NSStringFromSelector(a2);
        int v46 = 138412546;
        v47 = v33;
        __int16 v48 = 2112;
        v49 = v34;
        _os_log_error_impl(&dword_25B6E0000, v23, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v46, 0x16u);
      }
    }
    v24 = 0;
    goto LABEL_28;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v36 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v36);
    v27 = NSStringFromSelector(a2);
    int v46 = 138412802;
    v47 = v26;
    __int16 v48 = 2112;
    v49 = v27;
    __int16 v50 = 1024;
    int v51 = v10;
    v28 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v29 = v12;
    uint32_t v30 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v24 = 0;
LABEL_15:

  return v24;
}

- (id)outputToDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)SMSessionStateUpdateReqMessage;
  v3 = [(SMMessage *)&v7 outputToDictionary];
  v4 = [(SMSessionStateUpdateReqMessage *)self deviceToRequest];
  id v5 = [v4 UUIDString];
  [v3 setValue:v5 forKey:@"deviceToRequest"];

  return v3;
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
      v9 = "-[SMSessionStateUpdateReqMessage encodeWithCoder:]";
      __int16 v10 = 1024;
      int v11 = 106;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SMSessionStateUpdateReqMessage;
  [(SMMessage *)&v7 encodeWithCoder:v4];
  id v6 = [(SMSessionStateUpdateReqMessage *)self deviceToRequest];
  [v4 encodeObject:v6 forKey:@"deviceToRequest"];
}

- (SMSessionStateUpdateReqMessage)initWithCoder:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v37) = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v37, 2u);
    }
    goto LABEL_14;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    int v37 = 138413058;
    v38 = v16;
    __int16 v39 = 2112;
    v40 = v17;
    __int16 v41 = 1024;
    int v42 = [(id)objc_opt_class() messageType];
    __int16 v43 = 1024;
    int v44 = v7;
    id v18 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v19 = v9;
    uint32_t v20 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v37, v20);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (!v9)
    {
      __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        uint32_t v30 = NSStringFromSelector(a2);
        int v37 = 138412546;
        v38 = v29;
        __int16 v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v37, 0x16u);
      }
      v14 = 0;
      goto LABEL_30;
    }
    __int16 v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v10)
    {
      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        v33 = NSStringFromSelector(a2);
        int v37 = 138412546;
        v38 = v32;
        __int16 v39 = 2112;
        v40 = v33;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v37, 0x16u);
      }
      v14 = 0;
      goto LABEL_29;
    }
    int v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    if (v11)
    {
      uint64_t v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"deviceToRequest"];
      if (v12)
      {
        id v13 = v12;
        self = [(SMSessionStateUpdateReqMessage *)self initWithDate:v10 messageID:v9 sessionID:v11 deviceToRequest:v12];
        v14 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      v26 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        v36 = NSStringFromSelector(a2);
        int v37 = 138412546;
        v38 = v35;
        __int16 v39 = 2112;
        v40 = v36;
        _os_log_error_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing deviceToRequest", (uint8_t *)&v37, 0x16u);
      }
      id v13 = 0;
    }
    else
    {
      id v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        v25 = NSStringFromSelector(a2);
        int v37 = 138412546;
        v38 = v24;
        __int16 v39 = 2112;
        v40 = v25;
        _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v37, 0x16u);
      }
    }
    v14 = 0;
    goto LABEL_28;
  }
  int v21 = v8;
  v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v27 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v27);
    v17 = NSStringFromSelector(a2);
    int v37 = 138412802;
    v38 = v16;
    __int16 v39 = 2112;
    v40 = v17;
    __int16 v41 = 1024;
    int v42 = v21;
    id v18 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v19 = v9;
    uint32_t v20 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

- (NSUUID)deviceToRequest
{
  return self->_deviceToRequest;
}

- (void).cxx_destruct
{
}

@end