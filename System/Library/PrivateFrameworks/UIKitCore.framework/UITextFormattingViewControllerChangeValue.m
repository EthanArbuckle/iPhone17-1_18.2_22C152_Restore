@interface UITextFormattingViewControllerChangeValue
+ (BOOL)supportsSecureCoding;
- (NSDictionary)_textAnimationAttributes;
- (NSNumber)numberValue;
- (NSString)_customComponentKey;
- (NSString)_emphasisStyleKey;
- (NSString)_textAnimationName;
- (NSString)changeType;
- (NSString)formattingStyleKey;
- (NSString)highlight;
- (NSString)textList;
- (UIColor)color;
- (UIFont)font;
- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 customComponentKey:(id)a4;
- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 numberValue:(id)a4;
- (UITextFormattingViewControllerChangeValue)initWithCoder:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithEmphasisStyleKey:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithFont:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithFormattingStyleKey:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithHighlight:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithTextAlignment:(int64_t)a3;
- (UITextFormattingViewControllerChangeValue)initWithTextColor:(id)a3;
- (UITextFormattingViewControllerChangeValue)initWithTextList:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)textAlignment;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UITextFormattingViewControllerChangeValue

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UITextFormattingViewControllerChangeValue;
  v6 = [(UITextFormattingViewControllerChangeValue *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_changeType, a3);
    formattingStyleKey = v7->_formattingStyleKey;
    v7->_formattingStyleKey = 0;

    font = v7->_font;
    v7->_font = 0;

    color = v7->_color;
    v7->_color = 0;

    numberValue = v7->_numberValue;
    v7->_numberValue = 0;

    textList = v7->_textList;
    v7->_textList = 0;

    highlight = v7->_highlight;
    v7->_textAlignment = 0;
    v7->_highlight = 0;

    customComponentKey = v7->__customComponentKey;
    v7->__customComponentKey = 0;

    emphasisStyleKey = v7->__emphasisStyleKey;
    v7->__emphasisStyleKey = 0;
  }
  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 customComponentKey:(id)a4
{
  id v7 = a4;
  v8 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->__customComponentKey, a4);
  }

  return v9;
}

- (UITextFormattingViewControllerChangeValue)initWithChangeType:(id)a3 numberValue:(id)a4
{
  id v7 = a4;
  v8 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_numberValue, a4);
  }

  return v9;
}

- (UITextFormattingViewControllerChangeValue)initWithFormattingStyleKey:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerFormattingStyleChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_formattingStyleKey, a3);
  }

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithEmphasisStyleKey:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerEmphasisStyleChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__emphasisStyleKey, a3);
  }

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextColor:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerTextColorChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_color, a3);
  }

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithFont:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerFontChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_font, a3);
  }

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextList:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerTextListChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_textList, a3);
  }

  return v7;
}

- (UITextFormattingViewControllerChangeValue)initWithTextAlignment:(int64_t)a3
{
  result = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerTextAlignmentChange"];
  if (result) {
    result->_textAlignment = a3;
  }
  return result;
}

- (UITextFormattingViewControllerChangeValue)initWithHighlight:(id)a3
{
  id v5 = a3;
  v6 = [(UITextFormattingViewControllerChangeValue *)self initWithChangeType:@"UITextFormattingViewControllerHighlightChange"];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_highlight, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(UITextFormattingViewControllerChangeValue *)self changeType];
  v6 = (void *)v4[1];
  v4[1] = v5;

  id v7 = [(UITextFormattingViewControllerChangeValue *)self formattingStyleKey];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v4[2];
  v4[2] = v8;

  v10 = [(UITextFormattingViewControllerChangeValue *)self font];
  uint64_t v11 = [v10 copy];
  v12 = (void *)v4[3];
  v4[3] = v11;

  v13 = [(UITextFormattingViewControllerChangeValue *)self color];
  uint64_t v14 = [v13 copy];
  v15 = (void *)v4[4];
  v4[4] = v14;

  v16 = [(UITextFormattingViewControllerChangeValue *)self numberValue];
  uint64_t v17 = [v16 copy];
  v18 = (void *)v4[5];
  v4[5] = v17;

  v19 = [(UITextFormattingViewControllerChangeValue *)self textList];
  uint64_t v20 = [v19 copy];
  v21 = (void *)v4[6];
  v4[6] = v20;

  v4[7] = [(UITextFormattingViewControllerChangeValue *)self textAlignment];
  v22 = [(UITextFormattingViewControllerChangeValue *)self highlight];
  uint64_t v23 = [v22 copy];
  v24 = (void *)v4[8];
  v4[8] = v23;

  v25 = [(UITextFormattingViewControllerChangeValue *)self _emphasisStyleKey];
  uint64_t v26 = [v25 copy];
  v27 = (void *)v4[10];
  v4[10] = v26;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextFormattingViewControllerChangeValue *)self changeType];
  [v4 encodeObject:v5 forKey:@"_ChangeType"];

  v6 = [(UITextFormattingViewControllerChangeValue *)self formattingStyleKey];
  [v4 encodeObject:v6 forKey:@"_FormattingStyleKey"];

  id v7 = [(UITextFormattingViewControllerChangeValue *)self font];
  [v4 encodeObject:v7 forKey:@"_Font"];

  uint64_t v8 = [(UITextFormattingViewControllerChangeValue *)self color];
  [v4 encodeObject:v8 forKey:@"_Color"];

  v9 = [(UITextFormattingViewControllerChangeValue *)self numberValue];
  [v4 encodeObject:v9 forKey:@"_NumberValue"];

  v10 = [(UITextFormattingViewControllerChangeValue *)self textList];
  [v4 encodeObject:v10 forKey:@"_TextList"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[UITextFormattingViewControllerChangeValue textAlignment](self, "textAlignment"), @"_TextAlignment");
  uint64_t v11 = [(UITextFormattingViewControllerChangeValue *)self highlight];
  [v4 encodeObject:v11 forKey:@"_Highlight"];

  id v12 = [(UITextFormattingViewControllerChangeValue *)self _emphasisStyleKey];
  [v4 encodeObject:v12 forKey:@"_EmphasisStyleKey"];
}

- (UITextFormattingViewControllerChangeValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextFormattingViewControllerChangeValue *)self init];
  if (v5)
  {
    v6 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_ChangeType"];
    changeType = v5->_changeType;
    v5->_changeType = (NSString *)v7;

    v9 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_FormattingStyleKey"];
    formattingStyleKey = v5->_formattingStyleKey;
    v5->_formattingStyleKey = (NSString *)v10;

    id v12 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"_Font"];
    font = v5->_font;
    v5->_font = (UIFont *)v13;

    v15 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_Color"];
    color = v5->_color;
    v5->_color = (UIColor *)v16;

    v18 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"_NumberValue"];
    numberValue = v5->_numberValue;
    v5->_numberValue = (NSNumber *)v19;

    v21 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_TextList"];
    textList = v5->_textList;
    v5->_textList = (NSString *)v22;

    v5->_textAlignment = [v4 decodeIntegerForKey:@"_TextAlignment"];
    v24 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"_Highlight"];
    highlight = v5->_highlight;
    v5->_highlight = (NSString *)v25;

    v27 = _UITextFormattingViewControllerChangeValueClasses();
    uint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"_EmphasisStyleKey"];
    emphasisStyleKey = v5->__emphasisStyleKey;
    v5->__emphasisStyleKey = (NSString *)v28;
  }
  return v5;
}

- (NSString)changeType
{
  return self->_changeType;
}

- (NSString)formattingStyleKey
{
  return self->_formattingStyleKey;
}

- (UIFont)font
{
  return self->_font;
}

- (UIColor)color
{
  return self->_color;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (NSString)textList
{
  return self->_textList;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (NSString)highlight
{
  return self->_highlight;
}

- (NSString)_customComponentKey
{
  return self->__customComponentKey;
}

- (NSString)_emphasisStyleKey
{
  return self->__emphasisStyleKey;
}

- (NSString)_textAnimationName
{
  return self->__textAnimationName;
}

- (NSDictionary)_textAnimationAttributes
{
  return self->__textAnimationAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textAnimationAttributes, 0);
  objc_storeStrong((id *)&self->__textAnimationName, 0);
  objc_storeStrong((id *)&self->__emphasisStyleKey, 0);
  objc_storeStrong((id *)&self->__customComponentKey, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_textList, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_formattingStyleKey, 0);
  objc_storeStrong((id *)&self->_changeType, 0);
}

@end