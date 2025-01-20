@interface MacTrafficIncidentsOverviewCell
- (MacTrafficIncidentsOverviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MacTrafficIncidentsOverviewCellModel)cellModel;
- (UILabel)overviewLabel;
- (void)_createConstraints;
- (void)_createSubviews;
- (void)_updateLabels;
- (void)configureWithCellModel:(id)a3;
- (void)setCellModel:(id)a3;
- (void)setOverviewLabel:(id)a3;
@end

@implementation MacTrafficIncidentsOverviewCell

- (MacTrafficIncidentsOverviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacTrafficIncidentsOverviewCell;
  v4 = [(MacTrafficIncidentsOverviewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MacTrafficIncidentsOverviewCell *)v4 _createSubviews];
    [(MacTrafficIncidentsOverviewCell *)v5 _createConstraints];
  }
  return v5;
}

- (void)_createSubviews
{
  v3 = +[UIColor clearColor];
  [(MacTrafficIncidentsOverviewCell *)self setBackgroundColor:v3];

  id v4 = objc_alloc_init((Class)UILabel);
  [(MacTrafficIncidentsOverviewCell *)self setOverviewLabel:v4];

  v5 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  [v6 setNumberOfLines:0];

  objc_super v7 = +[UIFont system13Tall];
  v8 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  [v8 setFont:v7];

  id v10 = [(MacTrafficIncidentsOverviewCell *)self contentView];
  v9 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  [v10 addSubview:v9];
}

- (void)_createConstraints
{
  v23 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  v21 = [v23 leadingAnchor];
  v22 = [(MacTrafficIncidentsOverviewCell *)self contentView];
  v20 = [v22 leadingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20 constant:17.0];
  v24[0] = v19;
  v18 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  v16 = [v18 trailingAnchor];
  v17 = [(MacTrafficIncidentsOverviewCell *)self contentView];
  v15 = [v17 trailingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15 constant:-17.0];
  v24[1] = v14;
  v13 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  v3 = [v13 topAnchor];
  id v4 = [(MacTrafficIncidentsOverviewCell *)self contentView];
  v5 = [v4 topAnchor];
  v6 = [v3 constraintEqualToAnchor:v5 constant:14.0];
  v24[2] = v6;
  objc_super v7 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  v8 = [v7 bottomAnchor];
  v9 = [(MacTrafficIncidentsOverviewCell *)self contentView];
  id v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v24[3] = v11;
  v12 = +[NSArray arrayWithObjects:v24 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)configureWithCellModel:(id)a3
{
  v5 = (MacTrafficIncidentsOverviewCellModel *)a3;
  if (self->_cellModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cellModel, a3);
    [(MacTrafficIncidentsOverviewCell *)self _updateLabels];
    v5 = v6;
  }
}

- (void)_updateLabels
{
  id v5 = [(MacTrafficIncidentsOverviewCell *)self cellModel];
  v3 = [v5 overviewText];
  id v4 = [(MacTrafficIncidentsOverviewCell *)self overviewLabel];
  [v4 setText:v3];
}

- (UILabel)overviewLabel
{
  return self->_overviewLabel;
}

- (void)setOverviewLabel:(id)a3
{
}

- (MacTrafficIncidentsOverviewCellModel)cellModel
{
  return self->_cellModel;
}

- (void)setCellModel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);

  objc_storeStrong((id *)&self->_overviewLabel, 0);
}

@end