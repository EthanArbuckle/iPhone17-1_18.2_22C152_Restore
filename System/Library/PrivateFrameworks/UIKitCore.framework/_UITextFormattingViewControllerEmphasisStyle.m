@interface _UITextFormattingViewControllerEmphasisStyle
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)styleKey;
- (NSString)title;
- (UIColor)color;
- (_UITextFormattingViewControllerEmphasisStyle)initWithCoder:(id)a3;
- (_UITextFormattingViewControllerEmphasisStyle)initWithStyleKey:(id)a3 title:(id)a4 color:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UITextFormattingViewControllerEmphasisStyle

- (_UITextFormattingViewControllerEmphasisStyle)initWithStyleKey:(id)a3 title:(id)a4 color:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UITextFormattingViewControllerEmphasisStyle;
  v11 = [(_UITextFormattingViewControllerEmphasisStyle *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    styleKey = v11->_styleKey;
    v11->_styleKey = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    color = v11->_color;
    v11->_color = (UIColor *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(_UITextFormattingViewControllerEmphasisStyle *)self styleKey];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  id v8 = [(_UITextFormattingViewControllerEmphasisStyle *)self title];
  uint64_t v9 = [v8 copy];
  id v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = [(_UITextFormattingViewControllerEmphasisStyle *)self color];
  uint64_t v12 = [v11 copy];
  v13 = (void *)v4[3];
  v4[3] = v12;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITextFormattingViewControllerEmphasisStyle *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(_UITextFormattingViewControllerEmphasisStyle *)self styleKey];
      v7 = [(_UITextFormattingViewControllerEmphasisStyle *)v5 styleKey];
      if ([v6 isEqualToString:v7])
      {
        id v8 = [(_UITextFormattingViewControllerEmphasisStyle *)self title];
        uint64_t v9 = [(_UITextFormattingViewControllerEmphasisStyle *)v5 title];
        char v10 = [v8 isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(_UITextFormattingViewControllerEmphasisStyle *)self styleKey];
  uint64_t v4 = [v3 hash];
  v5 = [(_UITextFormattingViewControllerEmphasisStyle *)self title];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UITextFormattingViewControllerEmphasisStyle *)self styleKey];
  [v4 encodeObject:v5 forKey:@"_StyleKey"];

  unint64_t v6 = [(_UITextFormattingViewControllerEmphasisStyle *)self title];
  [v4 encodeObject:v6 forKey:@"_Title"];

  id v7 = [(_UITextFormattingViewControllerEmphasisStyle *)self color];
  [v4 encodeObject:v7 forKey:@"_Color"];
}

- (_UITextFormattingViewControllerEmphasisStyle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_UITextFormattingViewControllerEmphasisStyle *)self init];
  if (v5)
  {
    unint64_t v6 = _UITextFormattingViewControllerEmphasisStyleClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_StyleKey"];
    styleKey = v5->_styleKey;
    v5->_styleKey = (NSString *)v7;

    uint64_t v9 = _UITextFormattingViewControllerEmphasisStyleClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_Title"];
    title = v5->_title;
    v5->_title = (NSString *)v10;

    uint64_t v12 = _UITextFormattingViewControllerEmphasisStyleClasses();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_Color"];
    color = v5->_color;
    v5->_color = (UIColor *)v13;
  }
  return v5;
}

- (NSString)styleKey
{
  return self->_styleKey;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_styleKey, 0);
}

@end