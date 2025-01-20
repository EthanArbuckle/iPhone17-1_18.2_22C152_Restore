@interface SMSessionModifyConfigRemoteControlMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (NSString)sourceDeviceID;
- (SMSessionConfiguration)updatedSessionConfiguration;
- (SMSessionModifyConfigRemoteControlMessage)initWithCoder:(id)a3;
- (SMSessionModifyConfigRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sourceDeviceType:(int64_t)a6 sourceDeviceID:(id)a7 updatedSessionConfiguration:(id)a8;
- (SMSessionModifyConfigRemoteControlMessage)initWithDictionary:(id)a3;
- (SMSessionModifyConfigRemoteControlMessage)initWithSourceDeviceType:(int64_t)a3 sourceDeviceID:(id)a4 updatedSessionConfiguration:(id)a5;
- (id)outputToDictionary;
- (int64_t)sourceDeviceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionModifyConfigRemoteControlMessage

- (SMSessionModifyConfigRemoteControlMessage)initWithSourceDeviceType:(int64_t)a3 sourceDeviceID:(id)a4 updatedSessionConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = objc_opt_new();
  v11 = [MEMORY[0x263F08C38] UUID];
  v12 = [v8 sessionID];
  v13 = [(SMSessionModifyConfigRemoteControlMessage *)self initWithDate:v10 messageID:v11 sessionID:v12 sourceDeviceType:a3 sourceDeviceID:v9 updatedSessionConfiguration:v8];

  return v13;
}

- (SMSessionModifyConfigRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sourceDeviceType:(int64_t)a6 sourceDeviceID:(id)a7 updatedSessionConfiguration:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v14)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_14;
  }
  if (!v15)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v16)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v21 = 0;
    goto LABEL_15;
  }
  v25.receiver = self;
  v25.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  v19 = [(SMMessage *)&v25 initWithDate:v14 messageID:v15 sessionID:v16];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_updatedSessionConfiguration, a8);
    objc_storeStrong((id *)&v20->_sourceDeviceID, a7);
    v20->_sourceDeviceType = a6;
  }
  self = v20;
  v21 = self;
LABEL_15:

  return v21;
}

- (SMSessionModifyConfigRemoteControlMessage)initWithDictionary:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", buf, 2u);
    }
    goto LABEL_16;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v29 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v29);
    v31 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v59 = v30;
    __int16 v60 = 2112;
    v61 = v31;
    __int16 v62 = 1024;
    int v63 = [(id)objc_opt_class() messageType];
    __int16 v64 = 1024;
    int v65 = v8;
    v32 = "#RemoteControl%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v33 = v12;
    uint32_t v34 = 34;
LABEL_31:
    _os_log_error_impl(&dword_25B6E0000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);

    goto LABEL_16;
  }
  id v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 == 1)
  {
    v11 = [v6 valueForKey:@"sendDate"];
    v12 = v11;
    if (!v11)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        v43 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v42;
        __int16 v60 = 2112;
        v61 = v43;
        _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", buf, 0x16u);
      }
      v28 = 0;
      goto LABEL_42;
    }
    v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    id v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    id v16 = [v6 valueForKey:@"messageID"];
    id v17 = (void *)[v15 initWithUUIDString:v16];

    if (!v17)
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        v46 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v45;
        __int16 v60 = 2112;
        v61 = v46;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", buf, 0x16u);
      }
      v28 = 0;
      goto LABEL_41;
    }
    id v18 = objc_alloc(MEMORY[0x263F08C38]);
    v19 = [v6 valueForKey:@"sessionID"];
    v20 = [v18 initWithUUIDString:v19];

    if (!v20)
    {
      v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        v49 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v48;
        __int16 v60 = 2112;
        v61 = v49;
        _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", buf, 0x16u);
      }
      v28 = 0;
      goto LABEL_40;
    }
    v21 = [v6 valueForKey:@"idsDeviceType"];
    v22 = v21;
    if (!v21)
    {
      v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v50 = (objc_class *)objc_opt_class();
        NSStringFromClass(v50);
        v52 = v51 = v27;
        v53 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v52;
        __int16 v60 = 2112;
        v61 = v53;
        _os_log_error_impl(&dword_25B6E0000, v51, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing idsDeviceType", buf, 0x16u);

        v27 = v51;
      }
      v28 = 0;
      goto LABEL_39;
    }
    int v23 = [v21 intValue];
    uint64_t v57 = [v6 valueForKey:@"sourceDeviceId"];
    if (v57)
    {
      v24 = [[SMSessionConfiguration alloc] initWithDictionary:v6];
      if (v24)
      {
        p_super = &v24->super;
        uint64_t v26 = v23;
        v27 = v57;
        self = [(SMSessionModifyConfigRemoteControlMessage *)self initWithDate:v14 messageID:v17 sessionID:v20 sourceDeviceType:v26 sourceDeviceID:v57 updatedSessionConfiguration:v24];
        v28 = self;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
LABEL_42:

        goto LABEL_17;
      }
      v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        v56 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v55;
        __int16 v60 = 2112;
        v61 = v56;
        _os_log_error_impl(&dword_25B6E0000, v40, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing updatedSessionConfig", buf, 0x16u);
      }
      p_super = 0;
    }
    else
    {
      p_super = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        v38 = NSStringFromClass(v37);
        v39 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v59 = v38;
        __int16 v60 = 2112;
        v61 = v39;
        _os_log_error_impl(&dword_25B6E0000, p_super, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", buf, 0x16u);
      }
    }
    v28 = 0;
    v27 = v57;
    goto LABEL_38;
  }
  v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v36 = (objc_class *)objc_opt_class();
    v30 = NSStringFromClass(v36);
    v31 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v59 = v30;
    __int16 v60 = 2112;
    v61 = v31;
    __int16 v62 = 1024;
    int v63 = v10;
    v32 = "#RemoteControl%@,%@,unrecognized interface version,%d";
    v33 = v12;
    uint32_t v34 = 28;
    goto LABEL_31;
  }
LABEL_16:
  v28 = 0;
LABEL_17:

  return v28;
}

- (id)outputToDictionary
{
  v9.receiver = self;
  v9.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  v3 = [(SMMessage *)&v9 outputToDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMSessionModifyConfigRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"));
  [v3 setObject:v4 forKey:@"idsDeviceType"];

  id v5 = [(SMSessionModifyConfigRemoteControlMessage *)self sourceDeviceID];
  [v3 setObject:v5 forKey:@"sourceDeviceId"];

  v6 = [(SMSessionModifyConfigRemoteControlMessage *)self updatedSessionConfiguration];
  v7 = [v6 outputToDictionary];
  [v3 addEntriesFromDictionary:v7];

  return v3;
}

+ (unint64_t)messageType
{
  return 18;
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
      int v10 = "-[SMSessionModifyConfigRemoteControlMessage encodeWithCoder:]";
      __int16 v11 = 1024;
      int v12 = 149;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SMSessionModifyConfigRemoteControlMessage;
  [(SMMessage *)&v8 encodeWithCoder:v4];
  v6 = [(SMSessionModifyConfigRemoteControlMessage *)self updatedSessionConfiguration];
  [v4 encodeObject:v6 forKey:@"updatedSessionConfiguration"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionModifyConfigRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"), @"idsDeviceType");
  v7 = [(SMSessionModifyConfigRemoteControlMessage *)self sourceDeviceID];
  [v4 encodeObject:v7 forKey:@"sourceDeviceId"];
}

- (SMSessionModifyConfigRemoteControlMessage)initWithCoder:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    objc_super v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v42) = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", (uint8_t *)&v42, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    objc_super v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    v19 = NSStringFromSelector(a2);
    int v42 = 138413058;
    v43 = v18;
    __int16 v44 = 2112;
    v45 = v19;
    __int16 v46 = 1024;
    int v47 = [(id)objc_opt_class() messageType];
    __int16 v48 = 1024;
    int v49 = v7;
    v20 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v21 = v9;
    uint32_t v22 = 34;
LABEL_29:
    _os_log_error_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v42, v22);

    goto LABEL_15;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    objc_super v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (!v9)
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = NSStringFromSelector(a2);
        int v42 = 138412546;
        v43 = v31;
        __int16 v44 = 2112;
        v45 = v32;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", (uint8_t *)&v42, 0x16u);
      }
      id v16 = 0;
      goto LABEL_37;
    }
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v10)
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v33 = (objc_class *)objc_opt_class();
        uint32_t v34 = NSStringFromClass(v33);
        v35 = NSStringFromSelector(a2);
        int v42 = 138412546;
        v43 = v34;
        __int16 v44 = 2112;
        v45 = v35;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", (uint8_t *)&v42, 0x16u);
      }
      id v16 = 0;
      goto LABEL_36;
    }
    __int16 v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    if (!v11)
    {
      int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v36 = (objc_class *)objc_opt_class();
        v37 = NSStringFromClass(v36);
        v38 = NSStringFromSelector(a2);
        int v42 = 138412546;
        v43 = v37;
        __int16 v44 = 2112;
        v45 = v38;
        _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", (uint8_t *)&v42, 0x16u);
      }
      id v16 = 0;
      goto LABEL_35;
    }
    int v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDeviceId"];
    if (v12)
    {
      uint64_t v13 = [v6 decodeIntegerForKey:@"idsDeviceType"];
      uint64_t v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"updatedSessionConfiguration"];
      if (v14)
      {
        id v15 = v14;
        self = [(SMSessionModifyConfigRemoteControlMessage *)self initWithDate:v10 messageID:v9 sessionID:v11 sourceDeviceType:v13 sourceDeviceID:v12 updatedSessionConfiguration:v14];
        id v16 = self;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
        goto LABEL_16;
      }
      v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = NSStringFromSelector(a2);
        int v42 = 138412546;
        v43 = v40;
        __int16 v44 = 2112;
        v45 = v41;
        _os_log_error_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing updatedSessionConfiguration", (uint8_t *)&v42, 0x16u);
      }
      id v15 = 0;
    }
    else
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_super v25 = (objc_class *)objc_opt_class();
        uint64_t v26 = NSStringFromClass(v25);
        v27 = NSStringFromSelector(a2);
        int v42 = 138412546;
        v43 = v26;
        __int16 v44 = 2112;
        v45 = v27;
        _os_log_error_impl(&dword_25B6E0000, v15, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sourceDeviceID", (uint8_t *)&v42, 0x16u);
      }
    }
    id v16 = 0;
    goto LABEL_34;
  }
  int v23 = v8;
  objc_super v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v28 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v28);
    v19 = NSStringFromSelector(a2);
    int v42 = 138412802;
    v43 = v18;
    __int16 v44 = 2112;
    v45 = v19;
    __int16 v46 = 1024;
    int v47 = v23;
    v20 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    v21 = v9;
    uint32_t v22 = 28;
    goto LABEL_29;
  }
LABEL_15:
  id v16 = 0;
LABEL_16:

  return v16;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (int64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (SMSessionConfiguration)updatedSessionConfiguration
{
  return self->_updatedSessionConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSessionConfiguration, 0);
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
}

@end