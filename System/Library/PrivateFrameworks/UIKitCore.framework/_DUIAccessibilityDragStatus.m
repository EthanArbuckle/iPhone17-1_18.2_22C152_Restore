@interface _DUIAccessibilityDragStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)forbidden;
- (_DUIAccessibilityDragStatus)initWithCoder:(id)a3;
- (id)description;
- (int64_t)itemCount;
- (unint64_t)potentialOperation;
- (void)encodeWithCoder:(id)a3;
- (void)setForbidden:(BOOL)a3;
- (void)setItemCount:(int64_t)a3;
- (void)setPotentialOperation:(unint64_t)a3;
@end

@implementation _DUIAccessibilityDragStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIAccessibilityDragStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIAccessibilityDragStatus;
  v5 = [(_DUIAccessibilityDragStatus *)&v7 init];
  if (v5)
  {
    v5->_itemCount = [v4 decodeIntegerForKey:@"itemCount"];
    v5->_potentialOperation = [v4 decodeIntegerForKey:@"potentialOperation"];
    v5->_forbidden = [v4 decodeBoolForKey:@"forbidden"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t itemCount = self->_itemCount;
  id v5 = a3;
  [v5 encodeInteger:itemCount forKey:@"itemCount"];
  [v5 encodeInteger:self->_potentialOperation forKey:@"potentialOperation"];
  [v5 encodeBool:self->_forbidden forKey:@"forbidden"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self->_forbidden) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ %p: itemCount=%ld, potentialOperation=%ld, forbidden=%@>", v4, self, self->_itemCount, self->_potentialOperation, v5];
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int64_t)a3
{
  self->_int64_t itemCount = a3;
}

- (unint64_t)potentialOperation
{
  return self->_potentialOperation;
}

- (void)setPotentialOperation:(unint64_t)a3
{
  self->_potentialOperation = a3;
}

- (BOOL)forbidden
{
  return self->_forbidden;
}

- (void)setForbidden:(BOOL)a3
{
  self->_forbidden = a3;
}

@end