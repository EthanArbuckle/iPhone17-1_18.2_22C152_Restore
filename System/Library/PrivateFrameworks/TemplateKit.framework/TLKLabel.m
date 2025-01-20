@interface TLKLabel
+ (BOOL)stringStartsWithQuote:(id)a3;
+ (id)primaryLabel;
+ (id)secondaryLabel;
+ (id)tertiaryLabel;
- (BOOL)attributedTextExplicitelySet;
- (BOOL)attributedTextUpdateDisabled;
- (BOOL)attributedTextUpdateSkipped;
- (BOOL)autoHideIfNoContent;
- (BOOL)hasCustomTextColor;
- (BOOL)hasEmphasizedFormattingInRichText;
- (BOOL)supportsColorGlyphs;
- (BOOL)useButtonColoring;
- (TLKFormattedText)formattedText;
- (TLKLabel)init;
- (TLKLabel)initWithProminence:(unint64_t)a3;
- (TLKRichText)richText;
- (UIEdgeInsets)unadjustedCustemAlignmentRectInsets;
- (UIFont)originalFont;
- (UILabel)overlayLabelForNonColoredGlyphs;
- (unint64_t)adjustedProminence;
- (unint64_t)prominence;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)loadInlineImages;
- (void)performBatchUpdates:(id)a3;
- (void)setAdjustedProminence:(unint64_t)a3;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTextExplicitelySet:(BOOL)a3;
- (void)setAttributedTextUpdateDisabled:(BOOL)a3;
- (void)setAttributedTextUpdateSkipped:(BOOL)a3;
- (void)setAutoHideIfNoContent:(BOOL)a3;
- (void)setCustomAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setFont:(id)a3;
- (void)setFont:(id)a3 keepOriginal:(BOOL)a4;
- (void)setFormattedText:(id)a3;
- (void)setHasCustomTextColor:(BOOL)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setMultilineText:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setOriginalFont:(id)a3;
- (void)setOverlayLabelForNonColoredGlyphs:(id)a3;
- (void)setProminence:(unint64_t)a3;
- (void)setRichText:(id)a3;
- (void)setSupportsColorGlyphs:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setUnadjustedCustemAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setUseButtonColoring:(BOOL)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAdjustedProminence;
- (void)updateAttributedText;
- (void)updateWithAttributedString:(id)a3;
- (void)updateWithString:(id)a3;
@end

@implementation TLKLabel

- (void)setFont:(id)a3
{
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TLKLabel;
  [(TLKLabel *)&v3 didMoveToWindow];
  [(UIView *)self tlk_updateWithCurrentAppearance];
}

- (void)setFont:(id)a3 keepOriginal:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(TLKLabel *)self font];

  if (v7 != v6)
  {
    if (!a4)
    {
      originalFont = self->_originalFont;
      self->_originalFont = 0;
    }
    v10.receiver = self;
    v10.super_class = (Class)TLKLabel;
    [(TLKLabel *)&v10 setFont:v6];
    v9 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
    [v9 setFont:v6];

    [(TLKLabel *)self updateAttributedText];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)TLKLabel;
  [(TLKLabel *)&v12 layoutSubviews];
  [(TLKLabel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UILabel)overlayLabelForNonColoredGlyphs
{
  return self->_overlayLabelForNonColoredGlyphs;
}

void __36__TLKLabel_tlk_updateForAppearance___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attributedText];
  int v3 = [*(id *)(a1 + 32) attributedTextExplicitelySet];
  [*(id *)(a1 + 32) updateWithAttributedString:0];
  int v4 = [*(id *)(a1 + 32) useButtonColoring];
  double v5 = *(void **)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 32) adjustedProminence];
  if (v4) {
    [v5 buttonColorForProminence:v6];
  }
  else {
  double v7 = [v5 colorForProminence:v6];
  }
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)TLKLabel;
  objc_msgSendSuper2(&v12, sel_setTextColor_, v7);

  double v8 = [*(id *)(a1 + 32) textColor];
  double v9 = [*(id *)(a1 + 32) overlayLabelForNonColoredGlyphs];
  [v9 setTextColor:v8];

  double v10 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) updateWithAttributedString:v2];
  }
  else
  {
    v11 = [v2 string];
    [v10 updateWithString:v11];
  }
  [*(id *)(a1 + 32) updateAttributedText];
}

- (void)setRichText:(id)a3
{
  id v13 = a3;
  if (!v13) {
    [(TLKLabel *)self updateWithAttributedString:0];
  }
  unint64_t v5 = [(TLKLabel *)self adjustedProminence];
  objc_storeStrong((id *)&self->_richText, a3);
  if (v13)
  {
    uint64_t v6 = [v13 maxLines];
    if (!v6)
    {
      double v7 = [v13 formattedTextItems];
      if ([v7 count] == 1)
      {
        double v8 = [v13 formattedTextItems];
        double v9 = [v8 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        double v7 = [v13 formattedTextItems];
        v11 = [v7 firstObject];
        uint64_t v6 = [v11 maxLines];
      }
      else
      {
        uint64_t v6 = 0;
      }
    }
LABEL_11:
    [(TLKLabel *)self setNumberOfLines:v6];
  }
  [(TLKLabel *)self loadInlineImages];
  [(TLKLabel *)self updateAdjustedProminence];
  if (v5 == [(TLKLabel *)self adjustedProminence]
    || ([(TLKLabel *)self window], objc_super v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    [(TLKLabel *)self updateAttributedText];
  }
  else
  {
    [(UIView *)self tlk_updateWithCurrentAppearance];
  }
}

- (unint64_t)adjustedProminence
{
  return self->_adjustedProminence;
}

- (void)loadInlineImages
{
  int v3 = [(TLKLabel *)self richText];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__TLKLabel_loadInlineImages__block_invoke;
  v5[3] = &unk_1E5FD3020;
  id v6 = v3;
  double v7 = self;
  id v4 = v3;
  +[TLKFontUtilities cacheInlineImagesForRichText:v4 inView:self updateHandler:v5];
}

- (void)updateAdjustedProminence
{
  unint64_t v3 = [(TLKLabel *)self prominence];
  if (!v3) {
    unint64_t v3 = [(TLKLabel *)self hasEmphasizedFormattingInRichText];
  }
  [(TLKLabel *)self setAdjustedProminence:v3];
}

- (unint64_t)prominence
{
  return self->_prominence;
}

- (void)setAdjustedProminence:(unint64_t)a3
{
  self->_adjustedProminence = a3;
}

- (void)setTextColor:(id)a3
{
  id v4 = a3;
  id v5 = [(TLKLabel *)self textColor];

  if (v5 != v4)
  {
    [(TLKLabel *)self setHasCustomTextColor:v4 != 0];
    if (v4)
    {
      v9.receiver = self;
      v9.super_class = (Class)TLKLabel;
      [(TLKLabel *)&v9 setTextColor:v4];
      id v6 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
      double v7 = [v6 superview];

      if (v7)
      {
        double v8 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
        [v8 setTextColor:v4];
      }
      [(TLKLabel *)self updateAttributedText];
    }
    else
    {
      [(UIView *)self tlk_updateWithCurrentAppearance];
    }
  }
}

- (void)setNumberOfLines:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setNumberOfLines:](&v6, sel_setNumberOfLines_);
  id v5 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
  [v5 setNumberOfLines:a3];
}

- (void)updateAttributedText
{
  v102[1] = *MEMORY[0x1E4F143B8];
  if ([(TLKLabel *)self attributedTextUpdateDisabled])
  {
    [(TLKLabel *)self setAttributedTextUpdateSkipped:1];
    return;
  }
  unint64_t v3 = +[TLKAppearance bestAppearanceForView:self];
  BOOL v4 = [(TLKLabel *)self hasCustomTextColor];
  id v5 = [(TLKLabel *)self richText];

  if (!v5)
  {
    if (v4) {
      goto LABEL_42;
    }
LABEL_43:
    [v3 enableAppearanceForView:self];
    goto LABEL_44;
  }
  BOOL v77 = v4;
  [(TLKLabel *)self updateWithAttributedString:0];
  objc_super v6 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
  [v6 removeFromSuperview];

  uint64_t v7 = objc_opt_new();
  v81 = objc_opt_new();
  double v8 = objc_opt_new();
  uint64_t v9 = objc_opt_new();
  double v10 = [(TLKLabel *)self richText];
  unint64_t v11 = [(TLKLabel *)self adjustedProminence];
  uint64_t v12 = [(TLKLabel *)self textAlignment];
  id v13 = [(TLKLabel *)self font];
  BOOL v14 = [(TLKLabel *)self useButtonColoring];
  [(TLKLabel *)self effectiveScreenScale];
  double v16 = v15;
  BYTE1(v74) = [v3 isDark];
  LOBYTE(v74) = v14;
  v79 = (void *)v9;
  unint64_t v17 = v11;
  v18 = v8;
  v82 = (void *)v7;
  v19 = +[TLKFontUtilities attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:](TLKFontUtilities, "attributedStringForRichText:appearance:prominence:alignment:coloredRanges:nonColoredRanges:rangesForNonTemplateImageAttachments:rangesForTemplateImageAttachments:font:isButton:scale:isDark:", v10, v3, v17, v12, v81, v7, v16, v8, v9, v13, v74);

  v20 = v81;
  v21 = [v8 allKeys];
  [v81 addObjectsFromArray:v21];

  obuint64_t j = [v3 isVibrant];
  uint64_t v22 = [v19 length];
  if ([(TLKLabel *)self supportsColorGlyphs])
  {
    int v23 = [v81 count] ? 0 : obj;
    if (v23 == 1)
    {
      objc_msgSend(v19, "fixAttributesInRange:", 0, v22);
      [v82 removeAllObjects];
      uint64_t v24 = *MEMORY[0x1E4FB12B0];
      v96[0] = MEMORY[0x1E4F143A8];
      v96[1] = 3221225472;
      v96[2] = __32__TLKLabel_updateAttributedText__block_invoke;
      v96[3] = &unk_1E5FD34E0;
      id v97 = v81;
      id v98 = v82;
      objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", v24, 0, v22, 0, v96);
    }
  }
  v25 = [MEMORY[0x1E4FB1380] defaultParagraphStyle];
  v26 = (void *)[v25 mutableCopy];

  objc_msgSend(v26, "setLineBreakMode:", -[TLKLabel lineBreakMode](self, "lineBreakMode"));
  objc_msgSend(v26, "setAlignment:", -[TLKLabel textAlignment](self, "textAlignment"));
  [(TLKLabel *)self unadjustedCustemAlignmentRectInsets];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v80 = v3;
  if ((unint64_t)[v19 length] >= 2)
  {
    v35 = objc_msgSend(v19, "attributedSubstringFromRange:", 1, 1);
    v36 = objc_opt_class();
    v37 = [v19 string];
    if ([v36 stringStartsWithQuote:v37])
    {
      v38 = [v35 string];
      v39 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      uint64_t v75 = [v38 rangeOfCharacterFromSet:v39];

      v20 = v81;
      if (v75 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 = objc_msgSend(v19, "attributedSubstringFromRange:", 0, 2);
        [v40 size];
        double v42 = v41;
        [v35 size];
        +[TLKLayoutUtilities roundedValue:self inView:v42 - v43];
        double v30 = v44;

        [v26 setHeadIndent:v30];
      }
    }
    else
    {
    }
    unint64_t v3 = v80;
  }
  v95.receiver = self;
  v95.super_class = (Class)TLKLabel;
  -[TLKLabel setCustomAlignmentRectInsets:](&v95, sel_setCustomAlignmentRectInsets_, v28, v30, v32, v34);
  uint64_t v101 = *MEMORY[0x1E4FB12D0];
  v102[0] = v26;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:&v101 count:1];
  objc_msgSend(v19, "addAttributes:range:", v45, 0, v22);

  if ([v20 count]) {
    int v46 = obj;
  }
  else {
    int v46 = 0;
  }
  if (v46 == 1)
  {
    id v47 = v19;
    v48 = (void *)[v47 mutableCopy];
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __32__TLKLabel_updateAttributedText__block_invoke_2;
    v93[3] = &unk_1E5FD3508;
    id v49 = v48;
    id v94 = v49;
    v78 = v18;
    [v18 enumerateKeysAndObjectsUsingBlock:v93];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id obja = v20;
    uint64_t v50 = [obja countByEnumeratingWithState:&v89 objects:v100 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v90;
      uint64_t v53 = *MEMORY[0x1E4FB12B8];
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v90 != v52) {
            objc_enumerationMutation(obja);
          }
          v55 = *(void **)(*((void *)&v89 + 1) + 8 * i);
          v56 = [MEMORY[0x1E4FB1618] clearColor];
          uint64_t v57 = [v55 rangeValue];
          objc_msgSend(v49, "addAttribute:value:range:", v53, v56, v57, v58);
        }
        uint64_t v51 = [obja countByEnumeratingWithState:&v89 objects:v100 count:16];
      }
      while (v51);
    }
    v76 = v26;

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v59 = v82;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v86;
      uint64_t v63 = *MEMORY[0x1E4FB12B8];
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v86 != v62) {
            objc_enumerationMutation(v59);
          }
          v65 = *(void **)(*((void *)&v85 + 1) + 8 * j);
          v66 = [MEMORY[0x1E4FB1618] clearColor];
          uint64_t v67 = [v65 rangeValue];
          objc_msgSend(v47, "addAttribute:value:range:", v63, v66, v67, v68);
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v85 objects:v99 count:16];
      }
      while (v61);
    }

    [(TLKLabel *)self updateWithAttributedString:v47];
    v69 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
    if (!v69)
    {
      v69 = objc_opt_new();
      objc_msgSend(v69, "setNumberOfLines:", -[TLKLabel numberOfLines](self, "numberOfLines"));
      objc_msgSend(v69, "setTextAlignment:", -[TLKLabel textAlignment](self, "textAlignment"));
      objc_msgSend(v69, "setLineBreakMode:", -[TLKLabel lineBreakMode](self, "lineBreakMode"));
      [(TLKLabel *)self setOverlayLabelForNonColoredGlyphs:v69];
    }
    v70 = [(TLKLabel *)self font];
    [v69 setFont:v70];

    v71 = objc_msgSend(v80, "colorForProminence:", -[TLKLabel adjustedProminence](self, "adjustedProminence"));
    [v69 setTextColor:v71];

    [(TLKLabel *)self addSubview:v69];
    [v80 enableAppearanceForView:v69];
    [v69 setAttributedText:v49];
    [(TLKLabel *)self setNeedsLayout];

    unint64_t v3 = v80;
    goto LABEL_42;
  }
  [(TLKLabel *)self updateWithAttributedString:v19];

  if (!v77) {
    goto LABEL_43;
  }
LABEL_42:
  [v3 disableAppearanceForView:self];
LABEL_44:
  v72 = [(TLKLabel *)self text];
  uint64_t v73 = [v72 length];

  if (!v73) {
    [(TLKLabel *)self updateWithString:@" "];
  }
}

- (TLKRichText)richText
{
  return self->_richText;
}

- (BOOL)attributedTextUpdateDisabled
{
  return self->_attributedTextUpdateDisabled;
}

- (BOOL)hasCustomTextColor
{
  return self->_hasCustomTextColor;
}

- (void)updateWithAttributedString:(id)a3
{
  id v4 = a3;
  if ([(TLKLabel *)self autoHideIfNoContent]) {
    -[TLKLabel setHidden:](self, "setHidden:", [v4 length] == 0);
  }
  [(TLKLabel *)self setAttributedTextExplicitelySet:v4 != 0];
  v5.receiver = self;
  v5.super_class = (Class)TLKLabel;
  [(TLKLabel *)&v5 setAttributedText:v4];
}

- (void)updateWithString:(id)a3
{
  id v4 = a3;
  [(TLKLabel *)self setAttributedTextExplicitelySet:0];
  v5.receiver = self;
  v5.super_class = (Class)TLKLabel;
  [(TLKLabel *)&v5 setText:v4];
}

- (void)setAttributedTextExplicitelySet:(BOOL)a3
{
  self->_attributedTextExplicitelySet = a3;
}

- (BOOL)autoHideIfNoContent
{
  return self->_autoHideIfNoContent;
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLKLabel;
  [(UIView *)&v8 tlk_updateForAppearance:v4];
  objc_super v5 = [(TLKLabel *)self superview];
  [v4 enableAppearanceForContainer:v5];

  [(TLKLabel *)self loadInlineImages];
  if (![(TLKLabel *)self hasCustomTextColor])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__TLKLabel_tlk_updateForAppearance___block_invoke;
    v6[3] = &unk_1E5FD3020;
    v6[4] = self;
    id v7 = v4;
    [(TLKLabel *)self performBatchUpdates:v6];
  }
}

- (void)setAttributedTextUpdateSkipped:(BOOL)a3
{
  self->_attributedTextUpdateSkipped = a3;
}

- (void)performBatchUpdates:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(TLKLabel *)self setAttributedTextUpdateDisabled:1];
  v4[2](v4);

  [(TLKLabel *)self setAttributedTextUpdateDisabled:0];
  if ([(TLKLabel *)self attributedTextUpdateSkipped])
  {
    [(TLKLabel *)self updateAttributedText];
    [(TLKLabel *)self setAttributedTextUpdateSkipped:0];
  }
}

- (void)setAttributedTextUpdateDisabled:(BOOL)a3
{
  self->_attributedTextUpdateDisabled = a3;
}

- (BOOL)attributedTextUpdateSkipped
{
  return self->_attributedTextUpdateSkipped;
}

- (BOOL)attributedTextExplicitelySet
{
  return self->_attributedTextExplicitelySet;
}

- (BOOL)supportsColorGlyphs
{
  return self->_supportsColorGlyphs;
}

- (void)setMultilineText:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
  }
  else
  {
    objc_super v5 = v7;
    if (v7)
    {
      id v4 = (id)objc_opt_new();
      objc_super v5 = v7;
    }
    else
    {
      id v4 = 0;
    }
    objc_super v6 = [v5 text];
    [v4 setText:v6];

    objc_msgSend(v4, "setMaxLines:", objc_msgSend(v7, "maxLines"));
  }
  [(TLKLabel *)self setRichText:v4];
}

- (void)setText:(id)a3
{
  id v5 = a3;
  [(TLKLabel *)self updateWithString:0];
  if (v5)
  {
    id v4 = +[TLKMultilineText textWithString:v5];
  }
  else
  {
    id v4 = 0;
  }
  objc_msgSend(v4, "setMaxLines:", -[TLKLabel numberOfLines](self, "numberOfLines"));
  [(TLKLabel *)self setRichText:v4];
}

- (BOOL)hasEmphasizedFormattingInRichText
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(TLKLabel *)self richText];
  unint64_t v3 = [v2 formattedTextItems];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 isEmphasized])
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (TLKLabel)init
{
  return [(TLKLabel *)self initWithProminence:0];
}

+ (id)secondaryLabel
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProminence:1];
  return v2;
}

+ (id)tertiaryLabel
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProminence:2];
  return v2;
}

- (TLKLabel)initWithProminence:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TLKLabel;
  uint64_t v4 = [(TLKLabel *)&v7 init];
  uint64_t v5 = v4;
  if (v4)
  {
    [(TLKLabel *)v4 setOpaque:0];
    v5->_prominence = a3;
    v5->_hasCustomTextColor = 0;
  }
  return v5;
}

- (void)setSupportsColorGlyphs:(BOOL)a3
{
  self->_supportsColorGlyphs = a3;
}

- (void)setProminence:(unint64_t)a3
{
  if (self->_prominence != a3)
  {
    self->_prominence = a3;
    [(TLKLabel *)self updateAdjustedProminence];
    [(UIView *)self tlk_updateWithCurrentAppearance];
  }
}

- (void)setLineBreakMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setLineBreakMode:](&v6, sel_setLineBreakMode_);
  uint64_t v5 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
  [v5 setLineBreakMode:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFont, 0);
  objc_storeStrong((id *)&self->_overlayLabelForNonColoredGlyphs, 0);
  objc_storeStrong((id *)&self->_richText, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TLKLabel;
  [(TLKLabel *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = [(TLKLabel *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(UIView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  objc_super v6 = [(TLKLabel *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

+ (id)primaryLabel
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProminence:0];
  return v2;
}

- (void)setTextAlignment:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TLKLabel;
  -[TLKLabel setTextAlignment:](&v6, sel_setTextAlignment_);
  uint64_t v5 = [(TLKLabel *)self overlayLabelForNonColoredGlyphs];
  [v5 setTextAlignment:a3];

  [(TLKLabel *)self updateAttributedText];
}

- (TLKFormattedText)formattedText
{
  unint64_t v3 = [(TLKLabel *)self richText];
  id v4 = [v3 formattedTextItems];
  uint64_t v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = [(TLKLabel *)self richText];
  uint64_t v8 = v7;
  if (isKindOfClass)
  {
    objc_super v9 = [v7 formattedTextItems];
    long long v10 = [v9 firstObject];
  }
  else
  {
    if (v7)
    {
      long long v11 = [(TLKLabel *)self richText];
      long long v12 = [v11 text];
      long long v10 = +[TLKFormattedText formattedTextWithString:v12];
    }
    else
    {
      long long v10 = 0;
    }

    objc_msgSend(v10, "setMaxLines:", -[TLKRichText maxLines](self->_richText, "maxLines"));
  }
  return (TLKFormattedText *)v10;
}

- (void)setFormattedText:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_new();
    v7[0] = v4;
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

    [v5 setFormattedTextItems:v6];
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(TLKLabel *)self setRichText:v5];
}

- (void)setAttributedText:(id)a3
{
  richText = self->_richText;
  self->_richText = 0;
  id v5 = a3;

  [(TLKLabel *)self updateWithAttributedString:v5];
}

void __28__TLKLabel_loadInlineImages__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__TLKLabel_loadInlineImages__block_invoke_2;
  v4[3] = &unk_1E5FD3020;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = v2;
  uint64_t v6 = v3;
  +[TLKUtilities dispatchMainIfNecessary:v4];
}

void __28__TLKLabel_loadInlineImages__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) richText];

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 40);
    [v4 updateAttributedText];
  }
}

void __32__TLKLabel_updateAttributedText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 fontDescriptor];
  __int16 v8 = [v7 symbolicTraits];
  uint64_t v9 = 32;
  if ((v8 & 0x2000) == 0) {
    uint64_t v9 = 40;
  }
  id v10 = *(id *)(a1 + v9);

  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v10 addObject:v11];
}

void __32__TLKLabel_updateAttributedText__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v14 = +[TLKFontUtilities clearTextAttachmentForTextAttachment:a3];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *MEMORY[0x1E4FB12A0];
  uint64_t v8 = [v5 rangeValue];
  objc_msgSend(v6, "removeAttribute:range:", v7, v8, v9);
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v5 rangeValue];
  uint64_t v13 = v12;

  objc_msgSend(v10, "addAttribute:value:range:", v7, v14, v11, v13);
}

+ (BOOL)stringStartsWithQuote:(id)a3
{
  uint64_t v3 = stringStartsWithQuote__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&stringStartsWithQuote__onceToken, &__block_literal_global_5);
  }
  id v5 = (void *)stringStartsWithQuote__quoteCharacters;
  uint64_t v6 = [v4 substringToIndex:1];

  char v7 = [v5 containsObject:v6];
  return v7;
}

uint64_t __34__TLKLabel_stringStartsWithQuote___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0965C40];
  uint64_t v1 = stringStartsWithQuote__quoteCharacters;
  stringStartsWithQuote__quoteCharacters = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)setCustomAlignmentRectInsets:(UIEdgeInsets)a3
{
  -[TLKLabel setUnadjustedCustemAlignmentRectInsets:](self, "setUnadjustedCustemAlignmentRectInsets:", a3.top, a3.left, a3.bottom, a3.right);
  [(TLKLabel *)self updateAttributedText];
}

- (void)setAutoHideIfNoContent:(BOOL)a3
{
  self->_autoHideIfNoContent = a3;
}

- (BOOL)useButtonColoring
{
  return self->_useButtonColoring;
}

- (void)setUseButtonColoring:(BOOL)a3
{
  self->_useButtonColoring = a3;
}

- (void)setOverlayLabelForNonColoredGlyphs:(id)a3
{
}

- (UIFont)originalFont
{
  return (UIFont *)objc_getProperty(self, a2, 832, 1);
}

- (void)setOriginalFont:(id)a3
{
}

- (void)setHasCustomTextColor:(BOOL)a3
{
  self->_hasCustomTextColor = a3;
}

- (UIEdgeInsets)unadjustedCustemAlignmentRectInsets
{
  objc_copyStruct(v6, &self->_unadjustedCustemAlignmentRectInsets, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setUnadjustedCustemAlignmentRectInsets:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_unadjustedCustemAlignmentRectInsets, &v3, 32, 1, 0);
}

@end