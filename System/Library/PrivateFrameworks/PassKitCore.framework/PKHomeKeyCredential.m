@interface PKHomeKeyCredential
- (BOOL)supportsSuperEasyProvisioning;
- (PKHomeKeyCredential)initWithPaymentPass:(id)a3;
- (id)detailDescriptionWithEnvironment:(unint64_t)a3;
- (id)paymentApplications;
@end

@implementation PKHomeKeyCredential

- (PKHomeKeyCredential)initWithPaymentPass:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 paymentApplications];
  v6 = [v5 anyObject];
  v7 = [v6 secureElementIdentifier];
  v18[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v8];

  v17.receiver = self;
  v17.super_class = (Class)PKHomeKeyCredential;
  v9 = [(PKPaymentLocalPassCredential *)&v17 initWithPaymentPass:v4];
  v10 = v9;
  if (v9)
  {
    [(PKPaymentCredential *)v9 setCardType:3];
    v11 = [v4 frontFieldBuckets];
    unint64_t v12 = [v11 count];
    v10->_detailDescriptionAvailable = v12 > 1;
    if (v12 >= 2)
    {
      v13 = PKLocalizedHomeKeyString(&cfstr_ProductNameHom.isa, 0);
      [(PKPaymentCredential *)v10 setLongDescription:v13];
    }
    uint64_t v14 = [v4 paymentApplications];
    paymentApplications = v10->_paymentApplications;
    v10->_paymentApplications = (NSSet *)v14;
  }
  return v10;
}

- (id)detailDescriptionWithEnvironment:(unint64_t)a3
{
  if (self->_detailDescriptionAvailable)
  {
    v3 = [(PKPaymentLocalPassCredential *)self paymentPass];
    id v4 = [v3 localizedDescription];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)paymentApplications
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_paymentApplications;
  uint64_t v5 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "paymentType", (void)v16);
        uint64_t v10 = v9;
        if (v9 == 1004)
        {
          uint64_t v11 = +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirAliro];
        }
        else
        {
          if (v9 != 1003) {
            continue;
          }
          uint64_t v11 = +[PKProvisioningSEStorageSnapshot appletTypePurpleTrustAirHome];
        }
        unint64_t v12 = (void *)v11;
        if (v11)
        {
          v13 = [[PKProvisioningPaymentApplication alloc] initWithAppletTypeIdentifier:v11 paymentType:v10];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [(NSSet *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[v3 copy];
  return v14;
}

- (BOOL)supportsSuperEasyProvisioning
{
  return 1;
}

- (void).cxx_destruct
{
}

@end