@interface SMSessionManagerState
+ (BOOL)supportsSecureCoding;
+ (id)convertEstimatedEndDateStatusToString:(unint64_t)a3;
+ (id)convertSessionStateToString:(unint64_t)a3;
- (BOOL)isActiveState;
- (BOOL)isAnomalyState;
- (BOOL)isCacheReleasedState;
- (BOOL)isEndSessionState;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonitoringState;
- (BOOL)isPromptState;
- (BOOL)isTimerExtensionValid:(double)a3;
- (BOOL)isValidState;
- (CLLocation)location;
- (NSData)allowReadToken;
- (NSData)safetyCacheKey;
- (NSDate)coarseEstimatedEndDate;
- (NSDate)date;
- (NSDate)estimatedEndDate;
- (NSDate)scheduledSendMessageDate;
- (NSDate)sessionStateTransitionDate;
- (NSString)scheduledSendMessageGUID;
- (NSString)startMessageGUID;
- (NSUUID)activeDeviceIdentifier;
- (NSUUID)activePairedDeviceIdentifier;
- (SMSessionConfiguration)configuration;
- (SMSessionManagerState)init;
- (SMSessionManagerState)initWithCoder:(id)a3;
- (SMSessionManagerState)initWithDictionary:(id)a3;
- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 allowReadToken:(id)a7 safetyCacheKey:(id)a8 startMessageGUID:(id)a9 scheduledSendMessageGUID:(id)a10 scheduledSendMessageDate:(id)a11 activeDeviceIdentifier:(id)a12 estimatedEndDate:(id)a13 coarseEstimatedEndDate:(id)a14 estimatedEndDateStatus:(unint64_t)a15 sessionEndReason:(unint64_t)a16 activePairedDeviceIdentifier:(id)a17;
- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 date:(id)a7 location:(id)a8 allowReadToken:(id)a9 safetyCacheKey:(id)a10 startMessageGUID:(id)a11 scheduledSendMessageGUID:(id)a12 scheduledSendMessageDate:(id)a13 activeDeviceIdentifier:(id)a14 estimatedEndDate:(id)a15 coarseEstimatedEndDate:(id)a16 estimatedEndDateStatus:(unint64_t)a17 sessionEndReason:(unint64_t)a18 sessionStateTransitionDate:(id)a19 activePairedDeviceIdentifier:(id)a20;
- (SMSessionMonitorContext)monitorContext;
- (id)cacheReleaseDate;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)outputToDictionary;
- (int64_t)userTriggerResponse;
- (unint64_t)estimatedEndDateStatus;
- (unint64_t)hash;
- (unint64_t)sessionEndReason;
- (unint64_t)sessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionManagerState

- (SMSessionManagerState)init
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [MEMORY[0x263EFF910] date];
  v5 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", 0, 0, 0, 0, v3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0,
         v4,
         0);

  return v5;
}

- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 allowReadToken:(id)a7 safetyCacheKey:(id)a8 startMessageGUID:(id)a9 scheduledSendMessageGUID:(id)a10 scheduledSendMessageDate:(id)a11 activeDeviceIdentifier:(id)a12 estimatedEndDate:(id)a13 coarseEstimatedEndDate:(id)a14 estimatedEndDateStatus:(unint64_t)a15 sessionEndReason:(unint64_t)a16 activePairedDeviceIdentifier:(id)a17
{
  v29 = (void *)MEMORY[0x263EFF910];
  id v33 = a17;
  id v32 = a14;
  id v25 = a13;
  id v28 = a12;
  id v27 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v31 = a7;
  id v26 = a6;
  id v22 = a4;
  v23 = [v29 date];
  v35 = [MEMORY[0x263EFF910] date];
  v39 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", a3, v22, a5, v26, v23, 0, v31, v21, v20, v19, v27, v28, v25, v32, a15,
          a16,
          v35,
          v33);

  return v39;
}

- (SMSessionManagerState)initWithSessionState:(unint64_t)a3 configuration:(id)a4 userTriggerResponse:(int64_t)a5 monitorContext:(id)a6 date:(id)a7 location:(id)a8 allowReadToken:(id)a9 safetyCacheKey:(id)a10 startMessageGUID:(id)a11 scheduledSendMessageGUID:(id)a12 scheduledSendMessageDate:(id)a13 activeDeviceIdentifier:(id)a14 estimatedEndDate:(id)a15 coarseEstimatedEndDate:(id)a16 estimatedEndDateStatus:(unint64_t)a17 sessionEndReason:(unint64_t)a18 sessionStateTransitionDate:(id)a19 activePairedDeviceIdentifier:(id)a20
{
  id v55 = a4;
  id v54 = a6;
  id obj = a7;
  id v53 = a7;
  id v47 = a8;
  id v52 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  id v51 = a12;
  id v50 = a13;
  id v49 = a14;
  id v26 = a15;
  id v27 = a16;
  id v28 = a19;
  v29 = v25;
  id v30 = a20;
  v56.receiver = self;
  v56.super_class = (Class)SMSessionManagerState;
  id v31 = [(SMSessionManagerState *)&v56 init];
  id v32 = v31;
  if (v31)
  {
    v31->_sessionState = a3;
    uint64_t v33 = [v55 copy];
    configuration = v32->_configuration;
    v32->_configuration = (SMSessionConfiguration *)v33;

    v32->_userTriggerResponse = a5;
    uint64_t v35 = [v54 copy];
    monitorContext = v32->_monitorContext;
    v32->_monitorContext = (SMSessionMonitorContext *)v35;

    objc_storeStrong((id *)&v32->_date, obj);
    objc_storeStrong((id *)&v32->_location, v47);
    uint64_t v37 = [v23 copy];
    allowReadToken = v32->_allowReadToken;
    v32->_allowReadToken = (NSData *)v37;

    uint64_t v39 = [v24 copy];
    safetyCacheKey = v32->_safetyCacheKey;
    v32->_safetyCacheKey = (NSData *)v39;

    uint64_t v41 = [v29 copy];
    startMessageGUID = v32->_startMessageGUID;
    v32->_startMessageGUID = (NSString *)v41;

    objc_storeStrong((id *)&v32->_scheduledSendMessageGUID, a12);
    objc_storeStrong((id *)&v32->_scheduledSendMessageDate, a13);
    objc_storeStrong((id *)&v32->_activeDeviceIdentifier, a14);
    objc_storeStrong((id *)&v32->_estimatedEndDate, a15);
    objc_storeStrong((id *)&v32->_coarseEstimatedEndDate, a16);
    v32->_estimatedEndDateStatus = a17;
    v32->_sessionEndReason = a18;
    objc_storeStrong((id *)&v32->_sessionStateTransitionDate, a19);
    objc_storeStrong((id *)&v32->_activePairedDeviceIdentifier, a20);
  }

  return v32;
}

+ (id)convertSessionStateToString:(unint64_t)a3
{
  if (a3 < 0xF && ((0x5F97u >> a3) & 1) != 0)
  {
    v3 = off_265499298[a3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unsupported (%lu)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)convertEstimatedEndDateStatusToString:(unint64_t)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unsupported (%lu)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_265499310[a3];
  }
  return v3;
}

- (id)cacheReleaseDate
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF910]);
  if ([(SMSessionManagerState *)self sessionState] == 9
    || [(SMSessionManagerState *)self sessionState] == 7
    || [(SMSessionManagerState *)self sessionState] == 8
    || [(SMSessionManagerState *)self sessionState] == 14)
  {
    v4 = [(SMSessionManagerState *)self sessionStateTransitionDate];
    uint64_t v5 = [v4 dateByAddingTimeInterval:900.0];

    id v3 = (id)v5;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionManagerState)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v20 = [v3 decodeIntegerForKey:@"__kSMSessionManagerStateStateKey"];
  id v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateConfigurationKey"];
  uint64_t v18 = [v3 decodeIntegerForKey:@"__kSMSessionManagerStateUserTriggerResposeKey"];
  id v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateMonitorContextKey"];
  id v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateDateKey"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateLocationKey"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateAllowReadTokenKey"];
  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateSafetyCacheKeyKey"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateStartMessageGUIDKey"];
  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateScheduledSendMessageGUIDKey"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateScheduledSendMessageDateKey"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateActiveDeviceIdentifierKey"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateEstimatedEndDateKey"];
  uint64_t v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateCoarseEstimatedEndDateKey"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"__kSMSessionManagerStateEstimatedEndDateStatusKey"];
  uint64_t v7 = (int)[v3 decodeIntForKey:@"__kSMSessionManagerStateSessionEndReasonKey"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateSessionStateTransitionDateKey"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionManagerStateActivePairedDeviceIdentifierKey"];

  id v23 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](self, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v20, v24, v18, v21, v19, v17, v16, v15, v14, v13, v12, v11, v4, v5, v6,
          v7,
          v8,
          v9);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState sessionState](self, "sessionState"), @"__kSMSessionManagerStateStateKey");
  uint64_t v5 = [(SMSessionManagerState *)self configuration];
  [v4 encodeObject:v5 forKey:@"__kSMSessionManagerStateConfigurationKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse"), @"__kSMSessionManagerStateUserTriggerResposeKey");
  uint64_t v6 = [(SMSessionManagerState *)self monitorContext];
  [v4 encodeObject:v6 forKey:@"__kSMSessionManagerStateMonitorContextKey"];

  uint64_t v7 = [(SMSessionManagerState *)self date];
  [v4 encodeObject:v7 forKey:@"__kSMSessionManagerStateDateKey"];

  v8 = [(SMSessionManagerState *)self location];
  [v4 encodeObject:v8 forKey:@"__kSMSessionManagerStateLocationKey"];

  v9 = [(SMSessionManagerState *)self allowReadToken];
  [v4 encodeObject:v9 forKey:@"__kSMSessionManagerStateAllowReadTokenKey"];

  v10 = [(SMSessionManagerState *)self safetyCacheKey];
  [v4 encodeObject:v10 forKey:@"__kSMSessionManagerStateSafetyCacheKeyKey"];

  v11 = [(SMSessionManagerState *)self startMessageGUID];
  [v4 encodeObject:v11 forKey:@"__kSMSessionManagerStateStartMessageGUIDKey"];

  v12 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
  [v4 encodeObject:v12 forKey:@"__kSMSessionManagerStateScheduledSendMessageGUIDKey"];

  v13 = [(SMSessionManagerState *)self scheduledSendMessageDate];
  [v4 encodeObject:v13 forKey:@"__kSMSessionManagerStateScheduledSendMessageDateKey"];

  v14 = [(SMSessionManagerState *)self activeDeviceIdentifier];
  [v4 encodeObject:v14 forKey:@"__kSMSessionManagerStateActiveDeviceIdentifierKey"];

  v15 = [(SMSessionManagerState *)self estimatedEndDate];
  [v4 encodeObject:v15 forKey:@"__kSMSessionManagerStateEstimatedEndDateKey"];

  v16 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
  [v4 encodeObject:v16 forKey:@"__kSMSessionManagerStateCoarseEstimatedEndDateKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus"), @"__kSMSessionManagerStateEstimatedEndDateStatusKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"), @"__kSMSessionManagerStateSessionEndReasonKey");
  v17 = [(SMSessionManagerState *)self sessionStateTransitionDate];
  [v4 encodeObject:v17 forKey:@"__kSMSessionManagerStateSessionStateTransitionDateKey"];

  id v18 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
  [v4 encodeObject:v18 forKey:@"__kSMSessionManagerStateActivePairedDeviceIdentifierKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v23 = +[SMSessionManagerMutableState allocWithZone:a3];
  unint64_t v22 = [(SMSessionManagerState *)self sessionState];
  id v21 = [(SMSessionManagerState *)self configuration];
  int64_t v20 = [(SMSessionManagerState *)self userTriggerResponse];
  id v19 = [(SMSessionManagerState *)self monitorContext];
  id v18 = [(SMSessionManagerState *)self date];
  v17 = [(SMSessionManagerState *)self location];
  v15 = [(SMSessionManagerState *)self allowReadToken];
  v14 = [(SMSessionManagerState *)self safetyCacheKey];
  v13 = [(SMSessionManagerState *)self startMessageGUID];
  v16 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
  v11 = [(SMSessionManagerState *)self scheduledSendMessageDate];
  v12 = [(SMSessionManagerState *)self activeDeviceIdentifier];
  id v4 = [(SMSessionManagerState *)self estimatedEndDate];
  uint64_t v5 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
  unint64_t v6 = [(SMSessionManagerState *)self estimatedEndDateStatus];
  unint64_t v7 = [(SMSessionManagerState *)self sessionEndReason];
  v8 = [(SMSessionManagerState *)self sessionStateTransitionDate];
  v9 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
  id v24 = -[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](v23, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v22, v21, v20, v19, v18, v17, v15, v14, v13, v16, v11, v12, v4, v5, v6,
          v7,
          v8,
          v9);

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SMSessionManagerState *)self sessionState];
  uint64_t v35 = [(SMSessionManagerState *)self configuration];
  uint64_t v4 = [v35 hash];
  int64_t v5 = v4 ^ v3 ^ [(SMSessionManagerState *)self userTriggerResponse];
  v34 = [(SMSessionManagerState *)self monitorContext];
  uint64_t v6 = [v34 hash];
  uint64_t v33 = [(SMSessionManagerState *)self date];
  uint64_t v7 = v5 ^ v6 ^ [v33 hash];
  id v32 = [(SMSessionManagerState *)self location];
  uint64_t v8 = [v32 hash];
  id v31 = [(SMSessionManagerState *)self allowReadToken];
  uint64_t v9 = v8 ^ [v31 hash];
  id v30 = [(SMSessionManagerState *)self safetyCacheKey];
  uint64_t v10 = v7 ^ v9 ^ [v30 hash];
  v11 = [(SMSessionManagerState *)self startMessageGUID];
  uint64_t v12 = [v11 hash];
  v13 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SMSessionManagerState *)self scheduledSendMessageDate];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SMSessionManagerState *)self activeDeviceIdentifier];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  id v19 = [(SMSessionManagerState *)self estimatedEndDate];
  uint64_t v20 = [v19 hash];
  id v21 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
  uint64_t v22 = v20 ^ [v21 hash];
  unint64_t v23 = v22 ^ [(SMSessionManagerState *)self estimatedEndDateStatus];
  unint64_t v24 = v23 ^ [(SMSessionManagerState *)self sessionEndReason];
  id v25 = [(SMSessionManagerState *)self sessionStateTransitionDate];
  uint64_t v26 = v18 ^ v24 ^ [v25 hash];
  id v27 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
  unint64_t v28 = v26 ^ [v27 hash];

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SMSessionManagerState *)a3;
  if (self == v6)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = v6;
      unint64_t v8 = [(SMSessionManagerState *)self sessionState];
      if (v8 != [(SMSessionManagerState *)v7 sessionState])
      {
        char v11 = 0;
LABEL_90:

        goto LABEL_91;
      }
      uint64_t v9 = [(SMSessionManagerState *)self configuration];
      uint64_t v10 = [(SMSessionManagerState *)v7 configuration];
      if (v9 != v10)
      {
        unint64_t v3 = [(SMSessionManagerState *)self configuration];
        uint64_t v4 = [(SMSessionManagerState *)v7 configuration];
        if (![v3 isEqual:v4])
        {
          char v11 = 0;
          goto LABEL_88;
        }
      }
      int64_t v12 = [(SMSessionManagerState *)self userTriggerResponse];
      if (v12 != [(SMSessionManagerState *)v7 userTriggerResponse])
      {
        char v11 = 0;
        goto LABEL_87;
      }
      v13 = [(SMSessionManagerState *)self monitorContext];
      uint64_t v14 = [(SMSessionManagerState *)v7 monitorContext];
      if (v13 == v14)
      {
        v121 = v13;
      }
      else
      {
        v15 = [(SMSessionManagerState *)self monitorContext];
        v120 = [(SMSessionManagerState *)v7 monitorContext];
        if (!objc_msgSend(v15, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_85;
        }
        v118 = v15;
        v121 = v13;
      }
      uint64_t v16 = [(SMSessionManagerState *)self date];
      [v16 timeIntervalSince1970];
      double v18 = v17;
      id v19 = [(SMSessionManagerState *)v7 date];
      [v19 timeIntervalSince1970];
      if (v18 != v20)
      {

        char v11 = 0;
        v13 = v121;
        goto LABEL_84;
      }
      v119 = v19;
      v117 = v16;
      v116 = [(SMSessionManagerState *)self location];
      [v116 coordinate];
      double v22 = v21;
      v115 = [(SMSessionManagerState *)v7 location];
      [v115 coordinate];
      double v24 = v23;
      if (v22 == v23)
      {
        unint64_t v28 = v19;
      }
      else
      {
        v112 = [(SMSessionManagerState *)self location];
        [v112 coordinate];
        double v26 = v25;
        v111 = [(SMSessionManagerState *)v7 location];
        [v111 coordinate];
        unint64_t v28 = v19;
        if (vabdd_f64(v26, v27) >= 2.22044605e-16)
        {
          char v11 = 0;
          v13 = v121;
          goto LABEL_82;
        }
      }
      v114 = [(SMSessionManagerState *)self location];
      [v114 coordinate];
      double v30 = v29;
      v113 = [(SMSessionManagerState *)v7 location];
      [v113 coordinate];
      double v32 = v31;
      if (v30 == v31)
      {
        v108 = v14;
      }
      else
      {
        v107 = [(SMSessionManagerState *)self location];
        [v107 coordinate];
        double v34 = v33;
        v106 = [(SMSessionManagerState *)v7 location];
        [v106 coordinate];
        if (vabdd_f64(v34, v35) >= 2.22044605e-16)
        {
          char v11 = 0;
          v13 = v121;
LABEL_80:

LABEL_81:
          if (v22 == v24)
          {
LABEL_83:

LABEL_84:
            v15 = v118;
            if (v13 == v14)
            {
LABEL_86:

LABEL_87:
              if (v9 == v10)
              {
LABEL_89:

                goto LABEL_90;
              }
LABEL_88:

              goto LABEL_89;
            }
LABEL_85:

            goto LABEL_86;
          }
LABEL_82:

          goto LABEL_83;
        }
        v108 = v14;
      }
      v36 = [(SMSessionManagerState *)self allowReadToken];
      [(SMSessionManagerState *)v7 allowReadToken];
      uint64_t v109 = v110 = v36;
      if (v36 != (void *)v109)
      {
        uint64_t v37 = [(SMSessionManagerState *)self allowReadToken];
        v103 = [(SMSessionManagerState *)v7 allowReadToken];
        v104 = v37;
        if (![v37 isEqual:v103])
        {
          char v11 = 0;
          v13 = v121;
          v38 = (void *)v109;
LABEL_78:

LABEL_79:
          unint64_t v28 = v119;
          uint64_t v14 = v108;
          if (v30 == v32) {
            goto LABEL_81;
          }
          goto LABEL_80;
        }
      }
      uint64_t v39 = [(SMSessionManagerState *)self safetyCacheKey];
      v40 = [(SMSessionManagerState *)v7 safetyCacheKey];
      v105 = (void *)v39;
      if ((void *)v39 != v40)
      {
        uint64_t v41 = [(SMSessionManagerState *)self safetyCacheKey];
        v99 = [(SMSessionManagerState *)v7 safetyCacheKey];
        v100 = v41;
        if (![v41 isEqual:v99])
        {
          char v11 = 0;
          v13 = v121;
          v42 = v105;
LABEL_76:

LABEL_77:
          v36 = v110;
          v38 = (void *)v109;
          if (v110 == (void *)v109) {
            goto LABEL_79;
          }
          goto LABEL_78;
        }
      }
      uint64_t v43 = [(SMSessionManagerState *)self startMessageGUID];
      uint64_t v44 = [(SMSessionManagerState *)v7 startMessageGUID];
      v101 = (void *)v43;
      v102 = v40;
      BOOL v45 = v43 == v44;
      v46 = (void *)v44;
      if (!v45)
      {
        id v47 = [(SMSessionManagerState *)self startMessageGUID];
        v94 = [(SMSessionManagerState *)v7 startMessageGUID];
        v95 = v47;
        if (![v47 isEqual:v94])
        {
          char v11 = 0;
          v13 = v121;
          v48 = v101;
LABEL_74:

LABEL_75:
          v40 = v102;
          v42 = v105;
          if (v105 == v102) {
            goto LABEL_77;
          }
          goto LABEL_76;
        }
      }
      uint64_t v49 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
      uint64_t v97 = [(SMSessionManagerState *)v7 scheduledSendMessageGUID];
      v98 = (void *)v49;
      v96 = v46;
      if (v49 != v97)
      {
        id v50 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
        v91 = [(SMSessionManagerState *)v7 scheduledSendMessageGUID];
        v92 = v50;
        if (![v50 isEqual:v91])
        {
          char v11 = 0;
          v13 = v121;
          id v52 = (void *)v97;
          id v51 = v98;
          goto LABEL_72;
        }
      }
      v93 = [(SMSessionManagerState *)self scheduledSendMessageDate];
      if (v93
        || ([(SMSessionManagerState *)v7 scheduledSendMessageDate],
            (v89 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v53 = [(SMSessionManagerState *)self scheduledSendMessageDate];
        id v54 = [(SMSessionManagerState *)v7 scheduledSendMessageDate];
        [v53 timeIntervalSinceDate:v54];
        double v56 = v55;

        double v57 = -v56;
        if (v56 >= 0.0) {
          double v57 = v56;
        }
        if (v57 >= 0.01)
        {
          char v11 = 0;
          v13 = v121;
          goto LABEL_69;
        }
      }
      else
      {
        v89 = 0;
      }
      uint64_t v58 = [(SMSessionManagerState *)self activeDeviceIdentifier];
      v59 = [(SMSessionManagerState *)v7 activeDeviceIdentifier];
      v90 = (void *)v58;
      if ((void *)v58 == v59
        || ([(SMSessionManagerState *)self activeDeviceIdentifier],
            v60 = objc_claimAutoreleasedReturnValue(),
            [(SMSessionManagerState *)v7 activeDeviceIdentifier],
            v86 = objc_claimAutoreleasedReturnValue(),
            v87 = v60,
            [v60 isEqual:v86]))
      {
        v61 = [(SMSessionManagerState *)self estimatedEndDate];
        [v61 timeIntervalSince1970];
        double v63 = v62;
        v88 = [(SMSessionManagerState *)v7 estimatedEndDate];
        [v88 timeIntervalSince1970];
        if (v63 == v64)
        {
          v85 = v59;
          v65 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
          [v65 timeIntervalSince1970];
          double v67 = v66;
          v83 = [(SMSessionManagerState *)v7 coarseEstimatedEndDate];
          [v83 timeIntervalSince1970];
          v84 = v61;
          if (v67 == v68)
          {
            v82 = v65;
            unint64_t v69 = [(SMSessionManagerState *)self estimatedEndDateStatus];
            if (v69 == [(SMSessionManagerState *)v7 estimatedEndDateStatus]
              && (unint64_t v70 = [(SMSessionManagerState *)self sessionEndReason],
                  v70 == [(SMSessionManagerState *)v7 sessionEndReason]))
            {
              v71 = [(SMSessionManagerState *)self sessionStateTransitionDate];
              [v71 timeIntervalSince1970];
              double v73 = v72;
              v81 = [(SMSessionManagerState *)v7 sessionStateTransitionDate];
              [v81 timeIntervalSince1970];
              if (v73 == v74)
              {
                uint64_t v75 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
                v79 = [(SMSessionManagerState *)v7 activePairedDeviceIdentifier];
                v80 = (void *)v75;
                if ((void *)v75 == v79)
                {
                  char v11 = 1;
                }
                else
                {
                  v76 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
                  v77 = [(SMSessionManagerState *)v7 activePairedDeviceIdentifier];
                  char v11 = [v76 isEqual:v77];
                }
              }
              else
              {
                char v11 = 0;
              }
            }
            else
            {
              char v11 = 0;
            }
            v13 = v121;
            v65 = v82;
          }
          else
          {
            char v11 = 0;
            v13 = v121;
          }

          v59 = v85;
          if (v90 == v85) {
            goto LABEL_68;
          }
        }
        else
        {

          char v11 = 0;
          v13 = v121;
          if (v90 == v59) {
            goto LABEL_68;
          }
        }
      }
      else
      {
        char v11 = 0;
        v13 = v121;
      }

LABEL_68:
LABEL_69:
      if (!v93) {

      }
      id v52 = (void *)v97;
      id v51 = v98;
      if (v98 == (void *)v97)
      {
LABEL_73:

        v48 = v101;
        v46 = v96;
        if (v101 == v96) {
          goto LABEL_75;
        }
        goto LABEL_74;
      }
LABEL_72:

      goto LABEL_73;
    }
    char v11 = 0;
  }
LABEL_91:

  return v11;
}

- (SMSessionManagerState)initWithDictionary:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = [v4 valueForKey:@"__kSMSessionManagerStateStateKey"];
  uint64_t v6 = [v4 valueForKey:@"__kSMSessionManagerStateUserTriggerResposeKey"];
  uint64_t v7 = [v4 valueForKey:@"__kSMSessionManagerStateEstimatedEndDateStatusKey"];
  unint64_t v8 = [v4 valueForKey:@"__kSMSessionManagerStateSessionEndReasonKey"];
  int v9 = [v6 intValue];
  int v10 = [v5 intValue];
  char v11 = [[SMSessionConfiguration alloc] initWithDictionary:v4];
  if (v11)
  {
    int v60 = v10;
    int v62 = v9;
    v71 = self;
    unint64_t v69 = [[SMSessionMonitorContext alloc] initWithDictionary:v4];
    int64_t v12 = [v4 valueForKey:@"__kSMSessionManagerStateDateKey"];
    v65 = v5;
    v59 = v12;
    if (v12)
    {
      v13 = (void *)MEMORY[0x263EFF910];
      [v12 doubleValue];
      double v68 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      double v68 = 0;
    }
    id v16 = objc_alloc(MEMORY[0x263F08C38]);
    double v17 = [v4 valueForKey:@"__kSMSessionManagerStateActiveDeviceIdentifierKey"];
    double v67 = (void *)[v16 initWithUUIDString:v17];

    double v18 = [v4 valueForKey:@"__kSMSessionManagerStateLocationKeyLatitude"];
    id v19 = [v4 valueForKey:@"__kSMSessionManagerStateLocationKeyLongitude"];
    uint64_t v20 = 0;
    if (v18 && v19)
    {
      id v21 = objc_alloc(MEMORY[0x263F00A50]);
      [v18 doubleValue];
      double v23 = v22;
      [v19 doubleValue];
      uint64_t v20 = [v21 initWithLatitude:v23 longitude:v24];
    }
    double v66 = (void *)v20;
    uint64_t v25 = [v4 valueForKey:@"__kSMSessionManagerStateAllowReadTokenKey"];
    double v56 = (void *)v25;
    if (v25) {
      double v55 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v25 options:0];
    }
    else {
      double v55 = 0;
    }
    uint64_t v26 = [v4 valueForKey:@"__kSMSessionManagerStateSafetyCacheKeyKey"];
    if (v26) {
      id v53 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v26 options:0];
    }
    else {
      id v53 = 0;
    }
    id v54 = (void *)v26;
    id v52 = [v4 valueForKey:@"__kSMSessionManagerStateStartMessageGUIDKey"];
    id v51 = [v4 valueForKey:@"__kSMSessionManagerStateScheduledSendMessageGUIDKey"];
    double v27 = [v4 valueForKey:@"__kSMSessionManagerStateScheduledSendMessageDateKey"];
    id v50 = v27;
    if (v27)
    {
      unint64_t v28 = (void *)MEMORY[0x263EFF910];
      [v27 doubleValue];
      double v29 = objc_msgSend(v28, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      double v29 = 0;
    }
    uint64_t v58 = v18;
    double v30 = [v4 valueForKey:@"__kSMSessionManagerStateEstimatedEndDateKey"];
    double v57 = v19;
    uint64_t v49 = v30;
    if (v30)
    {
      double v31 = (void *)MEMORY[0x263EFF910];
      [v30 doubleValue];
      double v32 = objc_msgSend(v31, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      double v32 = 0;
    }
    uint64_t v47 = v62;
    uint64_t v46 = v60;
    double v33 = [v4 valueForKey:@"__kSMSessionManagerStateCoarseEstimatedEndDateKey"];
    double v64 = v6;
    unint64_t v70 = v11;
    v48 = v33;
    if (v33)
    {
      double v34 = (void *)MEMORY[0x263EFF910];
      [v33 doubleValue];
      double v35 = objc_msgSend(v34, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      double v35 = 0;
    }
    double v63 = v7;
    uint64_t v36 = (int)[v7 intValue];
    v61 = v8;
    uint64_t v37 = (int)[v8 intValue];
    v38 = [v4 valueForKey:@"__kSMSessionManagerStateSessionStateTransitionDateKey"];
    uint64_t v39 = v38;
    if (v38)
    {
      v40 = (void *)MEMORY[0x263EFF910];
      [v38 doubleValue];
      uint64_t v41 = objc_msgSend(v40, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      uint64_t v41 = 0;
    }
    id v42 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v43 = [v4 valueForKey:@"__kSMSessionManagerStateActivePairedDeviceIdentifierKey"];
    uint64_t v44 = (void *)[v42 initWithUUIDString:v43];

    double v72 = objc_retain(-[SMSessionManagerState initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:](v71, "initWithSessionState:configuration:userTriggerResponse:monitorContext:date:location:allowReadToken:safetyCacheKey:startMessageGUID:scheduledSendMessageGUID:scheduledSendMessageDate:activeDeviceIdentifier:estimatedEndDate:coarseEstimatedEndDate:estimatedEndDateStatus:sessionEndReason:sessionStateTransitionDate:activePairedDeviceIdentifier:", v46, v70, v47, v69, v68, v66, v55, v53, v52, v51, v29, v67, v32,
              v35,
              v36,
              v37,
              v41,
              v44));

    self = v72;
    char v11 = v70;

    v15 = v72;
    uint64_t v6 = v64;
    int64_t v5 = v65;
    unint64_t v8 = v61;
    uint64_t v7 = v63;
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      double v74 = "-[SMSessionManagerState initWithDictionary:]";
      _os_log_error_impl(&dword_25B6E0000, v14, OS_LOG_TYPE_ERROR, "%s, configuration is nil", buf, 0xCu);
    }

    v15 = 0;
  }

  return v15;
}

- (id)outputToDictionary
{
  unint64_t v3 = objc_opt_new();
  id v4 = [(SMSessionManagerState *)self date];

  if (v4)
  {
    int64_t v5 = NSNumber;
    uint64_t v6 = [(SMSessionManagerState *)self date];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
    [v3 setObject:v7 forKey:@"__kSMSessionManagerStateDateKey"];
  }
  unint64_t v8 = [(SMSessionManagerState *)self sessionStateTransitionDate];

  if (v8)
  {
    int v9 = NSNumber;
    int v10 = [(SMSessionManagerState *)self sessionStateTransitionDate];
    [v10 timeIntervalSince1970];
    char v11 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v11 forKey:@"__kSMSessionManagerStateSessionStateTransitionDateKey"];
  }
  int64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionManagerState sessionState](self, "sessionState"));
  [v3 setObject:v12 forKey:@"__kSMSessionManagerStateStateKey"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMSessionManagerState userTriggerResponse](self, "userTriggerResponse"));
  [v3 setObject:v13 forKey:@"__kSMSessionManagerStateUserTriggerResposeKey"];

  uint64_t v14 = [(SMSessionManagerState *)self monitorContext];

  if (v14)
  {
    v15 = [(SMSessionManagerState *)self monitorContext];
    id v16 = [v15 outputToDictionary];
    [v3 addEntriesFromDictionary:v16];
  }
  double v17 = [(SMSessionManagerState *)self configuration];
  double v18 = [v17 outputToDictionary];

  if (v18) {
    [v3 addEntriesFromDictionary:v18];
  }
  id v19 = [(SMSessionManagerState *)self activeDeviceIdentifier];

  if (v19)
  {
    uint64_t v20 = [(SMSessionManagerState *)self activeDeviceIdentifier];
    id v21 = [v20 UUIDString];
    [v3 setObject:v21 forKey:@"__kSMSessionManagerStateActiveDeviceIdentifierKey"];
  }
  double v22 = [(SMSessionManagerState *)self location];

  if (v22)
  {
    double v23 = NSNumber;
    double v24 = [(SMSessionManagerState *)self location];
    [v24 coordinate];
    uint64_t v26 = [v23 numberWithDouble:v25];
    [v3 setObject:v26 forKey:@"__kSMSessionManagerStateLocationKeyLongitude"];

    double v27 = NSNumber;
    unint64_t v28 = [(SMSessionManagerState *)self location];
    [v28 coordinate];
    double v29 = objc_msgSend(v27, "numberWithDouble:");
    [v3 setObject:v29 forKey:@"__kSMSessionManagerStateLocationKeyLatitude"];
  }
  double v30 = [(SMSessionManagerState *)self allowReadToken];

  if (v30)
  {
    double v31 = [(SMSessionManagerState *)self allowReadToken];
    double v32 = [v31 base64EncodedStringWithOptions:0];
    [v3 setObject:v32 forKey:@"__kSMSessionManagerStateAllowReadTokenKey"];
  }
  double v33 = [(SMSessionManagerState *)self safetyCacheKey];

  if (v33)
  {
    double v34 = [(SMSessionManagerState *)self safetyCacheKey];
    double v35 = [v34 base64EncodedStringWithOptions:0];
    [v3 setObject:v35 forKey:@"__kSMSessionManagerStateSafetyCacheKeyKey"];
  }
  uint64_t v36 = [(SMSessionManagerState *)self startMessageGUID];

  if (v36)
  {
    uint64_t v37 = [(SMSessionManagerState *)self startMessageGUID];
    [v3 setObject:v37 forKey:@"__kSMSessionManagerStateStartMessageGUIDKey"];
  }
  v38 = [(SMSessionManagerState *)self scheduledSendMessageGUID];

  if (v38)
  {
    uint64_t v39 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
    [v3 setObject:v39 forKey:@"__kSMSessionManagerStateScheduledSendMessageGUIDKey"];
  }
  v40 = [(SMSessionManagerState *)self scheduledSendMessageDate];

  if (v40)
  {
    uint64_t v41 = NSNumber;
    id v42 = [(SMSessionManagerState *)self scheduledSendMessageDate];
    [v42 timeIntervalSince1970];
    uint64_t v43 = objc_msgSend(v41, "numberWithDouble:");
    [v3 setObject:v43 forKey:@"__kSMSessionManagerStateScheduledSendMessageDateKey"];
  }
  uint64_t v44 = [(SMSessionManagerState *)self estimatedEndDate];

  if (v44)
  {
    BOOL v45 = NSNumber;
    uint64_t v46 = [(SMSessionManagerState *)self estimatedEndDate];
    [v46 timeIntervalSince1970];
    uint64_t v47 = objc_msgSend(v45, "numberWithDouble:");
    [v3 setObject:v47 forKey:@"__kSMSessionManagerStateEstimatedEndDateKey"];
  }
  v48 = [(SMSessionManagerState *)self coarseEstimatedEndDate];

  if (v48)
  {
    uint64_t v49 = NSNumber;
    id v50 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
    [v50 timeIntervalSince1970];
    id v51 = objc_msgSend(v49, "numberWithDouble:");
    [v3 setObject:v51 forKey:@"__kSMSessionManagerStateCoarseEstimatedEndDateKey"];
  }
  id v52 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];

  if (v52)
  {
    id v53 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
    id v54 = [v53 UUIDString];
    [v3 setObject:v54 forKey:@"__kSMSessionManagerStateActivePairedDeviceIdentifierKey"];
  }
  double v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionManagerState estimatedEndDateStatus](self, "estimatedEndDateStatus"));
  [v3 setObject:v55 forKey:@"__kSMSessionManagerStateEstimatedEndDateStatusKey"];

  double v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionManagerState sessionEndReason](self, "sessionEndReason"));
  [v3 setObject:v56 forKey:@"__kSMSessionManagerStateSessionEndReasonKey"];

  return v3;
}

- (id)description
{
  id v19 = NSString;
  double v31 = +[SMSessionManagerState convertSessionStateToString:[(SMSessionManagerState *)self sessionState]];
  double v25 = [(SMSessionManagerState *)self configuration];
  double v33 = [v25 description];
  double v32 = +[SMSessionMonitorContext userTriggerResponseToString:[(SMSessionManagerState *)self userTriggerResponse]];
  double v24 = [(SMSessionManagerState *)self monitorContext];
  double v29 = [v24 description];
  double v23 = [(SMSessionManagerState *)self date];
  double v30 = [v23 stringFromDate];
  double v22 = [(SMSessionManagerState *)self location];
  id v16 = [v22 description];
  id v21 = [(SMSessionManagerState *)self allowReadToken];
  unint64_t v28 = [v21 description];
  double v18 = [(SMSessionManagerState *)self safetyCacheKey];
  uint64_t v14 = [v18 description];
  double v27 = [(SMSessionManagerState *)self startMessageGUID];
  uint64_t v26 = [(SMSessionManagerState *)self scheduledSendMessageGUID];
  double v17 = [(SMSessionManagerState *)self scheduledSendMessageDate];
  int64_t v12 = [v17 stringFromDate];
  unint64_t v3 = [(SMSessionManagerState *)self activeDeviceIdentifier];
  v15 = [(SMSessionManagerState *)self estimatedEndDate];
  id v4 = [v15 stringFromDate];
  v13 = [(SMSessionManagerState *)self coarseEstimatedEndDate];
  int64_t v5 = [v13 stringFromDate];
  uint64_t v6 = +[SMSessionManagerState convertEstimatedEndDateStatusToString:[(SMSessionManagerState *)self estimatedEndDateStatus]];
  uint64_t v7 = +[SMSessionMonitorContext sessionEndReasonToString:[(SMSessionManagerState *)self sessionEndReason]];
  unint64_t v8 = [(SMSessionManagerState *)self sessionStateTransitionDate];
  int v9 = [v8 stringFromDate];
  int v10 = [(SMSessionManagerState *)self activePairedDeviceIdentifier];
  objc_msgSend(v19, "stringWithFormat:", @"{SessionState:%@, Configuration:%@, UserTriggerResponse:%@, monitorContext:%@, date:%@, location:%@, allowReadToken:%@, safetyCacheKey:%@, startMessageGUID:%@, scheduledSendMessageGUID:%@, scheduledSendMessageDate:%@, activeDeviceIdentifier:%@, estimatedEndDate:%@, coarseEstimatedEndDate:%@, estimatedEndDateStatus:%@, sessionEndReason:%@, sessionStateTransitionDate:%@, activePairedDeviceIdentifier:%@}", v31, v33, v32, v29, v30, v16, v28, v14, v27, v26, v12, v3, v4, v5, v6, v7,
    v9,
  uint64_t v20 = v10);

  return v20;
}

- (BOOL)isValidState
{
  unint64_t v2 = [(SMSessionManagerState *)self sessionState];
  return (v2 < 0xF) & (0x5F96u >> v2);
}

- (BOOL)isActiveState
{
  unint64_t v2 = [(SMSessionManagerState *)self sessionState];
  return (v2 < 0xF) & (0x4394u >> v2);
}

- (BOOL)isAnomalyState
{
  unint64_t v2 = [(SMSessionManagerState *)self sessionState];
  return (v2 < 0xF) & (0x4380u >> v2);
}

- (BOOL)isEndSessionState
{
  unint64_t v2 = [(SMSessionManagerState *)self sessionState];
  return v2 == 1 || v2 == 12;
}

- (BOOL)isPromptState
{
  unint64_t v2 = [(SMSessionManagerState *)self sessionState];
  return (v2 < 0xF) & (0x4380u >> v2);
}

- (BOOL)isMonitoringState
{
  return [(SMSessionManagerState *)self sessionState] == 2;
}

- (BOOL)isCacheReleasedState
{
  return [(SMSessionManagerState *)self sessionState] == 4;
}

- (BOOL)isTimerExtensionValid:(double)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v5 = [(SMSessionManagerState *)self configuration];
  uint64_t v6 = [v5 sessionStartDate];

  uint64_t v7 = [(SMSessionManagerState *)self configuration];
  unint64_t v8 = [v7 time];
  int v9 = [v8 timeBound];

  if (v6 && v9)
  {
    [v9 timeIntervalSinceDate:v6];
    BOOL v11 = v10 + 900.0 + a3 <= 43200.0;
  }
  else
  {
    int64_t v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315650;
      v15 = "-[SMSessionManagerState isTimerExtensionValid:]";
      __int16 v16 = 2112;
      double v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_error_impl(&dword_25B6E0000, v12, OS_LOG_TYPE_ERROR, "%s, Unable to determine if timer extension is valid,startDate,%@,endDate,%@", (uint8_t *)&v14, 0x20u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (SMSessionConfiguration)configuration
{
  return self->_configuration;
}

- (int64_t)userTriggerResponse
{
  return self->_userTriggerResponse;
}

- (SMSessionMonitorContext)monitorContext
{
  return self->_monitorContext;
}

- (NSDate)date
{
  return self->_date;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSData)allowReadToken
{
  return self->_allowReadToken;
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (NSString)startMessageGUID
{
  return self->_startMessageGUID;
}

- (NSString)scheduledSendMessageGUID
{
  return self->_scheduledSendMessageGUID;
}

- (NSDate)scheduledSendMessageDate
{
  return self->_scheduledSendMessageDate;
}

- (NSUUID)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (unint64_t)estimatedEndDateStatus
{
  return self->_estimatedEndDateStatus;
}

- (unint64_t)sessionEndReason
{
  return self->_sessionEndReason;
}

- (NSDate)sessionStateTransitionDate
{
  return self->_sessionStateTransitionDate;
}

- (NSUUID)activePairedDeviceIdentifier
{
  return self->_activePairedDeviceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePairedDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionStateTransitionDate, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduledSendMessageDate, 0);
  objc_storeStrong((id *)&self->_scheduledSendMessageGUID, 0);
  objc_storeStrong((id *)&self->_startMessageGUID, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_allowReadToken, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_monitorContext, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end