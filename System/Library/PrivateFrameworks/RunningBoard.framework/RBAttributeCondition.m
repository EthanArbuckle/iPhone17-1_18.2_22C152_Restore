@interface RBAttributeCondition
- (id)description;
@end

@implementation RBAttributeCondition

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(id)objc_opt_class() description];
  v5 = (void *)v4;
  if (self->_value) {
    v6 = @"Yes";
  }
  else {
    v6 = @"No";
  }
  v7 = (void *)[v3 initWithFormat:@"<%@| name:%@ value:%@>", v4, self->_name, v6];

  return v7;
}

- (void).cxx_destruct
{
}

@end