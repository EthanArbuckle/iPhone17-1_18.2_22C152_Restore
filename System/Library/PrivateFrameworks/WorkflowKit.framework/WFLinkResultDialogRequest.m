@interface WFLinkResultDialogRequest
+ (BOOL)supportsSecureCoding;
- (LNDialogResult)catResult;
- (LNSuccessResult)result;
- (WFDialogButton)doneButton;
- (WFLinkResultDialogRequest)initWithCoder:(id)a3;
- (WFLinkResultDialogRequest)initWithSuccessResult:(id)a3 attribution:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)getCATResultWithCompletionHandler:(id)a3;
- (void)setCatResult:(id)a3;
@end

@implementation WFLinkResultDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catResult, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)setCatResult:(id)a3
{
}

- (LNDialogResult)catResult
{
  return self->_catResult;
}

- (LNSuccessResult)result
{
  return self->_result;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFLinkResultDialogRequest;
  id v4 = a3;
  [(WFLinkSnippetDialogRequest *)&v7 encodeWithCoder:v4];
  v5 = [(WFLinkResultDialogRequest *)self result];
  [v4 encodeObject:v5 forKey:@"result"];

  v6 = [(WFLinkResultDialogRequest *)self doneButton];
  [v4 encodeObject:v6 forKey:@"doneButton"];
}

- (WFLinkResultDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFLinkResultDialogRequest;
  v5 = [(WFLinkSnippetDialogRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
    objc_super v7 = v5->_result;
    v5->_result = (LNSuccessResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)getCATResultWithCompletionHandler:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFLinkResultDialogRequest.m", 36, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v6 = [(WFLinkResultDialogRequest *)self catResult];

  if (v6)
  {
    objc_super v7 = [(WFLinkResultDialogRequest *)self catResult];
    v5[2](v5, v7);
  }
  else
  {
    uint64_t v8 = [(WFLinkResultDialogRequest *)self result];
    v9 = [v8 output];
    v10 = [v9 dialog];

    if (v10)
    {
      v11 = [(WFLinkResultDialogRequest *)self result];
      objc_super v12 = [v11 output];
      v13 = [v12 dialog];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __63__WFLinkResultDialogRequest_getCATResultWithCompletionHandler___block_invoke;
      v15[3] = &unk_1E65517E8;
      v15[4] = self;
      v16 = v5;
      [v13 getResultWithCompletionHandler:v15];
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

void __63__WFLinkResultDialogRequest_getCATResultWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_super v7 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      v10 = "-[WFLinkResultDialogRequest getCATResultWithCompletionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Could not get CATResult, error: %@", (uint8_t *)&v9, 0x16u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    [*(id *)(a1 + 32) setCatResult:v5];
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

- (WFLinkResultDialogRequest)initWithSuccessResult:(id)a3 attribution:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 output];
  int v9 = [v8 viewSnippet];
  v10 = [v6 output];
  v18.receiver = self;
  v18.super_class = (Class)WFLinkResultDialogRequest;
  __int16 v11 = -[WFLinkSnippetDialogRequest initWithViewSnippet:attribution:showPrompt:](&v18, sel_initWithViewSnippet_attribution_showPrompt_, v9, v7, [v10 shouldShowPrompt]);

  if (v11)
  {
    uint64_t v12 = [v6 copy];
    uint64_t v13 = v11->_result;
    v11->_result = (LNSuccessResult *)v12;

    uint64_t v14 = [MEMORY[0x1E4FB46C8] doneButton];
    doneButton = v11->_doneButton;
    v11->_doneButton = (WFDialogButton *)v14;

    v16 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end