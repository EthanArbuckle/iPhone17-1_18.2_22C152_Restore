@interface PSKeychainSyncHeaderView
- (BOOL)usesCompactLayout;
- (PSKeychainSyncHeaderView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)layoutSubviews;
- (void)setDetailText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setUsesCompactLayout:(BOOL)a3;
@end

@implementation PSKeychainSyncHeaderView

- (PSKeychainSyncHeaderView)initWithSpecifier:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)PSKeychainSyncHeaderView;
  v3 = [(PSKeychainSyncHeaderView *)&v29 init];
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setLineBreakMode:0];
    v6 = v3->_titleLabel;
    v7 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v6 setBackgroundColor:v7];

    v8 = +[PSKeychainSyncManager sharedManager];
    int v9 = [v8 isRunningInBuddy];

    v10 = v3->_titleLabel;
    if (v9)
    {
      v11 = [MEMORY[0x1E4F428B8] blackColor];
      [(UILabel *)v10 setTextColor:v11];

      v12 = [MEMORY[0x1E4F42948] currentDevice];
      LODWORD(v11) = objc_msgSend(v12, "sf_isiPad");

      v13 = v3->_titleLabel;
      if (v11) {
        [MEMORY[0x1E4F42A30] _thinSystemFontOfSize:48.0];
      }
      else {
      v15 = [MEMORY[0x1E4F42A30] _lightSystemFontOfSize:30.0];
      }
      [(UILabel *)v13 setFont:v15];

      [(UILabel *)v3->_titleLabel setTextAlignment:1];
    }
    else
    {
      v14 = [MEMORY[0x1E4F428B8] darkGrayColor];
      [(UILabel *)v10 setTextColor:v14];
    }
    [(PSKeychainSyncHeaderView *)v3 addSubview:v3->_titleLabel];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = v16;

    v18 = v3->_detailLabel;
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v18 setBackgroundColor:v19];

    [(UILabel *)v3->_detailLabel setNumberOfLines:0];
    [(UILabel *)v3->_detailLabel setLineBreakMode:0];
    v20 = v3->_detailLabel;
    v21 = (void *)MEMORY[0x1E4F42A30];
    v22 = [MEMORY[0x1E4F42D90] mainScreen];
    [v22 _referenceBounds];
    double v23 = 16.0;
    if (v24 == 480.0) {
      double v23 = 14.0;
    }
    v25 = [v21 systemFontOfSize:v23];
    [(UILabel *)v20 setFont:v25];

    [(UILabel *)v3->_detailLabel setTextAlignment:1];
    if (v9)
    {
      v26 = v3->_titleLabel;
      [MEMORY[0x1E4F428B8] blackColor];
    }
    else
    {
      v26 = v3->_detailLabel;
      [MEMORY[0x1E4F428B8] darkGrayColor];
    v27 = };
    [(UILabel *)v26 setTextColor:v27];

    [(PSKeychainSyncHeaderView *)v3 addSubview:v3->_detailLabel];
  }
  return v3;
}

- (void)setUsesCompactLayout:(BOOL)a3
{
  self->_usesCompactLayout = a3;
  [(PSKeychainSyncHeaderView *)self setNeedsLayout];
}

- (void)setDetailText:(id)a3
{
  [(UILabel *)self->_detailLabel setText:a3];
  [(PSKeychainSyncHeaderView *)self setNeedsLayout];
}

- (void)setTitleText:(id)a3
{
  [(UILabel *)self->_titleLabel setText:a3];
  [(PSKeychainSyncHeaderView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3 = +[PSKeychainSyncManager sharedManager];
  double v4 = 18.0;
  if ([v3 isRunningInBuddy]) {
    double v5 = 6.0;
  }
  else {
    double v5 = 18.0;
  }

  v6 = [(UILabel *)self->_titleLabel text];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(UILabel *)self->_titleLabel frame];
    double v9 = v8;
    double v11 = v10;
    v12 = +[PSKeychainSyncManager sharedManager];
    if ([v12 isRunningInBuddy]) {
      double v4 = 6.0;
    }

    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 20.0, v4, v9, v11);
    v19.origin.x = 20.0;
    v19.origin.y = v4;
    v19.size.width = v9;
    v19.size.height = v11;
    double MaxY = CGRectGetMaxY(v19);
    double v14 = 11.0;
    if (!self->_usesCompactLayout) {
      double v14 = 15.0;
    }
    double v5 = MaxY + v14;
  }
  v15 = [(UILabel *)self->_detailLabel text];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    [(UILabel *)self->_detailLabel frame];
    detailLabel = self->_detailLabel;
    -[UILabel setFrame:](detailLabel, "setFrame:", 20.0, v5);
  }
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  double v4 = 0.0;
  if (a3 > 0.0)
  {
    [(PSKeychainSyncHeaderView *)self frame];
    double v8 = v7;
    double v10 = v9;
    double v11 = [(UILabel *)self->_titleLabel text];
    uint64_t v12 = [v11 length];

    v13 = [(UILabel *)self->_detailLabel text];
    uint64_t v14 = [v13 length];

    if (v12)
    {
      [(UILabel *)self->_titleLabel frame];
      double v16 = v15;
      double v18 = v17;
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3 + -40.0, 1.79769313e308);
      double v20 = v19;
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v16, v18, a3 + -40.0, v19);
      double v4 = v20 + 0.0;
      if (!v14)
      {
LABEL_10:
        v28 = +[PSKeychainSyncManager sharedManager];
        int v29 = [v28 isRunningInBuddy];
        double v30 = 18.0;
        double v31 = 6.0;
        if (v29) {
          double v30 = 6.0;
        }
        if (!self->_usesCompactLayout) {
          double v31 = 30.0;
        }
        double v4 = v4 + v30 + v31;

        goto LABEL_15;
      }
    }
    else if (!v14)
    {
LABEL_15:
      -[PSKeychainSyncHeaderView setFrame:](self, "setFrame:", v8, v10, a3, v4);
      return v4;
    }
    [(UILabel *)self->_detailLabel frame];
    double v22 = v21;
    double v24 = v23;
    -[UILabel sizeThatFits:](self->_detailLabel, "sizeThatFits:", a3 + -40.0, 1.79769313e308);
    double v26 = v25;
    -[UILabel setFrame:](self->_detailLabel, "setFrame:", v22, v24, a3 + -40.0, v25);
    double v4 = v4 + v26;
    if (v12)
    {
      double v27 = 11.0;
      if (!self->_usesCompactLayout) {
        double v27 = 15.0;
      }
      double v4 = v4 + v27;
    }
    goto LABEL_10;
  }
  return v4;
}

- (BOOL)usesCompactLayout
{
  return self->_usesCompactLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end