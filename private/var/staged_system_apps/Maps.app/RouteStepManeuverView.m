@interface RouteStepManeuverView
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)shouldUseTextToBottomConstraint;
- (GuidanceManeuverView)guidanceManeuverView;
- (NSLayoutConstraint)containerWidthConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSLayoutConstraint)primaryTopConstraint;
- (NSLayoutConstraint)primaryTrailingConstraint;
- (NSLayoutConstraint)secondaryTopConstraint;
- (NSLayoutConstraint)tertiaryTopConstraint;
- (NSLayoutConstraint)textToBottomConstraint;
- (RouteStepManeuverView)initWithFrame:(CGRect)a3;
- (UIImageView)shieldImageView;
- (UILabel)primaryTextLabel;
- (UILabel)secondaryTextLabel;
- (UILabel)tertiaryTextLabel;
- (UIView)trailingView;
- (void)setContainerWidthConstraint:(id)a3;
- (void)setGuidanceManeuverView:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setItem:(id)a3;
- (void)setPrimaryTextLabel:(id)a3;
- (void)setPrimaryTopConstraint:(id)a3;
- (void)setPrimaryTrailingConstraint:(id)a3;
- (void)setSecondaryTextLabel:(id)a3;
- (void)setSecondaryTopConstraint:(id)a3;
- (void)setShieldImageView:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
- (void)setTertiaryTextLabel:(id)a3;
- (void)setTertiaryTopConstraint:(id)a3;
- (void)setTextToBottomConstraint:(id)a3;
- (void)setTrailingView:(id)a3;
@end

@implementation RouteStepManeuverView

- (RouteStepManeuverView)initWithFrame:(CGRect)a3
{
  v106.receiver = self;
  v106.super_class = (Class)RouteStepManeuverView;
  v3 = -[RouteStepListView initWithFrame:](&v106, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v104 = v4;
    [(RouteStepManeuverView *)v3 addSubview:v4];
    v5 = objc_opt_new();
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setAccessibilityIdentifier:@"ImageContainer"];
    [(RouteStepManeuverView *)v3 addSubview:v5];
    v6 = -[GuidanceManeuverView initWithFrame:textureProvider:]([GuidanceManeuverView alloc], "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    guidanceManeuverView = v3->_guidanceManeuverView;
    v3->_guidanceManeuverView = v6;

    [(GuidanceManeuverView *)v3->_guidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GuidanceManeuverView *)v3->_guidanceManeuverView setFraming:1];
    [v5 addSubview:v3->_guidanceManeuverView];
    uint64_t v8 = objc_opt_new();
    shieldImageView = v3->_shieldImageView;
    v3->_shieldImageView = (UIImageView *)v8;

    [(UIImageView *)v3->_shieldImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_shieldImageView setContentMode:1];
    [(UIImageView *)v3->_shieldImageView setAccessibilityIdentifier:@"ShieldImage"];
    v10 = v5;
    [v5 addSubview:v3->_shieldImageView];
    uint64_t v11 = objc_opt_new();
    primaryTextLabel = v3->_primaryTextLabel;
    v3->_primaryTextLabel = (UILabel *)v11;

    [(UILabel *)v3->_primaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_primaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_primaryTextLabel setAccessibilityIdentifier:@"PrimaryTextLabel"];
    [(RouteStepManeuverView *)v3 addSubview:v3->_primaryTextLabel];
    uint64_t v13 = objc_opt_new();
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = (UILabel *)v13;

    [(UILabel *)v3->_secondaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_secondaryTextLabel setAccessibilityIdentifier:@"SecondaryTextLabel"];
    [(RouteStepManeuverView *)v3 addSubview:v3->_secondaryTextLabel];
    uint64_t v15 = objc_opt_new();
    tertiaryTextLabel = v3->_tertiaryTextLabel;
    v3->_tertiaryTextLabel = (UILabel *)v15;

    [(UILabel *)v3->_tertiaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_tertiaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_tertiaryTextLabel setAccessibilityIdentifier:@"TertiaryTextLabel"];
    [(RouteStepManeuverView *)v3 addSubview:v3->_tertiaryTextLabel];
    v17 = [v4 widthAnchor];
    uint64_t v18 = [v17 constraintEqualToConstant:0.0];
    containerWidthConstraint = v3->_containerWidthConstraint;
    v3->_containerWidthConstraint = (NSLayoutConstraint *)v18;

    v105 = v10;
    v20 = [v10 widthAnchor];
    uint64_t v21 = [v20 constraintEqualToConstant:0.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v21;

    v23 = [v10 heightAnchor];
    uint64_t v24 = [v23 constraintEqualToConstant:0.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v27 = [(RouteStepManeuverView *)v3 safeAreaLayoutGuide];
    v28 = [v27 trailingAnchor];
    uint64_t v29 = [v26 constraintEqualToAnchor:v28];
    primaryTrailingConstraint = v3->_primaryTrailingConstraint;
    v3->_primaryTrailingConstraint = (NSLayoutConstraint *)v29;

    v31 = [(UILabel *)v3->_primaryTextLabel topAnchor];
    v32 = [(RouteStepManeuverView *)v3 topAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
    primaryTopConstraint = v3->_primaryTopConstraint;
    v3->_primaryTopConstraint = (NSLayoutConstraint *)v33;

    v35 = [(UILabel *)v3->_secondaryTextLabel topAnchor];
    v36 = [(UILabel *)v3->_primaryTextLabel bottomAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36];
    secondaryTopConstraint = v3->_secondaryTopConstraint;
    v3->_secondaryTopConstraint = (NSLayoutConstraint *)v37;

    v39 = [(UILabel *)v3->_tertiaryTextLabel topAnchor];
    v40 = [(UILabel *)v3->_secondaryTextLabel bottomAnchor];
    uint64_t v41 = [v39 constraintEqualToAnchor:v40];
    tertiaryTopConstraint = v3->_tertiaryTopConstraint;
    v3->_tertiaryTopConstraint = (NSLayoutConstraint *)v41;

    v43 = [(UILabel *)v3->_tertiaryTextLabel bottomAnchor];
    v44 = [(RouteStepManeuverView *)v3 bottomAnchor];
    uint64_t v45 = [v43 constraintEqualToAnchor:v44];
    textToBottomConstraint = v3->_textToBottomConstraint;
    v3->_textToBottomConstraint = (NSLayoutConstraint *)v45;

    v102 = [v104 leadingAnchor];
    v103 = [(RouteStepManeuverView *)v3 safeAreaLayoutGuide];
    v101 = [v103 leadingAnchor];
    v100 = [v102 constraintEqualToAnchor:v101];
    v107[0] = v100;
    v107[1] = v3->_containerWidthConstraint;
    v99 = [v104 topAnchor];
    v98 = [(RouteStepManeuverView *)v3 topAnchor];
    v97 = [v99 constraintEqualToAnchor:v98];
    v107[2] = v97;
    v96 = [v104 bottomAnchor];
    v95 = [(RouteStepManeuverView *)v3 bottomAnchor];
    v94 = [v96 constraintEqualToAnchor:v95];
    v107[3] = v94;
    v93 = [v105 centerXAnchor];
    v92 = [v104 centerXAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v107[4] = v91;
    v90 = [v105 centerYAnchor];
    v89 = [v104 centerYAnchor];
    v88 = [v90 constraintEqualToAnchor:v89];
    v107[5] = v88;
    v107[6] = v3->_imageWidthConstraint;
    v107[7] = v3->_imageHeightConstraint;
    v87 = [(GuidanceManeuverView *)v3->_guidanceManeuverView leadingAnchor];
    v85 = [v105 leadingAnchor];
    v84 = [v87 constraintEqualToAnchor:v85];
    v107[8] = v84;
    v83 = [(GuidanceManeuverView *)v3->_guidanceManeuverView trailingAnchor];
    v82 = [v105 trailingAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v107[9] = v81;
    v80 = [(GuidanceManeuverView *)v3->_guidanceManeuverView topAnchor];
    v79 = [v105 topAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v107[10] = v78;
    v77 = [(GuidanceManeuverView *)v3->_guidanceManeuverView bottomAnchor];
    v76 = [v105 bottomAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v107[11] = v75;
    v74 = [(UIImageView *)v3->_shieldImageView leadingAnchor];
    v73 = [v105 leadingAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v107[12] = v72;
    v71 = [(UIImageView *)v3->_shieldImageView trailingAnchor];
    v70 = [v105 trailingAnchor];
    v69 = [v71 constraintEqualToAnchor:v70];
    v107[13] = v69;
    v68 = [(UIImageView *)v3->_shieldImageView topAnchor];
    v67 = [v105 topAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v107[14] = v66;
    v65 = [(UIImageView *)v3->_shieldImageView bottomAnchor];
    v64 = [v105 bottomAnchor];
    v63 = [v65 constraintEqualToAnchor:v64];
    v107[15] = v63;
    v62 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v61 = [v104 trailingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v107[16] = v60;
    v107[17] = v3->_primaryTrailingConstraint;
    v107[18] = v3->_primaryTopConstraint;
    v86 = [(UILabel *)v3->_secondaryTextLabel leadingAnchor];
    v59 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v58 = [v86 constraintEqualToAnchor:v59];
    v107[19] = v58;
    v57 = [(UILabel *)v3->_secondaryTextLabel trailingAnchor];
    v47 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v48 = [v57 constraintEqualToAnchor:v47];
    v107[20] = v48;
    v107[21] = v3->_secondaryTopConstraint;
    v49 = [(UILabel *)v3->_tertiaryTextLabel leadingAnchor];
    v50 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v107[22] = v51;
    v52 = [(UILabel *)v3->_tertiaryTextLabel trailingAnchor];
    v53 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    v107[23] = v54;
    v107[24] = v3->_tertiaryTopConstraint;
    v55 = +[NSArray arrayWithObjects:v107 count:25];
    +[NSLayoutConstraint activateConstraints:v55];
  }
  return v3;
}

- (void)setShouldUseTextToBottomConstraint:(BOOL)a3
{
  if (self->_shouldUseTextToBottomConstraint != a3)
  {
    self->_shouldUseTextToBottomConstraint = a3;
    -[NSLayoutConstraint setActive:](self->_textToBottomConstraint, "setActive:");
  }
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  v9 = [v8 metrics];
  [v9 imageAreaWidth];
  double v11 = a4 - v10;
  v12 = [v8 metrics];
  [v12 textTrailingMargin];
  double v14 = v11 - v13;
  uint64_t v15 = [v8 trailingView];
  [v15 frame];
  double v17 = v14 - v16;

  uint64_t v18 = [v8 metrics];
  [v18 imageTopMargin];
  double v20 = v19;
  uint64_t v21 = [v8 metrics];
  [v21 stepImageHeight];
  double v23 = v22;
  uint64_t v24 = [v8 metrics];
  [v24 imageBottomMargin];
  double v26 = v25;

  v27 = [v8 primaryText];
  if (v27)
  {
    v28 = [v8 metrics];
    [v28 primaryTextTopMargin];
    double v30 = v29 + 0.0;

    [v27 boundingRectWithSize:1 options:0 context:v17];
    double v32 = v30 + ceil(v31);
  }
  else
  {
    double v32 = 0.0;
  }
  uint64_t v33 = [v8 secondaryText];
  if (v33)
  {
    v34 = [v8 metrics];
    [v34 secondaryTextTopMargin];
    double v36 = v32 + v35;

    [v33 boundingRectWithSize:1 options:0 context:v17];
    double v32 = v36 + ceil(v37);
  }
  v38 = [v8 tertiaryText];
  if (v38)
  {
    v39 = [v8 metrics];
    [v39 tertiaryTextTopMargin];
    double v41 = v32 + v40;

    [v38 boundingRectWithSize:1 options:0 context:v17];
    double v32 = v41 + ceil(v42);
  }
  double v43 = v20 + v23 + v26;
  v44 = [v8 metrics];
  [v44 textBottomMargin];
  double v46 = v32 + v45;

  if (v43 <= v46) {
    double v43 = v46;
  }

  return v43;
}

- (void)setTrailingView:(id)a3
{
  v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    [(UIView *)trailingView removeFromSuperview];
    if (v5)
    {
      [(RouteStepManeuverView *)self addSubview:v5];
      id v8 = [(UIView *)v5 trailingAnchor];
      v9 = [(RouteStepManeuverView *)self trailingAnchor];
      double v10 = [v8 constraintEqualToAnchor:v9];
      v15[0] = v10;
      double v11 = [(UIView *)v5 centerYAnchor];
      v12 = [(RouteStepManeuverView *)self centerYAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12];
      v15[1] = v13;
      double v14 = +[NSArray arrayWithObjects:v15 count:2];
      +[NSLayoutConstraint activateConstraints:v14];
    }
    objc_storeStrong((id *)p_trailingView, a3);
  }
}

- (void)setItem:(id)a3
{
  v64.receiver = self;
  v64.super_class = (Class)RouteStepManeuverView;
  [(RouteStepListView *)&v64 setItem:a3];
  v4 = [(RouteStepListView *)self item];
  v5 = [v4 trailingView];
  [(RouteStepManeuverView *)self setTrailingView:v5];

  id v6 = [v4 metrics];
  [v6 imageAreaWidth];
  double v8 = v7;
  v9 = [(RouteStepManeuverView *)self containerWidthConstraint];
  [v9 setConstant:v8];

  double v10 = [v4 metrics];
  [v10 stepImageWidth];
  double v12 = v11;
  double v13 = [(RouteStepManeuverView *)self imageWidthConstraint];
  [v13 setConstant:v12];

  double v14 = [v4 metrics];
  [v14 stepImageHeight];
  double v16 = v15;
  double v17 = [(RouteStepManeuverView *)self imageHeightConstraint];
  [v17 setConstant:v16];

  uint64_t v18 = [v4 metrics];
  [v18 textTrailingMargin];
  double v20 = v19;
  uint64_t v21 = [(RouteStepManeuverView *)self trailingView];
  [v21 frame];
  double v23 = -(v20 + v22);
  uint64_t v24 = [(RouteStepManeuverView *)self primaryTrailingConstraint];
  [v24 setConstant:v23];

  double v25 = [v4 metrics];
  [v25 primaryTextTopMargin];
  double v27 = v26;
  v28 = [(RouteStepManeuverView *)self primaryTopConstraint];
  [v28 setConstant:v27];

  double v29 = [v4 metrics];
  [v29 secondaryTextTopMargin];
  double v31 = v30;
  double v32 = [(RouteStepManeuverView *)self secondaryTopConstraint];
  [v32 setConstant:v31];

  uint64_t v33 = [v4 metrics];
  [v33 tertiaryTextTopMargin];
  double v35 = v34;
  double v36 = [(RouteStepManeuverView *)self tertiaryTopConstraint];
  [v36 setConstant:v35];

  double v37 = [v4 metrics];
  [v37 textBottomMargin];
  double v39 = -v38;
  double v40 = [(RouteStepManeuverView *)self textToBottomConstraint];
  [v40 setConstant:v39];

  double v41 = [v4 primaryText];
  double v42 = [(RouteStepManeuverView *)self primaryTextLabel];
  [v42 setAttributedText:v41];

  double v43 = [v4 secondaryText];
  v44 = [(RouteStepManeuverView *)self secondaryTextLabel];
  [v44 setAttributedText:v43];

  double v45 = [v4 tertiaryText];
  double v46 = [(RouteStepManeuverView *)self tertiaryTextLabel];
  [v46 setAttributedText:v45];

  v47 = [(RouteStepManeuverView *)self shieldImageView];
  [v47 setImage:0];

  v48 = [(RouteStepManeuverView *)self guidanceManeuverView];
  [v48 setManeuverArtwork:0];

  v49 = [v4 shieldImage];

  if (v49)
  {
    v50 = [v4 shieldImage];
    v51 = [(RouteStepManeuverView *)self shieldImageView];
    [v51 setImage:v50];
LABEL_11:

    goto LABEL_12;
  }
  v52 = [v4 maneuverArtwork];

  if (v52)
  {
    v53 = [v4 maneuverArtwork];
    v54 = [(RouteStepManeuverView *)self guidanceManeuverView];
    [v54 setManeuverArtwork:v53];

    v55 = [v4 metrics];
    v56 = v55;
    if (v55) {
      [v55 arrowMetrics];
    }
    else {
      memset(__src, 0, sizeof(__src));
    }
    v57 = [(RouteStepManeuverView *)self guidanceManeuverView];
    memcpy(__dst, __src, sizeof(__dst));
    [v57 setArrowMetrics:__dst];

    v58 = [v4 metrics];
    v50 = v58;
    if (v58) {
      [v58 junctionArrowMetrics];
    }
    else {
      memset(v61, 0, sizeof(v61));
    }
    v51 = [(RouteStepManeuverView *)self guidanceManeuverView];
    memcpy(v60, v61, sizeof(v60));
    [v51 setJunctionArrowMetrics:v60];
    goto LABEL_11;
  }
LABEL_12:
  v59 = [v4 backgroundColor];
  [(RouteStepManeuverView *)self setBackgroundColor:v59];
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
}

- (GuidanceManeuverView)guidanceManeuverView
{
  return self->_guidanceManeuverView;
}

- (void)setGuidanceManeuverView:(id)a3
{
}

- (UILabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
}

- (UILabel)tertiaryTextLabel
{
  return self->_tertiaryTextLabel;
}

- (void)setTertiaryTextLabel:(id)a3
{
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (NSLayoutConstraint)containerWidthConstraint
{
  return self->_containerWidthConstraint;
}

- (void)setContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryTopConstraint
{
  return self->_primaryTopConstraint;
}

- (void)setPrimaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTopConstraint
{
  return self->_secondaryTopConstraint;
}

- (void)setSecondaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)tertiaryTopConstraint
{
  return self->_tertiaryTopConstraint;
}

- (void)setTertiaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)textToBottomConstraint
{
  return self->_textToBottomConstraint;
}

- (void)setTextToBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_tertiaryTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);

  objc_storeStrong((id *)&self->_shieldImageView, 0);
}

@end