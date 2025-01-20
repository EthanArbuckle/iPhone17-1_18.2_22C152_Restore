@interface HDSPSleepSessionInterval
+ (BOOL)supportsSecureCoding;
+ (id)sleepSessionIntervalWithInterval:(id)a3 type:(unint64_t)a4;
- (BOOL)isEqual:(id)a3;
- (HDSPSleepSessionInterval)initWithCoder:(id)a3;
- (HDSPSleepSessionInterval)initWithInterval:(id)a3 type:(unint64_t)a4;
- (NSDateInterval)interval;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSPSleepSessionInterval

+ (id)sleepSessionIntervalWithInterval:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithInterval:v6 type:a4];

  return v7;
}

- (HDSPSleepSessionInterval)initWithInterval:(id)a3 type:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDSPSleepSessionInterval;
  v8 = [(HDSPSleepSessionInterval *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_interval, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  interval = self->_interval;
  id v5 = a3;
  [v5 encodeObject:interval forKey:@"SleepSessionInterval"];
  [v5 encodeInteger:self->_type forKey:@"SleepSessionType"];
}

- (HDSPSleepSessionInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDSPSleepSessionInterval;
  id v5 = [(HDSPSleepSessionInterval *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SleepSessionInterval"];
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"SleepSessionType"];
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDSPSleepSessionInterval *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [MEMORY[0x263F29C58] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      id v7 = [(HDSPSleepSessionInterval *)self interval];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __36__HDSPSleepSessionInterval_isEqual___block_invoke;
      v20[3] = &unk_2645DAF08;
      v8 = v5;
      v21 = v8;
      id v9 = (id)[v6 appendObject:v7 counterpart:v20];

      unint64_t v10 = [(HDSPSleepSessionInterval *)self type];
      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      v17 = __36__HDSPSleepSessionInterval_isEqual___block_invoke_2;
      v18 = &unk_2645DAF58;
      v19 = v8;
      v11 = v8;
      id v12 = (id)[v6 appendUnsignedInteger:v10 counterpart:&v15];
      char v13 = objc_msgSend(v6, "isEqual", v15, v16, v17, v18);
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

uint64_t __36__HDSPSleepSessionInterval_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interval];
}

uint64_t __36__HDSPSleepSessionInterval_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) type];
}

- (id)succinctDescription
{
  v2 = [(HDSPSleepSessionInterval *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v4 = [(HDSPSleepSessionInterval *)self type];
  if (v4 > 5) {
    id v5 = 0;
  }
  else {
    id v5 = off_2645DB010[v4];
  }
  [v3 appendString:v5 withName:@"type"];
  uint64_t v6 = [(HDSPSleepSessionInterval *)self interval];
  id v7 = (id)[v3 appendObject:v6 withName:@"interval"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HDSPSleepSessionInterval *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end