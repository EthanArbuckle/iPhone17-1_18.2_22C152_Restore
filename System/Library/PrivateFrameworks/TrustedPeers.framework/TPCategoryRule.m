@interface TPCategoryRule
+ (BOOL)supportsSecureCoding;
+ (id)ruleWithPrefix:(id)a3 category:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCategoryRule:(id)a3;
- (NSString)category;
- (NSString)prefix;
- (TPCategoryRule)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCategory:(id)a3;
- (void)setPrefix:(id)a3;
@end

@implementation TPCategoryRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
}

- (void)setCategory:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (TPCategoryRule)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPCategoryRule;
  v5 = [(TPCategoryRule *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prefix"];
    prefix = v5->_prefix;
    v5->_prefix = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"category"];
    category = v5->_category;
    v5->_category = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TPCategoryRule *)self prefix];
  [v4 encodeObject:v5 forKey:@"prefix"];

  id v6 = [(TPCategoryRule *)self category];
  [v4 encodeObject:v6 forKey:@"category"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(TPCategoryRule *)self prefix];
  v5 = [(TPCategoryRule *)self category];
  id v6 = [v3 stringWithFormat:@"<TPCategoryRule: %@:%@>", v4, v5];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(TPCategoryRule *)self prefix];
  uint64_t v4 = [v3 hash];
  v5 = [(TPCategoryRule *)self category];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TPCategoryRule *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TPCategoryRule *)self isEqualToCategoryRule:v4];
  }

  return v5;
}

- (BOOL)isEqualToCategoryRule:(id)a3
{
  uint64_t v4 = (TPCategoryRule *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    BOOL v5 = [(TPCategoryRule *)self prefix];
    unint64_t v6 = [(TPCategoryRule *)v4 prefix];
    if ([v5 isEqualToString:v6])
    {
      v7 = [(TPCategoryRule *)self category];
      uint64_t v8 = [(TPCategoryRule *)v4 category];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)ruleWithPrefix:(id)a3 category:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(TPCategoryRule);
  [(TPCategoryRule *)v7 setPrefix:v6];

  [(TPCategoryRule *)v7 setCategory:v5];
  return v7;
}

@end