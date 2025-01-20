@interface WFActionDescriptionDefinition
- (WFActionDescriptionDefinition)initWithDictionary:(id)a3;
- (id)definitionByAddingEntriesInDictionary:(id)a3;
- (id)objectForKey:(id)a3;
@end

@implementation WFActionDescriptionDefinition

- (WFActionDescriptionDefinition)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFActionDefinition.m", 186, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionDescriptionDefinition;
  v6 = [(WFActionDescriptionDefinition *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
}

- (id)objectForKey:(id)a3
{
  if (self) {
    self = (WFActionDescriptionDefinition *)self->_definition;
  }
  return [(WFActionDescriptionDefinition *)self objectForKey:a3];
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [WFActionDescriptionDefinition alloc];
  if (self) {
    definition = self->_definition;
  }
  else {
    definition = 0;
  }
  uint64_t v7 = [(NSDictionary *)definition if_dictionaryByAddingEntriesFromDictionary:v4];

  v8 = [(WFActionDescriptionDefinition *)v5 initWithDictionary:v7];
  return v8;
}

@end