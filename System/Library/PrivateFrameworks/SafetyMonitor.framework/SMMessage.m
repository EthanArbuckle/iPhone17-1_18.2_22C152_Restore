@interface SMMessage
+ (BOOL)supportsSecureCoding;
+ (id)createMessageFromDict:(id)a3;
+ (id)createMessageFromURL:(id)a3;
+ (id)messageIDFromDict:(id)a3;
+ (id)messageIDFromURL:(id)a3;
+ (id)sessionIDFromDict:(id)a3;
+ (id)sessionIDFromURL:(id)a3;
+ (unint64_t)interfaceTypeFromMessageType:(unint64_t)a3;
+ (unint64_t)messageType;
+ (unint64_t)messageTypeFromDict:(id)a3;
+ (unint64_t)messageTypeFromURL:(id)a3;
- (NSDate)date;
- (NSString)summaryText;
- (NSUUID)messageID;
- (NSUUID)sessionID;
- (SMMessage)initWithCoder:(id)a3;
- (SMMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5;
- (SMMessage)initWithDictionary:(id)a3;
- (SMMessage)initWithSessionID:(id)a3;
- (SMMessage)initWithURL:(id)a3;
- (id)description;
- (id)outputToDictionary;
- (id)outputToURLComponents;
- (int64_t)interfaceVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation SMMessage

- (SMMessage)initWithSessionID:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  v6 = [v4 now];
  v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [(SMMessage *)self initWithDate:v6 messageID:v7 sessionID:v5];

  return v8;
}

- (SMMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v9)
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
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v11)
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
  v19.super_class = (Class)SMMessage;
  v13 = [(SMMessage *)&v19 init];
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    v13->_interfaceVersion = 1;
    objc_storeStrong((id *)&v13->_date, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }
  self = p_isa;
  v15 = self;
LABEL_15:

  return v15;
}

- (SMMessage)initWithDictionary:(id)a3
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
    id v11 = [v6 valueForKey:@"sendDate"];
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
    v16 = [v6 valueForKey:@"messageID"];
    v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      objc_super v19 = [v6 valueForKey:@"sessionID"];
      v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        self = [(SMMessage *)self initWithDate:v14 messageID:v17 sessionID:v20];
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
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "messageType"));
  [v3 setObject:v4 forKey:@"messageType"];

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMMessage interfaceVersion](self, "interfaceVersion"));
  [v3 setObject:v5 forKey:@"interfaceVersion"];

  v6 = NSNumber;
  v7 = [(SMMessage *)self date];
  [v7 timeIntervalSince1970];
  int v8 = objc_msgSend(v6, "numberWithDouble:");
  [v3 setObject:v8 forKey:@"sendDate"];

  id v9 = [(SMMessage *)self messageID];
  int v10 = [v9 UUIDString];
  [v3 setObject:v10 forKey:@"messageID"];

  id v11 = [(SMMessage *)self sessionID];
  v12 = [v11 UUIDString];
  [v3 setObject:v12 forKey:@"sessionID"];

  return v3;
}

- (SMMessage)initWithURL:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v37 = 0;
    goto LABEL_49;
  }
  v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = v4;
  if (!v4)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v45 = (objc_class *)objc_opt_class();
      __int16 v46 = NSStringFromClass(v45);
      int v47 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v77 = v46;
      __int16 v78 = 2112;
      v79 = v47;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);
    }
    v37 = 0;
    goto LABEL_48;
  }
  v6 = [v4 queryItems];
  v7 = v6;
  if (!v6)
  {
    v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v50 = (objc_class *)objc_opt_class();
      v51 = NSStringFromClass(v50);
      v52 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v77 = v51;
      __int16 v78 = 2112;
      v79 = v52;
      _os_log_error_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);
    }
    v37 = 0;
    goto LABEL_47;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  int v8 = (void *)[v6 countByEnumeratingWithState:&v72 objects:v84 count:16];
  if (!v8)
  {
    int v30 = [0 intValue];
    v29 = 0;
    v31 = 0;
    id v9 = 0;
    v32 = 0;
    goto LABEL_44;
  }
  v64 = v5;
  id v65 = v3;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  id v9 = 0;
  v68 = 0;
  v69 = 0;
  uint64_t v10 = *(void *)v73;
  do
  {
    id v11 = v7;
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v73 != v10) {
        objc_enumerationMutation(v11);
      }
      v13 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      v14 = objc_msgSend(v13, "value", v64, v65);
      if (v14)
      {
        id v15 = [v13 name];
        int v16 = [v15 isEqualToString:@"sendDate"];

        if (v16)
        {
          v17 = v9;
          id v9 = v14;
        }
        else
        {
          v21 = [v13 name];
          int v22 = [v21 isEqualToString:@"messageID"];

          if (v22)
          {
            v17 = v71;
            uint64_t v71 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
          }
          else
          {
            v23 = [v13 name];
            int v24 = [v23 isEqualToString:@"sessionID"];

            if (v24)
            {
              v17 = v70;
              uint64_t v70 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
            }
            else
            {
              v25 = [v13 name];
              int v26 = [v25 isEqualToString:@"messageType"];

              if (v26)
              {
                v17 = v69;
                v69 = v14;
              }
              else
              {
                uint32_t v27 = [v13 name];
                int v28 = [v27 isEqualToString:@"interfaceVersion"];

                if (!v28) {
                  goto LABEL_23;
                }
                v17 = v68;
                v68 = v14;
              }
            }
          }
        }
      }
      else
      {
        v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = (objc_class *)objc_opt_class();
          objc_super v19 = NSStringFromClass(v18);
          v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v77 = v19;
          __int16 v78 = 2112;
          v79 = v20;
          _os_log_error_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);
        }
      }

LABEL_23:
    }
    v7 = v11;
    int v8 = (void *)[v11 countByEnumeratingWithState:&v72 objects:v84 count:16];
  }
  while (v8);
  v29 = v69;
  int v30 = [v69 intValue];
  if (!v69)
  {
    id v5 = v64;
    id v3 = v65;
    v31 = v68;
    int v8 = (void *)v70;
    v32 = (void *)v71;
    goto LABEL_44;
  }
  id v5 = v64;
  id v3 = v65;
  v31 = v68;
  int v8 = (void *)v70;
  v32 = (void *)v71;
  if ([(id)objc_opt_class() messageType] != v30)
  {
LABEL_44:
    v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    uint64_t v48 = (objc_class *)objc_opt_class();
    NSStringFromClass(v48);
    int v40 = v70 = (uint64_t)v8;
    NSStringFromSelector(a2);
    v41 = uint64_t v71 = (uint64_t)v32;
    int v49 = [(id)objc_opt_class() messageType];
    *(_DWORD *)buf = 138413058;
    v77 = v40;
    __int16 v78 = 2112;
    v79 = v41;
    __int16 v80 = 1024;
    int v81 = v49;
    __int16 v82 = 1024;
    int v83 = v30;
    __int16 v42 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v43 = v36;
    uint32_t v44 = 34;
LABEL_53:
    _os_log_error_impl(&dword_25B6E0000, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);

    v32 = (void *)v71;
    int v8 = (void *)v70;
    goto LABEL_45;
  }
  int v33 = [v68 intValue];
  int v34 = v33;
  if (!v68 || v33 != 1)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    v39 = (objc_class *)objc_opt_class();
    int v40 = NSStringFromClass(v39);
    v41 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v77 = v40;
    __int16 v78 = 2112;
    v79 = v41;
    __int16 v80 = 1024;
    int v81 = v34;
    __int16 v42 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v43 = v36;
    uint32_t v44 = 28;
    goto LABEL_53;
  }
  if (v9)
  {
    v35 = (void *)MEMORY[0x263EFF910];
    [v9 doubleValue];
    v36 = objc_msgSend(v35, "dateWithTimeIntervalSince1970:");
    if (v71)
    {
      if (v70)
      {
        v37 = [(SMMessage *)self initWithDate:v36 messageID:v71 sessionID:v70];
        self = v37;
        goto LABEL_46;
      }
      v54 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v61 = (objc_class *)objc_opt_class();
        v62 = NSStringFromClass(v61);
        v63 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v77 = v62;
        __int16 v78 = 2112;
        v79 = v63;
        _os_log_error_impl(&dword_25B6E0000, v54, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

        v32 = (void *)v71;
      }

      int v8 = 0;
    }
    else
    {
      v53 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v58 = (objc_class *)objc_opt_class();
        v59 = NSStringFromClass(v58);
        v60 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v77 = v59;
        __int16 v78 = 2112;
        v79 = v60;
        _os_log_error_impl(&dword_25B6E0000, v53, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

        int v8 = (void *)v70;
      }

      v32 = 0;
    }
  }
  else
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v55 = (objc_class *)objc_opt_class();
      v56 = NSStringFromClass(v55);
      v57 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v77 = v56;
      __int16 v78 = 2112;
      v79 = v57;
      _os_log_error_impl(&dword_25B6E0000, v36, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);

      int v8 = (void *)v70;
    }
    id v9 = 0;
  }
LABEL_45:
  v37 = 0;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
  return v37;
}

- (id)outputToURLComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc(MEMORY[0x263F08BD0]);
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "messageType"));
  v7 = [v6 stringValue];
  int v8 = (void *)[v5 initWithName:@"messageType" value:v7];
  [v4 addObject:v8];

  id v9 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMMessage interfaceVersion](self, "interfaceVersion"));
  id v11 = [v10 stringValue];
  v12 = (void *)[v9 initWithName:@"interfaceVersion" value:v11];
  [v4 addObject:v12];

  v13 = NSNumber;
  v14 = [(SMMessage *)self date];
  [v14 timeIntervalSince1970];
  id v15 = objc_msgSend(v13, "numberWithDouble:");
  int v16 = [v15 stringValue];

  v17 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"sendDate" value:v16];
  [v4 addObject:v17];

  id v18 = objc_alloc(MEMORY[0x263F08BD0]);
  objc_super v19 = [(SMMessage *)self messageID];
  v20 = [v19 UUIDString];
  v21 = (void *)[v18 initWithName:@"messageID" value:v20];
  [v4 addObject:v21];

  id v22 = objc_alloc(MEMORY[0x263F08BD0]);
  v23 = [(SMMessage *)self sessionID];
  int v24 = [v23 UUIDString];
  v25 = (void *)[v22 initWithName:@"sessionID" value:v24];
  [v4 addObject:v25];

  [v3 setQueryItems:v4];
  return v3;
}

+ (id)createMessageFromDict:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    switch([(id)objc_opt_class() messageTypeFromDict:v4])
    {
      case 0:
        id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v8 = NSStringFromSelector(a2);
        int v87 = 138412546;
        v88 = v7;
        __int16 v89 = 2112;
        v90 = v8;
        id v9 = "#SafetyCache,%@,%@,SMMessageTypeUnknown";
        goto LABEL_70;
      case 1:
        v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          v14 = NSStringFromClass(v13);
          id v15 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v14;
          __int16 v89 = 2112;
          v90 = v15;
          _os_log_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStart", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionStartMessage;
        goto LABEL_65;
      case 2:
        int v49 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = (objc_class *)objc_opt_class();
          v51 = NSStringFromClass(v50);
          v52 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v51;
          __int16 v89 = 2112;
          v90 = v52;
          _os_log_impl(&dword_25B6E0000, v49, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEnd", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionEndMessage;
        goto LABEL_65;
      case 3:
        v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = (objc_class *)objc_opt_class();
          objc_super v19 = NSStringFromClass(v18);
          v20 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v19;
          __int16 v89 = 2112;
          v90 = v20;
          _os_log_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyRelease", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMKeyReleaseMessage;
        goto LABEL_65;
      case 6:
        v21 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          int v24 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v23;
          __int16 v89 = 2112;
          v90 = v24;
          _os_log_impl(&dword_25B6E0000, v21, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeCacheUpdated", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMCacheUpdatedMessage;
        goto LABEL_65;
      case 7:
        v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v26 = (objc_class *)objc_opt_class();
          uint32_t v27 = NSStringFromClass(v26);
          int v28 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v27;
          __int16 v89 = 2112;
          v90 = v28;
          _os_log_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSync", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionStateSyncMessage;
        goto LABEL_65;
      case 8:
        v53 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = (objc_class *)objc_opt_class();
          v55 = NSStringFromClass(v54);
          v56 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v55;
          __int16 v89 = 2112;
          v90 = v56;
          _os_log_impl(&dword_25B6E0000, v53, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeHandoff", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionHandoffMessage;
        goto LABEL_65;
      case 9:
        v57 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = (objc_class *)objc_opt_class();
          v59 = NSStringFromClass(v58);
          v60 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v59;
          __int16 v89 = 2112;
          v90 = v60;
          _os_log_impl(&dword_25B6E0000, v57, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeHandoffAck", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionHandoffAckMessage;
        goto LABEL_65;
      case 10:
        v61 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = (objc_class *)objc_opt_class();
          v63 = NSStringFromClass(v62);
          v64 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v63;
          __int16 v89 = 2112;
          v90 = v64;
          _os_log_impl(&dword_25B6E0000, v61, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMEstimatedEndTimeUpdateMessage", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMEstimatedEndTimeUpdateMessage;
        goto LABEL_65;
      case 11:
        id v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          v66 = (objc_class *)objc_opt_class();
          v67 = NSStringFromClass(v66);
          v68 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v67;
          __int16 v89 = 2112;
          v90 = v68;
          _os_log_impl(&dword_25B6E0000, v65, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMEmergencyContactsNotifiedSyncMessage", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMEmergencyContactsNotifiedSyncMessage;
        goto LABEL_65;
      case 12:
        v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          v32 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v31;
          __int16 v89 = 2112;
          v90 = v32;
          _os_log_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfoRequest", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionStartInfoRequestMessage;
        goto LABEL_65;
      case 13:
        int v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          int v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          v36 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v35;
          __int16 v89 = 2112;
          v90 = v36;
          _os_log_impl(&dword_25B6E0000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfo", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionStartInfoMessage;
        goto LABEL_65;
      case 14:
        v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          int v40 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v39;
          __int16 v89 = 2112;
          v90 = v40;
          _os_log_impl(&dword_25B6E0000, v37, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfoRequest", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMKeyReleaseInfoRequestMessage;
        goto LABEL_65;
      case 15:
        v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          __int16 v42 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v42);
          uint32_t v44 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v43;
          __int16 v89 = 2112;
          v90 = v44;
          _os_log_impl(&dword_25B6E0000, v41, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfo", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMKeyReleaseInfoMessage;
        goto LABEL_65;
      case 16:
        v69 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          uint64_t v70 = (objc_class *)objc_opt_class();
          uint64_t v71 = NSStringFromClass(v70);
          long long v72 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v71;
          __int16 v89 = 2112;
          v90 = v72;
          _os_log_impl(&dword_25B6E0000, v69, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeStateUpdateReq", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionStateUpdateReqMessage;
        goto LABEL_65;
      case 17:
        long long v73 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          long long v74 = (objc_class *)objc_opt_class();
          long long v75 = NSStringFromClass(v74);
          v76 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v75;
          __int16 v89 = 2112;
          v90 = v76;
          _os_log_impl(&dword_25B6E0000, v73, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEndRemoteControl", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionEndRemoteControlMessage;
        goto LABEL_65;
      case 18:
        v77 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
        {
          __int16 v78 = (objc_class *)objc_opt_class();
          v79 = NSStringFromClass(v78);
          __int16 v80 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v79;
          __int16 v89 = 2112;
          v90 = v80;
          _os_log_impl(&dword_25B6E0000, v77, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMSessionModifyConfigRemoteControlMessage", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMSessionModifyConfigRemoteControlMessage;
        goto LABEL_65;
      case 19:
        int v81 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          __int16 v82 = (objc_class *)objc_opt_class();
          int v83 = NSStringFromClass(v82);
          v84 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v83;
          __int16 v89 = 2112;
          v90 = v84;
          _os_log_impl(&dword_25B6E0000, v81, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMResponseToTriggerPromptRemoteControlMessage", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMResponseToTriggerPromptRemoteControlMessage;
        goto LABEL_65;
      case 20:
        int v45 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          __int16 v46 = (objc_class *)objc_opt_class();
          int v47 = NSStringFromClass(v46);
          uint64_t v48 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v47;
          __int16 v89 = 2112;
          v90 = v48;
          _os_log_impl(&dword_25B6E0000, v45, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMLowPowerModeWarningStateUpdateMessage", (uint8_t *)&v87, 0x16u);
        }
        int v16 = SMLowPowerModeWarningStateUpdateMessage;
LABEL_65:
        id v11 = (void *)[[v16 alloc] initWithDictionary:v4];
        goto LABEL_66;
      default:
        id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v86 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v86);
          int v8 = NSStringFromSelector(a2);
          int v87 = 138412546;
          v88 = v7;
          __int16 v89 = 2112;
          v90 = v8;
          id v9 = "#SafetyCache,%@,%@,unknown message type";
LABEL_70:
          _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v87, 0x16u);
        }
LABEL_40:

        goto LABEL_8;
    }
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v87) = 0;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", (uint8_t *)&v87, 2u);
  }

LABEL_8:
  id v11 = 0;
LABEL_66:

  return v11;
}

+ (id)createMessageFromURL:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    switch([(id)objc_opt_class() messageTypeFromURL:v4])
    {
      case 0:
        id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          goto LABEL_18;
        }
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        int v8 = NSStringFromSelector(a2);
        int v43 = 138412546;
        uint32_t v44 = v7;
        __int16 v45 = 2112;
        __int16 v46 = v8;
        id v9 = "#SafetyCache,%@,%@,SMMessageTypeUnknown";
        goto LABEL_37;
      case 1:
        id v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          v14 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v13;
          __int16 v45 = 2112;
          __int16 v46 = v14;
          _os_log_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStart", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMSessionStartMessage;
        goto LABEL_32;
      case 2:
        int v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (objc_class *)objc_opt_class();
          id v18 = NSStringFromClass(v17);
          objc_super v19 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v18;
          __int16 v45 = 2112;
          __int16 v46 = v19;
          _os_log_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionEnd", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMSessionEndMessage;
        goto LABEL_32;
      case 3:
        v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v21 = (objc_class *)objc_opt_class();
          id v22 = NSStringFromClass(v21);
          v23 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v22;
          __int16 v45 = 2112;
          __int16 v46 = v23;
          _os_log_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyRelease", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMKeyReleaseMessage;
        goto LABEL_32;
      case 6:
        v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v26 = (objc_class *)objc_opt_class();
          uint32_t v27 = NSStringFromClass(v26);
          int v28 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v27;
          __int16 v45 = 2112;
          __int16 v46 = v28;
          _os_log_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeCacheUpdated", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMCacheUpdatedMessage;
        goto LABEL_32;
      case 13:
        v29 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          v32 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v31;
          __int16 v45 = 2112;
          __int16 v46 = v32;
          _os_log_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeSessionStartInfo", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMSessionStartInfoMessage;
        goto LABEL_32;
      case 14:
        int v33 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          int v34 = (objc_class *)objc_opt_class();
          v35 = NSStringFromClass(v34);
          v36 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v35;
          __int16 v45 = 2112;
          __int16 v46 = v36;
          _os_log_impl(&dword_25B6E0000, v33, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfoRequest", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMKeyReleaseInfoRequestMessage;
        goto LABEL_32;
      case 15:
        v37 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          int v40 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v39;
          __int16 v45 = 2112;
          __int16 v46 = v40;
          _os_log_impl(&dword_25B6E0000, v37, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,constructing SMMessageTypeKeyReleaseInfo", (uint8_t *)&v43, 0x16u);
        }
        id v15 = SMKeyReleaseInfoMessage;
LABEL_32:
        int v24 = (void *)[[v15 alloc] initWithURL:v4];
        goto LABEL_33;
      default:
        id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          __int16 v42 = (objc_class *)objc_opt_class();
          v7 = NSStringFromClass(v42);
          int v8 = NSStringFromSelector(a2);
          int v43 = 138412546;
          uint32_t v44 = v7;
          __int16 v45 = 2112;
          __int16 v46 = v8;
          id v9 = "#SafetyCache,%@,%@,unknown message type";
LABEL_37:
          _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v43, 0x16u);
        }
LABEL_18:

        goto LABEL_19;
    }
  }
  uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v43) = 0;
    _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", (uint8_t *)&v43, 2u);
  }

LABEL_19:
  int v24 = 0;
LABEL_33:

  return v24;
}

+ (unint64_t)interfaceTypeFromMessageType:(unint64_t)a3
{
  if (a3 - 1 > 0x13) {
    return 0;
  }
  else {
    return qword_25B75E5A8[a3 - 1];
  }
}

+ (unint64_t)messageTypeFromDict:(id)a3
{
  if (a3)
  {
    id v3 = [a3 valueForKey:@"messageType"];
    unint64_t v4 = (int)[v3 intValue];
  }
  else
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v7, 2u);
    }

    return 0;
  }
  return v4;
}

+ (unint64_t)messageTypeFromURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v4 queryItems];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "name", (void)v16);
          int v12 = [v11 isEqualToString:@"messageType"];

          if (v12)
          {
            v14 = [v10 value];
            unint64_t v13 = (int)[v14 intValue];

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    unint64_t v13 = 0;
LABEL_12:
  }
  else
  {
    unint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    unint64_t v13 = 0;
  }

  return v13;
}

+ (id)messageIDFromDict:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F08C38]);
    id v5 = [v3 valueForKey:@"messageID"];
    uint64_t v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)messageIDFromURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v4 queryItems];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "name", (void)v17);
          int v12 = [v11 isEqualToString:@"messageID"];

          if (v12)
          {
            id v14 = objc_alloc(MEMORY[0x263F08C38]);
            id v15 = [v10 value];
            unint64_t v13 = (void *)[v14 initWithUUIDString:v15];

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    unint64_t v13 = 0;
LABEL_12:
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    unint64_t v13 = 0;
  }

  return v13;
}

+ (id)sessionIDFromDict:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F08C38]);
    id v5 = [v3 valueForKey:@"sessionID"];
    uint64_t v6 = (void *)[v4 initWithUUIDString:v5];
  }
  else
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dict", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

+ (id)sessionIDFromURL:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    id v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v4 queryItems];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "name", (void)v17);
          int v12 = [v11 isEqualToString:@"sessionID"];

          if (v12)
          {
            id v14 = objc_alloc(MEMORY[0x263F08C38]);
            id v15 = [v10 value];
            unint64_t v13 = (void *)[v14 initWithUUIDString:v15];

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    unint64_t v13 = 0;
LABEL_12:
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    unint64_t v13 = 0;
  }

  return v13;
}

+ (unint64_t)messageType
{
  return 0;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(SMMessage *)self outputToDictionary];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSString)summaryText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"CHECK_IN_MESSAGE" value:@"Check In" table:0];

  return (NSString *)v3;
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
      int v9 = 136315394;
      uint64_t v10 = "-[SMMessage encodeWithCoder:]";
      __int16 v11 = 1024;
      int v12 = 559;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", (uint8_t *)&v9, 0x12u);
    }
  }
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend((id)objc_opt_class(), "messageType"), @"messageType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMMessage interfaceVersion](self, "interfaceVersion"), @"interfaceVersion");
  uint64_t v6 = [(SMMessage *)self date];
  [v4 encodeObject:v6 forKey:@"sendDate"];

  uint64_t v7 = [(SMMessage *)self messageID];
  [v4 encodeObject:v7 forKey:@"messageID"];

  uint64_t v8 = [(SMMessage *)self sessionID];
  [v4 encodeObject:v8 forKey:@"sessionID"];
}

- (SMMessage)initWithCoder:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
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
    int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v14 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v14);
    long long v16 = NSStringFromSelector(a2);
    int v33 = 138413058;
    int v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 1024;
    int v38 = [(id)objc_opt_class() messageType];
    __int16 v39 = 1024;
    int v40 = v7;
    long long v17 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    long long v18 = v9;
    uint32_t v19 = 34;
LABEL_27:
    _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v33, v19);

    goto LABEL_13;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 == 1)
  {
    int v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
    if (!v9)
    {
      uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint32_t v27 = (objc_class *)objc_opt_class();
        int v28 = NSStringFromClass(v27);
        v29 = NSStringFromSelector(a2);
        int v33 = 138412546;
        int v34 = v28;
        __int16 v35 = 2112;
        v36 = v29;
        _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", (uint8_t *)&v33, 0x16u);
      }
      uint64_t v13 = 0;
      goto LABEL_25;
    }
    uint64_t v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (v10)
    {
      uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        int v12 = v11;
        self = [(SMMessage *)self initWithDate:v9 messageID:v10 sessionID:v11];
        uint64_t v13 = self;
LABEL_24:

LABEL_25:
        goto LABEL_14;
      }
      v25 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = NSStringFromSelector(a2);
        int v33 = 138412546;
        int v34 = v31;
        __int16 v35 = 2112;
        v36 = v32;
        _os_log_error_impl(&dword_25B6E0000, v25, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", (uint8_t *)&v33, 0x16u);
      }
      int v12 = 0;
    }
    else
    {
      int v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        int v24 = NSStringFromSelector(a2);
        int v33 = 138412546;
        int v34 = v23;
        __int16 v35 = 2112;
        v36 = v24;
        _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", (uint8_t *)&v33, 0x16u);
      }
    }
    uint64_t v13 = 0;
    goto LABEL_24;
  }
  int v20 = v8;
  int v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v26 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v26);
    long long v16 = NSStringFromSelector(a2);
    int v33 = 138412802;
    int v34 = v15;
    __int16 v35 = 2112;
    v36 = v16;
    __int16 v37 = 1024;
    int v38 = v20;
    long long v17 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    long long v18 = v9;
    uint32_t v19 = 28;
    goto LABEL_27;
  }
LABEL_13:
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

- (int64_t)interfaceVersion
{
  return self->_interfaceVersion;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSUUID)messageID
{
  return self->_messageID;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end