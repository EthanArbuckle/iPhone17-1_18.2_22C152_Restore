@interface WFFocusConfigurationLinkAction
+ (id)genericRuntimeError;
- (BOOL)isRunningInsideFocusConfigurationExtension;
- (BOOL)requiresRemoteExecution;
- (BOOL)shouldAskForValuesWhileProcessingParameterStates;
- (DNDModeConfigurationService)configurationService;
- (id)contentDestinationWithError:(id *)a3;
- (id)currentFocusConfiguration;
- (id)disabledOnPlatforms;
- (id)dndApplicationIdentifier;
- (id)localizedAppName;
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)parameterDefinitions;
- (id)parameterSummary;
- (id)selectedFocusIdentifier;
- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5;
- (void)clearFocusConfiguration;
- (void)createAndCommitFocusConfigurationToDND;
- (void)disableFocusConfiguration;
- (void)enableFocusConfiguration;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)setConfigurationService:(id)a3;
- (void)setFocusConfigurationEnablementStatus:(BOOL)a3;
- (void)toggleFocusConfiguration;
- (void)updateParameterStatesFromCurrentDNDConfiguration;
- (void)wasAddedToWorkflowByUser:(id)a3;
@end

@implementation WFFocusConfigurationLinkAction

- (void).cxx_destruct
{
}

- (void)setConfigurationService:(id)a3
{
}

- (BOOL)requiresRemoteExecution
{
  v3.receiver = self;
  v3.super_class = (Class)WFFocusConfigurationLinkAction;
  return [(WFAction *)&v3 requiresRemoteExecution];
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6 = a5;
  v7 = [(WFAppIntentExecutionAction *)self appDescriptor];
  v8 = [v7 localizedName];

  v9 = NSString;
  if (v8)
  {
    v10 = WFLocalizedString(@"Allow “%1$@” to change your Focus Filter settings for “%2$@”?");
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v8);
  }
  else
  {
    v10 = WFLocalizedString(@"Allow “%1$@” to change your Focus Filter settings?");
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v6, v13);
  v11 = };

  return v11;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F5A868], "focusLocation", a3);
}

- (BOOL)isRunningInsideFocusConfigurationExtension
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v3 = [v2 bundleIdentifier];

  if ([v3 isEqualToString:*MEMORY[0x1E4FB4B68]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4FB4B70]];
  }

  return v4;
}

- (void)wasAddedToWorkflowByUser:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFocusConfigurationLinkAction;
  -[WFAction wasAddedToWorkflowByUser:](&v5, sel_wasAddedToWorkflowByUser_);
  if (a3) {
    [(WFFocusConfigurationLinkAction *)self updateParameterStatesFromCurrentDNDConfiguration];
  }
}

- (void)updateParameterStatesFromCurrentDNDConfiguration
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(WFFocusConfigurationLinkAction *)self currentFocusConfiguration];
  char v4 = [v3 action];

  v36 = v4;
  objc_super v5 = [v4 parameters];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v7 = [(WFAppIntentExecutionAction *)self metadata];
    v8 = [v7 parameters];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v38;
      *(void *)&long long v10 = 136315394;
      long long v35 = v10;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "valueType", v35);
          v16 = objc_msgSend(v15, "wf_parameterDefinitionWithParameterMetadata:", v14);

          if (v16)
          {
            v17 = [v36 parameters];
            v18 = [v14 name];
            v19 = objc_msgSend(v17, "if_firstObjectWithValue:forKey:", v18, @"identifier");

            if (v19)
            {
              v20 = [v19 value];
              v21 = [v16 parameterStateFromLinkValue:v20];

              if (v21)
              {
                v22 = [v14 name];
                [(WFLinkAction *)self setParameterState:v21 forKey:v22];
              }
              else
              {
                v22 = getWFAppIntentsLogObject();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v35;
                  v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
                  __int16 v48 = 2112;
                  v49 = v16;
                  _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s Could not create parameter state from parameter definition %@.", buf, 0x16u);
                }
              }
            }
            else
            {
              v21 = getWFAppIntentsLogObject();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                v24 = [v14 name];
                *(_DWORD *)buf = v35;
                v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
                __int16 v48 = 2112;
                v49 = v24;
                _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Could not find a property with identifier %@ in the DND LNAction, it will be ignored.", buf, 0x16u);
              }
            }
          }
          else
          {
            v19 = getWFAppIntentsLogObject();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              v23 = [v14 name];
              *(_DWORD *)buf = v35;
              v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
              __int16 v48 = 2112;
              v49 = v23;
              _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Failed to create parameter definition for %@, it will be ignored.", buf, 0x16u);
            }
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v25 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_INFO, "%s No parameters to configure, will clear parameter states.", buf, 0xCu);
    }

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v26 = [(WFAppIntentExecutionAction *)self metadata];
    v8 = [v26 parameters];

    uint64_t v27 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v42 != v29) {
            objc_enumerationMutation(v8);
          }
          v31 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          v32 = getWFAppIntentsLogObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v33 = [v31 name];
            *(_DWORD *)buf = 136315394;
            v47 = "-[WFFocusConfigurationLinkAction updateParameterStatesFromCurrentDNDConfiguration]";
            __int16 v48 = 2112;
            v49 = v33;
            _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_DEBUG, "%s Clearing parameter state for %@", buf, 0x16u);
          }
          v34 = [v31 name];
          [(WFLinkAction *)self setParameterState:0 forKey:v34];
        }
        uint64_t v28 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v28);
    }
  }
}

- (void)clearFocusConfiguration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = getWFAppIntentsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    char v4 = [(WFFocusConfigurationLinkAction *)self selectedFocusIdentifier];
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFFocusConfigurationLinkAction clearFocusConfiguration]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1C7F0A000, v3, OS_LOG_TYPE_DEBUG, "%s Clearing Focus Filter configuration from focus with identifier %@", buf, 0x16u);
  }
  objc_super v5 = [(WFFocusConfigurationLinkAction *)self configurationService];
  uint64_t v6 = [(WFAppIntentExecutionAction *)self metadata];
  v7 = [v6 identifier];
  v8 = [(WFFocusConfigurationLinkAction *)self dndApplicationIdentifier];
  uint64_t v9 = [(WFFocusConfigurationLinkAction *)self selectedFocusIdentifier];
  id v13 = 0;
  [v5 clearAppActionWithIdentifier:v7 forApplicationIdentifier:v8 modeIdentifier:v9 error:&v13];
  id v10 = v13;

  [(WFFocusConfigurationLinkAction *)self updateParameterStatesFromCurrentDNDConfiguration];
  if (v10)
  {
    uint64_t v11 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFFocusConfigurationLinkAction clearFocusConfiguration]";
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_ERROR, "%s Error clearing DNDAppAction: %@", buf, 0x16u);
    }

    uint64_t v12 = [(id)objc_opt_class() genericRuntimeError];
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v12];
  }
  else
  {
    [(WFAppIntentExecutionAction *)self finishRunningWithError:0];
  }
}

- (void)toggleFocusConfiguration
{
  id v3 = [(WFFocusConfigurationLinkAction *)self currentFocusConfiguration];
  -[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:](self, "setFocusConfigurationEnablementStatus:", [v3 isEnabled] ^ 1);
}

- (void)disableFocusConfiguration
{
}

- (void)enableFocusConfiguration
{
}

- (void)setFocusConfigurationEnablementStatus:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [(WFFocusConfigurationLinkAction *)self currentFocusConfiguration];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      id v17 = "%s Could not find a current configuration, won't update status.";
      uint64_t v18 = v9;
      uint32_t v19 = 12;
LABEL_13:
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    }
LABEL_14:

    [(WFAppIntentExecutionAction *)self finishRunningWithError:0];
    goto LABEL_17;
  }
  int v7 = [v5 isEnabled];
  v8 = getWFAppIntentsLogObject();
  uint64_t v9 = v8;
  if (v7 == v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      __int16 v23 = 1024;
      LODWORD(v24) = v3;
      id v17 = "%s Won't update status because it is already set to %d";
      uint64_t v18 = v9;
      uint32_t v19 = 18;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
    __int16 v23 = 1024;
    LODWORD(v24) = v3;
    _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_DEBUG, "%s Setting Focus Filter status to %d", buf, 0x12u);
  }

  id v10 = (void *)[v6 mutableCopy];
  [v10 setEnabled:v3];
  uint64_t v11 = [(WFFocusConfigurationLinkAction *)self configurationService];
  uint64_t v12 = [(WFFocusConfigurationLinkAction *)self dndApplicationIdentifier];
  id v13 = [(WFFocusConfigurationLinkAction *)self selectedFocusIdentifier];
  id v20 = 0;
  [v11 setAppAction:v10 forApplicationIdentifier:v12 modeIdentifier:v13 error:&v20];
  id v14 = v20;

  if (v14)
  {
    v15 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFFocusConfigurationLinkAction setFocusConfigurationEnablementStatus:]";
      __int16 v23 = 2112;
      id v24 = v14;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s Error committing DNDAppAction enablement status: %@", buf, 0x16u);
    }

    __int16 v16 = [(id)objc_opt_class() genericRuntimeError];
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v16];
  }
  else
  {
    [(WFAppIntentExecutionAction *)self finishRunningWithError:0];
  }

LABEL_17:
}

- (id)currentFocusConfiguration
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFFocusConfigurationLinkAction *)self configurationService];
  char v4 = [(WFFocusConfigurationLinkAction *)self selectedFocusIdentifier];
  id v17 = 0;
  objc_super v5 = [v3 getAppActionsForModeIdentifier:v4 error:&v17];
  id v6 = v17;
  int v7 = [(WFFocusConfigurationLinkAction *)self dndApplicationIdentifier];
  v8 = [v5 objectForKey:v7];

  if (v6)
  {
    uint64_t v9 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint32_t v19 = "-[WFFocusConfigurationLinkAction currentFocusConfiguration]";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1C7F0A000, v9, OS_LOG_TYPE_ERROR, "%s Error fetching current focus configuration: %@", buf, 0x16u);
    }
  }
  if ([v8 count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59__WFFocusConfigurationLinkAction_currentFocusConfiguration__block_invoke;
    v16[3] = &unk_1E6554960;
    v16[4] = self;
    id v10 = [v8 objectsPassingTest:v16];
    uint64_t v11 = [v10 anyObject];
  }
  else
  {
    uint64_t v12 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [(WFAppIntentExecutionAction *)self appDescriptor];
      id v14 = [v13 bundleIdentifier];
      *(_DWORD *)buf = 136315394;
      uint32_t v19 = "-[WFFocusConfigurationLinkAction currentFocusConfiguration]";
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_INFO, "%s No Focus configurations were found for %@", buf, 0x16u);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __59__WFFocusConfigurationLinkAction_currentFocusConfiguration__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  char v4 = [*(id *)(a1 + 32) metadata];
  objc_super v5 = [v4 identifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)createAndCommitFocusConfigurationToDND
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(WFAction *)self processedParameters];
  char v4 = v3;
  if (v3)
  {
    objc_super v5 = (void *)[v3 mutableCopy];
    [v5 removeObjectForKey:@"Mode"];
    [v5 removeObjectForKey:@"FocusMode"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__WFFocusConfigurationLinkAction_createAndCommitFocusConfigurationToDND__block_invoke;
    v7[3] = &unk_1E6554938;
    v7[4] = self;
    [(WFAppIntentExecutionAction *)self getLinkActionWithProcessedParameters:v5 completionHandler:v7];
  }
  else
  {
    uint64_t v6 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]";
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Could not get processedParameters.", buf, 0xCu);
    }

    objc_super v5 = [(id)objc_opt_class() genericRuntimeError];
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v5];
  }
}

void __72__WFFocusConfigurationLinkAction_createAndCommitFocusConfigurationToDND__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = getWFAppIntentsLogObject();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_DEBUG, "%s Will send configured LNAction to DNDModeConfigurationService: %@", buf, 0x16u);
    }

    uint64_t v9 = [*(id *)(a1 + 32) currentFocusConfiguration];
    uint64_t v10 = getWFAppIntentsLogObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s Updating a pre-existing DNDAppAction", buf, 0xCu);
      }

      uint64_t v12 = (void *)[v9 mutableCopy];
      [v12 setAction:v5];
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_DEBUG, "%s Creating a new DNDAppAction", buf, 0xCu);
      }

      uint64_t v23 = 0;
      id v24 = &v23;
      uint64_t v25 = 0x2050000000;
      id v13 = (void *)getDNDAppActionClass_softClass;
      uint64_t v26 = getDNDAppActionClass_softClass;
      if (!getDNDAppActionClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getDNDAppActionClass_block_invoke;
        uint64_t v28 = &unk_1E6558B78;
        uint64_t v29 = &v23;
        __getDNDAppActionClass_block_invoke((uint64_t)buf);
        id v13 = (void *)v24[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v23, 8);
      uint64_t v12 = (void *)[[v14 alloc] initWithAction:v5 enabled:1];
    }
    v15 = [*(id *)(a1 + 32) configurationService];
    __int16 v16 = [*(id *)(a1 + 32) dndApplicationIdentifier];
    id v17 = [*(id *)(a1 + 32) selectedFocusIdentifier];
    id v22 = 0;
    [v15 setAppAction:v12 forApplicationIdentifier:v16 modeIdentifier:v17 error:&v22];
    id v18 = v22;

    if (v18)
    {
      uint32_t v19 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Error committing DNDAppAction: %@", buf, 0x16u);
      }

      __int16 v20 = *(void **)(a1 + 32);
      id v21 = [(id)objc_opt_class() genericRuntimeError];
      [v20 finishRunningWithError:v21];
    }
    else
    {
      [*(id *)(a1 + 32) finishRunningWithError:0];
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[WFFocusConfigurationLinkAction createAndCommitFocusConfigurationToDND]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s Could not get LNAction with error: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 32) finishRunningWithError:v6];
  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  char v4 = [(WFAction *)self parameterValueForKey:@"Mode" ofClass:objc_opt_class()];
  if ([v4 isEqualToString:@"Set"])
  {
    [(WFFocusConfigurationLinkAction *)self createAndCommitFocusConfigurationToDND];
  }
  else if ([v4 isEqualToString:@"Turn On"])
  {
    [(WFFocusConfigurationLinkAction *)self enableFocusConfiguration];
  }
  else if ([v4 isEqualToString:@"Turn Off"])
  {
    [(WFFocusConfigurationLinkAction *)self disableFocusConfiguration];
  }
  else if ([v4 isEqualToString:@"Toggle"])
  {
    [(WFFocusConfigurationLinkAction *)self toggleFocusConfiguration];
  }
  else if ([v4 isEqualToString:@"Clear"])
  {
    [(WFFocusConfigurationLinkAction *)self clearFocusConfiguration];
  }
  else
  {
    id v5 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      v8 = "-[WFFocusConfigurationLinkAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s Programming error: Unexpected action mode.", (uint8_t *)&v7, 0xCu);
    }

    id v6 = [(id)objc_opt_class() genericRuntimeError];
    [(WFAppIntentExecutionAction *)self finishRunningWithError:v6];
  }
}

- (BOOL)shouldAskForValuesWhileProcessingParameterStates
{
  return 1;
}

- (DNDModeConfigurationService)configurationService
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  configurationService = self->_configurationService;
  if (!configurationService)
  {
    uint64_t v10 = 0;
    BOOL v11 = &v10;
    uint64_t v12 = 0x2050000000;
    char v4 = (void *)getDNDModeConfigurationServiceClass_softClass;
    uint64_t v13 = getDNDModeConfigurationServiceClass_softClass;
    if (!getDNDModeConfigurationServiceClass_softClass)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v15 = __getDNDModeConfigurationServiceClass_block_invoke;
      __int16 v16 = &unk_1E6558B78;
      id v17 = &v10;
      __getDNDModeConfigurationServiceClass_block_invoke((uint64_t)&buf);
      char v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v5, "serviceForClientIdentifier:", @"com.apple.focus.activity-manager", v10);
    id v6 = (DNDModeConfigurationService *)objc_claimAutoreleasedReturnValue();
    int v7 = self->_configurationService;
    self->_configurationService = v6;

    configurationService = self->_configurationService;
    if (!configurationService)
    {
      v8 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[WFFocusConfigurationLinkAction configurationService]";
        _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Could not obtain a DNDModeConfigurationService instance.", (uint8_t *)&buf, 0xCu);
      }

      configurationService = self->_configurationService;
    }
  }
  return configurationService;
}

- (id)dndApplicationIdentifier
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(WFAppIntentExecutionAction *)self appDescriptor];
  BOOL v3 = [v2 bundleIdentifier];

  if (!v3)
  {
    char v4 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[WFFocusConfigurationLinkAction dndApplicationIdentifier]";
      _os_log_impl(&dword_1C7F0A000, v4, OS_LOG_TYPE_FAULT, "%s Could not get bundle identifier for action owner.", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)getDNDApplicationIdentifierClass_softClass;
  uint64_t v13 = getDNDApplicationIdentifierClass_softClass;
  if (!getDNDApplicationIdentifierClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v15 = __getDNDApplicationIdentifierClass_block_invoke;
    __int16 v16 = &unk_1E6558B78;
    id v17 = &v10;
    __getDNDApplicationIdentifierClass_block_invoke((uint64_t)&buf);
    id v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [v6 alloc];
  v8 = objc_msgSend(v7, "initWithBundleID:", v3, v10);

  return v8;
}

- (id)selectedFocusIdentifier
{
  v2 = [(WFAction *)self parameterValueForKey:@"FocusMode" ofClass:objc_opt_class()];
  BOOL v3 = [v2 identifier];
  char v4 = v3;
  if (!v3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    id v5 = (void **)getDNDDefaultModeIdentifierSymbolLoc_ptr;
    uint64_t v14 = getDNDDefaultModeIdentifierSymbolLoc_ptr;
    if (!getDNDDefaultModeIdentifierSymbolLoc_ptr)
    {
      id v6 = DoNotDisturbLibrary();
      v12[3] = (uint64_t)dlsym(v6, "DNDDefaultModeIdentifier");
      getDNDDefaultModeIdentifierSymbolLoc_ptr = v12[3];
      id v5 = (void **)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v5)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = [NSString stringWithUTF8String:"NSString *getDNDDefaultModeIdentifier(void)"];
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"WFFocusConfigurationLinkAction.m", 30, @"%s", dlerror());

      __break(1u);
      return result;
    }
    char v4 = *v5;
  }
  id v7 = v4;

  return v7;
}

- (id)parameterDefinitions
{
  v33[6] = *MEMORY[0x1E4F143B8];
  if ([(WFFocusConfigurationLinkAction *)self isRunningInsideFocusConfigurationExtension])
  {
    v26.receiver = self;
    v26.super_class = (Class)WFFocusConfigurationLinkAction;
    BOOL v3 = [(WFLinkAction *)&v26 parameterDefinitions];
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WFFocusConfigurationLinkAction;
    char v4 = [(WFLinkAction *)&v25 parameterDefinitions];
    id v24 = objc_msgSend(v4, "if_compactMap:", &__block_literal_global_48138);

    id v5 = [WFParameterDefinition alloc];
    v32[0] = @"Class";
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v6);
    v33[0] = v23;
    v33[1] = @"Set";
    v32[1] = @"DefaultValue";
    v32[2] = @"Items";
    v31[0] = @"Set";
    v31[1] = @"Turn On";
    v31[2] = @"Turn Off";
    v31[3] = @"Toggle";
    v31[4] = @"Clear";
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:5];
    v33[2] = v7;
    v32[3] = @"ItemDisplayNames";
    v8 = WFLocalizedStringResourceWithKey(@"Set", @"Set");
    v30[0] = v8;
    uint64_t v9 = WFLocalizedStringResourceWithKey(@"Turn On", @"Turn On");
    v30[1] = v9;
    uint64_t v10 = WFLocalizedStringResourceWithKey(@"Turn Off", @"Turn Off");
    v30[2] = v10;
    uint64_t v11 = WFLocalizedStringResourceWithKey(@"Toggle", @"Toggle");
    v30[3] = v11;
    uint64_t v12 = WFLocalizedStringResourceWithKey(@"Clear", @"Clear");
    v30[4] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
    v33[3] = v13;
    v33[4] = @"Mode";
    v32[4] = @"Key";
    v32[5] = @"Label";
    uint64_t v14 = WFLocalizedStringResourceWithKey(@"Mode", @"Mode");
    v33[5] = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:6];
    __int16 v16 = [(WFParameterDefinition *)v5 initWithDictionary:v15];

    id v17 = [WFParameterDefinition alloc];
    v28[0] = @"Class";
    v28[1] = @"Key";
    v29[0] = @"WFFocusModesPickerParameter";
    v29[1] = @"FocusMode";
    v28[2] = @"Label";
    uint64_t v18 = WFLocalizedStringResourceWithKey(@"Focus", @"Focus");
    v29[2] = v18;
    uint32_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
    __int16 v20 = [(WFParameterDefinition *)v17 initWithDictionary:v19];

    v27[0] = v16;
    v27[1] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    BOOL v3 = [v21 arrayByAddingObjectsFromArray:v24];
  }
  return v3;
}

id __54__WFFocusConfigurationLinkAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = [v2 objectForKey:@"Key"];
  if (([v3 isEqualToString:@"ShowWhenRun"] & 1) != 0
    || ([v3 isEqualToString:@"OpenWhenRun"] & 1) != 0)
  {
    char v4 = 0;
  }
  else
  {
    v18[0] = @"WFParameterKey";
    v18[1] = @"WFParameterValue";
    v19[0] = @"Mode";
    v19[1] = @"Set";
    v18[2] = @"WFResourceClass";
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    v19[2] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];

    v8 = [v2 objectForKey:@"RequiredResources"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    uint64_t v11 = (void *)[v10 mutableCopy];
    if (v11)
    {
      id v12 = v11;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA48] array];
    }
    uint64_t v13 = v12;

    [v13 addObject:v7];
    __int16 v16 = @"RequiredResources";
    id v17 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    char v4 = [v2 definitionByAddingEntriesInDictionary:v14];
  }
  return v4;
}

- (id)parameterSummary
{
  BOOL v3 = [WFActionParameterSummary alloc];
  char v4 = NSString;
  id v5 = WFLocalizedString(@"${Mode} %@ Focus Filter while in ${FocusMode}");
  id v6 = [(WFFocusConfigurationLinkAction *)self localizedAppName];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v8 = [(WFActionParameterSummary *)v3 initWithLocalizedString:v7];

  return v8;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  char v4 = WFLocalizedStringResourceWithKey(@"Focus (action category)", @"Focus");
  id v5 = [v3 localize:v4];

  return v5;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  char v4 = NSString;
  id v5 = a3;
  id v6 = WFLocalizedStringResourceWithKey(@"Sets the behavior of the %@ app when the given Focus is enabled.", @"Sets the behavior of the %@ app when the given Focus is enabled.");
  id v7 = [v5 localize:v6];

  v8 = [(WFFocusConfigurationLinkAction *)self localizedAppName];
  uint64_t v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (id)localizedNameWithContext:(id)a3
{
  char v4 = NSString;
  id v5 = a3;
  id v6 = WFLocalizedStringResourceWithKey(@"Set %@ Focus Filter", @"Set %@ Focus Filter");
  id v7 = [v5 localize:v6];

  v8 = [(WFFocusConfigurationLinkAction *)self localizedAppName];
  uint64_t v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);

  return v9;
}

- (id)localizedAppName
{
  id v2 = [(WFAppIntentExecutionAction *)self appDescriptor];
  id v3 = [v2 localizedName];

  return v3;
}

- (id)disabledOnPlatforms
{
  v4.receiver = self;
  v4.super_class = (Class)WFFocusConfigurationLinkAction;
  id v2 = [(WFAction *)&v4 disabledOnPlatforms];
  return v2;
}

+ (id)genericRuntimeError
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  id v3 = WFLocalizedString(@"An error occurred while configuring the Focus Filter.");
  v8[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v5 = [v2 errorWithDomain:@"WFFocusConfigurationLinkActionErrorDomain" code:1 userInfo:v4];

  return v5;
}

@end