@interface VFXCameraEffect
+ (BOOL)supportsSecureCoding;
+ (id)presentationCameraEffectWithCameraEffectRef:(__CFXCameraEffect *)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isEnabled;
- (BOOL)rawFloat2ForKey:(id)a3 value:;
- (BOOL)rawFloat3ForKey:(id)a3 value:;
- (NSArray)animationKeys;
- (VFXCameraEffect)init;
- (VFXCameraEffect)initWithCoder:(id)a3;
- (__CFXAnimationManager)animationManager;
- (__CFXWorld)worldRef;
- (id)_valueForSimdVectorKeyPath:(id)a3;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initPresentationCameraEffectWithCameraEffectRef:(void *)a3;
- (id)presentationObject;
- (id)valueForKeyPath:(id)a3;
- (id)world;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)createCFXObject;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setEnabled:(BOOL)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXCameraEffect

- (void)createCFXObject
{
  sub_1B63F2F54(16, @"Unreachable code: createCFXObject - abstract method called", v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (VFXCameraEffect)init
{
  v16.receiver = self;
  v16.super_class = (Class)VFXCameraEffect;
  uint64_t v2 = [(VFXCameraEffect *)&v16 init];
  uint64_t v6 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    uint64_t CFXObject = objc_msgSend_createCFXObject(v2, v3, v4, v5);
    v6->_cameraEffect = (void *)CFXObject;
    if (CFXObject) {
      sub_1B6583684(CFXObject, v6, v9, v10, v11, v12, v13, v14);
    }
    objc_msgSend__syncObjCModel(v6, v8, v9, v10);
  }
  return v6;
}

- (void)dealloc
{
  cameraEffect = self->_cameraEffect;
  if (cameraEffect)
  {
    if (!self->_isPresentationObject)
    {
      sub_1B6583684((uint64_t)cameraEffect, 0, v2, v3, v4, v5, v6, v7);
      cameraEffect = self->_cameraEffect;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B63E2868;
    v11[3] = &unk_1E6140A18;
    v11[4] = cameraEffect;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXCameraEffect;
  [(VFXCameraEffect *)&v10 dealloc];
}

- (id)initPresentationCameraEffectWithCameraEffectRef:(void *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXCameraEffect;
  uint64_t v4 = [(VFXCameraEffect *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_isPresentationObject = 1;
    v4->_cameraEffect = (void *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (id)presentationCameraEffectWithCameraEffectRef:(__CFXCameraEffect *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  inited = objc_msgSend_initPresentationCameraEffectWithCameraEffectRef_(v4, v5, (uint64_t)a3, v6);

  return inited;
}

- (id)presentationObject
{
  uint64_t v2 = self;
  if (!*((unsigned char *)self + 16))
  {
    id v3 = objc_alloc((Class)objc_opt_class());
    inited = objc_msgSend_initPresentationCameraEffectWithCameraEffectRef_(v3, v4, v2[1], v5);
    return inited;
  }
  return self;
}

- (void)_syncObjCModel
{
  self->_enabled = sub_1B6529108((uint64_t)self->_cameraEffect);
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_isPresentationObject || self->_enabled != a3)
  {
    self->_enabled = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B63E2A5C;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)isEnabled
{
  if (self->_isPresentationObject) {
    return sub_1B6529108((uint64_t)self->_cameraEffect);
  }
  else {
    return self->_enabled;
  }
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
    v20 = objc_msgSend___CFObject(self, v17, v18, v19);
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
    v22[2] = sub_1B63E2CF0;
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
    v17 = objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
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
  v12[2] = sub_1B63E2F04;
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
  v14[2] = sub_1B63E2FCC;
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
    v13[2] = sub_1B63E30A8;
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
    v15[2] = sub_1B63E318C;
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
  v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
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
    v29[2] = sub_1B63E36CC;
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
  v14[2] = sub_1B63E3828;
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
  v8[2] = sub_1B63E3904;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)__CFObject
{
  return self->_cameraEffect;
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  return 0;
}

- (BOOL)rawFloat2ForKey:(id)a3 value:
{
  return 0;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v35 = 0;
  uint64_t v34 = 0;
  sub_1B64F9EE8(a3, (char *)&v35, (uint64_t *)&v34, v3);
  if (qword_1E9DDA670 != -1) {
    dispatch_once(&qword_1E9DDA670, &unk_1F0FB5588);
  }
  if (!v34 || !objc_msgSend_containsObject_((void *)qword_1E9DDA668, v5, (uint64_t)v34, v6)) {
    return 0;
  }
  int v33 = 0;
  double v31 = 0.0;
  uint64_t v32 = 0;
  if (objc_msgSend_rawFloat3ForKey_value_(self, v7, v35, (uint64_t)&v32))
  {
    if (objc_msgSend_isEqualToString_(v34, v8, @"x", v9))
    {
      LODWORD(v13) = v32;
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v10, v11, v12, v13);
    }
    if (objc_msgSend_isEqualToString_(v34, v10, @"y", v12))
    {
      LODWORD(v18) = HIDWORD(v32);
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v15, v16, v17, v18);
    }
    if (objc_msgSend_isEqualToString_(v34, v15, @"z", v17))
    {
      LODWORD(v21) = v33;
      return (id)objc_msgSend_numberWithFloat_(NSNumber, v8, v19, v20, v21);
    }
  }
  if (!objc_msgSend_rawFloat2ForKey_value_(self, v8, v35, (uint64_t)&v31)) {
    return 0;
  }
  if (objc_msgSend_isEqualToString_(v34, v22, @"x", v23)) {
    return (id)objc_msgSend_numberWithFloat_(NSNumber, v24, v25, v26, v31);
  }
  if (!objc_msgSend_isEqualToString_(v34, v24, @"y", v26)) {
    return 0;
  }
  LODWORD(v30) = HIDWORD(v31);
  return (id)objc_msgSend_numberWithFloat_(NSNumber, v27, v28, v29, v30);
}

- (id)valueForKeyPath:(id)a3
{
  if (!a3) {
    return 0;
  }
  id result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, a2, (uint64_t)a3, v3);
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)VFXCameraEffect;
    return [(VFXCameraEffect *)&v7 valueForKeyPath:a3];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_setEnabled_(v4, v5, self->_enabled, v6);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeBool_forKey_(a3, a2, self->_enabled, @"enabled");
  sub_1B64FAB54(a3, self, v5, v6);

  sub_1B64FAEBC(a3, self, v7, v8);
}

- (VFXCameraEffect)initWithCoder:(id)a3
{
  v30.receiver = self;
  v30.super_class = (Class)VFXCameraEffect;
  uint64_t v7 = [(VFXCameraEffect *)&v30 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t CFXObject = objc_msgSend_createCFXObject(v7, v11, v12, v13);
    v7->_cameraEffect = (void *)CFXObject;
    if (CFXObject) {
      sub_1B6583684(CFXObject, v7, v16, v17, v18, v19, v20, v21);
    }
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    uint64_t v24 = objc_msgSend_decodeBoolForKey_(a3, v22, @"enabled", v23);
    objc_msgSend_setEnabled_(v7, v25, v24, v26);
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B64FABB0(a3, v7);
    sub_1B64FB19C(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v27, v8, v28);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end