@interface WFPresentedDialog
- (WFDialogRequest)request;
- (WFDialogResponse)response;
- (WFPresentedDialog)initWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5 completionHandler:(id)a6;
- (WFWorkflowRunningContext)context;
- (id)completionHandler;
- (unint64_t)presentationMode;
- (void)setResponse:(id)a3;
@end

@implementation WFPresentedDialog

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (WFWorkflowRunningContext)context
{
  return self->_context;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setResponse:(id)a3
{
}

- (WFDialogResponse)response
{
  return self->_response;
}

- (WFDialogRequest)request
{
  return self->_request;
}

- (WFPresentedDialog)initWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFPresentedDialog;
  v14 = [(WFPresentedDialog *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    v15->_presentationMode = a4;
    objc_storeStrong((id *)&v15->_context, a5);
    uint64_t v16 = [v13 copy];
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = (id)v16;

    v18 = v15;
  }

  return v15;
}

@end