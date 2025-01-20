@interface PKRewardsTierTableViewCell
- (CGSize)_layoutWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)link;
- (NSString)subtitle;
- (NSString)title;
- (PKRewardsTierTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKRewardsTierTableViewCellDelegate)delegate;
- (UIImageView)tierIcon;
- (void)layoutSubviews;
- (void)linkAction;
- (void)setDelegate:(id)a3;
- (void)setLink:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKRewardsTierTableViewCell

- (PKRewardsTierTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30.receiver = self;
  v30.super_class = (Class)PKRewardsTierTableViewCell;
  v4 = [(PKRewardsTierTableViewCell *)&v30 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PKRewardsTierTableViewCell *)v4 contentView];
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    tierIcon = v5->_tierIcon;
    v5->_tierIcon = v7;

    [(UIImageView *)v5->_tierIcon setContentMode:1];
    v9 = [(UIImageView *)v5->_tierIcon layer];
    [v9 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v9 setCornerRadius:6.0];
    [v9 setMasksToBounds:1];
    [v6 addSubview:v5->_tierIcon];
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v10;

    v12 = v5->_titleLabel;
    v13 = (NSString *)*MEMORY[0x1E4FB2950];
    v14 = (NSString *)*MEMORY[0x1E4FB2788];
    v15 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], (NSString *)*MEMORY[0x1E4FB2788], *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v12 setFont:v15];

    [(UILabel *)v5->_titleLabel setNumberOfLines:0];
    [v6 addSubview:v5->_titleLabel];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v16;

    v18 = v5->_subtitleLabel;
    v19 = PKFontForDefaultDesign(v13, v14);
    [(UILabel *)v18 setFont:v19];

    [(UILabel *)v5->_subtitleLabel setNumberOfLines:0];
    v20 = v5->_subtitleLabel;
    v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v20 setTextColor:v21];

    [v6 addSubview:v5->_subtitleLabel];
    v22 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    linkButton = v5->_linkButton;
    v5->_linkButton = v22;

    v24 = [(UIButton *)v5->_linkButton titleLabel];
    [v24 setNumberOfLines:0];

    [(UIButton *)v5->_linkButton setContentHorizontalAlignment:1];
    v25 = [(UIButton *)v5->_linkButton titleLabel];
    v26 = PKFontForDefaultDesign(v13, v14);
    [v25 setFont:v26];

    v27 = v5->_linkButton;
    v28 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIButton *)v27 setTitleColor:v28 forState:0];

    [(UIButton *)v5->_linkButton addTarget:v5 action:sel_linkAction forControlEvents:64];
    [v6 addSubview:v5->_linkButton];
  }
  return v5;
}

- (void)linkAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didPressLinkInCell:self];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  title = self->_title;
  v10 = (NSString *)v4;
  v6 = title;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_title;
    self->_title = v8;

    [(UILabel *)self->_titleLabel setText:self->_title];
    [(PKRewardsTierTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  subtitle = self->_subtitle;
  v10 = (NSString *)v4;
  v6 = subtitle;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_subtitle;
    self->_subtitle = v8;

    [(UILabel *)self->_subtitleLabel setText:self->_subtitle];
    [(PKRewardsTierTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)setLink:(id)a3
{
  id v4 = a3;
  link = self->_link;
  v10 = (NSString *)v4;
  v6 = link;
  if (v6 == v10)
  {

    goto LABEL_9;
  }
  if (!v10 || !v6)
  {

    goto LABEL_8;
  }
  BOOL v7 = [(NSString *)v10 isEqualToString:v6];

  if (!v7)
  {
LABEL_8:
    v8 = (NSString *)[(NSString *)v10 copy];
    v9 = self->_link;
    self->_link = v8;

    [(UIButton *)self->_linkButton setTitle:self->_link forState:0];
    [(PKRewardsTierTableViewCell *)self setNeedsLayout];
  }
LABEL_9:
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKRewardsTierTableViewCell;
  [(PKRewardsTierTableViewCell *)&v3 layoutSubviews];
  [(PKRewardsTierTableViewCell *)self bounds];
  [(PKRewardsTierTableViewCell *)self _layoutWithBounds:"_layoutWithBounds:"];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  self->_isTemplateLayout = 1;
  -[PKRewardsTierTableViewCell _layoutWithBounds:](self, "_layoutWithBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  self->_isTemplateLayout = 0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(PKRewardsTierTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v8 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v8 = CGRectMinXEdge;
  }
  memset(&slice, 0, sizeof(slice));
  v28.origin.double x = x + 16.0;
  v28.origin.double y = y + 16.0;
  v28.size.double width = width + -32.0;
  remainder.origin.double x = x + 16.0;
  remainder.origin.double y = y + 16.0;
  v28.size.double height = height + -32.0;
  remainder.size.double width = width + -32.0;
  remainder.size.double height = height + -32.0;
  CGRectDivide(v28, &slice, &remainder, 40.0, v8);
  if (!self->_isTemplateLayout)
  {
    memset(&v24, 0, sizeof(v24));
    CGRectDivide(slice, &v24, &slice, 10.0, CGRectMinYEdge);
    tierIcon = self->_tierIcon;
    PKContentAlignmentMake();
    PKSizeAlignedInRect();
    -[UIImageView setFrame:](tierIcon, "setFrame:");
  }
  CGRectDivide(remainder, &slice, &remainder, 16.0, v8);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v11 = v10;
  CGRectDivide(remainder, &slice, &remainder, v10, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  CGRectDivide(remainder, &slice, &remainder, 4.0, CGRectMinYEdge);
  double v12 = v11 + 16.0 + 4.0;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v14 = v13;
  CGRectDivide(remainder, &slice, &remainder, v13, CGRectMinYEdge);
  if (!self->_isTemplateLayout) {
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  }
  double v15 = v12 + v14;
  v16 = [(UIButton *)self->_linkButton titleLabel];
  v17 = [v16 text];
  uint64_t v18 = [v17 length];

  if (v18)
  {
    CGRectDivide(remainder, &slice, &remainder, 11.0, CGRectMinYEdge);
    double v19 = v15 + 11.0;
    -[UIButton sizeThatFits:](self->_linkButton, "sizeThatFits:", remainder.size.width, remainder.size.height);
    double v21 = v20;
    CGRectDivide(remainder, &slice, &remainder, v20, CGRectMinYEdge);
    if (!self->_isTemplateLayout) {
      -[UIButton setFrame:](self->_linkButton, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    }
    double v15 = v19 + v21;
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double v22 = CGRectGetWidth(v29);
  double v23 = v15 + 16.0;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImageView)tierIcon
{
  return self->_tierIcon;
}

- (NSString)link
{
  return self->_link;
}

- (PKRewardsTierTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKRewardsTierTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_tierIcon, 0);
}

@end