@interface WFHMHomeAreaSubstitutableState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation WFHMHomeAreaSubstitutableState

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 uniqueIdentifier];
  v6 = [v5 UUIDString];
  [v4 setObject:v6 forKeyedSubscript:@"UniqueIdentifier"];

  v7 = [v3 homeIdentifier];
  v8 = [v7 UUIDString];
  [v4 setObject:v8 forKeyedSubscript:@"HomeIdentifier"];

  v9 = [v3 name];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    v11 = [v3 name];
    [v4 setObject:v11 forKeyedSubscript:@"AreaName"];
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "areaType"));
  [v4 setObject:v12 forKeyedSubscript:@"AreaType"];

  v13 = [v3 homeName];
  [v4 setObject:v13 forKeyedSubscript:@"HomeDisplayName"];

  return v4;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [v6 objectForKeyedSubscript:@"UniqueIdentifier"];
    v8 = [v6 objectForKeyedSubscript:@"HomeIdentifier"];
    if ([v7 length])
    {
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
      v11 = [v6 objectForKeyedSubscript:@"AreaName"];
      v12 = [v6 objectForKeyedSubscript:@"AreaType"];
      uint64_t v13 = [v12 unsignedIntegerValue];

      v14 = [v6 objectForKeyedSubscript:@"HomeDisplayName"];
      v15 = [[WFHMHomeAreaDescriptor alloc] initWithUniqueIdentifier:v9 homeIdentifier:v10 name:v11 areaType:v13 homeName:v14];
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  id v3 = objc_opt_new();
  v4 = [(WFVariableSubstitutableParameterState *)self value];
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v5 UUIDString];
  id v7 = (id)[v3 combine:v6];

  unint64_t v8 = [v3 finalize];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFHMHomeAreaSubstitutableState *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFVariableSubstitutableParameterState *)v4 value];
      id v6 = [(WFVariableSubstitutableParameterState *)self value];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

@end