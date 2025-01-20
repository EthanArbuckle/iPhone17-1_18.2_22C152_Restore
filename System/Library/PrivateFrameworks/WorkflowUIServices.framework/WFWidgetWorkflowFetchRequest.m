@interface WFWidgetWorkflowFetchRequest
- (NSString)identifier;
- (WFWidgetWorkflowFetchRequest)initWithFetchType:(unint64_t)a3 identifier:(id)a4 limit:(unint64_t)a5 retryCount:(unint64_t)a6 completionHandler:(id)a7;
- (id)completionHandler;
- (id)description;
- (unint64_t)limit;
- (unint64_t)retryCount;
- (unint64_t)type;
@end

@implementation WFWidgetWorkflowFetchRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WFWidgetWorkflowFetchRequest;
  v4 = [(WFWidgetWorkflowFetchRequest *)&v9 description];
  if ([(WFWidgetWorkflowFetchRequest *)self type]) {
    v5 = @"collection";
  }
  else {
    v5 = @"single workflow";
  }
  v6 = [(WFWidgetWorkflowFetchRequest *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@, type: %@, identifier: %@, limit: %lu, retryCount: %lu>", v4, v5, v6, -[WFWidgetWorkflowFetchRequest limit](self, "limit"), -[WFWidgetWorkflowFetchRequest retryCount](self, "retryCount")];

  return v7;
}

- (WFWidgetWorkflowFetchRequest)initWithFetchType:(unint64_t)a3 identifier:(id)a4 limit:(unint64_t)a5 retryCount:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFWidgetWorkflowFetchRequest;
  v14 = [(WFWidgetWorkflowFetchRequest *)&v22 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    uint64_t v16 = [v12 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v15->_limit = a5;
    v15->_retryCount = a6;
    uint64_t v18 = [v13 copy];
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = (id)v18;

    v20 = v15;
  }

  return v15;
}

@end