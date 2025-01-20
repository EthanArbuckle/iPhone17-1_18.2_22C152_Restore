@interface PKProvisioningPaymentApplication
- (NSString)appletTypeIdentifier;
- (NSString)applicationIdentifier;
- (PKProvisioningPaymentApplication)initWithAppletTypeIdentifier:(id)a3 paymentType:(unint64_t)a4;
- (PKProvisioningPaymentApplication)initWithDictionary:(id)a3;
- (unint64_t)paymentType;
@end

@implementation PKProvisioningPaymentApplication

- (PKProvisioningPaymentApplication)initWithAppletTypeIdentifier:(id)a3 paymentType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKProvisioningPaymentApplication;
  v8 = [(PKProvisioningPaymentApplication *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appletTypeIdentifier, a3);
    v9->_paymentType = a4;
  }

  return v9;
}

- (PKProvisioningPaymentApplication)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKProvisioningPaymentApplication;
  v5 = [(PKProvisioningPaymentApplication *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"appletTypeIdentifier"];
    appletTypeIdentifier = v5->_appletTypeIdentifier;
    v5->_appletTypeIdentifier = (NSString *)v6;

    v8 = [v4 objectForKey:@"paymentType"];
    v5->_paymentType = PKPaymentMethodTypeForString(v8);

    uint64_t v9 = [v4 PKStringForKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v9;

    if (!v5->_appletTypeIdentifier || !v5->_paymentType)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (NSString)appletTypeIdentifier
{
  return self->_appletTypeIdentifier;
}

- (unint64_t)paymentType
{
  return self->_paymentType;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_appletTypeIdentifier, 0);
}

@end