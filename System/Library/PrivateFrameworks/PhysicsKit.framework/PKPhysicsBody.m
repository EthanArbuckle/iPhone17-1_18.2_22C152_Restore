@interface PKPhysicsBody
+ (BOOL)supportsSecureCoding;
+ (id)bodyWithBodies:(id)a3;
+ (id)bodyWithCircleOfRadius:(double)a3;
+ (id)bodyWithCircleOfRadius:(double)a3 center:(CGPoint)a4;
+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3;
+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3;
+ (id)bodyWithOutline:(shared_ptr<PKPath>)a3 offset:(CGPoint)a4;
+ (id)bodyWithPolygonFromPath:(CGPath *)a3;
+ (id)bodyWithRectangleOfSize:(CGSize)a3;
+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4;
+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(double)a5;
+ (id)bodyWithRectangleOfSize:(CGSize)a3 edgeRadius:(double)a4;
+ (id)initWithMarchingCubes:(void *)a3 pixelFrame:(CGRect)a4;
+ (id)initWithQuadTree:(id)a3;
- (BOOL)_allowSleep;
- (BOOL)_inUse;
- (BOOL)active;
- (BOOL)affectedByGravity;
- (BOOL)allowsRotation;
- (BOOL)isDynamic;
- (BOOL)isEqualToBody:(id)a3;
- (BOOL)isResting;
- (BOOL)pinned;
- (BOOL)usesPreciseCollisionDetection;
- (CGPoint)position;
- (CGVector)velocity;
- (NSArray)joints;
- (NSObject)representedObject;
- (PKPhysicsBody)init;
- (PKPhysicsBody)initWithBodies:(id)a3;
- (PKPhysicsBody)initWithCircleOfRadius:(double)a3;
- (PKPhysicsBody)initWithCircleOfRadius:(double)a3 center:(CGPoint)a4;
- (PKPhysicsBody)initWithCoder:(id)a3;
- (PKPhysicsBody)initWithEdgeChainFromPath:(CGPath *)a3;
- (PKPhysicsBody)initWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (PKPhysicsBody)initWithEdgeLoopFromPath:(CGPath *)a3;
- (PKPhysicsBody)initWithPolygonFromPath:(CGPath *)a3;
- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3;
- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4;
- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(float)a5;
- (b2Body)_body;
- (b2BodyDef)_bodyDef;
- (double)angularDamping;
- (double)angularVelocity;
- (double)area;
- (double)charge;
- (double)density;
- (double)friction;
- (double)linearDamping;
- (double)mass;
- (double)radius;
- (double)restitution;
- (double)rotation;
- (id).cxx_construct;
- (id)_descriptionClassName;
- (id)_joints;
- (id)_world;
- (id)allContactedBodies;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)postStepBlock;
- (shared_ptr<PKPath>)outline;
- (shared_ptr<QuadTree>)_quadTree;
- (unsigned)categoryBitMask;
- (unsigned)collisionBitMask;
- (unsigned)contactTestBitMask;
- (unsigned)fieldBitMask;
- (void)_shapes;
- (void)applyAngularImpulse:(double)a3;
- (void)applyForce:(CGPoint)a3;
- (void)applyForce:(CGPoint)a3 atPoint:(CGPoint)a4;
- (void)applyImpulse:(CGVector)a3;
- (void)applyImpulse:(CGVector)a3 atPoint:(CGPoint)a4;
- (void)applyTorque:(double)a3;
- (void)applyUnscaledForce:(CGVector)a3;
- (void)applyUnscaledForce:(CGVector)a3 atPoint:(CGPoint)a4;
- (void)applyUnscaledImpulse:(CGVector)a3;
- (void)applyUnscaledImpulse:(CGVector)a3 atPoint:(CGPoint)a4;
- (void)clearBox2DData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)reapplyScale:(double)a3 yScale:(double)a4;
- (void)setActive:(BOOL)a3;
- (void)setAffectedByGravity:(BOOL)a3;
- (void)setAllowsRotation:(BOOL)a3;
- (void)setAngularDamping:(double)a3;
- (void)setAngularVelocity:(double)a3;
- (void)setCategoryBitMask:(unsigned int)a3;
- (void)setCharge:(double)a3;
- (void)setCollisionBitMask:(unsigned int)a3;
- (void)setContactTestBitMask:(unsigned int)a3;
- (void)setDensity:(double)a3;
- (void)setDynamic:(BOOL)a3;
- (void)setFieldBitMask:(unsigned int)a3;
- (void)setFriction:(double)a3;
- (void)setLinearDamping:(double)a3;
- (void)setMass:(double)a3;
- (void)setOutline:(shared_ptr<PKPath>)a3;
- (void)setPinned:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setPostStepBlock:(id)a3;
- (void)setRadius:(double)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setResting:(BOOL)a3;
- (void)setRestitution:(double)a3;
- (void)setRotation:(double)a3;
- (void)setUsesPreciseCollisionDetection:(BOOL)a3;
- (void)setVelocity:(CGVector)a3;
- (void)set_allowSleep:(BOOL)a3;
- (void)set_body:(b2Body *)a3;
- (void)set_bodyDef:(b2BodyDef *)a3;
- (void)set_inUse:(BOOL)a3;
- (void)set_joints:(id)a3;
- (void)set_world:(id)a3;
- (void)volume;
@end

@implementation PKPhysicsBody

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<PKPath>)outline
{
  cntrl = self->_outline.__cntrl_;
  *v2 = self->_outline.__ptr_;
  v2[1] = (PKPath *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PKPath *)self;
  return result;
}

- (void)setOutline:(shared_ptr<PKPath>)a3
{
  v4 = *(PKPath **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_outline.__cntrl_;
  self->_outline.__ptr_ = v4;
  self->_outline.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)volume
{
  begin = self->_shapes.__begin_;
  if ((PKPhysicsShape **)((char *)self->_shapes.__end_ - (char *)begin) == (PKPhysicsShape **)8)
  {
    int v3 = *(_DWORD *)(*((void *)(*begin)->var1 + 4) + 8);
    switch(v3)
    {
      case 0:
        operator new();
      case 3:
        operator new();
      case 2:
        operator new();
    }
  }
  return 0;
}

- (void)clearBox2DData
{
  self->_body = 0;
  self->_inUse = 0;
  objc_storeWeak((id *)&self->_world, 0);
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  while (begin != end)
  {
    uint64_t v5 = (uint64_t)*begin++;
    *(void *)(v5 + 40) = 0;
  }
}

+ (id)bodyWithOutline:(shared_ptr<PKPath>)a3 offset:(CGPoint)a4
{
  long long v31 = *(long long *)&a4.y;
  double x = a4.x;
  ptr = (uint64_t *)a3.__ptr_;
  v43 = 0;
  v44 = 0;
  uint64_t v45 = 0;
  v40 = 0;
  v41 = 0;
  uint64_t v42 = 0;
  v38 = 0;
  v39 = 0;
  __p = 0;
  uint64_t v5 = *(std::__shared_weak_count_vtbl ***)(*(void *)a3.__ptr_ + 8);
  if (v5 != *(std::__shared_weak_count_vtbl ***)(*(void *)a3.__ptr_ + 16))
  {
    v6 = 0;
    do
    {
      v7 = *v5;
      if (v6 >= v39)
      {
        uint64_t v8 = ((char *)v6 - (unsigned char *)__p) >> 3;
        if ((unint64_t)(v8 + 1) >> 61) {
          std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v9 = ((char *)v39 - (unsigned char *)__p) >> 2;
        if (v9 <= v8 + 1) {
          unint64_t v9 = v8 + 1;
        }
        if ((unint64_t)((char *)v39 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v10 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v10 = v9;
        }
        if (v10) {
          v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)&v39, v10);
        }
        else {
          v11 = 0;
        }
        v12 = (std::__shared_weak_count_vtbl **)&v11[8 * v8];
        *v12 = v7;
        v6 = (std::__shared_weak_count *)(v12 + 1);
        v14 = (std::__shared_weak_count *)__p;
        v13 = v38;
        if (v38 != __p)
        {
          do
          {
            uint64_t shared_weak_owners = v13[-1].__shared_weak_owners_;
            v13 = (std::__shared_weak_count *)((char *)v13 - 8);
            *--v12 = (std::__shared_weak_count_vtbl *)shared_weak_owners;
          }
          while (v13 != v14);
          v13 = (std::__shared_weak_count *)__p;
        }
        __p = v12;
        v38 = v6;
        v39 = (std::__shared_weak_count *)&v11[8 * v10];
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        v6->__vftable = v7;
        v6 = (std::__shared_weak_count *)((char *)v6 + 8);
      }
      v38 = v6;
      ++v5;
    }
    while (v5 != *(std::__shared_weak_count_vtbl ***)(*ptr + 16));
  }
  trisFromCCWFaces((uint64_t)&__p, (char **)&v40, &v43);
  if (__p)
  {
    v38 = (std::__shared_weak_count *)__p;
    operator delete(__p);
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v44 != v43)
  {
    unint64_t v17 = 0;
    do
    {
      Mutable = CGPathCreateMutable();
      if (((v44 - (unsigned char *)v43) >> 2) - 1 == v17) {
        unint64_t v19 = (unint64_t)(v41 - (unsigned char *)v40) >> 3;
      }
      else {
        LODWORD(v19) = *((_DWORD *)v43 + v17 + 1);
      }
      uint64_t v20 = *((int *)v43 + v17);
      if ((int)v19 > (int)v20)
      {
        uint64_t v21 = 0;
        int v22 = v19 - v20;
        do
        {
          if (v21) {
            CGPathAddLineToPoint(Mutable, 0, COERCE_FLOAT(*((void *)v40 + v20 + v21)) - x, COERCE_FLOAT(HIDWORD(*((void *)v40 + v20 + v21))) - *(double *)&v31);
          }
          else {
            CGPathMoveToPoint(Mutable, 0, COERCE_FLOAT(*((void *)v40 + v20)) - x, COERCE_FLOAT(HIDWORD(*((void *)v40 + v20))) - *(double *)&v31);
          }
          ++v21;
        }
        while (v22 != v21);
      }
      CGPathCloseSubpath(Mutable);
      v23 = [[PKPhysicsBody alloc] initWithPolygonFromPath:Mutable];
      v24 = v23;
      if (v23)
      {
        [(PKPhysicsBody *)v23 setDynamic:1];
        [v16 addObject:v24];
      }
      CGPathRelease(Mutable);

      ++v17;
    }
    while (v17 < (v44 - (unsigned char *)v43) >> 2);
  }
  if (objc_msgSend(v16, "count", v31))
  {
    if ([v16 count] == 1)
    {
      v25 = [v16 objectAtIndex:0];
    }
    else
    {
      v25 = +[PKPhysicsBody bodyWithBodies:v16];
      std::allocate_shared[abi:ne180100]<PKPath,std::allocator<PKPath>,PKPath&,void>(*ptr, &__p);
      v26 = __p;
      v27 = (float32x2_t *)*((void *)__p + 1);
      v28 = (float32x2_t *)*((void *)__p + 2);
      if (v27 != v28)
      {
        v29.f64[0] = x;
        v29.f64[1] = v32;
        float64x2_t v34 = v29;
        do
        {
          float32x2_t *v27 = vcvt_f32_f64(vsubq_f64(vcvtq_f64_f32(*v27), v34));
          v27->f32[0] = PKGet_INV_PTM_RATIO() * v27->f32[0];
          v27->f32[1] = PKGet_INV_PTM_RATIO() * v27->f32[1];
          ++v27;
        }
        while (v27 != v28);
        v26 = __p;
      }
      v35 = v26;
      v36 = v38;
      if (v38) {
        atomic_fetch_add_explicit(&v38->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [v25 setOutline:&v35];
      if (v36) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v36);
      }
      if (v38) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v38);
      }
    }
  }
  else
  {
    NSLog(&cfstr_PhysicsbodyCou.isa);
    v25 = 0;
  }

  if (v40)
  {
    v41 = v40;
    operator delete(v40);
  }
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_shapeType forKey:@"_shapeType"];
  switch(self->_shapeType)
  {
    case 1:
      [v4 encodeDouble:@"_radius" forKey:self->_radius];
      goto LABEL_6;
    case 2:
      objc_msgSend(v4, "encodeCGSize:forKey:", @"_size", self->_size.width, self->_size.height);
LABEL_6:
      v6 = @"_p0";
      uint64_t v7 = 208;
      uint64_t v8 = 200;
      goto LABEL_8;
    case 3:
    case 5:
    case 6:
      uint64_t v5 = PKArrayFromPKPath((uint64_t)self->_pathPtr.__ptr_);
      [v4 encodeObject:v5 forKey:@"_path"];

      break;
    case 4:
      objc_msgSend(v4, "encodeCGPoint:forKey:", @"_p0", self->_p0.x, self->_p0.y);
      v6 = @"_p1";
      uint64_t v7 = 224;
      uint64_t v8 = 216;
LABEL_8:
      objc_msgSend(v4, "encodeCGPoint:forKey:", v6, *(double *)((char *)&self->super.isa + v8), *(double *)((char *)&self->super.isa + v7));
      break;
    case 7:
      [v4 encodeInt32:(unint64_t)((char *)self->_shapes.__end_ - (char *)self->_shapes.__begin_) >> 3 forKey:@"_compoundBodyCount"];
      for (i = self->_shapes.__begin_; i != self->_shapes.__end_; ++i)
      {
        uint64_t var0 = (uint64_t)(*i)->var0.var0;
        id v16 = @"chain";
        switch(*(_DWORD *)(var0 + 8))
        {
          case 0:
            [v4 encodeObject:@"circle"];
            float v17 = *(float *)(var0 + 12);
            float v18 = PKGet_PTM_RATIO();
            unint64_t v19 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%g, %g}", (float)(v17 * v18), 0);
            [v4 encodeObject:v19];

            float v20 = *(float *)(var0 + 16);
            float v21 = PKGet_PTM_RATIO();
            float v22 = *(float *)(var0 + 20);
            float v23 = PKGet_PTM_RATIO();
            v24 = (void *)CFStringCreateWithFormat(0, 0, @"{%g, %g}", (float)(v20 * v21), (float)(v22 * v23));
            [v4 encodeObject:v24];
            goto LABEL_20;
          case 1:
            [v4 encodeObject:@"edge"];
            float v25 = *(float *)(var0 + 16);
            float v26 = PKGet_PTM_RATIO();
            float v27 = *(float *)(var0 + 20);
            float v28 = PKGet_PTM_RATIO();
            float64x2_t v29 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%g, %g}", (float)(v25 * v26), (float)(v27 * v28));
            [v4 encodeObject:v29];

            float v30 = *(float *)(var0 + 24);
            float v31 = PKGet_PTM_RATIO();
            float v32 = *(float *)(var0 + 28);
            float v33 = PKGet_PTM_RATIO();
            v24 = (void *)CFStringCreateWithFormat(0, 0, @"{%g, %g}", (float)(v30 * v31), (float)(v32 * v33));
            [v4 encodeObject:v24];
            goto LABEL_20;
          case 2:
            [v4 encodeObject:@"polygon"];
            v24 = PKArrayFromB2PolygonShape(var0);
            [v4 encodeObject:v24];
LABEL_20:

            continue;
          case 3:
            goto LABEL_22;
          case 4:
            id v16 = @"quadtree";
LABEL_22:
            [v4 encodeObject:v16];
            break;
          default:
            continue;
        }
      }
      break;
    default:
      NSLog(&cfstr_EncodeError.isa);
      break;
  }
  ptr = self->_outline.__ptr_;
  if (ptr)
  {
    unint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithCapacity:2 * (*((void *)ptr + 2) - *((void *)ptr + 1))];
    v11 = (float *)*((void *)ptr + 1);
    v12 = (float *)*((void *)ptr + 2);
    while (v11 != v12)
    {
      unint64_t v13 = bswap64(COERCE_UNSIGNED_INT64(*v11));
      unint64_t v34 = bswap64(COERCE_UNSIGNED_INT64(v11[1]));
      unint64_t v35 = v13;
      [v10 appendBytes:&v35 length:8];
      [v10 appendBytes:&v34 length:8];
      v11 += 2;
    }
    [v4 encodeObject:v10 forKey:@"_outline"];
  }
  [v4 encodeDouble:@"_edgeRadius" forKey:self->_edgeRadius];
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody isDynamic](self, "isDynamic"), @"dynamic");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection"), @"needsContinuousCollsionDetection");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody allowsRotation](self, "allowsRotation"), @"allowRotation");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody pinned](self, "pinned"), @"pinned");
  [(PKPhysicsBody *)self friction];
  objc_msgSend(v4, "encodeDouble:forKey:", @"friction");
  [(PKPhysicsBody *)self charge];
  objc_msgSend(v4, "encodeDouble:forKey:", @"charge");
  [(PKPhysicsBody *)self restitution];
  objc_msgSend(v4, "encodeDouble:forKey:", @"restitution");
  [(PKPhysicsBody *)self density];
  objc_msgSend(v4, "encodeDouble:forKey:", @"density");
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsBody affectedByGravity](self, "affectedByGravity"), @"affectedByGravity");
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody categoryBitMask](self, "categoryBitMask"), @"categoryBitMask");
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody collisionBitMask](self, "collisionBitMask"), @"collisionBitMask");
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody contactTestBitMask](self, "contactTestBitMask"), @"intersectionTestBitMask");
  objc_msgSend(v4, "encodeInt32:forKey:", -[PKPhysicsBody fieldBitMask](self, "fieldBitMask"), @"fieldBitMask");
  [(PKPhysicsBody *)self velocity];
  objc_msgSend(v4, "encodeCGVector:forKey:", @"linearVelocity");
  [(PKPhysicsBody *)self angularVelocity];
  objc_msgSend(v4, "encodeDouble:forKey:", @"angularVelocity");
  [(PKPhysicsBody *)self linearDamping];
  objc_msgSend(v4, "encodeDouble:forKey:", @"linearDamping");
  [(PKPhysicsBody *)self angularDamping];
  objc_msgSend(v4, "encodeDouble:forKey:", @"angularDamping");
}

- (PKPhysicsBody)initWithCoder:(id)a3
{
  v69[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self)
  {
    self->_shapeType = [v4 decodeIntForKey:@"_shapeType"];
    self->_edgeRadius = 0.00899999961;
    if ([v5 containsValueForKey:@"_edgeRadius"])
    {
      [v5 decodeDoubleForKey:@"_edgeRadius"];
      self->_edgeRadius = v6;
    }
    switch(self->_shapeType)
    {
      case 1:
        [v5 decodeDoubleForKey:@"_radius"];
        self->_radius = v7;
        self->_p0 = (CGPoint)*MEMORY[0x263F00148];
        if ([v5 containsValueForKey:@"_p0"])
        {
          [v5 decodeCGPointForKey:@"_p0"];
          double x = v8;
          double y = v10;
          self->_p0.double x = v8;
          self->_p0.double y = v10;
        }
        else
        {
          double x = self->_p0.x;
          double y = self->_p0.y;
        }
        float v27 = -[PKPhysicsBody initWithCircleOfRadius:center:](self, "initWithCircleOfRadius:center:", self->_radius, x, y);
        goto LABEL_30;
      case 2:
        [v5 decodeCGSizeForKey:@"_size"];
        self->_size.width = v13;
        self->_size.height = v14;
        self->_p0 = (CGPoint)*MEMORY[0x263F00148];
        if ([v5 containsValueForKey:@"_p0"])
        {
          [v5 decodeCGPointForKey:@"_p0"];
          double v16 = v15;
          double v18 = v17;
          self->_p0.double x = v15;
          self->_p0.double y = v17;
        }
        else
        {
          double v16 = self->_p0.x;
          double v18 = self->_p0.y;
        }
        float v27 = -[PKPhysicsBody initWithRectangleOfSize:center:](self, "initWithRectangleOfSize:center:", self->_size.width, self->_size.height, v16, v18);
        goto LABEL_30;
      case 3:
        unint64_t v19 = (void *)MEMORY[0x263EFFA08];
        v69[0] = objc_opt_class();
        v69[1] = objc_opt_class();
        v69[2] = objc_opt_class();
        v69[3] = objc_opt_class();
        v69[4] = objc_opt_class();
        v69[5] = objc_opt_class();
        v69[6] = objc_opt_class();
        float v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v69 count:7];
        float v21 = [v19 setWithArray:v20];
        float v22 = [v5 decodeObjectOfClasses:v21 forKey:@"_path"];

        v12 = [(PKPhysicsBody *)self initWithPolygonFromPath:PKCGPathCreateFromArray(v22, 0)];
        break;
      case 4:
        [v5 decodeCGPointForKey:@"_p0"];
        self->_p0.double x = v23;
        self->_p0.double y = v24;
        [v5 decodeCGPointForKey:@"_p1"];
        self->_p1.double x = v25;
        self->_p1.double y = v26;
        float v27 = -[PKPhysicsBody initWithEdgeFromPoint:toPoint:](self, "initWithEdgeFromPoint:toPoint:", self->_p0.x, self->_p0.y, v25, v26);
LABEL_30:
        v12 = v27;
        break;
      case 5:
        float v28 = (void *)MEMORY[0x263EFFA08];
        v68[0] = objc_opt_class();
        v68[1] = objc_opt_class();
        v68[2] = objc_opt_class();
        v68[3] = objc_opt_class();
        v68[4] = objc_opt_class();
        v68[5] = objc_opt_class();
        v68[6] = objc_opt_class();
        float64x2_t v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:7];
        float v30 = [v28 setWithArray:v29];
        float v31 = [v5 decodeObjectOfClasses:v30 forKey:@"_path"];

        v12 = [(PKPhysicsBody *)self initWithEdgeChainFromPath:PKCGPathCreateFromArray(v31, 0)];
        break;
      case 6:
        float v32 = (void *)MEMORY[0x263EFFA08];
        v67[0] = objc_opt_class();
        v67[1] = objc_opt_class();
        v67[2] = objc_opt_class();
        v67[3] = objc_opt_class();
        v67[4] = objc_opt_class();
        v67[5] = objc_opt_class();
        v67[6] = objc_opt_class();
        float v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:7];
        unint64_t v34 = [v32 setWithArray:v33];
        unint64_t v35 = [v5 decodeObjectOfClasses:v34 forKey:@"_path"];

        v12 = [(PKPhysicsBody *)self initWithEdgeLoopFromPath:PKCGPathCreateFromArray(v35, 0)];
        break;
      case 7:
        v12 = objc_alloc_init(PKPhysicsBody);

        int v36 = [v5 decodeInt32ForKey:@"_compoundBodyCount"];
        if (v36 >= 1)
        {
          do
          {
            v37 = [v5 decodeObject];
            if ([v37 isEqualToString:@"circle"])
            {
              v38 = [v5 decodeObject];
              double v39 = PKCGPointFromString(v38);
              v40 = [v5 decodeObject];

              double v41 = PKCGPointFromString(v40);
              double v43 = v42;
              float v44 = PKGet_INV_PTM_RATIO();
              float v45 = PKGet_INV_PTM_RATIO();
              float v46 = PKGet_INV_PTM_RATIO();
              float v47 = v39 * v44;
              v66.double x = v41 * v45;
              v66.double y = v43 * v46;
              addCircleBody(v12, v47, &v66);
            }
            if ([v37 isEqualToString:@"edge"])
            {
              v48 = [v5 decodeObject];
              double v49 = PKCGPointFromString(v48);
              double v51 = v50;
              v52 = [v5 decodeObject];

              double v53 = PKCGPointFromString(v52);
              double v55 = v54;
              float v56 = PKGet_INV_PTM_RATIO();
              float v57 = PKGet_INV_PTM_RATIO();
              v66.double x = v49 * v56;
              v66.double y = v51 * v57;
              LODWORD(v51) = PKGet_INV_PTM_RATIO();
              float v58 = PKGet_INV_PTM_RATIO();
              v65.double x = v53 * *(float *)&v51;
              v65.double y = v55 * v58;
              addEdge(v12, &v66, &v65);
            }
            if ([v37 isEqualToString:@"polygon"])
            {
              v59 = [v5 decodeObject];
              PKCGPathCreateFromArray(v59, 1);
              PKPathCreateFromCGPathWithOptions();
            }
            if ([v37 isEqualToString:@"chain"])
            {
              v60 = [v5 decodeObject];
              PKCGPathCreateFromArray(v60, 1);
              PKPathCreateFromCGPathWithOptions();
            }

            --v36;
          }
          while (v36);
        }
        v12->_shapeType = 7;
        break;
      default:
        NSLog(&cfstr_DecodeError.isa);
        v12 = self;
        break;
    }
  }
  else
  {
    v12 = 0;
  }
  v61 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"_outline"];
  v62 = v61;
  if (v61)
  {
    id v63 = v61;
    [v63 bytes];
    if ((unint64_t)[v63 length] > 0xF) {
      operator new();
    }
  }
  -[PKPhysicsBody setDynamic:](v12, "setDynamic:", [v5 decodeBoolForKey:@"dynamic"]);
  -[PKPhysicsBody setUsesPreciseCollisionDetection:](v12, "setUsesPreciseCollisionDetection:", [v5 decodeBoolForKey:@"needsContinuousCollsionDetection"]);
  -[PKPhysicsBody setAllowsRotation:](v12, "setAllowsRotation:", [v5 decodeBoolForKey:@"allowRotation"]);
  -[PKPhysicsBody setPinned:](v12, "setPinned:", [v5 decodeBoolForKey:@"pinned"]);
  [v5 decodeDoubleForKey:@"friction"];
  -[PKPhysicsBody setFriction:](v12, "setFriction:");
  [v5 decodeDoubleForKey:@"charge"];
  -[PKPhysicsBody setCharge:](v12, "setCharge:");
  [v5 decodeDoubleForKey:@"restitution"];
  -[PKPhysicsBody setRestitution:](v12, "setRestitution:");
  [v5 decodeDoubleForKey:@"density"];
  -[PKPhysicsBody setDensity:](v12, "setDensity:");
  -[PKPhysicsBody setAffectedByGravity:](v12, "setAffectedByGravity:", [v5 decodeBoolForKey:@"affectedByGravity"]);
  -[PKPhysicsBody setCategoryBitMask:](v12, "setCategoryBitMask:", [v5 decodeInt32ForKey:@"categoryBitMask"]);
  -[PKPhysicsBody setCollisionBitMask:](v12, "setCollisionBitMask:", [v5 decodeInt32ForKey:@"collisionBitMask"]);
  -[PKPhysicsBody setContactTestBitMask:](v12, "setContactTestBitMask:", [v5 decodeInt32ForKey:@"intersectionTestBitMask"]);
  -[PKPhysicsBody setFieldBitMask:](v12, "setFieldBitMask:", [v5 decodeInt32ForKey:@"fieldBitMask"]);
  [v5 decodeCGVectorForKey:@"linearVelocity"];
  -[PKPhysicsBody setVelocity:](v12, "setVelocity:");
  [v5 decodeDoubleForKey:@"angularVelocity"];
  -[PKPhysicsBody setAngularVelocity:](v12, "setAngularVelocity:");
  [v5 decodeDoubleForKey:@"linearDamping"];
  -[PKPhysicsBody setLinearDamping:](v12, "setLinearDamping:");
  [v5 decodeDoubleForKey:@"angularDamping"];
  -[PKPhysicsBody setAngularDamping:](v12, "setAngularDamping:");

  return v12;
}

- (BOOL)isEqualToBody:(id)a3
{
  id v4 = (PKPhysicsBody *)a3;
  uint64_t v5 = (uint64_t *)v4;
  if (self == v4) {
    goto LABEL_20;
  }
  if (self->_shapeType != v4->_shapeType) {
    goto LABEL_21;
  }
  ptr = self->_pathPtr.__ptr_;
  uint64_t v7 = v5[21];
  if (!ptr)
  {
    if (!v7) {
      goto LABEL_8;
    }
LABEL_21:
    BOOL v22 = 0;
    goto LABEL_22;
  }
  if (!v7) {
    goto LABEL_21;
  }
  CGFloat v8 = PKArrayFromPKPath((uint64_t)ptr);
  unint64_t v9 = PKArrayFromPKPath(v5[21]);
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_8:
  int v11 = [(PKPhysicsBody *)self isDynamic];
  if (v11 != [v5 isDynamic]) {
    goto LABEL_21;
  }
  int v12 = [(PKPhysicsBody *)self usesPreciseCollisionDetection];
  if (v12 != [v5 usesPreciseCollisionDetection]) {
    goto LABEL_21;
  }
  int v13 = [(PKPhysicsBody *)self allowsRotation];
  if (v13 != [v5 allowsRotation]) {
    goto LABEL_21;
  }
  int v14 = [(PKPhysicsBody *)self pinned];
  if (v14 != [v5 pinned]) {
    goto LABEL_21;
  }
  int v15 = [(PKPhysicsBody *)self affectedByGravity];
  if (v15 != [v5 affectedByGravity]) {
    goto LABEL_21;
  }
  unsigned int v16 = [(PKPhysicsBody *)self categoryBitMask];
  if (v16 != [v5 categoryBitMask]) {
    goto LABEL_21;
  }
  unsigned int v17 = [(PKPhysicsBody *)self collisionBitMask];
  if (v17 != [v5 collisionBitMask]) {
    goto LABEL_21;
  }
  unsigned int v18 = [(PKPhysicsBody *)self fieldBitMask];
  if (v18 != [v5 fieldBitMask]) {
    goto LABEL_21;
  }
  unsigned int v19 = [(PKPhysicsBody *)self contactTestBitMask];
  if (v19 != [v5 contactTestBitMask]) {
    goto LABEL_21;
  }
  [(PKPhysicsBody *)self area];
  [v5 area];
  [(PKPhysicsBody *)self friction];
  [v5 friction];
  [(PKPhysicsBody *)self charge];
  [v5 charge];
  [(PKPhysicsBody *)self restitution];
  [v5 restitution];
  [(PKPhysicsBody *)self density];
  [v5 density];
  [(PKPhysicsBody *)self mass];
  [v5 mass];
  [(PKPhysicsBody *)self velocity];
  [v5 velocity];
  [(PKPhysicsBody *)self velocity];
  [v5 velocity];
  [(PKPhysicsBody *)self angularVelocity];
  [v5 angularVelocity];
  [(PKPhysicsBody *)self linearDamping];
  [v5 linearDamping];
  [(PKPhysicsBody *)self angularDamping];
  [v5 angularDamping];
  float v20 = self->_outline.__ptr_;
  unint64_t v21 = v5[34];
  BOOL v22 = ((unint64_t)v20 | v21) == 0;
  if (v20 && v21)
  {
    PKPath::isEqualToPath(v20, (PKPath *)v21);
LABEL_20:
    BOOL v22 = 1;
  }
LABEL_22:

  return v22;
}

- (PKPhysicsBody)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKPhysicsBody;
  v2 = [(PKPhysicsBody *)&v10 init];
  int v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isPinned = 256;
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    joints = v3->_joints;
    v3->_joints = (NSMutableArray *)v4;

    v3->_shapes.__end_ = v3->_shapes.__begin_;
    *(int32x2_t *)&v3->_bodyDef.linearDamping = vdup_n_s32(0x3DCCCCCDu);
    v3->_bodyDef.allowSleep = 0;
    v3->_dynamicType = 2;
    v3->_bodyDef.type = 2;
    v3->_boddouble y = 0;
    v3->_inUse = 0;
    objc_storeWeak((id *)&v3->_representedObject, 0);
    v3->_edgeRadius = 0.00899999961;
    cntrl = (std::__shared_weak_count *)v3->_quadTree.__cntrl_;
    v3->_quadTree.__ptr_ = 0;
    v3->_quadTree.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    uint64_t v7 = (std::__shared_weak_count *)v3->_pathPtr.__cntrl_;
    v3->_pathPtr.__ptr_ = 0;
    v3->_pathPtr.__cntrl_ = 0;
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    CGFloat v8 = (std::__shared_weak_count *)v3->_outline.__cntrl_;
    v3->_outline.__ptr_ = 0;
    v3->_outline.__cntrl_ = 0;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  return v3;
}

- (void)dealloc
{
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  while (begin != end)
  {
    uint64_t v5 = *begin;
    if (*begin)
    {
      if (v5->var0.var0) {
        (*(void (**)(b2Shape *, SEL))(*(void *)v5->var0.var0 + 8))(v5->var0.var0, a2);
      }
      MEMORY[0x21668C8E0](v5, 0x10E0C40EA88CBB9);
      end = self->_shapes.__end_;
    }
    ++begin;
  }
  cntrl = self->_outline.__cntrl_;
  self->_outline.__ptr_ = 0;
  self->_outline.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  self->_shapes.__end_ = self->_shapes.__begin_;
  v7.receiver = self;
  v7.super_class = (Class)PKPhysicsBody;
  [(PKPhysicsBody *)&v7 dealloc];
}

- (PKPhysicsBody)initWithBodies:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v25 = a3;
  uint64_t v4 = [(PKPhysicsBody *)self init];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v25 copyItems:1];
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v27 = *(void *)v30;
    p_shapes = &v4->_shapes;
    do
    {
      uint64_t v7 = 0;
      uint64_t v28 = v5;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        CGFloat v8 = *(void **)(*((void *)&v29 + 1) + 8 * v7);
        for (i = *(PKPhysicsShape ***)[v8 _shapes];
              i != *(PKPhysicsShape ***)([v8 _shapes] + 8);
              ++i)
        {
          objc_super v10 = *i;
          end = v4->_shapes.__end_;
          value = v4->_shapes.__end_cap_.__value_;
          if (end >= value)
          {
            uint64_t v14 = end - p_shapes->__begin_;
            if ((unint64_t)(v14 + 1) >> 61) {
              std::vector<PKPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v15 = (char *)value - (char *)p_shapes->__begin_;
            uint64_t v16 = v15 >> 2;
            if (v15 >> 2 <= (unint64_t)(v14 + 1)) {
              uint64_t v16 = v14 + 1;
            }
            if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v17 = v16;
            }
            if (v17) {
              unsigned int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKPoint>>((uint64_t)&v4->_shapes.__end_cap_, v17);
            }
            else {
              unsigned int v18 = 0;
            }
            unsigned int v19 = (PKPhysicsShape **)&v18[8 * v14];
            *unsigned int v19 = v10;
            int v13 = v19 + 1;
            begin = v4->_shapes.__begin_;
            float v20 = v4->_shapes.__end_;
            if (v20 != begin)
            {
              do
              {
                BOOL v22 = *--v20;
                *--unsigned int v19 = v22;
              }
              while (v20 != begin);
              float v20 = p_shapes->__begin_;
            }
            v4->_shapes.__begin_ = v19;
            v4->_shapes.__end_ = v13;
            v4->_shapes.__end_cap_.__value_ = (PKPhysicsShape **)&v18[8 * v17];
            if (v20) {
              operator delete(v20);
            }
          }
          else
          {
            *end = v10;
            int v13 = end + 1;
          }
          v4->_shapes.__end_ = v13;
        }
        CGFloat v23 = (void *)[v8 _shapes];
        v23[1] = *v23;
        ++v7;
      }
      while (v7 != v28);
      uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v5);
  }

  v4->_shapeType = 7;
  return v4;
}

- (PKPhysicsBody)initWithCircleOfRadius:(double)a3
{
  return -[PKPhysicsBody initWithCircleOfRadius:center:](self, "initWithCircleOfRadius:center:", a3, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (PKPhysicsBody)initWithCircleOfRadius:(double)a3 center:(CGPoint)a4
{
  uint64_t v5 = [(PKPhysicsBody *)self init];
  float v6 = a3;
  addCircleBody(v5, v6, &v8);
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3
{
  double edgeRadius = self->_edgeRadius;
  *(float *)&double edgeRadius = edgeRadius;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](self, "initWithRectangleOfSize:center:edgeRadius:", a3.width, a3.height, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), edgeRadius);
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  double edgeRadius = self->_edgeRadius;
  *(float *)&double edgeRadius = edgeRadius;
  return -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](self, "initWithRectangleOfSize:center:edgeRadius:", a3.width, a3.height, a4.x, a4.y, edgeRadius);
}

- (PKPhysicsBody)initWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(float)a5
{
  addRectangle([(PKPhysicsBody *)self init], &v7, &v6, a5);
}

- (PKPhysicsBody)initWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  addEdge([(PKPhysicsBody *)self init], &v6, &v5);
}

- (PKPhysicsBody)initWithPolygonFromPath:(CGPath *)a3
{
}

- (PKPhysicsBody)initWithEdgeChainFromPath:(CGPath *)a3
{
}

- (PKPhysicsBody)initWithEdgeLoopFromPath:(CGPath *)a3
{
}

+ (id)initWithQuadTree:(id)a3
{
  int v3 = a3;
  uint64_t v4 = objc_alloc_init(PKPhysicsBody);
  CGPoint v5 = v4;
  v4->_shapeType = 8;
  CGSize v7 = (QuadTree *)v3[1];
  uint64_t v6 = v3[2];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v4->_quadTree.__cntrl_;
  v5->_quadTree.__ptr_ = v7;
  v5->_quadTree.__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  unint64_t v9 = v5;
  v9->_dynamicType = 1;
  v9->_bodyDef.type = 1;
  operator new();
}

+ (id)initWithMarchingCubes:(void *)a3 pixelFrame:(CGRect)a4
{
  CGRect v6 = a4;
  uint64_t v4 = PKCGrid::physicsBodyFromMarchingCubes((PKCGrid *)a3, &v6);

  return v4;
}

+ (id)bodyWithBodies:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [[PKPhysicsBody alloc] initWithBodies:v3];

  return v4;
}

+ (id)bodyWithCircleOfRadius:(double)a3
{
  uint64_t v4 = [PKPhysicsBody alloc];
  CGPoint v5 = -[PKPhysicsBody initWithCircleOfRadius:center:](v4, "initWithCircleOfRadius:center:", a3, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return v5;
}

+ (id)bodyWithCircleOfRadius:(double)a3 center:(CGPoint)a4
{
  uint64_t v4 = -[PKPhysicsBody initWithCircleOfRadius:center:]([PKPhysicsBody alloc], "initWithCircleOfRadius:center:", a3, a4.x, a4.y);

  return v4;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGPoint v5 = [PKPhysicsBody alloc];
  CGRect v6 = -[PKPhysicsBody initWithRectangleOfSize:center:](v5, "initWithRectangleOfSize:center:", width, height, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));

  return v6;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 edgeRadius:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  CGSize v7 = [PKPhysicsBody alloc];
  *(float *)&double v8 = a4;
  unint64_t v9 = -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](v7, "initWithRectangleOfSize:center:edgeRadius:", width, height, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v8);

  return v9;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  uint64_t v4 = -[PKPhysicsBody initWithRectangleOfSize:center:]([PKPhysicsBody alloc], "initWithRectangleOfSize:center:", a3.width, a3.height, a4.x, a4.y);

  return v4;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4 edgeRadius:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  objc_super v10 = [PKPhysicsBody alloc];
  *(float *)&double v11 = a5;
  int v12 = -[PKPhysicsBody initWithRectangleOfSize:center:edgeRadius:](v10, "initWithRectangleOfSize:center:edgeRadius:", width, height, x, y, v11);

  return v12;
}

+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  uint64_t v4 = -[PKPhysicsBody initWithEdgeFromPoint:toPoint:]([PKPhysicsBody alloc], "initWithEdgeFromPoint:toPoint:", a3.x, a3.y, a4.x, a4.y);

  return v4;
}

+ (id)bodyWithPolygonFromPath:(CGPath *)a3
{
  if (!CGPathIsEllipse()
    || (CGFloat width = v13.size.width,
        CGFloat height = v13.size.height,
        float v6 = v13.size.width,
        float v7 = v13.size.height,
        (COERCE_UNSIGNED_INT(v6 - v7) & 0x60000000) != 0))
  {
    PKPathCreateFromSimplifiedCGPath();
  }
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  double MidX = CGRectGetMidX(*(CGRect *)(&width - 2));
  double v11 = objc_msgSend(a1, "bodyWithCircleOfRadius:center:", (float)(v6 * 0.5), MidX, CGRectGetMidY(v13));

  return v11;
}

+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3
{
  id v3 = [[PKPhysicsBody alloc] initWithEdgeChainFromPath:a3];

  return v3;
}

+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3
{
  id v3 = [[PKPhysicsBody alloc] initWithEdgeLoopFromPath:a3];

  return v3;
}

- (void)setRepresentedObject:(id)a3
{
}

- (NSObject)representedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedObject);

  return WeakRetained;
}

- (void)setPinned:(BOOL)a3
{
  self->_isPinned = a3;
  BOOL v3 = !self->_allowsRotation && !a3;
  self->_bodyDef.fixedRotation = v3;
  bodCGFloat y = self->_body;
  if (body) {
    b2Body::SetFixedRotation(body, v3);
  }
}

- (BOOL)pinned
{
  return self->_isPinned;
}

- (void)setPosition:(CGPoint)a3
{
  double y = a3.y;
  float v5 = a3.x * PKGet_INV_PTM_RATIO();
  float v6 = y * PKGet_INV_PTM_RATIO();
  v10.CGFloat x = v5;
  v10.double y = v6;
  if ((LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
  {
    boddouble y = self->_body;
    if (body)
    {
      float v9 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
      b2Body::SetTransform(body, &v10, v9);
    }
    self->_bodyDef.position = v10;
    [(PKPhysicsBody *)self setResting:0];
  }
}

- (CGPoint)position
{
  bodfloat y = self->_body;
  if (body) {
    p_uint64_t var0 = &body->var8.var0;
  }
  else {
    p_uint64_t var0 = &self->_bodyDef.position;
  }
  float x = p_var0->x;
  float y = p_var0->y;
  double v6 = (float)(x * PKGet_PTM_RATIO());
  double v7 = (float)(y * PKGet_PTM_RATIO());
  double v8 = v6;
  result.float y = v7;
  result.float x = v8;
  return result;
}

- (void)set_allowSleep:(BOOL)a3
{
  bodfloat y = self->_body;
  if (body) {
    b2Body::SetSleepingAllowed(body, a3);
  }
  self->_bodyDef.allowSleep = a3;
}

- (BOOL)_allowSleep
{
  bodfloat y = self->_body;
  if (body) {
    LOBYTE(v4) = b2Body::IsSleepingAllowed(body);
  }
  else {
    return self->_bodyDef.allowSleep;
  }
  return v4;
}

- (void)setRotation:(double)a3
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v6;
    uint64_t v12 = v5;
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    bodfloat y = self->_body;
    if (body)
    {
      b2Vec2 var0 = body->var8.var0;
      float v9 = a3;
      b2Body::SetTransform(body, &var0, v9);
    }
    else
    {
      float v9 = a3;
    }
    self->_bodyDef.angle = v9;
    [(PKPhysicsBody *)self setResting:0];
  }
}

- (double)rotation
{
  bodfloat y = self->_body;
  if (body) {
    return atan2f(body->var8.var1.var0, body->var8.var1.var1);
  }
  else {
    return self->_bodyDef.angle;
  }
}

- (void)setLinearDamping:(double)a3
{
  bodfloat y = self->_body;
  float v4 = a3;
  if (body) {
    *((float *)&body->var30 + 1) = v4;
  }
  self->_bodyDef.linearDamping = v4;
}

- (double)linearDamping
{
  bodfloat y = self->_body;
  if (body) {
    p_linearDamping = (float *)&body->var30 + 1;
  }
  else {
    p_linearDamping = &self->_bodyDef.linearDamping;
  }
  return *p_linearDamping;
}

- (void)setAngularDamping:(double)a3
{
  bodfloat y = self->_body;
  float v4 = a3;
  if (body) {
    *(float *)&body[1].b2Vec2 var0 = v4;
  }
  self->_bodyDef.angularDamping = v4;
}

- (double)angularDamping
{
  bodfloat y = self->_body;
  if (body) {
    p_b2Vec2 var0 = (float *)&body[1].var0;
  }
  else {
    p_b2Vec2 var0 = &self->_bodyDef.angularDamping;
  }
  return *p_var0;
}

- (void)applyForce:(CGPoint)a3 atPoint:(CGPoint)a4
{
  boddouble y = self->_body;
  if (body)
  {
    double y = a4.y;
    double x = a4.x;
    double v7 = a3.y;
    float v8 = a3.x * PKGet_INV_PTM_RATIO();
    float v9 = v7 * PKGet_INV_PTM_RATIO();
    float v10 = PKGet_INV_PTM_RATIO();
    float v11 = PKGet_INV_PTM_RATIO();
    BOOL v12 = (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v9) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v12 && body->var5 == 2)
    {
      float v13 = x * v10;
      float v14 = y * v11;
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float v15 = *(float *)&body->var16 + v9;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + v8;
      *(float *)&body->var16 = v15;
      *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1)
                                   + (float)((float)((float)(v13 - body->var10.var2.var0.var1) * v9)
                                           - (float)((float)(v14 - body->var10.var2.var0.var2) * v8));
    }
  }
}

- (void)applyForce:(CGPoint)a3
{
  boddouble y = self->_body;
  if (body)
  {
    double y = a3.y;
    float v5 = a3.x * PKGet_INV_PTM_RATIO();
    float v6 = y * PKGet_INV_PTM_RATIO();
    BOOL v7 = (LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v7 && body->var5 == 2)
    {
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float v8 = *(float *)&body->var16 + v6;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + v5;
      *(float *)&body->var16 = v8;
    }
  }
}

- (void)applyTorque:(double)a3
{
  boddouble y = self->_body;
  float v4 = a3;
  if (body) {
    BOOL v5 = COERCE_UNSIGNED_INT(fabs(a3)) <= 0x7F7FFFFF;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0) {
      b2Body::SetAwake(body, 1);
    }
    *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1) + v4;
  }
}

- (void)applyImpulse:(CGVector)a3 atPoint:(CGPoint)a4
{
  boddouble y = self->_body;
  if (body)
  {
    double y = a4.y;
    double x = a4.x;
    ddouble y = a3.dy;
    float v8 = a3.dx * PKGet_INV_PTM_RATIO();
    float v9 = dy * PKGet_INV_PTM_RATIO();
    float v10 = PKGet_INV_PTM_RATIO();
    float v11 = PKGet_INV_PTM_RATIO();
    BOOL v12 = (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v9) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v12 && body->var5 == 2)
    {
      float v13 = x * v10;
      float v14 = y * v11;
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float var27 = body->var27;
      float v16 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * v8) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * v9) + v16;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(v13 - body->var10.var2.var0.var1) * v9)
                                             - (float)((float)(v14 - body->var10.var2.var0.var2) * v8)));
    }
  }
}

- (void)applyImpulse:(CGVector)a3
{
  boddouble y = self->_body;
  if (body)
  {
    ddouble y = a3.dy;
    float var1 = body->var10.var2.var0.var1;
    float var2 = body->var10.var2.var0.var2;
    float v7 = a3.dx * PKGet_INV_PTM_RATIO();
    float v8 = dy * PKGet_INV_PTM_RATIO();
    BOOL v9 = (LODWORD(v7) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v8) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v9 && body->var5 == 2)
    {
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float var27 = body->var27;
      float v11 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * v7) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * v8) + v11;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(var1 - body->var10.var2.var0.var1) * v8)
                                             - (float)((float)(var2 - body->var10.var2.var0.var2) * v7)));
    }
  }
}

- (void)applyAngularImpulse:(double)a3
{
  boddouble y = self->_body;
  float v4 = a3;
  if (body) {
    BOOL v5 = COERCE_UNSIGNED_INT(fabs(a3)) <= 0x7F7FFFFF;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0) {
      b2Body::SetAwake(body, 1);
    }
    *(float *)&body->var15 = *(float *)&body->var15 + (float)(*(float *)&body->var30 * v4);
  }
}

- (void)applyUnscaledForce:(CGVector)a3 atPoint:(CGPoint)a4
{
  boddouble y = self->_body;
  if (body)
  {
    double y = a4.y;
    double x = a4.x;
    ddouble x = a3.dx;
    ddouble y = a3.dy;
    float v9 = PKGet_INV_PTM_RATIO();
    float v10 = PKGet_INV_PTM_RATIO();
    BOOL v11 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(dy) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v11 && body->var5 == 2)
    {
      float v12 = x * v9;
      float v13 = y * v10;
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float v14 = *(float *)&body->var16 + dy;
      *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + dx;
      *(float *)&body->var16 = v14;
      *((float *)&body->var16 + 1) = *((float *)&body->var16 + 1)
                                   + (float)((float)((float)(v12 - body->var10.var2.var0.var1) * dy)
                                           - (float)((float)(v13 - body->var10.var2.var0.var2) * dx));
    }
  }
}

- (void)applyUnscaledForce:(CGVector)a3
{
  boddouble y = self->_body;
  ddouble x = a3.dx;
  ddouble y = a3.dy;
  if (body) {
    BOOL v6 = COERCE_UNSIGNED_INT(fabs(a3.dx)) <= 0x7F7FFFFF;
  }
  else {
    BOOL v6 = 0;
  }
  float v7 = fabs(a3.dy);
  BOOL v8 = v6 && SLODWORD(v7) <= 2139095039;
  if (v8 && body->var5 == 2)
  {
    if ((b2Body::IsAwake(self->_body) & 1) == 0) {
      b2Body::SetAwake(body, 1);
    }
    float v9 = *(float *)&body->var16 + dy;
    *((float *)&body->var15 + 1) = *((float *)&body->var15 + 1) + dx;
    *(float *)&body->var16 = v9;
  }
}

- (void)applyUnscaledImpulse:(CGVector)a3 atPoint:(CGPoint)a4
{
  boddouble y = self->_body;
  if (body)
  {
    double y = a4.y;
    double x = a4.x;
    ddouble x = a3.dx;
    ddouble y = a3.dy;
    float v9 = PKGet_INV_PTM_RATIO();
    float v10 = PKGet_INV_PTM_RATIO();
    BOOL v11 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(dy) & 0x7FFFFFFFu) <= 0x7F7FFFFF;
    if (v11 && body->var5 == 2)
    {
      float v12 = x * v9;
      float v13 = y * v10;
      if ((b2Body::IsAwake(body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float var27 = body->var27;
      float v15 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * dx) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * dy) + v15;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(v12 - body->var10.var2.var0.var1) * dy)
                                             - (float)((float)(v13 - body->var10.var2.var0.var2) * dx)));
    }
  }
}

- (void)applyUnscaledImpulse:(CGVector)a3
{
  boddouble y = self->_body;
  if (body)
  {
    ddouble x = a3.dx;
    ddouble y = a3.dy;
    BOOL v6 = (LODWORD(dx) & 0x7FFFFFFFu) <= 0x7F7FFFFF && COERCE_UNSIGNED_INT(fabs(a3.dy)) <= 0x7F7FFFFF;
    if (v6 && body->var5 == 2)
    {
      float var1 = body->var10.var2.var0.var1;
      float var2 = body->var10.var2.var0.var2;
      if ((b2Body::IsAwake(self->_body) & 1) == 0) {
        b2Body::SetAwake(body, 1);
      }
      float var27 = body->var27;
      float v10 = *(&body->var14 + 1);
      body->var14 = (float)(var27 * dx) + body->var14;
      *(&body->var14 + 1) = (float)(var27 * dy) + v10;
      *(float *)&body->var15 = *(float *)&body->var15
                             + (float)(*(float *)&body->var30
                                     * (float)((float)((float)(var1 - body->var10.var2.var0.var1) * dy)
                                             - (float)((float)(var2 - body->var10.var2.var0.var2) * dx)));
    }
  }
}

- (BOOL)usesPreciseCollisionDetection
{
  return self->_bodyDef.bullet;
}

- (void)setUsesPreciseCollisionDetection:(BOOL)a3
{
  self->_bodyDef.bullet = a3;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetBullet(body, a3);
  }
}

- (BOOL)affectedByGravity
{
  return self->_bodyDef._sk_affectedByGravity;
}

- (void)setAffectedByGravity:(BOOL)a3
{
  self->_bodyDef._sk_affectedByGravitdouble y = a3;
  boddouble y = self->_body;
  if (body) {
    body->b2Vec2 var0 = a3;
  }
}

- (unsigned)categoryBitMask
{
  return self->_bodyDef._sk_categoryBitMask;
}

- (void)setCategoryBitMask:(unsigned int)a3
{
  self->_bodyDef._sk_categoryBitMask = a3;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetCategoryBitMask(body, a3);
  }
}

- (unsigned)fieldBitMask
{
  return self->_bodyDef._sk_fieldCategoryBitMask;
}

- (void)setFieldBitMask:(unsigned int)a3
{
  self->_bodyDef._sk_fieldCategoryBitMask = a3;
  boddouble y = self->_body;
  if (body) {
    body->float var1 = a3;
  }
}

- (unsigned)collisionBitMask
{
  return self->_bodyDef._sk_collisionBitMask;
}

- (void)setCollisionBitMask:(unsigned int)a3
{
  self->_bodyDef._sk_collisionBitMask = a3;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetCollisionBitMask(body, a3);
  }
}

- (unsigned)contactTestBitMask
{
  return self->_bodyDef._sk_intersectionCallbackBitMask;
}

- (void)setContactTestBitMask:(unsigned int)a3
{
  self->_bodyDef._sk_intersectionCallbackBitMask = a3;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetIntersectionCallbackBitMask(body, a3);
  }
}

- (void)setVelocity:(CGVector)a3
{
  ddouble y = a3.dy;
  float v5 = a3.dx * PKGet_INV_PTM_RATIO();
  float v6 = dy * PKGet_INV_PTM_RATIO();
  if ((LODWORD(v5) & 0x7FFFFFFFu) <= 0x7F7FFFFF && (LODWORD(v6) & 0x7FFFFFFFu) <= 0x7F7FFFFF)
  {
    self->_bodyDef.linearVelocity.double x = v5;
    self->_bodyDef.linearVelocity.double y = v6;
    boddouble y = self->_body;
    if (body)
    {
      if (body->var5)
      {
        if ((float)((float)(v6 * v6) + (float)(v5 * v5)) > 0.0) {
          b2Body::SetAwake(body, 1);
        }
        body->var14 = v5;
        *(&body->var14 + 1) = v6;
      }
    }
  }
}

- (CGVector)velocity
{
  boddouble y = self->_body;
  p_linearVelocitdouble y = &self->_bodyDef.linearVelocity;
  p_var14 = (b2Vec2 *)&body->var14;
  BOOL v5 = body == 0;
  if (body) {
    p_double y = &body->var14 + 1;
  }
  else {
    p_double y = &self->_bodyDef.linearVelocity.y;
  }
  if (!v5) {
    p_linearVelocitdouble y = p_var14;
  }
  float x = p_linearVelocity->x;
  float v8 = *p_y;
  float v9 = x * PKGet_PTM_RATIO();
  double v10 = (float)(v8 * PKGet_PTM_RATIO());
  double v11 = v9;
  result.ddouble y = v10;
  result.dfloat x = v11;
  return result;
}

- (void)setAngularVelocity:(double)a3
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    float v3 = a3;
    self->_bodyDef.angularVelocitdouble y = v3;
    boddouble y = self->_body;
    if (body)
    {
      float v5 = (LODWORD(v3) & 0x7FFFFFFFu) >= 0x7F800000 ? 0.0 : v3;
      if (body->var5)
      {
        if ((float)(v5 * v5) > 0.0) {
          b2Body::SetAwake(self->_body, 1);
        }
        *(float *)&body->var15 = v5;
      }
    }
  }
}

- (double)angularVelocity
{
  boddouble y = self->_body;
  if (body) {
    p_var15 = (float *)&body->var15;
  }
  else {
    p_var15 = &self->_bodyDef.angularVelocity;
  }
  return *p_var15;
}

- (void)setAllowsRotation:(BOOL)a3
{
  self->_allowsRotation = a3;
  if (a3) {
    int v4 = 0;
  }
  else {
    int v4 = ![(PKPhysicsBody *)self pinned];
  }
  self->_bodyDef.fixedRotation = v4;
  boddouble y = self->_body;
  if (body)
  {
    b2Body::SetFixedRotation(body, v4);
  }
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (BOOL)isResting
{
  boddouble y = self->_body;
  if (body) {
    LOBYTE(v4) = b2Body::IsAwake(body) ^ 1;
  }
  else {
    return !self->_bodyDef.awake;
  }
  return v4;
}

- (void)setResting:(BOOL)a3
{
  self->_bodyDef.awake = !a3;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetAwake(body, !a3);
  }
}

- (NSArray)joints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_joints = &self->_joints;
  float v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_joints, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = *p_joints;
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
        float v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "_implicit", (void)v10) & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (double)mass
{
  begin = self->_shapes.__begin_;
  if (begin != self->_shapes.__end_)
  {
    double v5 = 0.0;
    while (1)
    {
      uint64_t v6 = *begin;
      float var1 = (*begin)->var1;
      if (var1) {
        break;
      }
      b2Vec2 var0 = v6->var0.var0;
      if (v6->var0.var0)
      {
        [(PKPhysicsBody *)self density];
        v9.n128_f32[0] = v9.n128_f64[0];
        (*(void (**)(b2Shape *, float *, __n128))(*(void *)var0 + 64))(var0, v11, v9);
        goto LABEL_7;
      }
LABEL_8:
      if (++begin == self->_shapes.__end_) {
        return v5;
      }
    }
    v2.n128_u32[0] = *((_DWORD *)var1 + 2);
    (*(void (**)(void, float *, __n128))(**((void **)var1 + 4) + 64))(*((void *)var1 + 4), v11, v2);
LABEL_7:
    v2.n128_f64[0] = v11[0];
    double v5 = v5 + v11[0];
    goto LABEL_8;
  }
  return 0.0;
}

- (void)setMass:(double)a3
{
  [(PKPhysicsBody *)self mass];
  double v6 = v5;
  [(PKPhysicsBody *)self density];
  double v8 = v7 / v6 * a3;

  [(PKPhysicsBody *)self setDensity:v8];
}

- (void)setDensity:(double)a3
{
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    float v5 = a3;
    BOOL v6 = v5 > -INFINITY;
    if (v5 >= INFINITY) {
      BOOL v6 = 0;
    }
    if (v5 < 0.0) {
      BOOL v6 = 0;
    }
    do
    {
      double v7 = *begin;
      v7->var0.var4 = v5;
      float var1 = v7->var1;
      if (var1)
      {
        if (!v6) {
          -[PKPhysicsBody setDensity:]();
        }
        *((float *)var1 + 2) = v5;
      }
      ++begin;
    }
    while (begin != end);
  }
  boddouble y = self->_body;
  if (body)
  {
    b2Body::ResetMassData(body);
  }
}

- (double)density
{
  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin) {
    return 0.0;
  }
  else {
    return (*begin)->var0.var4;
  }
}

- (double)area
{
  [(PKPhysicsBody *)self density];
  if (v3 == 0.0) {
    return 0.0;
  }
  [(PKPhysicsBody *)self mass];
  double v5 = v4;
  [(PKPhysicsBody *)self density];
  return v5 / v6;
}

- (double)radius
{
  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin) {
    return 0.0;
  }
  else {
    return *((float *)(*begin)->var0.var0 + 3);
  }
}

- (void)reapplyScale:(double)a3 yScale:(double)a4
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    begin = self->_shapes.__begin_;
    end = self->_shapes.__end_;
    if (begin != end)
    {
      float v7 = a3;
      float v8 = a4;
      do
      {
        __n128 v9 = (b2FixtureDef *)*begin;
        float var1 = (*begin)->var1;
        if (var1)
        {
          PKPhysicsReapplyScaleOnFixture(v9, var1, v7, v8);
        }
        else
        {
          v9->var5 = v7;
          v9->var6 = v8;
        }
        ++begin;
      }
      while (begin != end);
    }
    boddouble y = self->_body;
    if (body)
    {
      float v12 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
      b2Body::SetTransform(body, &body->var8.var0, v12);
    }
  }
}

- (void)setRadius:(double)a3
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    begin = self->_shapes.__begin_;
    end = self->_shapes.__end_;
    if (begin != end)
    {
      float v6 = a3;
      do
      {
        uint64_t v7 = (uint64_t)*begin++;
        *(float *)(*(void *)(*(void *)(v7 + 40) + 32) + 12) = v6;
      }
      while (begin != end);
    }
    boddouble y = self->_body;
    float v9 = atan2f(body->var8.var1.var0, body->var8.var1.var1);
    b2Body::SetTransform(body, &body->var8.var0, v9);
  }
}

- (void)setRestitution:(double)a3
{
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    float v5 = a3;
    do
    {
      float v6 = *begin;
      v6->var0.var3 = v5;
      float var1 = v6->var1;
      if (var1) {
        *((float *)var1 + 11) = v5;
      }
      ++begin;
    }
    while (begin != end);
  }
}

- (double)restitution
{
  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin) {
    return 0.0;
  }
  else {
    return (*begin)->var0.var3;
  }
}

- (void)setFriction:(double)a3
{
  begin = self->_shapes.__begin_;
  end = self->_shapes.__end_;
  if (begin != end)
  {
    float v5 = a3;
    do
    {
      float v6 = *begin;
      v6->var0.float var2 = v5;
      float var1 = v6->var1;
      if (var1) {
        *((float *)var1 + 10) = v5;
      }
      ++begin;
    }
    while (begin != end);
  }
}

- (double)friction
{
  begin = self->_shapes.__begin_;
  if (self->_shapes.__end_ == begin) {
    return 0.0;
  }
  else {
    return (*begin)->var0.var2;
  }
}

- (void)setCharge:(double)a3
{
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    float v3 = a3;
    self->_bodyDef.charge = v3;
    boddouble y = self->_body;
    if (body) {
      b2Body::SetCharge(body, v3);
    }
  }
}

- (double)charge
{
  boddouble y = self->_body;
  if (body) {
    return b2Body::GetCharge(body);
  }
  else {
    return self->_bodyDef.charge;
  }
}

- (BOOL)isDynamic
{
  return self->_bodyDef.type == self->_dynamicType;
}

- (void)setDynamic:(BOOL)a3
{
  if (a3) {
    int dynamicType = self->_dynamicType;
  }
  else {
    int dynamicType = 0;
  }
  self->_bodyDef.type = dynamicType;
  boddouble y = self->_body;
  if (body) {
    b2Body::SetType(body, dynamicType);
  }
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21668C810](self, a2);

  return [(PKPhysicsBody *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  float v5 = (PKPhysicsBody *)v4;
  *(_DWORD *)(v4 + 164) = self->_shapeType;
  *(double *)(v4 + 256) = self->_edgeRadius;
  *(double *)(v4 + 248) = self->_radius;
  *(CGPoint *)(v4 + 200) = self->_p0;
  *(CGPoint *)(v4 + 216) = self->_p1;
  *(CGSize *)(v4 + 232) = self->_size;
  ptr = self->_pathPtr.__ptr_;
  cntrl = self->_pathPtr.__cntrl_;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  float v8 = *(std::__shared_weak_count **)(v4 + 176);
  v5->_pathPtr.__ptr_ = ptr;
  v5->_pathPtr.__cntrl_ = cntrl;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  long long v10 = self->_outline.__ptr_;
  float v9 = self->_outline.__cntrl_;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v9 + 1, 1uLL, memory_order_relaxed);
  }
  long long v11 = (std::__shared_weak_count *)v5->_outline.__cntrl_;
  v5->_outline.__ptr_ = v10;
  v5->_outline.__cntrl_ = v9;
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  [(PKPhysicsBody *)v5 setDynamic:[(PKPhysicsBody *)self isDynamic]];
  [(PKPhysicsBody *)v5 setUsesPreciseCollisionDetection:[(PKPhysicsBody *)self usesPreciseCollisionDetection]];
  [(PKPhysicsBody *)v5 setAllowsRotation:[(PKPhysicsBody *)self allowsRotation]];
  switch(self->_shapeType)
  {
    case 1:
      float radius = self->_radius;
      addCircleBody(v5, radius, &self->_p0);
    case 2:
      float edgeRadius = v5->_edgeRadius;
      addRectangle(v5, &v5->_size, &v5->_p0, edgeRadius);
    case 3:
      float v14 = (std::__shared_weak_count *)v5->_pathPtr.__cntrl_;
      v27[0] = v5->_pathPtr.__ptr_;
      v27[1] = v14;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      addPolygonFromPath(v5, (uint64_t)v27);
      if (v14) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v14);
      }
      break;
    case 4:
      addEdge(v5, &v5->_p0, &v5->_p1);
    case 5:
      long long v13 = v5->_pathPtr.__cntrl_;
      v26[0] = v5->_pathPtr.__ptr_;
      v26[1] = v13;
      if (v13) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
      }
      addEdgeChain(v5, v26);
    case 6:
      float v16 = v5->_pathPtr.__cntrl_;
      v25[0] = v5->_pathPtr.__ptr_;
      v25[1] = v16;
      if (v16) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)v16 + 1, 1uLL, memory_order_relaxed);
      }
      addEdgeLoop(v5, (uint64_t)v25);
    case 7:
      begin = self->_shapes.__begin_;
      if (begin != self->_shapes.__end_)
      {
        long long v22 = xmmword_21359A520;
        do
        {
          b2Vec2 var0 = (float32x2_t *)(*begin)->var0.var0;
          switch(var0[1].i32[0])
          {
            case 0:
              float v19 = var0[1].f32[1];
              v24.float x = 0.0;
              v24.double y = 0.0;
              addCircleBody(v5, v19, &v24);
            case 1:
              CGPoint v20 = (CGPoint)vcvtq_f64_f32(var0[2]);
              CGPoint v23 = (CGPoint)vcvtq_f64_f32(var0[3]);
              CGPoint v24 = v20;
              addEdge(v5, &v24, &v23);
            case 2:
              operator new();
            case 3:
              operator new();
            case 4:
              NSLog(&cfstr_NeedToImplemen_0.isa, v22);
              break;
            default:
              break;
          }
          ++begin;
        }
        while (begin != self->_shapes.__end_);
      }
      break;
    case 8:
      NSLog(&cfstr_NeedToImplemen.isa);
      break;
    default:
      NSLog(&cfstr_EncodeError.isa);
      __assert_rtn("-[PKPhysicsBody copyWithZone:]", "PKPhysicsBody.mm", 1593, "false");
  }
  [(PKPhysicsBody *)self friction];
  -[PKPhysicsBody setFriction:](v5, "setFriction:");
  [(PKPhysicsBody *)self charge];
  -[PKPhysicsBody setCharge:](v5, "setCharge:");
  [(PKPhysicsBody *)self restitution];
  -[PKPhysicsBody setRestitution:](v5, "setRestitution:");
  [(PKPhysicsBody *)self density];
  -[PKPhysicsBody setDensity:](v5, "setDensity:");
  [(PKPhysicsBody *)v5 setAffectedByGravity:[(PKPhysicsBody *)self affectedByGravity]];
  [(PKPhysicsBody *)v5 setCategoryBitMask:[(PKPhysicsBody *)self categoryBitMask]];
  [(PKPhysicsBody *)v5 setCollisionBitMask:[(PKPhysicsBody *)self collisionBitMask]];
  [(PKPhysicsBody *)v5 setContactTestBitMask:[(PKPhysicsBody *)self contactTestBitMask]];
  [(PKPhysicsBody *)v5 setFieldBitMask:[(PKPhysicsBody *)self fieldBitMask]];
  [(PKPhysicsBody *)v5 setPinned:[(PKPhysicsBody *)self pinned]];
  [(PKPhysicsBody *)self mass];
  -[PKPhysicsBody setMass:](v5, "setMass:");
  [(PKPhysicsBody *)self angularDamping];
  -[PKPhysicsBody setAngularDamping:](v5, "setAngularDamping:");
  [(PKPhysicsBody *)self linearDamping];
  -[PKPhysicsBody setLinearDamping:](v5, "setLinearDamping:");
  [(PKPhysicsBody *)self velocity];
  -[PKPhysicsBody setVelocity:](v5, "setVelocity:");
  [(PKPhysicsBody *)self angularVelocity];
  -[PKPhysicsBody setAngularVelocity:](v5, "setAngularVelocity:");
  return v5;
}

- (id)_descriptionClassName
{
  return @"PKPhysicsBody";
}

- (id)description
{
  uint64_t v3 = NSString;
  p_representedObject = &self->_representedObject;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedObject);
  float v6 = [v3 stringWithFormat:@"%@", WeakRetained];

  id v7 = objc_loadWeakRetained((id *)p_representedObject);
  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_representedObject);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)p_representedObject);
      [v10 description];
    }
    else
    {
      float v12 = NSString;
      id v10 = objc_loadWeakRetained((id *)p_representedObject);
      objc_msgSend(v12, "stringWithFormat:", @"%luxp", v10);
    long long v11 = };
  }
  else
  {
    long long v11 = v6;
  }
  unsigned int v13 = self->_shapeType - 1;
  if (v13 > 7) {
    float v14 = @"<Unknown>";
  }
  else {
    float v14 = off_2641AF8D8[v13];
  }
  uint64_t v15 = NSString;
  float v16 = [(PKPhysicsBody *)self _descriptionClassName];
  unint64_t v17 = [v15 stringWithFormat:@"<%@> type:%@ representedObject:[%@]", v16, v14, v11];

  return v17;
}

- (id)allContactedBodies
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  boddouble y = self->_body;
  if (body)
  {
    for (uint64_t i = *(void **)&body->var24; i; uint64_t i = (void *)i[3])
    {
      uint64_t v6 = i[1];
      if (*i) {
        BOOL v7 = v6 == 0;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7 && (*(unsigned char *)(v6 + 12) & 2) != 0 && *(void *)(*i + 240)) {
        objc_msgSend(v3, "addObject:");
      }
    }
  }

  return v3;
}

- (id)postStepBlock
{
  return self->_postStepBlock;
}

- (void)setPostStepBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_postStepBlock, 0);
  cntrl = self->_outline.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->_quadTree.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  float v5 = self->_pathPtr.__cntrl_;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5);
  }
  objc_storeStrong((id *)&self->_joints, 0);
  objc_destroyWeak((id *)&self->_world);
  begin = self->_shapes.__begin_;
  if (begin)
  {
    self->_shapes.__end_ = begin;
    operator delete(begin);
  }

  objc_destroyWeak((id *)&self->_representedObject);
}

- (id).cxx_construct
{
  self->_shapes.__begin_ = 0;
  self->_shapes.__end_ = 0;
  self->_shapes.__end_cap_.__value_ = 0;
  self->_outline.__ptr_ = 0;
  self->_outline.__cntrl_ = 0;
  self->_pathPtr = 0u;
  self->_quadTree = 0u;
  return self;
}

- (void)_shapes
{
  return &self->_shapes;
}

- (BOOL)active
{
  boddouble y = self->_body;
  if (body) {
    LOBYTE(v4) = b2Body::IsActive(body);
  }
  else {
    return self->_bodyDef.active;
  }
  return v4;
}

- (void)setActive:(BOOL)a3
{
  self->_bodyDef.active = a3;
  if (self->_body)
  {
    BOOL v3 = a3;
    p_world = &self->_world;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_world);

    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained((id *)p_world);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __37__PKPhysicsBody_Internal__setActive___block_invoke;
      v9[3] = &unk_2641AF8B8;
      v9[4] = self;
      BOOL v10 = v3;
      [v7 _runBlockOutsideOfTimeStep:v9];
    }
    else
    {
      boddouble y = self->_body;
      b2Body::SetActive(body, v3);
    }
  }
}

void __37__PKPhysicsBody_Internal__setActive___block_invoke(uint64_t a1)
{
}

- (void)set_world:(id)a3
{
}

- (id)_world
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_world);

  return WeakRetained;
}

- (shared_ptr<QuadTree>)_quadTree
{
  cntrl = self->_quadTree.__cntrl_;
  PKPhysicsBody *v2 = self->_quadTree.__ptr_;
  v2[1] = (QuadTree *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (QuadTree *)self;
  return result;
}

- (id)_joints
{
  return self->_joints;
}

- (void)set_joints:(id)a3
{
}

- (BOOL)_inUse
{
  return self->_inUse;
}

- (void)set_inUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (b2BodyDef)_bodyDef
{
  long long v3 = *(_OWORD *)&self->active;
  *(_OWORD *)&retstr->angle = *(_OWORD *)&self->charge;
  *(_OWORD *)&retstr->charge = v3;
  *(_OWORD *)&retstr->active = *(_OWORD *)&self[1]._sk_affectedByGravity;
  long long v4 = *(_OWORD *)&self->angle;
  *(_OWORD *)&retstr->_sk_affectedByGravitdouble y = *(_OWORD *)&self->_sk_intersectionCallbackBitMask;
  *(_OWORD *)&retstr->_sk_intersectionCallbackBitMask = v4;
  return self;
}

- (void)set_bodyDef:(b2BodyDef *)a3
{
  *(_OWORD *)&self->_bodyDef._sk_affectedByGravitdouble y = *(_OWORD *)&a3->_sk_affectedByGravity;
  long long v3 = *(_OWORD *)&a3->_sk_intersectionCallbackBitMask;
  long long v4 = *(_OWORD *)&a3->angle;
  long long v5 = *(_OWORD *)&a3->active;
  *(_OWORD *)&self->_bodyDef.charge = *(_OWORD *)&a3->charge;
  *(_OWORD *)&self->_bodyDef.active = v5;
  *(_OWORD *)&self->_bodyDef._sk_intersectionCallbackBitMask = v3;
  *(_OWORD *)&self->_bodyDef.angle = v4;
}

- (b2Body)_body
{
  return self->_body;
}

- (void)set_body:(b2Body *)a3
{
  self->_boddouble y = a3;
}

- (void)setDensity:.cold.1()
{
  __assert_rtn("SetDensity", "b2Fixture.h", 244, "b2IsValid(density) && density >= 0.0f");
}

@end