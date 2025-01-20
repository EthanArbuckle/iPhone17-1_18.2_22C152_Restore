@interface WFInputTextDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMultilineTextEntry;
- (NSString)message;
- (NSString)parameterKey;
- (WFDialogButton)cancelButton;
- (WFDialogButton)doneButton;
- (WFInputTextDialogRequest)initWithCoder:(id)a3;
- (WFInputTextDialogRequest)initWithTextFieldConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6 parameterKey:(id)a7;
- (WFTextFieldConfiguration)textFieldConfiguration;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFInputTextDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_textFieldConfiguration, 0);
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (NSString)message
{
  return self->_message;
}

- (WFTextFieldConfiguration)textFieldConfiguration
{
  return self->_textFieldConfiguration;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFInputTextDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v10 encodeWithCoder:v4];
  v5 = [(WFInputTextDialogRequest *)self textFieldConfiguration];
  [v4 encodeObject:v5 forKey:@"textFieldConfiguration"];

  v6 = [(WFInputTextDialogRequest *)self message];
  [v4 encodeObject:v6 forKey:@"message"];

  v7 = [(WFInputTextDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];

  v8 = [(WFInputTextDialogRequest *)self doneButton];
  [v4 encodeObject:v8 forKey:@"doneButton"];

  v9 = [(WFInputTextDialogRequest *)self parameterKey];
  [v4 encodeObject:v9 forKey:@"parameterKey"];
}

- (WFInputTextDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFInputTextDialogRequest;
  v5 = [(WFDialogRequest *)&v18 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textFieldConfiguration"];
    textFieldConfiguration = v5->_textFieldConfiguration;
    v5->_textFieldConfiguration = (WFTextFieldConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v14;

    v16 = v5;
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
  v9 = [(WFInputTextDialogRequest *)self message];
  uint64_t v10 = [(WFInputTextDialogRequest *)self textFieldConfiguration];
  v11 = [(WFInputTextDialogRequest *)self cancelButton];
  uint64_t v12 = [(WFInputTextDialogRequest *)self doneButton];
  v13 = [v3 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, message: %@, configuration: %@, cancelButton: %@, doneButton: %@>", v5, self, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (BOOL)hasMultilineTextEntry
{
  v2 = [(WFInputTextDialogRequest *)self textFieldConfiguration];
  char v3 = [v2 isMultiline];

  return v3;
}

- (WFInputTextDialogRequest)initWithTextFieldConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6 parameterKey:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = a5;
  v17 = [v16 appBundleIdentifier];
  if ([v17 isEqualToString:@"com.apple.mobilenotes"])
  {

LABEL_4:
    id v20 = 0;
    int v21 = 1;
    goto LABEL_6;
  }
  objc_super v18 = [v12 placeholder];
  int v19 = [v18 isEqualToString:v14];

  if (v19) {
    goto LABEL_4;
  }
  int v21 = 0;
  id v20 = v14;
LABEL_6:
  v36.receiver = self;
  v36.super_class = (Class)WFInputTextDialogRequest;
  v22 = [(WFDialogRequest *)&v36 initWithAttribution:v16 prompt:v20];

  if (v22)
  {
    uint64_t v23 = [v12 copy];
    textFieldConfiguration = v22->_textFieldConfiguration;
    v22->_textFieldConfiguration = (WFTextFieldConfiguration *)v23;

    uint64_t v25 = [v13 copy];
    message = v22->_message;
    v22->_message = (NSString *)v25;

    uint64_t v27 = +[WFDialogButton cancelButton];
    cancelButton = v22->_cancelButton;
    v22->_cancelButton = (WFDialogButton *)v27;

    uint64_t v29 = +[WFDialogButton doneButton];
    doneButton = v22->_doneButton;
    v22->_doneButton = (WFDialogButton *)v29;

    uint64_t v31 = [v15 copy];
    parameterKey = v22->_parameterKey;
    v22->_parameterKey = (NSString *)v31;

    if (v21)
    {
      v33 = [(WFInputTextDialogRequest *)v22 textFieldConfiguration];
      [v33 setPlaceholder:v14];
    }
    v34 = v22;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end