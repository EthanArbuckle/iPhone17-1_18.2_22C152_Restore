@interface _UIRelationshipTraitStorageRecord
- (NSSet)addedObjects;
- (NSSet)removedObjects;
- (UITraitCollection)traitCollection;
- (_UIRelationshipTraitStorageRecord)initWithCoder:(id)a3;
- (_UIRelationshipTraitStorageRecord)initWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIRelationshipTraitStorageRecord

- (_UIRelationshipTraitStorageRecord)initWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIRelationshipTraitStorageRecord;
  v12 = [(_UIRelationshipTraitStorageRecord *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_traitCollection, a3);
    uint64_t v14 = [v10 copy];
    addedObjects = v13->_addedObjects;
    v13->_addedObjects = (NSSet *)v14;

    uint64_t v16 = [v11 copy];
    removedObjects = v13->_removedObjects;
    v13->_removedObjects = (NSSet *)v16;
  }
  return v13;
}

- (_UIRelationshipTraitStorageRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIRelationshipTraitStorageRecord;
  v5 = [(_UIRelationshipTraitStorageRecord *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UITraitCollection"];
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIAddedObjects"];
    addedObjects = v5->_addedObjects;
    v5->_addedObjects = (NSSet *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"UIRemovedObjects"];
    removedObjects = v5->_removedObjects;
    v5->_removedObjects = (NSSet *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  traitCollection = self->_traitCollection;
  id v5 = a3;
  [v5 encodeObject:traitCollection forKey:@"UITraitCollection"];
  [v5 encodeObject:self->_addedObjects forKey:@"UIAddedObjects"];
  [v5 encodeObject:self->_removedObjects forKey:@"UIRemovedObjects"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; traitCollection=%@, addedObjects=%@, removedObjects=%@>",
    v5,
    self,
    self->_traitCollection,
    self->_addedObjects,
  uint64_t v6 = self->_removedObjects);

  return v6;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSSet)addedObjects
{
  return self->_addedObjects;
}

- (NSSet)removedObjects
{
  return self->_removedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end