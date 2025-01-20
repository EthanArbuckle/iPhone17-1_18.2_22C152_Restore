@interface WFWorkflowRunningContext
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsDialogNotifications;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShortcutsApp;
- (BOOL)isStepwise;
- (BOOL)shouldForwardDialogRequests;
- (BOOL)shouldForwardSiriActionRequests;
- (NSDate)creationDate;
- (NSString)automationType;
- (NSString)identifier;
- (NSString)originatingBundleIdentifier;
- (NSString)progressCategory;
- (NSString)rootWorkflowIdentifier;
- (NSString)runKind;
- (NSString)runSource;
- (NSString)workflowIdentifier;
- (NSURL)outputRootIfRunningInFinder;
- (WFContextualAction)contextualAction;
- (WFContextualActionContext)contextualActionContext;
- (WFWorkflowRunViewSource)runViewSource;
- (WFWorkflowRunningContext)initWithCoder:(id)a3;
- (WFWorkflowRunningContext)initWithWorkflowIdentifier:(id)a3;
- (id)addProgressSubscriberUsingPublishingHandler:(id)a3;
- (id)copyWithCustomIdentity:(id)a3;
- (id)copyWithNewIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)progressForPublishingWithTotalUnitCount:(int64_t)a3 cancellationHandler:(id)a4;
- (unint64_t)hash;
- (unint64_t)outputBehavior;
- (unint64_t)presentationMode;
- (void)encodeWithCoder:(id)a3;
- (void)removeProgressSubscriber:(id)a3;
- (void)setAllowsDialogNotifications:(BOOL)a3;
- (void)setAutomationType:(id)a3;
- (void)setContextualAction:(id)a3;
- (void)setContextualActionContext:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginatingBundleIdentifier:(id)a3;
- (void)setOutputBehavior:(unint64_t)a3;
- (void)setOutputRootIfRunningInFinder:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setRootWorkflowIdentifier:(id)a3;
- (void)setRunKind:(id)a3;
- (void)setRunSource:(id)a3;
- (void)setRunViewSource:(id)a3;
- (void)setShouldForwardDialogRequests:(BOOL)a3;
- (void)setShouldForwardSiriActionRequests:(BOOL)a3;
- (void)setStepwise:(BOOL)a3;
- (void)setWorkflowIdentifier:(id)a3;
@end

@implementation WFWorkflowRunningContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionContext, 0);
  objc_storeStrong((id *)&self->_contextualAction, 0);
  objc_storeStrong((id *)&self->_outputRootIfRunningInFinder, 0);
  objc_storeStrong((id *)&self->_progressCategory, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_runKind, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_rootWorkflowIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_workflowIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setContextualActionContext:(id)a3
{
}

- (WFContextualActionContext)contextualActionContext
{
  return self->_contextualActionContext;
}

- (void)setContextualAction:(id)a3
{
}

- (WFContextualAction)contextualAction
{
  return self->_contextualAction;
}

- (void)setOutputRootIfRunningInFinder:(id)a3
{
}

- (NSURL)outputRootIfRunningInFinder
{
  return self->_outputRootIfRunningInFinder;
}

- (void)setOutputBehavior:(unint64_t)a3
{
  self->_outputBehavior = a3;
}

- (unint64_t)outputBehavior
{
  return self->_outputBehavior;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setAllowsDialogNotifications:(BOOL)a3
{
  self->_allowsDialogNotifications = a3;
}

- (NSString)progressCategory
{
  return self->_progressCategory;
}

- (void)setOriginatingBundleIdentifier:(id)a3
{
}

- (NSString)originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (void)setShouldForwardDialogRequests:(BOOL)a3
{
  self->_shouldForwardDialogRequests = a3;
}

- (BOOL)shouldForwardDialogRequests
{
  return self->_shouldForwardDialogRequests;
}

- (void)setShouldForwardSiriActionRequests:(BOOL)a3
{
  self->_shouldForwardSiriActionRequests = a3;
}

- (BOOL)shouldForwardSiriActionRequests
{
  return self->_shouldForwardSiriActionRequests;
}

- (void)setStepwise:(BOOL)a3
{
  self->_stepwise = a3;
}

- (BOOL)isStepwise
{
  return self->_stepwise;
}

- (void)setRunKind:(id)a3
{
}

- (NSString)runKind
{
  return self->_runKind;
}

- (void)setRunSource:(id)a3
{
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRootWorkflowIdentifier:(id)a3
{
}

- (NSString)rootWorkflowIdentifier
{
  return self->_rootWorkflowIdentifier;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setWorkflowIdentifier:(id)a3
{
}

- (NSString)workflowIdentifier
{
  return self->_workflowIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  v4 = [(WFWorkflowRunningContext *)self identifier];
  [v14 encodeObject:v4 forKey:@"identifier"];

  v5 = [(WFWorkflowRunningContext *)self workflowIdentifier];
  [v14 encodeObject:v5 forKey:@"workflowIdentifier"];

  v6 = [(WFWorkflowRunningContext *)self progressCategory];
  [v14 encodeObject:v6 forKey:@"progressCategory"];

  v7 = [(WFWorkflowRunningContext *)self creationDate];
  [v14 encodeObject:v7 forKey:@"creationDate"];

  v8 = [(WFWorkflowRunningContext *)self originatingBundleIdentifier];
  [v14 encodeObject:v8 forKey:@"originatingBundleIdentifier"];

  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext allowsDialogNotifications](self, "allowsDialogNotifications"), @"allowsDialogNotifications");
  v9 = [(WFWorkflowRunningContext *)self automationType];
  [v14 encodeObject:v9 forKey:@"automationType"];

  v10 = [(WFWorkflowRunningContext *)self rootWorkflowIdentifier];
  [v14 encodeObject:v10 forKey:@"rootWorkflowIdentifier"];

  v11 = [(WFWorkflowRunningContext *)self runSource];
  [v14 encodeObject:v11 forKey:@"runSource"];

  v12 = [(WFWorkflowRunningContext *)self runKind];
  [v14 encodeObject:v12 forKey:@"runKind"];

  objc_msgSend(v14, "encodeInteger:forKey:", -[WFWorkflowRunningContext outputBehavior](self, "outputBehavior"), @"outputBehavior");
  objc_msgSend(v14, "encodeInteger:forKey:", -[WFWorkflowRunningContext presentationMode](self, "presentationMode"), @"presentationMode");
  v13 = [(WFWorkflowRunningContext *)self runViewSource];
  [v14 encodeObject:v13 forKey:@"runViewSource"];

  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext isStepwise](self, "isStepwise"), @"stepwise");
  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext shouldForwardDialogRequests](self, "shouldForwardDialogRequests"), @"shouldForwardDialogRequests");
  objc_msgSend(v14, "encodeBool:forKey:", -[WFWorkflowRunningContext shouldForwardSiriActionRequests](self, "shouldForwardSiriActionRequests"), @"shouldForwardSiriActionRequests");
}

- (WFWorkflowRunningContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)WFWorkflowRunningContext;
  v5 = [(WFWorkflowRunningContext *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowIdentifier"];
    workflowIdentifier = v5->_workflowIdentifier;
    v5->_workflowIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"progressCategory"];
    progressCategory = v5->_progressCategory;
    v5->_progressCategory = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automationType"];
    automationType = v5->_automationType;
    v5->_automationType = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rootWorkflowIdentifier"];
    rootWorkflowIdentifier = v5->_rootWorkflowIdentifier;
    v5->_rootWorkflowIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originatingBundleIdentifier"];
    originatingBundleIdentifier = v5->_originatingBundleIdentifier;
    v5->_originatingBundleIdentifier = (NSString *)v18;

    v5->_allowsDialogNotifications = [v4 decodeBoolForKey:@"allowsDialogNotifications"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runSource"];
    runSource = v5->_runSource;
    v5->_runSource = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runKind"];
    runKind = v5->_runKind;
    v5->_runKind = (NSString *)v22;

    v5->_outputBehavior = [v4 decodeIntegerForKey:@"outputBehavior"];
    v5->_presentationMode = [v4 decodeIntegerForKey:@"presentationMode"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runViewSource"];
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v24;

    v5->_stepwise = [v4 decodeBoolForKey:@"stepwise"];
    v5->_shouldForwardDialogRequests = [v4 decodeBoolForKey:@"shouldForwardDialogRequests"];
    v5->_shouldForwardSiriActionRequests = [v4 decodeBoolForKey:@"shouldForwardSiriActionRequests"];
    v26 = v5;
  }

  return v5;
}

- (id)copyWithCustomIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(WFWorkflowRunningContext *)self copy];
  uint64_t v6 = (void *)[v4 copy];

  [v5 setIdentifier:v6];
  return v5;
}

- (id)copyWithNewIdentity
{
  v2 = self;
  v3 = [(WFWorkflowRunningContext *)v2 workflowIdentifier];
  id v4 = [(WFWorkflowRunningContext *)v2 initWithWorkflowIdentifier:v3];

  v5 = [(WFWorkflowRunningContext *)v2 automationType];
  [(WFWorkflowRunningContext *)v4 setAutomationType:v5];

  uint64_t v6 = [(WFWorkflowRunningContext *)v2 rootWorkflowIdentifier];
  [(WFWorkflowRunningContext *)v4 setRootWorkflowIdentifier:v6];

  v7 = [(WFWorkflowRunningContext *)v2 runSource];
  [(WFWorkflowRunningContext *)v4 setRunSource:v7];

  uint64_t v8 = [(WFWorkflowRunningContext *)v2 runKind];
  [(WFWorkflowRunningContext *)v4 setRunKind:v8];

  [(WFWorkflowRunningContext *)v4 setOutputBehavior:[(WFWorkflowRunningContext *)v2 outputBehavior]];
  v9 = [(WFWorkflowRunningContext *)v2 originatingBundleIdentifier];
  [(WFWorkflowRunningContext *)v4 setOriginatingBundleIdentifier:v9];

  [(WFWorkflowRunningContext *)v4 setAllowsDialogNotifications:[(WFWorkflowRunningContext *)v2 allowsDialogNotifications]];
  uint64_t v10 = [(WFWorkflowRunningContext *)v2 contextualAction];
  [(WFWorkflowRunningContext *)v4 setContextualAction:v10];

  v11 = [(WFWorkflowRunningContext *)v2 contextualActionContext];
  [(WFWorkflowRunningContext *)v4 setContextualActionContext:v11];

  uint64_t v12 = [(WFWorkflowRunningContext *)v2 runViewSource];
  [(WFWorkflowRunningContext *)v4 setRunViewSource:v12];

  [(WFWorkflowRunningContext *)v4 setStepwise:[(WFWorkflowRunningContext *)v2 isStepwise]];
  [(WFWorkflowRunningContext *)v4 setShouldForwardDialogRequests:[(WFWorkflowRunningContext *)v2 shouldForwardDialogRequests]];
  [(WFWorkflowRunningContext *)v4 setShouldForwardSiriActionRequests:[(WFWorkflowRunningContext *)v2 shouldForwardSiriActionRequests]];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFWorkflowRunningContext *)self identifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  v7 = [(WFWorkflowRunningContext *)self workflowIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setWorkflowIdentifier:v8];

  v9 = [(WFWorkflowRunningContext *)self creationDate];
  [v4 setCreationDate:v9];

  uint64_t v10 = [(WFWorkflowRunningContext *)self automationType];
  [v4 setAutomationType:v10];

  v11 = [(WFWorkflowRunningContext *)self rootWorkflowIdentifier];
  [v4 setRootWorkflowIdentifier:v11];

  uint64_t v12 = [(WFWorkflowRunningContext *)self runSource];
  [v4 setRunSource:v12];

  v13 = [(WFWorkflowRunningContext *)self runKind];
  [v4 setRunKind:v13];

  objc_msgSend(v4, "setOutputBehavior:", -[WFWorkflowRunningContext outputBehavior](self, "outputBehavior"));
  uint64_t v14 = [(WFWorkflowRunningContext *)self originatingBundleIdentifier];
  [v4 setOriginatingBundleIdentifier:v14];

  v15 = [(WFWorkflowRunningContext *)self runViewSource];
  [v4 setRunViewSource:v15];

  objc_msgSend(v4, "setStepwise:", -[WFWorkflowRunningContext isStepwise](self, "isStepwise"));
  objc_msgSend(v4, "setShouldForwardDialogRequests:", -[WFWorkflowRunningContext shouldForwardDialogRequests](self, "shouldForwardDialogRequests"));
  objc_msgSend(v4, "setShouldForwardSiriActionRequests:", -[WFWorkflowRunningContext shouldForwardSiriActionRequests](self, "shouldForwardSiriActionRequests"));
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFWorkflowRunningContext *)self identifier];
  v7 = [(WFWorkflowRunningContext *)self workflowIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, id: %@, workflow id: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFWorkflowRunningContext *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(WFWorkflowRunningContext *)self identifier];
      v7 = [(WFWorkflowRunningContext *)v5 identifier];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(WFWorkflowRunningContext *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)progressForPublishingWithTotalUnitCount:(int64_t)a3 cancellationHandler:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28F90];
  id v7 = a4;
  char v8 = [v6 progressWithTotalUnitCount:a3];
  [v8 setCancellationHandler:v7];

  [v8 setUserInfoObject:@"com.apple.shortcuts.progress" forKey:*MEMORY[0x1E4F28808]];
  v9 = [(WFWorkflowRunningContext *)self identifier];
  [v8 setUserInfoObject:v9 forKey:@"contextIdentifier"];

  uint64_t v10 = [(WFWorkflowRunningContext *)self workflowIdentifier];
  [v8 setUserInfoObject:v10 forKey:@"workflowIdentifier"];

  [v8 setUserInfoObject:&unk_1F0CB1B68 forKey:@"runningState"];
  [v8 publish];
  return v8;
}

- (void)removeProgressSubscriber:(id)a3
{
}

- (id)addProgressSubscriberUsingPublishingHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F28F90];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__WFWorkflowRunningContext_addProgressSubscriberUsingPublishingHandler___block_invoke;
  v9[3] = &unk_1E6079330;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 _addSubscriberForCategory:@"com.apple.shortcuts.progress" usingPublishingHandler:v9];

  return v7;
}

id __72__WFWorkflowRunningContext_addProgressSubscriberUsingPublishingHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"contextIdentifier"];
  id v6 = [*(id *)(a1 + 32) identifier];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    char v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)isShortcutsApp
{
  v2 = [(WFWorkflowRunningContext *)self originatingBundleIdentifier];
  char v3 = VCIsShortcutsAppBundleIdentifier(v2);

  return v3;
}

- (BOOL)allowsDialogNotifications
{
  return ![(WFWorkflowRunningContext *)self isShortcutsApp] && self->_allowsDialogNotifications;
}

- (WFWorkflowRunningContext)initWithWorkflowIdentifier:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFWorkflowRunningContext;
  v5 = [(WFWorkflowRunningContext *)&v17 init];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    uint64_t v9 = [v4 copy];
    workflowIdentifier = v5->_workflowIdentifier;
    v5->_workflowIdentifier = (NSString *)v9;

    uint64_t v11 = [NSString stringWithFormat:@"com.apple.shortcuts.%@", v5->_identifier];
    progressCategory = v5->_progressCategory;
    v5->_progressCategory = (NSString *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v13;

    v5->_outputBehavior = 0;
    *(_DWORD *)&v5->_stepwise = 0x1000000;
    v15 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end