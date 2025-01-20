@interface THChapterViewTableControllerCell
- (BOOL)usingLargerTextConstraints;
- (NSArray)cachedLargerTextConstraints;
- (NSLayoutConstraint)pageLabelBaselineToTitleLabelConstraint;
- (NSLayoutConstraint)pageLabelTrailingConstraint;
- (NSLayoutConstraint)sectionLabelBaselineConstraint;
- (NSLayoutConstraint)titleLabelBaselineToPageLabelConstraint;
- (NSLayoutConstraint)titleLabelBaselineToSectionLabelConstraint;
- (NSLayoutConstraint)titleLabelLeadingConstraint;
- (NSLayoutConstraint)titleLabelTrailingConstraint;
- (UILabel)pageLabel;
- (UILabel)sectionLabel;
- (UILabel)titleLabel;
- (id)largerTextConstraints;
- (id)regularTextConstraints;
- (void)setCachedLargerTextConstraints:(id)a3;
- (void)setPageLabel:(id)a3;
- (void)setPageLabelBaselineToTitleLabelConstraint:(id)a3;
- (void)setPageLabelTrailingConstraint:(id)a3;
- (void)setSectionLabel:(id)a3;
- (void)setSectionLabelBaselineConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelBaselineToPageLabelConstraint:(id)a3;
- (void)setTitleLabelBaselineToSectionLabelConstraint:(id)a3;
- (void)setTitleLabelLeadingConstraint:(id)a3;
- (void)setTitleLabelTrailingConstraint:(id)a3;
- (void)setUsingLargerTextConstraints:(BOOL)a3;
- (void)updateConstraints;
- (void)updateLabels;
@end

@implementation THChapterViewTableControllerCell

- (void)updateConstraints
{
  id v3 = +[UIFont bc_accessibilityFontSizesEnabled];
  unsigned int v4 = [(THChapterViewTableControllerCell *)self usingLargerTextConstraints];
  if (v3)
  {
    if ((v4 & 1) == 0)
    {
      [(THChapterViewTableControllerCell *)self updateLabels];
      v5 = [(THChapterViewTableControllerCell *)self regularTextConstraints];
      +[NSLayoutConstraint deactivateConstraints:v5];

      uint64_t v6 = [(THChapterViewTableControllerCell *)self largerTextConstraints];
LABEL_6:
      v8 = (void *)v6;
      +[NSLayoutConstraint activateConstraints:v6];
    }
  }
  else if (v4)
  {
    [(THChapterViewTableControllerCell *)self updateLabels];
    v7 = [(THChapterViewTableControllerCell *)self largerTextConstraints];
    +[NSLayoutConstraint deactivateConstraints:v7];

    uint64_t v6 = [(THChapterViewTableControllerCell *)self regularTextConstraints];
    goto LABEL_6;
  }
  [(THChapterViewTableControllerCell *)self setUsingLargerTextConstraints:v3];
  v9.receiver = self;
  v9.super_class = (Class)THChapterViewTableControllerCell;
  [(THChapterViewTableControllerCell *)&v9 updateConstraints];
}

- (void)updateLabels
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = [(THChapterViewTableControllerCell *)self sectionLabel];
  v24[0] = v3;
  unsigned int v4 = [(THChapterViewTableControllerCell *)self titleLabel];
  v24[1] = v4;
  v5 = [(THChapterViewTableControllerCell *)self pageLabel];
  v24[2] = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:v24 count:3];

  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v10);
        v12 = +[UIColor bc_booksLabelColor];
        [v11 setTextColor:v12];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  v13 = +[UIColor bc_booksBackground];
  v14 = [(THChapterViewTableControllerCell *)self contentView];
  [v14 setBackgroundColor:v13];

  unsigned int v15 = +[UIFont bc_accessibilityFontSizesEnabled];
  titleLabel = self->_titleLabel;
  if (v15)
  {
    [(UILabel *)titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setLineBreakMode:0];
    [(UILabel *)self->_titleLabel frame];
    [(UILabel *)self->_titleLabel setPreferredMaxLayoutWidth:CGRectGetWidth(v26)];
    v17 = [(THChapterViewTableControllerCell *)self pageLabel];
    v18 = v17;
    uint64_t v19 = 4;
  }
  else
  {
    [(UILabel *)titleLabel setNumberOfLines:1];
    [(UILabel *)self->_titleLabel setLineBreakMode:5];
    v17 = [(THChapterViewTableControllerCell *)self pageLabel];
    v18 = v17;
    uint64_t v19 = 2;
  }
  [v17 setTextAlignment:v19];

  [(THChapterViewTableControllerCell *)self layoutIfNeeded];
}

- (id)regularTextConstraints
{
  id v3 = [(THChapterViewTableControllerCell *)self sectionLabelBaselineConstraint];
  unsigned int v4 = [(THChapterViewTableControllerCell *)self pageLabelBaselineToTitleLabelConstraint];
  v12[1] = v4;
  v5 = [(THChapterViewTableControllerCell *)self titleLabelBaselineToSectionLabelConstraint];
  v12[2] = v5;
  uint64_t v6 = [(THChapterViewTableControllerCell *)self titleLabelBaselineToPageLabelConstraint];
  v12[3] = v6;
  id v7 = [(THChapterViewTableControllerCell *)self titleLabelLeadingConstraint];
  v12[4] = v7;
  id v8 = [(THChapterViewTableControllerCell *)self titleLabelTrailingConstraint];
  v12[5] = v8;
  uint64_t v9 = [(THChapterViewTableControllerCell *)self pageLabelTrailingConstraint];
  v12[6] = v9;
  v10 = +[NSArray arrayWithObjects:v12 count:7];

  return v10;
}

- (id)largerTextConstraints
{
  id v3 = [(THChapterViewTableControllerCell *)self cachedLargerTextConstraints];

  if (!v3)
  {
    unsigned int v4 = [(THChapterViewTableControllerCell *)self sectionLabel];
    v5 = [(THChapterViewTableControllerCell *)self titleLabel];
    uint64_t v6 = [(THChapterViewTableControllerCell *)self pageLabel];
    id v7 = _NSDictionaryOfVariableBindings(@"sectionLabel, titleLabel, pageLabel", v4, v5, v6, 0);
    id v8 = +[NSMutableArray array];
    uint64_t v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-[sectionLabel]-(2)-[titleLabel(>=20)]-(2)-[pageLabel]-|", 0, 0, v7);
    [v8 addObjectsFromArray:v9];

    v10 = +[NSLayoutConstraint constraintWithItem:v5 attribute:4 relatedBy:0 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];
    [v8 addObject:v10];

    v11 = +[NSLayoutConstraint constraintWithItem:v5 attribute:3 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
    [v8 addObject:v11];

    v12 = +[NSLayoutConstraint constraintWithItem:v5 attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:0.0];
    [v8 addObject:v12];

    v13 = +[NSLayoutConstraint constraintWithItem:v6 attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:0.0];
    [v8 addObject:v13];

    v14 = +[NSLayoutConstraint constraintWithItem:v4 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-10.0];
    [v8 addObject:v14];

    unsigned int v15 = +[NSLayoutConstraint constraintWithItem:v5 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-10.0];
    [v8 addObject:v15];

    v16 = +[NSLayoutConstraint constraintWithItem:v6 attribute:6 relatedBy:0 toItem:self attribute:6 multiplier:1.0 constant:-10.0];
    [v8 addObject:v16];

    v17 = +[NSLayoutConstraint constraintWithItem:v6 attribute:4 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:-12.0];
    [v8 addObject:v17];

    id v18 = [v8 copy];
    [(THChapterViewTableControllerCell *)self setCachedLargerTextConstraints:v18];
  }

  return [(THChapterViewTableControllerCell *)self cachedLargerTextConstraints];
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)pageLabel
{
  return self->_pageLabel;
}

- (void)setPageLabel:(id)a3
{
}

- (BOOL)usingLargerTextConstraints
{
  return self->_usingLargerTextConstraints;
}

- (void)setUsingLargerTextConstraints:(BOOL)a3
{
  self->_usingLargerTextConstraints = a3;
}

- (NSArray)cachedLargerTextConstraints
{
  return self->_cachedLargerTextConstraints;
}

- (void)setCachedLargerTextConstraints:(id)a3
{
}

- (NSLayoutConstraint)sectionLabelBaselineConstraint
{
  return self->_sectionLabelBaselineConstraint;
}

- (void)setSectionLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageLabelBaselineToTitleLabelConstraint
{
  return self->_pageLabelBaselineToTitleLabelConstraint;
}

- (void)setPageLabelBaselineToTitleLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelBaselineToSectionLabelConstraint
{
  return self->_titleLabelBaselineToSectionLabelConstraint;
}

- (void)setTitleLabelBaselineToSectionLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelBaselineToPageLabelConstraint
{
  return self->_titleLabelBaselineToPageLabelConstraint;
}

- (void)setTitleLabelBaselineToPageLabelConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLeadingConstraint
{
  return self->_titleLabelLeadingConstraint;
}

- (void)setTitleLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingConstraint
{
  return self->_titleLabelTrailingConstraint;
}

- (void)setTitleLabelTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)pageLabelTrailingConstraint
{
  return self->_pageLabelTrailingConstraint;
}

- (void)setPageLabelTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineToPageLabelConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineToSectionLabelConstraint, 0);
  objc_storeStrong((id *)&self->_pageLabelBaselineToTitleLabelConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_cachedLargerTextConstraints, 0);
  objc_storeStrong((id *)&self->_pageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_sectionLabel, 0);
}

@end