@interface ResultsTitleView
- (BOOL)editButtonHidden;
- (BOOL)editSearchButtonWillTruncate;
- (NSString)subtitle;
- (NSString)title;
- (ResultsTitleView)initWithFrame:(CGRect)a3;
- (ResultsTitleViewDelegate)delegate;
- (UIImage)headerImage;
- (id)effectiveTraitCollectionWithTraitCollection:(id)a3;
- (id)subtitlefontWithTraitCollection:(id)a3;
- (id)titlefontWithTraitCollection:(id)a3;
- (void)centerTitleVertically:(BOOL)a3;
- (void)didTapEditButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditButtonHidden:(BOOL)a3;
- (void)setHeaderImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateEditSearchButtonConstraints;
- (void)updateHeaderContent;
- (void)updateLabelFonts;
- (void)updateTitleNumberOfLines;
@end

@implementation ResultsTitleView

- (ResultsTitleView)initWithFrame:(CGRect)a3
{
  v124.receiver = self;
  v124.super_class = (Class)ResultsTitleView;
  v3 = -[ResultsTitleView initWithFrame:](&v124, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ResultsTitleView *)v3 setAccessibilityIdentifier:@"ResultsTitleView"];
    v5 = -[MapsThemeButton initWithFrame:]([MapsThemeButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    editSearchButton = v4->_editSearchButton;
    v4->_editSearchButton = v5;

    [(MapsThemeButton *)v4->_editSearchButton setAccessibilityIdentifier:@"EditSearchButton"];
    [(MapsThemeButton *)v4->_editSearchButton setTitleColorProvider:&stru_1012F7D28];
    [(MapsThemeButton *)v4->_editSearchButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeButton *)v4->_editSearchButton setContentHorizontalAlignment:4];
    [(MapsThemeButton *)v4->_editSearchButton addTarget:v4 action:"didTapEditButton:" forControlEvents:64];
    v7 = v4->_editSearchButton;
    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Edit Search" value:@"localized string not found" table:0];
    [(MapsThemeButton *)v7 setTitle:v9 forState:0];

    v10 = objc_alloc_init(MapsThemeLabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    [(MapsThemeLabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(MapsThemeLabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = +[UIColor clearColor];
    [(MapsThemeLabel *)v4->_titleLabel setBackgroundColor:v12];

    v13 = +[UIColor labelColor];
    [(MapsThemeLabel *)v4->_titleLabel setTextColor:v13];

    v14 = objc_alloc_init(MapsThemeLabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    [(MapsThemeLabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    [(MapsThemeLabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIColor clearColor];
    [(MapsThemeLabel *)v4->_subtitleLabel setBackgroundColor:v16];

    v17 = +[UIColor secondaryLabelColor];
    [(MapsThemeLabel *)v4->_subtitleLabel setTextColor:v17];

    v18 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    headerImageView = v4->_headerImageView;
    v4->_headerImageView = v18;

    [(UIImageView *)v4->_headerImageView setAccessibilityIdentifier:@"HeaderImageView"];
    [(UIImageView *)v4->_headerImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ResultsTitleView *)v4 updateLabelFonts];
    [(ResultsTitleView *)v4 updateTitleNumberOfLines];
    [(ResultsTitleView *)v4 addSubview:v4->_titleLabel];
    [(ResultsTitleView *)v4 addSubview:v4->_subtitleLabel];
    [(ResultsTitleView *)v4 addSubview:v4->_editSearchButton];
    [(ResultsTitleView *)v4 addSubview:v4->_headerImageView];
    v20 = [(MapsThemeButton *)v4->_editSearchButton leadingAnchor];
    v21 = [(MapsThemeLabel *)v4->_subtitleLabel trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v128[0] = v22;
    v23 = [(MapsThemeButton *)v4->_editSearchButton firstBaselineAnchor];
    v24 = [(MapsThemeLabel *)v4->_subtitleLabel firstBaselineAnchor];
    LODWORD(v25) = 1148846080;
    v26 = [v23 constraintEqualToAnchor:v24 constant:0.0 priority:v25];
    v128[1] = v26;
    v27 = [(ResultsTitleView *)v4 heightAnchor];
    v28 = [v27 constraintGreaterThanOrEqualToConstant:82.0];
    v128[2] = v28;
    uint64_t v29 = +[NSArray arrayWithObjects:v128 count:3];
    singleLineEditSearchConstraints = v4->_singleLineEditSearchConstraints;
    v4->_singleLineEditSearchConstraints = (NSArray *)v29;

    v120 = [(MapsThemeButton *)v4->_editSearchButton leadingAnchor];
    v117 = [(MapsThemeLabel *)v4->_subtitleLabel leadingAnchor];
    v31 = [v120 constraintEqualToAnchor:v117];
    v127[0] = v31;
    v32 = [(MapsThemeButton *)v4->_editSearchButton topAnchor];
    v33 = [(MapsThemeLabel *)v4->_subtitleLabel bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33 constant:1.5];
    v127[1] = v34;
    v35 = [(MapsThemeLabel *)v4->_subtitleLabel trailingAnchor];
    v36 = [(ResultsTitleView *)v4 trailingAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v127[2] = v37;
    v38 = [(ResultsTitleView *)v4 heightAnchor];
    v39 = [v38 constraintGreaterThanOrEqualToConstant:170.0];
    v127[3] = v39;
    uint64_t v40 = +[NSArray arrayWithObjects:v127 count:4];
    multipleLineEditSearchConstraints = v4->_multipleLineEditSearchConstraints;
    v4->_multipleLineEditSearchConstraints = (NSArray *)v40;

    v42 = [(MapsThemeLabel *)v4->_titleLabel centerYAnchor];
    v43 = [(ResultsTitleView *)v4 centerYAnchor];
    LODWORD(v44) = 1144750080;
    uint64_t v45 = [v42 constraintEqualToAnchor:v43 constant:0.0 priority:v44];
    topLabelCenterYConstraint = v4->_topLabelCenterYConstraint;
    v4->_topLabelCenterYConstraint = (NSLayoutConstraint *)v45;

    v47 = [(MapsThemeLabel *)v4->_subtitleLabel trailingAnchor];
    v48 = [(ResultsTitleView *)v4 trailingAnchor];
    uint64_t v49 = [v47 constraintEqualToAnchor:v48];
    subTitleTrailingConstraint = v4->_subTitleTrailingConstraint;
    v4->_subTitleTrailingConstraint = (NSLayoutConstraint *)v49;

    v121 = [(MapsThemeLabel *)v4->_titleLabel leadingAnchor];
    v118 = [(ResultsTitleView *)v4 leadingAnchor];
    v115 = [v121 constraintEqualToAnchor:v118 constant:16.0];
    v126[0] = v115;
    v113 = [(MapsThemeLabel *)v4->_titleLabel trailingAnchor];
    v111 = [(ResultsTitleView *)v4 trailingAnchor];
    v109 = [v113 constraintEqualToAnchor:v111 constant:0.0];
    v126[1] = v109;
    v107 = [(MapsThemeLabel *)v4->_titleLabel topAnchor];
    v105 = [(ResultsTitleView *)v4 topAnchor];
    v103 = [v107 constraintEqualToAnchor:v105 constant:16.0];
    v126[2] = v103;
    v101 = [(MapsThemeLabel *)v4->_subtitleLabel leadingAnchor];
    v99 = [(MapsThemeLabel *)v4->_titleLabel leadingAnchor];
    v97 = [v101 constraintEqualToAnchor:v99];
    v126[3] = v97;
    v51 = [(MapsThemeLabel *)v4->_subtitleLabel topAnchor];
    v52 = [(MapsThemeLabel *)v4->_titleLabel bottomAnchor];
    LODWORD(v53) = 1148846080;
    v54 = [v51 constraintEqualToAnchor:v52 constant:1.5 priority:v53];
    v126[4] = v54;
    v55 = [(MapsThemeButton *)v4->_editSearchButton trailingAnchor];
    v56 = [(ResultsTitleView *)v4 trailingAnchor];
    v57 = [v55 constraintLessThanOrEqualToAnchor:v56];
    v126[5] = v57;
    v58 = [(ResultsTitleView *)v4 bottomAnchor];
    v59 = [(MapsThemeButton *)v4->_editSearchButton lastBaselineAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:24.0];
    v126[6] = v60;
    uint64_t v61 = +[NSArray arrayWithObjects:v126 count:7];
    titleHeaderConstraints = v4->_titleHeaderConstraints;
    v4->_titleHeaderConstraints = (NSArray *)v61;

    id v63 = objc_alloc_init((Class)UILayoutGuide);
    [(ResultsTitleView *)v4 addLayoutGuide:v63];
    v122 = [v63 topAnchor];
    v119 = [(MapsThemeLabel *)v4->_titleLabel topAnchor];
    v116 = [v122 constraintEqualToAnchor:v119];
    v125[0] = v116;
    v114 = [v63 bottomAnchor];
    v112 = [(MapsThemeLabel *)v4->_subtitleLabel bottomAnchor];
    v108 = [v114 constraintEqualToAnchor:v112];
    v125[1] = v108;
    v106 = [v63 leadingAnchor];
    v104 = [(ResultsTitleView *)v4 leadingAnchor];
    v102 = [v106 constraintEqualToAnchor:v104 constant:16.0];
    v125[2] = v102;
    v100 = [(UIImageView *)v4->_headerImageView leadingAnchor];
    v110 = v63;
    v98 = [v63 leadingAnchor];
    v96 = [v100 constraintEqualToAnchor:v98];
    v125[3] = v96;
    v95 = [(UIImageView *)v4->_headerImageView centerYAnchor];
    v94 = [v63 centerYAnchor];
    v93 = [v95 constraintEqualToAnchor:v94];
    v125[4] = v93;
    v92 = [(UIImageView *)v4->_headerImageView widthAnchor];
    v91 = [v92 constraintEqualToConstant:30.0];
    v125[5] = v91;
    v90 = [(UIImageView *)v4->_headerImageView heightAnchor];
    v89 = [v90 constraintEqualToConstant:30.0];
    v125[6] = v89;
    v88 = [(MapsThemeLabel *)v4->_titleLabel leadingAnchor];
    v123 = [(UIImageView *)v4->_headerImageView trailingAnchor];
    v87 = [v88 constraintEqualToAnchor:v123 constant:10.0];
    v125[7] = v87;
    v86 = [(MapsThemeLabel *)v4->_titleLabel trailingAnchor];
    v85 = [(ResultsTitleView *)v4 trailingAnchor];
    v84 = [v86 constraintEqualToAnchor:v85];
    v125[8] = v84;
    v83 = [(MapsThemeLabel *)v4->_titleLabel topAnchor];
    v82 = [(ResultsTitleView *)v4 topAnchor];
    v81 = [v83 constraintEqualToAnchor:v82 constant:16.0];
    v125[9] = v81;
    v80 = [(MapsThemeLabel *)v4->_subtitleLabel leadingAnchor];
    v79 = [(MapsThemeLabel *)v4->_titleLabel leadingAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v125[10] = v78;
    v64 = [(MapsThemeLabel *)v4->_subtitleLabel topAnchor];
    v65 = [(MapsThemeLabel *)v4->_titleLabel bottomAnchor];
    LODWORD(v66) = 1148846080;
    v67 = [v64 constraintEqualToAnchor:v65 constant:1.5 priority:v66];
    v125[11] = v67;
    v68 = [(MapsThemeButton *)v4->_editSearchButton trailingAnchor];
    v69 = [(ResultsTitleView *)v4 trailingAnchor];
    v70 = [v68 constraintLessThanOrEqualToAnchor:v69];
    v125[12] = v70;
    v71 = [(ResultsTitleView *)v4 bottomAnchor];
    v72 = [(MapsThemeButton *)v4->_editSearchButton lastBaselineAnchor];
    v73 = [v71 constraintEqualToAnchor:v72 constant:24.0];
    v125[13] = v73;
    uint64_t v74 = +[NSArray arrayWithObjects:v125 count:14];
    imageHeaderConstraints = v4->_imageHeaderConstraints;
    v4->_imageHeaderConstraints = (NSArray *)v74;

    v76 = +[NSNotificationCenter defaultCenter];
    [v76 addObserver:v4 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  [(ResultsTitleView *)v4 updateHeaderContent];
  return v4;
}

- (void)setHeaderImage:(id)a3
{
  objc_storeStrong((id *)&self->_headerImage, a3);

  [(ResultsTitleView *)self updateHeaderContent];
}

- (id)effectiveTraitCollectionWithTraitCollection:(id)a3
{
  return [a3 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
}

- (id)subtitlefontWithTraitCollection:(id)a3
{
  return +[UIFont system15CompatibleWithTraitCollection:a3];
}

- (id)titlefontWithTraitCollection:(id)a3
{
  return +[UIFont system22SemiboldCompatibleWithTraitCollection:a3];
}

- (void)updateHeaderContent
{
  [(ResultsTitleView *)self updateLabelFonts];
  [(ResultsTitleView *)self updateTitleNumberOfLines];
  v3 = [(ResultsTitleView *)self headerImage];

  if (v3)
  {
    v4 = [(ResultsTitleView *)self headerImage];
    v5 = &OBJC_IVAR___ResultsTitleView__titleHeaderConstraints;
    p_headerImageView = &self->_headerImageView;
    [(UIImageView *)self->_headerImageView setImage:v4];

    v7 = &OBJC_IVAR___ResultsTitleView__imageHeaderConstraints;
  }
  else
  {
    v7 = &OBJC_IVAR___ResultsTitleView__titleHeaderConstraints;
    v5 = &OBJC_IVAR___ResultsTitleView__imageHeaderConstraints;
    p_headerImageView = &self->_headerImageView;
  }
  [(UIImageView *)*p_headerImageView setHidden:v3 == 0];
  +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v7)];
  +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  [(MapsThemeButton *)self->_editSearchButton setHidden:self->_editButtonHidden];
  [(NSLayoutConstraint *)self->_subTitleTrailingConstraint setActive:self->_editButtonHidden];

  [(ResultsTitleView *)self updateEditSearchButtonConstraints];
}

- (void)updateLabelFonts
{
  v3 = [(ResultsTitleView *)self traitCollection];
  id v7 = [(ResultsTitleView *)self effectiveTraitCollectionWithTraitCollection:v3];

  v4 = [(ResultsTitleView *)self titlefontWithTraitCollection:v7];
  v5 = [(ResultsTitleView *)self subtitlefontWithTraitCollection:v7];
  [(MapsThemeLabel *)self->_titleLabel setFont:v4];
  [(MapsThemeLabel *)self->_subtitleLabel setFont:v5];
  v6 = [(MapsThemeButton *)self->_editSearchButton titleLabel];
  [v6 setFont:v5];
}

- (void)updateEditSearchButtonConstraints
{
  v3 = &OBJC_IVAR___ResultsTitleView__singleLineEditSearchConstraints;
  if ([(ResultsTitleView *)self editSearchButtonWillTruncate]
    && +[UIFont accessibilityTextEnabled])
  {
    v4 = &OBJC_IVAR___ResultsTitleView__singleLineEditSearchConstraints;
    v3 = &OBJC_IVAR___ResultsTitleView__multipleLineEditSearchConstraints;
  }
  else
  {
    v4 = &OBJC_IVAR___ResultsTitleView__multipleLineEditSearchConstraints;
  }
  +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v3)];
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v4);

  +[NSLayoutConstraint deactivateConstraints:v5];
}

- (BOOL)editSearchButtonWillTruncate
{
  v3 = [(MapsThemeLabel *)self->_subtitleLabel text];
  v4 = [(MapsThemeButton *)self->_editSearchButton titleLabel];
  uint64_t v5 = [v4 text];
  v6 = +[NSString stringWithFormat:@"%@%@", v3, v5];

  id v7 = [(ResultsTitleView *)self traitCollection];
  v8 = [(ResultsTitleView *)self effectiveTraitCollectionWithTraitCollection:v7];

  NSAttributedStringKey v26 = NSFontAttributeName;
  v9 = [(ResultsTitleView *)self subtitlefontWithTraitCollection:v8];
  v27 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  [v6 sizeWithAttributes:v10];
  double v12 = v11;

  [(ResultsTitleView *)self frame];
  double v14 = v13;
  [(ResultsTitleView *)self layoutMargins];
  double v16 = v14 - v15;
  [(ResultsTitleView *)self layoutMargins];
  double v18 = 0.0;
  if (v16 - v17 >= 0.0)
  {
    [(ResultsTitleView *)self frame];
    double v20 = v19;
    [(ResultsTitleView *)self layoutMargins];
    double v22 = v20 - v21;
    [(ResultsTitleView *)self layoutMargins];
    double v18 = v22 - v23;
  }
  BOOL v24 = ceil(v12) > v18;

  return v24;
}

- (void)updateTitleNumberOfLines
{
  if (+[UIFont accessibilityTextEnabled]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(MapsThemeLabel *)self->_titleLabel setNumberOfLines:v3];
  subtitleLabel = self->_subtitleLabel;

  [(MapsThemeLabel *)subtitleLabel setNumberOfLines:v3];
}

- (void)didTapEditButton:(id)a3
{
  v4 = [(ResultsTitleView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(ResultsTitleView *)self delegate];
    id v7 = [v6 currentUITargetForAnalytics];
  }
  else
  {
    id v7 = 0;
  }
  v8 = +[MKMapService sharedService];
  [v8 captureUserAction:2033 onTarget:v7 eventValue:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained editSearchButtonTapped];
}

- (NSString)title
{
  return (NSString *)[(MapsThemeLabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return (NSString *)[(MapsThemeLabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
}

- (void)centerTitleVertically:(BOOL)a3
{
}

- (void)setEditButtonHidden:(BOOL)a3
{
  self->_editButtonHidden = a3;
  -[MapsThemeButton setHidden:](self->_editSearchButton, "setHidden:");
}

- (ResultsTitleViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ResultsTitleViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (BOOL)editButtonHidden
{
  return self->_editButtonHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_imageHeaderConstraints, 0);
  objc_storeStrong((id *)&self->_multipleLineEditSearchConstraints, 0);
  objc_storeStrong((id *)&self->_singleLineEditSearchConstraints, 0);
  objc_storeStrong((id *)&self->_subTitleTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_editSearchButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end