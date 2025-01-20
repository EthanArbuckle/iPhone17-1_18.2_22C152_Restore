@interface PKPhysicsJoint
+ (BOOL)supportsSecureCoding;
- (BOOL)_implicit;
- (BOOL)_inUse;
- (BOOL)isEqualToJoint:(id)a3;
- (CGVector)reactionForce;
- (PKPhysicsBody)bodyA;
- (PKPhysicsBody)bodyB;
- (PKPhysicsJoint)init;
- (PKPhysicsJoint)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (double)reactionTorque;
- (void)encodeWithCoder:(id)a3;
- (void)setBodyA:(id)a3;
- (void)setBodyB:(id)a3;
- (void)set_implicit:(BOOL)a3;
- (void)set_inUse:(BOOL)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJoint

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  v4 = [(PKPhysicsJoint *)self bodyA];
  [v7 encodeObject:v4 forKey:@"_bodyA"];

  v5 = [(PKPhysicsJoint *)self bodyB];
  [v7 encodeObject:v5 forKey:@"_bodyB"];

  v6 = [NSNumber numberWithBool:self->_implicit];
  [v7 encodeObject:v6 forKey:@"_implicit"];
}

- (PKPhysicsJoint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPhysicsJoint *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bodyA"];
    bodyA = v5->_bodyA;
    v5->_bodyA = (PKPhysicsBody *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bodyB"];
    bodyB = v5->_bodyB;
    v5->_bodyB = (PKPhysicsBody *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_implicit"];
    v5->_implicit = [v10 BOOLValue];
  }
  return v5;
}

- (BOOL)isEqualToJoint:(id)a3
{
  id v4 = (PKPhysicsJoint *)a3;
  if (self == v4) {
    goto LABEL_17;
  }
  if ([(PKPhysicsBody *)self->_bodyA isEqualToBody:v4->_bodyA]
    && [(PKPhysicsBody *)self->_bodyB isEqualToBody:v4->_bodyB]
    && self->_implicit == v4->_implicit)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(PKPhysicsJoint *)self isEqualToRevoluteJoint:v4];
LABEL_16:
      BOOL v6 = v5;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(PKPhysicsJoint *)self isEqualToDistanceJoint:v4];
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(PKPhysicsJoint *)self isEqualToRopeJoint:v4];
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(PKPhysicsJoint *)self isEqualToWeldJoint:v4];
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = [(PKPhysicsJoint *)self isEqualToPrismaticJoint:v4];
      goto LABEL_16;
    }
LABEL_17:
    BOOL v6 = 1;
    goto LABEL_18;
  }
  BOOL v6 = 0;
LABEL_18:

  return v6;
}

- (PKPhysicsJoint)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKPhysicsJoint;
  result = [(PKPhysicsJoint *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_inUse = 0;
    result->_baseJoint = 0;
  }
  return result;
}

- (CGVector)reactionForce
{
  baseJoint = self->_baseJoint;
  if (baseJoint)
  {
    double v3 = (*((float (**)(b2Joint *, SEL, float))baseJoint->var0 + 2))(baseJoint, a2, 1.0);
    double v5 = v4;
  }
  else
  {
    double v3 = 0.0;
    double v5 = 0.0;
  }
  result.dy = v5;
  result.dx = v3;
  return result;
}

- (double)reactionTorque
{
  baseJoint = self->_baseJoint;
  if (baseJoint) {
    return (*((float (**)(b2Joint *, SEL, float))baseJoint->var0 + 3))(baseJoint, a2, 1.0);
  }
  else {
    return 0.0;
  }
}

- (PKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (void)setBodyA:(id)a3
{
}

- (PKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (void)setBodyB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);

  objc_storeStrong((id *)&self->_bodyA, 0);
}

- (b2Joint)_joint
{
  return self->_baseJoint;
}

- (void)set_joint:(b2Joint *)a3
{
  self->_baseJoint = a3;
}

- (BOOL)_implicit
{
  return self->_implicit;
}

- (void)set_implicit:(BOOL)a3
{
  self->_implicit = a3;
}

- (BOOL)_inUse
{
  return self->_inUse;
}

- (void)set_inUse:(BOOL)a3
{
  self->_inUse = a3;
}

- (b2JointDef)_jointDef
{
  return 0;
}

@end