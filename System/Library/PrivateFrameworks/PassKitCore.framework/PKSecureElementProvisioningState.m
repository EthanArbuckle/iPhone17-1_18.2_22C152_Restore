@interface PKSecureElementProvisioningState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasNonce;
- (BOOL)isEqual:(id)a3;
- (NSData)externalizedAuth;
- (NSData)provisioningStepState;
- (NSString)productIdentifier;
- (NSString)referrerIdentifier;
- (NSString)secureElementReservationGroupIdentifier;
- (NSString)sid;
- (PKPaymentEligibilityResponse)eligibilityResponse;
- (PKPaymentProvisioningResponse)provisioningResponse;
- (PKPaymentRequirementsResponse)requirementsResponse;
- (PKSecureElementProvisioningState)init;
- (PKSecureElementProvisioningState)initWithCoder:(id)a3;
- (id)_init;
- (id)createDivergentState;
- (id)description;
- (id)useNonce;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEligibilityResponse:(id)a3;
- (void)setExternalizedAuth:(id)a3;
- (void)setNonce:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setProvisioningResponse:(id)a3;
- (void)setProvisioningStepState:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRequirementsResponse:(id)a3;
- (void)setSecureElementReservationGroupIdentifier:(id)a3;
@end

@implementation PKSecureElementProvisioningState

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKSecureElementProvisioningState;
  return [(PKSecureElementProvisioningState *)&v3 init];
}

- (PKSecureElementProvisioningState)init
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = [(PKSecureElementProvisioningState *)self _init];
  if (v2)
  {
    v9[0] = 0;
    v9[1] = 0;
    id v3 = objc_alloc_init(MEMORY[0x1E4F29128]);
    [v3 getUUIDBytes:v9];

    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v9 length:16];
    v5 = [v4 base64EncodedStringWithOptions:0];

    uint64_t v6 = [v5 substringToIndex:22];
    sid = v2->_sid;
    v2->_sid = (NSString *)v6;
  }
  return v2;
}

- (BOOL)hasNonce
{
  return self->_nonce != 0;
}

- (void)setNonce:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_nonce, a3);
    id v5 = v6;
  }
}

- (id)useNonce
{
  id v3 = self->_nonce;
  nonce = self->_nonce;
  self->_nonce = 0;

  return v3;
}

- (void)setRequirementsResponse:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_requirementsResponse, a3);
  id v5 = [v6 productIdentifier];
  if (v5) {
    objc_storeStrong((id *)&self->_productIdentifier, v5);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSecureElementProvisioningState)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKSecureElementProvisioningState;
  id v5 = [(PKSecureElementProvisioningState *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sid"];
    sid = v5->_sid;
    v5->_sid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"externalizedAuth"];
    externalizedAuth = v5->_externalizedAuth;
    v5->_externalizedAuth = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requirementsResponse"];
    requirementsResponse = v5->_requirementsResponse;
    v5->_requirementsResponse = (PKPaymentRequirementsResponse *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eligibilityResponse"];
    eligibilityResponse = v5->_eligibilityResponse;
    v5->_eligibilityResponse = (PKPaymentEligibilityResponse *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningResponse"];
    provisioningResponse = v5->_provisioningResponse;
    v5->_provisioningResponse = (PKPaymentProvisioningResponse *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementReservationGroupIdentifier"];
    secureElementReservationGroupIdentifier = v5->_secureElementReservationGroupIdentifier;
    v5->_secureElementReservationGroupIdentifier = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productIdentifier"];
    productIdentifier = v5->_productIdentifier;
    v5->_productIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nonce"];
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningStepState"];
    provisioningStepState = v5->_provisioningStepState;
    v5->_provisioningStepState = (NSData *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sid = self->_sid;
  id v5 = a3;
  [v5 encodeObject:sid forKey:@"sid"];
  [v5 encodeObject:self->_externalizedAuth forKey:@"externalizedAuth"];
  [v5 encodeObject:self->_requirementsResponse forKey:@"requirementsResponse"];
  [v5 encodeObject:self->_eligibilityResponse forKey:@"eligibilityResponse"];
  [v5 encodeObject:self->_provisioningResponse forKey:@"provisioningResponse"];
  [v5 encodeObject:self->_secureElementReservationGroupIdentifier forKey:@"secureElementReservationGroupIdentifier"];
  [v5 encodeObject:self->_productIdentifier forKey:@"productIdentifier"];
  [v5 encodeObject:self->_nonce forKey:@"nonce"];
  [v5 encodeObject:self->_referrerIdentifier forKey:@"referrerIdentifier"];
  [v5 encodeObject:self->_provisioningStepState forKey:@"provisioningStepState"];
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"sid: '%@'; ", self->_sid];
  [v6 appendFormat:@"externalizedAuth: '%@'; ", self->_externalizedAuth];
  [v6 appendFormat:@"requirementsResponse: '%@'; ", self->_requirementsResponse];
  [v6 appendFormat:@"eligibilityResponse: '%@'; ", self->_eligibilityResponse];
  objc_msgSend(v6, "appendFormat:", @"secureElementReservationGroupIdentifier: '%@'; ",
    self->_secureElementReservationGroupIdentifier);
  [v6 appendFormat:@"productIdentifier: '%@'; ", self->_productIdentifier];
  [v6 appendFormat:@"nonce: '%@'; ", self->_nonce];
  [v6 appendFormat:@"referrerIdentifier: '%@'; ", self->_nonce];
  if (self->_provisioningStepState) {
    v7 = @"Yes";
  }
  else {
    v7 = @"No";
  }
  [v6 appendFormat:@"hasProvisioningStepState: '%@'; ", v7];
  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_sid];
  [v3 safelyAddObject:self->_externalizedAuth];
  [v3 safelyAddObject:self->_requirementsResponse];
  [v3 safelyAddObject:self->_eligibilityResponse];
  [v3 safelyAddObject:self->_provisioningResponse];
  [v3 safelyAddObject:self->_secureElementReservationGroupIdentifier];
  [v3 safelyAddObject:self->_productIdentifier];
  [v3 safelyAddObject:self->_nonce];
  [v3 safelyAddObject:self->_referrerIdentifier];
  [v3 safelyAddObject:self->_provisioningStepState];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKSecureElementProvisioningState *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        sid = self->_sid;
        uint64_t v8 = v6->_sid;
        if (sid && v8)
        {
          if ((-[NSString isEqual:](sid, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (sid != v8)
        {
          goto LABEL_53;
        }
        externalizedAuth = self->_externalizedAuth;
        v11 = v6->_externalizedAuth;
        if (externalizedAuth && v11)
        {
          if ((-[NSData isEqual:](externalizedAuth, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (externalizedAuth != v11)
        {
          goto LABEL_53;
        }
        requirementsResponse = self->_requirementsResponse;
        v13 = v6->_requirementsResponse;
        if (requirementsResponse && v13)
        {
          if ((-[PKPaymentRequirementsResponse isEqual:](requirementsResponse, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (requirementsResponse != v13)
        {
          goto LABEL_53;
        }
        eligibilityResponse = self->_eligibilityResponse;
        v15 = v6->_eligibilityResponse;
        if (eligibilityResponse && v15)
        {
          if ((-[PKPaymentEligibilityResponse isEqual:](eligibilityResponse, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (eligibilityResponse != v15)
        {
          goto LABEL_53;
        }
        provisioningResponse = self->_provisioningResponse;
        v17 = v6->_provisioningResponse;
        if (provisioningResponse && v17)
        {
          if ((-[PKPaymentProvisioningResponse isEqual:](provisioningResponse, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (provisioningResponse != v17)
        {
          goto LABEL_53;
        }
        secureElementReservationGroupIdentifier = self->_secureElementReservationGroupIdentifier;
        v19 = v6->_secureElementReservationGroupIdentifier;
        if (secureElementReservationGroupIdentifier && v19)
        {
          if ((-[NSString isEqual:](secureElementReservationGroupIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (secureElementReservationGroupIdentifier != v19)
        {
          goto LABEL_53;
        }
        productIdentifier = self->_productIdentifier;
        v21 = v6->_productIdentifier;
        if (productIdentifier && v21)
        {
          if ((-[NSString isEqual:](productIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (productIdentifier != v21)
        {
          goto LABEL_53;
        }
        nonce = self->_nonce;
        v23 = v6->_nonce;
        if (nonce && v23)
        {
          if ((-[NSString isEqual:](nonce, "isEqual:") & 1) == 0) {
            goto LABEL_53;
          }
        }
        else if (nonce != v23)
        {
          goto LABEL_53;
        }
        referrerIdentifier = self->_referrerIdentifier;
        v25 = v6->_referrerIdentifier;
        if (referrerIdentifier && v25)
        {
          if (-[NSString isEqual:](referrerIdentifier, "isEqual:"))
          {
LABEL_49:
            provisioningStepState = self->_provisioningStepState;
            objc_super v27 = v6->_provisioningStepState;
            if (provisioningStepState && v27) {
              char v9 = -[NSData isEqual:](provisioningStepState, "isEqual:");
            }
            else {
              char v9 = provisioningStepState == v27;
            }
            goto LABEL_54;
          }
        }
        else if (referrerIdentifier == v25)
        {
          goto LABEL_49;
        }
LABEL_53:
        char v9 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    char v9 = 0;
  }
LABEL_55:

  return v9;
}

- (id)createDivergentState
{
  id v3 = [[PKSecureElementProvisioningState alloc] _init];
  uint64_t v4 = [(NSString *)self->_sid copy];
  id v5 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v4;

  uint64_t v6 = [(NSData *)self->_externalizedAuth copy];
  v7 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v6;

  objc_storeStrong((id *)v3 + 8, self->_requirementsResponse);
  objc_storeStrong((id *)v3 + 9, self->_eligibilityResponse);
  objc_storeStrong((id *)v3 + 10, self->_provisioningResponse);
  uint64_t v8 = [(NSString *)self->_secureElementReservationGroupIdentifier copy];
  char v9 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v8;

  uint64_t v10 = [(NSString *)self->_productIdentifier copy];
  v11 = (void *)*((void *)v3 + 6);
  *((void *)v3 + 6) = v10;

  uint64_t v12 = [(PKSecureElementProvisioningState *)self useNonce];
  v13 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v12;

  uint64_t v14 = [(NSString *)self->_referrerIdentifier copy];
  v15 = (void *)*((void *)v3 + 5);
  *((void *)v3 + 5) = v14;

  uint64_t v16 = [(NSData *)self->_provisioningStepState copy];
  v17 = (void *)*((void *)v3 + 7);
  *((void *)v3 + 7) = v16;

  return v3;
}

- (NSString)sid
{
  return self->_sid;
}

- (NSData)externalizedAuth
{
  return self->_externalizedAuth;
}

- (void)setExternalizedAuth:(id)a3
{
}

- (NSString)secureElementReservationGroupIdentifier
{
  return self->_secureElementReservationGroupIdentifier;
}

- (void)setSecureElementReservationGroupIdentifier:(id)a3
{
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSData)provisioningStepState
{
  return self->_provisioningStepState;
}

- (void)setProvisioningStepState:(id)a3
{
}

- (PKPaymentRequirementsResponse)requirementsResponse
{
  return self->_requirementsResponse;
}

- (PKPaymentEligibilityResponse)eligibilityResponse
{
  return self->_eligibilityResponse;
}

- (void)setEligibilityResponse:(id)a3
{
}

- (PKPaymentProvisioningResponse)provisioningResponse
{
  return self->_provisioningResponse;
}

- (void)setProvisioningResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningResponse, 0);
  objc_storeStrong((id *)&self->_eligibilityResponse, 0);
  objc_storeStrong((id *)&self->_requirementsResponse, 0);
  objc_storeStrong((id *)&self->_provisioningStepState, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementReservationGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_externalizedAuth, 0);
  objc_storeStrong((id *)&self->_sid, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end