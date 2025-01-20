@interface MacTrafficIncidentsDetailsCell
- (MacTrafficIncidentsDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MacTrafficIncidentsDetailsCellModel)cellModel;
- (UILabel)dateLabel;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)_updateLabels;
- (void)configureWithCellModel:(id)a3;
- (void)setCellModel:(id)a3;
- (void)setDateLabel:(id)a3;
@end

@implementation MacTrafficIncidentsDetailsCell

- (MacTrafficIncidentsDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacTrafficIncidentsDetailsCell;
  v4 = [(MacTrafficIncidentsDetailsCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MacTrafficIncidentsDetailsCell *)v4 _createSubviews];
    [(MacTrafficIncidentsDetailsCell *)v5 _createConstraints];
  }
  return v5;
}

- (void)_createSubviews
{
  v3 = +[UIColor clearColor];
  [(MacTrafficIncidentsDetailsCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc_init((Class)UILabel);
  [(MacTrafficIncidentsDetailsCell *)self setDateLabel:v4];

  v5 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v6 setNumberOfLines:0];

  objc_super v7 = +[UIFont system13Tall];
  v8 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v8 setFont:v7];

  v9 = +[UIColor secondaryLabelColor];
  v10 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v10 setTextColor:v9];

  id v12 = [(MacTrafficIncidentsDetailsCell *)self contentView];
  v11 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v12 addSubview:v11];
}

- (void)_createConstraints
{
  v23 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  v21 = [v23 leadingAnchor];
  v22 = [(MacTrafficIncidentsDetailsCell *)self contentView];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:17.0];
  v24[0] = v19;
  v18 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  v16 = [v18 trailingAnchor];
  v17 = [(MacTrafficIncidentsDetailsCell *)self contentView];
  v15 = [v17 trailingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15 constant:-17.0];
  v24[1] = v14;
  v13 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  v3 = [v13 topAnchor];
  id v4 = [(MacTrafficIncidentsDetailsCell *)self contentView];
  v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:14.0];
  v24[2] = v6;
  objc_super v7 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  v8 = [v7 bottomAnchor];
  v9 = [(MacTrafficIncidentsDetailsCell *)self contentView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  id v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)configureWithCellModel:(id)a3
{
  v5 = (MacTrafficIncidentsDetailsCellModel *)a3;
  if (self->_cellModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cellModel, a3);
    [(MacTrafficIncidentsDetailsCell *)self _updateLabels];
    v5 = v6;
  }
}

- (void)_updateLabels
{
  id v5 = [(MacTrafficIncidentsDetailsCell *)self cellModel];
  v3 = [v5 dateText];
  id v4 = [(MacTrafficIncidentsDetailsCell *)self dateLabel];
  [v4 setText:v3];
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
}

- (MacTrafficIncidentsDetailsCellModel)cellModel
{
  return self->_cellModel;
}

- (void)setCellModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end