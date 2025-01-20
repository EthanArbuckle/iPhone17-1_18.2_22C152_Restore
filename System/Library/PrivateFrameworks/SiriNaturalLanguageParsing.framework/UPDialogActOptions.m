@interface UPDialogActOptions
- (NSArray)entityValues;
- (NSString)description;
- (NSString)entityName;
- (NSString)entityType;
- (NSString)intent;
- (UPDialogActOptions)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 entityValues:(id)a6;
@end

@implementation UPDialogActOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValues, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (NSArray)entityValues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)entityName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)entityType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"UPDialogActOptions[intent: %@, entityType: %@, entityName: %@, entityValues: %@]", self->_intent, self->_entityType, self->_entityName, self->_entityValues];
}

- (UPDialogActOptions)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 entityValues:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UPDialogActOptions;
  v14 = [(UPDialogActOptions *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    intent = v14->_intent;
    v14->_intent = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    entityType = v14->_entityType;
    v14->_entityType = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    entityName = v14->_entityName;
    v14->_entityName = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    entityValues = v14->_entityValues;
    v14->_entityValues = (NSArray *)v21;
  }
  return v14;
}

@end