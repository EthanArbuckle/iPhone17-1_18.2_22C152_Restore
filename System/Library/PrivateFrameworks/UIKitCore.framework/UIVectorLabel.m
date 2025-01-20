@interface UIVectorLabel
+ (Class)layerClass;
+ (id)_defaultAttributes;
+ (id)_defaultFont;
- (BOOL)_needsDoubleUpdateConstraintsPass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (UIColor)textColor;
- (UIFont)font;
- (UIVectorLabel)initWithFrame:(CGRect)a3;
- (_UILabelContent)_content;
- (double)_baselineOffsetFromBottom;
- (double)_firstBaselineOffsetFromTop;
- (double)_firstLineBaseline;
- (double)_lastLineBaseline;
- (double)_multilineContextWidth;
- (double)_preferredMaxLayoutWidth;
- (double)preferredMaxLayoutWidth;
- (id)_attributedTextCompatibleForSizing;
- (id)_defaultAttributes;
- (id)_layoutParametersWithinSize:(CGSize)a3 forSizing:(BOOL)a4;
- (id)_materializedAttributedText;
- (unint64_t)numberOfLines;
- (void)_ensureSizingLayout;
- (void)_ensureVisualLayout;
- (void)_generateDeferredAnimations:(id)a3;
- (void)_mergeDefaultAttributesForDowngradingContent:(id)a3;
- (void)_prepareForFirstIntrinsicContentSizeCalculation;
- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3;
- (void)_setAttributedText:(id)a3;
- (void)_setContent:(id)a3;
- (void)_setMultilineContextWidth:(double)a3;
- (void)_setNeedsUpdateLayerIfNeeded;
- (void)_setTextColor:(id)a3;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setNumberOfLines:(unint64_t)a3;
- (void)setPreferredMaxLayoutWidth:(double)a3;
- (void)setText:(id)a3;
@end

@implementation UIVectorLabel

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (UIVectorLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIVectorLabel;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(UIVectorLabel *)v3 setNumberOfLines:1];
  }
  return v4;
}

+ (id)_defaultFont
{
  [off_1E52D39B8 defaultFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

+ (id)_defaultAttributes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__UIVectorLabel__defaultAttributes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_7_13 != -1) {
    dispatch_once(&_MergedGlobals_7_13, block);
  }
  v2 = (void *)qword_1EB25D6F8;
  return v2;
}

void __35__UIVectorLabel__defaultAttributes__block_invoke(uint64_t a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = *(void *)off_1E52D2040;
  v1 = [*(id *)(a1 + 32) _defaultFont];
  v6[0] = v1;
  v5[1] = *(void *)off_1E52D2048;
  v2 = +[UIColor blackColor];
  v6[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  v4 = (void *)qword_1EB25D6F8;
  qword_1EB25D6F8 = v3;
}

- (void)_mergeDefaultAttributesForDowngradingContent:(id)a3
{
  defaultAttributes = self->_defaultAttributes;
  id v5 = a3;
  if ([(NSMutableDictionary *)defaultAttributes count])
  {
    [(NSMutableDictionary *)self->_defaultAttributes addEntriesFromDictionary:v5];

    objc_super v6 = [(_UILabelContent *)self->_content contentWithDefaultAttributes:self->_defaultAttributes];
    content = self->_content;
    self->_content = v6;
  }
  else
  {
    v8 = (NSMutableDictionary *)[v5 mutableCopy];

    content = self->_defaultAttributes;
    self->_defaultAttributes = v8;
  }
}

- (id)_defaultAttributes
{
  defaultAttributes = self->_defaultAttributes;
  if (!defaultAttributes)
  {
    v4 = [(id)objc_opt_class() _defaultAttributes];
    id v5 = (NSMutableDictionary *)[v4 mutableCopy];
    objc_super v6 = self->_defaultAttributes;
    self->_defaultAttributes = v5;

    defaultAttributes = self->_defaultAttributes;
  }
  return defaultAttributes;
}

- (_UILabelContent)_content
{
  content = self->_content;
  if (!content)
  {
    v4 = [_UILabelContent alloc];
    id v5 = [(UIVectorLabel *)self _defaultAttributes];
    objc_super v6 = [(_UILabelContent *)v4 initWithDefaultAttributes:v5];
    v7 = self->_content;
    self->_content = v6;

    content = self->_content;
  }
  return content;
}

- (void)_setContent:(id)a3
{
}

- (void)_setTextColor:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v7 = +[UIColor blackColor];
  }
  v4 = [(UIVectorLabel *)self _content];
  uint64_t v5 = *(void *)off_1E52D2048;
  if (([v4 isAttribute:*(void *)off_1E52D2048 uniformlyEqualToValue:v7] & 1) == 0)
  {
    objc_super v6 = [v4 contentByApplyingAttributeToEntireRange:v5 value:v7];
    [(UIVectorLabel *)self _setContent:v6];

    [(NSMutableDictionary *)self->_defaultAttributes setObject:v7 forKey:v5];
    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (UIColor)textColor
{
  v2 = [(UIVectorLabel *)self _content];
  uint64_t v3 = [v2 defaultValueForAttribute:*(void *)off_1E52D2048];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[UIColor blackColor];
  }
  objc_super v6 = v5;

  return (UIColor *)v6;
}

- (void)setFont:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v7 = [(id)objc_opt_class() _defaultFont];
  }
  v4 = [(UIVectorLabel *)self _content];
  uint64_t v5 = *(void *)off_1E52D2040;
  if (([v4 isAttribute:*(void *)off_1E52D2040 uniformlyEqualToValue:v7] & 1) == 0)
  {
    objc_super v6 = [v4 contentByApplyingAttributeToEntireRange:v5 value:v7];
    [(UIVectorLabel *)self _setContent:v6];

    [(NSMutableDictionary *)self->_defaultAttributes setObject:v7 forKey:v5];
    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (UIFont)font
{
  v2 = [(UIVectorLabel *)self _content];
  uint64_t v3 = [v2 defaultValueForAttribute:*(void *)off_1E52D2040];

  return (UIFont *)v3;
}

- (void)setText:(id)a3
{
  id v6 = a3;
  v4 = [(UIVectorLabel *)self _content];
  if (([v4 isEqualToString:v6] & 1) == 0)
  {
    uint64_t v5 = [v4 contentWithString:v6];
    [(UIVectorLabel *)self _setContent:v5];

    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (NSString)text
{
  v2 = [(UIVectorLabel *)self _content];
  uint64_t v3 = [v2 string];

  return (NSString *)v3;
}

- (void)_setAttributedText:(id)a3
{
  id v6 = a3;
  v4 = [(UIVectorLabel *)self _content];
  if (([v4 isEqualToAttributedString:v6] & 1) == 0)
  {
    uint64_t v5 = [v4 contentWithAttributedString:v6];
    [(UIVectorLabel *)self _setContent:v5];

    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (id)_materializedAttributedText
{
  uint64_t v3 = [(UIVectorLabel *)self _content];
  v4 = [v3 attributedStringContent];
  [(UIVectorLabel *)self _setContent:v4];

  uint64_t v5 = [(UIVectorLabel *)self _content];
  id v6 = [v5 attributedString];

  return v6;
}

- (void)setNumberOfLines:(unint64_t)a3
{
  self->_numberOfLines = a3;
  [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
}

- (void)setPreferredMaxLayoutWidth:(double)a3
{
  int v5 = [(UIVectorLabel *)self _needsDoubleUpdateConstraintsPass];
  *(unsigned char *)&self->_labelFlags = *(unsigned char *)&self->_labelFlags & 0xFE | (a3 != 0.0);
  if (self->_preferredMaxLayoutWidth != a3)
  {
    self->_preferredMaxLayoutWidth = a3;
    [(UIView *)self invalidateIntrinsicContentSize];
  }
  -[UIView _needsDoubleUpdateConstraintsPassMayHaveChangedFrom:]((uint64_t)self, v5);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UIVectorLabel;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  [(UIView *)self bounds];
  if (v9 != v13 || v11 != v12) {
    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v15.receiver = self;
  v15.super_class = (Class)UIVectorLabel;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  [(UIView *)self bounds];
  if (v9 != v13 || v11 != v12) {
    [(UIVectorLabel *)self _setNeedsUpdateLayerIfNeeded];
  }
}

- (CGSize)intrinsicContentSize
{
  [(UIVectorLabel *)self _ensureSizingLayout];
  sizingLayout = self->_sizingLayout;
  [(_UIVectorTextLayout *)sizingLayout size];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)_ensureSizingLayout
{
  [(UIVectorLabel *)self _preferredMaxLayoutWidth];
  if (v3 <= 0.0)
  {
    double v6 = 1.79769313e308;
  }
  else
  {
    double v4 = v3;
    unint64_t v5 = [(UIVectorLabel *)self numberOfLines];
    double v6 = 1.79769313e308;
    if (v5 != 1) {
      double v6 = v4;
    }
  }
  -[UIVectorLabel _intrinsicSizeWithinSize:](self, "_intrinsicSizeWithinSize:", v6, 1.79769313e308);
}

- (void)_ensureVisualLayout
{
  if (!self->_visualLayout)
  {
    p_sizingLayout = (id *)&self->_sizingLayout;
    if (!self->_sizingLayout) {
      goto LABEL_11;
    }
LABEL_7:
    [(UIView *)self bounds];
    uint64_t v9 = -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v10, v11);
    sizingLayout = (_UIVectorTextLayout *)*p_sizingLayout;
    goto LABEL_8;
  }
  [(UIView *)self bounds];
  -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v3, v4);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = [(_UIVectorTextLayout *)self->_visualLayout parameters];
  char v6 = [v5 isEqualToParameters:v19];

  if (v6) {
    goto LABEL_14;
  }
  p_sizingLayout = (id *)&self->_sizingLayout;
  sizingLayout = self->_sizingLayout;
  if (!sizingLayout)
  {
LABEL_10:
    uint64_t v15 = (uint64_t)v19;
    if (v19)
    {
LABEL_12:
      id v19 = (id)v15;
      v14 = [[_UIVectorTextLayout alloc] initWithTextParameters:v15];
      goto LABEL_13;
    }
LABEL_11:
    [(UIView *)self bounds];
    uint64_t v15 = -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 0, v16, v17);
    goto LABEL_12;
  }
  uint64_t v9 = (uint64_t)v19;
  if (!v19) {
    goto LABEL_7;
  }
LABEL_8:
  id v19 = (id)v9;
  double v12 = [(_UIVectorTextLayout *)sizingLayout parameters];
  int v13 = [v12 isEqualToParameters:v19];

  if (!v13) {
    goto LABEL_10;
  }
  v14 = (_UIVectorTextLayout *)*p_sizingLayout;
LABEL_13:
  visualLayout = self->_visualLayout;
  self->_visualLayout = v14;

LABEL_14:
}

- (id)_layoutParametersWithinSize:(CGSize)a3 forSizing:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = objc_opt_new();
  objc_msgSend(v8, "setWithinSize:", width, height);
  objc_msgSend(v8, "setNumberOfLines:", -[UIVectorLabel numberOfLines](self, "numberOfLines"));
  if (a4) {
    [(UIVectorLabel *)self _attributedTextCompatibleForSizing];
  }
  else {
  uint64_t v9 = [(UIVectorLabel *)self _attributedText];
  }
  [v8 setAttributedText:v9];

  double v10 = [(UIView *)self traitCollection];
  [v8 setTraitCollection:v10];

  return v8;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double width = a3.width;
  unint64_t v5 = [(UIVectorLabel *)self numberOfLines];
  if (width <= 0.0 || v5 == 1) {
    double v7 = 1.79769313e308;
  }
  else {
    double v7 = width;
  }
  sizingLayout = self->_sizingLayout;
  uint64_t v9 = [(UIVectorLabel *)self _layoutParametersWithinSize:1 forSizing:v7];
  if (!sizingLayout
    || ([(_UIVectorTextLayout *)self->_sizingLayout parameters],
        double v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isEqualToParameters:v9],
        v10,
        (v11 & 1) == 0))
  {
    if (!v9) {
      goto LABEL_20;
    }
    double v12 = [[_UIVectorTextLayout alloc] initWithTextParameters:v9];
    int v13 = v12;
    if (self->_sizingLayout
      && ([(_UIVectorTextLayout *)v12 firstLineBaseline],
          double v15 = v14,
          [(_UIVectorTextLayout *)self->_sizingLayout firstLineBaseline],
          v15 == v16))
    {
      [(_UIVectorTextLayout *)v13 lastLineBaseline];
      double v19 = v18;
      [(_UIVectorTextLayout *)self->_sizingLayout lastLineBaseline];
      BOOL v17 = v19 == v20;
    }
    else
    {
      BOOL v17 = 0;
    }
    v21 = self->_sizingLayout;
    self->_sizingLayout = v13;

    if ((*(void *)&self->super._viewFlags & 0x400000000000000) != 0 && !v17)
    {
      v22 = [(UIView *)self _layoutEngine];
      if (v22) {
        _UIViewEnumerateLayoutConstraintsAndAdjustForConstantChangeForSelectedAttributes(self, (uint64_t)_UILayoutAttributeIsBaselineAttribute);
      }
    }
  }

LABEL_20:
  v23 = self->_sizingLayout;
  [(_UIVectorTextLayout *)v23 size];
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  unint64_t v5 = -[UIVectorLabel _layoutParametersWithinSize:forSizing:](self, "_layoutParametersWithinSize:forSizing:", 1, a3.size.width, a3.size.height);
  [v5 setNumberOfLines:a4];
  char v6 = [[_UIVectorTextLayout alloc] initWithTextParameters:v5];
  [(_UIVectorTextLayout *)v6 boundingRect];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (double)_baselineOffsetFromBottom
{
  [(UIVectorLabel *)self _ensureSizingLayout];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(_UIVectorTextLayout *)self->_sizingLayout size];
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:", v3, v4, v5, v6);
  double MaxY = CGRectGetMaxY(v10);
  [(_UIVectorTextLayout *)self->_sizingLayout lastLineBaseline];
  return MaxY - v8;
}

- (double)_firstBaselineOffsetFromTop
{
  [(UIVectorLabel *)self _ensureSizingLayout];
  sizingLayout = self->_sizingLayout;
  [(_UIVectorTextLayout *)sizingLayout firstLineBaseline];
  return result;
}

- (double)_firstLineBaseline
{
  [(UIVectorLabel *)self _ensureSizingLayout];
  sizingLayout = self->_sizingLayout;
  [(_UIVectorTextLayout *)sizingLayout firstLineBaseline];
  return result;
}

- (double)_lastLineBaseline
{
  [(UIVectorLabel *)self _ensureSizingLayout];
  sizingLayout = self->_sizingLayout;
  [(_UIVectorTextLayout *)sizingLayout lastLineBaseline];
  return result;
}

- (double)_preferredMaxLayoutWidth
{
  if (*(unsigned char *)&self->_labelFlags) {
    return self->_preferredMaxLayoutWidth;
  }
  double result = 0.0;
  if ((*(void *)&self->super._viewFlags & 0x4000000000000) == 0) {
    return self->_preferredMaxLayoutWidth;
  }
  return result;
}

- (BOOL)_needsDoubleUpdateConstraintsPass
{
  return (*(void *)&self->super._viewFlags & 0x20000000000000) != 0
      && [(UIVectorLabel *)self numberOfLines] != 1
      && (*(unsigned char *)&self->_labelFlags & 1) == 0;
}

- (void)_prepareForFirstIntrinsicContentSizeCalculation
{
  self->_preferredMaxLayoutWidth = 0.0;
  v2.receiver = self;
  v2.super_class = (Class)UIVectorLabel;
  [(UIView *)&v2 _prepareForFirstIntrinsicContentSizeCalculation];
}

- (void)_prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  self->_preferredMaxLayoutWidth = v8;
  v9.receiver = self;
  v9.super_class = (Class)UIVectorLabel;
  -[UIView _prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds:](&v9, sel__prepareForSecondIntrinsicContentSizeCalculationWithLayoutEngineBounds_, x, y, width, height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIVectorLabel;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"textLayout"];
  }

  return v5;
}

- (void)_setNeedsUpdateLayerIfNeeded
{
  uint64_t v3 = [(UIView *)self superview];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = +[UIView _isInAnimationBlockWithAnimationsEnabled];

    if (v5)
    {
      double v6 = [(UIView *)self _deferredAnimationForKey:@"textLayout"];
      [v6 addAnimationFrameForValue:MEMORY[0x1E4F1CC38]];
    }
  }
  [(UIView *)self _invalidateIntrinsicContentSizeNeedingLayout:1];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)UIVectorLabel;
  [(UIView *)&v5 layoutSubviews];
  [(UIVectorLabel *)self _ensureVisualLayout];
  visualLayout = self->_visualLayout;
  id v4 = [(UIVectorLabel *)self _labelLayer];
  [v4 setTextLayout:visualLayout];
}

- (void)_generateDeferredAnimations:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"textLayout"];
  if (v4)
  {
    id v6 = v4;
    [(UIVectorLabel *)self _ensureVisualLayout];
    [(UIView *)self setNeedsLayout];
    objc_super v5 = [(UIView *)self superview];
    [v5 layoutIfNeeded];

    id v4 = v6;
  }
}

- (id)_attributedTextCompatibleForSizing
{
  uint64_t v3 = [(UIVectorLabel *)self _content];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    objc_super v5 = [(UIVectorLabel *)self _content];
    uint64_t v6 = [v5 attributedString];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    objc_super v5 = [(UIVectorLabel *)self _defaultAttributes];
    uint64_t v6 = [v7 initWithString:@"x" attributes:v5];
  }
  double v8 = (void *)v6;

  return v8;
}

- (double)_multilineContextWidth
{
  return self->_multilineContextWidth;
}

- (void)_setMultilineContextWidth:(double)a3
{
  self->_multilineContextWidth = a3;
}

- (unint64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (double)preferredMaxLayoutWidth
{
  return self->_preferredMaxLayoutWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualLayout, 0);
  objc_storeStrong((id *)&self->_sizingLayout, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_defaultAttributes, 0);
  objc_storeStrong((id *)&self->_content, 0);
}

@end