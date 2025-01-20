@interface ICContentMapping
- (BOOL)inputRequired;
- (BOOL)skipURLEncoding;
- (BOOL)supportsMultipleItems;
- (ICContentMapping)initWithDefinition:(id)a3;
- (NSDictionary)definition;
- (NSDictionary)valueMapping;
- (NSOrderedSet)contentItemClasses;
- (NSString)destinationKey;
- (NSString)destinationType;
- (NSString)sourceKey;
- (NSString)sourceType;
- (WFParameterDefinition)parameterUI;
- (id)parameterDefault;
- (void)getContentCollection:(id)a3 withInput:(id)a4 parameters:(id)a5;
- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5;
@end

@implementation ICContentMapping

- (void).cxx_destruct
{
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke;
  v10[3] = &unk_1E6551C70;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(ICContentMapping *)self getContentCollection:v10 withInput:a4 parameters:a5];
}

void __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if ([v7 numberOfItems] != 1) {
    goto LABEL_6;
  }
  v10 = [v7 items];
  id v11 = [v10 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v13 = [v7 items];
    v14 = [v13 firstObject];

    v15 = [v14 number];
    [v15 BOOLValue];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
LABEL_6:
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2;
    v17[3] = &unk_1E65549A0;
    id v16 = *(id *)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v16;
    [v7 getStringRepresentation:v17];
  }
}

void __65__ICContentMapping_getStringRepresentation_withInput_parameters___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v16 = v3;
    v4 = [*(id *)(a1 + 32) definition];
    v5 = [v4 objectForKey:@"ValuePrefix"];
    uint64_t v6 = objc_opt_class();
    id v7 = WFEnforceClass(v5, v6);

    id v8 = [*(id *)(a1 + 32) definition];
    id v9 = [v8 objectForKey:@"ValueSuffix"];
    uint64_t v10 = objc_opt_class();
    id v11 = WFEnforceClass(v9, v10);

    if (v7)
    {
      uint64_t v12 = [v7 stringByAppendingString:v16];

      v13 = (void *)v12;
    }
    else
    {
      v13 = v16;
    }
    id v17 = v13;
    if (v11)
    {
      v15 = [v13 stringByAppendingString:v11];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v14();
  }
}

- (void)getContentCollection:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(ICContentMapping *)self sourceType];
  if (![v11 isEqualToString:@"Input"])
  {
    if (![v11 isEqualToString:@"Parameter"]) {
      goto LABEL_20;
    }
    v13 = [(ICContentMapping *)self sourceKey];
    v14 = [v10 objectForKey:v13];

    id v15 = v14;
    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v16 = v15;
      }
      else {
        id v16 = 0;
      }
    }
    else
    {
      id v16 = 0;
    }
    id v17 = v16;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v15;
LABEL_17:
      id v12 = v18;
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (void *)MEMORY[0x1E4F5A830];
      v26[0] = v15;
      v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      id v12 = [v19 collectionWithItems:v20];
    }
    else
    {
      if (v17)
      {
        id v18 = [v17 contentCollection];
        goto LABEL_17;
      }
      if (!v15)
      {
        id v12 = 0;
LABEL_18:

        if (v12) {
          goto LABEL_19;
        }
LABEL_20:
        (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
        goto LABEL_21;
      }
      v23 = (void *)MEMORY[0x1E4F5A830];
      v20 = [MEMORY[0x1E4F5A848] itemWithObject:v15];
      v25 = v20;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      id v12 = [v23 collectionWithItems:v24];
    }
    goto LABEL_18;
  }
  id v12 = v9;
  if (!v12) {
    goto LABEL_20;
  }
LABEL_19:
  v21 = [(ICContentMapping *)self contentItemClasses];
  v22 = [v21 array];
  [v12 generateCollectionByCoercingToItemClasses:v22 completionHandler:v8];

LABEL_21:
}

- (NSOrderedSet)contentItemClasses
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = [(ICContentMapping *)self definition];
  v5 = [v4 objectForKey:@"ItemClasses"];

  uint64_t v6 = [(ICContentMapping *)self definition];
  id v7 = [v6 objectForKey:@"ItemClass"];

  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          Class v13 = NSClassFromString(*(NSString **)(*((void *)&v19 + 1) + 8 * i));
          if (v13) {
            objc_msgSend(v3, "addObject:", v13, (void)v19);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
LABEL_15:

    id v16 = v3;
    goto LABEL_16;
  }
  if (v7)
  {
    v14 = [(ICContentMapping *)self definition];
    id v8 = [v14 objectForKey:@"ItemClass"];

    Class v15 = NSClassFromString((NSString *)v8);
    if (v15) {
      [v3 addObject:v15];
    }
    goto LABEL_15;
  }
  id v16 = [MEMORY[0x1E4F1CAA0] orderedSetWithObject:objc_opt_class()];
LABEL_16:
  id v17 = v16;

  return (NSOrderedSet *)v17;
}

- (BOOL)inputRequired
{
  id v3 = [(ICContentMapping *)self definition];
  v4 = [v3 objectForKey:@"InputRequired"];

  if (v4)
  {
    char v5 = [v4 BOOLValue];
  }
  else
  {
    uint64_t v6 = [(ICContentMapping *)self sourceType];
    char v5 = [v6 isEqualToString:@"Input"];
  }
  return v5;
}

- (BOOL)supportsMultipleItems
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"MultipleItems"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)parameterDefault
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"ParameterDefault"];

  return v3;
}

- (WFParameterDefinition)parameterUI
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"ParameterUI"];

  return (WFParameterDefinition *)v3;
}

- (BOOL)skipURLEncoding
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"SkipURLEncoding"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSDictionary)valueMapping
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"ValueMapping"];

  return (NSDictionary *)v3;
}

- (NSString)destinationKey
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"DestinationKey"];

  return (NSString *)v3;
}

- (NSString)sourceKey
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"SourceKey"];

  return (NSString *)v3;
}

- (NSString)destinationType
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"DestinationType"];

  return (NSString *)v3;
}

- (NSString)sourceType
{
  v2 = [(ICContentMapping *)self definition];
  id v3 = [v2 objectForKey:@"SourceType"];

  return (NSString *)v3;
}

- (ICContentMapping)initWithDefinition:(id)a3
{
  id v4 = a3;
  char v5 = [v4 objectForKey:@"ContentMappingClass"];
  uint64_t v6 = v5;
  if ((!v5 || NSClassFromString(v5)) && (self = [(ICContentMapping *)self init]) != 0)
  {
    id v7 = (NSDictionary *)[v4 copy];
    definition = self->_definition;
    self->_definition = v7;

    self = self;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end