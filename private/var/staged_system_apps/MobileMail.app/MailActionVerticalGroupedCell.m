@interface MailActionVerticalGroupedCell
+ (id)reusableIdentifier;
- (MailActionVerticalGroupedCell)initWithFrame:(CGRect)a3;
- (UIView)separatorView;
- (unint64_t)verticalGroupedCellType;
- (void)prepareForReuse;
- (void)setSeparatorView:(id)a3;
- (void)setVerticalGroupedCellType:(unint64_t)a3;
@end

@implementation MailActionVerticalGroupedCell

+ (id)reusableIdentifier
{
  return @"MailActionVerticalGroupedCellIdentifier";
}

- (MailActionVerticalGroupedCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MailActionVerticalGroupedCell;
  v3 = -[MailActionCell initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MailActionVerticalGroupedCell *)v3 contentView];
    id v6 = objc_alloc_init((Class)UIView);
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = +[UIColor tertiarySystemGroupedBackgroundColor];
    [v6 setBackgroundColor:v7];

    [(MailActionVerticalGroupedCell *)v4 setSeparatorView:v6];
    [v5 addSubview:v6];
    v8 = objc_opt_new();
    UIRoundToViewScale();
    double v10 = v9;
    v11 = [v5 bottomAnchor];
    v12 = [v6 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:v10];
    [v8 addObject:v13];

    v14 = [v6 leadingAnchor];
    v15 = [v5 layoutMarginsGuide];
    v16 = [v15 leadingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:8.0];
    [v8 addObject:v17];

    v18 = [v6 trailingAnchor];
    v19 = [v5 layoutMarginsGuide];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:-8.0];
    [v8 addObject:v21];

    v22 = [v6 heightAnchor];
    v23 = [v22 constraintEqualToConstant:v10];
    [v8 addObject:v23];

    +[NSLayoutConstraint activateConstraints:v8];
    [(MailActionVerticalGroupedCell *)v4 setVerticalGroupedCellType:0];
  }
  return v4;
}

- (void)setVerticalGroupedCellType:(unint64_t)a3
{
  self->_verticalGroupedCellType = a3;
  v4 = [(MailActionVerticalGroupedCell *)self contentView];
  id v13 = [v4 superview];

  v5 = [(MailActionVerticalGroupedCell *)self separatorView];
  id v6 = v5;
  switch(self->_verticalGroupedCellType)
  {
    case 0uLL:
      v7 = [(MailActionVerticalGroupedCell *)self separatorView];
      [v7 setAlpha:1.0];

      v8 = [v13 layer];
      [v8 setCornerRadius:10.0];

      double v9 = [v13 layer];
      [v9 setMaskedCorners:15];

      [v6 setHidden:1];
      break;
    case 1uLL:
      [v5 setHidden:0];
      double v10 = [v13 layer];
      [v10 setMaskedCorners:3];

      break;
    case 2uLL:
      [v5 setHidden:0];
      v11 = [v13 layer];
      double v12 = 0.0;
      [v11 setMaskedCorners:12];
      goto LABEL_6;
    case 3uLL:
      [v5 setHidden:0];
      v11 = [v13 layer];
      double v12 = 1.0;
      [v11 setMaskedCorners:0];
LABEL_6:

      [v6 setAlpha:v12];
      break;
    default:
      break;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MailActionVerticalGroupedCell;
  [(MailActionCell *)&v3 prepareForReuse];
  [(MailActionVerticalGroupedCell *)self setVerticalGroupedCellType:0];
}

- (unint64_t)verticalGroupedCellType
{
  return self->_verticalGroupedCellType;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end