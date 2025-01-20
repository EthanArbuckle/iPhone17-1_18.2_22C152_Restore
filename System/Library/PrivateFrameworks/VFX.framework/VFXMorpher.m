@interface VFXMorpher
+ (BOOL)supportsSecureCoding;
+ (Class)VFXUID_classForElementOfArray:(id)a3;
+ (VFXMorpher)morpherWithMorphRef:(__CFXMorph *)a3;
+ (id)morpher;
+ (id)presentationMorpherWithMorpherRef:(__CFXMorpher *)a3;
+ (id)weightIndexStringForIndex:(int64_t)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_isUsingSparseTargets;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)shouldClearCPUDataAfterUpload;
- (BOOL)shouldMorphNormals;
- (BOOL)unifiesNormals;
- (NSArray)animationKeys;
- (NSArray)targets;
- (NSArray)weights;
- (NSString)description;
- (VFXMorpher)init;
- (VFXMorpher)initWithCoder:(id)a3;
- (VFXMorpher)initWithMorphRef:(__CFXMorph *)a3;
- (__CFXAnimationManager)animationManager;
- (__CFXMorph)morphRef;
- (__CFXWorld)worldRef;
- (float)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4;
- (float)weightForTargetAtIndex:(unint64_t)a3;
- (float)weightForTargetNamed:(id)a3;
- (float)weightIncrementalThreshold;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)correctiveDriverCounts;
- (id)correctiveDriverIndices;
- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3;
- (id)correctiveInBetweenCounts;
- (id)correctiveInBetweenWeights;
- (id)correctives;
- (id)correctivesAndInBetween;
- (id)identifier;
- (id)inBetweenCounts;
- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3;
- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3;
- (id)inBetweenWeights;
- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3;
- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3;
- (id)initPresentationMorpherWithMorphRef:(__CFXMorph *)a3;
- (id)name;
- (id)presentationMorpher;
- (id)presentationObject;
- (id)targetsAndInBetween;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (int64_t)_weightIndexForTargetNamed:(id)a3;
- (int64_t)calculationMode;
- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfVFXMorpher:(id)a3;
- (void)_customEncodingOfVFXMorpher:(id)a3;
- (void)_didDecodeVFXMorpher:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateCorrectivesAndInBetween:(id)a3;
- (void)_updateTargetsAndInBetween:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)clearCorrectives;
- (void)clearInBetweens;
- (void)convertToAdditiveWithBaseMesh:(id)a3;
- (void)convertToSparseWithBaseMesh:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)makeUniqueID;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(float)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4;
- (void)setCalculationMode:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3;
- (void)setShouldMorphNormals:(BOOL)a3;
- (void)setTargets:(id)a3;
- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5;
- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10;
- (void)setUnifiesNormals:(BOOL)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWeight:(float)a3 forTargetAtIndex:(unint64_t)a4;
- (void)setWeight:(float)a3 forTargetNamed:(id)a4;
- (void)setWeightIncrementalThreshold:(float)a3;
- (void)setWeights:(id)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXMorpher

- (VFXMorpher)init
{
  v12.receiver = self;
  v12.super_class = (Class)VFXMorpher;
  v2 = [(VFXMorpher *)&v12 init];
  if (v2)
  {
    uint64_t v3 = sub_1B6586B40();
    v2->_morpher = (__CFXMorph *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (VFXMorpher)initWithMorphRef:(__CFXMorph *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXMorpher;
  v4 = [(VFXMorpher *)&v17 init];
  if (v4)
  {
    uint64_t v5 = (__CFXMorph *)CFRetain(a3);
    v4->_morpher = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationMorpherWithMorphRef:(__CFXMorph *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXMorpher;
  v4 = [(VFXMorpher *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_morpher = (__CFXMorph *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXMorpher)morpherWithMorphRef:(__CFXMorph *)a3
{
  result = (VFXMorpher *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithMorphRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXMorpher *)v9;
  }
  return result;
}

+ (id)morpher
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)clearInBetweens
{
  self->_mainTargetsAndInBetweens = 0;
  self->_inBetweenCounts = 0;
  self->_inBetweenInfluenceWeights = 0;
}

- (void)clearCorrectives
{
  self->_correctiveInBetweenInfluenceWeights = 0;
  *(_OWORD *)&self->_correctiveDriverIndices = 0u;
  *(_OWORD *)&self->_correctivesAndInBetweens = 0u;
}

- (void)dealloc
{
  morpher = self->_morpher;
  if (morpher)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      sub_1B6583684((uint64_t)morpher, 0, v2, v3, v4, v5, v6, v7);
      morpher = self->_morpher;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1B65961DC;
    v14[3] = &unk_1E6140A18;
    v14[4] = morpher;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v14);
  }
  objc_msgSend_clearInBetweens(self, a2, v2, v3);
  objc_msgSend_clearCorrectives(self, v10, v11, v12);

  free(self->_weights);
  v13.receiver = self;
  v13.super_class = (Class)VFXMorpher;
  [(VFXMorpher *)&v13 dealloc];
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
      v15[2] = sub_1B65962B0;
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

- (__CFXMorph)morphRef
{
  return self->_morpher;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_stringWithFormat_(NSString, a2, @"<VFXMorpher %p>", v2, self);
}

- (void)__CFObject
{
  return self->_morpher;
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
    v22[2] = sub_1B6596694;
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
  v12[2] = sub_1B65968A8;
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
  v14[2] = sub_1B6596970;
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
    v13[2] = sub_1B6596A4C;
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
    v15[2] = sub_1B6596B30;
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
    v29[2] = sub_1B6597070;
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
  v14[2] = sub_1B65971CC;
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
  v8[2] = sub_1B65972A8;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v13 = v5;
  if (v5) {
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  morpher = self->_morpher;
  if (!morpher) {
    goto LABEL_32;
  }
  self->_unifyNormal = sub_1B65879C8((uint64_t)self->_morpher) ^ 1;
  self->_useSparseTargets = sub_1B65880A4((uint64_t)morpher, v15, v16, v17, v18, v19, v20, v21);
  long long v22 = sub_1B65873FC((uint64_t)morpher);
  if (v22)
  {
    long long v23 = v22;

    objc_msgSend_clearInBetweens(self, v24, v25, v26);
    objc_msgSend_clearCorrectives(self, v27, v28, v29);
    self->_mainTargets = (NSArray *)sub_1B6597690(v23);
    CFIndex Count = CFArrayGetCount(v23);
    BOOL v31 = Count > 0;
    if (Count >= 1)
    {
      CFIndex v32 = Count;
      self->_weightCFIndex Count = Count;
      uint64_t v33 = 0;
      self->_weights = (float *)malloc_type_realloc(self->_weights, 4 * Count, 0x100004052888210uLL);
      do
      {
        self->_weights[v33] = sub_1B65875C0((uint64_t)morpher, v33, v34, v35, v36, v37, v38, v39);
        ++v33;
      }
      while (v32 != v33);
    }
    CFRelease(v23);
  }
  else
  {
    BOOL v31 = 0;
  }
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v122 = 0u;
  sub_1B6586BE0((uint64_t)morpher, (uint64_t)&v122);
  int v40 = DWORD1(v122);
  if (DWORD1(v122))
  {
    uint64_t v41 = (v122 + DWORD1(v122));
    v42 = (void *)sub_1B63CD09C((uint64_t)morpher);
    self->_mainTargetsAndInBetweens = (NSArray *)sub_1B65977C0(v42, 0, v41, v43);
    id v44 = objc_alloc(MEMORY[0x1E4F1CA48]);
    self->_inBetweenCounts = (NSArray *)objc_msgSend_initWithCapacity_(v44, v45, v122, v46);
    if (v122)
    {
      unint64_t v49 = 0;
      do
      {
        inBetweenCounts = self->_inBetweenCounts;
        uint64_t v51 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v47, *(unsigned int *)(*((void *)&v122 + 1) + 4 * v49), v48);
        objc_msgSend_addObject_(inBetweenCounts, v52, v51, v53);
        ++v49;
      }
      while (v49 < v122);
    }
    id v54 = objc_alloc(MEMORY[0x1E4F1CA48]);
    self->_inBetweenInfluenceWeights = (NSArray *)objc_msgSend_initWithCapacity_(v54, v55, DWORD1(v122), v56);
    int v40 = DWORD1(v122);
    if (DWORD1(v122))
    {
      unint64_t v61 = 0;
      do
      {
        LODWORD(v60) = *(_DWORD *)(v123 + 4 * v61);
        inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
        uint64_t v63 = objc_msgSend_numberWithFloat_(NSNumber, v57, v58, v59, v60);
        objc_msgSend_addObject_(inBetweenInfluenceWeights, v64, v63, v65);
        ++v61;
        int v40 = DWORD1(v122);
      }
      while (v61 < DWORD1(v122));
    }
  }
  if (DWORD2(v123))
  {
    v66 = (const char *)(v40 + v122);
    uint64_t v67 = (DWORD2(v125) + DWORD2(v123));
    v68 = (void *)sub_1B63CD09C((uint64_t)morpher);
    self->_correctivesAndInBetweens = (NSArray *)sub_1B65977C0(v68, v66, v67, v69);
    id v70 = objc_alloc(MEMORY[0x1E4F1CA48]);
    self->_correctiveDriverCounts = (NSArray *)objc_msgSend_initWithCapacity_(v70, v71, DWORD2(v123), v72);
    if (DWORD2(v123))
    {
      unint64_t v75 = 0;
      do
      {
        correctiveDriverCounts = self->_correctiveDriverCounts;
        uint64_t v77 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v73, *(unsigned int *)(v124 + 4 * v75), v74);
        objc_msgSend_addObject_(correctiveDriverCounts, v78, v77, v79);
        ++v75;
      }
      while (v75 < DWORD2(v123));
    }
    id v80 = objc_alloc(MEMORY[0x1E4F1CA48]);
    self->_correctiveDriverIndices = (NSArray *)objc_msgSend_initWithCapacity_(v80, v81, DWORD2(v124), v82);
    if (DWORD2(v124))
    {
      unint64_t v85 = 0;
      do
      {
        correctiveDriverIndices = self->_correctiveDriverIndices;
        uint64_t v87 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v83, *(unsigned int *)(v125 + 4 * v85), v84);
        objc_msgSend_addObject_(correctiveDriverIndices, v88, v87, v89);
        ++v85;
      }
      while (v85 < DWORD2(v124));
    }
    if (DWORD2(v125))
    {
      id v90 = objc_alloc(MEMORY[0x1E4F1CA48]);
      self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend_initWithCapacity_(v90, v91, DWORD2(v123), v92);
      if (DWORD2(v123))
      {
        unint64_t v95 = 0;
        do
        {
          correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
          uint64_t v97 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v93, *(unsigned int *)(v126 + 4 * v95), v94);
          objc_msgSend_addObject_(correctiveInBetweenCounts, v98, v97, v99);
          ++v95;
        }
        while (v95 < DWORD2(v123));
      }
      id v100 = objc_alloc(MEMORY[0x1E4F1CA48]);
      self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend_initWithCapacity_(v100, v101, DWORD2(v125), v102);
      if (DWORD2(v125))
      {
        unint64_t v107 = 0;
        do
        {
          LODWORD(v106) = *(_DWORD *)(*((void *)&v126 + 1) + 4 * v107);
          correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
          uint64_t v109 = objc_msgSend_numberWithFloat_(NSNumber, v103, v104, v105, v106);
          objc_msgSend_addObject_(correctiveInBetweenInfluenceWeights, v110, v109, v111);
          ++v107;
        }
        while (v107 < DWORD2(v125));
      }
    }
  }
  self->_calculationMode = sub_1B65873F4((uint64_t)morpher) == 1;
  if (!v31)
  {
LABEL_32:
    free(self->_weights);
    self->_weightCFIndex Count = 0;
  }
  objc_msgSend__syncEntityObjCModel(self, v112, v113, v114);
  if (v13) {
    sub_1B64B0CB4(v13, v115, v116, v117, v118, v119, v120, v121);
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (id)presentationMorpher
{
  uint64_t v2 = self;
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    uint64_t v3 = [VFXMorpher alloc];
    inited = objc_msgSend_initPresentationMorpherWithMorphRef_(v3, v4, v2[1], v5);
    return inited;
  }
  return self;
}

+ (id)presentationMorpherWithMorpherRef:(__CFXMorpher *)a3
{
  uint64_t v3 = sub_1B63CD09C((uint64_t)a3);
  uint64_t v4 = [VFXMorpher alloc];
  inited = objc_msgSend_initPresentationMorpherWithMorphRef_(v4, v5, v3, v6);

  return inited;
}

- (id)presentationObject
{
  return (id)((uint64_t (*)(VFXMorpher *, char *))MEMORY[0x1F4181798])(self, sel_presentationMorpher);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return sub_1B6500480(self, (__CFString *)a3, (uint64_t)a3, (uint64_t)a4);
}

- (void)setTargets:(id)a3
{
  objc_msgSend_clearInBetweens(self, a2, (uint64_t)a3, v3);
  objc_msgSend_clearCorrectives(self, v6, v7, v8);

  self->_mainTargets = (NSArray *)objc_msgSend_copy(a3, v9, v10, v11);
  self->_mainTargetNamesToIndexes = 0;
  uint64_t v15 = objc_msgSend_worldRef(self, v12, v13, v14);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B6597A10;
  v17[3] = &unk_1E6141230;
  v17[4] = self;
  v17[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
}

- (NSArray)targets
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    if (objc_msgSend_count(self->_mainTargets, a2, v2, v3)) {
      return self->_mainTargets;
    }
    else {
      return (NSArray *)MEMORY[0x1E4F1CBF0];
    }
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  uint64_t v14 = v6;
  if (v6) {
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  morpher = self->_morpher;
  if (!morpher || (uint64_t v16 = sub_1B65873FC((uint64_t)morpher)) == 0)
  {
    uint64_t v18 = 0;
    if (!v14) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  uint64_t v17 = v16;
  uint64_t v18 = sub_1B6597690(v16);
  CFRelease(v17);
  if (v14) {
LABEL_11:
  }
    sub_1B64B0CB4(v14, v7, v8, v9, v10, v11, v12, v13);
LABEL_12:
  result = v18;
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (NSArray)weights
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v20 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v28 = v20;
    if (v20) {
      sub_1B64B0C28(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      uint64_t v30 = sub_1B6587514((uint64_t)self->_morpher, v21, v22, v23, v24, v25, v26, v27);
      uint64_t v33 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v31, v30, v32);
      if (v30 >= 1)
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          *(float *)&double v35 = sub_1B65875C0((uint64_t)morpher, i, v22, v23, v24, v25, v26, v27);
          uint64_t v39 = objc_msgSend_numberWithFloat_(NSNumber, v36, v37, v38, v35);
          objc_msgSend_addObject_(v33, v40, v39, v41);
        }
      }
      if (!v28) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v33 = 0;
      if (!v28)
      {
LABEL_17:
        if (v33) {
          return v33;
        }
        else {
          return (NSArray *)MEMORY[0x1E4F1CBF0];
        }
      }
    }
    sub_1B64B0CB4(v28, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_17;
  }
  unint64_t v5 = objc_msgSend_count(self->_mainTargets, a2, v2, v3);
  uint64_t v11 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v6, self->_weightCount, v7);
  weightCFIndex Count = self->_weightCount;
  if (weightCount)
  {
    for (unint64_t j = 0; j < weightCount; ++j)
    {
      *(float *)&double v12 = self->_weights[j];
      uint64_t v15 = objc_msgSend_numberWithFloat_(NSNumber, v8, v9, v10, v12);
      objc_msgSend_addObject_(v11, v16, v15, v17);
      weightCFIndex Count = self->_weightCount;
    }
  }
  BOOL v18 = v5 > weightCount;
  unint64_t v19 = v5 - weightCount;
  if (v18)
  {
    do
    {
      objc_msgSend_addObject_(v11, v8, (uint64_t)&unk_1F103C108, v10);
      --v19;
    }
    while (v19);
  }
  return v11;
}

- (void)setWeights:(id)a3
{
  unint64_t v6 = objc_msgSend_count(a3, a2, (uint64_t)a3, v3);
  self->_weightCFIndex Count = v6;
  weights = self->_weights;
  if (v6)
  {
    self->_weights = (float *)malloc_type_realloc(weights, 4 * v6, 0x100004052888210uLL);
    if (self->_weightCount)
    {
      unint64_t v11 = 0;
      do
      {
        double v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v8, v11, v10);
        objc_msgSend_floatValue(v12, v13, v14, v15);
        weightCFIndex Count = self->_weightCount;
        self->_weights[v11++] = v17;
      }
      while (v11 < weightCount);
    }
  }
  else
  {
    free(weights);
    self->_weights = 0;
  }
  uint64_t v18 = objc_msgSend_worldRef(self, v8, v9, v10);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1B6597ED8;
  v20[3] = &unk_1E6141230;
  v20[4] = self;
  v20[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v20);
}

- (int64_t)_weightIndexForTargetNamed:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  mainTargetNamesToIndexes = self->_mainTargetNamesToIndexes;
  if (!mainTargetNamesToIndexes)
  {
    id v37 = a3;
    unint64_t v6 = objc_msgSend_targets(self, a2, (uint64_t)a3, v3);
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
    uint64_t v14 = objc_msgSend_dictionaryWithCapacity_(v7, v12, v11, v13);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v15, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v16)
    {
      uint64_t v20 = v16;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(v6);
          }
          uint64_t v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          if (objc_msgSend_name(v24, v17, v18, v19))
          {
            uint64_t v25 = v21 + 1;
            uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v17, v21, v19);
            uint64_t v30 = objc_msgSend_name(v24, v27, v28, v29);
            objc_msgSend_setObject_forKeyedSubscript_(v14, v31, v26, v30);
            uint64_t v21 = v25;
          }
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v20);
    }
    mainTargetNamesToIndexes = (NSDictionary *)objc_msgSend_copy(v14, v17, v18, v19);
    self->_mainTargetNamesToIndexes = mainTargetNamesToIndexes;
    a3 = v37;
  }
  uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(mainTargetNamesToIndexes, a2, (uint64_t)a3, v3);
  if (v32) {
    return objc_msgSend_integerValue(v32, v33, v34, v35);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setWeight:(float)a3 forTargetNamed:(id)a4
{
  uint64_t v7 = objc_msgSend__weightIndexForTargetNamed_(self, a2, (uint64_t)a4, v4);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(float *)&double v10 = a3;
    objc_msgSend_setWeight_forTargetAtIndex_(self, v8, v7, v9, v10);
  }
}

- (float)weightForTargetNamed:(id)a3
{
  uint64_t v5 = objc_msgSend__weightIndexForTargetNamed_(self, a2, (uint64_t)a3, v3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0.0;
  }

  objc_msgSend_weightForTargetAtIndex_(self, v6, v5, v7);
  return result;
}

+ (id)weightIndexStringForIndex:(int64_t)a3
{
  if (qword_1E9DDBA28 != -1) {
    dispatch_once(&qword_1E9DDBA28, &unk_1F0FB5EC8);
  }
  if (a3 > 127) {
    return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"weights[%d]", v3, a3);
  }
  else {
    return (id)qword_1E9DDB628[a3];
  }
}

- (void)setWeight:(float)a3 forTargetAtIndex:(unint64_t)a4
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v23 = objc_msgSend_morphRef(self, a2, a4, v4);
    if (v23)
    {
      sub_1B6587680(v23, a4, v24, v25, v26, v27, v28, v29, a3);
    }
  }
  else if (objc_msgSend_count(self->_mainTargets, a2, a4, v4) <= a4)
  {
    sub_1B63F2F54(16, @"Error: %@ setWeight:forTargetAtIndex:%d - index out of bounds (%d)", v9, v10, v11, v12, v13, v14, (uint64_t)self);
  }
  else
  {
    if (self->_weightCount <= a4)
    {
      uint64_t v15 = (float *)malloc_type_realloc(self->_weights, 4 * (a4 + 1), 0x100004052888210uLL);
      self->_weights = v15;
      bzero(&v15[self->_weightCount], 4 * (a4 + 1 - self->_weightCount));
      self->_weightCFIndex Count = a4 + 1;
    }
    weights = self->_weights;
    if (weights[a4] != a3)
    {
      weights[a4] = a3;
      uint64_t v17 = objc_msgSend_weightIndexStringForIndex_(VFXMorpher, v8, a4, v10);
      uint64_t v21 = objc_msgSend_worldRef(self, v18, v19, v20);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = sub_1B6598428;
      v30[3] = &unk_1E6144A08;
      v30[4] = self;
      v30[5] = a4;
      float v31 = a3;
      objc_msgSend_postCommandWithContext_object_key_subscriptIndex_derivedKeyPath_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, @"weights", a4, v17, v30);
    }
  }
}

- (float)weightForTargetAtIndex:(unint64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    uint64_t v15 = v7;
    if (v7) {
      sub_1B64B0C28(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      float v6 = sub_1B65875C0((uint64_t)morpher, a3, v9, v10, v11, v12, v13, v14);
      if (!v15) {
        return v6;
      }
    }
    else
    {
      float v6 = 0.0;
      if (!v15) {
        return v6;
      }
    }
    sub_1B64B0CB4(v15, v8, v9, v10, v11, v12, v13, v14);
    return v6;
  }
  float v6 = 0.0;
  if (self->_weightCount > a3) {
    return self->_weights[a3];
  }
  return v6;
}

- (float)_presentationWeightForTargetAtIndex:(unint64_t)a3 token:(const void *)a4
{
  if (*(void *)a4 != objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Presentation instance query targets the wrong world", v6, v7, v8, v9, v10, v11, (uint64_t)"token->worldRef == world");
  }
  morpher = self->_morpher;
  if (!morpher) {
    return 0.0;
  }

  return sub_1B65875C0((uint64_t)morpher, a3, v6, v7, v8, v9, v10, v11);
}

- (id)targetsAndInBetween
{
  id result = self->_mainTargetsAndInBetweens;
  if (!result) {
    return self->_mainTargets;
  }
  return result;
}

- (id)correctives
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_count(self->_correctivesAndInBetweens, a2, v2, v3)) {
    return 0;
  }
  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, v5, v6, v7)) {
    return self->_correctivesAndInBetweens;
  }
  uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v12 = objc_msgSend_count(self->_correctiveDriverCounts, v8, v9, v10);
  uint64_t v15 = objc_msgSend_arrayWithCapacity_(v11, v13, v12, v14);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(correctiveInBetweenCounts, v17, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = 0;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(correctiveInBetweenCounts);
        }
        v23 += objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v32 + 1) + 8 * i), v19, v20, v21);
        uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(self->_correctivesAndInBetweens, v26, v23 - 1, v27);
        objc_msgSend_addObject_(v15, v29, v28, v30);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(correctiveInBetweenCounts, v19, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v22);
  }
  return v15;
}

- (id)correctivesAndInBetween
{
  return self->_correctivesAndInBetweens;
}

- (void)_updateTargetsAndInBetween:(id)a3
{
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens) {
    mainTargetsAndInBetweens = self->_mainTargets;
  }
  uint64_t v7 = objc_msgSend_count(mainTargetsAndInBetweens, a2, (uint64_t)a3, v3);
  if (v7 != objc_msgSend_count(a3, v8, v9, v10)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Update can't be done in place", v12, v13, v14, v15, v16, v17, (uint64_t)"oldTargetsAndInBetweens.count == targetsAndInBetweens.count");
  }
  objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(self, v11, (uint64_t)a3, (uint64_t)self->_inBetweenCounts, self->_inBetweenInfluenceWeights, self->_correctivesAndInBetweens, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (void)_updateCorrectivesAndInBetween:(id)a3
{
  uint64_t v6 = objc_msgSend_count(self->_correctivesAndInBetweens, a2, (uint64_t)a3, v3);
  if (v6 != objc_msgSend_count(a3, v7, v8, v9)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Update can't be done in place", v11, v12, v13, v14, v15, v16, (uint64_t)"_correctivesAndInBetweens.count == correctivesAndInBetweens.count");
  }
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
  if (!mainTargetsAndInBetweens) {
    mainTargetsAndInBetweens = self->_mainTargets;
  }
  objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(self, v10, (uint64_t)mainTargetsAndInBetweens, (uint64_t)self->_inBetweenCounts, self->_inBetweenInfluenceWeights, a3, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
}

- (id)inBetweenCounts
{
  return self->_inBetweenCounts;
}

- (id)inBetweenWeights
{
  return self->_inBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForTargetAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_inBetweenCounts, a2, a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v6, a3, v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  uint64_t v15 = v12 - 1;
  if (v12 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v13, v16, v14);
      v17 += objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;

  return (id)objc_msgSend_subarrayWithRange_(mainTargetsAndInBetweens, v13, v17, v15);
}

- (id)inBetweenWeightsForTargetAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_inBetweenCounts, a2, a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v6, a3, v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  uint64_t v15 = v12 - 1;
  if (v12 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_inBetweenCounts, v13, v16, v14);
      uint64_t v17 = v17 + objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21) - 1;
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;

  return (id)objc_msgSend_subarrayWithRange_(inBetweenInfluenceWeights, v13, v17, v15);
}

- (id)correctiveDriverCounts
{
  return self->_correctiveDriverCounts;
}

- (id)correctiveDriverIndices
{
  return self->_correctiveDriverIndices;
}

- (unint64_t)correctiveDriverCountForCorrectiveAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_correctiveDriverCounts, a2, a3, v3)) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v6, a3, v7);

  return objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
}

- (id)correctiveDriverIndicesForCorrectiveAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_correctiveDriverCounts, a2, a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v6, a3, v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  if (!objc_msgSend_count(self->_correctiveDriverIndices, v13, v14, v15)) {
    return 0;
  }
  if (a3)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    do
    {
      uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveDriverCounts, v16, v18, v17);
      v19 += objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23);
      ++v18;
    }
    while (a3 != v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  correctiveDriverIndices = self->_correctiveDriverIndices;

  return (id)objc_msgSend_subarrayWithRange_(correctiveDriverIndices, v16, v19, v12);
}

- (id)correctiveInBetweenCounts
{
  return self->_correctiveInBetweenCounts;
}

- (id)correctiveInBetweenWeights
{
  return self->_correctiveInBetweenInfluenceWeights;
}

- (id)inBetweenTargetsForCorrectiveAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, a2, a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v6, a3, v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  uint64_t v15 = v12 - 1;
  if (v12 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v13, v16, v14);
      v17 += objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  correctivesAndInBetweens = self->_correctivesAndInBetweens;

  return (id)objc_msgSend_subarrayWithRange_(correctivesAndInBetweens, v13, v17, v15);
}

- (id)inBetweenWeightsForCorrectiveAtIndex:(unint64_t)a3
{
  if (!objc_msgSend_count(self->_correctiveInBetweenCounts, a2, a3, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v6, a3, v7);
  uint64_t v12 = objc_msgSend_unsignedIntegerValue(v8, v9, v10, v11);
  uint64_t v15 = v12 - 1;
  if (v12 == 1) {
    return 0;
  }
  if (a3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(self->_correctiveInBetweenCounts, v13, v16, v14);
      uint64_t v17 = v17 + objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21) - 1;
      ++v16;
    }
    while (a3 != v16);
  }
  else
  {
    uint64_t v17 = 0;
  }
  correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;

  return (id)objc_msgSend_subarrayWithRange_(correctiveInBetweenInfluenceWeights, v13, v17, v15);
}

- (void)setTargets:(id)a3 withInBetweenTargetCounts:(id)a4 inBetweenWeights:(id)a5
{
}

- (void)setTargetsAndInBetweens:(id)a3 inBetweenCounts:(id)a4 inBetweenWeights:(id)a5 correctives:(id)a6 driverCounts:(id)a7 driverIndices:(id)a8 inBetweenCounts:(id)a9 inBetweenWeights:(id)a10
{
  id v17 = a9;
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  v133 = (NSArray *)a4;
  v134 = (NSArray *)a3;
  v131 = (NSArray *)a6;
  v132 = (NSArray *)a5;
  uint64_t v18 = objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v25 = objc_msgSend_count(a6, v19, v20, v21);
  if (v25)
  {
    BOOL v120 = 1;
    uint64_t v26 = objc_msgSend_count(v17, v22, v23, v24);
    BOOL v27 = v26 != 0;
    if (!v18)
    {
      if (!v26)
      {
        BOOL v27 = 0;
        goto LABEL_28;
      }
      BOOL v27 = 1;
      goto LABEL_23;
    }
LABEL_7:
    if (sub_1B65991C8((BOOL)self, (char *)a3, a4, a5))
    {
      id v117 = a8;
      sub_1B6599380(self, (const char *)&v134, (void **)&v133, (void **)&v132);
      BOOL v121 = v27;
      if (v27) {
        sub_1B6599380(self, (const char *)&v131, &a9, &a10);
      }
      uint64_t v118 = self;
      id v34 = objc_alloc(MEMORY[0x1E4F1CA48]);
      long long v35 = v133;
      uint64_t v39 = objc_msgSend_count(v133, v36, v37, v38);
      v42 = (NSArray *)objc_msgSend_initWithCapacity_(v34, v40, v39, v41);
      long long v127 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v43, (uint64_t)&v127, (uint64_t)v135, 16);
      uint64_t v48 = v134;
      if (v44)
      {
        uint64_t v49 = v44;
        uint64_t v50 = 0;
        uint64_t v51 = *(void *)v128;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v128 != v51) {
              objc_enumerationMutation(v35);
            }
            v50 += objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v127 + 1) + 8 * i), v45, v46, v47);
            if (v50 - 1 >= (unint64_t)objc_msgSend_count(v48, v53, v54, v55)) {
              sub_1B63F2F54(17, @"Assertion '%s' failed. Invalid in-between count (out of bounds) passed to morpher initialization", v57, v58, v59, v60, v61, v62, (uint64_t)"inBetweenIndex < targetsAndInBetweens.count");
            }
            uint64_t v63 = objc_msgSend_objectAtIndexedSubscript_(v48, v56, v50 - 1, v58);
            objc_msgSend_addObject_(v42, v64, v63, v65);
          }
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v45, (uint64_t)&v127, (uint64_t)v135, 16);
        }
        while (v49);
      }
      self = v118;

      v118->_mainTargets = v42;
      mainTargetsAndInBetweens = v118->_mainTargetsAndInBetweens;
      if (mainTargetsAndInBetweens != v48)
      {

        v118->_mainTargetsAndInBetweens = (NSArray *)objc_msgSend_copy(v48, v67, v68, v69);
      }
      char v119 = 1;
      a8 = v117;
      BOOL v27 = v121;
      goto LABEL_31;
    }
    sub_1B63F2F54(16, @"Error: invalid in-between buffer, ignoring in-betweens", v28, v29, v30, v31, v32, v33, v116);
    if (!v27)
    {
LABEL_28:
      mainTargets = self->_mainTargets;
      uint64_t v48 = v134;
      if (mainTargets != v134)
      {

        self->_mainTargets = (NSArray *)objc_msgSend_copy(v48, v71, v72, v73);
      }

      char v119 = 0;
      self->_mainTargetsAndInBetweens = 0;
LABEL_31:

      self->_mainTargetNamesToIndexes = 0;
      free(self->_weights);
      self->_weightCFIndex Count = 0;
      self->_weights = 0;
      inBetweenInfluenceWeights = self->_inBetweenInfluenceWeights;
      uint64_t v77 = v132;
      if (inBetweenInfluenceWeights != v132)
      {

        self->_inBetweenInfluenceWeights = (NSArray *)objc_msgSend_copy(v77, v78, v79, v80);
      }
      inBetweenCounts = self->_inBetweenCounts;
      uint64_t v82 = v133;
      if (inBetweenCounts != v133)
      {

        self->_inBetweenCounts = (NSArray *)objc_msgSend_copy(v82, v83, v84, v85);
      }
      correctivesAndInBetweens = self->_correctivesAndInBetweens;
      uint64_t v87 = v131;
      if (correctivesAndInBetweens != v131)
      {

        self->_correctivesAndInBetweens = (NSArray *)objc_msgSend_copy(v87, v88, v89, v90);
      }
      correctiveDriverCounts = self->_correctiveDriverCounts;
      if (correctiveDriverCounts != a7)
      {

        self->_correctiveDriverCounts = (NSArray *)objc_msgSend_copy(a7, v92, v93, v94);
      }
      BOOL v122 = v27;
      correctiveDriverIndices = self->_correctiveDriverIndices;
      if (correctiveDriverIndices != a8)
      {

        self->_correctiveDriverIndices = (NSArray *)objc_msgSend_copy(a8, v96, v97, v98);
      }
      id v99 = a7;
      correctiveInBetweenCounts = self->_correctiveInBetweenCounts;
      id v101 = a9;
      if (correctiveInBetweenCounts != a9)
      {

        self->_correctiveInBetweenCounts = (NSArray *)objc_msgSend_copy(v101, v102, v103, v104);
      }
      correctiveInBetweenInfluenceWeights = self->_correctiveInBetweenInfluenceWeights;
      id v106 = a10;
      if (correctiveInBetweenInfluenceWeights != a10)
      {

        self->_correctiveInBetweenInfluenceWeights = (NSArray *)objc_msgSend_copy(v106, v107, v108, v109);
      }
      if (v25) {
        uint64_t v48 = (NSArray *)objc_msgSend_arrayByAddingObjectsFromArray_(v48, v74, (uint64_t)v87, v75);
      }
      v110 = sub_1B6597A8C(v48);
      uint64_t v114 = objc_msgSend_worldRef(self, v111, v112, v113);
      v123[0] = MEMORY[0x1E4F143A8];
      v123[1] = 3221225472;
      v123[2] = sub_1B65997B4;
      v123[3] = &unk_1E6144A30;
      char v124 = v119;
      v123[4] = v82;
      v123[5] = v77;
      BOOL v125 = v120;
      v123[6] = v134;
      v123[7] = v99;
      BOOL v126 = v122;
      v123[8] = a8;
      v123[9] = v101;
      v123[10] = v106;
      v123[11] = self;
      v123[12] = v110;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v115, v114, (uint64_t)self, v123);

      return;
    }
LABEL_23:
    sub_1B6599380(self, (const char *)&v131, &a9, &a10);
    goto LABEL_28;
  }
  if (v18)
  {
    BOOL v120 = v25 != 0;
    BOOL v27 = 0;
    goto LABEL_7;
  }

  objc_msgSend_setTargets_(self, v22, (uint64_t)a3, v24);
}

- (void)setCalculationMode:(int64_t)a3
{
  if (self->_calculationMode != a3)
  {
    self->_calculationMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6599C3C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)calculationMode
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    uint64_t v14 = v6;
    if (v6) {
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    morpher = self->_morpher;
    if (morpher)
    {
      int64_t v5 = sub_1B65873F4((uint64_t)morpher) == 1;
      if (!v14) {
        return v5;
      }
    }
    else
    {
      int64_t v5 = 0;
      if (!v14) {
        return v5;
      }
    }
    sub_1B64B0CB4(v14, v7, v8, v9, v10, v11, v12, v13);
    return v5;
  }
  return self->_calculationMode;
}

- (BOOL)unifiesNormals
{
  return self->_unifyNormal;
}

- (void)setUnifiesNormals:(BOOL)a3
{
  if (self->_unifyNormal != a3)
  {
    self->_unifyNormal = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B6599DC0;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)shouldMorphNormals
{
  return !self->_unifyNormal;
}

- (void)setShouldMorphNormals:(BOOL)a3
{
  objc_msgSend_setUnifiesNormals_(self, a2, !a3, v3);
}

- (BOOL)shouldClearCPUDataAfterUpload
{
  return sub_1B6588318((uint64_t)self->_morpher, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
}

- (void)setShouldClearCPUDataAfterUpload:(BOOL)a3
{
  sub_1B6588364((uint64_t)self->_morpher, a3, a3, v3, v4, v5, v6, v7);
}

- (float)weightIncrementalThreshold
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    float v21 = sub_1B65883B4((uint64_t)self->_morpher, v14, v15, v16, v17, v18, v19, v20);
    sub_1B64B0CB4(v13, v22, v23, v24, v25, v26, v27, v28);
    return v21;
  }
  else
  {
    morpher = self->_morpher;
    return sub_1B65883B4((uint64_t)morpher, v6, v7, v8, v9, v10, v11, v12);
  }
}

- (void)setWeightIncrementalThreshold:(float)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6599F54;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (void)convertToAdditiveWithBaseMesh:(id)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B659A02C;
  v8[3] = &unk_1E6141230;
  v8[4] = self;
  void v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)_isUsingSparseTargets
{
  return self->_useSparseTargets;
}

- (void)convertToSparseWithBaseMesh:(id)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B659A1A0;
  v8[3] = &unk_1E6141230;
  v8[4] = self;
  void v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
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
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_begin(VFXTransaction, v5, v6, v7);
  objc_msgSend_setImmediateMode_(VFXTransaction, v8, 1, v9);
  v4[161] = self->_useSparseTargets;
  inBetweenCounts = self->_inBetweenCounts;
  if (inBetweenCounts || self->_correctiveDriverCounts)
  {
    mainTargetsAndInBetweens = self->_mainTargetsAndInBetweens;
    if (!mainTargetsAndInBetweens) {
      mainTargetsAndInBetweens = self->_mainTargets;
    }
    objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(v4, v10, (uint64_t)mainTargetsAndInBetweens, (uint64_t)inBetweenCounts, self->_inBetweenInfluenceWeights, self->_correctivesAndInBetweens, self->_correctiveDriverCounts, self->_correctiveDriverIndices, self->_correctiveInBetweenCounts, self->_correctiveInBetweenInfluenceWeights);
  }
  else
  {
    uint64_t v38 = objc_msgSend_targets(self, v10, v11, 0);
    objc_msgSend_setTargets_(v4, v39, v38, v40);
    weightCFIndex Count = self->_weightCount;
    if (weightCount)
    {
      for (uint64_t i = 0; i != weightCount; ++i)
      {
        objc_msgSend_weightForTargetAtIndex_(self, v14, i, v16);
        objc_msgSend_setWeight_forTargetAtIndex_(v4, v43, i, v44);
      }
    }
  }
  uint64_t v17 = objc_msgSend_calculationMode(self, v14, v15, v16);
  objc_msgSend_setCalculationMode_(v4, v18, v17, v19);
  uint64_t v23 = objc_msgSend_name(self, v20, v21, v22);
  objc_msgSend_setName_(v4, v24, v23, v25);
  uint64_t v29 = objc_msgSend_unifiesNormals(self, v26, v27, v28);
  objc_msgSend_setUnifiesNormals_(v4, v30, v29, v31);
  objc_msgSend__copyAnimationsFrom_(v4, v32, (uint64_t)self, v33);
  objc_msgSend_commitImmediate(VFXTransaction, v34, v35, v36);
  return v4;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_customDecodingOfVFXMorpher:(id)a3
{
  uint64_t v4 = (__CFXMorph *)sub_1B6586B40();
  self->_morpher = v4;
  if (v4)
  {
    sub_1B6583684((uint64_t)v4, self, v5, v6, v7, v8, v9, v10);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if (objc_msgSend_rangeOfString_(a3, a2, @"weights[", v3)
    || (uint64_t v9 = (uint64_t)v6, (unint64_t)objc_msgSend_length(a3, v6, v7, v8) < 2)
    || (uint64_t v12 = objc_msgSend_substringFromIndex_(a3, v10, v9, v11),
        uint64_t v15 = objc_msgSend_rangeOfString_(v12, v13, @"]", v14),
        v15 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v30.receiver = self;
    v30.super_class = (Class)VFXMorpher;
    return [(VFXMorpher *)&v30 valueForUndefinedKey:a3];
  }
  else
  {
    uint64_t v19 = objc_msgSend_substringToIndex_(v12, v16, v15, v17);
    uint64_t v23 = objc_msgSend_integerValue(v19, v20, v21, v22);
    objc_msgSend_weightForTargetAtIndex_(self, v24, v23, v25);
    uint64_t v29 = NSNumber;
    return (id)objc_msgSend_numberWithFloat_(v29, v26, v27, v28);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (objc_msgSend_rangeOfString_(a4, a2, @"weights[", (uint64_t)a4)
    || (uint64_t v10 = (uint64_t)v7, (unint64_t)objc_msgSend_length(a4, v7, v8, v9) < 2)
    || (uint64_t v13 = objc_msgSend_substringFromIndex_(a4, v11, v10, v12),
        uint64_t v16 = objc_msgSend_rangeOfString_(v13, v14, @"]", v15),
        v16 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v29.receiver = self;
    v29.super_class = (Class)VFXMorpher;
    [(VFXMorpher *)&v29 setValue:a3 forUndefinedKey:a4];
  }
  else
  {
    uint64_t v19 = objc_msgSend_substringToIndex_(v13, v17, v16, v18);
    uint64_t v23 = objc_msgSend_integerValue(v19, v20, v21, v22);
    objc_msgSend_floatValue(a3, v24, v25, v26);
    objc_msgSend_setWeight_forTargetAtIndex_(self, v27, v23, v28);
  }
}

- (void)_customEncodingOfVFXMorpher:(id)a3
{
  uint64_t v4 = sub_1B65873BC((uint64_t)self->_morpher);
  if (v4)
  {
    uint64_t v12 = sub_1B6583544(v4, v5, v6, v7, v8, v9, v10, v11);
    if (v12)
    {
      objc_msgSend_encodeObject_forKey_(a3, v13, v12, @"weightID");
    }
  }
}

- (void)_didDecodeVFXMorpher:(id)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"weightID");
  if (v7)
  {
    uint64_t v8 = (const void *)v7;
    uint64_t v9 = sub_1B65873BC((uint64_t)self->_morpher);
    if (v9)
    {
      sub_1B65835F8(v9, v8, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  }
  objc_msgSend__customEncodingOfVFXMorpher_(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_calculationMode, @"calculationMode");
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_useSparseTargets, @"useSparseTargets");
  if (self->_weightCount)
  {
    uint64_t v11 = objc_msgSend_weights(self, v8, v9, v10);
    objc_msgSend_encodeObject_forKey_(a3, v12, v11, @"weights");
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v16 = objc_msgSend_skipMorphTargets(a3, v13, v14, v15);
  }
  else {
    char v16 = 0;
  }
  if (objc_msgSend_count(self->_inBetweenCounts, v13, v14, v15)
    && objc_msgSend_count(self->_inBetweenInfluenceWeights, v17, v18, v19))
  {
    if ((v16 & 1) == 0) {
      objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_mainTargetsAndInBetweens, @"targetMeshes");
    }
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_inBetweenCounts, @"inBetweenCounts");
    objc_msgSend_encodeObject_forKey_(a3, v20, (uint64_t)self->_inBetweenInfluenceWeights, @"inBetweenInfluenceWeights");
  }
  else if ((v16 & 1) == 0)
  {
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)self->_mainTargets, @"targetMeshes");
  }
  if (objc_msgSend_count(self->_correctiveDriverCounts, v17, v18, v19)
    && objc_msgSend_count(self->_correctiveDriverIndices, v21, v22, v23))
  {
    if ((v16 & 1) == 0) {
      objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctivesAndInBetweens, @"correctiveMeshes");
    }
    objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctiveDriverCounts, @"correctiveDriverCounts");
    objc_msgSend_encodeObject_forKey_(a3, v24, (uint64_t)self->_correctiveDriverIndices, @"correctiveDriverIndices");
    if (objc_msgSend_count(self->_correctiveInBetweenCounts, v25, v26, v27)
      && objc_msgSend_count(self->_correctiveInBetweenInfluenceWeights, v21, v28, v29))
    {
      objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)self->_correctiveInBetweenCounts, @"correctiveInBetweenCounts");
      objc_msgSend_encodeObject_forKey_(a3, v30, (uint64_t)self->_correctiveInBetweenInfluenceWeights, @"correctiveInBetweenInfluenceWeights");
    }
  }
  uint64_t name = self->_name;
  if (name) {
    objc_msgSend_encodeObject_forKey_(a3, v21, (uint64_t)name, @"name");
  }
  objc_msgSend_encodeBool_forKey_(a3, v21, !self->_unifyNormal, @"shouldMorphNormals");
  sub_1B64FAB54(a3, self, v32, v33);

  sub_1B64FAEBC(a3, self, v34, v35);
}

- (VFXMorpher)initWithCoder:(id)a3
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  v138.receiver = self;
  v138.super_class = (Class)VFXMorpher;
  uint64_t v7 = [(VFXMorpher *)&v138 init];
  if (!v7) {
    return v7;
  }
  uint64_t v8 = &off_1E6140000;
  uint64_t v9 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  objc_msgSend__customDecodingOfVFXMorpher_(v7, v12, (uint64_t)a3, v13);
  v7->_useSparseTargets = objc_msgSend_decodeBoolForKey_(a3, v14, @"useSparseTargets", v15);
  uint64_t v18 = objc_msgSend_decodeIntegerForKey_(a3, v16, @"calculationMode", v17);
  objc_msgSend_setCalculationMode_(v7, v19, v18, v20);
  uint64_t v21 = objc_opt_class();
  uint64_t v23 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v22, v21, @"inBetweenCounts");
  uint64_t v24 = objc_opt_class();
  uint64_t v26 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v25, v24, @"inBetweenInfluenceWeights");
  if (v23 | v26)
  {
    uint64_t v41 = (void *)v26;
    goto LABEL_16;
  }
  unsigned int v130 = v9;
  uint64_t v27 = objc_opt_class();
  uint64_t v23 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v28, v27, @"channelTargetCounts");
  uint64_t v29 = objc_opt_class();
  uint64_t v31 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v30, v29, @"channelTargetWeights");
  if (!objc_msgSend_count((void *)v23, v32, v33, v34) || !objc_msgSend_count(v31, v35, v36, v37))
  {
    uint64_t v41 = 0;
    uint64_t v23 = 0;
    goto LABEL_15;
  }
  uint64_t v41 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v38, v39, v40);
  if (!objc_msgSend_count((void *)v23, v42, v43, v44))
  {
LABEL_15:
    uint64_t v9 = v130;
    goto LABEL_16;
  }
  uint64_t v47 = 0;
  unint64_t v48 = 0;
  do
  {
    uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_((void *)v23, v45, v48, v46);
    uint64_t v53 = objc_msgSend_unsignedIntegerValue(v49, v50, v51, v52);
    uint64_t v57 = v53 - 1;
    if (v53 != 1)
    {
      uint64_t v58 = v57 + v47;
      do
      {
        uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v31, v54, v47, v56);
        objc_msgSend_addObject_(v41, v60, v59, v61);
        ++v47;
        --v57;
      }
      while (v57);
      uint64_t v47 = v58;
    }
    ++v47;
    ++v48;
  }
  while (v48 < objc_msgSend_count((void *)v23, v54, v55, v56));
  uint64_t v8 = &off_1E6140000;
  uint64_t v9 = v130;
LABEL_16:
  uint64_t v62 = objc_opt_class();
  v133 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v63, v62, @"correctiveDriverCounts");
  uint64_t v64 = objc_opt_class();
  objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v65, v64, @"correctiveDriverIndices");
  uint64_t v66 = objc_opt_class();
  uint64_t v68 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v67, v66, @"correctiveInBetweenCounts");
  uint64_t v69 = objc_opt_class();
  uint64_t v132 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v70, v69, @"correctiveInBetweenInfluenceWeights");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v74 = objc_msgSend_allTargetsFromAnimCodec(a3, v71, v72, v73)) == 0)
  {
    if (objc_msgSend_containsValueForKey_(a3, v71, @"targets", v73))
    {
      uint64_t v93 = objc_opt_class();
      unint64_t v95 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v94, v93, @"targets");
      v76 = objc_msgSend_VFX_compactMapObjectsUsingBlock_(v95, v96, (uint64_t)&unk_1F0FB61C8, v97);
      uint64_t v98 = objc_opt_class();
      id v100 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v99, v98, @"correctives");
      uint64_t v103 = objc_msgSend_VFX_compactMapObjectsUsingBlock_(v100, v101, (uint64_t)&unk_1F0FB61E8, v102);
    }
    else
    {
      uint64_t v104 = objc_opt_class();
      v76 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v105, v104, @"targetMeshes");
      uint64_t v106 = objc_opt_class();
      uint64_t v103 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v107, v106, @"correctiveMeshes");
    }
    uint64_t v92 = v103;
    goto LABEL_36;
  }
  v76 = (void *)v74;
  if (objc_msgSend_count(v68, v71, v75, v73))
  {
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    uint64_t v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v77, (uint64_t)&v134, (uint64_t)v139, 16);
    if (!v80)
    {
      uint64_t v92 = 0;
      goto LABEL_36;
    }
    uint64_t v84 = v80;
    unsigned int v131 = v9;
    uint64_t v85 = 0;
    uint64_t v86 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v135 != v86) {
          objc_enumerationMutation(v68);
        }
        v85 += objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v134 + 1) + 8 * i), v81, v82, v83);
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v68, v81, (uint64_t)&v134, (uint64_t)v139, 16);
    }
    while (v84);
    if (v85) {
      goto LABEL_27;
    }
LABEL_33:
    uint64_t v92 = 0;
    goto LABEL_34;
  }
  unsigned int v131 = v9;
  uint64_t v85 = objc_msgSend_count(v133, v77, v78, v79);
  if (!v85) {
    goto LABEL_33;
  }
LABEL_27:
  uint64_t v88 = objc_msgSend_count(v76, v81, v82, v83) - v85;
  uint64_t v90 = objc_msgSend_subarrayWithRange_(v76, v89, 0, v88);
  uint64_t v92 = objc_msgSend_subarrayWithRange_(v76, v91, v88, v85);
  v76 = (void *)v90;
LABEL_34:
  uint64_t v8 = &off_1E6140000;
  uint64_t v9 = v131;
LABEL_36:
  if (v23 | v92) {
    objc_msgSend_setTargetsAndInBetweens_inBetweenCounts_inBetweenWeights_correctives_driverCounts_driverIndices_inBetweenCounts_inBetweenWeights_(v7, v81, (uint64_t)v76, v23, v41, v68, v132);
  }
  else {
    objc_msgSend_setTargets_(v7, v81, (uint64_t)v76, v83);
  }
  uint64_t v108 = objc_opt_class();
  uint64_t v110 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v109, v108, @"weights");
  objc_msgSend_setWeights_(v7, v111, v110, v112);
  uint64_t v113 = objc_opt_class();
  uint64_t v115 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v114, v113, @"name");
  objc_msgSend_setName_(v7, v116, v115, v117);
  if (objc_msgSend_containsValueForKey_(a3, v118, @"shouldMorphNormals", v119))
  {
    int v122 = objc_msgSend_decodeBoolForKey_(a3, v120, @"shouldMorphNormals", v121);
    objc_msgSend_setUnifiesNormals_(v7, v123, v122 ^ 1u, v124);
  }
  v7->_animationsLock._os_unfair_lock_opaque = 0;
  sub_1B64FABB0(a3, v7);
  sub_1B64FB19C(a3, v7);
  objc_msgSend__didDecodeVFXMorpher_(v7, v125, (uint64_t)a3, v126);
  objc_msgSend_setImmediateMode_(v8[175], v127, v9, v128);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)VFXUID_classForElementOfArray:(id)a3
{
  if ((objc_msgSend_isEqualToString_(a3, a2, @"weights", v3) & 1) == 0
    && (objc_msgSend_isEqualToString_(a3, v5, @"channelTargetWeights", v6) & 1) == 0
    && !objc_msgSend_isEqualToString_(a3, v7, @"channelTargetCounts", v8))
  {
    return 0;
  }

  return (Class)objc_opt_class();
}

@end