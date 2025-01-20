@interface VUIFocusableTextView
+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 existingTextView:(id)a5;
+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 titleElement:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7;
+ (id)textViewWithString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5;
+ (id)textViewWithString:(id)a3 textLayout:(id)a4 titleString:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7;
- (VUIFocusableTextView)initWithFrame:(CGRect)a3;
- (VUILabel)computationLabel;
- (VUITextLayout)textLayout;
- (VUITextLayout)titleTextLayout;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)topMarginWithBaselineMargin:(double)a3;
- (double)vuiBaselineHeight;
- (double)vui_baselineOffsetFromBottom;
- (void)_updateTextColor;
- (void)setComputationLabel:(id)a3;
- (void)setTextLayout:(id)a3;
- (void)setTitleTextLayout:(id)a3;
@end

@implementation VUIFocusableTextView

- (VUIFocusableTextView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VUIFocusableTextView;
  v3 = -[TVFocusableTextView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_initWeak(&location, v3);
    v14[0] = objc_opt_class();
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __38__VUIFocusableTextView_initWithFrame___block_invoke;
    v9[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v10, &location);
    [(VUIFocusableTextView *)v3 vui_registerForTraitChanges:v4 withHandler:v9];

    uint64_t v13 = objc_opt_class();
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38__VUIFocusableTextView_initWithFrame___block_invoke_2;
    v7[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v8, &location);
    [(VUIFocusableTextView *)v3 vui_registerForTraitChanges:v5 withHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __38__VUIFocusableTextView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained textLayout];
  v2 = [WeakRetained traitCollection];
  uint64_t v3 = [v1 numberOfLinesForTraitCollection:v2];

  [WeakRetained setMaximumNumberOfLines:v3];
}

void __38__VUIFocusableTextView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTextColor];
}

+ (id)textViewWithString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  return (id)[a1 textViewWithString:a3 textLayout:a4 titleString:0 titleLayout:0 existingTextView:a5];
}

+ (id)textViewWithString:(id)a3 textLayout:(id)a4 titleString:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = (VUIFocusableTextView *)v14;
  }
  else
  {
    v17 = [VUIFocusableTextView alloc];
    v16 = -[VUIFocusableTextView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v18 = v16;
  [(VUIFocusableTextView *)v16 setTextLayout:v11];
  v19 = [(VUIFocusableTextView *)v18 computationLabel];
  v20 = +[VUILabel labelWithString:@"Lorem" textLayout:v11 existingLabel:v19];

  [(VUIFocusableTextView *)v18 setComputationLabel:v20];
  v21 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v22 = [v21 traitCollection];

  -[TVFocusableTextView setMaximumNumberOfLines:](v18, "setMaximumNumberOfLines:", [v11 numberOfLinesForTraitCollection:v22]);
  [(VUIFocusableTextView *)v18 _updateTextColor];
  v23 = [v11 attributedStringWithString:v15 view:v18];

  if ([v12 length] && v23)
  {
    v24 = [v13 attributedStringWithString:v12 view:v18];
    v25 = (void *)[v24 mutableCopy];
    [v25 appendAttributedString:v23];

    v23 = v25;
  }
  [(TVFocusableTextView *)v18 setDescriptionText:v23];
  -[TVFocusableTextView setDescriptionTextAlignment:](v18, "setDescriptionTextAlignment:", [v11 alignment]);
  -[TVFocusableTextView setAlwaysFocusable:](v18, "setAlwaysFocusable:", [v11 alwaysFocusable]);
  [v11 seeMoreHorizontalMargin];
  -[TVFocusableTextView setMoreHorizontalMargin:](v18, "setMoreHorizontalMargin:");

  return v18;
}

+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 titleElement:(id)a5 titleLayout:(id)a6 existingTextView:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  v17 = [v12 style];
  v18 = objc_msgSend(v17, "tv_valueForStyle:", *MEMORY[0x1E4FA9D30]);

  if (v18)
  {
    v19 = [v12 style];
    uint64_t v20 = objc_msgSend(v19, "tv_maxTextLines");

    [v13 setNumberOfLines:v20];
    [v13 setNumberOfLinesAXSmall:v20];
    [v13 setNumberOfLinesAXLarge:v20];
  }
  v21 = [v12 text];
  v22 = [v21 string];

  v23 = [v16 text];

  v24 = [v23 string];

  v25 = [a1 textViewWithString:v22 textLayout:v13 titleString:v24 titleLayout:v15 existingTextView:v14];

  [v25 transferLayoutStylesFromElement:v12];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke;
  v31[3] = &unk_1E6DF8808;
  id v26 = v12;
  id v32 = v26;
  [v25 setSelectionHandler:v31];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke_2;
  v29[3] = &unk_1E6DF8808;
  id v30 = v26;
  id v27 = v26;
  [v25 setPlayHandler:v29];

  return v25;
}

uint64_t __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", *MEMORY[0x1E4FA9D18], 1, 1, 0, 0, 0);
}

uint64_t __97__VUIFocusableTextView_textViewWithElement_textLayout_titleElement_titleLayout_existingTextView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tv_dispatchEvent:canBubble:isCancelable:extraInfo:targetResponder:completionBlock:", *MEMORY[0x1E4FA9D10], 1, 1, 0, 0, 0);
}

+ (id)textViewWithElement:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  return (id)[a1 textViewWithElement:a3 textLayout:a4 titleElement:0 titleLayout:0 existingTextView:a5];
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  if (a3) {
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_computationLabel, "topMarginToLabel:withBaselineMargin:", a4);
  }
  else {
    [(VUIFocusableTextView *)self topMarginWithBaselineMargin:a4];
  }
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  [(VUILabel *)self->_computationLabel vui_baselineOffsetFromBottom];
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  [(VUILabel *)self->_computationLabel topMarginWithBaselineMargin:a3];
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  [(VUILabel *)self->_computationLabel bottomMarginWithBaselineMargin:a3];
  return result;
}

- (void)_updateTextColor
{
  id v14 = [(VUITextLayout *)self->_textLayout color];
  id v3 = [(VUITextLayout *)self->_textLayout seeMoreTextColor];
  if (!v3)
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    if ([v4 userInterfaceIdiom] == 2) {
      objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
    }
    else {
      objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    }
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v5 = [(VUITextLayout *)self->_textLayout highlightOrSelectedColor];
  v6 = [(VUIFocusableTextView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v7 == 2)
  {
    id v8 = [(VUITextLayout *)self->_textLayout darkColor];

    if (v8)
    {
      uint64_t v9 = [(VUITextLayout *)self->_textLayout darkColor];

      id v14 = (id)v9;
    }
    id v10 = [(VUITextLayout *)self->_textLayout darkSeeMoreTextColor];

    if (v10)
    {
      uint64_t v11 = [(VUITextLayout *)self->_textLayout darkSeeMoreTextColor];

      id v3 = (id)v11;
    }
    id v12 = [(VUITextLayout *)self->_textLayout darkHighlightOrSelectedColor];

    if (v12)
    {
      uint64_t v13 = [(VUITextLayout *)self->_textLayout darkHighlightOrSelectedColor];

      id v5 = (id)v13;
    }
  }
  if (v5)
  {
    if (v3) {
      goto LABEL_15;
    }
  }
  else
  {
    id v5 = v14;
    if (v3) {
      goto LABEL_15;
    }
  }
  id v3 = v14;
LABEL_15:
  [(TVFocusableTextView *)self setDescriptionTextColor:v14];
  [(TVFocusableTextView *)self setMoreLabelTextColor:v3];
  [(TVFocusableTextView *)self setDescriptionTextHighlightColor:v5];
}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)setComputationLabel:(id)a3
{
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (void)setTitleTextLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
}

@end