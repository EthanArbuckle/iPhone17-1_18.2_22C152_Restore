@interface ICBrowseAttachmentsHeaderView
- (ICBrowseAttachmentsHeaderViewDelegate)delegate;
- (NSLayoutConstraint)sectionLabelAXTrailingConstrint;
- (NSLayoutConstraint)sectionLabelBottomConstraint;
- (NSLayoutConstraint)sectionLabelLeadingConstraint;
- (NSLayoutConstraint)seeAllButtonAXLeadingConstraint;
- (NSLayoutConstraint)seeAllButtonAXTopConstraint;
- (NSLayoutConstraint)seeAllButtonBaselineConstraint;
- (NSLayoutConstraint)seeAllButtonLeadingConstraint;
- (NSLayoutConstraint)seeAllButtonTrailingConstraint;
- (UIButton)seeAllButton;
- (UILabel)sectionLabel;
- (id)constraintsForAXLargerTextSizes;
- (id)constraintsForRegularTextSizes;
- (signed)attachmentSection;
- (void)awakeFromNib;
- (void)contentSizeCategoryDidChange;
- (void)seeAll:(id)a3;
- (void)setAttachmentSection:(signed __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setSectionLabel:(id)a3;
- (void)setSectionLabelAXTrailingConstrint:(id)a3;
- (void)setSectionLabelBottomConstraint:(id)a3;
- (void)setSectionLabelLeadingConstraint:(id)a3;
- (void)setSeeAllButton:(id)a3;
- (void)setSeeAllButtonAXLeadingConstraint:(id)a3;
- (void)setSeeAllButtonAXTopConstraint:(id)a3;
- (void)setSeeAllButtonBaselineConstraint:(id)a3;
- (void)setSeeAllButtonLeadingConstraint:(id)a3;
- (void)setSeeAllButtonTrailingConstraint:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)updateConstraints;
@end

@implementation ICBrowseAttachmentsHeaderView

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)ICBrowseAttachmentsHeaderView;
  [(ICBrowseAttachmentsHeaderView *)&v7 awakeFromNib];
  v3 = [(ICBrowseAttachmentsHeaderView *)self sectionLabel];
  unint64_t v4 = (unint64_t)[v3 accessibilityTraits];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader | v4];

  v5 = +[UIColor labelColor];
  v6 = [(ICBrowseAttachmentsHeaderView *)self sectionLabel];
  [v6 setTextColor:v5];

  [(ICBrowseAttachmentsHeaderView *)self setClipsToBounds:0];
}

- (void)seeAll:(id)a3
{
  id v4 = [(ICBrowseAttachmentsHeaderView *)self delegate];
  [v4 showAllForAttachmentSection:[self attachmentSection]];
}

- (void)contentSizeCategoryDidChange
{
  id v7 = +[UIFont ic_attachmentBrowserTitleFont];
  v3 = [(ICBrowseAttachmentsHeaderView *)self sectionLabel];
  [v3 setFont:v7];

  id v4 = +[UIFont ic_attachmentBrowserSeeAllButtonFont];
  v5 = [(ICBrowseAttachmentsHeaderView *)self seeAllButton];
  v6 = [v5 titleLabel];
  [v6 setFont:v4];

  [(ICBrowseAttachmentsHeaderView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v3 = [(ICBrowseAttachmentsHeaderView *)self window];
  id v4 = [v3 windowScene];
  v5 = (char *)[v4 interfaceOrientation];

  v6 = [(ICBrowseAttachmentsHeaderView *)self traitCollection];
  id v7 = [v6 horizontalSizeClass];

  int v8 = ICAccessibilityAccessibilityLargerTextSizesEnabled();
  v9 = [(ICBrowseAttachmentsHeaderView *)self sectionLabel];
  v10 = v9;
  if (v8 && (unint64_t)(v5 - 3) >= 0xFFFFFFFFFFFFFFFELL && v7 == (id)1)
  {
    [v9 setNumberOfLines:0];

    v11 = [(ICBrowseAttachmentsHeaderView *)self constraintsForRegularTextSizes];
    +[NSLayoutConstraint deactivateConstraints:v11];

    uint64_t v12 = [(ICBrowseAttachmentsHeaderView *)self constraintsForAXLargerTextSizes];
  }
  else
  {
    [v9 setNumberOfLines:1];

    v13 = [(ICBrowseAttachmentsHeaderView *)self constraintsForAXLargerTextSizes];
    +[NSLayoutConstraint deactivateConstraints:v13];

    uint64_t v12 = [(ICBrowseAttachmentsHeaderView *)self constraintsForRegularTextSizes];
  }
  v14 = (void *)v12;
  +[NSLayoutConstraint activateConstraints:v12];

  v15.receiver = self;
  v15.super_class = (Class)ICBrowseAttachmentsHeaderView;
  [(ICBrowseAttachmentsHeaderView *)&v15 updateConstraints];
}

- (id)constraintsForRegularTextSizes
{
  v3 = +[NSMutableArray array];
  id v4 = [(ICBrowseAttachmentsHeaderView *)self sectionLabelBottomConstraint];
  [v3 ic_addNonNilObject:v4];

  v5 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonLeadingConstraint];
  [v3 ic_addNonNilObject:v5];

  v6 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonTrailingConstraint];
  [v3 ic_addNonNilObject:v6];

  id v7 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonBaselineConstraint];
  [v3 ic_addNonNilObject:v7];

  id v8 = [v3 copy];

  return v8;
}

- (id)constraintsForAXLargerTextSizes
{
  v3 = +[NSMutableArray array];
  id v4 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonAXTopConstraint];
  [v3 ic_addNonNilObject:v4];

  v5 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonAXLeadingConstraint];
  [v3 ic_addNonNilObject:v5];

  id v6 = [v3 copy];

  return v6;
}

- (void)setLeadingMargin:(double)a3
{
  v5 = [(ICBrowseAttachmentsHeaderView *)self sectionLabelLeadingConstraint];
  [v5 setConstant:a3];

  id v6 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonAXLeadingConstraint];
  [v6 setConstant:a3];
}

- (void)setTrailingMargin:(double)a3
{
  id v4 = [(ICBrowseAttachmentsHeaderView *)self seeAllButtonTrailingConstraint];
  [v4 setConstant:a3];
}

- (UILabel)sectionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sectionLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSectionLabel:(id)a3
{
}

- (UIButton)seeAllButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_seeAllButton);

  return (UIButton *)WeakRetained;
}

- (void)setSeeAllButton:(id)a3
{
}

- (NSLayoutConstraint)sectionLabelLeadingConstraint
{
  return self->_sectionLabelLeadingConstraint;
}

- (void)setSectionLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)sectionLabelBottomConstraint
{
  return self->_sectionLabelBottomConstraint;
}

- (void)setSectionLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)seeAllButtonLeadingConstraint
{
  return self->_seeAllButtonLeadingConstraint;
}

- (void)setSeeAllButtonLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)seeAllButtonTrailingConstraint
{
  return self->_seeAllButtonTrailingConstraint;
}

- (void)setSeeAllButtonTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)seeAllButtonBaselineConstraint
{
  return self->_seeAllButtonBaselineConstraint;
}

- (void)setSeeAllButtonBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)seeAllButtonAXTopConstraint
{
  return self->_seeAllButtonAXTopConstraint;
}

- (void)setSeeAllButtonAXTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)seeAllButtonAXLeadingConstraint
{
  return self->_seeAllButtonAXLeadingConstraint;
}

- (void)setSeeAllButtonAXLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)sectionLabelAXTrailingConstrint
{
  return self->_sectionLabelAXTrailingConstrint;
}

- (void)setSectionLabelAXTrailingConstrint:(id)a3
{
}

- (signed)attachmentSection
{
  return self->_attachmentSection;
}

- (void)setAttachmentSection:(signed __int16)a3
{
  self->_attachmentSection = a3;
}

- (ICBrowseAttachmentsHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICBrowseAttachmentsHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionLabelAXTrailingConstrint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonAXLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonAXTopConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_seeAllButtonLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_sectionLabelLeadingConstraint, 0);
  objc_destroyWeak((id *)&self->_seeAllButton);

  objc_destroyWeak((id *)&self->_sectionLabel);
}

@end