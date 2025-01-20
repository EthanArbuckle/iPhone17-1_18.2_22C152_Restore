@interface _UIAttributeTraitStorageRecord
- (UITraitCollection)traitCollection;
- (_UIAttributeTraitStorageRecord)initWithCoder:(id)a3;
- (_UIAttributeTraitStorageRecord)initWithTraitCollection:(id)a3 value:(id)a4;
- (id)description;
- (id)value;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIAttributeTraitStorageRecord

- (_UIAttributeTraitStorageRecord)initWithTraitCollection:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIAttributeTraitStorageRecord;
  v9 = [(_UIAttributeTraitStorageRecord *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_traitCollection, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (_UIAttributeTraitStorageRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIAttributeTraitStorageRecord;
  v5 = [(_UIAttributeTraitStorageRecord *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UITraitCollection"];
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"UIValue"];
    id value = v5->_value;
    v5->_id value = (id)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  traitCollection = self->_traitCollection;
  id v5 = a3;
  [v5 encodeObject:traitCollection forKey:@"UITraitCollection"];
  [v5 encodeObject:self->_value forKey:@"UIValue"];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; traitCollection=%@, value=%@>",
    v5,
    self,
    self->_traitCollection,
  uint64_t v6 = self->_value);

  return v6;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end