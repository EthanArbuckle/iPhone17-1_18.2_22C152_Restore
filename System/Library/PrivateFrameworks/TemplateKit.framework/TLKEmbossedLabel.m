@interface TLKEmbossedLabel
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)shouldBadge;
- (CGSize)customInsetSize;
- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3;
- (CGSize)textOffset;
- (TLKEmbossedLabel)init;
- (TLKLabel)label;
- (TLKMultilineText)text;
- (TLKProminenceView)backgroundView;
- (UIColor)color;
- (UIFont)font;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)observedPropertiesChanged;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setColor:(id)a3;
- (void)setCustomInsetSize:(CGSize)a3;
- (void)setFont:(id)a3;
- (void)setLabel:(id)a3;
- (void)setShouldBadge:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 font:(id)a4 customInsetSize:(CGSize)a5 badge:(BOOL)a6;
- (void)setTextOffset:(CGSize)a3;
@end

@implementation TLKEmbossedLabel

- (TLKEmbossedLabel)init
{
  v9.receiver = self;
  v9.super_class = (Class)TLKEmbossedLabel;
  v2 = [(TLKView *)&v9 init];
  if (v2)
  {
    v3 = +[TLKProminenceView viewWithProminence:3];
    [(TLKEmbossedLabel *)v2 setBackgroundView:v3];

    v4 = [(TLKEmbossedLabel *)v2 backgroundView];
    [(TLKEmbossedLabel *)v2 addSubview:v4];

    v5 = objc_opt_new();
    [(TLKEmbossedLabel *)v2 setLabel:v5];

    v6 = [(TLKEmbossedLabel *)v2 label];
    [v6 setTextAlignment:1];

    v7 = [(TLKEmbossedLabel *)v2 label];
    [(TLKEmbossedLabel *)v2 addSubview:v7];

    v2->_shouldBadge = 1;
  }
  return v2;
}

- (void)setShouldBadge:(BOOL)a3
{
  if (self->_shouldBadge != a3)
  {
    self->_shouldBadge = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setColor:(id)a3
{
  v10 = (UIColor *)a3;
  if (self->_color != v10)
  {
    objc_storeStrong((id *)&self->_color, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        objc_super v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setFont:(id)a3
{
  v10 = (UIFont *)a3;
  if (self->_font != v10)
  {
    objc_storeStrong((id *)&self->_font, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        objc_super v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setText:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_text = &self->_text;
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_text setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v7 = *p_text;
      uint64_t v8 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(TLKMultilineText *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_text, a3);
  if (objc_opt_respondsToSelector())
  {
    [(TLKObject *)*p_text setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_text;
      uint64_t v14 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(TLKMultilineText *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)setText:(id)a3 font:(id)a4 customInsetSize:(CGSize)a5 badge:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.height;
  double width = a5.width;
  uint64_t v15 = (TLKMultilineText *)a3;
  v12 = (UIFont *)a4;
  text = self->_text;
  BOOL v14 = text != v15;
  if (text != v15) {
    objc_storeStrong((id *)&self->_text, a3);
  }
  if (self->_font != v12)
  {
    objc_storeStrong((id *)&self->_font, a4);
    BOOL v14 = 1;
  }
  if (self->_shouldBadge != v6)
  {
    self->_shouldBadge = v6;
    BOOL v14 = 1;
  }
  if (self->_customInsetSize.width != width || self->_customInsetSize.height != height)
  {
    self->_customInsetSize.double width = width;
    self->_customInsetSize.double height = height;
LABEL_10:
    [(TLKEmbossedLabel *)self observedPropertiesChanged];
    goto LABEL_11;
  }
  if (v14) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)observedPropertiesChanged
{
  v3 = [(TLKEmbossedLabel *)self font];

  if (!v3)
  {
    uint64_t v4 = +[TLKFontUtilities footnoteFont];
    [(TLKEmbossedLabel *)self setFont:v4];
  }
  id v5 = [(TLKEmbossedLabel *)self label];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__TLKEmbossedLabel_observedPropertiesChanged__block_invoke;
  v11[3] = &unk_1E5FD30E8;
  v11[4] = self;
  [v5 performBatchUpdates:v11];

  uint64_t v6 = [(TLKEmbossedLabel *)self shouldBadge] ^ 1;
  uint64_t v7 = [(TLKEmbossedLabel *)self backgroundView];
  [v7 setHidden:v6];

  -[TLKEmbossedLabel effectiveLayoutSizeFittingSize:](self, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v9 = v8;
  uint64_t v10 = [(TLKEmbossedLabel *)self backgroundView];
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:v9 * 0.5];
  objc_msgSend(v10, "tlks_setCornerRadius:withStyle:", *MEMORY[0x1E4F39EA0]);

  [(TLKEmbossedLabel *)self invalidateIntrinsicContentSize];
}

void __45__TLKEmbossedLabel_observedPropertiesChanged__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) text];
  v3 = [*(id *)(a1 + 32) label];
  [v3 setMultilineText:v2];

  uint64_t v4 = [*(id *)(a1 + 32) font];
  id v5 = [*(id *)(a1 + 32) label];
  [v5 setFont:v4];

  uint64_t v6 = [*(id *)(a1 + 32) color];
  uint64_t v7 = [*(id *)(a1 + 32) label];
  [v7 setTextColor:v6];

  uint64_t v8 = [*(id *)(a1 + 32) shouldBadge] ^ 1;
  id v9 = [*(id *)(a1 + 32) label];
  [v9 setProminence:v8];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TLKEmbossedLabel *)self label];
  [v4 setAdjustsFontSizeToFitWidth:v3];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  v2 = [(TLKEmbossedLabel *)self label];
  char v3 = [v2 adjustsFontSizeToFitWidth];

  return v3;
}

- (double)effectiveBaselineOffsetFromBottom
{
  char v3 = [(TLKEmbossedLabel *)self label];
  [v3 effectiveBaselineOffsetFromBottom];
  double v5 = v4 + self->_customInsetSize.height;

  return v5;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  char v3 = [(TLKEmbossedLabel *)self label];
  [v3 effectiveFirstBaselineOffsetFromTop];
  double v5 = v4 + self->_customInsetSize.height;

  return v5;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(TLKEmbossedLabel *)self label];
  objc_msgSend(v6, "effectiveLayoutSizeFittingSize:", width, height);
  double v8 = v7;
  double v10 = v9;

  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:self->_customInsetSize.width + self->_customInsetSize.width];
  double v12 = v8 + v11;
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:self->_customInsetSize.height + self->_customInsetSize.height];
  double v14 = v10 + v13;
  double v15 = v12;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)TLKEmbossedLabel;
  [(TLKView *)&v33 layoutSubviews];
  [(TLKEmbossedLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(TLKEmbossedLabel *)self backgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(TLKEmbossedLabel *)self label];
  [(TLKEmbossedLabel *)self bounds];
  objc_msgSend(v12, "effectiveLayoutSizeFittingSize:", v13, v14);
  double v16 = v15;

  [(TLKEmbossedLabel *)self textOffset];
  double v18 = v17;
  [(TLKEmbossedLabel *)self textOffset];
  double v20 = v19;
  [(TLKEmbossedLabel *)self bounds];
  double v21 = v20 + (CGRectGetHeight(v34) - v16) * 0.5;
  [(TLKEmbossedLabel *)self bounds];
  double Width = CGRectGetWidth(v35);
  [(TLKEmbossedLabel *)self textOffset];
  +[TLKLayoutUtilities deviceScaledRoundedRect:forView:](TLKLayoutUtilities, "deviceScaledRoundedRect:forView:", self, v18, v21, Width + v23 * -2.0, v16);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  long long v32 = [(TLKEmbossedLabel *)self label];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (TLKMultilineText)text
{
  return self->_text;
}

- (CGSize)textOffset
{
  double width = self->_textOffset.width;
  double height = self->_textOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setTextOffset:(CGSize)a3
{
  self->_textOffset = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (UIFont)font
{
  return self->_font;
}

- (CGSize)customInsetSize
{
  double width = self->_customInsetSize.width;
  double height = self->_customInsetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCustomInsetSize:(CGSize)a3
{
  self->_customInsetSize = a3;
}

- (TLKLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (TLKProminenceView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end