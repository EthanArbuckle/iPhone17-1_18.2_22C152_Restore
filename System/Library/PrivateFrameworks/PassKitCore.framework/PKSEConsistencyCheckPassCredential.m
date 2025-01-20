@interface PKSEConsistencyCheckPassCredential
- (BOOL)containsSubkeys;
- (NSDictionary)keyMaterialHashForDeviceCredentialType;
- (PKAppletSubcredential)subcredential;
- (PKPaymentApplication)paymentApplication;
- (PKSEConsistencyCheckPassCredential)init;
- (PKSEConsistencyCheckPassCredential)initWithPassCredential:(id)a3 address:(id)a4 paymentMethod:(unint64_t)a5;
- (PKSECredentialAddress)address;
- (id)description;
- (int64_t)state;
- (unint64_t)paymentMethod;
- (unint64_t)type;
- (void)setKeyMaterialHashForDeviceCredentialType:(id)a3;
@end

@implementation PKSEConsistencyCheckPassCredential

- (PKSEConsistencyCheckPassCredential)init
{
  return 0;
}

- (PKSEConsistencyCheckPassCredential)initWithPassCredential:(id)a3 address:(id)a4 paymentMethod:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKSEConsistencyCheckPassCredential;
  v11 = [(PKSEConsistencyCheckPassCredential *)&v16 init];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11->_type = 0;
      id v12 = v9;
      v11->_state = [v12 state];
      v13 = [v12 subcredentials];

      v11->_containsSubkeys = [v13 count] != 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = 0;
        goto LABEL_8;
      }
      v11->_type = 1;
      v11->_state = [v9 state];
    }
    objc_storeStrong(&v11->_underlyingpassCredential, a3);
    objc_storeStrong((id *)&v11->_address, a4);
    v11->_paymentMethod = a5;
  }
  v14 = v11;
LABEL_8:

  return v14;
}

- (PKPaymentApplication)paymentApplication
{
  if (self->_type) {
    return (PKPaymentApplication *)0;
  }
  else {
    return (PKPaymentApplication *)self->_underlyingpassCredential;
  }
}

- (PKAppletSubcredential)subcredential
{
  if (self->_type == 1) {
    return (PKAppletSubcredential *)self->_underlyingpassCredential;
  }
  else {
    return (PKAppletSubcredential *)0;
  }
}

- (id)description
{
  unint64_t type = self->_type;
  v4 = @"AppletSubcredential";
  if (type != 1) {
    v4 = 0;
  }
  if (type) {
    v5 = v4;
  }
  else {
    v5 = @"PaymentApplication";
  }
  v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v6 appendFormat:@"type: '%@'; ", v5];
  objc_msgSend(v6, "appendFormat:", @"state: '%lu'; ", self->_state);
  v7 = [(PKSECredentialAddress *)self->_address shortDescription];
  [v6 appendFormat:@"address: '%@'; ", v7];

  if (self->_containsSubkeys) {
    v8 = @"Y";
  }
  else {
    v8 = @"N";
  }
  [v6 appendFormat:@"containsSubkeys: '%@'; ", v8];
  if (self->_keyMaterialHashForDeviceCredentialType)
  {
    [v6 appendFormat:@"keyMaterialHashes: {"];
    keyMaterialHashForDeviceCredentialType = self->_keyMaterialHashForDeviceCredentialType;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__PKSEConsistencyCheckPassCredential_description__block_invoke;
    v12[3] = &unk_1E56ECA78;
    id v10 = v6;
    id v13 = v10;
    [(NSDictionary *)keyMaterialHashForDeviceCredentialType enumerateKeysAndObjectsUsingBlock:v12];
    [v10 appendFormat:@"}; "];
  }
  [v6 appendFormat:@">"];
  return v6;
}

void __49__PKSEConsistencyCheckPassCredential_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 base64EncodedStringWithOptions:0];
  [v4 appendFormat:@"%@: %@, ", v5, v6];
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)state
{
  return self->_state;
}

- (PKSECredentialAddress)address
{
  return self->_address;
}

- (unint64_t)paymentMethod
{
  return self->_paymentMethod;
}

- (BOOL)containsSubkeys
{
  return self->_containsSubkeys;
}

- (NSDictionary)keyMaterialHashForDeviceCredentialType
{
  return self->_keyMaterialHashForDeviceCredentialType;
}

- (void)setKeyMaterialHashForDeviceCredentialType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyMaterialHashForDeviceCredentialType, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong(&self->_underlyingpassCredential, 0);
}

@end