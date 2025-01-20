@interface PPSSQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (unint64_t)hash;
@end

@implementation PPSSQLitePropertyPredicate

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)PPSSQLitePropertyPredicate;
  id v3 = [(PPSSQLitePredicate *)&v7 hash];
  v4 = [(PPSSQLitePropertyPredicate *)self property];
  unint64_t v5 = (unint64_t)v3 + [v4 hash];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSSQLitePropertyPredicate;
  if ([(PPSSQLitePredicate *)&v11 isEqual:v4])
  {
    unint64_t v5 = [(PPSSQLitePropertyPredicate *)self property];
    v6 = [v4 property];
    if (v5 == v6)
    {
      char v9 = 1;
    }
    else
    {
      objc_super v7 = [(PPSSQLitePropertyPredicate *)self property];
      v8 = [v4 property];
      char v9 = [v7 isEqual:v8];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)property
{
  return self->_property;
}

- (void).cxx_destruct
{
}

@end