@interface _UIKBRTFingerInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)unknownSeen;
- (CGPoint)location;
- (double)feedbackAlpha;
- (double)lastSeenTimestamp;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)identity;
- (void)setIdentity:(unint64_t)a3;
- (void)setLastSeenTimestamp:(double)a3;
- (void)setLocation:(CGPoint)a3;
- (void)setRadius:(double)a3;
- (void)setUnknownSeen:(BOOL)a3;
@end

@implementation _UIKBRTFingerInfo

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_UIKBRTFingerInfo);
  -[_UIKBRTFingerInfo setLocation:](v4, "setLocation:", self->_location.x, self->_location.y);
  [(_UIKBRTFingerInfo *)v4 setRadius:self->_radius];
  [(_UIKBRTFingerInfo *)v4 setIdentity:self->_identity];
  [(_UIKBRTFingerInfo *)v4 setUnknownSeen:self->_unknownSeen];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIKBRTFingerInfo *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v9 = (objc_opt_isKindOfClass() & 1) != 0
      && (([(_UIKBRTFingerInfo *)v4 location], v6 == self->_location.x)
        ? (BOOL v7 = v5 == self->_location.y)
        : (BOOL v7 = 0),
          v7 && ([(_UIKBRTFingerInfo *)v4 radius], v8 == self->_radius))
      && [(_UIKBRTFingerInfo *)v4 identity] == self->_identity;
  }

  return v9;
}

- (void)setUnknownSeen:(BOOL)a3
{
  self->_unknownSeen = a3;
}

- (id)description
{
  if (qword_1EB25D190 != -1) {
    dispatch_once(&qword_1EB25D190, &__block_literal_global_172);
  }
  v3 = (void *)_MergedGlobals_9_2;
  v4 = [NSNumber numberWithUnsignedInteger:self->_identity];
  double v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    double v5 = objc_msgSend(NSString, "stringWithFormat:", @"_UIKBRTFingerID(%d)", self->_identity);
  }
  double v6 = NSString;
  BOOL v7 = (objc_class *)objc_opt_class();
  double v8 = NSStringFromClass(v7);
  BOOL v9 = [v6 stringWithFormat:@"<%@: %p, location={%.1f, %.1f}, radius=%.1f, id=%@>", v8, self, *(void *)&self->_location.x, *(void *)&self->_location.y, *(void *)&self->_radius, v5];

  return v9;
}

- (double)feedbackAlpha
{
  return 1.0;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (double)lastSeenTimestamp
{
  return self->_lastSeenTimestamp;
}

- (void)setLastSeenTimestamp:(double)a3
{
  self->_lastSeenTimestamp = a3;
}

- (unint64_t)identity
{
  return self->_identity;
}

- (void)setIdentity:(unint64_t)a3
{
  self->_identitdouble y = a3;
}

- (BOOL)unknownSeen
{
  return self->_unknownSeen;
}

@end