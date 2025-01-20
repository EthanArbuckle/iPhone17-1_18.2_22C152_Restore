@interface RAPReportComposerTwoLineSnippetTableViewCell
+ (id)measuringCell;
- (NSAttributedString)attributedStringFormat;
- (RAPReportComposerTwoLineSnippetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)thirdLineAccessoryView;
- (double)preferredHeightInTableView:(id)a3;
- (id)defaultReplacementAttributes;
- (void)_recreateConstraints;
- (void)_updateLeftRightConstraints;
- (void)didMoveToSuperview;
- (void)layoutMarginsDidChange;
- (void)setThirdLineAccessoryView:(id)a3;
- (void)updateTextWithReplacements:(id)a3;
@end

@implementation RAPReportComposerTwoLineSnippetTableViewCell

- (RAPReportComposerTwoLineSnippetTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  v4 = [(RAPReportComposerTwoLineSnippetTableViewCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RAPReportComposerTwoLineSnippetTableViewCell *)v4 setSelectionStyle:0];
    v6 = (UILabel *)objc_alloc_init((Class)UILabel);
    firstLineLabel = v5->_firstLineLabel;
    v5->_firstLineLabel = v6;

    [(UILabel *)v5->_firstLineLabel setNumberOfLines:3];
    [(UILabel *)v5->_firstLineLabel setLineBreakMode:4];
    v8 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v5 contentView];
    [v8 addSubview:v5->_firstLineLabel];

    LODWORD(v9) = 1148829696;
    [(UILabel *)v5->_firstLineLabel setContentCompressionResistancePriority:1 forAxis:v9];
    v10 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondLineLabel = v5->_secondLineLabel;
    v5->_secondLineLabel = v10;

    [(UILabel *)v5->_secondLineLabel setNumberOfLines:3];
    [(UILabel *)v5->_secondLineLabel setLineBreakMode:4];
    v12 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v5 contentView];
    [v12 addSubview:v5->_secondLineLabel];

    LODWORD(v13) = 1148829696;
    [(UILabel *)v5->_secondLineLabel setContentCompressionResistancePriority:1 forAxis:v13];
    [(RAPReportComposerTwoLineSnippetTableViewCell *)v5 _recreateConstraints];
  }
  return v5;
}

- (void)setThirdLineAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  p_thirdLineAccessoryView = &self->_thirdLineAccessoryView;
  thirdLineAccessoryView = self->_thirdLineAccessoryView;
  if (thirdLineAccessoryView != v5)
  {
    v10 = v5;
    [(UIView *)thirdLineAccessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_thirdLineAccessoryView, a3);
    if (*p_thirdLineAccessoryView)
    {
      v8 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
      [v8 addSubview:*p_thirdLineAccessoryView];

      LODWORD(v9) = 1148829696;
      [(UIView *)*p_thirdLineAccessoryView setContentCompressionResistancePriority:1 forAxis:v9];
    }
    [(RAPReportComposerTwoLineSnippetTableViewCell *)self _recreateConstraints];
    v5 = v10;
  }
}

- (void)_recreateConstraints
{
  if (self->_allConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  uint64_t v3 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self thirdLineAccessoryView];
  v4 = (UILabel *)v3;
  firstLineLabel = self->_firstLineLabel;
  if (v3) {
    _NSDictionaryOfVariableBindings(@"_firstLineLabel, _secondLineLabel, accessoryView", firstLineLabel, self->_secondLineLabel, v3, 0);
  }
  else {
  v6 = _NSDictionaryOfVariableBindings(@"_firstLineLabel, _secondLineLabel", firstLineLabel, self->_secondLineLabel, 0);
  }
  +[TransitArtworkListView transitArtworkListHeight];
  v87 = sub_1003E7E2C(@"topBottomMargin, lineMargin, artworkListHeight", 10.0, v7, v8, v9, v10, v11, v12, v13, 0x4014000000000000);
  [(UILabel *)self->_firstLineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v93 = self;
  [(UILabel *)self->_secondLineLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v85 = v4;
  [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v86 = objc_alloc_init((Class)NSMutableArray);
  id v92 = objc_alloc_init((Class)NSMutableArray);
  id v91 = objc_alloc_init((Class)NSMutableArray);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v88 = v6;
  id obj = [v6 objectEnumerator];
  id v14 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v95;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v95 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        v19 = [v18 leadingAnchor];
        v20 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v93 contentView];
        v21 = [v20 leadingAnchor];
        v22 = [v19 constraintEqualToAnchor:v21];

        [v22 setIdentifier:@"Left margin"];
        v23 = [v18 trailingAnchor];
        v24 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v93 contentView];
        v25 = [v24 trailingAnchor];
        v26 = [v23 constraintEqualToAnchor:v25];

        [v26 setIdentifier:@"Right margin"];
        [v92 addObject:v22];
        [v91 addObject:v26];
      }
      id v15 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
    }
    while (v15);
  }

  v27 = (NSArray *)[v92 copy];
  leftMarginConstraints = v93->_leftMarginConstraints;
  v93->_leftMarginConstraints = v27;

  v29 = (NSArray *)[v91 copy];
  rightMarginConstraints = v93->_rightMarginConstraints;
  v93->_rightMarginConstraints = v29;

  [(RAPReportComposerTwoLineSnippetTableViewCell *)v93 _updateLeftRightConstraints];
  [v86 addObjectsFromArray:v93->_leftMarginConstraints];
  [v86 addObjectsFromArray:v93->_rightMarginConstraints];
  v31 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-topBottomMargin-[_firstLineLabel]", 0, v87, v88);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v32 = [v31 countByEnumeratingWithState:&v98 objects:v103 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = 0;
    uint64_t v35 = *(void *)v99;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v99 != v35) {
          objc_enumerationMutation(v31);
        }
        v37 = *(void **)(*((void *)&v98 + 1) + 8 * (void)j);
        v38 = +[NSString stringWithFormat:@"%@ (%lu)", @"Top stacking", (char *)j + v34];
        [v37 setIdentifier:v38];
      }
      id v33 = [v31 countByEnumeratingWithState:&v98 objects:v103 count:16];
      v34 += (uint64_t)j;
    }
    while (v33);
  }
  [v86 addObjectsFromArray:v31];

  v39 = [(UILabel *)v93->_secondLineLabel text];
  if ([v39 length])
  {

    BOOL v40 = 1;
    v41 = v85;
LABEL_22:
    secondLineLabel = v93->_secondLineLabel;
    goto LABEL_23;
  }
  v55 = [(UILabel *)v93->_secondLineLabel attributedText];
  id v56 = [v55 length];
  BOOL v40 = v56 != 0;

  v41 = v85;
  if (!v85 || v56) {
    goto LABEL_22;
  }
  BOOL v40 = 0;
  secondLineLabel = v85;
LABEL_23:
  obja = secondLineLabel;
  v43 = [(UILabel *)obja topAnchor];
  v44 = [(UILabel *)v93->_firstLineLabel bottomAnchor];
  uint64_t v45 = [v43 constraintEqualToAnchor:v44];
  collapsibleFirstSecondLineMargin = v93->_collapsibleFirstSecondLineMargin;
  v93->_collapsibleFirstSecondLineMargin = (NSLayoutConstraint *)v45;

  [(NSLayoutConstraint *)v93->_collapsibleFirstSecondLineMargin setIdentifier:@"Collapsible first-second line margin"];
  [v86 addObject:v93->_collapsibleFirstSecondLineMargin];
  if (!v41)
  {
    v57 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_secondLineLabel]-topBottomMargin-|" options:0 metrics:v87 views:v88];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v58 = [v57 countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (v58)
    {
      id v59 = v58;
      uint64_t v60 = 0;
      uint64_t v61 = *(void *)v99;
      do
      {
        for (k = 0; k != v59; k = (char *)k + 1)
        {
          if (*(void *)v99 != v61) {
            objc_enumerationMutation(v57);
          }
          v63 = *(void **)(*((void *)&v98 + 1) + 8 * (void)k);
          v64 = +[NSString stringWithFormat:@"%@ (%lu)", @"Bottom stacking (with _secondLineLabel, without accessory)", (char *)k + v60];
          [v63 setIdentifier:v64];
        }
        id v59 = [v57 countByEnumeratingWithState:&v98 objects:v103 count:16];
        v60 += (uint64_t)k;
      }
      while (v59);
    }
    goto LABEL_59;
  }
  if (v40)
  {
    v47 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:[_secondLineLabel]-lineMargin-[accessoryView]-topBottomMargin-|", 0, v87, v88);
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v48 = [v47 countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = 0;
      uint64_t v51 = *(void *)v99;
      do
      {
        for (m = 0; m != v49; m = (char *)m + 1)
        {
          if (*(void *)v99 != v51) {
            objc_enumerationMutation(v47);
          }
          v53 = *(void **)(*((void *)&v98 + 1) + 8 * (void)m);
          v54 = +[NSString stringWithFormat:@"%@ (%lu)", @"Bottom stacking (with _secondLineLabel and accessory)", (char *)m + v50];
          [v53 setIdentifier:v54];
        }
        id v49 = [v47 countByEnumeratingWithState:&v98 objects:v103 count:16];
        v50 += (uint64_t)m;
      }
      while (v49);
    }
  }
  else
  {
    v47 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[accessoryView]-topBottomMargin-|" options:0 metrics:v87 views:v88];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v65 = [v47 countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (v65)
    {
      id v66 = v65;
      uint64_t v67 = 0;
      uint64_t v68 = *(void *)v99;
      do
      {
        for (n = 0; n != v66; n = (char *)n + 1)
        {
          if (*(void *)v99 != v68) {
            objc_enumerationMutation(v47);
          }
          v70 = *(void **)(*((void *)&v98 + 1) + 8 * (void)n);
          v71 = +[NSString stringWithFormat:@"%@ (%lu)", @"Bottom stacking (without _secondLineLabel, with accessory)", (char *)n + v67];
          [v70 setIdentifier:v71];
        }
        id v66 = [v47 countByEnumeratingWithState:&v98 objects:v103 count:16];
        v67 += (uint64_t)n;
      }
      while (v66);
    }
  }
  v72 = v86;
  [v86 addObjectsFromArray:v47];

  objc_opt_class();
  v73 = v85;
  v74 = v88;
  if (objc_opt_isKindOfClass())
  {
    v57 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[accessoryView(artworkListHeight@999)]" options:0 metrics:v87 views:v88];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    id v75 = [v57 countByEnumeratingWithState:&v98 objects:v103 count:16];
    if (v75)
    {
      id v76 = v75;
      uint64_t v77 = 0;
      uint64_t v78 = *(void *)v99;
      do
      {
        for (ii = 0; ii != v76; ii = (char *)ii + 1)
        {
          if (*(void *)v99 != v78) {
            objc_enumerationMutation(v57);
          }
          v80 = *(void **)(*((void *)&v98 + 1) + 8 * (void)ii);
          v81 = +[NSString stringWithFormat:@"%@ (%lu)", @"Accessory view height", (char *)ii + v77];
          [v80 setIdentifier:v81];
        }
        id v76 = [v57 countByEnumeratingWithState:&v98 objects:v103 count:16];
        v77 += (uint64_t)ii;
      }
      while (v76);
    }
LABEL_59:
    v72 = v86;
    [v86 addObjectsFromArray:v57];

    v73 = v85;
    v74 = v88;
  }
  v82 = [(RAPReportComposerTwoLineSnippetTableViewCell *)v93 contentView];
  [v82 addConstraints:v72];

  v83 = (NSArray *)[v72 copy];
  allConstraints = v93->_allConstraints;
  v93->_allConstraints = v83;
}

- (void)_updateLeftRightConstraints
{
  uint64_t v3 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
  [v3 layoutMargins];
  double v5 = v4;
  double v7 = v6;

  id v49 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self->_leftMarginConstraints count]];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = self->_leftMarginConstraints;
  id v8 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v11);
        uint64_t v13 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self imageView];
        uint64_t v14 = [v13 image];
        if (v14)
        {
          id v15 = (void *)v14;
          uint64_t v16 = [v12 secondItem];
          v17 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self imageView];

          if (v16 == v17) {
            goto LABEL_19;
          }
        }
        else
        {
        }
        v18 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self imageView];
        v19 = [v18 image];

        if (v19)
        {
          v20 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
          v21 = [v20 constraints];
          unsigned int v22 = [v21 containsObject:v12];

          if (v22)
          {
            v23 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
            [v23 removeConstraint:v12];
          }
          v24 = [v12 firstItem];
          v25 = [v24 leadingAnchor];
          v26 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self imageView];
          v27 = [v26 trailingAnchor];
          v28 = [v25 constraintEqualToAnchor:v27 constant:15.0];
        }
        else
        {
          v30 = [v12 secondItem];
          v31 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self imageView];

          if (v30 != v31)
          {
            [v12 setConstant:v5];
LABEL_19:
            [v49 addObject:v12];
            goto LABEL_20;
          }
          id v32 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
          id v33 = [v32 constraints];
          unsigned int v22 = [v33 containsObject:v12];

          if (v22)
          {
            uint64_t v34 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
            [v34 removeConstraint:v12];
          }
          uint64_t v35 = [v12 firstItem];
          v36 = [v35 leadingAnchor];
          v37 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
          v38 = [v37 leadingAnchor];
          v28 = [v36 constraintEqualToAnchor:v38 constant:v5];
        }
        [v28 setIdentifier:@"Left margin"];
        if (v22)
        {
          v29 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
          [v29 addConstraint:v28];
        }
        [v49 addObject:v28];

LABEL_20:
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v39 = [(NSArray *)obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      id v9 = v39;
    }
    while (v39);
  }

  BOOL v40 = (NSArray *)[v49 copy];
  leftMarginConstraints = self->_leftMarginConstraints;
  self->_leftMarginConstraints = v40;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v42 = self->_rightMarginConstraints;
  id v43 = [(NSArray *)v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v43)
  {
    id v44 = v43;
    uint64_t v45 = *(void *)v51;
    double v46 = -v7;
    do
    {
      for (i = 0; i != v44; i = (char *)i + 1)
      {
        if (*(void *)v51 != v45) {
          objc_enumerationMutation(v42);
        }
        [*(id *)(*((void *)&v50 + 1) + 8 * i) setConstant:v46];
      }
      id v44 = [(NSArray *)v42 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v44);
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  [(RAPReportComposerTwoLineSnippetTableViewCell *)&v3 didMoveToSuperview];
  [(RAPReportComposerTwoLineSnippetTableViewCell *)self _updateLeftRightConstraints];
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)RAPReportComposerTwoLineSnippetTableViewCell;
  [(RAPReportComposerTwoLineSnippetTableViewCell *)&v3 layoutMarginsDidChange];
  [(RAPReportComposerTwoLineSnippetTableViewCell *)self _updateLeftRightConstraints];
}

- (NSAttributedString)attributedStringFormat
{
  return 0;
}

- (id)defaultReplacementAttributes
{
  return &__NSDictionary0__struct;
}

- (void)updateTextWithReplacements:(id)a3
{
  id v15 = a3;
  double v4 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self attributedStringFormat];
  double v5 = [v4 string];
  double v6 = [v5 rangeOfString:@"\n"];
  uint64_t v8 = v7;

  if (v6 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = v4;
    uint64_t v10 = 0;
    if (v9) {
      goto LABEL_3;
    }
LABEL_6:
    [(UILabel *)self->_firstLineLabel setAttributedText:0];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  [v4 attributedSubstringFromRange:0, v6];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v4 attributedSubstringFromRange:&v6[v8] length:[v4 length] - &v6[v8]];
  if (!v9) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self defaultReplacementAttributes];
  uint64_t v12 = [v9 _mapkit_attributedStringByApplyingBindingFormatReplacements:v15 defaultReplacementAttributes:v11];
  [(UILabel *)self->_firstLineLabel setAttributedText:v12];

  if (v10)
  {
LABEL_4:
    uint64_t v13 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self defaultReplacementAttributes];
    uint64_t v14 = [v10 _mapkit_attributedStringByApplyingBindingFormatReplacements:v15 defaultReplacementAttributes:v13];
    [(UILabel *)self->_secondLineLabel setAttributedText:v14];

    goto LABEL_8;
  }
LABEL_7:
  [(UILabel *)self->_secondLineLabel setAttributedText:0];
LABEL_8:
}

- (double)preferredHeightInTableView:(id)a3
{
  [a3 bounds];
  double v5 = v4;
  double v6 = [(RAPReportComposerTwoLineSnippetTableViewCell *)self contentView];
  [v6 systemLayoutSizeFittingSize:v5];
  double v8 = v7;

  return v8;
}

+ (id)measuringCell
{
  if (qword_101610820 != -1) {
    dispatch_once(&qword_101610820, &stru_101317FA8);
  }
  objc_super v3 = NSStringFromClass((Class)a1);
  id v4 = [(id)qword_101610818 objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [objc_alloc((Class)a1) initWithStyle:0 reuseIdentifier:0];
    [(id)qword_101610818 setObject:v4 forKeyedSubscript:v3];
  }

  return v4;
}

- (UIView)thirdLineAccessoryView
{
  return self->_thirdLineAccessoryView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdLineAccessoryView, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_collapsibleFirstSecondLineMargin, 0);
  objc_storeStrong((id *)&self->_rightMarginConstraints, 0);
  objc_storeStrong((id *)&self->_leftMarginConstraints, 0);
  objc_storeStrong((id *)&self->_secondLineLabel, 0);

  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end