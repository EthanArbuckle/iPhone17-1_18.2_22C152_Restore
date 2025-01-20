@interface VFXStateMachine
+ (BOOL)supportsSecureCoding;
- (NSArray)transitions;
- (VFXStateMachine)initWithCoder:(id)a3;
- (VFXStateMachine)initWithStateManager:(id)a3;
- (VFXStateManager)manager;
- (id)transitionsFrom:(id)a3;
- (void)addTransition:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeTransitionFrom:(id)a3 to:(id)a4;
- (void)setManager:(id)a3;
- (void)setTransitions:(id)a3;
- (void)switchToState:(id)a3;
@end

@implementation VFXStateMachine

- (VFXStateMachine)initWithStateManager:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXStateMachine;
  v4 = [(VFXStateMachine *)&v7 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_manager, a3);
    v5->_transitions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXStateMachine;
  [(VFXStateMachine *)&v3 dealloc];
}

- (void)switchToState:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  if (WeakRetained)
  {
    objc_super v7 = WeakRetained;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    transitions = self->_transitions;
    uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v6, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v9)
    {
      uint64_t v13 = v9;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(transitions);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend_sourceState(v16, v10, v11, v12);
          if (v17 == objc_msgSend_activeState(v7, v18, v19, v20)
            && (id)objc_msgSend_targetState(v16, v10, v11, v12) == a3)
          {
            objc_msgSend_setActiveState_(v7, v10, (uint64_t)a3, v12);
            goto LABEL_13;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v10, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)addTransition:(id)a3
{
  uint64_t v6 = objc_msgSend_sourceState(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_targetState(a3, v7, v8, v9);
  objc_msgSend_removeTransitionFrom_to_(self, v11, v6, v10);
  transitions = self->_transitions;

  objc_msgSend_addObject_(transitions, v12, (uint64_t)a3, v13);
}

- (void)removeTransitionFrom:(id)a3 to:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  transitions = self->_transitions;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, a2, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(transitions);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ((id)objc_msgSend_sourceState(v15, v9, v10, v11) == a3
          && (id)objc_msgSend_targetState(v15, v9, v10, v11) == a4)
        {
          objc_msgSend_removeObject_(self->_transitions, v9, (uint64_t)v15, v11);
          return;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v9, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }
}

- (id)transitionsFrom:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  transitions = self->_transitions;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v7, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(transitions);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((id)objc_msgSend_sourceState(v15, v9, v10, v11) == a3) {
          objc_msgSend_addObject_(v5, v9, (uint64_t)v15, v11);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(transitions, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v12);
  }
  return v5;
}

- (VFXStateMachine)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)VFXStateMachine;
  v4 = [(VFXStateMachine *)&v12 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    objc_super v7 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, @"transitions");
    v4->_transitions = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v8, v9, v10);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VFXStateManager)manager
{
  return (VFXStateManager *)objc_loadWeak((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
}

- (NSArray)transitions
{
  return &self->_transitions->super;
}

- (void)setTransitions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end