@interface WFFollowUpActionExecutionDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldRunFollowUpAction;
- (WFFollowUpActionExecutionDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFFollowUpActionExecutionDialogResponse)initWithCoder:(id)a3;
- (WFFollowUpActionExecutionDialogResponse)initWithshouldRunFollowUpAction:(BOOL)a3;
- (id)description;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldRunFollowUpAction:(BOOL)a3;
@end

@implementation WFFollowUpActionExecutionDialogResponse

- (void)setShouldRunFollowUpAction:(BOOL)a3
{
  self->_shouldRunFollowUpAction = a3;
}

- (BOOL)shouldRunFollowUpAction
{
  return self->_shouldRunFollowUpAction;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFollowUpActionExecutionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFollowUpActionExecutionDialogResponse shouldRunFollowUpAction](self, "shouldRunFollowUpAction", v5.receiver, v5.super_class), @"shouldRunFollowUpAction");
}

- (WFFollowUpActionExecutionDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFFollowUpActionExecutionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_shouldRunFollowUpAction = [v4 decodeBoolForKey:@"shouldRunFollowUpAction"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFFollowUpActionExecutionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", -[WFFollowUpActionExecutionDialogResponse shouldRunFollowUpAction](self, "shouldRunFollowUpAction", v5.receiver, v5.super_class), @"shouldRunFollowUpAction");
}

- (WFFollowUpActionExecutionDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFFollowUpActionExecutionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_shouldRunFollowUpAction = [v4 decodeBoolForKey:@"shouldRunFollowUpAction"];
    v6 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, shouldRunFollowUpAction: %d>", v5, self, -[WFFollowUpActionExecutionDialogResponse shouldRunFollowUpAction](self, "shouldRunFollowUpAction")];

  return v6;
}

- (WFFollowUpActionExecutionDialogResponse)initWithshouldRunFollowUpAction:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFFollowUpActionExecutionDialogResponse;
  id v4 = [(WFDialogResponse *)&v8 initWithCancelled:0];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_shouldRunFollowUpAction = a3;
    v6 = v4;
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