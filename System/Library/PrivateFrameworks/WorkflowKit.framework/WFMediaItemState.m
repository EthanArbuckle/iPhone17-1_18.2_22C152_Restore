@interface WFMediaItemState
+ (id)processingValueClasses;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFMediaItemState)initWithMediaType:(id)a3 persistentID:(id)a4;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFMediaItemState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v13 = a3;
  v8 = (void (**)(id, void *, void))a4;
  v9 = (void (**)(id, void *, void))a5;
  v10 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v10)
  {
    v11 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = [v11 prompt];
      v8[2](v8, v12, 0);
    }
    else
    {

      v11 = [(WFVariableSubstitutableParameterState *)self variable];
      [v11 getContentWithContext:v13 completionHandler:v9];
    }
  }
  else
  {
    v11 = [(WFVariableSubstitutableParameterState *)self value];
    v9[2](v9, v11, 0);
  }
}

- (WFMediaItemState)initWithMediaType:(id)a3 persistentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v8 = (void *)getMPMediaPropertyPredicateClass_softClass_52193;
  uint64_t v38 = getMPMediaPropertyPredicateClass_softClass_52193;
  if (!getMPMediaPropertyPredicateClass_softClass_52193)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __getMPMediaPropertyPredicateClass_block_invoke_52194;
    v33 = &unk_1E6558B78;
    v34 = &v35;
    __getMPMediaPropertyPredicateClass_block_invoke_52194((uint64_t)&v30);
    v8 = (void *)v36[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v35, 8);
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v10 = (void *)getMPMediaItemClass_softClass_52195;
  uint64_t v38 = getMPMediaItemClass_softClass_52195;
  if (!getMPMediaItemClass_softClass_52195)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __getMPMediaItemClass_block_invoke_52196;
    v33 = &unk_1E6558B78;
    v34 = &v35;
    __getMPMediaItemClass_block_invoke_52196((uint64_t)&v30);
    v10 = (void *)v36[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v35, 8);
  v12 = [v11 persistentIDPropertyForGroupingType:WFGroupingPropertyForMediaType_52197(v6)];
  id v13 = [v9 predicateWithValue:v7 forProperty:v12];

  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2050000000;
  v14 = (void *)getMPMediaQueryClass_softClass_52198;
  uint64_t v38 = getMPMediaQueryClass_softClass_52198;
  if (!getMPMediaQueryClass_softClass_52198)
  {
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __getMPMediaQueryClass_block_invoke_52199;
    v33 = &unk_1E6558B78;
    v34 = &v35;
    __getMPMediaQueryClass_block_invoke_52199((uint64_t)&v30);
    v14 = (void *)v36[3];
  }
  v15 = v14;
  _Block_object_dispose(&v35, 8);
  id v16 = [v15 alloc];
  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
  v18 = (void *)[v16 initWithFilterPredicates:v17];

  [v18 setGroupingType:WFGroupingPropertyForMediaType_52197(v6)];
  v19 = [v18 collections];
  uint64_t v20 = [v19 count];

  if (!v20) {
    goto LABEL_23;
  }
  if (![v6 isEqualToString:@"Playlist"])
  {
    if (([v6 isEqualToString:@"Album"] & 1) != 0
      || [v6 isEqualToString:@"Compilation"])
    {
      v21 = [v18 collections];
      v22 = [v21 firstObject];
      v24 = [v22 representativeItem];
      uint64_t v25 = [v24 albumTitle];
LABEL_13:
      v23 = (void *)v25;

      goto LABEL_14;
    }
    if ([v6 isEqualToString:@"Song"])
    {
      v21 = [v18 collections];
      v22 = [v21 firstObject];
      v24 = [v22 representativeItem];
      uint64_t v25 = [v24 title];
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"Artist"])
    {
      v21 = [v18 collections];
      v22 = [v21 firstObject];
      v24 = [v22 representativeItem];
      uint64_t v25 = [v24 artist];
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"Genre"])
    {
      v21 = [v18 collections];
      v22 = [v21 firstObject];
      v24 = [v22 representativeItem];
      uint64_t v25 = [v24 genre];
      goto LABEL_13;
    }
    if ([v6 isEqualToString:@"Composer"])
    {
      v21 = [v18 collections];
      v22 = [v21 firstObject];
      v24 = [v22 representativeItem];
      uint64_t v25 = [v24 composer];
      goto LABEL_13;
    }
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  v21 = [v18 collections];
  v22 = [v21 firstObject];
  v23 = [v22 name];
LABEL_14:

LABEL_24:
  v26 = [[WFMediaItemDescriptor alloc] initWithMediaItemName:v23 persistentIdentifier:v7 mediaType:v6];
  v29.receiver = self;
  v29.super_class = (Class)WFMediaItemState;
  v27 = [(WFVariableSubstitutableParameterState *)&v29 initWithValue:v26];

  return v27;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v5)
    {
LABEL_3:
      id v6 = +[MTLJSONAdapter JSONDictionaryFromModel:v5 error:0];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, a1, @"WFMediaItemState.m", 176, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFMediaItemDescriptor class]]" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315906;
      v14 = "WFEnforceClass";
      __int16 v15 = 2114;
      id v16 = v7;
      __int16 v17 = 2114;
      id v18 = (id)objc_opt_class();
      __int16 v19 = 2114;
      uint64_t v20 = v6;
      id v10 = v18;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v13, 0x2Au);
    }
    id v8 = 0;
  }
  else
  {
    id v8 = v7;
  }

  if ([v8 count])
  {
    id v11 = +[MTLJSONAdapter modelOfClass:objc_opt_class() fromJSONDictionary:v8 error:0];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)processingValueClasses
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end