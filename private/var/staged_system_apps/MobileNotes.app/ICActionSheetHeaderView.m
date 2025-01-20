@interface ICActionSheetHeaderView
- (ICActionSheetHeaderView)initWithTitle:(id)a3 snippet:(id)a4 iconImage:(id)a5;
- (NSMutableArray)activatedConstraints;
- (NSString)snippet;
- (NSString)title;
- (UIImage)iconImage;
- (UIImageView)iconImageView;
- (UILabel)snippetView;
- (UILabel)titleView;
- (void)initializeSubviews;
- (void)setActivatedConstraints:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setSnippet:(id)a3;
- (void)setSnippetView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleView:(id)a3;
- (void)setupConstraints;
@end

@implementation ICActionSheetHeaderView

- (ICActionSheetHeaderView)initWithTitle:(id)a3 snippet:(id)a4 iconImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICActionSheetHeaderView;
  v11 = [(ICActionSheetHeaderView *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(ICActionSheetHeaderView *)v11 setIconImage:v10];
    [(ICActionSheetHeaderView *)v12 setTitle:v8];
    [(ICActionSheetHeaderView *)v12 setSnippet:v9];
    [(ICActionSheetHeaderView *)v12 initializeSubviews];
    [(ICActionSheetHeaderView *)v12 setupConstraints];
  }

  return v12;
}

- (void)initializeSubviews
{
  v3 = [(ICActionSheetHeaderView *)self iconImageView];
  [v3 removeFromSuperview];

  v4 = [(ICActionSheetHeaderView *)self titleView];
  [v4 removeFromSuperview];

  v5 = [(ICActionSheetHeaderView *)self snippetView];
  [v5 removeFromSuperview];

  id v6 = objc_alloc((Class)UIImageView);
  v7 = [(ICActionSheetHeaderView *)self iconImage];
  id v8 = [v6 initWithImage:v7];
  [(ICActionSheetHeaderView *)self setIconImageView:v8];

  id v9 = [(ICActionSheetHeaderView *)self iconImageView];
  [v9 setAccessibilityIgnoresInvertColors:1];

  id v10 = objc_alloc_init((Class)UILabel);
  [(ICActionSheetHeaderView *)self setTitleView:v10];

  id v11 = objc_alloc((Class)NSAttributedString);
  v12 = [(ICActionSheetHeaderView *)self title];
  NSAttributedStringKey v35 = NSFontAttributeName;
  v13 = +[UIFont boldSystemFontOfSize:21.0];
  objc_super v14 = objc_msgSend(v13, "ic_fontWithSingleLineA");
  v36 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  id v16 = [v11 initWithString:v12 attributes:v15];
  v17 = [(ICActionSheetHeaderView *)self titleView];
  [v17 setAttributedText:v16];

  id v18 = objc_alloc_init((Class)UILabel);
  [(ICActionSheetHeaderView *)self setSnippetView:v18];

  id v19 = objc_alloc((Class)NSAttributedString);
  v20 = [(ICActionSheetHeaderView *)self snippet];
  v33[0] = NSFontAttributeName;
  v21 = +[UIFont systemFontOfSize:16.0];
  v22 = [v21 ic_fontWithSingleLineA];
  v34[0] = v22;
  v33[1] = NSForegroundColorAttributeName;
  v23 = +[UIColor colorWithRed:0.652 green:0.667 blue:0.663 alpha:1.0];
  v34[1] = v23;
  v24 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
  id v25 = [v19 initWithString:v20 attributes:v24];
  v26 = [(ICActionSheetHeaderView *)self snippetView];
  [v26 setAttributedText:v25];

  [(ICActionSheetHeaderView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [(ICActionSheetHeaderView *)self iconImageView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(ICActionSheetHeaderView *)self titleView];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(ICActionSheetHeaderView *)self snippetView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(ICActionSheetHeaderView *)self iconImageView];
  [(ICActionSheetHeaderView *)self addSubview:v30];

  v31 = [(ICActionSheetHeaderView *)self titleView];
  [(ICActionSheetHeaderView *)self addSubview:v31];

  v32 = [(ICActionSheetHeaderView *)self snippetView];
  [(ICActionSheetHeaderView *)self addSubview:v32];
}

- (void)setupConstraints
{
  v3 = [(ICActionSheetHeaderView *)self activatedConstraints];

  if (v3)
  {
    v4 = [(ICActionSheetHeaderView *)self activatedConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(ICActionSheetHeaderView *)self setActivatedConstraints:0];
  }
  id v26 = objc_alloc_init((Class)NSMutableArray);
  v5 = +[NSLayoutConstraint constraintWithItem:self attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:94.0];
  [v26 addObject:v5];

  id v6 = [(ICActionSheetHeaderView *)self iconImageView];
  v7 = +[NSLayoutConstraint constraintWithItem:v6 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [v26 addObject:v7];

  id v8 = [(ICActionSheetHeaderView *)self iconImageView];
  id v9 = +[NSLayoutConstraint constraintWithItem:v8 attribute:5 relatedBy:0 toItem:self attribute:5 multiplier:1.0 constant:20.0];
  [v26 addObject:v9];

  id v10 = [(ICActionSheetHeaderView *)self titleView];
  id v11 = [(ICActionSheetHeaderView *)self iconImageView];
  v12 = +[NSLayoutConstraint constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:5.0];
  [v26 addObject:v12];

  v13 = [(ICActionSheetHeaderView *)self snippetView];
  objc_super v14 = [(ICActionSheetHeaderView *)self iconImageView];
  v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:-4.0];
  [v26 addObject:v15];

  id v16 = [(ICActionSheetHeaderView *)self titleView];
  v17 = [(ICActionSheetHeaderView *)self iconImageView];
  id v18 = +[NSLayoutConstraint constraintWithItem:v16 attribute:5 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:10.0];
  [v26 addObject:v18];

  id v19 = [(ICActionSheetHeaderView *)self snippetView];
  v20 = [(ICActionSheetHeaderView *)self iconImageView];
  v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:5 relatedBy:0 toItem:v20 attribute:6 multiplier:1.0 constant:10.0];
  [v26 addObject:v21];

  v22 = [(ICActionSheetHeaderView *)self titleView];
  v23 = +[NSLayoutConstraint constraintWithItem:v22 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:-20.0];
  [v26 addObject:v23];

  v24 = [(ICActionSheetHeaderView *)self snippetView];
  id v25 = +[NSLayoutConstraint constraintWithItem:v24 attribute:6 relatedBy:-1 toItem:self attribute:6 multiplier:1.0 constant:-20.0];
  [v26 addObject:v25];

  +[NSLayoutConstraint activateConstraints:v26];
  [(ICActionSheetHeaderView *)self setActivatedConstraints:v26];
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)snippet
{
  return self->_snippet;
}

- (void)setSnippet:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (UILabel)snippetView
{
  return self->_snippetView;
}

- (void)setSnippetView:(id)a3
{
}

- (NSMutableArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_snippetView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_snippet, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end