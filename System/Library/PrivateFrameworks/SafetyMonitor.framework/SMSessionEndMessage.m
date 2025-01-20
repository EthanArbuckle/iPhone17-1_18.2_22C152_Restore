@interface SMSessionEndMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
+ (unint64_t)sessionEndReasonFromDict:(id)a3;
+ (unint64_t)sessionEndReasonFromURL:(id)a3;
- (NSData)destinationMapItem;
- (SMSessionEndMessage)initWithCoder:(id)a3;
- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6;
- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8;
- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9;
- (SMSessionEndMessage)initWithDictionary:(id)a3;
- (SMSessionEndMessage)initWithSessionID:(id)a3 sessionEndReason:(unint64_t)a4 sessionType:(unint64_t)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7;
- (SMSessionEndMessage)initWithURL:(id)a3;
- (id)outputToDictionary;
- (id)outputToURLComponents;
- (id)summaryText;
- (unint64_t)destinationType;
- (unint64_t)sessionEndReason;
- (unint64_t)sessionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionEndMessage

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6
{
  return [(SMSessionEndMessage *)self initWithDate:a3 messageID:a4 sessionID:a5 sessionEndReason:a6 sessionType:0 destinationType:0 destinationMapItem:0];
}

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8
{
  return [(SMSessionEndMessage *)self initWithDate:a3 messageID:a4 sessionID:a5 sessionEndReason:a6 sessionType:0 destinationType:0 destinationMapItem:0];
}

- (SMSessionEndMessage)initWithSessionID:(id)a3 sessionEndReason:(unint64_t)a4 sessionType:(unint64_t)a5 destinationType:(unint64_t)a6 destinationMapItem:(id)a7
{
  v12 = (void *)MEMORY[0x263EFF910];
  id v13 = a7;
  id v14 = a3;
  v15 = [v12 now];
  v16 = [MEMORY[0x263F08C38] UUID];
  v17 = [(SMSessionEndMessage *)self initWithDate:v15 messageID:v16 sessionID:v14 sessionEndReason:a4 sessionType:a5 destinationType:a6 destinationMapItem:v13];

  return v17;
}

- (SMSessionEndMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 sessionEndReason:(unint64_t)a6 sessionType:(unint64_t)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  if (!v15)
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
  if (!v16)
  {
    v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: messageID";
    goto LABEL_13;
  }
  if (!v17)
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
  v25.super_class = (Class)SMSessionEndMessage;
  v19 = [(SMMessage *)&v25 initWithDate:v15 messageID:v16 sessionID:v17];
  v20 = v19;
  if (v19)
  {
    v19->_sessionEndReason = a6;
    v19->_sessionType = a7;
    v19->_destinationType = a8;
    objc_storeStrong((id *)&v19->_destinationMapItem, a9);
  }
  self = v20;
  v21 = self;
LABEL_15:

  return v21;
}

- (SMSessionEndMessage)initWithDictionary:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
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
    goto LABEL_17;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      v36 = 0;
      goto LABEL_18;
    }
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v67 = v31;
    __int16 v68 = 2112;
    v69 = v32;
    __int16 v70 = 1024;
    int v71 = [(id)objc_opt_class() messageType];
    __int16 v72 = 1024;
    int v73 = v8;
    v33 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v34 = v12;
    uint32_t v35 = 34;
LABEL_32:
    _os_log_error_impl(&dword_25B6E0000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_17;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    v39 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v39);
    v32 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v67 = v31;
    __int16 v68 = 2112;
    v69 = v32;
    __int16 v70 = 1024;
    int v71 = v10;
    v33 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v34 = v12;
    uint32_t v35 = 28;
    goto LABEL_32;
  }
  v11 = [v6 valueForKey:@"sendDate"];
  v12 = v11;
  if (v11)
  {
    id v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    id v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    id v16 = [v6 valueForKey:@"messageID"];
    id v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      v19 = [v6 valueForKey:@"sessionID"];
      v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        v21 = [v6 valueForKey:@"sessionEndReason"];
        v22 = v21;
        if (v21)
        {
          int v23 = [v21 intValue];
          v24 = [v6 valueForKey:@"sessionType"];
          v65 = v24;
          if (v24)
          {
            v64 = v22;
            int v25 = [v24 intValue];
            v26 = [v6 valueForKey:@"sessionDestinationType"];
            if (v26)
            {
              v27 = v26;
              uint64_t v62 = v25;
              uint64_t v63 = v23;
              uint64_t v61 = (int)[v26 intValue];
              v28 = [v6 valueForKey:@"sessionDestinationMapItem"];
              if (v28) {
                v29 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v28 options:0];
              }
              else {
                v29 = 0;
              }
              v22 = v64;
              self = [(SMSessionEndMessage *)self initWithDate:v14 messageID:v17 sessionID:v20 sessionEndReason:v63 sessionType:v62 destinationType:v61 destinationMapItem:v29];

              v36 = self;
            }
            else
            {
              v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                v58 = (objc_class *)objc_opt_class();
                v59 = NSStringFromClass(v58);
                v60 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v67 = v59;
                __int16 v68 = 2112;
                v69 = v60;
                _os_log_error_impl(&dword_25B6E0000, v40, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);
              }
              v27 = 0;
              v36 = 0;
              v22 = v64;
            }
          }
          else
          {
            v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              v54 = (objc_class *)objc_opt_class();
              NSStringFromClass(v54);
              v56 = v55 = v22;
              v57 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v67 = v56;
              __int16 v68 = 2112;
              v69 = v57;
              _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

              v22 = v55;
            }
            v36 = 0;
          }

          v38 = v65;
        }
        else
        {
          v38 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v51 = (objc_class *)objc_opt_class();
            v52 = NSStringFromClass(v51);
            v53 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v67 = v52;
            __int16 v68 = 2112;
            v69 = v53;
            _os_log_error_impl(&dword_25B6E0000, v38, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionEndReason", buf, 0x16u);

            v22 = 0;
          }
          v36 = 0;
        }
      }
      else
      {
        v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v49 = v48 = v22;
          v50 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v67 = v49;
          __int16 v68 = 2112;
          v69 = v50;
          _os_log_error_impl(&dword_25B6E0000, v48, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);

          v22 = v48;
        }
        v36 = 0;
      }
    }
    else
    {
      v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v44 = (objc_class *)objc_opt_class();
        v45 = NSStringFromClass(v44);
        v46 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v67 = v45;
        __int16 v68 = 2112;
        v69 = v46;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
      }
      v36 = 0;
    }
  }
  else
  {
    id v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      v43 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v67 = v42;
      __int16 v68 = 2112;
      v69 = v43;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v36 = 0;
  }

LABEL_18:
  return v36;
}

- (id)outputToDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)SMSessionEndMessage;
  v3 = [(SMMessage *)&v11 outputToDictionary];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  [v3 setObject:v4 forKey:@"sessionEndReason"];

  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  [v3 setObject:v5 forKey:@"sessionType"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  [v3 setObject:v6 forKey:@"sessionDestinationType"];

  v7 = [(SMSessionEndMessage *)self destinationMapItem];

  if (v7)
  {
    int v8 = [(SMSessionEndMessage *)self destinationMapItem];
    v9 = [v8 base64EncodedStringWithOptions:0];
    [v3 setObject:v9 forKey:@"sessionDestinationMapItem"];
  }
  return v3;
}

- (SMSessionEndMessage)initWithURL:(id)a3
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v48 = 0;
    goto LABEL_63;
  }
  v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = v4;
  if (!v4)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v57 = (objc_class *)objc_opt_class();
      v58 = NSStringFromClass(v57);
      v59 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v97 = v58;
      __int16 v98 = 2112;
      v99 = v59;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);
    }
    v48 = 0;
    goto LABEL_62;
  }
  v6 = [v4 queryItems];
  v7 = v6;
  if (!v6)
  {
    v36 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      uint64_t v62 = (objc_class *)objc_opt_class();
      uint64_t v63 = NSStringFromClass(v62);
      v64 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v97 = v63;
      __int16 v98 = 2112;
      v99 = v64;
      _os_log_error_impl(&dword_25B6E0000, v36, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);
    }
    v48 = 0;
    goto LABEL_61;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  int v8 = [v6 countByEnumeratingWithState:&v92 objects:v104 count:16];
  if (!v8)
  {
    int v37 = [0 intValue];
    v36 = 0;
    v91 = 0;
    v47 = 0;
    v49 = 0;
    v82 = 0;
    v81 = 0;
    v80 = 0;
    v79 = 0;
    goto LABEL_58;
  }
  v77 = v5;
  id v78 = v3;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  uint64_t v89 = 0;
  uint64_t v90 = 0;
  v91 = 0;
  v85 = 0;
  v87 = 0;
  uint64_t v9 = *(void *)v93;
  do
  {
    int v10 = v7;
    for (i = 0; i != v8; i = ((char *)i + 1))
    {
      if (*(void *)v93 != v9) {
        objc_enumerationMutation(v10);
      }
      v12 = *(void **)(*((void *)&v92 + 1) + 8 * i);
      id v13 = [v12 value];
      if (v13)
      {
        id v14 = [v12 name];
        int v15 = [v14 isEqualToString:@"sendDate"];

        if (v15)
        {
          id v16 = v91;
          v91 = v13;
        }
        else
        {
          v20 = [v12 name];
          int v21 = [v20 isEqualToString:@"messageID"];

          if (v21)
          {
            id v16 = v90;
            uint64_t v90 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
          }
          else
          {
            v22 = [v12 name];
            int v23 = [v22 isEqualToString:@"sessionID"];

            if (v23)
            {
              id v16 = v89;
              uint64_t v89 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
            }
            else
            {
              v24 = [v12 name];
              int v25 = [v24 isEqualToString:@"messageType"];

              if (v25)
              {
                id v16 = v87;
                v87 = v13;
              }
              else
              {
                v26 = [v12 name];
                int v27 = [v26 isEqualToString:@"interfaceVersion"];

                if (v27)
                {
                  id v16 = v85;
                  v85 = v13;
                }
                else
                {
                  v28 = [v12 name];
                  int v29 = [v28 isEqualToString:@"sessionEndReason"];

                  if (v29)
                  {
                    id v16 = v82;
                    v82 = v13;
                  }
                  else
                  {
                    v30 = [v12 name];
                    int v31 = [v30 isEqualToString:@"sessionType"];

                    if (v31)
                    {
                      id v16 = v81;
                      v81 = v13;
                    }
                    else
                    {
                      v32 = [v12 name];
                      int v33 = [v32 isEqualToString:@"sessionDestinationType"];

                      if (v33)
                      {
                        id v16 = v80;
                        v80 = v13;
                      }
                      else
                      {
                        v34 = [v12 name];
                        int v35 = [v34 isEqualToString:@"sessionDestinationMapItem"];

                        if (!v35) {
                          goto LABEL_31;
                        }
                        id v16 = v79;
                        v79 = v13;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        id v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          id v17 = (objc_class *)objc_opt_class();
          id v18 = NSStringFromClass(v17);
          v19 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v97 = v18;
          __int16 v98 = 2112;
          v99 = v19;
          _os_log_error_impl(&dword_25B6E0000, v16, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);
        }
      }

LABEL_31:
    }
    v7 = v10;
    int v8 = [v10 countByEnumeratingWithState:&v92 objects:v104 count:16];
  }
  while (v8);
  v36 = v87;
  int v37 = [v87 intValue];
  if (!v87)
  {
    id v5 = v77;
    id v3 = v78;
    int v8 = v85;
    goto LABEL_57;
  }
  id v5 = v77;
  id v3 = v78;
  int v8 = v85;
  if ([(id)objc_opt_class() messageType] != v37)
  {
LABEL_57:
    v49 = (void *)v89;
    v47 = (void *)v90;
LABEL_58:
    v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v60 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v60);
      NSStringFromSelector(a2);
      v53 = os_log_t log = v41;
      int v61 = [(id)objc_opt_class() messageType];
      *(_DWORD *)buf = 138413058;
      v97 = v52;
      __int16 v98 = 2112;
      v99 = v53;
      __int16 v100 = 1024;
      int v101 = v61;
      __int16 v102 = 1024;
      int v103 = v37;
      v54 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
      v55 = log;
      uint32_t v56 = 34;
      goto LABEL_67;
    }
LABEL_59:
    v48 = 0;
    goto LABEL_60;
  }
  int v38 = [v85 intValue];
  int v39 = v38;
  if (!v85 || v38 != 1)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    v49 = (void *)v89;
    v47 = (void *)v90;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      NSStringFromSelector(a2);
      v53 = os_log_t log = v41;
      *(_DWORD *)buf = 138412802;
      v97 = v52;
      __int16 v98 = 2112;
      v99 = v53;
      __int16 v100 = 1024;
      int v101 = v39;
      v54 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
      v55 = log;
      uint32_t v56 = 28;
LABEL_67:
      _os_log_error_impl(&dword_25B6E0000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);

      v41 = log;
      goto LABEL_59;
    }
    goto LABEL_59;
  }
  if (!v91)
  {
    v41 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      uint64_t v74 = (objc_class *)objc_opt_class();
      v75 = NSStringFromClass(v74);
      v76 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v97 = v75;
      __int16 v98 = 2112;
      v99 = v76;
      _os_log_error_impl(&dword_25B6E0000, v41, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v91 = 0;
    v48 = 0;
    v49 = (void *)v89;
    v47 = (void *)v90;
    goto LABEL_60;
  }
  v40 = (void *)MEMORY[0x263EFF910];
  [v91 doubleValue];
  v41 = objc_msgSend(v40, "dateWithTimeIntervalSince1970:");
  if (!v90)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_82;
    }
    v65 = (objc_class *)objc_opt_class();
    v66 = NSStringFromClass(v65);
    NSStringFromSelector(a2);
    __int16 v68 = v67 = v41;
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    __int16 v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing messageID";
LABEL_81:
    _os_log_error_impl(&dword_25B6E0000, v46, OS_LOG_TYPE_ERROR, v69, buf, 0x16u);

    v41 = v67;
    goto LABEL_82;
  }
  if (!v89)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_82;
    }
    __int16 v70 = (objc_class *)objc_opt_class();
    v66 = NSStringFromClass(v70);
    NSStringFromSelector(a2);
    __int16 v68 = v67 = v41;
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    __int16 v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionID";
    goto LABEL_81;
  }
  if (!v82)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_82;
    }
    int v71 = (objc_class *)objc_opt_class();
    v66 = NSStringFromClass(v71);
    NSStringFromSelector(a2);
    __int16 v68 = v67 = v41;
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    __int16 v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionEndReason";
    goto LABEL_81;
  }
  int v42 = [v82 intValue];
  if (!v81)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_82;
    }
    __int16 v72 = (objc_class *)objc_opt_class();
    v66 = NSStringFromClass(v72);
    NSStringFromSelector(a2);
    __int16 v68 = v67 = v41;
    *(_DWORD *)buf = 138412546;
    v97 = v66;
    __int16 v98 = 2112;
    v99 = v68;
    v69 = "#SafetyCache,%@,%@,missing sessionType";
    goto LABEL_81;
  }
  int v43 = [v81 intValue];
  if (!v80)
  {
    v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      int v73 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v73);
      NSStringFromSelector(a2);
      __int16 v68 = v67 = v41;
      *(_DWORD *)buf = 138412546;
      v97 = v66;
      __int16 v98 = 2112;
      v99 = v68;
      v69 = "#SafetyCache,%@,%@,missing destinationType";
      goto LABEL_81;
    }
LABEL_82:
    v48 = 0;
    v49 = (void *)v89;
    v47 = (void *)v90;
    goto LABEL_83;
  }
  uint64_t v86 = v42;
  uint64_t v44 = v43;
  uint64_t v45 = (int)[v80 intValue];
  v46 = v79;
  if (v79) {
    v46 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v79 options:0];
  }
  v47 = (void *)v90;
  v48 = [(SMSessionEndMessage *)self initWithDate:v41 messageID:v90 sessionID:v89 sessionEndReason:v86 sessionType:v44 destinationType:v45 destinationMapItem:v46];
  self = v48;
  v7 = v10;
  v49 = (void *)v89;
LABEL_83:

LABEL_60:
LABEL_61:

LABEL_62:
LABEL_63:

  return v48;
}

- (id)outputToURLComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v25.receiver = self;
  v25.super_class = (Class)SMSessionEndMessage;
  id v5 = [(SMMessage *)&v25 outputToURLComponents];
  v6 = [v5 queryItems];
  [v4 addObjectsFromArray:v6];

  id v7 = objc_alloc(MEMORY[0x263F08BD0]);
  int v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  uint64_t v9 = [v8 stringValue];
  int v10 = (void *)[v7 initWithName:@"sessionEndReason" value:v9];
  [v4 addObject:v10];

  id v11 = objc_alloc(MEMORY[0x263F08BD0]);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  id v13 = [v12 stringValue];
  id v14 = (void *)[v11 initWithName:@"sessionType" value:v13];
  [v4 addObject:v14];

  id v15 = objc_alloc(MEMORY[0x263F08BD0]);
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  id v17 = [v16 stringValue];
  id v18 = (void *)[v15 initWithName:@"sessionDestinationType" value:v17];
  [v4 addObject:v18];

  v19 = [(SMSessionEndMessage *)self destinationMapItem];

  if (v19)
  {
    id v20 = objc_alloc(MEMORY[0x263F08BD0]);
    int v21 = [(SMSessionEndMessage *)self destinationMapItem];
    v22 = [v21 base64EncodedStringWithOptions:0];
    int v23 = (void *)[v20 initWithName:@"sessionDestinationMapItem" value:v22];
    [v4 addObject:v23];
  }
  [v3 setQueryItems:v4];

  return v3;
}

+ (unint64_t)messageType
{
  return 2;
}

+ (unint64_t)sessionEndReasonFromDict:(id)a3
{
  id v3 = [a3 valueForKey:@"sessionEndReason"];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

+ (unint64_t)sessionEndReasonFromURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
    [v4 queryItems];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "name", (void)v16);
          int v12 = [v11 isEqualToString:@"sessionEndReason"];

          if (v12)
          {
            id v14 = [v10 value];
            unint64_t v13 = (int)[v14 intValue];

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
    unint64_t v13 = 0;
  }

  return v13;
}

- (id)summaryText
{
  unint64_t v3 = [(SMSessionEndMessage *)self sessionEndReason];
  if (v3 == 8)
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = v5;
    uint64_t v7 = @"END_MESSAGE_WORKOUT_ENDED_SUMMARY";
    uint64_t v8 = @"Check In: Workout Ended";
  }
  else if (v3 == 1)
  {
    unint64_t v4 = [(SMSessionEndMessage *)self destinationType];
    switch(v4)
    {
      case 3uLL:
        id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v6 = v5;
        uint64_t v7 = @"END_MESSAGE_SAFE_ARRIVAL_SCHOOL_SUMMARY";
        uint64_t v8 = @"Check In: Arrived at school";
        break;
      case 2uLL:
        id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v6 = v5;
        uint64_t v7 = @"END_MESSAGE_SAFE_ARRIVAL_WORK_SUMMARY";
        uint64_t v8 = @"Check In: Arrived at work";
        break;
      case 1uLL:
        id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v6 = v5;
        uint64_t v7 = @"END_MESSAGE_SAFE_ARRIVAL_HOME_SUMMARY";
        uint64_t v8 = @"Check In: Arrived at home";
        break;
      default:
        id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v6 = v5;
        uint64_t v7 = @"END_MESSAGE_SAFE_ARRIVAL_DEFAULT_DESTINATION_SUMMARY";
        uint64_t v8 = @"Check In: Arrived at destination";
        break;
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v6 = v5;
    uint64_t v7 = @"END_MESSAGE_DEFAULT_SUMMARY";
    uint64_t v8 = @"Check In: Ended";
  }
  uint64_t v9 = [v5 localizedStringForKey:v7 value:v8 table:0];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v13 = "-[SMSessionEndMessage encodeWithCoder:]";
      __int16 v14 = 1024;
      int v15 = 396;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SMSessionEndMessage;
  [(SMMessage *)&v11 encodeWithCoder:v4];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionEndReason](self, "sessionEndReason"));
  [v4 encodeObject:v6 forKey:@"sessionEndReason"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage sessionType](self, "sessionType"));
  [v4 encodeObject:v7 forKey:@"sessionType"];

  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionEndMessage destinationType](self, "destinationType"));
  [v4 encodeObject:v8 forKey:@"sessionDestinationType"];

  uint64_t v9 = [(SMSessionEndMessage *)self destinationMapItem];

  if (v9)
  {
    int v10 = [(SMSessionEndMessage *)self destinationMapItem];
    [v4 encodeObject:v10 forKey:@"sessionDestinationMapItem"];
  }
}

- (SMSessionEndMessage)initWithCoder:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", buf, 2u);
    }
    goto LABEL_16;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v22 = 0;
      goto LABEL_17;
    }
    int v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    objc_super v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v55 = v24;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 1024;
    int v59 = [(id)objc_opt_class() messageType];
    __int16 v60 = 1024;
    int v61 = v7;
    v26 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    int v27 = v9;
    uint32_t v28 = 34;
LABEL_31:
    _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);

    goto LABEL_16;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 != 1)
  {
    int v29 = v8;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v31 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v31);
    objc_super v25 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v55 = v24;
    __int16 v56 = 2112;
    v57 = v25;
    __int16 v58 = 1024;
    int v59 = v29;
    v26 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    int v27 = v9;
    uint32_t v28 = 28;
    goto LABEL_31;
  }
  uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
  if (v9)
  {
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (v10)
    {
      objc_super v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        int v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionEndReason"];
        unint64_t v13 = v12;
        if (v12)
        {
          int v14 = [v12 intValue];
          int v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionType"];
          uint64_t v16 = v15;
          if (v15)
          {
            v53 = v15;
            int v17 = [v15 intValue];
            long long v18 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionDestinationType"];
            if (v18)
            {
              long long v19 = v18;
              uint64_t v52 = v14;
              uint64_t v20 = (int)[v18 intValue];
              uint64_t v21 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionDestinationMapItem"];
              self = [(SMSessionEndMessage *)self initWithDate:v9 messageID:v10 sessionID:v11 sessionEndReason:v52 sessionType:v17 destinationType:v20 destinationMapItem:v21];

              v22 = self;
            }
            else
            {
              v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                v49 = (objc_class *)objc_opt_class();
                v50 = NSStringFromClass(v49);
                v51 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v55 = v50;
                __int16 v56 = 2112;
                v57 = v51;
                _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);
              }
              long long v19 = 0;
              v22 = 0;
            }
            uint64_t v16 = v53;
          }
          else
          {
            long long v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v46 = (objc_class *)objc_opt_class();
              v47 = NSStringFromClass(v46);
              v48 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v55 = v47;
              __int16 v56 = 2112;
              v57 = v48;
              _os_log_error_impl(&dword_25B6E0000, v19, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

              uint64_t v16 = 0;
            }
            v22 = 0;
          }
        }
        else
        {
          uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v44 = int v43 = v16;
            uint64_t v45 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v55 = v44;
            __int16 v56 = 2112;
            v57 = v45;
            _os_log_error_impl(&dword_25B6E0000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionEndReason", buf, 0x16u);

            uint64_t v16 = v43;
          }
          v22 = 0;
        }
      }
      else
      {
        unint64_t v13 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v39 = (objc_class *)objc_opt_class();
          v40 = NSStringFromClass(v39);
          v41 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v55 = v40;
          __int16 v56 = 2112;
          v57 = v41;
          _os_log_error_impl(&dword_25B6E0000, v13, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
        }
        v22 = 0;
      }
    }
    else
    {
      objc_super v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v36 = (objc_class *)objc_opt_class();
        int v37 = NSStringFromClass(v36);
        int v38 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v55 = v37;
        __int16 v56 = 2112;
        v57 = v38;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
      }
      v22 = 0;
    }
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      int v35 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v55 = v34;
      __int16 v56 = 2112;
      v57 = v35;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v22 = 0;
  }

LABEL_17:
  return v22;
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (void).cxx_destruct
{
}

@end