@interface WFLinkSnippetEnvironmentDialogRequest
+ (BOOL)supportsSecureCoding;
- (WFLinkSnippetEnvironmentDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4;
- (WFLinkSnippetEnvironmentDialogRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkSnippetEnvironmentDialogRequest

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  [(WFDialogRequest *)&v3 encodeWithCoder:a3];
}

- (WFLinkSnippetEnvironmentDialogRequest)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  return [(WFDialogRequest *)&v4 initWithCoder:a3];
}

- (WFLinkSnippetEnvironmentDialogRequest)initWithAttribution:(id)a3 prompt:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFLinkSnippetEnvironmentDialogRequest;
  return [(WFDialogRequest *)&v5 initWithAttribution:a3 prompt:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end