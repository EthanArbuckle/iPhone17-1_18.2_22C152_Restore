@interface PKVehicleInitiatedPairingProxCardRequest
+ (BOOL)supportsSecureCoding;
- (PKCarUnlockSupportedTerminal)supportedTerminal;
- (PKVehicleInitiatedPairingProxCardRequest)initWithCoder:(id)a3;
- (PKVehicleInitiatedPairingProxCardRequest)initWithSupportedTerminal:(id)a3 referralSource:(unint64_t)a4;
- (unint64_t)referralSource;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKVehicleInitiatedPairingProxCardRequest

- (PKVehicleInitiatedPairingProxCardRequest)initWithSupportedTerminal:(id)a3 referralSource:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  v8 = [(PKProxCardRequest *)&v11 initWithProxCardType:1];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_supportedTerminal, a3);
    v9->_referralSource = a4;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  id v4 = a3;
  [(PKProxCardRequest *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_supportedTerminal, @"supportedTerminal", v6.receiver, v6.super_class);
  v5 = PKSubcredentialPairingReferralSourceToString(self->_referralSource);
  [v4 encodeObject:v5 forKey:@"referralSource"];
}

- (PKVehicleInitiatedPairingProxCardRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKVehicleInitiatedPairingProxCardRequest;
  v5 = [(PKProxCardRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedTerminal"];
    supportedTerminal = v5->_supportedTerminal;
    v5->_supportedTerminal = (PKCarUnlockSupportedTerminal *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referralSource"];
    v5->_referralSource = PKSubcredentialPairingReferralSourceFromString(v8);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCarUnlockSupportedTerminal)supportedTerminal
{
  return self->_supportedTerminal;
}

- (unint64_t)referralSource
{
  return self->_referralSource;
}

- (void).cxx_destruct
{
}

@end