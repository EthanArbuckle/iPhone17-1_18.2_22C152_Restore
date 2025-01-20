@interface HKSPPersistentStateMachine
- (HKSPPersistentStateMachine)initWithAllowedStates:(id)a3 delegate:(id)a4 infoProvider:(id)a5;
- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7;
- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7 currentDateProvider:(id)a8;
- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7;
- (HKSPStatePersistence)persistence;
- (NSArray)scheduledExpirationStateIdentifiers;
- (NSDate)currentStateExpirationDate;
- (NSSet)allowedStates;
- (NSString)identifier;
- (id)currentDateProvider;
- (id)persistedState;
- (void)enterState:(id)a3;
- (void)scheduleStateExpiration;
- (void)stateWithIdentifierDidExpire:(id)a3;
- (void)unscheduleStateExpiration;
@end

@implementation HKSPPersistentStateMachine

- (HKSPPersistentStateMachine)initWithAllowedStates:(id)a3 delegate:(id)a4 infoProvider:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v13 = HKSPUserDefaultsStatePersistence();
  v14 = [(HKSPPersistentStateMachine *)self initWithIdentifier:v12 allowedStates:v10 persistence:v13 delegate:v9 infoProvider:v8];

  return v14;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = HKSPCurrentDateProvider();
  v18 = [(HKSPPersistentStateMachine *)self initWithIdentifier:v16 allowedStates:v15 persistence:v14 delegate:v13 infoProvider:v12 currentDateProvider:v17];

  return v18;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  id v12 = (void *)MEMORY[0x1E4F1CAD0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  v18 = [v12 set];
  v19 = [(HKSPPersistentStateMachine *)self initWithIdentifier:v17 allowedStates:v18 persistence:v16 delegate:v15 infoProvider:v14 currentDateProvider:v13];

  return v19;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7 currentDateProvider:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKSPPersistentStateMachine;
  v18 = [(HKSPStateMachine *)&v25 initWithDelegate:a6 infoProvider:a7];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_allowedStates, a4);
    objc_storeStrong((id *)&v18->_persistence, a5);
    uint64_t v21 = [v17 copy];
    id currentDateProvider = v18->_currentDateProvider;
    v18->_id currentDateProvider = (id)v21;

    v23 = v18;
  }

  return v18;
}

- (id)persistedState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  persistence = self->_persistence;
  identifier = self->_identifier;
  allowedStates = self->_allowedStates;
  id v12 = 0;
  v6 = [(HKSPStatePersistence *)persistence loadPersistentStateForIdentifier:identifier allowedStates:allowedStates error:&v12];
  id v7 = v12;
  [v6 setStateMachine:self];
  if (v7)
  {
    id v8 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = [(HKSPStateMachine *)self stateMachineName];
      *(_DWORD *)buf = 138543618;
      id v14 = v11;
      __int16 v15 = 2114;
      id v16 = v7;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to load state with error %{public}@", buf, 0x16u);
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

- (NSArray)scheduledExpirationStateIdentifiers
{
  v2 = [(HKSPStateMachine *)self allStates];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_0);
  v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_280);

  return (NSArray *)v4;
}

uint64_t __65__HKSPPersistentStateMachine_scheduledExpirationStateIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 schedulesExpiration];
}

uint64_t __65__HKSPPersistentStateMachine_scheduledExpirationStateIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 stateIdentifier];
}

- (NSDate)currentStateExpirationDate
{
  v3 = [(HKSPStateMachine *)self currentState];
  v4 = [v3 lifetimeInterval];
  v5 = [v4 endDate];
  v6 = [MEMORY[0x1E4F1C9C8] distantFuture];
  char v7 = [v5 isEqualToDate:v6];

  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    id v9 = [(HKSPStateMachine *)self currentState];
    id v10 = [v9 lifetimeInterval];
    id v8 = [v10 endDate];
  }
  return (NSDate *)v8;
}

- (void)enterState:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HKSPStateMachine *)self currentState];
  v17.receiver = self;
  v17.super_class = (Class)HKSPPersistentStateMachine;
  [(HKSPStateMachine *)&v17 enterState:v4];
  if ((NAEqualObjects() & 1) == 0)
  {
    if ((HKSPIsUnitTesting() & 1) == 0)
    {
      v6 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        char v7 = [(HKSPStateMachine *)self stateMachineName];
        id v8 = [v4 stateName];
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v7;
        __int16 v20 = 2114;
        uint64_t v21 = v8;
        _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persisting state %{public}@", buf, 0x16u);
      }
    }
    persistence = self->_persistence;
    identifier = self->_identifier;
    id v16 = 0;
    char v11 = [(HKSPStatePersistence *)persistence savePersistentState:v4 identifier:identifier error:&v16];
    id v12 = v16;
    if (v11)
    {
      if (HKSPIsUnitTesting())
      {
LABEL_13:

        goto LABEL_14;
      }
      id v13 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      id v14 = [(HKSPStateMachine *)self stateMachineName];
      __int16 v15 = [v4 stateName];
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully persisted state %{public}@", buf, 0x16u);
    }
    else
    {
      id v13 = HKSPLogForCategory([(HKSPStateMachine *)self loggingCategory]);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      id v14 = [(HKSPStateMachine *)self stateMachineName];
      __int16 v15 = [v4 stateName];
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_error_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to persist state %{public}@ with error %{public}@", buf, 0x20u);
    }

    goto LABEL_12;
  }
LABEL_14:
}

- (void)stateWithIdentifierDidExpire:(id)a3
{
  id v4 = a3;
  id v5 = [(HKSPStateMachine *)self currentState];
  [v5 stateWithIdentifierDidExpire:v4];
}

- (void)scheduleStateExpiration
{
}

uint64_t __53__HKSPPersistentStateMachine_scheduleStateExpiration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 scheduleStateExpiration];
}

- (void)unscheduleStateExpiration
{
}

uint64_t __55__HKSPPersistentStateMachine_unscheduleStateExpiration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 unscheduleStateExpiration];
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allowedStates
{
  return self->_allowedStates;
}

- (HKSPStatePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
}

@end