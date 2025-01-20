@interface WFHandleSystemIntentAction
+ (id)sharedEnumerator;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (BOOL)shouldBeIncludedInAppsList;
- (INIntentDescriptor)intentDescriptor;
- (NSSet)launchableIdentifiers;
- (NSSet)supportedIdentifiers;
- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 intentDescription:(id)a6 stringLocalizer:(id)a7;
- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6;
- (id)accessoryIcon;
- (id)actionForAppIdentifier:(id)a3;
- (id)copyWithSerializedParameters:(id)a3;
- (id)customAppNameForBundleIdentifier:(id)a3;
- (id)customImageForBundleIdentifier:(id)a3;
- (id)displayableAppDescriptor;
- (id)displayableAppIdentifier;
- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6;
- (id)intentClassName;
- (id)intentDescription;
- (id)intentDescriptorFromParameterState;
- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4;
- (id)launchableAppIdentifier;
- (id)launchableAppIdentifiers;
- (id)localizedAppName;
- (id)localizedNameWithContext:(id)a3;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)selectedAppNotSupportedError;
- (id)slots;
- (id)supportedAppIdentifiers;
- (int)token;
- (int64_t)intentCategory;
- (void)dealloc;
- (void)initializeParameters;
- (void)selectedAppDidChange;
- (void)setIntentDescriptor:(id)a3;
@end

@implementation WFHandleSystemIntentAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchableIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentDescriptor, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
}

- (NSSet)launchableIdentifiers
{
  return self->_launchableIdentifiers;
}

- (int)token
{
  return self->_token;
}

- (void)setIntentDescriptor:(id)a3
{
}

- (id)intentDescription
{
  return self->_intentDescription;
}

- (id)enumeration:(id)a3 accessoryImageForPossibleState:(id)a4
{
  v5 = objc_msgSend(a4, "value", a3);
  v6 = [v5 bundleIdentifier];

  v7 = [(WFHandleSystemIntentAction *)self customImageForBundleIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB4770] applicationIconImageForBundleIdentifier:v6 format:0];
  }
  v10 = v9;

  return v10;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v5 = a4;
  v6 = [v5 value];
  v7 = [v6 bundleIdentifier];
  v8 = [(WFHandleSystemIntentAction *)self customAppNameForBundleIdentifier:v7];

  if (v8)
  {
    id v9 = v8;
  }
  else
  {
    v10 = [v5 value];
    id v9 = [v10 localizedName];
  }
  return v9;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v4 = [(WFHandleSystemIntentAction *)self intentClassName];
  id v5 = [(WFHandleSystemIntentAction *)self supportedIdentifiers];
  v6 = (void *)MEMORY[0x1E4F29008];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke;
  v16[3] = &unk_1E654FE60;
  id v7 = v4;
  id v17 = v7;
  v8 = [v6 sortDescriptorWithKey:@"self" ascending:1 comparator:v16];
  v18[0] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v10 = [v5 sortedArrayUsingDescriptors:v9];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke_2;
  v14[3] = &unk_1E654FE88;
  id v15 = v7;
  id v11 = v7;
  v12 = objc_msgSend(v10, "if_map:", v14);

  return v12;
}

uint64_t __59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F304E0];
  id v6 = a3;
  id v7 = a2;
  v8 = (void *)[[v5 alloc] initWithIntentClassName:*(void *)(a1 + 32) launchableAppBundleId:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F304E0]) initWithIntentClassName:*(void *)(a1 + 32) launchableAppBundleId:v6];
  v10 = [MEMORY[0x1E4F302D0] sharedResolver];
  id v11 = [v10 resolvedIntentMatchingDescriptor:v8];

  v12 = [MEMORY[0x1E4F302D0] sharedResolver];
  v13 = [v12 resolvedIntentMatchingDescriptor:v9];

  v14 = [v11 localizedName];
  id v15 = [v13 localizedName];
  uint64_t v16 = [v14 localizedStandardCompare:v15];

  return v16;
}

WFIntentDescriptorParameterState *__59__WFHandleSystemIntentAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F304E0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithIntentClassName:*(void *)(a1 + 32) launchableAppBundleId:v4];

  id v6 = [MEMORY[0x1E4F302D0] sharedResolver];
  id v7 = [v6 resolvedIntentMatchingDescriptor:v5];

  v8 = [(WFVariableSubstitutableParameterState *)[WFIntentDescriptorParameterState alloc] initWithValue:v7];
  return v8;
}

- (id)actionForAppIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(WFHandleSystemIntentAction *)self supportedIdentifiers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v10 = [(WFHandleSystemIntentAction *)self intentClassName];
        id v11 = [(WFHandleSystemIntentAction *)self intentDescriptorWithIntentClassName:v10 launchableBundleId:v9];

        v12 = [MEMORY[0x1E4F302D0] sharedResolver];
        v13 = [v12 resolvedIntentMatchingDescriptor:v11];

        v14 = [v13 displayableBundleIdentifier];
        char v15 = [v14 isEqualToString:v4];

        if (v15)
        {
          id v17 = [v13 appDescriptor];
          v18 = [(WFVariableSubstitutableParameterState *)[WFAppDescriptorParameterState alloc] initWithValue:v17];
          v28 = @"IntentAppDefinition";
          v19 = [(WFVariableSubstitutableParameterState *)v18 serializedRepresentation];
          v29 = v19;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v16 = [(WFHandleSystemIntentAction *)self copyWithSerializedParameters:v20];

          objc_storeStrong(v16 + 50, self->_supportedAppIdentifiers);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v23.receiver = self;
  v23.super_class = (Class)WFHandleSystemIntentAction;
  uint64_t v16 = [(WFAction *)&v23 actionForAppIdentifier:v4];
LABEL_11:

  return v16;
}

- (BOOL)shouldBeIncludedInAppsList
{
  v3 = [(WFHandleSystemIntentAction *)self supportedAppIdentifiers];
  if ([v3 count]) {
    BOOL v4 = ![(WFAction *)self isDiscontinued];
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)launchableAppIdentifiers
{
  launchableIdentifiers = self->_launchableIdentifiers;
  if (!launchableIdentifiers)
  {
    BOOL v4 = [(WFHandleSystemIntentAction *)self supportedIdentifiers];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__WFHandleSystemIntentAction_launchableAppIdentifiers__block_invoke;
    v8[3] = &unk_1E654FE10;
    v8[4] = self;
    objc_msgSend(v4, "if_compactMap:", v8);
    uint64_t v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_launchableIdentifiers;
    self->_launchableIdentifiers = v5;

    launchableIdentifiers = self->_launchableIdentifiers;
  }
  return launchableIdentifiers;
}

id __54__WFHandleSystemIntentAction_launchableAppIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F304E0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) intentClassName];
  uint64_t v7 = (void *)[v5 initWithIntentClassName:v6 launchableAppBundleId:v4];

  v8 = [MEMORY[0x1E4F302D0] sharedResolver];
  uint64_t v9 = [v8 resolvedIntentMatchingDescriptor:v7];

  v10 = [v9 bundleIdentifier];

  return v10;
}

- (id)supportedAppIdentifiers
{
  supportedAppIdentifiers = self->_supportedAppIdentifiers;
  if (!supportedAppIdentifiers)
  {
    id v4 = [(WFHandleSystemIntentAction *)self supportedIdentifiers];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__WFHandleSystemIntentAction_supportedAppIdentifiers__block_invoke;
    v9[3] = &unk_1E654FE10;
    v9[4] = self;
    id v5 = objc_msgSend(v4, "if_compactMap:", v9);
    uint64_t v6 = [v5 allObjects];
    uint64_t v7 = self->_supportedAppIdentifiers;
    self->_supportedAppIdentifiers = v6;

    supportedAppIdentifiers = self->_supportedAppIdentifiers;
  }
  return supportedAppIdentifiers;
}

id __53__WFHandleSystemIntentAction_supportedAppIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F304E0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) intentClassName];
  uint64_t v7 = (void *)[v5 initWithIntentClassName:v6 launchableAppBundleId:v4];

  v8 = [MEMORY[0x1E4F302D0] sharedResolver];
  uint64_t v9 = [v8 resolvedIntentMatchingDescriptor:v7];

  v10 = [v9 displayableBundleIdentifier];

  return v10;
}

- (NSSet)supportedIdentifiers
{
  if (!self->_supportedIdentifiers)
  {
    v3 = +[WFHandleSystemIntentAction sharedEnumerator];
    id v4 = [(WFHandleSystemIntentAction *)self intentClassName];
    id v5 = [v3 supportedIdentifiersForIntentClassName:v4 includingUserActivityBasedApps:1];
    uint64_t v6 = [v5 set];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke;
    v22[3] = &unk_1E654FE10;
    v22[4] = self;
    objc_msgSend(v6, "if_compactMap:", v22);
    uint64_t v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    supportedIdentifiers = self->_supportedIdentifiers;
    self->_supportedIdentifiers = v7;
  }
  uint64_t v9 = [(WFAction *)self appDefinition];
  v10 = [v9 objectForKey:*MEMORY[0x1E4FB4500]];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v10];
  v12 = [MEMORY[0x1E4F302D0] sharedResolver];
  v13 = [v12 resolvedAppMatchingDescriptor:v11];

  v14 = [v13 bundleIdentifier];

  char v15 = [(WFAction *)self processedParameters];

  if (v15)
  {
    uint64_t v16 = [(WFAction *)self parameterForKey:@"IntentAppDefinition"];
    if ([v16 isHidden] && v14)
    {
      id v17 = self->_supportedIdentifiers;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke_2;
      v20[3] = &unk_1E654FE38;
      v20[4] = self;
      id v21 = v14;
      v18 = [(NSSet *)v17 if_compactMap:v20];

      goto LABEL_9;
    }
  }
  v18 = self->_supportedIdentifiers;
LABEL_9:

  return v18;
}

id __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F304E0]);
  id v5 = [*(id *)(a1 + 32) intentClassName];
  uint64_t v6 = (void *)[v4 initWithIntentClassName:v5 launchableAppBundleId:v3];

  uint64_t v7 = [MEMORY[0x1E4F302D0] sharedResolver];
  v8 = [v7 resolvedIntentMatchingDescriptor:v6];

  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v10 = [v8 bundleIdentifier];

  if (v10)
  {
    id v11 = [v8 bundleIdentifier];
    [v9 addObject:v11];
  }
  v12 = [v8 displayableBundleIdentifier];

  if (v12)
  {
    v13 = [v8 displayableBundleIdentifier];
    [v9 addObject:v13];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v9;
  id v15 = (id)[v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v19 = objc_alloc(MEMORY[0x1E4F223C8]);
        id v23 = 0;
        v20 = (void *)[v19 initWithBundleIdentifier:v18 allowPlaceholder:0 error:&v23];
        id v21 = v23;
        if (v20 && (objc_msgSend(v20, "wf_isAvailableInContext:", 0) & 1) != 0)
        {
          id v15 = v3;

          goto LABEL_16;
        }
      }
      id v15 = (id)[v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v15;
}

id __50__WFHandleSystemIntentAction_supportedIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F304E0];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(a1 + 32) intentClassName];
  uint64_t v7 = (void *)[v5 initWithIntentClassName:v6 launchableAppBundleId:v4];

  v8 = [MEMORY[0x1E4F302D0] sharedResolver];
  uint64_t v9 = [v8 resolvedIntentMatchingDescriptor:v7];

  v10 = [v9 displayableBundleIdentifier];
  if ([v10 isEqualToString:*(void *)(a1 + 40)]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (id)intentDescriptorFromParameterState
{
  v2 = [(WFAction *)self serializedParameterStateForKey:@"IntentAppDefinition"];
  id v3 = [(WFVariableSubstitutableParameterState *)[WFIntentDescriptorParameterState alloc] initWithSerializedRepresentation:v2 variableProvider:0 parameter:0];
  id v4 = v3;
  if (v3)
  {
    id v5 = [(WFVariableSubstitutableParameterState *)v3 value];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)intentDescriptorWithIntentClassName:(id)a3 launchableBundleId:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F304E0];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithIntentClassName:v7 launchableAppBundleId:v6];

  return v8;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFHandleSystemIntentAction;
  BOOL v8 = [(WFAction *)&v15 setParameterState:v6 forKey:v7];
  if (v8 && [v7 isEqualToString:@"IntentAppDefinition"])
  {
    [(WFHandleSystemIntentAction *)self selectedAppDidChange];
    id v9 = v6;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    id v12 = [v11 value];

    v13 = [v12 bundleIdentifier];
    [(WFAction *)self setSupplementalParameterValue:v13 forKey:@"IntentAppIdentifier"];

    [(WFAction *)self recreateResourcesIfNeeded];
  }

  return v8;
}

- (id)selectedAppNotSupportedError
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = WFLocalizedString(@"Invalid App");
  id v4 = NSString;
  id v5 = WFLocalizedString(@"Please select a valid app for %@.");
  id v6 = [(WFAction *)self localizedName];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);

  BOOL v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  v13[0] = *MEMORY[0x1E4F28588];
  v13[1] = v9;
  v14[0] = v3;
  v14[1] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = [v8 errorWithDomain:@"WFActionErrorDomain" code:10 userInfo:v10];

  return v11;
}

- (id)generatedIntentWithIdentifier:(id)a3 input:(id)a4 processedParameters:(id)a5 error:(id *)a6
{
  BOOL v8 = [(WFHandleSystemIntentAction *)self intentDescription];
  id v9 = objc_alloc_init((Class)[v8 facadeClass]);

  v10 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  id v11 = [v10 bundleIdentifier];
  if (v11)
  {
    BOOL v12 = 1;
  }
  else
  {
    v13 = [v10 extensionBundleIdentifier];
    BOOL v12 = v13 != 0;
  }
  id v14 = [(WFHandleSystemIntentAction *)self launchableAppIdentifiers];
  objc_super v15 = [v10 bundleIdentifier];
  char v16 = [v14 containsObject:v15];

  id v17 = [v10 extensionBundleIdentifier];

  if (v17) {
    char v18 = 1;
  }
  else {
    char v18 = v16;
  }
  if (v12 && (v18 & 1) != 0)
  {
    id v19 = [v10 bundleIdentifier];
    [v9 _setLaunchId:v19];

    v20 = [v10 extensionBundleIdentifier];
    [v9 _setExtensionBundleId:v20];

    id v21 = v9;
  }
  else if (a6)
  {
    [(WFHandleSystemIntentAction *)self selectedAppNotSupportedError];
    id v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (id)copyWithSerializedParameters:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = [(WFAction *)self serializedParameters];
    id v6 = [v5 objectForKey:@"IntentAppDefinition"];

    if (v6)
    {
      BOOL v12 = @"IntentAppDefinition";
      id v7 = [(WFAction *)self serializedParameters];
      BOOL v8 = [v7 objectForKey:@"IntentAppDefinition"];
      v13[0] = v8;
      id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      id v4 = 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)WFHandleSystemIntentAction;
  id v9 = [(WFAction *)&v11 copyWithSerializedParameters:v4];

  return v9;
}

- (void)initializeParameters
{
  v4.receiver = self;
  v4.super_class = (Class)WFHandleSystemIntentAction;
  [(WFHandleIntentAction *)&v4 initializeParameters];
  id v3 = [(WFAction *)self parameterForKey:@"IntentAppDefinition"];
  [v3 setDataSource:self];
}

- (id)slots
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescription];
  id v3 = [v2 slotDescriptions];

  return v3;
}

- (id)intentClassName
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescription];
  id v3 = NSStringFromClass((Class)[v2 facadeClass]);

  return v3;
}

- (int64_t)intentCategory
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescription];
  id v3 = objc_alloc_init((Class)[v2 facadeClass]);
  int64_t v4 = [v3 _intentCategory];

  return v4;
}

- (id)accessoryIcon
{
  id v3 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  int64_t v4 = [v3 bundleIdentifier];
  id v5 = [(WFHandleSystemIntentAction *)self customImageForBundleIdentifier:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4FB4770];
    BOOL v8 = [(WFHandleSystemIntentAction *)self displayableAppIdentifier];
    id v6 = [v7 applicationIconImageForBundleIdentifier:v8 format:0];
  }
  return v6;
}

- (id)launchableAppIdentifier
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)displayableAppIdentifier
{
  v2 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  id v3 = [v2 displayableBundleIdentifier];

  return v3;
}

- (id)localizedAppName
{
  id v3 = [(WFHandleSystemIntentAction *)self intentDescriptor];
  int64_t v4 = [v3 bundleIdentifier];
  id v5 = [(WFHandleSystemIntentAction *)self customAppNameForBundleIdentifier:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(WFHandleSystemIntentAction *)self intentDescriptor];
    id v6 = [v7 localizedName];
  }
  return v6;
}

- (id)displayableAppDescriptor
{
  v2 = [(WFHandleSystemIntentAction *)self displayableAppIdentifier];
  if (v2) {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F302A8]) initWithBundleIdentifier:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self definition];
  id v6 = [v5 name];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFHandleSystemIntentAction;
    id v7 = [(WFHandleIntentAction *)&v14 localizedNameWithContext:v4];
  }
  else
  {
    BOOL v8 = [(WFHandleSystemIntentAction *)self intentDescription];
    id v9 = [v8 name];
    uint64_t v10 = [v9 rangeOfString:@"Intent" options:12];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v9 substringToIndex:v10];
    }
    BOOL v12 = v11;

    id v7 = WFAddSpacesToCamelCaseName(v12);
  }
  return v7;
}

- (INIntentDescriptor)intentDescriptor
{
  intentDescriptor = self->_intentDescriptor;
  if (!intentDescriptor)
  {
    id v4 = [(WFHandleSystemIntentAction *)self intentDescriptorFromParameterState];
    if (!v4) {
      goto LABEL_5;
    }
    id v5 = v4;
    id v6 = [MEMORY[0x1E4F302D0] sharedResolver];
    id v7 = [v6 resolvedIntentMatchingDescriptor:v5];
    BOOL v8 = self->_intentDescriptor;
    self->_intentDescriptor = v7;

    intentDescriptor = self->_intentDescriptor;
  }
  id v4 = intentDescriptor;
LABEL_5:
  return v4;
}

- (id)customImageForBundleIdentifier:(id)a3
{
  return 0;
}

- (id)customAppNameForBundleIdentifier:(id)a3
{
  return 0;
}

- (void)selectedAppDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  intentDescriptor = self->_intentDescriptor;
  self->_intentDescriptor = 0;

  [(WFHandleSystemIntentAction *)self intentDescriptor];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(WFAction *)self parameters];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) resourceManager];
        uint64_t v15 = objc_opt_class();
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        [v9 refreshAvailabilityOfRequiredResourcesOfClasses:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  [(WFAction *)self iconUpdated];
}

- (void)dealloc
{
  notify_cancel(self->_token);
  v3.receiver = self;
  v3.super_class = (Class)WFHandleSystemIntentAction;
  [(WFHandleSystemIntentAction *)&v3 dealloc];
}

- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 intentDescription:(id)a6 stringLocalizer:(id)a7
{
  v67[4] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v12 = (WFActionDefinition *)a4;
  id v13 = a5;
  id obj = a6;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    if (!v14) {
      goto LABEL_7;
    }
  }
  else
  {
    char v16 = [WFActionDefinition alloc];
    long long v12 = [(WFActionDefinition *)v16 initWithDictionary:MEMORY[0x1E4F1CC08]];
    if (!v14) {
      goto LABEL_7;
    }
  }
  uint64_t v17 = [(WFActionDefinition *)v12 objectForKey:@"Parameters"];

  if (!v17)
  {
    char v18 = objc_opt_new();
    id v19 = [v14 slotDescriptions];
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke;
    v58[3] = &unk_1E654FDC0;
    v59 = self;
    id v60 = v11;
    id v61 = v18;
    id v51 = v18;
    [v19 enumerateObjectsUsingBlock:v58];

    v20 = [WFParameterDefinition alloc];
    v66[0] = @"Class";
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v67[0] = v22;
    v67[1] = @"IntentAppDefinition";
    v66[1] = @"Key";
    v66[2] = @"Label";
    id v23 = WFLocalizedStringResourceWithKey(@"App (SystemIntentAppIdentifier)", @"App");
    v67[2] = v23;
    v66[3] = @"IntentName";
    long long v24 = NSStringFromClass((Class)[v14 facadeClass]);
    v67[3] = v24;
    long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v67 forKeys:v66 count:4];
    long long v26 = [(WFParameterDefinition *)v20 initWithDictionary:v25];

    [v51 insertObject:v26 atIndex:0];
    long long v27 = [WFParameterDefinition alloc];
    v64[0] = @"Class";
    v28 = (objc_class *)objc_opt_class();
    uint64_t v29 = NSStringFromClass(v28);
    v65[0] = v29;
    v65[1] = @"OpenInApp";
    v64[1] = @"Key";
    v64[2] = @"Label";
    v30 = WFLocalizedStringResourceWithKey(@"Open in App (SystemIntentOpenInApp)", @"Open in App");
    v65[2] = v30;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:v64 count:3];
    v32 = [(WFParameterDefinition *)v27 initWithDictionary:v31];

    [v51 addObject:v32];
    v62 = @"Parameters";
    id v63 = v51;
    v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
    uint64_t v34 = [(WFActionDefinition *)v12 definitionByAddingEntriesInDictionary:v33];

    long long v12 = (WFActionDefinition *)v34;
  }
LABEL_7:
  v35 = [(WFActionDefinition *)v12 objectForKey:@"Parameters"];
  v36 = objc_msgSend(v35, "if_firstObjectPassingTest:", &__block_literal_global_199_20810);

  if (!v13
    || ([v13 objectForKeyedSubscript:@"IntentAppDefinition"],
        v37 = objc_claimAutoreleasedReturnValue(),
        BOOL v38 = v37 == 0,
        v37,
        v38))
  {
    v39 = [v36 objectForKey:@"DefaultValue"];
    BOOL v40 = v39 == 0;

    if (!v40)
    {
      if (v13) {
        uint64_t v41 = [v13 mutableCopy];
      }
      else {
        uint64_t v41 = objc_opt_new();
      }
      v42 = (void *)v41;
      v43 = [v36 objectForKey:@"DefaultValue"];
      [v42 setObject:v43 forKeyedSubscript:@"IntentAppDefinition"];

      uint64_t v44 = [v42 copy];
      id v13 = (id)v44;
    }
  }
  v57.receiver = self;
  v57.super_class = (Class)WFHandleSystemIntentAction;
  v45 = [(WFHandleIntentAction *)&v57 initWithIdentifier:v11 definition:v12 serializedParameters:v13 stringLocalizer:v15];
  v46 = v45;
  if (v45)
  {
    objc_storeStrong((id *)&v45->_intentDescription, obj);
    objc_initWeak(&location, v46);
    v47 = (const char *)[(id)*MEMORY[0x1E4F22318] UTF8String];
    id v48 = MEMORY[0x1E4F14428];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_3;
    handler[3] = &unk_1E6555A28;
    objc_copyWeak(&v55, &location);
    notify_register_dispatch(v47, &v46->_token, MEMORY[0x1E4F14428], handler);

    v49 = v46;
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }

  return v46;
}

void __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "wf_parameterClass");
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = [WFParameterDefinition alloc];
    uint64_t v7 = [(WFParameterDefinition *)v6 initWithDictionary:MEMORY[0x1E4F1CC08]];
    uint64_t v8 = [*(id *)(a1 + 32) stringLocalizer];
    id v9 = objc_msgSend(v3, "wf_updatedParameterDefinition:parameterClass:localizer:", v7, v5, v8);

    uint64_t v10 = [v9 objectForKey:@"Class"];
    Class v11 = NSClassFromString(v10);
    LODWORD(v11) = [(objc_class *)v11 isSubclassOfClass:objc_opt_class()];

    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 40);
      v16[0] = @"IntentType";
      v16[1] = @"SlotName";
      v17[0] = v12;
      id v13 = objc_msgSend(v3, "wf_slotName");
      v17[1] = v13;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
      uint64_t v15 = [v9 definitionByAddingEntriesInDictionary:v14];

      id v9 = (void *)v15;
    }
    [*(id *)(a1 + 48) addObject:v9];
  }
}

void __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[50];
    WeakRetained[50] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

uint64_t __115__WFHandleSystemIntentAction_initWithIdentifier_definition_serializedParameters_intentDescription_stringLocalizer___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 objectForKey:@"Key"];
  uint64_t v3 = [v2 isEqualToString:@"IntentAppDefinition"];

  return v3;
}

- (WFHandleSystemIntentAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 stringLocalizer:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v11 objectForKey:@"IntentIdentifier"];
  uint64_t v15 = objc_opt_class();
  id v16 = v14;
  if (v16 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    char v18 = getWFGeneralLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)id v23 = 136315906;
      *(void *)&v23[4] = "WFEnforceClass";
      *(_WORD *)&v23[12] = 2114;
      *(void *)&v23[14] = v16;
      *(_WORD *)&v23[22] = 2114;
      id v24 = (id)objc_opt_class();
      LOWORD(v25) = 2114;
      *(void *)((char *)&v25 + 2) = v15;
      id v19 = v24;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", v23, 0x2Au);
    }
    id v17 = 0;
  }
  else
  {
    id v17 = v16;
  }

  if (v17)
  {
    v20 = INIntentSchemaGetIntentDescriptionWithType();
  }
  else
  {
    v20 = 0;
  }
  id v21 = -[WFHandleSystemIntentAction initWithIdentifier:definition:serializedParameters:intentDescription:stringLocalizer:](self, "initWithIdentifier:definition:serializedParameters:intentDescription:stringLocalizer:", v10, v11, v12, v20, v13, *(_OWORD *)v23, *(void *)&v23[16], v24, v25);

  return v21;
}

+ (id)sharedEnumerator
{
  if (sharedEnumerator_onceToken != -1) {
    dispatch_once(&sharedEnumerator_onceToken, &__block_literal_global_20834);
  }
  v2 = (void *)sharedEnumerator_enumerator;
  return v2;
}

void __46__WFHandleSystemIntentAction_sharedEnumerator__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedEnumerator_enumerator;
  sharedEnumerator_enumerator = v0;
}

@end