@interface PKPaymentAuthorizationContext
- (BOOL)awaitingRemoteNetworkPaymentRequest;
- (NSString)hostApplicationIdentifier;
- (NSString)hostBundleIdentifier;
- (NSString)hostIdentifier;
- (NSString)hostLocalizedAppName;
- (NSString)hostTeamID;
- (PKPaymentAuthorizationContext)initWithUserInfo:(id)a3;
- (PKPaymentRequest)request;
- (PKPaymentSheetExperiment)paymentSheetExperiment;
- (id)sanitizeString:(id)a3;
- (void)fulfillPromisedRemoteNetworkPaymentRequest:(id)a3;
@end

@implementation PKPaymentAuthorizationContext

- (PKPaymentSheetExperiment)paymentSheetExperiment
{
  paymentSheetExperiment = self->_paymentSheetExperiment;
  if (!paymentSheetExperiment)
  {
    v4 = (PKPaymentSheetExperiment *)objc_alloc_init(MEMORY[0x1E4F84CD0]);
    v5 = self->_paymentSheetExperiment;
    self->_paymentSheetExperiment = v4;

    paymentSheetExperiment = self->_paymentSheetExperiment;
  }

  return paymentSheetExperiment;
}

- (PKPaymentAuthorizationContext)initWithUserInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentAuthorizationContext;
  v5 = [(PKPaymentAuthorizationContext *)&v23 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = objc_opt_class();
    v8 = [v4 objectForKey:@"paymentRequest"];
    uint64_t v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:0];
    request = v5->_request;
    v5->_request = (PKPaymentRequest *)v9;

    v5->_awaitingRemoteNetworkPaymentRequest = [v4 PKBoolForKey:@"awaitingRemoteNetworkPaymentRequest"];
    uint64_t v11 = [v4 PKStringForKey:@"hostIdentifier"];
    hostIdentifier = v5->_hostIdentifier;
    v5->_hostIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"hostBundleIdentifier"];
    hostBundleIdentifier = v5->_hostBundleIdentifier;
    v5->_hostBundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"hostLocalizedAppName"];
    hostLocalizedAppName = v5->_hostLocalizedAppName;
    v5->_hostLocalizedAppName = (NSString *)v15;

    uint64_t v17 = [v4 PKStringForKey:@"hostTeamID"];
    hostTeamID = v5->_hostTeamID;
    v5->_hostTeamID = (NSString *)v17;

    v19 = [v4 PKStringForKey:@"hostApplicationIdentifier"];
    uint64_t v20 = [(PKPaymentAuthorizationContext *)v5 sanitizeString:v19];
    hostApplicationIdentifier = v5->_hostApplicationIdentifier;
    v5->_hostApplicationIdentifier = (NSString *)v20;
  }
  return v5;
}

- (id)sanitizeString:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)fulfillPromisedRemoteNetworkPaymentRequest:(id)a3
{
  self->_awaitingRemoteNetworkPaymentRequest = 0;
}

- (PKPaymentRequest)request
{
  return self->_request;
}

- (BOOL)awaitingRemoteNetworkPaymentRequest
{
  return self->_awaitingRemoteNetworkPaymentRequest;
}

- (NSString)hostIdentifier
{
  return self->_hostIdentifier;
}

- (NSString)hostBundleIdentifier
{
  return self->_hostBundleIdentifier;
}

- (NSString)hostLocalizedAppName
{
  return self->_hostLocalizedAppName;
}

- (NSString)hostTeamID
{
  return self->_hostTeamID;
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostTeamID, 0);
  objc_storeStrong((id *)&self->_hostLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_hostBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_paymentSheetExperiment, 0);
}

@end