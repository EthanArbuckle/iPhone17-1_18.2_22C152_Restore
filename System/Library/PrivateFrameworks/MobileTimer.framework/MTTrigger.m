@interface MTTrigger
+ (BOOL)supportsSecureCoding;
+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4;
+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5;
+ (id)_stringForType:(unint64_t)a3;
- (BOOL)isBedtimeRelated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTrigger:(id)a3;
- (BOOL)isEvent;
- (BOOL)isForAlert;
- (BOOL)isForGoToBed;
- (BOOL)isForSnooze;
- (BOOL)isPastOverrideEvent;
- (BOOL)isScheduled;
- (BOOL)isWakeUpRelated;
- (MTTrigger)initWithCoder:(id)a3;
- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4;
- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5;
- (NSDate)triggerDate;
- (NSString)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)triggerType;
- (void)encodeWithCoder:(id)a3;
- (void)setTriggerDate:(id)a3;
- (void)setTriggerType:(unint64_t)a3;
@end

@implementation MTTrigger

+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDate:v6 type:a4];

  return (MTTrigger *)v7;
}

+ (MTTrigger)triggerWithDate:(id)a3 triggerType:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDate:v8 type:a4 isPastOverrideEvent:v5];

  return (MTTrigger *)v9;
}

- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4 isPastOverrideEvent:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTTrigger;
  v9 = [(MTTrigger *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    triggerDate = v9->_triggerDate;
    v9->_triggerDate = (NSDate *)v10;

    v9->_triggerType = a4;
    v9->_isPastOverrideEvent = a5;
  }

  return v9;
}

- (MTTrigger)initWithDate:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTrigger;
  v7 = [(MTTrigger *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    triggerDate = v7->_triggerDate;
    v7->_triggerDate = (NSDate *)v8;

    v7->_triggerType = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [(MTTrigger *)self triggerDate];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(MTTrigger *)self triggerType] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTTrigger *)self isEqualToTrigger:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToTrigger:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MTTrigger *)self triggerType];
  if (v5 == [v4 triggerType])
  {
    id v6 = [(MTTrigger *)self triggerDate];
    id v7 = [v4 triggerDate];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      BOOL v8 = [(MTTrigger *)self triggerDate];
      v9 = [v4 triggerDate];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MTTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTTrigger;
  unint64_t v5 = [(MTTrigger *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTriggerType"];
    v5->_triggerType = [v6 unsignedIntegerValue];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTTriggerDate"];
    uint64_t v8 = [v7 copy];
    triggerDate = v5->_triggerDate;
    v5->_triggerDate = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[MTTrigger triggerType](self, "triggerType"));
  [v5 encodeObject:v6 forKey:@"MTTriggerType"];

  id v7 = [(MTTrigger *)self triggerDate];
  [v5 encodeObject:v7 forKey:@"MTTriggerDate"];
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(MTTrigger *)self triggerDate];
  id v6 = [v4 triggerDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)isForSnooze
{
  unint64_t v3 = [(MTTrigger *)self triggerType];
  if (v3 != 1) {
    LOBYTE(v3) = [(MTTrigger *)self triggerType] == 3
  }
              || [(MTTrigger *)self triggerType] == 5;
  return v3;
}

- (BOOL)isForGoToBed
{
  return [(MTTrigger *)self triggerType] == 2 || [(MTTrigger *)self triggerType] == 3;
}

- (BOOL)isForAlert
{
  if (![(MTTrigger *)self triggerType])
  {
LABEL_4:
    LOBYTE(v3) = 1;
    return v3;
  }
  unint64_t v3 = [(MTTrigger *)self triggerType];
  if (v3 != 1)
  {
    if ([(MTTrigger *)self triggerType] != 4)
    {
      LOBYTE(v3) = [(MTTrigger *)self triggerType] == 5;
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (BOOL)isScheduled
{
  if ([(MTTrigger *)self isForGoToBed] || [(MTTrigger *)self isForAlert]) {
    return 1;
  }
  return [(MTTrigger *)self isEvent];
}

- (BOOL)isEvent
{
  return [(MTTrigger *)self triggerType] == 7 || [(MTTrigger *)self triggerType] == 8;
}

- (BOOL)isBedtimeRelated
{
  return [(MTTrigger *)self triggerType] == 7
      || [(MTTrigger *)self triggerType] == 2
      || [(MTTrigger *)self triggerType] == 3;
}

- (BOOL)isWakeUpRelated
{
  return [(MTTrigger *)self triggerType] == 4
      || [(MTTrigger *)self triggerType] == 5
      || [(MTTrigger *)self triggerType] == 8;
}

+ (id)_stringForType:(unint64_t)a3
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_1E59182E0[a3];
  }
}

- (NSString)description
{
  return (NSString *)[(MTTrigger *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(MTTrigger *)self succinctDescriptionBuilder];
  unint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return [(MTTrigger *)self descriptionBuilderWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(MTTrigger *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v5 = objc_msgSend((id)objc_opt_class(), "_stringForType:", -[MTTrigger triggerType](self, "triggerType"));
  [v4 appendString:v5 withName:@"trigger"];

  id v6 = [(MTTrigger *)self triggerDate];
  int64_t v7 = [v6 mtDescription];
  [v4 appendString:v7 withName:@"date"];

  id v8 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[MTTrigger isPastOverrideEvent](self, "isPastOverrideEvent"), @"isPastOverride", 1);
  return v4;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(unint64_t)a3
{
  self->_triggerType = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
}

- (BOOL)isPastOverrideEvent
{
  return self->_isPastOverrideEvent;
}

- (void).cxx_destruct
{
}

@end