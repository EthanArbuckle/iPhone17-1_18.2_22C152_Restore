@interface WFInputDateDialogResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (NSDate)inputtedDate;
- (NSString)description;
- (WFInputDateDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFInputDateDialogResponse)initWithCoder:(id)a3;
- (WFInputDateDialogResponse)initWithInputtedDate:(id)a3 cancelled:(BOOL)a4;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFInputDateDialogResponse

- (void).cxx_destruct
{
}

- (NSDate)inputtedDate
{
  return self->_inputtedDate;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInputDateDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFInputDateDialogResponse *)self inputtedDate];
  [v4 encodeObject:v5 forKey:@"inputtedDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), @"cancelled");
}

- (WFInputDateDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputDateDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputtedDate"];
    inputtedDate = v5->_inputtedDate;
    v5->_inputtedDate = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFInputDateDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFInputDateDialogResponse *)self inputtedDate];
  [v4 encodeObject:v5 forKey:@"inputtedDate"];
}

- (WFInputDateDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFInputDateDialogResponse;
  v5 = [(WFDialogResponse *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputtedDate"];
    inputtedDate = v5->_inputtedDate;
    v5->_inputtedDate = (NSDate *)v6;

    v8 = v5;
  }

  return v5;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFInputDateDialogResponse *)self inputtedDate];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v8 = [v3 stringWithFormat:@"<%@: %p, inputtedDate: %@, cancelled: %@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (WFInputDateDialogResponse)initWithInputtedDate:(id)a3 cancelled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFInputDateDialogResponse;
  v8 = [(WFDialogResponse *)&v12 initWithCancelled:v4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_inputtedDate, a3);
    objc_super v10 = v9;
  }

  return v9;
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