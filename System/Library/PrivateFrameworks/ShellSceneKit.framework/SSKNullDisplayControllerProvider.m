@interface SSKNullDisplayControllerProvider
- (BOOL)didCreateControllers;
- (SSKNullDisplayControllerProvider)init;
- (id)controllerForDisplay:(id)a3;
- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4;
@end

@implementation SSKNullDisplayControllerProvider

- (SSKNullDisplayControllerProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SSKNullDisplayControllerProvider;
  v2 = [(SSKNullDisplayControllerProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    createdControllers = v2->_createdControllers;
    v2->_createdControllers = v3;
  }
  return v2;
}

- (id)displayControllerForDisplay:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  objc_super v6 = objc_alloc_init(SSKNullDisplayController);
  [(NSMutableDictionary *)self->_createdControllers setObject:v6 forKey:v5];

  return v6;
}

- (id)controllerForDisplay:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_createdControllers objectForKey:a3];
}

- (BOOL)didCreateControllers
{
  return [(NSMutableDictionary *)self->_createdControllers count] != 0;
}

- (void).cxx_destruct
{
}

@end