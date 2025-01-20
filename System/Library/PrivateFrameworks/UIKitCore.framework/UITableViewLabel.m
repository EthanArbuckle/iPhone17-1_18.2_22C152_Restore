@interface UITableViewLabel
- (BOOL)_attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:(id)a3;
- (BOOL)usingDefaultFont;
- (UITableViewCell)tableCell;
- (UITableViewLabel)initWithCoder:(id)a3;
- (UITableViewLabel)initWithFrame:(CGRect)a3;
- (id)_disabledFontColor;
- (void)_cleanupErrantFirstLineHeadIndent;
- (void)_clearNumberOfLines;
- (void)_restoreNumberOfLines;
- (void)_setDefaultFont:(id)a3;
- (void)_setFirstParagraphFirstLineHeadIndent:(double)a3;
- (void)_setNumberOfLinesForAXLayoutIfNecessary;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setTableCell:(id)a3;
- (void)setText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITableViewLabel

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewLabel;
  [(UILabel *)&v25 traitCollectionDidChange:v4];
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_24;
  }
  NSInteger v5 = [(UILabel *)self numberOfLines];
  uint64_t v6 = [v4 userInterfaceIdiom];
  v7 = [(UIView *)self traitCollection];
  if (v6 == [v7 userInterfaceIdiom])
  {

    goto LABEL_10;
  }
  v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 != 3)
  {
LABEL_10:
    v12 = [(UIView *)self traitCollection];
    v13 = [v12 preferredContentSizeCategory];
    v14 = [v4 preferredContentSizeCategory];
    char v15 = [v13 isEqual:v14];

    v16 = [(UIView *)self traitCollection];
    v17 = [v16 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    v19 = [v4 preferredContentSizeCategory];
    BOOL v20 = UIContentSizeCategoryIsAccessibilityCategory(v19);

    if ((v15 & 1) == 0)
    {
      if (v5) {
        BOOL v21 = IsAccessibilityCategory;
      }
      else {
        BOOL v21 = 0;
      }
      if (v21)
      {
        [(UITableViewLabel *)self _clearNumberOfLines];
      }
      else if (v20 && !IsAccessibilityCategory)
      {
        int64_t savedNumberOfLines = self->_savedNumberOfLines;
        if (savedNumberOfLines != 0x7FFFFFFFFFFFFFFFLL && v5 != savedNumberOfLines) {
          [(UITableViewLabel *)self _restoreNumberOfLines];
        }
      }
      if (!IsAccessibilityCategory || v20)
      {
        if (self->_shadowAttributedText)
        {
          -[UITableViewLabel setAttributedText:](self, "setAttributedText:");
          shadowAttributedText = self->_shadowAttributedText;
          self->_shadowAttributedText = 0;
        }
      }
      else
      {
        v24 = [(UILabel *)self attributedText];
        [(UITableViewLabel *)self setAttributedText:v24];
      }
    }
    goto LABEL_24;
  }
  int64_t v10 = self->_savedNumberOfLines;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v5 != v10) {
    [(UITableViewLabel *)self _restoreNumberOfLines];
  }
LABEL_24:
}

- (void)_setFirstParagraphFirstLineHeadIndent:(double)a3
{
  double firstParagraphFirstLineHeadIndent = self->_firstParagraphFirstLineHeadIndent;
  double v4 = fmax(a3, 0.0);
  self->_double firstParagraphFirstLineHeadIndent = v4;
  if (firstParagraphFirstLineHeadIndent != v4)
  {
    if (self->_shadowAttributedText)
    {
      -[UITableViewLabel setAttributedText:](self, "setAttributedText:");
    }
    else
    {
      id v6 = [(UILabel *)self attributedText];
      [(UITableViewLabel *)self setAttributedText:v6];
    }
  }
}

- (id)_disabledFontColor
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewLabel;
  v2 = [(UILabel *)&v4 _disabledFontColor];
  return v2;
}

- (void)setFont:(id)a3
{
  self->_usingDefaultFont = 0;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewLabel;
  [(UILabel *)&v3 setFont:a3];
}

- (void)setTableCell:(id)a3
{
}

- (UITableViewLabel)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UITableViewLabel;
  objc_super v3 = -[UILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v4 = v3;
  if (v3)
  {
    v3->_int64_t savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
    v3->_usingDefaultFont = 1;
    [(UITableViewLabel *)v3 _setNumberOfLinesForAXLayoutIfNecessary];
  }
  return v4;
}

- (void)_setNumberOfLinesForAXLayoutIfNecessary
{
  id v5 = [(UIView *)self traitCollection];
  if ([v5 userInterfaceIdiom] == 3 || (dyld_program_sdk_at_least() & 1) == 0)
  {
  }
  else
  {
    objc_super v3 = [(id)UIApp preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    if (IsAccessibilityCategory)
    {
      [(UITableViewLabel *)self _clearNumberOfLines];
    }
  }
}

- (void)_setDefaultFont:(id)a3
{
  id v4 = a3;
  self->_usingDefaultFont = 1;
  id v5 = [(UILabel *)self font];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UITableViewLabel;
    [(UILabel *)&v6 setFont:v4];
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UILabel *)self text];
  if ((id)v5 == v4)
  {
  }
  else
  {
    objc_super v6 = (void *)v5;
    v7 = [(UILabel *)self text];
    char v8 = [v4 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      if (dyld_program_sdk_at_least()
        && self->_firstParagraphFirstLineHeadIndent != 0.0
        && [v4 length])
      {
        uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4];
        [(UITableViewLabel *)self setAttributedText:v9];
      }
      else
      {
        shadowAttributedText = self->_shadowAttributedText;
        self->_shadowAttributedText = 0;

        v15.receiver = self;
        v15.super_class = (Class)UITableViewLabel;
        [(UILabel *)&v15 setText:v4];
        if (dyld_program_sdk_at_least()) {
          [(UITableViewLabel *)self _cleanupErrantFirstLineHeadIndent];
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tableCell);
      v12 = WeakRetained;
      if (WeakRetained)
      {
        [WeakRetained _contentViewLabelTextDidChange:self];
      }
      else
      {
        v13 = [(UIView *)self superview];
        if (v13)
        {
          do
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              break;
            }
            uint64_t v14 = [v13 superview];

            v13 = (void *)v14;
          }
          while (v14);
        }
        [v13 setNeedsLayout];
      }
    }
  }
}

- (void)_cleanupErrantFirstLineHeadIndent
{
  objc_super v3 = [(UILabel *)self _content];
  int v4 = [v3 isAttributed];

  if (v4)
  {
    uint64_t v5 = [(UILabel *)self _content];
    objc_super v6 = [v5 attributedString];

    if ([v6 length])
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v7 = *(void *)off_1E52D21B8;
      char v8 = [v6 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:&v15];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        v11 = [(UILabel *)self _defaultAttributes];
        id v10 = [v11 objectForKey:v7];
      }
      [v10 firstLineHeadIndent];
      if (v12 != 0.0)
      {
        v13 = (void *)[v10 mutableCopy];
        [v13 setFirstLineHeadIndent:0.0];
        uint64_t v14 = (void *)[v6 mutableCopy];
        objc_msgSend(v14, "addAttribute:value:range:", v7, v13, v15, v16);
        [(UITableViewLabel *)self setAttributedText:v14];
      }
    }
  }
}

- (void)_clearNumberOfLines
{
  self->_int64_t savedNumberOfLines = [(UILabel *)self numberOfLines];
  [(UILabel *)self setNumberOfLines:0];
}

- (void)_restoreNumberOfLines
{
  self->_int64_t savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
}

- (UITableViewLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITableViewLabel;
  uint64_t v5 = [(UILabel *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    v5->_int64_t savedNumberOfLines = 0x7FFFFFFFFFFFFFFFLL;
    v5->_usingDefaultFont = [v4 containsValueForKey:@"UIFont"] ^ 1;
    [(UITableViewLabel *)v6 _setNumberOfLinesForAXLayoutIfNecessary];
  }

  return v6;
}

- (BOOL)_attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = [v3 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0];
    [v4 firstLineHeadIndent];
    BOOL v6 = v5 != 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  double v5 = (NSAttributedString *)[v4 copy];
  shadowAttributedText = self->_shadowAttributedText;
  self->_shadowAttributedText = v5;

  if (dyld_program_sdk_at_least()
    && self->_firstParagraphFirstLineHeadIndent != 0.0
    && [v4 length])
  {
    [(UILabel *)self _setOverallWritingDirectionFollowsLayoutDirection:1];
    uint64_t v7 = (void *)[v4 mutableCopy];
    uint64_t v8 = *(void *)off_1E52D21B8;
    uint64_t v9 = [v4 attribute:*(void *)off_1E52D21B8 atIndex:0 effectiveRange:0];
    id v10 = (void *)[v9 mutableCopy];
    v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = objc_alloc_init((Class)off_1E52D2D48);
    }
    uint64_t v14 = v12;

    [v14 setFirstLineHeadIndent:self->_firstParagraphFirstLineHeadIndent];
    if (!v9)
    {
      uint64_t v15 = [off_1E52D2DD0 defaultParagraphStyle];
      objc_msgSend(v7, "addAttribute:value:range:", v8, v15, 0, objc_msgSend(v7, "length"));
    }
    uint64_t v16 = [v4 string];
    uint64_t v17 = objc_msgSend(v16, "paragraphRangeForRange:", 0, 0);
    objc_msgSend(v7, "addAttribute:value:range:", v8, v14, v17, v18);

    int v13 = 0;
  }
  else
  {
    [(UILabel *)self _setOverallWritingDirectionFollowsLayoutDirection:0];
    if (dyld_program_sdk_at_least()) {
      int v13 = ![(UITableViewLabel *)self _attributedStringHasParagraphStyleWithNonzeroFirstLineHeadIndent:v4];
    }
    else {
      int v13 = 0;
    }
    uint64_t v7 = v4;
  }
  v19.receiver = self;
  v19.super_class = (Class)UITableViewLabel;
  [(UILabel *)&v19 setAttributedText:v7];
  if (v13) {
    [(UITableViewLabel *)self _cleanupErrantFirstLineHeadIndent];
  }
}

- (UITableViewCell)tableCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableCell);
  return (UITableViewCell *)WeakRetained;
}

- (BOOL)usingDefaultFont
{
  return self->_usingDefaultFont;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tableCell);
  objc_storeStrong((id *)&self->_shadowAttributedText, 0);
}

@end