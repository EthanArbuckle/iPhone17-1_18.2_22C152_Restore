@interface STUsageTrustIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)usageTrusted;
- (NSString)identifier;
- (STUsageTrustIdentifier)initWithCoder:(id)a3;
- (STUsageTrustIdentifier)initWithIdentifier:(id)a3 usageTrusted:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_stUsageTrustIdentifierCommonInitWithIdentifier:(id)a3 usageTrusted:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STUsageTrustIdentifier

- (STUsageTrustIdentifier)initWithIdentifier:(id)a3 usageTrusted:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)STUsageTrustIdentifier;
  id v5 = a3;
  v6 = [(STUsageTrustIdentifier *)&v8 init];
  -[STUsageTrustIdentifier _stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:](v6, "_stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:", v5, v4, v8.receiver, v8.super_class);

  return v6;
}

- (STUsageTrustIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  int v6 = [v4 containsValueForKey:@"UsageTrusted"];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    char v8 = v6;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      -[STUsageTrustIdentifier initWithCoder:]((uint64_t)v5, v8);
    }
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)STUsageTrustIdentifier;
    v9 = [(STUsageTrustIdentifier *)&v11 init];
    -[STUsageTrustIdentifier _stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:](v9, "_stUsageTrustIdentifierCommonInitWithIdentifier:usageTrusted:", v5, [v4 decodeBoolForKey:@"UsageTrusted"]);
  }

  return v9;
}

- (void)_stUsageTrustIdentifierCommonInitWithIdentifier:(id)a3 usageTrusted:(BOOL)a4
{
  int v6 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v6;

  self->_usageTrusted = a4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeBool:self->_usageTrusted forKey:@"UsageTrusted"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(STUsageTrustIdentifier *)self identifier];
    BOOL v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = [(STUsageTrustIdentifier *)self usageTrusted];
      int v9 = v8 ^ [v5 usageTrusted] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(STUsageTrustIdentifier *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(STUsageTrustIdentifier *)self usageTrusted];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[STUsageTrustIdentifier allocWithZone:a3];
  identifier = self->_identifier;
  BOOL usageTrusted = self->_usageTrusted;
  return [(STUsageTrustIdentifier *)v4 initWithIdentifier:identifier usageTrusted:usageTrusted];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)usageTrusted
{
  return self->_usageTrusted;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, char a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_fault_impl(&dword_1DA519000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to decode STUsageTrustIdentifier with identifier: %{public}@, hasUsageTrustedKey: %d", (uint8_t *)&v2, 0x12u);
}

@end