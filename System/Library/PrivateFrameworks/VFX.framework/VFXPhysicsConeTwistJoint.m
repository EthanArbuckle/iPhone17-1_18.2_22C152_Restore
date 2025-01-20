@interface VFXPhysicsConeTwistJoint
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBody:(double)a3 frame:(double)a4;
+ (id)jointWithBodyA:(double)a3 frameA:(double)a4 bodyB:(double)a5 frameB:(double)a6;
- (VFXPhysicsConeTwistJoint)init;
- (VFXPhysicsConeTwistJoint)initWithBodyA:(__n128)a3 frameA:(__n128)a4 bodyB:(__n128)a5 frameB:(__n128)a6;
- (VFXPhysicsConeTwistJoint)initWithCoder:(id)a3;
- (__n128)frameA;
- (__n128)frameB;
- (__n128)initWithBody:(__n128)a3 frame:(__n128)a4;
- (btTypedConstraint)_createConstraint;
- (float)maximumAngularLimit1;
- (float)maximumAngularLimit2;
- (float)maximumTwistAngle;
- (id)valueForKey:(id)a3;
- (uint64_t)setFrameA:(uint64_t)a3;
- (uint64_t)setFrameB:(uint64_t)a3;
- (void)copyFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMaximumAngularLimit1:(float)a3;
- (void)setMaximumAngularLimit2:(float)a3;
- (void)setMaximumTwistAngle:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXPhysicsConeTwistJoint

- (VFXPhysicsConeTwistJoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsConeTwistJoint;
  result = [(VFXPhysicsConeTwistJoint *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_definition.maximumAngularLimit1 = xmmword_1B6E4F300;
    *(_OWORD *)&result[1].super.super.isa = xmmword_1B6E4F320;
    *(_OWORD *)&result[1].super._constraint = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B6E4F370;
    *(_OWORD *)&result[1]._definition.maximumAngularLimit1 = xmmword_1B6E4F300;
    *(_OWORD *)&result[2].super.super.isa = xmmword_1B6E4F320;
    *(_OWORD *)&result[2].super._constraint = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[2].super._bodyB = xmmword_1B6E4F370;
    *(int32x2_t *)&result[2]._definition.maximumAngularLimit1 = vdup_n_s32(0x3F490FDBu);
    result[2]._definition.maximumTwistAngle = 0.7854;
  }
  return result;
}

- (VFXPhysicsConeTwistJoint)initWithBodyA:(__n128)a3 frameA:(__n128)a4 bodyB:(__n128)a5 frameB:(__n128)a6
{
  v29.receiver = a1;
  v29.super_class = (Class)VFXPhysicsConeTwistJoint;
  v14 = [(VFXPhysicsConeTwistJoint *)&v29 init];
  v17 = v14;
  if (v14)
  {
    objc_msgSend_setBodyA_(v14, v15, a11, v16);
    *(__n128 *)&v17->_definition.maximumAngularLimit1 = a2;
    *(__n128 *)&v17[1].super.super.isa = a3;
    *(__n128 *)&v17[1].super._constraint = a4;
    *(__n128 *)&v17[1].super._bodyB = a5;
    objc_msgSend_setBodyB_(v17, v18, a12, v19);
    *(__n128 *)&v17[1]._definition.maximumAngularLimit1 = a6;
    *(__n128 *)&v17[2].super.super.isa = a7;
    *(__n128 *)&v17[2].super._constraint = a8;
    *(__n128 *)&v17[2].super._bodyB = a9;
    *(int32x2_t *)&v17[2]._definition.maximumAngularLimit1 = vdup_n_s32(0x3F490FDBu);
    v17[2]._definition.maximumTwistAngle = 0.7854;
  }
  return v17;
}

- (__n128)initWithBody:(__n128)a3 frame:(__n128)a4
{
  v17.receiver = a1;
  v17.super_class = (Class)VFXPhysicsConeTwistJoint;
  v8 = [(VFXPhysicsConeTwistJoint *)&v17 init];
  v11 = (__n128 *)v8;
  if (v8)
  {
    objc_msgSend_setBodyA_(v8, v9, a7, v10);
    v11[3] = a2;
    v11[4] = a3;
    v11[5] = a4;
    v11[6] = a5;
  }
  return v11;
}

+ (id)jointWithBodyA:(double)a3 frameA:(double)a4 bodyB:(double)a5 frameB:(double)a6
{
  id v14 = [a1 alloc];
  uint64_t v16 = objc_msgSend_initWithBodyA_frameA_bodyB_frameB_(v14, v15, a11, a12, a2, a3, a4, a5, a6, a7, a8, a9);

  return v16;
}

+ (id)jointWithBody:(double)a3 frame:(double)a4
{
  id v8 = [a1 alloc];
  v11 = objc_msgSend_initWithBody_frame_(v8, v9, a7, v10, a2, a3, a4, a5);

  return v11;
}

- (void)copyFrom:(id)a3
{
  *(_OWORD *)&self->_definition.maximumAngularLimit1 = *((_OWORD *)a3 + 3);
  long long v3 = *((_OWORD *)a3 + 7);
  long long v5 = *((_OWORD *)a3 + 4);
  long long v4 = *((_OWORD *)a3 + 5);
  *(_OWORD *)&self[1].super._bodyB = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self[1]._definition.maximumAngularLimit1 = v3;
  *(_OWORD *)&self[1].super.super.isa = v5;
  *(_OWORD *)&self[1].super._constraint = v4;
  long long v6 = *((_OWORD *)a3 + 11);
  long long v8 = *((_OWORD *)a3 + 8);
  long long v7 = *((_OWORD *)a3 + 9);
  *(_OWORD *)&self[2].super._bodyB = *((_OWORD *)a3 + 10);
  *(_OWORD *)&self[2]._definition.maximumAngularLimit1 = v6;
  *(_OWORD *)&self[2].super.super.isa = v8;
  *(_OWORD *)&self[2].super._constraint = v7;
}

- (__n128)frameA
{
  return a1[3];
}

- (uint64_t)setFrameA:(uint64_t)a3
{
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
  a1[6] = a8;
  v9 = objc_msgSend_physicsWorld(a1, a2, a3, a4);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B644D444;
  v17[3] = &unk_1E6141FF8;
  v22 = a1;
  __n128 v18 = a5;
  __n128 v19 = a6;
  __n128 v20 = a7;
  __n128 v21 = a8;
  return objc_msgSend__postCommandWithBlock_(v9, v10, (uint64_t)v17, v11);
}

- (__n128)frameB
{
  return a1[3];
}

- (uint64_t)setFrameB:(uint64_t)a3
{
  a1[7] = a5;
  a1[8] = a6;
  a1[9] = a7;
  a1[10] = a8;
  v9 = objc_msgSend_physicsWorld(a1, a2, a3, a4);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B644D624;
  v17[3] = &unk_1E6141FF8;
  v22 = a1;
  __n128 v18 = a5;
  __n128 v19 = a6;
  __n128 v20 = a7;
  __n128 v21 = a8;
  return objc_msgSend__postCommandWithBlock_(v9, v10, (uint64_t)v17, v11);
}

- (float)maximumAngularLimit1
{
  return self[2]._definition.maximumAngularLimit1;
}

- (void)setMaximumAngularLimit1:(float)a3
{
  self[2]._definition.maximumAngularLimit1 = a3;
  long long v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B644D7EC;
  v10[3] = &unk_1E6141208;
  v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumAngularLimit2
{
  return self[2]._definition.maximumAngularLimit2;
}

- (void)setMaximumAngularLimit2:(float)a3
{
  self[2]._definition.maximumAngularLimit2 = a3;
  long long v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B644D900;
  v10[3] = &unk_1E6141208;
  v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumTwistAngle
{
  return self[2]._definition.maximumTwistAngle;
}

- (void)setMaximumTwistAngle:(float)a3
{
  self[2]._definition.maximumTwistAngle = a3;
  long long v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B644DA18;
  v10[3] = &unk_1E6141208;
  v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (btTypedConstraint)_createConstraint
{
  p_definition = &self->_definition;
  long long v6 = objc_msgSend_bodyA(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_bodyB(self, v7, v8, v9);

  return (btTypedConstraint *)sub_1B644CEA0((uint64_t)p_definition, v6, v10, v11);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = self;
  v14.receiver = self;
  v14.super_class = (Class)VFXPhysicsConeTwistJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v14, sel_encodeWithCoder_);
  uint64_t v4 = (VFXPhysicsConeTwistJoint *)((char *)v4 + 48);
  LODWORD(v5) = v4[2].super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v6, @"maximumAngularLimit1", v7, v5);
  LODWORD(v8) = HIDWORD(v4[2].super.super.isa);
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"maximumAngularLimit2", v10, v8);
  LODWORD(v11) = v4[2].super._physicsWorld;
  objc_msgSend_encodeFloat_forKey_(a3, v12, @"maximumTwistAngle", v13, v11);
}

- (VFXPhysicsConeTwistJoint)initWithCoder:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)VFXPhysicsConeTwistJoint;
  uint64_t v7 = -[VFXPhysicsJoint initWithCoder:](&v23, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeFloatForKey_(a3, v11, @"maximumAngularLimit1", v12);
    v7[2]._definition.maximumAngularLimit1 = v13;
    objc_msgSend_decodeFloatForKey_(a3, v14, @"maximumAngularLimit2", v15);
    v7[2]._definition.maximumAngularLimit2 = v16;
    objc_msgSend_decodeFloatForKey_(a3, v17, @"maximumTwistAngle", v18);
    v7[2]._definition.maximumTwistAngle = v19;
    objc_msgSend_setImmediateMode_(VFXTransaction, v20, v8, v21);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"frameA", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_frameA(self, v6, v7, v8);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v6, @"frameB", v8))
    {
      v17.receiver = self;
      v17.super_class = (Class)VFXPhysicsConeTwistJoint;
      return [(VFXPhysicsConeTwistJoint *)&v17 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_frameB(self, v13, v14, v15);
  }

  return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"frameA", (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    MEMORY[0x1F4181798](self, sel_setFrameA_, v10, v11);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"frameB", v9))
  {
    objc_msgSend_VFXMatrix4Value(a3, v12, v13, v14);
    MEMORY[0x1F4181798](self, sel_setFrameB_, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXPhysicsConeTwistJoint;
    [(VFXPhysicsConeTwistJoint *)&v17 setValue:a3 forKey:a4];
  }
}

@end