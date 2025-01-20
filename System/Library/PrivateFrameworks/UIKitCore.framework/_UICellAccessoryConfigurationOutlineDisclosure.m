@interface _UICellAccessoryConfigurationOutlineDisclosure
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)cellSelectionTogglesExpansionState;
- (BOOL)isEqual:(id)a3;
- (UIColor)selectedTintColor;
- (UIImage)_customImage;
- (UIImage)image;
- (_UICellAccessoryConfigurationOutlineDisclosure)init;
- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCellSelectionTogglesExpansionState:(BOOL)a3;
- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCoder:(id)a3;
- (_UICellAccessoryConfigurationOutlineDisclosure)initWithImage:(id)a3;
- (double)rotationAngle;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSelectedTintColor:(id)a3;
@end

@implementation _UICellAccessoryConfigurationOutlineDisclosure

+ (id)new
{
  id v2 = objc_alloc((Class)objc_opt_class());
  return (id)[v2 initWithCellSelectionTogglesExpansionState:1];
}

- (_UICellAccessoryConfigurationOutlineDisclosure)init
{
  return [(_UICellAccessoryConfigurationOutlineDisclosure *)self initWithCellSelectionTogglesExpansionState:1];
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithImage:(id)a3
{
  id v5 = a3;
  v6 = [(_UICellAccessoryConfigurationOutlineDisclosure *)self initWithCellSelectionTogglesExpansionState:1];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__customImage, a3);
  }

  return v7;
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCellSelectionTogglesExpansionState:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  v4 = [(_UICellAccessoryConfiguration *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    [(_UICellAccessoryConfiguration *)v4 setUsesDefaultLayoutWidth:0];
    v5->_cellSelectionTogglesExpansionState = a3;
    v5->_rotationAngle = 1.57079633;
  }
  return v5;
}

- (int64_t)_systemType
{
  return 6;
}

- (id)_identifier
{
  return @"OutlineDisclosure";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationOutlineDisclosure)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  id v5 = [(_UICellAccessoryConfiguration *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customImage"];
    customImage = v5->__customImage;
    v5->__customImage = (UIImage *)v6;

    v5->_cellSelectionTogglesExpansionState = [v4 decodeBoolForKey:@"cellSelectionTogglesExpansionState"];
    [v4 decodeDoubleForKey:@"rotationAngle"];
    v5->_rotationAngle = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedTintColor"];
    selectedTintColor = v5->_selectedTintColor;
    v5->_selectedTintColor = (UIColor *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  id v4 = a3;
  [(_UICellAccessoryConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->__customImage, @"customImage", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_cellSelectionTogglesExpansionState forKey:@"cellSelectionTogglesExpansionState"];
  [v4 encodeDouble:@"rotationAngle" forKey:self->_rotationAngle];
  [v4 encodeObject:self->_selectedTintColor forKey:@"selectedTintColor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  id v4 = [(_UICellAccessoryConfiguration *)&v7 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 32) = self->_cellSelectionTogglesExpansionState;
    objc_storeStrong(v4 + 7, self->__customImage);
    v5[5] = *(id *)&self->_rotationAngle;
    objc_storeStrong(v5 + 6, self->_selectedTintColor);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UICellAccessoryConfigurationOutlineDisclosure;
  if ([(_UICellAccessoryConfiguration *)&v15 isEqual:v4])
  {
    objc_super v5 = (double *)v4;
    uint64_t v6 = v5;
    if (self->_cellSelectionTogglesExpansionState == *((unsigned __int8 *)v5 + 32))
    {
      objc_super v7 = (void *)*((void *)v5 + 7);
      double v8 = self->__customImage;
      uint64_t v9 = v7;
      if (v8 == v9)
      {
      }
      else
      {
        v10 = v9;
        if (v8) {
          BOOL v11 = v9 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (v11)
        {

          goto LABEL_14;
        }
        BOOL v13 = [(UIImage *)v8 isEqual:v9];

        if (!v13) {
          goto LABEL_14;
        }
      }
      if (self->_rotationAngle == v6[5])
      {
        BOOL v12 = self->_selectedTintColor == (UIColor *)*((void *)v6 + 6);
        goto LABEL_15;
      }
    }
LABEL_14:
    BOOL v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  customImage = self->__customImage;
  if (customImage)
  {
    v3 = customImage;
  }
  else
  {
    v3 = +[UIImage systemImageNamed:@"chevron.forward"];
  }
  return v3;
}

- (BOOL)cellSelectionTogglesExpansionState
{
  return self->_cellSelectionTogglesExpansionState;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
}

- (UIImage)_customImage
{
  return self->__customImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customImage, 0);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
}

@end