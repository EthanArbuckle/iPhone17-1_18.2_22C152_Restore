@interface WFAppProtectionDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (WFAppProtectionDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFAppProtectionDialogResponse)initWithCoder:(id)a3;
- (WFAppProtectionDialogResponse)initWithResponseCode:(unint64_t)a3;
- (id)description;
- (unint64_t)requestResponseCode;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppProtectionDialogResponse

- (unint64_t)requestResponseCode
{
  return self->_requestResponseCode;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFAppProtectionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithBSXPCCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), @"requestResponseCode");
}

- (WFAppProtectionDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithBSXPCCoder:v4];
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
  v5.super_class = (Class)WFAppProtectionDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode", v5.receiver, v5.super_class), @"requestResponseCode");
}

- (WFAppProtectionDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  objc_super v5 = [(WFDialogResponse *)&v8 initWithCoder:v4];
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
  v6 = [v3 stringWithFormat:@"<%@: %p, requestResponseCode: %lu>", v5, self, -[WFAppProtectionDialogResponse requestResponseCode](self, "requestResponseCode")];

  return v6;
}

- (WFAppProtectionDialogResponse)initWithResponseCode:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAppProtectionDialogResponse;
  id v4 = [(WFDialogResponse *)&v8 initWithCancelled:a3 == 0];
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