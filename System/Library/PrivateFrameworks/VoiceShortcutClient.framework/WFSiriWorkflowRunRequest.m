@interface WFSiriWorkflowRunRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)handlesSiriActionRequests;
- (WFSiriWorkflowRunRequest)initWithCoder:(id)a3;
- (WFSiriWorkflowRunRequest)initWithOptions:(id)a3;
- (WFSiriWorkflowRunnerClientOptions)options;
- (void)encodeWithCoder:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation WFSiriWorkflowRunRequest

- (void).cxx_destruct
{
}

- (void)setOptions:(id)a3
{
}

- (WFSiriWorkflowRunnerClientOptions)options
{
  return self->_options;
}

- (BOOL)handlesSiriActionRequests
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFSiriWorkflowRunRequest;
  id v4 = a3;
  [(WFWorkflowRunRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFSiriWorkflowRunRequest *)self options];
  [v4 encodeObject:v5 forKey:@"options"];
}

- (WFSiriWorkflowRunRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriWorkflowRunRequest;
  v5 = [(WFWorkflowRunRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    options = v5->_options;
    v5->_options = (WFSiriWorkflowRunnerClientOptions *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFSiriWorkflowRunRequest)initWithOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFSiriWorkflowRunRequest;
  uint64_t v6 = [(WFWorkflowRunRequest *)&v10 initWithInput:0 presentationMode:4];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end