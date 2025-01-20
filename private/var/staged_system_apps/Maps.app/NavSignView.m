@interface NavSignView
- (BOOL)hasMajorText;
- (BOOL)hasMinorText;
- (BOOL)hasOnlySingleLineText;
- (BOOL)hasText;
- (BOOL)highlightedLanesNotInVisibleRange;
- (BOOL)isDimmed;
- (BOOL)isManeuverSign;
- (BOOL)isMessageSign;
- (BOOL)isPrimaryDrivingSign;
- (BOOL)isSecondaryDrivingSign;
- (BOOL)usePersistentDisplay;
- (NSLayoutConstraint)bottomToMajorLabelBaselineConstraint;
- (NSLayoutConstraint)bottomToMinorLabelBaselineConstraint;
- (NSLayoutConstraint)majorLabelBaselineToTopConstraint;
- (NSLayoutConstraint)majorLabelLeadingMarginConstraint;
- (NSLayoutConstraint)majorLabelTrailingMarginConstraint;
- (NSLayoutConstraint)maxSignHeightConstraint;
- (NSLayoutConstraint)minSignHeightConstraint;
- (NSLayoutConstraint)minorLabelBaselineToTopConstraint;
- (NSLayoutConstraint)minorLabelLeadingMarginConstraint;
- (NSLayoutConstraint)minorLabelTrailingMarginConstraint;
- (NSLayoutConstraint)minorToMajorLabelBaselineConstraint;
- (NSLayoutConstraint)minorToMajorLabelLeadingAlignmentConstraint;
- (NSLayoutConstraint)minorToMajorLabelTrailingAlignmentConstraint;
- (NavContainerLayoutDelegate)containerLayoutDelegate;
- (NavManeuverSignView)maneuverSign;
- (NavMessageSignView)messageSign;
- (NavPrimaryDrivingSignView)primaryDrivingSign;
- (NavSecondaryDrivingSignView)secondaryDrivingSign;
- (NavSignLabel)majorLabel;
- (NavSignLabel)minorLabel;
- (NavSignLayoutDelegate)_defaultSignLayoutDelegate;
- (NavSignLayoutDelegate)signLayoutDelegate;
- (NavSignView)initWithCoder:(id)a3;
- (NavSignView)initWithFrame:(CGRect)a3;
- (NavSignViewAnalyticsDelegate)analyticsDelegate;
- (TextFirstLineCharacterRangeFinder)firstLineCharacterRangeFinder;
- (double)_calculateInterLabelConstraintConstant;
- (double)maxHeight;
- (id)accessibilityIdentifier;
- (void)_configureLabels;
- (void)_maps_commonInit;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateConstraints;
- (void)clearContent;
- (void)layoutSubviews;
- (void)refreshSign;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setContainerLayoutDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setMaxHeight:(double)a3;
- (void)setSignLayoutDelegate:(id)a3;
- (void)setSignLayoutDelegate:(id)a3 withAnimation:(id)a4;
- (void)setUsePersistentDisplay:(BOOL)a3;
- (void)updateTheme;
@end

@implementation NavSignView

- (NavSignView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignView;
  v3 = -[NavSignView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NavSignView *)v3 _maps_commonInit];
  }
  return v4;
}

- (NavSignView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignView;
  v3 = [(NavSignView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NavSignView *)v3 _maps_commonInit];
  }
  return v4;
}

- (void)_maps_commonInit
{
  v3 = [(NavSignView *)self _defaultSignLayoutDelegate];
  objc_storeWeak((id *)&self->_signLayoutDelegate, v3);

  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(NavSignView *)self setAccessibilityIdentifier:v5];

  [(NavSignView *)self _setupSubviews];
  [(NavSignView *)self _configureLabels];

  [(NavSignView *)self _setupConstraints];
}

- (id)accessibilityIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)clearContent
{
  [(NavSignView *)self setDimmed:0];
  v3 = [(NavSignView *)self majorLabel];
  [v3 setTextAlternatives:0];

  id v4 = [(NavSignView *)self minorLabel];
  [v4 setTextAlternatives:0];
}

- (void)refreshSign
{
  [(NavSignView *)self _updateLabelText];

  [(NavSignView *)self setNeedsLayout];
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    double v3 = 0.400000006;
    if (!a3) {
      double v3 = 1.0;
    }
    [(NavSignView *)self setAlpha:v3];
  }
}

- (BOOL)hasMajorText
{
  v2 = [(NavSignView *)self majorLabel];
  double v3 = [v2 textAlternatives];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)hasMinorText
{
  v2 = [(NavSignView *)self minorLabel];
  double v3 = [v2 textAlternatives];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)hasText
{
  if ([(NavSignView *)self hasMajorText]) {
    return 1;
  }

  return [(NavSignView *)self hasMinorText];
}

- (BOOL)hasOnlySingleLineText
{
  if (![(NavSignView *)self hasMajorText])
  {
    BOOL v4 = [(NavSignView *)self minorLabel];
LABEL_6:
    v5 = v4;
    BOOL v3 = [v4 lineCount] == (id)1;

    return v3;
  }
  if (![(NavSignView *)self hasMinorText])
  {
    BOOL v4 = [(NavSignView *)self majorLabel];
    goto LABEL_6;
  }
  return 0;
}

- (void)setSignLayoutDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[GroupAnimation animation];
  [v5 setAnimated:0];
  [(NavSignView *)self setSignLayoutDelegate:v4 withAnimation:v5];

  [v5 runWithDefaultOptions];
}

- (void)setSignLayoutDelegate:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signLayoutDelegate);

  if (WeakRetained != v6)
  {
    objc_storeWeak((id *)&self->_signLayoutDelegate, v6);
    [(NavSignView *)self _configureLabels];
    [(NavSignView *)self _updateLabelText];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100B27438;
    v9[3] = &unk_1012E5D08;
    v9[4] = self;
    [v7 addAnimations:v9 completion:0];
  }
}

- (double)maxHeight
{
  v2 = [(NavSignView *)self maxSignHeightConstraint];
  [v2 constant];
  double v4 = v3;

  return v4;
}

- (void)setMaxHeight:(double)a3
{
  id v4 = [(NavSignView *)self maxSignHeightConstraint];
  [v4 setConstant:a3];
}

- (void)setUsePersistentDisplay:(BOOL)a3
{
  if (self->_usePersistentDisplay != a3)
  {
    self->_usePersistentDisplay = a3;
    [(NavSignView *)self setNeedsLayout];
  }
}

- (void)updateTheme
{
  v9.receiver = self;
  v9.super_class = (Class)NavSignView;
  [(MapsThemeView *)&v9 updateTheme];
  double v3 = [(NavSignView *)self theme];
  id v4 = [v3 navSignMajorTextColor];
  id v5 = [(NavSignView *)self majorLabel];
  [v5 setTextColor:v4];

  id v6 = [(NavSignView *)self theme];
  id v7 = [v6 navSignMinorTextColor];
  v8 = [(NavSignView *)self minorLabel];
  [v8 setTextColor:v7];
}

- (void)layoutSubviews
{
  [(NavSignView *)self _updateConstraints];
  v36.receiver = self;
  v36.super_class = (Class)NavSignView;
  [(NavSignView *)&v36 layoutSubviews];
  double v3 = [(NavSignView *)self majorLabel];
  [v3 updateLabelIfNeeded];

  uint64_t v4 = [(NavSignView *)self minorLabel];
  [(id)v4 updateLabelIfNeeded];

  v35.receiver = self;
  v35.super_class = (Class)NavSignView;
  [(NavSignView *)&v35 layoutSubviews];
  id v5 = [(NavSignView *)self signLayoutDelegate];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    id v6 = [(NavSignView *)self subviews];
    id v7 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          v12 = [(NavSignView *)self signLayoutDelegate];
          v13 = v12;
          if (v12)
          {
            [v12 navSignView:self transformForSubview:v11];
          }
          else
          {
            long long v29 = 0u;
            long long v30 = 0u;
            long long v28 = 0u;
          }
          v27[0] = v28;
          v27[1] = v29;
          v27[2] = v30;
          [v11 setTransform:v27];
        }
        id v8 = [v6 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v8);
    }
  }
  else
  {
    long long v25 = 0uLL;
    long long v26 = 0uLL;
    long long v23 = 0uLL;
    long long v24 = 0uLL;
    id v6 = [(NavSignView *)self subviews];
    id v14 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v24;
      long long v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v21 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v19 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v6);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          v22[0] = v21;
          v22[1] = v20;
          v22[2] = v19;
          [v18 setTransform:v22, v19, v20, v21];
        }
        id v15 = [v6 countByEnumeratingWithState:&v23 objects:v37 count:16];
      }
      while (v15);
    }
  }
}

- (NavSignLayoutDelegate)_defaultSignLayoutDelegate
{
  return 0;
}

- (void)_setupSubviews
{
  double v3 = [NavSignLabel alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v7 = -[NavSignLabel initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  majorLabel = self->_majorLabel;
  self->_majorLabel = v7;

  uint64_t v9 = [(NavSignView *)self majorLabel];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [(NavSignView *)self majorLabel];
  LODWORD(v11) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v11];

  v12 = [(NavSignView *)self majorLabel];
  LODWORD(v13) = 1148846080;
  [v12 setContentHuggingPriority:1 forAxis:v13];

  id v14 = [(NavSignView *)self majorLabel];
  [v14 setDelegate:self];

  [(NavSignLabel *)self->_majorLabel setAccessibilityIdentifier:@"MajorLabel"];
  id v15 = [(NavSignView *)self majorLabel];
  [(NavSignView *)self addSubview:v15];

  uint64_t v16 = -[NavSignLabel initWithFrame:]([NavSignLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  minorLabel = self->_minorLabel;
  self->_minorLabel = v16;

  v18 = [(NavSignView *)self minorLabel];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  long long v19 = [(NavSignView *)self minorLabel];
  LODWORD(v20) = 1148829696;
  [v19 setContentCompressionResistancePriority:1 forAxis:v20];

  long long v21 = [(NavSignView *)self minorLabel];
  LODWORD(v22) = 1148846080;
  [v21 setContentHuggingPriority:1 forAxis:v22];

  long long v23 = [(NavSignView *)self minorLabel];
  [v23 setLineBreakMode:4];

  long long v24 = [(NavSignView *)self minorLabel];
  [v24 setDelegate:self];

  [(NavSignLabel *)self->_minorLabel setAccessibilityIdentifier:@"MinorLabel"];
  id v25 = [(NavSignView *)self minorLabel];
  [(NavSignView *)self addSubview:v25];
}

- (void)_setupConstraints
{
  double v3 = _NSDictionaryOfVariableBindings(@"_majorLabel, _minorLabel", self->_majorLabel, self->_minorLabel, 0);
  uint64_t v4 = +[NSMutableArray array];
  id v5 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=0)-[_majorLabel]-(>=0)-[_minorLabel]-(>=0)-|", 0, 0, v3);
  [v4 addObjectsFromArray:v5];

  id v6 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(>=0)-[_majorLabel]-(>=0)-|", 0, 0, v3);
  [v4 addObjectsFromArray:v6];

  id v7 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(>=0)-[_minorLabel]-(>=0)-|", 0, 0, v3);
  [v4 addObjectsFromArray:v7];

  id v8 = [(NavSignView *)self heightAnchor];
  uint64_t v9 = [v8 constraintGreaterThanOrEqualToConstant:0.0];
  minSignHeightConstraint = self->_minSignHeightConstraint;
  self->_minSignHeightConstraint = v9;

  double v11 = [(NavSignView *)self heightAnchor];
  [(NavSignView *)self _maps_maxConstraintConstantForAxis:0];
  [v11 constraintLessThanOrEqualToConstant:];
  v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  maxSignHeightConstraint = self->_maxSignHeightConstraint;
  self->_maxSignHeightConstraint = v12;

  id v14 = [(NavSignView *)self minSignHeightConstraint];
  v80[0] = v14;
  id v15 = [(NavSignView *)self maxSignHeightConstraint];
  v80[1] = v15;
  uint64_t v16 = +[NSArray arrayWithObjects:v80 count:2];
  [v4 addObjectsFromArray:v16];

  +[NSLayoutConstraint activateConstraints:v4];
  v17 = [(NavSignView *)self majorLabel];
  v18 = [v17 leadingAnchor];
  long long v19 = [(NavSignView *)self leadingAnchor];
  double v20 = [v18 constraintEqualToAnchor:v19];
  majorLabelLeadingMarginConstraint = self->_majorLabelLeadingMarginConstraint;
  self->_majorLabelLeadingMarginConstraint = v20;

  double v22 = [(NavSignView *)self trailingAnchor];
  long long v23 = [(NavSignView *)self majorLabel];
  long long v24 = [v23 trailingAnchor];
  id v25 = [v22 constraintEqualToAnchor:v24];
  majorLabelTrailingMarginConstraint = self->_majorLabelTrailingMarginConstraint;
  self->_majorLabelTrailingMarginConstraint = v25;

  v27 = [(NavSignView *)self minorLabel];
  long long v28 = [v27 leadingAnchor];
  long long v29 = [(NavSignView *)self leadingAnchor];
  long long v30 = [v28 constraintEqualToAnchor:v29];
  minorLabelLeadingMarginConstraint = self->_minorLabelLeadingMarginConstraint;
  self->_minorLabelLeadingMarginConstraint = v30;

  long long v32 = [(NavSignView *)self trailingAnchor];
  long long v33 = [(NavSignView *)self minorLabel];
  long long v34 = [v33 trailingAnchor];
  objc_super v35 = [v32 constraintEqualToAnchor:v34];
  minorLabelTrailingMarginConstraint = self->_minorLabelTrailingMarginConstraint;
  self->_minorLabelTrailingMarginConstraint = v35;

  v37 = [(NavSignView *)self minorLabel];
  v38 = [v37 leadingAnchor];
  v39 = [(NavSignView *)self majorLabel];
  v40 = [v39 leadingAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  minorToMajorLabelLeadingAlignmentConstraint = self->_minorToMajorLabelLeadingAlignmentConstraint;
  self->_minorToMajorLabelLeadingAlignmentConstraint = v41;

  v43 = [(NavSignView *)self minorLabel];
  v44 = [v43 trailingAnchor];
  v45 = [(NavSignView *)self majorLabel];
  v46 = [v45 trailingAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  minorToMajorLabelTrailingAlignmentConstraint = self->_minorToMajorLabelTrailingAlignmentConstraint;
  self->_minorToMajorLabelTrailingAlignmentConstraint = v47;

  v49 = [(NavSignView *)self majorLabel];
  v50 = [v49 firstBaselineAnchor];
  v51 = [(NavSignView *)self topAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  majorLabelBaselineToTopConstraint = self->_majorLabelBaselineToTopConstraint;
  self->_majorLabelBaselineToTopConstraint = v52;

  LODWORD(v54) = 1148829696;
  [(NSLayoutConstraint *)self->_majorLabelBaselineToTopConstraint setPriority:v54];
  v55 = [(NavSignView *)self minorLabel];
  v56 = [v55 firstBaselineAnchor];
  v57 = [(NavSignView *)self topAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  minorLabelBaselineToTopConstraint = self->_minorLabelBaselineToTopConstraint;
  self->_minorLabelBaselineToTopConstraint = v58;

  LODWORD(v60) = 1148829696;
  [(NSLayoutConstraint *)self->_minorLabelBaselineToTopConstraint setPriority:v60];
  v61 = [(NavSignView *)self minorLabel];
  v62 = [v61 firstBaselineAnchor];
  v63 = [(NavSignView *)self majorLabel];
  v64 = [v63 lastBaselineAnchor];
  v65 = [v62 constraintEqualToAnchor:v64];
  minorToMajorLabelBaselineConstraint = self->_minorToMajorLabelBaselineConstraint;
  self->_minorToMajorLabelBaselineConstraint = v65;

  LODWORD(v67) = 1148813312;
  [(NSLayoutConstraint *)self->_minorToMajorLabelBaselineConstraint setPriority:v67];
  v68 = [(NavSignView *)self bottomAnchor];
  v69 = [(NavSignView *)self majorLabel];
  v70 = [v69 lastBaselineAnchor];
  v71 = [v68 constraintEqualToAnchor:v70];
  bottomToMajorLabelBaselineConstraint = self->_bottomToMajorLabelBaselineConstraint;
  self->_bottomToMajorLabelBaselineConstraint = v71;

  LODWORD(v73) = 1148829696;
  [(NSLayoutConstraint *)self->_bottomToMajorLabelBaselineConstraint setPriority:v73];
  v74 = [(NavSignView *)self bottomAnchor];
  v75 = [(NavSignView *)self minorLabel];
  v76 = [v75 lastBaselineAnchor];
  v77 = [v74 constraintEqualToAnchor:v76];
  bottomToMinorLabelBaselineConstraint = self->_bottomToMinorLabelBaselineConstraint;
  self->_bottomToMinorLabelBaselineConstraint = v77;

  LODWORD(v79) = 1148829696;
  [(NSLayoutConstraint *)self->_bottomToMinorLabelBaselineConstraint setPriority:v79];
}

- (void)_updateConstraints
{
  BOOL v3 = [(NavSignView *)self hasMajorText];
  BOOL v4 = [(NavSignView *)self hasMinorText];
  id v5 = [(NavSignView *)self majorLabel];
  [v5 setHidden:v3 ^ 1];

  id v6 = [(NavSignView *)self minorLabel];
  [v6 setHidden:v4 ^ 1];

  [(NavSignView *)self _configureLabels];
  id v7 = [(NavSignView *)self signLayoutDelegate];
  [v7 minimumHeightForSign:self];
  double v9 = v8;

  v10 = [(NavSignView *)self minSignHeightConstraint];
  [v10 setConstant:v9];

  double v11 = [(NavSignView *)self signLayoutDelegate];
  [v11 navSignView:self textLeadingMarginForMajorText:1];
  double v13 = v12;

  id v14 = [(NavSignView *)self signLayoutDelegate];
  [v14 navSignView:self textLeadingMarginForMajorText:0];
  double v16 = v15;

  v17 = [(NavSignView *)self signLayoutDelegate];
  [v17 navSignView:self textTrailingMarginForMajorText:1];
  double v19 = v18;

  double v20 = [(NavSignView *)self signLayoutDelegate];
  [v20 navSignView:self textTrailingMarginForMajorText:0];
  double v22 = v21;

  long long v23 = [(NavSignView *)self majorLabelLeadingMarginConstraint];
  [v23 setConstant:v13];

  long long v24 = [(NavSignView *)self minorLabelLeadingMarginConstraint];
  [v24 setConstant:v16];

  id v25 = [(NavSignView *)self majorLabelTrailingMarginConstraint];
  [v25 setConstant:v19];

  long long v26 = [(NavSignView *)self minorLabelTrailingMarginConstraint];
  [v26 setConstant:v22];

  v27 = [(NavSignView *)self signLayoutDelegate];
  [v27 textTopMarginForSign:self];
  double v29 = round(v28);

  long long v30 = [(NavSignView *)self majorLabelBaselineToTopConstraint];
  [v30 setConstant:v29];

  long long v31 = [(NavSignView *)self minorLabelBaselineToTopConstraint];
  [v31 setConstant:v29];

  long long v32 = [(NavSignView *)self signLayoutDelegate];
  [v32 textBottomMarginForSign:self];
  double v34 = round(v33);

  objc_super v35 = [(NavSignView *)self bottomToMajorLabelBaselineConstraint];
  [v35 setConstant:v34];

  objc_super v36 = [(NavSignView *)self bottomToMinorLabelBaselineConstraint];
  [v36 setConstant:v34];

  [(NavSignView *)self _calculateInterLabelConstraintConstant];
  double v38 = v37;
  v39 = [(NavSignView *)self minorToMajorLabelBaselineConstraint];
  [v39 setConstant:v38];

  v63 = objc_alloc_init(LayoutConstraintActivationHelper);
  v40 = [(NavSignView *)self signLayoutDelegate];
  id v41 = [v40 navSignView:self shouldAlignToLeadingForMajorText:1];

  v42 = [(NavSignView *)self signLayoutDelegate];
  id v43 = [v42 navSignView:self shouldAlignToLeadingForMajorText:0];

  v44 = [(NavSignView *)self signLayoutDelegate];
  id v45 = [v44 navSignView:self shouldAlignToTrailingForMajorText:1];

  v46 = [(NavSignView *)self signLayoutDelegate];
  id v47 = [v46 navSignView:self shouldAlignToTrailingForMajorText:0];

  v48 = [(NavSignView *)self signLayoutDelegate];
  id v49 = [v48 shouldAlignMinorToMajorLabelLeadingForSign:self];

  v50 = [(NavSignView *)self signLayoutDelegate];
  id v51 = [v50 shouldAlignMinorToMajorLabelTrailingForSign:self];

  v52 = [(NavSignView *)self majorLabelLeadingMarginConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v52 activate:v41];

  v53 = [(NavSignView *)self minorLabelLeadingMarginConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v53 activate:v43];

  double v54 = [(NavSignView *)self majorLabelTrailingMarginConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v54 activate:v45];

  v55 = [(NavSignView *)self minorLabelTrailingMarginConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v55 activate:v47];

  v56 = [(NavSignView *)self minorToMajorLabelLeadingAlignmentConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v56 activate:v49];

  v57 = [(NavSignView *)self minorToMajorLabelTrailingAlignmentConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v57 activate:v51];

  v58 = [(NavSignView *)self majorLabelBaselineToTopConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v58 activate:v3];

  v59 = [(NavSignView *)self minorLabelBaselineToTopConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v59 activate:!v3 & v4];

  double v60 = [(NavSignView *)self minorToMajorLabelBaselineConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v60 activate:v4 & v3];

  v61 = [(NavSignView *)self bottomToMinorLabelBaselineConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v61 activate:v4];

  v62 = [(NavSignView *)self bottomToMajorLabelBaselineConstraint];
  [(LayoutConstraintActivationHelper *)v63 scheduleConstraint:v62 activate:!v4 & v3];

  [(LayoutConstraintActivationHelper *)v63 commitPendingConstraints];
}

- (TextFirstLineCharacterRangeFinder)firstLineCharacterRangeFinder
{
  firstLineCharacterRangeFinder = self->_firstLineCharacterRangeFinder;
  if (!firstLineCharacterRangeFinder)
  {
    BOOL v4 = objc_alloc_init(TextFirstLineCharacterRangeFinder);
    id v5 = self->_firstLineCharacterRangeFinder;
    self->_firstLineCharacterRangeFinder = v4;

    firstLineCharacterRangeFinder = self->_firstLineCharacterRangeFinder;
  }

  return firstLineCharacterRangeFinder;
}

- (void)_configureLabels
{
  BOOL v3 = [(NavSignView *)self signLayoutDelegate];

  if (v3)
  {
    id v29 = [(NavSignView *)self majorLabel];
    BOOL v4 = [(NavSignView *)self signLayoutDelegate];
    [v29 setTextAlignment:[v4 navSignView:textAlignmentForMajorText:self 1]];

    id v5 = [(NavSignView *)self signLayoutDelegate];
    id v6 = [v5 navSignView:self preferredFontForMajorText:1];
    id v7 = [v6 _mapkit_fontByAddingFeaturesForTabularFigures];
    [v29 setPreferredFont:v7];

    double v8 = [(NavSignView *)self signLayoutDelegate];
    double v9 = [v8 navSignView:self alternateFontForMajorText:1];
    v10 = [v9 _mapkit_fontByAddingFeaturesForTabularFigures];
    [v29 setAlternateFont:v10];

    double v11 = [(NavSignView *)self signLayoutDelegate];
    [v11 navSignView:self alternateFontLineSpacingForMajorText:1];
    [v29 setAlternateFontLineSpacing:];

    double v12 = [(NavSignView *)self signLayoutDelegate];
    [v29 setMaxNumberOfLinesWithPreferredFont:[v12 navSignView:maxNumberOfLinesWithPreferredFontForMajorText:self]];

    double v13 = [(NavSignView *)self signLayoutDelegate];
    [v29 setMaxNumberOfLinesWithLongestAlternative:[v13 navSignView:maxNumberOfLinesWithLongestAlternativeForMajorText:self]];

    id v14 = [(NavSignView *)self signLayoutDelegate];
    [v29 setMaxNumberOfTotalLines:[v14 navSignView:maxNumberOfTotalLinesForMajorText:self, 1]];

    double v15 = [(NavSignView *)self signLayoutDelegate];
    [v29 setInlineShieldSize:[v15 navSignView:inlineShieldSizeForMajorText:self, 1]];

    double v16 = [(NavSignView *)self minorLabel];
    v17 = [(NavSignView *)self signLayoutDelegate];
    [v16 setTextAlignment:[v17 navSignView:textAlignmentForMajorText:self]];

    double v18 = [(NavSignView *)self signLayoutDelegate];
    double v19 = [v18 navSignView:self preferredFontForMajorText:0];
    double v20 = [v19 _mapkit_fontByAddingFeaturesForTabularFigures];
    [v16 setPreferredFont:v20];

    double v21 = [(NavSignView *)self signLayoutDelegate];
    double v22 = [v21 navSignView:self alternateFontForMajorText:0];
    long long v23 = [v22 _mapkit_fontByAddingFeaturesForTabularFigures];
    [v16 setAlternateFont:v23];

    long long v24 = [(NavSignView *)self signLayoutDelegate];
    [v24 navSignView:self alternateFontLineSpacingForMajorText:0];
    [v16 setAlternateFontLineSpacing:];

    id v25 = [(NavSignView *)self signLayoutDelegate];
    [v16 setMaxNumberOfLinesWithPreferredFont:[v25 navSignView:maxNumberOfLinesWithPreferredFontForMajorText:self]];

    long long v26 = [(NavSignView *)self signLayoutDelegate];
    [v16 setMaxNumberOfLinesWithLongestAlternative:[v26 navSignView:maxNumberOfLinesWithLongestAlternativeForMajorText:self]];

    v27 = [(NavSignView *)self signLayoutDelegate];
    [v16 setMaxNumberOfTotalLines:[v27 navSignView:maxNumberOfTotalLinesForMajorText:self]];

    double v28 = [(NavSignView *)self signLayoutDelegate];
    [v16 setInlineShieldSize:[v28 navSignView:inlineShieldSizeForMajorText:self]];
  }
}

- (double)_calculateInterLabelConstraintConstant
{
  BOOL v3 = [(NavSignView *)self signLayoutDelegate];
  [v3 baselineMarginBetweenLabelsForSign:self];
  double v5 = v4;

  id v6 = [(NavSignView *)self minorLabel];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(NavSignView *)self firstLineCharacterRangeFinder];
  [v11 setTextSize:v8, v10];

  double v12 = [(NavSignView *)self minorLabel];
  double v13 = [v12 attributedText];

  id v14 = [(NavSignView *)self firstLineCharacterRangeFinder];
  id v15 = [v14 firstLineCharacterRangeInText:v13];
  uint64_t v17 = v16;

  uint64_t v33 = 0;
  double v34 = &v33;
  uint64_t v35 = 0x3032000000;
  objc_super v36 = sub_100104390;
  double v37 = sub_100104A38;
  id v38 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100B28DE4;
  v32[3] = &unk_101312FC8;
  v32[4] = &v33;
  [v13 enumerateAttribute:NSAttachmentAttributeName inRange:v15 options:v17 usingBlock:v32];
  double v18 = [(id)v34[5] image];

  if (v18)
  {
    double v19 = [(NavSignView *)self minorLabel];
    if ([v19 shouldUseAlternateFont])
    {
      double v20 = [(NavSignView *)self minorLabel];
      [v20 alternateFont];
    }
    else
    {
      double v20 = [(NavSignView *)self minorLabel];
      [v20 preferredFont];
    double v21 = };

    double v22 = [(id)v34[5] image];
    [v22 size];
    double v24 = v23;
    [v21 lineHeight];
    double v26 = v25;

    if (v24 > v26)
    {
      v27 = [(NavSignView *)self signLayoutDelegate];
      [v27 labelBaselineToInlineShieldTopForSign:self];

      double v28 = [(id)v34[5] image];
      [v28 size];
      [(id)v34[5] bounds];
      id v29 = self;
      UIRoundToViewScale();
      double v5 = v30;
    }
  }
  _Block_object_dispose(&v33, 8);

  return v5;
}

- (NavContainerLayoutDelegate)containerLayoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerLayoutDelegate);

  return (NavContainerLayoutDelegate *)WeakRetained;
}

- (void)setContainerLayoutDelegate:(id)a3
{
}

- (NavSignLayoutDelegate)signLayoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signLayoutDelegate);

  return (NavSignLayoutDelegate *)WeakRetained;
}

- (NavSignViewAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (NavSignViewAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (NavSignLabel)majorLabel
{
  return self->_majorLabel;
}

- (NavSignLabel)minorLabel
{
  return self->_minorLabel;
}

- (BOOL)usePersistentDisplay
{
  return self->_usePersistentDisplay;
}

- (BOOL)highlightedLanesNotInVisibleRange
{
  return self->_highlightedLanesNotInVisibleRange;
}

- (NSLayoutConstraint)minSignHeightConstraint
{
  return self->_minSignHeightConstraint;
}

- (NSLayoutConstraint)maxSignHeightConstraint
{
  return self->_maxSignHeightConstraint;
}

- (NSLayoutConstraint)majorLabelLeadingMarginConstraint
{
  return self->_majorLabelLeadingMarginConstraint;
}

- (NSLayoutConstraint)majorLabelTrailingMarginConstraint
{
  return self->_majorLabelTrailingMarginConstraint;
}

- (NSLayoutConstraint)minorLabelLeadingMarginConstraint
{
  return self->_minorLabelLeadingMarginConstraint;
}

- (NSLayoutConstraint)minorLabelTrailingMarginConstraint
{
  return self->_minorLabelTrailingMarginConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelLeadingAlignmentConstraint
{
  return self->_minorToMajorLabelLeadingAlignmentConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelTrailingAlignmentConstraint
{
  return self->_minorToMajorLabelTrailingAlignmentConstraint;
}

- (NSLayoutConstraint)majorLabelBaselineToTopConstraint
{
  return self->_majorLabelBaselineToTopConstraint;
}

- (NSLayoutConstraint)minorLabelBaselineToTopConstraint
{
  return self->_minorLabelBaselineToTopConstraint;
}

- (NSLayoutConstraint)minorToMajorLabelBaselineConstraint
{
  return self->_minorToMajorLabelBaselineConstraint;
}

- (NSLayoutConstraint)bottomToMajorLabelBaselineConstraint
{
  return self->_bottomToMajorLabelBaselineConstraint;
}

- (NSLayoutConstraint)bottomToMinorLabelBaselineConstraint
{
  return self->_bottomToMinorLabelBaselineConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomToMinorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelTrailingAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_minorToMajorLabelLeadingAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelTrailingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelLeadingMarginConstraint, 0);
  objc_storeStrong((id *)&self->_maxSignHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minSignHeightConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabel, 0);
  objc_storeStrong((id *)&self->_majorLabel, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_signLayoutDelegate);
  objc_destroyWeak((id *)&self->_containerLayoutDelegate);

  objc_storeStrong((id *)&self->_firstLineCharacterRangeFinder, 0);
}

- (NavMessageSignView)messageSign
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (NavManeuverSignView)maneuverSign
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (NavPrimaryDrivingSignView)primaryDrivingSign
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (NavSecondaryDrivingSignView)secondaryDrivingSign
{
  v2 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = v2;
  }
  else {
    BOOL v3 = 0;
  }
  double v4 = v3;

  return v4;
}

- (BOOL)isMessageSign
{
  v2 = [(NavSignView *)self messageSign];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isManeuverSign
{
  v2 = [(NavSignView *)self maneuverSign];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isPrimaryDrivingSign
{
  v2 = [(NavSignView *)self primaryDrivingSign];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isSecondaryDrivingSign
{
  v2 = [(NavSignView *)self secondaryDrivingSign];
  BOOL v3 = v2 != 0;

  return v3;
}

@end