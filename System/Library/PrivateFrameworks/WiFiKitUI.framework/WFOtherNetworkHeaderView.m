@interface WFOtherNetworkHeaderView
- (NSString)title;
- (UILabel)titleLabel;
- (WFOtherNetworkHeaderView)initWithReuseIdentifier:(id)a3;
- (void)_configureContents;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation WFOtherNetworkHeaderView

- (WFOtherNetworkHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFOtherNetworkHeaderView;
  v3 = [(WFOtherNetworkHeaderView *)&v8 initWithReuseIdentifier:a3];
  v4 = objc_opt_new();
  [(WFOtherNetworkHeaderView *)v3 setTitleLabel:v4];

  [(UILabel *)v3->_titleLabel sizeToFit];
  [(UILabel *)v3->_titleLabel setTextAlignment:1];
  v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)v3->_titleLabel setFont:v5];

  v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(UILabel *)v3->_titleLabel setTextColor:v6];

  [(WFOtherNetworkHeaderView *)v3 _configureContents];
  return v3;
}

- (void)setTitle:(id)a3
{
  v4 = (__CFString *)a3;
  v5 = [(WFOtherNetworkHeaderView *)self titleLabel];
  id v7 = v5;
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = &stru_26D8F6070;
  }
  [v5 setText:v6];

  [(WFOtherNetworkHeaderView *)self setTitleLabel:v7];
}

- (NSString)title
{
  v2 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)_configureContents
{
  v48[9] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [(WFOtherNetworkHeaderView *)self titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(WFOtherNetworkHeaderView *)self contentView];
  [v5 addSubview:v3];

  v6 = [(WFOtherNetworkHeaderView *)self contentView];
  id v7 = [(WFOtherNetworkHeaderView *)self titleLabel];
  [v6 addSubview:v7];

  v31 = (void *)MEMORY[0x263F08938];
  v47 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v45 = [v47 leadingAnchor];
  v46 = [(WFOtherNetworkHeaderView *)self contentView];
  v44 = [v46 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v48[0] = v43;
  v42 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v40 = [v42 topAnchor];
  v41 = [(WFOtherNetworkHeaderView *)self contentView];
  v39 = [v41 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v48[1] = v38;
  v37 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v35 = [v37 trailingAnchor];
  v36 = [(WFOtherNetworkHeaderView *)self contentView];
  v34 = [v36 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v48[2] = v33;
  v32 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v30 = [v32 bottomAnchor];
  v29 = [v3 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v48[3] = v28;
  v25 = [v3 leadingAnchor];
  v26 = [(WFOtherNetworkHeaderView *)self contentView];
  v24 = [v26 leadingAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v48[4] = v23;
  v21 = [v3 topAnchor];
  v22 = [(WFOtherNetworkHeaderView *)self titleLabel];
  v20 = [v22 bottomAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v48[5] = v19;
  v18 = [v3 trailingAnchor];
  objc_super v8 = [(WFOtherNetworkHeaderView *)self contentView];
  v9 = [v8 trailingAnchor];
  v10 = [v18 constraintEqualToAnchor:v9];
  v48[6] = v10;
  v27 = v3;
  v11 = [v3 bottomAnchor];
  v12 = [(WFOtherNetworkHeaderView *)self contentView];
  v13 = [v12 bottomAnchor];
  v14 = [v11 constraintEqualToAnchor:v13];
  v48[7] = v14;
  v15 = [v3 heightAnchor];
  v16 = [v15 constraintEqualToConstant:24.0];
  v48[8] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:9];
  [v31 activateConstraints:v17];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end