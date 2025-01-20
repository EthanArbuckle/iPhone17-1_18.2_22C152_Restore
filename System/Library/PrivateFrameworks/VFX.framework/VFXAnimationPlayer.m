@interface VFXAnimationPlayer
+ (BOOL)supportsSecureCoding;
+ (id)animationPlayerWithAnimation:(id)a3;
+ (id)animationPlayerWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3;
+ (id)animationPlayerWithVFXAnimation:(id)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)paused;
- (BOOL)usesAbsoluteTime;
- (NSArray)animationKeys;
- (NSString)description;
- (VFXAnimation)animation;
- (VFXAnimationPlayer)initWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3;
- (VFXAnimationPlayer)initWithCoder:(id)a3;
- (VFXAnimationPlayer)initWithVFXAnimation:(id)a3;
- (__CFXAnimationManager)animationManager;
- (__CFXAnimationPlayer)animationPlayerRef;
- (__CFXWorld)worldRef;
- (float)blendFactor;
- (float)speed;
- (float)weight;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)world;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setAnimation:(id)a3;
- (void)_syncObjCAnimations;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)commonInit;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)play;
- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setBlendFactor:(float)a3;
- (void)setPaused:(BOOL)a3;
- (void)setSpeed:(float)a3;
- (void)setUsesAbsoluteTime:(BOOL)a3;
- (void)setWeight:(float)a3;
- (void)stop;
- (void)stopWithBlendOutDuration:(double)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXAnimationPlayer

- (void)commonInit
{
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&self->_weight = _D0;
  self->_paused = 0;
}

+ (id)animationPlayerWithAnimation:(id)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_initWithVFXAnimation_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (VFXAnimationPlayer)initWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3
{
  v41.receiver = self;
  v41.super_class = (Class)VFXAnimationPlayer;
  id v4 = [(VFXAnimationPlayer *)&v41 init];
  if (v4)
  {
    v5 = (__CFXAnimationPlayer *)CFRetain(a3);
    v4->_playerRef = v5;
    uint64_t v13 = sub_1B6420F7C((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    v4->_animation = (VFXAnimation *)(id)objc_msgSend_animationWithCFXAnimation_(VFXAnimation, v14, v13, v15);
    v4->_weight = sub_1B64212EC((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);
    v4->_speed = sub_1B6421200((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
    v4->_paused = sub_1B64213FC((uint64_t)a3, v30, v31, v32, v33, v34, v35, v36);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCAnimations(v4, v37, v38, v39);
  }
  return v4;
}

+ (id)animationPlayerWithAnimationPlayerRef:(__CFXAnimationPlayer *)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v7 = objc_msgSend_initWithAnimationPlayerRef_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (VFXAnimationPlayer)initWithVFXAnimation:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VFXAnimationPlayer;
  uint64_t v7 = [(VFXAnimationPlayer *)&v13 init];
  if (v7)
  {
    uint64_t v8 = (const void *)objc_msgSend_animationRef(a3, v4, v5, v6);
    v7->_playerRef = (__CFXAnimationPlayer *)sub_1B6420E48(v8);
    v7->_animation = (VFXAnimation *)a3;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend_commonInit(v7, v9, v10, v11);
  }
  return v7;
}

+ (id)animationPlayerWithVFXAnimation:(id)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v7 = objc_msgSend_initWithVFXAnimation_(v4, v5, (uint64_t)a3, v6);

  return v7;
}

- (void)dealloc
{
  playerRef = self->_playerRef;
  if (playerRef)
  {
    CFRelease(playerRef);
    self->_playerRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXAnimationPlayer;
  [(VFXAnimationPlayer *)&v4 dealloc];
}

- (void)_setAnimation:(id)a3
{
  animation = self->_animation;
  if (animation != a3)
  {

    self->_animation = (VFXAnimation *)a3;
    playerRef = self->_playerRef;
    if (playerRef)
    {
      CFRelease(playerRef);
      self->_playerRef = 0;
    }
    if (a3)
    {
      uint64_t v10 = (const void *)objc_msgSend_animationRef(a3, v6, v7, v8);
      uint64_t v11 = (__CFXAnimationPlayer *)sub_1B6420E48(v10);
      self->_playerRef = v11;
      sub_1B642124C((uint64_t)v11, self->_weight, v12, v13, v14, v15, v16, v17, v18);
      sub_1B642115C((uint64_t)self->_playerRef, self->_speed, v19, v20, v21, v22, v23, v24, v25);
      uint64_t v32 = self->_playerRef;
      BOOL paused = self->_paused;
      sub_1B6421338((uint64_t)v32, paused, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (__CFXAnimationPlayer)animationPlayerRef
{
  return self->_playerRef;
}

- (void)prepareWithTarget:(id)a3 implicitDuration:(double)a4
{
  objc_msgSend_prepareWithTarget_implicitDuration_(self->_animation, a2, (uint64_t)a3, v4, a4);
  playerRef = self->_playerRef;
  uint64_t v10 = (const void *)objc_msgSend_animationRef(self->_animation, v7, v8, v9);

  sub_1B6420F00((uint64_t)playerRef, v10, v11, v12, v13, v14, v15, v16);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v11 = objc_msgSend_animation(self, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithVFXAnimation_(v7, v12, v11, v13);
  objc_msgSend_weight(self, v15, v16, v17);
  objc_msgSend_setWeight_(v14, v18, v19, v20);
  objc_msgSend_speed(self, v21, v22, v23);
  objc_msgSend_setSpeed_(v14, v24, v25, v26);
  uint64_t v30 = objc_msgSend_paused(self, v27, v28, v29);
  objc_msgSend_setPaused_(v14, v31, v30, v32);
  uint64_t v36 = objc_msgSend_usesAbsoluteTime(self, v33, v34, v35);
  objc_msgSend_setUsesAbsoluteTime_(v14, v37, v36, v38);
  objc_msgSend_commit(VFXTransaction, v39, v40, v41);
  return v14;
}

- (void)__CFObject
{
  return self->_playerRef;
}

- (__CFXAnimationManager)animationManager
{
  result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
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
    v22[2] = sub_1B6504EFC;
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
  v12[2] = sub_1B6505110;
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
  v14[2] = sub_1B65051D8;
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
    v13[2] = sub_1B65052B4;
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
    v15[2] = sub_1B6505398;
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
    v29[2] = sub_1B65058D8;
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
  v14[2] = sub_1B6505A34;
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
  v8[2] = sub_1B6505B10;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
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

- (float)weight
{
  return self->_weight;
}

- (void)setWeight:(float)a3
{
}

- (float)blendFactor
{
  return self->_weight;
}

- (void)setBlendFactor:(float)a3
{
  if (self->_weight != a3)
  {
    self->_weight = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B6505C4C;
    v3[3] = &unk_1E6141208;
    v3[4] = self;
    float v4 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, @"blendFactor", v3);
  }
}

- (float)speed
{
  return self->_speed;
}

- (void)setSpeed:(float)a3
{
  if (self->_speed != a3)
  {
    self->_speed = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B6505D00;
    v3[3] = &unk_1E6141208;
    v3[4] = self;
    float v4 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, @"speed", v3);
  }
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_BOOL paused = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B6505DAC;
    v3[3] = &unk_1E6141190;
    v3[4] = self;
    BOOL v4 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
  }
}

- (void)play
{
  self->_BOOL paused = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1B6505E40;
  v2[3] = &unk_1E61411E0;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)stop
{
  self->_BOOL paused = 1;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1B6505ED0;
  v2[3] = &unk_1E61411E0;
  v2[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v2);
}

- (void)stopWithBlendOutDuration:(double)a3
{
  self->_BOOL paused = 1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1B6505F64;
  v3[3] = &unk_1E61412A8;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
}

- (BOOL)usesAbsoluteTime
{
  return self->_usesAbsoluteTime;
}

- (void)setUsesAbsoluteTime:(BOOL)a3
{
  if (self->_usesAbsoluteTime != a3)
  {
    self->_usesAbsoluteTime = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = sub_1B6506014;
    v3[3] = &unk_1E6141190;
    v3[4] = self;
    BOOL v4 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, (uint64_t)self, v3);
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"weight", v3, self->_weight);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"speed", v7, self->_speed);
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_paused, @"paused");
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_usesAbsoluteTime, @"usesAbsoluteTime");
  objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)self->_animation, @"animation");

  sub_1B64FAEBC(a3, self, v11, v12);
}

- (VFXAnimationPlayer)initWithCoder:(id)a3
{
  v51.receiver = self;
  v51.super_class = (Class)VFXAnimationPlayer;
  BOOL v4 = [(VFXAnimationPlayer *)&v51 init];
  uint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_immediateMode(VFXTransaction, v9, v10, v11);
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, 1, v14);
    uint64_t v15 = objc_opt_class();
    uint64_t v17 = (VFXAnimation *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, @"animation");
    v8->_animation = v17;
    if (v17)
    {
      v8->_animationsLock._os_unfair_lock_opaque = 0;
      uint64_t v25 = (const void *)objc_msgSend_animationRef(v17, v18, v19, v20);
      v8->_playerRef = (__CFXAnimationPlayer *)sub_1B6420E48(v25);
      objc_msgSend_decodeDoubleForKey_(a3, v26, @"weight", v27);
      *(float *)&double v28 = v28;
      objc_msgSend_setWeight_(v8, v29, v30, v31, v28);
      objc_msgSend_decodeDoubleForKey_(a3, v32, @"speed", v33);
      *(float *)&double v34 = v34;
      objc_msgSend_setSpeed_(v8, v35, v36, v37, v34);
      uint64_t v40 = objc_msgSend_decodeBoolForKey_(a3, v38, @"paused", v39);
      objc_msgSend_setPaused_(v8, v41, v40, v42);
      uint64_t v45 = objc_msgSend_decodeBoolForKey_(a3, v43, @"usesAbsoluteTime", v44);
      objc_msgSend_setUsesAbsoluteTime_(v8, v46, v45, v47);
      sub_1B64FB19C(a3, v8);
      objc_msgSend_setImmediateMode_(VFXTransaction, v48, v12, v49);
    }
    else
    {
      sub_1B63F2F54(16, @"Error: can't decode old format animations", v19, v20, v21, v22, v23, v24, (uint64_t)v51.receiver);
      return 0;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_animation(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v5, v7, @"<VFXAnimationPlayer(%p) animation=%@>", v8, self, v6);
}

- (VFXAnimation)animation
{
  return self->_animation;
}

@end