@interface _UICellAccessoryConfigurationMultiselect
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UIColor)selectedTintColor;
- (_UICellAccessoryConfigurationMultiselect)initWithCoder:(id)a3;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedTintColor:(id)a3;
@end

@implementation _UICellAccessoryConfigurationMultiselect

- (int64_t)_systemType
{
  return 5;
}

- (id)_identifier
{
  return @"Multiselect";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationMultiselect)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  v5 = [(_UICellAccessoryConfiguration *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedTintColor"];
    selectedTintColor = v5->_selectedTintColor;
    v5->_selectedTintColor = (UIColor *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  id v4 = a3;
  [(_UICellAccessoryConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedTintColor, @"selectedTintColor", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  id v4 = [(_UICellAccessoryConfiguration *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4) {
    objc_storeStrong(v4 + 4, self->_selectedTintColor);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICellAccessoryConfigurationMultiselect;
  if ([(_UICellAccessoryConfiguration *)&v13 isEqual:v4])
  {
    objc_super v5 = v4;
    uint64_t v6 = (void *)v5[4];
    objc_super v7 = self->_selectedTintColor;
    v8 = v6;
    objc_super v9 = v8;
    if (v7 == v8)
    {
      char v11 = 1;
    }
    else
    {
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        char v11 = 0;
      }
      else {
        char v11 = [(UIColor *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end