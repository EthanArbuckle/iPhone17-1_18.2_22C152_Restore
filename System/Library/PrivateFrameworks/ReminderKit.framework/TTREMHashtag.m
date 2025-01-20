@interface TTREMHashtag
+ (BOOL)isHashtag:(id)a3 equalToModelComparable:(id)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToModelComparable:(id)a3;
- (NSString)description;
- (NSString)objectIdentifier;
- (TTREMHashtag)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setObjectIdentifier:(id)a3;
@end

@implementation TTREMHashtag

+ (BOOL)isHashtag:(id)a3 equalToModelComparable:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectIdentifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 objectIdentifier];
    v8 = (void *)v7;
    char v9 = 0;
    if (v6 && v7) {
      char v9 = [v6 isEqualToString:v7];
    }
  }
  else
  {
    v8 = 0;
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqualToModelComparable:(id)a3
{
  return +[TTREMHashtag isHashtag:self equalToModelComparable:a3];
}

- (unint64_t)hash
{
  v2 = [(TTREMHashtag *)self objectIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TTREMHashtag *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && +[TTREMHashtag isHashtag:self equalToModelComparable:v4];
  }

  return v5;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(TTREMHashtag *)self objectIdentifier];
  v6 = [v3 stringWithFormat:@"<%@: %p objectIdentifier: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (TTREMHashtag)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTREMHashtag;
  BOOL v5 = [(TTREMHashtag *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectIdentifier"];
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(TTREMHashtag *)self objectIdentifier];
  [v4 encodeObject:v5 forKey:@"objectIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end