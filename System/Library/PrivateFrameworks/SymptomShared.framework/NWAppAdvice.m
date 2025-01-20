@interface NWAppAdvice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)reason;
- (NWAppAdvice)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setReason:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation NWAppAdvice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWAppAdvice)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NWAppAdvice;
  v5 = [(NWAppAdvice *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x2611E0E10]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = (void *)MEMORY[0x2611E0E10]();
  v5 = [(NWAppAdvice *)self bundleIdentifier];
  [v7 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[NWAppAdvice state](self, "state"), @"state");
  v6 = [(NWAppAdvice *)self reason];
  [v7 encodeObject:v6 forKey:@"reason"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NWAppAdvice);
  objc_storeStrong((id *)&v4->_bundleIdentifier, self->_bundleIdentifier);
  v4->_state = self->_state;
  objc_storeStrong((id *)&v4->_reason, self->_reason);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NWAppAdvice *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(NWAppAdvice *)self bundleIdentifier];
      id v7 = [(NWAppAdvice *)v5 bundleIdentifier];
      if ([v6 isEqualToString:v7]
        && (int64_t v8 = [(NWAppAdvice *)self state], v8 == [(NWAppAdvice *)v5 state]))
      {
        uint64_t v9 = [(NWAppAdvice *)self reason];
        v10 = [(NWAppAdvice *)v5 reason];
        char v11 = [v9 isEqualToString:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = NSString;
  id v4 = [(NWAppAdvice *)self bundleIdentifier];
  int64_t v5 = [(NWAppAdvice *)self state];
  v6 = [(NWAppAdvice *)self reason];
  id v7 = [v3 stringWithFormat:@"%@, %ld, %@", v4, v5, v6];

  unint64_t v8 = [v7 hash];
  return v8;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end