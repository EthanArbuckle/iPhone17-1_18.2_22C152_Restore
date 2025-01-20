@interface WFActionDefinition
- (WFActionDefinition)initWithDictionary:(id)a3;
- (WFActionDescriptionDefinition)descriptionDefinition;
- (_NSLocalizedStringResource)name;
- (id)definitionByAddingEntriesInDictionary:(id)a3;
- (id)definitionByMergingWithDefinition:(id)a3;
- (id)definitionByRemovingKey:(id)a3;
- (id)objectForKey:(id)a3;
@end

@implementation WFActionDefinition

- (void).cxx_destruct
{
}

- (id)definitionByAddingEntriesInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [WFActionDefinition alloc];
  if (self) {
    definition = self->_definition;
  }
  else {
    definition = 0;
  }
  v7 = [(NSDictionary *)definition if_dictionaryByAddingEntriesFromDictionary:v4];

  v8 = [(WFActionDefinition *)v5 initWithDictionary:v7];
  return v8;
}

- (WFActionDefinition)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFActionDefinition.m", 136, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFActionDefinition;
  v6 = [(WFActionDefinition *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    definition = v6->_definition;
    v6->_definition = (NSDictionary *)v7;

    v9 = v6;
  }

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
    [v7 handleFailureInMethod:a2, self, @"WFActionDefinition.m", 151, @"Invalid parameter not satisfying: %@", @"definition" object file lineNumber description];

    uint64_t v4 = 0;
  }
  return [(WFActionDefinition *)self definitionByAddingEntriesInDictionary:v4];
}

- (id)objectForKey:(id)a3
{
  if (self) {
    self = (WFActionDefinition *)self->_definition;
  }
  return [(WFActionDefinition *)self objectForKey:a3];
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  v2 = [(WFActionDefinition *)self objectForKey:@"Description"];
  if (!v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v3 = [WFActionDescriptionDefinition alloc];
    v2 = [(WFActionDescriptionDefinition *)v3 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  return v2;
}

- (_NSLocalizedStringResource)name
{
  v2 = [(WFActionDefinition *)self objectForKey:@"Name"];
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  uint64_t v4 = v2;

  return v4;
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

  v6 = [[WFActionDefinition alloc] initWithDictionary:v5];
  return v6;
}

@end