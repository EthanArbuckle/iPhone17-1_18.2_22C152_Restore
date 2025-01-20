@interface PKPhysicsJointDistance
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6;
- (BOOL)collideConnected;
- (BOOL)isEqualToDistanceJoint:(id)a3;
- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6;
- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6;
- (PKPhysicsJointDistance)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (double)damping;
- (double)frequency;
- (double)length;
- (id).cxx_construct;
- (void)create;
- (void)encodeWithCoder:(id)a3;
- (void)setCollideConnected:(BOOL)a3;
- (void)setDamping:(double)a3;
- (void)setFrequency:(double)a3;
- (void)setLength:(double)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJointDistance

- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  id v12 = a3;
  id v13 = a4;
  v14 = [(PKPhysicsJoint *)self init];
  [(PKPhysicsJoint *)v14 setBodyA:v12];
  [(PKPhysicsJoint *)v14 setBodyB:v13];
  v14->_anchorA.CGFloat x = v9;
  v14->_anchorA.CGFloat y = v8;
  v14->_anchorB.CGFloat x = x;
  v14->_anchorB.CGFloat y = y;

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[PKPhysicsJointDistance initWithBodyA:bodyB:localAnchorA:localAnchorB:]([PKPhysicsJointDistance alloc], "initWithBodyA:bodyB:localAnchorA:localAnchorB:", v11, v12, v9, v8, x, y);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPhysicsJointDistance)initWithBodyA:(id)a3 bodyB:(id)a4 localAnchorA:(CGPoint)a5 localAnchorB:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v12 = a3;
  id v13 = a4;
  v14 = [(PKPhysicsJoint *)self init];
  [(PKPhysicsJoint *)v14 setBodyA:v12];
  [(PKPhysicsJoint *)v14 setBodyB:v13];
  float v15 = PKGet_INV_PTM_RATIO();
  float v16 = PKGet_INV_PTM_RATIO();
  float v17 = PKGet_INV_PTM_RATIO();
  float v38 = v16;
  float v39 = v15;
  float v35 = PKGet_INV_PTM_RATIO();
  float v36 = v17;
  v18 = (float *)[v12 _body];
  double v33 = x;
  double v34 = y;
  float v20 = v18[10];
  float v19 = v18[11];
  float v21 = v18[8];
  float v37 = v18[9];
  uint64_t v22 = [v13 _body];
  float v23 = *(float *)(v22 + 40);
  LODWORD(x) = *(_DWORD *)(v22 + 44);
  float v31 = *(float *)(v22 + 36);
  float v32 = *(float *)(v22 + 32);
  LODWORD(y) = PKGet_PTM_RATIO();
  float v24 = PKGet_PTM_RATIO();
  float v25 = v9 * v39;
  float v26 = v8 * v38;
  v14->_anchorA.CGFloat x = (float)((float)(v21 + (float)((float)(v19 * v25) - (float)(v20 * v26))) * *(float *)&y);
  v14->_anchorA.CGFloat y = (float)((float)((float)((float)(v19 * v26) + (float)(v20 * v25)) + v37) * v24);
  LODWORD(y) = PKGet_PTM_RATIO();
  float v27 = PKGet_PTM_RATIO();
  float v28 = v33 * v36;
  float v29 = v34 * v35;
  v14->_anchorB.CGFloat x = (float)((float)(v32 + (float)((float)(*(float *)&x * v28) - (float)(v23 * v29))) * *(float *)&y);
  v14->_anchorB.CGFloat y = (float)((float)((float)((float)(*(float *)&x * v29) + (float)(v23 * v28)) + v31) * v27);

  return v14;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[PKPhysicsJointDistance initWithBodyA:bodyB:anchorA:anchorB:]([PKPhysicsJointDistance alloc], "initWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointDistance;
  [(PKPhysicsJoint *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchorA", self->_anchorA.x, self->_anchorA.y);
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchorB", self->_anchorB.x, self->_anchorB.y);
  [(PKPhysicsJointDistance *)self damping];
  objc_msgSend(v4, "encodeDouble:forKey:", @"damping");
  [(PKPhysicsJointDistance *)self frequency];
  objc_msgSend(v4, "encodeDouble:forKey:", @"frequency");
}

- (PKPhysicsJointDistance)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointDistance;
  objc_super v5 = [(PKPhysicsJoint *)&v14 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeCGPointForKey:@"_anchorA"];
    v5->_anchorA.double x = v6;
    v5->_anchorA.double y = v7;
    [v4 decodeCGPointForKey:@"_anchorB"];
    v5->_anchorB.double x = v8;
    v5->_anchorB.double y = v9;
    v10 = [(PKPhysicsJoint *)v5 bodyA];
    id v11 = [(PKPhysicsJoint *)v5 bodyB];
    id v12 = -[PKPhysicsJointDistance initWithBodyA:bodyB:anchorA:anchorB:](v5, "initWithBodyA:bodyB:anchorA:anchorB:", v10, v11, v5->_anchorA.x, v5->_anchorA.y, v5->_anchorB.x, v5->_anchorB.y);

    [v4 decodeDoubleForKey:@"damping"];
    -[PKPhysicsJointDistance setDamping:](v12, "setDamping:");
    [v4 decodeDoubleForKey:@"frequency"];
    -[PKPhysicsJointDistance setFrequency:](v12, "setFrequency:");
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToDistanceJoint:(id)a3
{
  id v4 = (PKPhysicsJointDistance *)a3;
  if (self != v4)
  {
    [(PKPhysicsJointDistance *)self damping];
    [(PKPhysicsJointDistance *)v4 damping];
    [(PKPhysicsJointDistance *)self frequency];
    [(PKPhysicsJointDistance *)v4 frequency];
  }

  return 1;
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointDistance;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2DistanceJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (void)create
{
  v3 = [(PKPhysicsJoint *)self bodyA];
  id v4 = (b2Body *)[v3 _body];
  objc_super v5 = [(PKPhysicsJoint *)self bodyB];
  CGFloat v6 = (b2Body *)[v5 _body];
  double x = self->_anchorA.x;
  float v8 = PKGet_INV_PTM_RATIO();
  double y = self->_anchorA.y;
  float v10 = PKGet_INV_PTM_RATIO();
  float v11 = x * v8;
  float v12 = y * v10;
  v20.double x = v11;
  v20.double y = v12;
  double v13 = self->_anchorB.x;
  float v14 = PKGet_INV_PTM_RATIO();
  double v15 = self->_anchorB.y;
  float v16 = PKGet_INV_PTM_RATIO();
  float v17 = v13 * v14;
  float v18 = v15 * v16;
  v19.double x = v17;
  v19.double y = v18;
  b2DistanceJointDef::Initialize(&self->_jointDef, v4, v6, &v20, &v19);
}

- (void)setDamping:(double)a3
{
  float v3 = a3;
  self->_jointDef.dampingRatio = v3;
  joint = self->_joint;
  if (joint) {
    joint->var12 = v3;
  }
}

- (double)damping
{
  return self->_jointDef.dampingRatio;
}

- (void)setLength:(double)a3
{
  float v5 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.length = v5;
  joint = self->_joint;
  if (joint)
  {
    float v7 = PKGet_INV_PTM_RATIO() * a3;
    joint->var18 = v7;
  }
}

- (double)length
{
  float length = self->_jointDef.length;
  return (float)(length * PKGet_PTM_RATIO());
}

- (void)setFrequency:(double)a3
{
  float v3 = a3;
  self->_jointDef.frequencyHz = v3;
  joint = self->_joint;
  if (joint) {
    joint->var11 = v3;
  }
}

- (double)frequency
{
  return self->_jointDef.frequencyHz;
}

- (BOOL)collideConnected
{
  return self->_jointDef.collideConnected;
}

- (void)setCollideConnected:(BOOL)a3
{
  self->_jointDef.collideConnected = a3;
  joint = (b2Joint *)self->_joint;
  if (joint) {
    b2Joint::SetCollideConnected(joint, a3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((_DWORD *)self + 10) = 3;
  *(void *)((char *)self + 84) = 0;
  *(void *)((char *)self + 76) = 0;
  *(void *)((char *)self + 92) = 1065353216;
  *((_DWORD *)self + 25) = 0;
  return self;
}

@end