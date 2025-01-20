@interface SQLiteNullPredicate
+ (id)isNotNullPredicateWithProperty:(id)a3;
+ (id)isNullPredicateWithProperty:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesNull;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation SQLiteNullPredicate

+ (id)isNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 1;
  id v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

- (id)SQLForEntityClass:(Class)a3
{
  v4 = [(objc_class *)a3 disambiguatedSQLForProperty:self->super._property];
  if (self->_matchesNull) {
    CFStringRef v5 = @"IS NULL";
  }
  else {
    CFStringRef v5 = @"IS NOT NULL";
  }
  v6 = +[NSString stringWithFormat:@"(%@ %@)", v4, v5];

  return v6;
}

+ (id)isNotNullPredicateWithProperty:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v4[16] = 0;
  id v5 = [v3 copy];

  v6 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v5;

  return v4;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  id v3 = self);
  [v3 appendFormat:@"property: %@; ", self->super._property];
  if (self->_matchesNull) {
    CFStringRef v4 = @"Y";
  }
  else {
    CFStringRef v4 = @"N";
  }
  [v3 appendFormat:@"matchesNull: %@; ", v4];
  [v3 appendFormat:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CFStringRef v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SQLiteNullPredicate;
  if ([(SQLitePropertyPredicate *)&v7 isEqual:v4]) {
    BOOL v5 = self->_matchesNull == v4[16];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)matchesNull
{
  return self->_matchesNull;
}

@end