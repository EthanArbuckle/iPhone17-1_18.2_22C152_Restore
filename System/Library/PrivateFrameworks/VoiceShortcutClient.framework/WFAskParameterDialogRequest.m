@interface WFAskParameterDialogRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)focusImmediatelyWhenPresented;
- (NSDictionary)serializedParameterStates;
- (NSString)actionIdentifier;
- (NSString)parameterKey;
- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 doneButton:(id)a9 focusImmediatelyWhenPresented:(BOOL)a10;
- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 focusImmediatelyWhenPresented:(BOOL)a9;
- (WFAskParameterDialogRequest)initWithCoder:(id)a3;
- (WFDialogButton)cancelButton;
- (WFDialogButton)doneButton;
- (id)description;
- (id)requestBySettingFocusImmediatelyWhenPresented:(BOOL)a3;
- (int64_t)style;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAskParameterDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_serializedParameterStates, 0);
  objc_storeStrong((id *)&self->_parameterKey, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (BOOL)focusImmediatelyWhenPresented
{
  return self->_focusImmediatelyWhenPresented;
}

- (WFDialogButton)doneButton
{
  return self->_doneButton;
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (int64_t)style
{
  return self->_style;
}

- (NSDictionary)serializedParameterStates
{
  return self->_serializedParameterStates;
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFAskParameterDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v10 encodeWithCoder:v4];
  v5 = [(WFAskParameterDialogRequest *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  v6 = [(WFAskParameterDialogRequest *)self parameterKey];
  [v4 encodeObject:v6 forKey:@"parameterKey"];

  v7 = [(WFAskParameterDialogRequest *)self serializedParameterStates];
  [v4 encodeObject:v7 forKey:@"serializedParameterStates"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAskParameterDialogRequest style](self, "style"), @"style");
  v8 = [(WFAskParameterDialogRequest *)self cancelButton];
  [v4 encodeObject:v8 forKey:@"cancelButton"];

  v9 = [(WFAskParameterDialogRequest *)self doneButton];
  [v4 encodeObject:v9 forKey:@"doneButton"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFAskParameterDialogRequest focusImmediatelyWhenPresented](self, "focusImmediatelyWhenPresented"), @"focusImmediatelyWhenPresented");
}

- (WFAskParameterDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WFAskParameterDialogRequest;
  v5 = [(WFDialogRequest *)&v25 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v8;

    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"serializedParameterStates"];
    serializedParameterStates = v5->_serializedParameterStates;
    v5->_serializedParameterStates = (NSDictionary *)v17;

    v5->_style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelButton"];
    cancelButton = v5->_cancelButton;
    v5->_cancelButton = (WFDialogButton *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"doneButton"];
    doneButton = v5->_doneButton;
    v5->_doneButton = (WFDialogButton *)v21;

    v5->_focusImmediatelyWhenPresented = [v4 decodeBoolForKey:@"focusImmediatelyWhenPresented"];
    v23 = v5;
  }

  return v5;
}

- (id)requestBySettingFocusImmediatelyWhenPresented:(BOOL)a3
{
  v5 = [WFAskParameterDialogRequest alloc];
  uint64_t v6 = [(WFAskParameterDialogRequest *)self actionIdentifier];
  v7 = [(WFAskParameterDialogRequest *)self parameterKey];
  uint64_t v8 = [(WFAskParameterDialogRequest *)self serializedParameterStates];
  int64_t v9 = [(WFAskParameterDialogRequest *)self style];
  objc_super v10 = [(WFDialogRequest *)self attribution];
  uint64_t v11 = [(WFDialogRequest *)self prompt];
  LOBYTE(v14) = a3;
  uint64_t v12 = [(WFAskParameterDialogRequest *)v5 initWithActionIdentifier:v6 parameterKey:v7 serializedParameterStates:v8 style:v9 attribution:v10 prompt:v11 focusImmediatelyWhenPresented:v14];

  return v12;
}

- (id)description
{
  uint64_t v17 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v18 = [(WFDialogRequest *)self attribution];
  v5 = [v18 title];
  uint64_t v6 = [(WFDialogRequest *)self prompt];
  v7 = [(WFAskParameterDialogRequest *)self actionIdentifier];
  uint64_t v8 = [(WFAskParameterDialogRequest *)self parameterKey];
  int64_t v9 = [(WFAskParameterDialogRequest *)self serializedParameterStates];
  int64_t v10 = [(WFAskParameterDialogRequest *)self style];
  uint64_t v11 = @"Inline";
  if (v10 == 1) {
    uint64_t v11 = @"Modal";
  }
  uint64_t v12 = v11;
  uint64_t v13 = [(WFAskParameterDialogRequest *)self cancelButton];
  uint64_t v14 = [(WFAskParameterDialogRequest *)self doneButton];
  uint64_t v15 = [v17 stringWithFormat:@"<%@: %p, title: %@, prompt: %@, actionIdentifier: %@, parameterKey: %@, serializedParameterStates: %@, style: %@, cancelButton: %@, doneButton: %@>", v4, self, v5, v6, v7, v8, v9, v12, v13, v14];

  return v15;
}

- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 focusImmediatelyWhenPresented:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = +[WFDialogButton doneButton];
  LOBYTE(v23) = a9;
  uint64_t v21 = [(WFAskParameterDialogRequest *)self initWithActionIdentifier:v19 parameterKey:v18 serializedParameterStates:v17 style:a6 attribution:v16 prompt:v15 doneButton:v20 focusImmediatelyWhenPresented:v23];

  return v21;
}

- (WFAskParameterDialogRequest)initWithActionIdentifier:(id)a3 parameterKey:(id)a4 serializedParameterStates:(id)a5 style:(int64_t)a6 attribution:(id)a7 prompt:(id)a8 doneButton:(id)a9 focusImmediatelyWhenPresented:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)WFAskParameterDialogRequest;
  v20 = [(WFDialogRequest *)&v29 initWithAttribution:a7 prompt:a8];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    actionIdentifier = v20->_actionIdentifier;
    v20->_actionIdentifier = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    parameterKey = v20->_parameterKey;
    v20->_parameterKey = (NSString *)v23;

    objc_storeStrong((id *)&v20->_serializedParameterStates, a5);
    v20->_style = a6;
    uint64_t v25 = +[WFDialogButton cancelButton];
    cancelButton = v20->_cancelButton;
    v20->_cancelButton = (WFDialogButton *)v25;

    objc_storeStrong((id *)&v20->_doneButton, a9);
    v20->_focusImmediatelyWhenPresented = a10;
    v27 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end