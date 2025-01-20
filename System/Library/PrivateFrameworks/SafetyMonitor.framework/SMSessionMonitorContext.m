@interface SMSessionMonitorContext
+ (BOOL)isDestinationTriggerCategory:(unint64_t)a3;
+ (BOOL)isDurationTriggerCategory:(unint64_t)a3;
+ (BOOL)isRoundTripTriggerCategory:(unint64_t)a3;
+ (BOOL)isSOSTriggerCategory:(unint64_t)a3;
+ (BOOL)isValidAnomaly:(unint64_t)a3;
+ (BOOL)isWorkoutTriggerCategory:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)sessionEndReasonToString:(unint64_t)a3;
+ (id)sessionSafetyMonitorUpdateReasonToString:(unint64_t)a3;
+ (id)triggerCategoryToString:(unint64_t)a3;
+ (id)userTriggerResponseToString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)coarseEstimatedEndDate;
- (NSDate)estimatedEndDate;
- (NSUUID)sessionID;
- (SMSessionMonitorContext)init;
- (SMSessionMonitorContext)initWithCoder:(id)a3;
- (SMSessionMonitorContext)initWithDictionary:(id)a3;
- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 estimatedEndDate:(id)a5 coarseEstimatedEndDate:(id)a6 sessionID:(id)a7;
- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 sessionID:(id)a5;
- (id)description;
- (id)outputToDictionary;
- (unint64_t)hash;
- (unint64_t)triggerCategory;
- (unint64_t)updateReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMSessionMonitorContext

- (SMSessionMonitorContext)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithUpdateReason_triggerCategory_sessionID_);
}

- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 sessionID:(id)a5
{
  return [(SMSessionMonitorContext *)self initWithUpdateReason:a3 triggerCategory:a4 estimatedEndDate:0 coarseEstimatedEndDate:0 sessionID:a5];
}

- (SMSessionMonitorContext)initWithUpdateReason:(unint64_t)a3 triggerCategory:(unint64_t)a4 estimatedEndDate:(id)a5 coarseEstimatedEndDate:(id)a6 sessionID:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)SMSessionMonitorContext;
  v16 = [(SMSessionMonitorContext *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_updateReason = a3;
    v16->_triggerCategory = a4;
    objc_storeStrong((id *)&v16->_estimatedEndDate, a5);
    objc_storeStrong((id *)&v17->_coarseEstimatedEndDate, a6);
    objc_storeStrong((id *)&v17->_sessionID, a7);
  }

  return v17;
}

- (SMSessionMonitorContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 valueForKey:@"__kSMSessionMonitorContextUpdateReasonKey"];
  v6 = [v4 valueForKey:@"__kSMSessionMonitorContextTriggerCategoryKey"];
  v7 = [v4 valueForKey:@"__kSMSessionMonitorContextSessionIDStringKey"];
  if (v7) {
    v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  }
  else {
    v8 = 0;
  }
  v9 = [v4 valueForKey:@"__kSMSessionMonitorContextEstimatedEndDateKey"];

  if (v9)
  {
    v10 = [v4 valueForKey:@"__kSMSessionMonitorContextEstimatedEndDateKey"];
    v11 = (void *)MEMORY[0x263EFF910];
    [v10 doubleValue];
    v9 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  }
  v12 = [v4 valueForKey:@"__kSMSessionMonitorContextCoarseEstimatedEndDateKey"];

  if (v12)
  {
    id v13 = [v4 valueForKey:@"__kSMSessionMonitorContextCoarseEstimatedEndDateKey"];
    id v14 = (void *)MEMORY[0x263EFF910];
    [v13 doubleValue];
    v12 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
  }
  id v15 = 0;
  if (v5 && v6)
  {
    id v15 = -[SMSessionMonitorContext initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:](self, "initWithUpdateReason:triggerCategory:estimatedEndDate:coarseEstimatedEndDate:sessionID:", (int)[v5 intValue], (int)objc_msgSend(v6, "intValue"), v9, v12, v8);
    self = v15;
  }

  return v15;
}

- (id)outputToDictionary
{
  v3 = objc_opt_new();
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionMonitorContext updateReason](self, "updateReason"));
  [v3 setObject:v4 forKey:@"__kSMSessionMonitorContextUpdateReasonKey"];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSessionMonitorContext triggerCategory](self, "triggerCategory"));
  [v3 setObject:v5 forKey:@"__kSMSessionMonitorContextTriggerCategoryKey"];

  v6 = [(SMSessionMonitorContext *)self estimatedEndDate];

  if (v6)
  {
    v7 = NSNumber;
    v8 = [(SMSessionMonitorContext *)self estimatedEndDate];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
    [v3 setObject:v9 forKey:@"__kSMSessionMonitorContextEstimatedEndDateKey"];
  }
  v10 = [(SMSessionMonitorContext *)self coarseEstimatedEndDate];

  if (v10)
  {
    v11 = NSNumber;
    v12 = [(SMSessionMonitorContext *)self coarseEstimatedEndDate];
    [v12 timeIntervalSince1970];
    id v13 = objc_msgSend(v11, "numberWithDouble:");
    [v3 setObject:v13 forKey:@"__kSMSessionMonitorContextCoarseEstimatedEndDateKey"];
  }
  id v14 = [(SMSessionMonitorContext *)self sessionID];

  if (v14)
  {
    id v15 = [(SMSessionMonitorContext *)self sessionID];
    v16 = [v15 UUIDString];
    [v3 setObject:v16 forKey:@"__kSMSessionMonitorContextSessionIDStringKey"];
  }
  return v3;
}

+ (id)sessionSafetyMonitorUpdateReasonToString:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"SMSessionMonitorUpdateReasonUnknown";
  }
  else {
    return off_2654996C0[a3 - 1];
  }
}

+ (id)triggerCategoryToString:(unint64_t)a3
{
  if (a3 > 0x16) {
    return @"SMTriggerCategoryNone";
  }
  else {
    return off_2654996E8[a3];
  }
}

+ (id)userTriggerResponseToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"SMUserTriggerResponseUnknown";
  }
  else {
    return off_2654997A0[a3 - 1];
  }
}

+ (id)sessionEndReasonToString:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"SMSessionEndReasonUnknown";
  }
  else {
    return off_2654997B8[a3 - 1];
  }
}

+ (BOOL)isDestinationTriggerCategory:(unint64_t)a3
{
  return a3 - 3 < 3;
}

+ (BOOL)isRoundTripTriggerCategory:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

+ (BOOL)isDurationTriggerCategory:(unint64_t)a3
{
  return a3 == 7;
}

+ (BOOL)isSOSTriggerCategory:(unint64_t)a3
{
  return a3 - 10 < 5;
}

+ (BOOL)isWorkoutTriggerCategory:(unint64_t)a3
{
  return a3 - 19 < 4;
}

+ (BOOL)isValidAnomaly:(unint64_t)a3
{
  return (a3 < 0x17) & (0x787FBCu >> a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSessionMonitorContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"__kSMSessionMonitorContextUpdateReasonKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"__kSMSessionMonitorContextTriggerCategoryKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionMonitorContextEstimatedEndDateKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionMonitorContextCoarseEstimatedEndDateKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"__kSMSessionMonitorContextSessionIDStringKey"];

  v10 = [(SMSessionMonitorContext *)self initWithUpdateReason:v5 triggerCategory:v6 estimatedEndDate:v7 coarseEstimatedEndDate:v8 sessionID:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t updateReason = self->_updateReason;
  id v5 = a3;
  [v5 encodeInteger:updateReason forKey:@"__kSMSessionMonitorContextUpdateReasonKey"];
  [v5 encodeInteger:self->_triggerCategory forKey:@"__kSMSessionMonitorContextTriggerCategoryKey"];
  [v5 encodeObject:self->_estimatedEndDate forKey:@"__kSMSessionMonitorContextEstimatedEndDateKey"];
  [v5 encodeObject:self->_coarseEstimatedEndDate forKey:@"__kSMSessionMonitorContextCoarseEstimatedEndDateKey"];
  [v5 encodeObject:self->_sessionID forKey:@"__kSMSessionMonitorContextSessionIDStringKey"];
}

- (unint64_t)hash
{
  unint64_t v3 = [(SMSessionMonitorContext *)self updateReason];
  unint64_t v4 = [(SMSessionMonitorContext *)self triggerCategory] ^ v3;
  id v5 = [(SMSessionMonitorContext *)self estimatedEndDate];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [(SMSessionMonitorContext *)self coarseEstimatedEndDate];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SMSessionMonitorContext *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(SMSessionMonitorContext *)self updateReason];
      if (v6 == [(SMSessionMonitorContext *)v5 updateReason]
        && (unint64_t v7 = [(SMSessionMonitorContext *)self triggerCategory],
            v7 == [(SMSessionMonitorContext *)v5 triggerCategory]))
      {
        unint64_t v8 = [(SMSessionMonitorContext *)self estimatedEndDate];
        [v8 timeIntervalSince1970];
        double v10 = v9;
        v11 = [(SMSessionMonitorContext *)v5 estimatedEndDate];
        [v11 timeIntervalSince1970];
        if (v10 == v12)
        {
          id v13 = [(SMSessionMonitorContext *)self coarseEstimatedEndDate];
          [v13 timeIntervalSince1970];
          double v15 = v14;
          v16 = [(SMSessionMonitorContext *)v5 coarseEstimatedEndDate];
          [v16 timeIntervalSince1970];
          BOOL v18 = v15 == v17;
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (id)description
{
  unint64_t v3 = NSString;
  unint64_t v4 = +[SMSessionMonitorContext sessionSafetyMonitorUpdateReasonToString:[(SMSessionMonitorContext *)self updateReason]];
  id v5 = +[SMSessionMonitorContext triggerCategoryToString:[(SMSessionMonitorContext *)self triggerCategory]];
  unint64_t v6 = [(SMSessionMonitorContext *)self estimatedEndDate];
  unint64_t v7 = [v6 stringFromDate];
  unint64_t v8 = [(SMSessionMonitorContext *)self coarseEstimatedEndDate];
  double v9 = [v8 stringFromDate];
  double v10 = [(SMSessionMonitorContext *)self sessionID];
  v11 = [v3 stringWithFormat:@"{UpdateReason:%@, TriggerCategory:%@, estimatedEndDate:%@, coarseEstimatedEndDate:%@, sessionID:%@}", v4, v5, v7, v9, v10];

  return v11;
}

- (unint64_t)updateReason
{
  return self->_updateReason;
}

- (unint64_t)triggerCategory
{
  return self->_triggerCategory;
}

- (NSDate)estimatedEndDate
{
  return self->_estimatedEndDate;
}

- (NSDate)coarseEstimatedEndDate
{
  return self->_coarseEstimatedEndDate;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_coarseEstimatedEndDate, 0);
  objc_storeStrong((id *)&self->_estimatedEndDate, 0);
}

@end