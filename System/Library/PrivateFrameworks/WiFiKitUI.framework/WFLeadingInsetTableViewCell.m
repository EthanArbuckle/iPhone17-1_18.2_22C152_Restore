@interface WFLeadingInsetTableViewCell
- (double)_airportSettingsCellConnectionStateExtraLeadingInset;
- (void)awakeFromNib;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation WFLeadingInsetTableViewCell

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)WFLeadingInsetTableViewCell;
  [(WFLeadingInsetTableViewCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)WFLeadingInsetTableViewCell;
  [(WFLeadingInsetTableViewCell *)&v4 setSelected:a3 animated:a4];
}

- (void)layoutSubviews
{
  v3 = [(WFLeadingInsetTableViewCell *)self contentView];
  [v3 directionalLayoutMargins];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  [(WFLeadingInsetTableViewCell *)self directionalLayoutMargins];
  double v11 = v10;
  [(WFLeadingInsetTableViewCell *)self _airportSettingsCellConnectionStateExtraLeadingInset];
  double v13 = v11 + v12;
  v14 = [(WFLeadingInsetTableViewCell *)self contentView];
  objc_msgSend(v14, "setDirectionalLayoutMargins:", v5, v13, v7, v9);

  v15.receiver = self;
  v15.super_class = (Class)WFLeadingInsetTableViewCell;
  [(WFLeadingInsetTableViewCell *)&v15 layoutSubviews];
}

- (double)_airportSettingsCellConnectionStateExtraLeadingInset
{
  objc_super v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  double v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = v4;
  }
  BOOL v9 = v8 >= 414.0 && v8 <= 430.0;
  double result = 20.0;
  if (!v9) {
    return 24.0;
  }
  return result;
}

@end