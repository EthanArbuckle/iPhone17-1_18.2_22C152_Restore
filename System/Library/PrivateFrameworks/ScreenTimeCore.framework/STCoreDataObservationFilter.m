@interface STCoreDataObservationFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCoreDataObservationFilter:(id)a3;
- (NSPredicate)predicate;
- (STCoreDataObservationFilter)initWithPredicate:(id)a3 primaryType:(int64_t)a4 secondaryType:(int64_t)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)primaryType;
- (int64_t)secondaryType;
- (unint64_t)hash;
@end

@implementation STCoreDataObservationFilter

- (STCoreDataObservationFilter)initWithPredicate:(id)a3 primaryType:(int64_t)a4 secondaryType:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)STCoreDataObservationFilter;
  id v7 = a3;
  v8 = [(STCoreDataObservationFilter *)&v12 init];
  v9 = (NSPredicate *)objc_msgSend(v7, "copy", v12.receiver, v12.super_class);

  predicate = v8->_predicate;
  v8->_predicate = v9;

  v8->_primaryType = a4;
  v8->_secondaryType = a5;
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  predicate = self->_predicate;
  int64_t primaryType = self->_primaryType;
  int64_t secondaryType = self->_secondaryType;
  return [v4 initWithPredicate:predicate primaryType:primaryType secondaryType:secondaryType];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STCoreDataObservationFilter *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STCoreDataObservationFilter *)self isEqualToCoreDataObservationFilter:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToCoreDataObservationFilter:(id)a3
{
  id v4 = (STCoreDataObservationFilter *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    BOOL v5 = [(STCoreDataObservationFilter *)self predicate];
    v6 = [(STCoreDataObservationFilter *)v4 predicate];
    if ([v5 isEqual:v6]
      && (id v7 = [(STCoreDataObservationFilter *)self primaryType],
          v7 == (void *)[(STCoreDataObservationFilter *)v4 primaryType]))
    {
      id v8 = [(STCoreDataObservationFilter *)self secondaryType];
      BOOL v9 = v8 == (id)[(STCoreDataObservationFilter *)v4 secondaryType];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v3 = [(STCoreDataObservationFilter *)self predicate];
  id v4 = (char *)[v3 hash];
  int64_t v5 = [(STCoreDataObservationFilter *)self primaryType];
  v6 = &v4[[(STCoreDataObservationFilter *)self secondaryType] + v5];

  return (unint64_t)v6;
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)primaryType
{
  return self->_primaryType;
}

- (int64_t)secondaryType
{
  return self->_secondaryType;
}

- (void).cxx_destruct
{
}

@end