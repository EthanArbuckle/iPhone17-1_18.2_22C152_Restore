@interface VFXAccelerationConstraint
+ (BOOL)supportsSecureCoding;
+ (id)accelerationConstraint;
- (VFXAccelerationConstraint)init;
- (VFXAccelerationConstraint)initWithCoder:(id)a3;
- (float)damping;
- (float)decelerationDistance;
- (float)maximumLinearAcceleration;
- (float)maximumLinearVelocity;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDamping:(float)a3;
- (void)setDecelerationDistance:(float)a3;
- (void)setMaximumLinearAcceleration:(float)a3;
- (void)setMaximumLinearVelocity:(float)a3;
@end

@implementation VFXAccelerationConstraint

- (VFXAccelerationConstraint)init
{
  v5.receiver = self;
  v5.super_class = (Class)VFXAccelerationConstraint;
  v2 = [(VFXConstraint *)&v5 init];
  if (v2)
  {
    sub_1B6609E20();
    v2->_maximumLinearAcceleration = 3.4028e38;
    v2->_maximumLinearVelocity = 3.4028e38;
    v2->super._constraintRef = v3;
    v2->_damping = 0.1;
  }
  return v2;
}

+ (id)accelerationConstraint
{
  v2 = objc_alloc_init(VFXAccelerationConstraint);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_maximumLinearVelocity(self, v5, v6, v7);
  objc_msgSend_setMaximumLinearVelocity_(v4, v8, v9, v10);
  objc_msgSend_maximumLinearAcceleration(self, v11, v12, v13);
  objc_msgSend_setMaximumLinearAcceleration_(v4, v14, v15, v16);
  objc_msgSend_decelerationDistance(self, v17, v18, v19);
  objc_msgSend_setDecelerationDistance_(v4, v20, v21, v22);
  objc_msgSend_damping(self, v23, v24, v25);
  objc_msgSend_setDamping_(v4, v26, v27, v28);
  objc_msgSend_copyTo_(self, v29, (uint64_t)v4, v30);
  return v4;
}

- (float)maximumLinearVelocity
{
  return self->_maximumLinearVelocity;
}

- (void)setMaximumLinearVelocity:(float)a3
{
  self->_maximumLinearVelocity = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6614724;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"maximumLinearVelocity", v9);
}

- (float)maximumLinearAcceleration
{
  return self->_maximumLinearAcceleration;
}

- (void)setMaximumLinearAcceleration:(float)a3
{
  self->_maximumLinearAcceleration = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66147FC;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"maximumLinearAcceleration", v9);
}

- (void)setDecelerationDistance:(float)a3
{
  self->_decelerationDistance = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66148C4;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"decelerationDistance", v9);
}

- (float)decelerationDistance
{
  return self->_decelerationDistance;
}

- (float)damping
{
  return self->_damping;
}

- (void)setDamping:(float)a3
{
  self->_damping = a3;
  uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B66149AC;
  v9[3] = &unk_1E6141208;
  v9[4] = self;
  float v10 = a3;
  objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, @"damping", v9);
}

- (void)encodeWithCoder:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VFXAccelerationConstraint;
  -[VFXConstraint encodeWithCoder:](&v17, sel_encodeWithCoder_);
  *(float *)&double v5 = self->_maximumLinearVelocity;
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"maximumLinearVelocity", v7, v5);
  *(float *)&double v8 = self->_maximumLinearAcceleration;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"maximumLinearAcceleration", v10, v8);
  *(float *)&double v11 = self->_decelerationDistance;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"decelerationDistance", v13, v11);
  *(float *)&double v14 = self->_damping;
  objc_msgSend_encodeFloat_forKey_(a3, v15, @"damping", v16, v14);
}

- (VFXAccelerationConstraint)initWithCoder:(id)a3
{
  v38.receiver = self;
  v38.super_class = (Class)VFXAccelerationConstraint;
  uint64_t v7 = -[VFXConstraint initWithCoder:](&v38, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    double v11 = sub_1B6609E20();
    v7->super._constraintRef = v12;
    objc_msgSend_finalizeDecodeConstraint_(v7, v13, (uint64_t)a3, v14, v11);
    objc_msgSend_decodeFloatForKey_(a3, v15, @"maximumLinearVelocity", v16);
    objc_msgSend_setMaximumLinearVelocity_(v7, v17, v18, v19);
    objc_msgSend_decodeFloatForKey_(a3, v20, @"maximumLinearAcceleration", v21);
    objc_msgSend_setMaximumLinearAcceleration_(v7, v22, v23, v24);
    objc_msgSend_decodeFloatForKey_(a3, v25, @"decelerationDistance", v26);
    objc_msgSend_setDecelerationDistance_(v7, v27, v28, v29);
    objc_msgSend_decodeFloatForKey_(a3, v30, @"damping", v31);
    objc_msgSend_setDamping_(v7, v32, v33, v34);
    objc_msgSend_setImmediateMode_(VFXTransaction, v35, v8, v36);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end