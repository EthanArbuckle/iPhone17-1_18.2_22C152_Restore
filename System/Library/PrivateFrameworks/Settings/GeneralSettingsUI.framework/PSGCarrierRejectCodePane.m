@interface PSGCarrierRejectCodePane
- (PSGCarrierRejectCodePane)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setPreferenceSpecifier:(id)a3;
@end

@implementation PSGCarrierRejectCodePane

- (void)setPreferenceSpecifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PSGCarrierRejectCodePane;
  [(PSEditingPane *)&v11 setPreferenceSpecifier:a3];
  v4 = [(PSEditingPane *)self preferenceSpecifier];
  v5 = [v4 propertyForKey:@"CauseCode"];
  int v6 = [v5 intValue];

  switch(v6)
  {
    case 6:
      v7 = PSG_BundleForGeneralSettingsUIFramework();
      v8 = v7;
      v9 = @"REGISTRATION_CAUSE_CODE_6";
      goto LABEL_7;
    case 3:
      v7 = PSG_BundleForGeneralSettingsUIFramework();
      v8 = v7;
      v9 = @"REGISTRATION_CAUSE_CODE_3";
      goto LABEL_7;
    case 2:
      v7 = PSG_BundleForGeneralSettingsUIFramework();
      v8 = v7;
      v9 = @"REGISTRATION_CAUSE_CODE_2";
LABEL_7:
      v10 = [v7 localizedStringForKey:v9 value:&stru_26F0FADC0 table:0];
      [(UILabel *)self->_rejectMessage setText:v10];

      return;
  }
  [(UILabel *)self->_rejectMessage setText:0];
}

- (void)layoutSubviews
{
  [(UILabel *)self->_rejectMessage frame];
  -[UILabel setFrame:](self->_rejectMessage, "setFrame:", 19.0, 100.0);
  rejectMessage = self->_rejectMessage;
  [(UILabel *)rejectMessage sizeToFit];
}

- (PSGCarrierRejectCodePane)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PSGCarrierRejectCodePane;
  v3 = -[PSEditingPane initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F828E0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    rejectMessage = v3->_rejectMessage;
    v3->_rejectMessage = (UILabel *)v5;

    v7 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
    [(UILabel *)v3->_rejectMessage setFont:v7];

    v8 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_rejectMessage setBackgroundColor:v8];

    v9 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v3->_rejectMessage setTextColor:v9];

    [(PSGCarrierRejectCodePane *)v3 addSubview:v3->_rejectMessage];
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end