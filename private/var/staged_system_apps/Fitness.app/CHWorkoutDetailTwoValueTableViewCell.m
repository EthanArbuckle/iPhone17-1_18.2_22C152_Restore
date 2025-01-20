@interface CHWorkoutDetailTwoValueTableViewCell
+ (double)preferredHeightForWorkout:(id)a3;
- (BOOL)hidesSeparator;
- (CHWorkoutDetailTwoValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_constrainViews;
- (void)configureWithTitle1:(id)a3 value1:(id)a4;
- (void)configureWithTitle2:(id)a3 value2:(id)a4;
- (void)prepareForReuse;
- (void)removeLeadingPadding;
- (void)setHidesSeparator:(BOOL)a3;
@end

@implementation CHWorkoutDetailTwoValueTableViewCell

+ (double)preferredHeightForWorkout:(id)a3
{
  return 74.0;
}

- (CHWorkoutDetailTwoValueTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)CHWorkoutDetailTwoValueTableViewCell;
  v4 = [(CHWorkoutDetailTwoValueTableViewCell *)&v31 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor systemBackgroundColor];
    [(CHWorkoutDetailTwoValueTableViewCell *)v4 setBackgroundColor:v5];

    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel1 = v4->_titleLabel1;
    v4->_titleLabel1 = v6;

    v8 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_titleLabel1 setFont:v8];

    v9 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel1 setTextColor:v9];

    [(UILabel *)v4->_titleLabel1 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = [(CHWorkoutDetailTwoValueTableViewCell *)v4 contentView];
    [v10 addSubview:v4->_titleLabel1];

    v11 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel2 = v4->_titleLabel2;
    v4->_titleLabel2 = v11;

    v13 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
    [(UILabel *)v4->_titleLabel2 setFont:v13];

    v14 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel2 setTextColor:v14];

    [(UILabel *)v4->_titleLabel2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(CHWorkoutDetailTwoValueTableViewCell *)v4 contentView];
    [v15 addSubview:v4->_titleLabel2];

    v16 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel1 = v4->_valueLabel1;
    v4->_valueLabel1 = v16;

    v18 = +[UIFont fu_sausageFontOfSize:30.0];
    [(UILabel *)v4->_valueLabel1 setFont:v18];

    v19 = +[UIColor labelColor];
    [(UILabel *)v4->_valueLabel1 setTextColor:v19];

    [(UILabel *)v4->_valueLabel1 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_valueLabel1 setNumberOfLines:0];
    v20 = [(CHWorkoutDetailTwoValueTableViewCell *)v4 contentView];
    [v20 addSubview:v4->_valueLabel1];

    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    valueLabel2 = v4->_valueLabel2;
    v4->_valueLabel2 = v21;

    v23 = +[UIFont fu_sausageFontOfSize:30.0];
    [(UILabel *)v4->_valueLabel2 setFont:v23];

    v24 = +[UIColor labelColor];
    [(UILabel *)v4->_valueLabel2 setTextColor:v24];

    [(UILabel *)v4->_valueLabel2 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_valueLabel2 setNumberOfLines:0];
    v25 = [(CHWorkoutDetailTwoValueTableViewCell *)v4 contentView];
    [v25 addSubview:v4->_valueLabel2];

    v26 = (UIView *)objc_alloc_init((Class)UIView);
    separatorView = v4->_separatorView;
    v4->_separatorView = v26;

    [(UIView *)v4->_separatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    v28 = +[UIColor separatorColor];
    [(UIView *)v4->_separatorView setBackgroundColor:v28];

    v29 = [(CHWorkoutDetailTwoValueTableViewCell *)v4 contentView];
    [v29 addSubview:v4->_separatorView];

    [(CHWorkoutDetailTwoValueTableViewCell *)v4 _constrainViews];
  }
  return v4;
}

- (void)configureWithTitle1:(id)a3 value1:(id)a4
{
  titleLabel1 = self->_titleLabel1;
  id v7 = a4;
  [(UILabel *)titleLabel1 setText:a3];
  [(UILabel *)self->_valueLabel1 setAttributedText:v7];
}

- (void)configureWithTitle2:(id)a3 value2:(id)a4
{
  titleLabel2 = self->_titleLabel2;
  id v7 = a4;
  [(UILabel *)titleLabel2 setText:a3];
  [(UILabel *)self->_valueLabel2 setAttributedText:v7];
}

- (void)setHidesSeparator:(BOOL)a3
{
  self->_hidesSeparator = a3;
  -[UIView setHidden:](self->_separatorView, "setHidden:");
}

- (void)removeLeadingPadding
{
  [(NSLayoutConstraint *)self->_title1Leading setActive:0];
  [(NSLayoutConstraint *)self->_separatorLeading setActive:0];
  [(NSLayoutConstraint *)self->_separatorTrailing setActive:0];
  [(NSLayoutConstraint *)self->_title1NoLeading setActive:1];
  [(NSLayoutConstraint *)self->_separatorNoLeading setActive:1];
  separatorNoTrailing = self->_separatorNoTrailing;

  [(NSLayoutConstraint *)separatorNoTrailing setActive:1];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CHWorkoutDetailTwoValueTableViewCell;
  [(CHWorkoutDetailTwoValueTableViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_titleLabel1 setText:0];
  [(UILabel *)self->_valueLabel1 setAttributedText:0];
  [(UILabel *)self->_titleLabel2 setText:0];
  [(UILabel *)self->_valueLabel2 setAttributedText:0];
}

- (void)_constrainViews
{
  if (!self->_didAddConstraints)
  {
    titleLabel1 = self->_titleLabel1;
    v4 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v57 = +[NSLayoutConstraint constraintWithItem:titleLabel1 attribute:11 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:28.0];

    v5 = self->_titleLabel1;
    v6 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    id v7 = +[NSLayoutConstraint constraintWithItem:v5 attribute:5 relatedBy:0 toItem:v6 attribute:5 multiplier:1.0 constant:sub_1000FC040()];
    title1Leading = self->_title1Leading;
    self->_title1Leading = v7;

    v9 = self->_titleLabel1;
    v10 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:5 relatedBy:0 toItem:v10 attribute:5 multiplier:1.0 constant:0.0];
    title1NoLeading = self->_title1NoLeading;
    self->_title1NoLeading = v11;

    v13 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v14 = self->_title1Leading;
    v62[0] = v57;
    v62[1] = v14;
    v15 = +[NSArray arrayWithObjects:v62 count:2];
    [v13 addConstraints:v15];

    v16 = +[UIScreen mainScreen];
    [v16 bounds];
    double v18 = v17 * 0.5;

    v56 = +[NSLayoutConstraint constraintWithItem:self->_titleLabel2 attribute:11 relatedBy:0 toItem:self->_titleLabel1 attribute:11 multiplier:1.0 constant:0.0];
    titleLabel2 = self->_titleLabel2;
    v20 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v55 = +[NSLayoutConstraint constraintWithItem:titleLabel2 attribute:5 relatedBy:0 toItem:v20 attribute:5 multiplier:1.0 constant:v18];

    v21 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v61[0] = v56;
    v61[1] = v55;
    v22 = +[NSArray arrayWithObjects:v61 count:2];
    [v21 addConstraints:v22];

    v54 = +[NSLayoutConstraint constraintWithItem:self->_valueLabel1 attribute:11 relatedBy:0 toItem:self->_titleLabel1 attribute:11 multiplier:1.0 constant:30.0];
    v23 = +[NSLayoutConstraint constraintWithItem:self->_valueLabel1 attribute:5 relatedBy:0 toItem:self->_titleLabel1 attribute:5 multiplier:1.0 constant:0.0];
    v24 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v60[0] = v54;
    v60[1] = v23;
    v25 = +[NSArray arrayWithObjects:v60 count:2];
    [v24 addConstraints:v25];

    v26 = +[NSLayoutConstraint constraintWithItem:self->_valueLabel2 attribute:11 relatedBy:0 toItem:self->_valueLabel1 attribute:11 multiplier:1.0 constant:0.0];
    v27 = +[NSLayoutConstraint constraintWithItem:self->_valueLabel2 attribute:5 relatedBy:0 toItem:self->_titleLabel2 attribute:5 multiplier:1.0 constant:0.0];
    v28 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v59[0] = v26;
    v59[1] = v27;
    v29 = +[NSArray arrayWithObjects:v59 count:2];
    [v28 addConstraints:v29];

    separatorView = self->_separatorView;
    objc_super v31 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v32 = +[NSLayoutConstraint constraintWithItem:separatorView attribute:5 relatedBy:0 toItem:v31 attribute:5 multiplier:1.0 constant:0.0];
    separatorNoLeading = self->_separatorNoLeading;
    self->_separatorNoLeading = v32;

    v34 = self->_separatorView;
    v35 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v36 = +[NSLayoutConstraint constraintWithItem:v34 attribute:6 relatedBy:0 toItem:v35 attribute:6 multiplier:1.0 constant:-sub_1000FC040()];
    separatorTrailing = self->_separatorTrailing;
    self->_separatorTrailing = v36;

    v38 = self->_separatorView;
    v39 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v40 = sub_1000FC3C8(v38, v39, 0, 0.0);

    v41 = [v40 objectAtIndexedSubscript:0];
    separatorLeading = self->_separatorLeading;
    self->_separatorLeading = v41;

    v43 = [v40 objectAtIndexedSubscript:2];
    separatorNoTrailing = self->_separatorNoTrailing;
    self->_separatorNoTrailing = v43;

    v45 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v58[0] = self->_separatorLeading;
    v46 = [v40 objectAtIndexedSubscript:1];
    v47 = self->_separatorTrailing;
    v58[1] = v46;
    v58[2] = v47;
    v48 = [v40 objectAtIndexedSubscript:3];
    v58[3] = v48;
    v49 = +[NSArray arrayWithObjects:v58 count:4];
    [v45 addConstraints:v49];

    v50 = [(CHWorkoutDetailTwoValueTableViewCell *)self contentView];
    v51 = [v50 heightAnchor];
    v52 = [v51 constraintEqualToConstant:74.0];

    LODWORD(v53) = 1148829696;
    [v52 setPriority:v53];
    [v52 setActive:1];
    self->_didAddConstraints = 1;
  }
}

- (BOOL)hidesSeparator
{
  return self->_hidesSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorNoTrailing, 0);
  objc_storeStrong((id *)&self->_separatorTrailing, 0);
  objc_storeStrong((id *)&self->_separatorNoLeading, 0);
  objc_storeStrong((id *)&self->_separatorLeading, 0);
  objc_storeStrong((id *)&self->_title1NoLeading, 0);
  objc_storeStrong((id *)&self->_title1Leading, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_valueLabel2, 0);
  objc_storeStrong((id *)&self->_valueLabel1, 0);
  objc_storeStrong((id *)&self->_titleLabel2, 0);

  objc_storeStrong((id *)&self->_titleLabel1, 0);
}

@end