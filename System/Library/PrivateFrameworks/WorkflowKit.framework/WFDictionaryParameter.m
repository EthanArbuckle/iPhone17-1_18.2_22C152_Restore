@interface WFDictionaryParameter
- (BOOL)allowsMultipleValues;
- (Class)singleStateClass;
- (NSSet)allowedValueTypes;
- (NSString)localizedItemTypeName;
- (NSString)localizedNewItemTypeName;
- (WFDictionaryParameter)initWithDefinition:(id)a3;
- (id)defaultSupportedVariableTypes;
@end

@implementation WFDictionaryParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValueTypes, 0);
  objc_storeStrong((id *)&self->_localizedNewItemTypeName, 0);
  objc_storeStrong((id *)&self->_localizedItemTypeName, 0);
}

- (NSSet)allowedValueTypes
{
  return self->_allowedValueTypes;
}

- (NSString)localizedNewItemTypeName
{
  return self->_localizedNewItemTypeName;
}

- (NSString)localizedItemTypeName
{
  return self->_localizedItemTypeName;
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)defaultSupportedVariableTypes
{
  v2 = objc_opt_class();
  return (id)[v2 allInsertableVariableTypes];
}

- (WFDictionaryParameter)initWithDefinition:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFDictionaryParameter;
  v5 = [(WFParameter *)&v24 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"ItemTypeName"];
    uint64_t v7 = objc_opt_class();
    v8 = WFEnforceClass(v6, v7);

    uint64_t v9 = [v8 localize];
    localizedItemTypeName = v5->_localizedItemTypeName;
    v5->_localizedItemTypeName = (NSString *)v9;

    v11 = [v4 objectForKey:@"NewItemTypeName"];
    uint64_t v12 = objc_opt_class();
    v13 = WFEnforceClass(v11, v12);

    uint64_t v14 = [v13 localize];
    localizedNewItemTypeName = v5->_localizedNewItemTypeName;
    v5->_localizedNewItemTypeName = (NSString *)v14;

    id v16 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v17 = [v4 objectForKey:@"AllowedValueTypes"];
    uint64_t v18 = objc_opt_class();
    v19 = WFEnforceClass(v17, v18);
    uint64_t v20 = [v16 initWithArray:v19];
    allowedValueTypes = v5->_allowedValueTypes;
    v5->_allowedValueTypes = (NSSet *)v20;

    v22 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end