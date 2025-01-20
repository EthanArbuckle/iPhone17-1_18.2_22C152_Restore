@interface TRIFullMAAssetId
+ (BOOL)supportsSecureCoding;
+ (id)identWithType:(id)a3 specifier:(id)a4 version:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdent:(id)a3;
- (NSString)specifier;
- (NSString)type;
- (NSString)version;
- (TRIFullMAAssetId)initWithCoder:(id)a3;
- (TRIFullMAAssetId)initWithType:(id)a3 specifier:(id)a4 version:(id)a5;
- (id)copyWithReplacementSpecifier:(id)a3;
- (id)copyWithReplacementType:(id)a3;
- (id)copyWithReplacementVersion:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIFullMAAssetId

- (TRIFullMAAssetId)initWithType:(id)a3 specifier:(id)a4 version:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3265, @"Invalid parameter not satisfying: %@", @"specifier != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3264, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 3266, @"Invalid parameter not satisfying: %@", @"version != nil" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRIFullMAAssetId;
  v13 = [(TRIFullMAAssetId *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_type, a3);
    objc_storeStrong((id *)&v14->_specifier, a4);
    objc_storeStrong((id *)&v14->_version, a5);
  }

  return v14;
}

+ (id)identWithType:(id)a3 specifier:(id)a4 version:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithType:v10 specifier:v9 version:v8];

  return v11;
}

- (id)copyWithReplacementType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:v4 specifier:self->_specifier version:self->_version];

  return v5;
}

- (id)copyWithReplacementSpecifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type specifier:v4 version:self->_version];

  return v5;
}

- (id)copyWithReplacementVersion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type specifier:self->_specifier version:v4];

  return v5;
}

- (BOOL)isEqualToIdent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_type != 0;
  v7 = [v4 type];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  type = self->_type;
  if (type)
  {
    id v10 = [v5 type];
    int v11 = [(NSString *)type isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_specifier != 0;
  v13 = [v5 specifier];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  specifier = self->_specifier;
  if (specifier)
  {
    v16 = [v5 specifier];
    int v17 = [(NSString *)specifier isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_version != 0;
  objc_super v19 = [v5 version];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    version = self->_version;
    if (version)
    {
      v22 = [v5 version];
      char v23 = [(NSString *)version isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFullMAAssetId *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFullMAAssetId *)self isEqualToIdent:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_specifier hash] - v3 + 32 * v3;
  return [(NSString *)self->_version hash] - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFullMAAssetId)initWithCoder:(id)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  if (v5)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v7 = (objc_class *)objc_opt_class();
    if (isKindOfClass)
    {
      uint64_t v8 = [v4 decodeObjectOfClass:v7 forKey:@"specifier"];
      if (!v8)
      {
        int v20 = [v4 error];

        if (v20)
        {
          id v9 = 0;
          int v14 = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v37 = *MEMORY[0x1E4F28568];
        v38 = @"Retrieved nil serialized value for nonnull TRIFullMAAssetId.specifier";
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        char v23 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:2 userInfo:v13];
        [v4 failWithError:v23];

        id v9 = 0;
        goto LABEL_22;
      }
      id v9 = (void *)v8;
      objc_opt_class();
      char v10 = objc_opt_isKindOfClass();
      int v11 = (objc_class *)objc_opt_class();
      if (v10)
      {
        uint64_t v12 = [v4 decodeObjectOfClass:v11 forKey:@"version"];
        if (!v12)
        {
          v24 = [v4 error];

          if (!v24)
          {
            uint64_t v33 = *MEMORY[0x1E4F28568];
            v34 = @"Retrieved nil serialized value for nonnull TRIFullMAAssetId.version";
            v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            v26 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:2 userInfo:v25];
            [v4 failWithError:v26];
          }
          v13 = 0;
          goto LABEL_22;
        }
        v13 = (void *)v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          self = [(TRIFullMAAssetId *)self initWithType:v5 specifier:v9 version:v13];
          int v14 = self;
LABEL_23:

          goto LABEL_24;
        }
        v27 = (objc_class *)objc_opt_class();
        int v17 = NSStringFromClass(v27);
        v28 = (objc_class *)objc_opt_class();
        int v18 = NSStringFromClass(v28);
        objc_super v19 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIFullMAAssetId key \"version\" (expected %@, decoded %@)", v17, v18, 0];
        uint64_t v31 = *MEMORY[0x1E4F28568];
        v32 = v19;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:3 userInfo:v22];
        [v4 failWithError:v29];
      }
      else
      {
        v13 = NSStringFromClass(v11);
        v21 = (objc_class *)objc_opt_class();
        int v17 = NSStringFromClass(v21);
        int v18 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIFullMAAssetId key \"specifier\" (expected %@, decoded %@)", v13, v17, 0];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        v36 = v18;
        objc_super v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v22 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:3 userInfo:v19];
        [v4 failWithError:v22];
      }
    }
    else
    {
      id v9 = NSStringFromClass(v7);
      v16 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v16);
      int v17 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIFullMAAssetId key \"type\" (expected %@, decoded %@)", v9, v13, 0];
      uint64_t v39 = *MEMORY[0x1E4F28568];
      v40 = v17;
      int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      objc_super v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:3 userInfo:v18];
      [v4 failWithError:v19];
    }

LABEL_22:
    int v14 = 0;
    goto LABEL_23;
  }
  v15 = [v4 error];

  if (!v15)
  {
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42[0] = @"Retrieved nil serialized value for nonnull TRIFullMAAssetId.type";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFullMAAssetIdOCNTErrorDomain" code:2 userInfo:v9];
    [v4 failWithError:v13];
    goto LABEL_22;
  }
  int v14 = 0;
LABEL_25:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  type = self->_type;
  id v8 = v4;
  if (type)
  {
    [v4 encodeObject:type forKey:@"type"];
    id v4 = v8;
  }
  specifier = self->_specifier;
  if (specifier)
  {
    [v8 encodeObject:specifier forKey:@"specifier"];
    id v4 = v8;
  }
  version = self->_version;
  if (version)
  {
    [v8 encodeObject:version forKey:@"version"];
    id v4 = v8;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRIFullMAAssetId | type:%@ specifier:%@ version:%@>", self->_type, self->_specifier, self->_version];
  return v2;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)specifier
{
  return self->_specifier;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end