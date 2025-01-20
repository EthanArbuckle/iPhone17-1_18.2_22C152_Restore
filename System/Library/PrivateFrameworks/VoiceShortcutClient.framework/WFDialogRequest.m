@interface WFDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMultilineTextEntry;
- (BOOL)isLastAction;
- (BOOL)requiresRunningShortcut;
- (BOOL)shouldCenterPrompt;
- (LNDialog)linkDialog;
- (NSString)prompt;
- (NSString)promptForDisplay;
- (WFDialogAttribution)attribution;
- (WFDialogRequest)initWithAppBundleIdentifier:(id)a3 prompt:(id)a4;
- (WFDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4;
- (WFDialogRequest)initWithCoder:(id)a3;
- (WFWorkflowRunViewSource)runViewSource;
- (void)encodeWithCoder:(id)a3;
- (void)setIsLastAction:(BOOL)a3;
- (void)setLinkDialog:(id)a3;
- (void)setRequiresRunningShortcut:(BOOL)a3;
- (void)setRunViewSource:(id)a3;
@end

@implementation WFDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkDialog, 0);
  objc_storeStrong((id *)&self->_runViewSource, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

- (void)setLinkDialog:(id)a3
{
}

- (LNDialog)linkDialog
{
  return self->_linkDialog;
}

- (void)setRequiresRunningShortcut:(BOOL)a3
{
  self->_requiresRunningShortcut = a3;
}

- (BOOL)requiresRunningShortcut
{
  return self->_requiresRunningShortcut;
}

- (void)setIsLastAction:(BOOL)a3
{
  self->_isLastAction = a3;
}

- (BOOL)isLastAction
{
  return self->_isLastAction;
}

- (void)setRunViewSource:(id)a3
{
}

- (WFWorkflowRunViewSource)runViewSource
{
  return self->_runViewSource;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (WFDialogAttribution)attribution
{
  return self->_attribution;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFDialogRequest *)self attribution];
  [v4 encodeObject:v5 forKey:@"attribution"];

  v6 = [(WFDialogRequest *)self prompt];
  [v4 encodeObject:v6 forKey:@"prompt"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogRequest requiresRunningShortcut](self, "requiresRunningShortcut"), @"requiresRunningShortcut");
  v7 = [(WFDialogRequest *)self runViewSource];
  [v4 encodeObject:v7 forKey:@"runViewSource"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogRequest isLastAction](self, "isLastAction"), @"isLastAction");
  id v8 = [(WFDialogRequest *)self linkDialog];
  [v4 encodeObject:v8 forKey:@"linkDialog"];
}

- (WFDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFDialogRequest;
  v5 = [(WFDialogRequest *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attribution"];
    attribution = v5->_attribution;
    v5->_attribution = (WFDialogAttribution *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prompt"];
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v8;

    v5->_requiresRunningShortcut = [v4 decodeBoolForKey:@"requiresRunningShortcut"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"runViewSource"];
    runViewSource = v5->_runViewSource;
    v5->_runViewSource = (WFWorkflowRunViewSource *)v10;

    v5->_isLastAction = [v4 decodeBoolForKey:@"isLastAction"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"linkDialog"];
    linkDialog = v5->_linkDialog;
    v5->_linkDialog = (LNDialog *)v12;

    v14 = v5;
  }

  return v5;
}

- (BOOL)hasMultilineTextEntry
{
  return 0;
}

- (BOOL)shouldCenterPrompt
{
  return 0;
}

- (NSString)promptForDisplay
{
  v2 = [(WFDialogRequest *)self prompt];
  if (v2)
  {
    v3 = +[WFTTSString parseAnnotatedString:v2];
    id v4 = [v3 displayString];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (WFDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFDialogRequest;
  v9 = [(WFDialogRequest *)&v15 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_attribution, a3);
    uint64_t v11 = [v8 copy];
    prompt = v10->_prompt;
    v10->_prompt = (NSString *)v11;

    v10->_requiresRunningShortcut = 1;
    v13 = v10;
  }

  return v10;
}

- (WFDialogRequest)initWithAppBundleIdentifier:(id)a3 prompt:(id)a4
{
  id v6 = a4;
  id v7 = +[WFDialogAttribution attributionWithAppBundleIdentifier:a3];
  id v8 = [(WFDialogRequest *)self initWithAttribution:v7 prompt:v6];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end