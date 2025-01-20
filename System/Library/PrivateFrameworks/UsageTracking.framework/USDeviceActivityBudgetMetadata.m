@interface USDeviceActivityBudgetMetadata
- (BOOL)intervalDidStart;
- (NSManagedObjectID)budgetID;
- (NSString)activity;
- (NSString)clientIdentifier;
- (NSString)extensionIdentifier;
- (USDeviceActivityBudgetMetadata)initWithActivity:(id)a3 budgetID:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6 intervalDidStart:(BOOL)a7;
@end

@implementation USDeviceActivityBudgetMetadata

- (USDeviceActivityBudgetMetadata)initWithActivity:(id)a3 budgetID:(id)a4 clientIdentifier:(id)a5 extensionIdentifier:(id)a6 intervalDidStart:(BOOL)a7
{
  v25.receiver = self;
  v25.super_class = (Class)USDeviceActivityBudgetMetadata;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(USDeviceActivityBudgetMetadata *)&v25 init];
  v16 = (NSString *)objc_msgSend(v14, "copy", v25.receiver, v25.super_class);

  activity = v15->_activity;
  v15->_activity = v16;

  v18 = (NSManagedObjectID *)[v13 copy];
  budgetID = v15->_budgetID;
  v15->_budgetID = v18;

  v20 = (NSString *)[v12 copy];
  clientIdentifier = v15->_clientIdentifier;
  v15->_clientIdentifier = v20;

  v22 = (NSString *)[v11 copy];
  extensionIdentifier = v15->_extensionIdentifier;
  v15->_extensionIdentifier = v22;

  v15->_intervalDidStart = a7;
  return v15;
}

- (NSString)activity
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSManagedObjectID)budgetID
{
  return (NSManagedObjectID *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)extensionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)intervalDidStart
{
  return self->_intervalDidStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_budgetID, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end