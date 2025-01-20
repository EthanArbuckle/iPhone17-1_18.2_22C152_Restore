@interface PKApplyControllerConfiguration
- (NSString)referenceIdentifier;
- (PKAccount)account;
- (PKAccountPaymentFundingSource)fundingSource;
- (PKApplyControllerConfiguration)initWithSetupDelegate:(id)a3 context:(int64_t)a4 provisioningController:(id)a5;
- (PKFeatureApplication)featureApplication;
- (PKPaymentProvisioningController)provisioningController;
- (PKPaymentSetupViewControllerDelegate)setupDelegate;
- (int64_t)applicationType;
- (int64_t)context;
- (int64_t)updateUserInfoSubType;
- (unint64_t)feature;
- (unint64_t)featureProduct;
- (unint64_t)verificationType;
- (void)setAccount:(id)a3;
- (void)setApplicationType:(int64_t)a3;
- (void)setContext:(int64_t)a3;
- (void)setFeature:(unint64_t)a3;
- (void)setFeatureApplication:(id)a3;
- (void)setFeatureProduct:(unint64_t)a3;
- (void)setFundingSource:(id)a3;
- (void)setProvisioningController:(id)a3;
- (void)setReferenceIdentifier:(id)a3;
- (void)setSetupDelegate:(id)a3;
- (void)setUpdateUserInfoSubType:(int64_t)a3;
- (void)setVerificationType:(unint64_t)a3;
@end

@implementation PKApplyControllerConfiguration

- (PKApplyControllerConfiguration)initWithSetupDelegate:(id)a3 context:(int64_t)a4 provisioningController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyControllerConfiguration;
  v10 = [(PKApplyControllerConfiguration *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_setupDelegate, v8);
    v11->_context = a4;
    objc_storeStrong((id *)&v11->_provisioningController, a5);
  }

  return v11;
}

- (unint64_t)feature
{
  featureApplication = self->_featureApplication;
  if (featureApplication) {
    return [(PKFeatureApplication *)featureApplication feature];
  }
  else {
    return self->_feature;
  }
}

- (int64_t)applicationType
{
  featureApplication = self->_featureApplication;
  if (featureApplication) {
    return [(PKFeatureApplication *)featureApplication applicationType];
  }
  else {
    return self->_applicationType;
  }
}

- (unint64_t)featureProduct
{
  featureApplication = self->_featureApplication;
  if (featureApplication) {
    return [(PKFeatureApplication *)featureApplication featureProduct];
  }
  else {
    return self->_featureProduct;
  }
}

- (NSString)referenceIdentifier
{
  v3 = [(PKFeatureApplication *)self->_featureApplication referenceIdentifier];

  if (v3)
  {
    v4 = [(PKFeatureApplication *)self->_featureApplication referenceIdentifier];
  }
  else
  {
    v4 = self->_referenceIdentifier;
  }

  return v4;
}

- (void)setFeature:(unint64_t)a3
{
  self->_feature = a3;
}

- (void)setFeatureProduct:(unint64_t)a3
{
  self->_featureProduct = a3;
}

- (void)setApplicationType:(int64_t)a3
{
  self->_applicationType = a3;
}

- (int64_t)updateUserInfoSubType
{
  return self->_updateUserInfoSubType;
}

- (void)setUpdateUserInfoSubType:(int64_t)a3
{
  self->_updateUserInfoSubType = a3;
}

- (unint64_t)verificationType
{
  return self->_verificationType;
}

- (void)setVerificationType:(unint64_t)a3
{
  self->_verificationType = a3;
}

- (PKFeatureApplication)featureApplication
{
  return self->_featureApplication;
}

- (void)setFeatureApplication:(id)a3
{
}

- (void)setReferenceIdentifier:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (PKAccountPaymentFundingSource)fundingSource
{
  return self->_fundingSource;
}

- (void)setFundingSource:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (void)setProvisioningController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_fundingSource, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);

  objc_storeStrong((id *)&self->_featureApplication, 0);
}

@end