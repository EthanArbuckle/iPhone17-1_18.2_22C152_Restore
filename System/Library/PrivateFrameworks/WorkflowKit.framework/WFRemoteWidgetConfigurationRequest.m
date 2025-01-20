@interface WFRemoteWidgetConfigurationRequest
+ (BOOL)supportsSecureCoding;
+ (id)defaultLNOptionForParameterRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5;
+ (id)fromSecureData:(id)a3;
+ (id)lnActionMetadataRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4;
+ (id)lnOptionsForParameterRequesttWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5 searchTerm:(id)a6;
+ (id)localizedIntentRequestWithIntent:(id)a3;
+ (id)optionsForParameterRequestWithIntent:(id)a3 parameterName:(id)a4 searchTerm:(id)a5;
- (Class)responseClass;
- (INIntent)intent;
- (LNActionParameterMetadata)parameterMetadata;
- (NSDictionary)serializedParameters;
- (NSString)actionIdentifier;
- (NSString)parameterName;
- (NSString)searchTerm;
- (WFRemoteWidgetConfigurationRequest)initWithCoder:(id)a3;
- (WFRemoteWidgetConfigurationRequest)initWithRequestType:(int64_t)a3 intent:(id)a4 actionIdentifier:(id)a5 serializedParameters:(id)a6 parameterName:(id)a7 searchTerm:(id)a8;
- (id)description;
- (id)requestTypeDescription;
- (int64_t)requestType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_parameterName, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (INIntent)intent
{
  return self->_intent;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (WFRemoteWidgetConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFRemoteWidgetConfigurationRequest *)self init];
  if (v5)
  {
    uint64_t v20 = [v4 decodeIntegerForKey:@"requestType"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    v19 = INTypedIntentWithIntent();

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"serializedParameters"];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterName"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchTerm"];
    v5 = [(WFRemoteWidgetConfigurationRequest *)v5 initWithRequestType:v20 intent:v19 actionIdentifier:v7 serializedParameters:v15 parameterName:v16 searchTerm:v17];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t requestType = self->_requestType;
  id v6 = a3;
  [v6 encodeInteger:requestType forKey:@"requestType"];
  v5 = INIntentWithTypedIntent();
  [v6 encodeObject:v5 forKey:@"intent"];

  [v6 encodeObject:self->_actionIdentifier forKey:@"actionIdentifier"];
  [v6 encodeObject:self->_serializedParameters forKey:@"serializedParameters"];
  [v6 encodeObject:self->_parameterName forKey:@"parameterName"];
  [v6 encodeObject:self->_searchTerm forKey:@"searchTerm"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WFRemoteWidgetConfigurationRequest *)self requestTypeDescription];
  v5 = [v3 stringWithFormat:@"Request type: %@, response class: %@", v4, -[WFRemoteWidgetConfigurationRequest responseClass](self, "responseClass")];

  return v5;
}

- (id)requestTypeDescription
{
  unint64_t v2 = [(WFRemoteWidgetConfigurationRequest *)self requestType];
  if (v2 > 4) {
    return @"Undefined";
  }
  else {
    return off_1E65505E0[v2];
  }
}

- (Class)responseClass
{
  [(WFRemoteWidgetConfigurationRequest *)self requestType];
  unint64_t v2 = objc_opt_class();
  return (Class)v2;
}

- (WFRemoteWidgetConfigurationRequest)initWithRequestType:(int64_t)a3 intent:(id)a4 actionIdentifier:(id)a5 serializedParameters:(id)a6 parameterName:(id)a7 searchTerm:(id)a8
{
  id v15 = a4;
  id v25 = a5;
  id v24 = a6;
  id v16 = a7;
  id v17 = a8;
  if ((unint64_t)a3 <= 1 && !v15)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFRemoteWidgetConfigurationRequest.m", 49, @"Invalid parameter not satisfying: %@", @"intent" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)WFRemoteWidgetConfigurationRequest;
  v18 = [(WFRemoteWidgetConfigurationRequest *)&v26 init];
  v19 = v18;
  if (v18)
  {
    v18->_int64_t requestType = a3;
    objc_storeStrong((id *)&v18->_intent, a4);
    objc_storeStrong((id *)&v19->_actionIdentifier, a5);
    objc_storeStrong((id *)&v19->_serializedParameters, a6);
    objc_storeStrong((id *)&v19->_parameterName, a7);
    objc_storeStrong((id *)&v19->_searchTerm, a8);
    uint64_t v20 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromSecureData:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend((id)objc_opt_class(), "bs_secureDecodedFromData:", v3);

  return v4;
}

+ (id)lnOptionsForParameterRequesttWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5 searchTerm:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[WFRemoteWidgetConfigurationRequest alloc] initWithRequestType:4 intent:0 actionIdentifier:v12 serializedParameters:v11 parameterName:v10 searchTerm:v9];

  return v13;
}

+ (id)defaultLNOptionForParameterRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4 parameterName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[WFRemoteWidgetConfigurationRequest alloc] initWithRequestType:3 intent:0 actionIdentifier:v9 serializedParameters:v8 parameterName:v7 searchTerm:0];

  return v10;
}

+ (id)lnActionMetadataRequestWithActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[WFRemoteWidgetConfigurationRequest alloc] initWithRequestType:2 intent:0 actionIdentifier:v6 serializedParameters:v5 parameterName:0 searchTerm:0];

  return v7;
}

+ (id)optionsForParameterRequestWithIntent:(id)a3 parameterName:(id)a4 searchTerm:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[WFRemoteWidgetConfigurationRequest alloc] initWithRequestType:1 intent:v9 actionIdentifier:0 serializedParameters:0 parameterName:v8 searchTerm:v7];

  return v10;
}

+ (id)localizedIntentRequestWithIntent:(id)a3
{
  id v3 = a3;
  id v4 = [[WFRemoteWidgetConfigurationRequest alloc] initWithRequestType:0 intent:v3 actionIdentifier:0 serializedParameters:0 parameterName:0 searchTerm:0];

  return v4;
}

@end