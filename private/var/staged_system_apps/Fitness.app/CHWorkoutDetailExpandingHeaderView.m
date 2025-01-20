@interface CHWorkoutDetailExpandingHeaderView
+ (double)preferredHeight;
- (BOOL)expanded;
- (CHWorkoutDetailExpandingHeaderView)initWithFrame:(CGRect)a3;
- (CHWorkoutDetailExpandingHeaderViewDelegate)delegate;
- (NSString)title;
- (UIButton)expandButton;
- (UILabel)titleLabel;
- (UIView)contentView;
- (UIView)separatorView;
- (int64_t)section;
- (void)_buttonTapped:(id)a3;
- (void)_createContentView;
- (void)_createExpandButton;
- (void)_createSeparator;
- (void)_createTitleLabel;
- (void)_transformButtonForExpandedState:(BOOL)a3;
- (void)configureWithTitle:(id)a3 section:(int64_t)a4 expanded:(BOOL)a5;
- (void)restoreExpandedState:(BOOL)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpandButton:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setSection:(int64_t)a3;
- (void)setSeparatorView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation CHWorkoutDetailExpandingHeaderView

+ (double)preferredHeight
{
  v2 = +[UIFont defaultFontForTextStyle:UIFontTextStyleCallout];
  [v2 _scaledValueForValue:25.0];
  double v4 = v3 + 14.0;

  return v4;
}

- (CHWorkoutDetailExpandingHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHWorkoutDetailExpandingHeaderView;
  double v3 = -[CHWorkoutDetailExpandingHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = +[UIColor blackColor];
    [(CHWorkoutDetailExpandingHeaderView *)v3 setBackgroundColor:v4];

    [(CHWorkoutDetailExpandingHeaderView *)v3 _createContentView];
    [(CHWorkoutDetailExpandingHeaderView *)v3 _createTitleLabel];
    [(CHWorkoutDetailExpandingHeaderView *)v3 _createExpandButton];
    [(CHWorkoutDetailExpandingHeaderView *)v3 _createSeparator];
  }
  return v3;
}

- (void)_createContentView
{
  id v3 = objc_alloc((Class)UIView);
  [(CHWorkoutDetailExpandingHeaderView *)self bounds];
  double v4 = [v3 initWithFrame:];
  contentView = self->_contentView;
  self->_contentView = v4;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = +[UIColor clearColor];
  [(UIView *)self->_contentView setBackgroundColor:v6];

  [(CHWorkoutDetailExpandingHeaderView *)self addSubview:self->_contentView];
  v7 = [(UIView *)self->_contentView leadingAnchor];
  v8 = [(CHWorkoutDetailExpandingHeaderView *)self leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];

  v10 = [(UIView *)self->_contentView trailingAnchor];
  v11 = [(CHWorkoutDetailExpandingHeaderView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];

  v13 = [(UIView *)self->_contentView topAnchor];
  v14 = [(CHWorkoutDetailExpandingHeaderView *)self topAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];

  v16 = [(UIView *)self->_contentView bottomAnchor];
  v17 = [(CHWorkoutDetailExpandingHeaderView *)self bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];

  v20[0] = v9;
  v20[1] = v12;
  v20[2] = v15;
  v20[3] = v18;
  v19 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)_createTitleLabel
{
  id v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)self->_titleLabel setFont:v5];

  objc_super v6 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v6];

  v7 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  [v7 addSubview:self->_titleLabel];

  v8 = [(UILabel *)self->_titleLabel leadingAnchor];
  v9 = [(CHWorkoutDetailExpandingHeaderView *)self leadingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9 constant:sub_1000FC040()];

  v11 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  v12 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  v13 = [v12 topAnchor];
  v14 = [(UILabel *)self->_titleLabel font];
  [v14 _scaledValueForValue:25.0];
  v15 = [v11 constraintEqualToAnchor:v13];

  v17[0] = v10;
  v17[1] = v15;
  v16 = +[NSArray arrayWithObjects:v17 count:2];
  +[NSLayoutConstraint activateConstraints:v16];
}

- (void)_createExpandButton
{
  id v3 = +[UIButton buttonWithType:1];
  expandButton = self->_expandButton;
  self->_expandButton = v3;

  v5 = +[UIImage systemImageNamed:@"chevron.down"];
  objc_super v6 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:17.0];
  v7 = [v5 imageWithSymbolConfiguration:v6];

  [(UIButton *)self->_expandButton setImage:v7 forState:0];
  [(UIButton *)self->_expandButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_expandButton addTarget:self action:"_buttonTapped:" forControlEvents:64];
  [(UIButton *)self->_expandButton sizeToFit];
  v8 = +[UIColor tertiaryLabelColor];
  [(UIButton *)self->_expandButton setTintColor:v8];

  v9 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  [v9 addSubview:self->_expandButton];

  v10 = [(CHWorkoutDetailExpandingHeaderView *)self expandButton];
  v11 = [v10 trailingAnchor];
  v12 = [(CHWorkoutDetailExpandingHeaderView *)self trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:-8.0];

  v14 = [(CHWorkoutDetailExpandingHeaderView *)self expandButton];
  v15 = [v14 centerYAnchor];
  v16 = [(CHWorkoutDetailExpandingHeaderView *)self titleLabel];
  v17 = [v16 firstBaselineAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-3.0];

  v19 = [(CHWorkoutDetailExpandingHeaderView *)self expandButton];
  v20 = [v19 widthAnchor];
  v21 = [v20 constraintEqualToConstant:44.0];

  v22 = [(CHWorkoutDetailExpandingHeaderView *)self expandButton];
  v23 = [v22 heightAnchor];
  v24 = [v23 constraintEqualToConstant:44.0];

  v26[0] = v13;
  v26[1] = v18;
  v26[2] = v21;
  v26[3] = v24;
  v25 = +[NSArray arrayWithObjects:v26 count:4];
  +[NSLayoutConstraint activateConstraints:v25];
}

- (void)_createSeparator
{
  id v3 = (UIView *)objc_alloc_init((Class)UIView);
  separatorView = self->_separatorView;
  self->_separatorView = v3;

  v5 = +[UIColor separatorColor];
  [(UIView *)self->_separatorView setBackgroundColor:v5];

  [(UIView *)self->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_super v6 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  [v6 addSubview:self->_separatorView];

  v7 = [(CHWorkoutDetailExpandingHeaderView *)self separatorView];
  v8 = [v7 heightAnchor];
  v9 = +[UIScreen mainScreen];
  [v9 scale];
  v11 = [v8 constraintEqualToConstant:1.0 / v10];

  v12 = [(CHWorkoutDetailExpandingHeaderView *)self separatorView];
  v13 = [v12 leadingAnchor];
  v14 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  v15 = [v14 leadingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:sub_1000FC040()];

  v17 = [(CHWorkoutDetailExpandingHeaderView *)self separatorView];
  v18 = [v17 trailingAnchor];
  v19 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];

  v22 = [(CHWorkoutDetailExpandingHeaderView *)self separatorView];
  v23 = [v22 topAnchor];
  v24 = [(CHWorkoutDetailExpandingHeaderView *)self contentView];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];

  v28[0] = v11;
  v28[1] = v16;
  v28[2] = v21;
  v28[3] = v26;
  v27 = +[NSArray arrayWithObjects:v28 count:4];
  +[NSLayoutConstraint activateConstraints:v27];
}

- (void)configureWithTitle:(id)a3 section:(int64_t)a4 expanded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(CHWorkoutDetailExpandingHeaderView *)self setExpanded:v5];
  [(CHWorkoutDetailExpandingHeaderView *)self setSection:a4];
  [(CHWorkoutDetailExpandingHeaderView *)self setTitle:v8];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  id v8 = [v4 copy];
  v7 = [(CHWorkoutDetailExpandingHeaderView *)self titleLabel];
  [v7 setText:v8];
}

- (void)_buttonTapped:(id)a3
{
  uint64_t v4 = [(CHWorkoutDetailExpandingHeaderView *)self expanded] ^ 1;

  [(CHWorkoutDetailExpandingHeaderView *)self setExpanded:v4];
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
  -[CHWorkoutDetailExpandingHeaderView _transformButtonForExpandedState:](self, "_transformButtonForExpandedState:");
  id v4 = [(CHWorkoutDetailExpandingHeaderView *)self delegate];
  [v4 expandingHeaderView:self didChangeExpanded:self->_expanded];
}

- (void)_transformButtonForExpandedState:(BOOL)a3
{
  memset(&v7, 0, sizeof(v7));
  if (a3)
  {
    CGAffineTransformMakeScale(&v7, 1.0, -1.0);
  }
  else
  {
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v7.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v7.c = v4;
    *(_OWORD *)&v7.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  CGAffineTransform v6 = v7;
  v5[2] = sub_10017A724;
  v5[3] = &unk_1008AE520;
  v5[4] = self;
  +[UIView animateWithDuration:v5 animations:0.15];
}

- (void)restoreExpandedState:(BOOL)a3
{
  self->_expanded = a3;
  -[CHWorkoutDetailExpandingHeaderView _transformButtonForExpandedState:](self, "_transformButtonForExpandedState:");
}

- (CHWorkoutDetailExpandingHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHWorkoutDetailExpandingHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)expandButton
{
  return self->_expandButton;
}

- (void)setExpandButton:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end