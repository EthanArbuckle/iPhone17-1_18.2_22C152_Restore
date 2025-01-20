@interface SOAlarm
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiring;
- (NSString)title;
- (NSURL)alarmURL;
- (NSUUID)alarmID;
- (SOAlarm)init;
- (SOAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 title:(id)a5 hour:(unint64_t)a6 minute:(unint64_t)a7 repeatSchedule:(unint64_t)a8 isEnabled:(BOOL)a9 isFiring:(BOOL)a10;
- (SOAlarm)initWithBuilder:(id)a3;
- (SOAlarm)initWithCoder:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)hour;
- (unint64_t)minute;
- (unint64_t)repeatSchedule;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOAlarm

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alarmURL, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unint64_t)repeatSchedule
{
  return self->_repeatSchedule;
}

- (unint64_t)minute
{
  return self->_minute;
}

- (unint64_t)hour
{
  return self->_hour;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)alarmURL
{
  return self->_alarmURL;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (void)encodeWithCoder:(id)a3
{
  alarmID = self->_alarmID;
  id v5 = a3;
  [v5 encodeObject:alarmID forKey:@"SOAlarm::alarmID"];
  [v5 encodeObject:self->_alarmURL forKey:@"SOAlarm::alarmURL"];
  [v5 encodeObject:self->_title forKey:@"SOAlarm::title"];
  v6 = [NSNumber numberWithUnsignedInteger:self->_hour];
  [v5 encodeObject:v6 forKey:@"SOAlarm::hour"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_minute];
  [v5 encodeObject:v7 forKey:@"SOAlarm::minute"];

  v8 = [NSNumber numberWithUnsignedInteger:self->_repeatSchedule];
  [v5 encodeObject:v8 forKey:@"SOAlarm::repeatSchedule"];

  v9 = [NSNumber numberWithBool:self->_isEnabled];
  [v5 encodeObject:v9 forKey:@"SOAlarm::isEnabled"];

  id v10 = [NSNumber numberWithBool:self->_isFiring];
  [v5 encodeObject:v10 forKey:@"SOAlarm::isFiring"];
}

- (SOAlarm)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::alarmID"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::alarmURL"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::title"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::hour"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::minute"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::repeatSchedule"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::isEnabled"];
  char v14 = [v13 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOAlarm::isFiring"];

  LOBYTE(v3) = [v15 BOOLValue];
  BYTE1(v18) = (_BYTE)v3;
  LOBYTE(v18) = v14;
  v16 = -[SOAlarm initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:](self, "initWithAlarmID:alarmURL:title:hour:minute:repeatSchedule:isEnabled:isFiring:", v4, v5, v6, v8, v10, v12, v18);

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SOAlarm *)a3;
  if (self == v4)
  {
    BOOL v17 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t hour = self->_hour;
      if (hour == [(SOAlarm *)v5 hour]
        && (unint64_t minute = self->_minute, minute == [(SOAlarm *)v5 minute])
        && (unint64_t repeatSchedule = self->_repeatSchedule, repeatSchedule == [(SOAlarm *)v5 repeatSchedule])
        && (BOOL isEnabled = self->_isEnabled, isEnabled == [(SOAlarm *)v5 isEnabled])
        && (BOOL isFiring = self->_isFiring, isFiring == [(SOAlarm *)v5 isFiring]))
      {
        v11 = [(SOAlarm *)v5 alarmID];
        alarmID = self->_alarmID;
        if (alarmID == v11 || [(NSUUID *)alarmID isEqual:v11])
        {
          v13 = [(SOAlarm *)v5 alarmURL];
          alarmURL = self->_alarmURL;
          if (alarmURL == v13 || [(NSURL *)alarmURL isEqual:v13])
          {
            v15 = [(SOAlarm *)v5 title];
            title = self->_title;
            BOOL v17 = title == v15 || [(NSString *)title isEqual:v15];
          }
          else
          {
            BOOL v17 = 0;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_alarmID hash];
  uint64_t v4 = [(NSURL *)self->_alarmURL hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_title hash];
  v6 = [NSNumber numberWithUnsignedInteger:self->_hour];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_minute];
  uint64_t v9 = [v8 hash];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_repeatSchedule];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  uint64_t v12 = [NSNumber numberWithBool:self->_isEnabled];
  uint64_t v13 = [v12 hash];
  char v14 = [NSNumber numberWithBool:self->_isFiring];
  unint64_t v15 = v11 ^ v13 ^ [v14 hash];

  return v15;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v16.receiver = self;
  v16.super_class = (Class)SOAlarm;
  NSUInteger v5 = [(SOAlarm *)&v16 description];
  long long v15 = *(_OWORD *)&self->_alarmID;
  long long v14 = *(_OWORD *)&self->_title;
  unint64_t minute = self->_minute;
  uint64_t v7 = SOAlarmRepeatScheduleGetNames(self->_repeatSchedule);
  uint64_t v8 = [v7 componentsJoinedByString:@"|"];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = @"YES";
  if (self->_isEnabled) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (!self->_isFiring) {
    uint64_t v10 = @"NO";
  }
  uint64_t v12 = (void *)[v4 initWithFormat:@"%@ {alarmID = %@, alarmURL = %@, title = %@, hour = %llu, minute = %llu, repeatSchedule = %@, isEnabled = %@, isFiring = %@}", v5, v15, v14, minute, v8, v11, v10];

  return v12;
}

- (id)description
{
  return [(SOAlarm *)self _descriptionWithIndent:0];
}

- (SOAlarm)initWithAlarmID:(id)a3 alarmURL:(id)a4 title:(id)a5 hour:(unint64_t)a6 minute:(unint64_t)a7 repeatSchedule:(unint64_t)a8 isEnabled:(BOOL)a9 isFiring:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __88__SOAlarm_initWithAlarmID_alarmURL_title_hour_minute_repeatSchedule_isEnabled_isFiring___block_invoke;
  v24[3] = &unk_264486FA0;
  id v25 = v16;
  id v26 = v17;
  id v27 = v18;
  unint64_t v28 = a6;
  unint64_t v29 = a7;
  unint64_t v30 = a8;
  BOOL v31 = a9;
  BOOL v32 = a10;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  v22 = [(SOAlarm *)self initWithBuilder:v24];

  return v22;
}

void __88__SOAlarm_initWithAlarmID_alarmURL_title_hour_minute_repeatSchedule_isEnabled_isFiring___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAlarmID:v3];
  [v4 setAlarmURL:*(void *)(a1 + 40)];
  [v4 setTitle:*(void *)(a1 + 48)];
  [v4 setHour:*(void *)(a1 + 56)];
  [v4 setMinute:*(void *)(a1 + 64)];
  [v4 setRepeatSchedule:*(void *)(a1 + 72)];
  [v4 setIsEnabled:*(unsigned __int8 *)(a1 + 80)];
  [v4 setIsFiring:*(unsigned __int8 *)(a1 + 81)];
}

- (SOAlarm)init
{
  return [(SOAlarm *)self initWithBuilder:0];
}

- (SOAlarm)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SOAlarmMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)SOAlarm;
  NSUInteger v5 = [(SOAlarm *)&v18 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_SOAlarmMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SOAlarmMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_SOAlarmMutation *)v7 getAlarmID];
      uint64_t v9 = [v8 copy];
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v9;

      uint64_t v11 = [(_SOAlarmMutation *)v7 getAlarmURL];
      uint64_t v12 = [v11 copy];
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v12;

      long long v14 = [(_SOAlarmMutation *)v7 getTitle];
      uint64_t v15 = [v14 copy];
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_unint64_t hour = [(_SOAlarmMutation *)v7 getHour];
      v6->_unint64_t minute = [(_SOAlarmMutation *)v7 getMinute];
      v6->_unint64_t repeatSchedule = [(_SOAlarmMutation *)v7 getRepeatSchedule];
      v6->_BOOL isEnabled = [(_SOAlarmMutation *)v7 getIsEnabled];
      v6->_BOOL isFiring = [(_SOAlarmMutation *)v7 getIsFiring];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SOAlarmMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SOAlarmMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SOAlarmMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(SOAlarm);
      uint64_t v7 = [(_SOAlarmMutation *)v5 getAlarmID];
      uint64_t v8 = [v7 copy];
      alarmID = v6->_alarmID;
      v6->_alarmID = (NSUUID *)v8;

      uint64_t v10 = [(_SOAlarmMutation *)v5 getAlarmURL];
      uint64_t v11 = [v10 copy];
      alarmURL = v6->_alarmURL;
      v6->_alarmURL = (NSURL *)v11;

      uint64_t v13 = [(_SOAlarmMutation *)v5 getTitle];
      uint64_t v14 = [v13 copy];
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_unint64_t hour = [(_SOAlarmMutation *)v5 getHour];
      v6->_unint64_t minute = [(_SOAlarmMutation *)v5 getMinute];
      v6->_unint64_t repeatSchedule = [(_SOAlarmMutation *)v5 getRepeatSchedule];
      v6->_BOOL isEnabled = [(_SOAlarmMutation *)v5 getIsEnabled];
      v6->_BOOL isFiring = [(_SOAlarmMutation *)v5 getIsFiring];
    }
    else
    {
      v6 = (SOAlarm *)[(SOAlarm *)self copy];
    }
  }
  else
  {
    v6 = (SOAlarm *)[(SOAlarm *)self copy];
  }

  return v6;
}

@end