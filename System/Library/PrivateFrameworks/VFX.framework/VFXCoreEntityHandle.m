@interface VFXCoreEntityHandle
+ (BOOL)supportsSecureCoding;
+ (VFXCoreEntityHandle)handleWithEntityObject:(id)a3;
- (BOOL)setBindingValue:(id)a3 forKey:(id)a4;
- (NSArray)bindings;
- (NSString)tag;
- (VFXCoreEntityHandle)initWithCoder:(id)a3;
- (VFXCoreEntityHandle)initWithEntityObject:(id)a3;
- (VFXCoreEntityHandle)initWithTag:(id)a3;
- (VFXEntityObject)entityObject;
- (__CFXCoreEntityHandle)handle;
- (__CFXWorld)worldRef;
- (id)bindingPresentationValueForKey:(id)a3;
- (id)bindingValueForKey:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)valueForKeyPath:(id)a3;
- (id)world;
- (void)__CFObject;
- (void)_syncObjCModel;
- (void)dealloc;
- (void)didSetEntityObject;
- (void)encodeWithCoder:(id)a3;
- (void)resolveTag:(id)a3 remap:(id)a4;
- (void)setTag:(id)a3;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)wasAddedToWorld:(id)a3;
- (void)willBeRemovedFromWorld:(id)a3;
@end

@implementation VFXCoreEntityHandle

- (void)didSetEntityObject
{
}

- (VFXCoreEntityHandle)initWithEntityObject:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VFXCoreEntityHandle;
  v4 = [(VFXCoreEntityHandle *)&v21 init];
  if (v4)
  {
    v4->_entityObject = (VFXEntityObject *)a3;
    v8 = (NSString *)(id)objc_msgSend_tag(a3, v5, v6, v7);
    v4->_tag = v8;
    uint64_t v9 = sub_1B6535748(v8);
    v4->_handle = (__CFXCoreEntityHandle *)v9;
    if (v9) {
      sub_1B6583684(v9, v4, v11, v12, v13, v14, v15, v16);
    }
    objc_msgSend__syncObjCModel(v4, v10, v11, v12);
    objc_msgSend_didSetEntityObject(v4, v17, v18, v19);
  }
  return v4;
}

+ (VFXCoreEntityHandle)handleWithEntityObject:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);

  return (VFXCoreEntityHandle *)v7;
}

- (VFXCoreEntityHandle)initWithTag:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VFXCoreEntityHandle;
  id v4 = [(VFXCoreEntityHandle *)&v14 init];
  if (v4)
  {
    v5 = (NSString *)a3;
    v4->_tag = v5;
    uint64_t v6 = sub_1B6535748(v5);
    v4->_handle = (__CFXCoreEntityHandle *)v6;
    if (v6) {
      sub_1B6583684(v6, v4, v7, v8, v9, v10, v11, v12);
    }
  }
  return v4;
}

- (void)dealloc
{
  handle = self->_handle;
  if (handle)
  {
    sub_1B6583684((uint64_t)handle, 0, v2, v3, v4, v5, v6, v7);
    uint64_t v10 = self->_handle;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B65FA9EC;
    v13[3] = &unk_1E6140A18;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }

  v12.receiver = self;
  v12.super_class = (Class)VFXCoreEntityHandle;
  [(VFXCoreEntityHandle *)&v12 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p>", v7, v5, self);
}

- (void)_syncObjCModel
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];

  self->_bindings = 0;
  uint64_t v6 = objc_msgSend_bindings(self->_entityObject, v3, v4, v5);
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = objc_msgSend_count(v7, v9, v10, v11);
    self->_bindings = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v8, v13, v12, v14);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v7);
          }
          v23 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          bindings = self->_bindings;
          uint64_t v25 = objc_msgSend_bindingName(v23, v17, v18, v19);
          objc_msgSend_setValue_forKey_(bindings, v26, (uint64_t)v23, v25);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v17, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v20);
    }
  }
}

- (void)setTag:(id)a3
{
  if ((objc_msgSend_isEqual_(a3, a2, (uint64_t)self->_tag, v3) & 1) == 0)
  {

    self->_tag = (NSString *)objc_msgSend_copy(a3, v6, v7, v8);
    uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B65FAC44;
    v14[3] = &unk_1E61411E0;
    v14[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (NSString)tag
{
  return self->_tag;
}

- (void)resolveTag:(id)a3 remap:(id)a4
{
  if (!self->_entityObject)
  {
    uint64_t v7 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)self->_tag, (uint64_t)a4);
    uint64_t v10 = self->_tag;
    if (v7)
    {
      objc_msgSend_setTag_(self, v8, v7, v9);
      uint64_t v13 = (VFXEntityObject *)(id)objc_msgSend_fetchEntityObjectWithTag_(a3, v11, (uint64_t)self->_tag, v12);
      self->_entityObject = v13;
      if (!v13) {
        sub_1B63F2F54(16, @"Error: failed to find tag %@", v14, v15, v16, v17, v18, v19, (uint64_t)self->_tag);
      }
    }
    else
    {
      uint64_t v20 = (VFXEntityObject *)(id)objc_msgSend_fetchEntityObjectWithTag_(a3, v8, (uint64_t)self->_tag, v9);
      self->_entityObject = v20;
      if (v20)
      {
        long long v28 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v21, v22, v23);
        uint64_t v32 = objc_msgSend_UUIDString(v28, v29, v30, v31);
        objc_msgSend_setTag_(self, v33, v32, v34);
        objc_msgSend_setTag_(self->_entityObject, v35, (uint64_t)self->_tag, v36);
      }
      else
      {
        sub_1B63F2F54(16, @"Error: failed to resolve entity with tag %@", v22, v23, v24, v25, v26, v27, (uint64_t)self->_tag);
      }
      objc_msgSend_setObject_forKey_(a4, v37, (uint64_t)self->_tag, (uint64_t)v10);
    }

    objc_msgSend__syncObjCModel(self, v38, v39, v40);
    objc_msgSend_didSetEntityObject(self, v41, v42, v43);
  }
}

- (__CFXCoreEntityHandle)handle
{
  return self->_handle;
}

- (VFXEntityObject)entityObject
{
  return self->_entityObject;
}

- (void)__CFObject
{
  return (void *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1F4181798])(self, sel_handle);
}

- (__CFXWorld)worldRef
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (__CFXWorld *)sub_1B63F4F54(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  id result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return sub_1B6583674((id *)result);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (!self->_entityObject) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"_entityObject");
  }
  uint64_t v9 = [VFXCoreEntityHandle alloc];
  id v14 = (id)objc_msgSend_copy(self->_entityObject, v10, v11, v12);

  return (id)objc_msgSend_initWithEntityObject_(v9, v13, (uint64_t)v14, v15);
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (NSArray)bindings
{
  objc_msgSend__syncObjCModel(self, a2, v2, v3);
  id result = (NSArray *)objc_msgSend_allValues(self->_bindings, v5, v6, v7);
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (id)bindingValueForKey:(id)a3
{
  uint64_t v4 = objc_msgSend_valueForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!v4) {
    return 0;
  }
  uint64_t v8 = v4;
  uint64_t v9 = objc_msgSend_type(v4, v5, v6, v7);
  uint64_t v17 = sub_1B65358B8(v9, v10, v11, v12, v13, v14, v15, v16);
  if (!v17) {
    return 0;
  }
  uint64_t v21 = (const char *)v17;
  uint64_t v22 = objc_msgSend_rawValue(v8, v18, v19, v20);

  return VFXValueFromDataAndType(v22, v21, v23, v24);
}

- (id)bindingPresentationValueForKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_presentationBindings(self->_entityObject, a2, (uint64_t)a3, v3);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v31, (uint64_t)v35, 16);
  if (result)
  {
    id v11 = result;
    uint64_t v12 = *(void *)v32;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v5);
        }
        uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v13);
        uint64_t v15 = objc_msgSend_bindingName(v14, v8, v9, v10);
        if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)a3, v17))
        {
          uint64_t v18 = objc_msgSend_type(v14, v8, v9, v10);
          uint64_t v26 = sub_1B65358B8(v18, v19, v20, v21, v22, v23, v24, v25);
          if (v26)
          {
            uint64_t v27 = (const char *)v26;
            long long v28 = objc_msgSend_rawValue(v14, v8, v9, v10);
            return VFXValueFromDataAndType(v28, v27, v29, v30);
          }
        }
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v31, (uint64_t)v35, 16);
      id v11 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (BOOL)setBindingValue:(id)a3 forKey:(id)a4
{
  uint64_t v7 = objc_msgSend_valueForKey_(self->_bindings, a2, (uint64_t)a4, (uint64_t)a4);
  uint64_t v11 = objc_msgSend_type(v7, v8, v9, v10);
  uint64_t v24 = sub_1B65358B8(v11, v12, v13, v14, v15, v16, v17, v18);
  if (v24)
  {
    uint64_t v25 = sub_1B64BB5B8(a3, v24, 0, v19, v20, v21, v22, v23);
    objc_msgSend_setRawValue_(v7, v26, v25, v27);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = sub_1B660472C(a3, v24, v28, v29, v30, v31, v32, v33);
      uint64_t v38 = objc_msgSend_worldRef(self, v35, v36, v37);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1B65FB194;
      v41[3] = &unk_1E6143008;
      v41[4] = self;
      v41[5] = a4;
      v41[6] = v34;
      objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v39, v38, (uint64_t)self, a4, v41);
    }
  }
  return v24 != 0;
}

- (id)valueForKeyPath:(id)a3
{
  entityObject = self->_entityObject;
  uint64_t v6 = objc_msgSend_world(self, a2, (uint64_t)a3, v3);

  return (id)MEMORY[0x1F4181798](entityObject, sel__valueForKeyPath_world_, a3, v6);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  if ((objc_msgSend__setValue_forKeyPath_(self->_entityObject, a2, (uint64_t)a3, (uint64_t)a4) & 1) == 0) {
    sub_1B63F2F54(16, @"Error: invalid keyPath %@", v5, v6, v7, v8, v9, v10, (uint64_t)a4);
  }
}

- (void)encodeWithCoder:(id)a3
{
}

- (VFXCoreEntityHandle)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)VFXCoreEntityHandle;
  uint64_t v7 = [(VFXCoreEntityHandle *)&v25 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t v11 = objc_opt_class();
    uint64_t v13 = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v12, v11, @"tag");
    v7->_tag = v13;
    uint64_t v14 = sub_1B6535748(v13);
    v7->_handle = (__CFXCoreEntityHandle *)v14;
    if (v14) {
      sub_1B6583684(v14, v7, v16, v17, v18, v19, v20, v21);
    }
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    objc_msgSend_setImmediateMode_(VFXTransaction, v22, v8, v23);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)wasAddedToWorld:(id)a3
{
  if (self->_entityObject)
  {
    uint64_t v5 = objc_msgSend_scene(a3, a2, (uint64_t)a3, v3);
    entityObject = self->_entityObject;
    objc_msgSend_addEntityObject_(v5, v6, (uint64_t)entityObject, v7);
  }
}

- (void)willBeRemovedFromWorld:(id)a3
{
  uint64_t v5 = objc_msgSend_scene(a3, a2, (uint64_t)a3, v3);
  entityObject = self->_entityObject;

  MEMORY[0x1F4181798](v5, sel_removeEntityObject_, entityObject, v6);
}

@end