@interface SMSessionEndRemoteControlMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (NSString)sourceDeviceID;
- (SMSessionEndRemoteControlMessage)initWithCoder:(id)a3;
- (SMSessionEndRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 sessionEndReason:(unint64_t)a5 sessionID:(id)a6 sourceDeviceType:(int64_t)a7 sourceDeviceID:(id)a8;
- (SMSessionEndRemoteControlMessage)initWithDictionary:(id)a3;
- (SMSessionEndRemoteControlMessage)initWithSessionEndReason:(unint64_t)a3 sessionID:(id)a4 sourceDeviceType:(int64_t)a5 sourceDeviceID:(id)a6;
- (id)outputToDictionary;
- (int64_t)sourceDeviceType;
- (unint64_t)sessionEndReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionEndRemoteControlMessage

- (SMSessionEndRemoteControlMessage)initWithSessionEndReason:(unint64_t)a3 sessionID:(id)a4 sourceDeviceType:(int64_t)a5 sourceDeviceID:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  v12 = objc_opt_new();
  v13 = [MEMORY[0x263F08C38] UUID];
  v14 = [(SMSessionEndRemoteControlMessage *)self initWithDate:v12 messageID:v13 sessionEndReason:a3 sessionID:v11 sourceDeviceType:a5 sourceDeviceID:v10];

  return v14;
}

- (SMSessionEndRemoteControlMessage)initWithDate:(id)a3 messageID:(id)a4 sessionEndReason:(unint64_t)a5 sessionID:(id)a6 sourceDeviceType:(int64_t)a7 sourceDeviceID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  if (!v14)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: date";
LABEL_13:
    _os_log_error_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
    goto LABEL_14;
  }
  if (!v15)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v22 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v16)
  {
    v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Invalid parameter not satisfying: sessionID";
      goto LABEL_13;
    }
LABEL_14:

    v20 = 0;
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)SMSessionEndRemoteControlMessage;
  v18 = [(SMMessage *)&v24 initWithDate:v14 messageID:v15 sessionID:v16];
  v19 = v18;
  if (v18)
  {
    v18->_sessionEndReason = a5;
    objc_storeStrong((id *)&v18->_sourceDeviceID, a8);
    v19->_sourceDeviceType = a7;
  }
  self = v19;
  v20 = self;
LABEL_15:

  return v20;
}

- (SMSessionEndRemoteControlMessage)initWithDictionary:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
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
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v29 = 0;
      goto LABEL_17;
    }
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v63 = v31;
    __int16 v64 = 2112;
    v65 = v32;
    __int16 v66 = 1024;
    int v67 = [(id)objc_opt_class() messageType];
    __int16 v68 = 1024;
    int v69 = v8;
    v33 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v34 = v12;
    uint32_t v35 = 34;
LABEL_31:
    _os_log_error_impl(&dword_25B6E0000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_16;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    v38 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v38);
    v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v63 = v31;
    __int16 v64 = 2112;
    v65 = v32;
    __int16 v66 = 1024;
    int v67 = v10;
    v33 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    v34 = v12;
    uint32_t v35 = 28;
    goto LABEL_31;
  }
  id v11 = [v6 valueForKey:@"sendDate"];
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    id v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    id v16 = [v6 valueForKey:@"messageID"];
    id v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      v18 = [v6 valueForKey:@"sessionEndReason"];
      v19 = v18;
      if (v18)
      {
        int v20 = [v18 intValue];
        id v21 = objc_alloc(MEMORY[0x263F08C38]);
        v22 = [v6 valueForKey:@"sessionID"];
        v23 = [v21 initWithUUIDString:v22];

        if (v23)
        {
          objc_super v24 = [v6 valueForKey:@"idsDeviceType"];
          v61 = v24;
          if (v24)
          {
            v60 = v23;
            int v25 = [v24 intValue];
            uint64_t v26 = [v6 valueForKey:@"sourceDeviceId"];
            if (v26)
            {
              v27 = v26;
              uint64_t v28 = v25;
              v23 = v60;
              self = [(SMSessionEndRemoteControlMessage *)self initWithDate:v14 messageID:v17 sessionEndReason:v20 sessionID:v60 sourceDeviceType:v28 sourceDeviceID:v26];
              v29 = self;
            }
            else
            {
              v39 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v57 = (objc_class *)objc_opt_class();
                v58 = NSStringFromClass(v57);
                v59 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v63 = v58;
                __int16 v64 = 2112;
                v65 = v59;
                _os_log_error_impl(&dword_25B6E0000, v39, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", buf, 0x16u);
              }
              v27 = 0;
              v29 = 0;
              v23 = v60;
            }
          }
          else
          {
            v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v53 = (objc_class *)objc_opt_class();
              NSStringFromClass(v53);
              v55 = v54 = v23;
              v56 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v63 = v55;
              __int16 v64 = 2112;
              v65 = v56;
              _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing idsDeviceType", buf, 0x16u);

              v23 = v54;
            }
            v29 = 0;
          }

          v37 = v61;
        }
        else
        {
          v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            v50 = (objc_class *)objc_opt_class();
            v51 = NSStringFromClass(v50);
            v52 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v63 = v51;
            __int16 v64 = 2112;
            v65 = v52;
            _os_log_error_impl(&dword_25B6E0000, v37, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", buf, 0x16u);

            v23 = 0;
          }
          v29 = 0;
        }
      }
      else
      {
        v23 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v46 = (objc_class *)objc_opt_class();
          NSStringFromClass(v46);
          v48 = v47 = v23;
          v49 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v63 = v48;
          __int16 v64 = 2112;
          v65 = v49;
          _os_log_error_impl(&dword_25B6E0000, v47, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionEndReason", buf, 0x16u);

          v23 = v47;
        }
        v29 = 0;
      }
    }
    else
    {
      v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        v45 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v63 = v44;
        __int16 v64 = 2112;
        v65 = v45;
        _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", buf, 0x16u);
      }
      v29 = 0;
    }
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v40 = (objc_class *)objc_opt_class();
      v41 = NSStringFromClass(v40);
      v42 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v63 = v41;
      __int16 v64 = 2112;
      v65 = v42;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", buf, 0x16u);
    }
    v29 = 0;
  }

LABEL_17:
  return v29;
}

- (id)outputToDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)SMSessionEndRemoteControlMessage;
  v3 = [(SMMessage *)&v8 outputToDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndRemoteControlMessage sessionEndReason](self, "sessionEndReason"));
  [v3 setObject:v4 forKey:@"sessionEndReason"];

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMSessionEndRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"));
  [v3 setObject:v5 forKey:@"idsDeviceType"];

  v6 = [(SMSessionEndRemoteControlMessage *)self sourceDeviceID];
  [v3 setObject:v6 forKey:@"sourceDeviceId"];

  return v3;
}

+ (unint64_t)messageType
{
  return 17;
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
      v9 = "-[SMSessionEndRemoteControlMessage encodeWithCoder:]";
      __int16 v10 = 1024;
      int v11 = 151;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SMSessionEndRemoteControlMessage;
  [(SMMessage *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionEndRemoteControlMessage sessionEndReason](self, "sessionEndReason"), @"sessionEndReason");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionEndRemoteControlMessage sourceDeviceType](self, "sourceDeviceType"), @"idsDeviceType");
  v6 = [(SMSessionEndRemoteControlMessage *)self sourceDeviceID];
  [v4 encodeObject:v6 forKey:@"sourceDeviceId"];
}

- (SMSessionEndRemoteControlMessage)initWithCoder:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
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
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v16 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v16);
    v18 = NSStringFromSelector(a2);
    int v38 = 138413058;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    __int16 v42 = 1024;
    int v43 = [(id)objc_opt_class() messageType];
    __int16 v44 = 1024;
    int v45 = v7;
    v19 = "#RemoteControl,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    int v20 = v9;
    uint32_t v21 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v38, v21);

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
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v30;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);
      }
      id v15 = 0;
      goto LABEL_30;
    }
    __int16 v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v10)
    {
      int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        v34 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v33;
        __int16 v40 = 2112;
        v41 = v34;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing date", (uint8_t *)&v38, 0x16u);
      }
      id v15 = 0;
      goto LABEL_29;
    }
    int v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    if (v11)
    {
      uint64_t v12 = [v6 decodeIntegerForKey:@"sessionEndReason"];
      uint64_t v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sourceDeviceId"];
      if (v13)
      {
        id v14 = v13;
        self = -[SMSessionEndRemoteControlMessage initWithDate:messageID:sessionEndReason:sessionID:sourceDeviceType:sourceDeviceID:](self, "initWithDate:messageID:sessionEndReason:sessionID:sourceDeviceType:sourceDeviceID:", v10, v9, v12, v11, [v6 decodeIntegerForKey:@"idsDeviceType"], v13);
        id v15 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        uint32_t v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        v37 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v36;
        __int16 v40 = 2112;
        v41 = v37;
        _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sourceDeviceID", (uint8_t *)&v38, 0x16u);
      }
      id v14 = 0;
    }
    else
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_super v24 = (objc_class *)objc_opt_class();
        int v25 = NSStringFromClass(v24);
        uint64_t v26 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v25;
        __int16 v40 = 2112;
        v41 = v26;
        _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#RemoteControl,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);
      }
    }
    id v15 = 0;
    goto LABEL_28;
  }
  int v22 = v8;
  v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = (objc_class *)objc_opt_class();
    id v17 = NSStringFromClass(v28);
    v18 = NSStringFromSelector(a2);
    int v38 = 138412802;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    __int16 v42 = 1024;
    int v43 = v22;
    v19 = "#RemoteControl,%@,%@,unrecognized interface version,%d";
    int v20 = v9;
    uint32_t v21 = 28;
    goto LABEL_32;
  }
LABEL_14:
  id v15 = 0;
LABEL_15:

  return v15;
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (int64_t)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (void).cxx_destruct
{
}

@end