@interface PKExpiredPassesTableViewCell
+ (double)height;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)detailText;
- (NSString)primaryText;
- (NSString)secondaryDetailText;
- (PKExpiredPassesTableViewCell)initWithReuseIdentifier:(id)a3;
- (PKExpiredPassesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKPass)pass;
- (double)_layoutWithBounds:(double)a3;
- (void)_configureDetailTextLabel;
- (void)_configurePrimaryTextLabel;
- (void)_determineAccessibilitySettings;
- (void)buildDetailTextLabelContent;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDetailText:(id)a3;
- (void)setPass:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setSecondaryDetailText:(id)a3;
@end

@implementation PKExpiredPassesTableViewCell

+ (double)height
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double result = 80.0;
  if (!v2) {
    return 64.0;
  }
  return result;
}

- (PKExpiredPassesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return 0;
}

- (PKExpiredPassesTableViewCell)initWithReuseIdentifier:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKExpiredPassesTableViewCell;
  v3 = [(PKExpiredPassesTableViewCell *)&v10 initWithStyle:3 reuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v3->_isRTL = [(PKExpiredPassesTableViewCell *)v3 _shouldReverseLayoutDirection];
    v4->_configuration.small = PKUIGetMinScreenWidthType() == 0;
    -[PKExpiredPassesTableViewCell _determineAccessibilitySettings](v4);
    v5 = [(PKExpiredPassesTableViewCell *)v4 textLabel];
    -[PKExpiredPassesTableViewCell _configurePrimaryTextLabel](v4);
    [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    v6 = [(PKExpiredPassesTableViewCell *)v4 detailTextLabel];
    -[PKExpiredPassesTableViewCell _configureDetailTextLabel](v4);
    [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    v11[0] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = (id)[(PKExpiredPassesTableViewCell *)v4 registerForTraitChanges:v7 withHandler:&__block_literal_global_185];

    -[PKExpiredPassesTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(PKExpiredPassesTableViewCell *)v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85768]];
  }
  return v4;
}

- (void)_determineAccessibilitySettings
{
  if (!a1) {
    return;
  }
  uint64_t v2 = [a1 traitCollection];
  category = [v2 preferredContentSizeCategory];

  if (!UIContentSizeCategoryIsAccessibilityCategory(category))
  {
    a1[1018] = UIContentSizeCategoryCompareToCategory(category, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedSame;
    if (a1[1018]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = PKUIGetMinScreenWidthType() == 0;
    }
    a1[1017] = v4;
    goto LABEL_9;
  }
  a1[1017] = 1;
  NSComparisonResult v3 = UIContentSizeCategoryCompareToCategory(category, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]);
  a1[1018] = 1;
  if (v3 == NSOrderedAscending)
  {
LABEL_9:
    a1[1019] = 0;
    goto LABEL_10;
  }
  a1[1019] = 1;
LABEL_10:
}

- (void)_configurePrimaryTextLabel
{
  if (a1)
  {
    id v5 = [a1 textLabel];
    uint64_t v2 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], (void *)*MEMORY[0x1E4FB2778], 0x8000, 0);
    [v5 setFont:v2];

    NSComparisonResult v3 = [MEMORY[0x1E4FB1618] labelColor];
    [v5 setTextColor:v3];

    if (a1[1019]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [v5 setNumberOfLines:v4];
    [v5 setLineBreakMode:4 * (a1[1019] == 0)];
  }
}

- (void)_configureDetailTextLabel
{
  if (!a1) {
    return;
  }
  id v6 = [a1 detailTextLabel];
  uint64_t v2 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB2780], 0x8000, 0);
  [v6 setFont:v2];

  NSComparisonResult v3 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v6 setTextColor:v3];

  if (a1[1019])
  {
    uint64_t v4 = 4;
  }
  else
  {
    if (a1[1016])
    {
      uint64_t v5 = 4;
      uint64_t v4 = 1;
      goto LABEL_7;
    }
    uint64_t v4 = 2;
  }
  uint64_t v5 = 0;
LABEL_7:
  [v6 setNumberOfLines:v4];
  [v6 setLineBreakMode:v5];
}

void __56__PKExpiredPassesTableViewCell_initWithReuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  -[PKExpiredPassesTableViewCell _determineAccessibilitySettings](v2);
  -[PKExpiredPassesTableViewCell _configurePrimaryTextLabel](v2);
  -[PKExpiredPassesTableViewCell _configureDetailTextLabel](v2);
  [v2 setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  if (self->_shouldTreatAsAX && self->_isAccessibilityCategory)
  {
    self->_sizing = 1;
    CGFloat width = -[PKExpiredPassesTableViewCell _layoutWithBounds:]((uint64_t)self, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 1.79769313e308);
    self->_sizing = 0;
  }
  else
  {
    double v5 = 80.0;
    if (self->_configuration.small) {
      double v5 = 64.0;
    }
  }
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (double)_layoutWithBounds:(double)a3
{
  if (!a1) {
    return 0.0;
  }
  CGRectEdge v10 = 2 * *(unsigned __int8 *)(a1 + 1020);
  PKContentAlignmentMake();
  memset(&slice, 0, sizeof(slice));
  double v11 = 10.0;
  if (!*(unsigned char *)(a1 + 1020)) {
    double v11 = 16.0;
  }
  double v12 = a2 + v11;
  double v13 = a3 + 8.0;
  v14 = objc_msgSend((id)a1, "contentView", *(void *)&a3, *(void *)&a5);
  [v14 bounds];
  double v16 = v15 + -26.0;

  remainder.origin.double x = v12;
  remainder.origin.y = a3 + 8.0;
  char v17 = *(unsigned char *)(a1 + 1016);
  remainder.size.CGFloat width = v16;
  remainder.size.height = a5 + -16.0;
  double v18 = 64.0;
  if ((v17 & 1) == 0) {
    double v18 = 80.0;
  }
  double v19 = v18 + -8.0;
  double v20 = v18 + -6.0;
  if (v17) {
    double v21 = v19;
  }
  else {
    double v21 = v20;
  }
  if (v17) {
    double v22 = 36.0;
  }
  else {
    double v22 = 80.0;
  }
  uint64_t v23 = *(void *)(a1 + 1024);
  if (v23)
  {
    -[PKPassThumbnailView _layoutWithBounds:commit:](v23, 0, (uint64_t)v45, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v22, v21);
    double v22 = *(double *)v45;
    double v21 = *(double *)&v45[1];
    int v24 = v46;
  }
  else
  {
    int v24 = 0;
  }
  if (*(unsigned char *)(a1 + 1019)) {
    CGFloat v25 = v21;
  }
  else {
    CGFloat v25 = v22;
  }
  if (*(unsigned char *)(a1 + 1019)) {
    CGRectEdge v26 = CGRectMinYEdge;
  }
  else {
    CGRectEdge v26 = v10;
  }
  v47.origin.double x = v12;
  v47.origin.y = v13;
  v47.size.CGFloat width = v16;
  v47.size.height = a5 + -16.0;
  CGRectDivide(v47, &slice, &remainder, v25, v26);
  double x = slice.origin.x;
  if (*(unsigned char *)(a1 + 1017))
  {
    if (*(unsigned char *)(a1 + 1019))
    {
      double v28 = a4;
      goto LABEL_30;
    }
    double v28 = a4;
    if (*(void *)(a1 + 1048) && *(void *)(a1 + 1056)) {
      goto LABEL_28;
    }
  }
  else
  {
    double v28 = a4;
    if (!v24)
    {
LABEL_28:
      PKFloatRoundToPixel();
      double v13 = v13 + v29;
      goto LABEL_30;
    }
  }
  double v13 = v41 + v42 - v21;
LABEL_30:
  objc_msgSend(*(id *)(a1 + 1024), "setFrame:", x, v13, v22, v21);
  if (!*(unsigned char *)(a1 + 1019)) {
    CGRectDivide(remainder, &slice, &remainder, 12.0, v10);
  }
  double v30 = 0.0;
  objc_msgSend((id)a1, "setSeparatorInset:", 0.0, remainder.origin.x, 0.0, 0.0);
  v31 = [(id)a1 textLabel];
  v32 = [(id)a1 detailTextLabel];
  objc_msgSend(v31, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &slice, &remainder, v33, CGRectMinYEdge);
  if (!*(unsigned char *)(a1 + 1021))
  {
    PKSizeAlignedInRect();
    objc_msgSend(v31, "setFrame:");
  }
  objc_msgSend(v32, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &slice, &remainder, v34, CGRectMinYEdge);
  if (!*(unsigned char *)(a1 + 1021))
  {
    PKSizeAlignedInRect();
    double v37 = v35 + v36;
    objc_msgSend(v32, "setFrame:");
    double v30 = (double)(uint64_t)v37;
  }
  if (*(unsigned char *)(a1 + 1021) || *(unsigned char *)(a1 + 1019)) {
    goto LABEL_44;
  }
  if (v30 >= v41 + v42)
  {
    PKFloatRoundToPixel();
    double v38 = -v39;
LABEL_42:
    if ((uint64_t)v38)
    {
      __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(v31);
      __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(v32);
    }
    goto LABEL_44;
  }
  if (remainder.size.height != 0.0)
  {
    PKFloatRoundToPixel();
    goto LABEL_42;
  }
LABEL_44:

  return v28;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PKExpiredPassesTableViewCell;
  [(PKExpiredPassesTableViewCell *)&v7 layoutSubviews];
  [(PKExpiredPassesTableViewCell *)self bounds];
  -[PKExpiredPassesTableViewCell _layoutWithBounds:]((uint64_t)self, v3, v4, v5, v6);
}

void __50__PKExpiredPassesTableViewCell__layoutWithBounds___block_invoke(void *a1)
{
  id v1 = a1;
  [v1 frame];
  objc_msgSend(v1, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKExpiredPassesTableViewCell;
  [(PKExpiredPassesTableViewCell *)&v3 prepareForReuse];
  [(PKExpiredPassesTableViewCell *)self setPass:0];
  [(PKExpiredPassesTableViewCell *)self setPrimaryText:0];
  [(PKExpiredPassesTableViewCell *)self setDetailText:0];
  [(PKExpiredPassesTableViewCell *)self setSecondaryDetailText:0];
}

- (void)setPass:(id)a3
{
  double v5 = (PKPass *)a3;
  p_pass = (void **)&self->_pass;
  if (self->_pass != v5)
  {
    double v16 = v5;
    objc_storeStrong((id *)&self->_pass, a3);
    thumbnailView = self->_thumbnailView;
    id v8 = *p_pass;
    if (thumbnailView)
    {
      if (!v8)
      {
LABEL_12:
        [(PKPassThumbnailView *)self->_thumbnailView removeFromSuperview];
        double v15 = self->_thumbnailView;
        self->_thumbnailView = 0;

        goto LABEL_13;
      }
      v9 = thumbnailView->_pass;
      CGRectEdge v10 = (PKPass *)*p_pass;

      id v8 = *p_pass;
      if (v9 != v10)
      {
        -[PKPassThumbnailView setPass:]((uint64_t)self->_thumbnailView, v8);
LABEL_13:
        double v5 = v16;
        goto LABEL_14;
      }
    }
    if (v8)
    {
      double v11 = [PKPassThumbnailView alloc];
      if (v11) {
        double v11 = (PKPassThumbnailView *)-[PKPassThumbnailView initWithPass:suppressedContent:rendererState:options:](v11, *p_pass, 0, 0, 0);
      }
      double v12 = self->_thumbnailView;
      self->_thumbnailView = v11;

      -[PKPassThumbnailView setShadowVisibility:]((uint64_t)self->_thumbnailView, 0.0);
      double v13 = self->_thumbnailView;
      if (v13) {
        v13->_preferMinimumHeight = 0;
      }
      v14 = [(PKExpiredPassesTableViewCell *)self contentView];
      [v14 addSubview:self->_thumbnailView];

      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (void)setPrimaryText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKExpiredPassesTableViewCell *)self textLabel];
  double v6 = (void *)v5;
  if (v4 && !v5)
  {

    id v4 = 0;
  }
  primaryText = self->_primaryText;
  double v12 = (NSString *)v4;
  id v8 = primaryText;
  if (v12 == v8)
  {

    goto LABEL_13;
  }
  if (v12 && v8)
  {
    BOOL v9 = [(NSString *)v12 isEqualToString:v8];

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  CGRectEdge v10 = (NSString *)[(NSString *)v12 copy];
  double v11 = self->_primaryText;
  self->_primaryText = v10;

  if (v6)
  {
    [v6 setText:self->_primaryText];
    [(PKExpiredPassesTableViewCell *)self setNeedsLayout];
  }
LABEL_13:
}

- (void)setDetailText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKExpiredPassesTableViewCell *)self detailTextLabel];
  double v6 = (void *)v5;
  if (v4 && !v5)
  {

    id v4 = 0;
  }
  detailText = self->_detailText;
  double v13 = (NSString *)v4;
  id v8 = detailText;
  if (v13 == v8)
  {

    goto LABEL_13;
  }
  if (v13 && v8)
  {
    BOOL v9 = [(NSString *)v13 isEqualToString:v8];

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  CGRectEdge v10 = (NSString *)[(NSString *)v13 copy];
  double v11 = self->_detailText;
  self->_detailText = v10;

  if (v6)
  {
    double v12 = -[PKExpiredPassesTableViewCell buildDetailTextLabelContent](self);
    [v6 setText:v12];

    [(PKExpiredPassesTableViewCell *)self setNeedsLayout];
  }
LABEL_13:
}

- (void)buildDetailTextLabelContent
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[131];
    objc_super v3 = (void *)a1[132];
    if (v2)
    {
      if (v3)
      {
        a1 = [NSString stringWithFormat:@"%@\n%@", v2, v3];
      }
      else
      {
        a1 = v2;
      }
    }
    else if (v3)
    {
      a1 = v3;
    }
    else
    {
      a1 = 0;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setSecondaryDetailText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKExpiredPassesTableViewCell *)self detailTextLabel];
  double v6 = (void *)v5;
  if (v4 && !v5)
  {

    id v4 = 0;
  }
  secondaryDetailText = self->_secondaryDetailText;
  double v13 = (NSString *)v4;
  id v8 = secondaryDetailText;
  if (v13 == v8)
  {

    goto LABEL_13;
  }
  if (v13 && v8)
  {
    BOOL v9 = [(NSString *)v13 isEqualToString:v8];

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  CGRectEdge v10 = (NSString *)[(NSString *)v13 copy];
  double v11 = self->_secondaryDetailText;
  self->_secondaryDetailText = v10;

  if (v6)
  {
    double v12 = -[PKExpiredPassesTableViewCell buildDetailTextLabelContent](self);
    [v6 setText:v12];

    [(PKExpiredPassesTableViewCell *)self setNeedsLayout];
  }
LABEL_13:
}

- (PKPass)pass
{
  return self->_pass;
}

- (NSString)primaryText
{
  return self->_primaryText;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (NSString)secondaryDetailText
{
  return self->_secondaryDetailText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryDetailText, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_thumbnailView, 0);
}

@end