@interface STUIStatusBarBadgeView
- (NSArray)constraintsWithConstant;
- (NSString)text;
- (STUIStatusBarBadgeView)initWithFrame:(CGRect)a3;
- (UILabel)label;
- (id)viewForLastBaselineLayout;
- (void)applyStyleAttributes:(id)a3;
- (void)setConstraintsWithConstant:(id)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation STUIStatusBarBadgeView

- (STUIStatusBarBadgeView)initWithFrame:(CGRect)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)STUIStatusBarBadgeView;
  v3 = -[STUIStatusBarBadgeView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v28 = [(STUIStatusBarBadgeView *)v3 layer];
    [v28 setBorderWidth:1.0];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v4->_label;
    v4->_label = v5;

    [(UILabel *)v4->_label setTextAlignment:1];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STUIStatusBarBadgeView *)v4 addSubview:v4->_label];
    v7 = [(UILabel *)v4->_label leadingAnchor];
    v8 = [(STUIStatusBarBadgeView *)v4 leadingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v31[0] = v9;
    v10 = [(STUIStatusBarBadgeView *)v4 bottomAnchor];
    v11 = [(UILabel *)v4->_label lastBaselineAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v31[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    constraintsWithConstant = v4->_constraintsWithConstant;
    v4->_constraintsWithConstant = (NSArray *)v13;

    v15 = v4->_constraintsWithConstant;
    v27 = [(UILabel *)v4->_label centerXAnchor];
    v26 = [(STUIStatusBarBadgeView *)v4 centerXAnchor];
    v16 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v16;
    v17 = [(STUIStatusBarBadgeView *)v4 widthAnchor];
    v18 = [(STUIStatusBarBadgeView *)v4 heightAnchor];
    v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];
    v30[1] = v19;
    v20 = [(UILabel *)v4->_label centerYAnchor];
    v21 = [(STUIStatusBarBadgeView *)v4 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v30[2] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    v24 = [(NSArray *)v15 arrayByAddingObjectsFromArray:v23];

    [MEMORY[0x1E4F28DC8] activateConstraints:v24];
  }
  return v4;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(UILabel *)self->_label text];
}

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 iconSize] - 5;
  double v6 = 0.0;
  double v7 = 0.0;
  if (v5 <= 8)
  {
    double v6 = dbl_1D7ED6EC0[v5];
    double v7 = dbl_1D7ED6F08[v5];
  }
  v8 = [MEMORY[0x1E4FB08E0] monospacedSystemFontOfSize:v7 weight:*MEMORY[0x1E4FB09C0]];
  [(UILabel *)self->_label setFont:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = self->_constraintsWithConstant;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v13++), "setConstant:", v6, (void)v22);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  int v14 = [v4 isRounded];
  v15 = [(STUIStatusBarBadgeView *)self layer];
  v16 = v15;
  double v17 = 2.5;
  if (v14) {
    double v17 = 4.0;
  }
  objc_msgSend(v15, "setCornerRadius:", v17, (void)v22);

  v18 = [v4 textColor];
  [(UILabel *)self->_label setTextColor:v18];
  id v19 = v18;
  uint64_t v20 = [v19 CGColor];
  v21 = [(STUIStatusBarBadgeView *)self layer];
  [v21 setBorderColor:v20];
}

- (id)viewForLastBaselineLayout
{
  return self->_label;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSArray)constraintsWithConstant
{
  return self->_constraintsWithConstant;
}

- (void)setConstraintsWithConstant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintsWithConstant, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end