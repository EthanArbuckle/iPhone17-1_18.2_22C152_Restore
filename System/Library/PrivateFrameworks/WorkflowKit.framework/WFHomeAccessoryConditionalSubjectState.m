@interface WFHomeAccessoryConditionalSubjectState
+ (id)subjectType;
- (BOOL)isEnumeration;
- (BOOL)isEqual:(id)a3;
- (BOOL)negatesValue;
- (HMCharacteristic)characteristic;
- (HMHome)home;
- (HMService)service;
- (NSDictionary)serializedWFHMCharacteristicSubstitutableState;
- (NSDictionary)serializedWFHMServiceParameter;
- (NSFormatter)characteristicValueFormatter;
- (WFHMCharacteristicSubstitutableState)characteristicSubstitutableState;
- (WFHMServiceParameterState)serviceParameterState;
- (WFHomeAccessoryConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFHomeAccessoryConditionalSubjectState)initWithSerializedWFHMServiceParameter:(id)a3 serializedWFHMCharacteristicSubstitutableState:(id)a4 negatesValue:(BOOL)a5;
- (WFHomeAccessoryConditionalSubjectState)initWithService:(id)a3 characteristic:(id)a4 homeIdentifier:(id)a5 negatesValue:(BOOL)a6;
- (id)homeIdentifier;
- (id)localizedLabelForEnumerationPossibleState:(id)a3;
- (id)maximumLength;
- (id)maximumValue;
- (id)minimumValue;
- (id)serializedRepresentation;
- (id)stepValue;
- (id)unit;
- (id)unitType;
- (int64_t)contentType;
- (unint64_t)hash;
- (void)getContentWithContext:(id)a3 completionHandler:(id)a4;
- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3;
- (void)setCharacteristicSubstitutableState:(id)a3;
- (void)setCharacteristicValueFormatter:(id)a3;
- (void)setSerializedWFHMCharacteristicSubstitutableState:(id)a3;
- (void)setSerializedWFHMServiceParameter:(id)a3;
- (void)setServiceParameterState:(id)a3;
@end

@implementation WFHomeAccessoryConditionalSubjectState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicValueFormatter, 0);
  objc_storeStrong((id *)&self->_characteristicSubstitutableState, 0);
  objc_storeStrong((id *)&self->_serviceParameterState, 0);
  objc_storeStrong((id *)&self->_serializedWFHMCharacteristicSubstitutableState, 0);
  objc_storeStrong((id *)&self->_serializedWFHMServiceParameter, 0);
}

- (void)setCharacteristicValueFormatter:(id)a3
{
}

- (void)setCharacteristicSubstitutableState:(id)a3
{
}

- (void)setServiceParameterState:(id)a3
{
}

- (void)setSerializedWFHMCharacteristicSubstitutableState:(id)a3
{
}

- (NSDictionary)serializedWFHMCharacteristicSubstitutableState
{
  return self->_serializedWFHMCharacteristicSubstitutableState;
}

- (void)setSerializedWFHMServiceParameter:(id)a3
{
}

- (NSDictionary)serializedWFHMServiceParameter
{
  return self->_serializedWFHMServiceParameter;
}

- (BOOL)negatesValue
{
  return self->_negatesValue;
}

- (NSFormatter)characteristicValueFormatter
{
  v3 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  characteristicValueFormatter = self->_characteristicValueFormatter;
  if (characteristicValueFormatter) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (!v5)
  {
    if (HomeLibrary_sOnce != -1) {
      dispatch_once(&HomeLibrary_sOnce, &__block_literal_global_291);
    }
    objc_msgSend(MEMORY[0x1E4F28CF8], "hf_valueFormatterForCharacteristic:options:", v3, 0);
    v6 = (NSFormatter *)objc_claimAutoreleasedReturnValue();
    v7 = self->_characteristicValueFormatter;
    self->_characteristicValueFormatter = v6;

    characteristicValueFormatter = self->_characteristicValueFormatter;
  }
  v8 = characteristicValueFormatter;

  return v8;
}

- (id)localizedLabelForEnumerationPossibleState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  v7 = [v6 number];
  if (v7)
  {
    v8 = [(WFHomeAccessoryConditionalSubjectState *)self characteristicValueFormatter];
    v9 = [v8 stringForObjectValue:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)getEnumerationPossibleStatesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WFHomeManager sharedManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 ensureHomesAreLoadedWithCompletionHandler:v7];
}

void __92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) characteristic];
  v3 = [v2 metadata];
  id v4 = [v3 validValues];

  if ([v4 count])
  {
    uint64_t v5 = v4;
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) minimumValue];
    unint64_t v7 = [v6 integerValue];

    id v8 = [*(id *)(a1 + 32) maximumValue];
    unint64_t v9 = [v8 integerValue];

    v10 = [*(id *)(a1 + 32) stepValue];
    uint64_t v11 = [v10 integerValue];

    for (id i = (id)objc_opt_new(); v7 <= v9; v7 += v11)
    {
      v12 = [NSNumber numberWithUnsignedInteger:v7];
      [i addObject:v12];
    }
    uint64_t v5 = i;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  id v16 = v5;
  v14 = objc_msgSend(v5, "if_map:", &__block_literal_global_2101);
  (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);
}

WFNumberSubstitutableState *__92__WFHomeAccessoryConditionalSubjectState_getEnumerationPossibleStatesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFNumberSubstitutableState alloc] initWithNumber:v2];

  return v3;
}

- (BOOL)isEnumeration
{
  v3 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];

  if (!v3) {
    return 0;
  }
  id v4 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  BOOL IsEnumeration = WFHMCharacteristicIsEnumeration(v4);

  return IsEnumeration;
}

- (WFHMCharacteristicSubstitutableState)characteristicSubstitutableState
{
  if (!self->_characteristicSubstitutableState)
  {
    v3 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];

    if (v3)
    {
      id v4 = [WFHMCharacteristicSubstitutableState alloc];
      uint64_t v5 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];
      id v6 = [(WFHMCharacteristicSubstitutableState *)v4 initWithSerializedRepresentation:v5 variableProvider:0 parameter:0];
      characteristicSubstitutableState = self->_characteristicSubstitutableState;
      self->_characteristicSubstitutableState = v6;
    }
  }
  id v8 = self->_characteristicSubstitutableState;
  return v8;
}

- (WFHMServiceParameterState)serviceParameterState
{
  serviceParameterState = self->_serviceParameterState;
  if (!serviceParameterState)
  {
    id v4 = [WFHMServiceParameterState alloc];
    uint64_t v5 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMServiceParameter];
    id v6 = [(WFHMServiceParameterState *)v4 initWithSerializedRepresentation:v5 variableProvider:0 parameter:0];
    unint64_t v7 = self->_serviceParameterState;
    self->_serviceParameterState = v6;

    serviceParameterState = self->_serviceParameterState;
  }
  return serviceParameterState;
}

- (id)unit
{
  v3 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];

  if (v3)
  {
    id v4 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
    uint64_t v5 = WFUnitForHMCharacteristic(v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (id)stepValue
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  v3 = [v2 metadata];
  id v4 = [v3 stepValue];

  return v4;
}

- (id)maximumValue
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  v3 = [v2 metadata];
  id v4 = [v3 maximumValue];

  return v4;
}

- (id)minimumValue
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  v3 = [v2 metadata];
  id v4 = [v3 minimumValue];

  return v4;
}

- (id)maximumLength
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  v3 = [v2 metadata];
  id v4 = [v3 maxLength];

  return v4;
}

- (int64_t)contentType
{
  v3 = [(WFHomeAccessoryConditionalSubjectState *)self characteristic];
  uint64_t v4 = [v3 metadata];
  uint64_t v5 = [(id)v4 format];

  id v6 = getHMCharacteristicMetadataFormatBool_2106();
  LOBYTE(v4) = [v5 isEqualToString:v6];

  if (v4)
  {
    int64_t v7 = 1;
    goto LABEL_19;
  }
  id v8 = getHMCharacteristicMetadataFormatString_2107();
  char v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    int64_t v7 = 2;
    goto LABEL_19;
  }
  v10 = getHMCharacteristicMetadataFormatInt_2108();
  if (([v5 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v11 = getHMCharacteristicMetadataFormatFloat_2109();
    if (([v5 isEqualToString:v11] & 1) == 0)
    {
      v12 = getHMCharacteristicMetadataFormatUInt8_2110();
      if (([v5 isEqualToString:v12] & 1) == 0)
      {
        uint64_t v13 = getHMCharacteristicMetadataFormatUInt16_2111();
        if (([v5 isEqualToString:v13] & 1) == 0)
        {
          v14 = getHMCharacteristicMetadataFormatUInt32_2112();
          if (([v5 isEqualToString:v14] & 1) == 0)
          {
            v17 = getHMCharacteristicMetadataFormatUInt64_2113();
            char v18 = [v5 isEqualToString:v17];

            if ((v18 & 1) == 0)
            {
              int64_t v7 = 0;
              goto LABEL_19;
            }
            goto LABEL_15;
          }
        }
      }
    }
  }

LABEL_15:
  v15 = [(WFHomeAccessoryConditionalSubjectState *)self unit];
  if (v15) {
    int64_t v7 = 5;
  }
  else {
    int64_t v7 = 3;
  }

LABEL_19:
  return v7;
}

- (void)getContentWithContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[WFHomeManager sharedManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke;
  v8[3] = &unk_1E65572A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 ensureHomesAreLoadedWithCompletionHandler:v8];
}

void __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) characteristic];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke_2;
  v4[3] = &unk_1E6558AC8;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [v2 readValueWithCompletionHandler:v4];
}

void __82__WFHomeAccessoryConditionalSubjectState_getContentWithContext_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) characteristic];
    id v16 = [v4 value];

    if ([*(id *)(a1 + 32) negatesValue])
    {
      id v5 = NSNumber;
      uint64_t v6 = objc_opt_class();
      id v7 = WFEnforceClass(v16, v6);
      uint64_t v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v7, "BOOLValue") ^ 1);

      id v16 = (id)v8;
    }
    id v9 = objc_opt_new();
    v10 = [*(id *)(a1 + 32) unit];

    if (v10)
    {
      id v11 = objc_alloc(MEMORY[0x1E4F28E28]);
      [v16 doubleValue];
      double v13 = v12;
      v14 = [*(id *)(a1 + 32) unit];
      v15 = (void *)[v11 initWithDoubleValue:v14 unit:v13];

      [v9 addObject:v15];
    }
    else
    {
      [v9 addObject:v16];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v6 = (WFHomeAccessoryConditionalSubjectState *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMServiceParameter];
      uint64_t v8 = [(WFHomeAccessoryConditionalSubjectState *)v6 serializedWFHMServiceParameter];
      if (![v7 isEqual:v8])
      {
        LOBYTE(v11) = 0;
LABEL_13:

        goto LABEL_14;
      }
      id v9 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];
      v10 = [(WFHomeAccessoryConditionalSubjectState *)v6 serializedWFHMCharacteristicSubstitutableState];
      if (v9 == v10
        || (-[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](self, "serializedWFHMCharacteristicSubstitutableState"), v3 = objc_claimAutoreleasedReturnValue(), -[WFHomeAccessoryConditionalSubjectState serializedWFHMCharacteristicSubstitutableState](v6, "serializedWFHMCharacteristicSubstitutableState"), uint64_t v4 = objc_claimAutoreleasedReturnValue(), [v3 isEqual:v4]))
      {
        BOOL v12 = [(WFHomeAccessoryConditionalSubjectState *)self negatesValue];
        BOOL v11 = v12 ^ [(WFHomeAccessoryConditionalSubjectState *)v6 negatesValue] ^ 1;
        if (v9 == v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_12;
    }
    LOBYTE(v11) = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  id v3 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMServiceParameter];
  uint64_t v4 = [v3 hash];
  id v5 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];
  uint64_t v6 = [v5 hash] ^ v4;
  BOOL v7 = [(WFHomeAccessoryConditionalSubjectState *)self negatesValue];
  uint64_t v8 = 3405660961;
  if (v7) {
    uint64_t v8 = 305449726;
  }
  unint64_t v9 = v6 ^ v8;

  return v9;
}

- (HMCharacteristic)characteristic
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self characteristicSubstitutableState];
  id v3 = [v2 characteristic];

  return (HMCharacteristic *)v3;
}

- (HMService)service
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self serviceParameterState];
  id v3 = [v2 service];

  return (HMService *)v3;
}

- (HMHome)home
{
  id v3 = +[WFHomeManager sharedManager];
  uint64_t v4 = [(WFHomeAccessoryConditionalSubjectState *)self homeIdentifier];
  id v5 = [v3 homeWithIdentifier:v4];

  return (HMHome *)v5;
}

- (id)homeIdentifier
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self serviceParameterState];
  id v3 = [v2 homeIdentifier];

  return v3;
}

- (id)unitType
{
  id v2 = [(WFHomeAccessoryConditionalSubjectState *)self unit];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4FB47F0] unitTypeForUnitClass:objc_opt_class()];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)serializedRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)WFHomeAccessoryConditionalSubjectState;
  id v3 = [(WFConditionalSubjectParameterState *)&v9 serializedRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  id v5 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMServiceParameter];
  [v4 setObject:v5 forKeyedSubscript:@"HomeService"];

  uint64_t v6 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];

  if (v6)
  {
    BOOL v7 = [(WFHomeAccessoryConditionalSubjectState *)self serializedWFHMCharacteristicSubstitutableState];
    [v4 setObject:v7 forKeyedSubscript:@"HomeCharacteristic"];
  }
  if ([(WFHomeAccessoryConditionalSubjectState *)self negatesValue]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"NegatesValue"];
  }
  return v4;
}

- (WFHomeAccessoryConditionalSubjectState)initWithService:(id)a3 characteristic:(id)a4 homeIdentifier:(id)a5 negatesValue:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  double v13 = [[WFHMServiceParameterState alloc] initWithService:v12 homeIdentifier:v11];

  v14 = [(WFHMServiceParameterState *)v13 serializedRepresentation];
  uint64_t v15 = objc_opt_class();
  id v16 = WFEnforceClass(v14, v15);

  if (v16)
  {
    if (v10)
    {
      v17 = [[WFHMCharacteristicSubstitutableState alloc] initWithCharacteristic:v10 homeIdentifier:v11];
      char v18 = [(WFHMCharacteristicSubstitutableState *)v17 serializedRepresentation];
      uint64_t v19 = objc_opt_class();
      v20 = WFEnforceClass(v18, v19);
    }
    else
    {
      v20 = 0;
    }
    self = [(WFHomeAccessoryConditionalSubjectState *)self initWithSerializedWFHMServiceParameter:v16 serializedWFHMCharacteristicSubstitutableState:v20 negatesValue:v6];

    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (WFHomeAccessoryConditionalSubjectState)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = WFEnforceClass(v6, v7);

  if (v8)
  {
    objc_super v9 = [v8 objectForKeyedSubscript:@"HomeService"];
    uint64_t v10 = objc_opt_class();
    id v11 = WFEnforceClass(v9, v10);

    id v12 = [v8 objectForKeyedSubscript:@"HomeCharacteristic"];
    uint64_t v13 = objc_opt_class();
    v14 = WFEnforceClass(v12, v13);

    if (v11)
    {
      uint64_t v15 = [v8 objectForKeyedSubscript:@"NegatesValue"];
      uint64_t v16 = objc_opt_class();
      v17 = WFEnforceClass(v15, v16);
      uint64_t v18 = [v17 BOOLValue];

      self = [(WFHomeAccessoryConditionalSubjectState *)self initWithSerializedWFHMServiceParameter:v11 serializedWFHMCharacteristicSubstitutableState:v14 negatesValue:v18];
      uint64_t v19 = self;
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (WFHomeAccessoryConditionalSubjectState)initWithSerializedWFHMServiceParameter:(id)a3 serializedWFHMCharacteristicSubstitutableState:(id)a4 negatesValue:(BOOL)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFHomeAccessoryConditionalSubjectState.m", 63, @"Invalid parameter not satisfying: %@", @"serializedWFHMServiceParameter" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFHomeAccessoryConditionalSubjectState;
  id v12 = [(WFHomeAccessoryConditionalSubjectState *)&v17 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serializedWFHMServiceParameter, a3);
    objc_storeStrong((id *)&v13->_serializedWFHMCharacteristicSubstitutableState, a4);
    v13->_negatesValue = a5;
    v14 = v13;
  }

  return v13;
}

+ (id)subjectType
{
  return @"HomeAccessory";
}

@end