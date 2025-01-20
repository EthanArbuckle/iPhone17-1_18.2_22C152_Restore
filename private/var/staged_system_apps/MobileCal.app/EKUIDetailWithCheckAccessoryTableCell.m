@interface EKUIDetailWithCheckAccessoryTableCell
- (EKUIDetailWithCheckAccessoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (void)setDetailLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation EKUIDetailWithCheckAccessoryTableCell

- (EKUIDetailWithCheckAccessoryTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v47.receiver = self;
  v47.super_class = (Class)EKUIDetailWithCheckAccessoryTableCell;
  v4 = [(EKUIDetailWithCheckAccessoryTableCell *)&v47 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = [objc_alloc((Class)UITableViewCell) initWithStyle:1 reuseIdentifier:&stru_1001D6918];
    [v5 setAccessoryType:3];
    uint64_t v6 = objc_opt_new();
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = (UILabel *)v6;

    [(UILabel *)v4->_detailLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [v5 detailTextLabel];
    v9 = [v8 font];
    [(UILabel *)v4->_detailLabel setFont:v9];

    v46 = v5;
    v10 = [v5 detailTextLabel];
    v11 = [v10 textColor];
    [(UILabel *)v4->_detailLabel setTextColor:v11];

    LODWORD(v12) = 1144750080;
    [(UILabel *)v4->_detailLabel setContentHuggingPriority:0 forAxis:v12];
    [(EKUIDetailWithCheckAccessoryTableCell *)v4 addSubview:v4->_detailLabel];
    uint64_t v13 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v13;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [v5 textLabel];
    v16 = [v15 font];
    [(UILabel *)v4->_titleLabel setFont:v16];

    v17 = [v5 textLabel];
    v18 = [v17 textColor];
    [(UILabel *)v4->_titleLabel setTextColor:v18];

    v19 = [(EKUIDetailWithCheckAccessoryTableCell *)v4 contentView];
    [v19 addSubview:v4->_titleLabel];

    v45 = [(EKUIDetailWithCheckAccessoryTableCell *)v4 trailingAnchor];
    v44 = [(UILabel *)v4->_detailLabel trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:46.0];
    v48[0] = v43;
    v42 = [(UILabel *)v4->_detailLabel firstBaselineAnchor];
    v41 = [(UILabel *)v4->_titleLabel firstBaselineAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v48[1] = v40;
    v38 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v39 = [(EKUIDetailWithCheckAccessoryTableCell *)v4 contentView];
    v37 = [v39 layoutMarginsGuide];
    v36 = [v37 leadingAnchor];
    v35 = [v38 constraintEqualToAnchor:v36];
    v48[2] = v35;
    v34 = [(UILabel *)v4->_detailLabel leadingAnchor];
    v33 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v32 = [v34 constraintEqualToSystemSpacingAfterAnchor:v33 multiplier:1.0];
    v48[3] = v32;
    v30 = [(UILabel *)v4->_titleLabel topAnchor];
    v31 = [(EKUIDetailWithCheckAccessoryTableCell *)v4 contentView];
    v20 = [v31 layoutMarginsGuide];
    v21 = [v20 topAnchor];
    v22 = [v30 constraintEqualToAnchor:v21];
    v48[4] = v22;
    v23 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v24 = [(EKUIDetailWithCheckAccessoryTableCell *)v4 contentView];
    v25 = [v24 layoutMarginsGuide];
    v26 = [v25 bottomAnchor];
    v27 = [v23 constraintEqualToAnchor:v26];
    v48[5] = v27;
    v28 = +[NSArray arrayWithObjects:v48 count:6];
    +[NSLayoutConstraint activateConstraints:v28];
  }
  return v4;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end