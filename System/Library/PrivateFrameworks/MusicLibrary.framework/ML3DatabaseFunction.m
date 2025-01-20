@interface ML3DatabaseFunction
- (BOOL)registerWithConnection:(id)a3;
- (ML3DatabaseFunction)initWithName:(id)a3 argumentCount:(int)a4;
- (NSString)name;
- (int)argumentCount;
- (void)setArgumentCount:(int)a3;
- (void)setName:(id)a3;
@end

@implementation ML3DatabaseFunction

- (ML3DatabaseFunction)initWithName:(id)a3 argumentCount:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseFunction;
  v7 = [(ML3DatabaseFunction *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_argumentCount = a4;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (int)argumentCount
{
  return self->_argumentCount;
}

- (void).cxx_destruct
{
}

- (void)setArgumentCount:(int)a3
{
  self->_argumentCount = a3;
}

- (void)setName:(id)a3
{
}

- (BOOL)registerWithConnection:(id)a3
{
  return 0;
}

@end