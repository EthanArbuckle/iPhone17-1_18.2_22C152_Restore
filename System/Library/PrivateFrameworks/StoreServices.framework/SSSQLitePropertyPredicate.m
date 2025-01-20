@interface SSSQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SSSQLitePropertyPredicate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSQLitePropertyPredicate;
  [(SSSQLitePropertyPredicate *)&v3 dealloc];
}

- (NSString)property
{
  return self->_property;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id result = (id)[(objc_class *)a3 joinClauseForProperty:self->_property];
  if (result)
  {
    id v4 = result;
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    return (id)[v5 setWithObject:v4];
  }
  return result;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SSSQLitePropertyPredicate;
  id v3 = [(SSSQLitePredicate *)&v5 hash];
  return (unint64_t)v3 + [(NSString *)[(SSSQLitePropertyPredicate *)self property] hash];
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSSQLitePropertyPredicate;
  unsigned int v5 = -[SSSQLitePredicate isEqual:](&v8, sel_isEqual_);
  if (v5)
  {
    v6 = [(SSSQLitePropertyPredicate *)self property];
    if (v6 == (NSString *)[a3 property]) {
      LOBYTE(v5) = 1;
    }
    else {
      LOBYTE(v5) = -[NSString isEqual:](-[SSSQLitePropertyPredicate property](self, "property"), "isEqual:", [a3 property]);
    }
  }
  return v5;
}

@end