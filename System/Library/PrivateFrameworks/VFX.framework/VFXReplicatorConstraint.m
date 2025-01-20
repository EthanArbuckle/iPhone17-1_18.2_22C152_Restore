@interface VFXReplicatorConstraint
+ (BOOL)supportsSecureCoding;
+ (id)replicatorConstraint;
+ (id)replicatorConstraintWithTarget:(id)a3;
- (BOOL)replicatesOrientation;
- (BOOL)replicatesPosition;
- (BOOL)replicatesScale;
- (VFXNode)target;
- (VFXReplicatorConstraint)init;
- (VFXReplicatorConstraint)initWithCoder:(id)a3;
- (__n128)orientationOffset;
- (__n128)positionOffset;
- (__n128)scaleOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)valueForKey:(id)a3;
- (uint64_t)setOrientationOffset:(uint64_t)a3;
- (void)_customDecodingOfVFXReplicatorConstraint:(id)a3;
- (void)_customEncodingOfVFXReplicatorConstraint:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)retargetWithRemapTable:(__CFDictionary *)a3;
- (void)setPositionOffset:(VFXReplicatorConstraint *)self;
- (void)setReplicatesOrientation:(BOOL)a3;
- (void)setReplicatesPosition:(BOOL)a3;
- (void)setReplicatesScale:(BOOL)a3;
- (void)setScaleOffset:(VFXReplicatorConstraint *)self;
- (void)setTarget:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXReplicatorConstraint

- (VFXReplicatorConstraint)init
{
  v10.receiver = self;
  v10.super_class = (Class)VFXReplicatorConstraint;
  v2 = [(VFXConstraint *)&v10 init];
  if (v2)
  {
    sub_1B660AEF4();
    v2->super._constraintRef = v3;
    v2->_replicateOrientation = 1;
    v2->_replicatePosition = 1;
    v2->_replicateScale = 1;
    *(_OWORD *)&v2->_anon_40[5] = xmmword_1B6E4F370;
    *(_OWORD *)&v2->_positionOffset[5] = 0u;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&v2->_scaleOffset[5] = _Q0;
  }
  return v2;
}

+ (id)replicatorConstraint
{
  v2 = objc_alloc_init(VFXReplicatorConstraint);

  return v2;
}

+ (id)replicatorConstraintWithTarget:(id)a3
{
  v5 = objc_msgSend_replicatorConstraint(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setTarget_(v5, v6, (uint64_t)a3, v7);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  uint64_t v14 = objc_msgSend_replicatesOrientation(self, v11, v12, v13);
  objc_msgSend_setReplicatesOrientation_(v4, v15, v14, v16);
  uint64_t v20 = objc_msgSend_replicatesPosition(self, v17, v18, v19);
  objc_msgSend_setReplicatesPosition_(v4, v21, v20, v22);
  uint64_t v26 = objc_msgSend_replicatesScale(self, v23, v24, v25);
  objc_msgSend_setReplicatesScale_(v4, v27, v26, v28);
  objc_msgSend_orientationOffset(self, v29, v30, v31);
  objc_msgSend_setOrientationOffset_(v4, v32, v33, v34);
  objc_msgSend_positionOffset(self, v35, v36, v37);
  objc_msgSend_setPositionOffset_(v4, v38, v39, v40);
  objc_msgSend_scaleOffset(self, v41, v42, v43);
  objc_msgSend_setScaleOffset_(v4, v44, v45, v46);
  objc_msgSend_copyTo_(self, v47, (uint64_t)v4, v48);
  return v4;
}

- (void)setTarget:(id)a3
{
  target = self->_target;
  if (target != a3)
  {

    uint64_t v6 = (VFXNode *)a3;
    self->_target = v6;
    if (v6) {
      uint64_t v10 = objc_msgSend_nodeRef(v6, v7, v8, v9);
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = objc_msgSend_worldRef(self, v7, v8, v9);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B6613ADC;
    v13[3] = &unk_1E61412A8;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (VFXNode)target
{
  return self->_target;
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
  {
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
  }
}

- (void)setReplicatesOrientation:(BOOL)a3
{
  self->_replicateOrientation = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6613C00;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesOrientation
{
  return self->_replicateOrientation;
}

- (void)setReplicatesPosition:(BOOL)a3
{
  self->_replicatePosition = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6613CD0;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesPosition
{
  return self->_replicatePosition;
}

- (void)setReplicatesScale:(BOOL)a3
{
  self->_replicateScale = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6613DA0;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (BOOL)replicatesScale
{
  return self->_replicateScale;
}

- (uint64_t)setOrientationOffset:(uint64_t)a3
{
  a1[4] = a5;
  uint64_t v6 = objc_msgSend_worldRef(a1, a2, a3, a4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6613E74;
  v10[3] = &unk_1E61412D0;
  uint64_t v12 = a1;
  __n128 v11 = a5;
  return objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)a1, @"orientationOffset", v10);
}

- (__n128)orientationOffset
{
  return a1[4];
}

- (void)setPositionOffset:(VFXReplicatorConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)&self->_positionOffset[5] = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6613F48;
  v9[3] = &unk_1E61412D0;
  __n128 v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"positionOffset", v9);
}

- (__n128)positionOffset
{
  return a1[5];
}

- (void)setScaleOffset:(VFXReplicatorConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)&self->_scaleOffset[5] = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B661401C;
  v9[3] = &unk_1E61412D0;
  __n128 v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"scaleOffset", v9);
}

- (__n128)scaleOffset
{
  return a1[6];
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"positionOffset", v3))
  {
    BOOL v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_positionOffset(self, v6, v7, v8);
LABEL_9:
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (!objc_msgSend_isEqualToString_(a3, v6, @"orientationOffset", v8))
  {
    if (!objc_msgSend_isEqualToString_(a3, v13, @"scaleOffset", v15))
    {
      v24.receiver = self;
      v24.super_class = (Class)VFXReplicatorConstraint;
      return [(VFXReplicatorConstraint *)&v24 valueForKey:a3];
    }
    BOOL v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_scaleOffset(self, v21, v22, v23);
    goto LABEL_9;
  }
  uint64_t v16 = (void *)MEMORY[0x1E4F29238];
  objc_msgSend_orientationOffset(self, v13, v14, v15);

  return (id)objc_msgSend_valueWithVFXFloat4_(v16, v17, v18, v19);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"positionOffset", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setPositionOffset_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"orientationOffset", v9))
  {
    objc_msgSend_VFXFloat4Value(a3, v13, v14, v15);
    objc_msgSend_setOrientationOffset_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"scaleOffset", v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setScaleOffset_(self, v22, v23, v24);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)VFXReplicatorConstraint;
    [(VFXReplicatorConstraint *)&v25 setValue:a3 forKey:a4];
  }
}

- (void)_customEncodingOfVFXReplicatorConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, @"target");
  }
}

- (void)_customDecodingOfVFXReplicatorConstraint:(id)a3
{
  sub_1B660AEF4();
  self->super._constraintRef = v5;
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"target");
  objc_msgSend_setTarget_(self, v9, v8, v10);

  objc_msgSend_finalizeDecodeConstraint_(self, v11, (uint64_t)a3, v12);
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VFXReplicatorConstraint;
  -[VFXConstraint encodeWithCoder:](&v10, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXReplicatorConstraint_(self, v5, (uint64_t)a3, v6);
  objc_msgSend_encodeBool_forKey_(a3, v7, self->_replicateOrientation, @"replicatesOrientation");
  objc_msgSend_encodeBool_forKey_(a3, v8, self->_replicateScale, @"replicatesScale");
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_replicatePosition, @"replicatesPosition");
  sub_1B64FA35C(a3, (const char *)@"orientationOffset", *(__n128 *)&self->_anon_40[5]);
  sub_1B64FA2F4(a3, (const char *)@"positionOffset", *(__n128 *)&self->_positionOffset[5]);
  sub_1B64FA2F4(a3, (const char *)@"scaleOffset", *(__n128 *)&self->_scaleOffset[5]);
}

- (VFXReplicatorConstraint)initWithCoder:(id)a3
{
  v43.receiver = self;
  v43.super_class = (Class)VFXReplicatorConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v43, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXReplicatorConstraint_(v7, v11, (uint64_t)a3, v12);
    uint64_t v15 = objc_msgSend_decodeBoolForKey_(a3, v13, @"replicatesOrientation", v14);
    objc_msgSend_setReplicatesOrientation_(v7, v16, v15, v17);
    uint64_t v20 = objc_msgSend_decodeBoolForKey_(a3, v18, @"replicatesScale", v19);
    objc_msgSend_setReplicatesScale_(v7, v21, v20, v22);
    uint64_t v25 = objc_msgSend_decodeBoolForKey_(a3, v23, @"replicatesPosition", v24);
    objc_msgSend_setReplicatesPosition_(v7, v26, v25, v27);
    *(void *)&double v28 = sub_1B64FA474(a3, (const char *)@"orientationOffset").n128_u64[0];
    objc_msgSend_setOrientationOffset_(v7, v29, v30, v31, v28);
    double v32 = sub_1B64FA42C(a3, (const char *)@"positionOffset");
    objc_msgSend_setPositionOffset_(v7, v33, v34, v35, v32);
    double v36 = sub_1B64FA42C(a3, (const char *)@"scaleOffset");
    objc_msgSend_setScaleOffset_(v7, v37, v38, v39, v36);
    objc_msgSend_setImmediateMode_(VFXTransaction, v40, v8, v41);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end