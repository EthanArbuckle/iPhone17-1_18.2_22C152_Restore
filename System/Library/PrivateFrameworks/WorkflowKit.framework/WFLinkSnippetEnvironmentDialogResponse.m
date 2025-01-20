@interface WFLinkSnippetEnvironmentDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (LNSnippetEnvironment)environment;
- (WFLinkSnippetEnvironmentDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFLinkSnippetEnvironmentDialogResponse)initWithCancelled:(BOOL)a3;
- (WFLinkSnippetEnvironmentDialogResponse)initWithCoder:(id)a3;
- (WFLinkSnippetEnvironmentDialogResponse)initWithEnvironment:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkSnippetEnvironmentDialogResponse

- (void).cxx_destruct
{
}

- (LNSnippetEnvironment)environment
{
  return self->_environment;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFLinkSnippetEnvironmentDialogResponse *)self environment];
  [v4 encodeObject:v5 forKey:@"environment"];
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    environment = v5->_environment;
    v5->_environment = (LNSnippetEnvironment *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFLinkSnippetEnvironmentDialogResponse *)self environment];
  [v4 encodeObject:v5 forKey:@"environment"];
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
    environment = v5->_environment;
    v5->_environment = (LNSnippetEnvironment *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithCancelled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  return [(WFDialogResponse *)&v4 initWithCancelled:a3];
}

- (WFLinkSnippetEnvironmentDialogResponse)initWithEnvironment:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSnippetEnvironmentDialogResponse;
  uint64_t v6 = [(WFDialogResponse *)&v10 initWithResponseCode:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_environment, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end