@interface UICellAccessoryLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (UICellAccessoryLabel)initWithCoder:(NSCoder *)coder;
- (UICellAccessoryLabel)initWithText:(NSString *)text;
- (UIFont)font;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory;
- (void)setFont:(UIFont *)font;
@end

@implementation UICellAccessoryLabel

- (UICellAccessoryLabel)initWithText:(NSString *)text
{
  v5 = text;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UICellAccessory.m", 730, @"Invalid parameter not satisfying: %@", @"text != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)UICellAccessoryLabel;
  v6 = [(UICellAccessory *)&v13 init];
  if (v6)
  {
    uint64_t v7 = [(NSString *)v5 copy];
    v8 = v6->_text;
    v6->_text = (NSString *)v7;

    [(UICellAccessory *)v6 setReservedLayoutWidth:0.0];
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

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 201;
}

- (id)_identifier
{
  return @"Label";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryLabel)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  v5 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)UICellAccessoryLabel;
    v6 = [(UICellAccessory *)&v11 initWithCoder:v4];
    uint64_t v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_text, v5);
      uint64_t v8 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"font"];
      font = v7->_font;
      v7->_font = (UIFont *)v8;

      v7->_adjustsFontForContentSizeCategory = [(NSCoder *)v4 decodeBoolForKey:@"adjustsFontForContentSizeCategory"];
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
  v5.super_class = (Class)UICellAccessoryLabel;
  id v4 = a3;
  [(UICellAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_text, @"text", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_font forKey:@"font"];
  [v4 encodeBool:self->_adjustsFontForContentSizeCategory forKey:@"adjustsFontForContentSizeCategory"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryLabel;
  id v4 = [(UICellAccessory *)&v8 copyWithZone:a3];
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_text copy];
    v6 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v5;

    objc_storeStrong((id *)v4 + 8, self->_font);
    *((unsigned char *)v4 + 48) = self->_adjustsFontForContentSizeCategory;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UICellAccessoryLabel;
  if ([(UICellAccessory *)&v18 isEqual:v4])
  {
    uint64_t v5 = v4;
    v6 = (void *)v5[7];
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
    objc_super v13 = (void *)v5[8];
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
      BOOL v12 = self->_adjustsFontForContentSizeCategory == *((unsigned __int8 *)v5 + 48);
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

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UICellAccessoryLabel;
  return [(UICellAccessory *)&v4 _canDirectlyUpdateExistingAccessoryViewFrom:a3];
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)UICellAccessoryLabel;
  unint64_t v3 = [(UICellAccessory *)&v6 hash];
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

- (void)setFont:(UIFont *)font
{
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)adjustsFontForContentSizeCategory
{
  self->_adjustsFontForContentSizeCategory = adjustsFontForContentSizeCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end