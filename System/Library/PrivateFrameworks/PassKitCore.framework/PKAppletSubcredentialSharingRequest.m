@interface PKAppletSubcredentialSharingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isForLocalDevice;
- (NSString)credentialIdentifier;
- (NSString)passIdentifier;
- (NSString)recipientIdentifier;
- (NSString)recipientName;
- (PKAppletSubcredential)credential;
- (PKAppletSubcredentialSharingRequest)initWithCoder:(id)a3;
- (PKAppletSubcredentialSharingRequest)initWithPaymentPass:(id)a3 entitlements:(id)a4;
- (PKPassEntitlement)entitlement;
- (PKPaymentPass)pass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialForPass:(id)a3;
- (id)credentialWithIdentifier:(id)a3;
- (id)invitations;
- (void)encodeWithCoder:(id)a3;
- (void)setCredential:(id)a3;
- (void)setEntitlement:(id)a3;
- (void)setForLocalDevice:(BOOL)a3;
- (void)setPass:(id)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRecipientName:(id)a3;
@end

@implementation PKAppletSubcredentialSharingRequest

- (PKAppletSubcredentialSharingRequest)initWithPaymentPass:(id)a3 entitlements:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKAppletSubcredentialSharingRequest *)self init];
  v9 = v8;
  if (v8)
  {
    [(PKAppletSubcredentialSharingRequest *)v8 setPass:v6];
    if (v9->_credential)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v25 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (!objc_msgSend(v15, "carKeyEntitlementType", (void)v24))
            {
              objc_storeStrong((id *)&v9->_entitlement, v15);
              goto LABEL_13;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      if (v9->_entitlement) {
        goto LABEL_15;
      }
      uint64_t v16 = [v10 firstObject];
      entitlement = v9->_entitlement;
      v9->_entitlement = (PKPassEntitlement *)v16;

      if (v9->_entitlement) {
        goto LABEL_15;
      }
      v19 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        passIdentifier = v9->_passIdentifier;
        *(_DWORD *)buf = 138412290;
        v30 = passIdentifier;
        v21 = "Unable to create sharing request for pass %@ - no entitlements found";
        goto LABEL_18;
      }
    }
    else
    {
      v19 = PKLogFacilityTypeGetObject(0x16uLL);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v9->_passIdentifier;
        *(_DWORD *)buf = 138412290;
        v30 = v20;
        v21 = "Unable to create sharing request for pass %@ - no credential found";
LABEL_18:
        _os_log_impl(&dword_190E10000, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
      }
    }

    v18 = 0;
    goto LABEL_20;
  }
LABEL_15:
  v18 = v9;
LABEL_20:

  return v18;
}

- (id)credentialForPass:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a3, "devicePaymentApplications", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v3);
      }
      v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) subcredentials];
      v9 = [v8 anyObject];

      if (v9) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  return v9;
}

- (id)credentialWithIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(PKSecureElementPass *)self->_pass devicePaymentApplications];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * v9) subcredentials];
      long long v11 = [v10 anyObject];

      long long v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v11 = 0;
  }

  return v11;
}

- (void)setPass:(id)a3
{
  uint64_t v5 = (PKPaymentPass *)a3;
  if (self->_pass != v5)
  {
    char v13 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    uint64_t v6 = [(PKObject *)v13 uniqueID];
    passIdentifier = self->_passIdentifier;
    self->_passIdentifier = v6;

    if (self->_credentialIdentifier)
    {
      -[PKAppletSubcredentialSharingRequest credentialWithIdentifier:](self, "credentialWithIdentifier:");
      uint64_t v8 = (PKAppletSubcredential *)objc_claimAutoreleasedReturnValue();
      credential = self->_credential;
      self->_credential = v8;
    }
    else
    {
      id v10 = [(PKAppletSubcredentialSharingRequest *)self credentialForPass:self->_pass];
      long long v11 = self->_credential;
      self->_credential = v10;

      long long v12 = [(PKAppletSubcredential *)self->_credential identifier];
      credential = (PKAppletSubcredential *)self->_credentialIdentifier;
      self->_credentialIdentifier = v12;
    }

    uint64_t v5 = v13;
  }
}

- (id)invitations
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_recipientIdentifier || !self->_recipientName)
  {
    v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
LABEL_21:
      long long v26 = 0;
      goto LABEL_33;
    }
    passIdentifier = self->_passIdentifier;
    *(_DWORD *)buf = 138412290;
    v37 = passIdentifier;
    v28 = "Unable to create invitations for pass %@ - no recipient set";
LABEL_20:
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    goto LABEL_21;
  }
  if (!self->_entitlement)
  {
    v3 = PKLogFacilityTypeGetObject(0x16uLL);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    v29 = self->_passIdentifier;
    *(_DWORD *)buf = 138412290;
    v37 = v29;
    v28 = "Unable to create invitations for pass %@ - no entitlement set";
    goto LABEL_20;
  }
  v3 = [(PKPass *)self->_pass organizationName];
  if (v3)
  {
    id v4 = [(PKPass *)self->_pass localizedDescription];
    if (v4)
    {
      uint64_t v5 = v4;
      unint64_t v6 = [v4 length];
      uint64_t v7 = [v3 length];
      uint64_t v8 = v7 + 1;
      if (v6 > v7 + 1)
      {
        uint64_t v9 = v7;
        if ([v5 hasPrefix:v3])
        {
          id v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          int v11 = objc_msgSend(v10, "characterIsMember:", -[NSObject characterAtIndex:](v5, "characterAtIndex:", v9));

          if (v11)
          {
            uint64_t v12 = [v5 substringFromIndex:v8];

            uint64_t v5 = v12;
          }
        }
      }
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (!self->_forLocalDevice)
      {
        v34 = [PKAppletSubcredentialSharingInvitation alloc];
        char v13 = [(PKAppletSubcredential *)self->_credential partnerIdentifier];
        long long v14 = [(PKAppletSubcredential *)self->_credential brandIdentifier];
        long long v15 = [(PKAppletSubcredential *)self->_credential pairedReaderIdentifier];
        recipientName = self->_recipientName;
        long long v17 = [(PKPassEntitlement *)self->_entitlement value];
        long long v18 = -[PKAppletSubcredentialSharingInvitation initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:](v34, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v13, v14, v15, recipientName, [v17 unsignedIntegerValue], -[PKAppletSubcredential supportedRadioTechnologies](self->_credential, "supportedRadioTechnologies"));

        if (v18)
        {
          [(PKAppletSubcredentialSharingInvitation *)v18 setIssuer:v3];
          [(PKAppletSubcredentialSharingInvitation *)v18 setDeviceModel:v5];
          [v35 addObject:v18];
        }
      }
      v19 = [PKAppletSubcredentialSharingInvitation alloc];
      uint64_t v20 = [(PKAppletSubcredential *)self->_credential partnerIdentifier];
      v21 = [(PKAppletSubcredential *)self->_credential brandIdentifier];
      v22 = [(PKAppletSubcredential *)self->_credential pairedReaderIdentifier];
      v23 = self->_recipientName;
      long long v24 = [(PKPassEntitlement *)self->_entitlement value];
      long long v25 = -[PKAppletSubcredentialSharingInvitation initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:](v19, "initWithPartnerIdentifier:brandIdentifier:pairedReaderIdentifier:recipientName:entitlement:supportedRadioTechnologies:", v20, v21, v22, v23, [v24 unsignedIntegerValue], -[PKAppletSubcredential supportedRadioTechnologies](self->_credential, "supportedRadioTechnologies"));

      if (v25)
      {
        [(PKAppletSubcredentialSharingInvitation *)v25 setForWatch:1];
        [(PKAppletSubcredentialSharingInvitation *)v25 setIssuer:v3];
        [(PKAppletSubcredentialSharingInvitation *)v25 setDeviceModel:v5];
        [v35 addObject:v25];
      }
      if ([v35 count]) {
        long long v26 = (void *)[v35 copy];
      }
      else {
        long long v26 = 0;
      }

      goto LABEL_32;
    }
    uint64_t v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_passIdentifier;
      *(_DWORD *)buf = 138412290;
      v37 = v32;
      uint64_t v31 = "Unable to create invitations for pass %@ - no device model";
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0x16uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_passIdentifier;
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      uint64_t v31 = "Unable to create invitations for pass %@ - no issuer";
LABEL_28:
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);
    }
  }
  long long v26 = 0;
LABEL_32:

LABEL_33:
  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  passIdentifier = self->_passIdentifier;
  id v5 = a3;
  [v5 encodeObject:passIdentifier forKey:@"passIdentifier"];
  [v5 encodeObject:self->_credentialIdentifier forKey:@"credentialIdentifier"];
  [v5 encodeObject:self->_entitlement forKey:@"entitlement"];
  [v5 encodeObject:self->_recipientIdentifier forKey:@"recipientIdentifier"];
  [v5 encodeObject:self->_recipientName forKey:@"recipientName"];
  [v5 encodeBool:self->_forLocalDevice forKey:@"forLocalDevice"];
}

- (PKAppletSubcredentialSharingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredentialSharingRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passIdentifier"];
    passIdentifier = v5->_passIdentifier;
    v5->_passIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialIdentifier"];
    credentialIdentifier = v5->_credentialIdentifier;
    v5->_credentialIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entitlement"];
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientIdentifier"];
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientName"];
    recipientName = v5->_recipientName;
    v5->_recipientName = (NSString *)v14;

    v5->_forLocalDevice = [v4 decodeBoolForKey:@"forLocalDevice"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 48), self->_entitlement);
  objc_storeStrong((id *)(v4 + 56), self->_recipientIdentifier);
  objc_storeStrong((id *)(v4 + 64), self->_recipientName);
  *(unsigned char *)(v4 + 8) = self->_forLocalDevice;
  return (id)v4;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (PKAppletSubcredential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
}

- (NSString)passIdentifier
{
  return self->_passIdentifier;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(id)a3
{
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (void)setRecipientName:(id)a3
{
}

- (BOOL)isForLocalDevice
{
  return self->_forLocalDevice;
}

- (void)setForLocalDevice:(BOOL)a3
{
  self->_forLocalDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_passIdentifier, 0);
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end