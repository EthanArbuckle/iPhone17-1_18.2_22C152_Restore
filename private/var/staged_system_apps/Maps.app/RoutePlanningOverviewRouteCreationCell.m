@interface RoutePlanningOverviewRouteCreationCell
+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize;
+ (double)heightForWidth:(double)a3 traitCollection:(id)a4;
- (RoutePlanningOverviewRouteCreationCell)initWithCoder:(id)a3;
- (RoutePlanningOverviewRouteCreationCell)initWithFrame:(CGRect)a3;
- (RoutePlanningOverviewRouteCreationCellDelegate)delegate;
- (void)_createSubviews;
- (void)_pressedCell;
- (void)customInit;
- (void)setDelegate:(id)a3;
@end

@implementation RoutePlanningOverviewRouteCreationCell

- (RoutePlanningOverviewRouteCreationCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOverviewRouteCreationCell;
  v3 = -[RoutePlanningOverviewRouteCreationCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(RoutePlanningOverviewRouteCreationCell *)v3 customInit];
  }
  return v4;
}

- (RoutePlanningOverviewRouteCreationCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningOverviewRouteCreationCell;
  v3 = [(RoutePlanningOverviewRouteCreationCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(RoutePlanningOverviewRouteCreationCell *)v3 customInit];
  }
  return v4;
}

- (void)customInit
{
  v3 = +[UIColor clearColor];
  [(RoutePlanningOverviewRouteCreationCell *)self setBackgroundColor:v3];

  v4 = +[UIColor clearColor];
  v5 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  [v5 setBackgroundColor:v4];

  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_1006CA6E0;
  v11 = &unk_1012E8B98;
  objc_copyWeak(&v12, &location);
  [(RoutePlanningOverviewRouteCreationCell *)self _setBackgroundViewConfigurationProvider:&v8];
  objc_super v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  -[RoutePlanningOverviewRouteCreationCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7, v8, v9, v10, v11);

  [(RoutePlanningOverviewRouteCreationCell *)self setSelectionStyle:1];
  [(RoutePlanningOverviewRouteCreationCell *)self _createSubviews];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_createSubviews
{
  v3 = objc_opt_new();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAccessibilityIdentifier:@"CreateRouteCellView"];
  v4 = +[UIColor secondarySystemGroupedBackgroundColor];
  [v3 setBackgroundColor:v4];

  [v3 _setContinuousCornerRadius:12.0];
  id v5 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_pressedCell"];
  [v3 addGestureRecognizer:v5];

  objc_super v6 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  [v6 addSubview:v3];

  v7 = objc_opt_new();
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v7];
  v8 = (UILabel *)objc_opt_new();
  [(UILabel *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v8 setAccessibilityIdentifier:@"CreateRouteTitle"];
  uint64_t v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"Create Route [Route Planning]" value:@"localized string not found" table:0];
  [(UILabel *)v8 setText:v10];

  v11 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleTitle3 weight:UIFontWeightSemibold];
  [(UILabel *)v8 setFont:v11];

  [(UILabel *)v8 setNumberOfLines:0];
  LODWORD(v12) = 1148846080;
  [(UILabel *)v8 setContentHuggingPriority:1 forAxis:v12];
  LODWORD(v13) = 1148846080;
  [(UILabel *)v8 setContentCompressionResistancePriority:1 forAxis:v13];
  [v7 addSubview:v8];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v8;
  v92 = v8;

  v15 = (UILabel *)objc_opt_new();
  [(UILabel *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v15 setAccessibilityIdentifier:@"CreateRouteSubtitle"];
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"Create Route Detail [Route Planning]" value:@"localized string not found" table:0];
  [(UILabel *)v15 setText:v17];

  [(UILabel *)v15 setNumberOfLines:0];
  v18 = +[UIColor secondaryLabelColor];
  [(UILabel *)v15 setTextColor:v18];

  v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)v15 setFont:v19];

  LODWORD(v20) = 1148846080;
  [(UILabel *)v15 setContentHuggingPriority:1 forAxis:v20];
  LODWORD(v21) = 1148846080;
  [(UILabel *)v15 setContentCompressionResistancePriority:1 forAxis:v21];
  [v7 addSubview:v15];
  bodyLabel = self->_bodyLabel;
  self->_bodyLabel = v15;
  v23 = v15;

  v24 = objc_opt_new();
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = +[UIColor secondarySystemFillColor];
  [v24 setBackgroundColor:v25];

  v26 = [v24 layer];
  [v26 setCornerRadius:10.0];

  [v24 setClipsToBounds:1];
  v27 = v24;
  [v3 addSubview:v24];
  v28 = objc_opt_new();
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setAccessibilityIdentifier:@"CreateRouteIcon"];
  v29 = v28;
  [v28 setContentMode:4];
  v30 = +[UIFont systemFontOfSize:28.0 weight:UIFontWeightSemibold];
  v111 = +[UIImageSymbolConfiguration configurationWithFont:v30];

  v31 = +[UIImage _systemImageNamed:@"location.bottomleft.forward.to.point.topright.scurvepath.dashed" withConfiguration:v111];
  [v29 setImage:v31];

  [v27 addSubview:v29];
  if (sub_1000BBB44(self) == 5) {
    double v32 = 10.0;
  }
  else {
    double v32 = 16.0;
  }
  v110 = [(RoutePlanningOverviewRouteCreationCell *)self heightAnchor];
  v109 = [v7 heightAnchor];
  v108 = [v110 constraintEqualToAnchor:v109 constant:52.0];
  v112[0] = v108;
  v107 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  v106 = [v107 heightAnchor];
  v105 = [v7 heightAnchor];
  v104 = [v106 constraintEqualToAnchor:v105 constant:52.0];
  v112[1] = v104;
  v102 = [v3 leadingAnchor];
  v103 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  v101 = [v103 leadingAnchor];
  v100 = [v102 constraintEqualToAnchor:v101 constant:v32];
  v112[2] = v100;
  v98 = [v3 trailingAnchor];
  v99 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  v97 = [v99 trailingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:-v32];
  v112[3] = v96;
  v94 = [v3 topAnchor];
  v95 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  v93 = [v95 topAnchor];
  v91 = [v94 constraintEqualToAnchor:v93];
  v112[4] = v91;
  v89 = [v3 bottomAnchor];
  v90 = [(RoutePlanningOverviewRouteCreationCell *)self contentView];
  v87 = [v90 bottomAnchor];
  v86 = [v89 constraintEqualToAnchor:v87];
  v112[5] = v86;
  v85 = [v27 trailingAnchor];
  v83 = [v3 trailingAnchor];
  v82 = [v85 constraintEqualToAnchor:v83 constant:-16.0];
  v112[6] = v82;
  v80 = [v27 centerYAnchor];
  v79 = [v3 centerYAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v112[7] = v78;
  v77 = [v27 widthAnchor];
  v76 = [v77 constraintEqualToConstant:64.0];
  v112[8] = v76;
  v75 = [v27 heightAnchor];
  v74 = [v75 constraintEqualToConstant:64.0];
  v112[9] = v74;
  v88 = v29;
  v73 = [v29 centerXAnchor];
  v72 = [v27 centerXAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v112[10] = v71;
  v70 = [v29 centerYAnchor];
  v84 = v27;
  v69 = [v27 centerYAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v112[11] = v68;
  v66 = [v7 leadingAnchor];
  v81 = v3;
  v65 = [v3 leadingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:18.0];
  v112[12] = v64;
  v63 = [v7 trailingAnchor];
  v62 = [v27 leadingAnchor];
  v61 = [v63 constraintEqualToAnchor:v62 constant:-16.0];
  v112[13] = v61;
  v60 = [v7 centerYAnchor];
  v59 = [v3 centerYAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v112[14] = v58;
  v57 = [v7 heightAnchor];
  v56 = [v57 constraintGreaterThanOrEqualToConstant:68.0];
  v112[15] = v56;
  v55 = [(UILabel *)v92 leadingAnchor];
  v54 = [v7 leadingAnchor];
  v53 = [v55 constraintEqualToAnchor:v54];
  v112[16] = v53;
  v52 = [(UILabel *)v92 trailingAnchor];
  v51 = [v7 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51];
  v112[17] = v50;
  v49 = [(UILabel *)v92 topAnchor];
  v48 = [v7 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v112[18] = v47;
  v46 = [(UILabel *)v23 leadingAnchor];
  v45 = [v7 leadingAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v112[19] = v44;
  v33 = v23;
  v43 = [(UILabel *)v23 trailingAnchor];
  v67 = v7;
  v42 = [v7 trailingAnchor];
  v34 = [v43 constraintEqualToAnchor:v42];
  v112[20] = v34;
  v35 = [(UILabel *)v33 topAnchor];
  v36 = [(UILabel *)v92 bottomAnchor];
  v37 = [v35 constraintEqualToAnchor:v36 constant:2.0];
  v112[21] = v37;
  v38 = [(UILabel *)v33 bottomAnchor];
  v39 = [v7 bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  v112[22] = v40;
  v41 = +[NSArray arrayWithObjects:v112 count:23];
  +[NSLayoutConstraint activateConstraints:v41];
}

- (void)_pressedCell
{
  id v3 = [(RoutePlanningOverviewRouteCreationCell *)self delegate];
  [v3 didTapRouteCreationButtonForCell:self];
}

+ (double)heightForWidth:(double)a3 traitCollection:(id)a4
{
  double v4 = a3 + -10.0 + -18.0 + -16.0 + -64.0 + -16.0 + -10.0;
  if (v4 <= 0.0) {
    return 68.0;
  }
  id v5 = [a4 preferredContentSizeCategory];
  if (!qword_10160F5D8
    || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)qword_10160F5E0, (UIContentSizeCategory)v5))
  {
    objc_super v6 = -[RoutePlanningOverviewRouteCreationCell initWithFrame:]([RoutePlanningOverviewRouteCreationCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v7 = (void *)qword_10160F5D8;
    qword_10160F5D8 = (uint64_t)v6;

    objc_storeStrong((id *)&qword_10160F5E0, v5);
  }
  [*(id *)(qword_10160F5D8 + 8) sizeThatFits:v4];
  double v9 = v8;
  [*(id *)(qword_10160F5D8 + 16) sizeThatFits:v4];
  double v11 = fmax(v9 + 2.0 + v10 + 52.0, 68.0);

  return v11;
}

+ (BOOL)_maps_overridePreferredLayoutAttributesWithCompressedSize
{
  return 0;
}

- (RoutePlanningOverviewRouteCreationCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutePlanningOverviewRouteCreationCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bodyLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end