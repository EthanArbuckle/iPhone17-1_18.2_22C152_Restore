@interface TVRAlertView
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (NSString)title;
- (TVRAlertView)initWithFrame:(CGRect)a3;
- (TVRAlertViewDelegate)delegate;
- (TVRCPINEntryAttributes)PINEntryAttributes;
- (TVRPasscodeField)passcodeField;
- (UILabel)titleLabel;
- (UIView)blendModeView;
- (UIView)hairlineView;
- (UIVisualEffectView)effectView;
- (_TVRMAlertButton)cancelButton;
- (void)_cancelButton:(id)a3;
- (void)_passcodeFieldTapped;
- (void)_pinTextDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setBlendModeView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHairlineView:(id)a3;
- (void)setPINEntryAttributes:(id)a3;
- (void)setPasscodeField:(id)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TVRAlertView

- (TVRAlertView)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)TVRAlertView;
  v3 = -[TVRAlertView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(TVRAlertView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    v6 = [(TVRAlertView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    v7 = [(TVRAlertView *)v4 layer];
    uint64_t v8 = *MEMORY[0x263F15A20];
    [v7 setCornerCurve:*MEMORY[0x263F15A20]];

    v9 = [(TVRAlertView *)v4 layer];
    [v9 setCornerRadius:13.0];

    [(TVRAlertView *)v4 setClipsToBounds:1];
    v10 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    blendModeView = v4->_blendModeView;
    v4->_blendModeView = v10;

    v12 = v4->_blendModeView;
    v13 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.17254902 green:0.17254902 blue:0.180392157 alpha:1.0];
    [(UIView *)v12 setBackgroundColor:v13];

    v14 = [(UIView *)v4->_blendModeView layer];
    [v14 setCornerCurve:v8];

    v15 = [(UIView *)v4->_blendModeView layer];
    [v15 setCornerRadius:13.0];

    [(TVRAlertView *)v4 addSubview:v4->_blendModeView];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v16;

    v18 = v4->_titleLabel;
    v19 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    [(UILabel *)v18 setFont:v19];

    v20 = v4->_titleLabel;
    v21 = [MEMORY[0x263F825C8] systemWhiteColor];
    [(UILabel *)v20 setTextColor:v21];

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(UILabel *)v4->_titleLabel setNumberOfLines:4];
    [(UILabel *)v4->_titleLabel setLineBreakMode:4];
    [(UILabel *)v4->_titleLabel setPreferredMaxLayoutWidth:270.0];
    [(TVRAlertView *)v4 addSubview:v4->_titleLabel];
    v22 = objc_alloc_init(TVRPasscodeField);
    passcodeField = v4->_passcodeField;
    v4->_passcodeField = v22;

    [(TVRPasscodeField *)v4->_passcodeField setUseSystemColors:0];
    [(TVRPasscodeField *)v4->_passcodeField setAutoresizingMask:2];
    [(TVRPasscodeField *)v4->_passcodeField addTarget:v4 action:sel__pinTextDidChange_ forControlEvents:0x20000];
    v56 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v4 action:sel__passcodeFieldTapped];
    [(TVRPasscodeField *)v4->_passcodeField addGestureRecognizer:v56];
    [(TVRAlertView *)v4 addSubview:v4->_passcodeField];
    uint64_t v24 = +[_TVRMAlertButton buttonWithType:0];
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (_TVRMAlertButton *)v24;

    v26 = v4->_cancelButton;
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"TVRemoteUIPairingCancelString" value:&stru_26DB4CAE0 table:@"Localizable"];
    [(_TVRMAlertButton *)v26 setTitle:v28 forState:0];

    v29 = v4->_cancelButton;
    v30 = [MEMORY[0x263F825C8] systemWhiteColor];
    [(_TVRMAlertButton *)v29 setTitleColor:v30 forState:1];

    v31 = [(_TVRMAlertButton *)v4->_cancelButton titleLabel];
    v32 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v31 setFont:v32];

    [(_TVRMAlertButton *)v4->_cancelButton addTarget:v4 action:sel__cancelButton_ forControlEvents:0x2000];
    v33 = [(_TVRMAlertButton *)v4->_cancelButton layer];
    [v33 setAllowsGroupOpacity:0];

    v34 = [(_TVRMAlertButton *)v4->_cancelButton layer];
    [v34 setAllowsGroupBlending:0];

    [(TVRAlertView *)v4 addSubview:v4->_cancelButton];
    id v35 = objc_alloc_init(MEMORY[0x263F82E00]);
    v36 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.109803922 green:0.109803922 blue:0.117647059 alpha:1.0];
    [v35 setBackgroundColor:v36];

    v37 = [v35 layer];
    uint64_t v38 = *MEMORY[0x263F15B18];
    v39 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B18]];
    [v37 setCompositingFilter:v39];

    [(_TVRMAlertButton *)v4->_cancelButton setBurnView:v35];
    id v40 = objc_alloc_init(MEMORY[0x263F82E00]);
    v41 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.04];
    [v40 setBackgroundColor:v41];

    v42 = [v40 layer];
    v43 = [MEMORY[0x263F157C8] filterWithType:v38];
    [v42 setCompositingFilter:v43];

    [(_TVRMAlertButton *)v4->_cancelButton setPlusDView:v40];
    v44 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    hairlineView = v4->_hairlineView;
    v4->_hairlineView = v44;

    v46 = [(UIView *)v4->_hairlineView layer];
    [v46 setAllowsGroupBlending:0];

    [(TVRAlertView *)v4 addSubview:v4->_hairlineView];
    id v47 = objc_alloc_init(MEMORY[0x263F82E00]);
    v48 = [MEMORY[0x263F825C8] colorWithWhite:0.250980392 alpha:1.0];
    [v47 setBackgroundColor:v48];

    [v47 setAutoresizingMask:18];
    v49 = [v47 layer];
    v50 = [MEMORY[0x263F157C8] filterWithType:v38];
    [v49 setCompositingFilter:v50];

    [(UIView *)v4->_hairlineView addSubview:v47];
    id v51 = objc_alloc_init(MEMORY[0x263F82E00]);
    v52 = [MEMORY[0x263F825C8] colorWithDisplayP3Red:0.0 green:0.0 blue:0.31372549 alpha:0.05];
    [v51 setBackgroundColor:v52];

    [v51 setAutoresizingMask:18];
    v53 = [v51 layer];
    v54 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D50]];
    [v53 setCompositingFilter:v54];

    [(UIView *)v4->_hairlineView addSubview:v51];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, 1.79769313e308);
  double v6 = v5;
  -[_TVRMAlertButton sizeThatFits:](self->_cancelButton, "sizeThatFits:", width, 1.79769313e308);
  double v8 = ceil(v6) + 20.0 + 19.0 + 60.0;
  if (v7 < 44.0) {
    double v7 = 44.0;
  }
  double v9 = v8 + v7;
  double v10 = width;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  [(TVRAlertView *)self bounds];
  double x = v20.origin.x;
  double y = v20.origin.y;
  double width = v20.size.width;
  double height = v20.size.height;
  double v7 = CGRectGetWidth(v20);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, 0.0);
  double v9 = ceil(v8);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 20.0, v7, v9);
  double v10 = v9 + 20.0 + 19.0;
  -[TVRPasscodeField setFrame:](self->_passcodeField, "setFrame:", 0.0, v10, v7, 60.0);
  double v11 = v10 + 60.0;
  v12 = [(TVRAlertView *)self _screen];
  [v12 scale];
  double v14 = v13;

  -[UIView setFrame:](self->_hairlineView, "setFrame:", 0.0, v11 - 1.0 / v14, v7);
  cancelButton = self->_cancelButton;
  [(TVRAlertView *)self bounds];
  -[_TVRMAlertButton sizeThatFits:](cancelButton, "sizeThatFits:", CGRectGetWidth(v21), 1.79769313e308);
  if (v16 >= 44.0) {
    double v17 = v16;
  }
  else {
    double v17 = 44.0;
  }
  -[_TVRMAlertButton setFrame:](self->_cancelButton, "setFrame:", 0.0, v11, v7, v17);
  -[UIView setFrame:](self->_blendModeView, "setFrame:", x, y, width, height);
  effectView = self->_effectView;
  -[UIVisualEffectView setFrame:](effectView, "setFrame:", x, y, width, height);
}

- (BOOL)becomeFirstResponder
{
  return [(TVRPasscodeField *)self->_passcodeField becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)TVRAlertView;
  [(TVRAlertView *)&v4 resignFirstResponder];
  return [(TVRPasscodeField *)self->_passcodeField resignFirstResponder];
}

- (NSString)text
{
  return [(TVRPasscodeField *)self->_passcodeField text];
}

- (void)setText:(id)a3
{
}

- (TVRCPINEntryAttributes)PINEntryAttributes
{
  return [(TVRPasscodeField *)self->_passcodeField PINEntryattributes];
}

- (void)setPINEntryAttributes:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (void)_cancelButton:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 alertViewDidCancel:self];
  }
}

- (void)_passcodeFieldTapped
{
  if (([(TVRPasscodeField *)self->_passcodeField isFirstResponder] & 1) == 0)
  {
    passcodeField = self->_passcodeField;
    [(TVRPasscodeField *)passcodeField becomeFirstResponder];
  }
}

- (void)_pinTextDidChange:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [v8 text];
    [v6 alertView:self didUpdateText:v7];
  }
}

- (TVRAlertViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVRAlertViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)blendModeView
{
  return self->_blendModeView;
}

- (void)setBlendModeView:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (TVRPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
}

- (_TVRMAlertButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_blendModeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end