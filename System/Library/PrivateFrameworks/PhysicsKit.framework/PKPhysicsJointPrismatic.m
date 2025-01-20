@interface PKPhysicsJointPrismatic
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6;
- (BOOL)isEqualToPrismaticJoint:(id)a3;
- (BOOL)shouldEnableLimits;
- (PKPhysicsJointPrismatic)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6;
- (PKPhysicsJointPrismatic)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (double)lowerDistanceLimit;
- (double)upperDistanceLimit;
- (id).cxx_construct;
- (void)create;
- (void)encodeWithCoder:(id)a3;
- (void)setLowerDistanceLimit:(double)a3;
- (void)setShouldEnableLimits:(BOOL)a3;
- (void)setUpperDistanceLimit:(double)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJointPrismatic

- (PKPhysicsJointPrismatic)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6
{
  CGFloat dy = a6.dy;
  CGFloat dx = a6.dx;
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v12 = a3;
  id v13 = a4;
  v14 = [(PKPhysicsJoint *)self init];
  [(PKPhysicsJoint *)v14 setBodyA:v12];
  [(PKPhysicsJoint *)v14 setBodyB:v13];
  v14->_anchor.CGFloat x = x;
  v14->_anchor.CGFloat y = y;
  v14->_axis.CGFloat dx = dx;
  v14->_axis.CGFloat dy = dy;

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5 axis:(CGVector)a6
{
  double dy = a6.dy;
  double dx = a6.dx;
  double y = a5.y;
  double x = a5.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[PKPhysicsJointPrismatic initWithBodyA:bodyB:anchor:axis:]([PKPhysicsJointPrismatic alloc], "initWithBodyA:bodyB:anchor:axis:", v11, v12, x, y, dx, dy);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointPrismatic;
  [(PKPhysicsJoint *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchor", self->_anchor.x, self->_anchor.y);
  objc_msgSend(v4, "encodeCGVector:forKey:", @"_axis", self->_axis.dx, self->_axis.dy);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsJointPrismatic shouldEnableLimits](self, "shouldEnableLimits"), @"enableLimits");
  [(PKPhysicsJointPrismatic *)self lowerDistanceLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"lowerDistanceLimit");
  [(PKPhysicsJointPrismatic *)self upperDistanceLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"upperDistanceLimit");
}

- (PKPhysicsJointPrismatic)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointPrismatic;
  objc_super v5 = [(PKPhysicsJoint *)&v14 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeCGPointForKey:@"_anchor"];
    v5->_anchor.double x = v6;
    v5->_anchor.double y = v7;
    [v4 decodeCGVectorForKey:@"_axis"];
    v5->_axis.double dx = v8;
    v5->_axis.double dy = v9;
    v10 = [(PKPhysicsJoint *)v5 bodyA];
    id v11 = [(PKPhysicsJoint *)v5 bodyB];
    id v12 = -[PKPhysicsJointPrismatic initWithBodyA:bodyB:anchor:axis:](v5, "initWithBodyA:bodyB:anchor:axis:", v10, v11, v5->_anchor.x, v5->_anchor.y, v5->_axis.dx, v5->_axis.dy);

    -[PKPhysicsJointPrismatic setShouldEnableLimits:](v12, "setShouldEnableLimits:", [v4 decodeBoolForKey:@"enableLimits"]);
    [v4 decodeDoubleForKey:@"lowerDistanceLimit"];
    -[PKPhysicsJointPrismatic setLowerDistanceLimit:](v12, "setLowerDistanceLimit:");
    [v4 decodeDoubleForKey:@"upperDistanceLimit"];
    -[PKPhysicsJointPrismatic setUpperDistanceLimit:](v12, "setUpperDistanceLimit:");
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToPrismaticJoint:(id)a3
{
  id v4 = (PKPhysicsJointPrismatic *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  BOOL v5 = [(PKPhysicsJointPrismatic *)self shouldEnableLimits];
  if (v5 == [(PKPhysicsJointPrismatic *)v4 shouldEnableLimits])
  {
    [(PKPhysicsJointPrismatic *)self lowerDistanceLimit];
    [(PKPhysicsJointPrismatic *)v4 lowerDistanceLimit];
    [(PKPhysicsJointPrismatic *)self upperDistanceLimit];
    [(PKPhysicsJointPrismatic *)v4 upperDistanceLimit];
LABEL_5:
    BOOL v6 = 1;
    goto LABEL_6;
  }
  BOOL v6 = 0;
LABEL_6:

  return v6;
}

- (BOOL)shouldEnableLimits
{
  return self->_jointDef.enableLimit;
}

- (void)setShouldEnableLimits:(BOOL)a3
{
  self->_jointDef.enableLimit = a3;
  joint = self->_joint;
  if (joint) {
    b2PrismaticJoint::EnableLimit(joint, a3);
  }
}

- (double)lowerDistanceLimit
{
  float lowerTranslation = self->_jointDef.lowerTranslation;
  return (float)(lowerTranslation * PKGet_PTM_RATIO());
}

- (void)setLowerDistanceLimit:(double)a3
{
  float v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.float lowerTranslation = v4;
  joint = self->_joint;
  if (joint)
  {
    float upperTranslation = self->_jointDef.upperTranslation;
    b2PrismaticJoint::SetLimits(joint, v4, upperTranslation);
  }
}

- (double)upperDistanceLimit
{
  float upperTranslation = self->_jointDef.upperTranslation;
  return (float)(upperTranslation * PKGet_PTM_RATIO());
}

- (void)setUpperDistanceLimit:(double)a3
{
  float v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.float upperTranslation = v4;
  joint = self->_joint;
  if (joint)
  {
    float lowerTranslation = self->_jointDef.lowerTranslation;
    b2PrismaticJoint::SetLimits(joint, lowerTranslation, v4);
  }
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointPrismatic;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2PrismaticJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (void)create
{
  v3 = [(PKPhysicsJoint *)self bodyA];
  float v4 = (b2Body *)[v3 _body];
  objc_super v5 = [(PKPhysicsJoint *)self bodyB];
  BOOL v6 = (b2Body *)[v5 _body];
  double x = self->_anchor.x;
  float v8 = PKGet_INV_PTM_RATIO();
  double y = self->_anchor.y;
  float v10 = PKGet_INV_PTM_RATIO();
  float v11 = x * v8;
  float v12 = y * v10;
  v14.double x = v11;
  v14.double y = v12;
  float32x2_t v13 = vcvt_f32_f64((float64x2_t)self->_axis);
  b2PrismaticJointDef::Initialize(&self->_jointDef, v4, v6, &v14, (const b2Vec2 *)&v13);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((_DWORD *)self + 10) = 2;
  *(void *)((char *)self + 84) = 0;
  *(void *)((char *)self + 76) = 0;
  *((_DWORD *)self + 23) = 1065353216;
  *((void *)self + 15) = 0;
  *((void *)self + 12) = 0;
  *((unsigned char *)self + 104) = 0;
  *(void *)((char *)self + 108) = 0;
  *((unsigned char *)self + 116) = 0;
  return self;
}

@end