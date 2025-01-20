@interface _VSUIActionStatusErrorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)errorIconView;
- (UILabel)errorLabel;
- (UIView)errorIconBackgroundView;
- (_VSUIActionStatusErrorView)initWithCoder:(id)a3;
- (_VSUIActionStatusErrorView)initWithFrame:(CGRect)a3;
- (void)_setUpViews;
- (void)setErrorIconBackgroundView:(id)a3;
- (void)setErrorIconView:(id)a3;
- (void)setErrorLabel:(id)a3;
@end

@implementation _VSUIActionStatusErrorView

- (_VSUIActionStatusErrorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_VSUIActionStatusErrorView;
  v3 = -[_VSUIActionStatusErrorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_VSUIActionStatusErrorView *)v3 _setUpViews];
  }
  return v4;
}

- (_VSUIActionStatusErrorView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_VSUIActionStatusErrorView;
  v3 = [(_VSUIActionStatusErrorView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(_VSUIActionStatusErrorView *)v3 _setUpViews];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat v4 = a3.width + -24.0 + -10.0;
  v5 = [(_VSUIActionStatusErrorView *)self errorLabel];
  objc_msgSend(v5, "sizeThatFits:", v4, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v9 + 15.0 + 15.0;
  double v11 = v7;
  result.double height = v10;
  result.width = v11;
  return result;
}

- (void)_setUpViews
{
  v62[13] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F1C768]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v10 = [v9 localizedStringForKey:@"There was a problem. Try again…" value:&stru_26E287438 table:0];
  [v8 setText:v10];

  double v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v8 setFont:v11];

  v12 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v8 setTextColor:v12];

  [v8 setTextAlignment:1];
  [v8 setNumberOfLines:2];
  [v8 setLineBreakMode:4];
  [(_VSUIActionStatusErrorView *)self addSubview:v8];
  [(_VSUIActionStatusErrorView *)self setErrorLabel:v8];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v4, v5, v6, v7);
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MEMORY[0x263F1C550] systemGray3Color];
  [v13 setBackgroundColor:v14];

  v15 = [v13 layer];
  [v15 setCornerRadius:12.0];

  [(_VSUIActionStatusErrorView *)self addSubview:v13];
  [(_VSUIActionStatusErrorView *)self setErrorIconBackgroundView:v13];
  v16 = (void *)MEMORY[0x263F1C6B0];
  v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v61 = [v16 imageNamed:@"ActionErrorAlert" inBundle:v17];

  id v18 = objc_alloc(MEMORY[0x263F1C6D0]);
  v19 = [MEMORY[0x263F1C550] systemGrayColor];
  v20 = [v61 _flatImageWithColor:v19];
  v21 = (void *)[v18 initWithImage:v20];

  v22 = [v21 layer];
  [v22 setMasksToBounds:1];

  [v21 setContentMode:1];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_VSUIActionStatusErrorView *)self addSubview:v21];
  [(_VSUIActionStatusErrorView *)self setErrorIconView:v21];
  v47 = (void *)MEMORY[0x263F08938];
  v60 = [v13 widthAnchor];
  v59 = [v60 constraintEqualToConstant:24.0];
  v62[0] = v59;
  v58 = [v13 heightAnchor];
  v57 = [v58 constraintEqualToConstant:24.0];
  v62[1] = v57;
  v56 = [v13 trailingAnchor];
  v55 = [(_VSUIActionStatusErrorView *)self trailingAnchor];
  v54 = [v56 constraintEqualToAnchor:v55 constant:-15.0];
  v62[2] = v54;
  v53 = [v13 centerYAnchor];
  v52 = [v8 centerYAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v62[3] = v51;
  v50 = [v8 leadingAnchor];
  v49 = [(_VSUIActionStatusErrorView *)self leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49 constant:15.0];
  v62[4] = v48;
  v46 = [v8 trailingAnchor];
  v45 = [v13 leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45 constant:-10.0];
  v62[5] = v44;
  v43 = [v8 topAnchor];
  v42 = [(_VSUIActionStatusErrorView *)self topAnchor];
  v41 = [v43 constraintGreaterThanOrEqualToAnchor:v42];
  v62[6] = v41;
  v39 = [v8 bottomAnchor];
  v38 = [(_VSUIActionStatusErrorView *)self bottomAnchor];
  v37 = [v39 constraintLessThanOrEqualToAnchor:v38];
  v62[7] = v37;
  v36 = [v8 centerYAnchor];
  v35 = [(_VSUIActionStatusErrorView *)self centerYAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v62[8] = v34;
  v33 = [v21 widthAnchor];
  v32 = [v33 constraintEqualToConstant:20.0];
  v62[9] = v32;
  v31 = [v21 heightAnchor];
  v23 = [v31 constraintEqualToConstant:20.0];
  v62[10] = v23;
  v40 = v21;
  v24 = [v21 centerYAnchor];
  v25 = [v13 centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25 constant:0.0];
  v62[11] = v26;
  v27 = [v21 centerXAnchor];
  v28 = [v13 centerXAnchor];
  v29 = [v27 constraintEqualToAnchor:v28 constant:0.0];
  v62[12] = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:13];
  [v47 activateConstraints:v30];
}

- (UILabel)errorLabel
{
  return self->_errorLabel;
}

- (void)setErrorLabel:(id)a3
{
}

- (UIImageView)errorIconView
{
  return self->_errorIconView;
}

- (void)setErrorIconView:(id)a3
{
}

- (UIView)errorIconBackgroundView
{
  return self->_errorIconBackgroundView;
}

- (void)setErrorIconBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_errorIconView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end