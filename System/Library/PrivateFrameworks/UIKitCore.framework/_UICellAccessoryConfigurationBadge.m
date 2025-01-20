@interface _UICellAccessoryConfigurationBadge
+ (BOOL)supportsSecureCoding;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (UIFont)font;
- (_UICellAccessoryConfigurationBadge)initWithCoder:(id)a3;
- (_UICellAccessoryConfigurationBadge)initWithText:(id)a3;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setFont:(id)a3;
@end

@implementation _UICellAccessoryConfigurationBadge

- (_UICellAccessoryConfigurationBadge)initWithText:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICellAccessoryConfiguration.m", 422, @"Invalid parameter not satisfying: %@", @"text != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)_UICellAccessoryConfigurationBadge;
  v6 = [(_UICellAccessoryConfiguration *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    text = v6->_text;
    v6->_text = (NSString *)v7;

    [(_UICellAccessoryConfiguration *)v6 setUsesDefaultLayoutWidth:0];
    uint64_t v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
    font = v6->_font;
    v6->_font = (UIFont *)v9;

    v6->_adjustsFontForContentSizeCategory = 1;
  }

  return v6;
}

- (int64_t)_systemType
{
  return 7;
}

- (id)_identifier
{
  return @"Badge";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICellAccessoryConfigurationBadge)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)_UICellAccessoryConfigurationBadge;
    v6 = [(_UICellAccessoryConfiguration *)&v11 initWithCoder:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_text, v5);
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
      font = v7->_font;
      v7->_font = (UIFont *)v8;

      v7->_adjustsFontForContentSizeCategory = [v4 decodeBoolForKey:@"adjustsFontForContentSizeCategory"];
    }
  }
  else
  {

    uint64_t v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UICellAccessoryConfigurationBadge;
  id v4 = a3;
  [(_UICellAccessoryConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, @"text", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_font forKey:@"font"];
  [v4 encodeBool:self->_adjustsFontForContentSizeCategory forKey:@"adjustsFontForContentSizeCategory"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UICellAccessoryConfigurationBadge;
  id v4 = [(_UICellAccessoryConfiguration *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    v6 = (void *)*((void *)v4 + 5);
    *((void *)v4 + 5) = v5;

    objc_storeStrong((id *)v4 + 6, self->_font);
    *((unsigned char *)v4 + 32) = self->_adjustsFontForContentSizeCategory;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_UICellAccessoryConfigurationBadge;
  if ([(_UICellAccessoryConfiguration *)&v18 isEqual:v4])
  {
    uint64_t v5 = v4;
    v6 = (void *)v5[5];
    uint64_t v7 = self->_text;
    objc_super v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      uint64_t v9 = v8;
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        goto LABEL_17;
      }
      int v11 = [(UIFont *)v7 isEqual:v8];

      if (!v11) {
        goto LABEL_18;
      }
    }
    objc_super v13 = (void *)v5[6];
    uint64_t v7 = self->_font;
    v14 = v13;
    if (v7 == v14)
    {

      goto LABEL_21;
    }
    uint64_t v9 = v14;
    if (v7) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      int v16 = [(UIFont *)v7 isEqual:v14];

      if (!v16) {
        goto LABEL_18;
      }
LABEL_21:
      BOOL v12 = self->_adjustsFontForContentSizeCategory == *((unsigned __int8 *)v5 + 32);
      goto LABEL_22;
    }
LABEL_17:

LABEL_18:
    BOOL v12 = 0;
LABEL_22:

    goto LABEL_23;
  }
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)_UICellAccessoryConfigurationBadge;
  unint64_t v3 = [(_UICellAccessoryConfiguration *)&v6 hash];
  NSUInteger v4 = [(NSString *)self->_text hash] ^ v3;
  return v4 ^ [(UIFont *)self->_font hash] ^ self->_adjustsFontForContentSizeCategory;
}

- (NSString)text
{
  return self->_text;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end