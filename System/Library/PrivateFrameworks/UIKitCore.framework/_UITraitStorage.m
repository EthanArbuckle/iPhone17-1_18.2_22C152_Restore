@interface _UITraitStorage
- (NSString)keyPath;
- (_UITraitStorage)initWithCoder:(id)a3;
- (_UITraitStorage)initWithObject:(id)a3 keyPath:(id)a4;
- (id)_propertyDescriptionString;
- (id)description;
- (id)object;
- (id)records;
- (void)addRecord:(id)a3;
- (void)applyRecordsMatchingTraitCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UITraitStorage

- (_UITraitStorage)initWithObject:(id)a3 keyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITraitStorage;
  v8 = [(_UITraitStorage *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_object, v6);
    uint64_t v10 = [v7 copy];
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    records = v9->_records;
    v9->_records = v12;
  }
  return v9;
}

- (_UITraitStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITraitStorage;
  v5 = [(_UITraitStorage *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectForKey:@"UIObject"];
    objc_storeWeak(&v5->_object, v6);

    uint64_t v7 = [v4 decodeObjectForKey:@"UIKeyPath"];
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectForKey:@"UIRecords"];
    records = v5->_records;
    v5->_records = (NSMutableArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_object = &self->_object;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(p_object);
  [v6 encodeConditionalObject:WeakRetained forKey:@"UIObject"];

  [v6 encodeObject:self->_keyPath forKey:@"UIKeyPath"];
  [v6 encodeObject:self->_records forKey:@"UIRecords"];
}

- (id)records
{
  return self->_records;
}

- (void)addRecord:(id)a3
{
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"_UITraitStorage.m" lineNumber:287 description:@"Abstract"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(_UITraitStorage *)self _propertyDescriptionString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p; %@>", v5, self, v6];

  return v7;
}

- (id)_propertyDescriptionString
{
  v3 = NSString;
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  id v5 = [v3 stringWithFormat:@"object=%@, keyPath=%@, records=%@", WeakRetained, self->_keyPath, self->_records];

  return v5;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)object
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

@end