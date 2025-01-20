@interface WFToolKitParameterDialogResponse
+ (BOOL)supportsSecureCoding;
- (WFEncodedTypedValue)encodedTypedValue;
- (WFToolKitParameterDialogResponse)initWithBSXPCCoder:(id)a3;
- (WFToolKitParameterDialogResponse)initWithCoder:(id)a3;
- (WFToolKitParameterDialogResponse)initWithEncodedTypedValue:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEncodedTypedValue:(id)a3;
@end

@implementation WFToolKitParameterDialogResponse

- (void).cxx_destruct
{
}

- (void)setEncodedTypedValue:(id)a3
{
}

- (WFEncodedTypedValue)encodedTypedValue
{
  return self->_encodedTypedValue;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithBSXPCCoder:v4];
  v5 = [(WFToolKitParameterDialogResponse *)self encodedTypedValue];
  [v4 encodeObject:v5 forKey:@"encodedTypedValue"];
}

- (WFToolKitParameterDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogResponse;
  v5 = [(WFDialogResponse *)&v9 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedTypedValue"];
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (WFEncodedTypedValue *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogResponse;
  id v4 = a3;
  [(WFDialogResponse *)&v6 encodeWithCoder:v4];
  v5 = [(WFToolKitParameterDialogResponse *)self encodedTypedValue];
  [v4 encodeObject:v5 forKey:@"encodedTypedValue"];
}

- (WFToolKitParameterDialogResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogResponse;
  v5 = [(WFDialogResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedTypedValue"];
    encodedTypedValue = v5->_encodedTypedValue;
    v5->_encodedTypedValue = (WFEncodedTypedValue *)v6;
  }
  return v5;
}

- (WFToolKitParameterDialogResponse)initWithEncodedTypedValue:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToolKitParameterDialogResponse;
  uint64_t v6 = [(WFDialogResponse *)&v10 initWithCancelled:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_encodedTypedValue, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end