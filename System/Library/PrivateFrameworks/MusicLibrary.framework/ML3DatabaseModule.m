@interface ML3DatabaseModule
- (ML3DatabaseModule)initWithName:(id)a3 moduleMethods:(sqlite3_module *)a4;
- (ML3DatabaseModuleContext)context;
- (NSString)name;
- (id)description;
- (sqlite3_module)moduleMethods;
- (void)setContext:(id)a3;
@end

@implementation ML3DatabaseModule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setContext:(id)a3
{
}

- (ML3DatabaseModuleContext)context
{
  return self->_context;
}

- (sqlite3_module)moduleMethods
{
  return self->_moduleMethods;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, name='%@'>", objc_opt_class(), self, self->_name];
}

- (ML3DatabaseModule)initWithName:(id)a3 moduleMethods:(sqlite3_module *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3DatabaseModule;
  v7 = [(ML3DatabaseModule *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_moduleMethods = a4;
  }

  return v7;
}

@end