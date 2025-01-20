@interface PKAuxiliaryCapabilityRequirementKeyMaterial
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3;
- (NSArray)contents;
- (NSArray)encryptedContents;
- (NSArray)rootAttestation;
- (NSString)version;
- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithCoder:(id)a3;
- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithKeyMaterialContents:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContents:(id)a3;
- (void)setEncryptedContents:(id)a3;
- (void)setRootAttestation:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation PKAuxiliaryCapabilityRequirementKeyMaterial

- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithKeyMaterialContents:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKAuxiliaryCapabilityRequirementKeyMaterial;
  v5 = [(PKAuxiliaryCapabilityRequirementKeyMaterial *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PKAuxiliaryCapabilityRequirementKeyMaterial *)v5 setContents:v4];
  }

  return v6;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"version: '%@'; ", self->_version];
  [v6 appendFormat:@"contents: '%@'; ", self->_contents];
  [v6 appendFormat:@"rootAttestation: '%@'; ", self->_rootAttestation];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_contents) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_encryptedContents) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_rootAttestation) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_version) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKAuxiliaryCapabilityRequirementKeyMaterial *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAuxiliaryCapabilityRequirementKeyMaterial *)self isEqualToAuxiliaryCapabilityRequirementKey:v5];

  return v6;
}

- (BOOL)isEqualToAuxiliaryCapabilityRequirementKey:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_22;
  }
  rootAttestation = self->_rootAttestation;
  BOOL v6 = (NSArray *)v4[3];
  if (rootAttestation) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (rootAttestation != v6) {
      goto LABEL_22;
    }
  }
  else if ((-[NSArray isEqual:](rootAttestation, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  version = self->_version;
  v9 = (NSString *)v4[4];
  if (version && v9)
  {
    if ((-[NSString isEqual:](version, "isEqual:") & 1) == 0) {
      goto LABEL_22;
    }
  }
  else if (version != v9)
  {
    goto LABEL_22;
  }
  contents = self->_contents;
  v11 = (NSArray *)v4[1];
  if (!contents || !v11)
  {
    if (contents == v11) {
      goto LABEL_18;
    }
LABEL_22:
    char v14 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](contents, "isEqual:") & 1) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  encryptedContents = self->_encryptedContents;
  v13 = (NSArray *)v4[2];
  if (encryptedContents && v13) {
    char v14 = -[NSArray isEqual:](encryptedContents, "isEqual:");
  }
  else {
    char v14 = encryptedContents == v13;
  }
LABEL_23:

  return v14;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(NSArray *)self->_contents pk_arrayByApplyingBlock:&__block_literal_global_187_0];
  [v3 setObject:v4 forKeyedSubscript:@"contents"];

  unint64_t v5 = [(NSArray *)self->_rootAttestation pk_arrayBySafelyApplyingBlock:&__block_literal_global_189];
  [v3 setObject:v5 forKeyedSubscript:@"rootAttestation"];

  BOOL v6 = [(NSArray *)self->_encryptedContents pk_arrayByApplyingBlock:&__block_literal_global_192];
  [v3 setObject:v6 forKeyedSubscript:@"encryptedContents"];

  [v3 setObject:self->_version forKeyedSubscript:@"version"];
  BOOL v7 = (void *)[v3 copy];

  return v7;
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 base64EncodedStringWithOptions:0];
}

uint64_t __71__PKAuxiliaryCapabilityRequirementKeyMaterial_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contents = self->_contents;
  id v5 = a3;
  [v5 encodeObject:contents forKey:@"contents"];
  [v5 encodeObject:self->_encryptedContents forKey:@"encryptedContents"];
  [v5 encodeObject:self->_rootAttestation forKey:@"rootAttestation"];
  [v5 encodeObject:self->_version forKey:@"version"];
}

- (PKAuxiliaryCapabilityRequirementKeyMaterial)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  BOOL v7 = (void *)[v5 initWithArray:v6];
  objc_super v8 = [v4 decodeObjectOfClasses:v7 forKey:@"contents"];

  v9 = [(PKAuxiliaryCapabilityRequirementKeyMaterial *)self initWithKeyMaterialContents:v8];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    v12 = (void *)[v10 initWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"encryptedContents"];
    encryptedContents = v9->_encryptedContents;
    v9->_encryptedContents = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"rootAttestation"];
    rootAttestation = v9->_rootAttestation;
    v9->_rootAttestation = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v9->_version;
    v9->_version = (NSString *)v20;
  }
  return v9;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSArray)encryptedContents
{
  return self->_encryptedContents;
}

- (void)setEncryptedContents:(id)a3
{
}

- (NSArray)rootAttestation
{
  return self->_rootAttestation;
}

- (void)setRootAttestation:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rootAttestation, 0);
  objc_storeStrong((id *)&self->_encryptedContents, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end