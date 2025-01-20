@interface SMSessionStartInfoRequestMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (SMSessionStartInfoRequestMessage)initWithCoder:(id)a3;
- (SMSessionStartInfoRequestMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5;
- (SMSessionStartInfoRequestMessage)initWithDictionary:(id)a3;
- (SMSessionStartInfoRequestMessage)initWithSessionID:(id)a3;
- (id)outputToDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionStartInfoRequestMessage

- (SMSessionStartInfoRequestMessage)initWithSessionID:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 now];
  v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [(SMSessionStartInfoRequestMessage *)self initWithDate:v6 messageID:v7 sessionID:v5];

  return v8;
}

- (SMSessionStartInfoRequestMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: date";
LABEL_11:
    _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, v14, buf, 2u);
    goto LABEL_12;
  }
  if (!v9)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v14 = "Invalid parameter not satisfying: messageID";
    goto LABEL_11;
  }
  if (!v10)
  {
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_11;
    }
LABEL_12:

    v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)SMSessionStartInfoRequestMessage;
  self = [(SMMessage *)&v16 initWithDate:v8 messageID:v9 sessionID:v10];
  v12 = self;
LABEL_13:

  return v12;
}

- (SMSessionStartInfoRequestMessage)initWithDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v40, 2u);
    }
    goto LABEL_13;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    v24 = NSStringFromSelector(a2);
    int v40 = 138413058;
    v41 = v23;
    __int16 v42 = 2112;
    v43 = v24;
    __int16 v44 = 1024;
    int v45 = [(id)objc_opt_class() messageType];
    __int16 v46 = 1024;
    int v47 = v8;
    v25 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v26 = v12;
    uint32_t v27 = 34;
LABEL_27:
    _os_log_error_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v40, v27);

    goto LABEL_13;
  }
  id v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 == 1)
  {
    v11 = [v6 valueForKey:@"sendDate"];
    v12 = v11;
    if (!v11)
    {
      v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        v36 = NSStringFromSelector(a2);
        int v40 = 138412546;
        v41 = v35;
        __int16 v42 = 2112;
        v43 = v36;
        _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v40, 0x16u);
      }
      v21 = 0;
      goto LABEL_25;
    }
    v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    objc_super v16 = [v6 valueForKey:@"messageID"];
    v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      v19 = [v6 valueForKey:@"sessionID"];
      v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        self = [(SMSessionStartInfoRequestMessage *)self initWithDate:v14 messageID:v17 sessionID:v20];
        v21 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = NSStringFromSelector(a2);
        int v40 = 138412546;
        v41 = v38;
        __int16 v42 = 2112;
        v43 = v39;
        _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v40, 0x16u);
      }
      v20 = 0;
    }
    else
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = NSStringFromSelector(a2);
        int v40 = 138412546;
        v41 = v30;
        __int16 v42 = 2112;
        v43 = v31;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v40, 0x16u);
      }
    }
    v21 = 0;
    goto LABEL_24;
  }
  v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v33 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v33);
    v24 = NSStringFromSelector(a2);
    int v40 = 138412802;
    v41 = v23;
    __int16 v42 = 2112;
    v43 = v24;
    __int16 v44 = 1024;
    int v45 = v10;
    v25 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v26 = v12;
    uint32_t v27 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v21 = 0;
LABEL_14:

  return v21;
}

- (id)outputToDictionary
{
  v4.receiver = self;
  v4.super_class = (Class)SMSessionStartInfoRequestMessage;
  v2 = [(SMMessage *)&v4 outputToDictionary];
  return v2;
}

+ (unint64_t)messageType
{
  return 12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v8 = "-[SMSessionStartInfoRequestMessage encodeWithCoder:]";
      __int16 v9 = 1024;
      int v10 = 107;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SMSessionStartInfoRequestMessage;
  [(SMMessage *)&v6 encodeWithCoder:v4];
}

- (SMSessionStartInfoRequestMessage)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = v5;
  if (!v5)
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33) = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v33, 2u);
    }
    goto LABEL_13;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    objc_super v16 = NSStringFromSelector(a2);
    int v33 = 138413058;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 1024;
    int v38 = [(id)objc_opt_class() messageType];
    __int16 v39 = 1024;
    int v40 = v7;
    v17 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    id v18 = v9;
    uint32_t v19 = 34;
LABEL_27:
    _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v33, v19);

    goto LABEL_13;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    __int16 v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v9)
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint32_t v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        v29 = NSStringFromSelector(a2);
        int v33 = 138412546;
        v34 = v28;
        __int16 v35 = 2112;
        v36 = v29;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v33, 0x16u);
      }
      v13 = 0;
      goto LABEL_25;
    }
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (v10)
    {
      uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        v12 = v11;
        self = [(SMSessionStartInfoRequestMessage *)self initWithDate:v9 messageID:v10 sessionID:v11];
        v13 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = NSStringFromSelector(a2);
        int v33 = 138412546;
        v34 = v31;
        __int16 v35 = 2112;
        v36 = v32;
        _os_log_error_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v33, 0x16u);
      }
      v12 = 0;
    }
    else
    {
      v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v22 = (objc_class *)objc_opt_class();
        v23 = NSStringFromClass(v22);
        v24 = NSStringFromSelector(a2);
        int v33 = 138412546;
        v34 = v23;
        __int16 v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v33, 0x16u);
      }
    }
    v13 = 0;
    goto LABEL_24;
  }
  int v20 = v8;
  __int16 v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v26 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v26);
    objc_super v16 = NSStringFromSelector(a2);
    int v33 = 138412802;
    v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 1024;
    int v38 = v20;
    v17 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    id v18 = v9;
    uint32_t v19 = 28;
    goto LABEL_27;
  }
LABEL_13:
  v13 = 0;
LABEL_14:

  return v13;
}

@end