@interface _UILabelAttributedStringContent
- (BOOL)_isContentEqualToContent:(id)a3;
- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4;
- (BOOL)isAttributed;
- (BOOL)isEqualToAttributedString:(id)a3;
- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isNil;
- (BOOL)isWidthVariant;
- (_UILabelAttributedStringContent)contentWithAttributedString:(id)a3;
- (_UILabelAttributedStringContent)contentWithString:(id)a3;
- (_UILabelAttributedStringContent)initWithAttributedString:(id)a3 defaultAttributes:(id)a4;
- (id)attributedString;
- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultValueForAttribute:(id)a3;
- (id)intelligenceLightAttributedStrings;
- (id)labelViewTextAttachments;
- (id)string;
- (int64_t)length;
- (unint64_t)hash;
@end

@implementation _UILabelAttributedStringContent

- (BOOL)isAttributed
{
  v3 = [(_UILabelAttributedStringContent *)self string];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(_UILabelAttributedStringContent *)self attributedString];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)string
{
  return [(NSAttributedString *)self->_attributedString string];
}

- (id)defaultValueForAttribute:(id)a3
{
  id v4 = a3;
  if ([(_UILabelAttributedStringContent *)self length] < 1
    || ([(NSAttributedString *)self->_attributedString attribute:v4 atIndex:0 effectiveRange:0], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = [(NSDictionary *)self->super._defaultAttributes objectForKeyedSubscript:v4];
  }

  return v5;
}

- (int64_t)length
{
  return [(NSAttributedString *)self->_attributedString length];
}

- (BOOL)isNil
{
  return self->_attributedString == 0;
}

- (BOOL)isWidthVariant
{
  return 0;
}

- (id)contentByApplyingAttribute:(id)a3 value:(id)a4 toRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if (location >= [(_UILabelAttributedStringContent *)self length]) {
    goto LABEL_31;
  }
  if (location + length >= [(_UILabelAttributedStringContent *)self length]) {
    NSUInteger length = [(_UILabelAttributedStringContent *)self length] - location;
  }
  if (!v9 || !length) {
    goto LABEL_31;
  }
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  v11 = [(NSAttributedString *)self->_attributedString attribute:v9 atIndex:location effectiveRange:&v32];
  v12 = v11;
  if (v32 == location && v33 == length)
  {
    id v13 = v11;
    id v14 = v10;
    v15 = v14;
    if (v13 == v14)
    {

LABEL_14:
      v18 = self;
LABEL_15:

      goto LABEL_32;
    }
    if (v14 && v13)
    {
      char v16 = [v13 isEqual:v14];

      if ((v16 & 1) == 0)
      {
        v17 = (void *)[(NSAttributedString *)self->_attributedString mutableCopy];
LABEL_27:
        objc_msgSend(v17, "addAttribute:value:range:", v9, v10, location, length);
        goto LABEL_29;
      }
      goto LABEL_14;
    }

    if (!v13)
    {
      id v19 = [(NSDictionary *)self->super._defaultAttributes objectForKeyedSubscript:v9];
      id v20 = v15;
      v29 = v19;
      if (v19 == v20)
      {
        v23 = v20;

        v21 = v19;
      }
      else
      {
        if (!v15 || !v19)
        {

          v21 = v19;
LABEL_25:

          goto LABEL_26;
        }
        v21 = v19;
        v22 = v20;
        int v28 = [v29 isEqual:v20];

        if (!v28) {
          goto LABEL_25;
        }
      }
      v24 = self;

      goto LABEL_15;
    }
  }
LABEL_26:
  v25 = (void *)[(NSAttributedString *)self->_attributedString mutableCopy];
  v17 = v25;
  if (v10) {
    goto LABEL_27;
  }
  objc_msgSend(v25, "removeAttribute:range:", v9, location, length);
LABEL_29:
  if ([v17 isEqualToAttributedString:self->_attributedString])
  {

LABEL_31:
    v30.receiver = self;
    v30.super_class = (Class)_UILabelAttributedStringContent;
    -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v30, sel_contentByApplyingAttribute_value_toRange_, v9, v10, location, length);
    self = (_UILabelAttributedStringContent *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v31.receiver = self;
  v31.super_class = (Class)_UILabelAttributedStringContent;
  v27 = -[_UILabelContent contentByApplyingAttribute:value:toRange:](&v31, sel_contentByApplyingAttribute_value_toRange_, v9, v10, location, length);
  self = [v27 contentWithAttributedString:v17];

LABEL_32:
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_UILabelAttributedStringContent alloc];
  attributedString = self->_attributedString;
  defaultAttributes = self->super._defaultAttributes;
  return [(_UILabelAttributedStringContent *)v4 initWithAttributedString:attributedString defaultAttributes:defaultAttributes];
}

- (id)labelViewTextAttachments
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  attributedString = self->_attributedString;
  uint64_t v5 = *(void *)off_1E52D1F50;
  uint64_t v6 = [(NSAttributedString *)attributedString length];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59___UILabelAttributedStringContent_labelViewTextAttachments__block_invoke;
  v10[3] = &unk_1E52D9A30;
  id v7 = v3;
  id v11 = v7;
  -[NSAttributedString enumerateAttribute:inRange:options:usingBlock:](attributedString, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v10);
  if ([v7 count]) {
    v8 = (void *)[v7 copy];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isAttribute:(id)a3 uniformlyEqualToValue:(id)a4
{
  id v6 = a4;
  attributedString = self->_attributedString;
  id v8 = a3;
  uint64_t v9 = [(NSAttributedString *)attributedString length];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    -[NSAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributedString, "attribute:atIndex:longestEffectiveRange:inRange:", v8, 0, &v16, 0, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 != v17)
    {
      char v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    id v11 = [(NSDictionary *)self->super._defaultAttributes objectForKeyedSubscript:v8];
  }
  id v11 = v11;
  id v13 = v6;
  id v14 = v13;
  if (v11 == v13)
  {
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
    if (v13 && v11) {
      char v12 = [v11 isEqual:v13];
    }
  }

LABEL_11:
  return v12;
}

- (_UILabelAttributedStringContent)contentWithAttributedString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_attributedString;
  id v6 = (NSAttributedString *)v4;
  id v7 = v6;
  if (v5 == v6)
  {

    goto LABEL_7;
  }
  if (v6 && v5)
  {
    int v8 = [(NSAttributedString *)v5 isEqual:v6];

    if (!v8) {
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v9 = self;
    goto LABEL_11;
  }

  if (v7)
  {
LABEL_9:
    uint64_t v9 = [[_UILabelAttributedStringContent alloc] initWithAttributedString:v7 defaultAttributes:self->super._defaultAttributes];
    goto LABEL_11;
  }
  uint64_t v9 = [[_UILabelContent alloc] initWithDefaultAttributes:self->super._defaultAttributes];
LABEL_11:
  uint64_t v10 = v9;

  return v10;
}

- (id)attributedString
{
  return self->_attributedString;
}

- (_UILabelAttributedStringContent)initWithAttributedString:(id)a3 defaultAttributes:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    v16.receiver = self;
    v16.super_class = (Class)_UILabelAttributedStringContent;
    id v8 = a4;
    uint64_t v9 = [(_UILabelContent *)&v16 initWithDefaultAttributes:v8];

    if (v9)
    {
      +[_NSAttributedStringIntentResolver attributedStringByResolvingString:](_UIAttributedStringIntentResolver, "attributedStringByResolvingString:", v7, v16.receiver, v16.super_class);
      id v10 = (id)objc_claimAutoreleasedReturnValue();

      if (dyld_program_sdk_at_least()) {
        uint64_t v11 = [v10 copy];
      }
      else {
        uint64_t v11 = [v10 mutableCopy];
      }
      attributedString = v9->_attributedString;
      v9->_attributedString = (NSAttributedString *)v11;
    }
    else
    {
      id v10 = v7;
    }
    char v12 = v9;
    self = v12;
  }
  else
  {
    id v10 = a4;
    char v12 = [[_UILabelContent alloc] initWithDefaultAttributes:v10];
  }
  id v14 = v12;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightInertAttributedString, 0);
  objc_storeStrong((id *)&self->_lightReactiveAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

- (_UILabelAttributedStringContent)contentWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->super._defaultAttributes;
  uint64_t v6 = [(_UILabelAttributedStringContent *)self length];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    id v8 = -[NSAttributedString attributesAtIndex:longestEffectiveRange:inRange:](self->_attributedString, "attributesAtIndex:longestEffectiveRange:inRange:", 0, &v24, 0, v6);
    uint64_t v9 = v8;
    if (v25 == v7 && [v8 count])
    {
      id v10 = (void *)[(NSDictionary *)self->super._defaultAttributes mutableCopy];
      [v10 addEntriesFromDictionary:v9];
      id v11 = v10;
      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        uint64_t v12 = *(void *)off_1E52D21B8;
        id v13 = [(NSDictionary *)self->super._defaultAttributes objectForKeyedSubscript:*(void *)off_1E52D21B8];
        [v13 minimumLineHeight];
        double v15 = v14;
        [v13 maximumLineHeight];
        double v17 = v16;
        v18 = [v11 objectForKeyedSubscript:v12];
        id v19 = (void *)[v18 mutableCopy];

        [v19 setMinimumLineHeight:v15];
        [v19 setMaximumLineHeight:v17];
        [v11 setObject:v19 forKeyedSubscript:v12];

        [v11 setObject:0 forKeyedSubscript:*(void *)off_1E52D2250];
      }
      [v11 removeObjectForKey:*(void *)off_1E52D1F40];
      [v11 removeObjectForKey:*(void *)off_1E52D1F50];

      if (([v11 isEqual:self->super._defaultAttributes] & 1) == 0)
      {
        id v20 = (NSDictionary *)v11;

        uint64_t v5 = v20;
      }
    }
  }
  if (v4) {
    v21 = [[_UILabelStringContent alloc] initWithString:v4 defaultAttributes:v5];
  }
  else {
    v21 = [[_UILabelContent alloc] initWithDefaultAttributes:v5];
  }
  v22 = v21;

  return (_UILabelAttributedStringContent *)v22;
}

- (BOOL)_isContentEqualToContent:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToAttributedString:self->_attributedString])
  {
    v7.receiver = self;
    v7.super_class = (Class)_UILabelAttributedStringContent;
    BOOL v5 = [(_UILabelContent *)&v7 _isContentEqualToContent:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToAttributedString:(id)a3
{
  attributedString = self->_attributedString;
  return attributedString == a3
      || -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
}

- (BOOL)isEqualToString:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  attributedString = self->_attributedString;
  if (v4 | (unint64_t)attributedString)
  {
    objc_super v7 = [(NSAttributedString *)attributedString string];
    char v6 = [v7 isEqualToString:v4];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isEqualToContent:(id)a3 byAttribute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UILabelAttributedStringContent;
  if (![(_UILabelContent *)&v14 isEqualToContent:v6 byAttribute:v7]) {
    goto LABEL_5;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  id v8 = [(NSAttributedString *)self->_attributedString attribute:v7 atIndex:0 effectiveRange:&v12];
  uint64_t v9 = v13;
  if (v9 != [(_UILabelAttributedStringContent *)self length])
  {

LABEL_5:
    char v10 = 0;
    goto LABEL_6;
  }
  char v10 = [v6 isAttribute:v7 uniformlyEqualToValue:v8];

LABEL_6:
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSAttributedString *)self->_attributedString hash];
  v5.receiver = self;
  v5.super_class = (Class)_UILabelAttributedStringContent;
  return [(_UILabelContent *)&v5 hash] + v3;
}

- (id)intelligenceLightAttributedStrings
{
  if ([(NSAttributedString *)self->_attributedString length])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v4 = (void *)[(NSAttributedString *)self->_attributedString mutableCopy];
    objc_super v5 = (void *)[(NSAttributedString *)self->_attributedString mutableCopy];
    uint64_t v6 = [v5 length];
    attributedString = self->_attributedString;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __69___UILabelAttributedStringContent_intelligenceLightAttributedStrings__block_invoke;
    double v17 = &unk_1E530B108;
    id v18 = v5;
    id v19 = v4;
    id v8 = v4;
    id v9 = v5;
    [(NSAttributedString *)attributedString enumerateAttribute:@"_NSIntelligenceLightReactiveAttributeName", 0, v6, 0x100000, &v14 inRange options usingBlock];
    char v10 = objc_opt_new();
    id v11 = objc_msgSend(v8, "copy", v14, v15, v16, v17);
    [v10 setLightReactiveAttributedString:v11];

    uint64_t v12 = (void *)[v9 copy];
    [v10 setLightInertAttributedString:v12];
  }
  else
  {
    char v10 = 0;
  }
  return v10;
}

@end