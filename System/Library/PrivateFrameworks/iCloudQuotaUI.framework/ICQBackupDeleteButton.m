@interface ICQBackupDeleteButton
+ (double)usageDeleteButtonHeight;
- (ICQBackupDeleteButton)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)layoutSubviews;
@end

@implementation ICQBackupDeleteButton

+ (double)usageDeleteButtonHeight
{
  return 54.0;
}

- (ICQBackupDeleteButton)initWithSpecifier:(id)a3
{
  v4 = (char *)a3;
  v25.receiver = self;
  v25.super_class = (Class)ICQBackupDeleteButton;
  v5 = [(ICQBackupDeleteButton *)&v25 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F825C8] clearColor];
    [(ICQBackupDeleteButton *)v5 setBackgroundColor:v6];

    uint64_t v7 = [MEMORY[0x263F824E8] buttonWithType:0];
    deleteButton = v5->_deleteButton;
    v5->_deleteButton = (UIButton *)v7;

    v9 = [(UIButton *)v5->_deleteButton titleLabel];
    [v9 setTextAlignment:1];

    v10 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesDeleteButtonNormal.png"];
    [v10 size];
    *(float *)&double v11 = (v11 + -1.0) * 0.5;
    v12 = v5->_deleteButton;
    unint64_t v13 = vcvtms_s32_f32(*(float *)&v11);
    v14 = [v10 stretchableImageWithLeftCapWidth:v13 topCapHeight:0];
    [(UIButton *)v12 setBackgroundImage:v14 forState:0];

    v15 = [MEMORY[0x263F827E8] kitImageNamed:@"UIPreferencesDeleteButtonPressed.png"];

    v16 = v5->_deleteButton;
    v17 = [v15 stretchableImageWithLeftCapWidth:v13 topCapHeight:0];
    [(UIButton *)v16 setBackgroundImage:v17 forState:1];

    v18 = [MEMORY[0x263F81708] boldSystemFontOfSize:20.0];
    v19 = [(UIButton *)v5->_deleteButton titleLabel];
    [v19 setFont:v18];

    v20 = v5->_deleteButton;
    v21 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
    [(UIButton *)v20 setTitle:v21 forState:0];

    v22 = v5->_deleteButton;
    id WeakRetained = objc_loadWeakRetained((id *)&v4[*MEMORY[0x263F5FE40]]);
    [(UIButton *)v22 addTarget:WeakRetained action:*(void *)&v4[*MEMORY[0x263F5FE38]] forControlEvents:64];

    [(ICQBackupDeleteButton *)v5 addSubview:v5->_deleteButton];
    [(ICQBackupDeleteButton *)v5 setNeedsLayout];
  }
  return v5;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)ICQBackupDeleteButton;
  [(ICQBackupDeleteButton *)&v7 layoutSubviews];
  v3 = [(ICQBackupDeleteButton *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 _backgroundInset];
    double v5 = v4;
    [(ICQBackupDeleteButton *)self bounds];
    [(UIButton *)self->_deleteButton setFrame:v5 + v6];
  }
}

- (double)preferredHeightForWidth:(double)a3
{
  v3 = objc_opt_class();
  [v3 usageDeleteButtonHeight];
  return result;
}

- (void).cxx_destruct
{
}

@end