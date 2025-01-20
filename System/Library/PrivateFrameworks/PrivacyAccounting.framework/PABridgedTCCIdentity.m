@interface PABridgedTCCIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (OS_tcc_identity)identity;
- (PABridgedTCCIdentity)initWithCoder:(id)a3;
- (PABridgedTCCIdentity)initWithTCCIdentity:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PABridgedTCCIdentity

- (PABridgedTCCIdentity)initWithTCCIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PABridgedTCCIdentity;
  v6 = [(PABridgedTCCIdentity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identity, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PABridgedTCCIdentity)initWithCoder:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v17[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  v7 = [v4 setWithArray:v6];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v10 = objc_msgSend(v8, "setWithArray:", v9, v16[0]);
  v11 = [v5 decodeDictionaryWithKeysOfClasses:v7 objectsOfClasses:v10 forKey:@"identity"];

  if (!v11)
  {
    v12 = 0;
    goto LABEL_5;
  }
  v12 = (void *)tcc_identity_create_from_external_representation();
  if (!v12)
  {
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  self = [(PABridgedTCCIdentity *)self initWithTCCIdentity:v12];
  v13 = self;
LABEL_6:
  v14 = v13;

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (id)tcc_identity_copy_external_representation();
  [v3 encodeObject:v4 forKey:@"identity"];
}

- (unint64_t)hash
{
  uint64_t type = tcc_identity_get_type();
  id v3 = [NSString stringWithUTF8String:tcc_identity_get_identifier()];
  uint64_t v4 = [v3 hash] - type + 32 * type;

  verifier_uint64_t type = tcc_identity_get_verifier_type();
  unint64_t v6 = verifier_type - v4 + 32 * v4;
  if (verifier_type)
  {
    v7 = [NSString stringWithUTF8String:tcc_identity_get_verifier_code_requirement_string()];
    unint64_t v6 = [v7 hash] - v6 + 32 * v6;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PABridgedTCCIdentity *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else if ([(PABridgedTCCIdentity *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v5 = areTCCIdentitiesEqual(self->_identity, v4->_identity);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)description
{
  v2 = (void *)tcc_object_copy_description();

  return v2;
}

- (OS_tcc_identity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
}

@end