@interface PKMultiStackedLabelSource
- (BOOL)isEqual:(id)a3;
- (NSCopying)identifier;
- (NSString)text;
- (PKMultiStackedLabelSource)initWithText:(id)a3;
- (UIColor)textColor;
- (UIFont)font;
- (UIImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setFont:(id)a3;
- (void)setIcon:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation PKMultiStackedLabelSource

- (PKMultiStackedLabelSource)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMultiStackedLabelSource;
  v6 = [(PKMultiStackedLabelSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_text, a3);
  }

  return v7;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_text) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_text];
  [v3 safelyAddObject:self->_font];
  [v3 safelyAddObject:self->_icon];
  [v3 safelyAddObject:self->_textColor];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKMultiStackedLabelSource *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        text = v6->_text;
        v8 = self->_text;
        objc_super v9 = text;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
          {

            goto LABEL_16;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_16;
          }
        }
        if (PKEqualObjects() && PKEqualObjects())
        {
          char v12 = PKEqualObjects();
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:
        char v12 = 0;
        goto LABEL_17;
      }
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[PKMultiStackedLabelSource allocWithZone:](PKMultiStackedLabelSource, "allocWithZone:");
  uint64_t v6 = [(NSString *)self->_text copyWithZone:a3];
  text = v5->_text;
  v5->_text = (NSString *)v6;

  uint64_t v8 = [(UIFont *)self->_font copyWithZone:a3];
  font = v5->_font;
  v5->_font = (UIFont *)v8;

  uint64_t v10 = [(UIImage *)self->_icon copy];
  icon = v5->_icon;
  v5->_icon = (UIImage *)v10;

  uint64_t v12 = [(UIColor *)self->_textColor copyWithZone:a3];
  textColor = v5->_textColor;
  v5->_textColor = (UIColor *)v12;

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end