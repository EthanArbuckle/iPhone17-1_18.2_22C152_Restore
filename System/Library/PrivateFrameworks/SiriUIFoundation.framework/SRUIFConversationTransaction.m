@interface SRUIFConversationTransaction
- (NSArray)insertedItemIndexPaths;
- (NSArray)presentationStateChangedItemIndexPaths;
- (NSArray)updatedItemIndexPaths;
- (SRUIFConversationTransaction)initWithUpdatedItemIndexPaths:(id)a3 insertedItemIndexPaths:(id)a4 presentationStateChangedItemIndexPaths:(id)a5;
@end

@implementation SRUIFConversationTransaction

- (SRUIFConversationTransaction)initWithUpdatedItemIndexPaths:(id)a3 insertedItemIndexPaths:(id)a4 presentationStateChangedItemIndexPaths:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SRUIFConversationTransaction;
  v12 = [(SRUIFConversationTransaction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_updatedItemIndexPaths, a3);
    objc_storeStrong((id *)&v13->_insertedItemIndexPaths, a4);
    objc_storeStrong((id *)&v13->_presentationStateChangedItemIndexPaths, a5);
  }

  return v13;
}

- (NSArray)updatedItemIndexPaths
{
  return self->_updatedItemIndexPaths;
}

- (NSArray)insertedItemIndexPaths
{
  return self->_insertedItemIndexPaths;
}

- (NSArray)presentationStateChangedItemIndexPaths
{
  return self->_presentationStateChangedItemIndexPaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationStateChangedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_insertedItemIndexPaths, 0);
  objc_storeStrong((id *)&self->_updatedItemIndexPaths, 0);
}

@end