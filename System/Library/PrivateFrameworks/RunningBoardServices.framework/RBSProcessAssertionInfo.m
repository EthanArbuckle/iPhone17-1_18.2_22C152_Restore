@interface RBSProcessAssertionInfo
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegacyAssertionReason:(unint64_t)a3;
- (NSString)description;
- (NSString)domain;
- (NSString)explanation;
- (NSString)name;
- (RBSProcessAssertionInfo)initWithRBSXPCCoder:(id)a3;
- (RBSProcessAssertionInfo)initWithType:(unsigned __int8)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)reason;
- (unsigned)type;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setDomain:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setName:(id)a3;
- (void)setReason:(unint64_t)a3;
@end

@implementation RBSProcessAssertionInfo

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)hash
{
  unint64_t v2 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * self->_type) ^ ((0xBF58476D1CE4E5B9 * self->_type) >> 27));
  unint64_t v3 = self->_reason ^ (self->_reason >> 30);
  unint64_t v4 = 0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v3) ^ ((0xBF58476D1CE4E5B9 * v3) >> 27));
  return v2 ^ ((v4 ^ v2) >> 31) ^ v4;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (RBSProcessAssertionInfo)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = -[RBSProcessAssertionInfo initWithType:](self, "initWithType:", [v4 decodeUInt64ForKey:@"t"]);
  if (v5)
  {
    v5->_reason = [v4 decodeUInt64ForKey:@"r"];
    uint64_t v6 = [v4 decodeStringForKey:@"e"];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

    uint64_t v8 = [v4 decodeStringForKey:@"d"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    uint64_t v10 = [v4 decodeStringForKey:@"n"];
    name = v5->_name;
    v5->_name = (NSString *)v10;
  }
  return v5;
}

- (RBSProcessAssertionInfo)initWithType:(unsigned __int8)a3
{
  result = [(RBSProcessAssertionInfo *)self init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void)setName:(id)a3
{
}

- (void)setExplanation:(id)a3
{
}

- (void)setDomain:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessAssertionInfo *)a3;
  v5 = v4;
  if (self == v4) {
    goto LABEL_19;
  }
  if (!v4) {
    goto LABEL_18;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 != objc_opt_class() || self->_type != v5->_type || self->_reason != v5->_reason) {
    goto LABEL_18;
  }
  explanation = self->_explanation;
  uint64_t v8 = v5->_explanation;
  if (explanation != v8)
  {
    char v9 = 0;
    if (!explanation || !v8) {
      goto LABEL_20;
    }
    if (!-[NSString isEqualToString:](explanation, "isEqualToString:")) {
      goto LABEL_18;
    }
  }
  domain = self->_domain;
  v11 = v5->_domain;
  if (domain != v11)
  {
    char v9 = 0;
    if (!domain || !v11) {
      goto LABEL_20;
    }
    if (!-[NSString isEqualToString:](domain, "isEqualToString:"))
    {
LABEL_18:
      char v9 = 0;
      goto LABEL_20;
    }
  }
  name = self->_name;
  v13 = v5->_name;
  if (name == v13)
  {
LABEL_19:
    char v9 = 1;
    goto LABEL_20;
  }
  char v9 = 0;
  if (name && v13) {
    char v9 = -[NSString isEqualToString:](name, "isEqualToString:");
  }
LABEL_20:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeUInt64:type forKey:@"t"];
  [v5 encodeUInt64:self->_reason forKey:@"r"];
  [v5 encodeObject:self->_explanation forKey:@"e"];
  [v5 encodeObject:self->_domain forKey:@"d"];
  [v5 encodeObject:self->_name forKey:@"n"];
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)isLegacyAssertionReason:(unint64_t)a3
{
  return self->_type == 3 && self->_reason == a3;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(id)objc_opt_class() description];
  id v5 = (void *)[v3 initWithFormat:@"<%@| type:%hhu reason:%llu name:\"%@\" domain:\"%@\" expl:\"%@\">", v4, self->_type, self->_reason, self->_name, self->_domain, self->_explanation];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[RBSProcessAssertionInfo allocWithZone:a3] initWithType:self->_type];
  [(RBSProcessAssertionInfo *)v4 setReason:self->_reason];
  [(RBSProcessAssertionInfo *)v4 setExplanation:self->_explanation];
  [(RBSProcessAssertionInfo *)v4 setDomain:self->_domain];
  [(RBSProcessAssertionInfo *)v4 setName:self->_name];
  return v4;
}

- (NSString)name
{
  return self->_name;
}

@end