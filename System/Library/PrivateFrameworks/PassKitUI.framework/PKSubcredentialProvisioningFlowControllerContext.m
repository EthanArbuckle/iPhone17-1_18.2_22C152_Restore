@interface PKSubcredentialProvisioningFlowControllerContext
- (BOOL)shouldExitFlowOnError;
- (NSError)error;
- (PKPaymentPass)provisionedPass;
- (PKPaymentPass)provisionedRemotePass;
- (PKPaymentWebService)localDeviceWebService;
- (PKPaymentWebService)remoteDeviceWebService;
- (PKSubcredentialProvisioningFlowControllerContext)initWithFlowType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)flowType;
- (int64_t)setupContext;
- (void)setError:(id)a3;
- (void)setLocalDeviceWebService:(id)a3;
- (void)setProvisionedPass:(id)a3;
- (void)setProvisionedRemotePass:(id)a3;
- (void)setRemoteDeviceWebService:(id)a3;
- (void)setShouldExitFlowOnError:(BOOL)a3;
@end

@implementation PKSubcredentialProvisioningFlowControllerContext

- (PKSubcredentialProvisioningFlowControllerContext)initWithFlowType:(int64_t)a3
{
  result = [(PKSubcredentialProvisioningFlowControllerContext *)self init];
  if (result) {
    result->_flowType = a3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFlowType:", self->_flowType);
  [v4 setLocalDeviceWebService:self->_localDeviceWebService];
  [v4 setRemoteDeviceWebService:self->_remoteDeviceWebService];
  [v4 setProvisionedPass:self->_provisionedPass];
  [v4 setProvisionedRemotePass:self->_provisionedRemotePass];
  [v4 setError:self->_error];
  [v4 setShouldExitFlowOnError:self->_shouldExitFlowOnError];
  return v4;
}

- (int64_t)setupContext
{
  int64_t flowType = self->_flowType;
  if (flowType == 4) {
    return 5;
  }
  else {
    return 4 * (flowType == 3);
  }
}

- (int64_t)flowType
{
  return self->_flowType;
}

- (PKPaymentWebService)localDeviceWebService
{
  return self->_localDeviceWebService;
}

- (void)setLocalDeviceWebService:(id)a3
{
}

- (PKPaymentWebService)remoteDeviceWebService
{
  return self->_remoteDeviceWebService;
}

- (void)setRemoteDeviceWebService:(id)a3
{
}

- (PKPaymentPass)provisionedPass
{
  return self->_provisionedPass;
}

- (void)setProvisionedPass:(id)a3
{
}

- (PKPaymentPass)provisionedRemotePass
{
  return self->_provisionedRemotePass;
}

- (void)setProvisionedRemotePass:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (BOOL)shouldExitFlowOnError
{
  return self->_shouldExitFlowOnError;
}

- (void)setShouldExitFlowOnError:(BOOL)a3
{
  self->_shouldExitFlowOnError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_provisionedRemotePass, 0);
  objc_storeStrong((id *)&self->_provisionedPass, 0);
  objc_storeStrong((id *)&self->_remoteDeviceWebService, 0);

  objc_storeStrong((id *)&self->_localDeviceWebService, 0);
}

@end