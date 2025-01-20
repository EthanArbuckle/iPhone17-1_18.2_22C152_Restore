@interface WFPerformQueryDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSString)parameterKey;
- (WFPerformQueryDialogRequest)initWithCoder:(id)a3;
- (WFPerformQueryDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFPerformQueryDialogRequest

- (void).cxx_destruct
{
}

- (NSString)parameterKey
{
  return self->_parameterKey;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFPerformQueryDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v6 encodeWithCoder:v4];
  v5 = [(WFPerformQueryDialogRequest *)self parameterKey];
  [v4 encodeObject:v5 forKey:@"parameterKey"];
}

- (WFPerformQueryDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFPerformQueryDialogRequest;
  v5 = [(WFDialogRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterKey"];
    parameterKey = v5->_parameterKey;
    v5->_parameterKey = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFPerformQueryDialogRequest)initWithParameterKey:(id)a3 attribution:(id)a4 prompt:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFPerformQueryDialogRequest;
  v9 = [(WFDialogRequest *)&v14 initWithAttribution:a4 prompt:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    parameterKey = v9->_parameterKey;
    v9->_parameterKey = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end