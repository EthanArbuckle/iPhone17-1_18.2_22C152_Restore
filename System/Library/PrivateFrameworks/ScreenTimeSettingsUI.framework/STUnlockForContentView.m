@interface STUnlockForContentView
- (STUnlockForContentView)initWithCoder:(id)a3;
- (STUnlockForContentView)initWithFrame:(CGRect)a3;
- (UILabel)unlockToViewContentLabel;
- (void)_stUnlockForContentViewCommonInit;
@end

@implementation STUnlockForContentView

- (STUnlockForContentView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUnlockForContentView;
  v3 = -[STUnlockForContentView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STUnlockForContentView *)v3 _stUnlockForContentViewCommonInit];
  return v3;
}

- (STUnlockForContentView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STUnlockForContentView;
  v3 = [(STUnlockForContentView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(STUnlockForContentView *)v3 _stUnlockForContentViewCommonInit];
  }
  return v4;
}

- (void)_stUnlockForContentViewCommonInit
{
  v36[7] = *MEMORY[0x263EF8340];
  v3 = (UILabel *)objc_opt_new();
  unlockToViewContentLabel = self->_unlockToViewContentLabel;
  self->_unlockToViewContentLabel = v3;

  [(UILabel *)self->_unlockToViewContentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  [(UILabel *)self->_unlockToViewContentLabel setFont:v5];

  objc_super v6 = [MEMORY[0x263F825C8] systemGrayColor];
  [(UILabel *)self->_unlockToViewContentLabel setTextColor:v6];

  [(UILabel *)self->_unlockToViewContentLabel setLineBreakMode:0];
  [(UILabel *)self->_unlockToViewContentLabel setTextAlignment:1];
  [(UILabel *)self->_unlockToViewContentLabel setNumberOfLines:0];
  v7 = self->_unlockToViewContentLabel;
  v8 = +[STScreenTimeSettingsUIBundle bundle];
  v9 = [v8 localizedStringForKey:@"WidgetUnlockToView" value:&stru_26D9391A8 table:0];
  [(UILabel *)v7 setText:v9];

  v35 = [MEMORY[0x263F82DF0] widgetEffectForVibrancyStyle:102];
  v10 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v35];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(STUnlockForContentView *)self addSubview:v10];
  v34 = [v10 contentView];
  [v34 addSubview:self->_unlockToViewContentLabel];
  v24 = (void *)MEMORY[0x263F08938];
  v33 = [(UILabel *)self->_unlockToViewContentLabel topAnchor];
  v32 = [v10 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v36[0] = v31;
  v30 = [(UILabel *)self->_unlockToViewContentLabel leadingAnchor];
  v29 = [v10 leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v36[1] = v28;
  v27 = [(UILabel *)self->_unlockToViewContentLabel bottomAnchor];
  v26 = [v10 bottomAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v36[2] = v25;
  v23 = [(UILabel *)self->_unlockToViewContentLabel trailingAnchor];
  v22 = [v10 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v36[3] = v21;
  v20 = [v10 leadingAnchor];
  v11 = [(STUnlockForContentView *)self leadingAnchor];
  v12 = [v20 constraintEqualToAnchor:v11];
  v36[4] = v12;
  v13 = [v10 trailingAnchor];
  v14 = [(STUnlockForContentView *)self trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v36[5] = v15;
  v16 = [v10 centerYAnchor];
  v17 = [(STUnlockForContentView *)self centerYAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v36[6] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:7];
  [v24 activateConstraints:v19];
}

- (UILabel)unlockToViewContentLabel
{
  return self->_unlockToViewContentLabel;
}

- (void).cxx_destruct
{
}

@end