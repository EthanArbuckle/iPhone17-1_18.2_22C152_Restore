@interface PKAuxiliaryCapabilityRequirementKeyMaterialContent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3;
- (NSArray)attestation;
- (NSArray)certificateChain;
- (NSArray)secondaryAttestation;
- (NSData)applicationIdentifier;
- (NSData)authorization;
- (NSData)publicKey;
- (NSData)securityAccessControl;
- (NSData)signature;
- (NSString)keyReferenceIdentifier;
- (NSString)publicKeyIdentifier;
- (PKAuxiliaryCapabilityRequirementKeyMaterialContent)initWithCoder:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAttestation:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setCertificateChain:(id)a3;
- (void)setKeyReferenceIdentifier:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setPublicKeyIdentifier:(id)a3;
- (void)setSecondaryAttestation:(id)a3;
- (void)setSecurityAccessControl:(id)a3;
- (void)setSignature:(id)a3;
@end

@implementation PKAuxiliaryCapabilityRequirementKeyMaterialContent

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"publicKey: '%@'; ", self->_publicKey];
  [v6 appendFormat:@"publicKeyIdentifier: '%@'; ", self->_publicKeyIdentifier];
  [v6 appendFormat:@"attestation: '%@'; ", self->_attestation];
  [v6 appendFormat:@"secondaryAttestation: '%@'; ", self->_secondaryAttestation];
  [v6 appendFormat:@"authorization: '%@'; ", self->_authorization];
  [v6 appendFormat:@"signature: '%@'; ", self->_signature];
  [v6 appendFormat:@"certificateChain: '%@'; ", self->_certificateChain];
  [v6 appendFormat:@"keyReferenceIdentifier: '%@; ", self->_keyReferenceIdentifier];
  [v6 appendFormat:@"applicationIdentifier: '%@; ", self->_applicationIdentifier];
  [v6 appendFormat:@"securityAccessControl: '%@'; ", self->_securityAccessControl];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = v3;
  if (self->_publicKey) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_publicKeyIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_attestation) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_secondaryAttestation) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_authorization) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_signature) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_certificateChain) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_keyReferenceIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_applicationIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_securityAccessControl) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAuxiliaryCapabilityRequirementKeyMaterialContent *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAuxiliaryCapabilityRequirementKeyMaterialContent *)self isEqualToAuxiliaryCapabilityRequirementKey:v5];

  return v6;
}

- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_52;
  }
  publicKey = self->_publicKey;
  BOOL v6 = (NSData *)v4[1];
  if (publicKey) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (publicKey != v6) {
      goto LABEL_52;
    }
  }
  else if ((-[NSData isEqual:](publicKey, "isEqual:") & 1) == 0)
  {
    goto LABEL_52;
  }
  publicKeyIdentifier = self->_publicKeyIdentifier;
  v9 = (NSString *)v4[2];
  if (publicKeyIdentifier && v9)
  {
    if ((-[NSString isEqual:](publicKeyIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (publicKeyIdentifier != v9)
  {
    goto LABEL_52;
  }
  attestation = self->_attestation;
  v11 = (NSArray *)v4[3];
  if (attestation && v11)
  {
    if ((-[NSArray isEqual:](attestation, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (attestation != v11)
  {
    goto LABEL_52;
  }
  secondaryAttestation = self->_secondaryAttestation;
  v13 = (NSArray *)v4[4];
  if (secondaryAttestation && v13)
  {
    if ((-[NSArray isEqual:](secondaryAttestation, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (secondaryAttestation != v13)
  {
    goto LABEL_52;
  }
  authorization = self->_authorization;
  v15 = (NSData *)v4[5];
  if (authorization && v15)
  {
    if ((-[NSData isEqual:](authorization, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (authorization != v15)
  {
    goto LABEL_52;
  }
  signature = self->_signature;
  v17 = (NSData *)v4[6];
  if (signature && v17)
  {
    if ((-[NSData isEqual:](signature, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (signature != v17)
  {
    goto LABEL_52;
  }
  certificateChain = self->_certificateChain;
  v19 = (NSArray *)v4[7];
  if (certificateChain && v19)
  {
    if ((-[NSArray isEqual:](certificateChain, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (certificateChain != v19)
  {
    goto LABEL_52;
  }
  keyReferenceIdentifier = self->_keyReferenceIdentifier;
  v21 = (NSString *)v4[8];
  if (keyReferenceIdentifier && v21)
  {
    if ((-[NSString isEqual:](keyReferenceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_52;
    }
  }
  else if (keyReferenceIdentifier != v21)
  {
    goto LABEL_52;
  }
  applicationIdentifier = self->_applicationIdentifier;
  v23 = (NSData *)v4[9];
  if (!applicationIdentifier || !v23)
  {
    if (applicationIdentifier == v23) {
      goto LABEL_48;
    }
LABEL_52:
    char v26 = 0;
    goto LABEL_53;
  }
  if ((-[NSData isEqual:](applicationIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_52;
  }
LABEL_48:
  securityAccessControl = self->_securityAccessControl;
  v25 = (NSData *)v4[10];
  if (securityAccessControl && v25) {
    char v26 = -[NSData isEqual:](securityAccessControl, "isEqual:");
  }
  else {
    char v26 = securityAccessControl == v25;
  }
LABEL_53:

  return v26;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(NSData *)self->_publicKey base64EncodedStringWithOptions:0];
  [v3 setObject:v4 forKeyedSubscript:@"publicKey"];

  unint64_t v5 = (void *)[(NSString *)self->_publicKeyIdentifier copy];
  [v3 setObject:v5 forKeyedSubscript:@"publicKeyIdentifier"];

  BOOL v6 = [(NSArray *)self->_attestation pk_arrayBySafelyApplyingBlock:&__block_literal_global_200];
  [v3 setObject:v6 forKeyedSubscript:@"attestation"];

  BOOL v7 = [(NSArray *)self->_secondaryAttestation pk_arrayBySafelyApplyingBlock:&__block_literal_global_82];
  [v3 setObject:v7 forKeyedSubscript:@"secondaryAttestation"];

  v8 = [(NSData *)self->_authorization base64EncodedStringWithOptions:0];
  [v3 setObject:v8 forKeyedSubscript:@"authorization"];

  v9 = [(NSData *)self->_signature base64EncodedStringWithOptions:0];
  [v3 setObject:v9 forKeyedSubscript:@"signature"];

  v10 = [(NSArray *)self->_certificateChain pk_arrayBySafelyApplyingBlock:&__block_literal_global_84];
  [v3 setObject:v10 forKeyedSubscript:@"certificateChain"];

  v11 = (void *)[(NSString *)self->_keyReferenceIdentifier copy];
  [v3 setObject:v11 forKeyedSubscript:@"keyReferenceIdentifier"];

  v12 = [(NSData *)self->_applicationIdentifier hexEncoding];
  v13 = [v12 uppercaseString];
  [v3 setObject:v13 forKeyedSubscript:@"applicationIdentifier"];

  v14 = [(NSData *)self->_securityAccessControl base64EncodedStringWithOptions:0];
  [v3 setObject:v14 forKeyedSubscript:@"securityAccessControl"];

  v15 = (void *)[v3 copy];
  return v15;
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

uint64_t __78__PKAuxiliaryCapabilityRequirementKeyMaterialContent_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  publicKey = self->_publicKey;
  id v5 = a3;
  [v5 encodeObject:publicKey forKey:@"publicKey"];
  [v5 encodeObject:self->_publicKeyIdentifier forKey:@"publicKeyIdentifier"];
  [v5 encodeObject:self->_attestation forKey:@"attestation"];
  [v5 encodeObject:self->_secondaryAttestation forKey:@"secondaryAttestation"];
  [v5 encodeObject:self->_authorization forKey:@"authorization"];
  [v5 encodeObject:self->_signature forKey:@"signature"];
  [v5 encodeObject:self->_certificateChain forKey:@"certificateChain"];
  [v5 encodeObject:self->_keyReferenceIdentifier forKey:@"keyReferenceIdentifier"];
  [v5 encodeObject:self->_applicationIdentifier forKey:@"applicationIdentifier"];
  [v5 encodeObject:self->_securityAccessControl forKey:@"securityAccessControl"];
}

- (PKAuxiliaryCapabilityRequirementKeyMaterialContent)initWithCoder:(id)a3
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKAuxiliaryCapabilityRequirementKeyMaterialContent;
  id v5 = [(PKAuxiliaryCapabilityRequirementKeyMaterialContent *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyIdentifier"];
    publicKeyIdentifier = v5->_publicKeyIdentifier;
    v5->_publicKeyIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"attestation"];
    attestation = v5->_attestation;
    v5->_attestation = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"secondaryAttestation"];
    secondaryAttestation = v5->_secondaryAttestation;
    v5->_secondaryAttestation = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorization"];
    authorization = v5->_authorization;
    v5->_authorization = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signature"];
    signature = v5->_signature;
    v5->_signature = (NSData *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    char v26 = [v24 setWithArray:v25];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"certificateChain"];
    certificateChain = v5->_certificateChain;
    v5->_certificateChain = (NSArray *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyReferenceIdentifier"];
    keyReferenceIdentifier = v5->_keyReferenceIdentifier;
    v5->_keyReferenceIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSData *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"securityAccessControl"];
    securityAccessControl = v5->_securityAccessControl;
    v5->_securityAccessControl = (NSData *)v33;
  }
  return v5;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)publicKeyIdentifier
{
  return self->_publicKeyIdentifier;
}

- (void)setPublicKeyIdentifier:(id)a3
{
}

- (NSArray)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
}

- (NSArray)secondaryAttestation
{
  return self->_secondaryAttestation;
}

- (void)setSecondaryAttestation:(id)a3
{
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSArray)certificateChain
{
  return self->_certificateChain;
}

- (void)setCertificateChain:(id)a3
{
}

- (NSString)keyReferenceIdentifier
{
  return self->_keyReferenceIdentifier;
}

- (void)setKeyReferenceIdentifier:(id)a3
{
}

- (NSData)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSData)securityAccessControl
{
  return self->_securityAccessControl;
}

- (void)setSecurityAccessControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityAccessControl, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_keyReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_certificateChain, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_secondaryAttestation, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
  objc_storeStrong((id *)&self->_publicKeyIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end