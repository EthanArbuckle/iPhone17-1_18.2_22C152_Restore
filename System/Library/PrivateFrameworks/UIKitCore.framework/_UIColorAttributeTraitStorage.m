@interface _UIColorAttributeTraitStorage
- (_UIColorAttributeTraitStorage)initWithCoder:(id)a3;
- (_UIColorAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 color:(id)a5;
- (id)_propertyDescriptionString;
- (void)applyRecordsMatchingTraitCollection:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIColorAttributeTraitStorage

- (_UIColorAttributeTraitStorage)initWithObject:(id)a3 keyPath:(id)a4 color:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIColorAttributeTraitStorage;
  v10 = [(_UITraitStorage *)&v13 initWithObject:a3 keyPath:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_namedColor, a5);
  }

  return v11;
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  id v4 = a3;
  id v7 = [(_UITraitStorage *)self object];
  v5 = [(_UICoreUICatalogColorWrapper *)self->_namedColor _uikit_valueForTraitCollection:v4];

  v6 = [(_UITraitStorage *)self keyPath];
  objc_msgSend(v7, "_uikit_applyValueFromTraitStorage:forKeyPath:", v5, v6);
}

- (_UIColorAttributeTraitStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIColorAttributeTraitStorage;
  v5 = [(_UITraitStorage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UINamedColor"];
    namedColor = v5->_namedColor;
    v5->_namedColor = (_UICoreUICatalogColorWrapper *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIColorAttributeTraitStorage;
  id v4 = a3;
  [(_UITraitStorage *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_namedColor, @"UINamedColor", v5.receiver, v5.super_class);
}

- (id)_propertyDescriptionString
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_UIColorAttributeTraitStorage;
  id v4 = [(_UITraitStorage *)&v7 _propertyDescriptionString];
  objc_super v5 = [v3 stringWithFormat:@"%@, namedColor=%@", v4, self->_namedColor];

  return v5;
}

- (void).cxx_destruct
{
}

@end