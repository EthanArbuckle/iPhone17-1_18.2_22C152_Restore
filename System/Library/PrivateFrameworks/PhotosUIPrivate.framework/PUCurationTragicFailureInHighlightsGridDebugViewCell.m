@interface PUCurationTragicFailureInHighlightsGridDebugViewCell
- (PUCurationTragicFailureInHighlightsGridDebugViewCell)initWithFrame:(CGRect)a3;
- (unint64_t)utilityTypes;
- (void)layoutSubviews;
- (void)setUtilityTypes:(unint64_t)a3;
@end

@implementation PUCurationTragicFailureInHighlightsGridDebugViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilityTypesLabel, 0);
  objc_storeStrong((id *)&self->_visibleLabel, 0);
}

- (unint64_t)utilityTypes
{
  return self->_utilityTypes;
}

- (void)setUtilityTypes:(unint64_t)a3
{
  self->_unint64_t utilityTypes = a3;
  if (a3) {
    v4 = @"❌";
  }
  else {
    v4 = @"✅";
  }
  [(UILabel *)self->_visibleLabel setText:v4];
  unint64_t utilityTypes = self->_utilityTypes;
  v6 = @"🛑";
  if ((utilityTypes & 2) == 0) {
    v6 = &stru_1F06BE7B8;
  }
  v7 = @"🥱";
  if ((utilityTypes & 4) == 0) {
    v7 = &stru_1F06BE7B8;
  }
  if ((utilityTypes & 8) != 0) {
    v8 = @"🤢";
  }
  else {
    v8 = &stru_1F06BE7B8;
  }
  id v9 = [NSString stringWithFormat:@"%@%@%@", v6, v7, v8];
  [(UILabel *)self->_utilityTypesLabel setText:v9];
  [(UILabel *)self->_utilityTypesLabel sizeToFit];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewCell;
  [(PUPhotosGridCell *)&v8 layoutSubviews];
  [(UILabel *)self->_visibleLabel frame];
  -[UILabel setFrame:](self->_visibleLabel, "setFrame:", 5.0, 5.0);
  [(PUCurationTragicFailureInHighlightsGridDebugViewCell *)self bringSubviewToFront:self->_visibleLabel];
  [(UILabel *)self->_utilityTypesLabel frame];
  double v4 = v3;
  double v6 = v5;
  [(PUCurationTragicFailureInHighlightsGridDebugViewCell *)self bounds];
  -[UILabel setFrame:](self->_utilityTypesLabel, "setFrame:", 5.0, v7 + -26.0, v4, v6);
  [(PUCurationTragicFailureInHighlightsGridDebugViewCell *)self bringSubviewToFront:self->_utilityTypesLabel];
}

- (PUCurationTragicFailureInHighlightsGridDebugViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugViewCell;
  double v3 = -[PUPhotosGridCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    visibleLabel = v3->_visibleLabel;
    v3->_visibleLabel = v4;

    [(UILabel *)v3->_visibleLabel setText:@"✅"];
    [(UILabel *)v3->_visibleLabel sizeToFit];
    [(PUCurationTragicFailureInHighlightsGridDebugViewCell *)v3 addSubview:v3->_visibleLabel];
    double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    utilityTypesLabel = v3->_utilityTypesLabel;
    v3->_utilityTypesLabel = v6;

    [(UILabel *)v3->_utilityTypesLabel setText:@"🛑"];
    [(UILabel *)v3->_utilityTypesLabel sizeToFit];
    [(PUCurationTragicFailureInHighlightsGridDebugViewCell *)v3 addSubview:v3->_utilityTypesLabel];
  }
  return v3;
}

@end