@interface _UIActivityIndicatorMessageLabel
+ (id)defaultRegularContentSizeTextAttributes;
- (NSDictionary)effectiveTextAttributes;
- (NSDictionary)regularTextAttributes;
- (_UIActivityIndicatorMessageLabel)initWithRegularTextAttributes:(id)a3;
- (double)_effectiveVerticalSpacingToSpinner;
- (double)verticalSpacingToSpinner;
- (id)_effectiveAttributesDerivedFromRegularTextAttributes:(id)a3;
- (id)_validatedAttributedString:(id)a3;
- (void)_ensureCapableOfCalculatingBaselineOffsets;
- (void)setAttributedText:(id)a3;
- (void)setEffectiveTextAttributes:(id)a3;
- (void)setRegularTextAttributes:(id)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation _UIActivityIndicatorMessageLabel

+ (id)defaultRegularContentSizeTextAttributes
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = [off_1E52D39B8 systemFontOfSize:11.0];
  [v2 setObject:v3 forKey:*(void *)off_1E52D2040];

  v4 = +[UIColor systemGrayColor];
  [v2 setObject:v4 forKey:*(void *)off_1E52D2048];

  return v2;
}

- (_UIActivityIndicatorMessageLabel)initWithRegularTextAttributes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActivityIndicatorMessageLabel;
  v6 = -[UILabel initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_regularTextAttributes, a3);
    objc_storeStrong((id *)&v7->_effectiveTextAttributes, a3);
    [(UIView *)v7 setBackgroundColor:0];
    [(UIView *)v7 setOpaque:0];
    [(_UIActivityIndicatorMessageLabel *)v7 _ensureCapableOfCalculatingBaselineOffsets];
  }

  return v7;
}

- (double)verticalSpacingToSpinner
{
  [(UILabel *)self _firstLineBaselineOffsetFromBoundsTop];
  double v4 = v3;
  [(_UIActivityIndicatorMessageLabel *)self _effectiveVerticalSpacingToSpinner];
  return v5 - v4;
}

- (void)setText:(id)a3
{
  double v4 = (objc_class *)MEMORY[0x1E4F28B18];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithString:v5];

  [(_UIActivityIndicatorMessageLabel *)self setAttributedText:v6];
}

- (void)setAttributedText:(id)a3
{
  double v4 = [(_UIActivityIndicatorMessageLabel *)self _validatedAttributedString:a3];
  id v5 = [(_UIActivityIndicatorMessageLabel *)self effectiveTextAttributes];
  id v6 = (void *)[v4 mutableCopy];
  objc_msgSend(v6, "addAttributes:range:", v5, 0, objc_msgSend(v6, "length"));
  v7.receiver = self;
  v7.super_class = (Class)_UIActivityIndicatorMessageLabel;
  [(UILabel *)&v7 setAttributedText:v6];
  [(_UIActivityIndicatorMessageLabel *)self _ensureCapableOfCalculatingBaselineOffsets];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActivityIndicatorMessageLabel;
  [(UILabel *)&v5 traitCollectionDidChange:a3];
  double v4 = [(_UIActivityIndicatorMessageLabel *)self _effectiveAttributesDerivedFromRegularTextAttributes:self->_regularTextAttributes];
  [(_UIActivityIndicatorMessageLabel *)self setEffectiveTextAttributes:v4];
}

- (void)setEffectiveTextAttributes:(id)a3
{
  id v8 = a3;
  if ((-[NSDictionary isEqual:](self->_effectiveTextAttributes, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_effectiveTextAttributes, a3);
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v6 = [(UILabel *)self text];
    objc_super v7 = (void *)[v5 initWithString:v6 attributes:v8];

    [(_UIActivityIndicatorMessageLabel *)self setAttributedText:v7];
  }
}

- (id)_effectiveAttributesDerivedFromRegularTextAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(UIView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  id v8 = v4;
  if (IsAccessibilityCategory)
  {
    id v8 = (void *)[v4 mutableCopy];
    uint64_t v9 = *(void *)off_1E52D2040;
    v10 = [v4 objectForKeyedSubscript:*(void *)off_1E52D2040];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [off_1E52D39B8 systemFontOfSize:11.0];
    }
    v13 = v12;

    [v13 pointSize];
    v15 = [v13 fontWithSize:v14 + v14 + 2.0];
    [v8 setObject:v15 forKeyedSubscript:v9];
  }
  return v8;
}

- (double)_effectiveVerticalSpacingToSpinner
{
  v2 = [(UIView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  double result = 36.0;
  if (!IsAccessibilityCategory) {
    return 18.0;
  }
  return result;
}

- (id)_validatedAttributedString:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    if (v3) {
      uint64_t v4 = [v3 mutableCopy];
    }
    else {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1ED0E84C0];
    }
    id v5 = (void *)v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v5 appendAttributedString:v6];

    id v3 = v5;
  }
  return v3;
}

- (void)_ensureCapableOfCalculatingBaselineOffsets
{
  id v3 = [(UILabel *)self text];
  uint64_t v4 = [v3 length];

  if (!v4) {
    [(_UIActivityIndicatorMessageLabel *)self setText:@" "];
  }
  [(UIView *)self sizeToFit];
  -[UILabel _invalidateLabelDisplay](self);
  -[UILabel _invalidateLabelMetrics]((uint64_t)self);
}

- (NSDictionary)regularTextAttributes
{
  return self->_regularTextAttributes;
}

- (void)setRegularTextAttributes:(id)a3
{
}

- (NSDictionary)effectiveTextAttributes
{
  return self->_effectiveTextAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectiveTextAttributes, 0);
  objc_storeStrong((id *)&self->_regularTextAttributes, 0);
}

@end