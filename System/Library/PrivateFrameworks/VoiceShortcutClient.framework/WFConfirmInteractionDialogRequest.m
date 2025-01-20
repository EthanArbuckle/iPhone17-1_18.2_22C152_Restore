@interface WFConfirmInteractionDialogRequest
+ (BOOL)supportsSecureCoding;
- (INInteraction)interaction;
- (WFConfirmInteractionDialogRequest)initWithCoder:(id)a3;
- (WFConfirmInteractionDialogRequest)initWithInteraction:(id)a3 prompt:(id)a4;
- (WFDialogButton)cancelButton;
- (WFDialogButton)confirmButton;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConfirmInteractionDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

- (WFDialogButton)cancelButton
{
  return self->_cancelButton;
}

- (WFDialogButton)confirmButton
{
  return self->_confirmButton;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFConfirmInteractionDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v8 encodeWithCoder:v4];
  v5 = [(WFConfirmInteractionDialogRequest *)self interaction];
  [v4 encodeObject:v5 forKey:@"interaction"];

  v6 = [(WFConfirmInteractionDialogRequest *)self confirmButton];
  [v4 encodeObject:v6 forKey:@"confirmButton"];

  v7 = [(WFConfirmInteractionDialogRequest *)self cancelButton];
  [v4 encodeObject:v7 forKey:@"cancelButton"];
}

- (WFConfirmInteractionDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFConfirmInteractionDialogRequest;
  v5 = [(WFDialogRequest *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interaction"];
    interaction = v5->_interaction;
    v5->_interaction = (INInteraction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"confirmButton"];
    confirmButton = v5->_confirmButton;
    v5->_confirmButton = (WFDialogButton *)v8;

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
  uint64_t v8 = [(WFConfirmInteractionDialogRequest *)self interaction];
  v9 = [(WFConfirmInteractionDialogRequest *)self confirmButton];
  uint64_t v10 = [(WFConfirmInteractionDialogRequest *)self cancelButton];
  v11 = [v3 stringWithFormat:@"<%@: %p, title: %@, interaction: %@, confirmButton: %@, cancelButton: %@>", v5, self, v7, v8, v9, v10];

  return v11;
}

- (WFConfirmInteractionDialogRequest)initWithInteraction:(id)a3 prompt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 intent];
  v9 = objc_msgSend(v8, "_intents_bundleIdForDisplay");

  uint64_t v10 = +[WFDialogAttribution attributionWithAppBundleIdentifier:v9];
  v22.receiver = self;
  v22.super_class = (Class)WFConfirmInteractionDialogRequest;
  v11 = [(WFDialogRequest *)&v22 initWithAttribution:v10 prompt:v7];

  if (v11)
  {
    uint64_t v12 = [v6 copy];
    interaction = v11->_interaction;
    v11->_interaction = (INInteraction *)v12;

    objc_super v14 = [v6 intent];
    v15 = [v14 _categoryVerb];
    uint64_t v16 = +[WFDialogButton defaultButtonWithTitle:v15];
    confirmButton = v11->_confirmButton;
    v11->_confirmButton = (WFDialogButton *)v16;

    uint64_t v18 = +[WFDialogButton cancelButton];
    cancelButton = v11->_cancelButton;
    v11->_cancelButton = (WFDialogButton *)v18;

    v20 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end