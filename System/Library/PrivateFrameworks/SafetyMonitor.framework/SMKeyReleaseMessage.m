@interface SMKeyReleaseMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (BOOL)isSOSTrigger;
- (NSData)safetyCacheKey;
- (NSData)safetyCacheToken;
- (NSDate)triggerDate;
- (RTLocation)locationOfTrigger;
- (SMKeyReleaseMessage)initWithCoder:(id)a3;
- (SMKeyReleaseMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerDate:(id)a6 locationOfTrigger:(id)a7 triggerType:(unint64_t)a8 safetyCacheKey:(id)a9 safetyCacheToken:(id)a10 sessionType:(unint64_t)a11 destinationType:(unint64_t)a12 isSOSTrigger:(BOOL)a13 lowPowerModeWarningState:(int64_t)a14;
- (SMKeyReleaseMessage)initWithDictionary:(id)a3;
- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 isSOSTrigger:(BOOL)a11 lowPowerModeWarningState:(int64_t)a12;
- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 lowPowerModeWarningState:(int64_t)a11;
- (SMKeyReleaseMessage)initWithURL:(id)a3;
- (id)outputToDictionary;
- (id)outputToURLComponents;
- (id)summaryText;
- (int64_t)lowPowerModeWarningState;
- (unint64_t)destinationType;
- (unint64_t)sessionType;
- (unint64_t)triggerType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMKeyReleaseMessage

- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 lowPowerModeWarningState:(int64_t)a11
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = objc_opt_new();
  v21 = [MEMORY[0x263F08C38] UUID];
  LOBYTE(v24) = 0;
  v22 = [(SMKeyReleaseMessage *)self initWithDate:v20 messageID:v21 sessionID:v19 triggerDate:v18 locationOfTrigger:v17 triggerType:a6 safetyCacheKey:v16 safetyCacheToken:v15 sessionType:a9 destinationType:a10 isSOSTrigger:v24 lowPowerModeWarningState:a11];

  return v22;
}

- (SMKeyReleaseMessage)initWithSessionID:(id)a3 triggerDate:(id)a4 locationOfTrigger:(id)a5 triggerType:(unint64_t)a6 safetyCacheKey:(id)a7 safetyCacheToken:(id)a8 sessionType:(unint64_t)a9 destinationType:(unint64_t)a10 isSOSTrigger:(BOOL)a11 lowPowerModeWarningState:(int64_t)a12
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_opt_new();
  v22 = [MEMORY[0x263F08C38] UUID];
  LOBYTE(v25) = a11;
  v23 = [(SMKeyReleaseMessage *)self initWithDate:v21 messageID:v22 sessionID:v20 triggerDate:v19 locationOfTrigger:v18 triggerType:a6 safetyCacheKey:v17 safetyCacheToken:v16 sessionType:a9 destinationType:a10 isSOSTrigger:v25 lowPowerModeWarningState:a12];

  return v23;
}

- (SMKeyReleaseMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 triggerDate:(id)a6 locationOfTrigger:(id)a7 triggerType:(unint64_t)a8 safetyCacheKey:(id)a9 safetyCacheToken:(id)a10 sessionType:(unint64_t)a11 destinationType:(unint64_t)a12 isSOSTrigger:(BOOL)a13 lowPowerModeWarningState:(int64_t)a14
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v35 = a6;
  id v23 = a7;
  id v34 = a9;
  id v24 = a10;
  if (!v20)
  {
    v28 = v24;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: date";
LABEL_17:
    _os_log_error_impl(&dword_25B6E0000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_18;
  }
  if (!v21)
  {
    v28 = v24;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: messageID";
    goto LABEL_17;
  }
  if (!v22)
  {
    v28 = v24;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_17;
  }
  if (!v35)
  {
    v28 = v24;
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: triggerDate";
      goto LABEL_17;
    }
LABEL_18:

    v27 = 0;
    goto LABEL_19;
  }
  id v33 = v24;
  if (v34)
  {
    v36.receiver = self;
    v36.super_class = (Class)SMKeyReleaseMessage;
    uint64_t v25 = [(SMMessage *)&v36 initWithDate:v20 messageID:v21 sessionID:v22];
    v26 = v25;
    if (v25)
    {
      objc_storeStrong((id *)&v25->_triggerDate, a6);
      objc_storeStrong((id *)&v26->_locationOfTrigger, a7);
      v26->_triggerType = a8;
      objc_storeStrong((id *)&v26->_safetyCacheKey, a9);
      objc_storeStrong((id *)&v26->_safetyCacheToken, a10);
      v26->_sessionType = a11;
      v26->_destinationType = a12;
      v26->_isSOSTrigger = a13;
      v26->_lowPowerModeWarningState = a14;
    }
    self = v26;
    v27 = self;
  }
  else
  {
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: safetyCacheKey", buf, 2u);
    }

    v27 = 0;
  }
  v28 = v33;
LABEL_19:

  return v27;
}

- (SMKeyReleaseMessage)initWithDictionary:(id)a3
{
  uint64_t v132 = *MEMORY[0x263EF8340];
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
    goto LABEL_27;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_27:
      v56 = 0;
      goto LABEL_28;
    }
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    v52 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v125 = v51;
    __int16 v126 = 2112;
    v127 = v52;
    __int16 v128 = 1024;
    int v129 = [(id)objc_opt_class() messageType];
    __int16 v130 = 1024;
    int v131 = v8;
    v53 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v54 = v12;
    uint32_t v55 = 34;
LABEL_42:
    _os_log_error_impl(&dword_25B6E0000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);

    goto LABEL_27;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_27;
    }
    v58 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v58);
    v52 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v125 = v51;
    __int16 v126 = 2112;
    v127 = v52;
    __int16 v128 = 1024;
    int v129 = v10;
    v53 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v54 = v12;
    uint32_t v55 = 28;
    goto LABEL_42;
  }
  v11 = [v6 valueForKey:@"sendDate"];
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x263EFF910];
    [v11 doubleValue];
    v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    id v15 = objc_alloc(MEMORY[0x263F08C38]);
    id v16 = [v6 valueForKey:@"messageID"];
    id v17 = (void *)[v15 initWithUUIDString:v16];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F08C38]);
      id v19 = [v6 valueForKey:@"sessionID"];
      id v20 = [v18 initWithUUIDString:v19];

      if (v20)
      {
        id v21 = [v6 valueForKey:@"triggerTime"];
        id v22 = v21;
        if (v21)
        {
          v111 = v17;
          id v23 = (void *)MEMORY[0x263EFF910];
          [v21 doubleValue];
          uint64_t v114 = objc_msgSend(v23, "dateWithTimeIntervalSince1970:");
          uint64_t v24 = [v6 valueForKey:@"latitude"];
          uint64_t v25 = [v6 valueForKey:@"longitude"];
          v123 = [v6 valueForKey:@"hunc"];
          v122 = [v6 valueForKey:@"altitude"];
          v121 = [v6 valueForKey:@"vunc"];
          v120 = [v6 valueForKey:@"timeOfLocation"];
          v119 = [v6 valueForKey:@"referenceFrame"];
          uint64_t v26 = [v6 valueForKey:@"speed"];
          v117 = (void *)v24;
          v118 = 0;
          v113 = v22;
          v115 = (void *)v26;
          v116 = v25;
          if (v24 && v25 && v123 && v122 && v121 && v120 && v119 && v26)
          {
            v27 = (void *)MEMORY[0x263EFF910];
            [v120 doubleValue];
            v28 = objc_msgSend(v27, "dateWithTimeIntervalSince1970:");
            id v29 = objc_alloc(MEMORY[0x263F37EE8]);
            [v117 doubleValue];
            double v31 = v30;
            [v25 doubleValue];
            double v33 = v32;
            [v123 doubleValue];
            double v35 = v34;
            [v122 doubleValue];
            double v37 = v36;
            [v121 doubleValue];
            double v39 = v38;
            uint64_t v40 = [v119 intValue];
            [v115 doubleValue];
            uint64_t v41 = v40;
            id v22 = v113;
            v118 = (void *)[v29 initWithLatitude:v28 longitude:v41 horizontalUncertainty:v31 altitude:v33 verticalUncertainty:v35 date:v37 referenceFrame:v39 speed:v42];
          }
          v43 = [v6 valueForKey:@"triggerType"];
          v44 = v43;
          id v17 = v111;
          if (v43)
          {
            v109 = v43;
            int v106 = [v43 intValue];
            uint64_t v45 = [v6 valueForKey:@"safetyCacheKey"];
            v46 = v114;
            log = v45;
            if (v45)
            {
              uint64_t v47 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v45 options:0];
              v110 = v47;
              if (v47)
              {
                uint64_t v48 = v47;
                uint64_t v49 = [v6 valueForKey:@"safetyCacheToken"];
                v108 = v49;
                if (v49) {
                  v105 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v49 options:0];
                }
                else {
                  v105 = 0;
                }
                id v22 = v113;
                v62 = [v6 valueForKey:@"sessionType"];
                v46 = v114;
                v103 = v62;
                if (v62)
                {
                  int v63 = [v62 intValue];
                  v64 = [v6 valueForKey:@"sessionDestinationType"];
                  v104 = v64;
                  if (v64)
                  {
                    uint64_t v101 = v63;
                    uint64_t v102 = v106;
                    uint64_t v65 = (int)[v64 intValue];
                    v66 = [v6 valueForKey:@"isSOSTrigger"];
                    char v100 = [v66 BOOLValue];

                    v67 = [v6 valueForKey:@"lowPowerModeWarningState"];
                    v107 = v67;
                    if (v67)
                    {
                      uint64_t v68 = (int)[v67 intValue];
                      id v22 = v113;
                    }
                    else
                    {
                      v75 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                      {
                        v76 = (objc_class *)objc_opt_class();
                        v77 = NSStringFromClass(v76);
                        v78 = NSStringFromSelector(a2);
                        *(_DWORD *)buf = 138412546;
                        v125 = v77;
                        __int16 v126 = 2112;
                        v127 = v78;
                        _os_log_impl(&dword_25B6E0000, v75, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@ ,missing lowPowerModeWarningStateNumber, OK to proceed", buf, 0x16u);
                      }
                      uint64_t v68 = 0;
                      id v22 = v113;
                      uint64_t v48 = (uint64_t)v110;
                    }
                    LOBYTE(v99) = v100;
                    uint64_t v98 = v65;
                    v46 = v114;
                    self = [(SMKeyReleaseMessage *)self initWithDate:v14 messageID:v111 sessionID:v20 triggerDate:v114 locationOfTrigger:v118 triggerType:v102 safetyCacheKey:v48 safetyCacheToken:v105 sessionType:v101 destinationType:v98 isSOSTrigger:v99 lowPowerModeWarningState:v68];
                    v56 = self;
                    v44 = v109;
                  }
                  else
                  {
                    v107 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    v44 = v109;
                    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
                    {
                      v95 = (objc_class *)objc_opt_class();
                      v96 = NSStringFromClass(v95);
                      v97 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412546;
                      v125 = v96;
                      __int16 v126 = 2112;
                      v127 = v97;
                      _os_log_error_impl(&dword_25B6E0000, v107, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

                      v44 = v109;
                      id v22 = v113;
                    }
                    v56 = 0;
                    v46 = v114;
                  }
                }
                else
                {
                  v104 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                  {
                    v92 = (objc_class *)objc_opt_class();
                    v93 = NSStringFromClass(v92);
                    v94 = NSStringFromSelector(a2);
                    *(_DWORD *)buf = 138412546;
                    v125 = v93;
                    __int16 v126 = 2112;
                    v127 = v94;
                    _os_log_error_impl(&dword_25B6E0000, v104, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

                    id v22 = v113;
                  }
                  v56 = 0;
                  v44 = v109;
                }
              }
              else
              {
                v108 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                {
                  v89 = (objc_class *)objc_opt_class();
                  v90 = NSStringFromClass(v89);
                  v91 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412546;
                  v125 = v90;
                  __int16 v126 = 2112;
                  v127 = v91;
                  _os_log_error_impl(&dword_25B6E0000, v108, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to convert safetyCacheKey to NSData", buf, 0x16u);
                }
                v56 = 0;
                id v22 = v113;
                v44 = v109;
              }
            }
            else
            {
              v110 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
              {
                v86 = (objc_class *)objc_opt_class();
                v87 = NSStringFromClass(v86);
                v88 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v125 = v87;
                __int16 v126 = 2112;
                v127 = v88;
                _os_log_error_impl(&dword_25B6E0000, v110, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing safetyCacheKey", buf, 0x16u);

                id v22 = v113;
              }
              v56 = 0;
              v44 = v109;
            }
          }
          else
          {
            log = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            v46 = v114;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v83 = (objc_class *)objc_opt_class();
              v84 = NSStringFromClass(v83);
              v85 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v125 = v84;
              __int16 v126 = 2112;
              v127 = v85;
              _os_log_error_impl(&dword_25B6E0000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerType", buf, 0x16u);

              v44 = 0;
              id v22 = v113;
            }
            v56 = 0;
          }
        }
        else
        {
          v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            v79 = (objc_class *)objc_opt_class();
            v80 = NSStringFromClass(v79);
            NSStringFromSelector(a2);
            v82 = v81 = v46;
            *(_DWORD *)buf = 138412546;
            v125 = v80;
            __int16 v126 = 2112;
            v127 = v82;
            _os_log_error_impl(&dword_25B6E0000, v81, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerTime", buf, 0x16u);

            v46 = v81;
          }
          v56 = 0;
        }
      }
      else
      {
        id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v72 = (objc_class *)objc_opt_class();
          v73 = NSStringFromClass(v72);
          v74 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v125 = v73;
          __int16 v126 = 2112;
          v127 = v74;
          _os_log_error_impl(&dword_25B6E0000, v22, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
        }
        v56 = 0;
      }
    }
    else
    {
      id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v69 = (objc_class *)objc_opt_class();
        v70 = NSStringFromClass(v69);
        v71 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v125 = v70;
        __int16 v126 = 2112;
        v127 = v71;
        _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
      }
      v56 = 0;
    }
  }
  else
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      v61 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v125 = v60;
      __int16 v126 = 2112;
      v127 = v61;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v56 = 0;
  }

LABEL_28:
  return v56;
}

- (id)outputToDictionary
{
  v44.receiver = self;
  v44.super_class = (Class)SMKeyReleaseMessage;
  v3 = [(SMMessage *)&v44 outputToDictionary];
  v4 = NSNumber;
  id v5 = [(SMKeyReleaseMessage *)self triggerDate];
  [v5 timeIntervalSince1970];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setObject:v6 forKey:@"triggerTime"];

  v7 = [(SMKeyReleaseMessage *)self locationOfTrigger];

  if (v7)
  {
    int v8 = NSNumber;
    v9 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v9 latitude];
    int v10 = objc_msgSend(v8, "numberWithDouble:");
    [v3 setObject:v10 forKey:@"latitude"];

    v11 = NSNumber;
    v12 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v12 longitude];
    v13 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v13 forKey:@"longitude"];

    v14 = NSNumber;
    id v15 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v15 horizontalUncertainty];
    id v16 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v16 forKey:@"hunc"];

    id v17 = NSNumber;
    id v18 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v18 altitude];
    id v19 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v19 forKey:@"altitude"];

    id v20 = NSNumber;
    id v21 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v21 verticalUncertainty];
    id v22 = objc_msgSend(v20, "numberWithDouble:");
    [v3 setObject:v22 forKey:@"vunc"];

    id v23 = NSNumber;
    uint64_t v24 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    uint64_t v25 = [v24 date];
    [v25 timeIntervalSince1970];
    uint64_t v26 = objc_msgSend(v23, "numberWithDouble:");
    [v3 setObject:v26 forKey:@"timeOfLocation"];

    v27 = NSNumber;
    v28 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    id v29 = objc_msgSend(v27, "numberWithUnsignedInt:", objc_msgSend(v28, "referenceFrame"));
    [v3 setObject:v29 forKey:@"referenceFrame"];

    double v30 = NSNumber;
    double v31 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v31 speed];
    double v32 = objc_msgSend(v30, "numberWithDouble:");
    [v3 setObject:v32 forKey:@"speed"];
  }
  double v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  [v3 setObject:v33 forKey:@"triggerType"];

  double v34 = [(SMKeyReleaseMessage *)self safetyCacheKey];
  double v35 = [v34 base64EncodedStringWithOptions:0];
  [v3 setObject:v35 forKey:@"safetyCacheKey"];

  double v36 = [(SMKeyReleaseMessage *)self safetyCacheToken];

  if (v36)
  {
    double v37 = [(SMKeyReleaseMessage *)self safetyCacheToken];
    double v38 = [v37 base64EncodedStringWithOptions:0];
    [v3 setObject:v38 forKey:@"safetyCacheToken"];
  }
  double v39 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  [v3 setObject:v39 forKey:@"sessionType"];

  uint64_t v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  [v3 setObject:v40 forKey:@"sessionDestinationType"];

  uint64_t v41 = objc_msgSend(NSNumber, "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  [v3 setObject:v41 forKey:@"isSOSTrigger"];

  double v42 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  [v3 setObject:v42 forKey:@"lowPowerModeWarningState"];

  return v3;
}

- (SMKeyReleaseMessage)initWithURL:(id)a3
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v88 = 0;
    goto LABEL_97;
  }
  v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = v4;
  if (!v4)
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v91 = (objc_class *)objc_opt_class();
      v92 = NSStringFromClass(v91);
      v93 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v92;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v93;
      _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);
    }
    v88 = 0;
    goto LABEL_96;
  }
  v6 = [v4 queryItems];
  v7 = v6;
  if (!v6)
  {
    v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
    {
      char v100 = (objc_class *)objc_opt_class();
      uint64_t v101 = NSStringFromClass(v100);
      uint64_t v102 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v101;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v102;
      _os_log_error_impl(&dword_25B6E0000, v89, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);
    }
    v88 = 0;
    goto LABEL_95;
  }
  long long v171 = 0u;
  long long v172 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v169 objects:v181 count:16];
  if (!v8)
  {
    int v61 = [0 intValue];
    v89 = 0;
    v162 = 0;
    int v10 = 0;
    v166 = 0;
    v167 = 0;
    v158 = 0;
    v157 = 0;
    v156 = 0;
    v154 = 0;
    v155 = 0;
    v152 = 0;
    v153 = 0;
    v150 = 0;
    v151 = 0;
    v148 = 0;
    v149 = 0;
    v146 = 0;
    v147 = 0;
    v144 = 0;
    v145 = 0;
    v143 = 0;
LABEL_91:
    uint64_t v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v94 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v94);
      NSStringFromSelector(a2);
      v96 = v89;
      uint64_t v98 = v97 = v7;
      int v99 = [(id)objc_opt_class() messageType];
      *(_DWORD *)buf = 138413058;
      v174 = v95;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v98;
      __int16 v177 = 1024;
      int v178 = v99;
      __int16 v179 = 1024;
      int v180 = v61;
      _os_log_error_impl(&dword_25B6E0000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d", buf, 0x22u);

      v7 = v97;
      v89 = v96;
    }
    v88 = 0;
    goto LABEL_94;
  }
  uint64_t v9 = v8;
  v167 = 0;
  obj = v7;
  id v141 = v3;
  v142 = v5;
  v143 = 0;
  v144 = 0;
  v145 = 0;
  v146 = 0;
  v147 = 0;
  v148 = 0;
  v149 = 0;
  v150 = 0;
  v151 = 0;
  v152 = 0;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  v156 = 0;
  v157 = 0;
  v158 = 0;
  v166 = 0;
  int v10 = 0;
  v162 = 0;
  v164 = 0;
  uint64_t v11 = *(void *)v170;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v170 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v169 + 1) + 8 * i);
      v14 = [v13 value];
      if (v14)
      {
        id v15 = [v13 name];
        int v16 = [v15 isEqualToString:@"sendDate"];

        if (v16)
        {
          id v17 = v10;
          int v10 = v14;
        }
        else
        {
          id v21 = [v13 name];
          int v22 = [v21 isEqualToString:@"messageID"];

          if (v22)
          {
            id v17 = v167;
            v167 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
          }
          else
          {
            id v23 = [v13 name];
            int v24 = [v23 isEqualToString:@"sessionID"];

            if (v24)
            {
              id v17 = v166;
              v166 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
            }
            else
            {
              uint64_t v25 = [v13 name];
              int v26 = [v25 isEqualToString:@"messageType"];

              if (v26)
              {
                id v17 = v164;
                v164 = v14;
              }
              else
              {
                v27 = [v13 name];
                int v28 = [v27 isEqualToString:@"interfaceVersion"];

                if (v28)
                {
                  id v17 = v162;
                  v162 = v14;
                }
                else
                {
                  id v29 = [v13 name];
                  int v30 = [v29 isEqualToString:@"triggerTime"];

                  if (v30)
                  {
                    id v17 = v158;
                    v158 = v14;
                  }
                  else
                  {
                    double v31 = [v13 name];
                    int v32 = [v31 isEqualToString:@"latitude"];

                    if (v32)
                    {
                      id v17 = v157;
                      v157 = v14;
                    }
                    else
                    {
                      double v33 = [v13 name];
                      int v34 = [v33 isEqualToString:@"longitude"];

                      if (v34)
                      {
                        id v17 = v156;
                        v156 = v14;
                      }
                      else
                      {
                        double v35 = [v13 name];
                        int v36 = [v35 isEqualToString:@"hunc"];

                        if (v36)
                        {
                          id v17 = v155;
                          v155 = v14;
                        }
                        else
                        {
                          double v37 = [v13 name];
                          int v38 = [v37 isEqualToString:@"altitude"];

                          if (v38)
                          {
                            id v17 = v154;
                            v154 = v14;
                          }
                          else
                          {
                            double v39 = [v13 name];
                            int v40 = [v39 isEqualToString:@"vunc"];

                            if (v40)
                            {
                              id v17 = v153;
                              v153 = v14;
                            }
                            else
                            {
                              uint64_t v41 = [v13 name];
                              int v42 = [v41 isEqualToString:@"timeOfLocation"];

                              if (v42)
                              {
                                id v17 = v152;
                                v152 = v14;
                              }
                              else
                              {
                                v43 = [v13 name];
                                int v44 = [v43 isEqualToString:@"referenceFrame"];

                                if (v44)
                                {
                                  id v17 = v151;
                                  v151 = v14;
                                }
                                else
                                {
                                  uint64_t v45 = [v13 name];
                                  int v46 = [v45 isEqualToString:@"speed"];

                                  if (v46)
                                  {
                                    id v17 = v150;
                                    v150 = v14;
                                  }
                                  else
                                  {
                                    uint64_t v47 = [v13 name];
                                    int v48 = [v47 isEqualToString:@"triggerType"];

                                    if (v48)
                                    {
                                      id v17 = v149;
                                      v149 = v14;
                                    }
                                    else
                                    {
                                      uint64_t v49 = [v13 name];
                                      int v50 = [v49 isEqualToString:@"safetyCacheKey"];

                                      if (v50)
                                      {
                                        id v17 = v148;
                                        v148 = v14;
                                      }
                                      else
                                      {
                                        v51 = [v13 name];
                                        int v52 = [v51 isEqualToString:@"safetyCacheToken"];

                                        if (v52)
                                        {
                                          id v17 = v147;
                                          v147 = v14;
                                        }
                                        else
                                        {
                                          v53 = [v13 name];
                                          int v54 = [v53 isEqualToString:@"sessionType"];

                                          if (v54)
                                          {
                                            id v17 = v146;
                                            v146 = v14;
                                          }
                                          else
                                          {
                                            uint32_t v55 = [v13 name];
                                            int v56 = [v55 isEqualToString:@"sessionDestinationType"];

                                            if (v56)
                                            {
                                              id v17 = v145;
                                              v145 = v14;
                                            }
                                            else
                                            {
                                              v57 = [v13 name];
                                              int v58 = [v57 isEqualToString:@"isSOSTrigger"];

                                              if (v58)
                                              {
                                                id v17 = v144;
                                                v144 = v14;
                                              }
                                              else
                                              {
                                                v59 = [v13 name];
                                                int v60 = [v59 isEqualToString:@"lowPowerModeWarningState"];

                                                if (!v60) {
                                                  goto LABEL_55;
                                                }
                                                id v17 = v143;
                                                v143 = v14;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
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
        id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = (objc_class *)objc_opt_class();
          id v19 = NSStringFromClass(v18);
          id v20 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v174 = v19;
          __int16 v175 = 2112;
          uint64_t v176 = (uint64_t)v20;
          _os_log_error_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value", buf, 0x16u);
        }
      }

LABEL_55:
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v169 objects:v181 count:16];
  }
  while (v9);
  int v61 = [v164 intValue];
  if (!v164)
  {
    v89 = 0;
    id v3 = v141;
    id v5 = v142;
    v7 = obj;
    goto LABEL_91;
  }
  id v5 = v142;
  v7 = obj;
  if ([(id)objc_opt_class() messageType] != v61)
  {
    id v3 = v141;
    v89 = v164;
    goto LABEL_91;
  }
  int v62 = [v162 intValue];
  int v63 = v62;
  if (!v162 || v62 != 1)
  {
    uint64_t v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v3 = v141;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v107 = (objc_class *)objc_opt_class();
      v108 = NSStringFromClass(v107);
      v109 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v174 = v108;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v109;
      __int16 v177 = 1024;
      int v178 = v63;
      _os_log_error_impl(&dword_25B6E0000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,unrecognized interface version,%d", buf, 0x1Cu);

      v7 = obj;
    }
    v88 = 0;
    goto LABEL_104;
  }
  if (!v10)
  {
    uint64_t v65 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v117 = (objc_class *)objc_opt_class();
      v118 = NSStringFromClass(v117);
      v119 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v118;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v119;
      _os_log_error_impl(&dword_25B6E0000, v65, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    int v10 = 0;
    v88 = 0;
    id v3 = v141;
LABEL_104:
    v89 = v164;
    goto LABEL_94;
  }
  v64 = (void *)MEMORY[0x263EFF910];
  [v10 doubleValue];
  uint64_t v65 = objc_msgSend(v64, "dateWithTimeIntervalSince1970:");
  if (!v167)
  {
    v67 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v3 = v141;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      __int16 v130 = (objc_class *)objc_opt_class();
      int v131 = NSStringFromClass(v130);
      uint64_t v132 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v131;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v132;
      _os_log_error_impl(&dword_25B6E0000, v67, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);

      v7 = obj;
    }
    v88 = 0;
    goto LABEL_134;
  }
  if (!v166)
  {
    v67 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
LABEL_111:
      v88 = 0;
      id v3 = v141;
      goto LABEL_134;
    }
    v103 = (objc_class *)objc_opt_class();
    v104 = NSStringFromClass(v103);
    v105 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v104;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v105;
    int v106 = "#SafetyCache,%@,%@,missing sessionID";
LABEL_136:
    _os_log_error_impl(&dword_25B6E0000, v67, OS_LOG_TYPE_ERROR, v106, buf, 0x16u);

    v7 = obj;
    goto LABEL_111;
  }
  if (!v158)
  {
    v67 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      goto LABEL_111;
    }
    v137 = (objc_class *)objc_opt_class();
    v104 = NSStringFromClass(v137);
    v105 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v104;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v105;
    int v106 = "#SafetyCache,%@,%@,missing triggerTime";
    goto LABEL_136;
  }
  v66 = (void *)MEMORY[0x263EFF910];
  [v158 doubleValue];
  v67 = objc_msgSend(v66, "dateWithTimeIntervalSince1970:");
  uint64_t v68 = 0;
  if (v157 && v156 && v155 && v154 && v153 && v152 && v151 && v150)
  {
    v69 = (void *)MEMORY[0x263EFF910];
    [v152 doubleValue];
    v70 = objc_msgSend(v69, "dateWithTimeIntervalSince1970:");
    id v71 = objc_alloc(MEMORY[0x263F37EE8]);
    [v157 doubleValue];
    double v73 = v72;
    [v156 doubleValue];
    double v75 = v74;
    [v155 doubleValue];
    double v77 = v76;
    [v154 doubleValue];
    double v79 = v78;
    [v153 doubleValue];
    double v81 = v80;
    uint64_t v82 = [v151 intValue];
    [v150 doubleValue];
    uint64_t v68 = (void *)[v71 initWithLatitude:v70 longitude:v82 horizontalUncertainty:v73 altitude:v75 verticalUncertainty:v77 date:v79 referenceFrame:v81 speed:v83];
  }
  if (!v149)
  {
    v86 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
LABEL_115:
      v88 = 0;
      id v3 = v141;
      goto LABEL_133;
    }
    v110 = (objc_class *)objc_opt_class();
    v111 = NSStringFromClass(v110);
    v112 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v111;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v112;
    v113 = "#SafetyCache,%@,%@,missing triggerType";
LABEL_138:
    _os_log_error_impl(&dword_25B6E0000, v86, OS_LOG_TYPE_ERROR, v113, buf, 0x16u);

    id v5 = v142;
    goto LABEL_115;
  }
  int v84 = [v149 intValue];
  if (!v148)
  {
    v86 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      goto LABEL_115;
    }
    v138 = (objc_class *)objc_opt_class();
    v111 = NSStringFromClass(v138);
    v112 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v111;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v112;
    v113 = "#SafetyCache,%@,%@,missing safetyCacheKey";
    goto LABEL_138;
  }
  LODWORD(v85) = v84;
  v86 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v148 options:0];
  if (!v86)
  {
    v87 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v3 = v141;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      uint64_t v114 = (objc_class *)objc_opt_class();
      v115 = NSStringFromClass(v114);
      v116 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v115;
      __int16 v175 = 2112;
      uint64_t v176 = (uint64_t)v116;
      _os_log_error_impl(&dword_25B6E0000, v87, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,failed to convert safetyCacheKey to NSData", buf, 0x16u);
    }
    goto LABEL_127;
  }
  if (v147) {
    v87 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v147 options:0];
  }
  else {
    v87 = 0;
  }
  id v3 = v141;
  if (!v146)
  {
    v125 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
LABEL_126:

LABEL_127:
      v88 = 0;
      goto LABEL_132;
    }
    __int16 v126 = (objc_class *)objc_opt_class();
    v127 = NSStringFromClass(v126);
    __int16 v128 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v127;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v128;
    int v129 = "#SafetyCache,%@,%@,missing sessionType";
LABEL_140:
    _os_log_error_impl(&dword_25B6E0000, v125, OS_LOG_TYPE_ERROR, v129, buf, 0x16u);

    goto LABEL_126;
  }
  int v120 = [v146 intValue];
  if (!v145)
  {
    v125 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR)) {
      goto LABEL_126;
    }
    v139 = (objc_class *)objc_opt_class();
    v127 = NSStringFromClass(v139);
    __int16 v128 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v174 = v127;
    __int16 v175 = 2112;
    uint64_t v176 = (uint64_t)v128;
    int v129 = "#SafetyCache,%@,%@,missing destinationType";
    goto LABEL_140;
  }
  uint64_t v85 = (int)v85;
  uint64_t v121 = v120;
  uint64_t v122 = (int)[v145 intValue];
  char v123 = [v144 BOOLValue];
  if (v143)
  {
    uint64_t v124 = (int)[v143 intValue];
  }
  else
  {
    uint64_t v165 = (int)v85;
    v133 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
    {
      v134 = (objc_class *)objc_opt_class();
      NSStringFromClass(v134);
      v161 = uint64_t v163 = v121;
      uint64_t v135 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v174 = v161;
      __int16 v175 = 2112;
      uint64_t v176 = v135;
      v136 = (void *)v135;
      _os_log_impl(&dword_25B6E0000, v133, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);

      uint64_t v121 = v163;
    }

    uint64_t v124 = 0;
    uint64_t v85 = v165;
  }
  LOBYTE(v140) = v123;
  v88 = [(SMKeyReleaseMessage *)self initWithDate:v65 messageID:v167 sessionID:v166 triggerDate:v67 locationOfTrigger:v68 triggerType:v85 safetyCacheKey:v86 safetyCacheToken:v87 sessionType:v121 destinationType:v122 isSOSTrigger:v140 lowPowerModeWarningState:v124];
  self = v88;
  id v3 = v141;
LABEL_132:

  id v5 = v142;
LABEL_133:

  v7 = obj;
LABEL_134:
  v89 = v164;

LABEL_94:
LABEL_95:

LABEL_96:
LABEL_97:

  return v88;
}

- (id)outputToURLComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v94.receiver = self;
  v94.super_class = (Class)SMKeyReleaseMessage;
  id v5 = [(SMMessage *)&v94 outputToURLComponents];
  v6 = [v5 queryItems];
  [v4 addObjectsFromArray:v6];

  id v7 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v8 = NSNumber;
  uint64_t v9 = [(SMKeyReleaseMessage *)self triggerDate];
  [v9 timeIntervalSince1970];
  int v10 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v11 = [v10 stringValue];
  v12 = (void *)[v7 initWithName:@"triggerTime" value:v11];
  [v4 addObject:v12];

  v13 = [(SMKeyReleaseMessage *)self locationOfTrigger];

  if (v13)
  {
    id v14 = objc_alloc(MEMORY[0x263F08BD0]);
    id v15 = NSNumber;
    int v16 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v16 latitude];
    id v17 = objc_msgSend(v15, "numberWithDouble:");
    id v18 = [v17 stringValue];
    id v19 = (void *)[v14 initWithName:@"latitude" value:v18];
    [v4 addObject:v19];

    id v20 = objc_alloc(MEMORY[0x263F08BD0]);
    id v21 = NSNumber;
    int v22 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v22 longitude];
    id v23 = objc_msgSend(v21, "numberWithDouble:");
    int v24 = [v23 stringValue];
    uint64_t v25 = (void *)[v20 initWithName:@"longitude" value:v24];
    [v4 addObject:v25];

    id v26 = objc_alloc(MEMORY[0x263F08BD0]);
    v27 = NSNumber;
    int v28 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v28 horizontalUncertainty];
    id v29 = objc_msgSend(v27, "numberWithDouble:");
    int v30 = [v29 stringValue];
    double v31 = (void *)[v26 initWithName:@"hunc" value:v30];
    [v4 addObject:v31];

    id v32 = objc_alloc(MEMORY[0x263F08BD0]);
    double v33 = NSNumber;
    int v34 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v34 altitude];
    double v35 = objc_msgSend(v33, "numberWithDouble:");
    int v36 = [v35 stringValue];
    double v37 = (void *)[v32 initWithName:@"altitude" value:v36];
    [v4 addObject:v37];

    id v38 = objc_alloc(MEMORY[0x263F08BD0]);
    double v39 = NSNumber;
    int v40 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v40 verticalUncertainty];
    uint64_t v41 = objc_msgSend(v39, "numberWithDouble:");
    int v42 = [v41 stringValue];
    v43 = (void *)[v38 initWithName:@"vunc" value:v42];
    [v4 addObject:v43];

    id v44 = objc_alloc(MEMORY[0x263F08BD0]);
    uint64_t v45 = NSNumber;
    int v46 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    uint64_t v47 = [v46 date];
    [v47 timeIntervalSince1970];
    int v48 = objc_msgSend(v45, "numberWithDouble:");
    [v48 stringValue];
    v50 = id v49 = v3;
    v51 = (void *)[v44 initWithName:@"timeOfLocation" value:v50];
    [v4 addObject:v51];

    id v3 = v49;
    id v52 = objc_alloc(MEMORY[0x263F08BD0]);
    v53 = NSNumber;
    int v54 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    uint32_t v55 = objc_msgSend(v53, "numberWithUnsignedInt:", objc_msgSend(v54, "referenceFrame"));
    int v56 = [v55 stringValue];
    v57 = (void *)[v52 initWithName:@"referenceFrame" value:v56];
    [v4 addObject:v57];

    id v58 = objc_alloc(MEMORY[0x263F08BD0]);
    v59 = NSNumber;
    int v60 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v60 speed];
    int v61 = objc_msgSend(v59, "numberWithDouble:");
    int v62 = [v61 stringValue];
    int v63 = (void *)[v58 initWithName:@"speed" value:v62];
    [v4 addObject:v63];
  }
  id v64 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v65 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  v66 = [v65 stringValue];
  v67 = (void *)[v64 initWithName:@"triggerType" value:v66];
  [v4 addObject:v67];

  id v68 = objc_alloc(MEMORY[0x263F08BD0]);
  v69 = [(SMKeyReleaseMessage *)self safetyCacheKey];
  v70 = [v69 base64EncodedStringWithOptions:0];
  id v71 = (void *)[v68 initWithName:@"safetyCacheKey" value:v70];
  [v4 addObject:v71];

  double v72 = [(SMKeyReleaseMessage *)self safetyCacheToken];

  if (v72)
  {
    id v73 = objc_alloc(MEMORY[0x263F08BD0]);
    double v74 = [(SMKeyReleaseMessage *)self safetyCacheToken];
    double v75 = [v74 base64EncodedStringWithOptions:0];
    double v76 = (void *)[v73 initWithName:@"safetyCacheToken" value:v75];
    [v4 addObject:v76];
  }
  id v77 = objc_alloc(MEMORY[0x263F08BD0]);
  double v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  double v79 = [v78 stringValue];
  double v80 = (void *)[v77 initWithName:@"sessionType" value:v79];
  [v4 addObject:v80];

  id v81 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v82 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  double v83 = [v82 stringValue];
  int v84 = (void *)[v81 initWithName:@"sessionDestinationType" value:v83];
  [v4 addObject:v84];

  id v85 = objc_alloc(MEMORY[0x263F08BD0]);
  v86 = objc_msgSend(NSNumber, "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  v87 = [v86 stringValue];
  v88 = (void *)[v85 initWithName:@"isSOSTrigger" value:v87];
  [v4 addObject:v88];

  id v89 = objc_alloc(MEMORY[0x263F08BD0]);
  v90 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  v91 = [v90 stringValue];
  v92 = (void *)[v89 initWithName:@"lowPowerModeWarningState" value:v91];
  [v4 addObject:v92];

  [v3 setQueryItems:v4];
  return v3;
}

+ (unint64_t)messageType
{
  return 3;
}

- (id)summaryText
{
  switch([(SMKeyReleaseMessage *)self triggerType])
  {
    case 10uLL:
    case 12uLL:
    case 14uLL:
      goto LABEL_2;
    case 11uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"KEY_RELEASE_MESSAGE_SOS_CAR_CRASH_EVENT_SUMMARY";
      v6 = @"Check In: Emergency services called, car crash detected, location shared";
      break;
    case 13uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"KEY_RELEASE_MESSAGE_SOS_HARD_FALL_EVENT_SUMMARY";
      v6 = @"Check In: Emergency services called, fall detected, location shared";
      break;
    case 15uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"KEY_RELEASE_MESSAGE_SCHEDULED_SEND_SUMMARY";
      v6 = @"Check In: Device offline, location shared";
      break;
    default:
      if ([(SMKeyReleaseMessage *)self isSOSTrigger])
      {
LABEL_2:
        id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        id v4 = v3;
        id v5 = @"KEY_RELEASE_MESSAGE_SOS_EVENT_SUMMARY";
        v6 = @"Check In: Emergency services called, location shared";
      }
      else
      {
        switch([(SMKeyReleaseMessage *)self sessionType])
        {
          case 1uLL:
            id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v4 = v3;
            id v5 = @"KEY_RELEASE_MESSAGE_TIME_BOUND_SUMMARY";
            v6 = @"Check In: Has not checked in when expected, location shared";
            break;
          case 2uLL:
            id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v4 = v3;
            id v5 = @"KEY_RELEASE_MESSAGE_DESTINATION_BOUND_SUMMARY";
            v6 = @"Check In: Has not arrived as expected, location shared";
            break;
          case 3uLL:
            id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v4 = v3;
            id v5 = @"KEY_RELEASE_MESSAGE_ROUNDTRIP_SUMMARY";
            v6 = @"Check In: Has not arrived back as expected, location shared";
            break;
          case 4uLL:
            id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v4 = v3;
            id v5 = @"KEY_RELEASE_MESSAGE_WORKOUT_SUMMARY";
            v6 = @"Check In: Has not completed workout as expected, location shared";
            break;
          default:
            id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v4 = v3;
            id v5 = @"KEY_RELEASE_MESSAGE_DEFAULT_SUMMARY";
            v6 = @"Check In: Location available";
            break;
        }
      }
      break;
  }
  id v7 = [v3 localizedStringForKey:v5 value:v6 table:0];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v41 = "-[SMKeyReleaseMessage encodeWithCoder:]";
      __int16 v42 = 1024;
      int v43 = 594;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)SMKeyReleaseMessage;
  [(SMMessage *)&v39 encodeWithCoder:v4];
  v6 = [(SMKeyReleaseMessage *)self triggerDate];
  [v4 encodeObject:v6 forKey:@"triggerTime"];

  id v7 = [(SMKeyReleaseMessage *)self locationOfTrigger];

  if (v7)
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v9 latitude];
    int v10 = objc_msgSend(v8, "numberWithDouble:");
    [v4 encodeObject:v10 forKey:@"latitude"];

    uint64_t v11 = NSNumber;
    v12 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v12 longitude];
    v13 = objc_msgSend(v11, "numberWithDouble:");
    [v4 encodeObject:v13 forKey:@"longitude"];

    id v14 = NSNumber;
    id v15 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v15 horizontalUncertainty];
    int v16 = objc_msgSend(v14, "numberWithDouble:");
    [v4 encodeObject:v16 forKey:@"hunc"];

    id v17 = NSNumber;
    id v18 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v18 altitude];
    id v19 = objc_msgSend(v17, "numberWithDouble:");
    [v4 encodeObject:v19 forKey:@"altitude"];

    id v20 = NSNumber;
    id v21 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v21 verticalUncertainty];
    int v22 = objc_msgSend(v20, "numberWithDouble:");
    [v4 encodeObject:v22 forKey:@"vunc"];

    id v23 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    int v24 = [v23 date];
    [v4 encodeObject:v24 forKey:@"timeOfLocation"];

    uint64_t v25 = NSNumber;
    id v26 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    v27 = objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v26, "referenceFrame"));
    [v4 encodeObject:v27 forKey:@"referenceFrame"];

    int v28 = NSNumber;
    id v29 = [(SMKeyReleaseMessage *)self locationOfTrigger];
    [v29 speed];
    int v30 = objc_msgSend(v28, "numberWithDouble:");
    [v4 encodeObject:v30 forKey:@"speed"];
  }
  double v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage triggerType](self, "triggerType"));
  [v4 encodeObject:v31 forKey:@"triggerType"];

  id v32 = [(SMKeyReleaseMessage *)self safetyCacheKey];
  [v4 encodeObject:v32 forKey:@"safetyCacheKey"];

  double v33 = [(SMKeyReleaseMessage *)self safetyCacheToken];

  if (v33)
  {
    int v34 = [(SMKeyReleaseMessage *)self safetyCacheToken];
    [v4 encodeObject:v34 forKey:@"safetyCacheToken"];
  }
  double v35 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage sessionType](self, "sessionType"));
  [v4 encodeObject:v35 forKey:@"sessionType"];

  int v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMKeyReleaseMessage destinationType](self, "destinationType"));
  [v4 encodeObject:v36 forKey:@"sessionDestinationType"];

  double v37 = objc_msgSend(NSNumber, "numberWithBool:", -[SMKeyReleaseMessage isSOSTrigger](self, "isSOSTrigger"));
  [v4 encodeObject:v37 forKey:@"isSOSTrigger"];

  id v38 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMKeyReleaseMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  [v4 encodeObject:v38 forKey:@"lowPowerModeWarningState"];
}

- (SMKeyReleaseMessage)initWithCoder:(id)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", buf, 2u);
    }
    goto LABEL_28;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_28:
      v51 = 0;
      goto LABEL_29;
    }
    uint64_t v44 = (objc_class *)objc_opt_class();
    uint64_t v45 = NSStringFromClass(v44);
    int v46 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v107 = v45;
    __int16 v108 = 2112;
    v109 = v46;
    __int16 v110 = 1024;
    int v111 = [(id)objc_opt_class() messageType];
    __int16 v112 = 1024;
    int v113 = v7;
    uint64_t v47 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    int v48 = v9;
    uint32_t v49 = 34;
LABEL_43:
    _os_log_error_impl(&dword_25B6E0000, v48, OS_LOG_TYPE_ERROR, v47, buf, v49);

    goto LABEL_28;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 != 1)
  {
    int v50 = v8;
    uint64_t v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    v53 = (objc_class *)objc_opt_class();
    uint64_t v45 = NSStringFromClass(v53);
    int v46 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v107 = v45;
    __int16 v108 = 2112;
    v109 = v46;
    __int16 v110 = 1024;
    int v111 = v50;
    uint64_t v47 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    int v48 = v9;
    uint32_t v49 = 28;
    goto LABEL_43;
  }
  uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
  if (v9)
  {
    int v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
    if (v10)
    {
      uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
      if (v11)
      {
        v12 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"triggerTime"];
        if (v12)
        {
          v96 = v11;
          v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"latitude"];
          uint64_t v14 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"longitude"];
          v105 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"hunc"];
          v104 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"altitude"];
          v103 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"vunc"];
          id v15 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"timeOfLocation"];
          uint64_t v102 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"referenceFrame"];
          uint64_t v16 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"speed"];
          uint64_t v17 = 0;
          int v99 = v13;
          char v100 = (void *)v16;
          uint64_t v101 = (void *)v14;
          if (v13 && v14 && v105 && v104 && v103 && v15 && v102 && v16)
          {
            id v18 = v15;
            id v19 = objc_alloc(MEMORY[0x263F37EE8]);
            [v13 doubleValue];
            double v21 = v20;
            [v101 doubleValue];
            double v23 = v22;
            [v105 doubleValue];
            double v25 = v24;
            [v104 doubleValue];
            double v27 = v26;
            [v103 doubleValue];
            double v29 = v28;
            uint64_t v30 = [v102 intValue];
            [v100 doubleValue];
            double v31 = v19;
            id v15 = v18;
            uint64_t v17 = [v31 initWithLatitude:v18 longitude:v30 horizontalUncertainty:v21 altitude:v23 verticalUncertainty:v25 date:v27 referenceFrame:v29 speed:v32];
          }
          v97 = (void *)v17;
          double v33 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"triggerType"];
          int v34 = v33;
          uint64_t v11 = v96;
          if (v33)
          {
            v92 = v12;
            v93 = v15;
            int v35 = [v33 intValue];
            log = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"safetyCacheKey"];
            if (log)
            {
              v95 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"safetyCacheToken"];
              int v36 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionType"];
              v90 = v36;
              if (v36)
              {
                int v37 = [v36 intValue];
                id v38 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionDestinationType"];
                v91 = v38;
                if (v38)
                {
                  uint64_t v88 = v35;
                  uint64_t v39 = v37;
                  uint64_t v87 = (int)[v38 intValue];
                  int v40 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"isSOSTrigger"];
                  int v86 = [v40 intValue];

                  uint64_t v41 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"lowPowerModeWarningState"];
                  id v89 = v41;
                  if (v41)
                  {
                    uint64_t v42 = (int)[v41 intValue];
                    int v43 = v99;
                    id v15 = v93;
                  }
                  else
                  {
                    uint64_t v85 = v39;
                    int v60 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                    int v43 = v99;
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
                    {
                      int v61 = (objc_class *)objc_opt_class();
                      int v62 = NSStringFromClass(v61);
                      int v63 = NSStringFromSelector(a2);
                      *(_DWORD *)buf = 138412546;
                      v107 = v62;
                      __int16 v108 = 2112;
                      v109 = v63;
                      _os_log_impl(&dword_25B6E0000, v60, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningStateNumber", buf, 0x16u);
                    }
                    uint64_t v42 = 0;
                    id v15 = v93;
                    uint64_t v39 = v85;
                  }
                  uint64_t v83 = v39;
                  LOBYTE(v84) = v86 != 0;
                  v12 = v92;
                  self = [(SMKeyReleaseMessage *)self initWithDate:v9 messageID:v10 sessionID:v96 triggerDate:v92 locationOfTrigger:v97 triggerType:v88 safetyCacheKey:log safetyCacheToken:v95 sessionType:v83 destinationType:v87 isSOSTrigger:v84 lowPowerModeWarningState:v42];
                  v51 = self;
                }
                else
                {
                  id v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                  v12 = v92;
                  id v15 = v93;
                  int v43 = v99;
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                  {
                    double v80 = (objc_class *)objc_opt_class();
                    id v81 = NSStringFromClass(v80);
                    uint64_t v82 = NSStringFromSelector(a2);
                    *(_DWORD *)buf = 138412546;
                    v107 = v81;
                    __int16 v108 = 2112;
                    v109 = v82;
                    _os_log_error_impl(&dword_25B6E0000, v89, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

                    v12 = v92;
                    id v15 = v93;
                  }
                  v51 = 0;
                }
              }
              else
              {
                v91 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
                {
                  id v77 = (objc_class *)objc_opt_class();
                  double v78 = NSStringFromClass(v77);
                  double v79 = NSStringFromSelector(a2);
                  *(_DWORD *)buf = 138412546;
                  v107 = v78;
                  __int16 v108 = 2112;
                  v109 = v79;
                  _os_log_error_impl(&dword_25B6E0000, v91, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);
                }
                v51 = 0;
                v12 = v92;
                id v15 = v93;
                int v43 = v99;
              }
            }
            else
            {
              v95 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              v12 = v92;
              int v43 = v99;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                double v74 = (objc_class *)objc_opt_class();
                double v75 = NSStringFromClass(v74);
                double v76 = NSStringFromSelector(a2);
                *(_DWORD *)buf = 138412546;
                v107 = v75;
                __int16 v108 = 2112;
                v109 = v76;
                _os_log_error_impl(&dword_25B6E0000, v95, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing safetyCacheKey", buf, 0x16u);

                v12 = v92;
                id v15 = v93;
              }
              v51 = 0;
            }
          }
          else
          {
            log = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            {
              v70 = (objc_class *)objc_opt_class();
              NSStringFromClass(v70);
              id v71 = v94 = v15;
              NSStringFromSelector(a2);
              v73 = double v72 = v12;
              *(_DWORD *)buf = 138412546;
              v107 = v71;
              __int16 v108 = 2112;
              v109 = v73;
              _os_log_error_impl(&dword_25B6E0000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerType", buf, 0x16u);

              v12 = v72;
              id v15 = v94;
            }
            v51 = 0;
            int v43 = v99;
          }
        }
        else
        {
          int v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            v67 = (objc_class *)objc_opt_class();
            id v68 = NSStringFromClass(v67);
            v69 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v107 = v68;
            __int16 v108 = 2112;
            v109 = v69;
            _os_log_error_impl(&dword_25B6E0000, v43, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing triggerDate", buf, 0x16u);
          }
          v51 = 0;
        }
      }
      else
      {
        v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v64 = (objc_class *)objc_opt_class();
          uint64_t v65 = NSStringFromClass(v64);
          v66 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v107 = v65;
          __int16 v108 = 2112;
          v109 = v66;
          _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
        }
        v51 = 0;
      }
    }
    else
    {
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v57 = (objc_class *)objc_opt_class();
        id v58 = NSStringFromClass(v57);
        v59 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v107 = v58;
        __int16 v108 = 2112;
        v109 = v59;
        _os_log_error_impl(&dword_25B6E0000, v11, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
      }
      v51 = 0;
    }
  }
  else
  {
    int v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v54 = (objc_class *)objc_opt_class();
      uint32_t v55 = NSStringFromClass(v54);
      int v56 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v107 = v55;
      __int16 v108 = 2112;
      v109 = v56;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v51 = 0;
  }

LABEL_29:
  return v51;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (RTLocation)locationOfTrigger
{
  return self->_locationOfTrigger;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (NSData)safetyCacheToken
{
  return self->_safetyCacheToken;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (BOOL)isSOSTrigger
{
  return self->_isSOSTrigger;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyCacheToken, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_locationOfTrigger, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
}

@end