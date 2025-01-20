@interface WFHMCharacteristicSubstitutableState
- (BOOL)isEqual:(id)a3;
- (HMCharacteristic)characteristic;
- (NSDictionary)serializedCharacteristic;
- (NSString)homeIdentifier;
- (WFHMCharacteristicSubstitutableState)initWithCharacteristic:(id)a3 homeIdentifier:(id)a4;
- (WFHMCharacteristicSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (id)containedVariables;
- (id)serializedRepresentation;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
- (void)setSerializedCharacteristic:(id)a3;
@end

@implementation WFHMCharacteristicSubstitutableState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializedCharacteristic, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (void)setSerializedCharacteristic:(id)a3
{
}

- (NSDictionary)serializedCharacteristic
{
  return self->_serializedCharacteristic;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
}

- (id)containedVariables
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v4 = [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic];
  id v5 = (id)[v3 combine:v4];

  v6 = [(WFHMCharacteristicSubstitutableState *)self homeIdentifier];
  id v7 = (id)[v3 combine:v6];

  unint64_t v8 = [v3 finalize];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (WFHMCharacteristicSubstitutableState *)a3;
  if (self == v6)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(WFHMCharacteristicSubstitutableState *)v6 serializedCharacteristic];
      unint64_t v8 = [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic];
      if (v7 == v8
        || ([(WFHMCharacteristicSubstitutableState *)v6 serializedCharacteristic],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic],
            v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        v10 = [(WFHMCharacteristicSubstitutableState *)v6 homeIdentifier];
        v11 = [(WFHMCharacteristicSubstitutableState *)self homeIdentifier];
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

- (HMCharacteristic)characteristic
{
  characteristic = self->_characteristic;
  if (characteristic) {
    goto LABEL_4;
  }
  v4 = +[WFHomeManager sharedManager];
  id v5 = [(WFHMCharacteristicSubstitutableState *)self homeIdentifier];
  v6 = [v4 homeWithIdentifier:v5];

  if (v6)
  {
    Class HMCharacteristicClass = getHMCharacteristicClass();
    unint64_t v8 = [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic];
    char v9 = [(objc_class *)HMCharacteristicClass characteristicWithSerializedDictionaryRepresentation:v8 home:v6];
    v10 = self->_characteristic;
    self->_characteristic = v9;

    characteristic = self->_characteristic;
LABEL_4:
    v11 = characteristic;
    goto LABEL_5;
  }
  v11 = 0;
LABEL_5:
  return v11;
}

- (id)serializedRepresentation
{
  v3 = objc_opt_new();
  v4 = [(WFHMCharacteristicSubstitutableState *)self homeIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"HomeIdentifier"];

  id v5 = [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic];

  if (v5)
  {
    v6 = [(WFHMCharacteristicSubstitutableState *)self serializedCharacteristic];
    [v3 setObject:v6 forKeyedSubscript:@"HomeCharacteristic"];
  }
  return v3;
}

- (WFHMCharacteristicSubstitutableState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFHMCharacteristicSubstitutableState;
  id v7 = [(WFHMCharacteristicSubstitutableState *)&v14 init];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = v6;
    char v9 = [v8 objectForKeyedSubscript:@"HomeIdentifier"];
    if (v9)
    {
      objc_storeStrong((id *)&v7->_homeIdentifier, v9);
      uint64_t v10 = [v8 objectForKeyedSubscript:@"HomeCharacteristic"];
      serializedCharacteristic = v7->_serializedCharacteristic;
      v7->_serializedCharacteristic = (NSDictionary *)v10;

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

- (WFHMCharacteristicSubstitutableState)initWithCharacteristic:(id)a3 homeIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHMCharacteristicSubstitutableState.m", 41, @"Invalid parameter not satisfying: %@", @"homeIdentifier" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFHMCharacteristicSubstitutableState;
  uint64_t v10 = [(WFHMCharacteristicSubstitutableState *)&v17 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_homeIdentifier, a4);
    objc_storeStrong((id *)&v11->_characteristic, a3);
    uint64_t v12 = [v8 serializedDictionaryRepresentation];
    serializedCharacteristic = v11->_serializedCharacteristic;
    v11->_serializedCharacteristic = (NSDictionary *)v12;

    objc_super v14 = v11;
  }

  return v11;
}

@end