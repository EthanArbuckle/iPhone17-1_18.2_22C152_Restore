@interface VUIDebugCollectionViewDefaultsCell
- (BOOL)textFieldShouldReturn:(id)a3;
- (UISwitch)defaultsSwitch;
- (UITextField)textField;
- (VUIDebugCollectionViewDefaultsCell)initWithFrame:(CGRect)a3;
- (VUIDebugViewDefaults)defaults;
- (VUILabel)subtitleLabel;
- (VUILabel)titleLabel;
- (VUISeparatorView)separatorView;
- (VUITextLayout)subtitleLayout;
- (VUITextLayout)titleLayout;
- (void)_defaultsSwitchPressed:(id)a3;
- (void)configureCellWithDefaults:(id)a3;
- (void)layoutSubviews;
- (void)setDefaults:(id)a3;
- (void)setDefaultsSwitch:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleLayout:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLayout:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation VUIDebugCollectionViewDefaultsCell

- (VUIDebugCollectionViewDefaultsCell)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)VUIDebugCollectionViewDefaultsCell;
  v3 = -[VUIDebugCollectionViewDefaultsCell initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v4 setNumberOfLines:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v4 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v4 setTextStyle:3];
    [(VUITextLayout *)v4 setMaximumContentSizeCategory:3];
    v5 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v4 setColor:v5];

    titleLayout = v3->_titleLayout;
    v3->_titleLayout = v4;
    v7 = v4;

    uint64_t v8 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v7 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v8;

    v10 = [(VUIDebugCollectionViewDefaultsCell *)v3 contentView];
    [v10 addSubview:v3->_titleLabel];

    v11 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v11 setNumberOfLines:1];
    [(VUITextLayout *)v11 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v11 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v11 setTextStyle:13];
    [(VUITextLayout *)v11 setMaximumContentSizeCategory:3];
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v11 setColor:v12];

    subtitleLayout = v3->_subtitleLayout;
    v3->_subtitleLayout = v11;
    v14 = v11;

    uint64_t v15 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v14 existingLabel:0];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = (VUILabel *)v15;

    v17 = [(VUIDebugCollectionViewDefaultsCell *)v3 contentView];
    [v17 addSubview:v3->_subtitleLabel];

    id v18 = objc_alloc(MEMORY[0x1E4FB1CD0]);
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v23 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
    defaultsSwitch = v3->_defaultsSwitch;
    v3->_defaultsSwitch = (UISwitch *)v23;

    [(UISwitch *)v3->_defaultsSwitch sendActionsForControlEvents:64];
    [(UISwitch *)v3->_defaultsSwitch addTarget:v3 action:sel__defaultsSwitchPressed_ forControlEvents:64];
    v25 = [(VUIDebugCollectionViewDefaultsCell *)v3 contentView];
    [v25 addSubview:v3->_defaultsSwitch];

    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1D70]), "initWithFrame:", v19, v20, v21, v22);
    textField = v3->_textField;
    v3->_textField = (UITextField *)v26;

    [(UITextField *)v3->_textField setKeyboardType:2];
    [(UITextField *)v3->_textField setReturnKeyType:1];
    [(UITextField *)v3->_textField setEnablesReturnKeyAutomatically:1];
    [(UITextField *)v3->_textField setClearsOnBeginEditing:1];
    [(UITextField *)v3->_textField setAdjustsFontSizeToFitWidth:1];
    [(UITextField *)v3->_textField setBorderStyle:3];
    [(UITextField *)v3->_textField setDelegate:v3];
    v28 = [(VUIDebugCollectionViewDefaultsCell *)v3 contentView];
    [v28 addSubview:v3->_textField];

    v29 = [(VUIDebugCollectionViewDefaultsCell *)v3 contentView];
    v30 = [MEMORY[0x1E4FB1618] whiteColor];
    [v29 setBackgroundColor:v30];

    v31 = [MEMORY[0x1E4FB1618] systemLightGrayColor];
    [(VUIListCollectionViewCell *)v3 setHighlightedBackgroundColor:v31];

    v32 = objc_alloc_init(VUISeparatorView);
    separatorView = v3->_separatorView;
    v3->_separatorView = v32;

    [(VUIDebugCollectionViewDefaultsCell *)v3 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)configureCellWithDefaults:(id)a3
{
  v4 = (VUIDebugViewDefaults *)a3;
  v5 = [(VUIDebugViewDefaults *)v4 title];
  v6 = [(VUIDebugCollectionViewDefaultsCell *)self titleLayout];
  v7 = [(VUIDebugCollectionViewDefaultsCell *)self titleLabel];
  id v8 = +[VUILabel labelWithString:v5 textLayout:v6 existingLabel:v7];

  v9 = [(VUIDebugCollectionViewDefaultsCell *)self subtitleLabel];
  v10 = [(VUIDebugViewDefaults *)v4 subtitle];
  objc_msgSend(v9, "setHidden:", objc_msgSend(v10, "length") == 0);

  v11 = [(VUIDebugViewDefaults *)v4 subtitle];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    v13 = [(VUIDebugViewDefaults *)v4 subtitle];
    v14 = [(VUIDebugCollectionViewDefaultsCell *)self subtitleLayout];
    uint64_t v15 = [(VUIDebugCollectionViewDefaultsCell *)self subtitleLabel];
    id v16 = +[VUILabel labelWithString:v13 textLayout:v14 existingLabel:v15];
  }
  if ([(VUIDebugViewDefaults *)v4 integerValueType])
  {
    textField = self->_textField;
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[VUIDebugViewDefaults defaultIntegerValue](v4, "defaultIntegerValue"));
    [(UITextField *)textField setText:v18];
  }
  else
  {
    [(UISwitch *)self->_defaultsSwitch setOn:[(VUIDebugViewDefaults *)v4 defaultBoolValue] animated:0];
  }
  defaults = self->_defaults;
  self->_defaults = v4;
}

- (void)layoutSubviews
{
  [(VUIDebugCollectionViewDefaultsCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v12 = v11;
  double v14 = v13;
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  CGFloat Width = CGRectGetWidth(v53);
  id v16 = (CGFloat *)MEMORY[0x1E4F1DB28];
  double v48 = v14;
  double v17 = Width - v12 - v14;
  CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v54.origin.x = v4;
  v54.origin.y = v6;
  v54.size.width = v8;
  v54.size.height = v10;
  double v45 = v17;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v17, CGRectGetHeight(v54));
  double v20 = v19;
  double v22 = v21;
  CGFloat v49 = v4;
  CGFloat v50 = v10;
  v55.origin.x = v4;
  CGFloat v51 = v8;
  v55.origin.y = v6;
  v55.size.width = v8;
  v55.size.height = v10;
  double Height = CGRectGetHeight(v55);
  v56.origin.x = v12;
  v56.origin.y = v18;
  v56.size.width = v20;
  v56.size.height = v22;
  double v24 = (Height - CGRectGetHeight(v56)) * 0.5;
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, v24, v20, v22);
  if (([(VUILabel *)self->_subtitleLabel isHidden] & 1) == 0)
  {
    v57.origin.x = v4;
    v57.origin.y = v6;
    v57.size.width = v8;
    v57.size.height = v50;
    -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v45, CGRectGetHeight(v57));
    double v44 = v26;
    double v46 = v25;
    v58.origin.x = v4;
    v58.origin.y = v6;
    v58.size.width = v8;
    v58.size.height = v50;
    double v27 = CGRectGetHeight(v58);
    v59.origin.x = v12;
    v59.origin.y = v24;
    v59.size.width = v20;
    v59.size.height = v22;
    double v28 = CGRectGetHeight(v59);
    v60.origin.x = v12;
    v60.origin.y = v18;
    v60.size.width = v46;
    v60.size.height = v44;
    CGFloat v29 = (v27 - (v28 + CGRectGetHeight(v60))) * 0.5;
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v12, v29, v20, v22);
    v61.origin.x = v12;
    v61.origin.y = v29;
    v61.size.width = v20;
    v61.size.height = v22;
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v12, v29 + CGRectGetHeight(v61), v46, v44);
  }
  CGFloat v30 = *v16;
  [(UISwitch *)self->_defaultsSwitch sizeToFit];
  [(UISwitch *)self->_defaultsSwitch bounds];
  double v32 = v31;
  double v34 = v33;
  v62.origin.x = v4;
  v62.origin.y = v6;
  v62.size.width = v51;
  v62.size.height = v50;
  double v35 = CGRectGetHeight(v62);
  v63.origin.x = v30;
  CGFloat v47 = v30;
  v63.origin.y = v18;
  v63.size.width = v32;
  v63.size.height = v34;
  CGFloat v36 = (v35 - CGRectGetHeight(v63)) * 0.5;
  v64.origin.x = v4;
  v64.origin.y = v6;
  v64.size.width = v51;
  v64.size.height = v50;
  CGFloat v37 = CGRectGetWidth(v64) - v48;
  v65.origin.x = v30;
  v65.origin.y = v36;
  v65.size.width = v32;
  v65.size.height = v34;
  -[UISwitch setFrame:](self->_defaultsSwitch, "setFrame:", v37 - CGRectGetWidth(v65), v36, v32, v34);
  v66.origin.x = v49;
  v66.origin.y = v6;
  v66.size.width = v51;
  v66.size.height = v50;
  CGFloat v38 = CGRectGetWidth(v66) - v48;
  v67.origin.x = v47;
  v67.origin.y = v18;
  v67.size.width = v32;
  v67.size.height = v34;
  CGFloat v39 = v38 - CGRectGetWidth(v67);
  v68.origin.x = v49;
  v68.origin.y = v6;
  v68.size.width = v51;
  v68.size.height = v50;
  double v40 = CGRectGetHeight(v68);
  v69.origin.x = v39;
  v69.origin.y = v18;
  v69.size.width = v32;
  v69.size.height = v34;
  -[UITextField setFrame:](self->_textField, "setFrame:", v39, (v40 - CGRectGetHeight(v69)) * 0.5, v32, v34);
  [(UISwitch *)self->_defaultsSwitch setHidden:[(VUIDebugViewDefaults *)self->_defaults integerValueType]];
  [(UITextField *)self->_textField setHidden:[(VUIDebugViewDefaults *)self->_defaults integerValueType] ^ 1];
  separatorView = self->_separatorView;
  [(VUIDebugCollectionViewDefaultsCell *)self bounds];
  double v42 = CGRectGetHeight(v70) + -1.0;
  v71.origin.x = v49;
  v71.origin.y = v6;
  v71.size.width = v51;
  v71.size.height = v50;
  double v43 = CGRectGetWidth(v71);
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", 0.0, v42, v43, 1.0);
}

- (void)_defaultsSwitchPressed:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  if (objc_opt_respondsToSelector()) {
    -[VUIDebugViewDefaults setDefaultIntegerValue:](self->_defaults, "setDefaultIntegerValue:", [v4 integerValue]);
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (VUITextLayout)titleLayout
{
  return self->_titleLayout;
}

- (void)setTitleLayout:(id)a3
{
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (VUITextLayout)subtitleLayout
{
  return self->_subtitleLayout;
}

- (void)setSubtitleLayout:(id)a3
{
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UISwitch)defaultsSwitch
{
  return self->_defaultsSwitch;
}

- (void)setDefaultsSwitch:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (VUIDebugViewDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_defaultsSwitch, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLayout, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayout, 0);
}

@end