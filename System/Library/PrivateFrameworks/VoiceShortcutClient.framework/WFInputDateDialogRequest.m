@interface WFInputDateDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSString)message;
- (WFDatePickerConfiguration)configuration;
- (WFDialogButton)cancelButton;
- (WFDialogButton)doneButton;
- (WFInputDateDialogRequest)initWithCoder:(id)a3;
- (WFInputDateDialogRequest)initWithDatePickerConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)overrideDoneButtonTitle:(id)a3;
@end

@implementation WFInputDateDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
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

- (WFDatePickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFInputDateDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v9 encodeWithCoder:v4];
  v5 = [(WFInputDateDialogRequest *)self configuration];
  [v4 encodeObject:v5 forKey:@"configuration"];

  v6 = [(WFInputDateDialogRequest *)self message];
  [v4 encodeObject:v6 forKey:@"message"];

  v7 = [(WFInputDateDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];

  v8 = [(WFInputDateDialogRequest *)self doneButton];
  [v4 encodeObject:v8 forKey:@"doneButton"];
}

- (WFInputDateDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WFInputDateDialogRequest;
  v5 = [(WFDialogRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
    configuration = v5->_configuration;
    v5->_configuration = (WFDatePickerConfiguration *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v5->_message;
    v5->_message = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)overrideDoneButtonTitle:(id)a3
{
  id v4 = a3;
  v5 = [WFDialogButton alloc];
  id v8 = [(WFInputDateDialogRequest *)self doneButton];
  uint64_t v6 = -[WFDialogButton initWithTitle:style:](v5, "initWithTitle:style:", v4, [v8 style]);

  doneButton = self->_doneButton;
  self->_doneButton = v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFDialogRequest *)self attribution];
  v7 = [v6 title];
  id v8 = [(WFDialogRequest *)self prompt];
  objc_super v9 = [(WFInputDateDialogRequest *)self message];
  uint64_t v10 = [(WFInputDateDialogRequest *)self configuration];
  v11 = [(WFInputDateDialogRequest *)self cancelButton];
  uint64_t v12 = [(WFInputDateDialogRequest *)self doneButton];
  v13 = [v3 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, message: %@, configuration: %@, cancelButton: %@, doneButton: %@>", v5, self, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (WFInputDateDialogRequest)initWithDatePickerConfiguration:(id)a3 message:(id)a4 attribution:(id)a5 prompt:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v23.receiver = self;
  v23.super_class = (Class)WFInputDateDialogRequest;
  v13 = [(WFDialogRequest *)&v23 initWithAttribution:a5 prompt:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, a3);
    uint64_t v15 = [v12 copy];
    message = v14->_message;
    v14->_message = (NSString *)v15;

    uint64_t v17 = +[WFDialogButton cancelButton];
    cancelButton = v14->_cancelButton;
    v14->_cancelButton = (WFDialogButton *)v17;

    uint64_t v19 = +[WFDialogButton doneButton];
    doneButton = v14->_doneButton;
    v14->_doneButton = (WFDialogButton *)v19;

    v21 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end