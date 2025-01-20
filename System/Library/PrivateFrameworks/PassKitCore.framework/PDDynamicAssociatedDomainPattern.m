@interface PDDynamicAssociatedDomainPattern
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPattern:(id)a3;
- (NSString)uri;
- (id)description;
- (unint64_t)hash;
- (void)setUri:(id)a3;
@end

@implementation PDDynamicAssociatedDomainPattern

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:@"<%@: ", v4];

  [v5 appendFormat:@"uri: '%@'; ", self->_uri];
  [v5 appendFormat:@">"];
  v6 = +[NSString stringWithString:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDDynamicAssociatedDomainPattern *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(PDDynamicAssociatedDomainPattern *)self isEqualToPattern:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToPattern:(id)a3
{
  if (a3) {
    return PKEqualObjects();
  }
  else {
    return 0;
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  [v3 safelyAddObject:self->_uri];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (NSString)uri
{
  return self->_uri;
}

- (void)setUri:(id)a3
{
}

- (void).cxx_destruct
{
}

@end