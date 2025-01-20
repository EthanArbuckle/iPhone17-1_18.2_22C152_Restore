@interface SQLiteBooleanPredicate
+ (id)falsePredicate;
+ (id)truePredicate;
- (BOOL)BOOLeanValue;
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)description;
@end

@implementation SQLiteBooleanPredicate

- (id)SQLForEntityClass:(Class)a3
{
  return +[NSString stringWithFormat:@"(%d)", self->_BOOLeanValue];
}

+ (id)truePredicate
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[8] = 1;
  return v2;
}

+ (id)falsePredicate
{
  v2 = objc_alloc_init((Class)objc_opt_class());
  v2[8] = 0;
  return v2;
}

- (id)description
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p; ",
    objc_opt_class(),
  v3 = self);
  v4 = v3;
  if (self->_BOOLeanValue) {
    CFStringRef v5 = @"Y";
  }
  else {
    CFStringRef v5 = @"N";
  }
  [v3 appendFormat:@"BOOLeanValue: %@; ", v5];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)SQLiteBooleanPredicate;
  if ([(SQLitePredicate *)&v7 isEqual:v4]) {
    BOOL v5 = self->_BOOLeanValue == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)BOOLeanValue
{
  return self->_BOOLeanValue;
}

@end