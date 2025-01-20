@interface PKApplyWebServiceApplyResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)requiresODIAssessment;
- (NSSet)actionIdentifiersRequiringAuthentication;
- (PKAccount)account;
- (PKApplyWebServiceApplyResponse)initWithCoder:(id)a3;
- (PKApplyWebServiceApplyResponse)initWithData:(id)a3;
- (PKFeatureApplication)featureApplication;
- (id)nextStepInfo;
- (unint64_t)requiredDeviceMetadataFields;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKApplyWebServiceApplyResponse

- (PKApplyWebServiceApplyResponse)initWithData:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PKApplyWebServiceApplyResponse;
  v3 = [(PKWebServiceResponse *)&v17 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [v6 PKDictionaryForKey:@"application"];
      if (v7)
      {
        v8 = [[PKFeatureApplication alloc] initWithDictionary:v7];
        featureApplication = v4->_featureApplication;
        v4->_featureApplication = v8;
      }
      v10 = [v6 PKDictionaryForKey:@"account"];
      if (v10)
      {
        v11 = [[PKAccount alloc] initWithDictionary:v10];
        account = v4->_account;
        v4->_account = v11;
      }
      v13 = [v6 PKSetContaining:objc_opt_class() forKey:@"requiredDeviceMetadataFields"];
      if ([v13 count]) {
        v4->_requiredDeviceMetadataFields = PKPaymentDeviceMetadataFieldsFromStrings(v13);
      }
      uint64_t v14 = [v6 PKSetContaining:objc_opt_class() forKey:@"actionIdentifiersRequiringAuthentication"];
      actionIdentifiersRequiringAuthentication = v4->_actionIdentifiersRequiringAuthentication;
      v4->_actionIdentifiersRequiringAuthentication = (NSSet *)v14;

      v4->_requiresODIAssessment = [v6 PKBoolForKey:@"requiresODIAssessment"];
    }
  }
  return v4;
}

- (id)nextStepInfo
{
  v3 = [PKApplyWebServiceApplyStepInfo alloc];
  v4 = [(PKWebServiceResponse *)self JSONObject];
  v5 = [(PKApplyWebServiceApplyStepInfo *)v3 initWithJSONObject:v4 featureApplication:self->_featureApplication];

  id v6 = [(PKApplyWebServiceResponse *)self conversationIdentifier];
  [(PKApplyWebServiceApplyStepInfo *)v5 setConversationIdentifier:v6];

  return v5;
}

- (PKApplyWebServiceApplyResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyWebServiceApplyResponse;
  v5 = [(PKWebServiceResponse *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (PKAccount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureApplication"];
    featureApplication = v5->_featureApplication;
    v5->_featureApplication = (PKFeatureApplication *)v8;

    v5->_requiredDeviceMetadataFields = [v4 decodeIntegerForKey:@"requiredDeviceMetadataFields"];
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"actionIdentifiersRequiringAuthentication"];
    actionIdentifiersRequiringAuthentication = v5->_actionIdentifiersRequiringAuthentication;
    v5->_actionIdentifiersRequiringAuthentication = (NSSet *)v13;

    v5->_requiresODIAssessment = [v4 decodeBoolForKey:@"requiresODIAssessment"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKApplyWebServiceApplyResponse;
  id v4 = a3;
  [(PKWebServiceResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureApplication, @"featureApplication", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_account forKey:@"account"];
  [v4 encodeInteger:self->_requiredDeviceMetadataFields forKey:@"requiredDeviceMetadataFields"];
  [v4 encodeObject:self->_actionIdentifiersRequiringAuthentication forKey:@"actionIdentifiersRequiringAuthentication"];
  [v4 encodeBool:self->_requiresODIAssessment forKey:@"requiresODIAssessment"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (PKAccount)account
{
  return self->_account;
}

- (unint64_t)requiredDeviceMetadataFields
{
  return self->_requiredDeviceMetadataFields;
}

- (BOOL)requiresODIAssessment
{
  return self->_requiresODIAssessment;
}

- (NSSet)actionIdentifiersRequiringAuthentication
{
  return self->_actionIdentifiersRequiringAuthentication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifiersRequiringAuthentication, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_featureApplication, 0);
}

@end