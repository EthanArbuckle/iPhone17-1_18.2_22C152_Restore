@interface UICellAccessoryOutlineDisclosure
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UICellAccessoryOutlineDisclosure)init;
- (UICellAccessoryOutlineDisclosure)initWithCoder:(id)a3;
- (UICellAccessoryOutlineDisclosureStyle)style;
- (UIImage)_customImage;
- (double)rotationAngle;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (void)_setCustomImage:(id)a3;
- (void)actionHandler;
- (void)encodeWithCoder:(id)a3;
- (void)setActionHandler:(void *)actionHandler;
- (void)setStyle:(UICellAccessoryOutlineDisclosureStyle)style;
@end

@implementation UICellAccessoryOutlineDisclosure

- (UICellAccessoryOutlineDisclosure)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryOutlineDisclosure;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICellAccessory *)v2 setReservedLayoutWidth:0.0];
  }
  return v3;
}

- (int64_t)_systemType
{
  return 6;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 206;
}

- (id)_identifier
{
  return @"OutlineDisclosure";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryOutlineDisclosure)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryOutlineDisclosure;
  objc_super v5 = [(UICellAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_style = [v4 decodeIntegerForKey:@"style"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customImage"];
    customImage = v5->__customImage;
    v5->__customImage = (UIImage *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryOutlineDisclosure;
  id v4 = a3;
  [(UICellAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_style, @"style", v5.receiver, v5.super_class);
  [v4 encodeObject:self->__customImage forKey:@"customImage"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryOutlineDisclosure;
  id v4 = [(UICellAccessory *)&v9 copyWithZone:a3];
  objc_super v5 = (id *)v4;
  if (v4)
  {
    v4[6] = self->_style;
    uint64_t v6 = [self->_actionHandler copy];
    id v7 = v5[7];
    v5[7] = (id)v6;

    objc_storeStrong(v5 + 8, self->__customImage);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UICellAccessoryOutlineDisclosure;
  if ([(UICellAccessory *)&v14 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = v5;
    if (self->_style == *((void *)v5 + 6) && self->_actionHandler == (id)*((void *)v5 + 7))
    {
      objc_super v9 = (void *)*((void *)v5 + 8);
      v10 = self->__customImage;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        char v7 = 1;
      }
      else
      {
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (v13) {
          char v7 = 0;
        }
        else {
          char v7 = [(UIImage *)v10 isEqual:v11];
        }
      }
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryOutlineDisclosure;
  if ([(UICellAccessory *)&v7 _canDirectlyUpdateExistingAccessoryViewFrom:v4])
  {
    BOOL v5 = self->_style == v4[6];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (double)rotationAngle
{
  return 1.57079633;
}

- (UICellAccessoryOutlineDisclosureStyle)style
{
  return self->_style;
}

- (void)setStyle:(UICellAccessoryOutlineDisclosureStyle)style
{
  self->_style = style;
}

- (void)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(void *)actionHandler
{
}

- (UIImage)_customImage
{
  return self->__customImage;
}

- (void)_setCustomImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__customImage, 0);
  objc_storeStrong(&self->_actionHandler, 0);
}

@end