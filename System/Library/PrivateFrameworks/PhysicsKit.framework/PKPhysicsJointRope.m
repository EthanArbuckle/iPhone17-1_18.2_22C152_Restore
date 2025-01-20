@interface PKPhysicsJointRope
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6;
- (BOOL)isEqualToRopeJoint:(id)a3;
- (PKPhysicsJointRope)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6;
- (PKPhysicsJointRope)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (double)maxLength;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxLength:(double)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJointRope

- (PKPhysicsJointRope)initWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v12 = a3;
  id v13 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PKPhysicsJointRope;
  v14 = [(PKPhysicsJoint *)&v35 init];
  v15 = v14;
  if (v14)
  {
    [(PKPhysicsJoint *)v14 setBodyA:v12];
    [(PKPhysicsJoint *)v15 setBodyB:v13];
    v15->_anchorA.double x = v9;
    v15->_anchorA.double y = v8;
    v15->_anchorB.double x = x;
    v15->_anchorB.double y = y;
    float v16 = PKGet_INV_PTM_RATIO();
    float v17 = PKGet_INV_PTM_RATIO();
    float v18 = PKGet_INV_PTM_RATIO();
    float v19 = PKGet_INV_PTM_RATIO();
    v15->_jointDef.bodyA = (b2Body *)[v12 _body];
    v20 = (float *)[v13 _body];
    float v21 = v9 * v16;
    float v22 = v8 * v17;
    float v23 = x * v18;
    float v24 = y * v19;
    v15->_jointDef.bodyB = (b2Body *)v20;
    p_var0 = (float *)&v15->_jointDef.bodyA->var0;
    float v26 = v21 - p_var0[8];
    float v27 = v22 - p_var0[9];
    float v29 = p_var0[10];
    float v28 = p_var0[11];
    v15->_jointDef.localAnchorA.double x = (float)(v27 * v29) + (float)(v28 * v26);
    v15->_jointDef.localAnchorA.double y = (float)(v28 * v27) - (float)(v29 * v26);
    float v30 = v23 - v20[8];
    float v31 = v24 - v20[9];
    float v33 = v20[10];
    float v32 = v20[11];
    v15->_jointDef.localAnchorB.double x = (float)(v31 * v33) + (float)(v32 * v30);
    v15->_jointDef.localAnchorB.double y = (float)(v32 * v31) - (float)(v33 * v30);
    v15->_jointDef.maxLength = sqrtf((float)((float)(v22 - v24) * (float)(v22 - v24))+ (float)((float)(v21 - v23) * (float)(v21 - v23)));
  }

  return v15;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchorA:(CGPoint)a5 anchorB:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a5.y;
  double v9 = a5.x;
  id v11 = a3;
  id v12 = a4;
  id v13 = -[PKPhysicsJointRope initWithBodyA:bodyB:anchorA:anchorB:]([PKPhysicsJointRope alloc], "initWithBodyA:bodyB:anchorA:anchorB:", v11, v12, v9, v8, x, y);

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
  v5.super_class = (Class)PKPhysicsJointRope;
  [(PKPhysicsJoint *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchorA", self->_anchorA.x, self->_anchorA.y);
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchorB", self->_anchorB.x, self->_anchorB.y);
  [(PKPhysicsJointRope *)self maxLength];
  objc_msgSend(v4, "encodeDouble:forKey:", @"maxLength");
}

- (PKPhysicsJointRope)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPhysicsJointRope;
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
    id v12 = -[PKPhysicsJointRope initWithBodyA:bodyB:anchorA:anchorB:](v5, "initWithBodyA:bodyB:anchorA:anchorB:", v10, v11, v5->_anchorA.x, v5->_anchorA.y, v5->_anchorB.x, v5->_anchorB.y);

    [v4 decodeDoubleForKey:@"maxLength"];
    -[PKPhysicsJointRope setMaxLength:](v12, "setMaxLength:");
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isEqualToRopeJoint:(id)a3
{
  id v4 = (PKPhysicsJointRope *)a3;
  if (self != v4)
  {
    [(PKPhysicsJointRope *)self maxLength];
    [(PKPhysicsJointRope *)v4 maxLength];
  }

  return 1;
}

- (double)maxLength
{
  float maxLength = self->_jointDef.maxLength;
  return (float)(maxLength * PKGet_PTM_RATIO());
}

- (void)setMaxLength:(double)a3
{
  float v4 = PKGet_INV_PTM_RATIO() * a3;
  self->_jointDef.float maxLength = v4;
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointRope;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2RopeJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((_DWORD *)self + 10) = 10;
  *(_OWORD *)((char *)self + 76) = xmmword_21359A720;
  *((_DWORD *)self + 23) = 0;
  return self;
}

@end