@interface SMSessionConfiguration
+ (BOOL)configurationIsValid:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)sessionTypeToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSameSession:(id)a3;
- (BOOL)sessionSupportsHandoff;
- (NSDate)sessionStartDate;
- (NSDate)userResponseSafeDate;
- (NSUUID)sessionID;
- (SMConversation)conversation;
- (SMConversation)sosReceivers;
- (SMHandle)handle;
- (SMSessionConfiguration)initWithCoder:(id)a3;
- (SMSessionConfiguration)initWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionType:(unint64_t)a6 time:(id)a7 destination:(id)a8 userResponseSafeDate:(id)a9 sessionSupportsHandoff:(BOOL)a10 sosReceivers:(id)a11 sessionWorkoutType:(unint64_t)a12;
- (SMSessionConfiguration)initWithDictionary:(id)a3;
- (SMSessionDestination)destination;
- (SMSessionTime)time;
- (id)coarseEstimatedEndDate;
- (id)copyConfigurationWithNewSessionID:(id)a3;
- (id)description;
- (id)estimatedEndDate;
- (id)initDestinationBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9;
- (id)initRoundTripSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9;
- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionStartDate:(id)a6 sessionSupportsHandoff:(BOOL)a7 sosReceivers:(id)a8;
- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7;
- (id)initWorkoutBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7 sessionWorkoutType:(unint64_t)a8;
- (id)outputToDictionary;
- (unint64_t)hash;
- (unint64_t)sessionType;
- (unint64_t)sessionWorkoutType;
- (void)encodeWithCoder:(id)a3;
- (void)setSessionSupportsHandoff:(BOOL)a3;
- (void)setSessionWorkoutType:(unint64_t)a3;
@end

@implementation SMSessionConfiguration

- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7
{
  v12 = (void *)MEMORY[0x263EFF910];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 date];
  LOBYTE(v20) = a6;
  v18 = [(SMSessionConfiguration *)self initWithConversation:v16 sessionID:v15 sessionStartDate:v17 sessionType:1 time:v14 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v20 sosReceivers:v13 sessionWorkoutType:0];

  return v18;
}

- (id)initTimeBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 time:(id)a5 sessionStartDate:(id)a6 sessionSupportsHandoff:(BOOL)a7 sosReceivers:(id)a8
{
  LOBYTE(v9) = a7;
  return [(SMSessionConfiguration *)self initWithConversation:a3 sessionID:a4 sessionStartDate:a6 sessionType:1 time:a5 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v9 sosReceivers:a8 sessionWorkoutType:0];
}

- (id)initDestinationBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9
{
  LOBYTE(v10) = a8;
  return [(SMSessionConfiguration *)self initWithConversation:a3 sessionID:a4 sessionStartDate:a6 sessionType:2 time:0 destination:a5 userResponseSafeDate:a7 sessionSupportsHandoff:v10 sosReceivers:a9 sessionWorkoutType:0];
}

- (id)initRoundTripSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 destination:(id)a5 sessionStartDate:(id)a6 userResponseSafeDate:(id)a7 sessionSupportsHandoff:(BOOL)a8 sosReceivers:(id)a9
{
  LOBYTE(v10) = a8;
  return [(SMSessionConfiguration *)self initWithConversation:a3 sessionID:a4 sessionStartDate:a6 sessionType:3 time:0 destination:a5 userResponseSafeDate:a7 sessionSupportsHandoff:v10 sosReceivers:a9 sessionWorkoutType:0];
}

- (id)initWorkoutBoundSessionConfigurationWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionSupportsHandoff:(BOOL)a6 sosReceivers:(id)a7 sessionWorkoutType:(unint64_t)a8
{
  v8 = self;
  if (a8)
  {
    LOBYTE(v12) = a6;
    v8 = [(SMSessionConfiguration *)self initWithConversation:a3 sessionID:a4 sessionStartDate:a5 sessionType:4 time:0 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v12 sosReceivers:a7 sessionWorkoutType:a8];
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionWorkoutType != RTHKWorkoutActivityTypeUnknown", buf, 2u);
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (SMSessionConfiguration)initWithConversation:(id)a3 sessionID:(id)a4 sessionStartDate:(id)a5 sessionType:(unint64_t)a6 time:(id)a7 destination:(id)a8 userResponseSafeDate:(id)a9 sessionSupportsHandoff:(BOOL)a10 sosReceivers:(id)a11 sessionWorkoutType:(unint64_t)a12
{
  id v30 = a3;
  id v18 = a4;
  id v29 = a5;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v19 = a11;
  if (v18)
  {
    v31.receiver = self;
    v31.super_class = (Class)SMSessionConfiguration;
    uint64_t v20 = [(SMSessionConfiguration *)&v31 init];
    v21 = v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20->_conversation, a3);
      objc_storeStrong((id *)&v21->_sessionID, a4);
      objc_storeStrong((id *)&v21->_sessionStartDate, a5);
      v21->_sessionType = a6;
      objc_storeStrong((id *)&v21->_time, a7);
      objc_storeStrong((id *)&v21->_destination, a8);
      objc_storeStrong((id *)&v21->_userResponseSafeDate, a9);
      v21->_sessionSupportsHandoff = a10;
      objc_storeStrong((id *)&v21->_sosReceivers, a11);
      v21->_sessionWorkoutType = a12;
    }
    self = v21;
    v22 = self;
  }
  else
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_25B6E0000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: sessionID", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

- (id)copyConfigurationWithNewSessionID:(id)a3
{
  id v4 = a3;
  id v16 = [SMSessionConfiguration alloc];
  v5 = [(SMSessionConfiguration *)self conversation];
  v6 = [(SMSessionConfiguration *)self sessionStartDate];
  unint64_t v7 = [(SMSessionConfiguration *)self sessionType];
  v8 = [(SMSessionConfiguration *)self time];
  uint64_t v9 = [(SMSessionConfiguration *)self destination];
  uint64_t v10 = [(SMSessionConfiguration *)self userResponseSafeDate];
  BOOL v11 = [(SMSessionConfiguration *)self sessionSupportsHandoff];
  uint64_t v12 = [(SMSessionConfiguration *)self sosReceivers];
  LOBYTE(v15) = v11;
  id v13 = [(SMSessionConfiguration *)v16 initWithConversation:v5 sessionID:v4 sessionStartDate:v6 sessionType:v7 time:v8 destination:v9 userResponseSafeDate:v10 sessionSupportsHandoff:v15 sosReceivers:v12 sessionWorkoutType:[(SMSessionConfiguration *)self sessionWorkoutType]];

  return v13;
}

- (id)estimatedEndDate
{
  if ([(SMSessionConfiguration *)self sessionType] == 2)
  {
    v3 = [(SMSessionConfiguration *)self destination];

    if (v3)
    {
      id v4 = [(SMSessionConfiguration *)self destination];
      v5 = [v4 eta];
      v6 = [v5 etaDate];

LABEL_7:
      goto LABEL_11;
    }
  }
  if ([(SMSessionConfiguration *)self sessionType] == 1)
  {
    unint64_t v7 = [(SMSessionConfiguration *)self time];

    if (v7)
    {
      id v4 = [(SMSessionConfiguration *)self time];
      v6 = [v4 timeBound];
      goto LABEL_7;
    }
  }
  if ([(SMSessionConfiguration *)self sessionType] == 4)
  {
    v6 = [(NSDate *)self->_sessionStartDate dateByAddingTimeInterval:3600.0];
  }
  else
  {
    v6 = 0;
  }
LABEL_11:
  return v6;
}

- (id)coarseEstimatedEndDate
{
  v2 = [(SMSessionConfiguration *)self estimatedEndDate];
  v3 = [v2 roundedTime];

  return v3;
}

+ (id)sessionTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_26549A380[a3 - 1];
  }
}

+ (BOOL)configurationIsValid:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sessionID];

  if (v4)
  {
    id v4 = [v3 conversation];

    if (v4)
    {
      if (![v3 sessionType]) {
        goto LABEL_11;
      }
      if ([v3 sessionType] != 2
        || ([v3 destination], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
      {
        if ([v3 sessionType] != 1
          || ([v3 time], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
        {
          if ([v3 sessionType] != 4 || objc_msgSend(v3, "sessionWorkoutType"))
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
LABEL_11:
          LOBYTE(v4) = 0;
        }
      }
    }
  }
LABEL_12:

  return (char)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationConversationKey"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationSessionIDKey"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationStartDateKey"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"__kSMSessionConfigurationTypeKey"];
  unint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationTimeKey"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationDestinationKey"];
  uint64_t v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationUserResponseSafeDateKey"];
  char v10 = [v3 decodeBoolForKey:@"__kSMSessionConfigurationSessionSupportsHandoffKey"];
  BOOL v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionConfigurationSOSReceiversKey"];
  uint64_t v12 = [v3 decodeIntegerForKey:@"__kSMSessionConfigurationSessionWorkoutTypeKey"];

  LOBYTE(v15) = v10;
  id v13 = [(SMSessionConfiguration *)self initWithConversation:v16 sessionID:v4 sessionStartDate:v5 sessionType:v6 time:v7 destination:v8 userResponseSafeDate:v9 sessionSupportsHandoff:v15 sosReceivers:v11 sessionWorkoutType:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  conversation = self->_conversation;
  id v5 = a3;
  [v5 encodeObject:conversation forKey:@"__kSMSessionConfigurationConversationKey"];
  [v5 encodeObject:self->_sessionID forKey:@"__kSMSessionConfigurationSessionIDKey"];
  [v5 encodeObject:self->_sessionStartDate forKey:@"__kSMSessionConfigurationStartDateKey"];
  [v5 encodeInteger:self->_sessionType forKey:@"__kSMSessionConfigurationTypeKey"];
  [v5 encodeObject:self->_time forKey:@"__kSMSessionConfigurationTimeKey"];
  [v5 encodeObject:self->_destination forKey:@"__kSMSessionConfigurationDestinationKey"];
  [v5 encodeObject:self->_userResponseSafeDate forKey:@"__kSMSessionConfigurationUserResponseSafeDateKey"];
  [v5 encodeBool:self->_sessionSupportsHandoff forKey:@"__kSMSessionConfigurationSessionSupportsHandoffKey"];
  [v5 encodeObject:self->_sosReceivers forKey:@"__kSMSessionConfigurationSOSReceiversKey"];
  [v5 encodeInteger:self->_sessionWorkoutType forKey:@"__kSMSessionConfigurationSessionWorkoutTypeKey"];
}

- (unint64_t)hash
{
  id v3 = [(SMSessionConfiguration *)self conversation];
  uint64_t v4 = [v3 hash];
  id v5 = [(SMSessionConfiguration *)self sessionID];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(SMSessionConfiguration *)self sessionStartDate];
  uint64_t v8 = [v7 hash];
  unint64_t v9 = v6 ^ v8 ^ [(SMSessionConfiguration *)self sessionType];
  char v10 = [(SMSessionConfiguration *)self time];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(SMSessionConfiguration *)self destination];
  uint64_t v13 = v11 ^ [v12 hash];
  id v14 = [(SMSessionConfiguration *)self userResponseSafeDate];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  uint64_t v16 = [(SMSessionConfiguration *)self sessionSupportsHandoff];
  v17 = [(SMSessionConfiguration *)self sosReceivers];
  uint64_t v18 = v15 ^ v16 ^ [v17 hash];
  id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));
  unint64_t v20 = v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (SMSessionConfiguration *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v7 = v6;
      uint64_t v8 = [(SMSessionConfiguration *)self conversation];
      unint64_t v9 = [(SMSessionConfiguration *)v7 conversation];
      if (v8 != v9)
      {
        id v3 = [(SMSessionConfiguration *)self conversation];
        char v10 = [(SMSessionConfiguration *)v7 conversation];
        if (![v3 isEqual:v10])
        {
          BOOL v11 = 0;
          goto LABEL_36;
        }
        v56 = v10;
        v57 = v3;
      }
      uint64_t v12 = [(SMSessionConfiguration *)self sessionID];
      uint64_t v13 = [(SMSessionConfiguration *)v7 sessionID];
      if (v12 != v13)
      {
        id v3 = [(SMSessionConfiguration *)self sessionID];
        uint64_t v4 = [(SMSessionConfiguration *)v7 sessionID];
        if (![v3 isEqual:v4]) {
          goto LABEL_19;
        }
      }
      v55 = v4;
      id v14 = [(SMSessionConfiguration *)self sessionStartDate];
      [v14 timeIntervalSince1970];
      double v16 = v15;
      v17 = [(SMSessionConfiguration *)v7 sessionStartDate];
      [v17 timeIntervalSince1970];
      if (v16 != v18
        || (v54 = v3,
            unint64_t v19 = [(SMSessionConfiguration *)self sessionType],
            BOOL v20 = v19 == [(SMSessionConfiguration *)v7 sessionType],
            id v3 = v54,
            !v20))
      {

        uint64_t v4 = v55;
        if (v12 == v13)
        {

          goto LABEL_21;
        }
LABEL_19:

LABEL_21:
        BOOL v11 = 0;
        goto LABEL_35;
      }
      v51 = v17;
      v21 = v14;
      uint64_t v22 = [(SMSessionConfiguration *)self time];
      v52 = [(SMSessionConfiguration *)v7 time];
      v53 = (void *)v22;
      if ((void *)v22 != v52)
      {
        v23 = [(SMSessionConfiguration *)self time];
        v48 = [(SMSessionConfiguration *)v7 time];
        v49 = v23;
        if (![v23 isEqual:v48])
        {
          BOOL v11 = 0;
          v24 = v21;
          v25 = v51;
LABEL_29:

LABEL_30:
          if (v12 == v13)
          {

            goto LABEL_34;
          }
LABEL_31:

LABEL_32:
LABEL_34:

LABEL_35:
          char v10 = v56;
          id v3 = v57;
          if (v8 == v9)
          {
LABEL_37:

            goto LABEL_38;
          }
LABEL_36:

          goto LABEL_37;
        }
      }
      v47 = v21;
      id v26 = [(SMSessionConfiguration *)self destination];
      uint64_t v50 = [(SMSessionConfiguration *)v7 destination];
      if (v26 != (void *)v50)
      {
        id v27 = [(SMSessionConfiguration *)self destination];
        v45 = [(SMSessionConfiguration *)v7 destination];
        v46 = v27;
        if (![v27 isEqual:v45])
        {
          BOOL v11 = 0;
          id v28 = (void *)v50;
          goto LABEL_28;
        }
      }
      id v29 = [(SMSessionConfiguration *)self userResponseSafeDate];
      [v29 timeIntervalSince1970];
      double v31 = v30;
      v32 = [(SMSessionConfiguration *)v7 userResponseSafeDate];
      [v32 timeIntervalSince1970];
      if (v31 != v33
        || (v44 = v32,
            BOOL v34 = [(SMSessionConfiguration *)self sessionSupportsHandoff],
            BOOL v20 = v34 == [(SMSessionConfiguration *)v7 sessionSupportsHandoff],
            v32 = v44,
            !v20))
      {

        BOOL v11 = 0;
        id v28 = (void *)v50;
        id v3 = v54;
        if (v26 != (void *)v50) {
          goto LABEL_28;
        }
        goto LABEL_46;
      }
      uint64_t v36 = [(SMSessionConfiguration *)self sosReceivers];
      v42 = [(SMSessionConfiguration *)v7 sosReceivers];
      v43 = (void *)v36;
      if ((void *)v36 == v42)
      {
        id v3 = v54;
      }
      else
      {
        v37 = [(SMSessionConfiguration *)self sosReceivers];
        v40 = [(SMSessionConfiguration *)v7 sosReceivers];
        v41 = v37;
        int v38 = [v37 isEqual:v40];
        id v3 = v54;
        if (!v38)
        {
          BOOL v11 = 0;
LABEL_44:

LABEL_45:
          id v28 = (void *)v50;
          if (v26 != (void *)v50)
          {
LABEL_28:

            v24 = v47;
            v25 = v51;
            if (v53 == v52) {
              goto LABEL_30;
            }
            goto LABEL_29;
          }
LABEL_46:

          if (v53 != v52)
          {
          }
          if (v12 == v13) {
            goto LABEL_32;
          }
          goto LABEL_31;
        }
      }
      unint64_t v39 = [(SMSessionConfiguration *)self sessionWorkoutType];
      BOOL v11 = v39 == [(SMSessionConfiguration *)v7 sessionWorkoutType];
      if (v43 == v42) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    BOOL v11 = 0;
  }
LABEL_38:

  return v11;
}

- (BOOL)isSameSession:(id)a3
{
  id v6 = a3;
  unint64_t v7 = [(SMSessionConfiguration *)self conversation];
  uint64_t v8 = [v6 conversation];
  if (v7 != v8)
  {
    id v3 = [(SMSessionConfiguration *)self conversation];
    uint64_t v4 = [v6 conversation];
    if (![v3 isEqual:v4])
    {
      char v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  char v10 = [(SMSessionConfiguration *)self sessionID];
  BOOL v11 = [v6 sessionID];
  if (v10 == v11)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v12 = [(SMSessionConfiguration *)self sessionID];
    uint64_t v13 = [v6 sessionID];
    char v9 = [v12 isEqual:v13];
  }
  if (v7 != v8) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (SMSessionConfiguration)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [[SMSessionTime alloc] initWithDictionary:v3];
  id v5 = [[SMSessionDestination alloc] initWithDictionary:v3];
  id v6 = [[SMConversation alloc] initWithDictionary:v3];
  if (v6)
  {
LABEL_6:
    uint64_t v12 = [v3 valueForKey:@"__kSMSessionConfigurationStartDateKey"];
    unint64_t v39 = v12;
    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x263EFF910];
      [v12 doubleValue];
      v42 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      v42 = 0;
    }
    id v14 = [v3 valueForKey:@"__kSMSessionConfigurationUserResponseSafeDateKey"];
    double v15 = v14;
    if (v14)
    {
      double v16 = (void *)MEMORY[0x263EFF910];
      [v14 doubleValue];
      v40 = objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
    }
    else
    {
      v40 = 0;
    }
    v17 = [v3 valueForKey:@"__kSMSessionConfigurationTypeKey"];
    int v18 = [v17 intValue];
    id v19 = objc_alloc(MEMORY[0x263F08C38]);
    BOOL v20 = [v3 valueForKey:@"__kSMSessionConfigurationSessionIDKey"];
    v21 = (void *)[v19 initWithUUIDString:v20];

    if (v21)
    {
      v37 = v5;
      int v38 = v4;
      uint64_t v22 = v18;
      v23 = [v3 valueForKey:@"__kSMSessionConfigurationSessionSupportsHandoffKey"];
      uint64_t v24 = [v23 BOOLValue];

      v25 = [v3 valueForKey:@"__kSMSessionConfigurationSessionWorkoutTypeKey"];
      uint64_t v26 = [v25 integerValue];

      id v27 = [SMConversation alloc];
      id v28 = [v3 valueForKey:@"__kSMSessionConfigurationSOSReceiversKey"];
      id v29 = [(SMConversation *)v27 initWithDictionary:v28];

      switch(v22)
      {
        case 1:
          uint64_t v4 = v38;
          double v30 = (SMSessionConfiguration *)[(SMSessionConfiguration *)self initTimeBoundSessionConfigurationWithConversation:v6 sessionID:v21 time:v38 sessionStartDate:v42 sessionSupportsHandoff:v24 sosReceivers:v29];
          double v31 = v30;
          id v5 = v37;
          break;
        case 2:
          id v5 = v37;
          id v34 = [(SMSessionConfiguration *)self initDestinationBoundSessionConfigurationWithConversation:v6 sessionID:v21 destination:v37 sessionStartDate:v42 userResponseSafeDate:v40 sessionSupportsHandoff:v24 sosReceivers:v29];
          goto LABEL_23;
        case 3:
          id v5 = v37;
          id v34 = [(SMSessionConfiguration *)self initRoundTripSessionConfigurationWithConversation:v6 sessionID:v21 destination:v37 sessionStartDate:v42 userResponseSafeDate:v40 sessionSupportsHandoff:v24 sosReceivers:v29];
LABEL_23:
          double v30 = (SMSessionConfiguration *)v34;
          double v31 = v30;
          uint64_t v4 = v38;
          break;
        case 4:
          double v30 = (SMSessionConfiguration *)[(SMSessionConfiguration *)self initWorkoutBoundSessionConfigurationWithConversation:v6 sessionID:v21 sessionStartDate:v42 sessionSupportsHandoff:v24 sosReceivers:v29 sessionWorkoutType:v26];
          double v31 = v30;
          id v5 = v37;
          uint64_t v4 = v38;
          break;
        default:
          LOBYTE(v36) = v24;
          double v30 = [[SMSessionConfiguration alloc] initWithConversation:v6 sessionID:v21 sessionStartDate:0 sessionType:v22 time:0 destination:0 userResponseSafeDate:0 sessionSupportsHandoff:v36 sosReceivers:v29 sessionWorkoutType:0];
          id v5 = v37;
          uint64_t v4 = v38;
          double v31 = self;
          break;
      }
      v32 = v30;

      double v33 = (SMSessionConfiguration *)v32;
    }
    else
    {
      v32 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SMSessionConfiguration initWithDictionary:]";
        _os_log_error_impl(&dword_25B6E0000, v32, OS_LOG_TYPE_ERROR, "%s, sessionID is nil", buf, 0xCu);
      }
      double v33 = 0;
      double v31 = self;
    }

    goto LABEL_28;
  }
  unint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SMSessionConfiguration initWithDictionary:]";
    _os_log_error_impl(&dword_25B6E0000, v7, OS_LOG_TYPE_ERROR, "%s, conversation is nil", buf, 0xCu);
  }

  uint64_t v8 = [[SMHandle alloc] initWithDictionary:v3];
  if (v8)
  {
    char v9 = v8;
    char v10 = [SMConversation alloc];
    v43 = v9;
    BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v43 count:1];
    id v6 = [(SMConversation *)v10 initWithReceiverHandles:v11 identifier:0 displayName:0];

    goto LABEL_6;
  }
  _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v6 = (SMConversation *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SMSessionConfiguration initWithDictionary:]";
    _os_log_error_impl(&dword_25B6E0000, &v6->super, OS_LOG_TYPE_ERROR, "%s, toHandle is nil", buf, 0xCu);
  }
  double v33 = 0;
  double v31 = self;
LABEL_28:

  return v33;
}

- (id)outputToDictionary
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(SMSessionConfiguration *)self conversation];
  id v5 = [v4 outputToDictionary];

  if (v5) {
    [v3 addEntriesFromDictionary:v5];
  }
  id v6 = [(SMSessionConfiguration *)self conversation];
  unint64_t v7 = [v6 receiverHandles];
  uint64_t v8 = [v7 firstObject];
  char v9 = [v8 outputToDictionary];

  if (v9) {
    [v3 addEntriesFromDictionary:v9];
  }
  char v10 = [(SMSessionConfiguration *)self time];

  if (v10)
  {
    BOOL v11 = [(SMSessionConfiguration *)self time];
    uint64_t v12 = [v11 outputToDictionary];
    [v3 addEntriesFromDictionary:v12];
  }
  uint64_t v13 = [(SMSessionConfiguration *)self destination];

  if (v13)
  {
    id v14 = [(SMSessionConfiguration *)self destination];
    double v15 = [v14 outputToDictionary];
    [v3 addEntriesFromDictionary:v15];
  }
  double v16 = [(SMSessionConfiguration *)self sessionStartDate];

  if (v16)
  {
    v17 = NSNumber;
    int v18 = [(SMSessionConfiguration *)self sessionStartDate];
    [v18 timeIntervalSince1970];
    id v19 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v19 forKey:@"__kSMSessionConfigurationStartDateKey"];
  }
  BOOL v20 = [(SMSessionConfiguration *)self userResponseSafeDate];

  if (v20)
  {
    v21 = NSNumber;
    uint64_t v22 = [(SMSessionConfiguration *)self userResponseSafeDate];
    [v22 timeIntervalSince1970];
    v23 = objc_msgSend(v21, "numberWithDouble:");
    [v3 setObject:v23 forKey:@"__kSMSessionConfigurationUserResponseSafeDateKey"];
  }
  uint64_t v24 = [(SMSessionConfiguration *)self sosReceivers];

  if (v24)
  {
    v25 = [(SMSessionConfiguration *)self sosReceivers];
    uint64_t v26 = [v25 outputToDictionary];
    [v3 setObject:v26 forKey:@"__kSMSessionConfigurationSOSReceiversKey"];
  }
  id v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SMSessionConfiguration sessionSupportsHandoff](self, "sessionSupportsHandoff"));
  [v3 setObject:v27 forKey:@"__kSMSessionConfigurationSessionSupportsHandoffKey"];

  id v28 = [(SMSessionConfiguration *)self sessionID];
  id v29 = [v28 UUIDString];
  [v3 setObject:v29 forKey:@"__kSMSessionConfigurationSessionIDKey"];

  double v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionType](self, "sessionType"));
  [v3 setObject:v30 forKey:@"__kSMSessionConfigurationTypeKey"];

  double v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType"));
  [v3 setObject:v31 forKey:@"__kSMSessionConfigurationSessionWorkoutTypeKey"];

  return v3;
}

- (id)description
{
  id v15 = (id)NSString;
  id v19 = [(SMSessionConfiguration *)self conversation];
  id v14 = [v19 receiverHandles];
  int v18 = [(SMSessionConfiguration *)self conversation];
  uint64_t v13 = [v18 identifier];
  id v3 = [(SMSessionConfiguration *)self sessionID];
  v17 = [(SMSessionConfiguration *)self sessionStartDate];
  uint64_t v4 = [v17 stringFromDate];
  id v5 = +[SMSessionConfiguration sessionTypeToString:[(SMSessionConfiguration *)self sessionType]];
  id v6 = [(SMSessionConfiguration *)self time];
  unint64_t v7 = [(SMSessionConfiguration *)self destination];
  uint64_t v8 = [(SMSessionConfiguration *)self userResponseSafeDate];
  char v9 = [v8 stringFromDate];
  BOOL v10 = [(SMSessionConfiguration *)self sessionSupportsHandoff];
  BOOL v11 = [(SMSessionConfiguration *)self sosReceivers];
  id v16 = [v15 stringWithFormat:@"{ReceiverHandles:%@, GroupID:%@, SessionID:%@, SessionStartDate:%@, SessionType:%@, Time:%@, Destination:%@, userResponseSafeDate:%@, SessionSupportsHandoff:%d,SOSReceivers:%@, SessionWorkoutType:%lu}", v14, v13, v3, v4, v5, v6, v7, v9, v10, v11, -[SMSessionConfiguration sessionWorkoutType](self, "sessionWorkoutType")];

  return v16;
}

- (SMHandle)handle
{
  v2 = [(SMSessionConfiguration *)self conversation];
  id v3 = [v2 receiverHandles];
  uint64_t v4 = [v3 firstObject];

  return (SMHandle *)v4;
}

- (SMConversation)conversation
{
  return self->_conversation;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (SMSessionTime)time
{
  return self->_time;
}

- (SMSessionDestination)destination
{
  return self->_destination;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (NSDate)userResponseSafeDate
{
  return self->_userResponseSafeDate;
}

- (BOOL)sessionSupportsHandoff
{
  return self->_sessionSupportsHandoff;
}

- (void)setSessionSupportsHandoff:(BOOL)a3
{
  self->_sessionSupportsHandoff = a3;
}

- (unint64_t)sessionWorkoutType
{
  return self->_sessionWorkoutType;
}

- (void)setSessionWorkoutType:(unint64_t)a3
{
  self->_sessionWorkoutType = a3;
}

- (SMConversation)sosReceivers
{
  return self->_sosReceivers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosReceivers, 0);
  objc_storeStrong((id *)&self->_userResponseSafeDate, 0);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end