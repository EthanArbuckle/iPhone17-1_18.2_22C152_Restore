@interface SBWindowHideState
- (BOOL)isHidden;
- (double)desiredAlpha;
- (id)description;
- (void)setDesiredAlpha:(double)a3;
- (void)setHidden:(BOOL)a3;
@end

@implementation SBWindowHideState

- (id)description
{
  v3 = NSString;
  if ([(SBWindowHideState *)self isHidden]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [(SBWindowHideState *)self desiredAlpha];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<SBWindowHideState: hidden = %@; desiredAlpha = %.f>",
               v4,
               v5);
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (double)desiredAlpha
{
  return self->_desiredAlpha;
}

- (void)setDesiredAlpha:(double)a3
{
  self->_desiredAlpha = a3;
}

@end