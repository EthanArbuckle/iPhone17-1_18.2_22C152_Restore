@interface PKPrivacyDeviceAssessmentSendStateRequest
- (NSNumber)privacyUiState;
- (PKPrivacyDeviceAssessmentSendStateRequest)initWithPrivacyUiState:(id)a3;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (void)setPrivacyUiState:(id)a3;
@end

@implementation PKPrivacyDeviceAssessmentSendStateRequest

- (PKPrivacyDeviceAssessmentSendStateRequest)initWithPrivacyUiState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPrivacyDeviceAssessmentSendStateRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_privacyUiState, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8 = a4;
  objc_super v9 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 endpointComponents:&unk_1EE22B240 queryParameters:0 appleAccountInformation:a5];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v10 setObject:v8 forKeyedSubscript:@"dsid"];

  [v10 setObject:self->_privacyUiState forKeyedSubscript:@"privacyUiState"];
  [v9 setHTTPMethod:@"POST"];
  v11 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v10];
  [v9 setHTTPBody:v11];

  v12 = (void *)[v9 copy];
  return v12;
}

- (NSNumber)privacyUiState
{
  return self->_privacyUiState;
}

- (void)setPrivacyUiState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end