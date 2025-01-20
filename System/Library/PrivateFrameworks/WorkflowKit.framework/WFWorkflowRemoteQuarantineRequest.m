@interface WFWorkflowRemoteQuarantineRequest
+ (id)JSONKeyPathsByPropertyKey;
- (NSDictionary)workflowJavaScriptCoreRepresentation;
- (WFWorkflowRecord)workflowRecord;
- (WFWorkflowRemoteQuarantineRequest)initWithWorkflowRecord:(id)a3;
- (id)defaultLocalizedDeniedErrorMessage;
- (id)defaultLocalizedDeniedErrorTitle;
- (id)javaScriptCoreRepresentationWithError:(id *)a3;
- (id)policyFunctionName;
- (id)workflowJavaScriptCoreRepresentationWithError:(id *)a3;
- (id)workflowName;
- (void)setWorkflowJavaScriptCoreRepresentation:(id)a3;
@end

@implementation WFWorkflowRemoteQuarantineRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowJavaScriptCoreRepresentation, 0);
  objc_storeStrong((id *)&self->_workflowRecord, 0);
}

- (void)setWorkflowJavaScriptCoreRepresentation:(id)a3
{
}

- (NSDictionary)workflowJavaScriptCoreRepresentation
{
  return self->_workflowJavaScriptCoreRepresentation;
}

- (WFWorkflowRecord)workflowRecord
{
  return self->_workflowRecord;
}

- (id)policyFunctionName
{
  return @"decidePolicyForWorkflowQuarantineRequest";
}

- (id)javaScriptCoreRepresentationWithError:(id *)a3
{
  v5 = [(WFWorkflowRemoteQuarantineRequest *)self workflowJavaScriptCoreRepresentation];

  if (!v5)
  {
    v6 = [(WFWorkflowRemoteQuarantineRequest *)self workflowJavaScriptCoreRepresentationWithError:a3];
    if (!v6) {
      goto LABEL_5;
    }
    v7 = v6;
    [(WFWorkflowRemoteQuarantineRequest *)self setWorkflowJavaScriptCoreRepresentation:v6];
  }
  v9.receiver = self;
  v9.super_class = (Class)WFWorkflowRemoteQuarantineRequest;
  v6 = [(WFBaseRemoteQuarantineRequest *)&v9 javaScriptCoreRepresentationWithError:a3];
LABEL_5:
  return v6;
}

- (id)defaultLocalizedDeniedErrorMessage
{
  return &stru_1F229A4D8;
}

- (id)defaultLocalizedDeniedErrorTitle
{
  v3 = NSString;
  v4 = WFLocalizedString(@"“%@” contains known malware. You should delete this shortcut.");
  v5 = [(WFWorkflowRemoteQuarantineRequest *)self workflowName];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (id)workflowJavaScriptCoreRepresentationWithError:(id *)a3
{
  v4 = [(WFWorkflowRemoteQuarantineRequest *)self workflowRecord];
  v5 = [v4 fileRepresentation];

  v6 = [v5 rootObject];
  v7 = (void *)[v6 mutableCopy];

  v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  objc_super v9 = [v8 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];
  [v7 setValue:v9 forKey:@"WFCurrentBundleVersion"];

  v10 = [(WFWorkflowRemoteQuarantineRequest *)self workflowName];
  [v7 setValue:v10 forKey:@"WFWorkflowName"];

  v11 = WFJavaScriptCoreRepresentationFromPropertyList();

  return v11;
}

- (id)workflowName
{
  v2 = [(WFWorkflowRemoteQuarantineRequest *)self workflowRecord];
  v3 = [v2 name];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[WFWorkflow defaultName];
  }
  v6 = v5;

  return v6;
}

- (WFWorkflowRemoteQuarantineRequest)initWithWorkflowRecord:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowRemoteQuarantineRequest;
  v6 = [(WFBaseRemoteQuarantineRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workflowRecord, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFWorkflowRemoteQuarantineRequest;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7 = @"workflowJavaScriptCoreRepresentation";
  v8[0] = @"workflow";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end