@interface UPIntentWithSingleEntity
- (BOOL)isEqualToIntentWithSingleEntity:(id)a3;
- (NSString)intent;
- (UPEntityWithValue)entity;
- (UPIntentWithSingleEntity)initWithIntent:(id)a3 singleEntity:(id)a4;
@end

@implementation UPIntentWithSingleEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (UPEntityWithValue)entity
{
  return (UPEntityWithValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqualToIntentWithSingleEntity:(id)a3
{
  id v4 = a3;
  intent = self->_intent;
  v6 = [v4 intent];
  if ([(NSString *)intent isEqualToString:v6])
  {
    entity = self->_entity;
    v8 = [v4 entity];
    BOOL v9 = [(UPEntityWithValue *)entity isEqualToEntityWithValue:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (UPIntentWithSingleEntity)initWithIntent:(id)a3 singleEntity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UPIntentWithSingleEntity;
  BOOL v9 = [(UPIntentWithSingleEntity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_intent, a3);
    objc_storeStrong((id *)&v10->_entity, a4);
  }

  return v10;
}

@end