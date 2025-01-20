@interface WFWorkflowRunRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsDialogNotifications;
- (BOOL)allowsHandoff;
- (BOOL)donateInteraction;
- (BOOL)handlesDialogRequests;
- (BOOL)handlesSiriActionRequests;
- (BOOL)isAutomationSuggestion;
- (BOOL)isStepwise;
- (BOOL)logRunEvent;
- (NSData)archivedInput;
- (NSDictionary)listenerEndpoints;
- (NSSet)extensionResourceClasses;
- (NSString)automationType;
- (NSString)parentBundleIdentifier;
- (NSString)parentRunningContextIdentifier;
- (NSString)runSource;
- (NSString)trialID;
- (NSXPCListenerEndpoint)remoteDialogPresenterEndpoint;
- (WFContentCollection)cachedInput;
- (WFWorkflowRunRequest)initWithCoder:(id)a3;
- (WFWorkflowRunRequest)initWithInput:(id)a3 presentationMode:(unint64_t)a4;
- (WFWorkflowRunViewSource)runViewSource;
- (id)description;
- (id)queueIdentifier;
- (id)unableToDecodeInputError;
- (unint64_t)outputBehavior;
- (unint64_t)presentationMode;
- (void)encodeWithCoder:(id)a3;
- (void)getInputWithCompletionHandler:(id)a3;
- (void)setAllowsDialogNotifications:(BOOL)a3;
- (void)setAllowsHandoff:(BOOL)a3;
- (void)setAutomationType:(id)a3;
- (void)setCachedInput:(id)a3;
- (void)setDonateInteraction:(BOOL)a3;
- (void)setExtensionResourceClasses:(id)a3;
- (void)setHandlesDialogRequests:(BOOL)a3;
- (void)setHandlesSiriActionRequests:(BOOL)a3;
- (void)setIsAutomationSuggestion:(BOOL)a3;
- (void)setListenerEndpoints:(id)a3;
- (void)setLogRunEvent:(BOOL)a3;
- (void)setOutputBehavior:(unint64_t)a3;
- (void)setParentBundleIdentifier:(id)a3;
- (void)setParentRunningContextIdentifier:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRemoteDialogPresenterEndpoint:(id)a3;
- (void)setRunSource:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setTrialID:(id)a3;
@end

@implementation WFWorkflowRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInput, 0);
  objc_storeStrong((id *)&self->_archivedInput, 0);
  objc_storeStrong((id *)&self->_extensionResourceClasses, 0);
  objc_storeStrong((id *)&self->_remoteDialogPresenterEndpoint, 0);
  objc_storeStrong((id *)&self->_parentRunningContextIdentifier, 0);
  objc_storeStrong((id *)&self->_listenerEndpoints, 0);
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_parentBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
}

- (void)setCachedInput:(id)a3
{
}

- (WFContentCollection)cachedInput
{
  return self->_cachedInput;
}

- (NSData)archivedInput
{
  return self->_archivedInput;
}

- (void)setExtensionResourceClasses:(id)a3
{
}

- (NSSet)extensionResourceClasses
{
  return self->_extensionResourceClasses;
}

- (void)setRemoteDialogPresenterEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)remoteDialogPresenterEndpoint
{
  return self->_remoteDialogPresenterEndpoint;
}

- (void)setParentRunningContextIdentifier:(id)a3
{
}

- (NSString)parentRunningContextIdentifier
{
  return self->_parentRunningContextIdentifier;
}

- (void)setLogRunEvent:(BOOL)a3
{
  self->_logRunEvent = a3;
}

- (BOOL)logRunEvent
{
  return self->_logRunEvent;
}

- (void)setDonateInteraction:(BOOL)a3
{
  self->_donateInteraction = a3;
}

- (BOOL)donateInteraction
{
  return self->_donateInteraction;
}

- (void)setHandlesSiriActionRequests:(BOOL)a3
{
  self->_handlesSiriActionRequests = a3;
}

- (BOOL)handlesSiriActionRequests
{
  return self->_handlesSiriActionRequests;
}

- (void)setHandlesDialogRequests:(BOOL)a3
{
  self->_handlesDialogRequests = a3;
}

- (BOOL)handlesDialogRequests
{
  return self->_handlesDialogRequests;
}

- (void)setAllowsHandoff:(BOOL)a3
{
  self->_allowsHandoff = a3;
}

- (BOOL)allowsHandoff
{
  return self->_allowsHandoff;
}

- (void)setAllowsDialogNotifications:(BOOL)a3
{
  self->_allowsDialogNotifications = a3;
}

- (BOOL)allowsDialogNotifications
{
  return self->_allowsDialogNotifications;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setListenerEndpoints:(id)a3
{
}

- (NSDictionary)listenerEndpoints
{
  return self->_listenerEndpoints;
}

- (void)setTrialID:(id)a3
{
}

- (NSString)trialID
{
  return self->_trialID;
}

- (BOOL)isStepwise
{
  return self->_stepwise;
}

- (void)setIsAutomationSuggestion:(BOOL)a3
{
  self->_isAutomationSuggestion = a3;
}

- (BOOL)isAutomationSuggestion
{
  return self->_isAutomationSuggestion;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setParentBundleIdentifier:(id)a3
{
}

- (NSString)parentBundleIdentifier
{
  return self->_parentBundleIdentifier;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setRunSource:(id)a3
{
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (id)queueIdentifier
{
  return 0;
}

- (id)unableToDecodeInputError
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  v9[0] = *MEMORY[0x1E4F28588];
  v4 = WFLocalizedString(@"Unable to run");
  v10[0] = v4;
  v9[1] = *MEMORY[0x1E4F28568];
  v5 = WFLocalizedString(@"The input of the shortcut could not be processed.");
  v10[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  v7 = [v2 errorWithDomain:v3 code:0x7FFFFFFFFFFFFFFFLL userInfo:v6];

  return v7;
}

- (void)getInputWithCompletionHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(WFWorkflowRunRequest *)self cachedInput];

  if (v5)
  {
    v6 = [(WFWorkflowRunRequest *)self cachedInput];
    v4[2](v4, v6, 0);
  }
  else
  {
    v7 = [(WFWorkflowRunRequest *)self archivedInput];

    if (v7)
    {
      Class v8 = NSClassFromString((NSString *)@"WFContentCollection");
      if (v8)
      {
        Class v9 = v8;
        v10 = (void *)MEMORY[0x1E4F28DC0];
        v11 = [(WFWorkflowRunRequest *)self archivedInput];
        v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __54__WFWorkflowRunRequest_getInputWithCompletionHandler___block_invoke;
        v16[3] = &unk_1E6078278;
        v16[4] = self;
        v17 = v4;
        id v13 = (id)objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v12, v16);
      }
      else
      {
        v14 = getWFVoiceShortcutClientLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v19 = "-[WFWorkflowRunRequest getInputWithCompletionHandler:]";
          _os_log_impl(&dword_1B3C5C000, v14, OS_LOG_TYPE_FAULT, "%s Unable to get input from WFWorkflowRunRequest, since ContentKit isn't linked.", buf, 0xCu);
        }

        v15 = [(WFWorkflowRunRequest *)self unableToDecodeInputError];
        ((void (**)(id, void *, void *))v4)[2](v4, 0, v15);
      }
    }
    else
    {
      v4[2](v4, 0, 0);
    }
  }
}

void __54__WFWorkflowRunRequest_getInputWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setCachedInput:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  objc_msgSend(v12, "encodeInteger:forKey:", -[WFWorkflowRunRequest presentationMode](self, "presentationMode"), @"presentationMode");
  id v4 = [(WFWorkflowRunRequest *)self runSource];
  [v12 encodeObject:v4 forKey:@"runSource"];

  v5 = [(WFWorkflowRunRequest *)self archivedInput];
  [v12 encodeObject:v5 forKey:@"archivedInput"];

  v6 = [(WFWorkflowRunRequest *)self listenerEndpoints];
  [v12 encodeObject:v6 forKey:@"listenerEndpoints"];

  v7 = [(WFWorkflowRunRequest *)self automationType];
  [v12 encodeObject:v7 forKey:@"automationType"];

  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest isAutomationSuggestion](self, "isAutomationSuggestion"), @"isAutomationSuggestion");
  Class v8 = [(WFWorkflowRunRequest *)self trialID];
  [v12 encodeObject:v8 forKey:@"trialID"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[WFWorkflowRunRequest outputBehavior](self, "outputBehavior"), @"outputBehavior");
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest allowsDialogNotifications](self, "allowsDialogNotifications"), @"allowsDialogNotifications");
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest allowsHandoff](self, "allowsHandoff"), @"allowsHandoff");
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest donateInteraction](self, "donateInteraction"), @"donateInteraction");
  objc_msgSend(v12, "encodeBool:forKey:", -[WFWorkflowRunRequest logRunEvent](self, "logRunEvent"), @"logRunEvent");
  Class v9 = [(WFWorkflowRunRequest *)self parentRunningContextIdentifier];
  [v12 encodeObject:v9 forKey:@"parentRunningContextIdentifier"];

  v10 = [(WFWorkflowRunRequest *)self remoteDialogPresenterEndpoint];
  [v12 encodeObject:v10 forKey:@"remoteDialogPresenterEndpoint"];

  v11 = [(WFWorkflowRunRequest *)self extensionResourceClasses];
  [v12 encodeObject:v11 forKey:@"extensionResourceClasses"];

  [v12 encodeObject:self->_runViewSource forKey:@"runViewSource"];
}

- (id)description
{
  v18 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v3);
  id v4 = [(WFWorkflowRunRequest *)self runSource];
  v5 = [(WFWorkflowRunRequest *)self archivedInput];
  unint64_t v6 = [(WFWorkflowRunRequest *)self presentationMode] - 1;
  if (v6 > 3) {
    v7 = @"Transient";
  }
  else {
    v7 = *(&off_1E6078298 + v6);
  }
  unint64_t v8 = [(WFWorkflowRunRequest *)self outputBehavior];
  if (v8 > 3) {
    Class v9 = @"Unknown";
  }
  else {
    Class v9 = off_1E6079630[v8];
  }
  if (v5) {
    v10 = @"yes";
  }
  else {
    v10 = @"no";
  }
  v11 = v9;
  id v12 = [(WFWorkflowRunRequest *)self automationType];
  if ([(WFWorkflowRunRequest *)self allowsHandoff]) {
    id v13 = @"yes";
  }
  else {
    id v13 = @"no";
  }
  v14 = v13;
  if ([(WFWorkflowRunRequest *)self allowsDialogNotifications]) {
    v15 = @"yes";
  }
  else {
    v15 = @"no";
  }
  v16 = [v18 stringWithFormat:@"<%@: %p, runSource: %@, input: %@, presentationMode: %@, output behavior: %@, automationType: %@, allowsHandoff: %@, allowsDialogNotifications: %@>", v19, self, v4, v10, v7, v11, v12, v14, v15];

  return v16;
}

- (WFWorkflowRunRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WFWorkflowRunRequest;
  v5 = [(WFWorkflowRunRequest *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedInput"];
    archivedInput = v5->_archivedInput;
    v5->_archivedInput = (NSData *)v6;

    v5->_presentationMode = [v4 decodeIntegerForKey:@"presentationMode"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runSource"];
    runSource = v5->_runSource;
    v5->_runSource = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    id v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"listenerEndpoints"];
    listenerEndpoints = v5->_listenerEndpoints;
    v5->_listenerEndpoints = (NSDictionary *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automationType"];
    automationType = v5->_automationType;
    v5->_automationType = (NSString *)v16;

    v5->_isAutomationSuggestion = [v4 decodeBoolForKey:@"isAutomationSuggestion"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialID"];
    trialID = v5->_trialID;
    v5->_trialID = (NSString *)v18;

    v5->_outputBehavior = [v4 decodeIntegerForKey:@"outputBehavior"];
    v5->_allowsDialogNotifications = [v4 decodeBoolForKey:@"allowsDialogNotifications"];
    v5->_allowsHandoff = [v4 decodeBoolForKey:@"allowsHandoff"];
    v5->_donateInteraction = [v4 decodeBoolForKey:@"donateInteraction"];
    v5->_logRunEvent = [v4 decodeBoolForKey:@"logRunEvent"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentRunningContextIdentifier"];
    parentRunningContextIdentifier = v5->_parentRunningContextIdentifier;
    v5->_parentRunningContextIdentifier = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remoteDialogPresenterEndpoint"];
    remoteDialogPresenterEndpoint = v5->_remoteDialogPresenterEndpoint;
    v5->_remoteDialogPresenterEndpoint = (NSXPCListenerEndpoint *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"extensionResourceClasses"];
    extensionResourceClasses = v5->_extensionResourceClasses;
    v5->_extensionResourceClasses = (NSSet *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runViewSource"];
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v29;

    v31 = v5;
  }

  return v5;
}

- (WFWorkflowRunRequest)initWithInput:(id)a3 presentationMode:(unint64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowRunRequest;
  uint64_t v8 = [(WFWorkflowRunRequest *)&v14 init];
  Class v9 = v8;
  if (v8)
  {
    if (v7)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v7, 1);
      archivedInput = v9->_archivedInput;
      v9->_archivedInput = (NSData *)v10;
    }
    else
    {
      archivedInput = v8->_archivedInput;
      v8->_archivedInput = 0;
    }

    objc_storeStrong((id *)&v9->_cachedInput, a3);
    v9->_presentationMode = a4;
    objc_storeStrong((id *)&v9->_runSource, @"unknown");
    v9->_outputBehavior = 1;
    *(_WORD *)&v9->_allowsDialogNotifications = 1;
    *(_WORD *)&v9->_donateInteraction = 257;
    uint64_t v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end