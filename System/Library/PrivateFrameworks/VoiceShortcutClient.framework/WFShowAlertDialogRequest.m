@interface WFShowAlertDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (WFDialogButton)cancelButton;
- (WFDialogButton)okButton;
- (WFShowAlertDialogRequest)initWithCoder:(id)a3;
- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 cancelButton:(id)a5 attribution:(id)a6;
- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFShowAlertDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
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
  v8.receiver = self;
  v8.super_class = (Class)WFShowAlertDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v8 encodeWithCoder:v4];
  v5 = [(WFShowAlertDialogRequest *)self message];
  [v4 encodeObject:v5 forKey:@"message"];

  v6 = [(WFShowAlertDialogRequest *)self okButton];
  [v4 encodeObject:v6 forKey:@"okButton"];

  v7 = [(WFShowAlertDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];
}

- (WFShowAlertDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShowAlertDialogRequest;
  v5 = [(WFDialogRequest *)&v14 initWithCoder:v4];
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

    v12 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDialogRequest *)self attribution];
  v7 = [v6 title];
  uint64_t v8 = [(WFDialogRequest *)self prompt];
  v9 = [(WFShowAlertDialogRequest *)self message];
  uint64_t v10 = [(WFShowAlertDialogRequest *)self okButton];
  v11 = [(WFShowAlertDialogRequest *)self cancelButton];
  v12 = [v3 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, message: %@, okButton: %@, cancelButton: %@>", v5, self, v7, v8, v9, v10, v11];

  return v12;
}

- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 okButton:(id)a5 cancelButton:(id)a6 attribution:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)WFShowAlertDialogRequest;
  v15 = [(WFDialogRequest *)&v24 initWithAttribution:a7 prompt:a3];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    message = v15->_message;
    v15->_message = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    okButton = v15->_okButton;
    v15->_okButton = (WFDialogButton *)v18;

    uint64_t v20 = [v14 copy];
    cancelButton = v15->_cancelButton;
    v15->_cancelButton = (WFDialogButton *)v20;

    v22 = v15;
  }

  return v15;
}

- (WFShowAlertDialogRequest)initWithPrompt:(id)a3 message:(id)a4 cancelButton:(id)a5 attribution:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[WFDialogButton okButton];
  v15 = [(WFShowAlertDialogRequest *)self initWithPrompt:v13 message:v12 okButton:v14 cancelButton:v11 attribution:v10];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end