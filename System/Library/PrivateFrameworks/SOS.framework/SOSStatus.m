@interface SOSStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)isFlowActive;
- (BOOL)isFlowActiveAndNotResting;
- (BOOL)isPairedDeviceStatus;
- (BOOL)isPreCall;
- (BOOL)isValid;
- (BOOL)shouldBlockNonEmergencyCalls;
- (BOOL)shouldRejectNewSOSTriggers;
- (BOOL)shouldRetriggerSOS;
- (NSDate)timeOfDetection;
- (NSDate)timeOfResolution;
- (NSUUID)uuid;
- (SOSStatus)initWithCoder:(id)a3;
- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5;
- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7;
- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7 flowState:(int64_t)a8 isPairedDeviceStatus:(BOOL)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)flowState;
- (int64_t)resolution;
- (int64_t)trigger;
- (void)encodeWithCoder:(id)a3;
- (void)isFlowActive;
- (void)isFlowActiveAndNotResting;
- (void)isPreCall;
- (void)setFlowState:(int64_t)a3;
- (void)setIsPairedDeviceStatus:(BOOL)a3;
- (void)setResolution:(int64_t)a3;
- (void)setTimeOfDetection:(id)a3;
- (void)setTimeOfResolution:(id)a3;
- (void)setTrigger:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)shouldBlockNonEmergencyCalls;
- (void)shouldRejectNewSOSTriggers;
- (void)shouldRetriggerSOS;
@end

@implementation SOSStatus

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SOSStatus;
  v16 = [(SOSStatus *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_uuid, a3);
    v17->_trigger = a4;
    objc_storeStrong((id *)&v17->_timeOfDetection, a5);
    objc_storeStrong((id *)&v17->_timeOfResolution, a6);
    v17->_resolution = a7;
    v17->_flowState = 0;
    v17->_isPairedDeviceStatus = 0;
  }

  return v17;
}

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SOSStatus;
  v11 = [(SOSStatus *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a3);
    v12->_trigger = a4;
    objc_storeStrong((id *)&v12->_timeOfDetection, a5);
    timeOfResolution = v12->_timeOfResolution;
    v12->_timeOfResolution = 0;

    v12->_isPairedDeviceStatus = 0;
    v12->_resolution = 0;
    v12->_flowState = 0;
  }

  return v12;
}

- (SOSStatus)initWithUUID:(id)a3 trigger:(int64_t)a4 timeOfDetection:(id)a5 timeOfResolution:(id)a6 resolution:(int64_t)a7 flowState:(int64_t)a8 isPairedDeviceStatus:(BOOL)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SOSStatus;
  objc_super v19 = [(SOSStatus *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_uuid, a3);
    v20->_trigger = a4;
    objc_storeStrong((id *)&v20->_timeOfDetection, a5);
    objc_storeStrong((id *)&v20->_timeOfResolution, a6);
    v20->_resolution = a7;
    v20->_flowState = a8;
    v20->_isPairedDeviceStatus = a9;
  }

  return v20;
}

- (BOOL)isValid
{
  v3 = [(SOSStatus *)self uuid];

  if (!v3) {
    goto LABEL_5;
  }
  int64_t v4 = [(SOSStatus *)self trigger];
  if (v4)
  {
    uint64_t v5 = [(SOSStatus *)self timeOfDetection];
    if (!v5) {
      goto LABEL_5;
    }
    v6 = (void *)v5;
    v7 = [(SOSStatus *)self timeOfDetection];
    [v7 timeIntervalSince1970];
    double v9 = v8;
    id v10 = [MEMORY[0x1E4F1C9C8] now];
    [v10 timeIntervalSince1970];
    double v12 = v11 + 60.0;

    if (v9 > v12)
    {
LABEL_5:
      LOBYTE(v4) = 0;
      return v4;
    }
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)isFlowActive
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    unint64_t v4 = [(SOSStatus *)self flowState];
    if (v4 >= 0xF)
    {
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus isFlowActive](self);
      }

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x6ABEu >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)isFlowActiveAndNotResting
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    unint64_t v4 = [(SOSStatus *)self flowState];
    if (v4 >= 0xF)
    {
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus isFlowActiveAndNotResting](self);
      }

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x40BEu >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)isPreCall
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    unint64_t v4 = [(SOSStatus *)self flowState];
    if (v4 >= 0xF)
    {
      uint64_t v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus isPreCall](self);
      }

      LOBYTE(v3) = 0;
    }
    else
    {
      return (0x4006u >> v4) & 1;
    }
  }
  return v3;
}

- (BOOL)shouldBlockNonEmergencyCalls
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    unint64_t v4 = [(SOSStatus *)self trigger];
    if (v4 >= 0xA)
    {
      id v13 = sos_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus shouldBlockNonEmergencyCalls](self);
      }
    }
    else
    {
      double v5 = dbl_1B3AD0EF0[v4];
      v6 = [(SOSStatus *)self timeOfDetection];
      [v6 timeIntervalSince1970];
      double v8 = v5 + v7;
      double v9 = [MEMORY[0x1E4F1C9C8] now];
      [v9 timeIntervalSince1970];
      double v11 = v10;

      if (v8 < v11)
      {
LABEL_11:
        LOBYTE(v3) = 0;
        return v3;
      }
      unint64_t v12 = [(SOSStatus *)self flowState];
      if (v12 < 0xF) {
        return (0x4006u >> v12) & 1;
      }
      id v13 = sos_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus shouldBlockNonEmergencyCalls](self);
      }
    }

    goto LABEL_11;
  }
  return v3;
}

- (BOOL)shouldRejectNewSOSTriggers
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    if (!+[SOSUtilities shouldAllowSOSStatusReset])
    {
      unint64_t v4 = [(SOSStatus *)self flowState];
      if (v4 < 0xF) {
        return (0x401Eu >> v4) & 1;
      }
      double v5 = sos_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[SOSStatus shouldRejectNewSOSTriggers](self);
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldRetriggerSOS
{
  BOOL v3 = [(SOSStatus *)self isValid];
  if (v3)
  {
    if (!+[SOSUtilities shouldAllowSOSStatusReset]
      && ([(SOSStatus *)self trigger] == 5 || [(SOSStatus *)self trigger] == 7))
    {
      unint64_t v4 = [(SOSStatus *)self timeOfDetection];
      [v4 timeIntervalSince1970];
      double v6 = v5 + 60.0;
      double v7 = [MEMORY[0x1E4F1C9C8] now];
      [v7 timeIntervalSince1970];
      double v9 = v8;

      if (v6 >= v9)
      {
        unint64_t v10 = [(SOSStatus *)self flowState];
        if (v10 < 0xF) {
          return (0x4006u >> v10) & 1;
        }
        double v11 = sos_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[SOSStatus shouldRetriggerSOS](self);
        }
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"kSOSStatusUUID"];
  [v5 encodeInteger:self->_trigger forKey:@"kSOSStatusTrigger"];
  [(NSDate *)self->_timeOfDetection timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kSOSStatusDetectionDate");
  [(NSDate *)self->_timeOfResolution timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"kSOSStatusResolutionDate");
  [v5 encodeInteger:self->_resolution forKey:@"kSOSStatusResolution"];
  [v5 encodeInteger:self->_flowState forKey:@"kSOSStatusFlowState"];
  [v5 encodeBool:self->_isPairedDeviceStatus forKey:@"kSOSStatusIsPairedDeviceStatus"];
}

- (SOSStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SOSStatus;
  id v5 = [(SOSStatus *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"kSOSStatusUUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_trigger = [v4 decodeIntegerForKey:@"kSOSStatusTrigger"];
    id v8 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 decodeDoubleForKey:@"kSOSStatusDetectionDate"];
    uint64_t v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
    timeOfDetection = v5->_timeOfDetection;
    v5->_timeOfDetection = (NSDate *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v4 decodeDoubleForKey:@"kSOSStatusResolutionDate"];
    uint64_t v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    timeOfResolution = v5->_timeOfResolution;
    v5->_timeOfResolution = (NSDate *)v12;

    v5->_resolution = [v4 decodeIntegerForKey:@"kSOSStatusResolution"];
    v5->_flowState = [v4 decodeIntegerForKey:@"kSOSStatusFlowState"];
    v5->_isPairedDeviceStatus = [v4 decodeBoolForKey:@"kSOSStatusIsPairedDeviceStatus"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_isPairedDeviceStatus;
  return (id)[v4 initWithUUID:self->_uuid trigger:self->_trigger timeOfDetection:self->_timeOfDetection timeOfResolution:self->_timeOfResolution resolution:self->_resolution flowState:self->_flowState isPairedDeviceStatus:v6];
}

- (id)description
{
  BOOL v3 = NSString;
  id v4 = [(SOSStatus *)self uuid];
  int64_t v5 = [(SOSStatus *)self trigger];
  uint64_t v6 = [(SOSStatus *)self timeOfDetection];
  double v7 = [(SOSStatus *)self timeOfResolution];
  int64_t v8 = [(SOSStatus *)self resolution];
  uint64_t v9 = sosFlowStateDescription([(SOSStatus *)self flowState]);
  unint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[SOSStatus isPairedDeviceStatus](self, "isPairedDeviceStatus"));
  id v11 = [v3 stringWithFormat:@"SOSStatus - uuid: %@ trigger: %d, detectedAt: %@, resolvedAt: %@, resolution: %d, sosFlowState: %@, isPairedDeviceStatus: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (NSDate)timeOfDetection
{
  return self->_timeOfDetection;
}

- (void)setTimeOfDetection:(id)a3
{
}

- (NSDate)timeOfResolution
{
  return self->_timeOfResolution;
}

- (void)setTimeOfResolution:(id)a3
{
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (int64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(int64_t)a3
{
  self->_flowState = a3;
}

- (BOOL)isPairedDeviceStatus
{
  return self->_isPairedDeviceStatus;
}

- (void)setIsPairedDeviceStatus:(BOOL)a3
{
  self->_isPairedDeviceStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfResolution, 0);
  objc_storeStrong((id *)&self->_timeOfDetection, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)isFlowActive
{
  [a1 flowState];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,isFlowActive,unexpected SOSFlowState %d", v3, v4, v5, v6, v7);
}

- (void)isFlowActiveAndNotResting
{
  [a1 flowState];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,isFlowActiveAndNotResting,unexpected SOSFlowState %d", v3, v4, v5, v6, v7);
}

- (void)isPreCall
{
  [a1 flowState];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,isPreCall,unexpected SOSFlowState %d", v3, v4, v5, v6, v7);
}

- (void)shouldBlockNonEmergencyCalls
{
  [a1 trigger];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,shouldBlockNonEmergencyCalls,unexpected SOSTriggerMechanism %d", v3, v4, v5, v6, v7);
}

- (void)shouldRejectNewSOSTriggers
{
  [a1 flowState];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,shouldRejectNewSOSTriggers,unexpected SOSFlowState %d", v3, v4, v5, v6, v7);
}

- (void)shouldRetriggerSOS
{
  [a1 flowState];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_1(&dword_1B3A94000, v1, v2, "SOSStatus,shouldRetriggerSOS,unexpected SOSFlowState %d", v3, v4, v5, v6, v7);
}

@end