@interface WFHandoffRunRequest
+ (BOOL)supportsSecureCoding;
+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5;
+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6;
- (NSDictionary)processedParameters;
- (NSDictionary)serializedParameters;
- (NSString)actionIdentifier;
- (WFContentCollection)input;
- (WFHandoffRunRequest)initWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6;
- (WFHandoffRunRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFHandoffRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_input, 0);

  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (WFHandoffRunRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
  if ([v4 containsValueForKey:@"serializedParameters"])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"serializedParameters"];
  }
  else
  {
    v13 = 0;
  }
  if ([v4 containsValueForKey:@"processedParameters"])
  {
    v14 = +[WFParameterValueRegistry registeredValueClasses];
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"processedParameters"];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(WFHandoffRunRequest *)self initWithActionIdentifier:v5 input:v6 serializedParameters:v13 processedParameters:v15];

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFHandoffRunRequest *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  v6 = [(WFHandoffRunRequest *)self input];
  [v4 encodeObject:v6 forKey:@"input"];

  uint64_t v7 = [(WFHandoffRunRequest *)self serializedParameters];
  [v4 encodeObject:v7 forKey:@"serializedParameters"];

  id v8 = [(WFHandoffRunRequest *)self processedParameters];
  [v4 encodeObject:v8 forKey:@"processedParameters"];
}

- (WFHandoffRunRequest)initWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10
    && (v22.receiver = self,
        v22.super_class = (Class)WFHandoffRunRequest,
        (self = [(WFHandoffRunRequest *)&v22 init]) != 0))
  {
    v14 = (NSString *)[v10 copy];
    actionIdentifier = self->_actionIdentifier;
    self->_actionIdentifier = v14;

    v16 = (NSDictionary *)[v12 copy];
    serializedParameters = self->_serializedParameters;
    self->_serializedParameters = v16;

    v18 = (NSDictionary *)[v13 copy];
    processedParameters = self->_processedParameters;
    self->_processedParameters = v18;

    objc_storeStrong((id *)&self->_input, a4);
    self = self;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5 processedParameters:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithActionIdentifier:v13 input:v12 serializedParameters:v11 processedParameters:v10];

  return v14;
}

+ (id)handoffRunRequestWithActionIdentifier:(id)a3 input:(id)a4 serializedParameters:(id)a5
{
  return _[a1 handoffRunRequestWithActionIdentifier:a3 input:a4 serializedParameters:a5 processedParameters:0];
}

@end