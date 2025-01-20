@interface USDeviceActivitySchedule
+ (BOOL)supportsSecureCoding;
+ (id)nextIntervalForStartComponents:(id)a3 endComponents:(id)a4;
+ (id)nextWarningDateForComponents:(id)a3 referenceDate:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)repeats;
- (NSDateComponents)intervalEnd;
- (NSDateComponents)intervalStart;
- (NSDateComponents)warningTime;
- (NSDateInterval)nextInterval;
- (USDeviceActivitySchedule)initWithCoder:(id)a3;
- (USDeviceActivitySchedule)initWithIntervalStart:(id)a3 intervalEnd:(id)a4 repeats:(BOOL)a5 warningTime:(id)a6;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USDeviceActivitySchedule

- (USDeviceActivitySchedule)initWithIntervalStart:(id)a3 intervalEnd:(id)a4 repeats:(BOOL)a5 warningTime:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)USDeviceActivitySchedule;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = [(USDeviceActivitySchedule *)&v20 init];
  uint64_t v13 = objc_msgSend(v11, "copy", v20.receiver, v20.super_class);

  intervalStart = v12->_intervalStart;
  v12->_intervalStart = (NSDateComponents *)v13;

  uint64_t v15 = [v10 copy];
  intervalEnd = v12->_intervalEnd;
  v12->_intervalEnd = (NSDateComponents *)v15;

  v12->_repeats = a5;
  uint64_t v17 = [v9 copy];

  warningTime = v12->_warningTime;
  v12->_warningTime = (NSDateComponents *)v17;

  return v12;
}

- (USDeviceActivitySchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IntervalStart"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IntervalEnd"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WarningTime"];
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ![v4 containsValueForKey:@"Repeats"])
  {

    id v9 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)USDeviceActivitySchedule;
    id v9 = [(USDeviceActivitySchedule *)&v17 init];
    uint64_t v10 = [v5 copy];
    intervalStart = v9->_intervalStart;
    v9->_intervalStart = (NSDateComponents *)v10;

    uint64_t v12 = [v6 copy];
    intervalEnd = v9->_intervalEnd;
    v9->_intervalEnd = (NSDateComponents *)v12;

    v9->_repeats = [v4 decodeBoolForKey:@"Repeats"];
    uint64_t v14 = [v7 copy];
    warningTime = v9->_warningTime;
    v9->_warningTime = (NSDateComponents *)v14;
  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  intervalStart = self->_intervalStart;
  id v5 = a3;
  [v5 encodeObject:intervalStart forKey:@"IntervalStart"];
  [v5 encodeObject:self->_intervalEnd forKey:@"IntervalEnd"];
  [v5 encodeBool:self->_repeats forKey:@"Repeats"];
  [v5 encodeObject:self->_warningTime forKey:@"WarningTime"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateInterval)nextInterval
{
  v3 = objc_opt_class();
  id v4 = [(USDeviceActivitySchedule *)self intervalStart];
  id v5 = [(USDeviceActivitySchedule *)self intervalEnd];
  v6 = [v3 nextIntervalForStartComponents:v4 endComponents:v5];

  return (NSDateInterval *)v6;
}

+ (id)nextIntervalForStartComponents:(id)a3 endComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF910] now];
  BOOL v8 = [v5 calendar];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  id v11 = v10;

  uint64_t v12 = [v5 timeZone];
  if (v12)
  {
    [v11 setTimeZone:v12];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263EFFA18] localTimeZone];
    [v11 setTimeZone:v13];
  }
  uint64_t v14 = [v11 nextDateAfterDate:v7 matchingComponents:v5 options:516];
  uint64_t v15 = [v6 calendar];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  v18 = v17;

  v19 = [v6 timeZone];
  if (v19)
  {
    [v18 setTimeZone:v19];
  }
  else
  {
    objc_super v20 = [MEMORY[0x263EFFA18] localTimeZone];
    [v18 setTimeZone:v20];
  }
  uint64_t v21 = [v18 nextDateAfterDate:v7 matchingComponents:v6 options:516];
  v22 = (void *)v21;
  if (v14 && (!v21 || [v14 compare:v21] == 1))
  {
    id v23 = v14;
LABEL_18:
    v24 = [v18 nextDateAfterDate:v23 matchingComponents:v6 options:512];
    if (v24) {
      v25 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v23 endDate:v24];
    }
    else {
      v25 = 0;
    }

    goto LABEL_23;
  }
  id v23 = [v11 nextDateAfterDate:v7 matchingComponents:v5 options:512];
  if (v23) {
    goto LABEL_18;
  }
  v25 = 0;
LABEL_23:

  return v25;
}

+ (id)nextWarningDateForComponents:(id)a3 referenceDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 calendar];
  BOOL v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  }
  id v10 = v9;

  id v11 = [v5 timeZone];
  if (v11)
  {
    [v10 setTimeZone:v11];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x263EFFA18] localTimeZone];
    [v10 setTimeZone:v12];
  }
  id v13 = [v10 dateByAddingComponents:v5 toDate:v6 options:0];
  if (!v13)
  {
LABEL_11:
    id v13 = v13;
    v16 = v13;
    goto LABEL_15;
  }
  [v6 timeIntervalSinceDate:v13];
  if (v14 != 0.0)
  {
    if (v14 < 0.0)
    {
      uint64_t v15 = objc_msgSend(v6, "dateByAddingTimeInterval:");

      id v13 = (id)v15;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    +[USDeviceActivitySchedule nextWarningDateForComponents:referenceDate:]((uint64_t)v5);
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(USDeviceActivitySchedule *)self warningTime];
    id v6 = v4;
    v7 = [v6 warningTime];
    BOOL v8 = [(USDeviceActivitySchedule *)self intervalStart];
    id v9 = [v6 intervalStart];
    if ([v8 isEqual:v9])
    {
      id v10 = [(USDeviceActivitySchedule *)self intervalEnd];
      id v11 = [v6 intervalEnd];
      if ([v10 isEqual:v11]
        && (int v12 = -[USDeviceActivitySchedule repeats](self, "repeats"), v12 == [v6 repeats]))
      {
        if (v5 == v7) {
          char v13 = 1;
        }
        else {
          char v13 = [v5 isEqual:v7];
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(USDeviceActivitySchedule *)self intervalStart];
  uint64_t v4 = [v3 hash];
  id v5 = [(USDeviceActivitySchedule *)self intervalEnd];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = v6 ^ [(USDeviceActivitySchedule *)self repeats];
  BOOL v8 = [(USDeviceActivitySchedule *)self warningTime];
  unint64_t v9 = v7 ^ [v8 hash];

  return v9;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)USDeviceActivitySchedule;
  uint64_t v4 = [(USDeviceActivitySchedule *)&v11 description];
  id v5 = [(USDeviceActivitySchedule *)self intervalStart];
  uint64_t v6 = [(USDeviceActivitySchedule *)self intervalEnd];
  BOOL v7 = [(USDeviceActivitySchedule *)self repeats];
  BOOL v8 = [(USDeviceActivitySchedule *)self warningTime];
  unint64_t v9 = [v3 stringWithFormat:@"%@\nIntervalStart: %@\nIntervalEnd: %@\nRepeats: %d\nWarningTime: %@", v4, v5, v6, v7, v8];

  return v9;
}

- (NSDateComponents)intervalStart
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (NSDateComponents)intervalEnd
{
  return (NSDateComponents *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (NSDateComponents)warningTime
{
  return (NSDateComponents *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warningTime, 0);
  objc_storeStrong((id *)&self->_intervalEnd, 0);
  objc_storeStrong((id *)&self->_intervalStart, 0);
}

+ (void)nextWarningDateForComponents:(uint64_t)a1 referenceDate:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Tried to create a 0-length warning interval with components %{public}@", (uint8_t *)&v1, 0xCu);
}

@end