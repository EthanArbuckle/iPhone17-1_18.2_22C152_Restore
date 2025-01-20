@interface WCAFetchKeyValuesRequest
+ (BOOL)supportsSecureCoding;
- (NSArray)keys;
- (WCAFetchKeyValuesRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation WCAFetchKeyValuesRequest

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WCAFetchKeyValuesRequest;
  id v4 = a3;
  [(WCAFetchRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_keys, @"_keys", v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

- (void)setKeys:(id)a3
{
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ : %p ", v5, self];

  [v6 appendFormat:@"keys: %@", self->_keys];
  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WCAFetchKeyValuesRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WCAFetchKeyValuesRequest;
  objc_super v5 = [(WCAFetchRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_keys"];
    keys = v5->_keys;
    v5->_keys = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)keys
{
  return self->_keys;
}

@end