@interface CarManeuverBannerView
- (BNBannerSource)target;
- (BOOL)aperturePresentation;
- (BOOL)isAccessibilityElement;
- (BannerItem)item;
- (CGSize)sizeThatFits:(CGSize)result;
- (CarManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5;
- (id)accessibilityLabel;
- (unint64_t)bannerType;
- (void)updateFromBannerItem;
@end

@implementation CarManeuverBannerView

- (CarManeuverBannerView)initWithTarget:(id)a3 item:(id)a4 aperturePresentation:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v89.receiver = self;
  v89.super_class = (Class)CarManeuverBannerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[CarManeuverBannerView initWithFrame:](&v89, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v12)
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    [(CarManeuverBannerView *)v12 setAccessibilityIdentifier:v14];

    objc_storeWeak((id *)&v12->_target, v7);
    objc_storeStrong((id *)&v12->_item, a4);
    v15 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    maneuverView = v12->_maneuverView;
    v12->_maneuverView = v15;

    [(GuidanceManeuverView *)v12->_maneuverView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GuidanceManeuverView *)v12->_maneuverView setShieldIdiom:1];
    uint64_t v17 = objc_opt_new();
    primaryLabel = v12->_primaryLabel;
    v12->_primaryLabel = (UILabel *)v17;

    [(UILabel *)v12->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
    [(UILabel *)v12->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v19 = objc_opt_new();
    id v88 = v7;
    secondaryLabel = v12->_secondaryLabel;
    v12->_secondaryLabel = (UILabel *)v19;

    [(UILabel *)v12->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
    [(UILabel *)v12->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    id v21 = objc_alloc((Class)UIStackView);
    v91[0] = v12->_primaryLabel;
    v91[1] = v12->_secondaryLabel;
    v22 = +[NSArray arrayWithObjects:v91 count:2];
    v23 = (UIStackView *)[v21 initWithArrangedSubviews:v22];
    labelStackView = v12->_labelStackView;
    v12->_labelStackView = v23;

    [(UIStackView *)v12->_labelStackView setAccessibilityIdentifier:@"LabelStackView"];
    [(UIStackView *)v12->_labelStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v12->_labelStackView setAxis:1];
    [(UIStackView *)v12->_labelStackView setDistribution:2];
    [(UIStackView *)v12->_labelStackView setAlignment:0];
    uint64_t v25 = objc_opt_new();
    shieldImageView = v12->_shieldImageView;
    v12->_shieldImageView = (UIImageView *)v25;

    [(UIImageView *)v12->_shieldImageView setAccessibilityIdentifier:@"ShieldImageView"];
    [(UIImageView *)v12->_shieldImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v12->_shieldImageView setContentMode:1];
    uint64_t v27 = +[CPUIBannerViewButton buttonWithChevronImage];
    actionButton = v12->_actionButton;
    v12->_actionButton = (CPUIBannerViewButton *)v27;

    [(CPUIBannerViewButton *)v12->_actionButton setAccessibilityIdentifier:@"ActionButton"];
    [(CPUIBannerViewButton *)v12->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = +[CarDisplayController sharedInstance];
    v30 = [v29 window];
    v31 = [v30 windowScene];
    [v31 focusSystem];
    v32 = id v87 = v8;
    [(CPUIBannerViewButton *)v12->_actionButton setSelected:v32 != 0];

    LODWORD(v33) = 1148846080;
    [(CPUIBannerViewButton *)v12->_actionButton setContentHuggingPriority:0 forAxis:v33];
    LODWORD(v34) = 1148846080;
    [(CPUIBannerViewButton *)v12->_actionButton setContentHuggingPriority:1 forAxis:v34];
    LODWORD(v35) = 1148846080;
    [(CPUIBannerViewButton *)v12->_actionButton setContentCompressionResistancePriority:0 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(CPUIBannerViewButton *)v12->_actionButton setContentCompressionResistancePriority:1 forAxis:v36];
    [(CarManeuverBannerView *)v12 addSubview:v12->_maneuverView];
    [(CarManeuverBannerView *)v12 addSubview:v12->_labelStackView];
    [(CarManeuverBannerView *)v12 addSubview:v12->_shieldImageView];
    [(CarManeuverBannerView *)v12 addSubview:v12->_actionButton];
    v37 = [(UIStackView *)v12->_labelStackView trailingAnchor];
    v38 = [(UIImageView *)v12->_shieldImageView leadingAnchor];
    uint64_t v39 = [v37 constraintEqualToAnchor:v38 constant:-12.0];
    labelsToShieldConstraint = v12->_labelsToShieldConstraint;
    v12->_labelsToShieldConstraint = (NSLayoutConstraint *)v39;

    v41 = [(UIStackView *)v12->_labelStackView trailingAnchor];
    v42 = [(CPUIBannerViewButton *)v12->_actionButton leadingAnchor];
    uint64_t v43 = [v41 constraintEqualToAnchor:v42 constant:-12.0];
    labelsToButtonConstraint = v12->_labelsToButtonConstraint;
    v12->_labelsToButtonConstraint = (NSLayoutConstraint *)v43;

    v45 = [(UIImageView *)v12->_shieldImageView widthAnchor];
    uint64_t v46 = [v45 constraintEqualToConstant:0.0];
    shieldWidthConstraint = v12->_shieldWidthConstraint;
    v12->_shieldWidthConstraint = (NSLayoutConstraint *)v46;

    v86 = [(GuidanceManeuverView *)v12->_maneuverView leadingAnchor];
    v85 = [(CarManeuverBannerView *)v12 leadingAnchor];
    v84 = [v86 constraintEqualToAnchor:v85 constant:12.0];
    v90[0] = v84;
    v83 = [(GuidanceManeuverView *)v12->_maneuverView widthAnchor];
    v82 = [v83 constraintEqualToConstant:33.0];
    v90[1] = v82;
    v81 = [(GuidanceManeuverView *)v12->_maneuverView centerYAnchor];
    v80 = [(CarManeuverBannerView *)v12 centerYAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v90[2] = v79;
    v78 = [(GuidanceManeuverView *)v12->_maneuverView heightAnchor];
    v77 = [v78 constraintEqualToConstant:33.0];
    v90[3] = v77;
    v76 = [(CPUIBannerViewButton *)v12->_actionButton trailingAnchor];
    v75 = [(CarManeuverBannerView *)v12 trailingAnchor];
    v74 = [v76 constraintEqualToAnchor:v75 constant:-12.0];
    v90[4] = v74;
    v73 = [(CPUIBannerViewButton *)v12->_actionButton widthAnchor];
    v72 = [v73 constraintEqualToConstant:29.0];
    v90[5] = v72;
    v71 = [(CPUIBannerViewButton *)v12->_actionButton centerYAnchor];
    v70 = [(CarManeuverBannerView *)v12 centerYAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v90[6] = v69;
    v68 = [(CPUIBannerViewButton *)v12->_actionButton heightAnchor];
    v67 = [v68 constraintEqualToConstant:29.0];
    v90[7] = v67;
    v66 = [(UIImageView *)v12->_shieldImageView trailingAnchor];
    v65 = [(CPUIBannerViewButton *)v12->_actionButton leadingAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:-12.0];
    v90[8] = v64;
    v90[9] = v12->_shieldWidthConstraint;
    v63 = [(UIImageView *)v12->_shieldImageView heightAnchor];
    v62 = [v63 constraintEqualToConstant:16.0];
    v90[10] = v62;
    v61 = [(UIImageView *)v12->_shieldImageView centerYAnchor];
    v60 = [(CarManeuverBannerView *)v12 centerYAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v90[11] = v59;
    v58 = [(UIStackView *)v12->_labelStackView leadingAnchor];
    v57 = [(GuidanceManeuverView *)v12->_maneuverView trailingAnchor];
    v48 = [v58 constraintEqualToAnchor:v57 constant:12.0];
    v90[12] = v48;
    v49 = [(UIStackView *)v12->_labelStackView topAnchor];
    v50 = [(CarManeuverBannerView *)v12 topAnchor];
    v51 = [v49 constraintEqualToAnchor:v50 constant:3.0];
    v90[13] = v51;
    v52 = [(UIStackView *)v12->_labelStackView bottomAnchor];
    v53 = [(CarManeuverBannerView *)v12 bottomAnchor];
    v54 = [v52 constraintEqualToAnchor:v53 constant:-3.0];
    v90[14] = v54;
    v55 = +[NSArray arrayWithObjects:v90 count:15];
    +[NSLayoutConstraint activateConstraints:v55];

    id v8 = v87;
    id v7 = v88;

    [(CarManeuverBannerView *)v12 updateFromBannerItem];
  }

  return v12;
}

- (void)updateFromBannerItem
{
  v3 = [(CarManeuverBannerView *)self maneuverItem];
  v4 = [v3 maneuverGuidanceInfo];

  v5 = [(CarManeuverBannerView *)self item];
  v6 = [v5 guidanceState];
  id v7 = [v6 junction];
  if ([v7 type] == 1)
  {
    id v8 = +[UIColor labelColor];
    v9 = [v8 colorWithAlphaComponent:0.600000024];
    p_maneuverView = &self->_maneuverView;
    [(GuidanceManeuverView *)self->_maneuverView setAccentColor:v9];
  }
  else
  {
    id v8 = +[UIColor clearColor];
    p_maneuverView = &self->_maneuverView;
    [(GuidanceManeuverView *)self->_maneuverView setAccentColor:v8];
  }

  v11 = [v4 maneuverArtwork];
  [(GuidanceManeuverView *)*p_maneuverView setManeuverArtwork:v11];

  if (qword_101610910 != -1) {
    dispatch_once(&qword_101610910, &stru_101319CA0);
  }
  [(UIStackView *)self->_labelStackView frame];
  double v13 = v12;
  v14 = [v4 majorTextAlternatives];
  v15 = (void *)qword_101610900;
  id v16 = v14;
  id v17 = v15;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v18 = v16;
  id v19 = [v18 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v19)
  {
    id v20 = v19;
    id v21 = 0;
    uint64_t v22 = *(void *)v68;
LABEL_8:
    v23 = 0;
    v24 = v21;
    while (1)
    {
      if (*(void *)v68 != v22) {
        objc_enumerationMutation(v18);
      }
      uint64_t v25 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)v23) multiPartAttributedStringWithAttributes:v17];
      id v21 = [v25 attributedString];

      [v21 boundingRectWithSize:1 options:0 context:1.79769313e308];
      if (v26 < v13) {
        break;
      }
      v23 = (char *)v23 + 1;
      v24 = v21;
      if (v20 == v23)
      {
        id v20 = [v18 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v20) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
  else
  {
    id v21 = 0;
  }

  uint64_t v27 = [v65[3] attributedText];
  unint64_t v28 = v21;
  unint64_t v29 = v27;
  if (v28 | v29)
  {
    v30 = (void *)v29;
    unsigned __int8 v31 = [(id)v28 isEqual:v29];

    if ((v31 & 1) == 0) {
      [v65[3] setAttributedText:v28];
    }
  }
  v66 = v4;
  v32 = [v4 minorTextAlternatives];
  double v33 = (void *)qword_101610908;
  id v34 = v32;
  id v35 = v33;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v36 = v34;
  id v37 = [v36 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v37)
  {
    id v38 = v37;
    uint64_t v39 = 0;
    uint64_t v40 = *(void *)v68;
LABEL_21:
    v41 = 0;
    v42 = v39;
    while (1)
    {
      if (*(void *)v68 != v40) {
        objc_enumerationMutation(v36);
      }
      uint64_t v43 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)v41) multiPartAttributedStringWithAttributes:v35];
      uint64_t v39 = [v43 attributedString];

      [v39 boundingRectWithSize:1 options:0 context:1.79769313e308 1.79769313e308];
      if (v44 < v13) {
        break;
      }
      v41 = (char *)v41 + 1;
      v42 = v39;
      if (v38 == v41)
      {
        id v38 = [v36 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (v38) {
          goto LABEL_21;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v39 = 0;
  }

  v45 = [v65[4] attributedText];
  unint64_t v46 = v39;
  unint64_t v47 = v45;
  if (v46 | v47)
  {
    v48 = (void *)v47;
    unsigned __int8 v49 = [(id)v46 isEqual:v47];

    if ((v49 & 1) == 0) {
      [v65[4] setAttributedText:v46];
    }
  }
  v50 = [v66 shieldInfo];
  v51 = v50;
  if (v50)
  {
    if (![v50 isEqual:v65[7]])
    {
      v53 = +[UIScreen _carScreen];
      [v53 scale];
      double v55 = v54;

      v56 = [v51 shieldImageWithSize:5 scale:1 idiom:v55];
      v57 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v56 image], 0, v55);
      [v65[5] setImage:v57];
      objc_storeStrong(v65 + 7, v51);
      if (v57)
      {
        [v57 size];
        double v59 = 16.0 / v58;
        [v57 size];
        double v61 = v59 * v60;
      }
      else
      {
        double v61 = 0.0;
      }
      [v65[12] setConstant:v61];
    }
  }
  else
  {
    [v65[5] setImage:0];
    id v52 = v65[7];
    v65[7] = 0;

    [v65[12] setConstant:0.0];
  }
  v62 = [v65[5] image];

  if (v62) {
    uint64_t v63 = 9;
  }
  else {
    uint64_t v63 = 8;
  }
  if (v62) {
    uint64_t v64 = 8;
  }
  else {
    uint64_t v64 = 9;
  }
  [*(id *)((char *)v65 + OBJC_IVAR___CarManeuverBannerView__target[v63]) setActive:0];
  [*(id *)((char *)v65 + OBJC_IVAR___CarManeuverBannerView__target[v64]) setActive:1];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 54.0;
  result.double height = v3;
  return result;
}

- (unint64_t)bannerType
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = [(UILabel *)self->_primaryLabel accessibilityLabel];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [(UILabel *)self->_primaryLabel accessibilityLabel];
    [v3 addObject:v6];
  }
  id v7 = [(UILabel *)self->_secondaryLabel accessibilityLabel];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [(UILabel *)self->_secondaryLabel accessibilityLabel];
    [v3 addObject:v9];
  }
  v10 = [v3 componentsJoinedByString:@", "];

  return v10;
}

- (BNBannerSource)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (BNBannerSource *)WeakRetained;
}

- (BannerItem)item
{
  return self->_item;
}

- (BOOL)aperturePresentation
{
  return self->_aperturePresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_target);
  objc_storeStrong((id *)&self->_shieldWidthConstraint, 0);
  objc_storeStrong((id *)&self->_labelsToButtonConstraint, 0);
  objc_storeStrong((id *)&self->_labelsToShieldConstraint, 0);
  objc_storeStrong((id *)&self->_selectedSecondaryString, 0);
  objc_storeStrong((id *)&self->_selectedPrimaryString, 0);
  objc_storeStrong((id *)&self->_cachedShieldInfo, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);

  objc_storeStrong((id *)&self->_maneuverView, 0);
}

@end