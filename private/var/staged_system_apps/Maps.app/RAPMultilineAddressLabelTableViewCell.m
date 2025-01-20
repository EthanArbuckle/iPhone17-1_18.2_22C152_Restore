@interface RAPMultilineAddressLabelTableViewCell
- (BOOL)canEditFreeformAddress;
- (BOOL)isEditableAndTappable;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (NSString)freeformAddress;
- (RAPAddressDelegate)delegate;
- (RAPAddressLayoutOptions)layoutOptions;
- (RAPMultilineAddressLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITableView)parentTableView;
- (int)analyticTarget;
- (void)_addressChanged;
- (void)_clearSubviews;
- (void)_contentSizeDidChange;
- (void)_freeformAddressFieldTapped:(id)a3;
- (void)_recalculateConstraints;
- (void)_scrollTextViewSelectedRangeVisible:(id)a3;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)_updateFreeformCellHeightIfNeeded;
- (void)_updateViews;
- (void)initViews;
- (void)setAnalyticTarget:(int)a3;
- (void)setCanEditFreeformAddress:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditableAndTappable:(BOOL)a3;
- (void)setFreeformAddress:(id)a3;
- (void)setLayoutOptions:(id)a3;
- (void)setParentTableView:(id)a3;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation RAPMultilineAddressLabelTableViewCell

- (RAPMultilineAddressLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)RAPMultilineAddressLabelTableViewCell;
  v4 = [(RAPMultilineAddressLabelTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RAPMultilineAddressLabelTableViewCell *)v4 initViews];
    [(RAPMultilineAddressLabelTableViewCell *)v5 _updateFonts];
    [(RAPMultilineAddressLabelTableViewCell *)v5 setSelectionStyle:0];
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v5 selector:"_contentSizeDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v5->_editableAndTappable = 0;
  }
  return v5;
}

- (void)initViews
{
  v3 = -[TextViewWithPlaceholderText initWithFrame:]([TextViewWithPlaceholderText alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  freeformAddressTextView = self->_freeformAddressTextView;
  self->_freeformAddressTextView = v3;

  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Add Street or Address [Report an Issue]" value:@"localized string not found" table:0];
  v7 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView placeholderLabel];
  [v7 setText:v6];

  [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setScrollEnabled:0];
  objc_super v8 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView textContainer];
  [v8 setMaximumNumberOfLines:8];

  v9 = [(RAPMultilineAddressLabelTableViewCell *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10 == (id)5) {
    +[UIColor systemGray6Color];
  }
  else {
  v11 = +[UIColor clearColor];
  }
  [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setBackgroundColor:v11];

  [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setDelegate:self];
  v12 = objc_alloc_init(RAPSeparatorBar);
  topHorizontalHairlineView = self->_topHorizontalHairlineView;
  self->_topHorizontalHairlineView = v12;

  v14 = (UITextField *)objc_alloc_init((Class)UITextField);
  buildingTextField = self->_buildingTextField;
  self->_buildingTextField = v14;

  v16 = objc_alloc_init(RAPSeparatorBar);
  middleVerticalHairlineView = self->_middleVerticalHairlineView;
  self->_middleVerticalHairlineView = v16;

  v18 = (UITextField *)objc_alloc_init((Class)UITextField);
  floorTextField = self->_floorTextField;
  self->_floorTextField = v18;

  v20 = objc_alloc_init(RAPSeparatorBar);
  bottomHorizontalHairlineView = self->_bottomHorizontalHairlineView;
  self->_bottomHorizontalHairlineView = v20;

  v22 = (UITextField *)objc_alloc_init((Class)UITextField);
  unitTextField = self->_unitTextField;
  self->_unitTextField = v22;

  [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RAPSeparatorBar *)self->_topHorizontalHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_buildingTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RAPSeparatorBar *)self->_middleVerticalHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_floorTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(RAPSeparatorBar *)self->_bottomHorizontalHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_unitTextField setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UITextField *)self->_buildingTextField setTextAlignment:0];
  [(UITextField *)self->_floorTextField setTextAlignment:0];
  [(UITextField *)self->_unitTextField setTextAlignment:0];
  [(UITextField *)self->_buildingTextField setClearButtonMode:1];
  [(UITextField *)self->_floorTextField setClearButtonMode:1];
  [(UITextField *)self->_unitTextField setClearButtonMode:1];
  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"Building [Report an Issue]" value:@"localized string not found" table:0];
  [(UITextField *)self->_buildingTextField setPlaceholder:v25];

  v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"Floor [Report an Issue]" value:@"localized string not found" table:0];
  [(UITextField *)self->_floorTextField setPlaceholder:v27];

  v28 = +[NSBundle mainBundle];
  v29 = [v28 localizedStringForKey:@"Unit [Report an Issue]" value:@"localized string not found" table:0];
  [(UITextField *)self->_unitTextField setPlaceholder:v29];

  [(UITextField *)self->_floorTextField addTarget:self action:"_addressChanged" forControlEvents:0x20000];
  [(UITextField *)self->_unitTextField addTarget:self action:"_addressChanged" forControlEvents:0x20000];
  [(UITextField *)self->_buildingTextField addTarget:self action:"_addressChanged" forControlEvents:0x20000];
  v30 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v30;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [(RAPMultilineAddressLabelTableViewCell *)self contentView];
  [v32 addSubview:self->_containerView];

  v53 = [(UIView *)self->_containerView leadingAnchor];
  v54 = [(RAPMultilineAddressLabelTableViewCell *)self contentView];
  v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:0.0];
  v55[0] = v51;
  v49 = [(UIView *)self->_containerView trailingAnchor];
  v50 = [(RAPMultilineAddressLabelTableViewCell *)self contentView];
  v48 = [v50 trailingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:-0.0];
  v55[1] = v47;
  v46 = [(UIView *)self->_containerView topAnchor];
  v33 = [(RAPMultilineAddressLabelTableViewCell *)self contentView];
  v34 = [v33 topAnchor];
  v35 = [v46 constraintEqualToAnchor:v34 constant:0.0];
  v55[2] = v35;
  v36 = [(UIView *)self->_containerView bottomAnchor];
  v37 = [(RAPMultilineAddressLabelTableViewCell *)self contentView];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:-0.0];
  v55[3] = v39;
  v40 = +[NSArray arrayWithObjects:v55 count:4];
  +[NSLayoutConstraint activateConstraints:v40];

  v41 = [(RAPMultilineAddressLabelTableViewCell *)self traitCollection];
  id v42 = [v41 userInterfaceIdiom];

  if (v42 == (id)5)
  {
    v43 = +[UIColor systemBackgroundColor];
    [(RAPMultilineAddressLabelTableViewCell *)self setBackgroundColor:v43];

    v44 = +[UIColor systemGray6Color];
    [(UIView *)self->_containerView setBackgroundColor:v44];

    v45 = [(UIView *)self->_containerView layer];
    [v45 setCornerRadius:7.5];

    [(UIView *)self->_containerView setClipsToBounds:1];
  }
}

- (void)_updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(NSMutableArray *)self->_topToFirstBaselineConstraints removeAllObjects];
  [(NSMutableArray *)self->_lastBaselineToBottomConstraints removeAllObjects];
  v3 = self->_containerView;
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  constraints = self->_constraints;
  self->_constraints = v4;

  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  topToFirstBaselineConstraints = self->_topToFirstBaselineConstraints;
  self->_topToFirstBaselineConstraints = v6;

  objc_super v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  lastBaselineToBottomConstraints = self->_lastBaselineToBottomConstraints;
  self->_lastBaselineToBottomConstraints = v8;

  id v10 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView topAnchor];
  v11 = [(UIView *)v3 topAnchor];
  v12 = +[UIFont system17];
  [v12 _mapkit_scaledValueForValue:10.0];
  [v10 constraintEqualToAnchor:v11];
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  freeformTopConstraint = self->_freeformTopConstraint;
  self->_freeformTopConstraint = v13;

  v15 = self->_constraints;
  v16 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView leadingAnchor];
  v17 = [(UIView *)v3 leadingAnchor];
  v18 = [v16 constraintEqualToAnchor:v17 constant:10.0];
  v106[0] = v18;
  v19 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView trailingAnchor];
  v100 = v3;
  v20 = [(UIView *)v3 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:-8.0];
  v22 = self->_freeformTopConstraint;
  v106[1] = v21;
  v106[2] = v22;
  v23 = +[NSArray arrayWithObjects:v106 count:3];
  [(NSMutableArray *)v15 addObjectsFromArray:v23];

  id v24 = objc_alloc_init((Class)NSMutableArray);
  id v25 = [(NSMutableArray *)self->_detailViews count];
  v26 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView bottomAnchor];
  if (v25)
  {
    v27 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView topAnchor];
    v28 = +[UIFont system17];
    [v28 _mapkit_scaledValueForValue:10.0];
    v30 = [v26 constraintEqualToAnchor:v27 constant:-v29];
    freeformBottomConstraint = self->_freeformBottomConstraint;
    self->_freeformBottomConstraint = v30;

    [(NSMutableArray *)self->_constraints addObject:self->_freeformBottomConstraint];
    v32 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView heightAnchor];
    +[RAPSeparatorBar thickness];
    v33 = [v32 constraintEqualToConstant:];
    [v24 addObject:v33];

    v34 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView leadingAnchor];
    v35 = [(UIView *)v100 leadingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35 constant:8.0];
    [v24 addObject:v36];

    v37 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView trailingAnchor];
    v38 = [(UIView *)v100 trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:-8.0];
    [v24 addObject:v39];

    v40 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView bottomAnchor];
    v41 = &OBJC_IVAR___UGCPOIEnrichmentCoordinator__submissionStatusDelegate;
    if ([(RAPAddressLayoutOptions *)self->_layoutOptions numberOfEnabledOptions] < 3) {
      [(UIView *)v100 bottomAnchor];
    }
    else {
    v99 = [(RAPSeparatorBar *)self->_bottomHorizontalHairlineView topAnchor];
    }
    v46 = +[UIFont system17];
    [v46 _mapkit_scaledValueForValue:33.0];
    double v48 = v47;

    v49 = +[UIFont system17];
    [v49 _mapkit_scaledValueForValue:-22.0];
    double v51 = v50;

    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    obj = self->_detailViews;
    id v98 = [(NSMutableArray *)obj countByEnumeratingWithState:&v101 objects:v105 count:16];
    id v52 = 0;
    if (!v98)
    {
      v96 = 0;
      goto LABEL_33;
    }
    v96 = 0;
    uint64_t v97 = *(void *)v102;
    while (1)
    {
      v53 = 0;
      v54 = v52;
      do
      {
        if (*(void *)v102 != v97) {
          objc_enumerationMutation(obj);
        }
        v55 = *(void **)(*((void *)&v101 + 1) + 8 * (void)v53);
        v56 = [(NSMutableArray *)self->_detailViews firstObject];

        if (v55 == v56)
        {
          v57 = [v55 leadingAnchor];
          v58 = [(UIView *)v100 leadingAnchor];
          v59 = [v57 constraintEqualToAnchor:v58 constant:10.0];
          [v24 addObject:v59];

          v41 = &OBJC_IVAR___UGCPOIEnrichmentCoordinator__submissionStatusDelegate;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v55 == *(void **)((char *)&self->super.super.super.super.isa + v41[936]))
          {
            v74 = [v55 heightAnchor];
            +[RAPSeparatorBar thickness];
            v75 = [v74 constraintEqualToConstant:];
            [v24 addObject:v75];

            v76 = [v55 leadingAnchor];
            v77 = [(UIView *)v100 leadingAnchor];
            v78 = [v76 constraintEqualToAnchor:v77 constant:8.0];
            [v24 addObject:v78];

            v67 = [v55 trailingAnchor];
            v68 = [(UIView *)v100 trailingAnchor];
            v79 = [v67 constraintEqualToAnchor:v68 constant:-8.0];
            [v24 addObject:v79];
          }
          else
          {
            v60 = [v55 widthAnchor];
            +[RAPSeparatorBar thickness];
            v61 = [v60 constraintEqualToConstant:];
            [v24 addObject:v61];

            v62 = [v55 centerXAnchor];
            v63 = [(UIView *)v100 centerXAnchor];
            v64 = [v62 constraintEqualToAnchor:v63];
            [v24 addObject:v64];

            v65 = [v55 topAnchor];
            v66 = [v65 constraintEqualToAnchor:v40 constant:10.0];
            [v24 addObject:v66];

            v67 = [v55 bottomAnchor];
            v68 = [v67 constraintEqualToAnchor:v99 constant:-10.0];
            [v24 addObject:v68];
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          if (v96)
          {
            v69 = [(RAPSeparatorBar *)self->_topHorizontalHairlineView bottomAnchor];

            if (v40 == v69)
            {
              v80 = [v55 widthAnchor];
              v81 = [v96 widthAnchor];
              v82 = [v80 constraintEqualToAnchor:v81];
              [v24 addObject:v82];

              v70 = [v55 leadingAnchor];
              v72 = [v54 leadingAnchor];
              v73 = [v70 constraintEqualToAnchor:v72 constant:10.0];
              v71 = v100;
            }
            else
            {
              v70 = [v55 leadingAnchor];
              v71 = v100;
              v72 = [(UIView *)v100 leadingAnchor];
              v73 = [v70 constraintEqualToAnchor:v72 constant:10.0];
            }
            [v24 addObject:v73];

            v83 = [v55 trailingAnchor];
            v84 = [(UIView *)v71 trailingAnchor];
            v85 = [v83 constraintEqualToAnchor:v84 constant:-8.0];
            [v24 addObject:v85];
          }
          v86 = [v55 firstBaselineAnchor];
          v67 = [v86 constraintEqualToAnchor:v40 constant:v48];

          v87 = [v55 lastBaselineAnchor];
          v68 = [v87 constraintEqualToAnchor:v99 constant:v51];

          [v24 addObject:v67];
          [v24 addObject:v68];
          [(NSMutableArray *)self->_topToFirstBaselineConstraints addObject:v67];
          [(NSMutableArray *)self->_lastBaselineToBottomConstraints addObject:v68];
          id v88 = v55;

          v96 = v88;
        }

        v41 = &OBJC_IVAR___UGCPOIEnrichmentCoordinator__submissionStatusDelegate;
LABEL_25:
        v89 = [(NSMutableArray *)self->_detailViews lastObject];

        if (v55 == v89)
        {
          v90 = [v55 trailingAnchor];
          v91 = [(UIView *)v100 trailingAnchor];
          v92 = [v90 constraintEqualToAnchor:v91 constant:-8.0];
          [v24 addObject:v92];

          v41 = &OBJC_IVAR___UGCPOIEnrichmentCoordinator__submissionStatusDelegate;
        }
        if (v55 == *(void **)((char *)&self->super.super.super.super.isa + v41[936]))
        {
          uint64_t v93 = [v55 bottomAnchor];

          uint64_t v94 = [(UIView *)v100 bottomAnchor];

          v99 = (void *)v94;
          v40 = (void *)v93;
        }
        id v52 = v55;

        v53 = (char *)v53 + 1;
        v54 = v52;
      }
      while (v98 != v53);
      id v98 = [(NSMutableArray *)obj countByEnumeratingWithState:&v101 objects:v105 count:16];
      if (!v98)
      {
LABEL_33:

        id v42 = v100;
        goto LABEL_34;
      }
    }
  }
  id v42 = v100;
  v43 = [(UIView *)v100 bottomAnchor];
  v44 = +[UIFont system17];
  [v44 _mapkit_scaledValueForValue:10.0];
  v40 = [v26 constraintEqualToAnchor:v43 constant:-v45];

  [(NSMutableArray *)self->_constraints addObject:v40];
LABEL_34:

  [(NSMutableArray *)self->_constraints addObjectsFromArray:v24];
  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_freeformAddressFieldTapped:(id)a3
{
  id v7 = a3;
  v4 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView text];
  id v5 = [v4 length];

  if (v5)
  {
    if ([v7 state] != (id)3 || self->_canEditFreeformAddress)
    {
      [(TextViewWithPlaceholderText *)self->_freeformAddressTextView becomeFirstResponder];
      goto LABEL_7;
    }
  }
  else
  {
    [(TextViewWithPlaceholderText *)self->_freeformAddressTextView resignFirstResponder];
  }
  v6 = [(RAPMultilineAddressLabelTableViewCell *)self delegate];
  [v6 userTappedOnAddressTableViewCell:self];

LABEL_7:
}

- (void)_scrollTextViewSelectedRangeVisible:(id)a3
{
  id v28 = a3;
  v4 = [v28 selectedTextRange];
  if (v4)
  {
    p_parentTableView = &self->_parentTableView;
    id WeakRetained = objc_loadWeakRetained((id *)p_parentTableView);
    [v28 firstRectForRange:v4];
    [WeakRetained convertRect:v28 toView:];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v32.origin.x = CGRectZero.origin.x;
    v32.origin.y = CGRectZero.origin.y;
    v32.size.width = CGRectZero.size.width;
    v32.size.height = CGRectZero.size.height;
    v30.origin.x = v8;
    v30.origin.y = v10;
    v30.size.width = v12;
    v30.size.height = v14;
    if (!CGRectEqualToRect(v30, v32))
    {
      unint64_t v15 = 0;
      do
      {
        id v16 = objc_loadWeakRetained((id *)p_parentTableView);
        [v16 scrollRectToVisible:0, v8, v10, v12, v14];

        id v17 = objc_loadWeakRetained((id *)p_parentTableView);
        [v17 layoutIfNeeded];

        id v18 = objc_loadWeakRetained((id *)p_parentTableView);
        [v28 firstRectForRange:v4];
        [v18 convertRect:v28 toView:];
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        CGFloat v26 = v25;

        v31.origin.x = v20;
        v31.origin.y = v22;
        v31.size.width = v24;
        v31.size.height = v26;
        v33.origin.x = v8;
        v33.origin.y = v10;
        v33.size.width = v12;
        v33.size.height = v14;
        if (CGRectEqualToRect(v31, v33)) {
          break;
        }
        double v8 = v20;
        double v10 = v22;
        double v12 = v24;
        double v14 = v26;
      }
      while (v15++ < 9);
    }
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6 = a5;
  id v7 = a3;
  double v8 = [v7 text];
  double v9 = +[NSCharacterSet newlineCharacterSet];
  double v10 = [v8 componentsSeparatedByCharactersInSet:v9];

  double v11 = +[NSCharacterSet newlineCharacterSet];
  double v12 = [v6 componentsSeparatedByCharactersInSet:v11];

  id v13 = [v10 count];
  double v14 = (char *)[v12 count] + (void)v13 - 1;
  unint64_t v15 = [v7 textContainer];

  LOBYTE(v7) = v14 <= [v15 maximumNumberOfLines];
  return (char)v7;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return self->_canEditFreeformAddress;
}

- (void)textViewDidBeginEditing:(id)a3
{
  uint64_t v3 = [(RAPMultilineAddressLabelTableViewCell *)self analyticTarget];

  +[GEOAPPortal captureUserAction:10167 target:v3 value:0];
}

- (void)textViewDidChange:(id)a3
{
  [(RAPMultilineAddressLabelTableViewCell *)self _updateFreeformCellHeightIfNeeded];

  [(RAPMultilineAddressLabelTableViewCell *)self _addressChanged];
}

- (void)textViewDidEndEditing:(id)a3
{
  id v5 = a3;
  if ([(RAPMultilineAddressLabelTableViewCell *)self isEditableAndTappable])
  {
    v4 = [v5 text];
    -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:", [v4 length] != 0);
  }
}

- (void)_updateFreeformCellHeightIfNeeded
{
  p_parentTableView = &self->_parentTableView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTableView);
  id v5 = [WeakRetained superview];
  [v5 setNeedsLayout];

  id v6 = objc_loadWeakRetained((id *)p_parentTableView);
  [v6 _maps_reloadCellHeights];

  freeformAddressTextView = self->_freeformAddressTextView;

  [(RAPMultilineAddressLabelTableViewCell *)self _scrollTextViewSelectedRangeVisible:freeformAddressTextView];
}

- (void)setFreeformAddress:(id)a3
{
  p_freeformAddress = &self->_freeformAddress;
  id v7 = a3;
  if (!-[NSString isEqualToString:](*p_freeformAddress, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_freeformAddress, a3);
    [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setText:*p_freeformAddress];
  }
  if ([(RAPMultilineAddressLabelTableViewCell *)self isEditableAndTappable])
  {
    id v6 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView text];
    -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:", [v6 length] != 0);
  }
  else
  {
    [(RAPMultilineAddressLabelTableViewCell *)self setCanEditFreeformAddress:1];
  }
}

- (void)_addressChanged
{
  double v8 = objc_alloc_init(RAPAddressFields);
  uint64_t v3 = [(TextViewWithPlaceholderText *)self->_freeformAddressTextView text];
  [(RAPAddressFields *)v8 setFreeformAddress:v3];

  v4 = [(UITextField *)self->_floorTextField text];
  [(RAPAddressFields *)v8 setFloor:v4];

  id v5 = [(UITextField *)self->_unitTextField text];
  [(RAPAddressFields *)v8 setUnit:v5];

  id v6 = [(UITextField *)self->_buildingTextField text];
  [(RAPAddressFields *)v8 setBuilding:v6];

  id v7 = [(RAPMultilineAddressLabelTableViewCell *)self delegate];
  [v7 addressTableViewCell:self updatedAddress:v8];
}

- (void)setCanEditFreeformAddress:(BOOL)a3
{
  if (self->_canEditFreeformAddress != a3)
  {
    self->_canEditFreeformAddress = a3;
    if (self->_editableAndTappable) {
      -[TextViewWithPlaceholderText setEditable:](self->_freeformAddressTextView, "setEditable:");
    }
  }
}

- (void)setEditableAndTappable:(BOOL)a3
{
  if (self->_editableAndTappable != a3)
  {
    self->_editableAndTappable = a3;
    if (a3)
    {
      if (!self->_freeformGestureRecognizer)
      {
        id v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_freeformAddressFieldTapped:"];
        freeformGestureRecognizer = self->_freeformGestureRecognizer;
        self->_freeformGestureRecognizer = v5;

        freeformAddressTextView = self->_freeformAddressTextView;
        double v8 = self->_freeformGestureRecognizer;
        [(TextViewWithPlaceholderText *)freeformAddressTextView addGestureRecognizer:v8];
      }
    }
    else
    {
      -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:");
      [(TextViewWithPlaceholderText *)self->_freeformAddressTextView removeGestureRecognizer:self->_freeformGestureRecognizer];
      v4 = self->_freeformGestureRecognizer;
      self->_freeformGestureRecognizer = 0;
    }
  }
}

- (void)setLayoutOptions:(id)a3
{
  id v6 = a3;
  if (!-[RAPAddressLayoutOptions isEqual:](self->_layoutOptions, "isEqual:"))
  {
    v4 = (RAPAddressLayoutOptions *)[v6 copy];
    layoutOptions = self->_layoutOptions;
    self->_layoutOptions = v4;

    [(RAPMultilineAddressLabelTableViewCell *)self _updateViews];
    [(RAPMultilineAddressLabelTableViewCell *)self _updateConstraints];
  }
}

- (void)_updateViews
{
  [(RAPMultilineAddressLabelTableViewCell *)self _clearSubviews];
  double v8 = self->_containerView;
  [(UIView *)v8 addSubview:self->_freeformAddressTextView];
  uint64_t v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  detailViews = self->_detailViews;
  self->_detailViews = v3;

  uint64_t v5 = [(RAPAddressLayoutOptions *)self->_layoutOptions numberOfEnabledOptions];
  id v6 = v8;
  if (v5)
  {
    [(UIView *)v8 addSubview:self->_topHorizontalHairlineView];
    if ([(RAPAddressLayoutOptions *)self->_layoutOptions showFloor])
    {
      [(NSMutableArray *)self->_detailViews addObject:self->_floorTextField];
      [(UIView *)v8 addSubview:self->_floorTextField];
    }
    if ([(RAPAddressLayoutOptions *)self->_layoutOptions showBuilding])
    {
      [(NSMutableArray *)self->_detailViews addObject:self->_buildingTextField];
      [(UIView *)v8 addSubview:self->_buildingTextField];
    }
    if ([(RAPAddressLayoutOptions *)self->_layoutOptions showUnit])
    {
      [(NSMutableArray *)self->_detailViews addObject:self->_unitTextField];
      [(UIView *)v8 addSubview:self->_unitTextField];
    }
    if (v5 >= 2)
    {
      [(UIView *)v8 addSubview:self->_middleVerticalHairlineView];
      [(NSMutableArray *)self->_detailViews insertObject:self->_middleVerticalHairlineView atIndex:1];
    }
    BOOL v7 = [(RAPAddressLayoutOptions *)self->_layoutOptions numberOfEnabledOptions] <= 2;
    id v6 = v8;
    if (!v7)
    {
      [(UIView *)v8 addSubview:self->_bottomHorizontalHairlineView];
      [(NSMutableArray *)self->_detailViews insertObject:self->_bottomHorizontalHairlineView atIndex:(char *)[(NSMutableArray *)self->_detailViews count] - 1];
      id v6 = v8;
    }
  }
}

- (void)_clearSubviews
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(UIView *)self->_containerView subviews];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) removeFromSuperview];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_contentSizeDidChange
{
  [(RAPMultilineAddressLabelTableViewCell *)self _updateFonts];

  [(RAPMultilineAddressLabelTableViewCell *)self _recalculateConstraints];
}

- (void)_updateFonts
{
  id v3 = +[UIFont system17];
  [(TextViewWithPlaceholderText *)self->_freeformAddressTextView setFont:v3];

  id v4 = +[UIFont system17];
  [(UITextField *)self->_floorTextField setFont:v4];

  uint64_t v5 = +[UIFont system17];
  [(UITextField *)self->_buildingTextField setFont:v5];

  id v6 = +[UIFont system17];
  [(UITextField *)self->_unitTextField setFont:v6];
}

- (void)_recalculateConstraints
{
  id v3 = +[UIFont system17];
  [v3 _mapkit_scaledValueForValue:33.0];
  double v5 = v4;

  id v6 = +[UIFont system17];
  [v6 _mapkit_scaledValueForValue:-22.0];
  double v8 = v7;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v9 = self->_topToFirstBaselineConstraints;
  id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * (void)v13) setConstant:v5];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v11);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v14 = self->_lastBaselineToBottomConstraints;
  id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * (void)v18) setConstant:v8 v22];
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }

  double v19 = +[UIFont system17];
  [v19 _mapkit_scaledValueForValue:10.0];
  -[NSLayoutConstraint setConstant:](self->_freeformTopConstraint, "setConstant:");

  CGFloat v20 = +[UIFont system17];
  [v20 _mapkit_scaledValueForValue:10.0];
  [(NSLayoutConstraint *)self->_freeformBottomConstraint setConstant:-v21];
}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (RAPAddressLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (RAPAddressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPAddressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)freeformAddress
{
  return self->_freeformAddress;
}

- (BOOL)canEditFreeformAddress
{
  return self->_canEditFreeformAddress;
}

- (BOOL)isEditableAndTappable
{
  return self->_editableAndTappable;
}

- (UITableView)parentTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentTableView);

  return (UITableView *)WeakRetained;
}

- (void)setParentTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTableView);
  objc_storeStrong((id *)&self->_freeformAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_freeformGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_detailViews, 0);
  objc_storeStrong((id *)&self->_freeformBottomConstraint, 0);
  objc_storeStrong((id *)&self->_freeformTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraints, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bottomHorizontalHairlineView, 0);
  objc_storeStrong((id *)&self->_middleVerticalHairlineView, 0);
  objc_storeStrong((id *)&self->_topHorizontalHairlineView, 0);
  objc_storeStrong((id *)&self->_buildingTextField, 0);
  objc_storeStrong((id *)&self->_unitTextField, 0);
  objc_storeStrong((id *)&self->_floorTextField, 0);

  objc_storeStrong((id *)&self->_freeformAddressTextView, 0);
}

@end