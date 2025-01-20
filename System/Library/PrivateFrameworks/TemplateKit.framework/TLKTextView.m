@interface TLKTextView
- (BOOL)allowsVibrancy;
- (BOOL)automaticUrlification;
- (CGSize)intrinsicContentSize;
- (TLKMultilineText)multilineText;
- (TLKTextView)init;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (unint64_t)prominence;
- (void)didMoveToWindow;
- (void)loadInlineImages;
- (void)setAutomaticUrlification:(BOOL)a3;
- (void)setMultilineText:(id)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAttributedString;
- (void)urlify;
@end

@implementation TLKTextView

- (TLKTextView)init
{
  v7.receiver = self;
  v7.super_class = (Class)TLKTextView;
  v2 = [(TLKTextView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(TLKTextView *)v2 setBackgroundColor:0];
    -[TLKTextView setTextContainerInset:](v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(TLKTextView *)v3 setScrollEnabled:0];
    [(TLKTextView *)v3 setUserInteractionEnabled:0];
    v4 = [(TLKTextView *)v3 textContainer];
    [v4 setLineFragmentPadding:0.0];

    v5 = [(TLKTextView *)v3 textContainer];
    [v5 setLineBreakMode:4];

    [(TLKTextView *)v3 setEditable:0];
    [(TLKTextView *)v3 setSelectable:1];
  }
  return v3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    [(UIView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)setText:(id)a3
{
  if (a3)
  {
    +[TLKMultilineText textWithString:](TLKMultilineText, "textWithString:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  v4 = [(TLKTextView *)self textContainer];
  objc_msgSend(v5, "setMaxLines:", objc_msgSend(v4, "maximumNumberOfLines"));

  [(TLKTextView *)self setMultilineText:v5];
}

- (void)setMultilineText:(id)a3
{
  objc_storeStrong((id *)&self->_multilineText, a3);
  id v5 = a3;
  [(TLKTextView *)self loadInlineImages];
  [(TLKTextView *)self updateAttributedString];
  uint64_t v6 = [v5 maxLines];

  objc_super v7 = [(TLKTextView *)self textContainer];
  [v7 setMaximumNumberOfLines:v6];

  [(TLKTextView *)self invalidateIntrinsicContentSize];
}

- (void)loadInlineImages
{
  v3 = [(TLKTextView *)self multilineText];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(TLKTextView *)self multilineText];
  }
  else
  {
    v4 = 0;
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__TLKTextView_loadInlineImages__block_invoke;
  v6[3] = &unk_1E5FD3020;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  +[TLKFontUtilities cacheInlineImagesForRichText:v5 inView:self updateHandler:v6];
}

void __31__TLKTextView_loadInlineImages__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__TLKTextView_loadInlineImages__block_invoke_2;
  v4[3] = &unk_1E5FD3020;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[TLKUtilities dispatchMainIfNecessary:v4];
}

void __31__TLKTextView_loadInlineImages__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) multilineText];

  if (v2 == v3)
  {
    v4 = *(void **)(a1 + 40);
    [v4 updateAttributedString];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKTextView;
  [(TLKTextView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(TLKTextView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  uint64_t v6 = [(TLKTextView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKTextView;
  [(TLKTextView *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)urlify
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v21 = [(TLKTextView *)self textStorage];
  objc_super v3 = [v21 string];
  if ([v3 length])
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F5F160]) initWithScannerType:1 passiveIntent:1];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = objc_msgSend(MEMORY[0x1E4F5F158], "scanString:range:configuration:", v3, 0, objc_msgSend(v3, "length"), v4);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      v18 = self;
      v19 = v4;
      v20 = v3;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v24;
      uint64_t v10 = *MEMORY[0x1E4FB12C8];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v5);
          }
          v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "url", v18);
          v14 = [v13 scheme];
          v15 = [v14 lowercaseString];

          if (([v15 isEqualToString:@"http"] & 1) != 0
            || [v15 isEqualToString:@"https"])
          {
            if (!v8) {
              uint64_t v8 = (void *)[v21 mutableCopy];
            }
            uint64_t v16 = [v12 urlificationRange];
            objc_msgSend(v8, "addAttribute:value:range:", v10, v13, v16, v17);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);

      if (!v8)
      {
        objc_super v3 = v20;
        goto LABEL_20;
      }
      v22.receiver = v18;
      v22.super_class = (Class)TLKTextView;
      [(TLKTextView *)&v22 setText:&stru_1F0959D88];
      id v4 = [(TLKTextView *)v18 textStorage];
      [v4 appendAttributedString:v8];
      objc_super v3 = v20;
    }
    else
    {

      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_20:
}

- (void)tlk_updateForAppearance:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TLKTextView;
  [(UIView *)&v4 tlk_updateForAppearance:a3];
  [(TLKTextView *)self loadInlineImages];
  [(TLKTextView *)self updateAttributedString];
}

- (void)updateAttributedString
{
  objc_super v3 = +[TLKAppearance bestAppearanceForView:self];
  objc_super v4 = [(TLKTextView *)self attributedText];
  id v5 = (void *)[v4 copy];

  v33.receiver = self;
  v33.super_class = (Class)TLKTextView;
  [(TLKTextView *)&v33 setText:&stru_1F0959D88];
  uint64_t v6 = [(TLKTextView *)self multilineText];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v8 = [(TLKTextView *)self multilineText];
  uint64_t v9 = v8;
  if (isKindOfClass)
  {
    uint64_t v10 = [(TLKTextView *)self textStorage];
    unint64_t v11 = [(TLKTextView *)self prominence];
    uint64_t v12 = [(TLKTextView *)self textAlignment];
    v13 = [(TLKTextView *)self font];
    [(TLKTextView *)self effectiveScreenScale];
    double v15 = v14;
    LOBYTE(v30) = [v3 isDark];
    uint64_t v16 = +[TLKFontUtilities attributedStringForRichText:v9 appearance:v3 prominence:v11 alignment:v12 font:v13 isButton:0 scale:v15 isDark:v30];
    [v10 appendAttributedString:v16];

    uint64_t v17 = [(TLKTextView *)self attributedText];
    uint64_t v18 = [v17 length];

    if (!v18)
    {
      uint64_t v19 = [v9 text];
      v20 = (void *)v19;
      if (v19) {
        v21 = (__CFString *)v19;
      }
      else {
        v21 = &stru_1F0959D88;
      }
      v32.receiver = self;
      v32.super_class = (Class)TLKTextView;
      [(TLKTextView *)&v32 setText:v21];
    }
    if ([(TLKTextView *)self automaticUrlification])
    {
      objc_super v22 = [(TLKTextView *)self textStorage];
      char v23 = [v5 isEqual:v22];

      if ((v23 & 1) == 0) {
        [(TLKTextView *)self urlify];
      }
    }
  }
  else
  {

    if (v9)
    {
      long long v24 = [(TLKTextView *)self multilineText];
      long long v25 = [v24 text];
      v31.receiver = self;
      v31.super_class = (Class)TLKTextView;
      [(TLKTextView *)&v31 setText:v25];

      if ([(TLKTextView *)self automaticUrlification])
      {
        long long v26 = [(TLKTextView *)self textStorage];
        char v27 = [v5 isEqual:v26];

        if ((v27 & 1) == 0) {
          [(TLKTextView *)self urlify];
        }
      }
    }
    else
    {
      uint64_t v28 = [(TLKTextView *)self textStorage];
      [v28 setAttributedString:v5];
    }
  }
  v29 = objc_msgSend(v3, "colorForProminence:", -[TLKTextView prominence](self, "prominence"));
  [(TLKTextView *)self setTextColor:v29];

  [v3 enableAppearanceForView:self];
}

- (BOOL)allowsVibrancy
{
  return 1;
}

- (CGSize)intrinsicContentSize
{
  objc_super v3 = [(TLKTextView *)self textContainer];
  objc_super v4 = [(TLKTextView *)self layoutManager];
  [v4 ensureLayoutForTextContainer:v3];
  [v4 usedRectForTextContainer:v3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  v8.receiver = self;
  v8.super_class = (Class)TLKTextView;
  [(TLKTextView *)&v8 effectiveFirstBaselineOffsetFromTop];
  if (v3 != 0.0) {
    return v3;
  }
  objc_super v4 = [(TLKTextView *)self font];
  [v4 ascender];
  +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self);
  double v6 = v5;

  return v6;
}

- (double)effectiveBaselineOffsetFromBottom
{
  v9.receiver = self;
  v9.super_class = (Class)TLKTextView;
  [(TLKTextView *)&v9 effectiveBaselineOffsetFromBottom];
  if (v3 != 0.0) {
    return v3;
  }
  objc_super v4 = [(TLKTextView *)self font];
  [v4 descender];
  +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:-v5];
  double v7 = v6;

  return v7;
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (TLKMultilineText)multilineText
{
  return self->_multilineText;
}

- (BOOL)automaticUrlification
{
  return self->_automaticUrlification;
}

- (void)setAutomaticUrlification:(BOOL)a3
{
  self->_automaticUrlification = a3;
}

- (void).cxx_destruct
{
}

@end