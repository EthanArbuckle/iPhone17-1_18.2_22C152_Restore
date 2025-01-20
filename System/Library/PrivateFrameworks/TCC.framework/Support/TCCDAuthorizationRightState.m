@interface TCCDAuthorizationRightState
- (NSString)description;
- (NSString)reasonDescription;
- (NSString)rightDescription;
- (TCCDAuthorizationRightState)init;
- (unint64_t)reason;
- (unint64_t)right;
- (void)reset;
- (void)setReason:(unint64_t)a3;
- (void)setRight:(unint64_t)a3;
@end

@implementation TCCDAuthorizationRightState

- (TCCDAuthorizationRightState)init
{
  v5.receiver = self;
  v5.super_class = (Class)TCCDAuthorizationRightState;
  v2 = [(TCCDAuthorizationRightState *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(TCCDAuthorizationRightState *)v2 setRight:1];
    [(TCCDAuthorizationRightState *)v3 setReason:0];
  }
  return v3;
}

- (void)setRight:(unint64_t)a3
{
  self->_right = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  v4 = [(TCCDAuthorizationRightState *)self rightDescription];
  objc_super v5 = [(TCCDAuthorizationRightState *)self reasonDescription];
  [v3 appendFormat:@"%@ (%@)", v4, v5];

  return (NSString *)v3;
}

- (NSString)rightDescription
{
  unint64_t v2 = [(TCCDAuthorizationRightState *)self right];
  if (v2 > 6) {
    return (NSString *)@"<Unspported Authorization Right value>";
  }
  else {
    return &off_100095DF8[v2]->isa;
  }
}

- (unint64_t)right
{
  return self->_right;
}

- (NSString)reasonDescription
{
  unint64_t v2 = [(TCCDAuthorizationRightState *)self reason];
  if (v2 > 0xF) {
    return (NSString *)@"<Unspported Authorization Reason value>";
  }
  else {
    return &off_100095E30[v2]->isa;
  }
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)reset
{
  [(TCCDAuthorizationRightState *)self setRight:1];
  [(TCCDAuthorizationRightState *)self setReason:0];
}

@end