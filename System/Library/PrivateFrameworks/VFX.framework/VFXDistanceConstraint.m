@interface VFXDistanceConstraint
+ (BOOL)supportsSecureCoding;
+ (id)distanceConstraint;
+ (id)distanceConstraintWithTarget:(id)a3;
- (BOOL)keepTargetDirection;
- (VFXDistanceConstraint)init;
- (VFXDistanceConstraint)initWithCoder:(id)a3;
- (VFXNode)target;
- (__n128)targetDirection;
- (float)maximumDistance;
- (float)minimumDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_customDecodingOfVFXDistanceConstraint:(id)a3;
- (void)_customEncodingOfVFXDistanceConstraint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)retargetWithRemapTable:(__CFDictionary *)a3;
- (void)setKeepTargetDirection:(BOOL)a3;
- (void)setMaximumDistance:(float)a3;
- (void)setMinimumDistance:(float)a3;
- (void)setTarget:(id)a3;
- (void)setTargetDirection:(VFXDistanceConstraint *)self;
@end

@implementation VFXDistanceConstraint

- (VFXDistanceConstraint)init
{
  v10.receiver = self;
  v10.super_class = (Class)VFXDistanceConstraint;
  v2 = [(VFXConstraint *)&v10 init];
  if (v2)
  {
    *(int32x2_t *)&double v3 = sub_1B66097BC();
    v2->_maximumDistance = 3.4028e38;
    v2->super._constraintRef = v4;
    v2->_minimumDistance = 0.0;
    v2->_maximumDirectionAngle = 360.0;
    objc_msgSend_localFront(VFXNode, v5, v6, v7, v3);
    *(_OWORD *)v2->_targetDirection = v8;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXDistanceConstraint;
  [(VFXConstraint *)&v3 dealloc];
}

+ (id)distanceConstraint
{
  v2 = objc_alloc_init(VFXDistanceConstraint);

  return v2;
}

+ (id)distanceConstraintWithTarget:(id)a3
{
  v4 = objc_alloc_init(VFXDistanceConstraint);
  objc_msgSend_setTarget_(v4, v5, (uint64_t)a3, v6);
  return v4;
}

- (VFXNode)target
{
  return self->_target;
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
    v13[2] = sub_1B6613224;
    v13[3] = &unk_1E61412A8;
    v13[4] = self;
    v13[5] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (__n128)targetDirection
{
  return a1[5];
}

- (void)setTargetDirection:(VFXDistanceConstraint *)self
{
  long long v8 = v4;
  *(_OWORD *)self->_targetDirection = v4;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66132F0;
  v9[3] = &unk_1E61412D0;
  uint64_t v11 = self;
  long long v10 = v8;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, @"targetDirection", v9);
}

- (BOOL)keepTargetDirection
{
  return self->_keepTargetDirection;
}

- (void)setKeepTargetDirection:(BOOL)a3
{
  self->_keepTargetDirection = a3;
  uint64_t v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B66133C0;
  v8[3] = &unk_1E6141190;
  v8[4] = self;
  BOOL v9 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (float)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(float)a3
{
  self->_minimumDistance = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6613498;
  v9[3] = &unk_1E6141208;
  void v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"minimumDistance", v9);
}

- (float)maximumDistance
{
  return self->_maximumDistance;
}

- (void)setMaximumDistance:(float)a3
{
  self->_maximumDistance = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6613570;
  v9[3] = &unk_1E6141208;
  void v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"maximumDistance", v9);
}

- (void)retargetWithRemapTable:(__CFDictionary *)a3
{
  Value = CFDictionaryGetValue(a3, self->_target);
  if (Value)
  {
    objc_msgSend_setTarget_(self, v5, (uint64_t)Value, v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_target(self, v5, v6, v7);
  objc_msgSend_setTarget_(v4, v9, v8, v10);
  objc_msgSend_maximumDistance(self, v11, v12, v13);
  objc_msgSend_setMaximumDistance_(v4, v14, v15, v16);
  objc_msgSend_minimumDistance(self, v17, v18, v19);
  objc_msgSend_setMinimumDistance_(v4, v20, v21, v22);
  objc_msgSend_copyTo_(self, v23, (uint64_t)v4, v24);
  return v4;
}

- (void)_customEncodingOfVFXDistanceConstraint:(id)a3
{
  target = self->_target;
  if (target) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)target, @"target");
  }
}

- (void)_customDecodingOfVFXDistanceConstraint:(id)a3
{
  sub_1B66097BC();
  self->super._constraintRef = v5;
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v7, v6, @"target");
  objc_msgSend_setTarget_(self, v9, v8, v10);

  objc_msgSend_finalizeDecodeConstraint_(self, v11, (uint64_t)a3, v12);
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VFXDistanceConstraint;
  -[VFXConstraint encodeWithCoder:](&v13, sel_encodeWithCoder_);
  objc_msgSend__customEncodingOfVFXDistanceConstraint_(self, v5, (uint64_t)a3, v6);
  *(float *)&double v7 = self->_minimumDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v8, @"minimumDistance", v9, v7);
  *(float *)&double v10 = self->_maximumDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v11, @"maximumDistance", v12, v10);
}

- (VFXDistanceConstraint)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VFXDistanceConstraint;
  double v7 = -[VFXConstraint initWithCoder:](&v26, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend__customDecodingOfVFXDistanceConstraint_(v7, v11, (uint64_t)a3, v12);
    objc_msgSend_decodeFloatForKey_(a3, v13, @"minimumDistance", v14);
    objc_msgSend_setMinimumDistance_(v7, v15, v16, v17);
    objc_msgSend_decodeFloatForKey_(a3, v18, @"maximumDistance", v19);
    objc_msgSend_setMaximumDistance_(v7, v20, v21, v22);
    objc_msgSend_setImmediateMode_(VFXTransaction, v23, v8, v24);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end