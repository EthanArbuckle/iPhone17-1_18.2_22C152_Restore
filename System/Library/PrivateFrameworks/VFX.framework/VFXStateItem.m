@interface VFXStateItem
+ (BOOL)supportsSecureCoding;
+ (id)addAnimation:(id)a3 to:(id)a4 keyPath:(id)a5;
+ (id)insertChildNode:(id)a3 parent:(id)a4 atIndex:(unint64_t)a5;
+ (id)removeAnimationFrom:(id)a3 keyPath:(id)a4;
+ (id)removeNode:(id)a3;
+ (id)setValue:(id)a3 to:(id)a4 keyPath:(id)a5;
- (BOOL)replaces:(id)a3;
- (NSString)keyPath;
- (VFXStateItem)initWithAction:(int64_t)a3 target:(id)a4 keyPath:(id)a5 value:(id)a6 parent:(id)a7 index:(unint64_t)a8;
- (VFXStateItem)initWithCoder:(id)a3;
- (id)_makeReverseItem;
- (id)description;
- (id)makeReverseItem;
- (id)parent;
- (id)target;
- (id)value;
- (int64_t)action;
- (unint64_t)index;
- (void)apply;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setTarget:(id)a3;
@end

@implementation VFXStateItem

- (BOOL)replaces:(id)a3
{
  if (*((void *)a3 + 1) == self->_action && (id)*((void *)a3 + 2) == self->_target) {
    return objc_msgSend_isEqualToString_(*((void **)a3 + 3), a2, (uint64_t)self->_keyPath, v3);
  }
  else {
    return 0;
  }
}

- (VFXStateItem)initWithAction:(int64_t)a3 target:(id)a4 keyPath:(id)a5 value:(id)a6 parent:(id)a7 index:(unint64_t)a8
{
  v19.receiver = self;
  v19.super_class = (Class)VFXStateItem;
  v14 = [(VFXStateItem *)&v19 init];
  v17 = v14;
  if (v14)
  {
    v14->_action = a3;
    objc_msgSend_setTarget_(v14, v15, (uint64_t)a4, v16);
    v17->_keyPath = (NSString *)a5;
    v17->_value = a6;
    v17->_parent = (VFXNode *)a7;
    v17->_index = a8;
  }
  return v17;
}

+ (id)setValue:(id)a3 to:(id)a4 keyPath:(id)a5
{
  v8 = [VFXStateItem alloc];
  v10 = objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 0, (uint64_t)a4, a5, a3, 0, 0);

  return v10;
}

+ (id)removeNode:(id)a3
{
  v4 = [VFXStateItem alloc];
  v6 = objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v4, v5, 3, (uint64_t)a3, 0, 0, 0, 0);

  return v6;
}

+ (id)insertChildNode:(id)a3 parent:(id)a4 atIndex:(unint64_t)a5
{
  v8 = [VFXStateItem alloc];
  v10 = objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 4, (uint64_t)a3, 0, 0, a4, a5);

  return v10;
}

+ (id)addAnimation:(id)a3 to:(id)a4 keyPath:(id)a5
{
  v8 = [VFXStateItem alloc];
  v10 = objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v8, v9, 1, (uint64_t)a4, a5, a3, 0, 0);

  return v10;
}

+ (id)removeAnimationFrom:(id)a3 keyPath:(id)a4
{
  v6 = [VFXStateItem alloc];
  v8 = objc_msgSend_initWithAction_target_keyPath_value_parent_index_(v6, v7, 2, (uint64_t)a3, a4, 0, 0, 0);

  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXStateItem;
  [(VFXStateItem *)&v3 dealloc];
}

- (void)setState:(id)a3
{
  if (!a3) {
    NSLog(&cfstr_Ici.isa, a2);
  }
  self->_state = (VFXState *)a3;
}

- (int64_t)action
{
  return self->_action;
}

- (id)target
{
  if (self->_target) {
    return self->_target;
  }
  v5 = objc_msgSend_stateManager(self->_state, a2, v2, v3);

  return (id)objc_msgSend_world(v5, v6, v7, v8);
}

- (void)setTarget:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = 0;
  }
  else {
    id v5 = a3;
  }
  self->_target = v5;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)value
{
  return self->_value;
}

- (id)parent
{
  return self->_parent;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)apply
{
  switch(self->_action)
  {
    case 0:
      id v5 = objc_msgSend_target(self, a2, v2, v3);
      objc_msgSend_setValue_forKeyPath_(v5, v6, (uint64_t)self->_value, (uint64_t)self->_keyPath);
      break;
    case 1:
      v17 = objc_msgSend_target(self, a2, v2, v3);
      keyPath = self->_keyPath;
      id value = self->_value;
      objc_msgSend_addAnimationPlayer_forKey_(v17, v18, (uint64_t)value, (uint64_t)keyPath);
      break;
    case 2:
      uint64_t v10 = objc_msgSend_target(self, a2, v2, v3);
      v12 = self->_keyPath;
      MEMORY[0x1F4181798](v10, sel_removeAnimationForKey_, v12, v11);
      break;
    case 3:
      v13 = objc_msgSend_target(self, a2, v2, v3);
      objc_msgSend_removeFromParentNode(v13, v14, v15, v16);
      break;
    case 4:
      uint64_t v7 = objc_msgSend_target(self, a2, v2, v3);
      id target = self->_target;
      unint64_t index = self->_index;
      MEMORY[0x1F4181798](v7, sel_insertChildNode_atIndex_, target, index);
      break;
    default:
      return;
  }
}

- (id)description
{
  switch(self->_action)
  {
    case 0:
      id v5 = NSString;
      keyPath = self->_keyPath;
      id value = self->_value;
      uint64_t v29 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v5, v8, @"set: %@ to %@ of %@\n", v9, value, keyPath, v29);
      break;
    case 1:
      uint64_t v11 = NSString;
      v13 = self->_keyPath;
      id v12 = self->_value;
      uint64_t v30 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v11, v14, @"addAnim: %@ at %@ to %@\n", v15, v12, v13, v30);
      break;
    case 2:
      uint64_t v16 = NSString;
      v17 = self->_keyPath;
      uint64_t v28 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v16, v18, @"removeAnim: at %@ from:%@\n", v19, v17, v28);
      break;
    case 3:
      v20 = NSString;
      uint64_t v26 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v20, v21, @"remove: %@\n", v22, v26);
      break;
    case 4:
      v23 = NSString;
      uint64_t v27 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)objc_msgSend_stringWithFormat_(v23, v24, @"insert: %@ at %d\n", v25, v27, self->_index);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)_makeReverseItem
{
  switch(self->_action)
  {
    case 0:
      id v5 = objc_msgSend_target(self, a2, v2, v3);
      uint64_t v8 = objc_msgSend_valueForKeyPath_(v5, v6, (uint64_t)self->_keyPath, v7);
      uint64_t v12 = objc_msgSend_target(self, v9, v10, v11);
      id result = (id)MEMORY[0x1F4181798](VFXStateItem, sel_setValue_to_keyPath_, v8, v12);
      break;
    case 1:
      uint64_t v13 = objc_msgSend_target(self, a2, v2, v3);
      keyPath = self->_keyPath;
      id result = (id)MEMORY[0x1F4181798](VFXStateItem, sel_removeAnimationFrom_keyPath_, v13, keyPath);
      break;
    case 2:
      uint64_t v15 = objc_msgSend_target(self, a2, v2, v3);
      uint64_t v18 = objc_msgSend_animationPlayerForKey_(v15, v16, (uint64_t)self->_keyPath, v17);
      uint64_t v22 = objc_msgSend_target(self, v19, v20, v21);
      id result = (id)MEMORY[0x1F4181798](VFXStateItem, sel_addAnimation_to_keyPath_, v18, v22);
      break;
    case 3:
      v23 = objc_msgSend_target(self, a2, v2, v3);
      uint64_t v27 = objc_msgSend_parentNode(v23, v24, v25, v26);
      uint64_t v31 = objc_msgSend_target(self, v28, v29, v30);
      objc_msgSend_indexOfChildNode_(v27, v32, v31, v33);
      uint64_t v37 = objc_msgSend_target(self, v34, v35, v36);
      id result = (id)MEMORY[0x1F4181798](VFXStateItem, sel_insertChildNode_parent_atIndex_, v37, v27);
      break;
    case 4:
      uint64_t v38 = objc_msgSend_target(self, a2, v2, v3);
      id result = (id)MEMORY[0x1F4181798](VFXStateItem, sel_removeNode_, v38, v39);
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)makeReverseItem
{
  ReverseItem = objc_msgSend__makeReverseItem(self, a2, v2, v3);
  objc_msgSend_setState_(ReverseItem, v6, (uint64_t)self->_state, v7);
  return ReverseItem;
}

- (VFXStateItem)initWithCoder:(id)a3
{
  v37[12] = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)VFXStateItem;
  v6 = [(VFXStateItem *)&v35 init];
  if (v6)
  {
    v6->_action = objc_msgSend_decodeIntegerForKey_(a3, v4, @"action", v5);
    v6->_unint64_t index = objc_msgSend_decodeIntegerForKey_(a3, v7, @"index", v8);
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v37[2] = objc_opt_class();
    v37[3] = objc_opt_class();
    v37[4] = objc_opt_class();
    v37[5] = objc_opt_class();
    v37[6] = objc_opt_class();
    v37[7] = objc_opt_class();
    v37[8] = objc_opt_class();
    v37[9] = objc_opt_class();
    v37[10] = objc_opt_class();
    v37[11] = objc_opt_class();
    uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v37, 12);
    uint64_t v14 = objc_msgSend_setWithArray_(v9, v12, v11, v13);
    uint64_t v16 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v15, v14, @"target");
    objc_msgSend_setTarget_(v6, v17, v16, v18);
    uint64_t v19 = objc_opt_class();
    v6->_keyPath = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, @"keyPath");
    uint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    v36[3] = objc_opt_class();
    v36[4] = objc_opt_class();
    v36[5] = objc_opt_class();
    v36[6] = objc_opt_class();
    v36[7] = objc_opt_class();
    uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v22, (uint64_t)v36, 8);
    uint64_t v26 = objc_msgSend_setWithArray_(v21, v24, v23, v25);
    uint64_t v28 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v27, v26, @"value");
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v28 = VFXValueFromData(v28, v29, v30, v31);
    }
    v6->_id value = v28;
    uint64_t v32 = objc_opt_class();
    v6->_parent = (VFXNode *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v33, v32, @"parent");
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_action, @"action");
  id target = self->_target;
  if (target) {
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)target, @"target");
  }
  keyPath = self->_keyPath;
  if (keyPath) {
    objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)keyPath, @"keyPath");
  }
  id value = self->_value;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id value = (void *)VFXDataFromValue(self->_value, (const char *)1, v10, v11);
  }
  if (value)
  {
    if (objc_msgSend_conformsToProtocol_(value, v9, (uint64_t)&unk_1F103D900, v11)) {
      objc_msgSend_encodeObject_forKey_(a3, v12, (uint64_t)value, @"value");
    }
    else {
      NSLog(&cfstr_FailedToArchiv_3.isa, value);
    }
  }
  parent = self->_parent;
  if (parent) {
    objc_msgSend_encodeObject_forKey_(a3, v9, (uint64_t)parent, @"parent");
  }
  unint64_t index = self->_index;
  if (index)
  {
    objc_msgSend_encodeInteger_forKey_(a3, v9, index, @"index");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

@end