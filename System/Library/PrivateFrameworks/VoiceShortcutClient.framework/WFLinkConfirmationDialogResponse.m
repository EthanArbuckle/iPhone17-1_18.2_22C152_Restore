@interface WFLinkConfirmationDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldDismissDialogInTransientMode;
- (WFLinkConfirmationDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFLinkConfirmationDialogResponse)initWithCoder:(id)a3;
- (WFLinkConfirmationDialogResponse)initWithConfirmationResponseCode:(unint64_t)a3;
- (WFLinkConfirmationDialogResponse)initWithRequestedOpenURL:(id)a3;
- (id)description;
- (unint64_t)requestResponseCode;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLinkConfirmationDialogResponse

- (unint64_t)requestResponseCode
{
  return self->_requestResponseCode;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLinkConfirmationDialogResponse;
  id v4 = a3;
  [(WFLinkSnippetDialogResponse *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), @"requestResponseCode");
}

- (WFLinkConfirmationDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  objc_super v5 = [(WFLinkSnippetDialogResponse *)&v8 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_requestResponseCode = [v4 decodeInt64ForKey:@"requestResponseCode"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFLinkConfirmationDialogResponse;
  id v4 = a3;
  [(WFLinkSnippetDialogResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), @"requestResponseCode");
}

- (WFLinkConfirmationDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  objc_super v5 = [(WFLinkSnippetDialogResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_requestResponseCode = [v4 decodeIntegerForKey:@"requestResponseCode"];
    v6 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p, requestResponseCode: %lu>", v5, self, -[WFLinkConfirmationDialogResponse requestResponseCode](self, "requestResponseCode")];

  return v6;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 0;
}

- (WFLinkConfirmationDialogResponse)initWithRequestedOpenURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFLinkConfirmationDialogResponse;
  v3 = [(WFLinkSnippetDialogResponse *)&v7 initWithRequestedOpenURL:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_requestResponseCode = 2;
    objc_super v5 = v3;
  }

  return v4;
}

- (WFLinkConfirmationDialogResponse)initWithConfirmationResponseCode:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFLinkConfirmationDialogResponse;
  id v4 = [(WFLinkSnippetDialogResponse *)&v8 initWithCancelled:a3 == 0];
  objc_super v5 = v4;
  if (v4)
  {
    v4->_requestResponseCode = a3;
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