@interface RMConfigurationSubscriberDescription
+ (id)descriptionWithEventsDictionary:(id)a3;
+ (id)descriptionWithServiceDictionary:(id)a3;
- (NSArray)types;
- (RMConfigurationSubscriberDescription)initWithDictionary:(id)a3;
- (RMConfigurationSubscriberDescription)initWithTypes:(id)a3;
@end

@implementation RMConfigurationSubscriberDescription

+ (id)descriptionWithEventsDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ConfigurationSubscriber"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMConfigurationSubscriberDescription alloc];
  if (isKindOfClass) {
    uint64_t v6 = [(RMConfigurationSubscriberDescription *)v5 initWithDictionary:v3];
  }
  else {
    uint64_t v6 = [(RMConfigurationSubscriberDescription *)v5 initWithTypes:0];
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)descriptionWithServiceDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ConfigurationSubscriber"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = [RMConfigurationSubscriberDescription alloc];
  if (isKindOfClass) {
    uint64_t v6 = [(RMConfigurationSubscriberDescription *)v5 initWithDictionary:v3];
  }
  else {
    uint64_t v6 = [(RMConfigurationSubscriberDescription *)v5 initWithTypes:0];
  }
  v7 = (void *)v6;

  return v7;
}

- (RMConfigurationSubscriberDescription)initWithDictionary:(id)a3
{
  v4 = [a3 objectForKeyedSubscript:@"Types"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_6];
    uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

    v4 = (void *)v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  v7 = [(RMConfigurationSubscriberDescription *)self initWithTypes:v6];
  return v7;
}

uint64_t __59__RMConfigurationSubscriberDescription_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (RMConfigurationSubscriberDescription)initWithTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMConfigurationSubscriberDescription;
  uint64_t v5 = [(RMConfigurationSubscriberDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    types = v5->_types;
    v5->_types = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)types
{
  return self->_types;
}

- (void).cxx_destruct
{
}

@end