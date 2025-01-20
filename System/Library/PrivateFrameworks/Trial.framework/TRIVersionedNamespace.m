@interface TRIVersionedNamespace
+ (BOOL)supportsSecureCoding;
+ (id)versionedNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVersionedNamespace:(id)a3;
- (NSString)name;
- (TRIVersionedNamespace)initWithCoder:(id)a3;
- (TRIVersionedNamespace)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4;
- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3;
- (id)copyWithReplacementName:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)compatibilityVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIVersionedNamespace

- (TRIVersionedNamespace)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4
{
  id v8 = a3;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"TRIVersionedNamespace.m", 20, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)TRIVersionedNamespace;
  v9 = [(TRIVersionedNamespace *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    v10->_compatibilityVersion = a4;
  }

  return v10;
}

+ (id)versionedNamespaceWithName:(id)a3 compatibilityVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 compatibilityVersion:v4];

  return v7;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v4 compatibilityVersion:self->_compatibilityVersion];

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  name = self->_name;
  return (id)[v5 initWithName:name compatibilityVersion:v3];
}

- (BOOL)isEqualToVersionedNamespace:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  int v6 = self->_name != 0;
  v7 = [v4 name];
  int v8 = v7 == 0;

  if (v6 == v8
    || (name = self->_name) != 0
    && ([v5 name],
        v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [(NSString *)name isEqual:v10],
        v10,
        !v11))
  {
LABEL_6:
    BOOL v13 = 0;
  }
  else
  {
    unsigned int compatibilityVersion = self->_compatibilityVersion;
    BOOL v13 = compatibilityVersion == [v5 compatibilityVersion];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRIVersionedNamespace *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRIVersionedNamespace *)self isEqualToVersionedNamespace:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return self->_compatibilityVersion - v3 + 32 * v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIVersionedNamespace)initWithCoder:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (!v5)
  {
    int v8 = [v4 error];

    if (!v8)
    {
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18[0] = @"Retrieved nil serialized value for nonnull TRIVersionedNamespace.name";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 2;
LABEL_9:
      BOOL v13 = (void *)[v10 initWithDomain:@"TRIVersionedNamespaceOCNTErrorDomain" code:v11 userInfo:v9];
      [v4 failWithError:v13];
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"compatibilityVersion"];
  if (!v6)
  {
    v12 = [v4 error];

    if (!v12)
    {
      if ([v4 containsValueForKey:@"compatibilityVersion"]) {
        goto LABEL_3;
      }
      uint64_t v15 = *MEMORY[0x1E4F28568];
      v16 = @"Missing serialized value for TRIVersionedNamespace.compatibilityVersion";
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v11 = 1;
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_3:
  self = [(TRIVersionedNamespace *)self initWithName:v5 compatibilityVersion:v6];
  v7 = self;
LABEL_11:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  name = self->_name;
  id v6 = v4;
  if (name)
  {
    [v4 encodeObject:name forKey:@"name"];
    id v4 = v6;
  }
  [v4 encodeInt64:self->_compatibilityVersion forKey:@"compatibilityVersion"];
}

- (id)description
{
  id v3 = [NSString alloc];
  name = self->_name;
  id v5 = [NSNumber numberWithUnsignedInt:self->_compatibilityVersion];
  id v6 = (void *)[v3 initWithFormat:@"<TRIVersionedNamespace | name:%@ compatibilityVersion:%@>", name, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
}

@end