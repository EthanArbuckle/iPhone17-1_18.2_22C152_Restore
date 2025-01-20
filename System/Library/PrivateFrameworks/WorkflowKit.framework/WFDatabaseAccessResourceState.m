@interface WFDatabaseAccessResourceState
- (NSData)perWorkflowStateData;
- (NSString)persistentIdentifier;
- (WFDatabaseAccessResourceState)initWithPersistentIdentifier:(id)a3 perWorkflowStateData:(id)a4;
@end

@implementation WFDatabaseAccessResourceState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (NSData)perWorkflowStateData
{
  return self->_perWorkflowStateData;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (WFDatabaseAccessResourceState)initWithPersistentIdentifier:(id)a3 perWorkflowStateData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseAccessResourceState;
  v8 = [(WFDatabaseAccessResourceState *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    persistentIdentifier = v8->_persistentIdentifier;
    v8->_persistentIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    perWorkflowStateData = v8->_perWorkflowStateData;
    v8->_perWorkflowStateData = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

@end