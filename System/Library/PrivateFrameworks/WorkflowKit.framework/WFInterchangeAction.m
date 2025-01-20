@interface WFInterchangeAction
- (BOOL)appResourceRequiresAppInstall;
- (BOOL)callbackIsCurrentlyDisabled;
- (BOOL)inputPassthrough;
- (BOOL)inputRequired;
- (BOOL)inputsMultipleItems;
- (BOOL)isDiscontinued;
- (BOOL)mappedValueIsTrue:(id)a3 forContentMapping:(id)a4;
- (BOOL)neverSuggested;
- (BOOL)outputsMultipleItems;
- (BOOL)requiresCallback;
- (BOOL)shouldSuppressCallback;
- (BOOL)skipsProcessingHiddenParameters;
- (BOOL)visibleForUse:(int64_t)a3;
- (ICAction)interchangeAction;
- (NSArray)contentClasses;
- (WFInterchangeAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5;
- (WFInterchangeAction)initWithInterchangeAction:(id)a3 identifier:(id)a4 definition:(id)a5 serializedParameters:(id)a6;
- (id)app;
- (id)appDescriptor;
- (id)appDescriptorFromICApp:(id)a3;
- (id)description;
- (id)descriptionDefinition;
- (id)disabledPlatformsForInterchangeActionWithIdentifier:(id)a3;
- (id)inputContentClasses;
- (id)inputParameterKey;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)outputContentClasses;
- (id)parameterSummary;
- (id)requiredResources;
- (id)specifiedInputContentClasses;
- (id)specifiedOutputContentClasses;
- (id)userInterfaceTypes;
- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setAppDescriptor:(id)a3;
- (void)setContentClasses:(id)a3;
@end

@implementation WFInterchangeAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClasses, 0);
  objc_storeStrong((id *)&self->_interchangeAction, 0);
  objc_storeStrong((id *)&self->_appDescriptor, 0);
}

- (void)setContentClasses:(id)a3
{
}

- (NSArray)contentClasses
{
  return self->_contentClasses;
}

- (ICAction)interchangeAction
{
  return self->_interchangeAction;
}

- (void)setAppDescriptor:(id)a3
{
}

- (id)disabledPlatformsForInterchangeActionWithIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (__CFString *)v5;
    if (v7 == @"com.apple.iBooks.openin"
      || (v8 = v7,
          int v9 = [(__CFString *)v7 isEqualToString:@"com.apple.iBooks.openin"],
          v8,
          v9))
    {
      v13[0] = @"Watch";
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      goto LABEL_7;
    }
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFInterchangeAction.m", 412, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v10;
}

- (void)performActionWithInput:(id)a3 parameters:(id)a4 userInterface:(id)a5 successHandler:(id)a6 errorHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(WFInterchangeAction *)self interchangeAction];
  [v17 performActionWithInput:v16 parameters:v15 userInterface:v14 successHandler:v13 errorHandler:v12];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([(WFInterchangeAction *)self requiresCallback])
  {
    id v5 = [(WFAction *)self runningDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [(WFAction *)self runningDelegate];
      v8 = [(id)v7 currentRunningContextForAction:self];

      LOBYTE(v7) = [v8 isShortcutsApp];
      if ((v7 & 1) == 0)
      {
LABEL_4:
        int v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WFActionErrorDomain" code:2 userInfo:0];
        [(WFAction *)self finishRunningWithError:v9];
        goto LABEL_9;
      }
    }
    else
    {
      v10 = [MEMORY[0x1E4F5A7A0] sharedContext];
      v11 = [v10 applicationOrNil];

      if (!v11) {
        goto LABEL_4;
      }
    }
  }
  id v12 = [(WFAction *)self processedParameters];
  int v9 = (void *)[v12 mutableCopy];

  if ([(WFInterchangeAction *)self shouldSuppressCallback]) {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"DisableCallback"];
  }
  id v13 = [(WFAction *)self userInterface];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_1E6557640;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke_2;
  v14[3] = &unk_1E6557668;
  v14[4] = self;
  [(WFInterchangeAction *)self performActionWithInput:v4 parameters:v9 userInterface:v13 successHandler:v15 errorHandler:v14];

LABEL_9:
}

void __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v7 = v5;
  if (!a3)
  {
    char v6 = 0;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  char v6 = [MEMORY[0x1E4F28C58] userCancelledError];
  if (v7) {
LABEL_5:
  }
    [*(id *)(a1 + 32) setOutput:v7];
LABEL_6:
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

uint64_t __50__WFInterchangeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishRunningWithError:a2];
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 1;
}

- (BOOL)mappedValueIsTrue:(id)a3 forContentMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v5 stringValue];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;
  int v9 = [v6 valueMapping];
  uint64_t v10 = [v9 objectForKey:v8];
  v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v5;
  }
  id v13 = v12;

  if (objc_opt_respondsToSelector()) {
    char v14 = [v13 BOOLValue];
  }
  else {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)callbackIsCurrentlyDisabled
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(WFInterchangeAction *)self shouldSuppressCallback]) {
    return 1;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(WFInterchangeAction *)self interchangeAction];
  id v5 = [v4 inputMapping];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
LABEL_5:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
      v11 = [v10 destinationType];
      if (![v11 isEqualToString:@"DisableCallback"]) {
        goto LABEL_12;
      }
      id v12 = [v10 sourceType];
      int v13 = [v12 isEqualToString:@"Parameter"];

      if (v13) {
        break;
      }
LABEL_13:
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_15;
      }
    }
    char v14 = [(WFAction *)self processedParameters];

    if (v14)
    {
      v11 = [(WFAction *)self processedParameters];
      v19 = [v10 sourceKey];
      v20 = [v11 objectForKey:v19];
      BOOL v3 = [(WFInterchangeAction *)self mappedValueIsTrue:v20 forContentMapping:v10];

LABEL_18:
      goto LABEL_19;
    }
    id v15 = [v10 sourceKey];
    id v16 = [(WFAction *)self parameterStateForKey:v15];
    uint64_t v17 = objc_opt_class();
    v11 = WFEnforceClass(v16, v17);

    v18 = [v11 value];

    if (v18)
    {
      v19 = [v11 value];
      BOOL v3 = [(WFInterchangeAction *)self mappedValueIsTrue:v19 forContentMapping:v10];
      goto LABEL_18;
    }
LABEL_12:

    goto LABEL_13;
  }
LABEL_15:
  BOOL v3 = 0;
LABEL_19:

  return v3;
}

- (BOOL)shouldSuppressCallback
{
  BOOL v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  id v4 = [v3 provider];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [(WFAction *)self workflow];
  uint64_t v7 = [v6 actions];

  uint64_t v8 = [v7 indexOfObject:self];
  BOOL v9 = v8 == [v7 count] - 1;

  return v9;
}

- (BOOL)requiresCallback
{
  BOOL v3 = [(WFInterchangeAction *)self interchangeAction];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(WFInterchangeAction *)self interchangeAction];
    if ([v4 isCallbackAction]) {
      BOOL v5 = ![(WFInterchangeAction *)self callbackIsCurrentlyDisabled];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)neverSuggested
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 neverSuggested];

  return v3;
}

- (BOOL)outputsMultipleItems
{
  if ([(WFInterchangeAction *)self inputPassthrough])
  {
    return [(WFInterchangeAction *)self inputsMultipleItems];
  }
  else
  {
    id v4 = [(WFInterchangeAction *)self interchangeAction];
    char v5 = [v4 outputsMultipleItems];

    return v5;
  }
}

- (BOOL)inputsMultipleItems
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 inputsMultipleItems];

  return v3;
}

- (id)outputContentClasses
{
  char v3 = [(WFInterchangeAction *)self interchangeAction];
  id v4 = [v3 outputContentClasses];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(WFInterchangeAction *)self inputContentClasses];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)specifiedOutputContentClasses
{
  char v3 = [(WFInterchangeAction *)self interchangeAction];
  id v4 = [v3 outputContentClasses];

  if ([v4 count])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(WFInterchangeAction *)self specifiedInputContentClasses];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)inputContentClasses
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 344;
  contentClasses = self->_contentClasses;
  if (!contentClasses)
  {
    id v5 = [(WFInterchangeAction *)self interchangeAction];
    int v6 = [v5 skipItemClassesSupportingInput];

    if (v6)
    {
      uint64_t v7 = [(WFInterchangeAction *)self interchangeAction];
      uint64_t v8 = [v7 inputContentClasses];
      BOOL v9 = (NSArray *)[v8 copy];
      uint64_t v10 = self->_contentClasses;
      self->_contentClasses = v9;
    }
    else
    {
      uint64_t v29 = 344;
      uint64_t v7 = objc_opt_new();
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v11 = [(WFInterchangeAction *)self interchangeAction];
      id v12 = [v11 inputContentClasses];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v37;
        uint64_t v30 = *(void *)v37;
        v31 = v12;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v37 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            if (v17 == objc_opt_class()
              || v17 == objc_opt_class()
              || v17 == objc_opt_class()
              || v17 == objc_opt_class())
            {
              objc_msgSend(v7, "addObject:", v17, v29);
            }
            else
            {
              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              v18 = [v17 ownedTypes];
              uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v33;
                do
                {
                  for (uint64_t j = 0; j != v20; ++j)
                  {
                    if (*(void *)v33 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
                    long long v24 = objc_msgSend(MEMORY[0x1E4F5A858], "sharedRegistry", v29);
                    long long v25 = [v24 contentItemClassesSupportingType:v23];
                    [v7 unionSet:v25];
                  }
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v40 count:16];
                }
                while (v20);
              }

              uint64_t v15 = v30;
              id v12 = v31;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v41 count:16];
        }
        while (v14);
      }

      v26 = [v7 array];
      uint64_t v3 = v29;
      uint64_t v27 = *(Class *)((char *)&self->super.super.isa + v29);
      *(Class *)((char *)&self->super.super.isa + v29) = v26;
    }
    contentClasses = *(NSArray **)((char *)&self->super.super.isa + v3);
  }
  return contentClasses;
}

- (id)specifiedInputContentClasses
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  uint64_t v3 = [v2 inputContentClasses];

  return v3;
}

- (id)inputParameterKey
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  uint64_t v3 = [v2 inputParameterSourceKey];

  return v3;
}

- (BOOL)inputPassthrough
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  uint64_t v3 = [v2 outputContentClasses];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (BOOL)inputRequired
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 inputRequired];

  return v3;
}

- (id)app
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 app];

  return v3;
}

- (id)userInterfaceTypes
{
  v8[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(WFInterchangeAction *)self interchangeAction];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8[0] = *MEMORY[0x1E4F5AC00];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFInterchangeAction;
    id v5 = [(WFAction *)&v7 userInterfaceTypes];
  }
  return v5;
}

- (id)requiredResources
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char v3 = objc_opt_new();
  BOOL v4 = [(WFInterchangeAction *)self interchangeAction];
  id v5 = [v4 requiredResourceNames];

  int v6 = [(WFInterchangeAction *)self interchangeAction];
  objc_super v7 = [v6 definition];
  uint64_t v8 = [v7 objectForKey:@"RequiredResources"];

  BOOL v9 = v8;
  if (!v8)
  {
    if (v5)
    {
      uint64_t v29 = v5;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      obuint64_t j = v5;
      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (([v14 isEqualToString:@"WFAppInstalledResource"] & 1) == 0)
            {
              uint64_t v15 = v3;
              id v16 = objc_opt_new();
              [v16 setObject:v14 forKey:@"WFResourceClass"];
              uint64_t v17 = [(WFInterchangeAction *)self interchangeAction];
              v18 = [v17 app];
              uint64_t v19 = [v18 identifier];
              [v16 setObject:v19 forKey:@"AppIdentifier"];

              uint64_t v20 = [(WFInterchangeAction *)self interchangeAction];
              objc_opt_class();
              LOBYTE(v19) = objc_opt_isKindOfClass();

              if (v19)
              {
                uint64_t v21 = [(WFInterchangeAction *)self interchangeAction];
                long long v22 = [v21 scheme];
                uint64_t v23 = [v22 scheme];
                [v16 setObject:v23 forKey:@"UtilizedScheme"];
              }
              char v3 = v15;
              [v15 addObject:v16];
            }
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v11);
      }

      uint64_t v8 = 0;
      id v5 = v29;
    }
    long long v24 = [(WFInterchangeAction *)self interchangeAction];
    objc_opt_class();
    objc_opt_isKindOfClass();

    long long v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    [v3 addObject:v26];

    BOOL v9 = v3;
  }
  id v27 = v9;

  return v27;
}

- (BOOL)appResourceRequiresAppInstall
{
  return 1;
}

- (id)appDescriptor
{
  appDescriptor = self->_appDescriptor;
  if (!appDescriptor)
  {
    BOOL v4 = [(WFInterchangeAction *)self interchangeAction];
    id v5 = [v4 app];
    int v6 = [(WFInterchangeAction *)self appDescriptorFromICApp:v5];

    id v7 = objc_alloc(MEMORY[0x1E4F223C8]);
    uint64_t v8 = [(WFInterchangeAction *)self interchangeAction];
    BOOL v9 = [v8 app];
    uint64_t v10 = [v9 bundleIdentifier];
    uint64_t v11 = (void *)[v7 initWithBundleIdentifier:v10 allowPlaceholder:0 error:0];

    if (!v11) {
      goto LABEL_5;
    }
    uint64_t v12 = [MEMORY[0x1E4F302D0] sharedResolver];
    uint64_t v13 = [v12 resolvedAppMatchingDescriptor:v6];
    uint64_t v14 = self->_appDescriptor;
    self->_appDescriptor = v13;

    appDescriptor = self->_appDescriptor;
  }
  int v6 = appDescriptor;
LABEL_5:
  return v6;
}

- (id)appDescriptorFromICApp:(id)a3
{
  char v3 = (objc_class *)MEMORY[0x1E4F302A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  int v6 = [v4 localizedName];
  id v7 = [v4 bundleIdentifier];

  uint64_t v8 = (void *)[v5 initWithLocalizedName:v6 bundleIdentifier:v7 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:0 supportedIntents:0 bundleURL:0 documentTypes:0];
  return v8;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  if (a3) {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)WFInterchangeAction;
  if (!-[WFAction visibleForUse:](&v7, sel_visibleForUse_)) {
    return 0;
  }
  id v4 = [(WFInterchangeAction *)self interchangeAction];
  char v5 = [v4 isDiscoverable];

  return v5;
}

- (BOOL)isDiscontinued
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 isDiscontinued];

  return v3;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(WFInterchangeAction *)self interchangeAction];
  int v6 = [v5 keywords];

  if (v6)
  {
    objc_super v7 = [v4 localize:v6];
    uint64_t v8 = [v7 componentsSeparatedByString:@"|"];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)descriptionDefinition
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 descriptionDefinition];

  return v3;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(WFInterchangeAction *)self interchangeAction];
  int v6 = [v5 localizedSubcategoryWithContext:v4];

  return v6;
}

- (id)parameterSummary
{
  v2 = [(WFInterchangeAction *)self interchangeAction];
  char v3 = [v2 parameterSummaryDefinition];

  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  char v5 = [(WFInterchangeAction *)self interchangeAction];
  int v6 = [v5 localizedNameWithContext:v4];

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = WFLocalizedStringResourceWithKey(@"Unknown Action", @"Unknown Action");
    id v7 = [v4 localize:v8];
  }
  return v7;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFInterchangeAction;
  char v3 = [(WFAction *)&v7 description];
  id v4 = [(WFInterchangeAction *)self app];
  char v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (WFInterchangeAction)initWithInterchangeAction:(id)a3 identifier:(id)a4 definition:(id)a5 serializedParameters:(id)a6
{
  v47[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = (WFActionDefinition *)a5;
  id v14 = a6;
  if (!v11)
  {
    long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"WFInterchangeAction.m", 74, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  id v39 = v14;
  v40 = v12;
  if (!v13)
  {
    uint64_t v15 = [WFActionDefinition alloc];
    uint64_t v13 = [(WFActionDefinition *)v15 initWithDictionary:MEMORY[0x1E4F1CC08]];
  }
  v46[0] = @"AppDefinition";
  uint64_t v44 = *MEMORY[0x1E4FB4508];
  id v16 = [v11 app];
  uint64_t v17 = [v16 identifier];
  v45 = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
  v46[1] = @"ICActionIdentifier";
  v47[0] = v18;
  uint64_t v19 = [v11 identifier];
  v47[1] = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  uint64_t v21 = [(WFActionDefinition *)v13 definitionByAddingEntriesInDictionary:v20];

  long long v22 = [v21 objectForKey:@"Parameters"];

  if (v22)
  {
    uint64_t v23 = v39;
  }
  else
  {
    long long v24 = [v11 inputMapping];
    long long v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sourceType = %@", @"Parameter"];
    v26 = [v24 filteredArrayUsingPredicate:v25];

    if ([v26 count])
    {
      id v27 = objc_msgSend(v26, "if_compactMap:", &__block_literal_global_65544);
      uint64_t v42 = @"Parameters";
      v43 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      uint64_t v29 = [v21 definitionByAddingEntriesInDictionary:v28];

      uint64_t v21 = (void *)v29;
    }
    uint64_t v23 = v39;
  }
  uint64_t v30 = [v11 identifier];
  long long v31 = [(WFInterchangeAction *)self disabledPlatformsForInterchangeActionWithIdentifier:v30];

  long long v32 = WFInjectDisabledPlatformsInActionDefinition(v31, v21);

  v41.receiver = self;
  v41.super_class = (Class)WFInterchangeAction;
  long long v33 = [(WFAction *)&v41 initWithIdentifier:v40 definition:v32 serializedParameters:v23];
  long long v34 = v33;
  if (v33)
  {
    objc_storeStrong((id *)&v33->_interchangeAction, a3);
    long long v35 = v34;
  }

  return v34;
}

id __92__WFInterchangeAction_initWithInterchangeAction_identifier_definition_serializedParameters___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  char v3 = [v2 parameterUI];
  id v14 = @"Key";
  id v4 = [v2 sourceKey];
  v15[0] = v4;
  char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  int v6 = [v3 definitionByAddingEntriesInDictionary:v5];

  objc_super v7 = [v2 parameterDefault];

  if (v7)
  {
    id v12 = @"DefaultValue";
    uint64_t v8 = [v2 parameterDefault];
    uint64_t v13 = v8;
    BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v10 = [v6 definitionByAddingEntriesInDictionary:v9];

    int v6 = (void *)v10;
  }

  return v6;
}

- (WFInterchangeAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v7 = a4;
  id v51 = a5;
  uint64_t v8 = [v7 objectForKey:@"AppDefinition"];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = WFEnforceClass(v8, v9);

  v50 = v10;
  id v11 = [v10 objectForKey:*MEMORY[0x1E4FB4508]];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = WFEnforceClass(v11, v12);

  v52 = v7;
  id v14 = [v7 objectForKey:@"ICActionIdentifier"];
  uint64_t v15 = objc_opt_class();
  id v16 = WFEnforceClass(v14, v15);

  if (v13) {
    BOOL v17 = v16 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    id v45 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Interchange actions created from the bundled action must include an app identifier and Interchange action identifier" userInfo:0];
    objc_exception_throw(v45);
  }
  v18 = +[ICAppRegistry sharedRegistry];
  v49 = (void *)v13;
  uint64_t v19 = [v18 appWithIdentifier:v13];

  id v20 = v19;
  id v21 = v16;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v22 = [v20 schemes];
  uint64_t v47 = [v22 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v47)
  {
    uint64_t v23 = *(void *)v64;
    id v48 = v20;
    uint64_t v46 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v64 != v23) {
          objc_enumerationMutation(v22);
        }
        long long v25 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        v26 = [v25 actions];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v60;
          while (2)
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v60 != v29) {
                objc_enumerationMutation(v26);
              }
              long long v31 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              long long v32 = [v31 identifier];
              char v33 = [v32 isEqualToString:v21];

              if (v33)
              {
                id v41 = v31;

                id v20 = v48;
                goto LABEL_31;
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v68 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        id v20 = v48;
        uint64_t v23 = v46;
      }
      uint64_t v47 = [v22 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v47);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v22 = [v20 documentActions];
  uint64_t v34 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v56;
    while (2)
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v56 != v36) {
          objc_enumerationMutation(v22);
        }
        long long v38 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        id v39 = [v38 identifier];
        char v40 = [v39 isEqualToString:v21];

        if (v40)
        {
          id v41 = v38;
          goto LABEL_31;
        }
      }
      uint64_t v35 = [v22 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v35) {
        continue;
      }
      break;
    }
  }
  id v41 = 0;
LABEL_31:

  uint64_t v42 = self;
  if (v41)
  {
    uint64_t v42 = [(WFInterchangeAction *)self initWithInterchangeAction:v41 identifier:v54 definition:v52 serializedParameters:v51];
    v43 = v42;
  }
  else
  {
    v43 = 0;
  }

  return v43;
}

@end