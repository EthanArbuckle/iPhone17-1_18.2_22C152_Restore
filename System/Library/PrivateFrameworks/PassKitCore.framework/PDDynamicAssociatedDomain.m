@interface PDDynamicAssociatedDomain
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDomain:(id)a3;
- (NSArray)patterns;
- (NSString)host;
- (PDDynamicAssociatedDomain)initWithHost:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)setHost:(id)a3;
- (void)setPatterns:(id)a3;
@end

@implementation PDDynamicAssociatedDomain

- (PDDynamicAssociatedDomain)initWithHost:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDDynamicAssociatedDomain;
  v6 = [(PDDynamicAssociatedDomain *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_host, a3);
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = +[NSMutableString stringWithFormat:@"<%@: ", v4];

  [v5 appendFormat:@"host: '%@'; ", self->_host];
  [v5 appendFormat:@"patterns: '%@'; ", self->_patterns];
  [v5 appendFormat:@">"];
  v6 = +[NSString stringWithString:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDDynamicAssociatedDomain *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PDDynamicAssociatedDomain *)self isEqualToDomain:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToDomain:(id)a3
{
  id v3 = a3;
  if (v3 && PKEqualObjects()) {
    char v4 = PKEqualObjects();
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 addObject:self->_host];
  [v3 safelyAddObject:self->_patterns];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSArray)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end