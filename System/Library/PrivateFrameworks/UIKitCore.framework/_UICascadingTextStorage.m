@interface _UICascadingTextStorage
+ (id)defaultFont;
- (BOOL)_shouldSetOriginalFontAttribute;
- (CGSize)shadowOffset;
- (UIColor)shadowColor;
- (UIColor)textColor;
- (UIFont)font;
- (_UICascadingTextStorage)init;
- (_UICascadingTextStorage)initWithDefaults:(id)a3;
- (_UITextAttributeDefaults)_defaults;
- (double)shadowBlur;
- (id)_defaultAttributes;
- (id)_shadow;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (int64_t)_ui_resolvedTextAlignment;
- (int64_t)defaultBaseWritingDirection;
- (int64_t)lineBreakMode;
- (int64_t)textAlignment;
- (void)_restoreOriginalFontAttribute;
- (void)_setDefaults:(id)a3;
- (void)_setShadow:(id)a3;
- (void)setDefaultAttributes:(id)a3;
- (void)setDefaultBaseWritingDirection:(int64_t)a3;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setShadowBlur:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation _UICascadingTextStorage

- (UIFont)font
{
  if (![(NSConcreteTextStorage *)self length])
  {
    uint64_t v4 = *(void *)off_1E52D2040;
LABEL_6:
    v5 = [(_UICascadingTextStorage *)self _defaultAttributes];
    v3 = [v5 objectForKey:v4];

    goto LABEL_7;
  }
  v3 = [(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D21A0 atIndex:0 effectiveRange:0];
  if (!v3)
  {
    uint64_t v4 = *(void *)off_1E52D2040;
    v3 = [(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D2040 atIndex:0 effectiveRange:0];
    if (!v3) {
      goto LABEL_6;
    }
  }
LABEL_7:
  return (UIFont *)v3;
}

- (id)_defaultAttributes
{
  defaultAttributes = self->_defaultAttributes;
  if (!defaultAttributes)
  {
    uint64_t v4 = [(id)objc_opt_class() _defaultAttributes];
    v5 = (NSMutableDictionary *)[v4 mutableCopy];
    v6 = self->_defaultAttributes;
    self->_defaultAttributes = v5;

    defaultAttributes = self->_defaultAttributes;
  }
  return defaultAttributes;
}

- (int64_t)_ui_resolvedTextAlignment
{
  v2 = self;
  uint64_t v3 = [(NSConcreteTextStorage *)v2 length];
  uint64_t v4 = *(void *)off_1E52D21B8;
  if (!v3
    || ([(_UICascadingTextStorage *)v2 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [(_UICascadingTextStorage *)v2 _defaultAttributes];
    v5 = [v6 objectForKey:v4];
  }
  int64_t v7 = [v5 alignment];
  if (!v5 || (uint64_t v8 = [v5 baseWritingDirection], v8 == -1)) {
    uint64_t v8 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:0];
  }
  if ((unint64_t)(v7 - 3) < 2) {
    int64_t v7 = 2 * (v8 == 1);
  }

  return v7;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UICascadingTextStorage;
  v9 = [(NSConcreteTextStorage *)&v14 attribute:v8 atIndex:a4 effectiveRange:a5];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(NSMutableDictionary *)self->_defaultAttributes objectForKey:v8];
  }
  v12 = v11;

  return v12;
}

- (double)shadowBlur
{
  v2 = [(_UICascadingTextStorage *)self _shadow];
  [v2 shadowBlurRadius];
  double v4 = v3;

  return v4;
}

- (id)_shadow
{
  unint64_t v3 = [(NSConcreteTextStorage *)self length];
  uint64_t v4 = *(void *)off_1E52D2238;
  if (!v3
    || ([(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D2238 atIndex:0 effectiveRange:0], (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [(_UICascadingTextStorage *)self _defaultAttributes];
    v5 = [v6 objectForKey:v4];
  }
  return v5;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(_UITextAttributeDefaults *)self->_defaults _font],
        (id v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    if ([(NSConcreteTextStorage *)self length])
    {
      id v6 = [(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D2040 atIndex:0 effectiveRange:&v19];
    }
    else
    {
      int64_t v7 = [(_UICascadingTextStorage *)self _defaultAttributes];
      id v6 = [v7 objectForKey:*(void *)off_1E52D2040];
    }
    if (v6 != v5 || (unint64_t v8 = v20, v8 < [(NSConcreteTextStorage *)self length]))
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46___UICascadingTextStorage_Accessors__setFont___block_invoke;
      v15[3] = &unk_1E52DEA78;
      v17 = self;
      SEL v18 = a2;
      id v16 = v5;
      [(_UICascadingTextStorage *)self coordinateEditing:v15];
    }
  }
  else
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v14 = [(_UICascadingTextStorage *)self font];
    id v11 = [v14 fontName];
    v12 = [(_UICascadingTextStorage *)self font];
    [v12 pointSize];
    NSLog(&cfstr_NilPassedToSet.isa, v9, v10, v11, v13);
  }
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UICascadingTextStorage;
  id v5 = [(NSConcreteTextStorage *)&v9 attributesAtIndex:a3 effectiveRange:a4];
  id v6 = [(_UICascadingTextStorage *)self defaultAttributes];
  int64_t v7 = (void *)[v6 mutableCopy];

  [v7 addEntriesFromDictionary:v5];
  return v7;
}

- (void)setDefaultAttributes:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___UICascadingTextStorage_setDefaultAttributes___block_invoke;
  v6[3] = &unk_1E52DEA50;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_UICascadingTextStorage *)self coordinateEditing:v6];
}

- (int64_t)textAlignment
{
  v2 = self;
  uint64_t v3 = [(NSConcreteTextStorage *)v2 length];
  uint64_t v4 = *(void *)off_1E52D21B8;
  if (!v3
    || ([(_UICascadingTextStorage *)v2 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v6 = [(_UICascadingTextStorage *)v2 _defaultAttributes];
    id v5 = [v6 objectForKey:v4];
  }
  int64_t v7 = [v5 alignment];

  return v7;
}

- (void)setTextAlignment:(int64_t)a3
{
  id v5 = self;
  uint64_t v6 = [(NSConcreteTextStorage *)v5 length];
  uint64_t v7 = *(void *)off_1E52D21B8;
  if (!v6
    || ([(_UICascadingTextStorage *)v5 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0], (unint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_super v9 = [(_UICascadingTextStorage *)v5 _defaultAttributes];
    unint64_t v8 = [v9 objectForKey:v7];
  }
  if ([v8 alignment] != a3)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
    [v10 setAlignment:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55___UICascadingTextStorage_Accessors__setTextAlignment___block_invoke;
    v12[3] = &unk_1E52DEA78;
    id v14 = v5;
    SEL v15 = a2;
    id v13 = v10;
    id v11 = v10;
    [(_UICascadingTextStorage *)v5 coordinateEditing:v12];
  }
}

- (UIColor)textColor
{
  unint64_t v3 = [(NSConcreteTextStorage *)self length];
  uint64_t v4 = *(void *)off_1E52D2048;
  if (!v3
    || ([(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D2048 atIndex:0 effectiveRange:0], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(_UICascadingTextStorage *)self _defaultAttributes];
    id v5 = [v6 objectForKey:v4];
  }
  return (UIColor *)v5;
}

- (void)setLineBreakMode:(int64_t)a3
{
  id v5 = self;
  uint64_t v6 = [(NSConcreteTextStorage *)v5 length];
  uint64_t v7 = *(void *)off_1E52D21B8;
  if (!v6
    || ([(_UICascadingTextStorage *)v5 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0], (unint64_t v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_super v9 = [(_UICascadingTextStorage *)v5 _defaultAttributes];
    unint64_t v8 = [v9 objectForKey:v7];
  }
  if ([v8 lineBreakMode] != a3)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
    [v10 setLineBreakMode:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55___UICascadingTextStorage_Accessors__setLineBreakMode___block_invoke;
    v12[3] = &unk_1E52DEA78;
    id v14 = v5;
    SEL v15 = a2;
    id v13 = v10;
    id v11 = v10;
    [(_UICascadingTextStorage *)v5 coordinateEditing:v12];
  }
}

- (int64_t)lineBreakMode
{
  v2 = self;
  uint64_t v3 = [(NSConcreteTextStorage *)v2 length];
  uint64_t v4 = *(void *)off_1E52D21B8;
  if (!v3
    || ([(_UICascadingTextStorage *)v2 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0], (id v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = [(_UICascadingTextStorage *)v2 _defaultAttributes];
    id v5 = [v6 objectForKey:v4];
  }
  int64_t v7 = [v5 lineBreakMode];

  return v7;
}

- (void)_restoreOriginalFontAttribute
{
}

- (void)setTextColor:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = [(_UITextAttributeDefaults *)self->_defaults _textColor];
    int64_t v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[UIColor labelColor];
    }
    id v5 = v8;
  }
  unint64_t v9 = [(NSConcreteTextStorage *)self length];
  uint64_t v24 = 0;
  unint64_t v25 = 0;
  if (v9)
  {
    unint64_t v10 = v9;
    uint64_t v11 = *(void *)off_1E52D2048;
    uint64_t v12 = -[_UICascadingTextStorage attribute:atIndex:longestEffectiveRange:inRange:](self, "attribute:atIndex:longestEffectiveRange:inRange:", *(void *)off_1E52D2048, 0, &v24, 0, v9);
    if ((id)v12 != v5 || v25 < v10) {
      goto LABEL_15;
    }
    id v14 = [(_UICascadingTextStorage *)self _defaultAttributes];
    id v15 = [v14 objectForKey:v11];

    id v16 = v5;
    if (v15 != v5)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke_2;
      v18[3] = &unk_1E52DEA50;
      v18[4] = self;
      id v16 = v5;
      id v19 = v16;
      [(_UICascadingTextStorage *)self coordinateEditing:v18];
    }
  }
  else
  {
    v17 = [(_UICascadingTextStorage *)self _defaultAttributes];
    uint64_t v12 = [v17 objectForKey:*(void *)off_1E52D2048];

    id v16 = v5;
    if ((id)v12 != v5)
    {
LABEL_15:
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51___UICascadingTextStorage_Accessors__setTextColor___block_invoke;
      v20[3] = &unk_1E52DEA78;
      v22 = self;
      SEL v23 = a2;
      id v21 = v5;
      [(_UICascadingTextStorage *)self coordinateEditing:v20];

      id v16 = (id)v12;
    }
  }
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UICascadingTextStorage;
  uint64_t v12 = -[NSConcreteTextStorage attribute:atIndex:longestEffectiveRange:inRange:](&v17, sel_attribute_atIndex_longestEffectiveRange_inRange_, v11, a4, a5, location, length);
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(NSMutableDictionary *)self->_defaultAttributes objectForKey:v11];
  }
  id v15 = v14;

  return v15;
}

- (_UICascadingTextStorage)init
{
  return [(_UICascadingTextStorage *)self initWithDefaults:0];
}

- (_UICascadingTextStorage)initWithDefaults:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UICascadingTextStorage;
  id v5 = [(NSConcreteTextStorage *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(_UICascadingTextStorage *)v5 _setDefaults:v4];
  }

  return v6;
}

- (void)_setDefaults:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    uint64_t v3 = +[_UITextAttributeDefaults _unspecifiedDefaults];
    id v5 = [v3 _textField];
  }
  objc_storeStrong((id *)&self->_defaults, v5);
  uint64_t v6 = v7;
  if (!v7)
  {

    uint64_t v6 = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  v10.receiver = self;
  v10.super_class = (Class)_UICascadingTextStorage;
  uint64_t v6 = -[NSConcreteTextStorage attributesAtIndex:longestEffectiveRange:inRange:](&v10, sel_attributesAtIndex_longestEffectiveRange_inRange_, a3, a4, a5.location, a5.length);
  id v7 = [(_UICascadingTextStorage *)self defaultAttributes];
  objc_super v8 = (void *)[v7 mutableCopy];

  [v8 addEntriesFromDictionary:v6];
  return v8;
}

- (void)setDefaultBaseWritingDirection:(int64_t)a3
{
  uint64_t v5 = *(void *)off_1E52D21B8;
  id v7 = [(NSMutableDictionary *)self->_defaultAttributes objectForKey:*(void *)off_1E52D21B8];
  if ([v7 baseWritingDirection] != a3)
  {
    uint64_t v6 = (void *)[v7 mutableCopy];
    [v6 setBaseWritingDirection:a3];
    [(NSMutableDictionary *)self->_defaultAttributes setObject:v6 forKeyedSubscript:v5];
  }
}

- (int64_t)defaultBaseWritingDirection
{
  v2 = [(NSMutableDictionary *)self->_defaultAttributes objectForKey:*(void *)off_1E52D21B8];
  int64_t v3 = [v2 baseWritingDirection];

  return v3;
}

+ (id)defaultFont
{
  [off_1E52D39B8 defaultFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (BOOL)_shouldSetOriginalFontAttribute
{
  return 1;
}

- (_UITextAttributeDefaults)_defaults
{
  return self->_defaults;
}

- (void)_setShadow:(id)a3
{
  id v5 = a3;
  uint64_t v12 = 0;
  unint64_t v13 = 0;
  if ([(NSConcreteTextStorage *)self length])
  {
    id v6 = [(_UICascadingTextStorage *)self attribute:*(void *)off_1E52D2238 atIndex:0 effectiveRange:&v12];
  }
  else
  {
    id v7 = [(_UICascadingTextStorage *)self _defaultAttributes];
    id v6 = [v7 objectForKey:*(void *)off_1E52D2238];
  }
  if (v6 != v5 || (unint64_t v8 = v13, v8 < [(NSConcreteTextStorage *)self length]))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49___UICascadingTextStorage_Accessors___setShadow___block_invoke;
    v9[3] = &unk_1E52DEA78;
    v9[4] = self;
    id v10 = v5;
    SEL v11 = a2;
    [(_UICascadingTextStorage *)self coordinateEditing:v9];
  }
}

- (void)setShadowColor:(id)a3
{
  id v7 = a3;
  id v4 = [(_UICascadingTextStorage *)self _shadow];
  id v5 = (void *)[v4 copy];

  id v6 = [v5 shadowColor];

  if (v6 != v7)
  {
    [v5 setShadowColor:v7];
    [(_UICascadingTextStorage *)self _setShadow:v5];
  }
}

- (UIColor)shadowColor
{
  v2 = [(_UICascadingTextStorage *)self _shadow];
  int64_t v3 = [v2 shadowColor];

  return (UIColor *)v3;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_UICascadingTextStorage *)self _shadow];
  id v10 = (id)[v6 copy];

  [v10 shadowOffset];
  if (v8 != width || v7 != height)
  {
    objc_msgSend(v10, "setShadowOffset:", width, height);
    [(_UICascadingTextStorage *)self _setShadow:v10];
  }
}

- (CGSize)shadowOffset
{
  v2 = [(_UICascadingTextStorage *)self _shadow];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setShadowBlur:(double)a3
{
  double v5 = [(_UICascadingTextStorage *)self _shadow];
  id v7 = (id)[v5 copy];

  [v7 shadowBlurRadius];
  if (v6 != a3)
  {
    [v7 setShadowBlurRadius:a3];
    [(_UICascadingTextStorage *)self _setShadow:v7];
  }
}

@end