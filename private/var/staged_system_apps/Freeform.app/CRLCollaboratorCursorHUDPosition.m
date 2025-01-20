@interface CRLCollaboratorCursorHUDPosition
- (BOOL)allowedToFlip;
- (CGPoint)position;
- (CRLCollaboratorCursorHUDPosition)init;
- (CRLCollaboratorCursorHUDPosition)initWithPosition:(CGPoint)a3 direction:(unint64_t)a4;
- (id)description;
- (unint64_t)direction;
- (void)setAllowedToFlip:(BOOL)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setPosition:(CGPoint)a3;
@end

@implementation CRLCollaboratorCursorHUDPosition

- (CRLCollaboratorCursorHUDPosition)initWithPosition:(CGPoint)a3 direction:(unint64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLCollaboratorCursorHUDPosition;
  result = [(CRLCollaboratorCursorHUDPosition *)&v8 init];
  if (result)
  {
    result->mPosition.CGFloat x = x;
    result->mPosition.CGFloat y = y;
    result->mDirection = a4;
    result->mAllowedToFlip = 1;
  }
  return result;
}

- (CRLCollaboratorCursorHUDPosition)init
{
  return -[CRLCollaboratorCursorHUDPosition initWithPosition:direction:](self, "initWithPosition:direction:", 2, CGPointZero.x, CGPointZero.y);
}

- (id)description
{
  unint64_t mDirection = self->mDirection;
  if (mDirection > 4) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_1014E95B8 + mDirection);
  }
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  uint64_t v7 = NSStringFromCGPoint(self->mPosition);
  objc_super v8 = (void *)v7;
  if (self->mAllowedToFlip) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  v10 = +[NSString stringWithFormat:@"<%@ %p pos=%@ direction=%@ allowedToFlip %@>", v6, self, v7, v4, v9];

  return v10;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (unint64_t)direction
{
  return self->mDirection;
}

- (void)setDirection:(unint64_t)a3
{
  self->unint64_t mDirection = a3;
}

- (BOOL)allowedToFlip
{
  return self->mAllowedToFlip;
}

- (void)setAllowedToFlip:(BOOL)a3
{
  self->mAllowedToFlip = a3;
}

@end