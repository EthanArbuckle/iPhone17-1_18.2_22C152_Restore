@interface WFINPaymentMethodParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
@end

@implementation WFINPaymentMethodParameterState

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = WFEnforceClass(v5, v6);

  v8 = [v7 objectForKeyedSubscript:@"Type"];
  uint64_t v9 = objc_opt_class();
  v10 = WFEnforceClass(v8, v9);

  if (v10)
  {
    v11 = [v7 objectForKeyedSubscript:@"Name"];
    uint64_t v12 = objc_opt_class();
    v13 = WFEnforceClass(v11, v12);

    v14 = [v7 objectForKeyedSubscript:@"IdentificationHint"];
    uint64_t v15 = objc_opt_class();
    v16 = WFEnforceClass(v14, v15);

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F305A8]), "initWithType:name:identificationHint:icon:", objc_msgSend(v10, "integerValue"), v13, v16, 0);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "type"));
  [v4 setObject:v5 forKey:@"Type"];

  uint64_t v6 = [v3 name];

  if (v6)
  {
    v7 = [v3 name];
    [v4 setObject:v7 forKey:@"Name"];
  }
  v8 = [v3 identificationHint];

  if (v8)
  {
    uint64_t v9 = [v3 identificationHint];
    [v4 setObject:v9 forKey:@"IdentificationHint"];
  }
  return v4;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end