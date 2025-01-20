@interface WFLinkStartWorkoutParameterState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (NSString)localizedTitle;
- (WFLinkStartWorkoutParameterState)initWithLinkAction:(id)a3;
@end

@implementation WFLinkStartWorkoutParameterState

- (NSString)localizedTitle
{
  v2 = [(WFVariableSubstitutableParameterState *)self value];
  v3 = [v2 parameters];
  v4 = objc_msgSend(v3, "if_firstObjectPassingTest:", &__block_literal_global_663);

  v5 = [v4 value];
  v6 = [v5 displayRepresentation];
  v7 = [v6 title];
  v8 = objc_msgSend(v7, "wf_localizedString");

  return (NSString *)v8;
}

uint64_t __50__WFLinkStartWorkoutParameterState_localizedTitle__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"workoutStyle"];

  return v3;
}

- (WFLinkStartWorkoutParameterState)initWithLinkAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFLinkStartWorkoutParameterState;
  return [(WFVariableSubstitutableParameterState *)&v4 initWithValue:a3];
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"WFLinkStartWorkoutParameterState.m", 35, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[LNAction class]]" object file lineNumber description];
  }
  id v6 = v5;
  v7 = objc_opt_new();
  v8 = [v6 identifier];
  [v7 setObject:v8 forKey:@"Identifier"];

  v9 = [v6 mangledTypeName];

  if (v9)
  {
    v10 = [v6 mangledTypeName];
    [v7 setObject:v10 forKey:@"MangledTypeName"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "presentationStyle"));
  v27 = v7;
  [v7 setObject:v11 forKey:@"PresentationStyle"];

  v12 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v26 = v6;
  v13 = [v6 parameters];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E4F28DB0];
        v20 = [v18 value];
        id v28 = 0;
        v21 = [v19 archivedDataWithRootObject:v20 requiringSecureCoding:1 error:&v28];
        id v22 = v28;

        if (v22)
        {
          v23 = getWFAppIntentsLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v34 = "WFSerializedRepresentationFromLinkAction";
            __int16 v35 = 2112;
            id v36 = v22;
            _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s Could not archive LNValue into data: %@", buf, 0x16u);
          }
        }
        else
        {
          v23 = [v18 identifier];
          [v12 setObject:v21 forKeyedSubscript:v23];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v15);
  }

  [v27 setObject:v12 forKey:@"Parameters"];
  return v27;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = WFEnforceClass(v5, v6);

  v8 = [v7 objectForKeyedSubscript:@"Identifier"];
  uint64_t v9 = objc_opt_class();
  v10 = WFEnforceClass(v8, v9);

  v11 = [v7 objectForKeyedSubscript:@"MangledTypeName"];
  uint64_t v12 = objc_opt_class();
  v13 = WFEnforceClass(v11, v12);

  uint64_t v14 = [v7 objectForKeyedSubscript:@"PresentationStyle"];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = WFEnforceClass(v14, v15);

  v17 = [v7 objectForKeyedSubscript:@"Parameters"];
  uint64_t v18 = objc_opt_class();
  v19 = WFEnforceClass(v17, v18);

  v20 = objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __WFLinkActionFromSerializedRepresentation_block_invoke;
  v24[3] = &unk_1E654C9C8;
  id v25 = v20;
  id v21 = v20;
  [v19 enumerateKeysAndObjectsUsingBlock:v24];
  id v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F72AA0]), "initWithIdentifier:mangledTypeName:presentationStyle:parameters:", v10, v13, objc_msgSend(v16, "integerValue"), v21);

  return v22;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end