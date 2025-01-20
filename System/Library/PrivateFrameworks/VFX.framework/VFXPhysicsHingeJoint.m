@interface VFXPhysicsHingeJoint
+ (BOOL)supportsSecureCoding;
+ (id)hingeWithBody:(id)a3 axis:(id)a4 anchor:(id)a5;
+ (id)hingeWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8;
+ (id)jointWithBody:(id)a1 axis:(SEL)a2 anchor:(id)a3;
+ (id)jointWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:;
- (VFXPhysicsHingeJoint)init;
- (VFXPhysicsHingeJoint)initWithBody:(VFXPhysicsHingeJoint *)self axis:(SEL)a2 anchor:(id)a3;
- (VFXPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:;
- (VFXPhysicsHingeJoint)initWithCoder:(id)a3;
- (__n128)anchorA;
- (__n128)anchorB;
- (__n128)axisA;
- (__n128)axisB;
- (btTypedConstraint)_createConstraint;
- (id)anchorAValue;
- (id)anchorBValue;
- (id)axisAValue;
- (id)axisBValue;
- (id)valueForKey:(id)a3;
- (void)copyFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorA:(VFXPhysicsHingeJoint *)self;
- (void)setAnchorAValue:(id)a3;
- (void)setAnchorB:(VFXPhysicsHingeJoint *)self;
- (void)setAnchorBValue:(id)a3;
- (void)setAxisA:(VFXPhysicsHingeJoint *)self;
- (void)setAxisAValue:(id)a3;
- (void)setAxisB:(VFXPhysicsHingeJoint *)self;
- (void)setAxisBValue:(id)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXPhysicsHingeJoint

+ (id)hingeWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8
{
  v15 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = objc_msgSend_objectAtIndexedSubscript_(a4, v19, 1, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = objc_msgSend_objectAtIndexedSubscript_(a4, v25, 2, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = objc_msgSend_objectAtIndexedSubscript_(a5, v31, 0, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = objc_msgSend_objectAtIndexedSubscript_(a5, v37, 1, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  v45 = objc_msgSend_objectAtIndexedSubscript_(a5, v43, 2, v44);
  objc_msgSend_floatValue(v45, v46, v47, v48);
  v51 = objc_msgSend_objectAtIndexedSubscript_(a7, v49, 0, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54);
  v57 = objc_msgSend_objectAtIndexedSubscript_(a7, v55, 1, v56);
  objc_msgSend_floatValue(v57, v58, v59, v60);
  v63 = objc_msgSend_objectAtIndexedSubscript_(a7, v61, 2, v62);
  objc_msgSend_floatValue(v63, v64, v65, v66);
  v69 = objc_msgSend_objectAtIndexedSubscript_(a8, v67, 0, v68);
  objc_msgSend_floatValue(v69, v70, v71, v72);
  v75 = objc_msgSend_objectAtIndexedSubscript_(a8, v73, 1, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  v81 = objc_msgSend_objectAtIndexedSubscript_(a8, v79, 2, v80);
  objc_msgSend_floatValue(v81, v82, v83, v84);

  return (id)MEMORY[0x1F4181798](a1, sel_jointWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_, a3, a6);
}

+ (id)hingeWithBody:(id)a3 axis:(id)a4 anchor:(id)a5
{
  v9 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  v15 = objc_msgSend_objectAtIndexedSubscript_(a4, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = objc_msgSend_objectAtIndexedSubscript_(a4, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = objc_msgSend_objectAtIndexedSubscript_(a5, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = objc_msgSend_objectAtIndexedSubscript_(a5, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = objc_msgSend_objectAtIndexedSubscript_(a5, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);

  return (id)MEMORY[0x1F4181798](a1, sel_jointWithBody_axis_anchor_, a3, v43);
}

- (id)axisAValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_axisA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_axisA(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_axisA(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAxisAValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAxisA_, v22, v23);
}

- (id)anchorAValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_anchorA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_anchorA(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_anchorA(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAnchorAValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAnchorA_, v22, v23);
}

- (id)axisBValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_axisB(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_axisB(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_axisB(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAxisBValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAxisB_, v22, v23);
}

- (id)anchorBValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_anchorB(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = NSNumber;
  objc_msgSend_anchorB(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_anchorB(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAnchorBValue:(id)a3
{
  v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAnchorB_, v22, v23);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VFXPhysicsHingeJoint;
  [(VFXPhysicsJoint *)&v2 dealloc];
}

- (VFXPhysicsHingeJoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsHingeJoint;
  result = [(VFXPhysicsHingeJoint *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[2].super.super.isa = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[1].super.super.isa = 0u;
    *(_OWORD *)&result[1].super._constraint = 0u;
  }
  return result;
}

- (void)copyFrom:(id)a3
{
  long long v3 = *((_OWORD *)a3 + 6);
  long long v5 = *((_OWORD *)a3 + 3);
  long long v4 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super._bodyB = *((_OWORD *)a3 + 5);
  *(_OWORD *)&self[2].super.super.isa = v3;
  *(_OWORD *)&self[1].super.super.isa = v5;
  *(_OWORD *)&self[1].super._constraint = v4;
}

- (VFXPhysicsHingeJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  long long v19 = v6;
  long long v20 = v7;
  long long v17 = v4;
  long long v18 = v5;
  v21.receiver = self;
  v21.super_class = (Class)VFXPhysicsHingeJoint;
  v10 = [(VFXPhysicsHingeJoint *)&v21 init];
  uint64_t v13 = v10;
  if (v10)
  {
    objc_msgSend_setBodyA_(v10, v11, (uint64_t)a3, v12);
    *(_OWORD *)&v13[1].super._bodyB = v17;
    *(_OWORD *)&v13[1].super.super.isa = v18;
    objc_msgSend_setBodyB_(v13, v14, (uint64_t)a4, v15);
    *(_OWORD *)&v13[2].super.super.isa = v19;
    *(_OWORD *)&v13[1].super._constraint = v20;
  }
  return v13;
}

- (VFXPhysicsHingeJoint)initWithBody:(VFXPhysicsHingeJoint *)self axis:(SEL)a2 anchor:(id)a3
{
  return (VFXPhysicsHingeJoint *)objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(self, a2, (uint64_t)a3, 0);
}

+ (id)jointWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  double v17 = v7;
  double v15 = v5;
  double v16 = v6;
  double v14 = v4;
  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(v10, v11, (uint64_t)a3, (uint64_t)a4, v14, v15, v16, v17);

  return v12;
}

+ (id)jointWithBody:(id)a1 axis:(SEL)a2 anchor:(id)a3
{
  double v11 = v3;
  double v12 = v4;
  id v6 = objc_alloc((Class)a1);
  uint64_t v9 = objc_msgSend_initWithBody_axis_anchor_(v6, v7, (uint64_t)a3, v8, v11, v12);

  return v9;
}

- (__n128)axisA
{
  return a1[5];
}

- (void)setAxisA:(VFXPhysicsHingeJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super._bodyB = v4;
  id v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B662C928;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)axisB
{
  return a1[6];
}

- (void)setAxisB:(VFXPhysicsHingeJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[2].super.super.isa = v4;
  id v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B662CF14;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorA
{
  return a1[3];
}

- (void)setAnchorA:(VFXPhysicsHingeJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  id v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B662D008;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[4];
}

- (void)setAnchorB:(VFXPhysicsHingeJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  id v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B662D11C;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (btTypedConstraint)_createConstraint
{
  double v5 = objc_msgSend_bodyA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_bodyB(self, v6, v7, v8);
  if (!v5) {
    return 0;
  }
  uint64_t v13 = (void *)v9;
  double v14 = self + 1;
  uint64_t v18 = objc_msgSend__handle(v5, v10, v11, v12);
  int v19 = *(_DWORD *)v14->_anon_28;
  bodyB = v14->super._bodyB;
  int v36 = v19;
  int v37 = 0;
  int physicsWorld = (int)v14->super._physicsWorld;
  Class isa = v14->super.super.isa;
  int v33 = physicsWorld;
  int v34 = 0;
  if (v13)
  {
    uint64_t v21 = objc_msgSend__handle(v13, v15, v16, v17);
    int v22 = (int)v14[1].super._physicsWorld;
    Class v29 = v14[1].super.super.isa;
    int v30 = v22;
    int v31 = 0;
    int bodyA = (int)v14->super._bodyA;
    constraint = v14->super._constraint;
    int v27 = bodyA;
    int v28 = 0;
    uint64_t v24 = (btTypedConstraint *)sub_1B6E073B8(880, 16);
    ((void (*)(btTypedConstraint *, uint64_t, uint64_t, Class *, btTypedConstraint **, VFXPhysicsBody **, Class *, void))sub_1B6DFA21C)(v24, v18, v21, &isa, &constraint, &bodyB, &v29, 0);
  }
  else
  {
    uint64_t v24 = (btTypedConstraint *)sub_1B6E073B8(880, 16);
    sub_1B6DFA618(v24, v18, &isa, &bodyB, 0);
  }
  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  long long v4 = (__n128 *)self;
  v5.receiver = self;
  v5.super_class = (Class)VFXPhysicsHingeJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v5, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B64FA2F4(a3, (const char *)@"axisA", v4[2]);
  sub_1B64FA2F4(a3, (const char *)@"axisB", v4[3]);
  sub_1B64FA2F4(a3, (const char *)@"anchorA", *v4);
  sub_1B64FA2F4(a3, (const char *)@"anchorB", v4[1]);
}

- (VFXPhysicsHingeJoint)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)VFXPhysicsHingeJoint;
  uint64_t v7 = -[VFXPhysicsJoint initWithCoder:](&v18, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&long long v11 = sub_1B64FA42C(a3, (const char *)@"axisA");
    *(_OWORD *)&v7[1].super._bodyB = v11;
    *(double *)&long long v12 = sub_1B64FA42C(a3, (const char *)@"axisB");
    *(_OWORD *)&v7[2].super.super.Class isa = v12;
    *(double *)&long long v13 = sub_1B64FA42C(a3, (const char *)@"anchorA");
    *(_OWORD *)&v7[1].super.super.Class isa = v13;
    *(double *)&long long v14 = sub_1B64FA42C(a3, (const char *)@"anchorB");
    *(_OWORD *)&v7[1].super._constraint = v14;
    objc_msgSend_setImmediateMode_(VFXTransaction, v15, v8, v16);
  }
  return v7;
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"axisA", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_axisA(self, v6, v7, v8);
  }
  else if (objc_msgSend_isEqualToString_(a3, v6, @"axisB", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_axisB(self, v13, v14, v15);
  }
  else if (objc_msgSend_isEqualToString_(a3, v13, @"anchorA", v15))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_anchorA(self, v16, v17, v18);
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(a3, v16, @"anchorB", v18))
    {
      v23.receiver = self;
      v23.super_class = (Class)VFXPhysicsHingeJoint;
      return [(VFXPhysicsHingeJoint *)&v23 valueForKey:a3];
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_anchorB(self, v19, v20, v21);
  }

  return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"axisA", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    MEMORY[0x1F4181798](self, sel_setAxisA_, v10, v11);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"axisB", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v12, v13, v14);
    MEMORY[0x1F4181798](self, sel_setAxisB_, v15, v16);
  }
  else if (objc_msgSend_isEqualToString_(a4, v12, @"anchorA", v14))
  {
    objc_msgSend_VFXFloat3Value(a3, v17, v18, v19);
    MEMORY[0x1F4181798](self, sel_setAnchorA_, v20, v21);
  }
  else if (objc_msgSend_isEqualToString_(a4, v17, @"anchorB", v19))
  {
    objc_msgSend_VFXFloat3Value(a3, v22, v23, v24);
    MEMORY[0x1F4181798](self, sel_setAnchorB_, v25, v26);
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)VFXPhysicsHingeJoint;
    [(VFXPhysicsHingeJoint *)&v27 setValue:a3 forKey:a4];
  }
}

@end