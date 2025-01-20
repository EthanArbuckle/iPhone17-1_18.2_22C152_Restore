@interface WFRequestAuthorizationDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (WFRequestAuthorizationDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFRequestAuthorizationDialogResponse)initWithCoder:(id)a3;
- (WFRequestAuthorizationDialogResponse)initWithResponseCode:(int64_t)a3;
- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3;
- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3 cancelled:(BOOL)a4;
- (unint64_t)result;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRequestAuthorizationDialogResponse

- (unint64_t)result
{
  return self->_result;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFRequestAuthorizationDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFRequestAuthorizationDialogResponse result](self, "result", v5.receiver, v5.super_class), @"result");
}

- (WFRequestAuthorizationDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFRequestAuthorizationDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithBSXPCCoder:v4];
  if (v5)
  {
    v5->_result = [v4 decodeInt64ForKey:@"result"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFRequestAuthorizationDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFRequestAuthorizationDialogResponse result](self, "result", v5.receiver, v5.super_class), @"result");
}

- (WFRequestAuthorizationDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFRequestAuthorizationDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_result = [v4 decodeIntegerForKey:@"result"];
    v6 = v5;
  }

  return v5;
}

- (WFRequestAuthorizationDialogResponse)initWithResponseCode:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFRequestAuthorizationDialogResponse;
  v3 = [(WFDialogResponse *)&v7 initWithResponseCode:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_result = 0;
    objc_super v5 = v3;
  }

  return v4;
}

- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3 cancelled:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFRequestAuthorizationDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v9 initWithCancelled:a4];
  v6 = v5;
  if (v5)
  {
    v5->_result = a3;
    objc_super v7 = v5;
  }

  return v6;
}

- (WFRequestAuthorizationDialogResponse)initWithResult:(unint64_t)a3
{
  return [(WFRequestAuthorizationDialogResponse *)self initWithResult:a3 cancelled:0];
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