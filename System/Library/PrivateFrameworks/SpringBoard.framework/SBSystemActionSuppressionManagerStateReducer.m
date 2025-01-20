@interface SBSystemActionSuppressionManagerStateReducer
- (id)_buildSuppressionMetrics;
- (id)_reduceState;
- (id)initWithReduceBlock:(void *)a3 viewObstructionEligibility:(void *)a4 viewObstructionState:(void *)a5 selectedAction:(void *)a6 pocketState:(void *)a7 displayState:(char)a8 isAlwaysOnDisplayEnabled:;
- (uint64_t)setSelectedAction:(uint64_t)a1;
- (uint64_t)setViewObstructionState:(uint64_t)a1;
- (void)setDisplayState:(void *)a1;
- (void)setIsAlwaysOnDisplayEnabled:(uint64_t)a1;
- (void)setPocketState:(void *)a1;
- (void)setViewObstructionEligibility:(void *)a1;
@end

@implementation SBSystemActionSuppressionManagerStateReducer

- (id)initWithReduceBlock:(void *)a3 viewObstructionEligibility:(void *)a4 viewObstructionState:(void *)a5 selectedAction:(void *)a6 pocketState:(void *)a7 displayState:(char)a8 isAlwaysOnDisplayEnabled:
{
  id v15 = a2;
  id v16 = a4;
  id v17 = a5;
  v18 = v17;
  if (!a1) {
    goto LABEL_7;
  }
  if (!v15)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"reduceBlock != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:]();
    }
LABEL_16:
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B8CF24);
  }
  if (!v16)
  {
    v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"viewObstructionState != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:]();
    }
    [v25 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8B8CF8CLL);
  }
  if (!v17)
  {
    v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selectedAction != ((void *)0)"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SBSystemActionSuppressionManagerStateReducer initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:]();
    }
    goto LABEL_16;
  }
  v26.receiver = a1;
  v26.super_class = (Class)SBSystemActionSuppressionManagerStateReducer;
  a1 = (id *)objc_msgSendSuper2(&v26, sel_init);
  if (a1)
  {
    uint64_t v19 = MEMORY[0x1D948C7A0](v15);
    id v20 = a1[2];
    a1[2] = (id)v19;

    a1[1] = a3;
    objc_storeStrong(a1 + 4, a4);
    objc_storeStrong(a1 + 5, a5);
    a1[6] = a6;
    a1[7] = a7;
    *((unsigned char *)a1 + 24) = a8;
    v21 = (void (**)(id, void *))a1[2];
    v22 = [a1 _reduceState];
    v21[2](v21, v22);
  }
LABEL_7:

  return a1;
}

- (void)setViewObstructionEligibility:(void *)a1
{
  if (a1 && a1[1] != a2)
  {
    a1[1] = a2;
    uint64_t v2 = a1[2];
    id v3 = [a1 _reduceState];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (uint64_t)setViewObstructionState:(uint64_t)a1
{
  id v4 = a2;
  if (!a1)
  {
LABEL_5:
    return MEMORY[0x1F4181820]();
  }
  if (v4)
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 32), a2);
      uint64_t v5 = *(void *)(a1 + 16);
      v6 = [(id)a1 _reduceState];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    goto LABEL_5;
  }
  v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"viewObstructionState != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBSystemActionSuppressionManagerStateReducer setViewObstructionState:]();
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
  return MEMORY[0x1F4181820]();
}

- (uint64_t)setSelectedAction:(uint64_t)a1
{
  id v4 = a2;
  if (!a1)
  {
LABEL_5:
    return MEMORY[0x1F4181820]();
  }
  if (v4)
  {
    if ((BSEqualObjects() & 1) == 0)
    {
      objc_storeStrong((id *)(a1 + 40), a2);
      uint64_t v5 = *(void *)(a1 + 16);
      v6 = [(id)a1 _reduceState];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
    goto LABEL_5;
  }
  v7 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"selectedAction != ((void *)0)"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SBSystemActionSuppressionManagerStateReducer setSelectedAction:]();
  }
  [v7 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
  return MEMORY[0x1F4181820]();
}

- (void)setPocketState:(void *)a1
{
  if (a1 && a1[6] != a2)
  {
    a1[6] = a2;
    uint64_t v2 = a1[2];
    id v3 = [a1 _reduceState];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)setDisplayState:(void *)a1
{
  if (a1 && a1[7] != a2)
  {
    a1[7] = a2;
    uint64_t v2 = a1[2];
    id v3 = [a1 _reduceState];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (void)setIsAlwaysOnDisplayEnabled:(uint64_t)a1
{
  if (a1 && *(unsigned __int8 *)(a1 + 24) != a2)
  {
    *(unsigned char *)(a1 + 24) = a2;
    uint64_t v2 = *(void *)(a1 + 16);
    id v3 = [(id)a1 _reduceState];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (id)_reduceState
{
  id v3 = [(SBSystemAction *)self->_selectedAction configuredAction];
  id v4 = [v3 sectionIdentifier];
  int v5 = [v4 isEqualToString:@"Nothing"];

  if ([MEMORY[0x1E4F22298] isAvailable])
  {
    int64_t viewObstructionEligibility = self->_viewObstructionEligibility;
    char v7 = viewObstructionEligibility == 2 ? 1 : v5;
    if ((v7 & 1) == 0
      && (viewObstructionEligibility != 1 || self->_isAlwaysOnDisplayEnabled)
      && (self->_isAlwaysOnDisplayEnabled
       || ![(SBSystemAction *)self->_selectedAction shouldBePerformedWhenSuppressed])
      && !BLSBacklightStateIsActive())
    {
      LOBYTE(v8) = 0;
      char v9 = 1;
      if (v5) {
        goto LABEL_19;
      }
      goto LABEL_24;
    }
  }
  if ((([MEMORY[0x1E4F22268] isPocketStateAvailable] ^ 1 | v5) & 1) != 0
    || !self->_viewObstructionEligibility)
  {
    int v8 = 0;
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  int v8 = ![(SBSystemAction *)self->_selectedAction shouldBePerformedWhenSuppressed];
  if (v5) {
    goto LABEL_18;
  }
LABEL_14:
  if (self->_isAlwaysOnDisplayEnabled
    || ![(SBSystemAction *)self->_selectedAction shouldBePerformedWhenSuppressed])
  {
    char v9 = 0;
    if (v8)
    {
      LOBYTE(v8) = 1;
      if ((self->_pocketState | 2) == 3)
      {
        uint64_t v11 = 1;
        goto LABEL_32;
      }
    }
LABEL_24:
    viewObstructionState = self->_viewObstructionState;
    if (viewObstructionState)
    {
      v13 = viewObstructionState->_event;
      if (v13)
      {
        v14 = v13;
        id v15 = self->_viewObstructionState;
        if (v15) {
          event = v15->_event;
        }
        else {
          event = 0;
        }
        uint64_t v17 = [(CMSuppressionEvent *)event type];

        BOOL v10 = v17 == 1;
        goto LABEL_29;
      }
    }
LABEL_19:
    uint64_t v11 = 2;
    goto LABEL_32;
  }
  char v9 = 0;
  BOOL v10 = self->_displayState == 0;
LABEL_29:
  if (v10) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
LABEL_32:
  v18 = [SBSystemActionSuppressionStatus alloc];
  uint64_t v19 = [(SBSystemActionSuppressionManagerStateReducer *)self _buildSuppressionMetrics];
  id v20 = -[SBSystemActionSuppressionStatus initWithState:metrics:]((id *)&v18->super.isa, (void *)v11, v19);

  v21 = -[SBSystemActionSuppressionManagerState initWithSuppressionStatus:isEligibleForViewObstructionEvents:canUsePocketStateForSuppression:]([SBSystemActionSuppressionManagerState alloc], v20, v9, v8);
  return v21;
}

- (id)_buildSuppressionMetrics
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = NSStringFromSBSystemActionSuppressionViewObstructionEligibility(self->_viewObstructionEligibility);
  [v3 setObject:v4 forKeyedSubscript:@"vo_eligibility"];

  unint64_t pocketState = self->_pocketState;
  if (pocketState > 3) {
    v6 = @"Unknown";
  }
  else {
    v6 = off_1E6B06710[pocketState];
  }
  [v3 setObject:v6 forKeyedSubscript:@"pocket_state"];
  char v7 = NSStringFromBLSBacklightState();
  [v3 setObject:v7 forKeyedSubscript:@"display_state"];

  int v8 = [NSNumber numberWithBool:self->_isAlwaysOnDisplayEnabled];
  [v3 setObject:v8 forKeyedSubscript:@"always_on_display"];

  viewObstructionState = self->_viewObstructionState;
  if (viewObstructionState) {
    viewObstructionState = (SBSystemActionViewObstructionState *)viewObstructionState->_event;
  }
  if (viewObstructionState)
  {
    BOOL v10 = self->_viewObstructionState;
    if (v10) {
      event = v10->_event;
    }
    else {
      event = 0;
    }
    unint64_t v12 = [(CMSuppressionEvent *)event type];
    if (v12 > 3) {
      v13 = @"Suppress";
    }
    else {
      v13 = off_1E6B06730[v12];
    }
    [v3 setObject:v13 forKeyedSubscript:@"event_type"];
    v14 = NSNumber;
    id v15 = self->_viewObstructionState;
    if (v15) {
      id v16 = v15->_event;
    }
    else {
      id v16 = 0;
    }
    [(CMSuppressionEvent *)v16 timestamp];
    double v18 = v17;
    uint64_t v19 = [MEMORY[0x1E4F28F80] processInfo];
    [v19 systemUptime];
    double v21 = v20;

    v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v18 - v21];
    [v22 timeIntervalSinceReferenceDate];
    double v24 = v23;

    v25 = [v14 numberWithDouble:v24];
    [v3 setObject:v25 forKeyedSubscript:@"event_timestamp"];
  }
  objc_super v26 = self->_viewObstructionState;
  if (v26) {
    objc_super v26 = (SBSystemActionViewObstructionState *)v26->_error;
  }
  if (v26)
  {
    v27 = NSString;
    v28 = self->_viewObstructionState;
    if (v28) {
      v28 = (SBSystemActionViewObstructionState *)v28->_error;
    }
    v29 = v28;
    v30 = [(SBSystemActionViewObstructionState *)v29 domain];
    v31 = self->_viewObstructionState;
    if (v31) {
      error = v31->_error;
    }
    else {
      error = 0;
    }
    v33 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](error, "code"));
    v34 = [v27 stringWithFormat:@"%@: %@", v30, v33];
    [v3 setObject:v34 forKeyedSubscript:@"error"];
  }
  v35 = (void *)[v3 copy];

  return v35;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_viewObstructionState, 0);
  objc_storeStrong(&self->_reduceBlock, 0);
}

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithReduceBlock:viewObstructionEligibility:viewObstructionState:selectedAction:pocketState:displayState:isAlwaysOnDisplayEnabled:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setViewObstructionState:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)setSelectedAction:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_6(&dword_1D85BA000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end