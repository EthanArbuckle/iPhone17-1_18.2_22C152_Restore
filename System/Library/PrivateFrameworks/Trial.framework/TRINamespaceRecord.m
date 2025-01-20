@interface TRINamespaceRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRecord:(id)a3;
- (NSString)name;
- (NSURL)treatmentURL;
- (TRINamespaceRecord)initWithCoder:(id)a3;
- (TRINamespaceRecord)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5;
- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3;
- (id)copyWithReplacementName:(id)a3;
- (id)copyWithReplacementTreatmentURL:(id)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)compatibilityVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRINamespaceRecord

- (TRINamespaceRecord)initWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 505, @"Invalid parameter not satisfying: %@", @"name != nil" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)TRINamespaceRecord;
  v12 = [(TRINamespaceRecord *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    v13->_compatibilityVersion = a4;
    objc_storeStrong((id *)&v13->_treatmentURL, a5);
  }

  return v13;
}

+ (id)recordWithName:(id)a3 compatibilityVersion:(unsigned int)a4 treatmentURL:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithName:v9 compatibilityVersion:v5 treatmentURL:v8];

  return v10;
}

- (id)copyWithReplacementName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v4 compatibilityVersion:self->_compatibilityVersion treatmentURL:self->_treatmentURL];

  return v5;
}

- (id)copyWithReplacementCompatibilityVersion:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  name = self->_name;
  treatmentURL = self->_treatmentURL;
  return (id)[v5 initWithName:name compatibilityVersion:v3 treatmentURL:treatmentURL];
}

- (id)copyWithReplacementTreatmentURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:self->_name compatibilityVersion:self->_compatibilityVersion treatmentURL:v4];

  return v5;
}

- (BOOL)isEqualToRecord:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  int v6 = self->_name != 0;
  v7 = [v4 name];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_9;
  }
  name = self->_name;
  if (name)
  {
    id v10 = [v5 name];
    int v11 = [(NSString *)name isEqual:v10];

    if (!v11) {
      goto LABEL_9;
    }
  }
  unsigned int compatibilityVersion = self->_compatibilityVersion;
  if (compatibilityVersion != [v5 compatibilityVersion]
    || (int v13 = self->_treatmentURL != 0,
        [v5 treatmentURL],
        v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = v14 == 0,
        v14,
        v13 == v15))
  {
LABEL_9:
    char v18 = 0;
  }
  else
  {
    treatmentURL = self->_treatmentURL;
    if (treatmentURL)
    {
      v17 = [v5 treatmentURL];
      char v18 = [(NSURL *)treatmentURL isEqual:v17];
    }
    else
    {
      char v18 = 1;
    }
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRINamespaceRecord *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRINamespaceRecord *)self isEqualToRecord:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  uint64_t v4 = self->_compatibilityVersion - v3 + 32 * v3;
  return [(NSURL *)self->_treatmentURL hash] - v4 + 32 * v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRINamespaceRecord)initWithCoder:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  if (!v5)
  {
    id v9 = [v4 error];

    if (!v9)
    {
      uint64_t v19 = *MEMORY[0x1E4F28568];
      v20[0] = @"Retrieved nil serialized value for nonnull TRINamespaceRecord.name";
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = 2;
LABEL_10:
      v14 = (void *)[v11 initWithDomain:@"TRINamespaceRecordOCNTErrorDomain" code:v12 userInfo:v10];
      [v4 failWithError:v14];
    }
LABEL_11:
    int v8 = 0;
    goto LABEL_15;
  }
  uint64_t v6 = [v4 decodeInt64ForKey:@"compatibilityVersion"];
  if (v6) {
    goto LABEL_3;
  }
  int v13 = [v4 error];

  if (v13) {
    goto LABEL_11;
  }
  if (([v4 containsValueForKey:@"compatibilityVersion"] & 1) == 0)
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    char v18 = @"Missing serialized value for TRINamespaceRecord.compatibilityVersion";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = 1;
    goto LABEL_10;
  }
LABEL_3:
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"treatmentURL"];
  if (v7 || ([v4 error], int v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    self = [(TRINamespaceRecord *)self initWithName:v5 compatibilityVersion:v6 treatmentURL:v7];
    int v8 = self;
  }
  else
  {
    int v8 = 0;
  }

LABEL_15:
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  name = self->_name;
  if (name) {
    [v6 encodeObject:name forKey:@"name"];
  }
  [v6 encodeInt64:self->_compatibilityVersion forKey:@"compatibilityVersion"];
  treatmentURL = self->_treatmentURL;
  if (treatmentURL) {
    [v6 encodeObject:treatmentURL forKey:@"treatmentURL"];
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  name = self->_name;
  id v5 = [NSNumber numberWithUnsignedInt:self->_compatibilityVersion];
  id v6 = (void *)[v3 initWithFormat:@"<TRINamespaceRecord | name:%@ compatibilityVersion:%@ treatmentURL:%@>", name, v5, self->_treatmentURL];

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

- (NSURL)treatmentURL
{
  return self->_treatmentURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatmentURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end