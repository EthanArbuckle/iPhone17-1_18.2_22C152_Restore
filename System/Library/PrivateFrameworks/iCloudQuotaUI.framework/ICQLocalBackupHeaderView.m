@interface ICQLocalBackupHeaderView
- (ICQLocalBackupHeaderView)initWithSpecifier:(id)a3;
- (void)hideSpinner;
- (void)layoutSubviews;
- (void)showSpinner;
@end

@implementation ICQLocalBackupHeaderView

- (ICQLocalBackupHeaderView)initWithSpecifier:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ICQLocalBackupHeaderView;
  v3 = [(ICQSubtitleHeaderView *)&v14 initWithSpecifier:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(ICQSubtitleHeaderView *)v3 titleLabel];
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"BACKUP_OPTIONS" value:&stru_26DFF2C90 table:@"BackupInfo"];
    v8 = [v7 uppercaseString];
    [v5 setText:v8];

    v9 = [(ICQSubtitleHeaderView *)v4 titleLabel];
    v10 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v9 setTextColor:v10];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v11;

    [(UIActivityIndicatorView *)v4->_spinner setAlpha:0.0];
    [(ICQLocalBackupHeaderView *)v4 addSubview:v4->_spinner];
  }
  return v4;
}

- (void)showSpinner
{
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  spinner = self->_spinner;
  [(UIActivityIndicatorView *)spinner setAlpha:1.0];
}

- (void)hideSpinner
{
  [(UIActivityIndicatorView *)self->_spinner setAlpha:0.0];
  spinner = self->_spinner;
  [(UIActivityIndicatorView *)spinner stopAnimating];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)ICQLocalBackupHeaderView;
  [(ICQSubtitleHeaderView *)&v23 layoutSubviews];
  v3 = [(ICQSubtitleHeaderView *)self titleLabel];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UIActivityIndicatorView *)self->_spinner frame];
  double v13 = v12;
  double v15 = v14;
  int v16 = [(ICQLocalBackupHeaderView *)self _shouldReverseLayoutDirection];
  CGFloat v17 = v5;
  CGFloat v18 = v7;
  CGFloat v19 = v9;
  CGFloat v20 = v11;
  if (v16) {
    double v21 = CGRectGetMinX(*(CGRect *)&v17) + -6.0 - v13;
  }
  else {
    double v21 = CGRectGetMaxX(*(CGRect *)&v17) + 6.0;
  }
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  float v22 = CGRectGetMidY(v24) + v15 * -0.5;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v21, floorf(v22), v13, v15);
}

- (void).cxx_destruct
{
}

@end