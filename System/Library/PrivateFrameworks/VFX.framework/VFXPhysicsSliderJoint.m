@interface VFXPhysicsSliderJoint
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBody:(id)a1 axis:(SEL)a2 anchor:(id)a3;
+ (id)jointWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:;
+ (id)sliderWithBody:(id)a3 axis:(id)a4 anchor:(id)a5;
+ (id)sliderWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8;
- (VFXPhysicsSliderJoint)init;
- (VFXPhysicsSliderJoint)initWithBody:(VFXPhysicsSliderJoint *)self axis:(SEL)a2 anchor:(id)a3;
- (VFXPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:;
- (VFXPhysicsSliderJoint)initWithCoder:(id)a3;
- (__n128)anchorA;
- (__n128)anchorB;
- (__n128)axisA;
- (__n128)axisB;
- (btTypedConstraint)_createConstraint;
- (float)maximumAngularLimit;
- (float)maximumLinearLimit;
- (float)minimumAngularLimit;
- (float)minimumLinearLimit;
- (float)motorMaximumForce;
- (float)motorMaximumTorque;
- (float)motorTargetAngularVelocity;
- (float)motorTargetLinearVelocity;
- (id)anchorAValue;
- (id)anchorBValue;
- (id)axisAValue;
- (id)axisBValue;
- (id)valueForKey:(id)a3;
- (void)copyFrom:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorA:(VFXPhysicsSliderJoint *)self;
- (void)setAnchorAValue:(id)a3;
- (void)setAnchorB:(VFXPhysicsSliderJoint *)self;
- (void)setAnchorBValue:(id)a3;
- (void)setAxisA:(VFXPhysicsSliderJoint *)self;
- (void)setAxisAValue:(id)a3;
- (void)setAxisB:(VFXPhysicsSliderJoint *)self;
- (void)setAxisBValue:(id)a3;
- (void)setMaximumAngularLimit:(float)a3;
- (void)setMaximumLinearLimit:(float)a3;
- (void)setMinimumAngularLimit:(float)a3;
- (void)setMinimumLinearLimit:(float)a3;
- (void)setMotorMaximumForce:(float)a3;
- (void)setMotorMaximumTorque:(float)a3;
- (void)setMotorTargetAngularVelocity:(float)a3;
- (void)setMotorTargetLinearVelocity:(float)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation VFXPhysicsSliderJoint

- (VFXPhysicsSliderJoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsSliderJoint;
  result = [(VFXPhysicsSliderJoint *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result[1].super.super.isa = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[1].super._bodyB = xmmword_1B6E4F2E0;
    *(_OWORD *)&result[2].super._constraint = xmmword_1B6E51C30;
    *(_DWORD *)&result[2]._anon_28[4] = 1065353216;
    HIDWORD(result[2].super._bodyB) = 1065353216;
  }
  return result;
}

- (VFXPhysicsSliderJoint)initWithBodyA:(id)a3 axisA:(id)a4 anchorA:bodyB:axisB:anchorB:
{
  long long v19 = v6;
  long long v20 = v7;
  long long v17 = v4;
  long long v18 = v5;
  v21.receiver = self;
  v21.super_class = (Class)VFXPhysicsSliderJoint;
  v10 = [(VFXPhysicsSliderJoint *)&v21 init];
  v13 = v10;
  if (v10)
  {
    objc_msgSend_setBodyA_(v10, v11, (uint64_t)a3, v12);
    *(_OWORD *)&v13[1].super.super.isa = v17;
    *(_OWORD *)&v13[1].super._constraint = v18;
    objc_msgSend_setBodyB_(v13, v14, (uint64_t)a4, v15);
    *(_OWORD *)&v13[1].super._bodyB = v19;
    *(_OWORD *)&v13[2].super.super.isa = v20;
    *(_OWORD *)&v13[2].super._constraint = xmmword_1B6E51C30;
    *(_DWORD *)&v13[2]._anon_28[4] = 1065353216;
    HIDWORD(v13[2].super._bodyB) = 1065353216;
  }
  return v13;
}

- (VFXPhysicsSliderJoint)initWithBody:(VFXPhysicsSliderJoint *)self axis:(SEL)a2 anchor:(id)a3
{
  return (VFXPhysicsSliderJoint *)objc_msgSend_initWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_(self, a2, (uint64_t)a3, 0);
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
  v9 = objc_msgSend_initWithBody_axis_anchor_(v6, v7, (uint64_t)a3, v8, v11, v12);

  return v9;
}

- (void)copyFrom:(id)a3
{
  long long v3 = *((_OWORD *)a3 + 4);
  *(_OWORD *)&self[1].super.super.isa = *((_OWORD *)a3 + 3);
  *(_OWORD *)&self[1].super._constraint = v3;
  long long v4 = *((_OWORD *)a3 + 8);
  long long v6 = *((_OWORD *)a3 + 5);
  long long v5 = *((_OWORD *)a3 + 6);
  *(_OWORD *)&self[2].super._constraint = *((_OWORD *)a3 + 7);
  *(_OWORD *)&self[2].super._bodyB = v4;
  *(_OWORD *)&self[1].super._bodyB = v6;
  *(_OWORD *)&self[2].super.super.isa = v5;
}

- (__n128)axisA
{
  return a1[3];
}

- (void)setAxisA:(VFXPhysicsSliderJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super.super.isa = v4;
  long long v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F5D08;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)axisB
{
  return a1[5];
}

- (void)setAxisB:(VFXPhysicsSliderJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super._bodyB = v4;
  long long v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F5EEC;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorA
{
  return a1[4];
}

- (void)setAnchorA:(VFXPhysicsSliderJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[1].super._constraint = v4;
  long long v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F60D0;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (__n128)anchorB
{
  return a1[5];
}

- (void)setAnchorB:(VFXPhysicsSliderJoint *)self
{
  long long v9 = v4;
  *(_OWORD *)&self[2].super.super.isa = v4;
  long long v6 = objc_msgSend_physicsWorld(self, a2, v2, v3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6208;
  v10[3] = &unk_1E61412D0;
  double v12 = self;
  long long v11 = v9;
  objc_msgSend__postCommandWithBlock_(v6, v7, (uint64_t)v10, v8);
}

- (float)minimumLinearLimit
{
  return *(float *)&self[2].super._constraint;
}

- (void)setMinimumLinearLimit:(float)a3
{
  *(float *)&self[2].super._constraint = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6344;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumLinearLimit
{
  return *((float *)&self[2].super._constraint + 1);
}

- (void)setMaximumLinearLimit:(float)a3
{
  *((float *)&self[2].super._constraint + 1) = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6428;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)minimumAngularLimit
{
  return *(float *)&self[2].super._bodyA;
}

- (void)setMinimumAngularLimit:(float)a3
{
  *(float *)&self[2].super._bodyA = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F650C;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)maximumAngularLimit
{
  return *((float *)&self[2].super._bodyA + 1);
}

- (void)setMaximumAngularLimit:(float)a3
{
  *((float *)&self[2].super._bodyA + 1) = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6640;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorTargetLinearVelocity
{
  return *(float *)&self[2].super._bodyB;
}

- (void)setMotorTargetLinearVelocity:(float)a3
{
  *(float *)&self[2].super._bodyB = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6774;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorMaximumForce
{
  return *((float *)&self[2].super._bodyB + 1);
}

- (void)setMotorMaximumForce:(float)a3
{
  *((float *)&self[2].super._bodyB + 1) = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6864;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorTargetAngularVelocity
{
  return *(float *)self[2]._anon_28;
}

- (void)setMotorTargetAngularVelocity:(float)a3
{
  *(float *)self[2]._anon_28 = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6948;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (float)motorMaximumTorque
{
  return *(float *)&self[2]._anon_28[4];
}

- (void)setMotorMaximumTorque:(float)a3
{
  *(float *)&self[2]._anon_28[4] = a3;
  double v7 = objc_msgSend_physicsWorld(self, a2, v3, v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B64F6A38;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend__postCommandWithBlock_(v7, v8, (uint64_t)v10, v9);
}

- (btTypedConstraint)_createConstraint
{
  long long v5 = objc_msgSend_bodyA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_bodyB(self, v6, v7, v8);
  if (!v5) {
    return 0;
  }
  v13 = (void *)v9;
  double v14 = self + 1;
  long long v15 = *(_OWORD *)&self[1].super._constraint;
  HIDWORD(v15) = 0;
  long long v78 = v15;
  float v16 = *((float *)&self[1].super.super.isa + 1);
  float v17 = *(float *)&self[1].super._physicsWorld;
  BOOL v18 = fabsf(v17) <= 0.70711;
  *(float *)&long long v15 = (float)(v16 * v16) + (float)(*(float *)&self[1].super.super.isa * *(float *)&self[1].super.super.isa);
  float v19 = 1.0 / sqrtf(*(float *)&v15);
  float v20 = -(float)(v16 * v19);
  float v21 = *(float *)&self[1].super.super.isa * v19;
  float v22 = -(float)(v17 * v21);
  float v23 = v17 * v20;
  float v24 = *(float *)&v15 * v19;
  float v25 = 0.0;
  float v26 = (float)(v17 * v17) + (float)(v16 * v16);
  float v27 = 1.0 / sqrtf(v26);
  float v28 = -(float)(v17 * v27);
  float v29 = v16 * v27;
  float v30 = v26 * v27;
  float v31 = -(float)(*(float *)&self[1].super.super.isa * (float)(v16 * v27));
  float v32 = *(float *)&self[1].super.super.isa * v28;
  if (v18)
  {
    float v33 = 0.0;
  }
  else
  {
    float v21 = v28;
    float v20 = 0.0;
    float v33 = v29;
  }
  if (!v18)
  {
    float v24 = v32;
    float v23 = v31;
    float v22 = v30;
  }
  LODWORD(v72) = v14->super.super.isa;
  *((float *)&v72 + 1) = v20;
  uint64_t v73 = LODWORD(v22);
  unint64_t v74 = __PAIR64__(LODWORD(v21), LODWORD(v16));
  uint64_t v75 = LODWORD(v23);
  unint64_t v76 = __PAIR64__(LODWORD(v33), LODWORD(v17));
  uint64_t v77 = LODWORD(v24);
  long long v34 = *(_OWORD *)&self[2].super.super.isa;
  HIDWORD(v34) = 0;
  long long v71 = v34;
  float v35 = *(float *)&self[1].super._bodyB;
  float v36 = *((float *)&self[1].super._bodyB + 1);
  float v37 = *(float *)self[1]._anon_28;
  BOOL v38 = fabsf(v37) <= 0.70711;
  float v39 = (float)(v36 * v36) + (float)(v35 * v35);
  float v40 = 1.0 / sqrtf(v39);
  float v41 = -(float)(v36 * v40);
  float v42 = v35 * v40;
  float v43 = -(float)(v37 * (float)(v35 * v40));
  float v44 = v37 * v41;
  float v45 = v39 * v40;
  float v46 = (float)(v37 * v37) + (float)(v36 * v36);
  float v47 = 1.0 / sqrtf(v46);
  float v48 = -(float)(v37 * v47);
  float v49 = v36 * v47;
  float v50 = v46 * v47;
  float v51 = -(float)(v35 * (float)(v36 * v47));
  if (v38)
  {
    float v50 = v43;
  }
  else
  {
    float v42 = v48;
    float v41 = 0.0;
  }
  LODWORD(v66) = self[1].super._bodyB;
  *((float *)&v66 + 1) = v41;
  uint64_t v67 = LODWORD(v50);
  unint64_t v68 = __PAIR64__(LODWORD(v42), LODWORD(v36));
  float v52 = v35 * v48;
  if (v38)
  {
    float v53 = v44;
  }
  else
  {
    float v25 = v49;
    float v53 = v51;
  }
  uint64_t v69 = LODWORD(v53);
  unint64_t v70 = __PAIR64__(LODWORD(v25), LODWORD(v37));
  if (v38) {
    float v54 = v45;
  }
  else {
    float v54 = v52;
  }
  uint64_t v58 = objc_msgSend__handle(v5, v10, v11, v12, v66, v67, v68, v69, v70, LODWORD(v54), v71, v72, v73, v74, v75, v76, v77, v78);
  if (v13)
  {
    uint64_t v59 = objc_msgSend__handle(v13, v55, v56, v57);
    uint64_t v60 = sub_1B6E073B8(1248, 16);
    sub_1B6E00704(v60, v58, v59, &v72, &v66, 1);
  }
  else
  {
    uint64_t v60 = sub_1B6E073B8(1248, 16);
    sub_1B6E0081C(v60, v58, &v72, 1);
  }
  *(void *)(v60 + 212) = v14[1].super._constraint;
  float v61 = fmodf(*(float *)&v14[1].super._bodyA, 6.2832);
  if (v61 >= -3.1416)
  {
    if (v61 > 3.1416) {
      float v61 = v61 + -6.2832;
    }
  }
  else
  {
    float v61 = v61 + 6.2832;
  }
  *(float *)(v60 + 220) = v61;
  float v62 = fmodf(*((float *)&v14[1].super._bodyA + 1), 6.2832);
  if (v62 >= -3.1416)
  {
    if (v62 > 3.1416) {
      float v62 = v62 + -6.2832;
    }
  }
  else
  {
    float v62 = v62 + 6.2832;
  }
  *(float *)(v60 + 224) = v62;
  float v63 = *(float *)&v14[1].super._bodyB;
  if (v63 != 0.0)
  {
    *(unsigned char *)(v60 + 1216) = 1;
    *(float *)(v60 + 1220) = v63;
    *(_DWORD *)(v60 + 1224) = HIDWORD(v14[1].super._bodyB);
  }
  float v64 = *(float *)v14[1]._anon_28;
  if (v64 != 0.0)
  {
    *(unsigned char *)(v60 + 1232) = 1;
    *(float *)(v60 + 1236) = v64;
    *(_DWORD *)(v60 + 1240) = *(_DWORD *)&v14[1]._anon_28[4];
  }
  return (btTypedConstraint *)v60;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (__n128 *)self;
  v21.receiver = self;
  v21.super_class = (Class)VFXPhysicsSliderJoint;
  -[VFXPhysicsJoint encodeWithCoder:](&v21, sel_encodeWithCoder_);
  v4 += 3;
  sub_1B64FA2F4(a3, (const char *)@"axisA", *v4);
  sub_1B64FA2F4(a3, (const char *)@"axisB", v4[2]);
  sub_1B64FA2F4(a3, (const char *)@"anchorA", v4[1]);
  sub_1B64FA2F4(a3, (const char *)@"anchorB", v4[3]);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"minLinearLimit", v6, v4[4].n128_f32[0]);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"maxLinearLimit", v8, v4[4].n128_f32[1]);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"minAngularLimit", v10, v4[4].n128_f32[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"maxAngularLimit", v12, v4[4].n128_f32[3]);
  objc_msgSend_encodeDouble_forKey_(a3, v13, @"motorTargetLinearVelocity", v14, v4[5].n128_f32[0]);
  objc_msgSend_encodeDouble_forKey_(a3, v15, @"motorMaximumForce", v16, v4[5].n128_f32[1]);
  objc_msgSend_encodeDouble_forKey_(a3, v17, @"motorTargetAngularVelocity", v18, v4[5].n128_f32[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v19, @"motorMaximumTorque", v20, v4[5].n128_f32[3]);
}

- (VFXPhysicsSliderJoint)initWithCoder:(id)a3
{
  v42.receiver = self;
  v42.super_class = (Class)VFXPhysicsSliderJoint;
  uint64_t v7 = -[VFXPhysicsJoint initWithCoder:](&v42, sel_initWithCoder_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    *(double *)&long long v11 = sub_1B64FA42C(a3, (const char *)@"axisA");
    *(_OWORD *)&v7[1].super.super.isa = v11;
    *(double *)&long long v12 = sub_1B64FA42C(a3, (const char *)@"axisB");
    *(_OWORD *)&v7[1].super._bodyB = v12;
    *(double *)&long long v13 = sub_1B64FA42C(a3, (const char *)@"anchorA");
    *(_OWORD *)&v7[1].super._constraint = v13;
    *(double *)&long long v14 = sub_1B64FA42C(a3, (const char *)@"anchorB");
    *(_OWORD *)&v7[2].super.super.isa = v14;
    objc_msgSend_decodeDoubleForKey_(a3, v15, @"minLinearLimit", v16);
    *(float *)&double v17 = v17;
    LODWORD(v7[2].super._constraint) = LODWORD(v17);
    objc_msgSend_decodeDoubleForKey_(a3, v18, @"maxLinearLimit", v19);
    *(float *)&double v20 = v20;
    HIDWORD(v7[2].super._constraint) = LODWORD(v20);
    objc_msgSend_decodeDoubleForKey_(a3, v21, @"minAngularLimit", v22);
    *(float *)&double v23 = v23;
    LODWORD(v7[2].super._bodyA) = LODWORD(v23);
    objc_msgSend_decodeDoubleForKey_(a3, v24, @"maxAngularLimit", v25);
    *(float *)&double v26 = v26;
    HIDWORD(v7[2].super._bodyA) = LODWORD(v26);
    objc_msgSend_decodeDoubleForKey_(a3, v27, @"motorTargetLinearVelocity", v28);
    *(float *)&double v29 = v29;
    LODWORD(v7[2].super._bodyB) = LODWORD(v29);
    objc_msgSend_decodeDoubleForKey_(a3, v30, @"motorMaximumForce", v31);
    *(float *)&double v32 = v32;
    HIDWORD(v7[2].super._bodyB) = LODWORD(v32);
    objc_msgSend_decodeDoubleForKey_(a3, v33, @"motorTargetAngularVelocity", v34);
    *(float *)&double v35 = v35;
    *(_DWORD *)v7[2]._anon_28 = LODWORD(v35);
    objc_msgSend_decodeDoubleForKey_(a3, v36, @"motorMaximumTorque", v37);
    *(float *)&double v38 = v38;
    *(_DWORD *)&v7[2]._anon_28[4] = LODWORD(v38);
    objc_msgSend_setImmediateMode_(VFXTransaction, v39, v8, v40);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
      v23.super_class = (Class)VFXPhysicsSliderJoint;
      return [(VFXPhysicsSliderJoint *)&v23 valueForKey:a3];
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
    v27.super_class = (Class)VFXPhysicsSliderJoint;
    [(VFXPhysicsSliderJoint *)&v27 setValue:a3 forKey:a4];
  }
}

+ (id)sliderWithBodyA:(id)a3 axisA:(id)a4 anchorA:(id)a5 bodyB:(id)a6 axisB:(id)a7 anchorB:(id)a8
{
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a4, v19, 1, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  objc_super v27 = objc_msgSend_objectAtIndexedSubscript_(a4, v25, 2, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  float v33 = objc_msgSend_objectAtIndexedSubscript_(a5, v31, 0, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  float v39 = objc_msgSend_objectAtIndexedSubscript_(a5, v37, 1, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  float v45 = objc_msgSend_objectAtIndexedSubscript_(a5, v43, 2, v44);
  objc_msgSend_floatValue(v45, v46, v47, v48);
  float v51 = objc_msgSend_objectAtIndexedSubscript_(a7, v49, 0, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54);
  uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(a7, v55, 1, v56);
  objc_msgSend_floatValue(v57, v58, v59, v60);
  float v63 = objc_msgSend_objectAtIndexedSubscript_(a7, v61, 2, v62);
  objc_msgSend_floatValue(v63, v64, v65, v66);
  uint64_t v69 = objc_msgSend_objectAtIndexedSubscript_(a8, v67, 0, v68);
  objc_msgSend_floatValue(v69, v70, v71, v72);
  uint64_t v75 = objc_msgSend_objectAtIndexedSubscript_(a8, v73, 1, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  v81 = objc_msgSend_objectAtIndexedSubscript_(a8, v79, 2, v80);
  objc_msgSend_floatValue(v81, v82, v83, v84);

  return (id)MEMORY[0x1F4181798](a1, sel_jointWithBodyA_axisA_anchorA_bodyB_axisB_anchorB_, a3, a6);
}

+ (id)sliderWithBody:(id)a3 axis:(id)a4 anchor:(id)a5
{
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(a4, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a4, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a4, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  objc_super v27 = objc_msgSend_objectAtIndexedSubscript_(a5, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  float v33 = objc_msgSend_objectAtIndexedSubscript_(a5, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  float v39 = objc_msgSend_objectAtIndexedSubscript_(a5, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);

  return (id)MEMORY[0x1F4181798](a1, sel_jointWithBody_axis_anchor_, a3, v43);
}

- (id)axisAValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_axisA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
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
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
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
  uint64_t v5 = NSNumber;
  objc_msgSend_anchorA(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
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
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
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
  uint64_t v5 = NSNumber;
  objc_msgSend_axisB(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
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
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
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
  uint64_t v5 = NSNumber;
  objc_msgSend_anchorB(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
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
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  uint64_t v12 = objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);

  MEMORY[0x1F4181798](self, sel_setAnchorB_, v22, v23);
}

@end