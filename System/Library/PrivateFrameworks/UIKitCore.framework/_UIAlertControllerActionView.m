@interface _UIAlertControllerActionView
- (BOOL)hasActiveMinimumSizeConstraintsWithSize:(CGSize)a3;
- (BOOL)hasLayoutHeightConstraintsIdenticalToInterfaceActionCustomView:(id)a3;
- (BOOL)isHighlighted;
- (NSLayoutConstraint)labelContainerCenterXConstraint;
- (NSLayoutConstraint)labelContainerLeadingPinConstraint;
- (NSLayoutConstraint)labelContainerTrailingPinConstraint;
- (NSString)description;
- (UIAlertAction)action;
- (UIAlertController)alertController;
- (UIAlertControllerVisualStyle)visualStyle;
- (_UIAlertControllerActionView)initWithCoder:(id)a3;
- (_UIAlertControllerActionView)initWithFrame:(CGRect)a3;
- (double)currentDescriptiveLabelTextWidth;
- (double)currentLabelTextWidth;
- (id)_interfaceActionViewState;
- (int64_t)_effectiveTitleTextAlignment;
- (int64_t)focusItemDeferralMode;
- (void)_action:(id)a3 changedToEnabled:(BOOL)a4;
- (void)_action:(id)a3 changedToTitle:(id)a4;
- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4;
- (void)_action:(id)a3 updatedImageTintColor:(id)a4;
- (void)_buildCheckViewConstraints;
- (void)_buildConstraints;
- (void)_buildContentViewControllerContainerConstraints;
- (void)_buildHavingDescriptiveLabelConstraints;
- (void)_buildImageViewConstraints;
- (void)_buildNotHavingDescriptiveLabelConstraints;
- (void)_loadCheckView;
- (void)_loadContentViewControllerContainerViewIfNecessary;
- (void)_loadContentViewControllerView;
- (void)_loadDescriptiveLabel;
- (void)_loadImageView;
- (void)_prepareConstraintsForHavingDescriptiveText:(BOOL)a3;
- (void)_prepareConstraintsForImage:(id)a3;
- (void)_recomputeColors;
- (void)_removeContentViewControllerContainerViewSubviews;
- (void)_updateCheckImageView;
- (void)_updateContentViewControllerContainerViewConstraints;
- (void)_updateDescriptiveText;
- (void)_updateHavingDescriptiveLabelConstraints;
- (void)_updateImageMargins;
- (void)_updateImageView;
- (void)_updateImageViewAttributes;
- (void)_updateLabelAttributes;
- (void)_updateLabelContainerConstraints;
- (void)_updateMinimumHeightAndDesiredWidthConstraints;
- (void)_updateStyle;
- (void)_updateTextAlignmentForHavingDescriptiveText:(BOOL)a3 titleTextAlignment:(int64_t)a4;
- (void)applyMetrics:(id)a3;
- (void)dealloc;
- (void)setAction:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLabelContainerCenterXConstraint:(id)a3;
- (void)setLabelContainerLeadingPinConstraint:(id)a3;
- (void)setLabelContainerTrailingPinConstraint:(id)a3;
- (void)setVisualStyle:(id)a3;
- (void)updateSizeUsingAXEnforcedWidth:(double)a3;
@end

@implementation _UIAlertControllerActionView

- (_UIAlertControllerActionView)initWithCoder:(id)a3
{
  return 0;
}

- (_UIAlertControllerActionView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_UIAlertControllerActionView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UIView);
    labelContainerView = v3->_labelContainerView;
    v3->_labelContainerView = v4;

    [(UIView *)v3->_labelContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v3->_labelContainerView setUserInteractionEnabled:0];
    v6 = objc_alloc_init(UILabel);
    label = v3->_label;
    v3->_label = v6;

    [(UIView *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = v3->_label;
    v9 = +[UIColor clearColor];
    [(UIView *)v8 setBackgroundColor:v9];

    [(UILabel *)v3->_label _setTextColorFollowsTintColor:1];
    [(UIView *)v3 addSubview:v3->_labelContainerView];
    [(UIView *)v3->_labelContainerView addSubview:v3->_label];
    [(UIView *)v3 setExclusiveTouch:1];
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel__contentSizeChanged name:@"UIContentSizeCategoryDidChangeNotification" object:0];

    contentViewControllerConstraints = v3->_contentViewControllerConstraints;
    v3->_contentViewControllerConstraints = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(_UIAlertControllerActionView *)v3 _buildConstraints];
    [(_UIAlertControllerActionView *)v3 _updateLabelAttributes];
    [(UIView *)v3 setFocusEffect:0];
  }
  return v3;
}

- (NSString)description
{
  [(UIView *)self frame];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  v11 = NSString;
  uint64_t v12 = objc_opt_class();
  objc_super v13 = [(UIAlertAction *)self->_action description];
  objc_msgSend(v11, "stringWithFormat:", @"<%@: %p; frame = (%g %g; %g %g); Action = %@>",
    v12,
    self,
    v4,
    v6,
    v8,
    v10,
  v14 = v13);

  return (NSString *)v14;
}

- (int64_t)focusItemDeferralMode
{
  v2 = [(_UIAlertControllerActionView *)self alertController];
  int64_t v3 = [v2 _resolvedStyle] != 1;

  return v3;
}

- (void)dealloc
{
  int64_t v3 = (void *)MEMORY[0x18C108260](self, a2);
  uint64_t v4 = [(UIAlertAction *)self->_action _representer];

  if (v4 == self) {
    [(UIAlertAction *)self->_action _setRepresenter:0];
  }
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"UIContentSizeCategoryDidChangeNotification" object:0];

  v6.receiver = self;
  v6.super_class = (Class)_UIAlertControllerActionView;
  [(UIView *)&v6 dealloc];
}

- (void)_buildConstraints
{
  v68[2] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(_UIAlertControllerActionView *)self _buildNotHavingDescriptiveLabelConstraints];
  uint64_t v4 = [(UIView *)self->_labelContainerView leadingAnchor];
  uint64_t v5 = [(UIView *)self leadingAnchor];
  objc_super v6 = [v4 constraintGreaterThanOrEqualToAnchor:v5];
  labelContainerLeadingConstraint = self->_labelContainerLeadingConstraint;
  self->_labelContainerLeadingConstraint = v6;

  uint64_t v8 = [(UIView *)self->_labelContainerView trailingAnchor];
  uint64_t v9 = [(UIView *)self trailingAnchor];
  uint64_t v10 = [v8 constraintLessThanOrEqualToAnchor:v9];
  labelContainerTrailingConstraint = self->_labelContainerTrailingConstraint;
  self->_labelContainerTrailingConstraint = v10;

  LODWORD(v12) = 1148829696;
  [(NSLayoutConstraint *)self->_labelContainerLeadingConstraint setPriority:v12];
  LODWORD(v13) = 1148829696;
  [(NSLayoutConstraint *)self->_labelContainerTrailingConstraint setPriority:v13];
  [v3 addObject:self->_labelContainerLeadingConstraint];
  [v3 addObject:self->_labelContainerTrailingConstraint];
  v14 = [(UIView *)self->_labelContainerView leadingAnchor];
  v15 = [(UIView *)self->_label leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];

  v17 = [(UIView *)self->_labelContainerView trailingAnchor];
  v18 = [(UIView *)self->_label trailingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];

  v67 = v16;
  LODWORD(v20) = 1140457472;
  [v16 setPriority:v20];
  LODWORD(v21) = 1140457472;
  [v19 setPriority:v21];
  [v3 addObject:v16];
  v22 = v3;
  [v3 addObject:v19];
  v23 = [(UIView *)self->_labelContainerView centerXAnchor];
  v24 = [(UIView *)self centerXAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [(_UIAlertControllerActionView *)self setLabelContainerCenterXConstraint:v25];

  v26 = [(_UIAlertControllerActionView *)self labelContainerCenterXConstraint];
  LODWORD(v27) = 1132068864;
  [v26 setPriority:v27];

  v28 = [(UIView *)self->_labelContainerView centerYAnchor];
  v29 = [(UIView *)self centerYAnchor];
  v66 = [v28 constraintEqualToAnchor:v29];

  v30 = [(UIView *)self->_labelContainerView heightAnchor];
  v31 = [(UIView *)self heightAnchor];
  v65 = [v30 constraintEqualToAnchor:v31];

  v32 = [(_UIAlertControllerActionView *)self labelContainerCenterXConstraint];
  v33 = v22;
  [v22 addObject:v32];

  [v22 addObject:v66];
  [v22 addObject:v65];
  v34 = [(UIView *)self->_labelContainerView leadingAnchor];
  v35 = [(UIView *)self leadingAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  [(_UIAlertControllerActionView *)self setLabelContainerLeadingPinConstraint:v36];

  v37 = [(_UIAlertControllerActionView *)self labelContainerLeadingPinConstraint];
  LODWORD(v38) = 1132068864;
  [v37 setPriority:v38];

  v39 = [(UIView *)self->_labelContainerView trailingAnchor];
  v40 = [(UIView *)self trailingAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  [(_UIAlertControllerActionView *)self setLabelContainerTrailingPinConstraint:v41];

  v42 = [(_UIAlertControllerActionView *)self labelContainerTrailingPinConstraint];
  LODWORD(v43) = 1132068864;
  [v42 setPriority:v43];

  v44 = [(UIView *)self->_label trailingAnchor];
  v45 = [(UIView *)self->_labelContainerView trailingAnchor];
  v46 = [v44 constraintLessThanOrEqualToAnchor:v45];

  [v22 addObject:v46];
  v47 = [(UIView *)self->_label centerYAnchor];
  v48 = [(UIView *)self centerYAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];

  v50 = [(UIView *)self heightAnchor];
  v51 = [v50 constraintGreaterThanOrEqualToConstant:0.0];
  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = v51;

  LODWORD(v53) = 1148829696;
  [(NSLayoutConstraint *)self->_minimumHeightConstraint setPriority:v53];
  v54 = [(UIView *)self->_labelContainerView heightAnchor];
  v55 = [v54 constraintEqualToConstant:0.0];

  v56 = [(UIView *)self->_labelContainerView topAnchor];
  v57 = [(UIView *)self->_label topAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];

  LODWORD(v59) = 1111752704;
  [v55 setPriority:v59];
  LODWORD(v60) = 1111752704;
  [v58 setPriority:v60];
  v68[0] = v55;
  v68[1] = v58;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  [v33 addObjectsFromArray:v61];

  [v33 addObject:v49];
  [v33 addObject:self->_minimumHeightConstraint];
  v62 = (void *)MEMORY[0x1E4F5B268];
  v64 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v33, v63);
  [v62 activateConstraints:v64];
}

- (void)_buildNotHavingDescriptiveLabelConstraints
{
  id v9 = [MEMORY[0x1E4F1CA48] array];
  int64_t v3 = [(UIView *)self->_label leadingAnchor];
  uint64_t v4 = [(UIView *)self->_labelContainerView leadingAnchor];
  uint64_t v5 = [v3 constraintGreaterThanOrEqualToAnchor:v4];

  [v9 addObject:v5];
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v9, v6);
  uint64_t v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  notHavingDescriptiveLabelConstraints = self->_notHavingDescriptiveLabelConstraints;
  self->_notHavingDescriptiveLabelConstraints = v7;
}

- (void)_buildHavingDescriptiveLabelConstraints
{
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int64_t v3 = [(UIView *)self->_descriptiveLabel trailingAnchor];
  uint64_t v4 = [(UIView *)self->_label leadingAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  descriptiveLabelTrailingToLabelLeadingLabelConstraint = self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint;
  self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint = v5;

  [v42 addObject:self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint];
  uint64_t v7 = [(UIView *)self->_descriptiveLabel trailingAnchor];
  uint64_t v8 = [(UIView *)self->_labelContainerView centerXAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  descriptiveLabelTrailingToContainerCenterConstraint = self->_descriptiveLabelTrailingToContainerCenterConstraint;
  self->_descriptiveLabelTrailingToContainerCenterConstraint = v9;

  LODWORD(v11) = 1132068864;
  [(NSLayoutConstraint *)self->_descriptiveLabelTrailingToContainerCenterConstraint setPriority:v11];
  [v42 addObject:self->_descriptiveLabelTrailingToContainerCenterConstraint];
  double v12 = [(UIView *)self->_label leadingAnchor];
  double v13 = [(UIView *)self->_labelContainerView centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  labelCenterLeadingConstraint = self->_labelCenterLeadingConstraint;
  self->_labelCenterLeadingConstraint = v14;

  LODWORD(v16) = 1132068864;
  [(NSLayoutConstraint *)self->_labelCenterLeadingConstraint setPriority:v16];
  [v42 addObject:self->_labelCenterLeadingConstraint];
  v17 = [(UIView *)self->_descriptiveLabel leadingAnchor];
  v18 = [(UIView *)self->_labelContainerView leadingAnchor];
  v19 = [v17 constraintGreaterThanOrEqualToAnchor:v18];

  [v42 addObject:v19];
  double v20 = [(UIView *)self->_labelContainerView leadingAnchor];
  double v21 = [(UIView *)self->_descriptiveLabel leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];

  LODWORD(v23) = 1140457472;
  [v22 setPriority:v23];
  [v42 addObject:v22];
  v24 = [(UIView *)self->_descriptiveLabel widthAnchor];
  [(_UIAlertControllerActionViewMetrics *)self->_metrics descriptiveLabelTextWidth];
  objc_msgSend(v24, "constraintEqualToConstant:");
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  descriptiveLabelWidthConstraint = self->_descriptiveLabelWidthConstraint;
  self->_descriptiveLabelWidthConstraint = v25;

  LODWORD(v27) = 1148829696;
  [(NSLayoutConstraint *)self->_descriptiveLabelWidthConstraint setPriority:v27];
  [v42 addObject:self->_descriptiveLabelWidthConstraint];
  v28 = [(UIView *)self->_label widthAnchor];
  [(_UIAlertControllerActionViewMetrics *)self->_metrics labelTextWidth];
  objc_msgSend(v28, "constraintEqualToConstant:");
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  labelWidthConstraint = self->_labelWidthConstraint;
  self->_labelWidthConstraint = v29;

  LODWORD(v31) = 1148829696;
  [(NSLayoutConstraint *)self->_labelWidthConstraint setPriority:v31];
  [v42 addObject:self->_labelWidthConstraint];
  v32 = [(UIView *)self->_descriptiveLabel centerYAnchor];
  v33 = [(UIView *)self centerYAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];

  [v42 addObject:v34];
  v35 = [(UIView *)self->_descriptiveLabel centerXAnchor];
  v36 = [(UIView *)self centerXAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];

  LODWORD(v38) = 1111752704;
  [v37 setPriority:v38];
  [v42 addObject:v34];
  _UIConstraintsBySortingConstraintsForInsertionPerformance(v42, v39);
  v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
  havingDescriptiveLabelConstraints = self->_havingDescriptiveLabelConstraints;
  self->_havingDescriptiveLabelConstraints = v40;

  [(_UIAlertControllerActionView *)self _updateHavingDescriptiveLabelConstraints];
}

- (void)_prepareConstraintsForHavingDescriptiveText:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasDescriptiveText = a3;
  [(_UIAlertControllerActionView *)self _updateHavingDescriptiveLabelConstraints];
  uint64_t v5 = 7;
  if (v3) {
    uint64_t v6 = 15;
  }
  else {
    uint64_t v6 = 7;
  }
  uint64_t v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIAlertControllerActionView__labelContainerView[v6]);
  if (!v3) {
    uint64_t v5 = 15;
  }
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UIAlertControllerActionView__labelContainerView[v5]);
  if (!v9) {
    id v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F5B268];
  id v11 = v9;
  id v12 = v8;
  [v10 deactivateConstraints:v11];
  [MEMORY[0x1E4F5B268] activateConstraints:v12];
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    uint64_t v5 = [(UIView *)self _enclosingInterfaceActionRepresentationView];
    [v5 setHighlighted:v3];

    [(_UIAlertControllerActionView *)self _recomputeColors];
  }
}

- (void)applyMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
  id v7 = a3;
  descriptiveLabelWidthConstraint = self->_descriptiveLabelWidthConstraint;
  [v7 descriptiveLabelTextWidth];
  -[NSLayoutConstraint setConstant:](descriptiveLabelWidthConstraint, "setConstant:");
  labelWidthConstraint = self->_labelWidthConstraint;
  [v7 labelTextWidth];
  -[NSLayoutConstraint setConstant:](labelWidthConstraint, "setConstant:");
}

- (double)currentDescriptiveLabelTextWidth
{
  [(UILabel *)self->_descriptiveLabel intrinsicContentSize];
  return result;
}

- (double)currentLabelTextWidth
{
  [(UILabel *)self->_label intrinsicContentSize];
  return result;
}

- (void)_recomputeColors
{
  [(_UIAlertControllerActionView *)self _updateLabelAttributes];
  [(_UIAlertControllerActionView *)self _updateImageViewAttributes];
  id v6 = [(_UIAlertControllerActionView *)self action];
  if ([v6 isEnabled]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  if ([(UIView *)self tintAdjustmentMode] != v3) {
    [(UIView *)self setTintAdjustmentMode:v3];
  }
  contentViewControllerContainerView = self->_contentViewControllerContainerView;
  uint64_t v5 = [(UIView *)self->_label tintColor];
  [(UIView *)contentViewControllerContainerView setTintColor:v5];
}

- (void)_updateImageViewAttributes
{
  id v7 = [(_UIAlertControllerActionView *)self visualStyle];
  imageView = self->_imageView;
  uint64_t v4 = [(_UIAlertControllerActionView *)self _interfaceActionViewState];
  [v7 configureAttributesForImageView:imageView imageProperty:0x1ED0EA320 actionViewState:v4];

  checkView = self->_checkView;
  id v6 = [(_UIAlertControllerActionView *)self _interfaceActionViewState];
  [v7 configureAttributesForImageView:checkView imageProperty:0x1ED0EA360 actionViewState:v6];
}

- (void)_updateLabelAttributes
{
  uint64_t v3 = [(UIAlertAction *)self->_action _descriptiveText];
  uint64_t v4 = [v3 length];

  if (v4) {
    descriptiveLabel = self->_descriptiveLabel;
  }
  else {
    descriptiveLabel = 0;
  }
  id v6 = descriptiveLabel;
  id v9 = [(_UIAlertControllerActionView *)self visualStyle];
  label = self->_label;
  uint64_t v8 = [(_UIAlertControllerActionView *)self _interfaceActionViewState];
  [v9 configureAttributesForTitleLabel:label classificationLabel:v6 actionViewState:v8];
}

- (void)_loadDescriptiveLabel
{
  uint64_t v3 = objc_alloc_init(UILabel);
  descriptiveLabel = self->_descriptiveLabel;
  self->_descriptiveLabel = v3;

  [(UIView *)self->_descriptiveLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v5 = self->_descriptiveLabel;
  id v6 = +[UIColor clearColor];
  [(UIView *)v5 setBackgroundColor:v6];

  [(UILabel *)self->_descriptiveLabel _setTextColorFollowsTintColor:1];
  [(_UIAlertControllerActionView *)self _updateTextAlignmentForHavingDescriptiveText:self->_hasDescriptiveText titleTextAlignment:[(UIAlertAction *)self->_action _titleTextAlignment]];
  [(_UIAlertControllerActionView *)self _updateLabelAttributes];
  [(_UIAlertControllerActionView *)self _recomputeColors];
  [(UIView *)self->_labelContainerView addSubview:self->_descriptiveLabel];
  [(_UIAlertControllerActionView *)self _buildHavingDescriptiveLabelConstraints];
}

- (void)_updateDescriptiveText
{
  id v6 = [(_UIAlertControllerActionView *)self action];
  uint64_t v3 = [v6 _descriptiveText];
  if ([v3 length] && !self->_descriptiveLabel) {
    [(_UIAlertControllerActionView *)self _loadDescriptiveLabel];
  }
  descriptiveLabel = self->_descriptiveLabel;
  uint64_t v5 = [v6 _descriptiveText];
  [(UILabel *)descriptiveLabel setText:v5];
}

- (void)_buildImageViewConstraints
{
  id v24 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(UIView *)self->_imageView leadingAnchor];
  uint64_t v4 = [(UIView *)self leadingAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  marginToImageConstraint = self->_marginToImageConstraint;
  self->_marginToImageConstraint = v5;

  [v24 addObject:self->_marginToImageConstraint];
  id v7 = [(UIView *)self->_imageView topAnchor];
  uint64_t v8 = [(UIView *)self topAnchor];
  id v9 = [v7 constraintGreaterThanOrEqualToAnchor:v8];
  imageViewTopConstraint = self->_imageViewTopConstraint;
  self->_imageViewTopConstraint = v9;

  id v11 = [(UIView *)self->_imageView bottomAnchor];
  id v12 = [(UIView *)self bottomAnchor];
  double v13 = [v11 constraintLessThanOrEqualToAnchor:v12];
  imageViewBottomConstraint = self->_imageViewBottomConstraint;
  self->_imageViewBottomConstraint = v13;

  [(_UIAlertControllerActionView *)self _prepareConstraintsForImage:0];
  [v24 addObject:self->_imageViewBaselineOrCenterYConstraint];
  [v24 addObject:self->_imageViewTopConstraint];
  [v24 addObject:self->_imageViewBottomConstraint];
  v15 = [(UIView *)self->_imageView widthAnchor];
  double v16 = [v15 constraintEqualToConstant:0.0];

  LODWORD(v17) = 1111752704;
  [v16 setPriority:v17];
  v18 = [(UIView *)self->_imageView heightAnchor];
  v19 = [v18 constraintEqualToConstant:0.0];

  LODWORD(v20) = 1111752704;
  [v19 setPriority:v20];
  [v24 addObject:v16];
  [v24 addObject:v19];
  [(_UIAlertControllerActionView *)self _updateImageMargins];
  double v21 = (void *)MEMORY[0x1E4F5B268];
  double v23 = _UIConstraintsBySortingConstraintsForInsertionPerformance(v24, v22);
  [v21 activateConstraints:v23];
}

- (void)_prepareConstraintsForImage:(id)a3
{
  id v4 = a3;
  id v16 = v4;
  if (v4 && ![v4 hasBaseline])
  {
    p_imageViewBaselineOrCenterYConstraint = &self->_imageViewBaselineOrCenterYConstraint;
    imageViewBaselineOrCenterYConstraint = self->_imageViewBaselineOrCenterYConstraint;
    if (!imageViewBaselineOrCenterYConstraint) {
      goto LABEL_12;
    }
    if ([(NSLayoutConstraint *)imageViewBaselineOrCenterYConstraint firstAttribute] == NSLayoutAttributeLastBaseline)
    {
      [(NSLayoutConstraint *)*p_imageViewBaselineOrCenterYConstraint setActive:0];
      id v12 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = 0;
    }
    uint64_t v8 = v16;
    if (!*p_imageViewBaselineOrCenterYConstraint)
    {
LABEL_12:
      id v9 = [(UIView *)self->_imageView centerYAnchor];
      uint64_t v10 = [(UIView *)self centerYAnchor];
      goto LABEL_13;
    }
  }
  else
  {
    p_imageViewBaselineOrCenterYConstraint = &self->_imageViewBaselineOrCenterYConstraint;
    id v6 = self->_imageViewBaselineOrCenterYConstraint;
    if (!v6) {
      goto LABEL_7;
    }
    if ([(NSLayoutConstraint *)v6 firstAttribute] == NSLayoutAttributeCenterY)
    {
      [(NSLayoutConstraint *)*p_imageViewBaselineOrCenterYConstraint setActive:0];
      id v7 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = 0;
    }
    uint64_t v8 = v16;
    if (!*p_imageViewBaselineOrCenterYConstraint)
    {
LABEL_7:
      id v9 = [(UIView *)self->_imageView lastBaselineAnchor];
      uint64_t v10 = [(UIView *)self->_label lastBaselineAnchor];
LABEL_13:
      double v13 = (void *)v10;
      uint64_t v14 = [v9 constraintEqualToAnchor:v10];
      v15 = *p_imageViewBaselineOrCenterYConstraint;
      *p_imageViewBaselineOrCenterYConstraint = (NSLayoutConstraint *)v14;

      [(NSLayoutConstraint *)*p_imageViewBaselineOrCenterYConstraint setActive:1];
      uint64_t v8 = v16;
    }
  }
}

- (void)_loadImageView
{
  uint64_t v3 = objc_alloc_init(UIImageView);
  imageView = self->_imageView;
  self->_imageView = v3;

  [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_imageView _setDefaultRenderingMode:2];
  [(_UIAlertControllerActionView *)self _recomputeColors];
  [(UIView *)self addSubview:self->_imageView];
  [(_UIAlertControllerActionView *)self _buildImageViewConstraints];
}

- (void)_updateImageView
{
  uint64_t v3 = [(UIAlertAction *)self->_action image];
  id v4 = (id)v3;
  if (v3 && !self->_imageView)
  {
    [(_UIAlertControllerActionView *)self _loadImageView];
    uint64_t v3 = (uint64_t)v4;
  }
  [(UIImageView *)self->_imageView setImage:v3];
  [(_UIAlertControllerActionView *)self _prepareConstraintsForImage:v4];
}

- (void)_buildCheckViewConstraints
{
  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(UIView *)self->_checkView trailingAnchor];
  id v4 = [(UIView *)self trailingAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  checkToMarginConstraint = self->_checkToMarginConstraint;
  self->_checkToMarginConstraint = v5;

  [v10 addObject:self->_checkToMarginConstraint];
  id v7 = [(UIView *)self->_checkView lastBaselineAnchor];
  uint64_t v8 = [(UIView *)self->_label lastBaselineAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];

  [v10 addObject:v9];
  [(_UIAlertControllerActionView *)self _updateImageMargins];
  [MEMORY[0x1E4F5B268] activateConstraints:v10];
}

- (void)_loadCheckView
{
  uint64_t v3 = objc_alloc_init(UIImageView);
  checkView = self->_checkView;
  self->_checkView = v3;

  [(UIImageView *)self->_checkView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_checkView _setDefaultRenderingMode:2];
  [(UIImageView *)self->_checkView setHidden:1];
  uint64_t v5 = +[UIImageSymbolConfiguration configurationWithTextStyle:@"UICTFontTextStyleBody"];
  id v6 = +[UIImage systemImageNamed:@"checkmark" withConfiguration:v5];

  [(UIImageView *)self->_checkView setImage:v6];
  [(_UIAlertControllerActionView *)self _recomputeColors];
  [(UIView *)self addSubview:self->_checkView];
  [(_UIAlertControllerActionView *)self _buildCheckViewConstraints];
}

- (void)_updateCheckImageView
{
  uint64_t v3 = [(_UIAlertControllerActionView *)self action];
  int v4 = [v3 _isChecked];

  if (v4 && !self->_checkView) {
    [(_UIAlertControllerActionView *)self _loadCheckView];
  }
  [(UIImageView *)self->_checkView setHidden:v4 ^ 1u];
  [(_UIAlertControllerActionView *)self _updateLabelContainerConstraints];
}

- (void)_buildContentViewControllerContainerConstraints
{
  id v18 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(UIView *)self->_contentViewControllerContainerView leadingAnchor];
  int v4 = [(UIView *)self leadingAnchor];
  uint64_t v5 = [v3 constraintEqualToAnchor:v4];
  [v18 addObject:v5];

  id v6 = [(UIView *)self->_contentViewControllerContainerView topAnchor];
  id v7 = [(UIView *)self topAnchor];
  uint64_t v8 = [v6 constraintEqualToAnchor:v7];
  [v18 addObject:v8];

  id v9 = [(UIView *)self->_contentViewControllerContainerView widthAnchor];
  id v10 = [(UIView *)self widthAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10];
  [v18 addObject:v11];

  id v12 = [(UIView *)self->_contentViewControllerContainerView heightAnchor];
  double v13 = [(UIView *)self heightAnchor];
  uint64_t v14 = [v12 constraintEqualToAnchor:v13];
  [v18 addObject:v14];

  _UIConstraintsBySortingConstraintsForInsertionPerformance(v18, v15);
  id v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contentViewControllerConstraints = self->_contentViewControllerConstraints;
  self->_contentViewControllerConstraints = v16;
}

- (void)_loadContentViewControllerView
{
  [(_UIAlertControllerActionView *)self _loadContentViewControllerContainerViewIfNecessary];
  uint64_t v3 = [(_UIAlertControllerActionView *)self action];
  int v4 = [v3 _contentViewController];
  id v17 = [v4 view];

  [v17 setPreservesSuperviewLayoutMargins:1];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [MEMORY[0x1E4F5B268] activateConstraints:self->_contentViewControllerConstraints];
  [(UIAlertAction *)self->_action _willAddContentViewController];
  [(UIView *)self->_contentViewControllerContainerView addSubview:v17];
  uint64_t v5 = [(UIView *)self leadingAnchor];
  id v6 = [v17 leadingAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  uint64_t v8 = [(UIView *)self trailingAnchor];
  id v9 = [v17 trailingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  id v11 = [(UIView *)self topAnchor];
  id v12 = [v17 topAnchor];
  double v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  uint64_t v14 = [(UIView *)self bottomAnchor];
  v15 = [v17 bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  [(UIAlertAction *)self->_action _didAddContentViewController];
}

- (void)_loadContentViewControllerContainerViewIfNecessary
{
  if (!self->_contentViewControllerContainerView)
  {
    uint64_t v3 = [UIView alloc];
    [(UIView *)self bounds];
    int v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    contentViewControllerContainerView = self->_contentViewControllerContainerView;
    self->_contentViewControllerContainerView = v4;

    [(UIView *)self->_contentViewControllerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentViewControllerContainerView setClipsToBounds:1];
    id v6 = self->_contentViewControllerContainerView;
    id v7 = [(_UIAlertControllerActionView *)self visualStyle];
    [v7 contentHorizontalMargin];
    double v9 = v8;
    id v10 = [(_UIAlertControllerActionView *)self visualStyle];
    [v10 contentHorizontalMargin];
    -[UIView setLayoutMargins:](v6, "setLayoutMargins:", 0.0, v9, 0.0, v11);

    [(_UIAlertControllerActionView *)self _recomputeColors];
    [(UIView *)self addSubview:self->_contentViewControllerContainerView];
    [(_UIAlertControllerActionView *)self _buildContentViewControllerContainerConstraints];
  }
}

- (void)_removeContentViewControllerContainerViewSubviews
{
  [MEMORY[0x1E4F5B268] deactivateConstraints:self->_contentViewControllerConstraints];
  id v3 = [(UIView *)self->_contentViewControllerContainerView subviews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];
}

- (void)updateSizeUsingAXEnforcedWidth:(double)a3
{
  if (self->_axEnforcedWidth != a3)
  {
    self->_axEnforcedWidth = a3;
    [(_UIAlertControllerActionView *)self _updateMinimumHeightAndDesiredWidthConstraints];
  }
}

- (void)_updateMinimumHeightAndDesiredWidthConstraints
{
  id v3 = [(_UIAlertControllerActionView *)self visualStyle];
  [v3 minimumActionContentSize];
  double v5 = v4;

  if ([(UILabel *)self->_label numberOfLines]
    || (double axEnforcedWidth = self->_axEnforcedWidth, axEnforcedWidth <= 0.0))
  {
    [(NSLayoutConstraint *)self->_axLabelContainerWidthConstraint setActive:0];
  }
  else
  {
    [(NSLayoutConstraint *)self->_labelContainerLeadingConstraint constant];
    double v8 = axEnforcedWidth - v7;
    [(NSLayoutConstraint *)self->_labelContainerTrailingConstraint constant];
    -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v8 + v9, 0.0);
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [(_UIAlertControllerActionView *)self visualStyle];
    [v14 contentVerticalMargin];
    double v16 = v13 + v15 + v15;

    if (v5 < v16) {
      double v5 = v16;
    }
    axLabelContainerWidthConstraint = self->_axLabelContainerWidthConstraint;
    if (!axLabelContainerWidthConstraint)
    {
      id v18 = [(UIView *)self->_labelContainerView widthAnchor];
      v19 = [v18 constraintEqualToConstant:v11];
      double v20 = self->_axLabelContainerWidthConstraint;
      self->_axLabelContainerWidthConstraint = v19;

      LODWORD(v21) = 1144750080;
      [(NSLayoutConstraint *)self->_axLabelContainerWidthConstraint setPriority:v21];
      [(NSLayoutConstraint *)self->_axLabelContainerWidthConstraint setActive:1];
      axLabelContainerWidthConstraint = self->_axLabelContainerWidthConstraint;
    }
    [(NSLayoutConstraint *)axLabelContainerWidthConstraint setConstant:v11];
  }
  [(NSLayoutConstraint *)self->_minimumHeightConstraint constant];
  if (v5 != v22)
  {
    [(NSLayoutConstraint *)self->_minimumHeightConstraint setConstant:v5];
    id v23 = [(UIView *)self _enclosingInterfaceActionRepresentationView];
    [v23 invalidateIntrinsicContentSize];
  }
}

- (void)_updateImageMargins
{
  id v3 = [(_UIAlertControllerActionView *)self visualStyle];
  [v3 actionImageMarginForAction];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(NSLayoutConstraint *)self->_marginToImageConstraint setConstant:v7];
  [(NSLayoutConstraint *)self->_checkToMarginConstraint setConstant:-v11];
  [(NSLayoutConstraint *)self->_imageViewTopConstraint setConstant:v5];
  imageViewBottomConstraint = self->_imageViewBottomConstraint;
  [(NSLayoutConstraint *)imageViewBottomConstraint setConstant:-v9];
}

- (void)_updateTextAlignmentForHavingDescriptiveText:(BOOL)a3 titleTextAlignment:(int64_t)a4
{
  int64_t v4 = a4;
  double v6 = &OBJC_IVAR____UIAlertControllerActionView__label;
  if (a3)
  {
    if (a4 != 1)
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"_UIAlertControllerActionView.m" lineNumber:672 description:@"Customizing the title text alignment of an alert action is not supported with descriptive text"];
    }
    uint64_t v7 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:0];
    int64_t v4 = 2 * (v7 == 0);
    double v6 = &OBJC_IVAR____UIAlertControllerActionView__descriptiveLabel;
    [(UILabel *)self->_label setTextAlignment:2 * (v7 != 0)];
  }
  double v8 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  [v8 setTextAlignment:v4];
}

- (void)_updateLabelContainerConstraints
{
  id v3 = [(_UIAlertControllerActionView *)self visualStyle];
  [v3 contentHorizontalMargin];
  double v5 = v4;

  double v6 = [(_UIAlertControllerActionView *)self visualStyle];
  [v6 contentHorizontalMargin];
  double v8 = v7;

  double v9 = [(_UIAlertControllerActionView *)self visualStyle];
  [v9 actionImageMarginForAction];
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(UIAlertAction *)self->_action image];

  double v15 = (double *)MEMORY[0x1E4F1DB30];
  if (v14)
  {
    -[UIView systemLayoutSizeFittingSize:](self->_imageView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v5 = v13 + v5 + v16;
  }
  if ([(UIAlertAction *)self->_action _isChecked])
  {
    -[UIView systemLayoutSizeFittingSize:](self->_checkView, "systemLayoutSizeFittingSize:", *v15, v15[1]);
    double v8 = v11 + v8 + v17;
  }
  int64_t v18 = [(_UIAlertControllerActionView *)self _effectiveTitleTextAlignment];
  if (!v18)
  {
    double v22 = [(_UIAlertControllerActionView *)self labelContainerLeadingPinConstraint];
    [v22 setActive:1];

    id v23 = [(_UIAlertControllerActionView *)self labelContainerCenterXConstraint];
    [v23 setActive:0];

    uint64_t v24 = [(_UIAlertControllerActionView *)self labelContainerTrailingPinConstraint];
LABEL_13:
    double v21 = (void *)v24;
    goto LABEL_14;
  }
  if (v18 == 2)
  {
    v25 = [(_UIAlertControllerActionView *)self labelContainerTrailingPinConstraint];
    [v25 setActive:1];

    v26 = [(_UIAlertControllerActionView *)self labelContainerCenterXConstraint];
    [v26 setActive:0];

    uint64_t v24 = [(_UIAlertControllerActionView *)self labelContainerLeadingPinConstraint];
    goto LABEL_13;
  }
  if (v18 != 1) {
    goto LABEL_15;
  }
  if (v5 >= v8) {
    double v8 = v5;
  }
  v19 = [(_UIAlertControllerActionView *)self labelContainerCenterXConstraint];
  [v19 setActive:1];

  double v20 = [(_UIAlertControllerActionView *)self labelContainerLeadingPinConstraint];
  [v20 setActive:0];

  double v21 = [(_UIAlertControllerActionView *)self labelContainerTrailingPinConstraint];
  double v5 = v8;
LABEL_14:
  [v21 setActive:0];

LABEL_15:
  [(NSLayoutConstraint *)self->_labelContainerLeadingConstraint setConstant:v5];
  labelContainerTrailingConstraint = self->_labelContainerTrailingConstraint;
  [(NSLayoutConstraint *)labelContainerTrailingConstraint setConstant:-v8];
}

- (int64_t)_effectiveTitleTextAlignment
{
  int64_t result = [(UIAlertAction *)self->_action _titleTextAlignment];
  if (result == 4) {
    return 0;
  }
  return result;
}

- (void)_updateHavingDescriptiveLabelConstraints
{
  if (self->_hasDescriptiveText)
  {
    id v3 = [(_UIAlertControllerActionView *)self visualStyle];
    [v3 contentHorizontalMargin];
    double v5 = v4;

    [(NSLayoutConstraint *)self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint setConstant:-v5];
    [(NSLayoutConstraint *)self->_descriptiveLabelTrailingToContainerCenterConstraint setConstant:-(v5 * 0.5)];
    labelCenterLeadingConstraint = self->_labelCenterLeadingConstraint;
    [(NSLayoutConstraint *)labelCenterLeadingConstraint setConstant:v5 * 0.5];
  }
}

- (void)_updateContentViewControllerContainerViewConstraints
{
  contentViewControllerContainerView = self->_contentViewControllerContainerView;
  id v8 = [(_UIAlertControllerActionView *)self visualStyle];
  [v8 contentHorizontalMargin];
  double v5 = v4;
  double v6 = [(_UIAlertControllerActionView *)self visualStyle];
  [v6 contentHorizontalMargin];
  -[UIView setLayoutMargins:](contentViewControllerContainerView, "setLayoutMargins:", 0.0, v5, 0.0, v7);
}

- (void)setAction:(id)a3
{
  int64_t v18 = (UIAlertAction *)a3;
  [(_UIAlertControllerActionView *)self _removeContentViewControllerContainerViewSubviews];
  p_action = &self->_action;
  double v6 = [(UIAlertAction *)self->_action _representer];

  if (v6 == self) {
    [(UIAlertAction *)*p_action _setRepresenter:0];
  }
  double v7 = v18;
  if (*p_action != v18)
  {
    objc_storeStrong((id *)&self->_action, a3);
    double v7 = *p_action;
  }
  [(UIAlertAction *)v7 _setRepresenter:self];
  id v8 = *p_action;
  double v9 = [(UIAlertAction *)*p_action title];
  [(_UIAlertControllerActionView *)self _action:v8 changedToTitle:v9];

  [(_UIAlertControllerActionView *)self _updateDescriptiveText];
  [(_UIAlertControllerActionView *)self _updateImageView];
  [(_UIAlertControllerActionView *)self _action:*p_action changedToChecked:[(UIAlertAction *)*p_action _isChecked]];
  [(_UIAlertControllerActionView *)self _action:*p_action changedToBePreferred:[(UIAlertAction *)*p_action _isPreferred]];
  double v10 = *p_action;
  double v11 = [(UIAlertAction *)*p_action _imageTintColor];
  [(_UIAlertControllerActionView *)self _action:v10 updatedImageTintColor:v11];

  double v12 = *p_action;
  double v13 = [(UIAlertAction *)*p_action _titleTextColor];
  [(_UIAlertControllerActionView *)self _action:v12 updatedTitleTextColor:v13];

  uint64_t v14 = [(UIAlertAction *)*p_action _descriptiveText];
  BOOL v15 = [v14 length] != 0;

  [(_UIAlertControllerActionView *)self _prepareConstraintsForHavingDescriptiveText:v15];
  [(_UIAlertControllerActionView *)self _updateTextAlignmentForHavingDescriptiveText:v15 titleTextAlignment:[(UIAlertAction *)*p_action _titleTextAlignment]];
  [(_UIAlertControllerActionView *)self _updateLabelContainerConstraints];
  double v16 = [(_UIAlertControllerActionView *)self action];
  double v17 = [v16 _contentViewController];

  if (v17) {
    [(_UIAlertControllerActionView *)self _loadContentViewControllerView];
  }
  else {
    [(_UIAlertControllerActionView *)self _removeContentViewControllerContainerViewSubviews];
  }
}

- (void)setVisualStyle:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyle);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_visualStyle, obj);
    [(_UIAlertControllerActionView *)self _updateStyle];
  }
}

- (void)_updateStyle
{
  id v3 = [(_UIAlertControllerActionView *)self visualStyle];

  if (v3)
  {
    [(_UIAlertControllerActionView *)self _recomputeColors];
    [(_UIAlertControllerActionView *)self _updateLabelAttributes];
    [(_UIAlertControllerActionView *)self _updateMinimumHeightAndDesiredWidthConstraints];
    [(_UIAlertControllerActionView *)self _updateImageMargins];
    [(_UIAlertControllerActionView *)self _updateLabelContainerConstraints];
    [(_UIAlertControllerActionView *)self _updateHavingDescriptiveLabelConstraints];
    [(_UIAlertControllerActionView *)self _updateContentViewControllerContainerViewConstraints];
    [(_UIAlertControllerActionView *)self _updateCheckImageView];
  }
}

- (UIAlertAction)action
{
  return self->_action;
}

- (id)_interfaceActionViewState
{
  return +[UIInterfaceActionViewState viewStateForAlertControllerActionView:self];
}

- (BOOL)hasLayoutHeightConstraintsIdenticalToInterfaceActionCustomView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    double v7 = [(_UIAlertControllerActionView *)self action];
    id v8 = [v4 action];
    double v9 = [v7 _contentViewController];
    if (v9)
    {
      BOOL v6 = 0;
    }
    else
    {
      double v10 = [v8 _contentViewController];
      BOOL v6 = v10 == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hasActiveMinimumSizeConstraintsWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(NSLayoutConstraint *)self->_minimumHeightConstraint isActive];
  if (v6)
  {
    [(NSLayoutConstraint *)self->_minimumHeightConstraint constant];
    LOBYTE(v6) = v7 == height && width == 0.0;
  }
  return v6;
}

- (void)_action:(id)a3 changedToTitle:(id)a4
{
}

- (void)_action:(id)a3 changedToTitleTextAlignment:(int64_t)a4
{
  id v5 = [a3 _descriptiveText];
  [(_UIAlertControllerActionView *)self _updateTextAlignmentForHavingDescriptiveText:v5 != 0 titleTextAlignment:[(UIAlertAction *)self->_action _titleTextAlignment]];
}

- (void)_action:(id)a3 changedToEnabled:(BOOL)a4
{
  [(_UIAlertControllerActionView *)self _recomputeColors];
  id v5 = [MEMORY[0x1E4F1CAD0] set];
  [(UIResponder *)self touchesCancelled:v5 withEvent:0];
}

- (void)_action:(id)a3 updatedImageTintColor:(id)a4
{
}

- (NSLayoutConstraint)labelContainerCenterXConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 456, 1);
}

- (void)setLabelContainerCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelContainerLeadingPinConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 464, 1);
}

- (void)setLabelContainerLeadingPinConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelContainerTrailingPinConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 472, 1);
}

- (void)setLabelContainerTrailingPinConstraint:(id)a3
{
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (UIAlertControllerVisualStyle)visualStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualStyle);
  return (UIAlertControllerVisualStyle *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alertController);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_destroyWeak((id *)&self->_visualStyle);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBaselineOrCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_marginToImageConstraint, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_checkToMarginConstraint, 0);
  objc_storeStrong((id *)&self->_checkView, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelTrailingToContainerCenterConstraint, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelTrailingToLabelLeadingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_descriptiveLabelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_notHavingDescriptiveLabelConstraints, 0);
  objc_storeStrong((id *)&self->_havingDescriptiveLabelConstraints, 0);
  objc_storeStrong((id *)&self->_descriptiveLabel, 0);
  objc_storeStrong((id *)&self->_contentViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_contentViewControllerContainerView, 0);
  objc_storeStrong((id *)&self->_labelCenterLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_labelWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingPinConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingPinConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_labelContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_axLabelContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelContainerView, 0);
}

@end