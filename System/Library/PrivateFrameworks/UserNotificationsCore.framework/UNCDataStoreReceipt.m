@interface UNCDataStoreReceipt
+ (id)receiptWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6;
- (BOOL)hasChanges;
- (NSArray)addedObjects;
- (NSArray)removedObjects;
- (NSArray)replacedObjects;
- (NSArray)replacementObjects;
- (UNCDataStoreReceipt)initWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6;
@end

@implementation UNCDataStoreReceipt

+ (id)receiptWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAddedObjects:v12 replacedObjects:v11 replacementObjects:v10 removedObjects:v9];

  return v13;
}

- (UNCDataStoreReceipt)initWithAddedObjects:(id)a3 replacedObjects:(id)a4 replacementObjects:(id)a5 removedObjects:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UNCDataStoreReceipt;
  v14 = [(UNCDataStoreReceipt *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    addedObjects = v14->_addedObjects;
    v14->_addedObjects = (NSArray *)v15;

    uint64_t v17 = [v11 copy];
    replacedObjects = v14->_replacedObjects;
    v14->_replacedObjects = (NSArray *)v17;

    uint64_t v19 = [v12 copy];
    replacementObjects = v14->_replacementObjects;
    v14->_replacementObjects = (NSArray *)v19;

    uint64_t v21 = [v13 copy];
    removedObjects = v14->_removedObjects;
    v14->_removedObjects = (NSArray *)v21;
  }
  return v14;
}

- (BOOL)hasChanges
{
  return [(NSArray *)self->_addedObjects count]
      || [(NSArray *)self->_replacedObjects count]
      || [(NSArray *)self->_removedObjects count] != 0;
}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (NSArray)replacedObjects
{
  return self->_replacedObjects;
}

- (NSArray)replacementObjects
{
  return self->_replacementObjects;
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_replacementObjects, 0);
  objc_storeStrong((id *)&self->_replacedObjects, 0);

  objc_storeStrong((id *)&self->_addedObjects, 0);
}

@end