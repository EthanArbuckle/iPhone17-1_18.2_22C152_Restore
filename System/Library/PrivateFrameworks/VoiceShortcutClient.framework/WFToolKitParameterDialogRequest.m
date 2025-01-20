@interface WFToolKitParameterDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSString)parameterKey;
- (WFToolKitParameterDialogRequest)initWithCoder:(id)a3;
- (WFToolKitParameterDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setParameterKey:(id)a3;
@end

@implementation WFToolKitParameterDialogRequest

- (void).cxx_destruct
{
}

- (void)setParameterKey:(id)a3
{
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFToolKitParameterDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFToolKitParameterDialogRequest *)self parameterKey];
  [v4 encodeObject:v5 forKey:@"parameterKey"];
}

- (WFToolKitParameterDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFToolKitParameterDialogRequest;
  v5 = [(WFDialogRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v6;
  }
  return v5;
}

- (WFToolKitParameterDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFToolKitParameterDialogRequest;
  v10 = [(WFDialogRequest *)&v14 initWithAttribution:a4 prompt:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameterKey, a3);
    v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end