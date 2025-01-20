@interface UPEntityWithValue
- (BOOL)isEqualToEntityWithValue:(id)a3;
- (NSString)entityName;
- (NSString)entityType;
- (NSString)entityValue;
- (UPEntityWithValue)initWithType:(id)a3 entityName:(id)a4 entityValue:(id)a5;
- (id)description;
@end

@implementation UPEntityWithValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValue, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

- (NSString)entityValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)entityName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)entityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"UPEntityWithValue[entityType: %@, entityName: %@, entityValue:%@]", self->_entityType, self->_entityName, self->_entityValue];
}

- (BOOL)isEqualToEntityWithValue:(id)a3
{
  id v4 = a3;
  entityType = self->_entityType;
  v6 = [v4 entityType];
  if ([(NSString *)entityType isEqualToString:v6])
  {
    entityName = self->_entityName;
    v8 = [v4 entityName];
    if ([(NSString *)entityName isEqualToString:v8])
    {
      entityValue = self->_entityValue;
      v10 = [v4 entityValue];
      BOOL v11 = [(NSString *)entityValue isEqualToString:v10];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (UPEntityWithValue)initWithType:(id)a3 entityName:(id)a4 entityValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UPEntityWithValue;
  BOOL v11 = [(UPEntityWithValue *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    entityType = v11->_entityType;
    v11->_entityType = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    entityName = v11->_entityName;
    v11->_entityName = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    entityValue = v11->_entityValue;
    v11->_entityValue = (NSString *)v16;
  }
  return v11;
}

@end