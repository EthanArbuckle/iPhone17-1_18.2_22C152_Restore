@interface TextViewTableViewCell
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (TextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextView)textView;
- (void)configureToolbar;
- (void)doneButtonTapped:(id)a3;
- (void)setupConstraints;
@end

@implementation TextViewTableViewCell

- (TextViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TextViewTableViewCell;
  v4 = [(TextViewTableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    textView = v4->_textView;
    v4->_textView = (UITextView *)v5;

    [(UITextView *)v4->_textView setReturnKeyType:9];
    [(UITextView *)v4->_textView setDelegate:v4];
    v7 = [(TextViewTableViewCell *)v4 contentView];
    [v7 addSubview:v4->_textView];

    [(TextViewTableViewCell *)v4 configureToolbar];
    [(TextViewTableViewCell *)v4 setupConstraints];
  }
  return v4;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6 = a3;
  if ([a5 isEqualToString:@"\n"]) {
    [v6 resignFirstResponder];
  }

  return 1;
}

- (void)doneButtonTapped:(id)a3
{
  id v3 = [(TextViewTableViewCell *)self textView];
  [v3 resignFirstResponder];
}

- (void)configureToolbar
{
  id v3 = objc_alloc_init((Class)UIToolbar);
  id v4 = objc_alloc((Class)UIBarButtonItem);
  uint64_t v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"reservations_done_key" value:@"localized string not found" table:0];
  id v7 = [v4 initWithTitle:v6 style:0 target:self action:"doneButtonTapped:"];

  id v10 = v7;
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  [v3 setItems:v8];

  [v3 sizeToFit];
  objc_super v9 = [(TextViewTableViewCell *)self textView];
  [v9 setInputAccessoryView:v3];
}

- (void)setupConstraints
{
  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = [(TextViewTableViewCell *)self textView];
  id v4 = [v3 firstBaselineAnchor];
  uint64_t v5 = [(TextViewTableViewCell *)self contentView];
  id v6 = [v5 topAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:18.0];

  v8 = [(TextViewTableViewCell *)self contentView];
  objc_super v9 = [v8 layoutMarginsGuide];
  id v10 = [v9 leftAnchor];
  v11 = [(TextViewTableViewCell *)self textView];
  v12 = [v11 leftAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];

  v14 = [(TextViewTableViewCell *)self contentView];
  v15 = [v14 layoutMarginsGuide];
  v16 = [v15 rightAnchor];
  v17 = [(TextViewTableViewCell *)self textView];
  v18 = [v17 rightAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];

  v20 = [(TextViewTableViewCell *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [(TextViewTableViewCell *)self textView];
  v23 = [v22 bottomAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];

  v25 = [(TextViewTableViewCell *)self contentView];
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintEqualToConstant:200.0];

  v29[0] = v7;
  v29[1] = v13;
  v29[2] = v24;
  v29[3] = v19;
  v29[4] = v27;
  v28 = +[NSArray arrayWithObjects:v29 count:5];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void).cxx_destruct
{
}

@end