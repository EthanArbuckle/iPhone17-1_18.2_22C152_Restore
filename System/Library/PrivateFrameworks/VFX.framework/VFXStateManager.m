@interface VFXStateManager
+ (BOOL)supportsSecureCoding;
- (NSArray)states;
- (VFXState)activeState;
- (VFXStateManager)init;
- (VFXStateManager)initWithCoder:(id)a3;
- (id)stateWithName:(id)a3;
- (id)world;
- (void)addReverseItem:(id)a3;
- (void)addState:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeReverseItem:(id)a3;
- (void)removeState:(id)a3;
- (void)setActiveState:(id)a3;
- (void)setStates:(id)a3;
- (void)setWorld:(id)a3;
@end

@implementation VFXStateManager

- (VFXStateManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)VFXStateManager;
  v2 = [(VFXStateManager *)&v4 init];
  if (v2) {
    v2->_states = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXStateManager;
  [(VFXStateManager *)&v3 dealloc];
}

- (void)setWorld:(id)a3
{
  self->_world = (VFXWorld *)a3;
}

- (id)world
{
  return self->_world;
}

- (NSArray)states
{
  return &self->_states->super;
}

- (void)addState:(id)a3
{
  objc_msgSend_setStateManager_(a3, a2, (uint64_t)self, v3);
  states = self->_states;

  objc_msgSend_addObject_(states, v6, (uint64_t)a3, v7);
}

- (void)removeState:(id)a3
{
  objc_msgSend_removeObject_(self->_states, a2, (uint64_t)a3, v3);
}

- (id)stateWithName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  states = self->_states;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(states, a2, (uint64_t)&v17, (uint64_t)v21, 16);
  if (!v5) {
    return 0;
  }
  uint64_t v9 = v5;
  uint64_t v10 = *(void *)v18;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v18 != v10) {
      objc_enumerationMutation(states);
    }
    v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
    v13 = objc_msgSend_name(v12, v6, v7, v8);
    if (objc_msgSend_isEqualToString_(v13, v14, (uint64_t)a3, v15)) {
      return v12;
    }
    if (v9 == ++v11)
    {
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(states, v6, (uint64_t)&v17, (uint64_t)v21, 16);
      if (v9) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addReverseItem:(id)a3
{
  if (!objc_msgSend_itemMatching_(self->_reverseActiveState, a2, (uint64_t)a3, v3))
  {
    reverseActiveState = self->_reverseActiveState;
    objc_msgSend_addStateItem_(reverseActiveState, v6, (uint64_t)a3, v7);
  }
}

- (void)removeReverseItem:(id)a3
{
}

- (void)setActiveState:(id)a3
{
  activeState = self->_activeState;
  if (activeState != a3)
  {
    reverseActiveState = self->_reverseActiveState;
    if (reverseActiveState)
    {
      objc_msgSend_apply(reverseActiveState, a2, (uint64_t)a3, v3);

      self->_reverseActiveState = 0;
      activeState = self->_activeState;
    }

    self->_activeState = (VFXState *)a3;
    self->_reverseActiveState = (VFXState *)(id)objc_msgSend_makeReverseStates(a3, v8, v9, v10);
    v14 = self->_activeState;
    objc_msgSend_apply(v14, v11, v12, v13);
  }
}

- (VFXState)activeState
{
  return self->_activeState;
}

- (VFXStateManager)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)VFXStateManager;
  objc_super v4 = [(VFXStateManager *)&v24 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v6, v5, @"states");
    uint64_t v11 = (NSMutableArray *)objc_msgSend_mutableCopy(v7, v8, v9, v10);
    v4->_states = v11;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v20, (uint64_t)v25, 16);
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend_setStateManager_(*(void **)(*((void *)&v20 + 1) + 8 * v18++), v14, (uint64_t)v4, v15);
        }
        while (v16 != v18);
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v20, (uint64_t)v25, 16);
      }
      while (v16);
    }
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

- (void)setStates:(id)a3
{
}

@end