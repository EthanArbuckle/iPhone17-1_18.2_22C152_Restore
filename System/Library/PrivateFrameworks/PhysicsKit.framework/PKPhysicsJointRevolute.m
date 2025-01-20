@interface PKPhysicsJointRevolute
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5;
- (BOOL)isEqualToRevoluteJoint:(id)a3;
- (BOOL)shouldEnableLimits;
- (CGPoint)anchor;
- (PKPhysicsJointRevolute)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5;
- (PKPhysicsJointRevolute)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (double)frictionTorque;
- (double)lowerAngleLimit;
- (double)rotationSpeed;
- (double)upperAngleLimit;
- (id).cxx_construct;
- (void)create;
- (void)encodeWithCoder:(id)a3;
- (void)setFrictionTorque:(double)a3;
- (void)setLowerAngleLimit:(double)a3;
- (void)setRotationSpeed:(double)a3;
- (void)setShouldEnableLimits:(BOOL)a3;
- (void)setUpperAngleLimit:(double)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJointRevolute

- (PKPhysicsJointRevolute)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  id v9 = a3;
  id v10 = a4;
  v11 = [(PKPhysicsJoint *)self init];
  [(PKPhysicsJoint *)v11 setBodyA:v9];
  [(PKPhysicsJoint *)v11 setBodyB:v10];
  v11->_anchor.CGFloat x = x;
  v11->_anchor.CGFloat y = y;

  return v11;
}

+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a3;
  id v9 = a4;
  id v10 = -[PKPhysicsJointRevolute initWithBodyA:bodyB:anchor:]([PKPhysicsJointRevolute alloc], "initWithBodyA:bodyB:anchor:", v8, v9, x, y);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointRevolute;
  [(PKPhysicsJoint *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchor", self->_anchor.x, self->_anchor.y);
  objc_msgSend(v4, "encodeBool:forKey:", -[PKPhysicsJointRevolute shouldEnableLimits](self, "shouldEnableLimits"), @"enableLimits");
  [(PKPhysicsJointRevolute *)self lowerAngleLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"lowerAngleLimit");
  [(PKPhysicsJointRevolute *)self upperAngleLimit];
  objc_msgSend(v4, "encodeDouble:forKey:", @"upperAngleLimit");
  [(PKPhysicsJointRevolute *)self frictionTorque];
  objc_msgSend(v4, "encodeDouble:forKey:", @"frictionTorque");
}

- (PKPhysicsJointRevolute)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPhysicsJointRevolute;
  objc_super v5 = [(PKPhysicsJoint *)&v13 initWithCoder:v4];
  v6 = (double *)v5;
  if (v5)
  {
    v7 = [(PKPhysicsJoint *)v5 bodyA];
    id v8 = [v6 bodyB];
    uint64_t v9 = objc_msgSend(v6, "initWithBodyA:bodyB:anchor:", v7, v8, v6[16], v6[17]);

    [v4 decodeCGPointForKey:@"_anchor"];
    *(void *)(v9 + 128) = v10;
    *(void *)(v9 + 136) = v11;
    objc_msgSend((id)v9, "setShouldEnableLimits:", objc_msgSend(v4, "decodeBoolForKey:", @"enableLimits"));
    [v4 decodeDoubleForKey:@"lowerAngleLimit"];
    objc_msgSend((id)v9, "setLowerAngleLimit:");
    [v4 decodeDoubleForKey:@"upperAngleLimit"];
    objc_msgSend((id)v9, "setUpperAngleLimit:");
    [v4 decodeDoubleForKey:@"frictionTorque"];
    objc_msgSend((id)v9, "setFrictionTorque:");
  }
  else
  {
    uint64_t v9 = 0;
  }

  return (PKPhysicsJointRevolute *)v9;
}

- (BOOL)isEqualToRevoluteJoint:(id)a3
{
  id v4 = (PKPhysicsJointRevolute *)a3;
  if (self == v4) {
    goto LABEL_5;
  }
  BOOL v5 = [(PKPhysicsJointRevolute *)self shouldEnableLimits];
  if (v5 == [(PKPhysicsJointRevolute *)v4 shouldEnableLimits])
  {
    [(PKPhysicsJointRevolute *)self lowerAngleLimit];
    [(PKPhysicsJointRevolute *)v4 lowerAngleLimit];
    [(PKPhysicsJointRevolute *)self upperAngleLimit];
    [(PKPhysicsJointRevolute *)v4 upperAngleLimit];
    [(PKPhysicsJointRevolute *)self frictionTorque];
    [(PKPhysicsJointRevolute *)v4 frictionTorque];
    [(PKPhysicsJointRevolute *)self rotationSpeed];
    [(PKPhysicsJointRevolute *)v4 rotationSpeed];
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
    b2RevoluteJoint::EnableLimit(joint, a3);
  }
}

- (double)lowerAngleLimit
{
  return self->_jointDef.lowerAngle;
}

- (void)setLowerAngleLimit:(double)a3
{
  float v3 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.lowerAngle = v3;
  joint = self->_joint;
  if (joint) {
    b2RevoluteJoint::SetLimits(joint, v3, p_jointDef->upperAngle);
  }
}

- (double)upperAngleLimit
{
  return self->_jointDef.upperAngle;
}

- (void)setUpperAngleLimit:(double)a3
{
  float v3 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.upperAngle = v3;
  joint = self->_joint;
  if (joint) {
    b2RevoluteJoint::SetLimits(joint, p_jointDef->lowerAngle, v3);
  }
}

- (double)frictionTorque
{
  return self->_jointDef.maxMotorTorque;
}

- (void)setFrictionTorque:(double)a3
{
  float v4 = a3;
  p_jointDef = &self->_jointDef;
  self->_jointDef.maxMotorTorque = v4;
  BOOL v6 = (LODWORD(v4) & 0x60000000) != 0 || (HIBYTE(self->_jointDef.motorSpeed) & 0x60) != 0;
  self->_jointDef.BOOL enableMotor = v6;
  joint = self->_joint;
  if (joint)
  {
    b2RevoluteJoint::SetMaxMotorTorque(joint, v4);
    b2RevoluteJoint::SetMotorSpeed(self->_joint, p_jointDef->motorSpeed);
    id v8 = self->_joint;
    BOOL enableMotor = p_jointDef->enableMotor;
    b2RevoluteJoint::EnableMotor(v8, enableMotor);
  }
}

- (double)rotationSpeed
{
  return self->_jointDef.motorSpeed;
}

- (void)setRotationSpeed:(double)a3
{
  float v3 = a3;
  self->_jointDef.motorSpeed = v3;
  [(PKPhysicsJointRevolute *)self setFrictionTorque:self->_jointDef.maxMotorTorque];
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointRevolute;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2RevoluteJoint *)a3;
}

- (b2JointDef)_jointDef
{
  return (b2JointDef *)&self->_jointDef;
}

- (void)create
{
  float v3 = [(PKPhysicsJoint *)self bodyA];
  float v4 = (b2Body *)[v3 _body];
  objc_super v5 = [(PKPhysicsJoint *)self bodyB];
  BOOL v6 = (b2Body *)[v5 _body];
  double x = self->_anchor.x;
  float v8 = PKGet_INV_PTM_RATIO();
  double y = self->_anchor.y;
  float v10 = PKGet_INV_PTM_RATIO();
  float v11 = x * v8;
  float v12 = y * v10;
  v13.double x = v11;
  v13.double y = v12;
  b2RevoluteJointDef::Initialize(&self->_jointDef, v4, v6, &v13);
}

- (CGPoint)anchor
{
  objc_copyStruct(v4, &self->_anchor, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((_DWORD *)self + 10) = 1;
  *((void *)self + 14) = 0;
  *(void *)((char *)self + 84) = 0;
  *(void *)((char *)self + 76) = 0;
  *(void *)((char *)self + 89) = 0;
  *(void *)((char *)self + 100) = 0;
  *((unsigned char *)self + 108) = 0;
  return self;
}

@end