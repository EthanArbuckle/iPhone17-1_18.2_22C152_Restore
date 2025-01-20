@interface PKPhysicsContact
- (BOOL)didBegin;
- (BOOL)didEnd;
- (CGPoint)contactPoint;
- (CGVector)contactNormal;
- (PKPhysicsBody)bodyA;
- (PKPhysicsBody)bodyB;
- (PKPhysicsContact)init;
- (double)collisionImpulse;
- (void)setBodyA:(id)a3;
- (void)setBodyB:(id)a3;
- (void)setCollisionImpulse:(double)a3;
- (void)setContactNormal:(CGVector)a3;
- (void)setContactPoint:(CGPoint)a3;
- (void)setDidBegin:(BOOL)a3;
- (void)setDidEnd:(BOOL)a3;
@end

@implementation PKPhysicsContact

- (PKPhysicsBody)bodyA
{
  return self->_bodyA;
}

- (PKPhysicsBody)bodyB
{
  return self->_bodyB;
}

- (CGPoint)contactPoint
{
  double x = self->_contactPoint.x;
  double y = self->_contactPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGVector)contactNormal
{
  ddouble x = self->_contactNormal.dx;
  ddouble y = self->_contactNormal.dy;
  result.ddouble y = dy;
  result.ddouble x = dx;
  return result;
}

- (double)collisionImpulse
{
  return self->_impulse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyB, 0);

  objc_storeStrong((id *)&self->_bodyA, 0);
}

- (PKPhysicsContact)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKPhysicsContact;
  v2 = [(PKPhysicsContact *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(PKPhysicsContact *)v2 setDidBegin:0];
    [(PKPhysicsContact *)v3 setDidEnd:0];
  }
  return v3;
}

- (void)setDidBegin:(BOOL)a3
{
  self->_didBegin = a3;
}

- (BOOL)didBegin
{
  return self->_didBegin;
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (void)setContactPoint:(CGPoint)a3
{
  self->_contactPoint = a3;
}

- (void)setContactNormal:(CGVector)a3
{
  self->_contactNormal = a3;
}

- (void)setBodyA:(id)a3
{
}

- (void)setBodyB:(id)a3
{
}

- (void)setCollisionImpulse:(double)a3
{
  self->_impulse = a3;
}

@end