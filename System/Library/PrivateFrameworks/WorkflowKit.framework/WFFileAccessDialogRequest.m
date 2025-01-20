@interface WFFileAccessDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldCenterPrompt;
- (NSArray)URLs;
- (NSString)message;
- (NSString)workflowID;
- (WFDialogButton)cancelButton;
- (WFDialogButton)okButton;
- (WFFileAccessDialogRequest)initWithCoder:(id)a3;
- (WFFileAccessDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7 workflowID:(id)a8 URLs:(id)a9;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFileAccessDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowID, 0);
  objc_storeStrong((id *)&self->_URLs, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (NSArray)URLs
{
  return self->_URLs;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)okButton
{
  return self->_okButton;
}

- (NSString)message
{
  return self->_message;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFFileAccessDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v10 encodeWithCoder:v4];
  v5 = [(WFFileAccessDialogRequest *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(WFFileAccessDialogRequest *)self okButton];
  [v4 encodeObject:v6 forKey:@"okButton"];

  v7 = [(WFFileAccessDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];

  v8 = [(WFFileAccessDialogRequest *)self workflowID];
  [v4 encodeObject:v8 forKey:@"workflowID"];

  v9 = [(WFFileAccessDialogRequest *)self URLs];
  [v4 encodeObject:v9 forKey:@"URLs"];
}

- (WFFileAccessDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFFileAccessDialogRequest;
  v5 = [(WFDialogRequest *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"okButton"];
    okButton = v5->_okButton;
    v5->_okButton = (WFDialogButton *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"workflowID"];
    workflowID = v5->_workflowID;
    v5->_workflowID = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"URLs"];
    URLs = v5->_URLs;
    v5->_URLs = (NSArray *)v17;

    v19 = v5;
  }

  return v5;
}

- (BOOL)shouldCenterPrompt
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDialogRequest *)self attribution];
  v7 = [v6 title];
  uint64_t v8 = [(WFDialogRequest *)self prompt];
  v9 = [(WFFileAccessDialogRequest *)self message];
  uint64_t v10 = [(WFFileAccessDialogRequest *)self okButton];
  v11 = [(WFFileAccessDialogRequest *)self cancelButton];
  uint64_t v12 = [(WFFileAccessDialogRequest *)self workflowID];
  v13 = [v3 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, message: %@, okButton: %@, cancelButton: %@, workflowID: %@>", v5, self, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (WFFileAccessDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7 workflowID:(id)a8 URLs:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if (!v21)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:a2, self, @"WFFileAccessDialogRequest.m", 15, @"Invalid parameter not satisfying: %@", @"workflowID" object file lineNumber description];
  }
  v35.receiver = self;
  v35.super_class = (Class)WFFileAccessDialogRequest;
  v23 = [(WFDialogRequest *)&v35 initWithAttribution:v20 prompt:v16];
  if (v23)
  {
    uint64_t v24 = [v17 copy];
    message = v23->_message;
    v23->_message = (NSString *)v24;

    uint64_t v26 = [v18 copy];
    okButton = v23->_okButton;
    v23->_okButton = (WFDialogButton *)v26;

    uint64_t v28 = [v19 copy];
    cancelButton = v23->_cancelButton;
    v23->_cancelButton = (WFDialogButton *)v28;

    uint64_t v30 = [v21 copy];
    workflowID = v23->_workflowID;
    v23->_workflowID = (NSString *)v30;

    objc_storeStrong((id *)&v23->_URLs, a9);
    v32 = v23;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end