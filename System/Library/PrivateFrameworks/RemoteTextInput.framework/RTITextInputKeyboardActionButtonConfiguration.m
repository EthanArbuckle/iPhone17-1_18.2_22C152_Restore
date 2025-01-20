@interface RTITextInputKeyboardActionButtonConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)actionButtonWithSystemImageData:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)accessibilityTitle;
- (RTIColor)backgroundColor;
- (RTITextInputKeyboardActionButtonConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initButtonWith:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5 isEnabled:(BOOL)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityTitle:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setImageData:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
@end

@implementation RTITextInputKeyboardActionButtonConfiguration

- (id)initButtonWith:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5 isEnabled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RTITextInputKeyboardActionButtonConfiguration;
  v14 = [(RTITextInputKeyboardActionButtonConfiguration *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_imageData, a3);
    objc_storeStrong((id *)&v15->_backgroundColor, a4);
    objc_storeStrong((id *)&v15->_accessibilityTitle, a5);
    v15->_isEnabled = a6;
  }

  return v15;
}

+ (id)actionButtonWithSystemImageData:(id)a3 backgroundColor:(id)a4 accessibilityTitle:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initButtonWith:v10 backgroundColor:v9 accessibilityTitle:v8 isEnabled:1];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(RTITextInputKeyboardActionButtonConfiguration);
  if (v4)
  {
    uint64_t v5 = [(NSData *)self->_imageData copy];
    imageData = v4->_imageData;
    v4->_imageData = (NSData *)v5;

    uint64_t v7 = [(RTIColor *)self->_backgroundColor copy];
    backgroundColor = v4->_backgroundColor;
    v4->_backgroundColor = (RTIColor *)v7;

    uint64_t v9 = [(NSString *)self->_accessibilityTitle copy];
    accessibilityTitle = v4->_accessibilityTitle;
    v4->_accessibilityTitle = (NSString *)v9;

    [(RTITextInputKeyboardActionButtonConfiguration *)v4 setIsEnabled:self->_isEnabled];
  }
  return v4;
}

- (RTITextInputKeyboardActionButtonConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RTITextInputKeyboardActionButtonConfiguration;
  uint64_t v5 = [(RTITextInputKeyboardActionButtonConfiguration *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    uint64_t v7 = [v6 copy];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    uint64_t v10 = [v9 copy];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (RTIColor *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityTitle"];
    uint64_t v13 = [v12 copy];
    accessibilityTitle = v5->_accessibilityTitle;
    v5->_accessibilityTitle = (NSString *)v13;

    v5->_isEnabled = [v4 decodeBoolForKey:@"isEnabled"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  imageData = self->_imageData;
  id v8 = v4;
  if (imageData)
  {
    [v4 encodeObject:imageData forKey:@"imageData"];
    id v4 = v8;
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    [v8 encodeObject:backgroundColor forKey:@"backgroundColor"];
    id v4 = v8;
  }
  accessibilityTitle = self->_accessibilityTitle;
  if (accessibilityTitle)
  {
    [v8 encodeObject:accessibilityTitle forKey:@"accessibilityTitle"];
    id v4 = v8;
  }
  if (self->_isEnabled)
  {
    [v8 encodeBool:1 forKey:@"isEnabled"];
    id v4 = v8;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTITextInputKeyboardActionButtonConfiguration *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(RTITextInputKeyboardActionButtonConfiguration *)self imageData];
      uint64_t v7 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 imageData];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        uint64_t v9 = [(RTITextInputKeyboardActionButtonConfiguration *)self imageData];
        uint64_t v10 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 imageData];
        int v11 = [v9 isEqualToData:v10];

        if (!v11) {
          goto LABEL_15;
        }
      }
      uint64_t v13 = [(RTITextInputKeyboardActionButtonConfiguration *)self backgroundColor];
      uint64_t v14 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 backgroundColor];
      if (v13 == (void *)v14)
      {
      }
      else
      {
        v15 = (void *)v14;
        objc_super v16 = [(RTITextInputKeyboardActionButtonConfiguration *)self backgroundColor];
        objc_super v17 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 backgroundColor];
        int v18 = [v16 isEqual:v17];

        if (!v18) {
          goto LABEL_15;
        }
      }
      v19 = [(RTITextInputKeyboardActionButtonConfiguration *)self accessibilityTitle];
      uint64_t v20 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 accessibilityTitle];
      if (v19 == (void *)v20)
      {
      }
      else
      {
        v21 = (void *)v20;
        v22 = NSString;
        v23 = [(RTITextInputKeyboardActionButtonConfiguration *)self accessibilityTitle];
        v24 = [(RTITextInputKeyboardActionButtonConfiguration *)v5 accessibilityTitle];
        LODWORD(v22) = [v22 _string:v23 matchesString:v24];

        if (!v22)
        {
LABEL_15:
          LOBYTE(v12) = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      BOOL v25 = [(RTITextInputKeyboardActionButtonConfiguration *)self isEnabled];
      BOOL v12 = v25 ^ [(RTITextInputKeyboardActionButtonConfiguration *)v5 isEnabled] ^ 1;
      goto LABEL_18;
    }
    LOBYTE(v12) = 0;
  }
LABEL_19:

  return v12;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (RTIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setAccessibilityTitle:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end