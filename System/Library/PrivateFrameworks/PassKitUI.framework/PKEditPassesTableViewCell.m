@interface PKEditPassesTableViewCell
+ (BOOL)needsFullPassImage;
+ (CGSize)imageSizeNeeded;
+ (UIEdgeInsets)separatorInset;
+ (double)height;
- (BOOL)showImage;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKEditPassesTableViewCell)initWithReuseIdentifier:(id)a3 showImage:(BOOL)a4;
- (PKPass)pass;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setImage:(id)a3 forPass:(id)a4;
- (void)setPass:(id)a3;
- (void)setShowImage:(BOOL)a3;
@end

@implementation PKEditPassesTableViewCell

- (PKEditPassesTableViewCell)initWithReuseIdentifier:(id)a3 showImage:(BOOL)a4
{
  v15.receiver = self;
  v15.super_class = (Class)PKEditPassesTableViewCell;
  v5 = [(PKEditPassesTableViewCell *)&v15 initWithStyle:3 reuseIdentifier:a3];
  v6 = v5;
  if (v5)
  {
    v7 = [(PKEditPassesTableViewCell *)v5 textLabel];
    v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v7 setFont:v8];

    v9 = [MEMORY[0x1E4FB1618] labelColor];
    [v7 setTextColor:v9];

    v10 = [(PKEditPassesTableViewCell *)v6 detailTextLabel];
    v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v10 setFont:v11];

    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v10 setTextColor:v12];

    v6->_showImage = a4;
    v13 = [(PKEditPassesTableViewCell *)v6 imageView];
    [v13 setContentMode:1];
    [v13 setClipsToBounds:1];
    [v13 setHidden:!v6->_showImage];
    [(id)objc_opt_class() separatorInset];
    -[PKEditPassesTableViewCell setSeparatorInset:](v6, "setSeparatorInset:");
  }
  return v6;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)PKEditPassesTableViewCell;
  [(PKEditPassesTableViewCell *)&v53 layoutSubviews];
  int v3 = [(PKEditPassesTableViewCell *)self _shouldReverseLayoutDirection];
  if (!self->_showImage) {
    return;
  }
  int v4 = v3;
  v5 = [(PKEditPassesTableViewCell *)self textLabel];
  v6 = [(PKEditPassesTableViewCell *)self detailTextLabel];
  v7 = [(PKEditPassesTableViewCell *)self imageView];
  v8 = [(PKEditPassesTableViewCell *)self contentView];
  [v8 layoutMargins];
  double v10 = v9;
  double v12 = v11;
  [v8 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  CGFloat rect = v19;
  double v20 = v10 + v12;
  v21 = [v7 image];
  v22 = v21;
  if (v21) {
    objc_msgSend(v21, "pkui_alignmentSize");
  }
  else {
    +[PKEditPassesTableViewCell imageSizeNeeded];
  }
  double v25 = v23;
  double v26 = v24;
  double v27 = v10 + v14;
  double v28 = v16 + 0.0;
  double v29 = v18 - v20;
  if (!+[PKEditPassesTableViewCell needsFullPassImage]
    && [(PKPass *)self->_pass style] != 6)
  {
    v54.origin.x = v10 + v14;
    v54.origin.y = v28;
    v54.size.width = v29;
    v54.size.height = rect;
    double v33 = CGRectGetMaxY(v54) - v26;
    double v30 = v25;
    goto LABEL_11;
  }
  double v30 = v25;
  if (!v22)
  {
    double v33 = v28 + 8.0;
LABEL_11:
    double v31 = v26;
    goto LABEL_12;
  }
  double v31 = v26;
  PKFloatCeilToPixel();
  double v33 = v28 + v32;
LABEL_12:
  double v34 = v27;
  if (v4)
  {
    v55.origin.x = v27;
    v55.origin.y = v28;
    v55.size.width = v29;
    v55.size.height = rect;
    double v34 = CGRectGetMaxX(v55) - v30;
  }
  CGFloat v50 = v28;
  CGFloat v51 = v29;
  objc_msgSend(v7, "frameForAlignmentRect:", v34, v33, v30, v31);
  objc_msgSend(v7, "setFrame:");
  [v5 frame];
  double v36 = v35;
  double v38 = v37;
  [v6 frame];
  double v40 = v39;
  double v41 = v30;
  double v43 = v42;
  if (v4)
  {
    double MaxX = v34 + -12.0;
  }
  else
  {
    double v45 = v34;
    double v46 = v33;
    double v47 = v31;
    CGFloat v48 = CGRectGetMaxX(*(CGRect *)(&v41 - 2)) + 12.0;
    v56.origin.x = v27;
    v56.origin.y = v50;
    v56.size.width = v51;
    v56.size.height = rect;
    double MaxX = CGRectGetMaxX(v56);
    double v27 = v48;
  }
  double v49 = MaxX - v27;
  objc_msgSend(v5, "setFrame:", v27, v36, MaxX - v27, v38);
  objc_msgSend(v6, "setFrame:", v27, v40, v49, v43);
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)PKEditPassesTableViewCell;
  [(PKEditPassesTableViewCell *)&v6 prepareForReuse];
  int v3 = [(PKEditPassesTableViewCell *)self textLabel];
  [v3 setText:0];

  int v4 = [(PKEditPassesTableViewCell *)self detailTextLabel];
  [v4 setText:0];

  [(PKEditPassesTableViewCell *)self setPass:0];
  v5 = [(PKEditPassesTableViewCell *)self imageView];
  [v5 setImage:0];
  [v5 setHidden:!self->_showImage];
}

- (void)setImage:(id)a3 forPass:(id)a4
{
  id v6 = a3;
  if (self->_showImage)
  {
    id v11 = v6;
    id v7 = a4;
    v8 = [(PKEditPassesTableViewCell *)self imageView];
    double v9 = [(PKPass *)self->_pass uniqueID];
    double v10 = [v7 uniqueID];

    LODWORD(v7) = [v9 isEqualToString:v10];
    if (v7)
    {
      [v8 setImage:v11];
      [v8 setAccessibilityIgnoresInvertColors:1];
      [(PKEditPassesTableViewCell *)self setNeedsLayout];
    }

    id v6 = v11;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKEditPassesTableViewCell;
  -[PKEditPassesTableViewCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = fmax(v4, 64.0);
  result.height = v5;
  result.width = v3;
  return result;
}

+ (CGSize)imageSizeNeeded
{
  +[PKEditPassesTableViewCell height];
  double v4 = v3;
  int v5 = [a1 needsFullPassImage];
  double v6 = v4 + -8.0;
  double v7 = 80.0;
  if (v5) {
    double v7 = 36.0;
  }
  result.height = v6;
  result.width = v7;
  return result;
}

+ (double)height
{
  return 64.0;
}

+ (BOOL)needsFullPassImage
{
  return PKUIGetMinScreenWidthType() == 0;
}

+ (UIEdgeInsets)separatorInset
{
  uint64_t v2 = PKUIGetMinScreenWidthType();
  double v3 = 44.0;
  if (v2) {
    double v3 = 45.0;
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (BOOL)showImage
{
  return self->_showImage;
}

- (void)setShowImage:(BOOL)a3
{
  self->_showImage = a3;
}

- (void).cxx_destruct
{
}

@end