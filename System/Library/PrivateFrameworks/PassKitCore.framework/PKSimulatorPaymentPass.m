@interface PKSimulatorPaymentPass
- (PKSimulatorPaymentPass)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)devicePrimaryPaymentApplication;
- (id)localizedDescription;
- (id)primaryAccountIdentifier;
- (id)primaryAccountNumberSuffix;
@end

@implementation PKSimulatorPaymentPass

- (PKSimulatorPaymentPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSimulatorPaymentPass;
  v7 = [(PKSecureElementPass *)&v13 initWithDictionary:v6 bundle:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    dictionary = v7->_dictionary;
    v7->_dictionary = (NSDictionary *)v8;

    v10 = +[PKSecureElement primarySecureElementIdentifier];
    v14[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [(PKSecureElementPass *)v7 updateDevicePaymentApplicationsWithSecureElementIdentifiers:v11];
  }
  return v7;
}

- (id)devicePrimaryPaymentApplication
{
  v2 = [(PKSecureElementPass *)self paymentApplications];
  v3 = [v2 anyObject];

  return v3;
}

- (id)localizedDescription
{
  return [(NSDictionary *)self->_dictionary PKStringForKey:@"description"];
}

- (id)primaryAccountNumberSuffix
{
  return @"1234";
}

- (id)primaryAccountIdentifier
{
  v2 = NSString;
  v3 = [(PKSecureElementPass *)self paymentApplications];
  v4 = [v3 anyObject];
  v5 = [v4 displayName];
  id v6 = [v2 stringWithFormat:@"SimulatedIdentifier: %@", v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end