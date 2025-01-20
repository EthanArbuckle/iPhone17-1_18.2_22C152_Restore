@interface WFUIKitParameterEditingRequest
+ (BOOL)supportsSecureCoding;
- (NSString)parameterClassName;
- (WFParameterState)currentState;
- (WFUIKitParameterEditingRequest)initWithCoder:(id)a3;
- (WFUIKitParameterEditingRequest)initWithParameterClassName:(id)a3 currentState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFUIKitParameterEditingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_parameterClassName, 0);
}

- (WFParameterState)currentState
{
  return self->_currentState;
}

- (NSString)parameterClassName
{
  return self->_parameterClassName;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  v4 = [(WFUIKitParameterEditingRequest *)self parameterClassName];
  [v11 encodeObject:v4 forKey:@"parameterClass"];

  v5 = [(WFUIKitParameterEditingRequest *)self currentState];

  if (v5)
  {
    v6 = [(WFUIKitParameterEditingRequest *)self currentState];
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    [v11 encodeObject:v8 forKey:@"stateClass"];

    v9 = [(WFUIKitParameterEditingRequest *)self currentState];
    v10 = [v9 serializedRepresentation];
    [v11 encodeObject:v10 forKey:@"state"];
  }
}

- (WFUIKitParameterEditingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterClass"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateClass"];
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"state"];

  v15 = 0;
  if (v5)
  {
    if (v6 && v14)
    {
      v16 = NSClassFromString(v6);
      if (v16) {
        v15 = (WFUIKitParameterEditingRequest *)[[v16 alloc] initWithSerializedRepresentation:v14 variableProvider:0 parameter:0];
      }
      else {
        v15 = 0;
      }
    }
    self = [(WFUIKitParameterEditingRequest *)self initWithParameterClassName:v5 currentState:v15];

    v15 = self;
  }

  return v15;
}

- (WFUIKitParameterEditingRequest)initWithParameterClassName:(id)a3 currentState:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFUIKitParameterEditingRequest.m", 17, @"Invalid parameter not satisfying: %@", @"parameterClassName" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFUIKitParameterEditingRequest;
  uint64_t v10 = [(WFUIKitParameterEditingRequest *)&v15 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameterClassName, a3);
    objc_storeStrong((id *)&v11->_currentState, a4);
    uint64_t v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end