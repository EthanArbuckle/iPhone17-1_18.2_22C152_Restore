@interface SOTimer
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFiring;
- (NSDate)dismissedDate;
- (NSDate)fireDate;
- (NSDate)firedDate;
- (NSDate)lastModifiedDate;
- (NSString)title;
- (NSURL)timerURL;
- (NSUUID)timerID;
- (SOTimer)init;
- (SOTimer)initWithBuilder:(id)a3;
- (SOTimer)initWithCoder:(id)a3;
- (SOTimer)initWithTimerID:(id)a3 timerURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 state:(int64_t)a7 duration:(double)a8 type:(int64_t)a9 fireTimeInterval:(double)a10 fireDate:(id)a11 firedDate:(id)a12 dismissedDate:(id)a13 lastModifiedDate:(id)a14;
- (double)duration;
- (double)fireTimeInterval;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SOTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timerURL, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)dismissedDate
{
  return self->_dismissedDate;
}

- (NSDate)firedDate
{
  return self->_firedDate;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (double)fireTimeInterval
{
  return self->_fireTimeInterval;
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isFiring
{
  return self->_isFiring;
}

- (NSURL)timerURL
{
  return self->_timerURL;
}

- (NSUUID)timerID
{
  return self->_timerID;
}

- (void)encodeWithCoder:(id)a3
{
  timerID = self->_timerID;
  id v10 = a3;
  [v10 encodeObject:timerID forKey:@"SOTimer::timerID"];
  [v10 encodeObject:self->_timerURL forKey:@"SOTimer::timerURL"];
  v5 = [NSNumber numberWithBool:self->_isFiring];
  [v10 encodeObject:v5 forKey:@"SOTimer::isFiring"];

  [v10 encodeObject:self->_title forKey:@"SOTimer::title"];
  v6 = [NSNumber numberWithInteger:self->_state];
  [v10 encodeObject:v6 forKey:@"SOTimer::state"];

  v7 = [NSNumber numberWithDouble:self->_duration];
  [v10 encodeObject:v7 forKey:@"SOTimer::duration"];

  v8 = [NSNumber numberWithInteger:self->_type];
  [v10 encodeObject:v8 forKey:@"SOTimer::type"];

  v9 = [NSNumber numberWithDouble:self->_fireTimeInterval];
  [v10 encodeObject:v9 forKey:@"SOTimer::fireTimeInterval"];

  [v10 encodeObject:self->_fireDate forKey:@"SOTimer::fireDate"];
  [v10 encodeObject:self->_firedDate forKey:@"SOTimer::firedDate"];
  [v10 encodeObject:self->_dismissedDate forKey:@"SOTimer::dismissedDate"];
  [v10 encodeObject:self->_lastModifiedDate forKey:@"SOTimer::lastModifiedDate"];
}

- (SOTimer)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::timerID"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::timerURL"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::isFiring"];
  unsigned int v24 = [v6 BOOLValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::title"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::state"];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::duration"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::type"];
  uint64_t v14 = [v13 integerValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::fireTimeInterval"];
  [v15 doubleValue];
  double v17 = v16;

  v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::fireDate"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::firedDate"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::dismissedDate"];
  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SOTimer::lastModifiedDate"];

  v22 = [(SOTimer *)self initWithTimerID:v4 timerURL:v5 isFiring:v24 title:v7 state:v9 duration:v14 type:v12 fireTimeInterval:v17 fireDate:v18 firedDate:v19 dismissedDate:v20 lastModifiedDate:v21];
  return v22;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SOTimer *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isFiring = self->_isFiring;
      if (isFiring == [(SOTimer *)v5 isFiring]
        && (int64_t state = self->_state, state == [(SOTimer *)v5 state])
        && (double duration = self->_duration, [(SOTimer *)v5 duration], duration == v9)
        && (int64_t type = self->_type, type == [(SOTimer *)v5 type])
        && (double fireTimeInterval = self->_fireTimeInterval,
            [(SOTimer *)v5 fireTimeInterval],
            fireTimeInterval == v12))
      {
        v15 = [(SOTimer *)v5 timerID];
        timerID = self->_timerID;
        if (timerID == v15 || [(NSUUID *)timerID isEqual:v15])
        {
          double v17 = [(SOTimer *)v5 timerURL];
          timerURL = self->_timerURL;
          if (timerURL == v17 || [(NSURL *)timerURL isEqual:v17])
          {
            v19 = [(SOTimer *)v5 title];
            title = self->_title;
            if (title == v19 || [(NSString *)title isEqual:v19])
            {
              v21 = [(SOTimer *)v5 fireDate];
              fireDate = self->_fireDate;
              if (fireDate == v21 || [(NSDate *)fireDate isEqual:v21])
              {
                v23 = [(SOTimer *)v5 firedDate];
                firedDate = self->_firedDate;
                if (firedDate == v23 || [(NSDate *)firedDate isEqual:v23])
                {
                  v25 = [(SOTimer *)v5 dismissedDate];
                  dismissedDate = self->_dismissedDate;
                  if (dismissedDate == v25 || [(NSDate *)dismissedDate isEqual:v25])
                  {
                    v27 = [(SOTimer *)v5 lastModifiedDate];
                    lastModifiedDate = self->_lastModifiedDate;
                    BOOL v13 = lastModifiedDate == v27 || [(NSDate *)lastModifiedDate isEqual:v27];
                  }
                  else
                  {
                    BOOL v13 = 0;
                  }
                }
                else
                {
                  BOOL v13 = 0;
                }
              }
              else
              {
                BOOL v13 = 0;
              }
            }
            else
            {
              BOOL v13 = 0;
            }
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_timerID hash];
  uint64_t v4 = [(NSURL *)self->_timerURL hash] ^ v3;
  v5 = [NSNumber numberWithBool:self->_isFiring];
  uint64_t v6 = [v5 hash];
  NSUInteger v7 = v4 ^ [(NSString *)self->_title hash] ^ v6;
  v8 = [NSNumber numberWithInteger:self->_state];
  uint64_t v9 = [v8 hash];
  id v10 = [NSNumber numberWithDouble:self->_duration];
  uint64_t v11 = v7 ^ v9 ^ [v10 hash];
  double v12 = [NSNumber numberWithInteger:self->_type];
  uint64_t v13 = [v12 hash];
  uint64_t v14 = [NSNumber numberWithDouble:self->_fireTimeInterval];
  uint64_t v15 = v13 ^ [v14 hash];
  uint64_t v16 = v11 ^ v15 ^ [(NSDate *)self->_fireDate hash];
  uint64_t v17 = [(NSDate *)self->_firedDate hash];
  uint64_t v18 = v17 ^ [(NSDate *)self->_dismissedDate hash];
  unint64_t v19 = v16 ^ v18 ^ [(NSDate *)self->_lastModifiedDate hash];

  return v19;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v20.receiver = self;
  v20.super_class = (Class)SOTimer;
  v5 = [(SOTimer *)&v20 description];
  unint64_t state = self->_state;
  if (state > 3) {
    NSUInteger v7 = @"(unknown)";
  }
  else {
    NSUInteger v7 = off_264486F38[state];
  }
  timerID = self->_timerID;
  timerURL = self->_timerURL;
  BOOL isFiring = self->_isFiring;
  title = self->_title;
  double v12 = v7;
  double duration = self->_duration;
  unint64_t type = self->_type;
  if (type > 2) {
    uint64_t v15 = @"(unknown)";
  }
  else {
    uint64_t v15 = off_264486AC8[type];
  }
  if (isFiring) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  uint64_t v17 = v15;
  v18 = (void *)[v4 initWithFormat:@"%@ {timerID = %@, timerURL = %@, BOOL isFiring = %@, title = %@, state = %@, duration = %f, type = %@, fireTimeInterval = %f, fireDate = %@, firedDate = %@, dismissedDate = %@, lastModifiedDate = %@}", v5, timerID, timerURL, v16, title, v12, *(void *)&duration, v17, *(void *)&self->_fireTimeInterval, self->_fireDate, self->_firedDate, self->_dismissedDate, self->_lastModifiedDate];

  return v18;
}

- (id)description
{
  return [(SOTimer *)self _descriptionWithIndent:0];
}

- (SOTimer)initWithTimerID:(id)a3 timerURL:(id)a4 isFiring:(BOOL)a5 title:(id)a6 state:(int64_t)a7 duration:(double)a8 type:(int64_t)a9 fireTimeInterval:(double)a10 fireDate:(id)a11 firedDate:(id)a12 dismissedDate:(id)a13 lastModifiedDate:(id)a14
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a6;
  id v23 = a11;
  id v24 = a12;
  id v25 = a13;
  id v26 = a14;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __138__SOTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke;
  v38[3] = &unk_264487028;
  id v39 = v20;
  id v40 = v21;
  BOOL v50 = a5;
  double v47 = a8;
  int64_t v48 = a9;
  double v49 = a10;
  id v41 = v22;
  id v42 = v23;
  id v43 = v24;
  id v44 = v25;
  id v45 = v26;
  int64_t v46 = a7;
  id v27 = v26;
  id v28 = v25;
  id v29 = v24;
  id v30 = v23;
  id v31 = v22;
  id v32 = v21;
  id v33 = v20;
  v34 = [(SOTimer *)self initWithBuilder:v38];

  return v34;
}

void __138__SOTimer_initWithTimerID_timerURL_isFiring_title_state_duration_type_fireTimeInterval_fireDate_firedDate_dismissedDate_lastModifiedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTimerID:v3];
  [v4 setTimerURL:*(void *)(a1 + 40)];
  [v4 setIsFiring:*(unsigned __int8 *)(a1 + 120)];
  [v4 setTitle:*(void *)(a1 + 48)];
  [v4 setState:*(void *)(a1 + 88)];
  [v4 setDuration:*(double *)(a1 + 96)];
  [v4 setType:*(void *)(a1 + 104)];
  [v4 setFireTimeInterval:*(double *)(a1 + 112)];
  [v4 setFireDate:*(void *)(a1 + 56)];
  [v4 setFiredDate:*(void *)(a1 + 64)];
  [v4 setDismissedDate:*(void *)(a1 + 72)];
  [v4 setLastModifiedDate:*(void *)(a1 + 80)];
}

- (SOTimer)init
{
  return [(SOTimer *)self initWithBuilder:0];
}

- (SOTimer)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _SOTimerMutation *))a3;
  v32.receiver = self;
  v32.super_class = (Class)SOTimer;
  v5 = [(SOTimer *)&v32 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_SOTimerMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_SOTimerMutation *)v7 isDirty])
    {
      v8 = [(_SOTimerMutation *)v7 getTimerID];
      uint64_t v9 = [v8 copy];
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v9;

      uint64_t v11 = [(_SOTimerMutation *)v7 getTimerURL];
      uint64_t v12 = [v11 copy];
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v12;

      v6->_BOOL isFiring = [(_SOTimerMutation *)v7 getIsFiring];
      uint64_t v14 = [(_SOTimerMutation *)v7 getTitle];
      uint64_t v15 = [v14 copy];
      title = v6->_title;
      v6->_title = (NSString *)v15;

      v6->_unint64_t state = [(_SOTimerMutation *)v7 getState];
      [(_SOTimerMutation *)v7 getDuration];
      v6->_double duration = v17;
      v6->_unint64_t type = [(_SOTimerMutation *)v7 getType];
      [(_SOTimerMutation *)v7 getFireTimeInterval];
      v6->_double fireTimeInterval = v18;
      unint64_t v19 = [(_SOTimerMutation *)v7 getFireDate];
      uint64_t v20 = [v19 copy];
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v20;

      id v22 = [(_SOTimerMutation *)v7 getFiredDate];
      uint64_t v23 = [v22 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v23;

      id v25 = [(_SOTimerMutation *)v7 getDismissedDate];
      uint64_t v26 = [v25 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v26;

      id v28 = [(_SOTimerMutation *)v7 getLastModifiedDate];
      uint64_t v29 = [v28 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v29;
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
  id v4 = (void (**)(id, _SOTimerMutation *))a3;
  if (v4)
  {
    v5 = [[_SOTimerMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_SOTimerMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(SOTimer);
      NSUInteger v7 = [(_SOTimerMutation *)v5 getTimerID];
      uint64_t v8 = [v7 copy];
      timerID = v6->_timerID;
      v6->_timerID = (NSUUID *)v8;

      id v10 = [(_SOTimerMutation *)v5 getTimerURL];
      uint64_t v11 = [v10 copy];
      timerURL = v6->_timerURL;
      v6->_timerURL = (NSURL *)v11;

      v6->_BOOL isFiring = [(_SOTimerMutation *)v5 getIsFiring];
      uint64_t v13 = [(_SOTimerMutation *)v5 getTitle];
      uint64_t v14 = [v13 copy];
      title = v6->_title;
      v6->_title = (NSString *)v14;

      v6->_unint64_t state = [(_SOTimerMutation *)v5 getState];
      [(_SOTimerMutation *)v5 getDuration];
      v6->_double duration = v16;
      v6->_unint64_t type = [(_SOTimerMutation *)v5 getType];
      [(_SOTimerMutation *)v5 getFireTimeInterval];
      v6->_double fireTimeInterval = v17;
      double v18 = [(_SOTimerMutation *)v5 getFireDate];
      uint64_t v19 = [v18 copy];
      fireDate = v6->_fireDate;
      v6->_fireDate = (NSDate *)v19;

      id v21 = [(_SOTimerMutation *)v5 getFiredDate];
      uint64_t v22 = [v21 copy];
      firedDate = v6->_firedDate;
      v6->_firedDate = (NSDate *)v22;

      id v24 = [(_SOTimerMutation *)v5 getDismissedDate];
      uint64_t v25 = [v24 copy];
      dismissedDate = v6->_dismissedDate;
      v6->_dismissedDate = (NSDate *)v25;

      id v27 = [(_SOTimerMutation *)v5 getLastModifiedDate];
      uint64_t v28 = [v27 copy];
      lastModifiedDate = v6->_lastModifiedDate;
      v6->_lastModifiedDate = (NSDate *)v28;
    }
    else
    {
      uint64_t v6 = (SOTimer *)[(SOTimer *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (SOTimer *)[(SOTimer *)self copy];
  }

  return v6;
}

@end