@interface _SWCApplicationIdentifier
+ (BOOL)isCaseSensitive;
+ (BOOL)supportsSecureCoding;
+ (_SWCApplicationIdentifier)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToApplicationIdentifierIgnoringPrefix:(id)a3;
- (BOOL)isValid;
- (NSString)bundleIdentifier;
- (NSString)prefix;
- (NSString)rawValue;
- (_SWCApplicationIdentifier)init;
- (_SWCApplicationIdentifier)initWithCoder:(id)a3;
- (_SWCApplicationIdentifier)initWithString:(id)a3;
- (id)UUIDRepresentation;
- (id)debugDescription;
- (id)initForBundleRecord:(id)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SWCApplicationIdentifier

+ (BOOL)isCaseSensitive
{
  return 1;
}

+ (_SWCApplicationIdentifier)new
{
}

- (_SWCApplicationIdentifier)init
{
}

- (_SWCApplicationIdentifier)initWithString:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SWCApplicationIdentifier;
  v5 = [(_SWCApplicationIdentifier *)&v19 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1AD1157F0]();
    if ([v4 rangeOfString:@"."] == 10)
    {
      uint64_t v8 = v7;
      v9 = [v4 substringToIndex:10];
      uint64_t v10 = [v9 uppercaseString];
      prefix = v5->_prefix;
      v5->_prefix = (NSString *)v10;

      uint64_t v12 = [v4 substringFromIndex:v8 + 10];
    }
    else
    {
      uint64_t v12 = [v4 copy];
    }
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v12;

    int v14 = [(id)objc_opt_class() isCaseSensitive];
    v15 = v5->_bundleIdentifier;
    if (v14)
    {
      v5->_hash = [(NSString *)v15 hash];
    }
    else
    {
      v16 = [(NSString *)v15 lowercaseString];
      v5->_hash = [v16 hash];
    }
    v17 = v5->_prefix;
    if (v17) {
      v5->_hash ^= [(NSString *)v17 hash];
    }
  }

  return v5;
}

- (NSString)rawValue
{
  if (self->_prefix) {
    v2 = (NSString *)[[NSString alloc] initWithFormat:@"%@.%@", self->_prefix, self->_bundleIdentifier];
  }
  else {
    v2 = self->_bundleIdentifier;
  }
  return v2;
}

- (BOOL)isValid
{
  return [(NSString *)self->_bundleIdentifier rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEqualToApplicationIdentifierIgnoringPrefix:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() isCaseSensitive];
  bundleIdentifier = self->_bundleIdentifier;
  uint64_t v7 = v4[3];
  if (v5) {
    char v8 = [(NSString *)bundleIdentifier isEqual:v7];
  }
  else {
    char v8 = [(NSString *)bundleIdentifier caseInsensitiveCompare:v7] == NSOrderedSame;
  }

  return v8;
}

- (id)UUIDRepresentation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = [(_SWCApplicationIdentifier *)self rawValue];
  int v5 = [v4 dataUsingEncoding:4];

  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SWCApplicationIdentifier.mm" lineNumber:120 description:@"Failed to get the UTF-8 representation of an application identifier."];
  }
  memset(v10, 0, sizeof(v10));
  id v6 = v5;
  CC_SHA256((const void *)objc_msgSend(v6, "bytes", 0, 0, 0, 0), objc_msgSend(v6, "length"), (unsigned __int8 *)v10);
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v10];

  return v7;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_SWCApplicationIdentifier *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      prefix = self->_prefix;
      BOOL v7 = (prefix == v5->_prefix || -[NSString isEqual:](prefix, "isEqual:"))
        && [(_SWCApplicationIdentifier *)self isEqualToApplicationIdentifierIgnoringPrefix:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  int v5 = [(_SWCApplicationIdentifier *)self description];
  id v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  return @"<app id>";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(_SWCApplicationIdentifier *)self rawValue];
  [v5 encodeObject:v4 forKey:@"rawValue"];
}

- (_SWCApplicationIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"rawValue");
  id v6 = [(_SWCApplicationIdentifier *)self initWithString:v5];

  return v6;
}

- (NSString)prefix
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (id)initForBundleRecord:(id)a3
{
  id v4 = a3;
  id v5 = [v4 applicationIdentifier];
  if (v5
    || (objc_opt_respondsToSelector() & 1) != 0
    && [v4 isSystemPlaceholder]
    && ([v4 bundleIdentifier], (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = [(_SWCApplicationIdentifier *)self initWithString:v5];
  }
  else
  {

    id v5 = 0;
    id v6 = 0;
  }

  return v6;
}

@end