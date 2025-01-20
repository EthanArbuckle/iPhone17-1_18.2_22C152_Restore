@interface SMWorkoutEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResumedSessionState;
- (NSDate)date;
- (NSUUID)identifier;
- (NSUUID)sessionIdentifier;
- (SMLocation)location;
- (SMWorkoutEvent)initWithCoder:(id)a3;
- (SMWorkoutEvent)initWithDictionary:(id)a3;
- (SMWorkoutEvent)initWithIdentifier:(id)a3 sessionIdentifier:(id)a4 location:(id)a5 activityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8 sessionState:(unint64_t)a9 isResumedSessionState:(BOOL)a10 date:(id)a11;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)outputToDictionary;
- (int64_t)locationType;
- (int64_t)swimmingLocationType;
- (unint64_t)activityType;
- (unint64_t)hash;
- (unint64_t)sessionState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMWorkoutEvent

- (SMWorkoutEvent)initWithIdentifier:(id)a3 sessionIdentifier:(id)a4 location:(id)a5 activityType:(unint64_t)a6 locationType:(int64_t)a7 swimmingLocationType:(int64_t)a8 sessionState:(unint64_t)a9 isResumedSessionState:(BOOL)a10 date:(id)a11
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a11;
  v26.receiver = self;
  v26.super_class = (Class)SMWorkoutEvent;
  v19 = [(SMWorkoutEvent *)&v26 init];
  v20 = v19;
  if (!v19) {
    goto LABEL_5;
  }
  v21 = 0;
  if (v16 && v18)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_sessionIdentifier, a4);
    objc_storeStrong((id *)&v20->_location, a5);
    v20->_activityType = a6;
    v20->_locationType = a7;
    v20->_swimmingLocationType = a8;
    v20->_sessionState = a9;
    v20->_isResumedSessionState = a10;
    objc_storeStrong((id *)&v20->_date, a11);
LABEL_5:
    v21 = v20;
  }

  return v21;
}

- (SMWorkoutEvent)initWithDictionary:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 objectForKey:@"__kSMWorkoutEventIdentifierKey"];
  v7 = (void *)[v5 initWithUUIDString:v6];

  id v8 = objc_alloc(MEMORY[0x263F08C38]);
  v9 = [v4 objectForKey:@"__kSMWorkoutEventSessionIdentifierKey"];
  v10 = (void *)[v8 initWithUUIDString:v9];

  v11 = [SMLocation alloc];
  v12 = [v4 objectForKey:@"__kSMWorkoutEventLocationKey"];
  v13 = [(SMLocation *)v11 initWithDictionary:v12];

  v14 = [v4 objectForKey:@"__kSMWorkoutEventActivityTypeKey"];
  uint64_t v15 = [v14 unsignedIntValue];

  id v16 = [v4 objectForKey:@"__kSMWorkoutEventLocationTypeKey"];
  uint64_t v17 = [v16 unsignedIntValue];

  id v18 = [v4 objectForKey:@"__kSMWorkoutEventSwimmingLocationTypeKey"];
  uint64_t v19 = [v18 unsignedIntValue];

  v20 = [v4 objectForKey:@"__kSMWorkoutEventSessionStateKey"];
  uint64_t v21 = [v20 unsignedIntValue];

  v22 = [v4 objectForKey:@"__kSMWorkoutEventIsResumedSessionStateKey"];
  char v23 = [v22 BOOLValue];

  v24 = [v4 objectForKey:@"__kSMWorkoutEventDateKey"];

  [v24 doubleValue];
  double v26 = v25;

  v27 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v26];
  LOBYTE(v30) = v23;
  v28 = [(SMWorkoutEvent *)self initWithIdentifier:v7 sessionIdentifier:v10 location:v13 activityType:v15 locationType:v17 swimmingLocationType:v19 sessionState:v21 isResumedSessionState:v30 date:v27];

  return v28;
}

- (id)outputToDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(SMWorkoutEvent *)self identifier];

  if (v4)
  {
    id v5 = [(SMWorkoutEvent *)self identifier];
    v6 = [v5 UUIDString];
    [v3 setObject:v6 forKey:@"__kSMWorkoutEventIdentifierKey"];
  }
  v7 = [(SMWorkoutEvent *)self sessionIdentifier];

  if (v7)
  {
    id v8 = [(SMWorkoutEvent *)self sessionIdentifier];
    v9 = [v8 UUIDString];
    [v3 setObject:v9 forKey:@"__kSMWorkoutEventSessionIdentifierKey"];
  }
  v10 = [(SMWorkoutEvent *)self location];

  if (v10)
  {
    v11 = [(SMWorkoutEvent *)self location];
    v12 = [v11 outputToDictionary];

    [v3 setObject:v12 forKey:@"__kSMWorkoutEventLocationKey"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMWorkoutEvent activityType](self, "activityType"));
  [v3 setObject:v13 forKey:@"__kSMWorkoutEventActivityTypeKey"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMWorkoutEvent locationType](self, "locationType"));
  [v3 setObject:v14 forKey:@"__kSMWorkoutEventLocationTypeKey"];

  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType"));
  [v3 setObject:v15 forKey:@"__kSMWorkoutEventSwimmingLocationTypeKey"];

  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMWorkoutEvent sessionState](self, "sessionState"));
  [v3 setObject:v16 forKey:@"__kSMWorkoutEventSessionStateKey"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState"));
  [v3 setObject:v17 forKey:@"__kSMWorkoutEventIsResumedSessionStateKey"];

  id v18 = [(SMWorkoutEvent *)self date];

  if (v18)
  {
    uint64_t v19 = [(SMWorkoutEvent *)self date];
    [v19 timeIntervalSince1970];
    double v21 = v20;

    v22 = [NSNumber numberWithDouble:v21];
    [v3 setObject:v22 forKey:@"__kSMWorkoutEventDateKey"];
  }
  char v23 = (void *)[v3 copy];

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMWorkoutEvent)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMWorkoutEventIdentifierKey"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMWorkoutEventSessionIdentifierKey"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMWorkoutEventLocationKey"];
  uint64_t v7 = (int)[v3 decodeIntForKey:@"__kSMWorkoutEventActivityTypeKey"];
  uint64_t v8 = (int)[v3 decodeIntForKey:@"__kSMWorkoutEventLocationTypeKey"];
  uint64_t v9 = (int)[v3 decodeIntForKey:@"__kSMWorkoutEventSwimmingLocationTypeKey"];
  uint64_t v10 = (int)[v3 decodeIntForKey:@"__kSMWorkoutEventSessionStateKey"];
  char v11 = [v3 decodeBoolForKey:@"__kSMWorkoutEventIsResumedSessionStateKey"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMWorkoutEventDateKey"];

  LOBYTE(v15) = v11;
  v13 = [(SMWorkoutEvent *)self initWithIdentifier:v4 sessionIdentifier:v5 location:v6 activityType:v7 locationType:v8 swimmingLocationType:v9 sessionState:v10 isResumedSessionState:v15 date:v12];

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SMWorkoutEvent *)self identifier];
  [v4 encodeObject:v5 forKey:@"__kSMWorkoutEventIdentifierKey"];

  v6 = [(SMWorkoutEvent *)self sessionIdentifier];
  [v4 encodeObject:v6 forKey:@"__kSMWorkoutEventSessionIdentifierKey"];

  uint64_t v7 = [(SMWorkoutEvent *)self location];
  [v4 encodeObject:v7 forKey:@"__kSMWorkoutEventLocationKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent activityType](self, "activityType"), @"__kSMWorkoutEventActivityTypeKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent locationType](self, "locationType"), @"__kSMWorkoutEventLocationTypeKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent swimmingLocationType](self, "swimmingLocationType"), @"__kSMWorkoutEventSwimmingLocationTypeKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SMWorkoutEvent sessionState](self, "sessionState"), @"__kSMWorkoutEventSessionStateKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SMWorkoutEvent isResumedSessionState](self, "isResumedSessionState"), @"__kSMWorkoutEventIsResumedSessionStateKey");
  id v8 = [(SMWorkoutEvent *)self date];
  [v4 encodeObject:v8 forKey:@"__kSMWorkoutEventDateKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  LOBYTE(v6) = self->_isResumedSessionState;
  return (id)[v4 initWithIdentifier:self->_identifier sessionIdentifier:self->_sessionIdentifier location:self->_location activityType:self->_activityType locationType:self->_locationType swimmingLocationType:self->_swimmingLocationType sessionState:self->_sessionState isResumedSessionState:v6 date:self->_date];
}

- (unint64_t)hash
{
  id v3 = [(SMWorkoutEvent *)self sessionIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SMWorkoutEvent *)self sessionIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(SMWorkoutEvent *)self location];
  id v8 = [v7 identifier];
  uint64_t v9 = v6 ^ [v8 hash];
  unint64_t v10 = [(SMWorkoutEvent *)self activityType];
  int64_t v11 = v10 ^ [(SMWorkoutEvent *)self locationType];
  int64_t v12 = v11 ^ [(SMWorkoutEvent *)self swimmingLocationType];
  unint64_t v13 = v9 ^ v12 ^ [(SMWorkoutEvent *)self sessionState];
  uint64_t v14 = [(SMWorkoutEvent *)self isResumedSessionState];
  uint64_t v15 = [(SMWorkoutEvent *)self date];
  unint64_t v16 = v13 ^ v14 ^ [v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SMWorkoutEvent *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(SMWorkoutEvent *)self identifier];
      uint64_t v7 = [(SMWorkoutEvent *)v5 identifier];
      if (v6 != v7)
      {
        id v8 = [(SMWorkoutEvent *)self identifier];
        uint64_t v9 = [(SMWorkoutEvent *)v5 identifier];
        if (![v8 isEqual:v9])
        {
          BOOL v10 = 0;
          goto LABEL_24;
        }
        v37 = v9;
        v38 = v8;
      }
      int64_t v11 = [(SMWorkoutEvent *)self sessionIdentifier];
      int64_t v12 = [(SMWorkoutEvent *)v5 sessionIdentifier];
      if (v11 != v12)
      {
        unint64_t v13 = [(SMWorkoutEvent *)self sessionIdentifier];
        uint64_t v14 = [(SMWorkoutEvent *)v5 sessionIdentifier];
        if (![v13 isEqual:v14])
        {
          BOOL v10 = 0;
          goto LABEL_22;
        }
        v35 = v14;
        v36 = v13;
      }
      uint64_t v15 = [(SMWorkoutEvent *)self location];
      unint64_t v16 = [(SMWorkoutEvent *)v5 location];
      if ([v15 isEquivalent:v16]
        && (unint64_t v17 = [(SMWorkoutEvent *)self activityType],
            v17 == [(SMWorkoutEvent *)v5 activityType])
        && (int64_t v18 = [(SMWorkoutEvent *)self locationType],
            v18 == [(SMWorkoutEvent *)v5 locationType])
        && (int64_t v19 = [(SMWorkoutEvent *)self swimmingLocationType],
            v19 == [(SMWorkoutEvent *)v5 swimmingLocationType])
        && (unint64_t v20 = [(SMWorkoutEvent *)self sessionState],
            v20 == [(SMWorkoutEvent *)v5 sessionState])
        && (BOOL v21 = [(SMWorkoutEvent *)self isResumedSessionState],
            v21 == [(SMWorkoutEvent *)v5 isResumedSessionState]))
      {
        v24 = [(SMWorkoutEvent *)self date];
        [v24 timeIntervalSince1970];
        double v26 = v25;
        v34 = [(SMWorkoutEvent *)v5 date];
        [v34 timeIntervalSince1970];
        if (v26 == v27)
        {
          BOOL v10 = 1;
        }
        else
        {
          v32 = [(SMWorkoutEvent *)self date];
          [v32 timeIntervalSince1970];
          double v29 = v28;
          [(SMWorkoutEvent *)v5 date];
          uint64_t v30 = v33 = v24;
          [v30 timeIntervalSince1970];
          BOOL v10 = vabdd_f64(v29, v31) < 2.22044605e-16;

          v24 = v33;
        }

        BOOL v22 = v10;
      }
      else
      {

        BOOL v10 = 0;
        BOOL v22 = 0;
      }
      uint64_t v14 = v35;
      unint64_t v13 = v36;
      if (v11 == v12)
      {

        BOOL v10 = v22;
        goto LABEL_23;
      }
LABEL_22:

LABEL_23:
      uint64_t v9 = v37;
      id v8 = v38;
      if (v6 == v7)
      {
LABEL_25:

        goto LABEL_26;
      }
LABEL_24:

      goto LABEL_25;
    }
    BOOL v10 = 0;
  }
LABEL_26:

  return v10;
}

- (id)description
{
  v2 = NSString;
  long long v9 = *(_OWORD *)&self->_location;
  long long v10 = *(_OWORD *)&self->_identifier;
  long long v8 = *(_OWORD *)&self->_locationType;
  BOOL isResumedSessionState = self->_isResumedSessionState;
  unint64_t sessionState = self->_sessionState;
  id v5 = [(NSDate *)self->_date stringFromDate];
  uint64_t v6 = [v2 stringWithFormat:@"identifier, %@, sessionIdentifier, %@, location, %@, activityType, %lu, locationType, %lu swimmingLocationType, %lu sessionState, %lu, isResumedSessionState, %d, date, %@", v10, v9, v8, sessionState, isResumedSessionState, v5];

  return v6;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SMLocation)location
{
  return self->_location;
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)isResumedSessionState
{
  return self->_isResumedSessionState;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end