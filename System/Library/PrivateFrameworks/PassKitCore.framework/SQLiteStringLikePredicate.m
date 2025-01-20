@interface SQLiteStringLikePredicate
+ (id)predicateWithProperty:(id)a3 havingPrefix:(id)a4;
+ (id)predicateWithProperty:(id)a3 havingSuffix:(id)a4;
+ (id)predicateWithProperty:(id)a3 matchingPattern:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)pattern;
- (NSString)property;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SQLiteStringLikePredicate

+ (id)predicateWithProperty:(id)a3 havingPrefix:(id)a4
{
  id v6 = a3;
  v7 = [a4 stringByAppendingString:@"%"];
  v8 = [a1 predicateWithProperty:v6 matchingPattern:v7];

  return v8;
}

+ (id)predicateWithProperty:(id)a3 havingSuffix:(id)a4
{
  id v6 = a3;
  v7 = [@"%" stringByAppendingString:a4];
  v8 = [a1 predicateWithProperty:v6 matchingPattern:v7];

  return v8;
}

+ (id)predicateWithProperty:(id)a3 matchingPattern:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  id v8 = [v6 copy];

  v9 = (void *)v7[1];
  v7[1] = v8;

  id v10 = [v5 copy];
  v11 = (void *)v7[2];
  v7[2] = v10;

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  id v5 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", @"(");
  id v6 = [(SQLiteStringLikePredicate *)self property];
  v7 = [(objc_class *)a3 disambiguatedSQLForProperty:v6];
  [v5 appendString:v7];

  [v5 appendString:@" LIKE "];
  id v8 = [(SQLiteStringLikePredicate *)self pattern];
  [v5 appendFormat:@"'%@'", v8];

  [v5 appendString:@""]);
  return v5;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  [v3 appendFormat:@"property: %@; ", self->_property];
  [v3 appendFormat:@"pattern: %@; ", self->_pattern];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)SQLiteStringLikePredicate;
  v3 = [(SQLitePredicate *)&v6 hash];
  v4 = &v3[[(NSString *)self->_property hash]];
  return [(NSString *)self->_pattern hash] + (void)v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SQLiteStringLikePredicate;
  if ([(SQLitePredicate *)&v8 isEqual:v4])
  {
    pattern = self->_pattern;
    if (pattern == (NSString *)v4[2]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = -[NSString isEqual:](pattern, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSString)property
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)pattern
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

@end