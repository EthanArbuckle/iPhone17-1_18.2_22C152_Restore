@interface HKSPPersistentStateMachineState
+ (BOOL)_hasExpirationDate:(id)a3;
+ (BOOL)_isExpired:(id)a3 currentDate:(id)a4;
+ (id)infiniteInterval;
- (BOOL)_isExpired;
- (BOOL)_updateExpirationDate;
- (BOOL)_willEnter;
- (BOOL)schedulesExpiration;
- (HKSPPersistentStateMachineState)initWithCoder:(id)a3;
- (HKSPPersistentStateMachineState)initWithStateMachine:(id)a3;
- (HKSPPersistentStateMachineState)stateWithIdentifierDidExpire:(id)a3;
- (NSDate)expirationDate;
- (NSDateInterval)lifetimeInterval;
- (double)expirationDuration;
- (id)_updatedLifetimeIntervalWithStartDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)equalsBuilderWithObject:(id)a3;
- (id)succinctDescriptionBuilder;
- (void)_didEnter;
- (void)_didExit;
- (void)_expireOrRescheduleExpirationIfNecessary;
- (void)_resetLifetimeInterval;
- (void)_updateState;
- (void)_willExit;
- (void)encodeWithCoder:(id)a3;
- (void)setLifetimeInterval:(id)a3;
@end

@implementation HKSPPersistentStateMachineState

+ (id)infiniteInterval
{
  id v2 = objc_alloc(MEMORY[0x1E4F28C18]);
  v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v5 = (void *)[v2 initWithStartDate:v3 endDate:v4];

  return v5;
}

- (HKSPPersistentStateMachineState)initWithStateMachine:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPPersistentStateMachineState;
  v3 = [(HKSPStateMachineState *)&v8 initWithStateMachine:a3];
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() infiniteInterval];
    lifetimeInterval = v3->_lifetimeInterval;
    v3->_lifetimeInterval = (NSDateInterval *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v6 = [v5 startDate];
  [v4 encodeObject:v6 forKey:@"EntryDate"];

  id v8 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v7 = [v8 endDate];
  [v4 encodeObject:v7 forKey:@"ExpirationDate"];
}

- (HKSPPersistentStateMachineState)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSPPersistentStateMachineState;
  v5 = [(HKSPStateMachineState *)&v15 initWithStateMachine:0];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EntryDate"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ExpirationDate"];
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    v9 = v6;
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    v10 = v7;
    if (!v7)
    {
      v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    uint64_t v11 = [v8 initWithStartDate:v9 endDate:v10];
    lifetimeInterval = v5->_lifetimeInterval;
    v5->_lifetimeInterval = (NSDateInterval *)v11;

    if (v7)
    {
      if (v6)
      {
LABEL_8:
        v13 = v5;

        goto LABEL_9;
      }
    }
    else
    {

      if (v6) {
        goto LABEL_8;
      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HKSPPersistentStateMachineState;
  id v4 = [(HKSPStateMachineState *)&v9 copyWithZone:a3];
  v5 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

- (id)equalsBuilderWithObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPPersistentStateMachineState;
  v5 = [(HKSPStateMachineState *)&v12 equalsBuilderWithObject:v4];
  uint64_t v6 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__HKSPPersistentStateMachineState_equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E5D32A20;
  id v11 = v4;
  id v7 = v4;
  id v8 = (id)[v5 appendObject:v6 counterpart:v10];

  return v5;
}

uint64_t __59__HKSPPersistentStateMachineState_equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) lifetimeInterval];
}

- (id)succinctDescriptionBuilder
{
  v21.receiver = self;
  v21.super_class = (Class)HKSPPersistentStateMachineState;
  v3 = [(HKSPStateMachineState *)&v21 succinctDescriptionBuilder];
  id v4 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v5 = [v4 startDate];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  char v7 = [v5 isEqualToDate:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
    objc_super v9 = [v8 startDate];
    v10 = [v9 hkspDescription];
    id v11 = (id)[v3 appendObject:v10 withName:@"entryDate"];
  }
  objc_super v12 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
  v13 = [v12 endDate];
  v14 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v15 = [v13 isEqualToDate:v14];

  if ((v15 & 1) == 0)
  {
    v16 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
    v17 = [v16 endDate];
    v18 = [v17 hkspDescription];
    id v19 = (id)[v3 appendObject:v18 withName:@"expirationDate"];
  }
  return v3;
}

- (void)_updateState
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(HKSPPersistentStateMachineState *)self _isExpired])
  {
    v3 = HKSPLogForCategory(7uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_impl(&dword_1A7E74000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] already expired", buf, 0xCu);
    }
    [(HKSPPersistentStateMachineState *)self stateDidExpire];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HKSPPersistentStateMachineState;
    [(HKSPStateMachineState *)&v5 _updateState];
    [(HKSPPersistentStateMachineState *)self _expireOrRescheduleExpirationIfNecessary];
  }
}

- (void)_expireOrRescheduleExpirationIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ([(HKSPStateMachineState *)self isCurrentState])
  {
    BOOL v3 = [(HKSPPersistentStateMachineState *)self _updateExpirationDate];
    if ([(HKSPPersistentStateMachineState *)self _isExpired])
    {
      id v4 = HKSPLogForCategory(7uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = (id)objc_opt_class();
        id v5 = v10;
        _os_log_impl(&dword_1A7E74000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] now expired", (uint8_t *)&v9, 0xCu);
      }
      [(HKSPPersistentStateMachineState *)self stateDidExpire];
    }
    else if (v3 && [(HKSPPersistentStateMachineState *)self schedulesExpiration])
    {
      uint64_t v6 = HKSPLogForCategory(7uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = (id)objc_opt_class();
        id v7 = v10;
        _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduling expiration", (uint8_t *)&v9, 0xCu);
      }
      uint64_t v8 = [(HKSPStateMachineState *)self stateMachine];
      [v8 scheduleStateExpiration];
    }
  }
}

+ (BOOL)_hasExpirationDate:(id)a3
{
  BOOL v3 = [a3 endDate];
  id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v5 = objc_msgSend(v3, "hksp_isBeforeDate:", v4);

  return v5;
}

- (BOOL)_isExpired
{
  BOOL v3 = objc_opt_class();
  lifetimeInterval = self->_lifetimeInterval;
  char v5 = [(HKSPStateMachineState *)self stateMachine];
  uint64_t v6 = [v5 currentDateProvider];
  id v7 = v6[2]();
  LOBYTE(v3) = [v3 _isExpired:lifetimeInterval currentDate:v7];

  return (char)v3;
}

+ (BOOL)_isExpired:(id)a3 currentDate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![a1 _hasExpirationDate:v6]) {
    goto LABEL_10;
  }
  uint64_t v8 = [v6 startDate];
  int v9 = objc_msgSend(v7, "hksp_isBeforeDate:", v8);

  if (v9)
  {
    id v10 = HKSPLogForCategory(7uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      v13 = [v6 startDate];
      int v20 = 138543618;
      objc_super v21 = v11;
      __int16 v22 = 2114;
      v23 = v13;
      v14 = "[%{public}@] it's before the entry date (%{public}@)";
LABEL_8:
      _os_log_impl(&dword_1A7E74000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  char v15 = [v6 endDate];
  int v16 = objc_msgSend(v7, "hksp_isAfterOrSameAsDate:", v15);

  if (!v16)
  {
LABEL_10:
    BOOL v18 = 0;
    goto LABEL_11;
  }
  id v10 = HKSPLogForCategory(7uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_opt_class();
    id v12 = v17;
    v13 = [v6 endDate];
    int v20 = 138543618;
    objc_super v21 = v17;
    __int16 v22 = 2114;
    v23 = v13;
    v14 = "[%{public}@] it's after expiration date (%{public}@)";
    goto LABEL_8;
  }
LABEL_9:

  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (NSDate)expirationDate
{
  return 0;
}

- (double)expirationDuration
{
  return 0.0;
}

- (BOOL)schedulesExpiration
{
  return 0;
}

- (HKSPPersistentStateMachineState)stateWithIdentifierDidExpire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(HKSPStateMachineState *)self stateIdentifier];
  int v6 = [v5 isEqualToString:v4];

  id v7 = HKSPLogForCategory(7uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v12 = 138543362;
      id v13 = (id)objc_opt_class();
      id v9 = v13;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] expiring", (uint8_t *)&v12, 0xCu);
    }
    [(HKSPPersistentStateMachineState *)self stateDidExpire];
  }
  else
  {
    if (v8)
    {
      int v12 = 138543618;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2114;
      id v15 = v4;
      id v10 = v13;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring expired identifier %{public}@", (uint8_t *)&v12, 0x16u);
    }
  }

  return result;
}

- (BOOL)_willEnter
{
  BOOL v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 currentDateProvider];
  char v5 = v4[2]();

  id v6 = v5;
  id v7 = [v3 currentContext];
  BOOL v8 = [v7 previousState];

  if (!v8)
  {
    int v12 = [(HKSPPersistentStateMachineState *)self lifetimeInterval];
    id v10 = [v12 startDate];

    goto LABEL_6;
  }
  id v9 = [v8 lifetimeInterval];
  id v10 = [v9 startDate];

  if (!self) {
    goto LABEL_8;
  }
  uint64_t v11 = v6;
  if ([v8 isMemberOfClass:objc_opt_class()])
  {
LABEL_6:
    if (objc_msgSend(v10, "hksp_isBeforeDate:", v6))
    {
      id v13 = [MEMORY[0x1E4F1C9C8] distantPast];
      char v14 = [v10 isEqualToDate:v13];

      if ((v14 & 1) == 0)
      {
        id v10 = v10;

        uint64_t v11 = v10;
        goto LABEL_9;
      }
    }
LABEL_8:
    uint64_t v11 = v6;
  }
LABEL_9:
  id v15 = [(HKSPPersistentStateMachineState *)self _updatedLifetimeIntervalWithStartDate:v11];
  if ([(id)objc_opt_class() _isExpired:v15 currentDate:v6])
  {
    [(HKSPPersistentStateMachineState *)self stateDidExpire];
LABEL_13:
    BOOL v16 = 0;
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)HKSPPersistentStateMachineState;
  if (![(HKSPStateMachineState *)&v18 _willEnter]) {
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_lifetimeInterval, v15);
  BOOL v16 = 1;
LABEL_14:

  return v16;
}

- (void)_willExit
{
  v6.receiver = self;
  v6.super_class = (Class)HKSPPersistentStateMachineState;
  [(HKSPStateMachineState *)&v6 _willExit];
  BOOL v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 currentContext];
  char v5 = [v4 nextState];

  if (!self || !v5 || ([v5 isMemberOfClass:objc_opt_class()] & 1) == 0) {
    [(HKSPPersistentStateMachineState *)self _resetLifetimeInterval];
  }
}

- (void)_didEnter
{
  BOOL v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 currentContext];
  char v5 = [v4 previousState];

  if ([(HKSPPersistentStateMachineState *)self schedulesExpiration]
    && (NAEqualObjects() & 1) == 0)
  {
    objc_super v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 scheduleStateExpiration];
  }
  v7.receiver = self;
  v7.super_class = (Class)HKSPPersistentStateMachineState;
  [(HKSPStateMachineState *)&v7 _didEnter];
}

- (void)_didExit
{
  BOOL v3 = [(HKSPStateMachineState *)self stateMachine];
  id v4 = [v3 currentContext];
  char v5 = [v4 nextState];

  if ([(HKSPPersistentStateMachineState *)self schedulesExpiration]
    && (NAEqualObjects() & 1) == 0
    && ([v5 schedulesExpiration] & 1) == 0)
  {
    objc_super v6 = [(HKSPStateMachineState *)self stateMachine];
    [v6 unscheduleStateExpiration];
  }
  v7.receiver = self;
  v7.super_class = (Class)HKSPPersistentStateMachineState;
  [(HKSPStateMachineState *)&v7 _didExit];
}

- (BOOL)_updateExpirationDate
{
  BOOL v3 = [(NSDateInterval *)self->_lifetimeInterval endDate];
  id v4 = [(NSDateInterval *)self->_lifetimeInterval startDate];
  char v5 = [(HKSPPersistentStateMachineState *)self _updatedLifetimeIntervalWithStartDate:v4];
  lifetimeInterval = self->_lifetimeInterval;
  self->_lifetimeInterval = v5;

  objc_super v7 = [(NSDateInterval *)self->_lifetimeInterval endDate];
  if (v3 == v7)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    BOOL v8 = [(NSDateInterval *)self->_lifetimeInterval endDate];
    if (v8)
    {
      id v9 = [(NSDateInterval *)self->_lifetimeInterval endDate];
      int v10 = [v3 isEqual:v9] ^ 1;
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  return v10;
}

- (id)_updatedLifetimeIntervalWithStartDate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(NSDateInterval *)self->_lifetimeInterval startDate];
  int v6 = NAEqualObjects();

  objc_super v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [(HKSPPersistentStateMachineState *)self expirationDuration];
  if (v8 <= 0.0)
  {
    int v10 = [(HKSPPersistentStateMachineState *)self expirationDate];
    if (v10)
    {
      id v9 = v10;

      objc_super v7 = v9;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:");
    v7 = id v9 = v7;
  }

  uint64_t v11 = [(NSDateInterval *)self->_lifetimeInterval endDate];
  int v12 = NAEqualObjects();

  if (v6 & v12)
  {
    id v13 = self->_lifetimeInterval;
LABEL_13:
    __int16 v22 = v13;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "hksp_isBeforeDate:", v4))
  {
    id v13 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v4 endDate:v7];
    goto LABEL_13;
  }
  char v14 = HKSPLogForCategory(7uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_opt_class();
    id v16 = v15;
    v17 = [v7 hkspDescription];
    objc_super v18 = [v4 hkspDescription];
    int v24 = 138543874;
    v25 = v15;
    __int16 v26 = 2114;
    v27 = v17;
    __int16 v28 = 2114;
    v29 = v18;
    _os_log_impl(&dword_1A7E74000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] expiration: %{public}@ is before entry: %{public}@, treated as expired now", (uint8_t *)&v24, 0x20u);
  }
  id v19 = [(HKSPStateMachineState *)self stateMachine];
  int v20 = [v19 currentDateProvider];
  objc_super v21 = v20[2]();

  __int16 v22 = (NSDateInterval *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v21 endDate:v21];
LABEL_14:

  return v22;
}

- (void)_resetLifetimeInterval
{
  self->_lifetimeInterval = [(id)objc_opt_class() infiniteInterval];
  MEMORY[0x1F41817F8]();
}

- (NSDateInterval)lifetimeInterval
{
  return self->_lifetimeInterval;
}

- (void)setLifetimeInterval:(id)a3
{
}

- (void).cxx_destruct
{
}

@end