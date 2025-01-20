@interface VFXPhysicsBallSocketJoint
+ (BOOL)supportsSecureCoding;
+ (id)ballSocketWithBody:(id)a3 anchor:(id)a4;
+ (id)ballSocketWithBodyA:(id)a3 anchorA:(id)a4 bodyB:(id)a5 anchorB:(id)a6;
+ (id)jointWithBody:(id)a3 anchor:;
+ (id)jointWithBodyA:(id)a1 anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4;
- (VFXPhysicsBallSocketJoint)init;
- (VFXPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:;
- (VFXPhysicsBallSocketJoint)initWithBodyA:(VFXPhysicsBallSocketJoint *)self anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4;
- (VFXPhysicsBallSocketJoint)initWithCoder:(id)a3;
- (__n128)anchorA;
- (__n128)anchorB;
- (btTypedConstraint)_createConstraint;
- (id)anchorAValue;
- (id)anchorBValue;
- (id)valueForKey:(id)a3;
- (void)copyFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorA:(VFXPhysicsBallSocketJoint *)self;
- (void)setAnchorAValue:(id)a3;
- (void)setAnchorB:(VFXPhysicsBallSocketJoint *)self;
- (void)setAnchorBValue:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXPhysicsBallSocketJoint

- (VFXPhysicsBallSocketJoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsBallSocketJoint;
  return [(VFXPhysicsBallSocketJoint *)&v3 init];
}

- (VFXPhysicsBallSocketJoint)initWithBodyA:(VFXPhysicsBallSocketJoint *)self anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4
{
  long long v15 = v4;
  long long v16 = v5;
  v17.receiver = self;
  v17.super_class = (Class)VFXPhysicsBallSocketJoint;
  v8 = [(VFXPhysicsBallSocketJoint *)&v17 init];
  v11 = v8;
  if (v8)
  {
    objc_msgSend_setBodyA_(v8, v9, (uint64_t)a3, v10);
    *(_OWORD *)&v11[1].super.super.isa = v15;
    objc_msgSend_setBodyB_(v11, v12, (uint64_t)a4, v13);
    *(_OWORD *)&v11[1].super._constraint = v16;
  }
  return v11;
}

- (VFXPhysicsBallSocketJoint)initWithBody:(id)a3 anchor:
{
  long long v10 = v3;
  v11.receiver = self;
  v11.super_class = (Class)VFXPhysicsBallSocketJoint;
  long long v5 = [(VFXPhysicsBallSocketJoint *)&v11 init];
  v8 = v5;
  if (v5)
  {
    objc_msgSend_setBodyA_(v5, v6, (uint64_t)a3, v7);
    *(_OWORD *)&v8[1].super.super.isa = v10;
  }
  return v8;
}

+ (id)jointWithBodyA:(id)a1 anchorA:(SEL)a2 bodyB:(id)a3 anchorB:(id)a4
{
  double v12 = v4;
  double v13 = v5;
  id v8 = objc_alloc((Class)a1);
  long long v10 = objc_msgSend_initWithBodyA_anchorA_bodyB_anchorB_(v8, v9, (uint64_t)a3, (uint64_t)a4, v12, v13);

  return v10;
}

+ (id)jointWithBody:(id)a3 anchor:
{
  double v10 = v3;
  id v5 = objc_alloc((Class)a1);
  id v8 = objc_msgSend_initWithBody_anchor_(v5, v6, (uint64_t)a3, v7, v10);

  return v8;
}

- (void)copyFrom:(id)a3
{
  long long v3 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super.super.isa = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self[1].super._constraint = v3;
}

- (__n128)anchorA
{
  return a1[3];
}

- (void)setAnchorA:(VFXPhysicsBallSocketJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B658660C;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[4];
}

- (void)setAnchorB:(VFXPhysicsBallSocketJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B65866F0;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (btTypedConstraint)_createConstraint
{
  id v5 = self + 1;
  v6 = objc_msgSend_bodyA(self, a2, v2, v3);
  double v10 = objc_msgSend_bodyB(self, v7, v8, v9);

  return (btTypedConstraint *)sub_1B6586274((uint64_t)v5, v6, v10, v11);
}

- (void)encodeWithCoder:(id)a3
{
  long long v4 = (__n128 *)self;
  v5.receiver = self;
  v5.super_class = (Class)VFXPhysicsBallSocketJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B64FA2F4(a3, (const char *)@"anchorA", *v4);
  sub_1B64FA2F4(a3, (const char *)@"anchorB", v4[1]);
}

- (VFXPhysicsBallSocketJoint)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VFXPhysicsBallSocketJoint;
  uint64_t v7 = -[VFXPhysicsJoint initWithCoder:](&v16, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&long long v11 = sub_1B64FA42C(a3, (const char *)@"anchorA");
    *(_OWORD *)&v7[1].super.super.isa = v11;
    *(double *)&long long v12 = sub_1B64FA42C(a3, (const char *)@"anchorB");
    *(_OWORD *)&v7[1].super._constraint = v12;
    objc_msgSend_setImmediateMode_(VFXTransaction, v13, v8, v14);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"anchorA", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_anchorA(self, v6, v7, v8);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v6, @"anchorB", v8))
    {
      v17.receiver = self;
      v17.super_class = (Class)VFXPhysicsBallSocketJoint;
      return [(VFXPhysicsBallSocketJoint *)&v17 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_anchorB(self, v13, v14, v15);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"anchorA", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    MEMORY[0x1F4181798](self, sel_setAnchorA_, v10, v11);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"anchorB", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v12, v13, v14);
    MEMORY[0x1F4181798](self, sel_setAnchorB_, v15, v16);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)VFXPhysicsBallSocketJoint;
    [(VFXPhysicsBallSocketJoint *)&v17 setValue:a3 forKey:a4];
  }
}

- (id)anchorAValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_anchorA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_anchorA(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_anchorA(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAnchorAValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAnchorA_, v22, v23);
}

- (id)anchorBValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_anchorB(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_anchorB(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = NSNumber;
  objc_msgSend_anchorB(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAnchorBValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAnchorB_, v22, v23);
}

+ (id)ballSocketWithBodyA:(id)a3 anchorA:(id)a4 bodyB:(id)a5 anchorB:(id)a6
{
  uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v10, v11, v12, v13);
  uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(a4, v14, 1, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19);
  uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(a4, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  v28 = objc_msgSend_objectAtIndexedSubscript_(a6, v26, 0, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  v34 = objc_msgSend_objectAtIndexedSubscript_(a6, v32, 1, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v40 = objc_msgSend_objectAtIndexedSubscript_(a6, v38, 2, v39);
  objc_msgSend_floatValue(v40, v41, v42, v43);

  return (id)MEMORY[0x1F4181798](VFXPhysicsBallSocketJoint, sel_jointWithBodyA_anchorA_bodyB_anchorB_, a3, a5);
}

+ (id)ballSocketWithBody:(id)a3 anchor:(id)a4
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a4, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a4, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  return (id)MEMORY[0x1F4181798](VFXPhysicsBallSocketJoint, sel_jointWithBody_anchor_, a3, v22);
}

@end