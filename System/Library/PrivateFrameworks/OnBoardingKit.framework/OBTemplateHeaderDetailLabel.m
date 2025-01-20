@interface OBTemplateHeaderDetailLabel
- (NSNumber)spansAllLinesOverride;
- (_NSRange)bodyRange;
- (_NSRange)titleRange;
- (void)overrideSpansAllLines:(unint64_t)a3;
- (void)setBodyRange:(_NSRange)a3;
- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4;
- (void)setSpansAllLinesOverride:(id)a3;
- (void)setText:(id)a3;
- (void)setTitleRange:(_NSRange)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAttributedTextWithString:(id)a3;
@end

@implementation OBTemplateHeaderDetailLabel

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBTemplateHeaderDetailLabel;
  [(OBTemplateHeaderDetailLabel *)&v5 traitCollectionDidChange:a3];
  v4 = [(OBTemplateHeaderDetailLabel *)self text];
  [(OBTemplateHeaderDetailLabel *)self updateAttributedTextWithString:v4];
}

- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[OBTemplateHeaderDetailLabel setTitleRange:](self, "setTitleRange:", 0, [v7 length]);
  uint64_t v8 = [@"\n" length];
  [(OBTemplateHeaderDetailLabel *)self titleRange];
  -[OBTemplateHeaderDetailLabel setBodyRange:](self, "setBodyRange:", v9 + v8, [v6 length]);
  v10 = [v7 stringByAppendingString:@"\n"];

  id v11 = [v10 stringByAppendingString:v6];

  [(OBTemplateHeaderDetailLabel *)self setText:v11];
}

- (void)setText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OBTemplateHeaderDetailLabel;
  id v4 = a3;
  [(OBTemplateHeaderDetailLabel *)&v5 setText:v4];
  -[OBTemplateHeaderDetailLabel updateAttributedTextWithString:](self, "updateAttributedTextWithString:", v4, v5.receiver, v5.super_class);
}

- (void)updateAttributedTextWithString:(id)a3
{
  id v25 = a3;
  id v4 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  objc_super v5 = (void *)[v4 mutableCopy];

  if (+[OBViewUtilities shouldUseAccessibilityLayout]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 setAlignment:v6];
  id v7 = [(OBTemplateHeaderDetailLabel *)self spansAllLinesOverride];

  if (v7)
  {
    uint64_t v8 = [(OBTemplateHeaderDetailLabel *)self spansAllLinesOverride];
    uint64_t v9 = objc_msgSend(v5, "spansAllLinesForConfiguration:withText:", (int)objc_msgSend(v8, "intValue"), v25);
  }
  else
  {
    uint64_t v9 = [v5 preferredSpansAllLinesForCurrentLanguageWithText:v25];
  }
  [v5 setSpansAllLines:v9];
  v10 = [(OBTemplateHeaderDetailLabel *)self attributedText];
  id v11 = (void *)[v10 mutableCopy];

  v12 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v13 = *MEMORY[0x1E4FB28C8];
  v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v14 pointSize];
  v15 = objc_msgSend(v12, "boldSystemFontOfSize:");

  v16 = (void *)MEMORY[0x1E4FB08E0];
  v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v13];
  [v17 pointSize];
  v18 = objc_msgSend(v16, "systemFontOfSize:");

  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  uint64_t v20 = [(OBTemplateHeaderDetailLabel *)self titleRange];
  objc_msgSend(v11, "addAttribute:value:range:", v19, v15, v20, v21);
  uint64_t v22 = [(OBTemplateHeaderDetailLabel *)self bodyRange];
  objc_msgSend(v11, "addAttribute:value:range:", v19, v18, v22, v23);
  uint64_t v24 = *MEMORY[0x1E4FB0738];
  objc_msgSend(v11, "removeAttribute:range:", *MEMORY[0x1E4FB0738], 0, objc_msgSend(v11, "length"));
  objc_msgSend(v11, "addAttribute:value:range:", v24, v5, 0, objc_msgSend(v11, "length"));
  [(OBTemplateHeaderDetailLabel *)self setAttributedText:v11];
}

- (void)overrideSpansAllLines:(unint64_t)a3
{
  uint64_t v5 = [(OBTemplateHeaderDetailLabel *)self spansAllLinesOverride];
  if (!v5
    || (uint64_t v6 = (void *)v5,
        [(OBTemplateHeaderDetailLabel *)self spansAllLinesOverride],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = (int)[v7 intValue],
        v7,
        v6,
        v8 != a3))
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(OBTemplateHeaderDetailLabel *)self setSpansAllLinesOverride:v9];

    id v10 = [(OBTemplateHeaderDetailLabel *)self text];
    [(OBTemplateHeaderDetailLabel *)self updateAttributedTextWithString:v10];
  }
}

- (_NSRange)titleRange
{
  p_titleRange = &self->_titleRange;
  NSUInteger location = self->_titleRange.location;
  NSUInteger length = p_titleRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTitleRange:(_NSRange)a3
{
  self->_titleRange = a3;
}

- (_NSRange)bodyRange
{
  p_bodyRange = &self->_bodyRange;
  NSUInteger location = self->_bodyRange.location;
  NSUInteger length = p_bodyRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setBodyRange:(_NSRange)a3
{
  self->_bodyRange = a3;
}

- (NSNumber)spansAllLinesOverride
{
  return self->_spansAllLinesOverride;
}

- (void)setSpansAllLinesOverride:(id)a3
{
}

- (void).cxx_destruct
{
}

@end