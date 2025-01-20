@interface VFXParticleCollider
+ (BOOL)supportsSecureCoding;
+ (id)particleColliderWithEntityObject:(id)a3;
+ (id)presentationParticleColliderWithCoreEntityHandleRef:(__CFXCoreEntityHandle *)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (VFXParticleCollider)initWithCoder:(id)a3;
- (VFXParticleCollider)initWithCoreEntityHandle:(id)a3;
- (VFXParticleCollider)initWithEntityObject:(id)a3;
- (__CFXCoreEntityHandle)coreEntityHandleRef;
- (__CFXWorld)worldRef;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreEntityHandle;
- (id)description;
- (id)tag;
- (id)world;
- (void)__CFObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)wasAddedToWorld:(id)a3;
- (void)willBeRemovedFromWorld:(id)a3;
@end

@implementation VFXParticleCollider

- (VFXParticleCollider)initWithEntityObject:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VFXParticleCollider;
  v6 = [(VFXParticleCollider *)&v8 init];
  if (v6) {
    v6->_coreHandle = (VFXCoreEntityHandle *)(id)objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v4, (uint64_t)a3, v5);
  }
  return v6;
}

- (VFXParticleCollider)initWithCoreEntityHandle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VFXParticleCollider;
  v4 = [(VFXParticleCollider *)&v6 init];
  if (v4) {
    v4->_coreHandle = (VFXCoreEntityHandle *)a3;
  }
  return v4;
}

+ (id)presentationParticleColliderWithCoreEntityHandleRef:(__CFXCoreEntityHandle *)a3
{
  id result = (id)sub_1B6535608(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (result)
  {
    uint64_t v11 = objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v9, (uint64_t)result, v10);
    v12 = [VFXParticleCollider alloc];
    v15 = objc_msgSend_initWithCoreEntityHandle_(v12, v13, v11, v14);
    return v15;
  }
  return result;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXParticleCollider;
  [(VFXParticleCollider *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p>", v7, v5, self);
}

+ (id)particleColliderWithEntityObject:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v7 = objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (id)tag
{
  return (id)objc_msgSend_tag(self->_coreHandle, a2, v2, v3);
}

- (void)__CFObject
{
  return (void *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1F4181798])(self->_coreHandle, sel_handle);
}

- (__CFXWorld)worldRef
{
  id v4 = objc_msgSend___CFObject(self, a2, v2, v3);

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

- (void)wasAddedToWorld:(id)a3
{
  objc_msgSend_wasAddedToWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (void)willBeRemovedFromWorld:(id)a3
{
  objc_msgSend_willBeRemovedFromWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (__CFXCoreEntityHandle)coreEntityHandleRef
{
  return (__CFXCoreEntityHandle *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1F4181798])(self->_coreHandle, sel_handle);
}

- (id)coreEntityHandle
{
  return self->_coreHandle;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend_copy(self->_coreHandle, a2, (uint64_t)a3, v3);
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_initWithCoreEntityHandle_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)encodeWithCoder:(id)a3
{
}

- (VFXParticleCollider)initWithCoder:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)VFXParticleCollider;
  uint64_t v7 = [(VFXParticleCollider *)&v25 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    if (objc_msgSend_containsValueForKey_(a3, v11, @"rootIdentifier", v12))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"rootIdentifier");
      v16 = [VFXCoreEntityHandle alloc];
      v19 = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v16, v17, v15, v18);
    }
    else
    {
      uint64_t v22 = objc_opt_class();
      v19 = (VFXCoreEntityHandle *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v23, v22, @"coreHandle");
    }
    v7->_coreHandle = v19;
    objc_msgSend_setImmediateMode_(VFXTransaction, v20, v8, v21);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end