@interface UITextFormattingViewControllerFormattingDescriptor
+ (BOOL)_canToggleTrait:(unsigned int)a3 forFont:(id)a4 inText:(id)a5;
+ (BOOL)supportsSecureCoding;
- (BOOL)_canToggleBold;
- (BOOL)_canToggleItalic;
- (BOOL)isEqual:(id)a3;
- (BOOL)strikethroughPresent;
- (BOOL)underlinePresent;
- (NSArray)fonts;
- (NSArray)textColors;
- (NSParagraphStyle)_paragraphStyle;
- (NSSet)_customComponentKeys;
- (NSSet)highlights;
- (NSSet)textAlignments;
- (NSSet)textLists;
- (NSString)_emphasisStyleKey;
- (NSString)formattingStyleKey;
- (UITextFormattingViewControllerFormattingDescriptor)init;
- (UITextFormattingViewControllerFormattingDescriptor)initWithAttributes:(id)a3;
- (UITextFormattingViewControllerFormattingDescriptor)initWithCoder:(id)a3;
- (UITextFormattingViewControllerFormattingDescriptor)initWithString:(id)a3 range:(_NSRange)a4;
- (double)lineHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)listStyle;
- (int64_t)strikethrough;
- (int64_t)underline;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFonts:(id)a3;
- (void)setFormattingStyleKey:(id)a3;
- (void)setHighlights:(id)a3;
- (void)setLineHeight:(double)a3;
- (void)setListStyle:(int64_t)a3;
- (void)setStrikethrough:(int64_t)a3;
- (void)setStrikethroughPresent:(BOOL)a3;
- (void)setTextAlignments:(id)a3;
- (void)setTextColors:(id)a3;
- (void)setTextLists:(id)a3;
- (void)setUnderline:(int64_t)a3;
- (void)setUnderlinePresent:(BOOL)a3;
- (void)set_canToggleBold:(BOOL)a3;
- (void)set_canToggleItalic:(BOOL)a3;
- (void)set_customComponentKeys:(id)a3;
- (void)set_emphasisStyleKey:(id)a3;
- (void)set_paragraphStyle:(id)a3;
@end

@implementation UITextFormattingViewControllerFormattingDescriptor

+ (BOOL)_canToggleTrait:(unsigned int)a3 forFont:(id)a4 inText:(id)a5
{
  unint64_t v7 = sub_186A1E95C();
  uint64_t v9 = v8;
  id v10 = a4;
  LOBYTE(a3) = sub_185A3EDCC(a3, v7, v9);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (UITextFormattingViewControllerFormattingDescriptor)init
{
  v10.receiver = self;
  v10.super_class = (Class)UITextFormattingViewControllerFormattingDescriptor;
  v2 = [(UITextFormattingViewControllerFormattingDescriptor *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    textAlignments = v2->_textAlignments;
    v2->_textAlignments = (NSSet *)v3;

    uint64_t v5 = objc_opt_new();
    textLists = v2->_textLists;
    v2->_textLists = (NSSet *)v5;

    uint64_t v7 = objc_opt_new();
    highlights = v2->_highlights;
    v2->_highlights = (NSSet *)v7;

    v2->__blockquote = 0;
    v2->_strikethrough = 0;
    v2->_listStyle = 0;
    v2->_underline = 0;
    *(_WORD *)&v2->__canToggleBold = 257;
  }
  return v2;
}

- (UITextFormattingViewControllerFormattingDescriptor)initWithString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (location + length <= [v7 length])
  {
    uint64_t v9 = [v7 attributesAtIndex:location effectiveRange:0];
    objc_super v10 = (void *)[v9 mutableCopy];

    v11 = objc_opt_new();
    v12 = objc_opt_new();
    v13 = objc_opt_new();
    v14 = objc_opt_new();
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = __Block_byref_object_copy__102;
    v35[4] = __Block_byref_object_dispose__102;
    id v36 = 0;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __75__UITextFormattingViewControllerFormattingDescriptor_initWithString_range___block_invoke;
    v28[3] = &unk_1E52F0A78;
    id v15 = v11;
    id v29 = v15;
    id v16 = v12;
    id v30 = v16;
    v34 = v35;
    id v27 = v13;
    id v31 = v27;
    id v26 = v14;
    id v32 = v26;
    id v17 = v10;
    id v33 = v17;
    objc_msgSend(v7, "enumerateAttributesInRange:options:usingBlock:", location, length, 0, v28);
    if ((unint64_t)[v15 count] >= 2) {
      [v17 setValue:v15 forKey:*(void *)off_1E52D2040];
    }
    if ((unint64_t)[v16 count] >= 2) {
      [v17 setValue:v16 forKey:*(void *)off_1E52D21B8];
    }
    if ((unint64_t)[v27 count] >= 2) {
      [v17 setValue:v27 forKey:*(void *)off_1E52D2298];
    }
    if ((unint64_t)[v26 count] >= 2) {
      [v17 setValue:v26 forKey:*(void *)off_1E52D22D8];
    }
    v18 = [(UITextFormattingViewControllerFormattingDescriptor *)self initWithAttributes:v17];
    if ([v15 count])
    {
      id v25 = v16;
      v19 = [v15 firstObject];
      v20 = [v7 string];
      v21 = objc_msgSend(v20, "substringWithRange:", location, length);
      [(UITextFormattingViewControllerFormattingDescriptor *)v18 set_canToggleBold:+[UITextFormattingViewControllerFormattingDescriptor _canToggleTrait:2 forFont:v19 inText:v21]];

      v22 = [v7 string];
      v23 = objc_msgSend(v22, "substringWithRange:", location, length);
      [(UITextFormattingViewControllerFormattingDescriptor *)v18 set_canToggleItalic:+[UITextFormattingViewControllerFormattingDescriptor _canToggleTrait:1 forFont:v19 inText:v23]];

      id v16 = v25;
    }
    uint64_t v8 = v18;

    _Block_object_dispose(v35, 8);
  }
  else
  {
    uint64_t v8 = [(UITextFormattingViewControllerFormattingDescriptor *)self initWithAttributes:MEMORY[0x1E4F1CC08]];
  }

  return v8;
}

void __75__UITextFormattingViewControllerFormattingDescriptor_initWithString_range___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = [v22 objectForKeyedSubscript:*(void *)off_1E52D21A0];
  if (v3
    || ([v22 objectForKeyedSubscript:*(void *)off_1E52D2040],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
  v4 = [v22 objectForKeyedSubscript:*(void *)off_1E52D21B8];
  if (v4) {
    [*(id *)(a1 + 40) addObject:v4];
  }
  uint64_t v5 = [v22 objectForKeyedSubscript:*(void *)off_1E52D2298];
  if (v5)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v6
      || ([NSNumber numberWithBool:objc_opt_respondsToSelector() & 1],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8),
          uint64_t v9 = *(void **)(v8 + 40),
          *(void *)(v8 + 40) = v7,
          v9,
          (v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) != 0))
    {
      if ([v6 BOOLValue])
      {
        objc_super v10 = [v5 performSelector:sel_name];
        if (v10) {
          [*(id *)(a1 + 48) addObject:v10];
        }
      }
    }
  }
  v11 = [v22 objectForKeyedSubscript:*(void *)off_1E52D22D8];
  if (v11) {
    [*(id *)(a1 + 56) addObject:v11];
  }
  uint64_t v12 = *(void *)off_1E52D23E8;
  v13 = [v22 objectForKeyedSubscript:*(void *)off_1E52D23E8];

  if (v13)
  {
    v14 = [*(id *)(a1 + 64) valueForKey:v12];

    if (!v14)
    {
      id v15 = *(void **)(a1 + 64);
      id v16 = [NSNumber numberWithInteger:v13];
      [v15 setValue:v16 forKey:v12];
    }
  }
  uint64_t v17 = *(void *)off_1E52D2250;
  v18 = [v22 objectForKeyedSubscript:*(void *)off_1E52D2250];

  if (v18)
  {
    v19 = [*(id *)(a1 + 64) valueForKey:v17];

    if (!v19)
    {
      v20 = *(void **)(a1 + 64);
      v21 = [NSNumber numberWithInteger:v18];
      [v20 setValue:v21 forKey:v17];
    }
  }
}

- (UITextFormattingViewControllerFormattingDescriptor)initWithAttributes:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UITextFormattingViewControllerFormattingDescriptor *)self init];
  if (!v5) {
    goto LABEL_40;
  }
  v6 = [v4 objectForKey:*(void *)off_1E52D2040];
  uint64_t v7 = [v4 objectForKey:*(void *)off_1E52D21A0];
  v44 = (void *)v7;
  if (v7)
  {
    v59[0] = v7;
    uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v9 = (void **)v59;
LABEL_4:
    uint64_t v10 = [v8 arrayWithObjects:v9 count:1];
    fonts = v5->_fonts;
    v5->_fonts = (NSArray *)v10;

    goto LABEL_5;
  }
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)&v5->_fonts, v6);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v58 = v6;
        uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v9 = &v58;
        goto LABEL_4;
      }
    }
  }
LABEL_5:
  uint64_t v12 = [v4 objectForKey:*(void *)off_1E52D2048];
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v57 = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    textColors = v5->_textColors;
    v5->_textColors = (NSArray *)v14;
  }
  id v16 = objc_msgSend(v4, "objectForKey:", *(void *)off_1E52D21B8, v13);
  v45 = v6;
  if (!v16) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v16 count])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v56 = v16;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
      if (!v17) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
LABEL_16:
    id v17 = 0;
    goto LABEL_17;
  }
  id v17 = v16;
LABEL_13:
  v18 = [v17 objectAtIndexedSubscript:0];
  objc_storeStrong((id *)&v5->__paragraphStyle, v18);
  [v18 minimumLineHeight];
  if (v19 > 0.0)
  {
    [v18 minimumLineHeight];
    v5->_lineHeight = v20;
  }
  v21 = objc_opt_new();
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke;
  v54[3] = &unk_1E52F0AA0;
  id v55 = v21;
  id v22 = v21;
  [v17 enumerateObjectsUsingBlock:v54];
  [(UITextFormattingViewControllerFormattingDescriptor *)v5 setTextAlignments:v22];
  v23 = objc_opt_new();
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_2;
  v52[3] = &unk_1E52F0AA0;
  id v53 = v23;
  id v24 = v23;
  [v17 enumerateObjectsUsingBlock:v52];
  id v25 = objc_opt_new();
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_3;
  v50[3] = &unk_1E52F0AC8;
  id v51 = v25;
  id v26 = v25;
  [v24 enumerateObjectsUsingBlock:v50];
  [(UITextFormattingViewControllerFormattingDescriptor *)v5 setTextLists:v26];

LABEL_17:
  id v27 = [v4 objectForKey:*(void *)off_1E52D23E8];
  v5->_underlinePresent = [v27 BOOLValue];

  v28 = [v4 objectForKey:*(void *)off_1E52D2250];
  v5->_strikethroughPresent = [v28 BOOLValue];

  v5->__blockquote = 0;
  id v29 = [MEMORY[0x1E4F1CA80] set];
  id v30 = [v4 objectForKey:*(void *)off_1E52D2298];
  if (v30)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_4;
      v48[3] = &unk_1E52E0B30;
      id v49 = v29;
      [v30 enumerateObjectsUsingBlock:v48];
      id v31 = v49;
    }
    else
    {
      id v31 = v30;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v32 = [v31 performSelector:sel_name];
        id v33 = (void *)v32;
        if (v32)
        {
          v34 = _UITextFormattingViewControllerComponentKeyForAnimation(v32);
          [v29 addObject:v34];
        }
      }
    }
  }
  if ([v29 count])
  {
    uint64_t v35 = [v29 copy];
    customComponentKeys = v5->__customComponentKeys;
    v5->__customComponentKeys = (NSSet *)v35;
  }
  v37 = [v4 objectForKey:*(void *)off_1E52D22D8];
  v38 = objc_opt_new();
  if (!v37) {
    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_5;
    v46[3] = &unk_1E52E0B30;
    id v47 = v38;
    [v37 enumerateObjectsUsingBlock:v46];
    v39 = v47;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_36;
    }
    v39 = _UITextFormattingViewControllerHighlightFromColorScheme(v37);
    [v38 addObject:v39];
  }

LABEL_36:
  [(UITextFormattingViewControllerFormattingDescriptor *)v5 setHighlights:v38];
  v40 = [v4 objectForKey:*(void *)off_1E52D2318];
  if (![(NSSet *)v5->_highlights count] && v40)
  {
    v41 = [MEMORY[0x1E4F1CAD0] setWithObject:@"UITextFormattingViewControllerHighlightDefault"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setHighlights:v41];
  }
LABEL_40:

  return v5;
}

uint64_t __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 alignment];
  if (v3 > 4) {
    id v4 = 0;
  }
  else {
    id v4 = off_1E52F0AE8[v3];
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 addObject:v4];
}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 textLists];
  [v2 addObjectsFromArray:v3];
}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 markerFormat];
  int v4 = [v3 isEqualToString:*(void *)off_1E52D2330];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = @"UITextFormattingViewControllerTextListDisc";
    goto LABEL_7;
  }
  uint64_t v7 = [v12 markerFormat];
  if ([v7 isEqualToString:*(void *)off_1E52D2328])
  {

LABEL_6:
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = @"UITextFormattingViewControllerTextListDecimal";
    goto LABEL_7;
  }
  uint64_t v8 = [v12 markerFormat];
  int v9 = [v8 isEqualToString:@"{decimal}."];

  if (v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [v12 markerFormat];
  int v11 = [v10 isEqualToString:*(void *)off_1E52D2338];

  uint64_t v5 = *(void **)(a1 + 32);
  if (v11) {
    v6 = @"UITextFormattingViewControllerTextListHyphen";
  }
  else {
    v6 = @"UITextFormattingViewControllerTextListOther";
  }
LABEL_7:
  [v5 addObject:v6];
}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_4(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  _UITextFormattingViewControllerComponentKeyForAnimation(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __73__UITextFormattingViewControllerFormattingDescriptor_initWithAttributes___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  _UITextFormattingViewControllerHighlightFromColorScheme(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(UITextFormattingViewControllerFormattingDescriptor *)self formattingStyleKey];
  [v4 setFormattingStyleKey:v5];

  v6 = [(UITextFormattingViewControllerFormattingDescriptor *)self fonts];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = (void *)v4[6];
  v4[6] = v7;

  int v9 = [(UITextFormattingViewControllerFormattingDescriptor *)self textColors];
  uint64_t v10 = [v9 copy];
  int v11 = (void *)v4[7];
  v4[7] = v10;

  [(UITextFormattingViewControllerFormattingDescriptor *)self lineHeight];
  v4[8] = v12;
  objc_msgSend(v4, "setUnderline:", -[UITextFormattingViewControllerFormattingDescriptor underline](self, "underline"));
  objc_msgSend(v4, "setUnderlinePresent:", -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent"));
  objc_msgSend(v4, "setStrikethrough:", -[UITextFormattingViewControllerFormattingDescriptor strikethrough](self, "strikethrough"));
  objc_msgSend(v4, "setStrikethroughPresent:", -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent"));
  uint64_t v13 = [(UITextFormattingViewControllerFormattingDescriptor *)self textAlignments];
  [v4 setTextAlignments:v13];

  objc_msgSend(v4, "setListStyle:", -[UITextFormattingViewControllerFormattingDescriptor listStyle](self, "listStyle"));
  uint64_t v14 = [(UITextFormattingViewControllerFormattingDescriptor *)self textLists];
  [v4 setTextLists:v14];

  id v15 = [(UITextFormattingViewControllerFormattingDescriptor *)self highlights];
  [v4 setHighlights:v15];

  id v16 = [(UITextFormattingViewControllerFormattingDescriptor *)self _paragraphStyle];
  objc_msgSend(v4, "set_paragraphStyle:", v16);

  id v17 = [(UITextFormattingViewControllerFormattingDescriptor *)self _customComponentKeys];
  v18 = (void *)[v17 copy];
  objc_msgSend(v4, "set_customComponentKeys:", v18);

  double v19 = [(UITextFormattingViewControllerFormattingDescriptor *)self _emphasisStyleKey];
  objc_msgSend(v4, "set_emphasisStyleKey:", v19);

  objc_msgSend(v4, "set_blockquote:", -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote"));
  objc_msgSend(v4, "set_canToggleBold:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold"));
  objc_msgSend(v4, "set_canToggleItalic:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (UITextFormattingViewControllerFormattingDescriptor *)a3;
  if (self == v4)
  {
    LOBYTE(v17) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v6 = [(UITextFormattingViewControllerFormattingDescriptor *)self formattingStyleKey];
      uint64_t v7 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 formattingStyleKey];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(UITextFormattingViewControllerFormattingDescriptor *)self fonts];
        int v9 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 fonts];
        if ([v8 isEqualToArray:v9])
        {
          uint64_t v10 = [(UITextFormattingViewControllerFormattingDescriptor *)self textColors];
          int v11 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 textColors];
          if ([v10 isEqualToArray:v11]
            && ([(UITextFormattingViewControllerFormattingDescriptor *)self lineHeight],
                double v13 = v12,
                [(UITextFormattingViewControllerFormattingDescriptor *)v5 lineHeight],
                v13 == v14)
            && (BOOL v15 = [(UITextFormattingViewControllerFormattingDescriptor *)self underlinePresent],
                v15 == [(UITextFormattingViewControllerFormattingDescriptor *)v5 underlinePresent])
            && (BOOL v16 = [(UITextFormattingViewControllerFormattingDescriptor *)self strikethroughPresent], v16 == [(UITextFormattingViewControllerFormattingDescriptor *)v5 strikethroughPresent]))
          {
            double v19 = [(UITextFormattingViewControllerFormattingDescriptor *)self textAlignments];
            v37 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 textAlignments];
            v38 = v19;
            if ([v19 isEqualToSet:v37])
            {
              double v20 = [(UITextFormattingViewControllerFormattingDescriptor *)self textLists];
              uint64_t v35 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 textLists];
              id v36 = v20;
              if ([v20 isEqualToSet:v35])
              {
                v21 = [(UITextFormattingViewControllerFormattingDescriptor *)self highlights];
                id v33 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 highlights];
                v34 = v21;
                if ([v21 isEqualToSet:v33])
                {
                  id v22 = [(UITextFormattingViewControllerFormattingDescriptor *)self _customComponentKeys];
                  id v31 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 _customComponentKeys];
                  uint64_t v32 = v22;
                  if ([v22 isEqualToSet:v31])
                  {
                    uint64_t v23 = [(UITextFormattingViewControllerFormattingDescriptor *)self _emphasisStyleKey];
                    uint64_t v24 = [(UITextFormattingViewControllerFormattingDescriptor *)v5 _emphasisStyleKey];
                    id v30 = (void *)v23;
                    id v25 = (void *)v23;
                    id v26 = (void *)v24;
                    if ([v25 isEqualToString:v24]
                      && (int64_t v28 = [(UITextFormattingViewControllerFormattingDescriptor *)self _blockquote],
                          v28 == [(UITextFormattingViewControllerFormattingDescriptor *)v5 _blockquote])
                      && (BOOL v29 = [(UITextFormattingViewControllerFormattingDescriptor *)self _canToggleBold], v29 == [(UITextFormattingViewControllerFormattingDescriptor *)v5 _canToggleBold]))
                    {
                      BOOL v27 = [(UITextFormattingViewControllerFormattingDescriptor *)self _canToggleItalic];
                      BOOL v17 = v27 ^ [(UITextFormattingViewControllerFormattingDescriptor *)v5 _canToggleItalic] ^ 1;
                    }
                    else
                    {
                      LOBYTE(v17) = 0;
                    }
                  }
                  else
                  {
                    LOBYTE(v17) = 0;
                  }
                }
                else
                {
                  LOBYTE(v17) = 0;
                }
              }
              else
              {
                LOBYTE(v17) = 0;
              }
            }
            else
            {
              LOBYTE(v17) = 0;
            }
          }
          else
          {
            LOBYTE(v17) = 0;
          }
        }
        else
        {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return v17;
}

- (unint64_t)hash
{
  BOOL v29 = [(UITextFormattingViewControllerFormattingDescriptor *)self formattingStyleKey];
  uint64_t v25 = [v29 hash];
  int64_t v28 = [(UITextFormattingViewControllerFormattingDescriptor *)self fonts];
  uint64_t v24 = [v28 hash];
  BOOL v27 = [(UITextFormattingViewControllerFormattingDescriptor *)self textColors];
  uint64_t v23 = [v27 hash];
  id v3 = NSNumber;
  [(UITextFormattingViewControllerFormattingDescriptor *)self lineHeight];
  id v26 = objc_msgSend(v3, "numberWithDouble:");
  uint64_t v21 = [v26 hash];
  uint64_t v19 = [(UITextFormattingViewControllerFormattingDescriptor *)self underlinePresent];
  uint64_t v18 = [(UITextFormattingViewControllerFormattingDescriptor *)self strikethroughPresent];
  id v22 = [(UITextFormattingViewControllerFormattingDescriptor *)self textAlignments];
  uint64_t v17 = [v22 hash];
  double v20 = [(UITextFormattingViewControllerFormattingDescriptor *)self textLists];
  uint64_t v16 = [v20 hash];
  int v4 = [(UITextFormattingViewControllerFormattingDescriptor *)self highlights];
  uint64_t v15 = [v4 hash];
  uint64_t v5 = [(UITextFormattingViewControllerFormattingDescriptor *)self _paragraphStyle];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [(UITextFormattingViewControllerFormattingDescriptor *)self _customComponentKeys];
  uint64_t v8 = [v7 hash];
  int v9 = [(UITextFormattingViewControllerFormattingDescriptor *)self _emphasisStyleKey];
  uint64_t v10 = [v9 hash];
  int64_t v11 = [(UITextFormattingViewControllerFormattingDescriptor *)self _blockquote];
  uint64_t v12 = [(UITextFormattingViewControllerFormattingDescriptor *)self _canToggleBold];
  unint64_t v13 = v25 ^ v24 ^ v23 ^ v19 ^ v18 ^ v17 ^ v21 ^ v16 ^ v15 ^ v6 ^ v8 ^ v10 ^ v11 ^ v12 ^ [(UITextFormattingViewControllerFormattingDescriptor *)self _canToggleItalic] ^ 1;

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  int v4 = [(UITextFormattingViewControllerFormattingDescriptor *)self formattingStyleKey];
  [v14 encodeObject:v4 forKey:@"_FormattingStyleKey"];

  uint64_t v5 = [(UITextFormattingViewControllerFormattingDescriptor *)self fonts];
  [v14 encodeObject:v5 forKey:@"_Fonts"];

  uint64_t v6 = [(UITextFormattingViewControllerFormattingDescriptor *)self textColors];
  [v14 encodeObject:v6 forKey:@"_TextColors"];

  [(UITextFormattingViewControllerFormattingDescriptor *)self lineHeight];
  *(float *)&double v7 = v7;
  [v14 encodeFloat:@"_LineHeight" forKey:v7];
  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor underline](self, "underline"), @"Underline");
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor underlinePresent](self, "underlinePresent"), @"_UnderlinePresent");
  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor strikethrough](self, "strikethrough"), @"_Strikethrough");
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor strikethroughPresent](self, "strikethroughPresent"), @"_StrikethroughPresent");
  uint64_t v8 = [(UITextFormattingViewControllerFormattingDescriptor *)self textAlignments];
  [v14 encodeObject:v8 forKey:@"_TextAlignments"];

  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor listStyle](self, "listStyle"), @"_ListStyle");
  int v9 = [(UITextFormattingViewControllerFormattingDescriptor *)self textLists];
  [v14 encodeObject:v9 forKey:@"_TextLists"];

  uint64_t v10 = [(UITextFormattingViewControllerFormattingDescriptor *)self highlights];
  [v14 encodeObject:v10 forKey:@"_Highlights"];

  int64_t v11 = [(UITextFormattingViewControllerFormattingDescriptor *)self _paragraphStyle];
  [v14 encodeInteger:v11 forKey:@"_ParagraphStyle"];

  uint64_t v12 = [(UITextFormattingViewControllerFormattingDescriptor *)self _customComponentKeys];
  [v14 encodeObject:v12 forKey:@"_CustomComponentKeys"];

  unint64_t v13 = [(UITextFormattingViewControllerFormattingDescriptor *)self _emphasisStyleKey];
  [v14 encodeObject:v13 forKey:@"_EmphasisStyleKey"];

  objc_msgSend(v14, "encodeInteger:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _blockquote](self, "_blockquote"), @"_Blockquote");
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleBold](self, "_canToggleBold"), @"_CanToggleBold");
  objc_msgSend(v14, "encodeBool:forKey:", -[UITextFormattingViewControllerFormattingDescriptor _canToggleItalic](self, "_canToggleItalic"), @"_CanToggleItalic");
}

- (UITextFormattingViewControllerFormattingDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UITextFormattingViewControllerFormattingDescriptor *)self init];
  if (v5)
  {
    uint64_t v6 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    double v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_FormattingStyleKey"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setFormattingStyleKey:v7];

    uint64_t v8 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    int v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_Fonts"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setFonts:v9];

    uint64_t v10 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    int64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_TextColors"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setTextColors:v11];

    [v4 decodeFloatForKey:@"_LineHeight"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setLineHeight:v12];
    -[UITextFormattingViewControllerFormattingDescriptor setUnderline:](v5, "setUnderline:", [v4 decodeIntegerForKey:@"Underline"]);
    -[UITextFormattingViewControllerFormattingDescriptor setUnderlinePresent:](v5, "setUnderlinePresent:", [v4 decodeBoolForKey:@"_UnderlinePresent"]);
    -[UITextFormattingViewControllerFormattingDescriptor setStrikethrough:](v5, "setStrikethrough:", [v4 decodeIntegerForKey:@"_Strikethrough"]);
    -[UITextFormattingViewControllerFormattingDescriptor setStrikethroughPresent:](v5, "setStrikethroughPresent:", [v4 decodeBoolForKey:@"_StrikethroughPresent"]);
    unint64_t v13 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_TextAlignments"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setTextAlignments:v14];

    -[UITextFormattingViewControllerFormattingDescriptor setListStyle:](v5, "setListStyle:", [v4 decodeIntegerForKey:@"_ListStyle"]);
    uint64_t v15 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"_TextLists"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setTextLists:v16];

    uint64_t v17 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"_Highlights"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 setHighlights:v18];

    uint64_t v19 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    double v20 = [v4 decodeObjectOfClasses:v19 forKey:@"_ParagraphStyle"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 set_paragraphStyle:v20];

    uint64_t v21 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    id v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_CustomComponentKeys"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 set_customComponentKeys:v22];

    uint64_t v23 = _UITextFormattingViewControllerFormattingDescriptorClasses();
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"_EmphasisStyleKey"];
    [(UITextFormattingViewControllerFormattingDescriptor *)v5 set_emphasisStyleKey:v24];

    -[UITextFormattingViewControllerFormattingDescriptor set_blockquote:](v5, "set_blockquote:", [v4 decodeIntegerForKey:@"_Blockquote"]);
    -[UITextFormattingViewControllerFormattingDescriptor set_canToggleBold:](v5, "set_canToggleBold:", [v4 decodeBoolForKey:@"_CanToggleBold"]);
    -[UITextFormattingViewControllerFormattingDescriptor set_canToggleItalic:](v5, "set_canToggleItalic:", [v4 decodeBoolForKey:@"_CanToggleItalic"]);
  }

  return v5;
}

- (void)setUnderline:(int64_t)a3
{
  self->_underlinePresent = a3 != 0;
  self->_underline = a3;
}

- (void)setStrikethrough:(int64_t)a3
{
  self->_strikethroughPresent = a3 != 0;
  self->_strikethrough = a3;
}

- (void)setListStyle:(int64_t)a3
{
  if (a3 > 2)
  {
    if (a3 == 3)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = @"UITextFormattingViewControllerTextListDecimal";
      goto LABEL_11;
    }
    if (a3 == 98)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = @"UITextFormattingViewControllerTextListOther";
      goto LABEL_11;
    }
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = @"UITextFormattingViewControllerTextListDisc";
      goto LABEL_11;
    }
    if (a3 == 2)
    {
      uint64_t v5 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = @"UITextFormattingViewControllerTextListHyphen";
LABEL_11:
      double v7 = [v5 setWithObject:v6];
      goto LABEL_12;
    }
  }
  double v7 = (NSSet *)objc_opt_new();
LABEL_12:
  textLists = self->_textLists;
  self->_textLists = v7;

  self->_listStyle = a3;
}

- (int64_t)underline
{
  return self->_underline;
}

- (int64_t)strikethrough
{
  return self->_strikethrough;
}

- (int64_t)listStyle
{
  return self->_listStyle;
}

- (NSArray)fonts
{
  return self->_fonts;
}

- (void)setFonts:(id)a3
{
}

- (NSArray)textColors
{
  return self->_textColors;
}

- (void)setTextColors:(id)a3
{
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(double)a3
{
  self->_lineHeight = a3;
}

- (BOOL)underlinePresent
{
  return self->_underlinePresent;
}

- (void)setUnderlinePresent:(BOOL)a3
{
  self->_underlinePresent = a3;
}

- (BOOL)strikethroughPresent
{
  return self->_strikethroughPresent;
}

- (void)setStrikethroughPresent:(BOOL)a3
{
  self->_strikethroughPresent = a3;
}

- (NSSet)textAlignments
{
  return self->_textAlignments;
}

- (void)setTextAlignments:(id)a3
{
}

- (NSSet)textLists
{
  return self->_textLists;
}

- (void)setTextLists:(id)a3
{
}

- (NSSet)highlights
{
  return self->_highlights;
}

- (void)setHighlights:(id)a3
{
}

- (NSString)formattingStyleKey
{
  return self->_formattingStyleKey;
}

- (void)setFormattingStyleKey:(id)a3
{
}

- (NSParagraphStyle)_paragraphStyle
{
  return self->__paragraphStyle;
}

- (void)set_paragraphStyle:(id)a3
{
}

- (NSSet)_customComponentKeys
{
  return self->__customComponentKeys;
}

- (void)set_customComponentKeys:(id)a3
{
}

- (NSString)_emphasisStyleKey
{
  return self->__emphasisStyleKey;
}

- (void)set_emphasisStyleKey:(id)a3
{
}

- (BOOL)_canToggleBold
{
  return self->__canToggleBold;
}

- (void)set_canToggleBold:(BOOL)a3
{
  self->__canToggleBold = a3;
}

- (BOOL)_canToggleItalic
{
  return self->__canToggleItalic;
}

- (void)set_canToggleItalic:(BOOL)a3
{
  self->__canToggleItalic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__emphasisStyleKey, 0);
  objc_storeStrong((id *)&self->__customComponentKeys, 0);
  objc_storeStrong((id *)&self->__paragraphStyle, 0);
  objc_storeStrong((id *)&self->_formattingStyleKey, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_storeStrong((id *)&self->_textLists, 0);
  objc_storeStrong((id *)&self->_textAlignments, 0);
  objc_storeStrong((id *)&self->_textColors, 0);
  objc_storeStrong((id *)&self->_fonts, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end