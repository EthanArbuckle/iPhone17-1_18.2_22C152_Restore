@interface WFPropertyListParameterValue
+ (Class)classForValueType:(int64_t)a3;
+ (Class)processedClassForValueType:(int64_t)a3;
+ (id)defaultStateForValueType:(int64_t)a3;
+ (id)localizedTitleForValueType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)containedVariables;
- (NSUUID)identity;
- (WFParameterState)state;
- (WFPropertyListObject)serializedRepresentation;
- (WFPropertyListParameterValue)initWithArray:(id)a3;
- (WFPropertyListParameterValue)initWithArrayState:(id)a3;
- (WFPropertyListParameterValue)initWithBoolean:(id)a3;
- (WFPropertyListParameterValue)initWithBooleanState:(id)a3;
- (WFPropertyListParameterValue)initWithChooseFromMenuItem:(id)a3;
- (WFPropertyListParameterValue)initWithChooseFromMenuItemState:(id)a3;
- (WFPropertyListParameterValue)initWithChooseFromMenuString:(id)a3;
- (WFPropertyListParameterValue)initWithDictionary:(id)a3;
- (WFPropertyListParameterValue)initWithDictionaryState:(id)a3;
- (WFPropertyListParameterValue)initWithNumber:(id)a3;
- (WFPropertyListParameterValue)initWithNumberState:(id)a3;
- (WFPropertyListParameterValue)initWithObject:(id)a3;
- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 valueType:(int64_t)a6 variableStringStateClass:(Class)a7;
- (WFPropertyListParameterValue)initWithString:(id)a3;
- (WFPropertyListParameterValue)initWithStringState:(id)a3;
- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4;
- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4 identity:(id)a5;
- (int64_t)valueType;
- (unint64_t)hash;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFPropertyListParameterValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

- (NSUUID)identity
{
  return self->_identity;
}

- (WFParameterState)state
{
  return self->_state;
}

- (int64_t)valueType
{
  return self->_valueType;
}

- (unint64_t)hash
{
  v2 = [(WFPropertyListParameterValue *)self state];
  unint64_t v3 = [v2 hash] ^ 0x700F00D5;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFPropertyListParameterValue *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFPropertyListParameterValue *)v4 state];
      v6 = [(WFPropertyListParameterValue *)self state];
      if ([v5 isEqual:v6])
      {
        BOOL v7 = 1;
      }
      else
      {
        v8 = [(WFPropertyListParameterValue *)v4 state];
        if (v8)
        {
          BOOL v7 = 0;
        }
        else
        {
          v9 = [(WFPropertyListParameterValue *)self state];
          BOOL v7 = v9 == 0;
        }
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (NSArray)containedVariables
{
  v2 = [(WFPropertyListParameterValue *)self state];
  unint64_t v3 = [v2 containedVariables];

  return (NSArray *)v3;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(WFPropertyListParameterValue *)self state];
  if (v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
    v12[3] = &unk_1E6555C08;
    v12[4] = self;
    id v14 = v10;
    id v13 = v8;
    [v11 processWithContext:v13 userInputRequiredHandler:v9 valueHandler:v12];
  }
  else
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

void __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)[(id)objc_opt_class() processedClassForValueType:*(void *)(*(void *)(a1 + 32) + 8)];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 isSubclassOfClass:objc_opt_class()])
  {
    id v8 = [MEMORY[0x1E4F5A8A0] resultsForString:v5 ofTypes:0x200000000 error:0];
    uint64_t v9 = [v8 number];

    id v5 = (id)v9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && *(void *)(*(void *)(a1 + 32) + 8) == 4
    && (WFNumberIsBoolean(v5) & 1) == 0)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "BOOLValue"));

    id v5 = (id)v10;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v11 = [(id)objc_opt_class() defaultStateForValueType:*(void *)(*(void *)(a1 + 32) + 8)];
    if (v11)
    {
      v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:*(void *)(*(void *)(a1 + 32) + 8) state:v11];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
      v14[3] = &unk_1E65551D8;
      uint64_t v13 = *(void *)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      [v12 processWithContext:v13 userInputRequiredHandler:v14 valueHandler:*(void *)(a1 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

uint64_t __89__WFPropertyListParameterValue_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFPropertyListObject)serializedRepresentation
{
  unint64_t v3 = objc_opt_new();
  int64_t v4 = [(WFPropertyListParameterValue *)self valueType];
  id v5 = [NSNumber numberWithInteger:v4];
  [v3 setObject:v5 forKey:@"WFItemType"];

  id v6 = [(WFPropertyListParameterValue *)self state];
  BOOL v7 = v6;
  if (v6)
  {
    switch(v4)
    {
      case 0:
      case 3:
        id v8 = [v6 variableString];
        goto LABEL_10;
      case 1:
        uint64_t v9 = WFSerializedVariableObject(v6);
        uint64_t v10 = (void *)[v9 mutableCopy];

        v11 = [v7 variable];

        if (v11) {
          goto LABEL_12;
        }
        v12 = @"WFDictionaryFieldValue";
        break;
      case 2:
        uint64_t v13 = WFSerializedVariableObject(v6);
        uint64_t v10 = (void *)[v13 mutableCopy];

        id v14 = [v7 variable];

        if (v14) {
          goto LABEL_12;
        }
        v12 = @"WFArrayParameterState";
        break;
      case 4:
        id v8 = [v6 numberSubstitutableState];
LABEL_10:
        uint64_t v10 = v8;
        id v15 = WFSerializedVariableObject(v8);
        [v3 setObject:v15 forKey:@"WFValue"];

        goto LABEL_13;
      case 6:
        v17 = [v6 serializedRepresentation];
        [v3 setObject:v17 forKey:@"WFValue"];

        [v3 setObject:&unk_1F2317160 forKey:@"WFItemType"];
        goto LABEL_14;
      default:
        uint64_t v10 = WFSerializedVariableObject(v6);
        goto LABEL_12;
    }
    [v10 setObject:v12 forKey:@"WFSerializationType"];
LABEL_12:
    [v3 setObject:v10 forKey:@"WFValue"];
LABEL_13:
  }
LABEL_14:

  return (WFPropertyListObject *)v3;
}

- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5 valueType:(int64_t)a6 variableStringStateClass:(Class)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = [a3 objectForKey:@"WFValue"];
  switch(a6)
  {
    case 0:
    case 3:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        WFDeserializedVariableObject(v14, v12, v13);
        id v15 = (WFVariableString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
        v20 = v15;
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [[WFVariableString alloc] initWithString:v14];
        goto LABEL_13;
      }
      v20 = 0;
LABEL_15:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = (WFChooseFromMenuItemParameterState *)[[a7 alloc] initWithVariableString:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = [a7 alloc];
          v22 = [[WFVariableString alloc] initWithVariable:v20];
          v19 = (WFChooseFromMenuItemParameterState *)[v21 initWithVariableString:v22];
        }
        else
        {
          v19 = 0;
        }
      }

      if (!v19) {
        goto LABEL_21;
      }
      goto LABEL_22;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      v16 = WFDeserializedVariableObject(v14, v12, v13);
      v18 = [[WFBooleanSubstitutableState alloc] initWithNumberSubstitutableState:v16];
      goto LABEL_27;
    case 6:
      v19 = [[WFChooseFromMenuItemParameterState alloc] initWithSerializedRepresentation:v14 variableProvider:v12 parameter:v13];
      if (!v19) {
        goto LABEL_21;
      }
      goto LABEL_22;
    default:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_21;
      }
      v16 = [v14 objectForKeyedSubscript:@"WFSerializationType"];
      if ([v16 isEqualToString:@"WFDictionaryFieldValue"])
      {
        v17 = WFDictionarySubstitutableParameterState;
LABEL_25:
        v18 = (WFBooleanSubstitutableState *)[[v17 alloc] initWithSerializedRepresentation:v14 variableProvider:v12 parameter:v13];
        goto LABEL_27;
      }
      if ([v16 isEqualToString:@"WFArrayParameterState"])
      {
        v17 = WFArraySubstitutableParameterState;
        goto LABEL_25;
      }
      WFDeserializedVariableObject(v14, v12, v13);
      v18 = (WFBooleanSubstitutableState *)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v19 = (WFChooseFromMenuItemParameterState *)v18;

      if (!v19)
      {
LABEL_21:
        v19 = [(id)objc_opt_class() defaultStateForValueType:a6];
      }
LABEL_22:
      v23 = [(WFPropertyListParameterValue *)self initWithType:a6 state:v19];

      return v23;
  }
}

- (WFPropertyListParameterValue)initWithSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v10 objectForKey:@"WFItemType"];
  uint64_t v12 = [v11 integerValue];

  id v13 = [(WFPropertyListParameterValue *)self initWithSerializedRepresentation:v10 variableProvider:v9 parameter:v8 valueType:v12 variableStringStateClass:objc_opt_class()];
  return v13;
}

- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4 identity:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  [(id)objc_opt_class() classForValueType:a3];
  if ((objc_opt_isKindOfClass() & 1) == 0 && (a3 != 5 || v9))
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"WFPropertyListParameterValue.m" lineNumber:107 description:@"State for WFPropertyListParameterValue is not of the expected class"];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFPropertyListParameterValue;
  v11 = [(WFPropertyListParameterValue *)&v18 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_valueType = a3;
    uint64_t v13 = [v9 copyWithZone:MEMORY[0x1C87C93A0]()];
    state = v12->_state;
    v12->_state = (WFParameterState *)v13;

    objc_storeStrong((id *)&v12->_identity, a5);
    id v15 = v12;
  }

  return v12;
}

- (WFPropertyListParameterValue)initWithType:(int64_t)a3 state:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = a4;
  id v8 = [v6 UUID];
  id v9 = [(WFPropertyListParameterValue *)self initWithType:a3 state:v7 identity:v8];

  return v9;
}

+ (Class)processedClassForValueType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      unint64_t v3 = objc_opt_class();
      break;
    case 4:
      int64_t v4 = [NSNumber numberWithBool:1];
      unint64_t v3 = objc_opt_class();

      break;
    default:
      break;
  }
  return (Class)v3;
}

+ (Class)classForValueType:(int64_t)a3
{
  if ((unint64_t)a3 <= 6)
  {
    objc_opt_class();
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (Class)a1;
}

+ (id)defaultStateForValueType:(int64_t)a3
{
  uint64_t v3 = 0;
  switch(a3)
  {
    case 0:
      int64_t v4 = WFVariableStringParameterState;
      goto LABEL_9;
    case 1:
      id v5 = [WFDictionarySubstitutableParameterState alloc];
      uint64_t v6 = [(WFDictionarySubstitutableParameterState *)v5 initWithKeyValuePairs:MEMORY[0x1E4F1CBF0]];
      goto LABEL_7;
    case 2:
      id v7 = [WFArraySubstitutableParameterState alloc];
      uint64_t v6 = [(WFArraySubstitutableParameterState *)v7 initWithValues:MEMORY[0x1E4F1CBF0]];
      goto LABEL_7;
    case 3:
      id v8 = [WFVariableStringParameterState alloc];
      id v9 = [WFVariableString alloc];
      id v10 = @"0";
      goto LABEL_10;
    case 4:
      v11 = [WFBooleanSubstitutableState alloc];
      uint64_t v6 = [(WFNumberSubstitutableState *)v11 initWithNumber:MEMORY[0x1E4F1CC28]];
LABEL_7:
      uint64_t v3 = (WFVariableStringParameterState *)v6;
      break;
    case 6:
      int64_t v4 = WFChooseFromMenuItemParameterState;
LABEL_9:
      id v8 = (WFVariableStringParameterState *)[v4 alloc];
      id v9 = [WFVariableString alloc];
      id v10 = &stru_1F229A4D8;
LABEL_10:
      uint64_t v12 = [(WFVariableString *)v9 initWithString:v10];
      uint64_t v3 = [(WFVariableStringParameterState *)v8 initWithVariableString:v12];

      break;
    default:
      break;
  }
  return v3;
}

+ (id)localizedTitleForValueType:(int64_t)a3
{
  if ((unint64_t)a3 <= 6)
  {
    WFLocalizedString(off_1E6555260[a3]);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (WFPropertyListParameterValue)initWithObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(WFPropertyListParameterValue *)self initWithString:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(WFPropertyListParameterValue *)self initWithDictionary:v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [(WFPropertyListParameterValue *)self initWithArray:v4];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && WFNumberIsBoolean(v4))
        {
          id v5 = [(WFPropertyListParameterValue *)self initWithBoolean:v4];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v5 = [(WFPropertyListParameterValue *)self initWithNumber:v4];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v6 = 0;
              goto LABEL_15;
            }
            id v5 = [(WFPropertyListParameterValue *)self initWithChooseFromMenuItem:v4];
          }
        }
      }
    }
  }
  self = v5;
  uint64_t v6 = self;
LABEL_15:

  return v6;
}

- (WFPropertyListParameterValue)initWithChooseFromMenuItem:(id)a3
{
  id v4 = a3;
  id v5 = [WFVariableString alloc];
  uint64_t v6 = [v4 string];
  id v7 = [(WFVariableString *)v5 initWithString:v6];

  id v8 = [v4 synonyms];
  id v9 = objc_msgSend(v8, "if_map:", &__block_literal_global_339_53164);

  id v10 = [WFVariableString alloc];
  v11 = [v4 subtitle];

  uint64_t v12 = [(WFVariableString *)v10 initWithString:v11];
  uint64_t v13 = [[WFChooseFromMenuItemParameterState alloc] initWithVariableString:v7 synonyms:v9 subtitle:v12];
  id v14 = [(WFPropertyListParameterValue *)self initWithChooseFromMenuItemState:v13];

  return v14;
}

WFChooseFromMenuItemSynonym *__72__WFPropertyListParameterValue_Convenience__initWithChooseFromMenuItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[WFVariableString alloc] initWithString:v2];

  id v4 = [WFChooseFromMenuItemSynonym alloc];
  id v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [(WFChooseFromMenuItemSynonym *)v4 initWithIdentity:v5 synonym:v3];

  return v6;
}

- (WFPropertyListParameterValue)initWithBoolean:(id)a3
{
  id v4 = a3;
  id v5 = [(WFNumberSubstitutableState *)[WFBooleanSubstitutableState alloc] initWithNumber:v4];

  uint64_t v6 = [(WFPropertyListParameterValue *)self initWithBooleanState:v5];
  return v6;
}

- (WFPropertyListParameterValue)initWithNumber:(id)a3
{
  id v4 = a3;
  id v5 = [WFVariableStringParameterState alloc];
  uint64_t v6 = [WFVariableString alloc];
  id v7 = [v4 stringValue];

  id v8 = [(WFVariableString *)v6 initWithString:v7];
  id v9 = [(WFVariableStringParameterState *)v5 initWithVariableString:v8];
  id v10 = [(WFPropertyListParameterValue *)self initWithNumberState:v9];

  return v10;
}

- (WFPropertyListParameterValue)initWithArray:(id)a3
{
  id v4 = objc_msgSend(a3, "if_map:", &__block_literal_global_53167);
  id v5 = [[WFArraySubstitutableParameterState alloc] initWithValues:v4];
  uint64_t v6 = [(WFPropertyListParameterValue *)self initWithArrayState:v5];

  return v6;
}

WFPropertyListParameterValue *__59__WFPropertyListParameterValue_Convenience__initWithArray___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [[WFPropertyListParameterValue alloc] initWithObject:v2];

  return v3;
}

- (WFPropertyListParameterValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__WFPropertyListParameterValue_Convenience__initWithDictionary___block_invoke;
  v10[3] = &unk_1E6555200;
  id v11 = v5;
  id v6 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v10];

  id v7 = [[WFDictionarySubstitutableParameterState alloc] initWithKeyValuePairs:v6];
  id v8 = [(WFPropertyListParameterValue *)self initWithDictionaryState:v7];

  return v8;
}

void __64__WFPropertyListParameterValue_Convenience__initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v11 = [[WFVariableString alloc] initWithString:v6];

  id v7 = [[WFPropertyListParameterValue alloc] initWithObject:v5];
  if (v11) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = [[WFDictionaryParameterKeyValuePair alloc] initWithKey:v11 value:v7];
    [v9 addObject:v10];
  }
}

- (WFPropertyListParameterValue)initWithChooseFromMenuString:(id)a3
{
  id v4 = a3;
  id v5 = [WFChooseFromMenuItemParameterState alloc];
  id v6 = [[WFVariableString alloc] initWithString:v4];

  id v7 = [(WFVariableStringParameterState *)v5 initWithVariableString:v6];
  BOOL v8 = [(WFPropertyListParameterValue *)self initWithChooseFromMenuItemState:v7];

  return v8;
}

- (WFPropertyListParameterValue)initWithString:(id)a3
{
  id v4 = a3;
  id v5 = [WFVariableStringParameterState alloc];
  id v6 = [[WFVariableString alloc] initWithString:v4];

  id v7 = [(WFVariableStringParameterState *)v5 initWithVariableString:v6];
  BOOL v8 = [(WFPropertyListParameterValue *)self initWithStringState:v7];

  return v8;
}

- (WFPropertyListParameterValue)initWithChooseFromMenuItemState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:6 state:a3];
}

- (WFPropertyListParameterValue)initWithBooleanState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:4 state:a3];
}

- (WFPropertyListParameterValue)initWithNumberState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:3 state:a3];
}

- (WFPropertyListParameterValue)initWithArrayState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:2 state:a3];
}

- (WFPropertyListParameterValue)initWithDictionaryState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:1 state:a3];
}

- (WFPropertyListParameterValue)initWithStringState:(id)a3
{
  return [(WFPropertyListParameterValue *)self initWithType:0 state:a3];
}

@end