@interface USTrustIdentifier
+ (BOOL)supportsSecureCoding;
+ (id)identifierWithIdentifier:(id)a3 trusted:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)trusted;
- (NSString)identifier;
- (USTrustIdentifier)initWithCoder:(id)a3;
- (USTrustIdentifier)initWithIdentifier:(id)a3 trusted:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_USTrustIdentifierCommonInitWithIdentifier:(id)a3 trusted:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation USTrustIdentifier

+ (id)identifierWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v6 trusted:v4];

  return v7;
}

- (USTrustIdentifier)initWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)USTrustIdentifier;
  id v5 = a3;
  id v6 = [(USTrustIdentifier *)&v8 init];
  -[USTrustIdentifier _USTrustIdentifierCommonInitWithIdentifier:trusted:](v6, "_USTrustIdentifierCommonInitWithIdentifier:trusted:", v5, v4, v8.receiver, v8.super_class);

  return v6;
}

- (USTrustIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  int v6 = [v4 containsValueForKey:@"Trusted"];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    char v8 = v6;

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT)) {
      -[USTrustIdentifier initWithCoder:]((uint64_t)v5, v8);
    }
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)USTrustIdentifier;
    v9 = [(USTrustIdentifier *)&v11 init];
    -[USTrustIdentifier _USTrustIdentifierCommonInitWithIdentifier:trusted:](v9, "_USTrustIdentifierCommonInitWithIdentifier:trusted:", v5, [v4 decodeBoolForKey:@"Trusted"]);
  }

  return v9;
}

- (void)_USTrustIdentifierCommonInitWithIdentifier:(id)a3 trusted:(BOOL)a4
{
  int v6 = (NSString *)[a3 copy];
  identifier = self->_identifier;
  self->_identifier = v6;

  self->_trusted = a4;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"Identifier"];
  [v5 encodeBool:self->_trusted forKey:@"Trusted"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)USTrustIdentifier;
  id v4 = [(USTrustIdentifier *)&v8 description];
  id v5 = [(USTrustIdentifier *)self identifier];
  int v6 = [v3 stringWithFormat:@"%@, Identifier: %@, Trusted: %d", v4, v5, -[USTrustIdentifier trusted](self, "trusted")];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(USTrustIdentifier *)self identifier];
    BOOL v7 = [v5 identifier];
    if ([v6 isEqualToString:v7])
    {
      BOOL v8 = [(USTrustIdentifier *)self trusted];
      int v9 = v8 ^ [v5 trusted] ^ 1;
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
  v3 = [(USTrustIdentifier *)self identifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(USTrustIdentifier *)self trusted];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  identifier = v3->_identifier;
  BOOL trusted = v3->_trusted;
  return [(USTrustIdentifier *)v3 initWithIdentifier:identifier trusted:trusted];
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)trusted
{
  return self->_trusted;
}

- (void).cxx_destruct
{
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, char a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 1026;
  int v5 = a2 & 1;
  _os_log_fault_impl(&dword_218373000, MEMORY[0x263EF8438], OS_LOG_TYPE_FAULT, "Failed to decode USTrustIdentifier with identifier: %{public}@, hasTrustedKey: %{public}d", (uint8_t *)&v2, 0x12u);
}

@end