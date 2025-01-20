@interface WFWorkflowAuthorizationConfiguration
+ (BOOL)supportsSecureCoding;
- (NSString)localizedMessage;
- (NSString)localizedPrompt;
- (WFWorkflowAuthorizationConfiguration)init;
- (WFWorkflowAuthorizationConfiguration)initWithCoder:(id)a3;
- (id)authorizationDialogRequestWithAttribution:(id)a3;
- (id)siriDialogAlertWithCompletionHandler:(id)a3;
@end

@implementation WFWorkflowAuthorizationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (WFWorkflowAuthorizationConfiguration)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFWorkflowAuthorizationConfiguration;
  return [(WFWorkflowAuthorizationConfiguration *)&v4 init];
}

- (WFWorkflowAuthorizationConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)WFWorkflowAuthorizationConfiguration;
  return [(WFWorkflowAuthorizationConfiguration *)&v3 init];
}

- (id)siriDialogAlertWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[WFWorkflowAuthorizationConfiguration siriDialogAlert] must be overridden"];
  __break(1u);
  return result;
}

- (id)authorizationDialogRequestWithAttribution:(id)a3
{
  id v3 = a3;
  id result = (id)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"+[WFWorkflowAuthorizationConfiguration authorizationDialogRequest] must be overridden"];
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end