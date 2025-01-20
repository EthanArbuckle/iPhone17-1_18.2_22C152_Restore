@interface TRIFactorProviderIdent
+ (BOOL)supportsSecureCoding;
+ (id)identWithType:(unsigned __int8)a3 value:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIdent:(id)a3;
- (NSString)value;
- (TRIFactorProviderIdent)initWithCoder:(id)a3;
- (TRIFactorProviderIdent)initWithType:(unsigned __int8)a3 value:(id)a4;
- (id)copyWithReplacementType:(unsigned __int8)a3;
- (id)copyWithReplacementValue:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIFactorProviderIdent

- (TRIFactorProviderIdent)initWithType:(unsigned __int8)a3 value:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1364, @"Invalid parameter not satisfying: %@", @"value != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIFactorProviderIdent;
  v9 = [(TRIFactorProviderIdent *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_value, a4);
  }

  return v10;
}

+ (id)identWithType:(unsigned __int8)a3 value:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithType:v4 value:v6];

  return v7;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  value = self->_value;
  return (id)[v5 initWithType:v3 value:value];
}

- (id)copyWithReplacementValue:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithType:self->_type value:v4];

  return v5;
}

- (BOOL)isEqualToIdent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (int type = self->_type, type == [v4 type])
    && (int v7 = self->_value != 0,
        [v5 value],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    value = self->_value;
    if (value)
    {
      v11 = [v5 value];
      char v12 = [(NSString *)value isEqual:v11];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIFactorProviderIdent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIFactorProviderIdent *)self isEqualToIdent:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  return [(NSString *)self->_value hash] - type + 32 * type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFactorProviderIdent)initWithCoder:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned __int8 v5 = [v4 decodeInt64ForKey:@"type"];
  if (v5) {
    goto LABEL_2;
  }
  int v9 = [v4 error];

  if (!v9)
  {
    if (([v4 containsValueForKey:@"type"] & 1) == 0)
    {
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"Missing serialized value for TRIFactorProviderIdent.type";
      int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFactorProviderIdentOCNTErrorDomain" code:1 userInfo:v7];
      [v4 failWithError:v14];
      goto LABEL_13;
    }
LABEL_2:
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    if (!v6)
    {
      v10 = [v4 error];

      if (!v10)
      {
        uint64_t v23 = *MEMORY[0x1E4F28568];
        v24 = @"Retrieved nil serialized value for nonnull TRIFactorProviderIdent.value";
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        char v12 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFactorProviderIdentOCNTErrorDomain" code:2 userInfo:v11];
        [v4 failWithError:v12];
      }
      int v7 = 0;
      goto LABEL_14;
    }
    int v7 = (void *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self = [(TRIFactorProviderIdent *)self initWithType:v5 value:v7];
      id v8 = self;
LABEL_15:

      goto LABEL_16;
    }
    objc_super v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for TRIFactorProviderIdent key \"value\" (expected %@, decoded %@)", v14, v16, 0];
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"TRIFactorProviderIdentOCNTErrorDomain" code:3 userInfo:v18];
    [v4 failWithError:v19];

LABEL_13:
LABEL_14:
    id v8 = 0;
    goto LABEL_15;
  }
  id v8 = 0;
LABEL_16:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeInt64:self->_type forKey:@"type"];
  value = self->_value;
  if (value) {
    [v5 encodeObject:value forKey:@"value"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [NSNumber numberWithUnsignedChar:self->_type];
  id v5 = (void *)[v3 initWithFormat:@"<TRIFactorProviderIdent | type:%@ value:%@>", v4, self->_value];

  return v5;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
}

@end