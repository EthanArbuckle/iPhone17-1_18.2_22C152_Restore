@interface SQLitePropertyPredicate
- (BOOL)isEqual:(id)a3;
- (NSString)property;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation SQLitePropertyPredicate

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  [(objc_class *)a3 addJoinClausesForProperty:self->_property toJoins:v5];
  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SQLitePropertyPredicate;
  id v3 = [(SQLitePredicate *)&v5 hash];
  return (unint64_t)v3 + [(NSString *)self->_property hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SQLitePropertyPredicate;
  if ([(SQLitePredicate *)&v8 isEqual:v4])
  {
    property = self->_property;
    if (property == (NSString *)v4[1]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = -[NSString isEqual:](property, "isEqual:");
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
  return self->_property;
}

@end