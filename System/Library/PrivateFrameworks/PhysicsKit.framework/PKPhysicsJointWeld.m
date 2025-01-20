@interface PKPhysicsJointWeld
+ (BOOL)supportsSecureCoding;
+ (id)jointWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5;
- (BOOL)isEqualToWeldJoint:(id)a3;
- (PKPhysicsJointWeld)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5;
- (PKPhysicsJointWeld)initWithCoder:(id)a3;
- (b2Joint)_joint;
- (b2JointDef)_jointDef;
- (id).cxx_construct;
- (void)create;
- (void)encodeWithCoder:(id)a3;
- (void)set_joint:(b2Joint *)a3;
@end

@implementation PKPhysicsJointWeld

- (PKPhysicsJointWeld)initWithBodyA:(id)a3 bodyB:(id)a4 anchor:(CGPoint)a5
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
  id v10 = -[PKPhysicsJointWeld initWithBodyA:bodyB:anchor:]([PKPhysicsJointWeld alloc], "initWithBodyA:bodyB:anchor:", v8, v9, x, y);

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
  v5.super_class = (Class)PKPhysicsJointWeld;
  [(PKPhysicsJoint *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"_anchor", self->_anchor.x, self->_anchor.y);
}

- (PKPhysicsJointWeld)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPhysicsJointWeld;
  objc_super v5 = [(PKPhysicsJoint *)&v11 initWithCoder:v4];
  if (v5)
  {
    [v4 decodeCGPointForKey:@"_anchor"];
    v5->_anchor.double x = v6;
    v5->_anchor.double y = v7;
    id v8 = [(PKPhysicsJoint *)v5 bodyA];
    id v9 = [(PKPhysicsJoint *)v5 bodyB];
    objc_super v5 = -[PKPhysicsJointWeld initWithBodyA:bodyB:anchor:](v5, "initWithBodyA:bodyB:anchor:", v8, v9, v5->_anchor.x, v5->_anchor.y);
  }
  return v5;
}

- (BOOL)isEqualToWeldJoint:(id)a3
{
  return 1;
}

- (b2Joint)_joint
{
  return (b2Joint *)self->_joint;
}

- (void)set_joint:(b2Joint *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsJointWeld;
  -[PKPhysicsJoint set_joint:](&v5, sel_set_joint_);
  self->_joint = (b2WeldJoint *)a3;
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
  double x = self->_anchor.x;
  float v8 = PKGet_INV_PTM_RATIO();
  double y = self->_anchor.y;
  float v10 = PKGet_INV_PTM_RATIO();
  float v11 = x * v8;
  float v12 = y * v10;
  v13.double x = v11;
  v13.double y = v12;
  b2RevoluteJointDef::Initialize((b2RevoluteJointDef *)&self->_jointDef, v4, v6, &v13);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 6) = 0;
  *((unsigned char *)self + 72) = 0;
  *((_DWORD *)self + 10) = 8;
  *(void *)((char *)self + 84) = 0;
  *(void *)((char *)self + 76) = 0;
  *((_DWORD *)self + 23) = 0;
  return self;
}

@end