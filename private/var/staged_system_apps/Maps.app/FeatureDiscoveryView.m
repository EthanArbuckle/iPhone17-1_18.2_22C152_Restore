@interface FeatureDiscoveryView
+ ($1AB5FA073B851C12C2339EC22442E995)_cellMetricsForIdiom:(int64_t)a3 context:(unint64_t)a4;
+ ($29727DC6989B69F22950FCD998EA20D4)_metricsForIdiom:(SEL)a3;
+ (double)estimatedHeight;
+ (id)_constraintsForFeatureDiscoveryView:(id)a3 centeredInContentView:(id)a4 withIdiom:(int64_t)a5 context:(unint64_t)a6;
- (FeatureDiscoveryModel)model;
- (FeatureDiscoveryView)initWithFrame:(CGRect)a3;
- (double)arrowOffset;
- (void)_configureActionButton;
- (void)_dismiss;
- (void)_performAction;
- (void)_performBodyTap;
- (void)_setupActionButtonIfNeeded;
- (void)setModel:(id)a3;
@end

@implementation FeatureDiscoveryView

+ (double)estimatedHeight
{
  return 128.0;
}

+ ($1AB5FA073B851C12C2339EC22442E995)_cellMetricsForIdiom:(int64_t)a3 context:(unint64_t)a4
{
  double v4 = 2.0;
  if (!a4) {
    double v4 = 12.0;
  }
  double v5 = 4.0;
  if (!a4) {
    double v5 = 0.0;
  }
  if (a3 == 5) {
    double v5 = v4;
  }
  double v6 = 10.0;
  if (a3 != 5) {
    double v6 = 16.0;
  }
  double v7 = 6.0;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v7;
  return result;
}

+ ($29727DC6989B69F22950FCD998EA20D4)_metricsForIdiom:(SEL)a3
{
  if (a4 == 5)
  {
    retstr->var6 = 0.0;
    *(_OWORD *)&retstr->var0 = xmmword_100F73A60;
    *(_OWORD *)&retstr->var2 = unk_100F73A70;
    *(_OWORD *)&retstr->var4 = xmmword_100F73A80;
  }
  else
  {
    *(_OWORD *)&retstr->var0 = xmmword_100F73A98;
    *(_OWORD *)&retstr->var2 = unk_100F73AA8;
    *(_OWORD *)&retstr->var4 = xmmword_100F73AB8;
    retstr->var6 = 40.0;
  }
  return result;
}

+ (id)_constraintsForFeatureDiscoveryView:(id)a3 centeredInContentView:(id)a4 withIdiom:(int64_t)a5 context:(unint64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  +[FeatureDiscoveryView _cellMetricsForIdiom:a5 context:a6];
  v11 = [v10 _maps_constraintsEqualToEdgesOfView:v9];

  v12 = [v11 allConstraints];

  return v12;
}

- (FeatureDiscoveryView)initWithFrame:(CGRect)a3
{
  v113.receiver = self;
  v113.super_class = (Class)FeatureDiscoveryView;
  v3 = -[FeatureDiscoveryView initWithFrame:](&v113, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(FeatureDiscoveryView *)v3 setClipsToBounds:0];
    [(FeatureDiscoveryView *)v4 setFloatingIndicator:1];
    double v5 = (objc_class *)objc_opt_class();
    double v6 = NSStringFromClass(v5);
    [(FeatureDiscoveryView *)v4 setAccessibilityIdentifier:v6];

    long long v112 = 0u;
    long long v111 = 0u;
    double v7 = objc_opt_class();
    v8 = [(FeatureDiscoveryView *)v4 traitCollection];
    id v9 = [v8 userInterfaceIdiom];
    if (v7)
    {
      [v7 _metricsForIdiom:v9];
    }
    else
    {
      long long v112 = 0u;
      long long v111 = 0u;
    }

    id v10 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v14 = [v10 initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = v4->_imageView;
    v4->_imageView = v14;

    [(UIImageView *)v4->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_imageView setContentMode:1];
    [(UIImageView *)v4->_imageView setAccessibilityIdentifier:@"FeatureDiscoveryImageView"];
    [(FeatureDiscoveryView *)v4 addSubview:v4->_imageView];
    v16 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v16;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v19 = [v18 _mapkit_fontWithWeight:UIFontWeightSemibold];
    [(UILabel *)v4->_titleLabel setFont:v19];

    v20 = +[UIColor labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v20];

    [(UILabel *)v4->_titleLabel setNumberOfLines:0];
    [(UILabel *)v4->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"FeatureDiscoveryTitle"];
    LODWORD(v21) = 1132068864;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:0 forAxis:v21];
    v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v22;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v24];

    [(UILabel *)v4->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)v4->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"FeatureDiscoverySubtitle"];
    LODWORD(v25) = 1132068864;
    [(UILabel *)v4->_subtitleLabel setContentHuggingPriority:0 forAxis:v25];
    id v26 = objc_alloc((Class)UIStackView);
    v118[0] = v4->_titleLabel;
    v118[1] = v4->_subtitleLabel;
    v27 = +[NSArray arrayWithObjects:v118 count:2];
    v28 = (UIStackView *)[v26 initWithArrangedSubviews:v27];
    textStackView = v4->_textStackView;
    v4->_textStackView = v28;

    [(UIStackView *)v4->_textStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_textStackView setAxis:1];
    [(UIStackView *)v4->_textStackView setDistribution:0];
    [(UIStackView *)v4->_textStackView setAlignment:0];
    double v30 = 0.0;
    [(UIStackView *)v4->_textStackView setSpacing:0.0];
    [(UIStackView *)v4->_textStackView setAccessibilityIdentifier:@"FeatureDiscoveryTextStack"];
    [(FeatureDiscoveryView *)v4 addSubview:v4->_textStackView];
    v31 = (UIGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"_performBodyTap"];
    tapGesture = v4->_tapGesture;
    v4->_tapGesture = v31;

    id v33 = objc_alloc_init((Class)NSMutableArray);
    v34 = UIFontTextStyleSubheadline;
    v110 = v33;
    if (sub_1000BBB44(v4) == 5)
    {
      [(FeatureDiscoveryView *)v4 setCornerRadius:8.0];
      id v35 = +[UIColor colorWithWhite:0.0 alpha:0.0199999996];
      id v36 = [v35 CGColor];
      v37 = [(FeatureDiscoveryView *)v4 layer];
      [v37 setBorderColor:v36];

      v38 = [(FeatureDiscoveryView *)v4 traitCollection];
      [v38 displayScale];
      double v40 = v39;
      BOOL v41 = v39 <= 1.0;
      double v42 = 1.0;
      if (!v41)
      {
        id v36 = [(FeatureDiscoveryView *)v4 traitCollection];
        [v36 displayScale];
      }
      double v43 = 1.0 / v42;
      v44 = [(FeatureDiscoveryView *)v4 layer];
      [v44 setBorderWidth:v43];

      if (v40 > 1.0) {
      v109 = UIFontTextStyleBody;
      }

      uint64_t v45 = +[MapsLargerHitTargetButton buttonWithType:1];
      closeButton = v4->_closeButton;
      v4->_closeButton = (MapsLargerHitTargetButton *)v45;

      v47 = v4->_closeButton;
      v48 = +[NSBundle mainBundle];
      v49 = [v48 localizedStringForKey:@"Dismiss [Action, Route Planning, Feature Discovery, Mac]", @"localized string not found", 0 value table];
      [(MapsLargerHitTargetButton *)v47 setTitle:v49 forState:0];

      [(MapsLargerHitTargetButton *)v4->_closeButton setAccessibilityIdentifier:@"FeatureDiscoveryCloseButton"];
      v50 = [(MapsLargerHitTargetButton *)v4->_closeButton leadingAnchor];
      [(FeatureDiscoveryView *)v4 leadingAnchor];
      v102 = v106 = v50;
      v104 = [v50 constraintGreaterThanOrEqualToAnchor:*(double *)&v111];
      v117[0] = v104;
      v51 = [(MapsLargerHitTargetButton *)v4->_closeButton topAnchor];
      v100 = [(UIStackView *)v4->_textStackView bottomAnchor];
      v101 = v51;
      v52 = [v51 constraintEqualToAnchor:v100 constant:*(double *)&v111];
      v117[1] = v52;
      v53 = [(FeatureDiscoveryView *)v4 trailingAnchor];
      v54 = [(UIStackView *)v4->_textStackView trailingAnchor];
      v55 = [v53 constraintEqualToAnchor:v54 constant:*(double *)&v111];
      v117[2] = v55;
      v56 = +[NSArray arrayWithObjects:v117 count:3];
      [v33 addObjectsFromArray:v56];
    }
    else
    {
      v109 = v34;
      [(FeatureDiscoveryView *)v4 setCornerRadius:10.0];
      uint64_t v57 = +[MapsLargerHitTargetButton buttonWithType:0];
      v58 = v4->_closeButton;
      v4->_closeButton = (MapsLargerHitTargetButton *)v57;

      +[UIFont systemFontSize];
      v59 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
      v60 = [v59 _mapkit_fontWithWeight:UIFontWeightMedium];
      uint64_t v61 = +[UIImageSymbolConfiguration configurationWithFont:v60];

      v62 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v61];
      v63 = [v62 imageWithRenderingMode:2];

      [(MapsLargerHitTargetButton *)v4->_closeButton setImage:v63 forState:0];
      [v63 size];
      if (0.0 - v64 >= 0.0)
      {
        [v63 size];
        double v30 = (0.0 - v65) * 0.5;
      }
      v106 = (void *)v61;
      [v63 size];
      double v67 = 0.0;
      if (0.0 - v66 >= 0.0)
      {
        [v63 size];
        double v67 = (0.0 - v68) * 0.5;
      }
      -[MapsLargerHitTargetButton setTouchInsets:](v4->_closeButton, "setTouchInsets:", -v67, -v30, -v67, -v30);
      v69 = +[UIColor secondaryLabelColor];
      [(MapsLargerHitTargetButton *)v4->_closeButton setTintColor:v69];

      LODWORD(v70) = 1144750080;
      [(MapsLargerHitTargetButton *)v4->_closeButton setContentHuggingPriority:0 forAxis:v70];
      LODWORD(v71) = 1148846080;
      [(MapsLargerHitTargetButton *)v4->_closeButton setContentCompressionResistancePriority:0 forAxis:v71];
      v72 = [(MapsLargerHitTargetButton *)v4->_closeButton leadingAnchor];
      [(UIStackView *)v4->_textStackView trailingAnchor];
      v101 = v104 = v72;
      v100 = [v72 constraintEqualToAnchor:*(double *)&v111];
      v116[0] = v100;
      v52 = [(FeatureDiscoveryView *)v4 trailingAnchor];
      [(MapsLargerHitTargetButton *)v4->_closeButton trailingAnchor];
      v53 = v102 = v63;
      v54 = [v52 constraintEqualToAnchor:v53 constant:*(double *)&v111];
      v116[1] = v54;
      v55 = [(MapsLargerHitTargetButton *)v4->_closeButton topAnchor];
      v56 = [(UIStackView *)v4->_textStackView topAnchor];
      v73 = [v55 constraintEqualToAnchor:v56];
      v116[2] = v73;
      v74 = +[NSArray arrayWithObjects:v116 count:3];
      [v110 addObjectsFromArray:v74];
    }
    v75 = +[UIFont preferredFontForTextStyle:v109];
    [(UILabel *)v4->_subtitleLabel setFont:v75];

    [(MapsLargerHitTargetButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsLargerHitTargetButton *)v4->_closeButton addTarget:v4 action:"_dismiss" forControlEvents:64];
    [(FeatureDiscoveryView *)v4 addSubview:v4->_closeButton];
    v108 = [(UIImageView *)v4->_imageView widthAnchor];
    v107 = [v108 constraintEqualToConstant:*((double *)&v112 + 1)];
    v115[0] = v107;
    v105 = [(UIImageView *)v4->_imageView leadingAnchor];
    v103 = [(FeatureDiscoveryView *)v4 leadingAnchor];
    v76 = [v105 constraintEqualToAnchor:v103 constant:*(double *)&v111];
    v115[1] = v76;
    v77 = [(UIImageView *)v4->_imageView centerYAnchor];
    v78 = [(UIStackView *)v4->_textStackView centerYAnchor];
    v79 = [v77 constraintEqualToAnchor:v78];
    v115[2] = v79;
    v80 = [(UIStackView *)v4->_textStackView topAnchor];
    v81 = [(FeatureDiscoveryView *)v4 topAnchor];
    v82 = [v80 constraintEqualToAnchor:v81 constant:*((double *)&v111 + 1)];
    v115[3] = v82;
    v83 = +[NSArray arrayWithObjects:v115 count:4];
    [v110 addObjectsFromArray:v83];

    v84 = [(UIStackView *)v4->_textStackView leadingAnchor];
    v85 = [(UIImageView *)v4->_imageView trailingAnchor];
    v86 = [v84 constraintEqualToAnchor:v85 constant:*(double *)&v111];
    uint64_t v87 = [v110 arrayByAddingObject:v86];
    constraintsWithImage = v4->_constraintsWithImage;
    v4->_constraintsWithImage = (NSArray *)v87;

    v89 = [(UIStackView *)v4->_textStackView leadingAnchor];
    v90 = [(UIImageView *)v4->_imageView leadingAnchor];
    v91 = [v89 constraintEqualToAnchor:v90];
    uint64_t v92 = [v110 arrayByAddingObject:v91];
    constraintsWithoutImage = v4->_constraintsWithoutImage;
    v4->_constraintsWithoutImage = (NSArray *)v92;

    +[NSLayoutConstraint activateConstraints:v4->_constraintsWithoutImage];
    v94 = [(FeatureDiscoveryView *)v4 bottomAnchor];
    v95 = [(UIStackView *)v4->_textStackView bottomAnchor];
    uint64_t v96 = [v94 constraintEqualToAnchor:v95 constant:*(double *)&v112];
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v96;

    v114 = v4->_bottomConstraint;
    v98 = +[NSArray arrayWithObjects:&v114 count:1];
    +[NSLayoutConstraint activateConstraints:v98];

    [(FeatureDiscoveryView *)v4 _setupActionButtonIfNeeded];
  }
  return v4;
}

- (double)arrowOffset
{
  v3 = [(FeatureDiscoveryView *)self sourceView];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)FeatureDiscoveryView;
    [(FeatureDiscoveryView *)&v6 arrowOffset];
  }
  else
  {
    [(FeatureDiscoveryView *)self bounds];
    return v5 * 0.5 + -25.0;
  }
  return result;
}

- (void)setModel:(id)a3
{
  id v5 = a3;
  p_model = &self->_model;
  model = self->_model;
  unint64_t v21 = (unint64_t)v5;
  id v8 = model;
  id v9 = (void *)v21;
  if (v21 | (unint64_t)v8)
  {
    unsigned __int8 v10 = [(id)v21 isEqual:v8];

    id v9 = (void *)v21;
    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_model, a3);
      [(FeatureDiscoveryModel *)*p_model setUpdatesDelegate:self];
      [(FeatureDiscoveryView *)self setShowBubbleIndicator:[(FeatureDiscoveryModel *)*p_model isTipMode]];
      v11 = [(id)v21 image];

      v12 = [(id)v21 image];
      [(UIImageView *)self->_imageView setImage:v12];

      [(UIImageView *)self->_imageView setHidden:v11 == 0];
      v13 = [(id)v21 title];
      [(UILabel *)self->_titleLabel setText:v13];

      v14 = [(id)v21 subtitle];
      [(UILabel *)self->_subtitleLabel setText:v14];

      v15 = [(id)v21 dismissHandler];
      BOOL v16 = v15 == 0;

      [(MapsLargerHitTargetButton *)self->_closeButton setHidden:v16];
      [(FeatureDiscoveryView *)self _setupActionButtonIfNeeded];
      v17 = [(id)v21 bodyTapHandler];

      tapGesture = self->_tapGesture;
      if (v17) {
        [(FeatureDiscoveryView *)self addGestureRecognizer:tapGesture];
      }
      else {
        [(FeatureDiscoveryView *)self removeGestureRecognizer:tapGesture];
      }
      if (v11) {
        uint64_t v19 = 7;
      }
      else {
        uint64_t v19 = 6;
      }
      if (v11) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = 7;
      }
      +[NSLayoutConstraint deactivateConstraints:*(void *)&self->MUFeatureDiscoveryAnnotationView_opaque[OBJC_IVAR___FeatureDiscoveryView__imageView[v19]]];
      +[NSLayoutConstraint activateConstraints:*(void *)&self->MUFeatureDiscoveryAnnotationView_opaque[OBJC_IVAR___FeatureDiscoveryView__imageView[v20]]];
      id v9 = (void *)v21;
    }
  }
}

- (void)_dismiss
{
  v3 = [(FeatureDiscoveryView *)self model];
  if (([v3 isDismissed] & 1) == 0)
  {
    double v4 = [(FeatureDiscoveryView *)self model];
    id v5 = [v4 dismissHandler];

    if (!v5) {
      goto LABEL_5;
    }
    v3 = [(FeatureDiscoveryView *)self model];
    objc_super v6 = [v3 dismissHandler];
    v6[2]();
  }
LABEL_5:
  id v7 = [(FeatureDiscoveryView *)self model];
  [v7 setDismissed:1];
}

- (void)_performAction
{
  id v7 = [(FeatureDiscoveryView *)self model];
  if ([v7 isDismissed])
  {
  }
  else
  {
    v3 = [(FeatureDiscoveryView *)self model];
    double v4 = [v3 actionHandler];

    if (v4)
    {
      id v5 = [(FeatureDiscoveryView *)self model];
      objc_super v6 = [v5 actionHandler];
      v6[2]();

      [(FeatureDiscoveryView *)self _configureActionButton];
    }
  }
}

- (void)_performBodyTap
{
  id v6 = [(FeatureDiscoveryView *)self model];
  if (([v6 isDismissed] & 1) == 0)
  {
    v3 = [(FeatureDiscoveryView *)self model];
    double v4 = [v3 bodyTapHandler];

    if (!v4) {
      return;
    }
    id v6 = [(FeatureDiscoveryView *)self model];
    id v5 = [v6 bodyTapHandler];
    v5[2]();
  }
}

- (void)_setupActionButtonIfNeeded
{
  long long v98 = 0u;
  v3 = objc_opt_class();
  double v4 = [(FeatureDiscoveryView *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];
  if (v3) {
    [v3 _metricsForIdiom:v5];
  }
  else {
    long long v98 = 0u;
  }

  id v6 = [(FeatureDiscoveryView *)self model];
  id v7 = [v6 dismissHandler];

  id v8 = [(FeatureDiscoveryView *)self model];
  uint64_t v9 = [v8 actionTitle];
  if (!v9)
  {
    if (v7)
    {
      uint64_t v14 = sub_1000BBB44(self);

      if (v14 != 5) {
        goto LABEL_14;
      }
LABEL_11:
      [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
      [(NSLayoutConstraint *)self->_closeButtonTrailingConstraint setActive:0];
      v15 = [(FeatureDiscoveryView *)self bottomAnchor];
      BOOL v16 = [(MapsLargerHitTargetButton *)self->_closeButton bottomAnchor];
      v17 = [v15 constraintEqualToAnchor:v16 constant:0.0];
      bottomConstraint = self->_bottomConstraint;
      self->_bottomConstraint = v17;

      uint64_t v19 = [(FeatureDiscoveryView *)self trailingAnchor];
      uint64_t v20 = [(MapsLargerHitTargetButton *)self->_closeButton trailingAnchor];
      unint64_t v21 = [v19 constraintEqualToAnchor:v20 constant:0.0];
      closeButtonTrailingConstraint = self->_closeButtonTrailingConstraint;
      self->_closeButtonTrailingConstraint = v21;

      v23 = self->_bottomConstraint;
      v102[0] = self->_closeButtonTrailingConstraint;
      v102[1] = v23;
      id v24 = +[NSArray arrayWithObjects:v102 count:2];
      +[NSLayoutConstraint activateConstraints:v24];
LABEL_16:

      return;
    }
LABEL_13:

    goto LABEL_14;
  }
  unsigned __int8 v10 = (void *)v9;
  v11 = [(FeatureDiscoveryView *)self model];
  v12 = [v11 actionTitle];
  if ([v12 length] || !v7)
  {

    goto LABEL_13;
  }
  uint64_t v13 = sub_1000BBB44(self);

  if (v13 == 5) {
    goto LABEL_11;
  }
LABEL_14:
  id v24 = [(FeatureDiscoveryView *)self model];
  double v25 = [v24 actionTitle];
  id v26 = [(UIButton *)self->_actionButton titleLabel];
  v27 = [v26 text];
  unint64_t v28 = v25;
  unint64_t v29 = v27;
  if (!(v28 | v29))
  {

    goto LABEL_16;
  }
  double v30 = (void *)v29;
  unsigned __int8 v31 = [(id)v28 isEqual:v29];

  if ((v31 & 1) == 0)
  {
    [(UIButton *)self->_actionButton removeFromSuperview];
    [(NSLayoutConstraint *)self->_bottomConstraint setActive:0];
    [(NSLayoutConstraint *)self->_closeButtonTrailingConstraint setActive:0];
    v32 = [(FeatureDiscoveryView *)self model];
    id v33 = [v32 actionTitle];
    id v34 = [v33 length];

    if (v34)
    {
      id v24 = objc_alloc_init((Class)NSMutableArray);
      if (sub_1000BBB44(self) == 5)
      {
        id v35 = +[UIButton buttonWithType:1];
        actionButton = self->_actionButton;
        self->_actionButton = v35;

        [(UIButton *)self->_actionButton setAccessibilityIdentifier:@"FeatureDiscoveryActionButton"];
        v37 = [(FeatureDiscoveryView *)self bottomAnchor];
        v38 = [(UIButton *)self->_actionButton bottomAnchor];
        double v39 = [v37 constraintEqualToAnchor:v38 constant:0.0];
        double v40 = self->_bottomConstraint;
        self->_bottomConstraint = v39;

        BOOL v41 = [(UIButton *)self->_actionButton leadingAnchor];
        double v42 = [(MapsLargerHitTargetButton *)self->_closeButton trailingAnchor];
        double v43 = [v41 constraintEqualToSystemSpacingAfterAnchor:v42 multiplier:1.0];
        v44 = self->_closeButtonTrailingConstraint;
        self->_closeButtonTrailingConstraint = v43;

        v100[0] = self->_closeButtonTrailingConstraint;
        uint64_t v45 = [(FeatureDiscoveryView *)self trailingAnchor];
        v46 = [(UIButton *)self->_actionButton trailingAnchor];
        v47 = [v45 constraintEqualToAnchor:v46 constant:0.0];
        v100[1] = v47;
        v48 = [(MapsLargerHitTargetButton *)self->_closeButton topAnchor];
        uint64_t v96 = [(UIButton *)self->_actionButton topAnchor];
        v97 = v48;
        v95 = [v48 constraintEqualToAnchor:v96];
        v100[2] = v95;
        v49 = [(MapsLargerHitTargetButton *)self->_closeButton bottomAnchor];
        v94 = [(UIButton *)self->_actionButton bottomAnchor];
        v93 = [v49 constraintEqualToAnchor:];
        v100[3] = v93;
        v50 = [(UIButton *)self->_actionButton topAnchor];
        uint64_t v92 = [(UIStackView *)self->_textStackView bottomAnchor];
        uint64_t v51 = [v50 constraintEqualToAnchor:* (double *) & v98];
        v52 = self->_bottomConstraint;
        v53 = (void *)v51;
        v100[4] = v51;
        v100[5] = v52;
        v54 = +[NSArray arrayWithObjects:v100 count:6];
        [v24 addObjectsFromArray:v54];
      }
      else
      {
        v60 = +[UIButton buttonWithType:0];
        uint64_t v61 = self->_actionButton;
        self->_actionButton = v60;

        [(UIButton *)self->_actionButton setAccessibilityIdentifier:@"FeatureDiscoveryActionButton"];
        [(UIButton *)self->_actionButton setContentHorizontalAlignment:4];
        v62 = [(UIButton *)self->_actionButton titleLabel];
        [v62 setLineBreakMode:4];

        v63 = [(UIButton *)self->_actionButton titleLabel];
        [v63 setNumberOfLines:0];

        v91 = +[UIButtonConfiguration plainButtonConfiguration];
        [v91 setContentInsets:*((double *)&v98 + 1), 0.0, 0.0, 0.0];
        [(UIButton *)self->_actionButton setConfiguration:v91];
        LODWORD(v64) = 1148846080;
        [(UIButton *)self->_actionButton setContentCompressionResistancePriority:1 forAxis:v64];
        double v65 = -[HairlineView initWithFrame:]([HairlineView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        [(HairlineView *)v65 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(FeatureDiscoveryView *)self addSubview:v65];
        double v66 = [(FeatureDiscoveryView *)self bottomAnchor];
        double v67 = [(UIButton *)self->_actionButton bottomAnchor];
        double v68 = [v66 constraintEqualToAnchor:v67];
        v69 = self->_bottomConstraint;
        self->_bottomConstraint = v68;

        v90 = [(UIButton *)self->_actionButton leadingAnchor];
        v97 = [(UIStackView *)self->_textStackView leadingAnchor];
        uint64_t v96 = [v90 constraintEqualToAnchor:];
        v99[0] = v96;
        double v70 = [(HairlineView *)v65 leadingAnchor];
        uint64_t v89 = [(UIButton *)self->_actionButton leadingAnchor];
        v95 = v70;
        v94 = [v70 constraintEqualToAnchor:v89];
        v99[1] = v94;
        double v71 = [(FeatureDiscoveryView *)self trailingAnchor];
        uint64_t v88 = [(HairlineView *)v65 trailingAnchor];
        v93 = v71;
        uint64_t v92 = [v71 constraintEqualToAnchor:v88];
        v99[2] = v92;
        v85 = [(HairlineView *)v65 bottomAnchor];
        v54 = [(UIStackView *)self->_textStackView bottomAnchor];
        uint64_t v87 = [v85 constraintEqualToAnchor:v54 constant:*(double *)&v98];
        v99[3] = v87;
        v86 = [(UIButton *)self->_actionButton trailingAnchor];
        v84 = [(MapsLargerHitTargetButton *)self->_closeButton leadingAnchor];
        v72 = [v86 constraintLessThanOrEqualToAnchor:v84];
        v99[4] = v72;
        v73 = [(UIButton *)self->_actionButton topAnchor];
        v74 = [(HairlineView *)v65 bottomAnchor];
        v75 = [v73 constraintEqualToAnchor:v74];
        v76 = self->_bottomConstraint;
        v99[5] = v75;
        v99[6] = v76;
        v77 = +[NSArray arrayWithObjects:v99 count:7];
        [v24 addObjectsFromArray:v77];

        v53 = v85;
        v50 = (void *)v88;

        v47 = v90;
        v46 = v65;
        v49 = (void *)v89;

        uint64_t v45 = v91;
      }

      [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v78 = [(UIButton *)self->_actionButton titleLabel];
      [v78 setAdjustsFontForContentSizeCategory:1];

      [(UIButton *)self->_actionButton setRole:1];
      v79 = [(FeatureDiscoveryView *)self model];
      v80 = [v79 actionHandler];
      [(UIButton *)self->_actionButton setEnabled:v80 != 0];

      [(UIButton *)self->_actionButton addTarget:self action:"_performAction" forControlEvents:64];
      [(FeatureDiscoveryView *)self addSubview:self->_actionButton];
      +[NSLayoutConstraint activateConstraints:v24];
      if (sub_1000BBB44(self) == 5)
      {
        v81 = self->_actionButton;
        v82 = [(FeatureDiscoveryView *)self model];
        v83 = [v82 actionTitle];
        [(UIButton *)v81 setTitle:v83 forState:0];
      }
      else
      {
        [(FeatureDiscoveryView *)self _configureActionButton];
      }
    }
    else
    {
      v55 = [(FeatureDiscoveryView *)self bottomAnchor];
      v56 = [(UIStackView *)self->_textStackView bottomAnchor];
      uint64_t v57 = [v55 constraintEqualToAnchor:v56 constant:0.0];
      v58 = self->_bottomConstraint;
      self->_bottomConstraint = v57;

      v101 = self->_bottomConstraint;
      v59 = +[NSArray arrayWithObjects:&v101 count:1];
      +[NSLayoutConstraint activateConstraints:v59];

      id v24 = self->_actionButton;
      self->_actionButton = 0;
    }
    goto LABEL_16;
  }
}

- (void)_configureActionButton
{
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v14 setObject:v3 forKeyedSubscript:NSFontAttributeName];

  double v4 = +[UIColor systemBlueColor];
  [v14 setObject:v4 forKeyedSubscript:NSForegroundColorAttributeName];

  [(UIButton *)self->_actionButton setUserInteractionEnabled:1];
  id v5 = [(FeatureDiscoveryView *)self model];
  if ([v5 shouldDisableAffordanceAfterAction])
  {
    id v6 = [(FeatureDiscoveryView *)self model];
    unsigned int v7 = [v6 hasActionExecuted];

    if (v7)
    {
      id v8 = +[UIColor systemGray2Color];
      [v14 setObject:v8 forKeyedSubscript:NSForegroundColorAttributeName];

      [(UIButton *)self->_actionButton setUserInteractionEnabled:0];
    }
  }
  else
  {
  }
  uint64_t v9 = [(FeatureDiscoveryModel *)self->_model actionTitle];
  if (v9)
  {
    id v10 = objc_alloc((Class)NSAttributedString);
    v11 = [(FeatureDiscoveryModel *)self->_model actionTitle];
    id v12 = [v10 initWithString:v11 attributes:v14];
  }
  else
  {
    id v12 = 0;
  }

  uint64_t v13 = [(UIButton *)self->_actionButton configuration];
  [v13 setAttributedTitle:v12];
  [(UIButton *)self->_actionButton setConfiguration:v13];
}

- (FeatureDiscoveryModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_closeButtonTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_constraintsWithoutImage, 0);
  objc_storeStrong((id *)&self->_constraintsWithImage, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_textStackView, 0);
}

@end