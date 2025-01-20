@interface WFDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isCancelled;
- (BOOL)shouldDismissDialogInTransientMode;
- (NSString)description;
- (WFDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFDialogResponse)initWithCancelled:(BOOL)a3;
- (WFDialogResponse)initWithCoder:(id)a3;
- (WFDialogResponse)initWithResponseCode:(int64_t)a3;
- (int64_t)responseCode;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFDialogResponse

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[WFDialogResponse responseCode](self, "responseCode"), @"responseCode");
}

- (WFDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  v5 = [(WFDialogResponse *)&v8 init];
  if (v5)
  {
    v5->_responseCode = [v4 decodeInt64ForKey:@"responseCode"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WFDialogResponse responseCode](self, "responseCode"), @"responseCode");
}

- (WFDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  v5 = [(WFDialogResponse *)&v8 init];
  if (v5)
  {
    v5->_responseCode = [v4 decodeIntegerForKey:@"responseCode"];
    v6 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  int64_t v6 = [(WFDialogResponse *)self responseCode];
  if ((unint64_t)(v6 - 1) > 4) {
    v7 = @"Success";
  }
  else {
    v7 = off_1E60786B0[v6 - 1];
  }
  objc_super v8 = [v3 stringWithFormat:@"<%@: %p, responseCode: %@>", v5, self, v7];

  return (NSString *)v8;
}

- (BOOL)shouldDismissDialogInTransientMode
{
  return 1;
}

- (BOOL)isCancelled
{
  return [(WFDialogResponse *)self responseCode] == 2;
}

- (WFDialogResponse)initWithResponseCode:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFDialogResponse;
  id v4 = [(WFDialogResponse *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_responseCode = a3;
    int64_t v6 = v4;
  }

  return v5;
}

- (WFDialogResponse)initWithCancelled:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFDialogResponse;
  id v4 = [(WFDialogResponse *)&v9 init];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = 2;
    if (!v3) {
      uint64_t v6 = 0;
    }
    v4->_responseCode = v6;
    v7 = v4;
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