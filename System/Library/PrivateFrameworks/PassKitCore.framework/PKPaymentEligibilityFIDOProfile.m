@interface PKPaymentEligibilityFIDOProfile
- (NSData)keyHash;
- (NSString)accountHash;
- (NSString)relyingPartyIdentifier;
- (PKPaymentEligibilityFIDOProfile)initWithDictionary:(id)a3;
@end

@implementation PKPaymentEligibilityFIDOProfile

- (PKPaymentEligibilityFIDOProfile)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentEligibilityFIDOProfile;
  v5 = [(PKPaymentEligibilityFIDOProfile *)&v17 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"relyingPartyIdentifier"];
    uint64_t v7 = [v6 copy];
    relyingPartyIdentifier = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v7;

    v9 = [v4 objectForKeyedSubscript:@"accountHash"];
    uint64_t v10 = [v9 copy];
    accountHash = v5->_accountHash;
    v5->_accountHash = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1C9B8];
    v13 = [v4 objectForKeyedSubscript:@"keyHash"];
    uint64_t v14 = [v12 dataWithHexEncodedString:v13];
    keyHash = v5->_keyHash;
    v5->_keyHash = (NSData *)v14;
  }
  return v5;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSString)accountHash
{
  return self->_accountHash;
}

- (NSData)keyHash
{
  return self->_keyHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHash, 0);
  objc_storeStrong((id *)&self->_accountHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end