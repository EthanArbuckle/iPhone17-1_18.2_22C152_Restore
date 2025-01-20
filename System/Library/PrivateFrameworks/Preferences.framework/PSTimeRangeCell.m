@interface PSTimeRangeCell
- (PSTimeRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4;
- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4;
- (void)layoutSubviews;
- (void)updateConstraints;
@end

@implementation PSTimeRangeCell

- (PSTimeRangeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PSTimeRangeCell;
  v9 = [(PSTimeRangeCell *)&v27 initWithStyle:a3 reuseIdentifier:a4];
  if (v9)
  {
    v10 = [v8 target];
    int v11 = [v10 conformsToProtocol:&unk_1EFBD3B10];

    if (v11)
    {
      v12 = [v8 target];
      objc_storeWeak((id *)&v9->_delegate, v12);
    }
    v13 = [(PSTableCell *)v9 titleLabel];
    v14 = [v13 font];

    uint64_t v15 = CreateRangeTitleLabel();
    fromTitle = v9->_fromTitle;
    v9->_fromTitle = (UILabel *)v15;

    v17 = PS_LocalizedString(@"FROM");
    [(UILabel *)v9->_fromTitle setText:v17];

    [(UILabel *)v9->_fromTitle setFont:v14];
    uint64_t v18 = CreateRangeTitleLabel();
    toTitle = v9->_toTitle;
    v9->_toTitle = (UILabel *)v18;

    v20 = PS_LocalizedString(@"TO");
    [(UILabel *)v9->_toTitle setText:v20];

    [(UILabel *)v9->_toTitle setFont:v14];
    uint64_t v21 = CreateRangeTimeLabel();
    fromTime = v9->_fromTime;
    v9->_fromTime = (UILabel *)v21;

    [(UILabel *)v9->_fromTime setFont:v14];
    uint64_t v23 = CreateRangeTimeLabel();
    toTime = v9->_toTime;
    v9->_toTime = (UILabel *)v23;

    [(UILabel *)v9->_toTime setFont:v14];
    v25 = [(PSTimeRangeCell *)v9 contentView];
    [v25 addSubview:v9->_fromTitle];
    [v25 addSubview:v9->_toTitle];
    [v25 addSubview:v9->_fromTime];
    [v25 addSubview:v9->_toTime];
    [(PSTimeRangeCell *)v9 layoutSubviews];
  }
  return v9;
}

- (void)layoutSubviews
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [WeakRetained fromDetailForCell:self];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = [v6 toDetailForCell:self];

  [(UILabel *)self->_fromTime setText:v5];
  [(UILabel *)self->_toTime setText:v7];
  v8.receiver = self;
  v8.super_class = (Class)PSTimeRangeCell;
  [(PSTableCell *)&v8 layoutSubviews];
  [(PSTimeRangeCell *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
  char v3 = [(PSTimeRangeCell *)self _shouldReverseLayoutDirection];
  v4 = [(PSTimeRangeCell *)self textLabel];
  [v4 frame];
  double v6 = v5;

  v7 = (void *)MEMORY[0x1E4F28ED0];
  if (v3)
  {
    objc_super v8 = [(PSTimeRangeCell *)self contentView];
    [v8 bounds];
    v10 = [v7 numberWithDouble:v9 - v6];
  }
  else
  {
    v10 = [MEMORY[0x1E4F28ED0] numberWithDouble:v6];
  }
  int v11 = _NSDictionaryOfVariableBindings(&cfstr_FromtitleTotit.isa, self->_fromTitle, self->_toTitle, self->_fromTime, self->_toTime, 0);
  v12 = _NSDictionaryOfVariableBindings(&cfstr_Margin.isa, v10, 0);
  v13 = [(PSTimeRangeCell *)self traitCollection];
  v14 = [v13 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);

  if (IsAccessibilityCategory) {
    [(PSTimeRangeCell *)self accessibilityConstraintsWithVariableBindings:v11 metrics:v12];
  }
  else {
  v16 = [(PSTimeRangeCell *)self regularConstraintsWithVariableBindings:v11 metrics:v12];
  }
  constraints = self->_constraints;
  self->_constraints = v16;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];
  v18.receiver = self;
  v18.super_class = (Class)PSTimeRangeCell;
  [(PSTimeRangeCell *)&v18 updateConstraints];
}

- (id)regularConstraintsWithVariableBindings:(id)a3 metrics:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v5 constraintsWithVisualFormat:@"H:|-margin-[_fromTitle]-(>=2.0)-[_fromTime]-|" options:0 metrics:v6 views:v7];
  double v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-margin-[_toTitle]-(>=2.0)-[_toTime]-|" options:0 metrics:v6 views:v7];
  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[_fromTitle]-(>=2.0)-[_toTitle]-|" options:0 metrics:v6 views:v7];
  int v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[_fromTime]-(>=2.0)-[_toTime]-|" options:0 metrics:v6 views:v7];

  v12 = [v8 arrayByAddingObjectsFromArray:v9];
  v13 = [v12 arrayByAddingObjectsFromArray:v10];
  v14 = [v13 arrayByAddingObjectsFromArray:v11];

  return v14;
}

- (id)accessibilityConstraintsWithVariableBindings:(id)a3 metrics:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F28DC8];
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v5 constraintsWithVisualFormat:@"H:|-margin-[_fromTitle]-|" options:0 metrics:v6 views:v7];
  double v9 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-margin-[_fromTime]-|" options:0 metrics:v6 views:v7];
  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-margin-[_toTitle]-|" options:0 metrics:v6 views:v7];
  int v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-margin-[_toTime]-|" options:0 metrics:v6 views:v7];
  v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|-[_fromTitle]-[_fromTime]-[_toTitle]-[_toTime]-|" options:0 metrics:v6 views:v7];

  v13 = [v8 arrayByAddingObjectsFromArray:v9];
  v14 = [v13 arrayByAddingObjectsFromArray:v10];
  uint64_t v15 = [v14 arrayByAddingObjectsFromArray:v11];
  v16 = [v15 arrayByAddingObjectsFromArray:v12];

  return v16;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_toTime, 0);
  objc_storeStrong((id *)&self->_fromTime, 0);
  objc_storeStrong((id *)&self->_toTitle, 0);
  objc_storeStrong((id *)&self->_fromTitle, 0);
}

@end