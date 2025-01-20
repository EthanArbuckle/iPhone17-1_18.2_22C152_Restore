@interface WFParameter
+ (id)allInsertableVariableTypes;
+ (id)parameterWithDefinition:(id)a3;
+ (id)referencedActionResourceClasses;
- (BOOL)allowsMultipleValues;
- (BOOL)displaysMultipleValueEditor;
- (BOOL)doNotLocalizePlaceholder;
- (BOOL)doNotLocalizeValues;
- (BOOL)fixedSizeArray;
- (BOOL)isHidden;
- (BOOL)isInsideWorkflow;
- (BOOL)isRangedSizeArray;
- (BOOL)parameterStateIsValid:(id)a3;
- (BOOL)shouldAlignLabels;
- (BOOL)stripsTTSHints;
- (Class)multipleStateClass;
- (Class)singleStateClass;
- (Class)stateClass;
- (Class)toolkitValueClass;
- (NSDictionary)arraySizeRangesByWidgetFamily;
- (NSDictionary)arraySizesBySizeClass;
- (NSHashTable)eventObservers;
- (NSSet)defaultSupportedVariableTypes;
- (NSSet)disallowedVariableTypes;
- (NSSet)supportedVariableTypes;
- (NSString)importQuestionBehavior;
- (NSString)intentSlotName;
- (NSString)key;
- (NSString)keyForSerialization;
- (NSString)languageCode;
- (NSString)legacyKey;
- (NSString)localizedDescription;
- (NSString)localizedLabel;
- (NSString)localizedPlaceholder;
- (NSString)localizedPrompt;
- (WFParameter)initWithDefinition:(id)a3;
- (WFParameterDefinition)definition;
- (WFPropertyListObject)defaultSerializedRepresentation;
- (WFResourceManager)resourceManager;
- (_NSRange)arraySizeRangeForWidgetFamily:(id)a3;
- (id)_localizedStringForKey:(id)a3 context:(id)a4;
- (id)localizedDescriptionWithContext:(id)a3;
- (id)localizedLabelWithContext:(id)a3;
- (int64_t)arraySizeForWidgetSizeClass:(id)a3;
- (int64_t)editingContext;
- (void)addEventObserver:(id)a3;
- (void)attributesDidChange;
- (void)defaultSerializedRepresentationDidChange;
- (void)removeEventObserver:(id)a3;
- (void)setEditingContext:(int64_t)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLocalizedPlaceholder:(id)a3;
- (void)setLocalizedPrompt:(id)a3;
- (void)stateValidityCriteriaDidChange;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFParameter

- (void)addEventObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFParameter *)self eventObservers];
  [v5 addObject:v4];
}

- (NSHashTable)eventObservers
{
  return self->_eventObservers;
}

- (NSString)key
{
  return self->_key;
}

+ (id)parameterWithDefinition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"Class"];
  uint64_t v6 = objc_opt_class();
  WFEnforceClass(v5, v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = NSClassFromString(v7);

  if (v8)
  {
    if ([(objc_class *)v8 isSubclassOfClass:a1]
      && ([v4 objectForKey:@"Key"],
          v9 = objc_claimAutoreleasedReturnValue(),
          uint64_t v10 = objc_opt_class(),
          WFEnforceClass(v9, v10),
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v9,
          v11))
    {
      v8 = (objc_class *)[[v8 alloc] initWithDefinition:v4];
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (WFParameter)initWithDefinition:(id)a3
{
  id v5 = a3;
  v71.receiver = self;
  v71.super_class = (Class)WFParameter;
  uint64_t v6 = [(WFParameter *)&v71 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_definition, a3);
    v8 = [WFResourceManager alloc];
    v9 = [v5 objectForKey:@"RequiredResources"];
    uint64_t v10 = [(WFResourceManager *)v8 initWithDefinitions:v9];
    resourceManager = v7->_resourceManager;
    v7->_resourceManager = (WFResourceManager *)v10;

    uint64_t v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    eventObservers = v7->_eventObservers;
    v7->_eventObservers = (NSHashTable *)v12;

    v14 = [v5 objectForKey:@"Key"];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = WFEnforceClass(v14, v15);
    key = v7->_key;
    v7->_key = (NSString *)v16;

    v18 = [v5 objectForKey:@"KeyForSerialization"];
    uint64_t v19 = objc_opt_class();
    WFEnforceClass(v18, v19);
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20) {
      v21 = v7->_key;
    }
    objc_storeStrong((id *)&v7->_keyForSerialization, v21);

    v22 = [v5 objectForKey:@"LegacyKey"];
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = WFEnforceClass(v22, v23);
    legacyKey = v7->_legacyKey;
    v7->_legacyKey = (NSString *)v24;

    v26 = [v5 objectForKey:@"Hidden"];
    uint64_t v27 = objc_opt_class();
    v28 = WFEnforceClass(v26, v27);
    v7->_hidden = [v28 BOOLValue];

    v29 = [v5 objectForKey:@"DoNotLocalizeValues"];
    uint64_t v30 = objc_opt_class();
    v31 = WFEnforceClass(v29, v30);
    v7->_doNotLocalizeValues = [v31 BOOLValue];

    v32 = [v5 objectForKey:@"DoNotLocalizePlaceholder"];
    uint64_t v33 = objc_opt_class();
    v34 = WFEnforceClass(v32, v33);
    v7->_doNotLocalizePlaceholder = [v34 BOOLValue];

    v35 = [v5 objectForKey:@"LanguageCodeOverride"];
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = WFEnforceClass(v35, v36);
    languageCode = v7->_languageCode;
    v7->_languageCode = (NSString *)v37;

    uint64_t v39 = [v5 objectForKey:@"DefaultValue"];
    defaultSerializedRepresentation = v7->_defaultSerializedRepresentation;
    v7->_defaultSerializedRepresentation = (WFPropertyListObject *)v39;

    v41 = [v5 objectForKey:@"DisallowedVariableTypes"];
    uint64_t v42 = objc_opt_class();
    v43 = WFEnforceClass(v41, v42);

    if (v43)
    {
      if ([v43 containsObject:@"Variable"])
      {
        v44 = [(id)objc_opt_class() allInsertableVariableTypes];
        v45 = (void *)[v44 mutableCopy];

        [v45 removeObject:@"Ask"];
        v46 = [v45 allObjects];
        uint64_t v47 = [v43 arrayByAddingObjectsFromArray:v46];

        v43 = (void *)v47;
      }
      uint64_t v48 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v43];
      disallowedVariableTypes = v7->_disallowedVariableTypes;
      v7->_disallowedVariableTypes = (NSSet *)v48;
    }
    uint64_t v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Ask", @"ActionOutput", @"Variable", @"ExtensionInput", 0);
    defaultSupportedVariableTypes = v7->_defaultSupportedVariableTypes;
    v7->_defaultSupportedVariableTypes = (NSSet *)v50;

    if (v7->_hidden)
    {
      v52 = @"Hidden";
      importQuestionBehavior = (__CFString *)v7->_importQuestionBehavior;
      v7->_importQuestionBehavior = (NSString *)@"Hidden";
    }
    else
    {
      v54 = [v5 objectForKey:@"ImportQuestionBehavior"];
      uint64_t v55 = objc_opt_class();
      WFEnforceClass(v54, v55);
      importQuestionBehavior = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (importQuestionBehavior) {
        v56 = importQuestionBehavior;
      }
      else {
        v56 = @"Default";
      }
      objc_storeStrong((id *)&v7->_importQuestionBehavior, v56);
    }

    v57 = [v5 objectForKey:@"IntentSlotName"];
    uint64_t v58 = objc_opt_class();
    WFEnforceClass(v57, v58);
    v59 = (NSString *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (!v59) {
      v60 = v7->_key;
    }
    objc_storeStrong((id *)&v7->_intentSlotName, v60);

    v61 = [v5 objectForKey:@"AllowsMultipleValues"];
    v7->_allowsMultipleValues = [v61 BOOLValue];

    v62 = [v5 objectForKey:@"FixedSizeArray"];
    v7->_fixedSizeArray = [v62 BOOLValue];

    uint64_t v63 = [v5 objectForKey:@"ArraySizesForSizeClass"];
    arraySizesBySizeClass = v7->_arraySizesBySizeClass;
    v7->_arraySizesBySizeClass = (NSDictionary *)v63;

    v65 = [v5 objectForKey:@"RangedSizeArray"];
    BOOL v66 = ([v65 BOOLValue] & 1) != 0 || v7->_fixedSizeArray;
    v7->_rangedSizeArray = v66;

    uint64_t v67 = [v5 objectForKey:@"ArraySizeRangesForWidgetFamily"];
    arraySizeRangesByWidgetFamily = v7->_arraySizeRangesByWidgetFamily;
    v7->_arraySizeRangesByWidgetFamily = (NSDictionary *)v67;

    v69 = v7;
  }

  return v7;
}

- (NSString)legacyKey
{
  return self->_legacyKey;
}

- (NSString)keyForSerialization
{
  return self->_keyForSerialization;
}

- (BOOL)allowsMultipleValues
{
  return self->_allowsMultipleValues;
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  return self->_defaultSerializedRepresentation;
}

- (BOOL)doNotLocalizeValues
{
  return self->_doNotLocalizeValues;
}

- (NSString)localizedLabel
{
  v3 = [MEMORY[0x1E4FB47E8] defaultContext];
  id v4 = [(WFParameter *)self localizedLabelWithContext:v3];

  return (NSString *)v4;
}

- (id)localizedLabelWithContext:(id)a3
{
  v3 = [(WFParameter *)self _localizedStringForKey:@"Label" context:a3];
  id v4 = v3;
  if (!v3) {
    v3 = &stru_1F229A4D8;
  }
  id v5 = v3;

  return v5;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (NSString)localizedDescription
{
  v3 = [MEMORY[0x1E4FB47E8] defaultContext];
  id v4 = [(WFParameter *)self localizedDescriptionWithContext:v3];

  return (NSString *)v4;
}

- (id)_localizedStringForKey:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(WFParameter *)self definition];
  v9 = [v8 objectForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
LABEL_5:
    v11 = v10;
    goto LABEL_7;
  }
  if ([v9 conformsToProtocol:&unk_1F2360278])
  {
    id v10 = [v9 localizedStringWithContext:v6];
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (WFParameterDefinition)definition
{
  return self->_definition;
}

- (WFResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (id)localizedDescriptionWithContext:(id)a3
{
  return [(WFParameter *)self _localizedStringForKey:@"Description" context:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_defaultSupportedVariableTypes, 0);
  objc_storeStrong((id *)&self->_eventObservers, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_disallowedVariableTypes, 0);
  objc_storeStrong((id *)&self->_intentSlotName, 0);
  objc_storeStrong((id *)&self->_importQuestionBehavior, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_defaultSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_localizedPlaceholder, 0);
  objc_storeStrong((id *)&self->_legacyKey, 0);
  objc_storeStrong((id *)&self->_keyForSerialization, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_arraySizeRangesByWidgetFamily, 0);
  objc_storeStrong((id *)&self->_arraySizesBySizeClass, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
  objc_storeStrong((id *)&self->_supportedVariableTypes, 0);
}

- (void)attributesDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(WFParameter *)self eventObservers];
  id v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 parameterAttributesDidChange:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)stateValidityCriteriaDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(WFParameter *)self eventObservers];
  id v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 parameterStateValidityCriteriaDidChange:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (Class)stateClass
{
  if ([(WFParameter *)self allowsMultipleValues]) {
    v3 = [(WFParameter *)self multipleStateClass];
  }
  else {
    v3 = [(WFParameter *)self singleStateClass];
  }
  return v3;
}

- (void)setLocalizedPrompt:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSSet)defaultSupportedVariableTypes
{
  return self->_defaultSupportedVariableTypes;
}

- (BOOL)fixedSizeArray
{
  return self->_fixedSizeArray;
}

- (NSSet)disallowedVariableTypes
{
  return self->_disallowedVariableTypes;
}

- (void)setEditingContext:(int64_t)a3
{
  self->_editingContext = a3;
}

- (int64_t)editingContext
{
  return self->_editingContext;
}

- (BOOL)shouldAlignLabels
{
  return self->_shouldAlignLabels;
}

- (BOOL)isRangedSizeArray
{
  return self->_rangedSizeArray;
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (NSString)importQuestionBehavior
{
  return self->_importQuestionBehavior;
}

- (BOOL)isInsideWorkflow
{
  return self->_insideWorkflow;
}

- (BOOL)doNotLocalizePlaceholder
{
  return self->_doNotLocalizePlaceholder;
}

- (void)setLocalizedPlaceholder:(id)a3
{
}

- (NSDictionary)arraySizeRangesByWidgetFamily
{
  return self->_arraySizeRangesByWidgetFamily;
}

- (NSDictionary)arraySizesBySizeClass
{
  return self->_arraySizesBySizeClass;
}

- (Class)toolkitValueClass
{
  v2 = [(WFParameter *)self toolkitStateClass];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(objc_class *)v2 processingValueClasses];
    id v4 = (void *)[v3 firstObject];
  }
  else if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)[(objc_class *)v2 processingValueClass];
  }
  else
  {
    id v4 = 0;
  }
  return (Class)v4;
}

- (void)removeEventObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WFParameter *)self eventObservers];
  [v5 removeObject:v4];
}

- (void)defaultSerializedRepresentationDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(WFParameter *)self eventObservers];
  id v4 = [v3 allObjects];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 parameterDefaultSerializedRepresentationDidChange:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)parameterStateIsValid:(id)a3
{
  return 1;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    [(WFParameter *)self attributesDidChange];
  }
}

- (void)wasRemovedFromWorkflow
{
  self->_insideWorkflow = 0;
}

- (void)wasAddedToWorkflow
{
  self->_insideWorkflow = 1;
}

- (BOOL)stripsTTSHints
{
  v2 = [(WFParameter *)self definition];
  v3 = [v2 objectForKey:@"StripsTTSHints"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)displaysMultipleValueEditor
{
  return 1;
}

- (_NSRange)arraySizeRangeForWidgetFamily:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFParameter.m", 203, @"Invalid parameter not satisfying: %@", @"widgetFamily" object file lineNumber description];
  }
  uint64_t v6 = 1;
  uint64_t v7 = 1;
  if ([(WFParameter *)self allowsMultipleValues])
  {
    if ([(WFParameter *)self isRangedSizeArray])
    {
      uint64_t v8 = [(NSDictionary *)self->_arraySizeRangesByWidgetFamily objectForKeyedSubscript:v5];
      v9 = v8;
      if (v8)
      {
        uint64_t v6 = [v8 rangeValue];
        uint64_t v7 = v10;
LABEL_17:

        goto LABEL_18;
      }
      char v11 = [v5 isEqualToString:*MEMORY[0x1E4F727E0]];
      long long v12 = (void *)*MEMORY[0x1E4F727E8];
      if ((v11 & 1) == 0)
      {
        char v13 = [v5 isEqualToString:v12];
        long long v12 = (void *)*MEMORY[0x1E4F727F0];
        if ((v13 & 1) == 0)
        {
          char v14 = [v5 isEqualToString:v12];
          long long v12 = (void *)*MEMORY[0x1E4F727F8];
          if ((v14 & 1) == 0)
          {
            if (![v5 isEqualToString:v12])
            {
              char v15 = [v5 isEqualToString:*MEMORY[0x1E4F727D8]];
              long long v12 = (void *)*MEMORY[0x1E4F727C0];
              if (v15) {
                goto LABEL_16;
              }
              char v16 = [v5 isEqualToString:v12];
              long long v12 = (void *)*MEMORY[0x1E4F727C8];
              if (v16) {
                goto LABEL_16;
              }
              char v17 = [v5 isEqualToString:v12];
              long long v12 = (void *)*MEMORY[0x1E4F727D0];
              if (v17) {
                goto LABEL_16;
              }
              if (![v5 isEqualToString:v12])
              {
                uint64_t v7 = 0;
                uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
                goto LABEL_17;
              }
            }
            long long v12 = (void *)*MEMORY[0x1E4F72800];
          }
        }
      }
LABEL_16:
      id v18 = v12;
      uint64_t v6 = [(WFParameter *)self arraySizeRangeForWidgetFamily:v18];
      uint64_t v7 = v19;

      goto LABEL_17;
    }
    uint64_t v6 = 0;
    uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_18:

  NSUInteger v20 = v6;
  NSUInteger v21 = v7;
  result.length = v21;
  result.location = v20;
  return result;
}

- (int64_t)arraySizeForWidgetSizeClass:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFParameter.m", 170, @"Invalid parameter not satisfying: %@", @"widgetSizeClass" object file lineNumber description];
  }
  if ([(WFParameter *)self allowsMultipleValues])
  {
    if ([(WFParameter *)self fixedSizeArray])
    {
      uint64_t v6 = [(NSDictionary *)self->_arraySizesBySizeClass objectForKeyedSubscript:v5];
      uint64_t v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 integerValue];
        if (v8 <= 1) {
          int64_t v9 = 1;
        }
        else {
          int64_t v9 = v8;
        }
        goto LABEL_17;
      }
      char v10 = [v5 isEqualToString:*MEMORY[0x1E4F30090]];
      char v11 = (void *)*MEMORY[0x1E4F30098];
      if ((v10 & 1) == 0)
      {
        char v12 = [v5 isEqualToString:*MEMORY[0x1E4F30098]];
        char v11 = (void *)*MEMORY[0x1E4F300A0];
        if ((v12 & 1) == 0)
        {
          if ([v5 isEqualToString:*MEMORY[0x1E4F300A0]]
            || (char v11 = (void *)*MEMORY[0x1E4F30078],
                [v5 isEqualToString:*MEMORY[0x1E4F30078]]))
          {
            char v11 = (void *)*MEMORY[0x1E4F300A8];
          }
          else
          {
            char v15 = (void *)*MEMORY[0x1E4F30070];
            if (([v5 isEqualToString:*MEMORY[0x1E4F30070]] & 1) == 0)
            {
              if ([v5 isEqualToString:*MEMORY[0x1E4F30088]])
              {
                char v11 = v15;
              }
              else
              {
                char v11 = v15;
                if (![v5 isEqualToString:*MEMORY[0x1E4F30080]])
                {
                  int64_t v9 = 1;
                  goto LABEL_17;
                }
              }
            }
          }
        }
      }
      id v13 = v11;
      int64_t v9 = [(WFParameter *)self arraySizeForWidgetSizeClass:v13];

LABEL_17:
      goto LABEL_18;
    }
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v9 = 1;
  }
LABEL_18:

  return v9;
}

- (NSSet)supportedVariableTypes
{
  supportedVariableTypes = self->_supportedVariableTypes;
  if (supportedVariableTypes)
  {
LABEL_6:
    int64_t v9 = supportedVariableTypes;
    goto LABEL_7;
  }
  char v4 = [(WFParameter *)self defaultSupportedVariableTypes];
  id v5 = (NSSet *)[v4 mutableCopy];

  if (v5)
  {
    uint64_t v6 = [(WFParameter *)self disallowedVariableTypes];

    if (v6)
    {
      uint64_t v7 = [(WFParameter *)self disallowedVariableTypes];
      [(NSSet *)v5 minusSet:v7];
    }
    uint64_t v8 = self->_supportedVariableTypes;
    self->_supportedVariableTypes = v5;

    supportedVariableTypes = self->_supportedVariableTypes;
    goto LABEL_6;
  }
  int64_t v9 = 0;
LABEL_7:
  return v9;
}

- (NSString)localizedPlaceholder
{
  localizedPlaceholder = self->_localizedPlaceholder;
  if (localizedPlaceholder)
  {
    v3 = localizedPlaceholder;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB47E8] defaultContext];
    v3 = [(WFParameter *)self _localizedStringForKey:@"Placeholder" context:v5];
  }
  return v3;
}

- (NSString)localizedPrompt
{
  localizedPrompt = self->_localizedPrompt;
  if (localizedPrompt)
  {
    v3 = localizedPrompt;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB47E8] defaultContext];
    uint64_t v6 = [(WFParameter *)self _localizedStringForKey:@"Prompt" context:v5];
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = v6;
    }
    else
    {
      uint64_t v8 = [(WFParameter *)self localizedLabel];
    }
    v3 = v8;
  }
  return v3;
}

- (Class)singleStateClass
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"WFParameter subclasses must implement -singleStateClass" userInfo:0];
  objc_exception_throw(v2);
}

- (Class)multipleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)allInsertableVariableTypes
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"Ask", @"Variable", @"Clipboard", @"CurrentApp", @"CurrentDate", @"DeviceDetails", @"ActionOutput", @"ExtensionInput", 0);
  return v2;
}

+ (id)referencedActionResourceClasses
{
  id v2 = objc_opt_new();
  return v2;
}

@end