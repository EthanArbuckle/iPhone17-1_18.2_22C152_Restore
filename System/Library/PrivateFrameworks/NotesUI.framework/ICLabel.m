@interface ICLabel
- (NSAttributedString)attributedString;
- (NSString)string;
- (double)lineHeight;
- (double)paragraphSpacing;
- (double)spacing;
- (void)setAttributedString:(id)a3;
- (void)setLineHeight:(double)a3;
- (void)setParagraphSpacing:(double)a3;
- (void)setSpacing:(double)a3;
- (void)setString:(id)a3;
- (void)updateText;
@end

@implementation ICLabel

- (void)setString:(id)a3
{
  v4 = (NSString *)[a3 copy];
  string = self->_string;
  self->_string = v4;

  attributedString = self->_attributedString;
  self->_attributedString = 0;

  [(ICLabel *)self updateText];
}

- (void)setAttributedString:(id)a3
{
  string = self->_string;
  self->_string = 0;
  id v5 = a3;

  v6 = (NSAttributedString *)[v5 copy];
  attributedString = self->_attributedString;
  self->_attributedString = v6;

  [(ICLabel *)self updateText];
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    [(ICLabel *)self updateText];
  }
}

- (void)setParagraphSpacing:(double)a3
{
  if (self->_paragraphSpacing != a3)
  {
    self->_paragraphSpacing = a3;
    [(ICLabel *)self updateText];
  }
}

- (void)setLineHeight:(double)a3
{
  if (self->_lineHeight != a3)
  {
    self->_lineHeight = a3;
    [(ICLabel *)self updateText];
  }
}

- (void)updateText
{
  v17[1] = *MEMORY[0x1E4F143B8];
  p_isa = self->_string;
  v4 = self->_attributedString;
  [(ICLabel *)self spacing];
  if (v5 <= 0.0)
  {
    [(ICLabel *)self lineHeight];
    if (v6 <= 0.0)
    {
      [(ICLabel *)self paragraphSpacing];
      if (v7 == 0.0) {
        goto LABEL_16;
      }
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [(ICLabel *)self spacing];
  if (v9 > 0.0)
  {
    [(ICLabel *)self spacing];
    objc_msgSend(v8, "setLineSpacing:");
  }
  [(ICLabel *)self paragraphSpacing];
  if (v10 != 0.0)
  {
    [(ICLabel *)self paragraphSpacing];
    objc_msgSend(v8, "setParagraphSpacing:");
  }
  [(ICLabel *)self lineHeight];
  if (v11 > 0.0)
  {
    [(ICLabel *)self lineHeight];
    objc_msgSend(v8, "setMaximumLineHeight:");
    [(ICLabel *)self lineHeight];
    objc_msgSend(v8, "setMinimumLineHeight:");
  }
  objc_msgSend(v8, "setLineBreakMode:", -[ICLabel lineBreakMode](self, "lineBreakMode"));
  uint64_t v16 = *MEMORY[0x1E4FB0738];
  v17[0] = v8;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  if (p_isa)
  {
    v13 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:p_isa attributes:v12];

LABEL_14:
    v4 = v13;

    goto LABEL_15;
  }
  if (v4)
  {
    v13 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v4];
    -[NSAttributedString addAttributes:range:](v13, "addAttributes:range:", v12, 0, [(NSAttributedString *)v13 length]);
    p_isa = (NSString *)&v4->super.isa;
    goto LABEL_14;
  }
LABEL_15:

  p_isa = 0;
LABEL_16:
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)ICLabel;
    [(ICLabel *)&v15 setAttributedText:v4];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICLabel;
    [(ICLabel *)&v14 setText:p_isa];
  }
}

- (NSString)string
{
  return self->_string;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (double)spacing
{
  return self->_spacing;
}

- (double)paragraphSpacing
{
  return self->_paragraphSpacing;
}

- (double)lineHeight
{
  return self->_lineHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end