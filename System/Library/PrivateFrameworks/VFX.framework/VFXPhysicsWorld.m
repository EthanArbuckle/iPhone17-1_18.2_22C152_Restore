@interface VFXPhysicsWorld
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDefault;
- (BOOL)_needsRedraw;
- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5;
- (NSArray)physicsJoints;
- (VFXPhysicsContactDelegate)contactDelegate;
- (VFXPhysicsWorld)initWithCoder:(id)a3;
- (VFXPhysicsWorld)initWithWorld:(id)a3;
- (__n128)gravity;
- (btVehicleRaycaster)_defaultVehicleRayCaster;
- (double)timeStep;
- (float)scale;
- (float)speed;
- (id)_physicsContact;
- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5;
- (id)contactTestBetweenBody:(id)a3 andBody:(id)a4 options:(id)a5;
- (id)contactTestWithBody:(id)a3 options:(id)a4;
- (id)gravityValue;
- (id)objectInAllJointsAtIndex:(unint64_t)a3;
- (id)rayTestWithSegmentFrom:(id)a3 to:(id)a4 options:(id)a5;
- (id)rayTestWithSegmentFromPoint:(VFXPhysicsWorld *)self toPoint:(SEL)a2 options:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (id)world;
- (uint64_t)convexSweepTestWithShape:(void *)a3 fromTransform:(void *)a4 toTransform:(int8x16_t)a5 options:(int8x16_t)a6;
- (void)_allowGhostObjects;
- (void)_createDynamicWorldIfNeeded;
- (void)_drawDebugInAuthoringEnvironment:(void *)a3;
- (void)_handle;
- (void)_handleIfAny;
- (void)_postCommandWithBlock:(id)a3;
- (void)_preTick:(double)a3;
- (void)_registerPhysicsJoints;
- (void)_reset;
- (void)_step:(double)a3;
- (void)activatePhysicsJoint:(id)a3;
- (void)addPhysicsBody:(id)a3 nodeRef:(__CFXNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7;
- (void)addPhysicsJoint:(id)a3;
- (void)commonInit;
- (void)deactivatePhysicsJoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateBodiesUsingBlock:(id)a3;
- (void)removePhysicsBody:(id)a3 handle:(void *)a4;
- (void)removePhysicsJoint:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setGravity:(VFXPhysicsWorld *)self;
- (void)setGravityValue:(id)a3;
- (void)setScale:(float)a3;
- (void)setSpeed:(float)a3;
- (void)setTimeStep:(double)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)setWorld:(id)a3;
- (void)updateCollisionPairs;
- (void)wakeUpAllBodies;
- (void)worldWillDie;
@end

@implementation VFXPhysicsWorld

- (void)_preTick:(double)a3
{
  self->_double elapsedTime = self->_elapsedTime + a3;
  v6 = objc_msgSend_world(self, a2, v3, v4);
  uint64_t v10 = objc_msgSend_worldRef(v6, v7, v8, v9);
  if (v10)
  {
    uint64_t v18 = v10;
    if (sub_1B64B1550(v10, v11, v12, v13, v14, v15, v16, v17))
    {
      sub_1B644520C((uint64_t)&v44, (uint64_t)self->_btWorld + 320);
      v33 = (void *)sub_1B64B2054(v18, v19, v20, v21, v22, v23, v24, v25);
      if (v33)
      {
        if (SHIDWORD(v44) >= 1)
        {
          uint64_t v37 = 0;
          uint64_t v38 = 8 * HIDWORD(v44);
          do
          {
            uint64_t v39 = *(void *)(v45 + v37);
            uint64_t v40 = *(void *)(v39 + 200);
            if (v40) {
              uint64_t v41 = *(void *)(v40 + 8);
            }
            else {
              uint64_t v41 = -1;
            }
            LODWORD(v35) = *(_DWORD *)(v39 + 532);
            double elapsedTime = self->_elapsedTime;
            *(float *)&double elapsedTime = elapsedTime;
            *(float *)&double v34 = 1.0 / *(float *)(v39 + 384);
            LODWORD(v36) = 1.0;
            objc_msgSend_evaluateForceFieldsAtPosition_velocity_mass_charge_time_dt_categoryMask_(v33, v26, v41, v28, *(double *)(v39 + 64), *(double *)(v39 + 352), v34, v35, elapsedTime, v36);
            v43.i32[3] = 0;
            *(float32x4_t *)(v39 + 464) = vaddq_f32(*(float32x4_t *)(v39 + 464), vmulq_f32(v43, *(float32x4_t *)(v39 + 400)));
            v37 += 8;
          }
          while (v38 != v37);
        }
      }
      else
      {
        sub_1B63F2F54(16, @"Error: physicsWorld::preTick - no vfxscene", v27, v28, v29, v30, v31, v32, v44);
      }
      if (v45)
      {
        if (v46) {
          sub_1B6E073C4(v45);
        }
      }
    }
  }
  else
  {
    sub_1B63F2F54(16, @"Error: physicsWorld::preTick - no world", v12, v13, v14, v15, v16, v17, v48);
  }
}

- (void)_createDynamicWorldIfNeeded
{
  if (!self->_btWorld)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_btWorld) {
      operator new();
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (id)_physicsContact
{
  id result = self->_contact;
  if (!result)
  {
    id result = objc_alloc_init(VFXPhysicsContact);
    self->_contact = (VFXPhysicsContact *)result;
  }
  return result;
}

- (void)commonInit
{
  if (qword_1E9DDA7E0 != -1) {
    dispatch_once(&qword_1E9DDA7E0, &unk_1F0FB5728);
  }
  self->_lock._os_unfair_lock_opaque = 0;
  self->_registeredBodies = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
}

- (VFXPhysicsWorld)initWithWorld:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)VFXPhysicsWorld;
  uint64_t v4 = [(VFXPhysicsWorld *)&v15 init];
  uint64_t v8 = v4;
  if (v4)
  {
    objc_msgSend_commonInit(v4, v5, v6, v7);
    *(_OWORD *)v8->_gravity = xmmword_1B6E50970;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v8->_speed = _D0;
    v8->_timeStep = 0.0166666667;
    v8->_vfxWorld = (VFXWorld *)a3;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  physicsJoints = self->_physicsJoints;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1B643F138;
  v33[3] = &unk_1E6141E50;
  v33[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(physicsJoints, a2, (uint64_t)v33, v2);
  if (self->_btWorld)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    registeredBodies = self->_registeredBodies;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v5, (uint64_t)&v29, (uint64_t)v34, 16);
    if (v7)
    {
      uint64_t v11 = v7;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(registeredBodies);
          }
          uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend__handle(v14, v8, v9, v10);
          if (v15) {
            (*(void (**)(void *, uint64_t))(*(void *)self->_btWorld + 184))(self->_btWorld, v15);
          }
          objc_msgSend_flagAsActive_(v14, v16, 0, v17);
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v8, (uint64_t)&v29, (uint64_t)v34, 16);
      }
      while (v11);
    }
  }

  vehicleRayCaster = self->_vehicleRayCaster;
  if (vehicleRayCaster) {
    (*((void (**)(btVehicleRaycaster *))vehicleRayCaster->var0 + 1))(vehicleRayCaster);
  }
  debugDrawer = self->_debugDrawer;
  if (debugDrawer) {
    (*((void (**)(btCFXDebugDraw *))debugDrawer->var0 + 1))(debugDrawer);
  }
  btWorld = self->_btWorld;
  if (btWorld)
  {
    uint64_t v21 = (void *)btWorld[5];
    uint64_t v22 = v21[1311];
    uint64_t v23 = btWorld[12];
    uint64_t v24 = (*(uint64_t (**)(void *))(*btWorld + 200))(btWorld);
    if (self->_ghostPairCallback)
    {
      uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v23 + 72))(v23);
      (*(void (**)(uint64_t, void))(*(void *)v25 + 120))(v25, 0);
      ghostPairCallback = self->_ghostPairCallback;
      if (ghostPairCallback) {
        (*((void (**)(btOverlappingPairCallback *))ghostPairCallback->var0 + 1))(ghostPairCallback);
      }
      self->_ghostPairCallback = 0;
    }
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 8))(v24);
    }
    if (v23) {
      (*(void (**)(uint64_t))(*(void *)v23 + 8))(v23);
    }
    (*(void (**)(void *))(*v21 + 8))(v21);
    if (v22) {
      (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
    }
    uint64_t v27 = self->_btWorld;
    if (v27) {
      (*(void (**)(void *))(*(void *)v27 + 8))(v27);
    }
  }
  objc_storeWeak((id *)&self->_contactDelegate, 0);
  v28.receiver = self;
  v28.super_class = (Class)VFXPhysicsWorld;
  [(VFXPhysicsWorld *)&v28 dealloc];
}

- (void)worldWillDie
{
  self->_vfxWorld = 0;
  btWorld = self->_btWorld;
  if (btWorld)
  {
    uint64_t v3 = btWorld[3];
    if (v3)
    {
      if (*((unsigned char *)btWorld + 32)) {
        sub_1B6E073C4(v3);
      }
    }
    *((unsigned char *)btWorld + 32) = 1;
    btWorld[3] = 0;
    *((_DWORD *)btWorld + 3) = 0;
    *((_DWORD *)btWorld + 4) = 0;
  }
}

- (BOOL)_isDefault
{
  int v3 = VFXVector3EqualToVector3(*(float32x4_t *)self->_gravity, (float32x4_t)xmmword_1B6E50970);
  if (v3) {
    LOBYTE(v3) = self->_speed == 1.0
  }
              && self->_scale == 1.0
              && self->_timeStep == 0.0166666667
              && objc_msgSend_count(self->_physicsJoints, v4, v5, v6) == 0;
  return v3;
}

- (void)wakeUpAllBodies
{
  btWorld = self->_btWorld;
  if (btWorld) {
    sub_1B6E04A00((uint64_t)btWorld);
  }
}

- (void)setGravity:(VFXPhysicsWorld *)self
{
  *(_OWORD *)self->_gravity = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1B643F290;
  v4[3] = &unk_1E61412D0;
  uint64_t v6 = self;
  long long v5 = v3;
  objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v4, v2);
}

- (__n128)gravity
{
  return a1[5];
}

- (void)setSpeed:(float)a3
{
  self->_speed = a3;
}

- (float)speed
{
  return self->_speed;
}

- (void)setScale:(float)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1B643F41C;
    v11[3] = &unk_1E6141208;
    v11[4] = self;
    float v12 = a3;
    objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v11, v3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B643F434;
    v9[3] = &unk_1E6141FA0;
    float v10 = a3;
    objc_msgSend_enumerateBodiesUsingBlock_(self, v6, (uint64_t)v9, v7);
    debugDrawer = self->_debugDrawer;
    if (debugDrawer) {
      debugDrawer->var2 = 1.0 / self->_scale;
    }
  }
}

- (float)scale
{
  return self->_scale;
}

- (void)setTimeStep:(double)a3
{
  self->_timeStep = a3;
}

- (double)timeStep
{
  return self->_timeStep;
}

- (VFXPhysicsContactDelegate)contactDelegate
{
  return (VFXPhysicsContactDelegate *)objc_loadWeak((id *)&self->_contactDelegate);
}

- (void)setContactDelegate:(id)a3
{
  p_contactDelegate = &self->_contactDelegate;
  if (objc_loadWeak((id *)&self->_contactDelegate) != a3) {
    objc_storeWeak((id *)p_contactDelegate, a3);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1B643F50C;
  v8[3] = &unk_1E6141230;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v6, (uint64_t)v8, v7);
}

- (void)addPhysicsJoint:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  physicsJoints = self->_physicsJoints;
  if (!physicsJoints)
  {
    physicsJoints = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_physicsJoints = physicsJoints;
  }
  objc_msgSend_addObject_(physicsJoints, v6, (uint64_t)a3, v7);
  os_unfair_lock_unlock(p_lock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1B643F5E8;
  v11[3] = &unk_1E6141230;
  v11[4] = self;
  void v11[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v9, (uint64_t)v11, v10);
}

- (void)activatePhysicsJoint:(id)a3
{
  if ((objc_msgSend_isActive(a3, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend__addToPhysicsWorld_(a3, v6, (uint64_t)self, v7);
    uint64_t v11 = objc_msgSend_bodyA(a3, v8, v9, v10);
    objc_msgSend__activate(v11, v12, v13, v14);
    uint64_t v18 = objc_msgSend_bodyB(a3, v15, v16, v17);
    objc_msgSend__activate(v18, v19, v20, v21);
  }
}

- (void)deactivatePhysicsJoint:(id)a3
{
  if (objc_msgSend_isActive(a3, a2, (uint64_t)a3, v3))
  {
    objc_msgSend__willRemoveFromPhysicsWorld_(a3, v6, (uint64_t)self, v7);
    uint64_t v11 = objc_msgSend_bodyA(a3, v8, v9, v10);
    objc_msgSend__activate(v11, v12, v13, v14);
    uint64_t v18 = objc_msgSend_bodyB(a3, v15, v16, v17);
    objc_msgSend__activate(v18, v19, v20, v21);
  }
}

- (void)removePhysicsJoint:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1B643F774;
  v10[3] = &unk_1E6141230;
  v10[4] = self;
  v10[5] = a3;
  objc_msgSend__postCommandWithBlock_(self, v6, (uint64_t)v10, v7);
  objc_msgSend_removeObject_(self->_physicsJoints, v8, (uint64_t)a3, v9);
  os_unfair_lock_unlock(p_lock);
}

- (id)objectInAllJointsAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_physicsJoints, a2, a3, v3);
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  uint64_t v8 = objc_msgSend_rangeOfString_(a3, a2, @"[", (uint64_t)a4);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v12 = v8;
  uint64_t v13 = v8 + 1;
  if (v8 + 1 >= (unint64_t)objc_msgSend_length(a3, v9, v10, v11)) {
    return 0;
  }
  uint64_t v16 = objc_msgSend_substringToIndex_(a3, v14, v12, v15);
  uint64_t v19 = objc_msgSend_substringFromIndex_(a3, v17, v13, v18);
  uint64_t v22 = objc_msgSend_rangeOfString_(v19, v20, @"]", v21);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v25 = objc_msgSend_substringToIndex_(v19, v23, v22, v24);
  int v29 = objc_msgSend_intValue(v25, v26, v27, v28);
  long long v32 = objc_msgSend_valueForKey_(self, v30, v16, v31);
  if (objc_msgSend_count(v32, v33, v34, v35) <= (unint64_t)v29) {
    return 0;
  }
  *a5 = (id)objc_msgSend_objectAtIndex_(v32, v36, v29, v37);
  return 1;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v16 = 0;
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, a2, (uint64_t)a3, (uint64_t)a3, &v16)) {
    return v16;
  }
  if (objc_msgSend_isEqual_(a3, v5, @"gravity", v6))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F29238];
    objc_msgSend_gravity(self, v8, v9, v10);
    return (id)objc_msgSend_valueWithVFXFloat3_(v11, v12, v13, v14);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VFXPhysicsWorld;
    return [(VFXPhysicsWorld *)&v15 valueForUndefinedKey:a3];
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  if (objc_msgSend_isEqual_(a4, a2, @"gravity", (uint64_t)a4))
  {
    objc_msgSend_VFXFloat3Value(a3, v7, v8, v9);
    objc_msgSend_setGravity_(self, v10, v11, v12);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)VFXPhysicsWorld;
    [(VFXPhysicsWorld *)&v13 setValue:a3 forUndefinedKey:a4];
  }
}

- (NSArray)physicsJoints
{
  if (self->_physicsJoints) {
    return &self->_physicsJoints->super;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (id)rayTestWithSegmentFromPoint:(VFXPhysicsWorld *)self toPoint:(SEL)a2 options:(id)a3
{
  HIDWORD(v3) = 0;
  HIDWORD(v4) = 0;
  long long v6 = v4;
  long long v7 = v3;
  id result = (id)objc_msgSend__rayTestWithSegmentFromPoint_toPoint_options_(self, a2, (uint64_t)&v7, (uint64_t)&v6, a3);
  if (!result) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (id)_rayTestWithSegmentFromPoint:(btVector3)a3 toPoint:(btVector3)a4 options:(id)a5
{
  long long v7 = v6;
  uint64_t v8 = (_OWORD *)v5;
  uint64_t v11 = objc_msgSend_world(self, a2, (uint64_t)a5, v5, *(double *)a3.var0.var0, *(double *)&a3.var0.var0[1], *(double *)&a3.var0.var0[2], *(double *)&a3.var0.var0[3], *(double *)a4.var0.var0, *(double *)&a4.var0.var0[1], *(double *)&a4.var0.var0[2], *(double *)&a4.var0.var0[3]);
  uint64_t v15 = objc_msgSend_worldRef(v11, v12, v13, v14);
  if (!v15 || !self->_btWorld) {
    return 0;
  }
  uint64_t v16 = v15;
  double v17 = sub_1B64449AC((uint64_t)v59, a5, v8);
  uint64_t v20 = objc_msgSend_objectForKey_(v7, v18, @"backfaceCulling", v19, v17);
  if (!v20 || objc_msgSend_BOOLValue(v20, v21, v22, v23)) {
    v60 |= 1u;
  }
  uint64_t v24 = objc_msgSend_objectForKey_(v7, v21, @"results", v23);
  if (objc_msgSend_isEqualToString_(v24, v25, @"all", v26)) {
    int v29 = 2;
  }
  else {
    int v29 = objc_msgSend_isEqualToString_(v24, v27, @"closest", v28) ^ 1;
  }
  int v61 = v29;
  long long v30 = objc_msgSend_objectForKey_(v7, v27, @"collisionBitMask", v28);
  if (v30) {
    uint64_t v38 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33);
  }
  else {
    uint64_t v38 = -1;
  }
  v59[4] = v38;
  sub_1B64B0C28(v16, (uint64_t)v31, v32, v33, v34, v35, v36, v37);
  (*(void (**)(void *, id, _OWORD *, void *))(*(void *)self->_btWorld + 64))(self->_btWorld, a5, v8, v59);
  sub_1B64B0CB4(v16, v39, v40, v41, v42, v43, v44, v45);
  if (v61 == 2)
  {
    int v48 = v64;
    v49 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v46, v64, v47);
    if (v48 >= 1)
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        id v52 = sub_1B643F9EC(*(void *)(v65 + 8 * i), (float32x4_t *)(v73 + 16 * i), (float32x4_t *)(v69 + 16 * i));
        if (v52) {
          objc_msgSend_addObject_(v49, v51, (uint64_t)v52, v53);
        }
      }
    }
  }
  else
  {
    id v55 = sub_1B643F9EC(v59[2], &v63, &v62);
    if (!v55)
    {
      v49 = 0;
      char v57 = 0;
      goto LABEL_22;
    }
    v49 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v54, (uint64_t)v55, v56);
  }
  char v57 = 1;
LABEL_22:
  v59[0] = &unk_1F0FB1B38;
  if (v77 && v78) {
    sub_1B6E073C4(v77);
  }
  char v78 = 1;
  uint64_t v77 = 0;
  int v75 = 0;
  int v76 = 0;
  if (v73 && v74) {
    sub_1B6E073C4(v73);
  }
  char v74 = 1;
  uint64_t v73 = 0;
  int v71 = 0;
  int v72 = 0;
  if (v69 && v70) {
    sub_1B6E073C4(v69);
  }
  char v70 = 1;
  uint64_t v69 = 0;
  int v67 = 0;
  int v68 = 0;
  if (v65 && v66) {
    sub_1B6E073C4(v65);
  }
  if ((v57 & 1) == 0) {
    return 0;
  }
  return v49;
}

- (id)contactTestBetweenBody:(id)a3 andBody:(id)a4 options:(id)a5
{
  uint64_t v9 = objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v13 = objc_msgSend_worldRef(v9, v10, v11, v12);
  if (v13)
  {
    btWorld = self->_btWorld;
    if (btWorld)
    {
      uint64_t v17 = v13;
      uint64_t v18 = objc_msgSend_objectForKey_(a5, v14, @"collisionBitMask", v15);
      if (v18) {
        uint64_t v26 = objc_msgSend_unsignedIntegerValue(v18, v19, v20, v21);
      }
      else {
        uint64_t v26 = -1;
      }
      uint64_t v43 = &unk_1F0FB23C0;
      long long v44 = xmmword_1B6E50980;
      long long v45 = xmmword_1B6E4F270;
      uint64_t v46 = v26;
      uint64_t v47 = 0;
      sub_1B64B0C28(v17, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
      uint64_t v30 = objc_msgSend__handle(a3, v27, v28, v29);
      uint64_t v34 = objc_msgSend__handle(a4, v31, v32, v33);
      if (v30)
      {
        uint64_t v36 = v34;
        if (v34) {
          sub_1B6DD494C((uint64_t)self->_btWorld, v30, v34, (uint64_t)&v43);
        }
      }
      sub_1B64B0CB4(v17, v35, v36, v37, v38, v39, v40, v41);
      btWorld = v47;
    }
  }
  else
  {
    btWorld = 0;
  }
  if (btWorld) {
    return btWorld;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (id)contactTestWithBody:(id)a3 options:(id)a4
{
  long long v7 = objc_msgSend_world(self, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v11 = objc_msgSend_worldRef(v7, v8, v9, v10);
  if (v11)
  {
    btWorld = self->_btWorld;
    if (btWorld)
    {
      uint64_t v15 = v11;
      uint64_t v16 = objc_msgSend_objectForKey_(a4, v12, @"collisionBitMask", v13);
      if (v16) {
        uint64_t v24 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
      }
      else {
        uint64_t v24 = -1;
      }
      uint64_t v37 = &unk_1F0FB23C0;
      long long v38 = xmmword_1B6E50980;
      long long v39 = xmmword_1B6E4F270;
      uint64_t v40 = v24;
      uint64_t v41 = 0;
      sub_1B64B0C28(v15, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
      uint64_t v28 = objc_msgSend__handle(a3, v25, v26, v27);
      if (v28) {
        sub_1B6DD4884((uint64_t)self->_btWorld, v28, (uint64_t)&v37);
      }
      sub_1B64B0CB4(v15, v29, v30, v31, v32, v33, v34, v35);
      btWorld = v41;
    }
  }
  else
  {
    btWorld = 0;
  }
  if (btWorld) {
    return btWorld;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (uint64_t)convexSweepTestWithShape:(void *)a3 fromTransform:(void *)a4 toTransform:(int8x16_t)a5 options:(int8x16_t)a6
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = objc_msgSend_world(a1, a2, (uint64_t)a3, (uint64_t)a4);
  uint64_t v19 = objc_msgSend_worldRef(v15, v16, v17, v18);
  if (!v19) {
    return MEMORY[0x1E4F1CBF0];
  }
  uint64_t v22 = MEMORY[0x1E4F1CBF0];
  if (a1[1])
  {
    uint64_t v23 = v19;
    uint64_t v24 = objc_msgSend_objectForKey_(a4, v20, @"ccdPenetration", v21);
    if (v24)
    {
      objc_msgSend_floatValue(v24, v25, v26, v27);
      float v29 = v28;
    }
    else
    {
      float v29 = 0.0;
    }
    uint64_t v30 = objc_msgSend_objectForKey_(a4, v25, @"collisionBitMask", v27);
    if (v30) {
      uint64_t v34 = objc_msgSend_unsignedIntegerValue(v30, v31, v32, v33);
    }
    else {
      uint64_t v34 = -1;
    }
    uint64_t v35 = objc_msgSend_objectForKey_(a4, v31, @"results", v33);
    if (objc_msgSend_isEqualToString_(v35, v36, @"all", v37)) {
      int v45 = 2;
    }
    else {
      int v45 = objc_msgSend_isEqualToString_(v35, v38, @"closest", v40) ^ 1;
    }
    sub_1B64B0C28(v23, (uint64_t)v38, v39, v40, v41, v42, v43, v44);
    int v48 = objc_msgSend__shapeHandle_(a3, v46, 0, v47);
    uint64_t v52 = objc_msgSend_btShape(v48, v49, v50, v51);
    if (v52)
    {
      if (*(int *)(v52 + 8) > 19)
      {
        sub_1B63F2F54(16, @"Error: convexSweep only works with convex shapes", (uint64_t)v54, v55, v56, v57, v58, v59, a5.i64[0]);
      }
      else
      {
        int32x2_t v80 = vzip1_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
        unsigned __int32 v81 = a7.n128_u32[0];
        int v82 = 0;
        int32x2_t v83 = vzip2_s32(*(int32x2_t *)a5.i8, *(int32x2_t *)a6.i8);
        unsigned __int32 v84 = a7.n128_u32[1];
        int v85 = 0;
        int32x2_t v86 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a5, a5, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a6, a6, 8uLL));
        unsigned __int32 v87 = a7.n128_u32[2];
        int v88 = 0;
        *(void *)&long long v89 = a8.n128_u64[0];
        *((void *)&v89 + 1) = a8.n128_u32[2];
        int32x2_t v70 = vzip1_s32(*(int32x2_t *)a9.i8, *(int32x2_t *)a10.i8);
        unsigned __int32 v71 = a11.n128_u32[0];
        int v72 = 0;
        int32x2_t v73 = vzip2_s32(*(int32x2_t *)a9.i8, *(int32x2_t *)a10.i8);
        unsigned __int32 v74 = a11.n128_u32[1];
        int v75 = 0;
        int32x2_t v76 = vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a9, a9, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a10, a10, 8uLL));
        unsigned __int32 v77 = a11.n128_u32[2];
        int v78 = 0;
        *(void *)&long long v79 = a12.n128_u64[0];
        *((void *)&v79 + 1) = a12.n128_u32[2];
        float v91 = 1.0;
        uint64_t v92 = 1;
        uint64_t v93 = v34;
        uint64_t v94 = 0;
        long long v95 = v89;
        long long v96 = v79;
        uint64_t v98 = 0;
        uint64_t v101 = 0;
        v90 = &unk_1F0FB2198;
        int v97 = v45;
        sub_1B6DD470C(a1[1], v52, (uint64_t)&v80, (uint64_t)&v70, (uint64_t)&v90, v29);
        if (v91 < 1.0)
        {
          if (v45 == 2)
          {
            uint64_t v60 = v101;
            goto LABEL_20;
          }
          v54 = sub_1B64402F4(v98, 0, &v100, &v99, 0.0, v91);
          if (v54)
          {
            uint64_t v60 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v53, (uint64_t)v54, v55);
LABEL_20:
            sub_1B64B0CB4(v23, (uint64_t)v53, (uint64_t)v54, v55, v56, v57, v58, v59);
            if (v60) {
              return v60;
            }
            return v22;
          }
        }
      }
    }
    uint64_t v60 = 0;
    goto LABEL_20;
  }
  return v22;
}

- (void)updateCollisionPairs
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = sub_1B6440444;
  v3[3] = &unk_1E61411E0;
  v3[4] = self;
  objc_msgSend__postCommandWithBlock_(self, a2, (uint64_t)v3, v2);
}

- (BOOL)_needsRedraw
{
  return self->_speed != 0.0 && (btWorld = self->_btWorld) != 0 && btWorld[448] != 0;
}

- (void)enumerateBodiesUsingBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  char v17 = 0;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  registeredBodies = self->_registeredBodies;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v7, (uint64_t)&v13, (uint64_t)v18, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v14 != v10) {
        objc_enumerationMutation(registeredBodies);
      }
      (*((void (**)(id, void, char *))a3 + 2))(a3, *(void *)(*((void *)&v13 + 1) + 8 * v11), &v17);
      if (v17) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v12, (uint64_t)&v13, (uint64_t)v18, 16);
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_reset
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  registeredBodies = self->_registeredBodies;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v5, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(registeredBodies);
        }
        long long v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend_clearAllForces(v13, v7, v8, v9);
        objc_msgSend_resetTransform(v13, v14, v15, v16);
        objc_msgSend_setVelocity_(v13, v17, v18, v19, 0.0);
        objc_msgSend_setAngularVelocity_(v13, v20, v21, v22, 0.0);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(registeredBodies, v7, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v10);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_step:(double)a3
{
  btWorld = self->_btWorld;
  if (btWorld)
  {
    float timeStep = self->_timeStep;
    float speed = self->_speed;
    a3 = speed * a3;
    *(float *)&a3 = a3;
    int v7 = vcvtps_s32_f32(speed * (float)((float)(1.0 / timeStep) / 15.0));
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = btWorld[5];
    if (!self->_firstSimulationDone)
    {
      self->_firstSimulationDone = 1;
      if (timeStep >= *(float *)&a3) {
        *(float *)&a3 = timeStep;
      }
    }
    (*(void (**)(void *, uint64_t, __n128))(*btWorld + 104))(btWorld, v8, *(__n128 *)&a3);
    if (objc_loadWeak((id *)&self->_contactDelegate))
    {
      sub_1B64409C4(v9, v10, v11, v12);
    }
  }
}

- (btVehicleRaycaster)_defaultVehicleRayCaster
{
  id result = self->_vehicleRayCaster;
  if (!result)
  {
    objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
    operator new();
  }
  return result;
}

- (void)_handle
{
  objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
  return self->_btWorld;
}

- (void)_handleIfAny
{
  return self->_btWorld;
}

- (void)_allowGhostObjects
{
  if (!self->_ghostPairCallback)
  {
    objc_msgSend__createDynamicWorldIfNeeded(self, a2, v2, v3);
    operator new();
  }
}

- (id)world
{
  return self->_vfxWorld;
}

- (void)setWorld:(id)a3
{
  self->_vfxWorld = (VFXWorld *)a3;
}

- (void)_postCommandWithBlock:(id)a3
{
  uint64_t v7 = objc_msgSend_worldRef(self->_vfxWorld, a2, (uint64_t)a3, v3);
  vfxWorld = self->_vfxWorld;

  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v7, (uint64_t)vfxWorld, a3);
}

- (void)_drawDebugInAuthoringEnvironment:(void *)a3
{
  if (self->_btWorld)
  {
    debugDrawer = self->_debugDrawer;
    if (debugDrawer)
    {
      debugDrawer->var3 = a3;
      (*(void (**)(void *, btCFXDebugDraw *))(*(void *)self->_btWorld + 32))(self->_btWorld, self->_debugDrawer);
      (*(void (**)(void *))(*(void *)self->_btWorld + 48))(self->_btWorld);
      (*(void (**)(void *, void))(*(void *)self->_btWorld + 32))(self->_btWorld, 0);
      self->_debugDrawer->var3 = 0;
    }
  }
}

- (void)addPhysicsBody:(id)a3 nodeRef:(__CFXNode *)a4 colGroup:(unint64_t)a5 colMask:(unint64_t)a6 colTest:(unint64_t)a7
{
  uint64_t v13 = objc_msgSend__handle(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v13)
  {
    uint64_t v17 = v13;
    objc_msgSend_centerOfMassOffset(a3, v14, v15, v16);
    __n128 v27 = v18;
    uint64_t v22 = objc_msgSend__handle(a3, v19, v20, v21);
    sub_1B6440750(v17, v22, a4, a5, a6, a7, v27);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_addObject_(self->_registeredBodies, v23, (uint64_t)a3, v24);
  objc_msgSend_flagAsActive_(a3, v25, 1, v26);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removePhysicsBody:(id)a3 handle:(void *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  btWorld = self->_btWorld;
  if (btWorld) {
    (*(void (**)(void *, void *))(*(void *)btWorld + 184))(btWorld, a4);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeObject_(self->_registeredBodies, v7, (uint64_t)a3, v8);
  objc_msgSend_flagAsActive_(a3, v9, 0, v10);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  physicsJoints = self->_physicsJoints;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(physicsJoints, v12, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(physicsJoints);
        }
        uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ((id)objc_msgSend_bodyA(v20, v14, v15, v16) == a3 || (id)objc_msgSend_bodyB(v20, v14, v21, v16) == a3) {
          objc_msgSend_deactivatePhysicsJoint_(self, v14, (uint64_t)v20, v16);
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(physicsJoints, v14, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v17);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)encodeWithCoder:(id)a3
{
  vfxWorld = self->_vfxWorld;
  if (vfxWorld) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)vfxWorld, @"world");
  }
  physicsJoints = self->_physicsJoints;
  if (physicsJoints) {
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)physicsJoints, @"joints");
  }
  sub_1B64FA2F4(a3, (const char *)@"gravity", *(__n128 *)self->_gravity);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"speed", v8, self->_speed);
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"scale", v10, self->_scale);
  double timeStep = self->_timeStep;

  objc_msgSend_encodeDouble_forKey_(a3, v11, @"timeStep", v12, timeStep);
}

- (VFXPhysicsWorld)initWithCoder:(id)a3
{
  v45.receiver = self;
  v45.super_class = (Class)VFXPhysicsWorld;
  uint64_t v7 = [(VFXPhysicsWorld *)&v45 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    objc_msgSend_commonInit(v7, v11, v12, v13);
    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v15, v14, @"world");
    objc_msgSend_setWorld_(v7, v17, v16, v18);
    double v19 = sub_1B64FA42C(a3, (const char *)@"gravity");
    objc_msgSend_setGravity_(v7, v20, v21, v22, v19);
    objc_msgSend_decodeDoubleForKey_(a3, v23, @"speed", v24);
    *(float *)&double v25 = v25;
    objc_msgSend_setSpeed_(v7, v26, v27, v28, v25);
    objc_msgSend_decodeDoubleForKey_(a3, v29, @"scale", v30);
    *(float *)&double v31 = v31;
    objc_msgSend_setScale_(v7, v32, v33, v34, v31);
    objc_msgSend_decodeDoubleForKey_(a3, v35, @"timeStep", v36);
    objc_msgSend_setTimeStep_(v7, v37, v38, v39);
    uint64_t v40 = objc_opt_class();
    v7->_tempLoadedJoints = (NSArray *)(id)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v41, v40, @"joints");
    objc_msgSend_setImmediateMode_(VFXTransaction, v42, v8, v43);
  }
  return v7;
}

- (void)_registerPhysicsJoints
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  tempLoadedJoints = self->_tempLoadedJoints;
  uint64_t v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(tempLoadedJoints, a2, (uint64_t)&v10, (uint64_t)v14, 16);
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(tempLoadedJoints);
        }
        objc_msgSend_addPhysicsJoint_(self, v5, *(void *)(*((void *)&v10 + 1) + 8 * i), v6);
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(tempLoadedJoints, v5, (uint64_t)&v10, (uint64_t)v14, 16);
    }
    while (v7);
  }

  self->_tempLoadedJoints = 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)gravityValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSNumber;
  objc_msgSend_gravity(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  long long v10 = NSNumber;
  objc_msgSend_gravity(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  uint64_t v18 = NSNumber;
  objc_msgSend_gravity(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (void)setGravityValue:(id)a3
{
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  unsigned int v28 = v10;
  uint64_t v13 = objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  unsigned int v27 = v17;
  uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);

  objc_msgSend_setGravity_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)rayTestWithSegmentFrom:(id)a3 to:(id)a4 options:(id)a5
{
  uint64_t v9 = objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  uint64_t v15 = objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  unsigned int v27 = objc_msgSend_objectAtIndexedSubscript_(a4, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  uint64_t v33 = objc_msgSend_objectAtIndexedSubscript_(a4, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(a4, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);

  return (id)MEMORY[0x1F4181798](self, sel_rayTestWithSegmentFromPoint_toPoint_options_, a5, v43);
}

@end