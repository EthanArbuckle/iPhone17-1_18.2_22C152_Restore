@interface SCLState
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInSchedule;
- (BOOL)isScheduleEnabled;
- (SCLState)initWithActive:(BOOL)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5;
- (SCLState)initWithActiveState:(unint64_t)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5;
- (SCLState)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)activeState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLState)initWithActiveState:(unint64_t)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)SCLState;
  result = [(SCLState *)&v9 init];
  if (result)
  {
    result->_activeState = a3;
    result->_scheduleEnabled = a4;
    result->_inSchedule = a5;
  }
  return result;
}

- (SCLState)initWithActive:(BOOL)a3 scheduleEnabled:(BOOL)a4 inSchedule:(BOOL)a5
{
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  return [(SCLState *)self initWithActiveState:v5 scheduleEnabled:a4 inSchedule:a5];
}

- (SCLState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SCLState;
  uint64_t v5 = [(SCLState *)&v7 init];
  if (v5)
  {
    v5->_activeState = [v4 decodeIntegerForKey:@"activeState"];
    v5->_scheduleEnabled = [v4 decodeBoolForKey:@"scheduleEnabled"];
    v5->_inSchedule = [v4 decodeBoolForKey:@"inSchedule"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activeState = self->_activeState;
  id v5 = a3;
  [v5 encodeInteger:activeState forKey:@"activeState"];
  objc_msgSend(v5, "encodeBool:forKey:", -[SCLState isScheduleEnabled](self, "isScheduleEnabled"), @"scheduleEnabled");
  objc_msgSend(v5, "encodeBool:forKey:", -[SCLState isInSchedule](self, "isInSchedule"), @"inSchedule");
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(SCLState *)self activeState];
  if (v6 > 2) {
    objc_super v7 = 0;
  }
  else {
    objc_super v7 = off_2648AC8A0[v6];
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; %@; scheduleEnabled=%u; inSchedule=%u>",
    v5,
    self,
    v7,
    [(SCLState *)self isScheduleEnabled],
  v8 = [(SCLState *)self isInSchedule]);

  return v8;
}

- (BOOL)isActive
{
  return [(SCLState *)self activeState] == 2;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SCLState *)self activeState];
  BOOL v4 = [(SCLState *)self isScheduleEnabled];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  unint64_t v6 = v5 ^ v3;
  BOOL v7 = [(SCLState *)self isInSchedule];
  uint64_t v8 = 4;
  if (!v7) {
    uint64_t v8 = 0;
  }
  return v6 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(SCLState *)self activeState];
    if (v6 == [v5 activeState]
      && (int v7 = [(SCLState *)self isScheduleEnabled],
          v7 == [v5 isScheduleEnabled]))
    {
      BOOL v9 = [(SCLState *)self isInSchedule];
      int v8 = v9 ^ [v5 isInSchedule] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isScheduleEnabled
{
  return self->_scheduleEnabled;
}

- (BOOL)isInSchedule
{
  return self->_inSchedule;
}

- (unint64_t)activeState
{
  return self->_activeState;
}

@end