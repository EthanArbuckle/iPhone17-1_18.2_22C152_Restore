@interface ICQPreferencesRemoteUIDelegateTableCellButton
- (ICQPreferencesRemoteUIDelegateTableCellButton)initWithName:(id)a3 target:(id)a4 action:(SEL)a5;
@end

@implementation ICQPreferencesRemoteUIDelegateTableCellButton

- (ICQPreferencesRemoteUIDelegateTableCellButton)initWithName:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ICQPreferencesRemoteUIDelegateTableCellButton;
  v10 = -[ICQPreferencesRemoteUIDelegateTableCellButton initWithFrame:](&v21, sel_initWithFrame_, 0.0, 0.0, 0.0, 70.0);
  if (v10)
  {
    uint64_t v11 = +[ICQPreferencesRemoteUIDelegateBorderedButton buttonWithType:1];
    button = v10->_button;
    v10->_button = (UIButton *)v11;

    -[UIButton setFrame:](v10->_button, "setFrame:", 0.0, 26.0, 0.0, 44.0);
    [(UIButton *)v10->_button addTarget:v9 action:a5 forControlEvents:64];
    [(UIButton *)v10->_button setTitle:v8 forState:0];
    v13 = v10->_button;
    v14 = [MEMORY[0x263F825C8] systemRedColor];
    [(UIButton *)v13 setTitleColor:v14 forState:0];

    [(UIButton *)v10->_button setAutoresizingMask:2];
    v15 = [MEMORY[0x263F825C8] whiteColor];
    [(UIButton *)v10->_button setBackgroundColor:v15];

    v16 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
    v17 = [(UIButton *)v10->_button titleLabel];
    [v17 setFont:v16];

    v18 = [(UIButton *)v10->_button titleLabel];
    [v18 setTextAlignment:1];

    [(ICQPreferencesRemoteUIDelegateTableCellButton *)v10 addSubview:v10->_button];
    v19 = [MEMORY[0x263F825C8] clearColor];
    [(ICQPreferencesRemoteUIDelegateTableCellButton *)v10 setBackgroundColor:v19];

    [(ICQPreferencesRemoteUIDelegateTableCellButton *)v10 setAutoresizingMask:2];
  }

  return v10;
}

- (void).cxx_destruct
{
}

@end