@interface _UILabelSynthesizedContent
- (BOOL)disableLinkHypenation;
- (BOOL)eliminateShadows;
- (BOOL)hasExplicitBaselineOffset;
- (BOOL)isEqual:(id)a3;
- (BOOL)overallWritingDirectionFollowsLayoutDirection;
- (BOOL)reverseNaturalAlignment;
- (NSTextEncapsulation)textEncapsulation;
- (UIColor)overrideTextColor;
- (_UILabelContent)content;
- (id)_synthesizedAttributedString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopy;
- (id)synthesizedAttributedString;
- (id)synthesizedAttributes;
- (int64_t)semanticContentAttribute;
- (unint64_t)hash;
- (unint64_t)length;
- (void)_disablingHyphenationIfURLsDetectedInAttributedString:(id)a3;
- (void)_isolateStringWritingDirectionInAttributedString:(id)a3;
@end

@implementation _UILabelSynthesizedContent

- (BOOL)eliminateShadows
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)overallWritingDirectionFollowsLayoutDirection
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)disableLinkHypenation
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)reverseNaturalAlignment
{
  content = self->_content;
  uint64_t v3 = [(_UILabelSynthesizedContent *)self semanticContentAttribute];
  return _UILabelShouldReverseNaturalAlignment(content, v3);
}

- (BOOL)hasExplicitBaselineOffset
{
  id v3 = [(_UILabelSynthesizedContent *)self synthesizedAttributedString];
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (NSTextEncapsulation)textEncapsulation
{
  return self->_textEncapsulation;
}

- (unint64_t)length
{
  v2 = [(_UILabelSynthesizedContent *)self synthesizedAttributedString];
  unint64_t v3 = [v2 length];

  return v3;
}

- (id)synthesizedAttributes
{
  unint64_t v3 = objc_getAssociatedObject(self, &_MergedGlobals_1339);
  if (!v3)
  {
    v4 = [(_UILabelSynthesizedContent *)self overrideTextColor];
    BOOL v5 = [(_UILabelSynthesizedContent *)self eliminateShadows];
    BOOL v6 = [(_UILabelSynthesizedContent *)self reverseNaturalAlignment];
    BOOL v7 = v6;
    if (v4 || v5 || v6 || self->_textEncapsulation)
    {
      v8 = [(_UILabelContent *)self->_content defaultAttributes];
      v9 = (void *)[v8 mutableCopy];

      if (v4) {
        [v9 setObject:v4 forKeyedSubscript:*(void *)off_1E52D2048];
      }
      if (v5)
      {
        v10 = objc_opt_new();
        [v10 setShadowColor:0];
        [v9 setObject:0 forKeyedSubscript:*(void *)off_1E52D2238];
      }
      textEncapsulation = self->_textEncapsulation;
      if (textEncapsulation)
      {
        v12 = (void *)[(NSTextEncapsulation *)textEncapsulation copy];
        [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F24368]];
      }
      if (v7)
      {
        _UILabelReverseNaturalAlignment(v9);
        objc_claimAutoreleasedReturnValue();
      }
      unint64_t v3 = (void *)[v9 copy];
    }
    else
    {
      unint64_t v3 = [(_UILabelContent *)self->_content defaultAttributes];
    }
    objc_setAssociatedObject(self, &_MergedGlobals_1339, v3, (void *)1);
  }
  return v3;
}

- (id)synthesizedAttributedString
{
  unint64_t v3 = objc_getAssociatedObject(self, &unk_1EB265518);
  if (!v3)
  {
    unint64_t v3 = [(_UILabelSynthesizedContent *)self _synthesizedAttributedString];
    objc_setAssociatedObject(self, &unk_1EB265518, v3, (void *)0x301);
    if ([v3 length])
    {
      v4 = objc_msgSend(v3, "attribute:atIndex:longestEffectiveRange:inRange:", *(void *)off_1E52D1F60, 0, 0, 0, objc_msgSend(v3, "length"));
      *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | (8 * (v4 != 0));
    }
    else
    {
      *(unsigned char *)&self->_flags &= ~8u;
    }
  }
  return v3;
}

- (id)_synthesizedAttributedString
{
  if ([(_UILabelContent *)self->_content isNil]) {
    goto LABEL_2;
  }
  BOOL v4 = [(_UILabelContent *)self->_content isAttributed];
  content = self->_content;
  if (v4)
  {
    BOOL v6 = [(_UILabelContent *)content attributedString];
    BOOL v7 = [(_UILabelContent *)self->_content defaultAttributes];
    v8 = [(_UILabelSynthesizedContent *)self synthesizedAttributes];
    uint64_t v9 = [(_UILabelContent *)self->_content length];
    if (v7 == v8)
    {
      v24 = [(NSAttributedString *)v6 _ui_synthesizeAttributedSubstringFromRange:v9 usingDefaultAttributes:v7];
      v19 = (void *)[v24 mutableCopy];
    }
    else
    {
      v10 = (void *)[v6 mutableCopy];
      uint64_t v11 = *(void *)off_1E52D2048;
      v12 = [v7 objectForKey:*(void *)off_1E52D2048];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke;
      v33[3] = &unk_1E5309C78;
      id v13 = v12;
      id v34 = v13;
      id v14 = v10;
      id v35 = v14;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v9, 0, v33);
      if (*(unsigned char *)&self->_flags)
      {
        uint64_t v15 = *(void *)off_1E52D2238;
        v16 = [v7 objectForKey:*(void *)off_1E52D2238];
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __58___UILabelSynthesizedContent__synthesizedAttributedString__block_invoke_2;
        v30 = &unk_1E5309C78;
        id v31 = v16;
        id v32 = v14;
        id v17 = v16;
        objc_msgSend(v32, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v9, 0, &v27);
      }
      v18 = [(NSAttributedString *)v14 _ui_synthesizeAttributedSubstringFromRange:v9 usingDefaultAttributes:v8];
      v19 = (void *)[v18 mutableCopy];
    }
  }
  else
  {
    uint64_t v20 = [(_UILabelContent *)content string];
    if (!v20)
    {
LABEL_2:
      unint64_t v3 = 0;
      goto LABEL_17;
    }
    BOOL v6 = (void *)v20;
    id v21 = objc_alloc(MEMORY[0x1E4F28E48]);
    v22 = [(_UILabelContent *)self->_content string];
    v23 = [(_UILabelSynthesizedContent *)self synthesizedAttributes];
    v19 = (void *)[v21 initWithString:v22 attributes:v23];
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    [(_UILabelSynthesizedContent *)self _isolateStringWritingDirectionInAttributedString:v19];
    char flags = (char)self->_flags;
  }
  if ((flags & 4) != 0) {
    [(_UILabelSynthesizedContent *)self _disablingHyphenationIfURLsDetectedInAttributedString:v19];
  }
  unint64_t v3 = objc_msgSend(v19, "copy", v27, v28, v29, v30);

LABEL_17:
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_content);
  *(void *)(v4 + 24) = self->_semanticContentAttribute;
  objc_storeStrong((id *)(v4 + 16), self->_overrideTextColor);
  *(unsigned char *)(v4 + 40) = self->_flags;
  BOOL v5 = objc_getAssociatedObject(self, &_MergedGlobals_1339);
  BOOL v6 = objc_getAssociatedObject(self, &unk_1EB265518);
  objc_setAssociatedObject((id)v4, &_MergedGlobals_1339, v5, (void *)0x301);
  objc_setAssociatedObject((id)v4, &unk_1EB265518, v6, (void *)0x301);

  return (id)v4;
}

- (id)mutableCopy
{
  uint64_t v3 = objc_opt_new();
  objc_storeStrong((id *)(v3 + 8), self->_content);
  *(void *)(v3 + 24) = self->_semanticContentAttribute;
  objc_storeStrong((id *)(v3 + 16), self->_overrideTextColor);
  *(unsigned char *)(v3 + 40) = self->_flags;
  uint64_t v4 = objc_getAssociatedObject(self, &_MergedGlobals_1339);
  BOOL v5 = objc_getAssociatedObject(self, &unk_1EB265518);
  objc_setAssociatedObject((id)v3, &_MergedGlobals_1339, v4, (void *)0x301);
  objc_setAssociatedObject((id)v3, &unk_1EB265518, v5, (void *)0x301);

  return (id)v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_UILabelContent *)self->_content hash];
  return [(UIColor *)self->_overrideTextColor hash] ^ v3 ^ self->_semanticContentAttribute ^ (2 * *(unsigned char *)&self->_flags) & 2 ^ (2 * *(unsigned char *)&self->_flags) & 4 ^ (unint64_t)((2 * *(unsigned char *)&self->_flags) & 8) ^ (2 * *(unsigned char *)&self->_flags) & 0x10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UILabelSynthesizedContent *)a3;
  BOOL v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      LOBYTE(v12) = 1;
      goto LABEL_22;
    }
    if (((*(unsigned char *)&v4->_flags ^ *(unsigned char *)&self->_flags) & 7) == 0)
    {
      int64_t semanticContentAttribute = self->_semanticContentAttribute;
      if (semanticContentAttribute == [(_UILabelSynthesizedContent *)v4 semanticContentAttribute])
      {
        overrideTextColor = self->_overrideTextColor;
        v8 = [(_UILabelSynthesizedContent *)v5 overrideTextColor];
        uint64_t v9 = overrideTextColor;
        v10 = v8;
        uint64_t v11 = v10;
        if (v9 == (UIColor *)v10)
        {
        }
        else
        {
          LOBYTE(v12) = 0;
          if (!v9 || !v10)
          {
            uint64_t v15 = v10;
LABEL_20:

LABEL_21:
            goto LABEL_22;
          }
          BOOL v12 = [(UIColor *)v9 isEqual:v10];

          if (!v12) {
            goto LABEL_21;
          }
        }
        content = self->_content;
        id v14 = [(_UILabelSynthesizedContent *)v5 content];
        uint64_t v15 = content;
        v16 = v14;
        uint64_t v9 = (UIColor *)v16;
        if (v15 == v16)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          LOBYTE(v12) = 0;
          if (v15 && v16) {
            LOBYTE(v12) = [(_UILabelContent *)v15 isEqual:v16];
          }
        }

        goto LABEL_20;
      }
    }
  }
  LOBYTE(v12) = 0;
LABEL_22:

  return v12;
}

- (void)_disablingHyphenationIfURLsDetectedInAttributedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 string];
  uint64_t v5 = [v4 length];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28BE8]) initWithTypes:32 error:0];
  BOOL v7 = objc_msgSend(v6, "matchesInString:options:range:", v4, 0, 0, v5);
  if ([v7 count])
  {
    uint64_t v8 = *(void *)off_1E52D21B8;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84___UILabelSynthesizedContent__disablingHyphenationIfURLsDetectedInAttributedString___block_invoke;
    v9[3] = &unk_1E530ECE8;
    id v10 = v3;
    objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v5, 0, v9);
  }
}

- (void)_isolateStringWritingDirectionInAttributedString:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    BOOL v6 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:self->_semanticContentAttribute] != UIUserInterfaceLayoutDirectionLeftToRight;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = 0;
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    __int16 v45 = 0;
    BOOL v7 = [(_UILabelContent *)self->_content paragraphStyle];
    uint64_t v8 = [v5 length];
    uint64_t v9 = *(void *)off_1E52D21B8;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke;
    v38[3] = &unk_1E530EC98;
    id v10 = v7;
    id v39 = v10;
    v40 = &v42;
    v41 = &v46;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v38);
    uint64_t v11 = v47[3];
    if (!v11)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"_UILabelSynthesizedContent.m" lineNumber:297 description:@"should have at least one isolate range (beginning to end)"];

      uint64_t v11 = v47[3];
    }
    uint64_t v27 = v10;
    BOOL v12 = malloc_type_malloc(16 * v11, 0x100004030AC6366uLL);
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v37 = 0;
    *((_WORD *)v43 + 12) = 0;
    uint64_t v13 = [v5 length];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79___UILabelSynthesizedContent__isolateStringWritingDirectionInAttributedString___block_invoke_2;
    v28[3] = &unk_1E530ECC0;
    v28[4] = self;
    v30 = &v42;
    id v31 = &v34;
    id v32 = v12;
    BOOL v33 = v6;
    id v14 = v5;
    id v29 = v14;
    objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v13, 0, v28);
    uint64_t v15 = v35[3];
    if (v15 != v47[3])
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"_UILabelSynthesizedContent.m" lineNumber:324 description:@"Number of writing direction changes was inconsistent"];

      uint64_t v15 = v47[3];
    }
    if (v15)
    {
      unint64_t v16 = 0;
      uint64_t v17 = 0;
      v18 = v12 + 1;
      do
      {
        uint64_t v19 = *((unsigned __int16 *)v18 - 4);
        uint64_t v20 = *v18 + v17;
        if (v16)
        {
          id v21 = [NSString _stringWithUnichar:8297];
          objc_msgSend(v14, "replaceCharactersInRange:withString:", v20, 0, v21);

          ++v20;
          ++v17;
        }
        v22 = [NSString _stringWithUnichar:v19];
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v20, 0, v22);
        v18 += 2;

        ++v17;
        ++v16;
      }
      while (v16 < v47[3]);
    }
    uint64_t v23 = [v14 length];
    v24 = [NSString _stringWithUnichar:8297];
    objc_msgSend(v14, "replaceCharactersInRange:withString:", v23, 0, v24);

    free(v12);
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v46, 8);
  }
}

- (id)description
{
  id v3 = objc_opt_new();
  uint64_t v4 = v3;
  char flags = (char)self->_flags;
  if (flags)
  {
    [v3 addObject:@"eliminateShadows"];
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"disableLinkHypenation"];
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_10:
  [v4 addObject:@"explicitBaselineOffset"];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_5:
  }
    [v4 addObject:@"overallWritingDirectionFollowsLayoutDirection"];
LABEL_6:
  BOOL v6 = [v4 componentsJoinedByString:@", "];

  unint64_t semanticContentAttribute = self->_semanticContentAttribute;
  if (semanticContentAttribute > 4) {
    uint64_t v8 = @"?";
  }
  else {
    uint64_t v8 = off_1E5311930[semanticContentAttribute];
  }
  uint64_t v9 = NSString;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [(_UILabelSynthesizedContent *)self synthesizedAttributes];
  BOOL v12 = [(_UILabelSynthesizedContent *)self synthesizedAttributedString];
  uint64_t v13 = [v9 stringWithFormat:@"<%@:%p attributes=%@ text=%@ semanticContentAttribute=%@ overrideTextColor=%@ flags=(%@)>", v10, self, v11, v12, v8, self->_overrideTextColor, v6];

  return v13;
}

- (_UILabelContent)content
{
  return self->_content;
}

- (UIColor)overrideTextColor
{
  return self->_overrideTextColor;
}

- (int64_t)semanticContentAttribute
{
  return self->_semanticContentAttribute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncapsulation, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end