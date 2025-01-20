@interface UPDialogActPrompt
- (NSString)description;
- (NSString)entityName;
- (NSString)entityType;
- (NSString)intent;
- (UPDialogActPrompt)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 reference:(id)a6;
- (USOSerializedGraph)reference;
@end

@implementation UPDialogActPrompt

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (USOSerializedGraph)reference
{
  return (USOSerializedGraph *)objc_getProperty(self, a2, 32, 1);
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
  v2 = NSString;
  long long v7 = *(_OWORD *)&self->_intent;
  entityName = self->_entityName;
  v4 = [(USOSerializedGraph *)self->_reference printedForm];
  v5 = [v2 stringWithFormat:@"UPDialogActPrompt[intent: %@, entityType: %@, entityName: %@, reference: %@]", v7, entityName, v4];

  return (NSString *)v5;
}

- (UPDialogActPrompt)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 reference:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UPDialogActPrompt;
  v14 = [(UPDialogActPrompt *)&v22 init];
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

    objc_storeStrong((id *)&v14->_reference, a6);
  }

  return v14;
}

@end