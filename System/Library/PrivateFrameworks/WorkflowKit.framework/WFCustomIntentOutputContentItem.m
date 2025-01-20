@interface WFCustomIntentOutputContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (INCodableDescription)codableDescription;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (Class)classForCoder;
- (Class)classForKeyedArchiver;
- (INCustomObject)customObject;
- (WFCustomIntentOutputContentItem)initWithCoder:(id)a3;
- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFCustomIntentOutputContentItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFCustomIntentOutputContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)propertyBuilders
{
  v2 = [a1 codableDescription];
  v3 = [v2 displayOrderedAttributes];
  id v4 = [v3 array];

  if (v4)
  {
    unsigned __int8 v5 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_69052);
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

id __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isDefaultAttribute]) {
    goto LABEL_13;
  }
  v3 = [v2 displayName];
  uint64_t v4 = [v3 length];

  if (!v4) {
    goto LABEL_13;
  }
  unsigned __int8 v5 = objc_msgSend(v2, "wf_objectClass");
  if (!v5) {
    goto LABEL_14;
  }
  if (([v5 isSubclassOfClass:objc_opt_class()] & 1) == 0
    && ([v5 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F5A858] sharedRegistry];
    objc_super v7 = [MEMORY[0x1E4F5A9A8] typeWithClass:v5];
    uint64_t v8 = [v6 contentItemClassForType:v7];

    if (v8) {
      goto LABEL_9;
    }
LABEL_13:
    unsigned __int8 v5 = 0;
    goto LABEL_14;
  }
  unsigned __int8 v5 = objc_msgSend(v2, "wf_contentItemClass");
  if (v5)
  {
LABEL_9:
    uint64_t v9 = objc_msgSend(v2, "wf_multipleValues");
    v10 = [v2 metadata];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v13 = v11;

    v14 = (void *)MEMORY[0x1E4F5A880];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke_2;
    v22[3] = &unk_1E6558220;
    id v15 = v2;
    id v23 = v15;
    v16 = [v15 propertyName];
    v17 = [v14 block:v22 name:v16 class:v5];
    v18 = [v17 multipleValues:v9];
    v19 = objc_msgSend(v13, "wf_measurementType");

    v20 = [v18 measurementUnitType:v19];
    v21 = [v15 localizedDisplayName];
    unsigned __int8 v5 = [v20 displayName:v21];
  }
LABEL_14:

  return v5;
}

void __51__WFCustomIntentOutputContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  objc_super v7 = [a2 customObject];
  uint64_t v8 = [*(id *)(a1 + 32) propertyName];
  uint64_t v9 = [v7 valueForKey:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(a1 + 32), "wf_contentItemForValue:", *(void *)(*((void *)&v18 + 1) + 8 * v15), (void)v18);
          if (v16) {
            [v10 addObject:v16];
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    v17 = (void *)[v10 copy];
  }
  else if (v9)
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "wf_contentItemForValue:", v9);
  }
  else
  {
    v17 = 0;
  }
  v6[2](v6, v17);
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [a1 codableDescription];
  v6 = [v4 stringLocalizer];

  objc_super v7 = objc_msgSend(v5, "wf_outputDisplayNameWithLocalizer:", v6);

  return v7;
}

+ (id)outputTypes
{
  id v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  id v2 = (void *)MEMORY[0x1E4F1CAA0];
  v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (INCodableDescription)codableDescription
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(WFCustomIntentOutputContentItem *)self customObject];
  unsigned __int8 v5 = [v4 codableDescription];

  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 performSelector:sel_mainBundleIdentifier];
    [v12 encodeObject:v6 forKey:@"bundleIdentifier"];
  }
  objc_super v7 = [v5 typeName];
  [v12 encodeObject:v7 forKey:@"codableDescriptionTypeName"];

  uint64_t v8 = [v5 intentDefinitionNamespace];
  [v12 encodeObject:v8 forKey:@"intentDefinitionNamespace"];

  id v9 = objc_alloc_init(MEMORY[0x1E4F30520]);
  v10 = [(WFCustomIntentOutputContentItem *)self customObject];
  id v11 = [v9 encodeObject:v10 withCodableDescription:v5];

  [v12 encodeObject:v11 forKey:@"customObject"];
}

- (WFCustomIntentOutputContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WFCustomIntentOutputContentItem;
  unsigned __int8 v5 = [(WFCustomIntentOutputContentItem *)&v41 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    int v7 = [(__CFString *)v6 isEqualToString:@"com.apple.Bridge"];
    uint64_t v8 = @"com.apple.PBBridgeSupport.BridgeIntents";
    if (!v7) {
      uint64_t v8 = v6;
    }
    id v9 = v8;

    if ([(__CFString *)v9 length])
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__69118;
      v39 = __Block_byref_object_dispose__69119;
      id v40 = 0;
      v10 = [MEMORY[0x1E4F304C8] sharedConnection];
      id v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __49__WFCustomIntentOutputContentItem_initWithCoder___block_invoke;
      v32[3] = &unk_1E6558960;
      v33 = v9;
      v34 = &v35;
      objc_msgSend(v10, "wf_accessBundleContentForBundleIdentifiers:withBlock:", v11, v32);

      if (v36[5])
      {
        id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"codableDescriptionTypeName"];
        uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentDefinitionNamespace"];
        v31 = INIntentDefinitionNamespacedName();
        uint64_t v14 = [(id)v36[5] _types];
        uint64_t v15 = [v14 objectForKey:v31];

        if (v15)
        {
          v28 = v13;
          v29 = objc_msgSend(v15, "wf_contentItemClassForCustomObjectWithNamespace:", v13);
          v30 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = objc_opt_class();
          uint64_t v18 = objc_opt_class();
          uint64_t v19 = objc_opt_class();
          uint64_t v20 = objc_opt_class();
          long long v21 = objc_msgSend(v30, "setWithObjects:", v16, v17, v18, v19, v20, objc_opt_class(), 0);
          v22 = [v4 decodeObjectOfClasses:v21 forKey:@"customObject"];

          id v23 = objc_alloc_init(MEMORY[0x1E4F30518]);
          v24 = (void *)[objc_alloc(MEMORY[0x1E4F303C8]) initWithObject:0 codableDescription:v15];
          [v23 decodeObject:v24 withCodableDescription:v15 from:v22];
          v25 = [v29 itemWithObject:v24];

          uint64_t v13 = v28;
        }
        else
        {
          v22 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCustomIntentOutputContentItemErrorDomain" code:1 userInfo:0];
          [v4 failWithError:v22];
          v25 = 0;
        }
      }
      else
      {
        id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCustomIntentOutputContentItemErrorDomain" code:0 userInfo:0];
        [v4 failWithError:v12];
        v25 = 0;
      }

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      v26 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFCustomIntentOutputContentItemErrorDomain" code:2 userInfo:0];
      [v4 failWithError:v26];

      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __49__WFCustomIntentOutputContentItem_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:*(void *)(a1 + 32) allowPlaceholder:0 error:0];
  id v6 = (id)v2;
  if (v2) {
    [MEMORY[0x1E4F30688] schemaWithBundleRecord:v2 fallbackToSystemSchema:0];
  }
  else {
  uint64_t v3 = INSyncedSchemaWithBundleID();
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned __int8 v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

- (id)generateObjectRepresentationsForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3)
  {
    int v7 = (void *)MEMORY[0x1E4F5A9A0];
    uint64_t v8 = [(WFCustomIntentOutputContentItem *)self customObject];
    id v9 = [v8 displayString];
    v10 = [v7 object:v9];
    v12[0] = v10;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (INCustomObject)customObject
{
  uint64_t v3 = objc_opt_class();
  return (INCustomObject *)[(WFCustomIntentOutputContentItem *)self objectForClass:v3];
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  unsigned __int8 v5 = (void (**)(id, uint64_t, void))a3;
  id v6 = [(WFCustomIntentOutputContentItem *)self customObject];
  int v7 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  uint64_t v8 = objc_msgSend(v6, "_intents_displayImageWithLocalizer:", v7);

  uint64_t v9 = objc_msgSend(v8, "wf_image");
  v10 = (void *)v9;
  if (v5 && v9) {
    v5[2](v5, v9, 0);
  }

  return v10 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  unsigned __int8 v5 = [(WFCustomIntentOutputContentItem *)self customObject];
  id v6 = [MEMORY[0x1E4F30788] localizerForLanguage:0];
  int v7 = objc_msgSend(v5, "_intents_readableSubtitleWithLocalizer:", v6);

  if (v4 && v7) {
    v4[2](v4, v7);
  }

  return v7 != 0;
}

@end