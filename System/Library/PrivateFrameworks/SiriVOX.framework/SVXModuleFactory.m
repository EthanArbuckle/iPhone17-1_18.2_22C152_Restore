@interface SVXModuleFactory
- (SVXModuleFactory)initWithInstanceContext:(id)a3 preferences:(id)a4 analytics:(id)a5;
- (id)createModuleWithIdentifier:(id)a3 class:(Class)a4 performer:(id)a5;
- (id)createModuleWithIdentifier:(id)a3 class:(Class)a4 qos:(unsigned int)a5;
@end

@implementation SVXModuleFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_instanceContext, 0);
}

- (id)createModuleWithIdentifier:(id)a3 class:(Class)a4 performer:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = [[SVXModule alloc] initWithIdentifier:v9 instanceClass:a4 instanceContext:self->_instanceContext preferences:self->_preferences analytics:self->_analytics performer:v8];

  return v10;
}

- (id)createModuleWithIdentifier:(id)a3 class:(Class)a4 qos:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [[SVXQueuePerformer alloc] initWithIdentifier:v8 qosClass:v5 relativePriority:0 options:2];
  v10 = [(SVXModuleFactory *)self createModuleWithIdentifier:v8 class:a4 performer:v9];

  return v10;
}

- (SVXModuleFactory)initWithInstanceContext:(id)a3 preferences:(id)a4 analytics:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXModuleFactory;
  v12 = [(SVXModuleFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_instanceContext, a3);
    objc_storeStrong((id *)&v13->_preferences, a4);
    objc_storeStrong((id *)&v13->_analytics, a5);
  }

  return v13;
}

@end