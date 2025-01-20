@interface NTKVictoryLabel
+ (id)fontDescriptorWithVictoryStyle:(unint64_t)a3;
+ (id)loadFonts:(double)a3 style:(unint64_t)a4 monospacedNumbers:(BOOL)a5;
+ (id)victoryFontWithSize:(double)a3 style:(unint64_t)a4;
- (BOOL)_shouldHideOutlineLabel;
- (BOOL)requiresDrawingRectAdjustments;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGVector)drawingRectOffset;
- (NTKVictoryLabel)outlineLabel;
- (UIColor)outlineColor;
- (double)additionalPaddingInsets;
- (double)outlineAlpha;
- (id)outlinedLabelAttributedStringFromAttributedString:(id)a3;
- (void)_applyDrawingOffsetForTextIfNeeded:(id)a3;
- (void)_layoutOutlineLabelIfNeeded;
- (void)drawTextInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAdditionalPaddingInsets:(double)a3;
- (void)setAttributedText:(id)a3;
- (void)setDrawingRectOffset:(CGVector)a3;
- (void)setFillColor:(id)a3;
- (void)setFillColor:(id)a3 inRange:(_NSRange)a4;
- (void)setOutlineAlpha:(double)a3;
- (void)setOutlineColor:(id)a3;
- (void)setOutlineColor:(id)a3 inRange:(_NSRange)a4;
- (void)setOutlineLabel:(id)a3;
- (void)setRequiresDrawingRectAdjustments:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)sizeToFit;
@end

@implementation NTKVictoryLabel

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKVictoryLabel;
  -[CLKUIColoringLabel sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  [(NTKVictoryLabel *)self additionalPaddingInsets];
  double v9 = v5 + v8;
  double v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)sizeToFit
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryLabel;
  [(CLKUIColoringLabel *)&v3 sizeToFit];
  [(NTKVictoryLabel *)self _layoutOutlineLabelIfNeeded];
}

- (void)setTextAlignment:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryLabel;
  -[NTKVictoryLabel setTextAlignment:](&v5, sel_setTextAlignment_);
  [(NTKVictoryLabel *)self->_outlineLabel setTextAlignment:a3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryLabel;
  [(NTKVictoryLabel *)&v3 layoutSubviews];
  [(NTKVictoryLabel *)self _layoutOutlineLabelIfNeeded];
}

- (void)_layoutOutlineLabelIfNeeded
{
  if (self->_outlineLabel)
  {
    [(NTKVictoryLabel *)self bounds];
    -[CLKUIColoringLabel setBounds:](self->_outlineLabel, "setBounds:");
    [(NTKVictoryLabel *)self bounds];
    double v4 = v3 * 0.5;
    [(NTKVictoryLabel *)self bounds];
    outlineLabel = self->_outlineLabel;
    -[NTKVictoryLabel setCenter:](outlineLabel, "setCenter:", v4, v5 * 0.5);
  }
}

- (void)setDrawingRectOffset:(CGVector)a3
{
  self->_drawingRectOffset = a3;
  -[NTKVictoryLabel setDrawingRectOffset:](self->_outlineLabel, "setDrawingRectOffset:");
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKVictoryLabel;
  [(CLKUIColoringLabel *)&v7 setAttributedText:v4];
  if ([v4 length])
  {
    double v5 = [(NTKVictoryLabel *)self outlinedLabelAttributedStringFromAttributedString:v4];
    [(NTKVictoryLabel *)self->_outlineLabel setAttributedText:v5];

    [(NTKVictoryLabel *)self->_outlineLabel sizeToFit];
    double v6 = [v4 string];
    [(NTKVictoryLabel *)self _applyDrawingOffsetForTextIfNeeded:v6];
  }
}

- (id)outlinedLabelAttributedStringFromAttributedString:(id)a3
{
  id v4 = a3;
  double v5 = [v4 string];
  uint64_t v6 = [v4 length];
  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke;
  v22[3] = &unk_1E62C0CA8;
  v22[4] = self;
  id v9 = v7;
  id v23 = v9;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v6, 0, v22);

  double v10 = [(NTKVictoryLabel *)self->_outlineLabel attributedText];
  uint64_t v11 = [v10 length];

  v12 = [(NTKVictoryLabel *)self->_outlineLabel attributedText];
  uint64_t v13 = *MEMORY[0x1E4FB0700];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke_2;
  v18[3] = &unk_1E62CB258;
  uint64_t v20 = 0;
  uint64_t v21 = v6;
  id v14 = v9;
  id v19 = v14;
  objc_msgSend(v12, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v11, 0, v18);

  v15 = v19;
  id v16 = v14;

  return v16;
}

void __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v20 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v8 = v20;
  if (isKindOfClass)
  {
    id v9 = [v20 fontDescriptor];
    double v10 = [v9 fontAttributes];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FB0910]];

    v12 = [v11 firstObject];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB0968]];
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FB0960]];
    v15 = v14;
    if (v14)
    {
      BOOL v16 = [v14 integerValue] || v13 == 0;
      if (!v16 && [v13 integerValue] == 6)
      {
        v17 = objc_opt_class();
        v18 = [*(id *)(a1 + 32) font];
        [v18 pointSize];
        id v19 = objc_msgSend(v17, "victoryFontWithSize:style:monospacedNumbers:", 1, 1);

        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v19, a3, a4);
      }
    }

    uint64_t v8 = v20;
  }
}

void __69__NTKVictoryLabel_outlinedLabelAttributedStringFromAttributedString___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v10 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12.NSUInteger location = a3;
    v12.NSUInteger length = a4;
    NSRange v8 = NSIntersectionRange(v12, *(NSRange *)(a1 + 40));
    NSUInteger length = v8.length;
    NSUInteger location = v8.location;
    if (!v8.length)
    {
      NSUInteger location = *(void *)(a1 + 40);
      NSUInteger length = *(void *)(a1 + 48);
    }
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v10, location, length);
  }
}

- (void)setText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKVictoryLabel;
  id v4 = a3;
  [(CLKUIColoringLabel *)&v5 setText:v4];
  -[NTKVictoryLabel setText:](self->_outlineLabel, "setText:", v4, v5.receiver, v5.super_class);
  [(NTKVictoryLabel *)self _applyDrawingOffsetForTextIfNeeded:v4];
}

- (void)_applyDrawingOffsetForTextIfNeeded:(id)a3
{
  id v4 = a3;
  if (self->_drawingRectOffset.dx != 0.0 || self->_drawingRectOffset.dy != 0.0)
  {
    id v7 = v4;
    objc_super v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v4, "length") - 1);
    int v6 = [v5 isEqualToString:@"7"];

    id v4 = v7;
    if (self->_requiresDrawingRectAdjustments != v6)
    {
      self->_requiresDrawingRectAdjustments = v6;
      [(NTKVictoryLabel *)self setNeedsLayout];
      id v4 = v7;
    }
  }
}

- (void)setOutlineColor:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4FB1618] clearColor];
  }
  int v6 = v5;
  id v7 = [(NTKVictoryLabel *)self attributedText];
  uint64_t v8 = [v7 length];

  -[NTKVictoryLabel setOutlineColor:inRange:](self, "setOutlineColor:inRange:", v6, 0, v8);
  [(NTKVictoryLabel *)self->_outlineLabel setHidden:[(NTKVictoryLabel *)self _shouldHideOutlineLabel]];
  [(NTKVictoryLabel *)self _layoutOutlineLabelIfNeeded];
}

- (void)setOutlineColor:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v13 = v7;
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
  }
  id v9 = v8;
  id v10 = [(NTKVictoryLabel *)self outlineLabel];
  uint64_t v11 = [v10 attributedText];
  NSRange v12 = (void *)[v11 mutableCopy];

  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v9, location, length);
  [v10 setAttributedText:v12];
  objc_msgSend(v10, "setHidden:", -[NTKVictoryLabel _shouldHideOutlineLabel](self, "_shouldHideOutlineLabel"));
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKVictoryLabel *)self attributedText];
  uint64_t v6 = [v5 length];

  -[NTKVictoryLabel setFillColor:inRange:](self, "setFillColor:inRange:", v4, 0, v6);
  BOOL v7 = [(NTKVictoryLabel *)self _shouldHideOutlineLabel];
  outlineLabel = self->_outlineLabel;
  [(NTKVictoryLabel *)outlineLabel setHidden:v7];
}

- (void)setFillColor:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v14 = v7;
  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
  }
  id v9 = v8;
  id v10 = [(NTKVictoryLabel *)self attributedText];
  uint64_t v11 = (void *)[v10 mutableCopy];

  objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E4FB0700], v9, location, length);
  [(NTKVictoryLabel *)self setAttributedText:v11];
  BOOL v12 = [(NTKVictoryLabel *)self _shouldHideOutlineLabel];
  id v13 = [(NTKVictoryLabel *)self outlineLabel];
  [v13 setHidden:v12];
}

- (BOOL)_shouldHideOutlineLabel
{
  double v3 = [(NTKVictoryLabel *)self attributedText];
  id v4 = [(NTKVictoryLabel *)self outlineLabel];
  id v5 = [v4 attributedText];

  uint64_t v6 = [v3 length];
  long long v20 = 0uLL;
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  id v8 = objc_msgSend(v5, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4FB0700], 0, &v20, 0, v6);
  if (v20 == __PAIR128__(v6, 0)
    && ([MEMORY[0x1E4FB1618] clearColor],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqual:v9],
        v9,
        (v10 & 1) != 0))
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __42__NTKVictoryLabel__shouldHideOutlineLabel__block_invoke;
    v13[3] = &unk_1E62CB280;
    id v14 = v5;
    v15 = &v16;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
    BOOL v11 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v11;
}

void __42__NTKVictoryLabel__shouldHideOutlineLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    BOOL v11 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4FB0700] atIndex:a3 effectiveRange:&v12];
    if (![v10 isEqual:v11] || a3 != v12 || a4 != v13)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
}

- (void)setAdditionalPaddingInsets:(double)a3
{
  self->_additionalPaddingInsets = a3;
  -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_outlineLabel, "setAdditionalPaddingInsets:");
}

- (double)additionalPaddingInsets
{
  if (self->_requiresDrawingRectAdjustments) {
    double v2 = -self->_drawingRectOffset.dx;
  }
  else {
    double v2 = 0.0;
  }
  return self->_additionalPaddingInsets + v2;
}

- (NTKVictoryLabel)outlineLabel
{
  outlineLabel = self->_outlineLabel;
  if (!outlineLabel)
  {
    id v4 = [NTKVictoryLabel alloc];
    [(NTKVictoryLabel *)self bounds];
    id v5 = -[CLKUIColoringLabel initWithFrame:](v4, "initWithFrame:");
    uint64_t v6 = self->_outlineLabel;
    self->_outlineLabel = v5;

    [(NTKVictoryLabel *)self additionalPaddingInsets];
    -[NTKVictoryLabel setAdditionalPaddingInsets:](self->_outlineLabel, "setAdditionalPaddingInsets:");
    uint64_t v7 = objc_opt_class();
    id v8 = [(CLKUIColoringLabel *)self font];
    [v8 pointSize];
    id v9 = objc_msgSend(v7, "victoryFontWithSize:style:", 1);
    [(CLKUIColoringLabel *)self->_outlineLabel setFont:v9];

    [(NTKVictoryLabel *)self->_outlineLabel setTextAlignment:[(NTKVictoryLabel *)self textAlignment]];
    -[NTKVictoryLabel setDrawingRectOffset:](self->_outlineLabel, "setDrawingRectOffset:", self->_drawingRectOffset.dx, self->_drawingRectOffset.dy);
    id v10 = [(NTKVictoryLabel *)self text];

    if (v10)
    {
      BOOL v11 = [(NTKVictoryLabel *)self text];
      [(NTKVictoryLabel *)self->_outlineLabel setText:v11];
    }
    uint64_t v12 = [(NTKVictoryLabel *)self attributedText];

    if (v12)
    {
      uint64_t v13 = [(NTKVictoryLabel *)self attributedText];
      id v14 = [(NTKVictoryLabel *)self outlinedLabelAttributedStringFromAttributedString:v13];
      [(NTKVictoryLabel *)self->_outlineLabel setAttributedText:v14];
    }
    [(NTKVictoryLabel *)self addSubview:self->_outlineLabel];
    [(NTKVictoryLabel *)self _layoutOutlineLabelIfNeeded];
    v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(NTKVictoryLabel *)self setOutlineColor:v15];

    outlineLabel = self->_outlineLabel;
  }
  return outlineLabel;
}

- (void)setOutlineAlpha:(double)a3
{
  id v5 = [(NTKVictoryLabel *)self outlineLabel];
  [v5 setAlpha:a3];

  [(NTKVictoryLabel *)self _layoutOutlineLabelIfNeeded];
}

+ (id)victoryFontWithSize:(double)a3 style:(unint64_t)a4
{
  return (id)[a1 victoryFontWithSize:a4 style:0 monospacedNumbers:a3];
}

+ (id)loadFonts:(double)a3 style:(unint64_t)a4 monospacedNumbers:(BOOL)a5
{
  BOOL v5 = a5;
  v24[2] = *MEMORY[0x1E4F143B8];
  if (loadFonts_style_monospacedNumbers__onceToken != -1) {
    dispatch_once(&loadFonts_style_monospacedNumbers__onceToken, &__block_literal_global_171);
  }
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu-%lu", a4, (unint64_t)a3, v5);
  id v10 = [(id)__fontCache objectForKey:v9];
  if (!v10)
  {
    BOOL v11 = [a1 fontDescriptorWithVictoryStyle:a4];
    if (v5)
    {
      uint64_t v12 = *MEMORY[0x1E4FB0960];
      v23[0] = *MEMORY[0x1E4FB0968];
      v23[1] = v12;
      v24[0] = &unk_1F16E5310;
      v24[1] = &unk_1F16E5328;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
      uint64_t v14 = *MEMORY[0x1E4FB0910];
      long long v20 = v13;
      uint64_t v21 = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      v22 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v17 = [v11 fontDescriptorByAddingAttributes:v16];

      BOOL v11 = (void *)v17;
    }
    if (v11)
    {
      id v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:a3];
      [(id)__fontCache setObject:v10 forKey:v9];
    }
    else
    {
      uint64_t v18 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[NTKVictoryLabel loadFonts:style:monospacedNumbers:](a4, v18);
      }

      id v10 = 0;
    }
  }
  return v10;
}

void __53__NTKVictoryLabel_loadFonts_style_monospacedNumbers___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)__fontCache;
  __fontCache = (uint64_t)v0;
}

+ (id)fontDescriptorWithVictoryStyle:(unint64_t)a3
{
  double v3 = @"__VictoryFont2";
  if (a3 != 1) {
    double v3 = 0;
  }
  if (a3) {
    id v4 = v3;
  }
  else {
    id v4 = @"__VictoryFont1";
  }
  return +[NTKFontLoader fontDescriptorForSectName:v4];
}

- (void)drawTextInRect:(CGRect)a3
{
  if (self->_requiresDrawingRectAdjustments) {
    a3 = CGRectOffset(a3, self->_drawingRectOffset.dx, self->_drawingRectOffset.dy);
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKVictoryLabel;
  -[NTKVictoryLabel drawTextInRect:](&v4, sel_drawTextInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGVector)drawingRectOffset
{
  double dx = self->_drawingRectOffset.dx;
  double dy = self->_drawingRectOffset.dy;
  result.double dy = dy;
  result.double dx = dx;
  return result;
}

- (UIColor)outlineColor
{
  return self->_outlineColor;
}

- (double)outlineAlpha
{
  return self->_outlineAlpha;
}

- (void)setOutlineLabel:(id)a3
{
}

- (BOOL)requiresDrawingRectAdjustments
{
  return self->_requiresDrawingRectAdjustments;
}

- (void)setRequiresDrawingRectAdjustments:(BOOL)a3
{
  self->_requiresDrawingRectAdjustments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlineLabel, 0);
  objc_storeStrong((id *)&self->_outlineColor, 0);
}

+ (void)loadFonts:(uint64_t)a1 style:(NSObject *)a2 monospacedNumbers:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  double v3 = "+[NTKVictoryLabel loadFonts:style:monospacedNumbers:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "%s Unable to load font descriptor for style %lu", (uint8_t *)&v2, 0x16u);
}

@end