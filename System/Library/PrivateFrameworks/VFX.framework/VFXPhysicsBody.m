@interface VFXPhysicsBody
+ (BOOL)supportsSecureCoding;
+ (VFXPhysicsBody)bodyWithType:(int64_t)a3 shape:(id)a4;
+ (id)_generateDefaultShapeForNode:(id)a3;
+ (id)dynamicBody;
+ (id)kinematicBody;
+ (id)staticBody;
- (BOOL)allowsResting;
- (BOOL)hasDefaultShape;
- (BOOL)isActive;
- (BOOL)isAffectedByGravity;
- (BOOL)isResting;
- (BOOL)usesDefaultMomentOfInertia;
- (VFXPhysicsBody)initWithCoder:(id)a3;
- (VFXPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4;
- (VFXPhysicsShape)physicsShape;
- (__CFXWorld)worldRef;
- (__n128)angularVelocityFactor;
- (__n128)centerOfMassOffset;
- (__n128)momentOfInertia;
- (__n128)velocity;
- (__n128)velocityFactor;
- (float)angularDamping;
- (float)angularRestingThreshold;
- (float)angularSleepingThreshold;
- (float)charge;
- (float)continuousCollisionDetection;
- (float)continuousCollisionDetectionThreshold;
- (float)damping;
- (float)friction;
- (float)linearRestingThreshold;
- (float)linearSleepingThreshold;
- (float)mass;
- (float)restitution;
- (float)rollingFriction;
- (id)_owner;
- (id)angularVelocityFactorValue;
- (id)angularVelocityValue;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)momentOfInertiaValue;
- (id)valueForKey:(id)a3;
- (id)velocityFactorValue;
- (id)velocityValue;
- (int64_t)type;
- (int8x16_t)angularVelocity;
- (uint64_t)moveToTransform:(float32x4_t)a3;
- (uint64_t)resetToTransform:(uint64_t)a3;
- (unint64_t)categoryBitMask;
- (unint64_t)collisionBitMask;
- (unint64_t)contactTestBitMask;
- (void)_activate;
- (void)_createBody;
- (void)_handle;
- (void)_ownerWillDie;
- (void)_removeOwner;
- (void)_setBtShape:(id)a3;
- (void)_setOwner:(id)a3;
- (void)_setPhysicsShape:(id)a3;
- (void)_updateCollisionShape;
- (void)applyForce:(BOOL)a3 impulse:;
- (void)applyForce:(VFXPhysicsBody *)self atPosition:(SEL)a2 impulse:(BOOL)a3;
- (void)applyForceValue:(id)a3 atPosition:(id)a4 impulse:(BOOL)a5;
- (void)applyForceValue:(id)a3 impulse:(BOOL)a4;
- (void)applyTorque:(BOOL)a3 impulse:;
- (void)applyTorqueValue:(id)a3 impulse:(BOOL)a4;
- (void)cleanCollisionCache;
- (void)clearAllForces;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)flagAsActive:(BOOL)a3;
- (void)moveToPosition:(VFXPhysicsBody *)self;
- (void)resetTransform;
- (void)rotateToAxisAngle:(VFXPhysicsBody *)self;
- (void)setAffectedByGravity:(BOOL)a3;
- (void)setAllowsResting:(BOOL)a3;
- (void)setAngularDamping:(float)a3;
- (void)setAngularRestingThreshold:(float)a3;
- (void)setAngularVelocity:(VFXPhysicsBody *)self;
- (void)setAngularVelocityFactor:(VFXPhysicsBody *)self;
- (void)setAngularVelocityFactorValue:(id)a3;
- (void)setAngularVelocityValue:(id)a3;
- (void)setCategoryBitMask:(unint64_t)a3;
- (void)setCenterOfMassOffset:(VFXPhysicsBody *)self;
- (void)setCharge:(float)a3;
- (void)setCollisionBitMask:(unint64_t)a3;
- (void)setContactTestBitMask:(unint64_t)a3;
- (void)setContinuousCollisionDetectionThreshold:(float)a3;
- (void)setDamping:(float)a3;
- (void)setFriction:(float)a3;
- (void)setLinearRestingThreshold:(float)a3;
- (void)setMass:(float)a3;
- (void)setMomentOfInertia:(VFXPhysicsBody *)self;
- (void)setMomentOfInertiaValue:(id)a3;
- (void)setPhysicsShape:(id)DefaultShapeForNode;
- (void)setResting:(BOOL)a3;
- (void)setRestitution:(float)a3;
- (void)setRollingFriction:(float)a3;
- (void)setType:(int64_t)a3;
- (void)setUsesDefaultMomentOfInertia:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setVelocity:(VFXPhysicsBody *)self;
- (void)setVelocityFactor:(VFXPhysicsBody *)self;
- (void)setVelocityFactorValue:(id)a3;
- (void)setVelocityValue:(id)a3;
- (void)updateDefaultShape;
- (void)updateGlobalScale:(double)a3;
@end

@implementation VFXPhysicsBody

- (VFXPhysicsBody)initWithType:(int64_t)a3 shape:(id)a4
{
  v22.receiver = self;
  v22.super_class = (Class)VFXPhysicsBody;
  v6 = [(VFXPhysicsBody *)&v22 init];
  uint64_t v10 = (uint64_t)v6;
  if (v6)
  {
    v6->_type = a3;
    if (a4)
    {
      v6->_defaultShape = 0;
      id v11 = a4;
      *(void *)(v10 + 48) = v11;
      objc_msgSend_didAddToPhysicsBody_(v11, v12, v10, v13);
    }
    else
    {
      v6->_defaultShape = 1;
    }
    float v14 = 0.0;
    if (a3 == 1) {
      float v14 = 1.0;
    }
    *(float *)(v10 + 16) = v14;
    *(void *)(v10 + 24) = 0x3F0000003F000000;
    *(_DWORD *)(v10 + 32) = 0;
    *(_DWORD *)(v10 + 64) = 1036831949;
    *(_DWORD *)(v10 + 96) = 1036831949;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)(v10 + 112) = _Q0;
    *(_OWORD *)(v10 + 128) = _Q0;
    *(int32x2_t *)(v10 + 164) = vdup_n_s32(0x3DCCCCCDu);
    *(unsigned char *)(v10 + 232) = 1;
    *(unsigned char *)(v10 + 160) = 0;
    *(int32x2_t *)&_Q0 = vdup_n_s32(a3 == 0);
    v20.i64[0] = _Q0;
    v20.i64[1] = DWORD1(_Q0);
    *(int8x16_t *)(v10 + 208) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v20, 0x3FuLL)), (int8x16_t)xmmword_1B6E52080, (int8x16_t)xmmword_1B6E50980);
    *(void *)(v10 + 224) = 0;
    *(void *)(v10 + 240) = objc_msgSend__createBody((void *)v10, v7, v8, v9);
  }
  return (VFXPhysicsBody *)v10;
}

- (__CFXWorld)worldRef
{
  return (__CFXWorld *)objc_msgSend_worldRef(self->_node, a2, v2, v3);
}

- (void)_handle
{
  return self->_body;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)flagAsActive:(BOOL)a3
{
  self->_active = a3;
}

- (void)dealloc
{
  body = self->_body;
  if (body)
  {
    uint64_t v5 = body[67];
    if (!v5 || ((*(void (**)(void, SEL))(*(void *)v5 + 8))(body[67], a2), (body = self->_body) != 0)) {
      (*(void (**)(void *, SEL))(*body + 16))(body, a2);
    }
  }
  objc_msgSend_didRemoveFromPhysicsBody_(self->_physicsShape, a2, (uint64_t)self, v2);

  v6.receiver = self;
  v6.super_class = (Class)VFXPhysicsBody;
  [(VFXPhysicsBody *)&v6 dealloc];
}

+ (VFXPhysicsBody)bodyWithType:(int64_t)a3 shape:(id)a4
{
  id v6 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_initWithType_shape_(v6, v7, a3, (uint64_t)a4);

  return (VFXPhysicsBody *)v8;
}

+ (id)staticBody
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 0, 0);
}

+ (id)dynamicBody
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 1, 0);
}

+ (id)kinematicBody
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_bodyWithType_shape_(v2, v3, 2, 0);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  int32x2_t v6 = vdup_n_s32(a3 == 0);
  v7.i64[0] = v6.u32[0];
  v7.i64[1] = v6.u32[1];
  *(int8x16_t *)&self->_categoryBitMask = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v7, 0x3FuLL)), (int8x16_t)xmmword_1B6E52080, (int8x16_t)xmmword_1B6E50980);
  uint64_t v8 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1B6544B24;
  v15[3] = &unk_1E61412A8;
  v15[4] = self;
  v15[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v15);
  double v14 = 0.0;
  if (a3 == 1) {
    *(float *)&double v14 = 1.0;
  }
  objc_msgSend_setMass_(self, v11, v12, v13, v14);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setMass:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_mass = a3;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3020000000;
  long long v13 = *(_OWORD *)&self->_momentOfInertia[3];
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6544CCC;
  v10[3] = &unk_1E6144138;
  float v11 = a3;
  v10[4] = self;
  v10[5] = v12;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
  _Block_object_dispose(v12, 8);
}

- (float)mass
{
  return self->_mass;
}

- (void)setMomentOfInertia:(VFXPhysicsBody *)self
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)&self->_momentOfInertia[3] = v4;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3020000000;
  long long v11 = v4;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6544E18;
  v9[3] = &unk_1E6143080;
  v9[4] = self;
  v9[5] = v10;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
  _Block_object_dispose(v10, 8);
}

- (__n128)momentOfInertia
{
  return a1[11];
}

- (void)setCenterOfMassOffset:(VFXPhysicsBody *)self
{
  long long v12 = v4;
  *(_OWORD *)&self->_centerOfMassOffset[3] = v4;
  float mass = self->_mass;
  long long v11 = *(_OWORD *)&self->_momentOfInertia[3];
  BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
  uint64_t v8 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B6544F2C;
  v13[3] = &unk_1E6144160;
  v16 = self;
  float v17 = mass;
  BOOL v18 = explicitMomentOfInertia;
  long long v14 = v12;
  long long v15 = v11;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v13);
}

- (__n128)centerOfMassOffset
{
  return a1[12];
}

- (void)setUsesDefaultMomentOfInertia:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_BOOL explicitMomentOfInertia = !a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3020000000;
  long long v10 = *(_OWORD *)&self->_momentOfInertia[3];
  uint64_t v5 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B65450F8;
  v8[3] = &unk_1E6143080;
  v8[4] = self;
  v8[5] = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v5, (uint64_t)node, v8);
  _Block_object_dispose(v9, 8);
}

- (BOOL)usesDefaultMomentOfInertia
{
  return !self->_explicitMomentOfInertia;
}

- (void)setCharge:(float)a3
{
  self->_charge = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B65451EC;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)charge
{
  return self->_charge;
}

- (BOOL)isResting
{
  body = self->_body;
  if (!body) {
    return 0;
  }
  int v3 = body[61];
  return v3 == 2 || v3 == 5;
}

- (void)updateGlobalScale:(double)a3
{
  uint64_t v3 = *((void *)self->_body + 67);
  if (v3)
  {
    float v4 = a3;
    *(float *)(v3 + 64) = v4;
  }
}

- (BOOL)allowsResting
{
  return self->_allowsResting;
}

- (void)setAllowsResting:(BOOL)a3
{
  self->_allowsResting = a3;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6545364;
  v9[3] = &unk_1E6141190;
  void v9[4] = self;
  BOOL v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
}

- (void)setFriction:(float)a3
{
  self->_friction = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6545474;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)friction
{
  return self->_friction;
}

- (void)setRestitution:(float)a3
{
  self->_restitution = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B654553C;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)restitution
{
  return self->_restitution;
}

- (void)setRollingFriction:(float)a3
{
  self->_rollingFriction = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6545604;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)rollingFriction
{
  return self->_rollingFriction;
}

- (void)setDamping:(float)a3
{
  self->_damping = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B65456CC;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)damping
{
  return self->_damping;
}

- (void)setAngularDamping:(float)a3
{
  self->_angularDamping = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B654579C;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)angularDamping
{
  return self->_angularDamping;
}

- (void)setLinearRestingThreshold:(float)a3
{
  self->_linearRestingThreshold = a3;
  float angularRestingThreshold = self->_angularRestingThreshold;
  uint64_t v8 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B6545870;
  v11[3] = &unk_1E61412A8;
  v11[4] = self;
  float v12 = a3;
  float v13 = angularRestingThreshold;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v11);
}

- (float)linearRestingThreshold
{
  return self->_linearRestingThreshold;
}

- (void)setAngularRestingThreshold:(float)a3
{
  self->_float angularRestingThreshold = a3;
  float linearRestingThreshold = self->_linearRestingThreshold;
  uint64_t v8 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B6545940;
  v11[3] = &unk_1E61412A8;
  v11[4] = self;
  float v12 = linearRestingThreshold;
  float v13 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v11);
}

- (float)angularRestingThreshold
{
  return self->_angularRestingThreshold;
}

- (float)linearSleepingThreshold
{
  return self->_linearRestingThreshold;
}

- (float)angularSleepingThreshold
{
  return self->_angularRestingThreshold;
}

- (void)_setBtShape:(id)a3
{
  btShapeWrapper = self->_btShapeWrapper;
  if (btShapeWrapper != a3)
  {

    self->_btShapeWrapper = (VFXBtShapeWrapper *)a3;
  }
}

- (void)cleanCollisionCache
{
  uint64_t v5 = objc_msgSend_world(self->_node, a2, v2, v3);
  uint64_t v9 = objc_msgSend_physicsWorld(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend__handle(v9, v10, v11, v12);
  if (v13)
  {
    uint64_t v14 = *(void *)(v13 + 40);
    uint64_t v15 = (*(uint64_t (**)(void))(**(void **)(v13 + 96) + 72))(*(void *)(v13 + 96));
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)v15 + 80))(v15, *((void *)self->_body + 25), v14);
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 56))(v15);
    int v17 = *(_DWORD *)(v16 + 4);
    if (v17 >= 1)
    {
      uint64_t v18 = v16;
      uint64_t v19 = 0;
      for (uint64_t i = 0; i < v17; ++i)
      {
        uint64_t v21 = *(void *)(v18 + 16);
        objc_super v22 = **(_DWORD ***)(v21 + v19);
        if (v22 == self->_body) {
          objc_super v22 = **(_DWORD ***)(v21 + v19 + 8);
        }
        if (v22[61] != 4)
        {
          sub_1B6DD24CC((uint64_t)v22, 1);
          int v17 = *(_DWORD *)(v18 + 4);
        }
        v19 += 32;
      }
    }
  }
}

- (void)_updateCollisionShape
{
  physicsShape = self->_physicsShape;
  float mass = self->_mass;
  BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
  long long v20 = *(_OWORD *)&self->_momentOfInertia[3];
  long long v21 = *(_OWORD *)&self->_centerOfMassOffset[3];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  uint64_t v8 = objc_msgSend__owner(self, a2, v2, v3);
  uint64_t v33 = objc_msgSend_nodeRef(v8, v9, v10, v11);
  uint64_t v15 = (const void *)v31[3];
  if (v15) {
    CFRetain(v15);
  }
  uint64_t v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
  long long v17 = v21;
  HIDWORD(v17) = 0;
  node = self->_node;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3321888768;
  v22[2] = sub_1B6545C14;
  v22[3] = &unk_1F0FB54D8;
  v25 = self;
  v26 = physicsShape;
  v27 = &v30;
  float v28 = mass;
  BOOL v29 = explicitMomentOfInertia;
  long long v23 = v20;
  long long v24 = v17;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v16, (uint64_t)node, v22);
  _Block_object_dispose(&v30, 8);
}

- (void)setPhysicsShape:(id)DefaultShapeForNode
{
  if (self->_physicsShape != DefaultShapeForNode)
  {
    if (DefaultShapeForNode)
    {
      BOOL v5 = 0;
    }
    else
    {
      DefaultShapeForNode = (id)objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, a2, (uint64_t)self->_node, v3);
      BOOL v5 = 1;
    }
    self->_defaultShape = v5;
    MEMORY[0x1F4181798](self, sel__setPhysicsShape_, DefaultShapeForNode, v3);
  }
}

- (VFXPhysicsShape)physicsShape
{
  if (self->_defaultShape) {
    return 0;
  }
  else {
    return self->_physicsShape;
  }
}

- (BOOL)hasDefaultShape
{
  return self->_defaultShape;
}

- (void)updateDefaultShape
{
  uint64_t DefaultShapeForNode = objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, a2, (uint64_t)self->_node, v2);

  MEMORY[0x1F4181798](self, sel__setPhysicsShape_, DefaultShapeForNode, v5);
}

- (unint64_t)categoryBitMask
{
  return self->_categoryBitMask;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  self->_categoryBitMask = a3;
  unint64_t collisionBitMask = self->_collisionBitMask;
  unint64_t contactTestBitMask = self->_contactTestBitMask;
  uint64_t v8 = objc_msgSend_world(self->_node, a2, a3, v3);
  uint64_t IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    uint64_t v15 = IfNeeded;
    uint64_t v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B6545FF8;
    v19[3] = &unk_1E6144188;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = collisionBitMask;
    v19[8] = contactTestBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (unint64_t)collisionBitMask
{
  return self->_collisionBitMask;
}

- (void)setCollisionBitMask:(unint64_t)a3
{
  self->_unint64_t collisionBitMask = a3;
  unint64_t categoryBitMask = self->_categoryBitMask;
  unint64_t contactTestBitMask = self->_contactTestBitMask;
  uint64_t v8 = objc_msgSend_world(self->_node, a2, a3, v3);
  uint64_t IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    uint64_t v15 = IfNeeded;
    uint64_t v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B654614C;
    v19[3] = &unk_1E6144188;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = categoryBitMask;
    v19[8] = contactTestBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (unint64_t)contactTestBitMask
{
  return self->_contactTestBitMask;
}

- (void)setContactTestBitMask:(unint64_t)a3
{
  self->_unint64_t contactTestBitMask = a3;
  unint64_t categoryBitMask = self->_categoryBitMask;
  unint64_t collisionBitMask = self->_collisionBitMask;
  uint64_t v8 = objc_msgSend_world(self->_node, a2, a3, v3);
  uint64_t IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v8, v9, 0, v10);
  if (IfNeeded)
  {
    uint64_t v15 = IfNeeded;
    uint64_t v16 = objc_msgSend_worldRef(self->_node, v12, v13, v14);
    node = self->_node;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1B654629C;
    v19[3] = &unk_1E6144188;
    v19[4] = self;
    v19[5] = v15;
    v19[6] = a3;
    v19[7] = collisionBitMask;
    v19[8] = categoryBitMask;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v18, v16, (uint64_t)node, v19);
  }
}

- (void)setContinuousCollisionDetectionThreshold:(float)a3
{
  self->_continuousCollisionDetectionThreshold = a3;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, v3, v4);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B65463BC;
  v10[3] = &unk_1E6141208;
  void v10[4] = self;
  float v11 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v10);
}

- (float)continuousCollisionDetection
{
  return self->_continuousCollisionDetectionThreshold;
}

- (void)setVelocity:(VFXPhysicsBody *)self
{
  long long v9 = v4;
  *(_OWORD *)self->_velocity = v4;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B654648C;
  v10[3] = &unk_1E61412D0;
  uint64_t v12 = self;
  long long v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)velocity
{
  if (objc_msgSend_immediateMode(VFXTransaction, a2, a3, a4)
    && (unint64_t v6 = a1[15].n128_u64[0]) != 0)
  {
    result.n128_u64[0] = *(void *)(v6 + 352);
  }
  else
  {
    return a1[9];
  }
  return result;
}

- (void)setAffectedByGravity:(BOOL)a3
{
  self->_ignoreGravity = !a3;
  node = self->_node;
  if (node)
  {
    uint64_t v7 = objc_msgSend_world(node, a2, a3, v3);
    uint64_t IfNeeded = objc_msgSend__physicsWorldCreateIfNeeded_(v7, v8, 0, v9);
    uint64_t v14 = objc_msgSend_worldRef(self->_node, v11, v12, v13);
  }
  else
  {
    uint64_t IfNeeded = 0;
    uint64_t v14 = objc_msgSend_worldRef(0, a2, a3, v3);
  }
  uint64_t v16 = self->_node;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B65465EC;
  v17[3] = &unk_1E61441B0;
  BOOL v18 = a3;
  v17[4] = self;
  v17[5] = IfNeeded;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)v16, v17);
}

- (BOOL)isAffectedByGravity
{
  return !self->_ignoreGravity;
}

- (void)setAngularVelocity:(VFXPhysicsBody *)self
{
  long long v9 = v4;
  *(_OWORD *)self->_angularVelocity = v4;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6546734;
  v10[3] = &unk_1E61412D0;
  uint64_t v12 = self;
  long long v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (int8x16_t)angularVelocity
{
  if (objc_msgSend_immediateMode(VFXTransaction, a2, a3, a4)
    && (uint64_t v5 = (float32x4_t *)a1[15].i64[0]) != 0)
  {
    float32x4_t v6 = v5[23];
    int8x16_t result = (int8x16_t)vmulq_f32(v6, v6);
    float v7 = sqrtf(vadd_f32(vpadd_f32(*(float32x2_t *)result.i8, *(float32x2_t *)result.i8), (float32x2_t)*(_OWORD *)&vextq_s8(result, result, 8uLL)).f32[0]);
    result.i64[0] = 0;
    if (v7 > 0.0) {
      result.i64[0] = vmulq_n_f32(v6, 1.0 / v7).u64[0];
    }
  }
  else
  {
    return (int8x16_t)a1[5];
  }
  return result;
}

- (void)setVelocityFactor:(VFXPhysicsBody *)self
{
  long long v9 = v4;
  *(_OWORD *)self->_velocityFactor = v4;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B654686C;
  v10[3] = &unk_1E61412D0;
  uint64_t v12 = self;
  long long v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)velocityFactor
{
  return a1[7];
}

- (void)setAngularVelocityFactor:(VFXPhysicsBody *)self
{
  long long v9 = v4;
  *(_OWORD *)self->_angularVelocityFactor = v4;
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B6546944;
  v10[3] = &unk_1E61412D0;
  uint64_t v12 = self;
  long long v11 = v9;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v10);
}

- (__n128)angularVelocityFactor
{
  return a1[8];
}

- (void)applyForce:(BOOL)a3 impulse:
{
  long long v10 = v4;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B6546A18;
  v11[3] = &unk_1E61441D8;
  uint64_t v13 = self;
  BOOL v14 = a3;
  long long v12 = v10;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v11);
}

- (void)applyForce:(VFXPhysicsBody *)self atPosition:(SEL)a2 impulse:(BOOL)a3
{
  long long v11 = v4;
  long long v12 = v5;
  uint64_t v8 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1B6546B70;
  v13[3] = &unk_1E6144200;
  uint64_t v16 = self;
  BOOL v17 = a3;
  long long v14 = v11;
  long long v15 = v12;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v8, (uint64_t)node, v13);
}

- (void)applyTorque:(BOOL)a3 impulse:
{
  long long v10 = v4;
  uint64_t v7 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B6546DE8;
  v11[3] = &unk_1E61441D8;
  uint64_t v13 = self;
  long long v12 = v10;
  BOOL v14 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v7, (uint64_t)node, v11);
}

- (void)_activate
{
  body = self->_body;
  if (body) {
    sub_1B6DD24EC((uint64_t)body, 0);
  }
}

- (void)clearAllForces
{
  uint64_t v5 = objc_msgSend_worldRef(self->_node, a2, v2, v3);
  node = self->_node;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B6546F74;
  v8[3] = &unk_1E61411E0;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v5, (uint64_t)node, v8);
}

- (void)setResting:(BOOL)a3
{
  uint64_t v6 = objc_msgSend_worldRef(self->_node, a2, a3, v3);
  node = self->_node;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1B6547058;
  v9[3] = &unk_1E6141190;
  void v9[4] = self;
  BOOL v10 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v6, (uint64_t)node, v9);
}

- (uint64_t)resetToTransform:(uint64_t)a3
{
  uint64_t v9 = objc_msgSend_worldRef(*(void **)(a1 + 8), a2, a3, a4);
  uint64_t v10 = *(void *)(a1 + 8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1B6547138;
  v17[3] = &unk_1E6141FF8;
  uint64_t v22 = a1;
  __n128 v18 = a5;
  __n128 v19 = a6;
  __n128 v20 = a7;
  __n128 v21 = a8;
  return objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v9, v10, v17);
}

- (void)resetTransform
{
  node = self->_node;
  if (node)
  {
    objc_msgSend_worldTransform(node, a2, v2, v3);
    long long v18 = v7;
    long long v19 = v6;
    long long v16 = v9;
    long long v17 = v8;
    uint64_t v13 = objc_msgSend_worldRef(self->_node, v10, v11, v12);
    BOOL v14 = self->_node;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1B654720C;
    v20[3] = &unk_1E6141FF8;
    v25 = self;
    long long v21 = v19;
    long long v22 = v18;
    long long v23 = v17;
    long long v24 = v16;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v13, (uint64_t)v14, v20);
  }
}

- (void)moveToPosition:(VFXPhysicsBody *)self
{
  uint64_t v5 = objc_msgSend_presentationNode(self->_node, a2, v2, v3);
  objc_msgSend_worldTransform(v5, v6, v7, v8);

  MEMORY[0x1F4181798](self, sel_moveToTransform_, v9, v10);
}

- (void)rotateToAxisAngle:(VFXPhysicsBody *)self
{
  float32x4_t v50 = v4;
  long long v6 = objc_msgSend_presentationNode(self->_node, a2, v2, v3);
  objc_msgSend_worldTransform(v6, v7, v8, v9);
  float32x4_t v53 = v10;
  float32x4_t v12 = vmulq_f32(v11, v11);
  float32x4_t v13 = vaddq_f32(v12, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v12.f32, 1));
  v13.f32[0] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v12, 2), v13).f32[0]);
  float32x4_t v15 = vmulq_f32(v14, v14);
  float32x4_t v17 = vmulq_f32(v16, v16);
  v13.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0]);
  v13.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v17, 2), vaddq_f32(v17, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v17.f32, 1))).f32[0]);
  float32x4_t v52 = v13;
  v15.i32[0] = v50.i32[3];
  float32x4_t v18 = vmulq_f32(v50, v50);
  v18.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v18, 2), vaddq_f32(v18, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 1))).u64[0];
  float32x4_t v19 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v18.f32, 0);
  v19.i32[3] = 0;
  float32x4_t v20 = vrsqrteq_f32(v19);
  float32x4_t v21 = vmulq_f32(v20, vrsqrtsq_f32(v19, vmulq_f32(v20, v20)));
  int8x16_t v22 = (int8x16_t)vmulq_f32(v21, vrsqrtsq_f32(v19, vmulq_f32(v21, v21)));
  int32x4_t v23 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v18.f32[0] != 0.0)), 0x1FuLL));
  v23.i32[3] = 0;
  __asm { FMOV            V3.4S, #1.0 }
  float32x4_t v49 = (float32x4_t)_Q3;
  float32x4_t v51 = vmulq_f32((float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v23), v22, _Q3), v50);
  __float2 v31 = __sincosf_stret(v15.f32[0]);
  unint64_t v32 = 0;
  float32x4_t v33 = v51;
  float32x4_t v34 = vmulq_f32(v33, v33);
  int8x16_t v35 = (int8x16_t)vmlaq_n_f32(v34, vsubq_f32(v49, v34), v31.__cosval);
  float v36 = (float)(1.0 - v31.__cosval) * vmulq_lane_f32(v33, *(float32x2_t *)v33.f32, 1).f32[0];
  float32x4_t v37 = vmulq_n_f32(v51, -v31.__sinval);
  v33.f32[0] = v36 - v37.f32[2];
  *(float *)&unsigned int v38 = v36 + v37.f32[2];
  float32x2_t v39 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v51.f32, v51, 2), 1.0 - v31.__cosval);
  *(float *)&unsigned int v40 = v39.f32[0] + v37.f32[1];
  float32x2_t v41 = (float32x2_t)vrev64_s32(*(int32x2_t *)v37.f32);
  v42.i32[0] = vsub_f32(v39, v41).u32[0];
  v42.i32[1] = vadd_f32(v39, v41).i32[1];
  v42.i64[1] = vextq_s8(v35, v35, 8uLL).u32[0];
  v43.i32[0] = v35.i32[0];
  v37.f32[0] = v39.f32[1] - v37.f32[0];
  v43.i32[1] = v33.i32[0];
  v43.i64[1] = v40;
  v44.i64[0] = __PAIR64__(v35.u32[1], v38);
  v44.i64[1] = v37.u32[0];
  float32x4_t v45 = vabsq_f32(v52);
  v45.i32[3] = 0;
  v37.i64[0] = 0;
  v33.i64[0] = 0x8000000080000000;
  v33.i64[1] = 0x8000000080000000;
  int8x16_t v46 = vorrq_s8(vandq_s8((int8x16_t)v52, (int8x16_t)v33), (int8x16_t)(*(_OWORD *)&vmaxnmq_f32(v45, (float32x4_t)xmmword_1B6E4FCD0) & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)));
  v41.i32[0] = 0;
  v41.i32[1] = v46.i32[1];
  v37.i64[1] = v46.u32[2];
  long long v54 = v46.u32[0];
  long long v55 = (unint64_t)v41;
  float32x4_t v56 = v37;
  long long v57 = xmmword_1B6E4F370;
  do
  {
    v58[v32 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(long long *)((char *)&v54 + v32))), v44, *(float32x2_t *)((char *)&v54 + v32), 1), v42, *(float32x4_t *)((char *)&v54 + v32), 2), (float32x4_t)xmmword_1B6E4F370, *(float32x4_t *)((char *)&v54 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  unint64_t v47 = 0;
  float32x4_t v48 = v53;
  v48.i32[3] = 1.0;
  long long v54 = v58[0];
  long long v55 = v58[1];
  float32x4_t v56 = (float32x4_t)v58[2];
  long long v57 = v58[3];
  do
  {
    v58[v47 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B6E4F300, COERCE_FLOAT(*(long long *)((char *)&v54 + v47))), (float32x4_t)xmmword_1B6E4F320, *(float32x2_t *)((char *)&v54 + v47), 1), (float32x4_t)xmmword_1B6E4F2E0, *(float32x4_t *)((char *)&v54 + v47), 2), v48, *(float32x4_t *)((char *)&v54 + v47), 3);
    v47 += 16;
  }
  while (v47 != 64);

  ((void (*)(void, void, void, void))MEMORY[0x1F4181798])(self, sel_moveToTransform_, v29, v30);
}

- (uint64_t)moveToTransform:(float32x4_t)a3
{
  uint64_t result = a1[30];
  if (result)
  {
    float32x4_t v8 = vmulq_f32(a2, a2);
    LODWORD(v9) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v8, 2), vaddq_f32(v8, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v8.f32, 1))).u32[0];
    v5.f32[0] = sqrtf(v9);
    if (v5.f32[0] != 0.0)
    {
      float32x4_t v10 = vmulq_f32(a3, a3);
      LODWORD(v11) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).u32[0];
      float v12 = sqrtf(v11);
      if (v12 != 0.0)
      {
        float32x4_t v13 = vmulq_f32(a4, a4);
        LODWORD(v14) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
        float v15 = sqrtf(v14);
        if (v15 != 0.0)
        {
          float v37 = v15;
          float v38 = v12;
          float32x4_t v39 = v5;
          float v16 = v9;
          float32x2_t v17 = vrsqrte_f32((float32x2_t)LODWORD(v9));
          float32x2_t v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v17, v17)));
          int32x4_t v19 = (int32x4_t)vmulq_n_f32(a2, vmul_f32(v18, vrsqrts_f32((float32x2_t)LODWORD(v16), vmul_f32(v18, v18))).f32[0]);
          v18.f32[0] = v11;
          float32x2_t v20 = vrsqrte_f32((float32x2_t)LODWORD(v11));
          float32x2_t v21 = vmul_f32(v20, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v20, v20)));
          int32x4_t v22 = (int32x4_t)vmulq_n_f32(a3, vmul_f32(v21, vrsqrts_f32((float32x2_t)v18.u32[0], vmul_f32(v21, v21))).f32[0]);
          float v23 = v14;
          float32x2_t v24 = vrsqrte_f32((float32x2_t)LODWORD(v14));
          float32x2_t v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v24, v24)));
          unint64_t v40 = (unint64_t)vzip1_s32(*(int32x2_t *)v19.i8, *(int32x2_t *)v22.i8);
          float32x4_t v26 = vmulq_n_f32(a4, vmul_f32(v25, vrsqrts_f32((float32x2_t)LODWORD(v23), vmul_f32(v25, v25))).f32[0]);
          __int32 v41 = v26.i32[0];
          int v42 = 0;
          int32x2_t v43 = vzip2_s32(*(int32x2_t *)v19.i8, *(int32x2_t *)v22.i8);
          __int32 v44 = v26.i32[1];
          int v45 = 0;
          unint64_t v46 = vzip2q_s32(v19, v22).u64[0];
          __int32 v47 = v26.i32[2];
          int v48 = 0;
          unint64_t v49 = a5.n128_u64[0];
          unsigned __int32 v50 = a5.n128_u32[2];
          int v51 = 0;
          sub_1B6E06B2C();
          uint64_t v30 = a1[30];
          __float2 v31 = *(float32x4_t **)(v30 + 536);
          if (v31)
          {
            float32x4_t v32 = v39;
            v32.f32[1] = v38;
            v32.f32[2] = v37;
            uint32x4_t v33 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v31[1], v32));
            v33.i32[3] = v33.i32[2];
            if ((vmaxvq_u32(v33) & 0x80000000) != 0)
            {
              v31[1] = v32;
              float32x4_t v34 = (void *)a1[6];
              if (v34)
              {
                objc_msgSend__setNodeScale_(v34, v27, v28, v29);
              }
              else
              {
                int8x16_t v35 = (void *)a1[31];
                if (v35)
                {
                  uint64_t v36 = objc_msgSend_btShape(v35, v27, v28, v29);
                  unint64_t v40 = __PAIR64__(LODWORD(v38), v39.u32[0]);
                  __int32 v41 = LODWORD(v37);
                  int v42 = 0;
                  (*(void (**)(uint64_t, unint64_t *))(*(void *)v36 + 48))(v36, &v40);
                }
              }
            }
            else if (a1[7] == 2)
            {
              goto LABEL_14;
            }
            objc_msgSend_cleanCollisionCache(a1, v27, v28, v29);
            uint64_t v30 = a1[30];
          }
LABEL_14:
          sub_1B6544678(v30);
          return sub_1B6DD24EC(a1[30], 1);
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v11 = objc_msgSend_type(self, v8, v9, v10);
  float v15 = objc_msgSend_physicsShape(self, v12, v13, v14);
  id v19 = (id)objc_msgSend_copy(v15, v16, v17, v18);
  float32x2_t v21 = objc_msgSend_initWithType_shape_(v7, v20, v11, (uint64_t)v19);
  objc_msgSend_mass(self, v22, v23, v24);
  objc_msgSend_setMass_(v21, v25, v26, v27);
  objc_msgSend_charge(self, v28, v29, v30);
  objc_msgSend_setCharge_(v21, v31, v32, v33);
  objc_msgSend_friction(self, v34, v35, v36);
  objc_msgSend_setFriction_(v21, v37, v38, v39);
  objc_msgSend_restitution(self, v40, v41, v42);
  objc_msgSend_setRestitution_(v21, v43, v44, v45);
  objc_msgSend_rollingFriction(self, v46, v47, v48);
  objc_msgSend_setRollingFriction_(v21, v49, v50, v51);
  objc_msgSend_damping(self, v52, v53, v54);
  objc_msgSend_setDamping_(v21, v55, v56, v57);
  objc_msgSend_angularVelocity(self, v58, v59, v60);
  objc_msgSend_setAngularVelocity_(v21, v61, v62, v63);
  objc_msgSend_angularDamping(self, v64, v65, v66);
  objc_msgSend_setAngularDamping_(v21, v67, v68, v69);
  objc_msgSend_linearRestingThreshold(self, v70, v71, v72);
  objc_msgSend_setLinearRestingThreshold_(v21, v73, v74, v75);
  objc_msgSend_angularRestingThreshold(self, v76, v77, v78);
  objc_msgSend_setAngularRestingThreshold_(v21, v79, v80, v81);
  objc_msgSend_velocityFactor(self, v82, v83, v84);
  objc_msgSend_setVelocityFactor_(v21, v85, v86, v87);
  objc_msgSend_angularVelocityFactor(self, v88, v89, v90);
  objc_msgSend_setAngularVelocityFactor_(v21, v91, v92, v93);
  objc_msgSend_velocity(self, v94, v95, v96);
  objc_msgSend_setVelocity_(v21, v97, v98, v99);
  uint64_t v103 = objc_msgSend_categoryBitMask(self, v100, v101, v102);
  objc_msgSend_setCategoryBitMask_(v21, v104, v103, v105);
  uint64_t v109 = objc_msgSend_collisionBitMask(self, v106, v107, v108);
  objc_msgSend_setCollisionBitMask_(v21, v110, v109, v111);
  uint64_t v115 = objc_msgSend_contactTestBitMask(self, v112, v113, v114);
  objc_msgSend_setContactTestBitMask_(v21, v116, v115, v117);
  uint64_t v121 = objc_msgSend_allowsResting(self, v118, v119, v120);
  objc_msgSend_setAllowsResting_(v21, v122, v121, v123);
  objc_msgSend_angularVelocity(self, v124, v125, v126);
  objc_msgSend_setAngularVelocity_(v21, v127, v128, v129);
  uint64_t isAffectedByGravity = objc_msgSend_isAffectedByGravity(self, v130, v131, v132);
  objc_msgSend_setAffectedByGravity_(v21, v134, isAffectedByGravity, v135);
  uint64_t v139 = objc_msgSend_usesDefaultMomentOfInertia(self, v136, v137, v138);
  objc_msgSend_setUsesDefaultMomentOfInertia_(v21, v140, v139, v141);
  objc_msgSend_momentOfInertia(self, v142, v143, v144);
  objc_msgSend_setMomentOfInertia_(v21, v145, v146, v147);
  objc_msgSend_centerOfMassOffset(self, v148, v149, v150);
  objc_msgSend_setCenterOfMassOffset_(v21, v151, v152, v153);
  objc_msgSend_continuousCollisionDetectionThreshold(self, v154, v155, v156);
  objc_msgSend_setContinuousCollisionDetectionThreshold_(v21, v157, v158, v159);
  objc_msgSend_commitImmediate(VFXTransaction, v160, v161, v162);
  return v21;
}

- (id)copy
{
  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)_createBody
{
  float mass = self->_mass;
  uint64_t v16 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  char v29 = 0;
  long long v30 = xmmword_1B6E52090;
  long long v17 = xmmword_1B6E4F300;
  long long v18 = xmmword_1B6E4F320;
  long long v19 = xmmword_1B6E4F2E0;
  uint64_t v20 = 0;
  float angularDamping = self->_angularDamping;
  float damping = self->_damping;
  float v26 = angularDamping;
  uint64_t v4 = *(void *)&self->_linearRestingThreshold;
  float friction = self->_friction;
  *(int32x2_t *)&long long v5 = vrev64_s32(*(int32x2_t *)&self->_restitution);
  *((void *)&v5 + 1) = v4;
  long long v28 = v5;
  uint64_t v6 = sub_1B6E073B8(704, 16);
  sub_1B6E065DC(v6, (uint64_t)&mass);
  sub_1B6544604(v6, self->_type);
  long long v7 = *(_OWORD *)self->_velocity;
  HIDWORD(v7) = 0;
  *(_OWORD *)(v6 + 352) = v7;
  long long v8 = *(_OWORD *)self->_angularVelocity;
  HIDWORD(v8) = 0;
  *(_OWORD *)(v6 + 368) = v8;
  float32x4_t v9 = *(float32x4_t *)self->_velocityFactor;
  float32x4_t v10 = vmulq_n_f32(v9, *(float *)(v6 + 384));
  v9.i32[3] = 0;
  *(float32x4_t *)(v6 + 400) = v9;
  v10.i32[3] = 0;
  *(float32x4_t *)(v6 + 640) = v10;
  long long v11 = *(_OWORD *)self->_angularVelocityFactor;
  HIDWORD(v11) = 0;
  *(_OWORD *)(v6 + 624) = v11;
  if (self->_allowsResting) {
    int v12 = 1;
  }
  else {
    int v12 = 4;
  }
  sub_1B6DD24CC(v6, v12);
  *(float *)(v6 + 532) = self->_charge;
  *(float *)(v6 + 288) = self->_continuousCollisionDetectionThreshold;
  if (self->_ignoreGravity)
  {
    *(_DWORD *)(v6 + 576) = 1;
    float32x4_t v14 = 0uLL;
    sub_1B6E06940((float32x4_t *)v6, &v14);
  }
  return (void *)v6;
}

- (void)_ownerWillDie
{
  self->_node = 0;
}

- (void)_removeOwner
{
  node = self->_node;
  uint64_t v6 = objc_msgSend_world(node, a2, v2, v3);
  uint64_t v10 = objc_msgSend_physicsWorld(v6, v7, v8, v9);
  self->_node = 0;
  body = self->_body;
  if (body)
  {
    uint64_t v15 = v10;
    uint64_t v16 = objc_msgSend_worldRef(node, v11, v12, v13);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1B6547B70;
    v18[3] = &unk_1E6143030;
    v18[4] = node;
    v18[5] = v15;
    v18[6] = self;
    v18[7] = body;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)node, v18);
  }
}

- (void)_setOwner:(id)a3
{
  if (self->_node && self->_body) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. VFXPhysicsBody is already attached to a VFXNode", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"!_node || _body == 0");
  }
  self->_node = (VFXNode *)a3;
  uint64_t v10 = objc_msgSend_nodeRef(a3, a2, (uint64_t)a3, v3);
  body = self->_body;
  uint64_t v15 = objc_msgSend_categoryBitMask(self, v12, v13, v14);
  uint64_t v19 = objc_msgSend_collisionBitMask(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_contactTestBitMask(self, v20, v21, v22);
  node = self->_node;
  if (node)
  {
    uint64_t v31 = v23;
    float mass = self->_mass;
    BOOL explicitMomentOfInertia = self->_explicitMomentOfInertia;
    long long v34 = *(_OWORD *)&self->_centerOfMassOffset[3];
    HIDWORD(v34) = 0;
    long long v41 = *(_OWORD *)&self->_momentOfInertia[3];
    long long v42 = v34;
    if (!self->_physicsShape)
    {
      uint64_t DefaultShapeForNode = (VFXPhysicsShape *)objc_msgSend__generateDefaultShapeForNode_(VFXPhysicsBody, v24, (uint64_t)node, v25);
      self->_physicsShape = DefaultShapeForNode;
      objc_msgSend_didAddToPhysicsBody_(DefaultShapeForNode, v36, (uint64_t)self, v37);
    }
    uint64_t v38 = objc_msgSend_worldRef(self, v24, (uint64_t)node, v25);
    uint64_t v39 = self->_node;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3321888768;
    v43[2] = sub_1B6547D54;
    v43[3] = &unk_1F0FB5440;
    id v46 = a3;
    uint64_t v47 = self;
    uint64_t v48 = v10;
    unint64_t v49 = body;
    float v53 = mass;
    BOOL v54 = explicitMomentOfInertia;
    long long v44 = v41;
    long long v45 = v42;
    uint64_t v50 = v15;
    uint64_t v51 = v19;
    uint64_t v52 = v31;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v40, v38, (uint64_t)v39, v43);
  }
  else
  {
    sub_1B63F2F54(16, @"Error: cannot attach a body to a null node %p", 0, v25, v26, v27, v28, v29, (uint64_t)self);
  }
}

- (id)_owner
{
  return self->_node;
}

+ (id)_generateDefaultShapeForNode:(id)a3
{
  if (objc_msgSend_model(a3, a2, (uint64_t)a3, v3)) {
    uint64_t v7 = objc_msgSend_shapeWithModel_(VFXPhysicsShape, v5, 0, v6);
  }
  else {
    uint64_t v7 = objc_msgSend_shapeWithNode_flattened_(VFXPhysicsShape, v5, (uint64_t)a3, 0);
  }

  return v7;
}

- (void)_setPhysicsShape:(id)a3
{
  if (!a3) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", 0, v3, v4, v5, v6, v7, (uint64_t)"shape");
  }
  physicsShape = self->_physicsShape;
  if (physicsShape == a3)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. setting the same shape", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)"shape != _physicsShape");
    physicsShape = self->_physicsShape;
  }
  self->_physicsShape = (VFXPhysicsShape *)a3;
  objc_msgSend_didRemoveFromPhysicsBody_(physicsShape, v11, (uint64_t)self, v12);
  objc_msgSend_didAddToPhysicsBody_(self->_physicsShape, v13, (uint64_t)self, v14);

  MEMORY[0x1F4181798](self, sel__updateCollisionShape, v15, v16);
}

- (id)valueForKey:(id)a3
{
  if (objc_msgSend_isEqualToString_(a3, a2, @"momentOfInertia", v3))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_momentOfInertia(self, v6, v7, v8);
LABEL_15:
    return (id)objc_msgSend_valueWithVFXFloat3_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, @"velocity", v8))
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_velocity(self, v13, v14, v15);
    goto LABEL_15;
  }
  if (!objc_msgSend_isEqualToString_(a3, v13, @"angularVelocity", v15))
  {
    if (objc_msgSend_isEqualToString_(a3, v16, @"velocityFactor", v18))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_velocityFactor(self, v24, v25, v26);
    }
    else if (objc_msgSend_isEqualToString_(a3, v24, @"angularVelocityFactor", v26))
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_angularVelocityFactor(self, v27, v28, v29);
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(a3, v27, @"centerOfMassOffset", v29))
      {
        v33.receiver = self;
        v33.super_class = (Class)VFXPhysicsBody;
        return [(VFXPhysicsBody *)&v33 valueForKey:a3];
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F29238];
      objc_msgSend_centerOfMassOffset(self, v30, v31, v32);
    }
    goto LABEL_15;
  }
  uint64_t v19 = (void *)MEMORY[0x1E4F29238];
  objc_msgSend_angularVelocity(self, v16, v17, v18);

  return (id)objc_msgSend_valueWithVFXFloat4_(v19, v20, v21, v22);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if (objc_msgSend_isEqualToString_(a4, a2, @"momentOfInertia", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setMomentOfInertia_(self, v10, v11, v12);
  }
  else if (objc_msgSend_isEqualToString_(a4, v7, @"velocity", v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setVelocity_(self, v16, v17, v18);
  }
  else if (objc_msgSend_isEqualToString_(a4, v13, @"angularVelocity", v15))
  {
    objc_msgSend_VFXFloat4Value(a3, v19, v20, v21);
    objc_msgSend_setAngularVelocity_(self, v22, v23, v24);
  }
  else if (objc_msgSend_isEqualToString_(a4, v19, @"velocityFactor", v21))
  {
    objc_msgSend_VFXFloat3Value(a3, v25, v26, v27);
    objc_msgSend_setVelocityFactor_(self, v28, v29, v30);
  }
  else if (objc_msgSend_isEqualToString_(a4, v25, @"angularVelocityFactor", v27))
  {
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setAngularVelocityFactor_(self, v34, v35, v36);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, @"centerOfMassOffset", v33))
  {
    objc_msgSend_VFXFloat3Value(a3, v37, v38, v39);
    objc_msgSend_setCenterOfMassOffset_(self, v40, v41, v42);
  }
  else
  {
    v43.receiver = self;
    v43.super_class = (Class)VFXPhysicsBody;
    [(VFXPhysicsBody *)&v43 setValue:a3 forKey:a4];
  }
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"mass", v3, self->_mass);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"charge", v7, self->_charge);
  objc_msgSend_encodeDouble_forKey_(a3, v8, @"friction", v9, self->_friction);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"restitution", v11, self->_restitution);
  objc_msgSend_encodeDouble_forKey_(a3, v12, @"rollingFriction", v13, self->_rollingFriction);
  objc_msgSend_encodeDouble_forKey_(a3, v14, @"ccdThreshold", v15, self->_continuousCollisionDetectionThreshold);
  physicsShape = self->_physicsShape;
  if (physicsShape) {
    objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)physicsShape, @"physicsShape");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_type, @"type");
  objc_msgSend_encodeDouble_forKey_(a3, v18, @"damping", v19, self->_damping);
  sub_1B64FA35C(a3, (const char *)@"angularVelocity", *(__n128 *)self->_angularVelocity);
  objc_msgSend_encodeDouble_forKey_(a3, v20, @"angularDamping", v21, self->_angularDamping);
  objc_msgSend_encodeDouble_forKey_(a3, v22, @"linearRestingThreshold", v23, self->_linearRestingThreshold);
  objc_msgSend_encodeDouble_forKey_(a3, v24, @"angularRestingThreshold", v25, self->_angularRestingThreshold);
  sub_1B64FA2F4(a3, (const char *)@"velocityFactor", *(__n128 *)self->_velocityFactor);
  sub_1B64FA2F4(a3, (const char *)@"angularVelocityFactor", *(__n128 *)self->_angularVelocityFactor);
  sub_1B64FA2F4(a3, (const char *)@"velocity", *(__n128 *)self->_velocity);
  objc_msgSend_encodeBool_forKey_(a3, v26, self->_ignoreGravity, @"ignoreGravity");
  objc_msgSend_encodeBool_forKey_(a3, v27, self->_explicitMomentOfInertia, @"explicitMomentOfInertia");
  sub_1B64FA2F4(a3, (const char *)@"momentOfInertia", *(__n128 *)&self->_momentOfInertia[3]);
  sub_1B64FA2F4(a3, (const char *)@"centerOfMassOffset", *(__n128 *)&self->_centerOfMassOffset[3]);
  objc_msgSend_encodeInteger_forKey_(a3, v28, self->_categoryBitMask, @"categoryBitMask");
  objc_msgSend_encodeInteger_forKey_(a3, v29, self->_collisionBitMask, @"collisionBitMask");
  objc_msgSend_encodeInteger_forKey_(a3, v30, self->_contactTestBitMask, @"contactTestBitMask");
  objc_msgSend_encodeBool_forKey_(a3, v31, self->_allowsResting, @"allowsResting");
  BOOL defaultShape = self->_defaultShape;

  objc_msgSend_encodeBool_forKey_(a3, v32, defaultShape, @"defaultShape");
}

- (VFXPhysicsBody)initWithCoder:(id)a3
{
  v147.receiver = self;
  v147.super_class = (Class)VFXPhysicsBody;
  uint64_t v7 = [(VFXPhysicsBody *)&v147 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"charge", v12);
    *(float *)&double v13 = v13;
    objc_msgSend_setCharge_(v7, v14, v15, v16, v13);
    objc_msgSend_decodeDoubleForKey_(a3, v17, @"friction", v18);
    *(float *)&double v19 = v19;
    objc_msgSend_setFriction_(v7, v20, v21, v22, v19);
    objc_msgSend_decodeDoubleForKey_(a3, v23, @"restitution", v24);
    *(float *)&double v25 = v25;
    objc_msgSend_setRestitution_(v7, v26, v27, v28, v25);
    objc_msgSend_decodeDoubleForKey_(a3, v29, @"rollingFriction", v30);
    *(float *)&double v31 = v31;
    objc_msgSend_setRollingFriction_(v7, v32, v33, v34, v31);
    if (objc_msgSend_containsValueForKey_(a3, v35, @"defaultShape", v36)) {
      v7->_BOOL defaultShape = objc_msgSend_decodeBoolForKey_(a3, v37, @"defaultShape", v38);
    }
    uint64_t v39 = objc_opt_class();
    uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v40, v39, @"physicsShape");
    if (v41) {
      objc_msgSend_setPhysicsShape_(v7, v42, v41, v43);
    }
    if (objc_msgSend_containsValueForKey_(a3, v42, @"ccdThreshold", v43))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v44, @"ccdThreshold", v45);
      *(float *)&double v46 = v46;
      objc_msgSend_setContinuousCollisionDetectionThreshold_(v7, v47, v48, v49, v46);
    }
    uint64_t v50 = objc_msgSend_decodeIntegerForKey_(a3, v44, @"type", v45);
    objc_msgSend_setType_(v7, v51, v50, v52);
    objc_msgSend_decodeDoubleForKey_(a3, v53, @"mass", v54);
    *(float *)&double v55 = v55;
    objc_msgSend_setMass_(v7, v56, v57, v58, v55);
    objc_msgSend_decodeDoubleForKey_(a3, v59, @"damping", v60);
    *(float *)&double v61 = v61;
    objc_msgSend_setDamping_(v7, v62, v63, v64, v61);
    *(void *)&double v65 = sub_1B64FA474(a3, (const char *)@"angularVelocity").n128_u64[0];
    objc_msgSend_setAngularVelocity_(v7, v66, v67, v68, v65);
    objc_msgSend_decodeDoubleForKey_(a3, v69, @"angularDamping", v70);
    *(float *)&double v71 = v71;
    objc_msgSend_setAngularDamping_(v7, v72, v73, v74, v71);
    uint64_t v75 = @"linearRestingThreshold";
    if ((objc_msgSend_containsValueForKey_(a3, v76, @"linearRestingThreshold", v77) & 1) != 0
      || (uint64_t v75 = @"linearSleepingThreshold",
          objc_msgSend_containsValueForKey_(a3, v78, @"linearSleepingThreshold", v79)))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v78, (uint64_t)v75, v79);
      *(float *)&double v80 = v80;
      objc_msgSend_setLinearRestingThreshold_(v7, v81, v82, v83, v80);
    }
    uint64_t v84 = @"angularRestingThreshold";
    if ((objc_msgSend_containsValueForKey_(a3, v78, @"angularRestingThreshold", v79) & 1) != 0
      || (uint64_t v84 = @"angularSleepingThreshold",
          objc_msgSend_containsValueForKey_(a3, v85, @"angularSleepingThreshold", v86)))
    {
      objc_msgSend_decodeDoubleForKey_(a3, v85, (uint64_t)v84, v86);
      *(float *)&double v87 = v87;
      objc_msgSend_setAngularRestingThreshold_(v7, v88, v89, v90, v87);
    }
    double v91 = sub_1B64FA42C(a3, (const char *)@"velocityFactor");
    objc_msgSend_setVelocityFactor_(v7, v92, v93, v94, v91);
    double v95 = sub_1B64FA42C(a3, (const char *)@"angularVelocityFactor");
    objc_msgSend_setAngularVelocityFactor_(v7, v96, v97, v98, v95);
    double v99 = sub_1B64FA42C(a3, (const char *)@"velocity");
    objc_msgSend_setVelocity_(v7, v100, v101, v102, v99);
    int v105 = objc_msgSend_decodeBoolForKey_(a3, v103, @"ignoreGravity", v104);
    objc_msgSend_setAffectedByGravity_(v7, v106, v105 ^ 1u, v107);
    int v110 = objc_msgSend_decodeBoolForKey_(a3, v108, @"explicitMomentOfInertia", v109);
    objc_msgSend_setUsesDefaultMomentOfInertia_(v7, v111, v110 ^ 1u, v112);
    double v113 = sub_1B64FA42C(a3, (const char *)@"momentOfInertia");
    objc_msgSend_setMomentOfInertia_(v7, v114, v115, v116, v113);
    double v117 = sub_1B64FA42C(a3, (const char *)@"centerOfMassOffset");
    objc_msgSend_setCenterOfMassOffset_(v7, v118, v119, v120, v117);
    uint64_t v123 = objc_msgSend_decodeIntegerForKey_(a3, v121, @"categoryBitMask", v122);
    objc_msgSend_setCategoryBitMask_(v7, v124, v123, v125);
    uint64_t v128 = objc_msgSend_decodeIntegerForKey_(a3, v126, @"collisionBitMask", v127);
    objc_msgSend_setCollisionBitMask_(v7, v129, v128, v130);
    uint64_t v133 = objc_msgSend_decodeIntegerForKey_(a3, v131, @"contactTestBitMask", v132);
    objc_msgSend_setContactTestBitMask_(v7, v134, v133, v135);
    uint64_t v138 = objc_msgSend_decodeBoolForKey_(a3, v136, @"allowsResting", v137);
    objc_msgSend_setAllowsResting_(v7, v139, v138, v140);
    v7->_body = objc_msgSend__createBody(v7, v141, v142, v143);
    objc_msgSend_setImmediateMode_(VFXTransaction, v144, v8, v145);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)continuousCollisionDetectionThreshold
{
  return self->_continuousCollisionDetectionThreshold;
}

- (id)momentOfInertiaValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_momentOfInertia(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_momentOfInertia(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_momentOfInertia(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setMomentOfInertiaValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setMomentOfInertia_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)velocityValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_velocity(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_velocity(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_velocity(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setVelocityValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setVelocity_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)angularVelocityValue
{
  v37[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_angularVelocity(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v9 = NSNumber;
  objc_msgSend_angularVelocity(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  unsigned int v17 = NSNumber;
  objc_msgSend_angularVelocity(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  uint64_t v26 = NSNumber;
  objc_msgSend_angularVelocity(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v35, (uint64_t)v37, 4);
}

- (void)setAngularVelocityValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v34 = v10;
  double v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v33 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  uint64_t v26 = objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);

  objc_msgSend_setAngularVelocity_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)velocityFactorValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_velocityFactor(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_velocityFactor(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_velocityFactor(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setVelocityFactorValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setVelocityFactor_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)angularVelocityFactorValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_angularVelocityFactor(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  unsigned int v10 = NSNumber;
  objc_msgSend_angularVelocityFactor(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_angularVelocityFactor(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setAngularVelocityFactorValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setAngularVelocityFactor_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (void)applyForceValue:(id)a3 impulse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(a3, v17, 2, v18);
  objc_msgSend_floatValue(v19, v20, v21, v22);

  MEMORY[0x1F4181798](self, sel_applyForce_impulse_, v4, v23);
}

- (void)applyForceValue:(id)a3 atPosition:(id)a4 impulse:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  unsigned int v27 = objc_msgSend_objectAtIndexedSubscript_(a4, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  unsigned int v33 = objc_msgSend_objectAtIndexedSubscript_(a4, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(a4, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);

  MEMORY[0x1F4181798](self, sel_applyForce_atPosition_impulse_, v5, v43);
}

- (void)applyTorqueValue:(id)a3 impulse:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  uint64_t v19 = objc_msgSend_objectAtIndexedSubscript_(a3, v17, 2, v18);
  objc_msgSend_floatValue(v19, v20, v21, v22);
  uint64_t v25 = objc_msgSend_objectAtIndexedSubscript_(a3, v23, 3, v24);
  objc_msgSend_floatValue(v25, v26, v27, v28);

  MEMORY[0x1F4181798](self, sel_applyTorque_impulse_, v4, v29);
}

@end