@interface WFInputTextDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSString)inputtedText;
- (WFInputTextDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFInputTextDialogResponse)initWithCoder:(id)a3;
- (WFInputTextDialogResponse)initWithInputtedText:(id)a3 cancelled:(BOOL)a4;
- (WFInputTextDialogResponse)initWithResponseCode:(int64_t)a3;
- (id)description;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFInputTextDialogResponse

- (void).cxx_destruct
{
}

- (NSString)inputtedText
{
  return self->_inputtedText;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFInputTextDialogResponse *)self inputtedText];
  [v4 encodeObject:v5 forKey:@"inputtedText"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), @"cancelled");
}

- (WFInputTextDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputTextDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputtedText"];
    inputtedText = v5->_inputtedText;
    v5->_inputtedText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInputTextDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFInputTextDialogResponse *)self inputtedText];
  [v4 encodeObject:v5 forKey:@"inputtedText"];
}

- (WFInputTextDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputTextDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputtedText"];
    inputtedText = v5->_inputtedText;
    v5->_inputtedText = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFInputTextDialogResponse *)self inputtedText];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v8 = [v3 stringWithFormat:@"<%@: %p, inputtedText: %@, cancelled: %@>", v5, self, v6, v7];

  return v8;
}

- (WFInputTextDialogResponse)initWithResponseCode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFInputTextDialogResponse;
  return [(WFDialogResponse *)&v4 initWithResponseCode:a3];
}

- (WFInputTextDialogResponse)initWithInputtedText:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFInputTextDialogResponse;
  v7 = [(WFDialogResponse *)&v12 initWithCancelled:v4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    inputtedText = v7->_inputtedText;
    v7->_inputtedText = (NSString *)v8;

    objc_super v10 = v7;
  }

  return v7;
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