@interface SBUIActionViewLabel
- (NSString)text;
- (SBUIActionViewLabel)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIFont)font;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_mt_applyVisualStyling:(id)a3;
- (void)mt_removeAllVisualStyling;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation SBUIActionViewLabel

- (SBUIActionViewLabel)initWithFrame:(CGRect)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SBUIActionViewLabel;
  v3 = -[SBUIActionViewLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBUIActionViewLabel *)v3 addSubview:v3->_label];
    v7 = (void *)MEMORY[0x263F08938];
    v17 = @"label";
    v18[0] = v3->_label;
    v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v9 = [v7 constraintsWithVisualFormat:@"H:|[label]|" options:0 metrics:0 views:v8];
    [v7 activateConstraints:v9];

    v10 = (void *)MEMORY[0x263F08938];
    v15 = @"label";
    v16 = v3->_label;
    v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v12 = [v10 constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:0 views:v11];
    [v10 activateConstraints:v12];
  }
  return v3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(UILabel *)self->_label alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)viewForFirstBaselineLayout
{
  return self->_label;
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(NSString *)self->_text isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_text, a3);
    id v30 = 0;
    v6 = objc_msgSend(v5, "sbui_rangesOfEmojiTokens:", &v30);
    id v7 = v30;
    if ([v6 count])
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __31__SBUIActionViewLabel_setText___block_invoke;
      v28[3] = &unk_2645D41F0;
      v29 = (UILabel *)v5;
      v8 = (void (**)(void, void))MEMORY[0x223C8BC20](v28);
      label = self->_label;
      v10 = ((void (**)(void, void *))v8)[2](v8, v6);
      [(UILabel *)label setAttributedText:v10];

      emojiLabel = self->_emojiLabel;
      if (!emojiLabel)
      {
        id v12 = objc_alloc(MEMORY[0x263F1C768]);
        v13 = (UILabel *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
        objc_super v14 = self->_emojiLabel;
        self->_emojiLabel = v13;

        v15 = self->_emojiLabel;
        v16 = [(SBUIActionViewLabel *)self font];
        [(UILabel *)v15 setFont:v16];

        [(UILabel *)self->_emojiLabel setLineBreakMode:[(SBUIActionViewLabel *)self lineBreakMode]];
        [(UILabel *)self->_emojiLabel setNumberOfLines:[(SBUIActionViewLabel *)self numberOfLines]];
        [(UILabel *)self->_emojiLabel setTextAlignment:[(SBUIActionViewLabel *)self textAlignment]];
        [(UILabel *)self->_emojiLabel setTranslatesAutoresizingMaskIntoConstraints:0];
        [(SBUIActionViewLabel *)self addSubview:self->_emojiLabel];
        v17 = (void *)MEMORY[0x263F08938];
        v18 = self->_emojiLabel;
        v33 = @"emojiLabel";
        v34[0] = v18;
        v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:&v33 count:1];
        v20 = [v17 constraintsWithVisualFormat:@"H:|[emojiLabel]|" options:0 metrics:0 views:v19];
        [v17 activateConstraints:v20];

        v21 = (void *)MEMORY[0x263F08938];
        v22 = self->_emojiLabel;
        v31 = @"emojiLabel";
        v32 = v22;
        v23 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
        v24 = [v21 constraintsWithVisualFormat:@"V:|[emojiLabel]|" options:0 metrics:0 views:v23];
        [v21 activateConstraints:v24];

        emojiLabel = self->_emojiLabel;
      }
      v25 = ((void (**)(void, id))v8)[2](v8, v7);
      [(UILabel *)emojiLabel setAttributedText:v25];

      v26 = v29;
    }
    else
    {
      [(UILabel *)self->_label setText:v5];
      v27 = self->_emojiLabel;
      if (!v27)
      {
LABEL_9:

        goto LABEL_10;
      }
      [(UILabel *)v27 removeFromSuperview];
      v26 = self->_emojiLabel;
      self->_emojiLabel = 0;
    }

    goto LABEL_9;
  }
LABEL_10:
}

id __31__SBUIActionViewLabel_setText___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:*(void *)(a1 + 32)];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F1C240];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v10 = *(NSString **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v21 = v8;
        v11 = [MEMORY[0x263F1C550] clearColor];
        v22 = v11;
        id v12 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        NSRange v13 = NSRangeFromString(v10);
        objc_msgSend(v4, "addAttributes:range:", v12, v13.location, v13.length);
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  objc_super v14 = (void *)[v4 copy];

  return v14;
}

- (UIFont)font
{
  return [(UILabel *)self->_label font];
}

- (void)setFont:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [(UILabel *)label setFont:v5];
  [(UILabel *)self->_emojiLabel setFont:v5];
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_textColor != v5)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    [(UILabel *)self->_label setTextColor:v5];
  }
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_label textAlignment];
}

- (void)setTextAlignment:(int64_t)a3
{
  -[UILabel setTextAlignment:](self->_label, "setTextAlignment:");
  emojiLabel = self->_emojiLabel;

  [(UILabel *)emojiLabel setTextAlignment:a3];
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_label lineBreakMode];
}

- (void)setLineBreakMode:(int64_t)a3
{
  -[UILabel setLineBreakMode:](self->_label, "setLineBreakMode:");
  emojiLabel = self->_emojiLabel;

  [(UILabel *)emojiLabel setLineBreakMode:a3];
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_label numberOfLines];
}

- (void)setNumberOfLines:(int64_t)a3
{
  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:");
  emojiLabel = self->_emojiLabel;

  [(UILabel *)emojiLabel setNumberOfLines:a3];
}

- (void)_mt_applyVisualStyling:(id)a3
{
}

- (void)mt_removeAllVisualStyling
{
  [(UILabel *)self->_label mt_removeAllVisualStyling];
  [(UILabel *)self->_label setAlpha:1.0];
  label = self->_label;
  id v4 = [(SBUIActionViewLabel *)self textColor];
  [(UILabel *)label setTextColor:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end