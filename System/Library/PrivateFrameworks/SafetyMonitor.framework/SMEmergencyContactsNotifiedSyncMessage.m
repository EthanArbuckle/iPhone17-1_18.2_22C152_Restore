@interface SMEmergencyContactsNotifiedSyncMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (SMEmergencyContactsNotifiedSyncMessage)initWithCoder:(id)a3;
- (SMEmergencyContactsNotifiedSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerCategory:(unint64_t)a6;
- (SMEmergencyContactsNotifiedSyncMessage)initWithDictionary:(id)a3;
- (SMEmergencyContactsNotifiedSyncMessage)initWithSessionID:(id)a3 triggerCategory:(unint64_t)a4;
- (id)outputToDictionary;
- (unint64_t)triggerCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMEmergencyContactsNotifiedSyncMessage

- (SMEmergencyContactsNotifiedSyncMessage)initWithSessionID:(id)a3 triggerCategory:(unint64_t)a4
{
  v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  v8 = [v6 now];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [(SMEmergencyContactsNotifiedSyncMessage *)self initWithDate:v8 messageID:v9 sessionID:v7 triggerCategory:a4];

  return v10;
}

- (SMEmergencyContactsNotifiedSyncMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerCategory:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_17;
  }
  if (!v11)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v12)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (a6 - 1 >= 0x16)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "Invalid parameter not satisfying: triggerCategory > SMTriggerCategoryUnknown && triggerCategory < SMTriggerCategoryMax";
      goto LABEL_16;
    }
LABEL_17:

    v15 = 0;
    goto LABEL_18;
  }
  v19.receiver = self;
  v19.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  v14 = [(SMMessage *)&v19 initWithDate:v10 messageID:v11 sessionID:v12];
  if (v14) {
    v14->_triggerCategory = a6;
  }
  self = v14;
  v15 = self;
LABEL_18:

  return v15;
}

- (SMEmergencyContactsNotifiedSyncMessage)initWithDictionary:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v45) = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v45, 2u);
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
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = NSStringFromSelector(a2);
    int v45 = 138413058;
    v46 = v25;
    __int16 v47 = 2112;
    v48 = v26;
    __int16 v49 = 1024;
    int v50 = [(id)objc_opt_class() messageType];
    __int16 v51 = 1024;
    int v52 = v8;
    v27 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v28 = v12;
    uint32_t v29 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v45, v29);

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
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        v38 = NSStringFromSelector(a2);
        int v45 = 138412546;
        v46 = v37;
        __int16 v47 = 2112;
        v48 = v38;
        _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v45, 0x16u);
      }
      v23 = 0;
      goto LABEL_30;
    }
    v13 = (void *)MEMORY[0x263EFF910];
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
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = NSStringFromSelector(a2);
        int v45 = 138412546;
        v46 = v40;
        __int16 v47 = 2112;
        v48 = v41;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v45, 0x16u);
      }
      v23 = 0;
      goto LABEL_29;
    }
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    objc_super v19 = [v6 valueForKey:@"sessionID"];
    v20 = [v18 initWithUUIDString:v19];

    if (v20)
    {
      v21 = [v6 valueForKey:@"triggerCategory"];
      if (v21)
      {
        v22 = v21;
        self = [(SMEmergencyContactsNotifiedSyncMessage *)self initWithDate:v14 messageID:v17 sessionID:v20 triggerCategory:(int)[v21 intValue]];
        v23 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = NSStringFromSelector(a2);
        int v45 = 138412546;
        v46 = v43;
        __int16 v47 = 2112;
        v48 = v44;
        _os_log_error_impl(&dword_25B6E0000, v34, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerCategory", (uint8_t *)&v45, 0x16u);
      }
      v22 = 0;
    }
    else
    {
      v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        v33 = NSStringFromSelector(a2);
        int v45 = 138412546;
        v46 = v32;
        __int16 v47 = 2112;
        v48 = v33;
        _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v45, 0x16u);
      }
    }
    v23 = 0;
    goto LABEL_28;
  }
  id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v35 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v35);
    v26 = NSStringFromSelector(a2);
    int v45 = 138412802;
    v46 = v25;
    __int16 v47 = 2112;
    v48 = v26;
    __int16 v49 = 1024;
    int v50 = v10;
    v27 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v28 = v12;
    uint32_t v29 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v23 = 0;
LABEL_15:

  return v23;
}

- (id)outputToDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  v3 = [(SMMessage *)&v6 outputToDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMEmergencyContactsNotifiedSyncMessage triggerCategory](self, "triggerCategory"));
  [v3 setObject:v4 forKey:@"triggerCategory"];

  return v3;
}

+ (unint64_t)messageType
{
  return 11;
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
      v9 = "-[SMEmergencyContactsNotifiedSyncMessage encodeWithCoder:]";
      __int16 v10 = 1024;
      int v11 = 124;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SMEmergencyContactsNotifiedSyncMessage;
  [(SMMessage *)&v7 encodeWithCoder:v4];
  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMEmergencyContactsNotifiedSyncMessage triggerCategory](self, "triggerCategory"));
  [v4 encodeObject:v6 forKey:@"triggerCategory"];
}

- (SMEmergencyContactsNotifiedSyncMessage)initWithCoder:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_super v6 = v5;
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
    objc_super v19 = v9;
    uint32_t v20 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v37, v20);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v9)
    {
      __int16 v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v28 = (objc_class *)objc_opt_class();
        uint32_t v29 = NSStringFromClass(v28);
        v30 = NSStringFromSelector(a2);
        int v37 = 138412546;
        v38 = v29;
        __int16 v39 = 2112;
        v40 = v30;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v37, 0x16u);
      }
      v14 = 0;
      goto LABEL_30;
    }
    __int16 v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
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
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v37, 0x16u);
      }
      v14 = 0;
      goto LABEL_29;
    }
    int v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    if (v11)
    {
      uint64_t v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"triggerCategory"];
      if (v12)
      {
        v13 = v12;
        self = [(SMEmergencyContactsNotifiedSyncMessage *)self initWithDate:v9 messageID:v10 sessionID:v11 triggerCategory:(int)[v12 intValue]];
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
        _os_log_error_impl(&dword_25B6E0000, v26, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerCategory", (uint8_t *)&v37, 0x16u);
      }
      v13 = 0;
    }
    else
    {
      v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
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
    objc_super v19 = v9;
    uint32_t v20 = 28;
    goto LABEL_32;
  }
LABEL_14:
  v14 = 0;
LABEL_15:

  return v14;
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

@end