@interface ICAction
- (BOOL)createsWFAction;
- (BOOL)inputRequired;
- (BOOL)inputsMultipleItems;
- (BOOL)isDiscontinued;
- (BOOL)isDiscoverable;
- (BOOL)isEqual:(id)a3;
- (BOOL)neverSuggested;
- (BOOL)outputsMultipleItems;
- (BOOL)skipItemClassesSupportingInput;
- (ICAction)initWithDefinition:(id)a3 app:(id)a4;
- (ICApp)app;
- (NSArray)capabilities;
- (NSArray)inputContentClasses;
- (NSArray)inputMapping;
- (NSArray)outputContentClasses;
- (NSArray)outputMapping;
- (NSArray)requiredResourceNames;
- (NSDate)creationDate;
- (NSDate)lastModifiedDate;
- (NSDictionary)definition;
- (NSString)category;
- (NSString)identifier;
- (NSString)inputParameterSourceKey;
- (NSString)wfActionClassName;
- (WFActionDescriptionDefinition)descriptionDefinition;
- (WFActionParameterSummary)parameterSummaryDefinition;
- (_NSLocalizedStringResource)keywords;
- (id)description;
- (id)localizedNameWithContext:(id)a3;
- (id)localizedSubcategoryWithContext:(id)a3;
- (unint64_t)hash;
- (void)processInput:(id)a3 parameters:(id)a4 completionHandler:(id)a5;
@end

@implementation ICAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputMapping, 0);
  objc_storeStrong((id *)&self->_inputMapping, 0);
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_outputContentClasses, 0);
  objc_storeStrong((id *)&self->_inputContentClasses, 0);
}

- (NSArray)outputMapping
{
  return self->_outputMapping;
}

- (NSArray)inputMapping
{
  return self->_inputMapping;
}

- (ICApp)app
{
  return self->_app;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void)processInput:(id)a3 parameters:(id)a4 completionHandler:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v33 = a4;
  id v31 = a5;
  v8 = dispatch_group_create();
  v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v10 = objc_opt_new();
  v11 = objc_opt_new();
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  v12 = [v33 objectForKey:@"DisableCallback"];
  char v13 = [v12 BOOLValue];

  char v62 = v13;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__41318;
  v59[4] = __Block_byref_object_dispose__41319;
  id v60 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6553298;
  id v28 = v11;
  id v54 = v28;
  v57 = v59;
  id v30 = v9;
  id v55 = v30;
  id v29 = v10;
  id v56 = v29;
  v58 = v61;
  v14 = _Block_copy(aBlock);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__41318;
  v51[4] = __Block_byref_object_dispose__41319;
  id v52 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v15 = [(ICAction *)self inputMapping];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "destinationType", v28);
        int v21 = [v20 isEqualToString:@"Clipboard"];
        dispatch_group_enter(v8);
        if (v21)
        {
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_2;
          v44[3] = &unk_1E65532F0;
          v46[0] = v14;
          v44[4] = v19;
          v45 = v8;
          v46[1] = v51;
          [v19 getContentCollection:v44 withInput:v32 parameters:v33];
          v22 = (id *)&v45;
          v23 = (id *)v46;
        }
        else
        {
          v41[0] = MEMORY[0x1E4F143A8];
          v41[1] = 3221225472;
          v41[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_5;
          v41[3] = &unk_1E6553318;
          id v43 = v14;
          v41[4] = v19;
          v42 = v8;
          [v19 getStringRepresentation:v41 withInput:v32 parameters:v33];
          v22 = (id *)&v42;
          v23 = &v43;
        }
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
    }
    while (v16);
  }

  v24 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_6;
  block[3] = &unk_1E6553340;
  id v37 = v31;
  v38 = v51;
  id v35 = v30;
  id v36 = v29;
  v39 = v59;
  v40 = v61;
  id v25 = v29;
  id v26 = v30;
  id v27 = v31;
  dispatch_group_notify(v8, v24, block);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v59, 8);

  _Block_object_dispose(v61, 8);
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v32 = a2;
  id v9 = a3;
  id v10 = a5;
  v11 = *(void **)(a1 + 32);
  id v12 = a4;
  [v11 lock];
  if (v10) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a5);
  }
  char v13 = [v9 valueMapping];
  uint64_t v14 = [v13 objectForKey:v12];
  v15 = (void *)v14;
  if (v14) {
    uint64_t v16 = (void *)v14;
  }
  else {
    uint64_t v16 = v12;
  }
  uint64_t v17 = v16;

  v18 = [v9 destinationType];
  if ([v18 isEqualToString:@"URLSubstitution"])
  {
    if (([v9 skipURLEncoding] & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      v20 = (void *)[v19 mutableCopy];

      [v20 removeCharactersInString:@"?&="];
      uint64_t v21 = [(__CFString *)v17 stringByAddingPercentEncodingWithAllowedCharacters:v20];

      uint64_t v17 = (__CFString *)v21;
    }
    id v22 = v32;
    v23 = *(void **)(a1 + 40);
    if (v17) {
      v24 = v17;
    }
    else {
      v24 = &stru_1F229A4D8;
    }
    goto LABEL_12;
  }
  if ([v18 isEqualToString:@"URLQueryValue"])
  {
    uint64_t v25 = [(__CFString *)v17 length];
    if (v13) {
      BOOL v26 = v15 == 0;
    }
    else {
      BOOL v26 = 0;
    }
    int v27 = !v26;
    if (!v25 || !v27) {
      goto LABEL_27;
    }
    id v28 = *(void **)(a1 + 48);
    id v29 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    id v30 = [v32 stringByAddingPercentEncodingWithAllowedCharacters:v29];
    [v28 setObject:v17 forKey:v30];

LABEL_26:
    goto LABEL_27;
  }
  if ([v18 isEqualToString:@"URLQueryFlag"])
  {
    if (![(__CFString *)v17 BOOLValue]) {
      goto LABEL_27;
    }
    id v31 = *(void **)(a1 + 48);
    id v29 = [MEMORY[0x1E4F1CA98] null];
    [v31 setObject:v29 forKey:v32];
    goto LABEL_26;
  }
  if ([v18 isEqualToString:@"DisableCallback"])
  {
    if ([(__CFString *)v17 BOOLValue]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
  }
  else if ([v18 isEqualToString:@"ExtensionItemUserInfo"])
  {
    v23 = *(void **)(a1 + 48);
    if (v17) {
      v24 = v17;
    }
    else {
      v24 = &stru_1F229A4D8;
    }
    id v22 = v32;
LABEL_12:
    [v23 setObject:v24 forKey:v22];
  }
LABEL_27:
  [*(id *)(a1 + 32) unlock];
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    v11 = [*(id *)(a1 + 32) destinationKey];
    id v12 = *(void **)(a1 + 32);
    if ([v12 inputRequired]) {
      id v13 = v9;
    }
    else {
      id v13 = 0;
    }
    (*(void (**)(uint64_t, void *, void *, void, id))(v10 + 16))(v10, v11, v12, 0, v13);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    if (!v7) {
      id v7 = (id)objc_opt_new();
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_3;
    block[3] = &unk_1E6558270;
    uint64_t v17 = *(void *)(a1 + 56);
    id v7 = v7;
    id v15 = v7;
    id v16 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_5(void *a1, void *a2, void *a3)
{
  uint64_t v5 = a1[6];
  v6 = (void *)a1[4];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 destinationKey];
  (*(void (**)(uint64_t, void *, void, id, id))(v5 + 16))(v5, v9, a1[4], v8, v7);

  uint64_t v10 = a1[5];
  dispatch_group_leave(v10);
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_6(uint64_t a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_7;
  aBlock[3] = &unk_1E6558B78;
  void aBlock[4] = *(void *)(a1 + 56);
  v2 = _Block_copy(aBlock);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_8;
    aBlock[3] = &unk_1E6558B78;
    void aBlock[4] = v1;
    v2 = (void (**)(void))_Block_copy(aBlock);
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v2[2](v2);
    }
    else {
      dispatch_sync(MEMORY[0x1E4F14428], v2);
    }
  }
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_8(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [(objc_class *)getUIPasteboardClass_41322() generalPasteboard];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4 = getUIPasteboardOptionLocalOnly();
  v6 = v4;
  v7[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v2 setItems:v3 options:v5];
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_3(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)getUIPasteboardClass_41322() generalPasteboard];
  uint64_t v3 = v2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v4 = [v2 items];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = getUIPasteboardOptionLocalOnly();
  id v12 = v7;
  v13[0] = MEMORY[0x1E4F1CC38];
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__ICAction_processInput_parameters_completionHandler___block_invoke_4;
  v10[3] = &unk_1E65532C8;
  id v9 = *(void **)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  [v9 copyToPasteboard:v3 options:v8 completionHandler:v10];
}

void __54__ICAction_processInput_parameters_completionHandler___block_invoke_4(uint64_t a1)
{
}

- (id)description
{
  uint64_t v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)ICAction;
  uint64_t v4 = [(ICAction *)&v11 description];
  uint64_t v5 = [MEMORY[0x1E4FB47E8] defaultContext];
  v6 = [(ICAction *)self localizedNameWithContext:v5];
  id v7 = [(ICAction *)self app];
  id v8 = [v7 localizedName];
  id v9 = [v3 stringWithFormat:@"%@: %@ from %@", v4, v6, v8];

  return v9;
}

- (unint64_t)hash
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICAction *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ICAction *)self definition];
      v6 = [(ICAction *)v4 definition];
      if ([v5 isEqual:v6])
      {
        id v7 = [(ICAction *)self app];
        id v8 = [(ICAction *)v4 app];
        char v9 = [v7 isEqual:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (NSArray)requiredResourceNames
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 objectForKey:@"RequiredResourceNames"];

  return (NSArray *)v3;
}

- (NSString)wfActionClassName
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 objectForKey:@"WFActionClass"];

  return (NSString *)v3;
}

- (BOOL)createsWFAction
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 objectForKey:@"CreatesWFAction"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)skipItemClassesSupportingInput
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 objectForKey:@"SkipItemClassesSupportingInput"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSArray)outputContentClasses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  outputContentClasses = self->_outputContentClasses;
  if (!outputContentClasses)
  {
    char v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(ICAction *)self outputMapping];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_super v11 = [v10 destinationType];
          int v12 = [v11 isEqualToString:@"Output"];

          if (v12)
          {
            id v13 = [v10 contentItemClasses];
            [v4 unionOrderedSet:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    uint64_t v14 = [v4 array];
    id v15 = self->_outputContentClasses;
    self->_outputContentClasses = v14;

    outputContentClasses = self->_outputContentClasses;
  }
  return outputContentClasses;
}

- (NSArray)inputContentClasses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  inputContentClasses = self->_inputContentClasses;
  if (!inputContentClasses)
  {
    char v4 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(ICAction *)self inputMapping];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_super v11 = [v10 sourceType];
          int v12 = [v11 isEqualToString:@"Input"];

          if (v12)
          {
            id v13 = [v10 contentItemClasses];
            [v4 unionOrderedSet:v13];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    uint64_t v14 = [v4 array];
    id v15 = self->_inputContentClasses;
    self->_inputContentClasses = v14;

    inputContentClasses = self->_inputContentClasses;
  }
  return inputContentClasses;
}

- (BOOL)neverSuggested
{
  v2 = [(ICAction *)self definition];
  unint64_t v3 = [v2 objectForKey:@"SuggestedNever"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)outputsMultipleItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(ICAction *)self outputMapping];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = [v8 sourceType];
        int v10 = [v9 isEqualToString:@"Output"];

        if (v10) {
          v5 |= [v8 supportsMultipleItems];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)inputsMultipleItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(ICAction *)self inputMapping];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = [v8 sourceType];
        int v10 = [v9 isEqualToString:@"Input"];

        if (v10) {
          v5 |= [v8 supportsMultipleItems];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)inputRequired
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(ICAction *)self inputMapping];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        char v9 = [v8 sourceType];
        int v10 = [v9 isEqualToString:@"Input"];

        if (v10) {
          v5 |= [v8 inputRequired];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (WFActionDescriptionDefinition)descriptionDefinition
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Description"];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    uint64_t v4 = [WFActionDescriptionDefinition alloc];
    uint64_t v3 = [(WFActionDescriptionDefinition *)v4 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  return v3;
}

- (BOOL)isDiscoverable
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Discoverable"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)isDiscontinued
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Discontinued"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSDate)lastModifiedDate
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"LastModifiedDate"];

  return (NSDate *)v3;
}

- (NSDate)creationDate
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"CreationDate"];

  return (NSDate *)v3;
}

- (_NSLocalizedStringResource)keywords
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"ActionKeywords"];

  return (_NSLocalizedStringResource *)v3;
}

- (id)localizedSubcategoryWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(ICAction *)self definition];
  uint64_t v6 = [v5 objectForKey:@"Subcategory"];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSString)category
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Category"];

  return (NSString *)v3;
}

- (NSString)identifier
{
  uint64_t v3 = [(ICAction *)self definition];
  id v4 = [v3 objectForKey:@"Identifier"];

  if (v4)
  {
    int v5 = NSString;
    uint64_t v6 = [(ICAction *)self app];
    uint64_t v7 = [v6 identifier];
    uint64_t v8 = [v5 stringWithFormat:@"%@.%@", v7, v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return (NSString *)v8;
}

- (NSString)inputParameterSourceKey
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"InputMapping"];

  id v4 = [v3 objectMatchingKey:@"SourceType" value:@"Input"];
  int v5 = [v4 objectForKey:@"SourceKey"];

  return (NSString *)v5;
}

- (WFActionParameterSummary)parameterSummaryDefinition
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"ParameterSummary"];

  return (WFActionParameterSummary *)v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(ICAction *)self definition];
  uint64_t v6 = [v5 objectForKey:@"Name"];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)capabilities
{
  v2 = [(ICAction *)self definition];
  uint64_t v3 = [v2 objectForKey:@"Capabilities"];

  return (NSArray *)v3;
}

- (ICAction)initWithDefinition:(id)a3 app:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKey:@"ActionClass"];
  char v9 = v8;
  if (v8 && !NSClassFromString(v8))
  {
    v23 = 0;
  }
  else
  {
    obuint64_t j = a4;
    v44 = v9;
    id v45 = v7;
    int v10 = [v6 objectForKey:@"InputMapping"];
    unint64_t v11 = 0x1E4F1C000uLL;
    long long v47 = self;
    id v48 = v6;
    v46 = v10;
    if ([v10 count])
    {
      long long v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v54;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v54 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            long long v19 = [v18 objectForKey:@"ContentMappingClass"];
            long long v20 = NSClassFromString(v19);
            if (!v20) {
              long long v20 = (objc_class *)objc_opt_class();
            }

            uint64_t v21 = [[v20 alloc] initWithDefinition:v18];
            if (!v21)
            {
              v23 = 0;
              self = v47;
              id v6 = v48;
              int v10 = v46;
              goto LABEL_36;
            }
            uint64_t v22 = (void *)v21;
            [v12 addObject:v21];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      self = v47;
      id v6 = v48;
      int v10 = v46;
      unint64_t v11 = 0x1E4F1C000;
    }
    else
    {
      long long v12 = 0;
    }
    v24 = [v6 objectForKey:@"OutputMapping"];
    if ([v24 count])
    {
      id v13 = (id)objc_msgSend(objc_alloc(*(Class *)(v11 + 2632)), "initWithCapacity:", objc_msgSend(v24, "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v42 = v24;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v50;
        while (2)
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v50 != v28) {
              objc_enumerationMutation(v25);
            }
            id v30 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            id v31 = [v30 objectForKey:@"ContentMappingClass"];
            id v32 = NSClassFromString(v31);
            if (!v32) {
              id v32 = (objc_class *)objc_opt_class();
            }

            uint64_t v33 = [[v32 alloc] initWithDefinition:v30];
            if (!v33)
            {

              v23 = 0;
              self = v47;
              id v6 = v48;
              int v10 = v46;
              v24 = v42;
              goto LABEL_35;
            }
            v34 = (void *)v33;
            [v13 addObject:v33];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v49 objects:v57 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      self = v47;
      id v6 = v48;
      int v10 = v46;
      v24 = v42;
    }
    else
    {
      id v13 = 0;
    }
    v23 = [(ICAction *)self init];
    if (v23)
    {
      uint64_t v35 = [v6 copy];
      definition = v23->_definition;
      v23->_definition = (NSDictionary *)v35;

      objc_storeStrong((id *)&v23->_app, obj);
      uint64_t v37 = [v12 copy];
      inputMapping = v23->_inputMapping;
      v23->_inputMapping = (NSArray *)v37;

      uint64_t v39 = [v13 copy];
      outputMapping = v23->_outputMapping;
      v23->_outputMapping = (NSArray *)v39;

      self = v23;
      v23 = self;
    }
    else
    {
      self = 0;
    }
LABEL_35:

LABEL_36:
    char v9 = v44;
    id v7 = v45;
  }

  return v23;
}

@end