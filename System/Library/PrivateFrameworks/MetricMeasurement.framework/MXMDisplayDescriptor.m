@interface MXMDisplayDescriptor
- (BOOL)main;
- (CADisplay)display;
- (MXMDisplayDescriptor)initWithDisplay:(id)a3;
- (NSString)name;
- (double)refreshRate;
@end

@implementation MXMDisplayDescriptor

- (double)refreshRate
{
  [(CADisplay *)self->_display refreshRate];
  return result;
}

- (NSString)name
{
  return (NSString *)[(CADisplay *)self->_display name];
}

- (BOOL)main
{
  v3 = [MEMORY[0x263F15778] mainDisplay];
  int v4 = [v3 displayId];
  LOBYTE(self) = v4 == [(CADisplay *)self->_display displayId];

  return (char)self;
}

- (MXMDisplayDescriptor)initWithDisplay:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MXMDisplayDescriptor;
  v6 = [(MXMDisplayDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_display, a3);
  }

  return v7;
}

- (CADisplay)display
{
  return self->_display;
}

- (void).cxx_destruct
{
}

@end