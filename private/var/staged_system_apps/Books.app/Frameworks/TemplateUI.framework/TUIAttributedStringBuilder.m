@interface TUIAttributedStringBuilder
- (NSArray)axActions;
- (NSDictionary)attributes;
- (NSMutableAttributedString)attributedString;
- (TUIAttributedStringBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 textAlignment:(int64_t)a6;
- (TUIFontSpec)fontSpec;
- (UIColor)color;
- (_NSRange)appendWithBlock:(id)a3;
- (double)baselineOffset;
- (id)finalizeAnimationGroups;
- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5;
- (id)finalizeTextModelWithContext:(id)a3;
- (unint64_t)caps;
- (unint64_t)options;
- (unint64_t)style;
- (void)addImageModel:(id)a3 forRole:(id)a4;
- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4;
- (void)appendString:(id)a3;
- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6;
- (void)setAXActions:(id)a3;
- (void)setAttributedString:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCaps:(unint64_t)a3;
- (void)setColor:(id)a3;
- (void)setFontSpec:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setStyle:(unint64_t)a3;
@end

@implementation TUIAttributedStringBuilder

- (TUIAttributedStringBuilder)initWithFontSpec:(id)a3 style:(unint64_t)a4 color:(id)a5 textAlignment:(int64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)TUIAttributedStringBuilder;
  v12 = [(TUIAttributedStringBuilder *)&v36 init];
  if (v12)
  {
    v13 = (TUIFontSpec *)[v10 copy];
    fontSpec = v12->_fontSpec;
    v12->_fontSpec = v13;

    v15 = (UIColor *)[v11 copy];
    color = v12->_color;
    v12->_color = v15;

    id v17 = [v10 caps];
    v12->_style = a4;
    v12->_caps = (unint64_t)v17;
    v18 = [v10 attributesForAttributedString];
    v19 = [v18 attributes];
    id v20 = [v19 mutableCopy];
    v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = (id)objc_opt_new();
    }
    v23 = v22;

    v24 = v12->_color;
    if (v24) {
      [v23 setObject:v24 forKeyedSubscript:NSForegroundColorAttributeName];
    }
    if (a6 != 4)
    {
      v25 = [v23 objectForKeyedSubscript:NSParagraphStyleAttributeName];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        id v27 = +[NSParagraphStyle defaultParagraphStyle];
      }
      v28 = v27;

      id v29 = [v28 mutableCopy];
      [v29 setAlignment:a6];
      id v30 = [v29 copy];
      [v23 setObject:v30 forKeyedSubscript:NSParagraphStyleAttributeName];
    }
    v31 = (NSDictionary *)[v23 copy];
    attributes = v12->_attributes;
    v12->_attributes = v31;

    v33 = (NSMutableAttributedString *)objc_alloc_init((Class)NSMutableAttributedString);
    attributedString = v12->_attributedString;
    v12->_attributedString = v33;
  }
  return v12;
}

- (void)appendHyperlinkWithURL:(id)a3 block:(id)a4
{
  v18 = (void (**)(void))a4;
  attributes = self->_attributes;
  p_attributes = (id *)&self->_attributes;
  v8 = attributes;
  id v9 = *p_attributes;
  id v10 = a3;
  id v11 = [v9 mutableCopy];
  v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_opt_new();
  }
  v14 = v13;

  [v14 setObject:v10 forKeyedSubscript:NSLinkAttributeName];
  v15 = +[UIColor clearColor];
  [v14 setObject:v15 forKeyedSubscript:NSUnderlineColorAttributeName];

  objc_storeStrong(p_attributes, v14);
  if (v18) {
    v18[2]();
  }
  id v16 = *p_attributes;
  id *p_attributes = v8;
  id v17 = v8;
}

- (void)appendString:(id)a3
{
  id v4 = a3;
  if (!v4) {
    return;
  }
  unint64_t caps = self->_caps;
  id v10 = v4;
  switch(caps)
  {
    case 5uLL:
      uint64_t v6 = [v4 localizedLowercaseString];
      goto LABEL_9;
    case 4uLL:
      uint64_t v6 = [v4 localizedCapitalizedString];
      goto LABEL_9;
    case 2uLL:
      uint64_t v6 = [v4 localizedUppercaseString];
LABEL_9:
      v7 = (void *)v6;

      id v10 = v7;
      break;
  }
  attributedString = self->_attributedString;
  id v9 = [objc_alloc((Class)NSAttributedString) initWithString:v10 attributes:self->_attributes];
  [(NSMutableAttributedString *)attributedString appendAttributedString:v9];
}

- (void)appendWithStyle:(unint64_t)a3 color:(id)a4 fontSpec:(id)a5 block:(id)a6
{
  id v43 = a4;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  id v13 = self->_attributes;
  long long v42 = *(_OWORD *)&self->_style;
  v14 = self->_color;
  unint64_t v15 = self->_style | a3;
  self->_style = v15;
  v41 = v14;
  if (v11)
  {
    if ([v11 caps]) {
      self->_unint64_t caps = (unint64_t)[v11 caps];
    }
  }
  else if (v15 == (void)v42)
  {
    if (!v43 || ([(UIColor *)self->_color isEqual:v43] & 1) != 0)
    {
      v12[2](v12);
      goto LABEL_22;
    }
    goto LABEL_9;
  }
  if (v43)
  {
LABEL_9:
    objc_storeStrong((id *)&self->_color, a4);
    char v16 = 0;
    goto LABEL_11;
  }
  char v16 = 1;
LABEL_11:
  id v17 = [(NSDictionary *)self->_attributes mutableCopy];
  v18 = v17;
  if (v17) {
    id v19 = v17;
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  id v20 = v19;

  if (v11)
  {
    v21 = [v11 attributesForAttributedString];
    id v22 = [v21 attributes];
    [v20 addEntriesFromDictionary:v22];
  }
  if (v16)
  {
    if ((a3 & 1) == 0) {
      goto LABEL_18;
    }
  }
  else
  {
    [v20 setObject:v43 forKeyedSubscript:NSForegroundColorAttributeName];
    if ((a3 & 1) == 0)
    {
LABEL_18:
      if ((a3 & 2) == 0) {
        goto LABEL_19;
      }
LABEL_29:
      v33 = [v20 objectForKeyedSubscript:NSFontAttributeName];
      v34 = v33;
      if (v33)
      {
        v35 = [v33 fontDescriptor];
        objc_super v36 = [v35 fontDescriptorWithSymbolicTraits:1];
        v40 = v12;
        v37 = v13;
        [v34 pointSize];
        v38 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v36);
        [v20 setObject:v38 forKeyedSubscript:NSFontAttributeName];

        id v13 = v37;
        v12 = v40;
      }
      if ((a3 & 8) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  v28 = [v20 objectForKeyedSubscript:NSFontAttributeName];
  id v29 = v28;
  if (v28)
  {
    [v28 fontDescriptor];
    id v30 = v39 = v13;
    v31 = [v30 fontDescriptorWithSymbolicTraits:2];
    [v29 pointSize];
    v32 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v31);
    [v20 setObject:v32 forKeyedSubscript:NSFontAttributeName];

    id v13 = v39;
  }

  if ((a3 & 2) != 0) {
    goto LABEL_29;
  }
LABEL_19:
  if ((a3 & 8) != 0) {
LABEL_20:
  }
    [v20 setObject:&off_2663F8 forKeyedSubscript:NSStrikethroughStyleAttributeName];
LABEL_21:
  v23 = (NSDictionary *)[v20 copy];
  attributes = self->_attributes;
  self->_attributes = v23;

  v12[2](v12);
LABEL_22:
  v25 = self->_attributes;
  self->_attributes = v13;
  v26 = v13;

  *(_OWORD *)&self->_style = v42;
  color = self->_color;
  self->_color = v41;
}

- (_NSRange)appendWithBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  v5 = [(NSMutableAttributedString *)self->_attributedString length];
  if (v4) {
    v4[2](v4);
  }
  uint64_t v6 = (char *)((unsigned char *)[(NSMutableAttributedString *)self->_attributedString length] - v5);

  NSUInteger v7 = (NSUInteger)v5;
  NSUInteger v8 = (NSUInteger)v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (id)finalizeTextModelWithContext:(id)a3
{
  id v3 = [(NSMutableAttributedString *)self->_attributedString copy];

  return v3;
}

- (void)addImageModel:(id)a3 forRole:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  NSUInteger v7 = v6;
  if (!v6 || [v6 isEqualToString:@"content"])
  {
    NSUInteger v8 = [v12 image];
    id v9 = +[NSTextAttachment textAttachmentWithImage:v8];
    attributedString = self->_attributedString;
    id v11 = +[NSAttributedString attributedStringWithAttachment:v9];
    [(NSMutableAttributedString *)attributedString appendAttributedString:v11];

    if (self->_color && [v8 isSymbolImage]) {
      -[NSMutableAttributedString addAttribute:value:range:](self->_attributedString, "addAttribute:value:range:", NSForegroundColorAttributeName, self->_color, (char *)[(NSMutableAttributedString *)self->_attributedString length] - 1, 1);
    }
  }
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  return 0;
}

- (id)finalizeAnimationGroups
{
  return 0;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
}

- (TUIFontSpec)fontSpec
{
  return self->_fontSpec;
}

- (void)setFontSpec:(id)a3
{
}

- (NSMutableAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (unint64_t)caps
{
  return self->_caps;
}

- (void)setCaps:(unint64_t)a3
{
  self->_unint64_t caps = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_fontSpec, 0);

  objc_storeStrong((id *)&self->_axActions, 0);
}

@end