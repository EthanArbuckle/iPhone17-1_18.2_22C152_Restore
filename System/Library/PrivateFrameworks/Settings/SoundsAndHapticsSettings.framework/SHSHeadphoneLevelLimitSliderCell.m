@interface SHSHeadphoneLevelLimitSliderCell
- (void)layoutSubviews;
@end

@implementation SHSHeadphoneLevelLimitSliderCell

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)SHSHeadphoneLevelLimitSliderCell;
  [(PSTableCell *)&v18 layoutSubviews];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDF0]);
  v4 = [(PSControlTableCell *)self control];
  [v4 frame];
  objc_msgSend(v3, "setFrame:");

  v5 = [(SHSHeadphoneLevelLimitSliderCell *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  v10 = [(PSControlTableCell *)self control];
  objc_msgSend(v10, "sizeThatFits:", v7, v9);
  double v12 = v11;
  PreferencesTableViewCellLeftPad();
  double v14 = v13;
  PreferencesTableViewCellLeftPad();
  float v16 = v15;
  PreferencesTableViewCellRightPad();
  objc_msgSend(v10, "setFrame:", v14, round(v9 * 0.5 - v12 * 0.5), v7 - (float)(v16 + v17), v12);
}

@end