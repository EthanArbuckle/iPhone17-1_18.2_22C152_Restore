@interface STUniquedManagedObjectDelta
- (NSMutableSet)updatedProperties;
- (NSString)uniqueIdentifier;
- (STUniquedManagedObjectDelta)initWithUniqueIdentifier:(id)a3;
- (int64_t)changeType;
- (void)deleted;
- (void)inserted;
- (void)removePropertyWithName:(id)a3;
- (void)setUpdatedProperties:(id)a3;
- (void)updatedWithProperties:(id)a3;
@end

@implementation STUniquedManagedObjectDelta

- (STUniquedManagedObjectDelta)initWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUniquedManagedObjectDelta;
  v5 = [(STUniquedManagedObjectDelta *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)inserted
{
  self->_changeType = 1;
  self->_updatedProperties = 0;
  MEMORY[0x1F41817F8]();
}

- (void)deleted
{
  self->_changeType = 3;
  self->_updatedProperties = 0;
  MEMORY[0x1F41817F8]();
}

- (void)updatedWithProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_changeType != 1)
  {
    self->_changeType = 2;
    updatedProperties = self->_updatedProperties;
    v11 = v5;
    if (updatedProperties)
    {
      v7 = [(NSMutableSet *)updatedProperties setByAddingObjectsFromSet:v5];
      v8 = (NSMutableSet *)[v7 mutableCopy];
      objc_super v9 = self->_updatedProperties;
      self->_updatedProperties = v8;
    }
    else
    {
      v10 = (NSMutableSet *)[v5 mutableCopy];
      v7 = self->_updatedProperties;
      self->_updatedProperties = v10;
    }

    v5 = v11;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removePropertyWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = self->_updatedProperties;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "name", (void)v13);
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          [(NSMutableSet *)self->_updatedProperties removeObject:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSMutableSet)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end