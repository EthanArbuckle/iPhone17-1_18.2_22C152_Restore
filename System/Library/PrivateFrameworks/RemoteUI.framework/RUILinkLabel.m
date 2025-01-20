@interface RUILinkLabel
- (BOOL)enabled;
- (NSString)text;
- (RUILinkLabel)initWithFrame:(CGRect)a3;
- (UIButton)linkButton;
- (UIButtonConfiguration)buttonConfiguration;
- (UIFont)font;
- (UILabel)textLabel;
- (id)action;
- (int64_t)lineBreakMode;
- (int64_t)numberOfLines;
- (int64_t)textAlignment;
- (void)_linkPressed;
- (void)setAction:(id)a3;
- (void)setButtonConfiguration:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation RUILinkLabel

- (RUILinkLabel)initWithFrame:(CGRect)a3
{
  v24[4] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)RUILinkLabel;
  v3 = -[RUILinkLabel initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v4;

    v6 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_textLabel setBackgroundColor:v6];

    [(UILabel *)v3->_textLabel setNumberOfLines:0];
    [(UILabel *)v3->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RUILinkLabel *)v3 addSubview:v3->_textLabel];
    v22 = [(UILabel *)v3->_textLabel topAnchor];
    v21 = [(RUILinkLabel *)v3 topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v24[0] = v20;
    v7 = [(UILabel *)v3->_textLabel bottomAnchor];
    v8 = [(RUILinkLabel *)v3 bottomAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v24[1] = v9;
    v10 = [(UILabel *)v3->_textLabel leadingAnchor];
    v11 = [(RUILinkLabel *)v3 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v24[2] = v12;
    v13 = [(UILabel *)v3->_textLabel trailingAnchor];
    v14 = [(RUILinkLabel *)v3 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v24[3] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    textLabelContraints = v3->_textLabelContraints;
    v3->_textLabelContraints = (NSArray *)v16;

    linkButtonContraints = v3->_linkButtonContraints;
    v3->_linkButtonContraints = (NSArray *)MEMORY[0x263EFFA68];

    v3->_enabled = 1;
  }
  return v3;
}

- (void)setButtonConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConfiguration, a3);
  id v5 = a3;
  [(UIButton *)self->_linkButton setConfiguration:v5];
  linkButton = self->_linkButton;
  id v8 = [(UIButton *)linkButton configuration];
  v7 = [v8 baseForegroundColor];
  [(UIButton *)linkButton setTitleColor:v7 forState:0];
}

- (void)updateConstraints
{
  v16.receiver = self;
  v16.super_class = (Class)RUILinkLabel;
  [(RUILinkLabel *)&v16 updateConstraints];
  id action = self->_action;
  if (action)
  {
    uint64_t v4 = [(RUILinkLabel *)self linkButton];
  }
  else
  {
    uint64_t v4 = self->_textLabel;
  }
  id v5 = v4;
  [(UILabel *)v4 setNeedsLayout];
  LODWORD(v6) = 1144750080;
  [(UILabel *)self->_textLabel setContentHuggingPriority:0 forAxis:v6];
  LODWORD(v7) = 1144750080;
  [(UILabel *)self->_textLabel setContentHuggingPriority:1 forAxis:v7];
  LODWORD(v8) = 1144750080;
  [(UIButton *)self->_linkButton setContentHuggingPriority:0 forAxis:v8];
  LODWORD(v9) = 1144750080;
  [(UIButton *)self->_linkButton setContentHuggingPriority:1 forAxis:v9];
  textLabel = self->_textLabel;
  if (action)
  {
    [(UILabel *)textLabel setHidden:1];
    [(UIButton *)self->_linkButton setHidden:0];
    [MEMORY[0x263F08938] activateConstraints:self->_linkButtonContraints];
    v11 = (void *)MEMORY[0x263F08938];
    uint64_t v12 = 424;
  }
  else
  {
    v13 = [(UILabel *)textLabel text];
    uint64_t v14 = [v13 length];

    v15 = self->_textLabel;
    if (!v14)
    {
      [(UILabel *)v15 setHidden:1];
      [(UIButton *)self->_linkButton setHidden:1];
      goto LABEL_9;
    }
    [(UILabel *)v15 setHidden:0];
    [(UIButton *)self->_linkButton setHidden:1];
    [MEMORY[0x263F08938] activateConstraints:self->_textLabelContraints];
    v11 = (void *)MEMORY[0x263F08938];
    uint64_t v12 = 432;
  }
  [v11 deactivateConstraints:*(Class *)((char *)&self->super.super.super.isa + v12)];
LABEL_9:
}

- (void)setText:(id)a3
{
  textLabel = self->_textLabel;
  id v5 = a3;
  [(UILabel *)textLabel setText:v5];
  [(UIButton *)self->_linkButton setTitle:v5 forState:0];

  [(RUILinkLabel *)self setNeedsUpdateConstraints];
}

- (NSString)text
{
  return [(UILabel *)self->_textLabel text];
}

- (void)setFont:(id)a3
{
  textLabel = self->_textLabel;
  id v5 = a3;
  [(UILabel *)textLabel setFont:v5];
  id v6 = [(UIButton *)self->_linkButton titleLabel];
  [v6 setFont:v5];
}

- (UIFont)font
{
  return [(UILabel *)self->_textLabel font];
}

- (void)setNumberOfLines:(int64_t)a3
{
  if ([(UILabel *)self->_textLabel numberOfLines] != a3)
  {
    [(UILabel *)self->_textLabel setNumberOfLines:a3];
    id v5 = [(UIButton *)self->_linkButton titleLabel];
    [v5 setNumberOfLines:a3];
  }
}

- (int64_t)numberOfLines
{
  return [(UILabel *)self->_textLabel numberOfLines];
}

- (void)setLineBreakMode:(int64_t)a3
{
  if ([(UILabel *)self->_textLabel lineBreakMode] != a3)
  {
    [(UILabel *)self->_textLabel setLineBreakMode:a3];
    id v5 = [(UIButton *)self->_linkButton titleLabel];
    [v5 setLineBreakMode:a3];
  }
}

- (int64_t)lineBreakMode
{
  return [(UILabel *)self->_textLabel lineBreakMode];
}

- (void)setAction:(id)a3
{
  if (self->_action != a3)
  {
    id v5 = (void *)[a3 copy];
    id action = self->_action;
    self->_id action = v5;

    double v7 = [(RUILinkLabel *)self linkButton];
    [v7 setHidden:a3 == 0];

    [(UILabel *)self->_textLabel setHidden:a3 != 0];
    [(RUILinkLabel *)self setNeedsUpdateConstraints];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UIButton setEnabled:](self->_linkButton, "setEnabled:");
  }
}

- (UIButton)linkButton
{
  v30[4] = *MEMORY[0x263EF8340];
  linkButton = self->_linkButton;
  if (!linkButton)
  {
    uint64_t v4 = [MEMORY[0x263F824E8] buttonWithType:1];
    id v5 = self->_linkButton;
    self->_linkButton = v4;

    id v6 = [(RUILinkLabel *)self buttonConfiguration];

    if (v6)
    {
      double v7 = [(RUILinkLabel *)self buttonConfiguration];
      [(UIButton *)self->_linkButton setConfiguration:v7];
    }
    [(UIButton *)self->_linkButton setExclusiveTouch:1];
    [(UIButton *)self->_linkButton addTarget:self action:sel__linkPressed forControlEvents:0x2000];
    [(UIButton *)self->_linkButton setHidden:self->_action == 0];
    [(UIButton *)self->_linkButton setEnabled:self->_enabled];
    double v8 = [(UIButton *)self->_linkButton titleLabel];
    double v9 = self->_linkButton;
    v10 = [(UILabel *)self->_textLabel text];
    [(UIButton *)v9 setTitle:v10 forState:0];

    v11 = self->_linkButton;
    uint64_t v12 = [MEMORY[0x263F825C8] linkColor];
    [(UIButton *)v11 setTitleColor:v12 forState:0];

    objc_msgSend(v8, "setLineBreakMode:", -[UILabel lineBreakMode](self->_textLabel, "lineBreakMode"));
    objc_msgSend(v8, "setNumberOfLines:", -[UILabel numberOfLines](self->_textLabel, "numberOfLines"));
    v13 = [(UILabel *)self->_textLabel font];
    v29 = v8;
    [v8 setFont:v13];

    objc_msgSend(v8, "setTextAlignment:", -[UILabel textAlignment](self->_textLabel, "textAlignment"));
    [(RUILinkLabel *)self addSubview:self->_linkButton];
    [(UIButton *)self->_linkButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = [(UIButton *)self->_linkButton topAnchor];
    v27 = [(RUILinkLabel *)self topAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v30[0] = v26;
    v25 = [(UIButton *)self->_linkButton bottomAnchor];
    uint64_t v14 = [(RUILinkLabel *)self bottomAnchor];
    v15 = [v25 constraintEqualToAnchor:v14];
    v30[1] = v15;
    objc_super v16 = [(UIButton *)self->_linkButton leadingAnchor];
    v17 = [(RUILinkLabel *)self leadingAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v30[2] = v18;
    v19 = [(UIButton *)self->_linkButton trailingAnchor];
    v20 = [(RUILinkLabel *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v30[3] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
    linkButtonContraints = self->_linkButtonContraints;
    self->_linkButtonContraints = v22;

    linkButton = self->_linkButton;
  }
  return linkButton;
}

- (void)setTextAlignment:(int64_t)a3
{
  if ([(UILabel *)self->_textLabel textAlignment] != a3)
  {
    [(UILabel *)self->_textLabel setTextAlignment:a3];
    id v5 = [(UIButton *)self->_linkButton titleLabel];
    [v5 setTextAlignment:a3];

    if ((unint64_t)a3 <= 4) {
      [(UIButton *)self->_linkButton setContentHorizontalAlignment:qword_2146127E8[a3]];
    }
    [(RUILinkLabel *)self setNeedsLayout];
  }
}

- (int64_t)textAlignment
{
  return [(UILabel *)self->_textLabel textAlignment];
}

- (void)_linkPressed
{
  id action = (void (**)(void))self->_action;
  if (action) {
    action[2]();
  }
}

- (UIButtonConfiguration)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (id)action
{
  return self->_action;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_linkButtonContraints, 0);
  objc_storeStrong((id *)&self->_textLabelContraints, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
}

@end