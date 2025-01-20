@interface SMEstimatedEndTimeUpdateMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (NSDate)coarseEstimatedEndTime;
- (NSDate)estimatedEndTime;
- (SMEstimatedEndTimeUpdateMessage)initWithCoder:(id)a3;
- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6;
- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7;
- (SMEstimatedEndTimeUpdateMessage)initWithDictionary:(id)a3;
- (SMEstimatedEndTimeUpdateMessage)initWithSessionID:(id)a3 estimatedEndTime:(id)a4 coarseEstimatedEndTime:(id)a5;
- (id)outputToDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMEstimatedEndTimeUpdateMessage

- (SMEstimatedEndTimeUpdateMessage)initWithSessionID:(id)a3 estimatedEndTime:(id)a4 coarseEstimatedEndTime:(id)a5
{
  v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 now];
  v13 = [MEMORY[0x263F08C38] UUID];
  v14 = [(SMEstimatedEndTimeUpdateMessage *)self initWithDate:v12 messageID:v13 sessionID:v11 estimatedEndTime:v10 coarseEstimatedEndTime:v9];

  return v14;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v23 = 0;
    v17 = "Invalid parameter not satisfying: date";
    v18 = (uint8_t *)&v23;
LABEL_14:
    _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, v17, v18, 2u);
    goto LABEL_15;
  }
  if (!v11)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v22 = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    v18 = (uint8_t *)&v22;
    goto LABEL_14;
  }
  if (!v12)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v21 = 0;
    v17 = "Invalid parameter not satisfying: sessionID";
    v18 = (uint8_t *)&v21;
    goto LABEL_14;
  }
  if (!v13)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v20 = 0;
      v17 = "Invalid parameter not satisfying: estimatedEndTime";
      v18 = (uint8_t *)&v20;
      goto LABEL_14;
    }
LABEL_15:

    v15 = 0;
    goto LABEL_16;
  }
  self = [(SMEstimatedEndTimeUpdateMessage *)self initWithDate:v10 messageID:v11 sessionID:v12 estimatedEndTime:v13 coarseEstimatedEndTime:v13];
  v15 = self;
LABEL_16:

  return v15;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12)
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v21 = "Invalid parameter not satisfying: date";
LABEL_16:
    _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_17;
  }
  if (!v13)
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v21 = "Invalid parameter not satisfying: messageID";
    goto LABEL_16;
  }
  if (!v14)
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    __int16 v21 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_16;
  }
  if (!v15)
  {
    __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __int16 v21 = "Invalid parameter not satisfying: estimatedEndTime";
      goto LABEL_16;
    }
LABEL_17:

    v19 = 0;
    goto LABEL_18;
  }
  v23.receiver = self;
  v23.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  v17 = [(SMMessage *)&v23 initWithDate:v12 messageID:v13 sessionID:v14];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_estimatedEndTime, a6);
    objc_storeStrong(p_isa + 6, a7);
  }
  self = p_isa;
  v19 = self;
LABEL_18:

  return v19;
}

- (SMEstimatedEndTimeUpdateMessage)initWithDictionary:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", buf, 2u);
    }
    goto LABEL_15;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_15:
      v34 = 0;
      goto LABEL_16;
    }
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v57 = v29;
    __int16 v58 = 2112;
    v59 = v30;
    __int16 v60 = 1024;
    int v61 = [(id)objc_opt_class() messageType];
    __int16 v62 = 1024;
    int v63 = v8;
    v31 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v32 = v12;
    uint32_t v33 = 34;
LABEL_30:
    _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

    goto LABEL_15;
  }
  id v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    v37 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v37);
    v30 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v57 = v29;
    __int16 v58 = 2112;
    v59 = v30;
    __int16 v60 = 1024;
    int v61 = v10;
    v31 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v32 = v12;
    uint32_t v33 = 28;
    goto LABEL_30;
  }
  id v11 = [v6 valueForKey:@"sendDate"];
  id v12 = v11;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    id v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    id v16 = [v6 valueForKey:@"messageID"];
    v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      v19 = [v6 valueForKey:@"sessionID"];
      __int16 v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        __int16 v21 = [v6 valueForKey:@"estimatedEndTime"];
        __int16 v22 = v21;
        if (v21)
        {
          objc_super v23 = (void *)MEMORY[0x263EFF910];
          [v21 doubleValue];
          uint64_t v55 = objc_msgSend(v23, "dateWithTimeIntervalSince1970:");
          v24 = [v6 valueForKey:@"coarseEstimatedEndTime"];
          v25 = v24;
          if (v24)
          {
            v26 = (void *)MEMORY[0x263EFF910];
            [v24 doubleValue];
            v27 = objc_msgSend(v26, "dateWithTimeIntervalSince1970:");
          }
          else
          {
            v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v52 = (objc_class *)objc_opt_class();
              v54 = NSStringFromClass(v52);
              v53 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v57 = v54;
              __int16 v58 = 2112;
              v59 = v53;
              _os_log_error_impl(&dword_25B6E0000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTime", buf, 0x16u);
            }
            v27 = 0;
          }
          v36 = v55;
          self = -[SMEstimatedEndTimeUpdateMessage initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:](self, "initWithDate:messageID:sessionID:estimatedEndTime:coarseEstimatedEndTime:", v14, v17, v20, v55, v27, v54);

          v34 = self;
        }
        else
        {
          v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v50 = v49 = v36;
            v51 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v57 = v50;
            __int16 v58 = 2112;
            v59 = v51;
            _os_log_error_impl(&dword_25B6E0000, v49, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", buf, 0x16u);

            v36 = v49;
          }
          v34 = 0;
        }
      }
      else
      {
        __int16 v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          v47 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v57 = v46;
          __int16 v58 = 2112;
          v59 = v47;
          _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
        }
        v34 = 0;
      }
    }
    else
    {
      __int16 v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        v44 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v57 = v43;
        __int16 v58 = 2112;
        v59 = v44;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
      }
      v34 = 0;
    }
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      v41 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v57 = v40;
      __int16 v58 = 2112;
      v59 = v41;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v34 = 0;
  }

LABEL_16:
  return v34;
}

- (id)outputToDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  v3 = [(SMMessage *)&v12 outputToDictionary];
  v4 = NSNumber;
  id v5 = [(SMEstimatedEndTimeUpdateMessage *)self estimatedEndTime];
  [v5 timeIntervalSince1970];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v6 forKey:@"estimatedEndTime"];

  v7 = [(SMEstimatedEndTimeUpdateMessage *)self coarseEstimatedEndTime];

  if (v7)
  {
    int v8 = NSNumber;
    id v9 = [(SMEstimatedEndTimeUpdateMessage *)self coarseEstimatedEndTime];
    [v9 timeIntervalSince1970];
    int v10 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v10 forKey:@"coarseEstimatedEndTime"];
  }
  return v3;
}

+ (unint64_t)messageType
{
  return 10;
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
      int v10 = "-[SMEstimatedEndTimeUpdateMessage encodeWithCoder:]";
      __int16 v11 = 1024;
      int v12 = 156;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SMEstimatedEndTimeUpdateMessage;
  [(SMMessage *)&v8 encodeWithCoder:v4];
  v6 = [(SMEstimatedEndTimeUpdateMessage *)self estimatedEndTime];
  [v4 encodeObject:v6 forKey:@"estimatedEndTime"];

  v7 = [(SMEstimatedEndTimeUpdateMessage *)self coarseEstimatedEndTime];
  [v4 encodeObject:v7 forKey:@"coarseEstimatedEndTime"];
}

- (SMEstimatedEndTimeUpdateMessage)initWithCoder:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    id v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    id v18 = NSStringFromSelector(a2);
    int v38 = 138413058;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    __int16 v42 = 1024;
    int v43 = [(id)objc_opt_class() messageType];
    __int16 v44 = 1024;
    int v45 = v7;
    v19 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    __int16 v20 = v9;
    uint32_t v21 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v38, v21);

    goto LABEL_14;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v9)
    {
      int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        v31 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v30;
        __int16 v40 = 2112;
        v41 = v31;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v38, 0x16u);
      }
      id v15 = 0;
      goto LABEL_30;
    }
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (!v10)
    {
      __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v32 = (objc_class *)objc_opt_class();
        uint32_t v33 = NSStringFromClass(v32);
        v34 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v33;
        __int16 v40 = 2112;
        v41 = v34;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v38, 0x16u);
      }
      id v15 = 0;
      goto LABEL_29;
    }
    __int16 v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    if (v11)
    {
      uint64_t v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedEndTime"];
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"coarseEstimatedEndTime"];
        self = [(SMEstimatedEndTimeUpdateMessage *)self initWithDate:v9 messageID:v10 sessionID:v11 estimatedEndTime:v13 coarseEstimatedEndTime:v14];

        id v15 = self;
LABEL_28:

LABEL_29:
LABEL_30:

        goto LABEL_15;
      }
      v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        v37 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v36;
        __int16 v40 = 2112;
        v41 = v37;
        _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", (uint8_t *)&v38, 0x16u);
      }
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = NSStringFromSelector(a2);
        int v38 = 138412546;
        v39 = v25;
        __int16 v40 = 2112;
        v41 = v26;
        _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v38, 0x16u);
      }
    }
    id v15 = 0;
    goto LABEL_28;
  }
  int v22 = v8;
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v28 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v28);
    id v18 = NSStringFromSelector(a2);
    int v38 = 138412802;
    v39 = v17;
    __int16 v40 = 2112;
    v41 = v18;
    __int16 v42 = 1024;
    int v43 = v22;
    v19 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    __int16 v20 = v9;
    uint32_t v21 = 28;
    goto LABEL_32;
  }
LABEL_14:
  id v15 = 0;
LABEL_15:

  return v15;
}

- (NSDate)estimatedEndTime
{
  return self->_estimatedEndTime;
}

- (NSDate)coarseEstimatedEndTime
{
  return self->_coarseEstimatedEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coarseEstimatedEndTime, 0);
  objc_storeStrong((id *)&self->_estimatedEndTime, 0);
}

@end