@interface SMSessionStartMessage
+ (BOOL)supportsSecureCoding;
+ (unint64_t)messageType;
- (NSData)destinationMapItem;
- (NSDate)coarseEstimatedEndTime;
- (NSDate)estimatedEndTime;
- (NSDictionary)invitationTokenDict;
- (SMSessionStartMessage)initWithCoder:(id)a3;
- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationToken:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12;
- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationTokenDict:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12;
- (SMSessionStartMessage)initWithDictionary:(id)a3;
- (SMSessionStartMessage)initWithSessionID:(id)a3 invitationTokenDict:(id)a4 sessionType:(unint64_t)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9 lowPowerModeWarningState:(int64_t)a10;
- (SMSessionStartMessage)initWithURL:(id)a3;
- (id)outputToDictionary;
- (id)outputToURLComponents;
- (id)summaryText;
- (int64_t)lowPowerModeWarningState;
- (unint64_t)destinationType;
- (unint64_t)sessionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionStartMessage

- (SMSessionStartMessage)initWithSessionID:(id)a3 invitationTokenDict:(id)a4 sessionType:(unint64_t)a5 estimatedEndTime:(id)a6 coarseEstimatedEndTime:(id)a7 destinationType:(unint64_t)a8 destinationMapItem:(id)a9 lowPowerModeWarningState:(int64_t)a10
{
  v16 = (void *)MEMORY[0x263EFF910];
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  id v21 = a3;
  v22 = [v16 now];
  v23 = [MEMORY[0x263F08C38] UUID];
  v24 = [(SMSessionStartMessage *)self initWithDate:v22 messageID:v23 sessionID:v21 invitationTokenDict:v20 sessionType:a5 estimatedEndTime:v19 coarseEstimatedEndTime:v18 destinationType:a8 destinationMapItem:v17 lowPowerModeWarningState:a10];

  return v24;
}

- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationToken:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12
{
  v31[1] = *MEMORY[0x263EF8340];
  v30 = @"receiverHandle";
  v31[0] = a6;
  id v17 = NSDictionary;
  id v18 = a11;
  id v19 = a9;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [v17 dictionaryWithObjects:v31 forKeys:&v30 count:1];

  v26 = [(SMSessionStartMessage *)self initWithDate:v24 messageID:v23 sessionID:v22 invitationTokenDict:v25 sessionType:a7 estimatedEndTime:v20 coarseEstimatedEndTime:v19 destinationType:a10 destinationMapItem:v18 lowPowerModeWarningState:a12];
  return v26;
}

- (SMSessionStartMessage)initWithDate:(id)a3 messageID:(id)a4 sessionID:(id)a5 invitationTokenDict:(id)a6 sessionType:(unint64_t)a7 estimatedEndTime:(id)a8 coarseEstimatedEndTime:(id)a9 destinationType:(unint64_t)a10 destinationMapItem:(id)a11 lowPowerModeWarningState:(int64_t)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v33 = a6;
  id v32 = a8;
  id v21 = a9;
  id v22 = a11;
  if (!v18)
  {
    v26 = v22;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: date";
LABEL_20:
    _os_log_error_impl(&dword_25B6E0000, v27, OS_LOG_TYPE_ERROR, v28, buf, 2u);
    goto LABEL_21;
  }
  if (!v19)
  {
    v26 = v22;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: messageID";
    goto LABEL_20;
  }
  if (!v20)
  {
    v26 = v22;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: sessionID";
    goto LABEL_20;
  }
  if (!v33)
  {
    v26 = v22;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v28 = "Invalid parameter not satisfying: invitationTokenDict";
    goto LABEL_20;
  }
  if (!v32)
  {
    v26 = v22;
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v28 = "Invalid parameter not satisfying: estimatedEndTime";
      goto LABEL_20;
    }
LABEL_21:

    v25 = 0;
    goto LABEL_22;
  }
  id v31 = v22;
  if (a7)
  {
    v34.receiver = self;
    v34.super_class = (Class)SMSessionStartMessage;
    id v23 = [(SMMessage *)&v34 initWithDate:v18 messageID:v19 sessionID:v20];
    id v24 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_invitationTokenDict, a6);
      v24->_sessionType = a7;
      objc_storeStrong((id *)&v24->_estimatedEndTime, a8);
      objc_storeStrong((id *)&v24->_coarseEstimatedEndTime, a9);
      v24->_destinationType = a10;
      objc_storeStrong((id *)&v24->_destinationMapItem, a11);
      v24->_lowPowerModeWarningState = a12;
    }
    self = v24;
    v25 = self;
  }
  else
  {
    v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionType != SMSessionTypeUnknown", buf, 2u);
    }

    v25 = 0;
  }
  v26 = v31;
LABEL_22:

  return v25;
}

- (SMSessionStartMessage)initWithDictionary:(id)a3
{
  uint64_t v141 = *MEMORY[0x263EF8340];
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
    goto LABEL_38;
  }
  v7 = [v5 valueForKey:@"messageType"];
  int v8 = [v7 intValue];

  if ([(id)objc_opt_class() messageType] != v8)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_38:
      v56 = 0;
      goto LABEL_39;
    }
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    NSStringFromSelector(a2);
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v133 = v51;
    __int16 v134 = 2112;
    v135 = v52;
    __int16 v136 = 1024;
    *(_DWORD *)v137 = [(id)objc_opt_class() messageType];
    *(_WORD *)&v137[4] = 1024;
    *(_DWORD *)&v137[6] = v8;
    v53 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    v54 = v12;
    uint32_t v55 = 34;
LABEL_59:
    _os_log_error_impl(&dword_25B6E0000, v54, OS_LOG_TYPE_ERROR, v53, buf, v55);

    goto LABEL_38;
  }
  v9 = [v6 valueForKey:@"interfaceVersion"];
  int v10 = [v9 intValue];

  if (v10 != 1)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_38;
    }
    v71 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v71);
    NSStringFromSelector(a2);
    v52 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v133 = v51;
    __int16 v134 = 2112;
    v135 = v52;
    __int16 v136 = 1024;
    *(_DWORD *)v137 = v10;
    v53 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    v54 = v12;
    uint32_t v55 = 28;
    goto LABEL_59;
  }
  v11 = [v6 valueForKey:@"sendDate"];
  v12 = v11;
  if (!v11)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v80 = (objc_class *)objc_opt_class();
      v81 = NSStringFromClass(v80);
      NSStringFromSelector(a2);
      v82 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v81;
      __int16 v134 = 2112;
      v135 = v82;
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    v56 = 0;
    goto LABEL_87;
  }
  aSelector = a2;
  v13 = (void *)MEMORY[0x263EFF910];
  [v11 doubleValue];
  v14 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
  id v15 = objc_alloc(MEMORY[0x263F08C38]);
  v16 = [v6 valueForKey:@"messageID"];
  id v17 = (void *)[v15 initWithUUIDString:v16];

  if (!v17)
  {
    id v20 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v88 = (objc_class *)objc_opt_class();
      v89 = NSStringFromClass(v88);
      NSStringFromSelector(aSelector);
      v90 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v89;
      __int16 v134 = 2112;
      v135 = v90;
      _os_log_error_impl(&dword_25B6E0000, v20, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
    }
    v56 = 0;
    goto LABEL_86;
  }
  id v18 = objc_alloc(MEMORY[0x263F08C38]);
  id v19 = [v6 valueForKey:@"sessionID"];
  id v20 = [v18 initWithUUIDString:v19];

  if (!v20)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v91 = (objc_class *)objc_opt_class();
      v92 = NSStringFromClass(v91);
      NSStringFromSelector(aSelector);
      v93 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v133 = v92;
      __int16 v134 = 2112;
      v135 = v93;
      _os_log_error_impl(&dword_25B6E0000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
    }
    v56 = 0;
    goto LABEL_85;
  }
  v113 = v20;
  v114 = v17;
  v111 = v12;
  v112 = v14;
  v115 = self;
  log = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v21 = 0;
  id v22 = 0;
  id v23 = 0;
  id v24 = 0;
  v25 = 0;
  for (int i = 0; ; ++i)
  {
    v129 = v22;
    if (!i) {
      break;
    }
    v126 = v21;
    uint64_t v27 = (i + 1);
    v28 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", v27);
    uint64_t v127 = [v6 valueForKey:v28];

    v29 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", v27);
    v30 = v6;
    uint64_t v31 = [v6 valueForKey:v29];

    v128 = (void *)v31;
    int v123 = i;
    if (v31) {
      uint64_t v32 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v31 options:0];
    }
    else {
      uint64_t v32 = 0;
    }
    v36 = NSURL;
    v37 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", (i + 1));
    v38 = [v30 valueForKey:v37];
    uint64_t v39 = [v36 URLWithString:v38];

    v40 = objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", v27);
    v41 = (void *)v39;
    v42 = [v30 valueForKey:v40];

    v25 = (__CFString *)v127;
    v35 = (void *)v32;
    if (!v127 || !v32 || !v39 || !v42)
    {
      v58 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      self = v115;
      id v21 = v126;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        v59 = (objc_class *)objc_opt_class();
        v60 = NSStringFromClass(v59);
        NSStringFromSelector(aSelector);
        v61 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v133 = v60;
        __int16 v134 = 2112;
        v135 = v61;
        __int16 v136 = 1024;
        *(_DWORD *)v137 = v123;
        _os_log_impl(&dword_25B6E0000, v58, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);
      }
      v6 = v30;
      v62 = [v30 valueForKey:@"sessionType"];
      int v63 = [v62 intValue];

      if (v63)
      {
        v64 = [v30 valueForKey:@"estimatedEndTime"];
        id v20 = v113;
        id v17 = v114;
        v131 = v64;
        if (v64)
        {
          v65 = (void *)MEMORY[0x263EFF910];
          [v64 doubleValue];
          objc_msgSend(v65, "dateWithTimeIntervalSince1970:");
          os_log_t v124 = (os_log_t)objc_claimAutoreleasedReturnValue();
          v66 = [v6 valueForKey:@"coarseEstimatedEndTime"];
          v67 = v66;
          if (v66)
          {
            v68 = (void *)MEMORY[0x263EFF910];
            [v66 doubleValue];
            uint64_t v69 = objc_msgSend(v68, "dateWithTimeIntervalSince1970:");
          }
          else
          {
            v73 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              v103 = (objc_class *)objc_opt_class();
              v104 = NSStringFromClass(v103);
              NSStringFromSelector(aSelector);
              v105 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v133 = v104;
              __int16 v134 = 2112;
              v135 = v105;
              _os_log_error_impl(&dword_25B6E0000, v73, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTimeNumber", buf, 0x16u);
            }
            uint64_t v69 = 0;
          }
          v74 = [v6 valueForKey:@"sessionDestinationType"];
          v75 = v74;
          v121 = (void *)v69;
          v122 = v67;
          if (v74)
          {
            int v76 = [v74 intValue];
            v77 = [v6 valueForKey:@"sessionDestinationMapItem"];
            uint64_t v120 = v63;
            if (v77) {
              v78 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v77 options:0];
            }
            else {
              v78 = 0;
            }
            uint64_t v83 = v76;
            v84 = [v6 valueForKey:@"lowPowerModeWarningState"];
            v85 = v84;
            if (v84)
            {
              uint64_t v86 = (int)[v84 intValue];
            }
            else
            {
              v119 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
              {
                v109 = (objc_class *)objc_opt_class();
                v110 = NSStringFromClass(v109);
                NSStringFromSelector(aSelector);
                aSelectora = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v133 = v110;
                __int16 v134 = 2112;
                v135 = aSelectora;
                _os_log_error_impl(&dword_25B6E0000, v119, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);
              }
              uint64_t v86 = 0;
            }
            v79 = v121;
            v87 = [(SMSessionStartMessage *)v115 initWithDate:v112 messageID:v114 sessionID:v113 invitationTokenDict:log sessionType:v120 estimatedEndTime:v124 coarseEstimatedEndTime:v121 destinationType:v83 destinationMapItem:v78 lowPowerModeWarningState:v86];

            self = v87;
            v56 = v87;
            id v21 = v126;
          }
          else
          {
            v77 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
            {
              v106 = (objc_class *)objc_opt_class();
              v107 = NSStringFromClass(v106);
              NSStringFromSelector(aSelector);
              v108 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v133 = v107;
              __int16 v134 = 2112;
              v135 = v108;
              _os_log_error_impl(&dword_25B6E0000, v77, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              self = v115;
              id v21 = v126;

              v56 = 0;
            }
            else
            {
              v56 = 0;
              self = v115;
            }
            v79 = v121;
          }

          id v20 = v113;
          id v17 = v114;
          v72 = v124;
        }
        else
        {
          v72 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v100 = (objc_class *)objc_opt_class();
            NSStringFromClass(v100);
            v101 = v125 = v72;
            NSStringFromSelector(aSelector);
            v102 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v133 = v101;
            __int16 v134 = 2112;
            v135 = v102;
            _os_log_error_impl(&dword_25B6E0000, v125, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTimeNumber", buf, 0x16u);

            v72 = v125;
          }
          v56 = 0;
        }

        v70 = (void *)v127;
      }
      else
      {
        v131 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        id v20 = v113;
        id v17 = v114;
        v70 = (void *)v127;
        if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        {
          v97 = (objc_class *)objc_opt_class();
          v98 = NSStringFromClass(v97);
          NSStringFromSelector(aSelector);
          v99 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v133 = v98;
          __int16 v134 = 2112;
          v135 = v99;
          _os_log_error_impl(&dword_25B6E0000, v131, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

          v70 = (void *)v127;
        }
        v56 = 0;
      }
      goto LABEL_84;
    }
    id v22 = v42;
    id v23 = (void *)v39;
    id v24 = v128;
    id v21 = v126;
    v6 = v30;
    int i = v123;
LABEL_27:
    uint64_t v45 = [objc_alloc(MEMORY[0x263EFD670]) initWithSharingInvitationData:v35 shareURL:v23 participantID:v22];

    if (v45)
    {
      [log setObject:v45 forKey:v25];
    }
    else
    {
      v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        NSStringFromSelector(aSelector);
        v130 = v22;
        v49 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v133 = v48;
        __int16 v134 = 2112;
        v135 = v49;
        _os_log_fault_impl(&dword_25B6E0000, v46, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);

        id v22 = v130;
      }
    }
    id v21 = (void *)v45;
  }
  uint64_t v33 = [v6 valueForKey:@"receiverHandle"];

  if (v33) {
    v25 = (__CFString *)v33;
  }
  else {
    v25 = @"receiverHandle";
  }
  uint64_t v34 = [v6 valueForKey:@"sharingInvitationData"];

  v128 = (void *)v34;
  if (v34) {
    v35 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v34 options:0];
  }
  else {
    v35 = 0;
  }
  v43 = NSURL;
  v44 = [v6 valueForKey:@"shareURL"];
  v41 = [v43 URLWithString:v44];

  v42 = [v6 valueForKey:@"participantID"];

  if (v35 && v41 && v42)
  {
    id v22 = v42;
    id v23 = v41;
    id v24 = v128;
    goto LABEL_27;
  }
  v131 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
  {
    v94 = (objc_class *)objc_opt_class();
    v95 = NSStringFromClass(v94);
    NSStringFromSelector(aSelector);
    v96 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v133 = v95;
    __int16 v134 = 2112;
    v135 = v96;
    __int16 v136 = 2112;
    *(void *)v137 = v35;
    *(_WORD *)&v137[8] = 2112;
    v138 = v41;
    __int16 v139 = 2112;
    v140 = v42;
    _os_log_error_impl(&dword_25B6E0000, v131, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);
  }
  v56 = 0;
  v70 = v25;
  self = v115;
  id v20 = v113;
  id v17 = v114;
LABEL_84:

  v12 = v111;
  v14 = v112;
LABEL_85:

LABEL_86:
LABEL_87:

LABEL_39:
  return v56;
}

- (id)outputToDictionary
{
  v27.receiver = self;
  v27.super_class = (Class)SMSessionStartMessage;
  v3 = [(SMMessage *)&v27 outputToDictionary];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  int v26 = 0;
  v4 = [(SMSessionStartMessage *)self invitationTokenDict];
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  id v21 = __43__SMSessionStartMessage_outputToDictionary__block_invoke;
  id v22 = &unk_265499840;
  id v24 = v25;
  id v5 = v3;
  id v23 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:&v19];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionStartMessage sessionType](self, "sessionType", v19, v20, v21, v22));
  [v5 setObject:v6 forKey:@"sessionType"];

  v7 = NSNumber;
  int v8 = [(SMSessionStartMessage *)self estimatedEndTime];
  [v8 timeIntervalSince1970];
  v9 = objc_msgSend(v7, "numberWithDouble:");
  [v5 setObject:v9 forKey:@"estimatedEndTime"];

  int v10 = [(SMSessionStartMessage *)self coarseEstimatedEndTime];

  if (v10)
  {
    v11 = NSNumber;
    v12 = [(SMSessionStartMessage *)self coarseEstimatedEndTime];
    [v12 timeIntervalSince1970];
    v13 = objc_msgSend(v11, "numberWithDouble:");
    [v5 setObject:v13 forKey:@"coarseEstimatedEndTime"];
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  [v5 setObject:v14 forKey:@"sessionDestinationType"];

  id v15 = [(SMSessionStartMessage *)self destinationMapItem];

  if (v15)
  {
    v16 = [(SMSessionStartMessage *)self destinationMapItem];
    id v17 = [v16 base64EncodedStringWithOptions:0];
    [v5 setObject:v17 forKey:@"sessionDestinationMapItem"];
  }
  _Block_object_dispose(v25, 8);
  return v5;
}

void __43__SMSessionStartMessage_outputToDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = a3;
  id v8 = a2;
  if (v6 == 1)
  {
    [v5 setObject:v8 forKey:@"receiverHandle"];

    v9 = *(void **)(a1 + 32);
    int v10 = [v7 sharingInvitationData];
    v11 = [v10 base64EncodedStringWithOptions:0];
    [v9 setObject:v11 forKey:@"sharingInvitationData"];

    v12 = *(void **)(a1 + 32);
    v13 = [v7 shareURL];
    v14 = [v13 absoluteString];
    [v12 setObject:v14 forKey:@"shareURL"];

    id v15 = *(void **)(a1 + 32);
    id v27 = [v7 participantID];

    [v15 setObject:v27 forKey:@"participantID"];
  }
  else
  {
    v16 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", v6);
    [v5 setObject:v8 forKey:v16];

    id v17 = *(void **)(a1 + 32);
    id v18 = [v7 sharingInvitationData];
    uint64_t v19 = [v18 base64EncodedStringWithOptions:0];
    uint64_t v20 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v17 setObject:v19 forKey:v20];

    id v21 = *(void **)(a1 + 32);
    id v22 = [v7 shareURL];
    id v23 = [v22 absoluteString];
    id v24 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v21 setObject:v23 forKey:v24];

    v25 = *(void **)(a1 + 32);
    id v27 = [v7 participantID];

    int v26 = objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v25 setObject:v27 forKey:v26];
  }
}

- (SMSessionStartMessage)initWithURL:(id)a3
{
  uint64_t v188 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: url", buf, 2u);
    }
    v61 = 0;
    goto LABEL_96;
  }
  v4 = [objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v103 = (objc_class *)objc_opt_class();
      v104 = NSStringFromClass(v103);
      v105 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v179 = v104;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v105;
      _os_log_error_impl(&dword_25B6E0000, v6, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing url components", buf, 0x16u);

      id v5 = 0;
    }
    v61 = 0;
    goto LABEL_95;
  }
  uint64_t v6 = [v4 queryItems];
  if (!v6)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v112 = (objc_class *)objc_opt_class();
      NSStringFromClass(v112);
      v114 = v113 = v5;
      v115 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v179 = v114;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v115;
      _os_log_error_impl(&dword_25B6E0000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing queryItems", buf, 0x16u);

      id v5 = v113;
    }
    v61 = 0;
    goto LABEL_94;
  }
  v150 = v5;
  id v152 = v3;
  id v163 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v161 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v160 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v159 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v174 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  v153 = v6;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v174 objects:v187 count:16];
  if (!v8)
  {
    v154 = 0;
    v155 = 0;
    v151 = 0;
    v156 = 0;
    v157 = 0;
    uint64_t v149 = 0;
    v170 = 0;
    v172 = 0;
    v173 = 0;
    v166 = 0;
    log = 0;
    goto LABEL_58;
  }
  uint64_t v9 = v8;
  v154 = 0;
  v155 = 0;
  v151 = 0;
  v156 = 0;
  v157 = 0;
  uint64_t v149 = 0;
  v170 = 0;
  v172 = 0;
  v173 = 0;
  v166 = 0;
  log = 0;
  uint64_t v10 = *(void *)v175;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v175 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v174 + 1) + 8 * v11);
      v13 = [v12 value];
      if (!v13)
      {
        id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v30 = (objc_class *)objc_opt_class();
          uint64_t v31 = NSStringFromClass(v30);
          uint64_t v32 = NSStringFromSelector(a2);
          uint64_t v33 = [v12 name];
          *(_DWORD *)buf = 138412802;
          v179 = v31;
          __int16 v180 = 2112;
          uint64_t v181 = (uint64_t)v32;
          __int16 v182 = 2112;
          *(void *)v183 = v33;
          _os_log_error_impl(&dword_25B6E0000, v17, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,queryItem missing value,queryName,%@", buf, 0x20u);
        }
        goto LABEL_14;
      }
      v14 = [v12 name];
      int v15 = [v14 isEqualToString:@"sendDate"];

      if (v15)
      {
        id v16 = v13;

        v173 = v16;
        goto LABEL_23;
      }
      id v18 = [v12 name];
      int v19 = [v18 isEqualToString:@"messageID"];

      if (v19)
      {
        uint64_t v20 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];

        v172 = (void *)v20;
      }
      else
      {
        id v21 = [v12 name];
        int v22 = [v21 isEqualToString:@"sessionID"];

        if (v22)
        {
          uint64_t v23 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];

          v170 = (void *)v23;
        }
        else
        {
          id v24 = [v12 name];
          int v25 = [v24 isEqualToString:@"messageType"];

          if (v25)
          {
            int v26 = v13;

            log = v26;
          }
          else
          {
            id v27 = [v12 name];
            int v28 = [v27 isEqualToString:@"interfaceVersion"];

            if (v28)
            {
              id v29 = v13;

              v166 = v29;
            }
            else
            {
              uint64_t v34 = [v12 name];
              int v35 = [v34 hasPrefix:@"receiverHandle"];

              v36 = [v12 name];
              id v17 = v36;
              if (v35)
              {
                v37 = v163;
                goto LABEL_33;
              }
              int v38 = [v36 hasPrefix:@"sharingInvitationData"];

              uint64_t v39 = [v12 name];
              id v17 = v39;
              if (v38)
              {
                v37 = v161;
                goto LABEL_33;
              }
              int v40 = [v39 hasPrefix:@"shareURL"];

              v41 = [v12 name];
              id v17 = v41;
              if (v40)
              {
                v37 = v160;
                goto LABEL_33;
              }
              int v42 = [v41 hasPrefix:@"participantID"];

              v43 = [v12 name];
              id v17 = v43;
              if (v42)
              {
                v37 = v159;
LABEL_33:
                [v37 setObject:v13 forKey:v17];
LABEL_14:

                goto LABEL_23;
              }
              int v44 = [v43 isEqualToString:@"sessionType"];

              if (v44)
              {
                uint64_t v149 = (int)[v13 intValue];
              }
              else
              {
                uint64_t v45 = [v12 name];
                int v46 = [v45 isEqualToString:@"estimatedEndTime"];

                if (v46)
                {
                  id v47 = v13;

                  v157 = v47;
                }
                else
                {
                  v48 = [v12 name];
                  int v49 = [v48 isEqualToString:@"coarseEstimatedEndTime"];

                  if (v49)
                  {
                    id v50 = v13;

                    v156 = v50;
                  }
                  else
                  {
                    v51 = [v12 name];
                    int v52 = [v51 isEqualToString:@"sessionDestinationType"];

                    if (v52)
                    {
                      id v53 = v13;

                      v155 = v53;
                    }
                    else
                    {
                      v54 = [v12 name];
                      int v55 = [v54 isEqualToString:@"sessionDestinationMapItem"];

                      if (v55)
                      {
                        v56 = v13;

                        v154 = v56;
                      }
                      else
                      {
                        v57 = [v12 name];
                        int v58 = [v57 isEqualToString:@"lowPowerModeWarningState"];

                        if (v58)
                        {
                          id v59 = v13;

                          v151 = v59;
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
LABEL_23:

      ++v11;
    }
    while (v9 != v11);
    uint64_t v60 = [v7 countByEnumeratingWithState:&v174 objects:v187 count:16];
    uint64_t v9 = v60;
  }
  while (v60);
LABEL_58:

  int v62 = [log intValue];
  if (!log || [(id)objc_opt_class() messageType] != v62)
  {
    v68 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v3 = v152;
    uint64_t v6 = v153;
    v65 = v154;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v106 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v106);
      v96 = NSStringFromSelector(a2);
      int v107 = [(id)objc_opt_class() messageType];
      *(_DWORD *)buf = 138413058;
      v179 = v95;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v96;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v107;
      *(_WORD *)&v183[4] = 1024;
      *(_DWORD *)&v183[6] = v62;
      v97 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
      v98 = v68;
      uint32_t v99 = 34;
      goto LABEL_102;
    }
LABEL_92:
    v61 = 0;
    id v5 = v150;
    goto LABEL_93;
  }
  int v63 = [v166 intValue];
  int v64 = v63;
  id v3 = v152;
  uint64_t v6 = v153;
  v65 = v154;
  if (!v166 || v63 != 1)
  {
    v68 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v94 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v94);
      v96 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v179 = v95;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v96;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v64;
      v97 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
      v98 = v68;
      uint32_t v99 = 28;
LABEL_102:
      _os_log_error_impl(&dword_25B6E0000, v98, OS_LOG_TYPE_ERROR, v97, buf, v99);

      goto LABEL_92;
    }
    goto LABEL_92;
  }
  if (!v173)
  {
    v68 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v100 = (objc_class *)objc_opt_class();
      v101 = NSStringFromClass(v100);
      v102 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v179 = v101;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v102;
      _os_log_error_impl(&dword_25B6E0000, v68, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    goto LABEL_92;
  }
  v66 = (void *)MEMORY[0x263EFF910];
  [v173 doubleValue];
  uint64_t v67 = objc_msgSend(v66, "dateWithTimeIntervalSince1970:");
  v68 = v67;
  if (!v172)
  {
    v162 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v5 = v150;
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
    {
LABEL_112:
      v61 = 0;
      goto LABEL_136;
    }
    v108 = (objc_class *)objc_opt_class();
    v109 = NSStringFromClass(v108);
    v110 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v179 = v109;
    __int16 v180 = 2112;
    uint64_t v181 = (uint64_t)v110;
    v111 = "#SafetyCache,%@,%@,missing messageID";
LABEL_138:
    _os_log_error_impl(&dword_25B6E0000, v162, OS_LOG_TYPE_ERROR, v111, buf, 0x16u);

    id v5 = v150;
    goto LABEL_112;
  }
  if (!v170)
  {
    v162 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    id v5 = v150;
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    v137 = (objc_class *)objc_opt_class();
    v109 = NSStringFromClass(v137);
    v110 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v179 = v109;
    __int16 v180 = 2112;
    uint64_t v181 = (uint64_t)v110;
    v111 = "#SafetyCache,%@,%@,missing sessionID";
    goto LABEL_138;
  }
  v158 = v67;
  v162 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v69 = 0;
  v70 = 0;
  v71 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  [v163 valueForKey:@"receiverHandle"];
  uint64_t v79 = LABEL_68:;

  if (v79) {
    v70 = (__CFString *)v79;
  }
  else {
    v70 = @"receiverHandle";
  }
  v77 = [v161 valueForKey:@"sharingInvitationData"];

  if (v77) {
    v78 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v77 options:0];
  }
  else {
    v78 = 0;
  }
  uint64_t v86 = NSURL;
  v87 = [v160 valueForKey:@"shareURL"];
  uint64_t v83 = [v86 URLWithString:v87];

  v85 = [v159 valueForKey:@"participantID"];

  if (v78 && v83 && v85)
  {
    v71 = v77;
    v72 = v83;
    v73 = v85;
    while (1)
    {
      uint64_t v88 = [objc_alloc(MEMORY[0x263EFD670]) initWithSharingInvitationData:v78 shareURL:v72 participantID:v73];

      if (v88)
      {
        [v162 setObject:v88 forKey:v70];
      }
      else
      {
        v89 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
        {
          v90 = (objc_class *)objc_opt_class();
          v91 = NSStringFromClass(v90);
          v92 = NSStringFromSelector(a2);
          *(_DWORD *)buf = 138412546;
          v179 = v91;
          __int16 v180 = 2112;
          uint64_t v181 = (uint64_t)v92;
          _os_log_fault_impl(&dword_25B6E0000, v89, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);
        }
      }

      ++v69;
      v74 = (void *)v88;
      if (!v69)
      {
        [v163 valueForKey:@"receiverHandle"];
        goto LABEL_68;
      }
      v171 = (void *)v88;
      v75 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", (v69 + 1));
      uint64_t v169 = [v163 valueForKey:v75];

      int v76 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", (v69 + 1));
      v77 = [v161 valueForKey:v76];

      v78 = v77
          ? (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v77 options:0]
          : 0;
      v80 = NSURL;
      v81 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", (v69 + 1));
      v82 = [v160 valueForKey:v81];
      uint64_t v83 = [v80 URLWithString:v82];

      v84 = objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", (v69 + 1));
      v85 = [v159 valueForKey:v84];

      v70 = (__CFString *)v169;
      if (!v169 || !v78 || !v83 || !v85) {
        break;
      }
      v71 = v77;
      v72 = v83;
      v73 = v85;
      v74 = v171;
    }
    v116 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
    {
      v117 = (objc_class *)objc_opt_class();
      v118 = NSStringFromClass(v117);
      v119 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v179 = v118;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v119;
      __int16 v182 = 1024;
      *(_DWORD *)v183 = v69;
      _os_log_impl(&dword_25B6E0000, v116, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);
    }
    v68 = v158;
    if (v149)
    {
      id v3 = v152;
      if (v157)
      {
        uint64_t v120 = (void *)MEMORY[0x263EFF910];
        [v157 doubleValue];
        v121 = objc_msgSend(v120, "dateWithTimeIntervalSince1970:");
        if (v156)
        {
          v122 = (void *)MEMORY[0x263EFF910];
          [v156 doubleValue];
          int v123 = objc_msgSend(v122, "dateWithTimeIntervalSince1970:");
        }
        else
        {
          v128 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
          {
            v142 = (objc_class *)objc_opt_class();
            v143 = NSStringFromClass(v142);
            v144 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v179 = v143;
            __int16 v180 = 2112;
            uint64_t v181 = (uint64_t)v144;
            _os_log_error_impl(&dword_25B6E0000, v128, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing coarseEstimatedEndTimeString", buf, 0x16u);

            v68 = v158;
          }

          int v123 = 0;
        }
        if (v155)
        {
          int v129 = [v155 intValue];
          v130 = v151;
          if (!v151)
          {
            v131 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
            {
              v132 = (objc_class *)objc_opt_class();
              v167 = NSStringFromClass(v132);
              uint64_t v133 = NSStringFromSelector(a2);
              *(_DWORD *)buf = 138412546;
              v179 = v167;
              __int16 v180 = 2112;
              uint64_t v181 = v133;
              __int16 v134 = (void *)v133;
              _os_log_impl(&dword_25B6E0000, v131, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState", buf, 0x16u);
            }
            v130 = 0;
          }
          uint64_t v135 = (int)[v130 intValue];
          __int16 v136 = v154;
          if (v154) {
            __int16 v136 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v154 options:0];
          }
          uint64_t v148 = v135;
          v68 = v158;
          v61 = [(SMSessionStartMessage *)self initWithDate:v158 messageID:v172 sessionID:v170 invitationTokenDict:v162 sessionType:v149 estimatedEndTime:v121 coarseEstimatedEndTime:v123 destinationType:v129 destinationMapItem:v136 lowPowerModeWarningState:v148];
          self = v61;
        }
        else
        {
          __int16 v136 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            v145 = (objc_class *)objc_opt_class();
            v146 = NSStringFromClass(v145);
            v147 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138412546;
            v179 = v146;
            __int16 v180 = 2112;
            uint64_t v181 = (uint64_t)v147;
            _os_log_error_impl(&dword_25B6E0000, v136, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

            v68 = v158;
          }
          v61 = 0;
        }

        v70 = (__CFString *)v169;
        goto LABEL_135;
      }
      v121 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
      {
LABEL_119:
        v61 = 0;
        goto LABEL_135;
      }
      uint64_t v141 = (objc_class *)objc_opt_class();
      v125 = NSStringFromClass(v141);
      v126 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v179 = v125;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v126;
      uint64_t v127 = "#SafetyCache,%@,%@,missing estimatedEndTimeString";
    }
    else
    {
      v121 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      id v3 = v152;
      if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
        goto LABEL_119;
      }
      os_log_t v124 = (objc_class *)objc_opt_class();
      v125 = NSStringFromClass(v124);
      v126 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v179 = v125;
      __int16 v180 = 2112;
      uint64_t v181 = (uint64_t)v126;
      uint64_t v127 = "#SafetyCache,%@,%@,missing sessionType";
    }
    _os_log_error_impl(&dword_25B6E0000, v121, OS_LOG_TYPE_ERROR, v127, buf, 0x16u);

    goto LABEL_119;
  }
  v171 = v74;
  v121 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
  {
    v138 = (objc_class *)objc_opt_class();
    __int16 v139 = NSStringFromClass(v138);
    v140 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413314;
    v179 = v139;
    __int16 v180 = 2112;
    uint64_t v181 = (uint64_t)v140;
    __int16 v182 = 2112;
    *(void *)v183 = v78;
    *(_WORD *)&v183[8] = 2112;
    v184 = v83;
    __int16 v185 = 2112;
    v186 = v85;
    _os_log_error_impl(&dword_25B6E0000, v121, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);
  }
  v61 = 0;
  id v3 = v152;
  v68 = v158;
LABEL_135:

  id v5 = v150;
  uint64_t v6 = v153;
  v65 = v154;
LABEL_136:

LABEL_93:
LABEL_94:

LABEL_95:
LABEL_96:

  return v61;
}

- (id)outputToURLComponents
{
  id v3 = objc_alloc_init(MEMORY[0x263F08BA0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  v46.receiver = self;
  v46.super_class = (Class)SMSessionStartMessage;
  id v5 = [(SMMessage *)&v46 outputToURLComponents];
  uint64_t v6 = [v5 queryItems];
  [v4 addObjectsFromArray:v6];

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  int v45 = 0;
  id v7 = [(SMSessionStartMessage *)self invitationTokenDict];
  uint64_t v38 = MEMORY[0x263EF8330];
  uint64_t v39 = 3221225472;
  int v40 = __46__SMSessionStartMessage_outputToURLComponents__block_invoke;
  v41 = &unk_265499840;
  v43 = v44;
  id v8 = v4;
  id v42 = v8;
  [v7 enumerateKeysAndObjectsUsingBlock:&v38];

  id v9 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionStartMessage sessionType](self, "sessionType", v38, v39, v40, v41));
  uint64_t v11 = [v10 stringValue];
  v12 = (void *)[v9 initWithName:@"sessionType" value:v11];
  [v8 addObject:v12];

  v13 = NSNumber;
  v14 = [(SMSessionStartMessage *)self estimatedEndTime];
  [v14 timeIntervalSince1970];
  int v15 = objc_msgSend(v13, "numberWithDouble:");
  id v16 = [v15 stringValue];

  id v17 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"estimatedEndTime" value:v16];
  [v8 addObject:v17];

  id v18 = [(SMSessionStartMessage *)self coarseEstimatedEndTime];

  if (v18)
  {
    int v19 = NSNumber;
    uint64_t v20 = [(SMSessionStartMessage *)self coarseEstimatedEndTime];
    [v20 timeIntervalSince1970];
    id v21 = objc_msgSend(v19, "numberWithDouble:");
    int v22 = [v21 stringValue];

    uint64_t v23 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:@"coarseEstimatedEndTime" value:v22];
    [v8 addObject:v23];
  }
  id v24 = objc_alloc(MEMORY[0x263F08BD0]);
  int v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  int v26 = [v25 stringValue];
  id v27 = (void *)[v24 initWithName:@"sessionDestinationType" value:v26];
  [v8 addObject:v27];

  int v28 = [(SMSessionStartMessage *)self destinationMapItem];

  if (v28)
  {
    id v29 = objc_alloc(MEMORY[0x263F08BD0]);
    v30 = [(SMSessionStartMessage *)self destinationMapItem];
    uint64_t v31 = [v30 base64EncodedStringWithOptions:0];
    uint64_t v32 = (void *)[v29 initWithName:@"sessionDestinationMapItem" value:v31];
    [v8 addObject:v32];
  }
  id v33 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v34 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMSessionStartMessage lowPowerModeWarningState](self, "lowPowerModeWarningState"));
  int v35 = [v34 stringValue];
  v36 = (void *)[v33 initWithName:@"lowPowerModeWarningState" value:v35];
  [v8 addObject:v36];

  [v3 setQueryItems:v8];
  _Block_object_dispose(v44, 8);

  return v3;
}

void __46__SMSessionStartMessage_outputToURLComponents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = *(void **)(a1 + 32);
  int v6 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = (objc_class *)MEMORY[0x263F08BD0];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 alloc];
  uint64_t v11 = v10;
  if (v6 == 1)
  {
    v12 = (void *)[v10 initWithName:@"receiverHandle" value:v9];

    [v5 addObject:v12];
    v13 = *(void **)(a1 + 32);
    id v14 = objc_alloc(MEMORY[0x263F08BD0]);
    int v15 = [v8 sharingInvitationData];
    id v16 = [v15 base64EncodedStringWithOptions:0];
    id v17 = (void *)[v14 initWithName:@"sharingInvitationData" value:v16];
    [v13 addObject:v17];

    id v18 = *(void **)(a1 + 32);
    id v19 = objc_alloc(MEMORY[0x263F08BD0]);
    uint64_t v20 = [v8 shareURL];
    id v21 = [v20 absoluteString];
    int v22 = (void *)[v19 initWithName:@"shareURL" value:v21];
    [v18 addObject:v22];

    uint64_t v23 = *(void **)(a1 + 32);
    id v24 = objc_alloc(MEMORY[0x263F08BD0]);
    id v43 = [v8 participantID];

    int v25 = (void *)[v24 initWithName:@"participantID" value:v43];
    [v23 addObject:v25];
  }
  else
  {
    int v26 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    id v27 = (void *)[v11 initWithName:v26 value:v9];

    [v5 addObject:v27];
    int v28 = *(void **)(a1 + 32);
    id v29 = objc_alloc(MEMORY[0x263F08BD0]);
    v30 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    uint64_t v31 = [v8 sharingInvitationData];
    uint64_t v32 = [v31 base64EncodedStringWithOptions:0];
    id v33 = (void *)[v29 initWithName:v30 value:v32];
    [v28 addObject:v33];

    uint64_t v34 = *(void **)(a1 + 32);
    id v35 = objc_alloc(MEMORY[0x263F08BD0]);
    v36 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    v37 = [v8 shareURL];
    uint64_t v38 = [v37 absoluteString];
    uint64_t v39 = (void *)[v35 initWithName:v36 value:v38];
    [v34 addObject:v39];

    int v40 = *(void **)(a1 + 32);
    id v41 = objc_alloc(MEMORY[0x263F08BD0]);
    objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    int v25 = [v8 participantID];

    id v42 = (void *)[v41 initWithName:v43 value:v25];
    [v40 addObject:v42];
  }
}

+ (unint64_t)messageType
{
  return 1;
}

- (id)summaryText
{
  switch([(SMSessionStartMessage *)self sessionType])
  {
    case 1uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"START_MESSAGE_TIME_BOUND_SUMMARY_FORMAT";
      int v6 = @"Check In: Timer Started";
      break;
    case 2uLL:
      unint64_t v7 = [(SMSessionStartMessage *)self destinationType];
      switch(v7)
      {
        case 3uLL:
          id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v4 = v3;
          id v5 = @"START_MESSAGE_SCHOOL_SUMMARY_FORMAT";
          int v6 = @"Check In: School";
          break;
        case 2uLL:
          id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v4 = v3;
          id v5 = @"START_MESSAGE_WORK_SUMMARY_FORMAT";
          int v6 = @"Check In: Work";
          break;
        case 1uLL:
          id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v4 = v3;
          id v5 = @"START_MESSAGE_HOME_SUMMARY_FORMAT";
          int v6 = @"Check In: Home";
          break;
        default:
          id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          id v4 = v3;
          id v5 = @"START_MESSAGE_DEFAULT_DESTINATION_SUMMARY_FORMAT";
          int v6 = @"Check In: Destination";
          break;
      }
      break;
    case 3uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"START_MESSAGE_ROUNDTRIP_DEFAULT_SUMMARY_FORMAT";
      int v6 = @"Check In: Round trip";
      break;
    case 4uLL:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"START_MESSAGE_WORKOUT_BOUND_SUMMARY_FORMAT";
      int v6 = @"Check In: Workout Started";
      break;
    default:
      id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v4 = v3;
      id v5 = @"CHECK_IN_MESSAGE";
      int v6 = @"Check In";
      break;
  }
  id v8 = [v3 localizedStringForKey:v5 value:v6 table:0];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMSessionStartMessage encodeWithCoder:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 620;
      _os_log_error_impl(&dword_25B6E0000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: encoder (in %s:%d)", buf, 0x12u);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SMSessionStartMessage;
  [(SMMessage *)&v20 encodeWithCoder:v4];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  int v22 = 0;
  int v6 = [(SMSessionStartMessage *)self invitationTokenDict];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __41__SMSessionStartMessage_encodeWithCoder___block_invoke;
  id v17 = &unk_265499840;
  id v19 = buf;
  id v7 = v4;
  id v18 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:&v14];

  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[SMSessionStartMessage sessionType](self, "sessionType", v14, v15, v16, v17));
  [v7 encodeObject:v8 forKey:@"sessionType"];

  id v9 = [(SMSessionStartMessage *)self estimatedEndTime];
  [v7 encodeObject:v9 forKey:@"estimatedEndTime"];

  id v10 = [(SMSessionStartMessage *)self coarseEstimatedEndTime];
  [v7 encodeObject:v10 forKey:@"coarseEstimatedEndTime"];

  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInt:", -[SMSessionStartMessage destinationType](self, "destinationType"));
  [v7 encodeObject:v11 forKey:@"sessionDestinationType"];

  v12 = [(SMSessionStartMessage *)self destinationMapItem];
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    v13 = [(SMSessionStartMessage *)self destinationMapItem];
    [v7 encodeObject:v13 forKey:@"sessionDestinationMapItem"];
  }
  _Block_object_dispose(buf, 8);
}

void __41__SMSessionStartMessage_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v7 = a3;
  id v8 = a2;
  if (v6 == 1)
  {
    [v5 encodeObject:v8 forKey:@"receiverHandle"];

    id v9 = *(void **)(a1 + 32);
    id v10 = [v7 sharingInvitationData];
    [v9 encodeObject:v10 forKey:@"sharingInvitationData"];

    uint64_t v11 = *(void **)(a1 + 32);
    v12 = [v7 shareURL];
    [v11 encodeObject:v12 forKey:@"shareURL"];

    v13 = *(void **)(a1 + 32);
    id v23 = [v7 participantID];

    [v13 encodeObject:v23 forKey:@"participantID"];
  }
  else
  {
    uint64_t v14 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", v6);
    [v5 encodeObject:v8 forKey:v14];

    uint64_t v15 = *(void **)(a1 + 32);
    id v16 = [v7 sharingInvitationData];
    id v17 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v15 encodeObject:v16 forKey:v17];

    id v18 = *(void **)(a1 + 32);
    id v19 = [v7 shareURL];
    objc_super v20 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v18 encodeObject:v19 forKey:v20];

    id v21 = *(void **)(a1 + 32);
    id v23 = [v7 participantID];

    int v22 = objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v21 encodeObject:v23 forKey:v22];
  }
}

- (SMSessionStartMessage)initWithCoder:(id)a3
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: decoder", buf, 2u);
    }
    goto LABEL_32;
  }
  uint64_t v7 = [v5 decodeIntegerForKey:@"messageType"];
  if ([(id)objc_opt_class() messageType] != v7)
  {
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
LABEL_32:
      int v44 = 0;
      goto LABEL_33;
    }
    v37 = (objc_class *)objc_opt_class();
    uint64_t v38 = NSStringFromClass(v37);
    uint64_t v39 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    uint32_t v99 = v38;
    __int16 v100 = 2112;
    v101 = v39;
    __int16 v102 = 1024;
    *(_DWORD *)v103 = [(id)objc_opt_class() messageType];
    *(_WORD *)&v103[4] = 1024;
    *(_DWORD *)&v103[6] = v7;
    int v40 = "#SafetyCache,%@,%@,extracted non-matching message type,expected,%d,got,%d";
    id v41 = v9;
    uint32_t v42 = 34;
LABEL_54:
    _os_log_error_impl(&dword_25B6E0000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

    goto LABEL_32;
  }
  uint64_t v8 = [v6 decodeIntegerForKey:@"interfaceVersion"];
  if (v8 != 1)
  {
    int v43 = v8;
    id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    id v59 = (objc_class *)objc_opt_class();
    uint64_t v38 = NSStringFromClass(v59);
    uint64_t v39 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    uint32_t v99 = v38;
    __int16 v100 = 2112;
    v101 = v39;
    __int16 v102 = 1024;
    *(_DWORD *)v103 = v43;
    int v40 = "#SafetyCache,%@,%@,unrecognized interface version,%d";
    id v41 = v9;
    uint32_t v42 = 28;
    goto LABEL_54;
  }
  id v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sendDate"];
  if (!v9)
  {
    id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v60 = (objc_class *)objc_opt_class();
      v61 = NSStringFromClass(v60);
      int v62 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint32_t v99 = v61;
      __int16 v100 = 2112;
      v101 = v62;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing date", buf, 0x16u);
    }
    int v44 = 0;
    goto LABEL_74;
  }
  id v10 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"messageID"];
  if (!v10)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      uint64_t v67 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint32_t v99 = v66;
      __int16 v100 = 2112;
      v101 = v67;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing messageID", buf, 0x16u);
    }
    int v44 = 0;
    goto LABEL_73;
  }
  uint64_t v11 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
  v12 = v11;
  if (!v11)
  {
    log = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v68 = (objc_class *)objc_opt_class();
      int v69 = NSStringFromClass(v68);
      v70 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint32_t v99 = v69;
      __int16 v100 = 2112;
      v101 = v70;
      _os_log_error_impl(&dword_25B6E0000, log, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionID", buf, 0x16u);
    }
    int v44 = 0;
    goto LABEL_72;
  }
  aSelector = a2;
  v85 = v9;
  uint64_t v86 = v11;
  v87 = v10;
  uint64_t v88 = self;
  log = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  id v16 = 0;
  id v17 = 0;
  for (int i = 0; ; ++i)
  {
    uint64_t v19 = objc_opt_class();
    if (!i) {
      break;
    }
    v96 = v13;
    uint64_t v20 = (i + 1);
    id v21 = objc_msgSend(@"receiverHandle", "stringByAppendingFormat:", @"%d", v20);
    int v22 = [v6 decodeObjectOfClass:v19 forKey:v21];

    uint64_t v23 = objc_opt_class();
    id v24 = objc_msgSend(@"sharingInvitationData", "stringByAppendingFormat:", @"%d", v20);
    int v25 = [v6 decodeObjectOfClass:v23 forKey:v24];

    uint64_t v26 = objc_opt_class();
    id v27 = objc_msgSend(@"shareURL", "stringByAppendingFormat:", @"%d", v20);
    int v28 = [v6 decodeObjectOfClass:v26 forKey:v27];

    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(@"participantID", "stringByAppendingFormat:", @"%d", v20);
    uint64_t v31 = [v6 decodeObjectOfClass:v29 forKey:v30];

    if (!v22 || !v25 || !v28 || !v31)
    {
      objc_super v46 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      self = v88;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        int v49 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412802;
        uint32_t v99 = v48;
        __int16 v100 = 2112;
        v101 = v49;
        __int16 v102 = 1024;
        *(_DWORD *)v103 = i;
        _os_log_impl(&dword_25B6E0000, v46, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,finished parsing invitation tokens,found %d tokens", buf, 0x1Cu);
      }
      id v50 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionType"];
      v95 = v50;
      if (v50)
      {
        int v51 = [v50 intValue];
        v94 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"estimatedEndTime"];
        if (v94)
        {
          int v52 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"coarseEstimatedEndTime"];
          id v53 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionDestinationType"];
          v54 = v53;
          if (v53)
          {
            uint64_t v93 = v51;
            uint64_t v92 = (int)[v53 intValue];
            int v55 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sessionDestinationMapItem"];
            v56 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"lowPowerModeWarningState"];
            v57 = v56;
            if (v56)
            {
              uint64_t v58 = (int)[v56 intValue];
            }
            else
            {
              int v63 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                int v64 = (objc_class *)objc_opt_class();
                v91 = NSStringFromClass(v64);
                v90 = NSStringFromSelector(aSelector);
                *(_DWORD *)buf = 138412546;
                uint32_t v99 = v91;
                __int16 v100 = 2112;
                v101 = v90;
                _os_log_impl(&dword_25B6E0000, v63, OS_LOG_TYPE_INFO, "#SafetyCache,%@,%@,missing lowPowerModeWarningState, OK to proceed", buf, 0x16u);
              }
              uint64_t v58 = 0;
            }
            int v44 = [(SMSessionStartMessage *)v88 initWithDate:v85 messageID:v87 sessionID:v86 invitationTokenDict:log sessionType:v93 estimatedEndTime:v94 coarseEstimatedEndTime:v52 destinationType:v92 destinationMapItem:v55 lowPowerModeWarningState:v58];

            self = v44;
          }
          else
          {
            int v55 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v81 = (objc_class *)objc_opt_class();
              v82 = NSStringFromClass(v81);
              uint64_t v83 = NSStringFromSelector(aSelector);
              *(_DWORD *)buf = 138412546;
              uint32_t v99 = v82;
              __int16 v100 = 2112;
              v101 = v83;
              _os_log_error_impl(&dword_25B6E0000, v55, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing destinationType", buf, 0x16u);

              self = v88;
            }
            int v44 = 0;
          }
        }
        else
        {
          int v52 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v78 = (objc_class *)objc_opt_class();
            uint64_t v79 = NSStringFromClass(v78);
            v80 = NSStringFromSelector(aSelector);
            *(_DWORD *)buf = 138412546;
            uint32_t v99 = v79;
            __int16 v100 = 2112;
            v101 = v80;
            _os_log_error_impl(&dword_25B6E0000, v52, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing estimatedEndTime", buf, 0x16u);
          }
          int v44 = 0;
        }

        id v9 = v85;
        v13 = v96;
      }
      else
      {
        v94 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        v13 = v96;
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
        {
          v75 = (objc_class *)objc_opt_class();
          int v76 = NSStringFromClass(v75);
          v77 = NSStringFromSelector(aSelector);
          *(_DWORD *)buf = 138412546;
          uint32_t v99 = v76;
          __int16 v100 = 2112;
          v101 = v77;
          _os_log_error_impl(&dword_25B6E0000, v94, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing sessionType", buf, 0x16u);

          v13 = v96;
        }
        int v44 = 0;
        id v9 = v85;
      }

      goto LABEL_71;
    }
    uint64_t v14 = v31;
    uint64_t v15 = v28;
    id v16 = v25;
    id v17 = v22;
    v13 = v96;
LABEL_21:
    uint64_t v33 = [objc_alloc(MEMORY[0x263EFD670]) initWithSharingInvitationData:v16 shareURL:v15 participantID:v14];

    if (v33)
    {
      [log setObject:v33 forKey:v17];
    }
    else
    {
      uint64_t v34 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        id v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        v97 = NSStringFromSelector(aSelector);
        *(_DWORD *)buf = 138412546;
        uint32_t v99 = v36;
        __int16 v100 = 2112;
        v101 = v97;
        _os_log_fault_impl(&dword_25B6E0000, v34, OS_LOG_TYPE_FAULT, "#SafetyCache,%@,%@,Invitation token creation failed", buf, 0x16u);
      }
    }
    v13 = (void *)v33;
  }
  uint64_t v32 = [v6 decodeObjectOfClass:v19 forKey:@"receiverHandle"];

  if (v32) {
    id v17 = (__CFString *)v32;
  }
  else {
    id v17 = @"receiverHandle";
  }
  int v25 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"sharingInvitationData"];

  int v28 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"shareURL"];

  uint64_t v31 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"participantID"];

  if (v25 && v28 && v31)
  {
    uint64_t v14 = v31;
    uint64_t v15 = v28;
    id v16 = v25;
    goto LABEL_21;
  }
  v95 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
  {
    v71 = (objc_class *)objc_opt_class();
    NSStringFromClass(v71);
    v73 = v72 = v13;
    v74 = NSStringFromSelector(aSelector);
    *(_DWORD *)buf = 138413314;
    uint32_t v99 = v73;
    __int16 v100 = 2112;
    v101 = v74;
    __int16 v102 = 2112;
    *(void *)v103 = v25;
    *(_WORD *)&v103[8] = 2112;
    v104 = v28;
    __int16 v105 = 2112;
    v106 = v31;
    _os_log_error_impl(&dword_25B6E0000, v95, OS_LOG_TYPE_ERROR, "#SafetyCache,%@,%@,missing details for Invitation token creation,sharingInvitationData:%@,shareURL:%@,participantID:%@", buf, 0x34u);

    v13 = v72;
  }
  int v44 = 0;
  int v22 = v17;
  self = v88;
  id v9 = v85;
LABEL_71:

  v12 = v86;
  id v10 = v87;
LABEL_72:

LABEL_73:
LABEL_74:

LABEL_33:
  return v44;
}

- (NSDictionary)invitationTokenDict
{
  return self->_invitationTokenDict;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (NSDate)estimatedEndTime
{
  return self->_estimatedEndTime;
}

- (NSDate)coarseEstimatedEndTime
{
  return self->_coarseEstimatedEndTime;
}

- (unint64_t)destinationType
{
  return self->_destinationType;
}

- (NSData)destinationMapItem
{
  return self->_destinationMapItem;
}

- (int64_t)lowPowerModeWarningState
{
  return self->_lowPowerModeWarningState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationMapItem, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndTime, 0);
  objc_storeStrong((id *)&self->_estimatedEndTime, 0);
  objc_storeStrong((id *)&self->_invitationTokenDict, 0);
}

@end