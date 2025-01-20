@interface _TUIFontAttributes
- (NSDictionary)attributes;
- (UIColor)foregroundColor;
- (UIFont)font;
- (_TUIFontAttributes)attributesWithCentered:(BOOL)a3 truncated:(BOOL)a4;
- (_TUIFontAttributes)attributesWithForegroundColor:(id)a3;
- (_TUIFontAttributes)attributesWithLineSpacing:(double)a3;
- (_TUIFontAttributes)attributesWithTruncated:(BOOL)a3;
- (_TUIFontAttributes)initWithAttributes:(id)a3 caps:(unint64_t)a4;
- (id)attributedStringWithText:(id)a3;
- (unint64_t)caps;
@end

@implementation _TUIFontAttributes

- (UIFont)font
{
  return (UIFont *)[(NSDictionary *)self->_attributes objectForKeyedSubscript:NSFontAttributeName];
}

- (UIColor)foregroundColor
{
  return (UIColor *)[(NSDictionary *)self->_attributes objectForKeyedSubscript:NSForegroundColorAttributeName];
}

- (_TUIFontAttributes)initWithAttributes:(id)a3 caps:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TUIFontAttributes;
  v8 = [(_TUIFontAttributes *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attributes, a3);
    v9->_caps = a4;
  }

  return v9;
}

- (id)attributedStringWithText:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_caps == 2)
  {
    uint64_t v6 = [v4 localizedUppercaseString];

    v5 = (void *)v6;
  }
  if (v5) {
    id v7 = [objc_alloc((Class)NSAttributedString) initWithString:v5 attributes:self->_attributes];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (_TUIFontAttributes)attributesWithTruncated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSDictionary *)self->_attributes mutableCopy];
  uint64_t v6 = [v5 objectForKeyedSubscript:NSParagraphStyleAttributeName];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[NSParagraphStyle defaultParagraphStyle];
  }
  v9 = v8;

  id v10 = [v9 mutableCopy];
  objc_super v11 = v10;
  if (v3) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 0;
  }
  [v10 setLineBreakMode:v12];
  id v13 = [v11 copy];
  [v5 setObject:v13 forKeyedSubscript:NSParagraphStyleAttributeName];

  v14 = [[_TUIFontAttributes alloc] initWithAttributes:v5 caps:self->_caps];

  return v14;
}

- (_TUIFontAttributes)attributesWithCentered:(BOOL)a3 truncated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(NSDictionary *)self->_attributes mutableCopy];
  id v8 = [v7 objectForKeyedSubscript:NSParagraphStyleAttributeName];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[NSParagraphStyle defaultParagraphStyle];
  }
  objc_super v11 = v10;

  id v12 = [v11 mutableCopy];
  id v13 = v12;
  if (v5)
  {
    [v12 setAlignment:1];
  }
  else
  {
    v14 = +[NSParagraphStyle defaultParagraphStyle];
    [v13 setAlignment:[v14 alignment]];
  }
  if (v4) {
    uint64_t v15 = 4;
  }
  else {
    uint64_t v15 = 0;
  }
  [v13 setLineBreakMode:v15];
  id v16 = [v13 copy];
  [v7 setObject:v16 forKeyedSubscript:NSParagraphStyleAttributeName];

  v17 = [[_TUIFontAttributes alloc] initWithAttributes:v7 caps:self->_caps];

  return v17;
}

- (_TUIFontAttributes)attributesWithLineSpacing:(double)a3
{
  id v5 = [(NSDictionary *)self->_attributes mutableCopy];
  uint64_t v6 = [v5 objectForKeyedSubscript:NSParagraphStyleAttributeName];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = +[NSParagraphStyle defaultParagraphStyle];
  }
  v9 = v8;

  id v10 = [v9 mutableCopy];
  [v10 setLineSpacing:a3];
  id v11 = [v10 copy];
  [v5 setObject:v11 forKeyedSubscript:NSParagraphStyleAttributeName];

  id v12 = [[_TUIFontAttributes alloc] initWithAttributes:v5 caps:self->_caps];

  return v12;
}

- (_TUIFontAttributes)attributesWithForegroundColor:(id)a3
{
  attributes = self->_attributes;
  id v5 = a3;
  id v6 = [(NSDictionary *)attributes mutableCopy];
  [v6 setObject:v5 forKeyedSubscript:NSForegroundColorAttributeName];

  id v7 = [[_TUIFontAttributes alloc] initWithAttributes:v6 caps:self->_caps];

  return v7;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (unint64_t)caps
{
  return self->_caps;
}

- (void).cxx_destruct
{
}

@end