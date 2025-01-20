@interface VFXForceField
+ (BOOL)supportsSecureCoding;
+ (VFXForceField)forceFieldWithForceFieldRef:(__CFXForceField *)a3;
+ (float)_displayScaleFactor;
+ (id)dragField;
+ (id)field;
+ (id)harmonicField;
+ (id)linearField;
+ (id)magneticField;
+ (id)noiseFieldWithSmoothness:(float)a3 animationSpeed:(float)a4;
+ (id)presentationForceFieldWithForceFieldRef:(__CFXForceField *)a3;
+ (id)radialField;
+ (id)springField;
+ (id)turbulenceFieldWithSmoothness:(float)a3 animationSpeed:(float)a4;
+ (id)vortexField;
+ (void)_setDisplayScaleFactor:(float)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)isActive;
- (BOOL)supportsOffset;
- (NSArray)animationKeys;
- (VFXForceField)init;
- (VFXForceField)initWithCoder:(id)a3;
- (VFXForceField)initWithFieldType:(int64_t)a3;
- (VFXForceField)initWithForceFieldRef:(__CFXForceField *)a3;
- (__CFXAnimationManager)animationManager;
- (__CFXWorld)worldRef;
- (__n128)__createCFObject;
- (double)halfExtent;
- (double)offset;
- (float)falloffExponent;
- (float)smoothness;
- (float)speed;
- (float)strength;
- (id)_vfxAnimationForKey:(id)a3;
- (id)_vfxBindings;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)halfExtentValue;
- (id)identifier;
- (id)initPresentationForceFieldWithForceFieldRef:(__CFXForceField *)a3;
- (id)name;
- (id)offsetValue;
- (id)presentationObject;
- (id)valueForKey:(id)a3;
- (id)world;
- (int64_t)cullMode;
- (int64_t)fieldType;
- (int64_t)scope;
- (int64_t)shape;
- (unint64_t)categoryBitMask;
- (void)__CFObject;
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
- (void)setActive:(BOOL)a3;
- (void)setCategoryBitMask:(unint64_t)a3;
- (void)setCullMode:(int64_t)a3;
- (void)setFalloffExponent:(float)a3;
- (void)setFieldType:(int64_t)a3;
- (void)setHalfExtent:(VFXForceField *)self;
- (void)setHalfExtentValue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setOffset:(VFXForceField *)self;
- (void)setOffsetValue:(id)a3;
- (void)setScope:(int64_t)a3;
- (void)setSettings:(void *)a3;
- (void)setShape:(int64_t)a3;
- (void)setSmoothness:(float)a3;
- (void)setSpeed:(float)a3;
- (void)setStrength:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation VFXForceField

- (VFXForceField)init
{
  v13.receiver = self;
  v13.super_class = (Class)VFXForceField;
  v2 = [(VFXForceField *)&v13 init];
  if (v2)
  {
    *(void *)&double v11 = -[VFXForceField __createCFObject]_0().n128_u64[0];
    v2->_forceField = (__CFXForceField *)v3;
    if (v3) {
      sub_1B6583684(v3, v2, v5, v6, v7, v8, v9, v10);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6, v11);
  }
  return v2;
}

- (VFXForceField)initWithFieldType:(int64_t)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VFXForceField;
  v4 = [(VFXForceField *)&v21 init];
  if (v4)
  {
    -[VFXForceField __createCFObject]_0();
    v4->_uint64_t forceField = (__CFXForceField *)v5;
    sub_1B65D2B84(v5, a3, v6, v7, v8, v9, v10, v11);
    uint64_t forceField = (uint64_t)v4->_forceField;
    if (forceField) {
      sub_1B6583684(forceField, v4, v13, v14, v15, v16, v17, v18);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v12, v13, v14);
  }
  return v4;
}

- (VFXForceField)initWithForceFieldRef:(__CFXForceField *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXForceField;
  v4 = [(VFXForceField *)&v17 init];
  if (v4)
  {
    uint64_t v5 = (__CFXForceField *)CFRetain(a3);
    v4->_uint64_t forceField = v5;
    if (v5) {
      sub_1B6583684((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
  }
  return v4;
}

- (id)initPresentationForceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXForceField;
  v4 = [(VFXForceField *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_uint64_t forceField = (__CFXForceField *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXForceField)forceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  result = (VFXForceField *)sub_1B6583674((id *)a3);
  if (!result)
  {
    id v6 = objc_alloc((Class)a1);
    uint64_t v9 = objc_msgSend_initWithForceFieldRef_(v6, v7, (uint64_t)a3, v8);
    return (VFXForceField *)v9;
  }
  return result;
}

+ (id)field
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (id)presentationObject
{
  id v3 = objc_alloc((Class)objc_opt_class());
  inited = objc_msgSend_initPresentationForceFieldWithForceFieldRef_(v3, v4, (uint64_t)self->_forceField, v5);

  return inited;
}

+ (id)presentationForceFieldWithForceFieldRef:(__CFXForceField *)a3
{
  v4 = [VFXForceField alloc];
  inited = objc_msgSend_initPresentationForceFieldWithForceFieldRef_(v4, v5, (uint64_t)a3, v6);

  return inited;
}

- (void)dealloc
{
  uint64_t forceField = self->_forceField;
  if (forceField)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      sub_1B6583684((uint64_t)forceField, 0, v2, v3, v4, v5, v6, v7);
      uint64_t forceField = self->_forceField;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B658BA84;
    v11[3] = &unk_1E6140A18;
    v11[4] = forceField;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXForceField;
  [(VFXForceField *)&v10 dealloc];
}

- (int64_t)fieldType
{
  if (*((unsigned char *)self + 16)) {
    return sub_1B65D2C84((uint64_t)self->_forceField, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
  else {
    return self->_settings.kind;
  }
}

- (void)setFieldType:(int64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.kind != a3)
  {
    self->_settings.kind = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658BB7C;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"fieldType", v8);
  }
}

+ (id)dragField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 8, v4);

  return v5;
}

+ (id)vortexField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 2, v4);

  return v5;
}

+ (id)radialField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 1, v4);

  return v5;
}

+ (id)linearField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 0, v4);

  return v5;
}

+ (id)noiseFieldWithSmoothness:(float)a3 animationSpeed:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  id v9 = (id)objc_msgSend_initWithFieldType_(v6, v7, 3, v8);
  *(float *)&double v10 = a3;
  objc_msgSend_setSmoothness_(v9, v11, v12, v13, v10);
  *(float *)&double v14 = a4;
  objc_msgSend_setSpeed_(v9, v15, v16, v17, v14);
  return v9;
}

+ (id)turbulenceFieldWithSmoothness:(float)a3 animationSpeed:(float)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  id v9 = (id)objc_msgSend_initWithFieldType_(v6, v7, 4, v8);
  *(float *)&double v10 = a3;
  objc_msgSend_setSmoothness_(v9, v11, v12, v13, v10);
  *(float *)&double v14 = a4;
  objc_msgSend_setSpeed_(v9, v15, v16, v17, v14);
  return v9;
}

+ (id)springField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 5, v4);

  return v5;
}

+ (id)magneticField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 6, v4);

  return v5;
}

+ (id)harmonicField
{
  id v2 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = objc_msgSend_initWithFieldType_(v2, v3, 7, v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_fieldType(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_initWithFieldType_(v4, v9, v8, v10);
  objc_msgSend_begin(VFXTransaction, v12, v13, v14);
  objc_msgSend_setImmediateMode_(VFXTransaction, v15, 1, v16);
  uint64_t v20 = objc_msgSend_name(self, v17, v18, v19);
  objc_msgSend_setName_(v11, v21, v20, v22);
  uint64_t v26 = objc_msgSend_categoryBitMask(self, v23, v24, v25);
  objc_msgSend_setCategoryBitMask_(v11, v27, v26, v28);
  objc_msgSend_setSettings_(v11, v29, (uint64_t)&self->_settings, v30);
  objc_msgSend__copyAnimationsFrom_(v11, v31, (uint64_t)self, v32);
  objc_msgSend_commitImmediate(VFXTransaction, v33, v34, v35);
  return v11;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)setSettings:(void *)a3
{
  long long v4 = *((_OWORD *)a3 + 5);
  long long v18 = *((_OWORD *)a3 + 4);
  long long v19 = v4;
  long long v5 = *((_OWORD *)a3 + 7);
  long long v20 = *((_OWORD *)a3 + 6);
  long long v21 = v5;
  long long v6 = *((_OWORD *)a3 + 1);
  long long v14 = *(_OWORD *)a3;
  long long v15 = v6;
  long long v7 = *((_OWORD *)a3 + 3);
  long long v16 = *((_OWORD *)a3 + 2);
  long long v17 = v7;
  memmove(&self->_settings, a3, 0x80uLL);
  uint64_t v11 = objc_msgSend_worldRef(self, v8, v9, v10);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B658BF30;
  v13[3] = &unk_1E6144960;
  uint64_t v22 = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (float)strength
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.strength;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B65D2D5C((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D2D5C((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setStrength:(float)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.strength != a3)
  {
    self->_settings.strength = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B658C090;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"strength", v9);
  }
}

- (unint64_t)categoryBitMask
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.categoryBitMask;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    unint64_t v22 = sub_1B65D3254((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D3254((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.categoryBitMask != a3)
  {
    self->_settings.categoryBitMask = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658C1D8;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (float)falloffExponent
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.falloffExponent;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B65D2E34((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D2E34((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setFalloffExponent:(float)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.falloffExponent != a3)
  {
    self->_settings.falloffExponent = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B658C338;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"falloffExponent", v9);
  }
}

- (BOOL)isActive
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.active;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    char v22 = sub_1B65D2F00((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D2F00((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setActive:(BOOL)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.active != a3)
  {
    self->_settings.active = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658C484;
    v8[3] = &unk_1E6141190;
    v8[4] = self;
    BOOL v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (int64_t)scope
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.scope;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B65D30AC((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = sub_1B65D30AC((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setScope:(int64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.scope != a3)
  {
    self->_settings.scope = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658C5C4;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"scope", v8);
  }
}

- (double)halfExtent
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v31 = sub_1B65D2FDC((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v31;
    }
    else
    {
      uint64_t v29 = *(__n128 **)(a1 + 8);
      *(void *)&long long v5 = sub_1B65D2FDC(v29, v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 112);
  }
  return *(double *)&v5;
}

- (void)setHalfExtent:(VFXForceField *)self
{
  if ((*((unsigned char *)self + 16) & 1) != 0
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_68[8], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_anon_68[8] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B658C72C;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"halfExtent", v10);
  }
}

- (double)offset
{
  if (*(unsigned char *)(a1 + 16))
  {
    uint64_t v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      uint64_t v14 = v6;
      sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
      unint64_t v31 = sub_1B65D3188((__n128 *)*(void *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21).n128_u64[0];
      sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(void *)&long long v5 = v31;
    }
    else
    {
      uint64_t v29 = *(__n128 **)(a1 + 8);
      *(void *)&long long v5 = sub_1B65D3188(v29, v7, v8, v9, v10, v11, v12, v13).n128_u64[0];
    }
  }
  else
  {
    long long v5 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v5;
}

- (void)setOffset:(VFXForceField *)self
{
  if ((*((unsigned char *)self + 16) & 1) != 0
    || (uint32x4_t v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_68[24], v4),
        v6.i32[3] = v6.i32[2],
        (vminvq_u32(v6) & 0x80000000) == 0))
  {
    *(float32x4_t *)&self->_anon_68[24] = v4;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v2, v3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1B658C894;
    v10[3] = &unk_1E61412D0;
    uint64_t v12 = self;
    long long v11 = v9;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"offset", v10);
  }
}

- (BOOL)supportsOffset
{
  return (self->_settings.kind > 8uLL) | (0xA6u >> self->_settings.kind) & 1;
}

- (float)smoothness
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(float *)&self->_anon_68[40];
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B65D33FC((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D33FC((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSmoothness:(float)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || *(float *)&self->_anon_68[40] != a3)
  {
    *(float *)&self->_anon_68[40] = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B658CA14;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"smoothness", v9);
  }
}

- (int64_t)shape
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.shape;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B65D35A4((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = sub_1B65D35A4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setShape:(int64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.shape != a3)
  {
    self->_settings.shape = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658CB54;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"shape", v8);
  }
}

- (int64_t)cullMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_settings.cullMode;
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6) {
    return sub_1B65D3324((uint64_t)self->_forceField, v7, v8, v9, v10, v11, v12, v13);
  }
  uint64_t v14 = v6;
  sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
  int64_t v5 = sub_1B65D3324((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
  sub_1B64B0CB4(v14, v22, v23, v24, v25, v26, v27, v28);
  return v5;
}

- (void)setCullMode:(int64_t)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || self->_settings.cullMode != a3)
  {
    self->_settings.cullMode = a3;
    uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1B658CC94;
    v8[3] = &unk_1E61412A8;
    v8[4] = self;
    void v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"cullMode", v8);
  }
}

- (float)speed
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(float *)&self->_anon_68[44];
  }
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v6)
  {
    uint64_t v14 = v6;
    sub_1B64B0C28(v6, v7, v8, v9, v10, v11, v12, v13);
    float v22 = sub_1B65D34D4((uint64_t)self->_forceField, v15, v16, v17, v18, v19, v20, v21);
    sub_1B64B0CB4(v14, v23, v24, v25, v26, v27, v28, v29);
    return v22;
  }
  else
  {
    uint64_t forceField = self->_forceField;
    return sub_1B65D34D4((uint64_t)forceField, v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)setSpeed:(float)a3
{
  if ((*((unsigned char *)self + 16) & 1) != 0 || *(float *)&self->_anon_68[44] != a3)
  {
    *(float *)&self->_anon_68[44] = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B658CDF4;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"speed", v9);
  }
}

+ (void)_setDisplayScaleFactor:(float)a3
{
  dword_1E9DCAD28 = LODWORD(a3);
}

+ (float)_displayScaleFactor
{
  return *(float *)&dword_1E9DCAD28;
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
      v15[2] = sub_1B658CEEC;
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
  int64_t v5 = (void *)sub_1B6583470(v15, v16, v17, v18, v19, v20, v21, v22);
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

- (void)__CFObject
{
  return self->_forceField;
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
    v22[2] = sub_1B658D2F0;
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
  v12[2] = sub_1B658D504;
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
  v14[2] = sub_1B658D5CC;
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
    v13[2] = sub_1B658D6A8;
    v13[3] = &unk_1E6141230;
    void v13[4] = self;
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
    v15[2] = sub_1B658D78C;
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
    v29[2] = sub_1B658DCCC;
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
  v14[2] = sub_1B658DE28;
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
  v8[2] = sub_1B658DF04;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_syncObjCModel
{
  uint64_t v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (v5)
  {
    uint64_t v13 = v5;
    sub_1B64B0C28(v5, v6, v7, v8, v9, v10, v11, v12);
    uint64_t v21 = (long long *)sub_1B65D35F0((uint64_t)self->_forceField, v14, v15, v16, v17, v18, v19, v20);
    long long v22 = v21[3];
    long long v24 = *v21;
    long long v23 = v21[1];
    *(_OWORD *)&self->_settings.categoryBitMask = v21[2];
    *(_OWORD *)&self->_settings.scope = v22;
    *(_OWORD *)&self->_settings.kind = v24;
    *(_OWORD *)&self->_settings.dampening = v23;
    long long v25 = v21[7];
    long long v27 = v21[4];
    long long v26 = v21[5];
    *(_OWORD *)&self->_anon_68[24] = v21[6];
    *(_OWORD *)&self->_anon_68[40] = v25;
    *(_OWORD *)&self->_settings.falloffExponent = v27;
    *(_OWORD *)&self->_anon_68[8] = v26;
    objc_msgSend__syncEntityObjCModel(self, v28, v29, v30);
    sub_1B64B0CB4(v13, v31, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    v38 = (long long *)sub_1B65D35F0((uint64_t)self->_forceField, v6, v7, v8, v9, v10, v11, v12);
    long long v42 = v38[3];
    long long v44 = *v38;
    long long v43 = v38[1];
    *(_OWORD *)&self->_settings.categoryBitMask = v38[2];
    *(_OWORD *)&self->_settings.scope = v42;
    *(_OWORD *)&self->_settings.kind = v44;
    *(_OWORD *)&self->_settings.dampening = v43;
    long long v45 = v38[7];
    long long v47 = v38[4];
    long long v46 = v38[5];
    *(_OWORD *)&self->_anon_68[24] = v38[6];
    *(_OWORD *)&self->_anon_68[40] = v45;
    *(_OWORD *)&self->_settings.falloffExponent = v47;
    *(_OWORD *)&self->_anon_68[8] = v46;
    objc_msgSend__syncEntityObjCModel(self, v39, v40, v41);
  }
}

- (void)encodeWithCoder:(id)a3
{
  sub_1B64FA2F4(a3, (const char *)@"halfExtent", *(__n128 *)&self->_anon_68[8]);
  objc_msgSend_encodeInt_forKey_(a3, v5, LODWORD(self->_settings.kind), @"type");
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"strength", v7, self->_settings.strength);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"falloffExponent", v9, self->_settings.falloffExponent);
  objc_msgSend_encodeBool_forKey_(a3, v10, self->_settings.active, @"active");
  objc_msgSend_encodeInteger_forKey_(a3, v11, self->_settings.scope, @"scope");
  objc_msgSend_encodeInteger_forKey_(a3, v12, self->_settings.shape, @"shape");
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"smoothness", v14, *(float *)&self->_anon_68[40]);
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->_settings.categoryBitMask, @"categoryMask");
  objc_msgSend_encodeDouble_forKey_(a3, v16, @"speed", v17, *(float *)&self->_anon_68[44]);
  __n128 v18 = *(__n128 *)&self->_anon_68[24];

  sub_1B64FA2F4(a3, (const char *)@"offset", v18);
}

- (VFXForceField)initWithCoder:(id)a3
{
  v82.receiver = self;
  v82.super_class = (Class)VFXForceField;
  uint64_t v7 = [(VFXForceField *)&v82 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    uint64_t CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    v7->_uint64_t forceField = (__CFXForceField *)CFObject;
    if (CFObject) {
      sub_1B6583684(CFObject, v7, v16, v17, v18, v19, v20, v21);
    }
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    int v24 = objc_msgSend_decodeIntForKey_(a3, v22, @"type", v23);
    objc_msgSend_setFieldType_(v7, v25, v24, v26);
    double v27 = sub_1B64FA42C(a3, (const char *)@"halfExtent");
    objc_msgSend_setHalfExtent_(v7, v28, v29, v30, v27);
    objc_msgSend_decodeDoubleForKey_(a3, v31, @"strength", v32);
    *(float *)&double v33 = v33;
    objc_msgSend_setStrength_(v7, v34, v35, v36, v33);
    objc_msgSend_decodeDoubleForKey_(a3, v37, @"falloffExponent", v38);
    *(float *)&double v39 = v39;
    objc_msgSend_setFalloffExponent_(v7, v40, v41, v42, v39);
    uint64_t v45 = objc_msgSend_decodeBoolForKey_(a3, v43, @"active", v44);
    objc_msgSend_setActive_(v7, v46, v45, v47);
    uint64_t v50 = objc_msgSend_decodeIntegerForKey_(a3, v48, @"scope", v49);
    objc_msgSend_setScope_(v7, v51, v50, v52);
    uint64_t v55 = objc_msgSend_decodeIntegerForKey_(a3, v53, @"shape", v54);
    objc_msgSend_setShape_(v7, v56, v55, v57);
    double v58 = sub_1B64FA42C(a3, (const char *)@"offset");
    objc_msgSend_setOffset_(v7, v59, v60, v61, v58);
    objc_msgSend_decodeDoubleForKey_(a3, v62, @"smoothness", v63);
    *(float *)&double v64 = v64;
    objc_msgSend_setSmoothness_(v7, v65, v66, v67, v64);
    objc_msgSend_decodeDoubleForKey_(a3, v68, @"speed", v69);
    *(float *)&double v70 = v70;
    objc_msgSend_setSpeed_(v7, v71, v72, v73, v70);
    int v76 = objc_msgSend_decodeIntForKey_(a3, v74, @"categoryMask", v75);
    objc_msgSend_setCategoryBitMask_(v7, v77, v76, v78);
    objc_msgSend_setImmediateMode_(VFXTransaction, v79, v8, v80);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"halfExtent", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_halfExtent(self, v6, v7, v8);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v6, @"offset", v8))
    {
      v17.receiver = self;
      v17.super_class = (Class)VFXForceField;
      return [(VFXForceField *)&v17 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_offset(self, v13, v14, v15);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"halfExtent", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setHalfExtent_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"offset", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setOffset_(self, v16, v17, v18);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VFXForceField;
    [(VFXForceField *)&v19 setValue:a3 forKey:a4];
  }
}

- (id)halfExtentValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_halfExtent(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_halfExtent(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_halfExtent(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setHalfExtentValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setHalfExtent_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)offsetValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_offset(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_offset(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_offset(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setOffsetValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setOffset_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (__n128)__createCFObject
{
  if (qword_1EB995498 != -1) {
    dispatch_once(&qword_1EB995498, &unk_1F0FB5F48);
  }
  uint64_t v0 = sub_1B63C8D44(qword_1EB9954A0, 0xC0uLL);
  *(void *)(v0 + 64) = 0;
  *(unsigned char *)(v0 + 72) = 1;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)(v0 + 76) = _D0;
  *(_DWORD *)(v0 + 84) = 0;
  *(_OWORD *)(v0 + 88) = xmmword_1B6E729A0;
  *(void *)(v0 + 112) = 0;
  *(void *)(v0 + 120) = 0;
  *(void *)(v0 + 104) = 0;
  *(_DWORD *)(v0 + 128) = 1065353216;
  __asm { FMOV            V0.4S, #1.0 }
  *(__n128 *)(v0 + 144) = result;
  *(void *)(v0 + 160) = 0;
  *(void *)(v0 + 168) = 0;
  *(void *)(v0 + 176) = 0x3F80000000000000;
  return result;
}

@end