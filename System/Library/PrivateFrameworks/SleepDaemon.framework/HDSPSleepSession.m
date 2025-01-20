@interface HDSPSleepSession
+ (BOOL)supportsSecureCoding;
+ (id)sleepSessionWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresFirstUnlock;
- (HDSPSleepSession)initWithCoder:(id)a3;
- (HDSPSleepSession)initWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7;
- (NSArray)sleepIntervals;
- (NSDateInterval)interval;
- (NSDictionary)metadata;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)endReason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSPSleepSession

+ (id)sleepSessionWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) initWithDateInterval:v14 sleepIntervals:v13 endReason:a5 metadata:v12 requiresFirstUnlock:v7];

  return v15;
}

- (HDSPSleepSession)initWithDateInterval:(id)a3 sleepIntervals:(id)a4 endReason:(unint64_t)a5 metadata:(id)a6 requiresFirstUnlock:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepSession;
  v16 = [(HDSPSleepSession *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_interval, a3);
    objc_storeStrong((id *)&v17->_sleepIntervals, a4);
    v17->_endReason = a5;
    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_requiresFirstUnlock = a7;
    v18 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  interval = self->_interval;
  id v5 = a3;
  [v5 encodeObject:interval forKey:@"SleepSessionDateInterval"];
  [v5 encodeObject:self->_sleepIntervals forKey:@"SleepSessionSleepIntervals"];
  [v5 encodeInteger:self->_endReason forKey:@"SleepSessionEndReason"];
  [v5 encodeObject:self->_metadata forKey:@"SleepSessionMetadata"];
  [v5 encodeBool:self->_requiresFirstUnlock forKey:@"RequiresFirstUnlock"];
}

- (HDSPSleepSession)initWithCoder:(id)a3
{
  v22[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDSPSleepSession;
  id v5 = [(HDSPSleepSession *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SleepSessionDateInterval"];
    interval = v5->_interval;
    v5->_interval = (NSDateInterval *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"SleepSessionSleepIntervals"];
    sleepIntervals = v5->_sleepIntervals;
    v5->_sleepIntervals = (NSArray *)v11;

    v5->_endReason = [v4 decodeIntegerForKey:@"SleepSessionEndReason"];
    id v13 = (void *)MEMORY[0x263EFFA08];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
    id v15 = [v13 setWithArray:v14];

    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"SleepSessionMetadata"];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v16;

    v5->_requiresFirstUnlock = [v4 decodeBoolForKey:@"RequiresFirstUnlock"];
    v18 = v5;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDSPSleepSession *)a3;
  if (self == v4)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [MEMORY[0x263F29C58] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      BOOL v7 = [(HDSPSleepSession *)self interval];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __28__HDSPSleepSession_isEqual___block_invoke;
      v32[3] = &unk_2645DAF08;
      v8 = v5;
      v33 = v8;
      id v9 = (id)[v6 appendObject:v7 counterpart:v32];

      v10 = [(HDSPSleepSession *)self sleepIntervals];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __28__HDSPSleepSession_isEqual___block_invoke_2;
      v30[3] = &unk_2645DAF30;
      uint64_t v11 = v8;
      v31 = v11;
      id v12 = (id)[v6 appendObject:v10 counterpart:v30];

      unint64_t v13 = [(HDSPSleepSession *)self endReason];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __28__HDSPSleepSession_isEqual___block_invoke_3;
      v28[3] = &unk_2645DAF58;
      id v14 = v11;
      v29 = v14;
      id v15 = (id)[v6 appendUnsignedInteger:v13 counterpart:v28];
      uint64_t v16 = [(HDSPSleepSession *)self metadata];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __28__HDSPSleepSession_isEqual___block_invoke_4;
      v26[3] = &unk_2645DAF80;
      v17 = v14;
      v27 = v17;
      id v18 = (id)[v6 appendObject:v16 counterpart:v26];

      BOOL v19 = [(HDSPSleepSession *)self requiresFirstUnlock];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __28__HDSPSleepSession_isEqual___block_invoke_5;
      v24[3] = &unk_2645DAFA8;
      v25 = v17;
      objc_super v20 = v17;
      id v21 = (id)[v6 appendBool:v19 counterpart:v24];
      char v22 = [v6 isEqual];
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) interval];
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) sleepIntervals];
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) endReason];
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) metadata];
}

uint64_t __28__HDSPSleepSession_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) requiresFirstUnlock];
}

- (id)succinctDescription
{
  v2 = [(HDSPSleepSession *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(HDSPSleepSession *)self interval];
  id v5 = (id)[v3 appendObject:v4 withName:@"interval"];

  uint64_t v6 = [(HDSPSleepSession *)self sleepIntervals];
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", objc_msgSend(v6, "count"), @"sleepIntervals");

  unint64_t v8 = [(HDSPSleepSession *)self endReason];
  if (v8 > 8) {
    id v9 = 0;
  }
  else {
    id v9 = off_2645DAFC8[v8];
  }
  [v3 appendString:v9 withName:@"endReason"];
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HDSPSleepSession requiresFirstUnlock](self, "requiresFirstUnlock"), @"requiresFirstUnlock");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HDSPSleepSession *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (NSArray)sleepIntervals
{
  return self->_sleepIntervals;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)requiresFirstUnlock
{
  return self->_requiresFirstUnlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_sleepIntervals, 0);

  objc_storeStrong((id *)&self->_interval, 0);
}

@end