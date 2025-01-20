@interface _UILabelStringContent
- (BOOL)_isContentEqualToContent:(id)a3;
- (BOOL)isAttributed;
- (BOOL)isEqualToAttributedString:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNil;
- (BOOL)isWidthVariant;
- (_UILabelStringContent)contentWithAttributedString:(id)a3;
- (_UILabelStringContent)contentWithString:(id)a3;
- (_UILabelStringContent)initWithString:(id)a3 defaultAttributes:(id)a4;
- (id)attributedString;
- (id)attributedStringContent;
- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)string;
- (int64_t)length;
- (unint64_t)hash;
@end

@implementation _UILabelStringContent

- (id)string
{
  return self->_string;
}

- (BOOL)isAttributed
{
  return 0;
}

- (int64_t)length
{
  return [(NSString *)self->_string length];
}

- (BOOL)isNil
{
  return self->_string == 0;
}

- (BOOL)isWidthVariant
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9 && v10 && (unint64_t v12 = [(_UILabelStringContent *)self length], v12 > location))
  {
    unint64_t v13 = v12;
    if (location + length <= v12) {
      NSUInteger v14 = length;
    }
    else {
      NSUInteger v14 = v12 - location;
    }
    v22.receiver = self;
    v22.super_class = (Class)_UILabelStringContent;
    v15 = -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v22, sel_contentByApplyingAttribute_value_toRange_, v9, v11, location, v14);
    v16 = v15;
    if (location || v14 != v13)
    {
      v18 = [(_UILabelStringContent *)self attributedString];
      v19 = (void *)[v18 mutableCopy];

      objc_msgSend(v19, "addAttribute:value:range:", v9, v11, location, v14);
      id v17 = [v16 contentWithAttributedString:v19];
    }
    else
    {
      id v17 = v15;
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)_UILabelStringContent;
    -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v21, sel_contentByApplyingAttribute_value_toRange_, v9, v11, location, length);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void).cxx_destruct
{
}

- (_UILabelStringContent)contentWithString:(id)a3
{
  id v4 = a3;
  v5 = self->_string;
  v6 = (NSString *)v4;
  v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  if (v6 && v5)
  {
    int v8 = [(NSString *)v5 isEqual:v6];

    if (!v8) {
      goto LABEL_9;
    }
LABEL_7:
    id v9 = self;
    goto LABEL_11;
  }

  if (v7)
  {
LABEL_9:
    id v9 = [[_UILabelStringContent alloc] initWithString:v7 defaultAttributes:self->super._defaultAttributes];
    goto LABEL_11;
  }
  id v9 = [[_UILabelContent alloc] initWithDefaultAttributes:self->super._defaultAttributes];
LABEL_11:
  id v10 = v9;

  return v10;
}

- (_UILabelStringContent)initWithString:(id)a3 defaultAttributes:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)_UILabelStringContent;
    id v7 = a4;
    int v8 = [(_UILabelContent *)&v14 initWithDefaultAttributes:v7];

    if (v8)
    {
      uint64_t v9 = objc_msgSend(v6, "copy", v14.receiver, v14.super_class);
      string = v8->_string;
      v8->_string = (NSString *)v9;

      *(unsigned char *)&v8->_flags = *(unsigned char *)&v8->_flags & 0xFE | _NSStringIsWidthVariant(v6);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    id v12 = a4;
    v11 = [[_UILabelContent alloc] initWithDefaultAttributes:v12];
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UILabelStringContent alloc];
  string = self->_string;
  defaultAttributes = self->super._defaultAttributes;
  return [(_UILabelStringContent *)v4 initWithString:string defaultAttributes:defaultAttributes];
}

- (id)attributedString
{
  if (self->_string) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_string attributes:self->super._defaultAttributes];
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:self->_string])
  {
    v7.receiver = self;
    v7.super_class = (Class)_UILabelStringContent;
    BOOL v5 = [(_UILabelContent *)&v7 _isContentEqualToContent:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToString:(id)a3
{
  string = self->_string;
  return string == a3 || -[NSString isEqualToString:](string, "isEqualToString:");
}

- (id)attributedStringContent
{
  v3 = [(_UILabelStringContent *)self attributedString];
  id v4 = [(_UILabelStringContent *)self contentWithAttributedString:v3];

  return v4;
}

- (_UILabelStringContent)contentWithAttributedString:(id)a3
{
  id v4 = a3;
  if (v4) {
    BOOL v5 = [[_UILabelAttributedStringContent alloc] initWithAttributedString:v4 defaultAttributes:self->super._defaultAttributes];
  }
  else {
    BOOL v5 = [[_UILabelContent alloc] initWithDefaultAttributes:self->super._defaultAttributes];
  }
  id v6 = v5;

  return (_UILabelStringContent *)v6;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  id v4 = a3;
  if (v4 || self->_string)
  {
    BOOL v5 = [(_UILabelStringContent *)self attributedString];
    char v6 = [v5 isEqualToAttributedString:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_string hash];
  v5.receiver = self;
  v5.super_class = (Class)_UILabelStringContent;
  return [(_UILabelContent *)&v5 hash] + v3;
}

@end