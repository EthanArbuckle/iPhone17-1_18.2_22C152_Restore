@interface _UIModifierKeyCursorAccessory
- (_UIModifierKeyCursorAccessory)initWithCoder:(id)a3;
- (id)descriptionBuilder;
- (id)identifier;
- (int64_t)modifierType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setModifierType:(int64_t)a3;
@end

@implementation _UIModifierKeyCursorAccessory

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIModifierKeyCursorAccessory;
  id v4 = a3;
  [(_UICursorAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_modifierType, @"modifierType", v5.receiver, v5.super_class);
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)_UIModifierKeyCursorAccessory;
  return self->_modifierType ^ [(_UICursorAccessory *)&v3 hash];
}

- (_UIModifierKeyCursorAccessory)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIModifierKeyCursorAccessory;
  objc_super v5 = [(_UICursorAccessory *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_modifierType = [v4 decodeIntegerForKey:@"modifierType"];
  }

  return v5;
}

- (id)descriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)_UIModifierKeyCursorAccessory;
  objc_super v3 = [(_UICursorAccessory *)&v6 descriptionBuilder];
  id v4 = (id)[v3 appendInt:LODWORD(self->_modifierType) withName:@"modifierType"];
  return v3;
}

- (id)identifier
{
  v5.receiver = self;
  v5.super_class = (Class)_UIModifierKeyCursorAccessory;
  objc_super v3 = [(_UICursorAccessory *)&v5 identifier];
  if (!v3)
  {
    objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"mod:%ld", self->_modifierType);
    [(_UICursorAccessory *)self setIdentifier:v3];
  }
  return v3;
}

- (int64_t)modifierType
{
  return self->_modifierType;
}

- (void)setModifierType:(int64_t)a3
{
  self->_modifierType = a3;
}

@end