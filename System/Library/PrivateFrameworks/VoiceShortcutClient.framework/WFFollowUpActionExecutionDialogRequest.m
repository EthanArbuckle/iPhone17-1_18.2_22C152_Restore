@interface WFFollowUpActionExecutionDialogRequest
+ (BOOL)supportsSecureCoding;
- (NSData)encodedToolInvocation;
- (NSDictionary)parameterValues;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifier;
- (WFFollowUpActionExecutionDialogRequest)initWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 showOutputActionOptions:(unint64_t)a6 encodedToolInvocation:(id)a7;
- (WFFollowUpActionExecutionDialogRequest)initWithCoder:(id)a3;
- (unint64_t)showOutputActionOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFFollowUpActionExecutionDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedToolInvocation, 0);
  objc_storeStrong((id *)&self->_parameterValues, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (NSData)encodedToolInvocation
{
  return self->_encodedToolInvocation;
}

- (unint64_t)showOutputActionOptions
{
  return self->_showOutputActionOptions;
}

- (NSDictionary)parameterValues
{
  return self->_parameterValues;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (WFFollowUpActionExecutionDialogRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFFollowUpActionExecutionDialogRequest;
  v5 = [(WFDialogRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encodedToolInvocation"];
    encodedToolInvocation = v5->_encodedToolInvocation;
    v5->_encodedToolInvocation = (NSData *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeDictionaryWithKeysOfClass:v12 objectsOfClass:objc_opt_class() forKey:@"parameterValues"];
    parameterValues = v5->_parameterValues;
    v5->_parameterValues = (NSDictionary *)v13;

    v5->_showOutputActionOptions = [v4 decodeIntegerForKey:@"showOutputActionOptions"];
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WFFollowUpActionExecutionDialogRequest;
  id v4 = a3;
  [(WFDialogRequest *)&v9 encodeWithCoder:v4];
  v5 = [(WFFollowUpActionExecutionDialogRequest *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  uint64_t v6 = [(WFFollowUpActionExecutionDialogRequest *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];

  v7 = [(WFFollowUpActionExecutionDialogRequest *)self parameterValues];
  [v4 encodeObject:v7 forKey:@"parameterValues"];

  uint64_t v8 = [(WFFollowUpActionExecutionDialogRequest *)self encodedToolInvocation];
  [v4 encodeObject:v8 forKey:@"encodedToolInvocation"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFFollowUpActionExecutionDialogRequest showOutputActionOptions](self, "showOutputActionOptions"), @"showOutputActionOptions");
}

- (WFFollowUpActionExecutionDialogRequest)initWithBundleIdentifier:(id)a3 actionIdentifier:(id)a4 parameterValues:(id)a5 showOutputActionOptions:(unint64_t)a6 encodedToolInvocation:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [[WFDialogAttribution alloc] initWithTitle:0 icon:0];
  v24.receiver = self;
  v24.super_class = (Class)WFFollowUpActionExecutionDialogRequest;
  objc_super v17 = [(WFDialogRequest *)&v24 initWithAttribution:v16 prompt:0];

  if (v17)
  {
    uint64_t v18 = [v13 copy];
    actionIdentifier = v17->_actionIdentifier;
    v17->_actionIdentifier = (NSString *)v18;

    uint64_t v20 = [v12 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v20;

    objc_storeStrong((id *)&v17->_parameterValues, a5);
    v17->_showOutputActionOptions = a6;
    objc_storeStrong((id *)&v17->_encodedToolInvocation, a7);
    v22 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end