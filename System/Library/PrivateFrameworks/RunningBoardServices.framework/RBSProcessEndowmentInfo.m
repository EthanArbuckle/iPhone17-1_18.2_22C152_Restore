@interface RBSProcessEndowmentInfo
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)endowmentNamespace;
- (NSString)environment;
- (OS_xpc_object)encodedEndowment;
- (RBSProcessEndowmentInfo)initWithRBSXPCCoder:(id)a3;
- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5;
- (id)endowment;
- (unint64_t)hash;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessEndowmentInfo

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  endowmentNamespace = self->_endowmentNamespace;
  id v5 = a3;
  [v5 encodeObject:endowmentNamespace forKey:@"namespace"];
  [v5 encodeObject:self->_environment forKey:@"environment"];
  RBSXPCPackObject(self->_encodedEndowment);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeXPCObject:v6 forKey:@"encodedEndowment"];
}

- (RBSProcessEndowmentInfo)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespace"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];
  v7 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"encodedEndowment"];

  v8 = RBSXPCUnpackObject(v7);
  v9 = [(RBSProcessEndowmentInfo *)self _initWithNamespace:v5 environment:v6 encodedEndowment:v8];

  return v9;
}

- (id)_initWithNamespace:(id)a3 environment:(id)a4 encodedEndowment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v11 = rbs_state_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[RBSProcessEndowmentInfo _initWithNamespace:environment:encodedEndowment:](v11);
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)RBSProcessEndowmentInfo;
  v12 = [(RBSProcessEndowmentInfo *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    endowmentNamespace = v12->_endowmentNamespace;
    v12->_endowmentNamespace = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    environment = v12->_environment;
    v12->_environment = (NSString *)v15;

    objc_storeStrong((id *)&v12->_encodedEndowment, a5);
    v17 = [(OS_xpc_object *)v12->_encodedEndowment description];
    v12->_encodedEndowmentHash = [v17 hash];

    uint64_t v18 = [(NSString *)v12->_endowmentNamespace hash];
    v12->_hash = [(NSString *)v12->_environment hash] ^ v18;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedEndowment, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessEndowmentInfo *)a3;
  if (self == v4) {
    goto LABEL_17;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_16;
  }
  if (self->_hash != v4->_hash) {
    goto LABEL_16;
  }
  if (self->_encodedEndowment)
  {
    if (v4->_encodedEndowment)
    {
      uint64_t v6 = MEMORY[0x192FECA30]();
      if (v6 != MEMORY[0x192FECA30](v4->_encodedEndowment)
        || !xpc_equal(self->_encodedEndowment, v4->_encodedEndowment))
      {
        goto LABEL_16;
      }
    }
  }
  environment = self->_environment;
  id v8 = v4->_environment;
  if (environment != v8)
  {
    char v9 = 0;
    if (!environment || !v8) {
      goto LABEL_18;
    }
    if (!-[NSString isEqual:](environment, "isEqual:"))
    {
LABEL_16:
      char v9 = 0;
      goto LABEL_18;
    }
  }
  endowmentNamespace = self->_endowmentNamespace;
  v11 = v4->_endowmentNamespace;
  if (endowmentNamespace == v11)
  {
LABEL_17:
    char v9 = 1;
    goto LABEL_18;
  }
  char v9 = 0;
  if (endowmentNamespace && v11) {
    char v9 = -[NSString isEqual:](endowmentNamespace, "isEqual:");
  }
LABEL_18:

  return v9;
}

- (id)endowment
{
  return RBSEndowmentDecode(self->_encodedEndowment);
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  uint64_t v5 = (void *)v4;
  uint64_t v6 = @"payload:";
  if (!self->_encodedEndowment) {
    uint64_t v6 = &stru_1EE2E2768;
  }
  v7 = (void *)[v3 initWithFormat:@"<%@| namespace:%@ env:%@ %@ %lu>", v4, self->_endowmentNamespace, self->_environment, v6, self->_encodedEndowmentHash];

  return (NSString *)v7;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (NSString)environment
{
  return self->_environment;
}

- (OS_xpc_object)encodedEndowment
{
  return self->_encodedEndowment;
}

- (void)_initWithNamespace:(os_log_t)log environment:encodedEndowment:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_191FE8000, log, OS_LOG_TYPE_DEBUG, "endowmentNamespace can not be nil", v1, 2u);
}

@end