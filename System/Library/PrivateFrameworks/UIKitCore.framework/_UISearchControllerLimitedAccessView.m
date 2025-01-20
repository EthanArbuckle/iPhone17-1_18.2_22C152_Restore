@interface _UISearchControllerLimitedAccessView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (UIButton)backButton;
- (_UISearchControllerLimitedAccessView)initWithFrame:(CGRect)a3;
- (void)setBackButton:(id)a3;
@end

@implementation _UISearchControllerLimitedAccessView

- (_UISearchControllerLimitedAccessView)initWithFrame:(CGRect)a3
{
  v56[9] = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)_UISearchControllerLimitedAccessView;
  v3 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIView *)v9;

    [(UIView *)v3->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = +[UIColor tableBackgroundColor];
    [(UIView *)v3->_backgroundView setBackgroundColor:v11];

    [(UIView *)v3 addSubview:v3->_backgroundView];
    v12 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v5, v6, v7, v8);
    keyboardLimitedLabel = v3->_keyboardLimitedLabel;
    v3->_keyboardLimitedLabel = v12;

    [(UIView *)v3->_keyboardLimitedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [off_1E52D39B8 systemFontOfSize:28.0];
    [(UILabel *)v3->_keyboardLimitedLabel setFont:v14];

    v15 = +[UIColor labelColor];
    [(UILabel *)v3->_keyboardLimitedLabel setTextColor:v15];

    [(UILabel *)v3->_keyboardLimitedLabel setTextAlignment:1];
    [(UILabel *)v3->_keyboardLimitedLabel setNumberOfLines:0];
    [(UILabel *)v3->_keyboardLimitedLabel setLineBreakMode:0];
    v16 = _UINSLocalizedStringWithDefaultValue(@"Keyboard access is limited", @"Keyboard access is limited");
    [(UILabel *)v3->_keyboardLimitedLabel setText:v16];

    [(UIView *)v3->_keyboardLimitedLabel sizeToFit];
    [(UIView *)v3 addSubview:v3->_keyboardLimitedLabel];
    uint64_t v17 = +[UIButton buttonWithType:1];
    backButton = v3->_backButton;
    v3->_backButton = (UIButton *)v17;

    [(UIView *)v3->_backButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = v3->_backButton;
    v20 = _UINSLocalizedStringWithDefaultValue(@"Back", @"Back");
    [(UIButton *)v19 setTitle:v20 forState:0];

    [(UIView *)v3->_backButton sizeToFit];
    [(UIView *)v3 addSubview:v3->_backButton];
    v53 = [(UIView *)v3->_keyboardLimitedLabel leftAnchor];
    v54 = [(UIView *)v3 safeAreaLayoutGuide];
    v52 = [v54 leftAnchor];
    v51 = [v53 constraintEqualToAnchor:v52 constant:5.0];
    v56[0] = v51;
    v49 = [(UIView *)v3->_keyboardLimitedLabel rightAnchor];
    v50 = [(UIView *)v3 safeAreaLayoutGuide];
    v48 = [v50 rightAnchor];
    v47 = [v49 constraintEqualToAnchor:v48 constant:-5.0];
    v56[1] = v47;
    v45 = [(UIView *)v3->_keyboardLimitedLabel bottomAnchor];
    v46 = [(UIView *)v3 safeAreaLayoutGuide];
    v44 = [v46 centerYAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:-5.0];
    v56[2] = v43;
    v41 = [(UIView *)v3->_backButton centerXAnchor];
    v42 = [(UIView *)v3 safeAreaLayoutGuide];
    v40 = [v42 centerXAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v56[3] = v39;
    v37 = [(UIView *)v3->_backButton topAnchor];
    v38 = [(UIView *)v3 safeAreaLayoutGuide];
    v36 = [v38 centerYAnchor];
    v35 = [v37 constraintEqualToAnchor:v36 constant:5.0];
    v56[4] = v35;
    v33 = [(UIView *)v3->_backgroundView leftAnchor];
    v32 = [(UIView *)v3 leftAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v56[5] = v31;
    v21 = [(UIView *)v3->_backgroundView rightAnchor];
    v22 = [(UIView *)v3 rightAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v56[6] = v23;
    v24 = [(UIView *)v3->_backgroundView topAnchor];
    v25 = [(UIView *)v3 topAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v56[7] = v26;
    v27 = [(UIView *)v3->_backgroundView bottomAnchor];
    v28 = [(UIView *)v3 bottomAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v56[8] = v29;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:9];

    [MEMORY[0x1E4F5B268] activateConstraints:v34];
  }
  return v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  v4 = [a3 nextFocusedItem];
  LOBYTE(self) = v4 == self->_backButton;

  return (char)self;
}

- (UIButton)backButton
{
  return self->_backButton;
}

- (void)setBackButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_keyboardLimitedLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end