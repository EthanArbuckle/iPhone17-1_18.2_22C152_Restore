@interface SMSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)stringFromSMSuggestionSuppressionReason:(unint64_t)a3;
+ (id)stringFromSMSuggestionTrigger:(unint64_t)a3;
+ (id)stringFromSMSuggestionUserType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuppressed;
- (NSDate)creationDate;
- (NSDateInterval)dateInterval;
- (RTLocation)destinationLocation;
- (RTLocation)sourceLocation;
- (RTLocationOfInterest)locationOfInterest;
- (SMContactInformation)buddy;
- (SMSuggestion)initWithCoder:(id)a3;
- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11;
- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11 locationOfInterest:(id)a12;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sessionType;
- (unint64_t)suggestionTrigger;
- (unint64_t)suggestionUserType;
- (unint64_t)suppressionReason;
- (void)encodeWithCoder:(id)a3;
- (void)setSuppressionReason:(unint64_t)a3;
@end

@implementation SMSuggestion

- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11 locationOfInterest:(id)a12
{
  id v30 = a7;
  id v29 = a8;
  id v28 = a9;
  id v27 = a10;
  id v17 = a11;
  id v26 = a12;
  if (!v17)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: creationDate";
      goto LABEL_13;
    }
LABEL_7:

    v20 = 0;
    goto LABEL_11;
  }
  if (a6 != 4 && !v30)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: sourceLocation";
LABEL_13:
      _os_log_error_impl(&dword_25B6E0000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v31.receiver = self;
  v31.super_class = (Class)SMSuggestion;
  v21 = [(SMSuggestion *)&v31 init];
  p_isa = (id *)&v21->super.isa;
  if (v21)
  {
    v21->_suggestionTrigger = a3;
    v21->_suggestionUserType = a4;
    v21->_suppressionReason = a5;
    v21->_sessionType = a6;
    objc_storeStrong((id *)&v21->_sourceLocation, a7);
    objc_storeStrong(p_isa + 6, a8);
    objc_storeStrong(p_isa + 7, a9);
    objc_storeStrong(p_isa + 8, a10);
    objc_storeStrong(p_isa + 9, a11);
    objc_storeStrong(p_isa + 10, a12);
  }
  self = p_isa;
  v20 = self;
LABEL_11:

  return v20;
}

- (SMSuggestion)initWithSuggestionTrigger:(unint64_t)a3 suggestionUserType:(unint64_t)a4 suppressionReason:(unint64_t)a5 sessionType:(unint64_t)a6 sourceLocation:(id)a7 destinationLocation:(id)a8 buddy:(id)a9 dateInterval:(id)a10 creationDate:(id)a11
{
  return [(SMSuggestion *)self initWithSuggestionTrigger:a3 suggestionUserType:a4 suppressionReason:a5 sessionType:a6 sourceLocation:a7 destinationLocation:a8 buddy:a9 dateInterval:a10 creationDate:a11 locationOfInterest:0];
}

- (id)description
{
  id v14 = (id)NSString;
  v13 = objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionTrigger:", -[SMSuggestion suggestionTrigger](self, "suggestionTrigger"));
  v16 = objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionUserType:", -[SMSuggestion suggestionUserType](self, "suggestionUserType"));
  v3 = objc_msgSend((id)objc_opt_class(), "stringFromSMSuggestionSuppressionReason:", -[SMSuggestion suppressionReason](self, "suppressionReason"));
  v4 = +[SMSessionConfiguration sessionTypeToString:[(SMSuggestion *)self sessionType]];
  v5 = [(SMSuggestion *)self sourceLocation];
  v6 = [(SMSuggestion *)self destinationLocation];
  v7 = [(SMSuggestion *)self buddy];
  v8 = [(SMSuggestion *)self dateInterval];
  v9 = [(SMSuggestion *)self creationDate];
  v10 = [v9 stringFromDate];
  v11 = [(SMSuggestion *)self locationOfInterest];
  id v15 = [v14 stringWithFormat:@"trigger, %@, user type, %@, suppression reason, %@, session type, %@, source location, %@, destination location, %@, buddy, %@, date interval, %@, creationDate, %@, locationOfInterest, %@", v13, v16, v3, v4, v5, v6, v7, v8, v10, v11];

  return v15;
}

+ (id)stringFromSMSuggestionTrigger:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_265499330[a3 - 1];
  }
}

+ (id)stringFromSMSuggestionUserType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_265499350[a3 - 1];
  }
}

+ (id)stringFromSMSuggestionSuppressionReason:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_265499370[a3 - 1];
  }
}

- (BOOL)isSuppressed
{
  return [(SMSuggestion *)self suppressionReason] != 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMSuggestion)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v15 = [v3 decodeIntegerForKey:@"Trigger"];
  uint64_t v4 = [v3 decodeIntegerForKey:@"UserType"];
  uint64_t v5 = [v3 decodeIntegerForKey:@"SuppressionReason"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"sSssionType"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SourceLocation"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"DestinationLocation"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"Buddy"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"DateInterval"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"LocationOfInterest"];

  v13 = [(SMSuggestion *)self initWithSuggestionTrigger:v15 suggestionUserType:v4 suppressionReason:v5 sessionType:v6 sourceLocation:v7 destinationLocation:v8 buddy:v9 dateInterval:v10 creationDate:v11 locationOfInterest:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t suggestionTrigger = self->_suggestionTrigger;
  id v5 = a3;
  [v5 encodeInteger:suggestionTrigger forKey:@"Trigger"];
  [v5 encodeInteger:self->_suggestionUserType forKey:@"UserType"];
  [v5 encodeInteger:self->_suppressionReason forKey:@"SuppressionReason"];
  [v5 encodeInteger:self->_sessionType forKey:@"sSssionType"];
  [v5 encodeObject:self->_sourceLocation forKey:@"SourceLocation"];
  [v5 encodeObject:self->_destinationLocation forKey:@"DestinationLocation"];
  [v5 encodeObject:self->_buddy forKey:@"Buddy"];
  [v5 encodeObject:self->_dateInterval forKey:@"DateInterval"];
  [v5 encodeObject:self->_creationDate forKey:@"CreationDate"];
  [v5 encodeObject:self->_locationOfInterest forKey:@"LocationOfInterest"];
}

- (unint64_t)hash
{
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSuggestion suggestionTrigger](self, "suggestionTrigger"));
  uint64_t v3 = [v23 hash];
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSuggestion suggestionUserType](self, "suggestionUserType"));
  uint64_t v4 = [v22 hash] ^ v3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSuggestion suppressionReason](self, "suppressionReason"));
  uint64_t v6 = [v5 hash];
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SMSuggestion sessionType](self, "sessionType"));
  uint64_t v8 = v4 ^ v6 ^ [v7 hash];
  v9 = [(SMSuggestion *)self sourceLocation];
  uint64_t v10 = [v9 hash];
  v11 = [(SMSuggestion *)self destinationLocation];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [(SMSuggestion *)self buddy];
  uint64_t v14 = v12 ^ [v13 hash];
  uint64_t v15 = [(SMSuggestion *)self dateInterval];
  uint64_t v16 = v14 ^ [v15 hash];
  id v17 = [(SMSuggestion *)self creationDate];
  uint64_t v18 = v16 ^ [v17 hash];
  v19 = [(SMSuggestion *)self locationOfInterest];
  unint64_t v20 = v8 ^ v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (SMSuggestion *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      unint64_t v7 = [(SMSuggestion *)self suggestionTrigger];
      if (v7 != [(SMSuggestion *)v6 suggestionTrigger]
        || (unint64_t v8 = [(SMSuggestion *)self suggestionUserType],
            v8 != [(SMSuggestion *)v6 suggestionUserType])
        || (unint64_t v9 = [(SMSuggestion *)self suppressionReason],
            v9 != [(SMSuggestion *)v6 suppressionReason])
        || (unint64_t v10 = [(SMSuggestion *)self sessionType], v10 != [(SMSuggestion *)v6 sessionType]))
      {
        char v14 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v11 = [(SMSuggestion *)self sourceLocation];
      uint64_t v12 = [(SMSuggestion *)v6 sourceLocation];
      if (v11 != v12)
      {
        v13 = [(SMSuggestion *)self sourceLocation];
        v52 = [(SMSuggestion *)v6 sourceLocation];
        v53 = v13;
        if (![v13 isEqual:v52])
        {
          char v14 = 0;
          goto LABEL_43;
        }
      }
      uint64_t v16 = [(SMSuggestion *)self destinationLocation];
      id v17 = [(SMSuggestion *)v6 destinationLocation];
      if (v16 != v17)
      {
        uint64_t v3 = [(SMSuggestion *)self destinationLocation];
        v51 = [(SMSuggestion *)v6 destinationLocation];
        if (!objc_msgSend(v3, "isEqual:"))
        {
          char v14 = 0;
LABEL_41:

LABEL_42:
          if (v11 == v12)
          {
LABEL_44:

            goto LABEL_13;
          }
LABEL_43:

          goto LABEL_44;
        }
      }
      uint64_t v18 = [(SMSuggestion *)self buddy];
      uint64_t v19 = [(SMSuggestion *)v6 buddy];
      v50 = (void *)v18;
      BOOL v20 = v18 == v19;
      v21 = (void *)v19;
      if (!v20)
      {
        v22 = [(SMSuggestion *)self buddy];
        v45 = [(SMSuggestion *)v6 buddy];
        v46 = v22;
        if (![v22 isEqual:v45])
        {
          char v14 = 0;
          v23 = v50;
LABEL_39:

LABEL_40:
          if (v16 == v17) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }
      }
      uint64_t v24 = [(SMSuggestion *)self dateInterval];
      uint64_t v48 = [(SMSuggestion *)v6 dateInterval];
      v49 = (void *)v24;
      v47 = v21;
      if (v24 == v48)
      {
        v41 = v17;
      }
      else
      {
        v25 = v3;
        id v26 = [(SMSuggestion *)self dateInterval];
        v43 = [(SMSuggestion *)v6 dateInterval];
        v44 = v26;
        if (![v26 isEqual:v43])
        {
          char v14 = 0;
          id v29 = (void *)v48;
          uint64_t v3 = v25;
LABEL_37:

LABEL_38:
          v21 = v47;
          v23 = v50;
          if (v50 == v47) {
            goto LABEL_40;
          }
          goto LABEL_39;
        }
        v41 = v17;
        uint64_t v3 = v25;
      }
      id v27 = [(SMSuggestion *)self creationDate];
      uint64_t v42 = [(SMSuggestion *)v6 creationDate];
      if (v27 == (void *)v42)
      {
        v37 = v3;
        v38 = v16;
      }
      else
      {
        id v28 = [(SMSuggestion *)self creationDate];
        v39 = [(SMSuggestion *)v6 creationDate];
        v40 = v28;
        if (![v28 isEqual:v39])
        {
          char v14 = 0;
          id v17 = v41;
          v35 = (void *)v42;
          goto LABEL_35;
        }
        v37 = v3;
        v38 = v16;
      }
      id v30 = [(SMSuggestion *)self locationOfInterest];
      uint64_t v31 = [(SMSuggestion *)v6 locationOfInterest];
      if (v30 == (void *)v31)
      {

        char v14 = 1;
      }
      else
      {
        v32 = (void *)v31;
        [(SMSuggestion *)self locationOfInterest];
        v33 = v36 = v27;
        v34 = [(SMSuggestion *)v6 locationOfInterest];
        char v14 = [v33 isEqual:v34];

        id v27 = v36;
      }
      id v17 = v41;
      v35 = (void *)v42;
      uint64_t v3 = v37;
      uint64_t v16 = v38;
      if (v27 == (void *)v42)
      {
LABEL_36:

        id v29 = (void *)v48;
        if (v49 == (void *)v48) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
LABEL_35:

      goto LABEL_36;
    }
    char v14 = 0;
  }
LABEL_14:

  return v14;
}

- (unint64_t)suggestionTrigger
{
  return self->_suggestionTrigger;
}

- (unint64_t)suggestionUserType
{
  return self->_suggestionUserType;
}

- (unint64_t)suppressionReason
{
  return self->_suppressionReason;
}

- (void)setSuppressionReason:(unint64_t)a3
{
  self->_suppressionReason = a3;
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (RTLocation)sourceLocation
{
  return self->_sourceLocation;
}

- (RTLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (SMContactInformation)buddy
{
  return self->_buddy;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (RTLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_buddy, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_sourceLocation, 0);
}

@end