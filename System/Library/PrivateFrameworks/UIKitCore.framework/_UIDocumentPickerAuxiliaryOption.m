@interface _UIDocumentPickerAuxiliaryOption
+ (BOOL)supportsSecureCoding;
- (BOOL)isNewlyAdded;
- (NSString)identifier;
- (NSString)title;
- (UIImage)image;
- (_UIDocumentPickerAuxiliaryOption)init;
- (_UIDocumentPickerAuxiliaryOption)initWithCoder:(id)a3;
- (id)handler;
- (unint64_t)order;
- (void)encodeWithCoder:(id)a3;
- (void)setHandler:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setNewlyAdded:(BOOL)a3;
- (void)setOrder:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation _UIDocumentPickerAuxiliaryOption

- (_UIDocumentPickerAuxiliaryOption)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerAuxiliaryOption;
  v2 = [(_UIDocumentPickerAuxiliaryOption *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    v4 = [v3 UUIDString];
    [(_UIDocumentPickerAuxiliaryOption *)v2 setIdentifier:v4];
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIDocumentPickerAuxiliaryOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerAuxiliaryOption;
  v5 = [(_UIDocumentPickerAuxiliaryOption *)&v11 init];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIImageKey"];
    [(_UIDocumentPickerAuxiliaryOption *)v5 setImage:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UITitleKey"];
    [(_UIDocumentPickerAuxiliaryOption *)v5 setTitle:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIIdentifierKey"];
    [(_UIDocumentPickerAuxiliaryOption *)v5 setIdentifier:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UIOrderKey"];
    -[_UIDocumentPickerAuxiliaryOption setOrder:](v5, "setOrder:", [v9 integerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  image = self->_image;
  id v5 = a3;
  [v5 encodeObject:image forKey:@"UIImageKey"];
  [v5 encodeObject:self->_title forKey:@"UITitleKey"];
  [v5 encodeObject:self->_identifier forKey:@"UIIdentifierKey"];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_order];
  [v5 encodeObject:v6 forKey:@"UIOrderKey"];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (BOOL)isNewlyAdded
{
  return self->_newlyAdded;
}

- (void)setNewlyAdded:(BOOL)a3
{
  self->_newlyAdded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end