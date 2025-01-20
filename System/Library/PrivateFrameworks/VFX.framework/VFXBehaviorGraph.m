@interface VFXBehaviorGraph
+ (BOOL)supportsSecureCoding;
+ (VFXBehaviorGraph)behaviorGraphWithEntityObject:(id)a3;
+ (id)presentationBehaviorGraphWithCoreEntityHandleRef:(__CFXCoreEntityHandle *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isPausedOrPausedByInheritance;
- (NSArray)animationKeys;
- (NSArray)bindings;
- (NSString)description;
- (VFXBehaviorGraph)initWithCoder:(id)a3;
- (VFXBehaviorGraph)initWithCoreEntityHandle:(id)a3;
- (VFXBehaviorGraph)initWithEntityObject:(id)a3;
- (VFXBehaviorGraph)initWithTag:(id)a3;
- (__CFXAnimationManager)animationManager;
- (__CFXCoreEntityHandle)coreEntityHandleRef;
- (__CFXWorld)worldRef;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)coreEntityHandle;
- (id)entityObject;
- (id)identifier;
- (id)initPresentationBehaviorGraphWithCoreEntityHandle:(id)a3;
- (id)name;
- (id)presentationObject;
- (id)tag;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)resolveTag:(id)a3 remap:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)unbindAnimatablePath:(id)a3;
- (void)wasAddedToWorld:(id)a3;
- (void)willBeRemovedFromWorld:(id)a3;
@end

@implementation VFXBehaviorGraph

- (VFXBehaviorGraph)initWithEntityObject:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VFXBehaviorGraph;
  v6 = [(VFXBehaviorGraph *)&v11 init];
  if (v6)
  {
    v6->_coreHandle = (VFXCoreEntityHandle *)(id)objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v4, (uint64_t)a3, v5);
    v6->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v6, v7, v8, v9);
  }
  return v6;
}

- (VFXBehaviorGraph)initWithCoreEntityHandle:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXBehaviorGraph;
  v4 = [(VFXBehaviorGraph *)&v9 init];
  if (v4)
  {
    v4->_coreHandle = (VFXCoreEntityHandle *)a3;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v5, v6, v7);
  }
  return v4;
}

- (VFXBehaviorGraph)initWithTag:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VFXBehaviorGraph;
  v4 = [(VFXBehaviorGraph *)&v9 init];
  if (v4)
  {
    uint64_t v5 = [VFXCoreEntityHandle alloc];
    v4->_coreHandle = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v5, v6, (uint64_t)a3, v7);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)initPresentationBehaviorGraphWithCoreEntityHandle:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXBehaviorGraph;
  v4 = [(VFXBehaviorGraph *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_coreHandle = (VFXCoreEntityHandle *)a3;
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXBehaviorGraph)behaviorGraphWithEntityObject:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  objc_super v7 = objc_msgSend_initWithEntityObject_(v4, v5, (uint64_t)a3, v6);

  return (VFXBehaviorGraph *)v7;
}

+ (id)presentationBehaviorGraphWithCoreEntityHandleRef:(__CFXCoreEntityHandle *)a3
{
  id result = (id)sub_1B6535608(a3, 1, (uint64_t)a3, v3, v4, v5, v6, v7);
  if (result)
  {
    uint64_t v11 = objc_msgSend_handleWithEntityObject_(VFXCoreEntityHandle, v9, (uint64_t)result, v10);
    v12 = [VFXBehaviorGraph alloc];
    inited = objc_msgSend_initPresentationBehaviorGraphWithCoreEntityHandle_(v12, v13, v11, v14);
    return inited;
  }
  return result;
}

- (void)resolveTag:(id)a3 remap:(id)a4
{
  objc_msgSend_resolveTag_remap_(self->_coreHandle, a2, (uint64_t)a3, (uint64_t)a4);

  objc_msgSend__syncObjCModel(self, v5, v6, v7);
}

- (id)presentationObject
{
  v2 = self;
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    uint64_t v3 = [VFXBehaviorGraph alloc];
    inited = objc_msgSend_initPresentationBehaviorGraphWithCoreEntityHandle_(v3, v4, v2[1], v5);
    return inited;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXBehaviorGraph;
  [(VFXBehaviorGraph *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p>", v7, v5, self);
}

- (void)_syncObjCModel
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_bindings(self->_coreHandle, a2, v2, v3);
  if (objc_msgSend_count(v5, v6, v7, v8))
  {
    if (!self->_valueForKey) {
      self->_valueForKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v5);
          }
          v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          coreHandle = self->_coreHandle;
          uint64_t v19 = objc_msgSend_bindingName(v17, v11, v12, v13);
          uint64_t v22 = objc_msgSend_bindingValueForKey_(coreHandle, v20, v19, v21);
          if (v22)
          {
            uint64_t v23 = v22;
            valueForKey = self->_valueForKey;
            uint64_t v25 = objc_msgSend_bindingName(v17, v11, v12, v13);
            objc_msgSend_setValue_forKey_(valueForKey, v26, v23, v25);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v14);
    }
  }
}

- (id)tag
{
  return (id)objc_msgSend_tag(self->_coreHandle, a2, v2, v3);
}

- (void)setName:(id)a3
{
  uint64_t name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_uint64_t name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1B65636B0;
      v15[3] = &unk_1E6141230;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (id)name
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_name;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  uint64_t v5 = (void *)sub_1B6583470(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14) {
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);

  sub_1B65835F8(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return sub_1B6583590(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_uint64_t name = (NSString *)(id)sub_1B6583470(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v5, v6, v7);
  uint64_t v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);

  sub_1B65835F8(v4, v12, v13, v14, v15, v16, v17, v18);
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

- (__CFXCoreEntityHandle)coreEntityHandleRef
{
  return (__CFXCoreEntityHandle *)((uint64_t (*)(VFXCoreEntityHandle *, char *))MEMORY[0x1F4181798])(self->_coreHandle, sel_handle);
}

- (id)coreEntityHandle
{
  return self->_coreHandle;
}

- (__CFXAnimationManager)animationManager
{
  id result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return (__CFXAnimationManager *)sub_1B64B2008((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  }
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  if (!a4) {
    return 0;
  }
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v10 = objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  BOOL v16 = objc_msgSend_animation(v10, v11, v12, v13) == (void)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    uint64_t v20 = objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B6583B18(v20) & 1) == 0) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity", v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    }
    sub_1B6584118(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = (uint64_t)a4;
    if (!a4)
    {
      uint64_t v11 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, (uint64_t)a3, 0);
      uint64_t v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    uint64_t v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1B6563ABC;
    v22[3] = &unk_1E61411B8;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: attempt to add a null animation player on %@", 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    uint64_t v9 = (uint64_t)a4;
    uint64_t v10 = (uint64_t)a3;
    if (!a4)
    {
      uint64_t v11 = objc_msgSend_UUID(MEMORY[0x1E4F29128], a2, (uint64_t)a3, 0);
      uint64_t v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    }
    uint64_t v17 = objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: attempt to add a null animation on %@", 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
}

- (void)removeAllAnimations
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1B6563CD0;
  v12[3] = &unk_1E61411E0;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B6563D98;
  v14[3] = &unk_1E6141208;
  v14[4] = self;
  float v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B6563E74;
    v13[3] = &unk_1E6141230;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B6563F58;
    v15[3] = &unk_1E6141258;
    v15[4] = self;
    v15[5] = a3;
    float v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10)) {
    return v7;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_syncObjCAnimations
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  uint64_t v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    uint64_t v25 = (uint64_t)v17;
    if ((sub_1B6583B18(v17) & 1) == 0) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. sync animations: cftype is not an entity", v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    }
    CFDictionaryRef v33 = sub_1B6583E9C(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      uint64_t v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B64FD41C(v34, (uint64_t)sub_1B64FF69C, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
  {
    sub_1B64B0CB4(v13, v18, v19, v20, v21, v22, v23, v24);
  }
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      uint64_t v9 = objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      id v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        uint64_t v19 = objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations) {
      id v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    }
    else {
      id v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  uint64_t v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    uint64_t v13 = (void *)v9;
    uint64_t v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      uint64_t v15 = v14;
      double v19 = CACurrentMediaTime();
      sub_1B6424458(v15, v13, a4, v7, v5, v16, v17, v18, v19);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    uint64_t v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    uint64_t v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1B6564498;
    v29[3] = &unk_1E6141280;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  uint64_t v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1B65645F4;
  v14[3] = &unk_1E6141230;
  v14[4] = self;
  void v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  uint64_t v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B65646D0;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (id)valueForKeyPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  sub_1B64F9EE8(a3, (char *)&v14, &v13, v3);
  if (v13)
  {
    uint64_t v8 = objc_msgSend_valueForKey_(self, v6, v14, v7);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return (id)objc_msgSend_VFX_valueForKey_(v8, v9, v13, v10);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)VFXBehaviorGraph;
  return [(VFXBehaviorGraph *)&v12 valueForKeyPath:a3];
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v6 = objc_msgSend_valueForKey_(self->_valueForKey, a2, (uint64_t)a3, v3);
  if ((*((unsigned char *)self + 16) & 1) != 0 || (uint64_t v10 = (void *)v6) == 0)
  {
    uint64_t v11 = objc_msgSend_worldRef(self, v7, v8, v9);
    uint64_t v19 = v11;
    if (v11) {
      sub_1B64B0C28(v11, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    }
    coreHandle = self->_coreHandle;
    if (*((unsigned char *)self + 16)) {
      uint64_t v21 = objc_msgSend_bindingPresentationValueForKey_(coreHandle, v12, (uint64_t)a3, v14);
    }
    else {
      uint64_t v21 = objc_msgSend_bindingValueForKey_(coreHandle, v12, (uint64_t)a3, v14);
    }
    uint64_t v10 = (void *)v21;
    if (!v21)
    {
      uint64_t v10 = objc_msgSend_valueForKeyPath_(self->_coreHandle, v22, (uint64_t)a3, v24);
      if (!v19) {
        return v10;
      }
      goto LABEL_10;
    }
    if (v19) {
LABEL_10:
    }
      sub_1B64B0CB4(v19, (uint64_t)v22, v23, v24, v25, v26, v27, v28);
  }
  return v10;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (objc_msgSend_setBindingValue_forKey_(self->_coreHandle, a2, (uint64_t)a3, (uint64_t)a4))
  {
    valueForKey = self->_valueForKey;
    if (!valueForKey)
    {
      valueForKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_valueForKey = valueForKey;
    }
    objc_msgSend_setValue_forKey_(valueForKey, v7, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    coreHandle = self->_coreHandle;
    objc_msgSend_setValue_forKeyPath_(coreHandle, v7, (uint64_t)a3, (uint64_t)a4);
  }
}

- (void)wasAddedToWorld:(id)a3
{
  objc_msgSend_wasAddedToWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (void)willBeRemovedFromWorld:(id)a3
{
  objc_msgSend_willBeRemovedFromWorld_(self->_coreHandle, a2, (uint64_t)a3, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v11 = objc_msgSend_entityObject(self, v8, v9, v10);
  id v15 = (id)objc_msgSend_copy(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_initWithEntityObject_(v7, v16, (uint64_t)v15, v17);
  objc_msgSend__copyAnimationsFrom_(v18, v19, (uint64_t)self, v20);
  v18[4] = objc_msgSend_mutableCopy(self->_valueForKey, v21, v22, v23);
  objc_msgSend_commitImmediate(VFXTransaction, v24, v25, v26);
  return v18;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (NSArray)bindings
{
  return (NSArray *)objc_msgSend_bindings(self->_coreHandle, a2, v2, v3);
}

- (id)entityObject
{
  return (id)objc_msgSend_entityObject(self->_coreHandle, a2, v2, v3);
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_coreHandle, @"coreHandle");
  sub_1B64FAB54(a3, self, v6, v7);

  sub_1B64FAEBC(a3, self, v8, v9);
}

- (VFXBehaviorGraph)initWithCoder:(id)a3
{
  v28.receiver = self;
  v28.super_class = (Class)VFXBehaviorGraph;
  uint64_t v7 = [(VFXBehaviorGraph *)&v28 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    if (objc_msgSend_containsValueForKey_(a3, v11, @"rootIdentifier", v12))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v15 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v14, v13, @"rootIdentifier");
      uint64_t v16 = [VFXCoreEntityHandle alloc];
      uint64_t v19 = (VFXCoreEntityHandle *)objc_msgSend_initWithTag_(v16, v17, v15, v18);
    }
    else
    {
      uint64_t v23 = objc_opt_class();
      uint64_t v19 = (VFXCoreEntityHandle *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v24, v23, @"coreHandle");
    }
    v7->_coreHandle = v19;
    objc_msgSend__syncObjCModel(v7, v20, v21, v22);
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v25, v8, v26);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end