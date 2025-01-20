@interface BKTOCAnnotationTableCell
+ (CGSize)dateLabelSizeForString:(id)a3 font:(id)a4 bounds:(CGRect)a5;
+ (double)dateFontSize;
+ (double)pageNumberFontSize;
+ (double)titleFontSize;
+ (id)dateFontForPopover;
+ (id)pageNumberFontForPopover;
- (UILabel)dateLabel;
- (UILabel)noteLabel;
- (void)configureWithPageString:(id)a3 dateString:(id)a4 insets:(UIEdgeInsets)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BKTOCAnnotationTableCell

+ (double)titleFontSize
{
  return 17.0;
}

+ (double)dateFontSize
{
  return 14.0;
}

+ (double)pageNumberFontSize
{
  return 17.0;
}

+ (id)dateFontForPopover
{
  v2 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleCallout];
  v3 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
  [v3 pointSize];
  v4 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  v5 = +[UITraitCollection currentTraitCollectionLimitedToSizeCategory:UIContentSizeCategoryLarge];
  v6 = [v2 scaledFontForFont:v4 maximumPointSize:v5 compatibleWithTraitCollection:28.0];

  return v6;
}

+ (id)pageNumberFontForPopover
{
  v2 = +[UITraitCollection currentTraitCollectionLimitedToSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v2];

  return v3;
}

+ (CGSize)dateLabelSizeForString:(id)a3 font:(id)a4 bounds:(CGRect)a5
{
  double width = a5.size.width;
  id v7 = a4;
  id v8 = a3;
  [v7 lineHeight];
  +[UILabel bkSizeForString:constrainedToSize:font:lineBreakMode:](UILabel, "bkSizeForString:constrainedToSize:font:lineBreakMode:", v8, v7, 4, width, v9);
  double v11 = v10;
  double v13 = v12;

  float v14 = v11;
  float v15 = width;
  double v16 = fminf(ceilf(v14), ceilf(v15));
  float v17 = v13;
  double v18 = ceilf(v17);
  result.height = v18;
  result.double width = v16;
  return result;
}

- (void)layoutSubviews
{
  v3 = [(BKTOCTableViewCell *)self pageLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v28.receiver = self;
  v28.super_class = (Class)BKTOCAnnotationTableCell;
  [(BKTOCTableViewCell *)&v28 layoutSubviews];
  double v12 = [(BKTOCTableViewCell *)self pageLabel];
  [v12 setFrame:v5, v7, v9, v11];

  double v13 = [(BKTOCAnnotationTableCell *)self contentView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [(BKTOCTableViewCell *)self contentInsets];
  double v23 = v22;
  [(BKTOCTableViewCell *)self contentInsets];
  double v25 = v19 - (v23 + v24);
  [(BKTOCTableViewCell *)self contentInsets];
  -[BKTOCAnnotationTableCell layoutSubviewsNotEditingWithBounds:](self, "layoutSubviewsNotEditingWithBounds:", v15 + v26, v17, v25, v21);
  v27 = +[UIColor clearColor];
  [(BKTOCAnnotationTableCell *)self setBackgroundColor:v27];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)BKTOCAnnotationTableCell;
  [(BKTOCTableViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_dateLabel setText:0];
}

- (void)configureWithPageString:(id)a3 dateString:(id)a4 insets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v16 = a3;
  id v11 = a4;
  [(BKTOCTableViewCell *)self setupSelectedBackgroundNil];
  double v12 = [(BKTOCTableViewCell *)self pageLabel];
  if (v16)
  {
    [v12 setHidden:0];
    if ([(BKTOCTableViewCell *)self usesPopoverStyle])
    {
      [(id)objc_opt_class() pageNumberFontForPopover];
    }
    else
    {
      [(id)objc_opt_class() pageNumberFontSize];
      +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    double v13 = };
    [v12 bkSetText:v16 font:v13 lineBreakMode:4];
  }
  else
  {
    [v12 setHidden:1];
  }
  if ([v11 length])
  {
    if ([(BKTOCTableViewCell *)self usesPopoverStyle])
    {
      [(id)objc_opt_class() dateFontForPopover];
    }
    else
    {
      [(id)objc_opt_class() dateFontSize];
      +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    double v14 = };
    double v15 = [(BKTOCAnnotationTableCell *)self dateLabel];
    [v15 bkSetText:v11 font:v14 lineBreakMode:4];
  }
  -[BKTOCTableViewCell setContentInsets:](self, "setContentInsets:", top, left, bottom, right);
  -[BKTOCAnnotationTableCell setSeparatorInset:](self, "setSeparatorInset:", top, left, bottom, right);
}

- (UILabel)dateLabel
{
  dateLabel = self->_dateLabel;
  if (!dateLabel)
  {
    double v4 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    double v5 = self->_dateLabel;
    self->_dateLabel = v4;

    [(UILabel *)self->_dateLabel setOpaque:0];
    [(UILabel *)self->_dateLabel setNumberOfLines:1];
    [(UILabel *)self->_dateLabel setTextAlignment:2* ([(BKTOCAnnotationTableCell *)self effectiveUserInterfaceLayoutDirection] != (char *)&dword_0 + 1)];
    double v6 = [(BKTOCAnnotationTableCell *)self contentView];
    [v6 addSubview:self->_dateLabel];

    dateLabel = self->_dateLabel;
  }

  return dateLabel;
}

- (UILabel)noteLabel
{
  noteLabel = self->_noteLabel;
  if (!noteLabel)
  {
    double v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_noteLabel;
    self->_noteLabel = v4;

    [(UILabel *)self->_noteLabel setOpaque:0];
    [(UILabel *)self->_noteLabel setNumberOfLines:3];
    [(UILabel *)self->_noteLabel setTextAlignment:2* ([(BKTOCAnnotationTableCell *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1)];
    double v6 = [(BKTOCAnnotationTableCell *)self contentView];
    [v6 addSubview:self->_noteLabel];

    noteLabel = self->_noteLabel;
  }

  return noteLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteLabel, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end