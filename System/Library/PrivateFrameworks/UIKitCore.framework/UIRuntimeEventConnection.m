@interface UIRuntimeEventConnection
- (SEL)action;
- (UIRuntimeEventConnection)initWithCoder:(id)a3;
- (id)description;
- (id)target;
- (unint64_t)eventMask;
- (void)connect;
- (void)connectForSimulator;
- (void)encodeWithCoder:(id)a3;
- (void)setEventMask:(unint64_t)a3;
@end

@implementation UIRuntimeEventConnection

- (void)connect
{
  id v3 = [(UIRuntimeConnection *)self source];
  [v3 _connectInterfaceBuilderEventConnection:self];
}

- (id)target
{
  id v3 = [(UIRuntimeConnection *)self destination];
  if (v3 == (void *)IBFirstResponderStandin)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(UIRuntimeConnection *)self destination];
  }

  return v4;
}

- (SEL)action
{
  v2 = [(UIRuntimeConnection *)self label];
  id v3 = NSSelectorFromString(v2);

  return v3;
}

- (UIRuntimeEventConnection)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIRuntimeEventConnection;
  v5 = [(UIRuntimeConnection *)&v7 initWithCoder:v4];
  if (v5) {
    v5->eventMask = [v4 decodeIntegerForKey:@"UIEventMask"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIRuntimeEventConnection;
  [(UIRuntimeConnection *)&v6 encodeWithCoder:v4];
  unint64_t eventMask = self->eventMask;
  if (eventMask) {
    [v4 encodeInteger:eventMask forKey:@"UIEventMask"];
  }
}

- (void)connectForSimulator
{
  id v3 = [(UIRuntimeConnection *)self source];
  [v3 _connectInterfaceBuilderEventConnection:self];

  NSLog(&cfstr_CouldNotEstabl.isa, self);
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(UIRuntimeConnection *)self source];
  v5 = [(UIRuntimeConnection *)self destination];
  objc_super v6 = [(UIRuntimeConnection *)self label];
  objc_super v7 = [v3 stringWithFormat:@"Action event connection with source %@, target %@, and selector %@.", v4, v5, v6];

  return v7;
}

- (unint64_t)eventMask
{
  return self->eventMask;
}

- (void)setEventMask:(unint64_t)a3
{
  self->unint64_t eventMask = a3;
}

@end