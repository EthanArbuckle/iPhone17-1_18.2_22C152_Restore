@interface WFParameterDefinition
- (WFParameterDefinition)initWithDictionary:(id)a3;
- (id)definitionByAddingEntriesInDictionary:(id)a3;
- (id)definitionByMergingWithDefinition:(id)a3;
- (id)definitionByRemovingKey:(id)a3;
- (id)objectForKey:(id)a3;
@end

@implementation WFParameterDefinition

- (void).cxx_destruct
{
}

- (WFParameterDefinition)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFParameterDefinition.m", 138, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFParameterDefinition.m", 139, @"Invalid parameter not satisfying: %@", @"[dictionary isKindOfClass:[NSDictionary class]]" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFParameterDefinition;
  v6 = [(WFParameterDefinition *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)objectForKey:(id)a3
{
  if (self) {
    self = (WFParameterDefinition *)self->_definition;
  }
  return [(WFParameterDefinition *)self objectForKey:a3];
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [WFParameterDefinition alloc];
  if (self) {
    definition = self->_definition;
  }
  else {
    definition = 0;
  }
  uint64_t v7 = [(NSDictionary *)definition if_dictionaryByAddingEntriesFromDictionary:v4];

  v8 = [(WFParameterDefinition *)v5 initWithDictionary:v7];
  return v8;
}

- (id)definitionByRemovingKey:(id)a3
{
  if (self) {
    definition = self->_definition;
  }
  else {
    definition = 0;
  }
  id v4 = a3;
  id v5 = (void *)[(NSDictionary *)definition mutableCopy];
  [v5 removeObjectForKey:v4];

  v6 = [[WFParameterDefinition alloc] initWithDictionary:v5];
  return v6;
}

- (id)definitionByMergingWithDefinition:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *((void *)a3 + 1);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"WFParameterDefinition.m", 150, @"Invalid parameter not satisfying: %@", @"definition" object file lineNumber description];

    uint64_t v4 = 0;
  }
  return [(WFParameterDefinition *)self definitionByAddingEntriesInDictionary:v4];
}

@end