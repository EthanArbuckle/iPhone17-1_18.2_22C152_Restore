@interface BCRemoteManagedObjectIDChanges
- (BCRemoteManagedObjectIDChanges)initWithAdded:(id)a3 updated:(id)a4 deleted:(id)a5 context:(id)a6;
- (NSArray)addedObjects;
- (NSArray)deletedObjects;
- (NSArray)updatedObjects;
- (NSManagedObjectContext)context;
- (id)description;
@end

@implementation BCRemoteManagedObjectIDChanges

- (BCRemoteManagedObjectIDChanges)initWithAdded:(id)a3 updated:(id)a4 deleted:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)BCRemoteManagedObjectIDChanges;
  v14 = [(BCRemoteManagedObjectIDChanges *)&v22 init];
  if (v14)
  {
    v15 = (NSArray *)[v10 copy];
    addedObjects = v14->_addedObjects;
    v14->_addedObjects = v15;

    v17 = (NSArray *)[v11 copy];
    updatedObjects = v14->_updatedObjects;
    v14->_updatedObjects = v17;

    v19 = (NSArray *)[v12 copy];
    deletedObjects = v14->_deletedObjects;
    v14->_deletedObjects = v19;

    objc_storeStrong((id *)&v14->_context, a6);
  }

  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(BCRemoteManagedObjectIDChanges *)self addedObjects];
  v6 = [v5 bu_prettyDescription];
  v7 = [(BCRemoteManagedObjectIDChanges *)self updatedObjects];
  v8 = [v7 bu_prettyDescription];
  v9 = [(BCRemoteManagedObjectIDChanges *)self deletedObjects];
  id v10 = [v9 bu_prettyDescription];
  id v11 = +[NSString stringWithFormat:@"<%@:%p added:%@ updated:%@ deleted:%@>", v4, self, v6, v8, v10];

  return v11;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (NSArray)updatedObjects
{
  return self->_updatedObjects;
}

- (NSArray)deletedObjects
{
  return self->_deletedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedObjects, 0);
  objc_storeStrong((id *)&self->_updatedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end