@interface SBAnalyticsStateMachineEdge
+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponEvent:(unint64_t)a5;
+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5;
+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5 andDo:(id)a6;
+ (id)edgeFromState:(unint64_t)a3 transition:(id)a4;
- (NSString)debugDescription;
- (SBAnalyticsStateMachineEdge)initWithFromState:(unint64_t)a3 transition:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)fromState;
- (unint64_t)handleEvent:(unint64_t)a3 withContext:(id)a4;
@end

@implementation SBAnalyticsStateMachineEdge

- (unint64_t)fromState
{
  return self->_fromState;
}

- (unint64_t)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  uint64_t v5 = (*((uint64_t (**)(void))self->_transition + 2))();
  v6 = SBLogAnalytics();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBAnalyticsStateMachineEdge handleEvent:withContext:]((uint64_t)self, v5, v6);
  }

  return v5;
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponEvent:(unint64_t)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SBAnalyticsStateMachineEdge_edgeFromState_toState_uponEvent___block_invoke;
  v7[3] = &__block_descriptor_40_e55_Q24__0Q8___SBFAnalyticsBackendEventContextProviding__16l;
  v7[4] = a4;
  uint64_t v5 = objc_msgSend(a1, "edgeFromState:transition:", a3, v7, a5);
  return v5;
}

uint64_t __63__SBAnalyticsStateMachineEdge_edgeFromState_toState_uponEvent___block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

+ (id)edgeFromState:(unint64_t)a3 transition:(id)a4
{
  id v5 = a4;
  v6 = [[SBAnalyticsStateMachineEdge alloc] initWithFromState:a3 transition:v5];

  return v6;
}

- (SBAnalyticsStateMachineEdge)initWithFromState:(unint64_t)a3 transition:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAnalyticsStateMachineEdge;
  v7 = [(SBAnalyticsStateMachineEdge *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_fromState = a3;
    uint64_t v9 = [v6 copy];
    id transition = v8->_transition;
    v8->_id transition = (id)v9;
  }
  return v8;
}

- (NSString)debugDescription
{
  return (NSString *)[(SBAnalyticsStateMachineEdge *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBAnalyticsStateMachineEdge *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__SBAnalyticsStateMachineEdge_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  id v7 = v6;
  id v11 = v7;
  objc_super v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __69__SBAnalyticsStateMachineEdge_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 8) withName:@"fromState"];
}

- (id)succinctDescription
{
  v2 = [(SBAnalyticsStateMachineEdge *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendUnsignedInteger:self->_fromState withName:@"fromState"];
  return v3;
}

- (void).cxx_destruct
{
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5
{
  return (id)[a1 edgeFromState:a3 toState:a4 uponGestureState:a5 andDo:0];
}

+ (id)edgeFromState:(unint64_t)a3 toState:(unint64_t)a4 uponGestureState:(int64_t)a5 andDo:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __102__SBAnalyticsStateMachineEdge_SBSystemGestureAnalytics__edgeFromState_toState_uponGestureState_andDo___block_invoke;
  v14[3] = &unk_1E6B095F0;
  id v15 = v10;
  unint64_t v16 = a3;
  int64_t v17 = a5;
  unint64_t v18 = a4;
  id v11 = v10;
  objc_super v12 = [a1 edgeFromState:a3 transition:v14];

  return v12;
}

uint64_t __102__SBAnalyticsStateMachineEdge_SBSystemGestureAnalytics__edgeFromState_toState_uponGestureState_andDo___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a1[5];
  if (a2 == 12)
  {
    id v5 = [a3 eventPayload];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA76A0]];
    uint64_t v7 = [v6 unsignedIntegerValue];

    if (v7 == a1[6])
    {
      uint64_t v8 = a1[4];
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
      uint64_t v3 = a1[7];
    }
  }
  return v3;
}

- (void)handleEvent:(os_log_t)log withContext:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "edge transitioned from: %lu; to: %lu",
    (uint8_t *)&v4,
    0x16u);
}

@end