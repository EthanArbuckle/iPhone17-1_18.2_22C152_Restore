@interface WFConfirmInteractionDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldDismissDialogInTransientMode;
- (NSString)description;
- (WFConfirmInteractionDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFConfirmInteractionDialogResponse)initWithCoder:(id)a3;
- (WFConfirmInteractionDialogResponse)initWithInteractionResponseCode:(unint64_t)a3;
- (unint64_t)interactionResponseCode;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConfirmInteractionDialogResponse

- (unint64_t)interactionResponseCode
{
  return self->_interactionResponseCode;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFConfirmInteractionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFConfirmInteractionDialogResponse interactionResponseCode](self, "interactionResponseCode", v5.receiver, v5.super_class), @"interactionResponseCode");
}

- (WFConfirmInteractionDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFConfirmInteractionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_interactionResponseCode = [v4 decodeInt64ForKey:@"interactionResponseCode"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFConfirmInteractionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFConfirmInteractionDialogResponse interactionResponseCode](self, "interactionResponseCode", v5.receiver, v5.super_class), @"interactionResponseCode");
}

- (WFConfirmInteractionDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFConfirmInteractionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_interactionResponseCode = [v4 decodeIntegerForKey:@"interactionResponseCode"];
    v6 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  int64_t v6 = [(WFDialogResponse *)self responseCode];
  if ((unint64_t)(v6 - 1) > 2) {
    v7 = @"Cancelled";
  }
  else {
    v7 = *(&off_1E6078808 + v6 - 1);
  }
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p, responseCode: %@>", v5, self, v7];

  return (NSString *)v8;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 0;
}

- (WFConfirmInteractionDialogResponse)initWithInteractionResponseCode:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFConfirmInteractionDialogResponse;
  id v4 = [(WFDialogResponse *)&v8 initWithCancelled:a3 == 0];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_interactionResponseCode = a3;
    int64_t v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end