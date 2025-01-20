@interface BESearchResultTableViewCell
- (BESearchResultLabel)resultLabel;
- (BESearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BETableViewCellPageNumberLabel)pageNumberLabel;
- (BKShapeView)focusShapeView;
- (BOOL)_constrainResultLabelForPageNumber;
- (BOOL)_pageNumberLabelOnOwnLine;
- (CGSize)intrinsicContentSize;
- (UILabel)titleLabel;
- (double)maxWidth;
- (id)accessibilityLabel;
- (id)largerTextConstraints;
- (id)regularTextConstraints;
- (void)_updateFocusShapePath;
- (void)_updateResultLabelMaxWidth;
- (void)applyLabelFonts;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setFocusShapeView:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setPageNumberLabel:(id)a3;
- (void)setResultLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation BESearchResultTableViewCell

- (BESearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v36.receiver = self;
  v36.super_class = (Class)BESearchResultTableViewCell;
  v4 = [(BESearchResultTableViewCell *)&v36 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc((Class)UIView);
    v6 = [(BESearchResultTableViewCell *)v4 contentView];
    [v6 bounds];
    id v7 = [v5 initWithFrame:];
    [(BESearchResultTableViewCell *)v4 setSelectedBackgroundView:v7];

    [(BESearchResultTableViewCell *)v4 setFocusEffect:0];
    v8 = [(BESearchResultTableViewCell *)v4 contentView];
    [v8 setAutoresizingMask:18];
    v9 = objc_opt_new();
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = +[UIColor grayColor];
    [v9 setFillColor:v10];

    [v8 addSubview:v9];
    v35 = [v9 leftAnchor];
    v34 = [v8 leftAnchor];
    v33 = [v35 constraintEqualToAnchor:v34 constant:5.0];
    v37[0] = v33;
    v32 = [v9 rightAnchor];
    v31 = [v8 rightAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:-5.0];
    v37[1] = v30;
    v11 = [v9 topAnchor];
    v12 = [v8 topAnchor];
    v13 = [v11 constraintEqualToAnchor:v12 constant:5.0];
    v37[2] = v13;
    v14 = [v9 bottomAnchor];
    v15 = [v8 bottomAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:-5.0];
    v37[3] = v16;
    v17 = +[NSArray arrayWithObjects:v37 count:4];
    +[NSLayoutConstraint activateConstraints:v17];

    [(BESearchResultTableViewCell *)v4 _updateFocusShapePath];
    [v9 setAlpha:0.0];
    [(BESearchResultTableViewCell *)v4 setFocusShapeView:v9];
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    v19 = +[UIFont boldSystemFontOfSize:17.0];
    [(UILabel *)v18 setFont:v19];

    [(UILabel *)v18 setLineBreakMode:5];
    [(UILabel *)v18 setHighlightedTextColor:0];
    [(UILabel *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v18];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v18;
    v21 = v18;

    v22 = objc_alloc_init(BESearchResultLabel);
    [(BESearchResultLabel *)v22 setOpaque:0];
    v23 = +[UIFont systemFontOfSize:15.0];
    [(BESearchResultLabel *)v22 setFont:v23];

    if (isPad()) {
      uint64_t v24 = 3;
    }
    else {
      uint64_t v24 = 2;
    }
    [(BESearchResultLabel *)v22 setNumberOfLines:v24];
    [(BESearchResultLabel *)v22 setHighlightedTextColor:0];
    [(BESearchResultLabel *)v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v22];
    resultLabel = v4->_resultLabel;
    v4->_resultLabel = v22;
    v26 = v22;

    v27 = objc_alloc_init(BETableViewCellPageNumberLabel);
    [(BETableViewCellPageNumberLabel *)v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 addSubview:v27];
    pageNumberLabel = v4->_pageNumberLabel;
    v4->_pageNumberLabel = v27;

    [(BESearchResultTableViewCell *)v4 applyLabelFonts];
  }
  return v4;
}

- (void)applyLabelFonts
{
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  [v3 _scaledValueForValue:17.0];
  v4 = +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:");
  [(UILabel *)self->_titleLabel setFont:v4];

  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];

  [(BESearchResultLabel *)self->_resultLabel setFont:v5];
  [(BETableViewCellPageNumberLabel *)self->_pageNumberLabel setFont:v5];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultTableViewCell;
  [(BESearchResultTableViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_titleLabel setText:0];
  [(BESearchResultLabel *)self->_resultLabel setText:0];
  [(BETableViewCellPageNumberLabel *)self->_pageNumberLabel setText:0];
  -[BESearchResultLabel setBoldRange:](self->_resultLabel, "setBoldRange:", 0, 0);
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
  [(BESearchResultTableViewCell *)self setNeedsUpdateConstraints];
}

- (id)regularTextConstraints
{
  v48 = [(BESearchResultTableViewCell *)self contentView];
  titleLabel = self->_titleLabel;
  resultLabel = self->_resultLabel;
  id v5 = self->_pageNumberLabel;
  v52 = resultLabel;
  v6 = titleLabel;
  id v7 = [v48 layoutMarginsGuide];
  v8 = v6;
  v9 = [(UILabel *)v6 topAnchor];
  v51 = v7;
  v10 = [v7 topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v55[0] = v11;
  v49 = v6;
  v12 = [(UILabel *)v6 leadingAnchor];
  v13 = [v7 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v55[1] = v14;
  v15 = [(UILabel *)v8 trailingAnchor];
  v50 = v5;
  v16 = [(BETableViewCellPageNumberLabel *)v5 leadingAnchor];
  v17 = [v15 constraintLessThanOrEqualToAnchor:v16 constant:-15.0];
  v55[2] = v17;
  v47 = +[NSArray arrayWithObjects:v55 count:3];

  v46 = [(BETableViewCellPageNumberLabel *)v5 leadingAnchor];
  v43 = [(BESearchResultLabel *)v52 leadingAnchor];
  v42 = [(UILabel *)v49 leadingAnchor];
  v18 = [v43 constraintEqualToAnchor:v42];
  v54[0] = v18;
  v19 = [(BESearchResultLabel *)v52 trailingAnchor];
  v20 = [v19 constraintEqualToAnchor:v46 constant:-4.0];
  v54[1] = v20;
  v21 = [(BESearchResultLabel *)v52 topAnchor];
  v22 = [(UILabel *)v49 bottomAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v54[2] = v23;
  uint64_t v24 = [(BESearchResultLabel *)v52 bottomAnchor];
  v25 = [v51 bottomAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  v54[3] = v26;
  v45 = +[NSArray arrayWithObjects:v54 count:4];

  v27 = [(BETableViewCellPageNumberLabel *)v50 trailingAnchor];
  v28 = [v51 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v53[0] = v29;
  v30 = [(BETableViewCellPageNumberLabel *)v50 centerYAnchor];
  v31 = [(UILabel *)v49 centerYAnchor];
  v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31];
  v53[1] = v32;
  v33 = [(BETableViewCellPageNumberLabel *)v50 topAnchor];
  v34 = [v51 topAnchor];
  v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34 constant:4.0];
  v53[2] = v35;
  v44 = +[NSArray arrayWithObjects:v53 count:3];

  LODWORD(v36) = 1132068864;
  [(UILabel *)v49 setContentCompressionResistancePriority:0 forAxis:v36];
  LODWORD(v37) = 1132068864;
  [(BESearchResultLabel *)v52 setContentCompressionResistancePriority:0 forAxis:v37];
  LODWORD(v38) = 1144750080;
  [(BETableViewCellPageNumberLabel *)v50 setContentCompressionResistancePriority:0 forAxis:v38];

  id v39 = objc_alloc_init((Class)NSMutableArray);
  [v39 addObjectsFromArray:v47];
  [v39 addObjectsFromArray:v45];
  [v39 addObjectsFromArray:v44];
  id v40 = [v39 copy];

  return v40;
}

- (id)largerTextConstraints
{
  v45 = [(BESearchResultTableViewCell *)self contentView];
  titleLabel = self->_titleLabel;
  resultLabel = self->_resultLabel;
  v43 = self->_pageNumberLabel;
  v47 = resultLabel;
  id v5 = titleLabel;
  v6 = [v45 layoutMarginsGuide];
  id v7 = [(UILabel *)v5 topAnchor];
  v8 = [v6 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v50[0] = v9;
  v46 = v5;
  v10 = [(UILabel *)v5 leadingAnchor];
  v11 = [v6 leadingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v50[1] = v12;
  v13 = [(UILabel *)v5 trailingAnchor];
  v14 = [v6 trailingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v50[2] = v15;
  v44 = +[NSArray arrayWithObjects:v50 count:3];

  v16 = [(BESearchResultLabel *)v47 leadingAnchor];
  v17 = [(UILabel *)v46 leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v49[0] = v18;
  v19 = [(BESearchResultLabel *)v47 trailingAnchor];
  v20 = [v6 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v49[1] = v21;
  v22 = [(BESearchResultLabel *)v47 topAnchor];
  v23 = [(UILabel *)v46 bottomAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23];
  v49[2] = v24;
  v42 = +[NSArray arrayWithObjects:v49 count:3];

  id v40 = [(BETableViewCellPageNumberLabel *)v43 leadingAnchor];
  id v39 = [v6 leadingAnchor];
  double v38 = [v40 constraintEqualToAnchor:v39];
  v48[0] = v38;
  double v37 = [(BETableViewCellPageNumberLabel *)v43 trailingAnchor];
  v41 = v6;
  v25 = [v6 trailingAnchor];
  v26 = [v37 constraintEqualToAnchor:v25];
  v48[1] = v26;
  v27 = [(BETableViewCellPageNumberLabel *)v43 topAnchor];
  v28 = [(BESearchResultLabel *)v47 bottomAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v48[2] = v29;
  v30 = [(BETableViewCellPageNumberLabel *)v43 bottomAnchor];
  v31 = [v6 bottomAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v48[3] = v32;
  v33 = +[NSArray arrayWithObjects:v48 count:4];

  id v34 = objc_alloc_init((Class)NSMutableArray);
  [v34 addObjectsFromArray:v44];
  [v34 addObjectsFromArray:v42];
  [v34 addObjectsFromArray:v33];
  id v35 = [v34 copy];

  return v35;
}

- (BOOL)_pageNumberLabelOnOwnLine
{
  return +[UIFont bc_accessibilityFontSizesEnabled];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BESearchResultTableViewCell;
  [(BESearchResultTableViewCell *)&v3 layoutSubviews];
  [(BESearchResultTableViewCell *)self _updateResultLabelMaxWidth];
  [(BESearchResultTableViewCell *)self _updateFocusShapePath];
}

- (void)updateConstraints
{
  if ([(BESearchResultTableViewCell *)self _pageNumberLabelOnOwnLine])
  {
    objc_super v3 = [(BESearchResultTableViewCell *)self regularTextConstraints];
    +[NSLayoutConstraint deactivateConstraints:v3];

    [(BESearchResultTableViewCell *)self largerTextConstraints];
  }
  else
  {
    v4 = [(BESearchResultTableViewCell *)self largerTextConstraints];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(BESearchResultTableViewCell *)self regularTextConstraints];
  id v5 = };
  +[NSLayoutConstraint activateConstraints:v5];

  [(BESearchResultTableViewCell *)self _updateResultLabelMaxWidth];
  v6.receiver = self;
  v6.super_class = (Class)BESearchResultTableViewCell;
  [(BESearchResultTableViewCell *)&v6 updateConstraints];
}

- (void)_updateResultLabelMaxWidth
{
  objc_super v3 = [(BESearchResultTableViewCell *)self readableContentGuide];
  [v3 layoutFrame];
  double v4 = CGRectGetWidth(v15) + -30.0;

  [(BESearchResultTableViewCell *)self maxWidth];
  double v6 = v5 + -60.0;
  [(BESearchResultTableViewCell *)self safeAreaInsets];
  double v8 = v7;
  [(BESearchResultTableViewCell *)self safeAreaInsets];
  if (v4 >= v6 - (v8 + v9)) {
    double v4 = v6 - (v8 + v9);
  }
  v10 = [(BESearchResultTableViewCell *)self pageNumberLabel];
  [v10 intrinsicContentSize];
  double v12 = v11;

  resultLabel = self->_resultLabel;

  [(BESearchResultLabel *)resultLabel setPreferredMaxLayoutWidth:v4 - (v12 + 4.0)];
}

- (void)_updateFocusShapePath
{
  id v5 = [(BESearchResultTableViewCell *)self focusShapeView];
  [v5 bounds];
  objc_super v3 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  double v4 = [(BESearchResultTableViewCell *)self focusShapeView];
  [v4 setPath:v3];
}

- (CGSize)intrinsicContentSize
{
  v2 = [(BESearchResultTableViewCell *)self contentView];
  [v2 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] != &dword_4) {
    goto LABEL_14;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9)
  {

LABEL_14:
    v19.receiver = self;
    v19.super_class = (Class)BESearchResultTableViewCell;
    [(BESearchResultTableViewCell *)&v19 pressesBegan:v6 withEvent:v7];
    goto LABEL_15;
  }
  id v10 = v9;
  v17 = self;
  id v18 = v6;
  char v11 = 0;
  uint64_t v12 = *(void *)v21;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = [*(id *)(*((void *)&v20 + 1) + 8 * i) key:v17, v18];
      CGRect v15 = [v14 characters];
      unsigned int v16 = [v15 isEqual:@"\r"];

      if (v16) {
        char v11 = 1;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v10);

  self = v17;
  id v6 = v18;
  if ((v11 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)BESearchResultTableViewCell;
  [(BESearchResultTableViewCell *)&v4 pressesChanged:a3 withEvent:a4];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)BESearchResultTableViewCell;
  [(BESearchResultTableViewCell *)&v4 pressesCancelled:a3 withEvent:a4];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 type] != &dword_4) {
    goto LABEL_18;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9)
  {

LABEL_18:
    v25.receiver = self;
    v25.super_class = (Class)BESearchResultTableViewCell;
    [(BESearchResultTableViewCell *)&v25 pressesEnded:v6 withEvent:v7];
    goto LABEL_19;
  }
  id v10 = v9;
  long long v23 = self;
  id v24 = v6;
  char v11 = 0;
  uint64_t v12 = *(void *)v27;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v8);
      }
      v14 = [*(id *)(*((void *)&v26 + 1) + 8 * i) key:v23];
      CGRect v15 = [v14 characters];
      unsigned int v16 = [v15 isEqual:@"\r"];

      if (v16) {
        char v11 = 1;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v10);

  self = v23;
  id v6 = v24;
  if ((v11 & 1) == 0) {
    goto LABEL_18;
  }
  v17 = [(BESearchResultTableViewCell *)v23 _tableView];
  id v18 = v17;
  if (v17)
  {
    objc_super v19 = [v17 indexPathForCell:v23];
    if (v19)
    {
      long long v20 = [v18 delegate];
      id v21 = [v20 tableView:v18 willSelectRowAtIndexPath:v19];

      [v18 selectRowAtIndexPath:v19 animated:1 scrollPosition:0];
      long long v22 = [v18 delegate];
      [v22 tableView:v18 didSelectRowAtIndexPath:v19];
    }
  }

LABEL_19:
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  objc_super v4 = [(UILabel *)self->_titleLabel text];
  id v5 = [v4 length];

  if (v5)
  {
    id v6 = [(UILabel *)self->_titleLabel text];
    [v3 addObject:v6];
  }
  id v7 = [(BESearchResultLabel *)self->_resultLabel text];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [(BESearchResultLabel *)self->_resultLabel text];
    [v3 addObject:v9];
  }
  id v10 = [(BETableViewCellPageNumberLabel *)self->_pageNumberLabel text];
  id v11 = [v10 length];

  if (v11)
  {
    uint64_t v12 = IMCommonCoreBundle();
    v13 = [v12 localizedStringForKey:@"Page %@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];

    v14 = [(BETableViewCellPageNumberLabel *)self->_pageNumberLabel text];
    CGRect v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v14);
    [v3 addObject:v15];
  }
  unsigned int v16 = IMCommonCoreBundle();
  v17 = [v16 localizedStringForKey:@", ", &stru_2CE418, @"BCCommonCoreLocalizable" value table];
  id v18 = [v3 componentsJoinedByString:v17];

  return v18;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (BESearchResultLabel)resultLabel
{
  return self->_resultLabel;
}

- (void)setResultLabel:(id)a3
{
}

- (BETableViewCellPageNumberLabel)pageNumberLabel
{
  return self->_pageNumberLabel;
}

- (void)setPageNumberLabel:(id)a3
{
}

- (BKShapeView)focusShapeView
{
  return self->_focusShapeView;
}

- (void)setFocusShapeView:(id)a3
{
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (BOOL)_constrainResultLabelForPageNumber
{
  return self->__constrainResultLabelForPageNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusShapeView, 0);
  objc_storeStrong((id *)&self->_pageNumberLabel, 0);
  objc_storeStrong((id *)&self->_resultLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end