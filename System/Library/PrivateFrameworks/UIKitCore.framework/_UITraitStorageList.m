@interface _UITraitStorageList
- (NSArray)traitStorages;
- (NSSet)descendants;
- (_UITraitStorageList)initWithCoder:(id)a3;
- (_UITraitStorageList)initWithTopLevelObject:(id)a3 traitStorages:(id)a4 descendants:(id)a5;
- (id)description;
- (id)topLevelObject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UITraitStorageList

- (_UITraitStorageList)initWithTopLevelObject:(id)a3 traitStorages:(id)a4 descendants:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v11 containsObject:v9])
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"_UITraitStorage.m" lineNumber:205 description:@"retained descendants should not include the top level object."];
  }
  v20.receiver = self;
  v20.super_class = (Class)_UITraitStorageList;
  v12 = [(_UITraitStorageList *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak(&v12->_topLevelObject, v9);
    uint64_t v14 = [v10 copy];
    traitStorages = v13->_traitStorages;
    v13->_traitStorages = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    descendants = v13->_descendants;
    v13->_descendants = (NSSet *)v16;
  }
  return v13;
}

- (_UITraitStorageList)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITraitStorageList;
  v5 = [(_UITraitStorageList *)&v12 init];
  if (v5)
  {
    v6 = [v4 decodeObjectForKey:@"UITopLevelObject"];
    objc_storeWeak(&v5->_topLevelObject, v6);

    uint64_t v7 = [v4 decodeObjectForKey:@"UITraitStorages"];
    traitStorages = v5->_traitStorages;
    v5->_traitStorages = (NSArray *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"UIDescendants"];
    descendants = v5->_descendants;
    v5->_descendants = (NSSet *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_topLevelObject = &self->_topLevelObject;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(p_topLevelObject);
  [v6 encodeConditionalObject:WeakRetained forKey:@"UITopLevelObject"];

  [v6 encodeObject:self->_traitStorages forKey:@"UITraitStorages"];
  [v6 encodeObject:self->_descendants forKey:@"UIDescendants"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id WeakRetained = objc_loadWeakRetained(&self->_topLevelObject);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; topLevelObject=%@, traitStorages=%@, descendants=%@>",
    v5,
    self,
    WeakRetained,
    self->_traitStorages,
  uint64_t v7 = self->_descendants);

  return v7;
}

- (id)topLevelObject
{
  id WeakRetained = objc_loadWeakRetained(&self->_topLevelObject);
  return WeakRetained;
}

- (NSArray)traitStorages
{
  return self->_traitStorages;
}

- (NSSet)descendants
{
  return self->_descendants;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descendants, 0);
  objc_storeStrong((id *)&self->_traitStorages, 0);
  objc_destroyWeak(&self->_topLevelObject);
}

@end