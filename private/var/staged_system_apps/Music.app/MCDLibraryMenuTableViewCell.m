@interface MCDLibraryMenuTableViewCell
- (MCDLibraryMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation MCDLibraryMenuTableViewCell

- (MCDLibraryMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)MCDLibraryMenuTableViewCell;
  v4 = [(_MCDReusableCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIFont systemFontOfSize:15.0];
    v6 = [(MCDLibraryMenuTableViewCell *)v4 textLabel];
    [v6 setFont:v5];

    v7 = +[UIColor _labelColor];
    v8 = [(MCDLibraryMenuTableViewCell *)v4 textLabel];
    [v8 setTextColor:v7];

    v9 = +[UIColor _carSystemFocusLabelColor];
    v10 = [(MCDLibraryMenuTableViewCell *)v4 textLabel];
    [v10 setHighlightedTextColor:v9];

    v11 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:16.0];
    v12 = [(MCDLibraryMenuTableViewCell *)v4 imageView];
    [v12 setPreferredSymbolConfiguration:v11];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryMenuTableViewCell;
  [(_MCDReusableCell *)&v9 setHighlighted:a3 animated:a4];
  if (a3 || [(MCDLibraryMenuTableViewCell *)self isSelected])
  {
    v6 = +[UIColor _carSystemFocusSecondaryColor];
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    v6 = 0;
  }
  v8 = [(MCDLibraryMenuTableViewCell *)self imageView];
  [v8 setTintColor:v6];

  if (v7) {
}
  }

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCDLibraryMenuTableViewCell;
  [(_MCDReusableCell *)&v9 setSelected:a3 animated:a4];
  unsigned int v6 = [(MCDLibraryMenuTableViewCell *)self isHighlighted] | v4;
  if (v6 == 1)
  {
    int v7 = +[UIColor _carSystemFocusSecondaryColor];
  }
  else
  {
    int v7 = 0;
  }
  v8 = [(MCDLibraryMenuTableViewCell *)self imageView];
  [v8 setTintColor:v7];

  if (v6) {
}
  }

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)MCDLibraryMenuTableViewCell;
  [(MCDLibraryMenuTableViewCell *)&v39 layoutSubviews];
  v3 = [(MCDLibraryMenuTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v37 = v5 + 10.0;
  double v38 = v9 + -10.0;
  CGFloat y = CGRectZero.origin.y;
  v40.origin.x = v5 + 10.0;
  v40.origin.CGFloat y = v7;
  v40.size.width = v9 + -10.0;
  v40.size.height = v11;
  CGFloat MinX = CGRectGetMinX(v40);
  v41.origin.x = v5 + 10.0;
  v41.origin.CGFloat y = v7;
  v41.size.width = v9 + -10.0;
  v41.size.height = v11;
  CGFloat Height = CGRectGetHeight(v41);
  objc_super v14 = [(MCDLibraryMenuTableViewCell *)self imageView];
  [v14 sizeThatFits:CGSizeZero.width, CGSizeZero.height];

  UIRectCenteredRect();
  CPUIRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(MCDLibraryMenuTableViewCell *)self imageView];
  [v23 setFrame:v16, v18, v20, v22];

  v42.size.width = 24.0;
  v42.origin.x = MinX;
  v42.origin.CGFloat y = y;
  v42.size.height = Height;
  CGFloat v24 = v37 + CGRectGetWidth(v42) + 8.0;
  v43.size.width = 24.0;
  v43.origin.x = MinX;
  v43.origin.CGFloat y = y;
  v43.size.height = Height;
  CGFloat v25 = v38 - (CGRectGetWidth(v43) + 8.0);
  v44.origin.x = v24;
  v44.origin.CGFloat y = v7;
  v44.size.width = v25;
  v44.size.height = v11;
  CGRectGetMinX(v44);
  v26 = [(MCDLibraryMenuTableViewCell *)self textLabel];
  [v26 sizeThatFits:v25, v11];

  UIRectCenteredYInRect();
  CPUIRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [(MCDLibraryMenuTableViewCell *)self textLabel];
  [v35 setFrame:v28, v30, v32, v34];
}

- (void).cxx_destruct
{
}

@end