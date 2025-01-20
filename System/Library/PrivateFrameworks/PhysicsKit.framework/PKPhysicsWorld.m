@interface PKPhysicsWorld
+ (BOOL)supportsSecureCoding;
+ (id)world;
- (BOOL)_doSleep;
- (BOOL)hasBodies;
- (BOOL)hasFields;
- (BOOL)isEqualToWorld:(id)a3;
- (BOOL)isSettling;
- (BOOL)stepWithTime:(double)a3 velocityIterations:(unint64_t)a4 positionIterations:(unint64_t)a5;
- (CGVector)evalForce:(unsigned int)a3 point:(CGPoint)a4;
- (CGVector)gravity;
- (CGVector)sampleFields:(CGPoint)a3;
- (NSMutableArray)_bodies;
- (PKPhysicsContactDelegate)contactDelegate;
- (PKPhysicsWorld)init;
- (PKPhysicsWorld)initWithCoder:(id)a3;
- (__n128)sampleFieldsAt:(uint64_t)a1;
- (b2Vec2)_gravity;
- (const)debugDrawPacket;
- (double)settlingAngularVelocityThreshold;
- (double)settlingDuration;
- (double)settlingLinearVelocityThreshold;
- (double)speed;
- (double)velocityThreshold;
- (id).cxx_construct;
- (id)bodies;
- (id)bodyAlongRayStart:(CGPoint)a3 end:(CGPoint)a4;
- (id)bodyAtPoint:(CGPoint)a3;
- (id)bodyInRect:(CGRect)a3;
- (id)collisionDelegate;
- (id)copy;
- (id)joints;
- (id)sampleFields:(CGRect)a3 categories:(unsigned int)a4 dataSize:(CGSize)a5;
- (void)__init__;
- (void)_runBlockOutsideOfTimeStep:(id)a3;
- (void)_world;
- (void)addBody:(id)a3;
- (void)addField:(id)a3;
- (void)addJoint:(id)a3;
- (void)aether;
- (void)dealloc;
- (void)debugDraw:(float)a3 matrix:(_GLSKMatrix4 *)a4 showsPhysics:(BOOL)a5 showsOutlineInterior:(BOOL)a6 showsFields:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateBodiesAlongRayStart:(CGPoint)a3 end:(CGPoint)a4 usingBlock:(id)a5;
- (void)enumerateBodiesAtPoint:(CGPoint)a3 usingBlock:(id)a4;
- (void)enumerateBodiesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)removeAllBodies;
- (void)removeAllFields;
- (void)removeAllJoints;
- (void)removeBody:(id)a3;
- (void)removeField:(id)a3;
- (void)removeJoint:(id)a3;
- (void)setCollisionDelegate:(id)a3;
- (void)setContactDelegate:(id)a3;
- (void)setGravity:(CGVector)a3;
- (void)setSettlingAngularVelocityThreshold:(double)a3;
- (void)setSettlingDuration:(double)a3;
- (void)setSettlingLinearVelocityThreshold:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setVelocityThreshold:(double)a3;
- (void)set_bodies:(id)a3;
- (void)set_doSleep:(BOOL)a3;
- (void)set_gravity:(b2Vec2)a3;
@end

@implementation PKPhysicsWorld

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)aether
{
  return (void *)*((void *)self->_world + 12894);
}

- (void)enumerateBodiesAtPoint:(CGPoint)a3 usingBlock:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = x + -0.5;
  double v9 = y + -0.5;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v16.origin.double x = v8;
  v16.origin.double y = v9;
  if (!CGRectIsEmpty(v16))
  {
    v17.size.width = 1.0;
    v17.size.height = 1.0;
    v17.origin.double x = v8;
    v17.origin.double y = v9;
    if (!CGRectIsNull(v17))
    {
      v18.size.width = 1.0;
      v18.size.height = 1.0;
      v18.origin.double x = v8;
      v18.origin.double y = v9;
      if (CGRectIsInfinite(v18))
      {
        long long v15 = xmmword_21359AA40;
      }
      else
      {
        *(float *)&unsigned int v10 = v8 * PKGet_INV_PTM_RATIO();
        *(float *)&unsigned int v11 = v9 * PKGet_INV_PTM_RATIO();
        *(void *)&long long v15 = __PAIR64__(v11, v10);
        *((float *)&v15 + 2) = PKGet_INV_PTM_RATIO() + *(float *)&v10;
        *((float *)&v15 + 3) = PKGet_INV_PTM_RATIO() + *(float *)&v11;
      }
      v12[2] = 1;
      memset(v13, 0, 32);
      v13[4] = 1065353216;
      v12[0] = &unk_26C3F3808;
      v12[1] = v15;
      id v14 = (id)MEMORY[0x21668CC60](v7);

      b2World::QueryAABB((uint64_t)self->_world, (uint64_t)v12, (float *)&v15);
      v12[0] = &unk_26C3F3808;

      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::~__hash_table((uint64_t)v13);
    }
  }
}

- (void)enumerateBodiesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v22.origin.double x = x;
  v22.origin.double y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  if (!CGRectIsEmpty(v22))
  {
    v23.origin.double x = x;
    v23.origin.double y = y;
    v23.size.double width = width;
    v23.size.double height = height;
    if (!CGRectIsNull(v23))
    {
      v24.origin.double x = x;
      v24.origin.double y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      if (CGRectIsInfinite(v24))
      {
        long long v21 = xmmword_21359AA40;
      }
      else
      {
        *(float *)&unsigned int v10 = x * PKGet_INV_PTM_RATIO();
        *(float *)&unsigned int v11 = y * PKGet_INV_PTM_RATIO();
        *(void *)&long long v21 = __PAIR64__(v11, v10);
        float v12 = PKGet_INV_PTM_RATIO();
        float v13 = PKGet_INV_PTM_RATIO();
        *(float *)&unsigned int v14 = *(float *)&v10 + width * v12;
        *(float *)&unsigned int v15 = *(float *)&v11 + height * v13;
        *((void *)&v21 + 1) = __PAIR64__(v15, v14);
      }
      long long v17 = 0u;
      memset(v18, 0, sizeof(v18));
      CGRect v16 = &unk_26C3F3808;
      uint64_t v19 = 1065353216;
      id v20 = (id)MEMORY[0x21668CC60](v9);

      b2World::QueryAABB((uint64_t)self->_world, (uint64_t)&v16, (float *)&v21);
      CGRect v16 = &unk_26C3F3808;

      std::__hash_table<void *,std::hash<void *>,std::equal_to<void *>,std::allocator<void *>>::~__hash_table((uint64_t)v18);
    }
  }
}

- (void)enumerateBodiesAlongRayStart:(CGPoint)a3 end:(CGPoint)a4 usingBlock:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = a5;
  float v11 = PKGet_INV_PTM_RATIO();
  float v12 = PKGet_INV_PTM_RATIO();
  *(float *)&unsigned int v13 = v8 * v11;
  *(float *)&unsigned int v14 = v7 * v12;
  unint64_t v28 = __PAIR64__(v14, v13);
  float v15 = PKGet_INV_PTM_RATIO();
  float v16 = PKGet_INV_PTM_RATIO();
  *(float *)&unsigned int v17 = x * v15;
  *(float *)&unsigned int v18 = y * v16;
  unint64_t v27 = __PAIR64__(v18, v17);
  CGRect v23 = &unk_26C3F3B18;
  id v24 = 0;
  v25[0] = (uint64_t)v25;
  v25[1] = (uint64_t)v25;
  v25[2] = 0;
  unint64_t v26 = 0;
  uint64_t v19 = (void *)MEMORY[0x21668CC60](v10);
  id v20 = v24;
  id v24 = v19;

  *(float *)&unsigned int v21 = v8;
  *(float *)&unsigned int v22 = v7;
  unint64_t v26 = __PAIR64__(v22, v21);
  b2World::RayCast((uint64_t)self->_world, (uint64_t)&v23, &v28, (uint64_t *)&v27);
  PKRayCastHandler::issueCallbacks((PKRayCastHandler *)&v23);
  CGRect v23 = &unk_26C3F3B18;
  std::__list_imp<PKRayCastItem>::clear(v25);
}

- (id)bodyAtPoint:(CGPoint)a3
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __30__PKPhysicsWorld_bodyAtPoint___block_invoke;
  v5[3] = &unk_2641AF920;
  v5[4] = &v6;
  -[PKPhysicsWorld enumerateBodiesAtPoint:usingBlock:](self, "enumerateBodiesAtPoint:usingBlock:", v5, a3.x, a3.y);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__PKPhysicsWorld_bodyAtPoint___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)bodyInRect:(CGRect)a3
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__PKPhysicsWorld_bodyInRect___block_invoke;
  v5[3] = &unk_2641AF920;
  v5[4] = &v6;
  -[PKPhysicsWorld enumerateBodiesInRect:usingBlock:](self, "enumerateBodiesInRect:usingBlock:", v5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __29__PKPhysicsWorld_bodyInRect___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)bodyAlongRayStart:(CGPoint)a3 end:(CGPoint)a4
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__PKPhysicsWorld_bodyAlongRayStart_end___block_invoke;
  v6[3] = &unk_2641AF948;
  v6[4] = &v7;
  -[PKPhysicsWorld enumerateBodiesAlongRayStart:end:usingBlock:](self, "enumerateBodiesAlongRayStart:end:usingBlock:", v6, a3.x, a3.y, a4.x, a4.y);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__PKPhysicsWorld_bodyAlongRayStart_end___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)setSpeed:(double)a3
{
  float v3 = a3;
  self->_speed = v3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setVelocityThreshold:(double)a3
{
  float v3 = a3;
  b2World::SetVelocityThreshold((b2World *)self->_world, v3);
}

- (double)velocityThreshold
{
  return b2World::GetVelocityThreshold((b2World *)self->_world);
}

- (BOOL)isSettling
{
  return b2World::IsSettling((b2World *)self->_world);
}

- (void)setSettlingLinearVelocityThreshold:(double)a3
{
  float v3 = a3;
  b2World::SetSettlingLinearVelocityThreshold((b2World *)self->_world, v3);
}

- (double)settlingLinearVelocityThreshold
{
  return b2World::GetSettlingLinearVelocityThreshold((b2World *)self->_world);
}

- (void)setSettlingAngularVelocityThreshold:(double)a3
{
  float v3 = a3;
  b2World::SetSettlingAngularVelocityThreshold((b2World *)self->_world, v3);
}

- (double)settlingAngularVelocityThreshold
{
  return b2World::GetSettlingAngularVelocityThreshold((b2World *)self->_world);
}

- (void)setSettlingDuration:(double)a3
{
  float v3 = a3;
  b2World::SetSettlingDuration((b2World *)self->_world, v3);
}

- (double)settlingDuration
{
  return b2World::GetSettlingDuration((b2World *)self->_world);
}

- (void)__init__
{
  self->_gravitdouble y = (b2Vec2)0xC11CCCCD00000000;
  self->_accumulatedDt = 0.0;
  self->_speed = 1.0;
  self->_doSleep = 1;
  operator new();
}

- (PKPhysicsWorld)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsWorld;
  v2 = [(PKPhysicsWorld *)&v5 init];
  float v3 = v2;
  if (v2) {
    [(PKPhysicsWorld *)v2 __init];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_joints forKey:@"_joints"];
  [v4 encodeObject:self->_bodies forKey:@"_bodies"];
  [(PKPhysicsWorld *)self gravity];
  objc_msgSend(v4, "encodeCGVector:forKey:", @"gravity");
  [(PKPhysicsWorld *)self speed];
  objc_msgSend(v4, "encodeDouble:forKey:", @"speedMultiplier");
}

- (PKPhysicsWorld)initWithCoder:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKPhysicsWorld;
  objc_super v5 = [(PKPhysicsWorld *)&v34 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(PKPhysicsWorld *)v5 __init];
    uint64_t v7 = (void *)MEMORY[0x263EFFA08];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    uint64_t v9 = [v7 setWithArray:v8];
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_bodies"];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v11);
          }
          float v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (([v15 _inUse] & 1) == 0) {
            [(PKPhysicsWorld *)v6 addBody:v15];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v12);
    }

    float v16 = (void *)MEMORY[0x263EFFA08];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    unsigned int v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    unsigned int v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_joints"];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          if ((objc_msgSend(v24, "_inUse", (void)v26) & 1) == 0) {
            [(PKPhysicsWorld *)v6 addJoint:v24];
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v21);
    }

    [v4 decodeCGVectorForKey:@"gravity"];
    -[PKPhysicsWorld setGravity:](v6, "setGravity:");
    [v4 decodeDoubleForKey:@"speedMultiplier"];
    -[PKPhysicsWorld setSpeed:](v6, "setSpeed:");
  }
  return v6;
}

- (void)dealloc
{
  [(PKPhysicsWorld *)self removeAllJoints];
  [(PKPhysicsWorld *)self removeAllBodies];
  [(PKPhysicsWorld *)self removeAllFields];
  world = (b2World *)self->_world;
  if (world)
  {
    b2World::~b2World(world);
    MEMORY[0x21668C8E0]();
    self->_world = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPhysicsWorld;
  [(PKPhysicsWorld *)&v4 dealloc];
}

- (id)copy
{
  v2 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  float v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

- (BOOL)hasBodies
{
  return [(NSMutableArray *)self->_bodies count] != 0;
}

- (BOOL)hasFields
{
  return PKCAether::fieldCount(*((PKCAether **)self->_world + 12894)) != 0;
}

- (void)setGravity:(CGVector)a3
{
  *(float *)&a3.ddouble x = a3.dx;
  ddouble y = a3.dy;
  self->_gravity.double x = *(float *)&a3.dx;
  self->_gravity.double y = dy;
  b2World::SetGravity((b2World *)self->_world, &self->_gravity, (__n128)a3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__PKPhysicsWorld_setGravity___block_invoke;
  v5[3] = &unk_2641AF970;
  v5[4] = self;
  [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v5];
}

b2Body *__29__PKPhysicsWorld_setGravity___block_invoke(uint64_t a1)
{
  result = (b2Body *)[*(id *)(a1 + 32) _world];
  for (b2Vec2 i = result[444].var13; i; b2Vec2 i = *(b2Vec2 *)(*(void *)&i + 168))
    result = b2Body::SetAwake(*(b2Body **)&i, 1);
  return result;
}

- (CGVector)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  result.ddouble y = y;
  result.ddouble x = x;
  return result;
}

- (void)setCollisionDelegate:(id)a3
{
}

- (id)collisionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactListener._contactDelegate);

  return WeakRetained;
}

- (void)setContactDelegate:(id)a3
{
}

- (PKPhysicsContactDelegate)contactDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactListener._contactDelegate);

  return (PKPhysicsContactDelegate *)WeakRetained;
}

- (id)bodies
{
  v2 = (void *)[(NSMutableArray *)self->_bodies copy];

  return v2;
}

- (id)joints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_joints = &self->_joints;
  float v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_joints, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = *p_joints;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_implicit", (void)v10) & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)addBody:(id)a3
{
  id v4 = a3;
  if ([v4 _inUse])
  {
    [MEMORY[0x263EFF940] raise:@"Cant add body, already exists in a world", @"Cant add body %@, already exists in a world", v4 format];
  }
  else
  {
    objc_msgSend(v4, "set_inUse:", 1);
    objc_msgSend(v4, "set_world:", self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __26__PKPhysicsWorld_addBody___block_invoke;
    v5[3] = &unk_2641AF998;
    v5[4] = self;
    id v6 = v4;
    [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v5];
  }
}

void __26__PKPhysicsWorld_addBody___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _bodies];
  [v2 addObject:*(void *)(a1 + 40)];

  float v3 = *(void **)(a1 + 40);
  if (v3) {
    [v3 _bodyDef];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  b2World::CreateBody((b2World *)objc_msgSend(*(id *)(a1 + 32), "_world", *(_OWORD *)&v4._sk_affectedByGravity, *(_OWORD *)&v4._sk_intersectionCallbackBitMask, *(_OWORD *)&v4.angle, *(_OWORD *)&v4.charge, *(_OWORD *)&v4.active), &v4);
}

- (void)removeBody:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy_;
  v17[4] = __Block_byref_object_dispose_;
  id v4 = a3;
  id v18 = v4;
  uint64_t v5 = [v4 _joints];
  id v6 = (void *)[v5 copy];

  [(NSMutableArray *)self->_bodies removeObject:v4];
  objc_msgSend(v4, "set_inUse:", 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        [(PKPhysicsWorld *)self removeJoint:*(void *)(*((void *)&v13 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [v4 _body];
  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __29__PKPhysicsWorld_removeBody___block_invoke;
    void v12[3] = &unk_2641AF9C0;
    v12[4] = self;
    v12[5] = v17;
    v12[6] = v11;
    [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v12];
  }
  [v4 clearBox2DData];

  _Block_object_dispose(v17, 8);
}

void __29__PKPhysicsWorld_removeBody___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 240) = 0;
  v2 = (b2World *)[*(id *)(a1 + 32) _world];
  b2World::DestroyBody(v2, *(b2Body **)(a1 + 48), v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)removeAllBodies
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = self->_bodies;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v3)
  {
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v23 + 1) + 8 * v4);
        v21[0] = 0;
        v21[1] = v21;
        v21[2] = 0x3032000000;
        v21[3] = __Block_byref_object_copy_;
        v21[4] = __Block_byref_object_dispose_;
        id v6 = v5;
        id v22 = v6;
        id v7 = [v6 _joints];
        uint64_t v8 = (void *)[v7 copy];

        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v18;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v18 != v11) {
                objc_enumerationMutation(v9);
              }
              [(PKPhysicsWorld *)self removeJoint:*(void *)(*((void *)&v17 + 1) + 8 * v12++)];
            }
            while (v10 != v12);
            uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v27 count:16];
          }
          while (v10);
        }

        objc_msgSend(v6, "set_inUse:", 0);
        uint64_t v13 = [v6 _body];
        if (v13)
        {
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __33__PKPhysicsWorld_removeAllBodies__block_invoke;
          v16[3] = &unk_2641AF9C0;
          v16[4] = self;
          v16[5] = v21;
          v16[6] = v13;
          [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v16];
        }
        [v6 clearBox2DData];

        _Block_object_dispose(v21, 8);
        ++v4;
      }
      while (v4 != v3);
      uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v3);
  }

  [(NSMutableArray *)self->_bodies removeAllObjects];
}

void __33__PKPhysicsWorld_removeAllBodies__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 48) + 240) = 0;
  v2 = (b2World *)[*(id *)(a1 + 32) _world];
  b2World::DestroyBody(v2, *(b2Body **)(a1 + 48), v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

- (void)addJoint:(id)a3
{
  id v4 = a3;
  if ([v4 _inUse])
  {
    [MEMORY[0x263EFF940] raise:@"Cant add joint, already exists in a world", @"Cant add joint %@, already exists in a world", v4 format];
  }
  else
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __27__PKPhysicsWorld_addJoint___block_invoke;
    v5[3] = &unk_2641AF998;
    id v6 = v4;
    id v7 = self;
    [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v5];
  }
}

void __27__PKPhysicsWorld_addJoint___block_invoke(uint64_t a1)
{
}

- (void)removeJoint:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_joints removeObject:v4];
  uint64_t v5 = [v4 bodyA];

  if (v5)
  {
    id v6 = [v4 bodyA];
    id v7 = [v6 _joints];
    [v7 removeObject:v4];
  }
  uint64_t v8 = [v4 bodyB];

  if (v8)
  {
    id v9 = [v4 bodyB];
    uint64_t v10 = [v9 _joints];
    [v10 removeObject:v4];
  }
  uint64_t v11 = [v4 _joint];
  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __30__PKPhysicsWorld_removeJoint___block_invoke;
    void v12[3] = &unk_2641AF9E8;
    v12[4] = self;
    v12[5] = v11;
    [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v12];
  }
  objc_msgSend(v4, "set_joint:", 0);
  objc_msgSend(v4, "set_inUse:", 0);
}

b2Joint *__30__PKPhysicsWorld_removeJoint___block_invoke(uint64_t a1)
{
  v2 = (b2World *)[*(id *)(a1 + 32) _world];
  uint64_t v3 = *(b2Joint **)(a1 + 40);

  return b2World::DestroyJoint(v2, v3);
}

- (void)removeAllJoints
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = self->_joints;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (([v7 _implicit] & 1) == 0)
        {
          uint64_t v8 = [v7 bodyA];
          BOOL v9 = v8 == 0;

          if (!v9)
          {
            uint64_t v10 = [v7 bodyA];
            uint64_t v11 = [v10 _joints];
            [v11 removeObject:v7];
          }
          uint64_t v12 = [v7 bodyB];
          BOOL v13 = v12 == 0;

          if (!v13)
          {
            long long v14 = [v7 bodyB];
            uint64_t v15 = [v14 _joints];
            [v15 removeObject:v7];
          }
          uint64_t v16 = [v7 _joint];
          if (v16)
          {
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __33__PKPhysicsWorld_removeAllJoints__block_invoke;
            v17[3] = &unk_2641AF9E8;
            v17[4] = self;
            void v17[5] = v16;
            [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v17];
          }
          objc_msgSend(v7, "set_joint:", 0);
          objc_msgSend(v7, "set_inUse:", 0);
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  [(NSMutableArray *)self->_joints removeAllObjects];
}

b2Joint *__33__PKPhysicsWorld_removeAllJoints__block_invoke(uint64_t a1)
{
  v2 = (b2World *)[*(id *)(a1 + 32) _world];
  uint64_t v3 = *(b2Joint **)(a1 + 40);

  return b2World::DestroyJoint(v2, v3);
}

- (void)addField:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__PKPhysicsWorld_addField___block_invoke;
  v6[3] = &unk_2641AF998;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPhysicsWorld *)self _runBlockOutsideOfTimeStep:v6];
}

void __27__PKPhysicsWorld_addField___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)([*(id *)(a1 + 32) _world] + 103152);
  uint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 _field];
    long long v5 = v4;
    if (*((void *)&v4 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v4 + 1) + 16), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    *((void *)&v4 + 1) = 0;
    long long v5 = 0uLL;
  }
  PKCAether::addField(v2, &v5);
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v5 + 1));
  }
  if (*((void *)&v4 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v4 + 1));
  }
}

- (void)removeField:(id)a3
{
  id v4 = a3;
  long long v5 = v4;
  if (v4)
  {
    uint64_t v6 = *((void *)self->_world + 12894);
    [v4 _field];
    uint64_t v9 = v7;
    uint64_t v10 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    PKCAether::removeField(v6, &v9);
    if (v10) {
      std::__shared_weak_count::__release_weak(v10);
    }
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
}

- (void)removeAllFields
{
}

- (id)sampleFields:(CGRect)a3 categories:(unsigned int)a4 dataSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v34, *((const PKCAether **)self->_world + 12894));
  size_t v13 = vcvtd_n_u64_f64(width * height, 2uLL);
  long long v14 = (float *)malloc_type_malloc(v13, 0x26069796uLL);
  uint64_t v15 = v14;
  if (height > 0.0)
  {
    int v16 = 0;
    long long v17 = v14;
    do
    {
      if (width > 0.0)
      {
        int v18 = 0;
        do
        {
          float v20 = PKGet_INV_PTM_RATIO();
          float v21 = PKGet_INV_PTM_RATIO();
          float v22 = x + v9 * (float)v18 / width;
          *(float *)&unint64_t v23 = v20 * v22;
          float v19 = y + v8 * (float)v16 / height;
          *((float *)&v23 + 1) = v21 * v19;
          LODWORD(v24) = 1.0;
          PKCAether::Evaluator::evalForce(&v34, a4, 0.0, (float32x4_t)v23, (__n128)0, v24, 1.0, *((double *)self->_world + 12899));
          _S2 = _V0.S[2];
          __asm { FMLA            S1, S2, V0.S[2] }
          *v17++ = sqrtf(_S1);
          ++v18;
        }
        while (width > (double)v18);
      }
      ++v16;
    }
    while (height > (double)v16);
  }
  long long v32 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v15 length:v13];
  if (__p)
  {
    v36 = __p;
    operator delete(__p);
  }
  v37 = &v34;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);

  return v32;
}

- (CGVector)sampleFields:(CGPoint)a3
{
  *(float *)&unsigned int v3 = a3.x;
  *(float *)&unsigned int v4 = a3.y;
  [(PKPhysicsWorld *)self sampleFieldsAt:COERCE_DOUBLE(__PAIR64__(v4, v3))];
  float64x2_t v6 = vcvtq_f64_f32(v5);
  double v7 = v6.f64[1];
  result.ddouble x = v6.f64[0];
  result.ddouble y = v7;
  return result;
}

- (__n128)sampleFieldsAt:(uint64_t)a1
{
  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v11, *(const PKCAether **)(*(void *)(a1 + 8) + 103152));
  float v3 = PKGet_INV_PTM_RATIO();
  float v4 = PKGet_INV_PTM_RATIO();
  *(float *)&unint64_t v5 = v3 * *(float *)&a2;
  HIDWORD(v5) = vmuls_lane_f32(v4, *(float32x2_t *)&a2, 1);
  LODWORD(v6) = 1.0;
  PKCAether::Evaluator::evalForce(&v11, -1, 0.0, (float32x4_t)v5, (__n128)0, v6, 1.0, *(double *)(*(void *)(a1 + 8) + 103192));
  long long v10 = v7;
  if (__p)
  {
    size_t v13 = __p;
    operator delete(__p);
  }
  long long v14 = &v11;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  return (__n128)v10;
}

- (CGVector)evalForce:(unsigned int)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  PKCAether::Evaluator::Evaluator((PKCAether::Evaluator *)&v19, *((const PKCAether **)self->_world + 12894));
  float v7 = PKGet_INV_PTM_RATIO();
  float v8 = PKGet_INV_PTM_RATIO();
  float v9 = y;
  float v10 = x;
  float v11 = v8 * v9;
  *(float *)&unint64_t v12 = v7 * v10;
  *((float *)&v12 + 1) = v11;
  LODWORD(v13) = 1.0;
  PKCAether::Evaluator::evalForce(&v19, -1, 0.0, (float32x4_t)v12, (__n128)0, v13, 1.0, *((double *)self->_world + 12899));
  if (__p)
  {
    float v21 = __p;
    float32x2_t v17 = v14;
    operator delete(__p);
    float32x2_t v14 = v17;
  }
  float64x2_t v18 = vcvtq_f64_f32(v14);
  float v22 = &v19;
  std::vector<std::shared_ptr<PKCField>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
  double v16 = v18.f64[1];
  double v15 = v18.f64[0];
  result.ddouble y = v16;
  result.ddouble x = v15;
  return result;
}

- (BOOL)stepWithTime:(double)a3 velocityIterations:(unint64_t)a4 positionIterations:(unint64_t)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (![(NSMutableArray *)self->_bodies count]) {
    return 0;
  }
  double v9 = self->_accumulatedDt + a3 * self->_speed;
  self->_accumulatedDt = v9;
  if (v9 >= 0.00833333377)
  {
    do
    {
      b2World::Step((b2World *)self->_world, 0.0083333, v6, v5);
      double v10 = self->_accumulatedDt + -0.00833333377;
      self->_accumulatedDt = v10;
    }
    while (v10 >= 0.00833333377);
  }
  (*((void (**)(PKContactListener *))self->_contactListener._vptr$b2ContactListener + 7))(&self->_contactListener);
  b2World::ClearForces((b2World *)self->_world);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  float v11 = self->_postStepBlocks;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        if (v15) {
          (*(void (**)(void))(v15 + 16))();
        }
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_postStepBlocks removeAllObjects];
  double v16 = self->_bodies;
  float32x2_t v17 = v16;
  if (v16)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    float64x2_t v18 = v16;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      int v21 = 1;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          unint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          double v24 = objc_msgSend(v23, "postStepBlock", (void)v29);
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            long long v26 = [v23 postStepBlock];
            ((void (**)(void, void *))v26)[2](v26, v23);
          }
          if ([v23 isDynamic]) {
            v21 &= [v23 isResting];
          }
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v19);
    }
    else
    {
      LOBYTE(v21) = 1;
    }

    BOOL v27 = (v21 & 1) == 0;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  begin = self->drawPacket._colors.__begin_;
  if (begin)
  {
    self->drawPacket._colors.__end_ = begin;
    operator delete(begin);
  }
  float v4 = self->drawPacket._linePoints.__begin_;
  if (v4)
  {
    self->drawPacket._linePoints.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_postStepBlocks, 0);
  objc_storeStrong((id *)&self->_joints, 0);
  objc_storeStrong((id *)&self->_bodies, 0);

  PKContactListener::~PKContactListener(&self->_contactListener);
}

- (id).cxx_construct
{
  *(_OWORD *)&self->drawPacket._linePoints.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->drawPacket._colors.__end_ = 0u;
  *(_OWORD *)&self->drawPacket._linePoints.__begin_ = 0u;
  return self;
}

- (void)debugDraw:(float)a3 matrix:(_GLSKMatrix4 *)a4 showsPhysics:(BOOL)a5 showsOutlineInterior:(BOOL)a6 showsFields:(BOOL)a7
{
  BOOL v7 = a5;
  v41 = (float32x2_t *)a4;
  uint64_t v57 = *MEMORY[0x263EF8340];
  PKDebugDraw::PKDebugDraw((PKDebugDraw *)v55, &self->drawPacket, a5, a7);
  b2World::SetDebugDraw((b2World *)self->_world, (b2Draw *)v55);
  if (v7)
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = self->_bodies;
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v52;
      uint64_t v12 = (void *)vdup_n_s32(0x3F19999Au);
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(obj);
          }
          float32x2_t v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "_body", v41);
          if (!v14) {
            goto LABEL_14;
          }
          [v14 outline];
          if (__p) {
            BOOL v16 = a6;
          }
          else {
            BOOL v16 = 1;
          }
          if (v47) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v47);
          }
          if (!v16)
          {
            double v24 = [v14 representedObject];
            char v25 = objc_opt_respondsToSelector();
            uint64_t v50 = 0;
            if (v25) {
              [v24 _getWorldTransform:0 positionY:0 rotation:0 xScale:(char *)&v50 + 4 yScale:&v50];
            }
            else {
              uint64_t v50 = 0x3F8000003F800000;
            }
            uint64_t v49 = 0;
            if (objc_opt_respondsToSelector())
            {
              [v24 _getBasePhysicsScale:(char *)&v49 + 4 yScale:&v49];
              *(float *)&uint64_t v50 = *(float *)&v50 / *(float *)&v49;
              *((float *)&v50 + 1) = *((float *)&v50 + 1) / *((float *)&v49 + 1);
            }
            [v14 outline];
            long long v26 = __p;
            if (v47) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v47);
            }
            v47 = 0;
            uint64_t v48 = 0;
            __p = 0;
            std::vector<b2Vec2>::resize((uint64_t)&__p, (uint64_t)(v26[2] - v26[1]) >> 3);
            uint64_t v27 = v26[1];
            long long v28 = (int *)__p;
            uint64_t v29 = v26[2] - v27;
            if (v29)
            {
              uint64_t v30 = v29 >> 3;
              if ((unint64_t)(v29 >> 3) <= 1) {
                uint64_t v30 = 1;
              }
              uint64_t v31 = v50;
              long long v32 = (float *)(v27 + 4);
              long long v33 = (float32x2_t *)__p;
              do
              {
                float v34 = *(v32 - 1) * *((float *)&v31 + 1);
                float32x2_t v35 = *(float32x2_t *)(v15 + 40);
                float32x2_t v36 = (float32x2_t)vrev64_s32((int32x2_t)v35);
                v35.f32[0] = -v35.f32[0];
                float v37 = *v32;
                v32 += 2;
                *v33++ = vadd_f32(*(float32x2_t *)(v15 + 32), vmla_n_f32(vmul_n_f32(v35, v37 * *(float *)&v31), v36, v34));
                --v30;
              }
              while (v30);
            }
            uint64_t v44 = 0x3E8000003DA3D70ALL;
            int v45 = 1065185444;
            PKDebugDraw::DrawSolidPolygon((uint64_t)v55, v28, (unint64_t)v29 >> 3, (int *)&v44);
            if (__p)
            {
              v47 = (std::__shared_weak_count *)__p;
              operator delete(__p);
            }
          }
          else
          {
LABEL_14:
            for (uint64_t j = *(void *)(v15 + 176); j; uint64_t j = *(void *)(j + 16))
            {
              if (b2Body::IsActive((b2Body *)v15))
              {
                int v18 = *(_DWORD *)(v15 + 20);
                if (v18 == 1)
                {
                  world = self->_world;
                  __p = (void *)0x3F0000003F000000;
                  LODWORD(v47) = 1063675494;
                  b2World::DrawShape((uint64_t)world, j, (b2Transform *)(v15 + 32), (QuadTreeNode *)&__p);
                }
                else if (v18)
                {
                  char IsAwake = b2Body::IsAwake((b2Body *)v15);
                  unint64_t v23 = self->_world;
                  if (IsAwake)
                  {
                    __p = (void *)0x3E8000003DA3D70ALL;
                    LODWORD(v47) = 1065185444;
                  }
                  else
                  {
                    __p = v12;
                    LODWORD(v47) = 1058642330;
                  }
                  b2World::DrawShape((uint64_t)v23, j, (b2Transform *)(v15 + 32), (QuadTreeNode *)&__p);
                }
                else
                {
                  uint64_t v19 = self->_world;
                  __p = (void *)0x3F6666663F000000;
                  LODWORD(v47) = 1056964608;
                  b2World::DrawShape((uint64_t)v19, j, (b2Transform *)(v15 + 32), (QuadTreeNode *)&__p);
                }
              }
              else
              {
                uint64_t v20 = self->_world;
                __p = (void *)0x3F0000003F000000;
                LODWORD(v47) = 1050253722;
                b2World::DrawShape((uint64_t)v20, j, (b2Transform *)(v15 + 32), (QuadTreeNode *)&__p);
              }
            }
          }
        }
        uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v10);
    }
  }
  b2World::DrawDebugData((b2World *)self->_world);
  b2World::SetDebugDraw((b2World *)self->_world, 0);
  begin = self->drawPacket._linePoints.__begin_;
  uint64_t v39 = self->drawPacket._linePoints.__end_ - begin;
  if (v39)
  {
    unint64_t v40 = v39 >> 3;
    if (v40 <= 1) {
      unint64_t v40 = 1;
    }
    do
    {
      *(float32x2_t *)begin = vadd_f32(vadd_f32(vmul_n_f32(*v41, *(float *)begin * a3), vmul_n_f32(v41[2], *((float *)begin + 1) * a3)), vadd_f32(vmul_f32(v41[4], 0), v41[6]));
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 8);
      --v40;
    }
    while (v40);
  }
}

- (const)debugDrawPacket
{
  return &self->drawPacket;
}

- (void)set_bodies:(id)a3
{
}

- (NSMutableArray)_bodies
{
  return self->_bodies;
}

- (void)set_doSleep:(BOOL)a3
{
  self->_doSleep = a3;
}

- (BOOL)_doSleep
{
  return self->_doSleep;
}

- (BOOL)isEqualToWorld:(id)a3
{
  float v4 = (PKPhysicsWorld *)a3;
  p_isa = (id *)&v4->super.isa;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else if ((COERCE_UNSIGNED_INT(self->_speed - v4->_speed) & 0x60000000) != 0 {
         || (COERCE_UNSIGNED_INT(self->_gravity.x - v4->_gravity.x) & 0x60000000) != 0
  }
         || (COERCE_UNSIGNED_INT(self->_gravity.y - v4->_gravity.y) & 0x60000000) != 0)
  {
    BOOL v6 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    while ([(NSMutableArray *)self->_joints count] > v8)
    {
      double v9 = [(NSMutableArray *)self->_joints objectAtIndexedSubscript:v8];
      uint64_t v10 = [p_isa[10] objectAtIndexedSubscript:v8];
      char v11 = [v9 isEqualToJoint:v10];

      BOOL v6 = 0;
      ++v8;
      if ((v11 & 1) == 0) {
        goto LABEL_7;
      }
    }
    unint64_t v12 = 0;
    do
    {
      unint64_t v13 = [(NSMutableArray *)self->_bodies count];
      BOOL v6 = v13 <= v12;
      if (v13 <= v12) {
        break;
      }
      float32x2_t v14 = [(NSMutableArray *)self->_bodies objectAtIndexedSubscript:v12];
      uint64_t v15 = [p_isa[9] objectAtIndexedSubscript:v12];
      char v16 = [v14 isEqualToBody:v15];

      ++v12;
    }
    while ((v16 & 1) != 0);
  }
LABEL_7:

  return v6;
}

- (void)_runBlockOutsideOfTimeStep:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if ((*((unsigned char *)self->_world + 102936) & 2) != 0)
  {
    postStepBlocks = self->_postStepBlocks;
    BOOL v6 = (void *)MEMORY[0x21668CC60]();
    [(NSMutableArray *)postStepBlocks addObject:v6];
  }
  else
  {
    (*((void (**)(void))v4 + 2))();
  }
}

+ (id)world
{
  uint64_t v2 = objc_alloc_init(PKPhysicsWorld);

  return v2;
}

- (void)_world
{
  return self->_world;
}

- (b2Vec2)_gravity
{
  float x = self->_gravity.x;
  float y = self->_gravity.y;
  result.float y = y;
  result.float x = x;
  return result;
}

- (void)set_gravity:(b2Vec2)a3
{
  self->_gravitfloat y = a3;
}

@end