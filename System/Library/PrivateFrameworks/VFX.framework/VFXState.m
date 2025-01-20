@interface VFXState
+ (BOOL)supportsSecureCoding;
- (NSArray)stateItems;
- (NSString)identifier;
- (NSString)name;
- (VFXState)baseState;
- (VFXState)init;
- (VFXState)initWithCoder:(id)a3;
- (id)description;
- (id)itemMatching:(id)a3;
- (id)makeReverseStates;
- (id)stateManager;
- (void)addStateItem:(id)a3;
- (void)apply;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeStateItem:(id)a3;
- (void)setBaseState:(id)a3;
- (void)setName:(id)a3;
- (void)setStateManager:(id)a3;
@end

@implementation VFXState

- (VFXState)init
{
  v11.receiver = self;
  v11.super_class = (Class)VFXState;
  v2 = [(VFXState *)&v11 init];
  if (v2)
  {
    v2->_stateItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v3, v4, v5);
    v2->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v6, v7, v8, v9);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXState;
  [(VFXState *)&v3 dealloc];
}

- (void)setStateManager:(id)a3
{
  self->_stateManager = (VFXStateManager *)a3;
}

- (id)stateManager
{
  return self->_stateManager;
}

- (void)setBaseState:(id)a3
{
  baseState = self->_baseState;
  if (baseState != a3)
  {

    self->_baseState = (VFXState *)a3;
  }
}

- (VFXState)baseState
{
  return self->_baseState;
}

- (id)itemMatching:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  stateItems = self->_stateItems;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, a2, (uint64_t)&v13, (uint64_t)v17, 16);
  if (!v5) {
    return 0;
  }
  uint64_t v8 = v5;
  uint64_t v9 = *(void *)v14;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v14 != v9) {
      objc_enumerationMutation(stateItems);
    }
    objc_super v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
    if (objc_msgSend_replaces_(a3, v6, (uint64_t)v11, v7)) {
      return v11;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)addStateItem:(id)a3
{
  objc_msgSend_setState_(a3, a2, (uint64_t)self, v3);
  stateItems = self->_stateItems;

  objc_msgSend_addObject_(stateItems, v6, (uint64_t)a3, v7);
}

- (void)removeStateItem:(id)a3
{
  objc_msgSend_removeObject_(self->_stateItems, a2, (uint64_t)a3, v3);
}

- (void)apply
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_baseState(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_baseState(self, v5, v6, v7);
    objc_msgSend_apply(v8, v9, v10, v11);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  stateItems = self->_stateItems;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(stateItems);
        }
        objc_msgSend_apply(*(void **)(*((void *)&v20 + 1) + 8 * v19++), v14, v15, v16);
      }
      while (v17 != v19);
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v14, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v17);
  }
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)stateItems
{
  return &self->_stateItems->super;
}

- (id)description
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"State %@: {\n", v2, self->_name);
  if (objc_msgSend_baseState(self, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_baseState(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_description(v11, v12, v13, v14);
    uint64_t v4 = objc_msgSend_stringByAppendingString_(v4, v16, v15, v17);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  stateItems = self->_stateItems;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v8, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v31;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(stateItems);
        }
        uint64_t v26 = objc_msgSend_description(*(void **)(*((void *)&v30 + 1) + 8 * v25), v20, v21, v22);
        uint64_t v4 = objc_msgSend_stringByAppendingString_(v4, v27, v26, v28);
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v20, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v23);
  }
  return (id)objc_msgSend_stringByAppendingString_(v4, v20, @"}\n", v22);
}

- (id)makeReverseStates
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(VFXState);
  objc_msgSend_setStateManager_(v3, v4, (uint64_t)self->_stateManager, v5);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v9 = objc_msgSend_reverseObjectEnumerator(self->_stateItems, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t ReverseItem = objc_msgSend_makeReverseItem(*(void **)(*((void *)&v34 + 1) + 8 * v17), v12, v13, v14);
        objc_msgSend_addStateItem_(v3, v19, ReverseItem, v20);
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v15);
  }
  if (objc_msgSend_baseState(self, v12, v13, v14))
  {
    uint64_t v24 = objc_msgSend_baseState(self, v21, v22, v23);
    ReverseStates = objc_msgSend_makeReverseStates(v24, v25, v26, v27);
    objc_msgSend_setStateManager_(ReverseStates, v29, (uint64_t)self->_stateManager, v30);
    objc_msgSend_setBaseState_(ReverseStates, v31, (uint64_t)v3, v32);

    uint64_t v3 = ReverseStates;
  }
  return v3;
}

- (VFXState)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v37.receiver = self;
  v37.super_class = (Class)VFXState;
  uint64_t v4 = [(VFXState *)&v37 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    v4->_baseState = (VFXState *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"baseState");
    uint64_t v7 = objc_opt_class();
    v4->_name = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v8, v7, @"name");
    uint64_t v9 = objc_opt_class();
    uint64_t v11 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v10, v9, @"stateItems");
    v4->_stateItems = (NSMutableArray *)objc_msgSend_mutableCopy(v11, v12, v13, v14);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"identifier");
    v4->_identifier = v17;
    if (!v17)
    {
      uint64_t v21 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v18, v19, v20);
      v4->_identifier = (NSString *)(id)objc_msgSend_UUIDString(v21, v22, v23, v24);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    stateItems = v4->_stateItems;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v18, (uint64_t)&v33, (uint64_t)v38, 16);
    if (v26)
    {
      uint64_t v29 = v26;
      uint64_t v30 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v34 != v30) {
            objc_enumerationMutation(stateItems);
          }
          objc_msgSend_setState_(*(void **)(*((void *)&v33 + 1) + 8 * i), v27, (uint64_t)v4, v28);
        }
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(stateItems, v27, (uint64_t)&v33, (uint64_t)v38, 16);
      }
      while (v29);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_stateItems, @"stateItems");
  name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)name, @"name");
  }
  baseState = self->_baseState;
  if (baseState) {
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)baseState, @"baseState");
  }
  identifier = self->_identifier;

  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)identifier, @"identifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end