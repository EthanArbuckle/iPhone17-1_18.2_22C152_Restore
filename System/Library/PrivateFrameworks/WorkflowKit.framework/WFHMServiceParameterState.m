@interface WFHMServiceParameterState
- (BOOL)isEqual:(id)a3;
- (HMService)service;
- (NSArray)containedVariables;
- (NSDictionary)serializedService;
- (NSString)homeIdentifier;
- (WFHMServiceParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFHMServiceParameterState)initWithService:(id)a3 homeIdentifier:(id)a4;
- (WFPropertyListObject)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setSerializedService:(id)a3;
@end

@implementation WFHMServiceParameterState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedService, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)setSerializedService:(id)a3
{
}

- (NSDictionary)serializedService
{
  return self->_serializedService;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
}

- (NSArray)containedVariables
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WFHMServiceParameterState *)self serializedService];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFHMServiceParameterState *)self homeIdentifier];
  id v7 = (id)[v3 combine:v6];

  unint64_t v8 = [v3 finalize];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (WFHMServiceParameterState *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(WFHMServiceParameterState *)v6 serializedService];
      unint64_t v8 = [(WFHMServiceParameterState *)self serializedService];
      if (v7 == v8
        || ([(WFHMServiceParameterState *)v6 serializedService],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(WFHMServiceParameterState *)self serializedService],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        v10 = [(WFHMServiceParameterState *)v6 homeIdentifier];
        v11 = [(WFHMServiceParameterState *)self homeIdentifier];
        char v9 = [v10 isEqualToString:v11];

        if (v7 == v8)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        char v9 = 0;
      }

      goto LABEL_10;
    }
    char v9 = 0;
  }
LABEL_11:

  return v9;
}

- (HMService)service
{
  service = self->_service;
  if (service)
  {
LABEL_6:
    v11 = service;
    goto LABEL_7;
  }
  v4 = +[WFHomeManager sharedManager];
  id v5 = [(WFHMServiceParameterState *)self homeIdentifier];
  v6 = [v4 homeWithIdentifier:v5];

  if (v6)
  {
    if (self->_serializedService)
    {
      Class HMServiceClass = getHMServiceClass();
      unint64_t v8 = [(WFHMServiceParameterState *)self serializedService];
      char v9 = [(objc_class *)HMServiceClass serviceWithSerializedDictionaryRepresentation:v8 home:v6];
      v10 = self->_service;
      self->_service = v9;
    }
    service = self->_service;
    goto LABEL_6;
  }
  v11 = 0;
LABEL_7:
  return v11;
}

- (WFPropertyListObject)serializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFHMServiceParameterState *)self homeIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"HomeIdentifier"];

  id v5 = [(WFHMServiceParameterState *)self serializedService];

  if (v5)
  {
    v6 = [(WFHMServiceParameterState *)self serializedService];
    [v3 setObject:v6 forKeyedSubscript:@"HomeService"];
  }
  return (WFPropertyListObject *)v3;
}

- (WFHMServiceParameterState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFHMServiceParameterState;
  id v7 = [(WFHMServiceParameterState *)&v14 init];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v6;
    char v9 = [v8 objectForKeyedSubscript:@"HomeIdentifier"];
    if (v9)
    {
      objc_storeStrong((id *)&v7->_homeIdentifier, v9);
      uint64_t v10 = [v8 objectForKeyedSubscript:@"HomeService"];
      serializedService = v7->_serializedService;
      v7->_serializedService = (NSDictionary *)v10;

      v12 = v7;
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WFHMServiceParameterState)initWithService:(id)a3 homeIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHMServiceParameterState.m", 41, @"Invalid parameter not satisfying: %@", @"homeIdentifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFHMServiceParameterState;
  uint64_t v10 = [(WFHMServiceParameterState *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeIdentifier, a4);
    uint64_t v12 = [v8 serializedDictionaryRepresentation];
    serializedService = v11->_serializedService;
    v11->_serializedService = (NSDictionary *)v12;

    objc_storeStrong((id *)&v11->_service, a3);
    objc_super v14 = v11;
  }

  return v11;
}

@end