@interface WFArrayParameter
- (BOOL)allowsMultipleValues;
- (BOOL)supportsVariables;
- (Class)stateClass;
- (NSSet)allowedValueTypes;
- (WFArrayParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)defaultSupportedVariableTypes;
@end

@implementation WFArrayParameter

- (void).cxx_destruct
{
}

- (NSSet)allowedValueTypes
{
  return self->_allowedValueTypes;
}

- (BOOL)supportsVariables
{
  return self->_supportsVariables;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)defaultSupportedVariableTypes
{
  if ([(WFArrayParameter *)self supportsVariables])
  {
    v2 = [(id)objc_opt_class() allInsertableVariableTypes];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)defaultSerializedRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)WFArrayParameter;
  v2 = [(WFParameter *)&v6 defaultSerializedRepresentation];
  v3 = v2;
  if (!v2) {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v4 = objc_msgSend(v2, "if_map:", &__block_literal_global_23045);

  return v4;
}

id __51__WFArrayParameter_defaultSerializedRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 localize];
  }
  v4 = v3;

  return v4;
}

- (WFArrayParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFArrayParameter;
  v5 = [(WFParameter *)&v18 initWithDefinition:v4];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v7 = [v4 objectForKey:@"AllowedValueTypes"];
    uint64_t v8 = objc_opt_class();
    v9 = WFEnforceClass(v7, v8);
    uint64_t v10 = [v6 initWithArray:v9];
    allowedValueTypes = v5->_allowedValueTypes;
    v5->_allowedValueTypes = (NSSet *)v10;

    v12 = [v4 objectForKey:@"SupportsVariables"];
    uint64_t v13 = objc_opt_class();
    v14 = WFEnforceClass(v12, v13);

    if (v14) {
      char v15 = [v14 BOOLValue];
    }
    else {
      char v15 = 1;
    }
    v5->_supportsVariables = v15;
    v16 = v5;
  }
  return v5;
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

@end