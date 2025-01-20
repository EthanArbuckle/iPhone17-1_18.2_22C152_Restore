@interface WFTriggerEventRunner
- (BOOL)isRunningWorkflowWithIdentifier:(id)a3;
- (BOOL)startRunningWorkflow:(id)a3 forTrigger:(id)a4 eventInfo:(id)a5;
- (WFConfiguredTrigger)inProgressTrigger;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerEventRunner)initWithDatabaseProvider:(id)a3 delegate:(id)a4;
- (WFTriggerEventRunnerDelegate)delegate;
- (WFWorkflowRunEvent)inProgressRunEvent;
- (WFWorkflowRunnerClient)inProgressRunnerClient;
- (void)logPowerLogEventForConfiguredTrigger:(id)a3 workflowReference:(id)a4;
- (void)setInProgressRunEvent:(id)a3;
- (void)setInProgressRunnerClient:(id)a3;
- (void)setInProgressTrigger:(id)a3;
- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6;
@end

@implementation WFTriggerEventRunner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressRunnerClient, 0);
  objc_storeStrong((id *)&self->_inProgressTrigger, 0);
  objc_storeStrong((id *)&self->_inProgressRunEvent, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
}

- (void)setInProgressRunnerClient:(id)a3
{
}

- (WFWorkflowRunnerClient)inProgressRunnerClient
{
  return self->_inProgressRunnerClient;
}

- (void)setInProgressTrigger:(id)a3
{
}

- (WFConfiguredTrigger)inProgressTrigger
{
  return self->_inProgressTrigger;
}

- (void)setInProgressRunEvent:(id)a3
{
}

- (WFWorkflowRunEvent)inProgressRunEvent
{
  return self->_inProgressRunEvent;
}

- (WFTriggerEventRunnerDelegate)delegate
{
  return self->_delegate;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)logPowerLogEventForConfiguredTrigger:(id)a3 workflowReference:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v36 = a4;
  if (!v35)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFTriggerEventRunner.m", 128, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v45[0] = @"name";
  v45[1] = @"actions";
  v45[2] = @"associatedAppBundleIdentifier";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:3];
  v34 = [v7 setWithArray:v8];

  v9 = [(WFTriggerEventRunner *)self databaseProvider];
  id v38 = 0;
  v10 = [v9 databaseWithError:&v38];
  v11 = v38;

  if (v10)
  {
    v37 = v11;
    v12 = [v10 recordWithDescriptor:v36 properties:v34 error:&v37];
    v33 = v37;

    if (v12)
    {
      v43[0] = @"WFTriggerKind";
      v13 = (void *)MEMORY[0x1E4FB7358];
      v32 = [v35 trigger];
      v31 = [v13 powerLogEventKindForTrigger:v32];
      v44[0] = v31;
      v43[1] = @"WFActionCount";
      v14 = NSNumber;
      v15 = [v12 actions];
      v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v44[1] = v16;
      v43[2] = @"WFTriggerID";
      v17 = [v35 identifier];
      v44[2] = v17;
      v43[3] = @"WFWorkflowID";
      v18 = [v36 identifier];
      v44[3] = v18;
      v43[4] = @"WFWorkflowName";
      uint64_t v19 = [v12 name];
      v20 = (void *)v19;
      if (v19) {
        v21 = (__CFString *)v19;
      }
      else {
        v21 = &stru_1F225E938;
      }
      v44[4] = v21;
      v43[5] = @"WFAssociatedAppIdentifier";
      uint64_t v22 = [v12 associatedAppBundleIdentifier];
      v23 = (void *)v22;
      if (v22) {
        v24 = (__CFString *)v22;
      }
      else {
        v24 = &stru_1F225E938;
      }
      v44[5] = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:6];

      v26 = getWFTriggersLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = @"ShortcutsTriggerFired";
        *(_WORD *)&buf[22] = 2112;
        v47 = v25;
        _os_log_impl(&dword_1C7D7E000, v26, OS_LOG_TYPE_DEBUG, "%s Logging PowerLog event: %{public}@ (%@)", buf, 0x20u);
      }

      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v27 = (void (*)(uint64_t, __CFString *, NSObject *, void))getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr;
      v42 = getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr;
      if (!getPLLogTimeSensitiveRegisteredEventSymbolLoc_ptr)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getPLLogTimeSensitiveRegisteredEventSymbolLoc_block_invoke;
        v47 = &unk_1E6541E40;
        v48 = &v39;
        __getPLLogTimeSensitiveRegisteredEventSymbolLoc_block_invoke(buf);
        v27 = (void (*)(uint64_t, __CFString *, NSObject *, void))v40[3];
      }
      _Block_object_dispose(&v39, 8);
      if (!v27)
      {
        v29 = [MEMORY[0x1E4F28B00] currentHandler];
        v30 = objc_msgSend(NSString, "stringWithUTF8String:", "void softPLLogTimeSensitiveRegisteredEvent(PLClientID, CFStringRef, CFDictionaryRef, CFArrayRef)");
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"WFTriggerEventRunner.m", 28, @"%s", dlerror());

        __break(1u);
      }
      v27(38, @"ShortcutsTriggerFired", v25, 0);
    }
    else
    {
      v25 = getWFTriggersLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v36;
        *(_WORD *)&buf[22] = 2114;
        v47 = v33;
        _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Failed to get workflow record for reference (%@): %{public}@", buf, 0x20u);
      }
    }

    v11 = v33;
  }
  else
  {
    v12 = getWFTriggersLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[WFTriggerEventRunner logPowerLogEventForConfiguredTrigger:workflowReference:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2114;
      v47 = v11;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to get workflow record for reference (%@) because database could not be loaded: %{public}@", buf, 0x20u);
    }
  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  BOOL v6 = a6;
  id v14 = a5;
  id v9 = a3;
  id v10 = [(WFTriggerEventRunner *)self inProgressRunnerClient];

  if (v10 == v9)
  {
    v11 = [(WFTriggerEventRunner *)self delegate];
    v12 = [(WFTriggerEventRunner *)self inProgressTrigger];
    v13 = [(WFTriggerEventRunner *)self inProgressRunEvent];
    [v11 didFinishRunningWithError:v14 cancelled:v6 trigger:v12 runEvent:v13];

    [(WFTriggerEventRunner *)self setInProgressTrigger:0];
    [(WFTriggerEventRunner *)self setInProgressRunEvent:0];
    [(WFTriggerEventRunner *)self setInProgressRunnerClient:0];
  }
}

- (BOOL)isRunningWorkflowWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerEventRunner *)self inProgressRunnerClient];
  BOOL v6 = [v5 descriptor];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = [v6 identifier];
    char v8 = [v7 isEqualToString:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)startRunningWorkflow:(id)a3 forTrigger:(id)a4 eventInfo:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    [v44 handleFailureInMethod:a2, self, @"WFTriggerEventRunner.m", 71, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];
  }
  v12 = [v9 identifier];
  LODWORD(v13) = [(WFTriggerEventRunner *)self isRunningWorkflowWithIdentifier:v12];

  id v14 = getWFTriggersLogObject();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v16 = [(WFTriggerEventRunner *)self inProgressTrigger];
      v17 = [v16 trigger];
      v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      v20 = [v10 trigger];
      v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = "-[WFTriggerEventRunner startRunningWorkflow:forTrigger:eventInfo:]";
      __int16 v50 = 2112;
      id v51 = v19;
      __int16 v52 = 2112;
      v53 = v22;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_FAULT, "%s An automation is already running (%@), so we can't run this newly-triggered one (%@).", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v10 trigger];
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 136315650;
      uint64_t v49 = "-[WFTriggerEventRunner startRunningWorkflow:forTrigger:eventInfo:]";
      __int16 v50 = 2112;
      id v51 = v10;
      __int16 v52 = 2114;
      v53 = v25;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_DEFAULT, "%s 🤖 Launching extension to run trigger: %@ of type: %{public}@", buf, 0x20u);
    }
    [(WFTriggerEventRunner *)self logPowerLogEventForConfiguredTrigger:v10 workflowReference:v9];
    v26 = [v10 trigger];
    v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);

    v29 = [v10 trigger];
    uint64_t v30 = [v29 contentCollectionWithEventInfo:v11];

    id v47 = v11;
    if ([v10 shouldPrompt])
    {
      uint64_t v31 = 0;
    }
    else
    {
      v32 = [v10 trigger];
      if ([(id)objc_opt_class() isAllowedToRunAutomatically]) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 0;
      }
    }
    id v33 = objc_alloc(MEMORY[0x1E4FB4A40]);
    v34 = [v9 identifier];
    v45 = (void *)[v33 initWithIdentifier:v34];

    id v35 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:v30 presentationMode:v31];
    [v35 setAutomationType:v28];
    uint64_t v36 = *MEMORY[0x1E4FB4F38];
    [v35 setRunSource:*MEMORY[0x1E4FB4F38]];
    [v35 setLogRunEvent:0];
    [v35 setDonateInteraction:0];
    v37 = (void *)[objc_alloc(MEMORY[0x1E4FB4A90]) initWithDescriptor:v45 runRequest:v35];
    [v37 setDelegate:self];
    [v37 start];
    [(WFTriggerEventRunner *)self setInProgressRunnerClient:v37];
    uint64_t v13 = [(WFTriggerEventRunner *)self databaseProvider];
    [(id)v13 databaseWithError:0];
    v46 = v28;
    v39 = id v38 = (void *)v30;
    [v10 identifier];
    uint64_t v41 = v40 = v9;
    v42 = [v39 logRunOfWorkflow:v40 withSource:v36 triggerID:v41];
    [(WFTriggerEventRunner *)self setInProgressRunEvent:v42];

    id v9 = v40;
    [(WFTriggerEventRunner *)self setInProgressTrigger:v10];

    v15 = v46;
    id v11 = v47;
    LOBYTE(v13) = 0;
  }

  return v13 ^ 1;
}

- (WFTriggerEventRunner)initWithDatabaseProvider:(id)a3 delegate:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFTriggerEventRunner.m", 56, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFTriggerEventRunner;
  id v10 = [(WFTriggerEventRunner *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v11->_delegate, a4);
    v12 = v11;
  }

  return v11;
}

@end