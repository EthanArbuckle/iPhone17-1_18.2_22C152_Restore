@interface RouteStepWaypointView
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)shouldUseTextToBottomConstraint;
- (NSLayoutConstraint)containerWidthConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSLayoutConstraint)primaryCenterYConstraint;
- (NSLayoutConstraint)primaryTopConstraint;
- (NSLayoutConstraint)primaryTrailingConstraint;
- (NSLayoutConstraint)secondaryTopConstraint;
- (NSLayoutConstraint)textToBottomConstraint;
- (RouteStepWaypointView)initWithFrame:(CGRect)a3;
- (UIImageView)pinImageView;
- (UILabel)primaryTextLabel;
- (UILabel)secondaryTextLabel;
- (void)setContainerWidthConstraint:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setItem:(id)a3;
- (void)setPinImageView:(id)a3;
- (void)setPrimaryCenterYConstraint:(id)a3;
- (void)setPrimaryTextLabel:(id)a3;
- (void)setPrimaryTopConstraint:(id)a3;
- (void)setPrimaryTrailingConstraint:(id)a3;
- (void)setSecondaryTextLabel:(id)a3;
- (void)setSecondaryTopConstraint:(id)a3;
- (void)setShouldUseTextToBottomConstraint:(BOOL)a3;
- (void)setTextToBottomConstraint:(id)a3;
@end

@implementation RouteStepWaypointView

- (RouteStepWaypointView)initWithFrame:(CGRect)a3
{
  v71.receiver = self;
  v71.super_class = (Class)RouteStepWaypointView;
  v3 = -[RouteStepListView initWithFrame:](&v71, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(RouteStepWaypointView *)v3 setAccessibilityIdentifier:v5];

    v6 = objc_opt_new();
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setAccessibilityIdentifier:@"LeadingContainer"];
    [(RouteStepWaypointView *)v3 addSubview:v6];
    uint64_t v7 = objc_opt_new();
    pinImageView = v3->_pinImageView;
    v3->_pinImageView = (UIImageView *)v7;

    [(UIImageView *)v3->_pinImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_pinImageView setContentMode:1];
    [(UIImageView *)v3->_pinImageView setAccessibilityIdentifier:@"PinImageView"];
    v70 = v6;
    [v6 addSubview:v3->_pinImageView];
    uint64_t v9 = objc_opt_new();
    primaryTextLabel = v3->_primaryTextLabel;
    v3->_primaryTextLabel = (UILabel *)v9;

    [(UILabel *)v3->_primaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_primaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_primaryTextLabel setAccessibilityIdentifier:@"PrimaryTextLabel"];
    [(RouteStepWaypointView *)v3 addSubview:v3->_primaryTextLabel];
    uint64_t v11 = objc_opt_new();
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = (UILabel *)v11;

    [(UILabel *)v3->_secondaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_secondaryTextLabel setAccessibilityIdentifier:@"SecondaryTextLabel"];
    [(RouteStepWaypointView *)v3 addSubview:v3->_secondaryTextLabel];
    v13 = [v6 widthAnchor];
    uint64_t v14 = [v13 constraintEqualToConstant:0.0];
    containerWidthConstraint = v3->_containerWidthConstraint;
    v3->_containerWidthConstraint = (NSLayoutConstraint *)v14;

    v16 = [(UIImageView *)v3->_pinImageView widthAnchor];
    uint64_t v17 = [v16 constraintEqualToConstant:0.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UIImageView *)v3->_pinImageView heightAnchor];
    uint64_t v20 = [v19 constraintEqualToConstant:0.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v20;

    v22 = [(UILabel *)v3->_primaryTextLabel topAnchor];
    v23 = [(RouteStepWaypointView *)v3 topAnchor];
    uint64_t v24 = [v22 constraintEqualToAnchor:v23];
    primaryTopConstraint = v3->_primaryTopConstraint;
    v3->_primaryTopConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v27 = [(RouteStepWaypointView *)v3 safeAreaLayoutGuide];
    v28 = [v27 trailingAnchor];
    uint64_t v29 = [v26 constraintEqualToAnchor:v28];
    primaryTrailingConstraint = v3->_primaryTrailingConstraint;
    v3->_primaryTrailingConstraint = (NSLayoutConstraint *)v29;

    v31 = [(UILabel *)v3->_secondaryTextLabel topAnchor];
    v32 = [(UILabel *)v3->_primaryTextLabel bottomAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32];
    secondaryTopConstraint = v3->_secondaryTopConstraint;
    v3->_secondaryTopConstraint = (NSLayoutConstraint *)v33;

    v35 = [(UILabel *)v3->_primaryTextLabel centerYAnchor];
    v36 = [v70 centerYAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36];
    primaryCenterYConstraint = v3->_primaryCenterYConstraint;
    v3->_primaryCenterYConstraint = (NSLayoutConstraint *)v37;

    v39 = [(UILabel *)v3->_secondaryTextLabel bottomAnchor];
    v40 = [(RouteStepWaypointView *)v3 bottomAnchor];
    uint64_t v41 = [v39 constraintEqualToAnchor:v40];
    textToBottomConstraint = v3->_textToBottomConstraint;
    v3->_textToBottomConstraint = (NSLayoutConstraint *)v41;

    v67 = [v70 leadingAnchor];
    v68 = [(RouteStepWaypointView *)v3 safeAreaLayoutGuide];
    v66 = [v68 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v72[0] = v65;
    v72[1] = v3->_containerWidthConstraint;
    v64 = [v70 topAnchor];
    v63 = [(RouteStepWaypointView *)v3 topAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v72[2] = v62;
    v61 = [v70 bottomAnchor];
    v60 = [(RouteStepWaypointView *)v3 bottomAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v72[3] = v59;
    v58 = [(UIImageView *)v3->_pinImageView centerXAnchor];
    v57 = [v70 centerXAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v72[4] = v56;
    v55 = [(UIImageView *)v3->_pinImageView centerYAnchor];
    v54 = [v70 centerYAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v72[5] = v53;
    v72[6] = v3->_imageWidthConstraint;
    v72[7] = v3->_imageHeightConstraint;
    v69 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v43 = [v70 trailingAnchor];
    v44 = [v69 constraintEqualToAnchor:v43];
    v72[8] = v44;
    v72[9] = v3->_primaryTrailingConstraint;
    v45 = [(UILabel *)v3->_secondaryTextLabel leadingAnchor];
    v46 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    v72[10] = v47;
    v48 = [(UILabel *)v3->_secondaryTextLabel trailingAnchor];
    v49 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v72[11] = v50;
    v51 = +[NSArray arrayWithObjects:v72 count:12];
    +[NSLayoutConstraint activateConstraints:v51];
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
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  uint64_t v9 = [v8 metrics];
  [v9 imageAreaWidth];
  double v11 = a4 - v10;
  v12 = [v8 metrics];
  [v12 textTrailingMargin];
  double v14 = v11 - v13;

  v15 = [v8 metrics];
  [v15 imageTopMargin];
  double v17 = v16;
  v18 = [v8 metrics];
  [v18 waypointImageHeight];
  double v20 = v19;
  v21 = [v8 metrics];
  [v21 imageBottomMargin];
  double v23 = v22;

  uint64_t v24 = [v8 primaryText];
  if (v24)
  {
    v25 = [v8 metrics];
    [v25 primaryTextTopMargin];
    double v27 = v26 + 0.0;

    [v24 boundingRectWithSize:1 options:0 context:v14];
    double v29 = v27 + ceil(v28);
  }
  else
  {
    double v29 = 0.0;
  }
  v30 = [v8 secondaryText];
  if (v30)
  {
    v31 = [v8 metrics];
    [v31 secondaryTextTopMargin];
    double v33 = v29 + v32;

    [v30 boundingRectWithSize:1 options:0 context:v14];
    double v29 = v33 + ceil(v34);
  }
  double v35 = v17 + v20 + v23;
  v36 = [v8 metrics];
  [v36 textBottomMargin];
  double v38 = v29 + v37;

  if (v35 <= v38) {
    double v35 = v38;
  }

  return v35;
}

- (void)setItem:(id)a3
{
  v49.receiver = self;
  v49.super_class = (Class)RouteStepWaypointView;
  [(RouteStepListView *)&v49 setItem:a3];
  v4 = [(RouteStepListView *)self item];
  v5 = [v4 metrics];
  [v5 imageAreaWidth];
  double v7 = v6;
  id v8 = [(RouteStepWaypointView *)self containerWidthConstraint];
  [v8 setConstant:v7];

  uint64_t v9 = [v4 metrics];
  [v9 waypointImageWidth];
  double v11 = v10;
  v12 = [(RouteStepWaypointView *)self imageWidthConstraint];
  [v12 setConstant:v11];

  double v13 = [v4 metrics];
  [v13 waypointImageHeight];
  double v15 = v14;
  double v16 = [(RouteStepWaypointView *)self imageHeightConstraint];
  [v16 setConstant:v15];

  double v17 = [v4 metrics];
  [v17 primaryTextTopMargin];
  double v19 = v18;
  double v20 = [(RouteStepWaypointView *)self primaryTopConstraint];
  [v20 setConstant:v19];

  v21 = [v4 metrics];
  [v21 primaryTextTrailingMargin];
  double v23 = -v22;
  uint64_t v24 = [(RouteStepWaypointView *)self primaryTrailingConstraint];
  [v24 setConstant:v23];

  v25 = [v4 metrics];
  [v25 secondaryTextTopMargin];
  double v27 = v26;
  double v28 = [(RouteStepWaypointView *)self secondaryTopConstraint];
  [v28 setConstant:v27];

  double v29 = [v4 metrics];
  [v29 textBottomMargin];
  double v31 = -v30;
  double v32 = [(RouteStepWaypointView *)self textToBottomConstraint];
  [v32 setConstant:v31];

  double v33 = [v4 primaryText];
  double v34 = [v4 secondaryText];
  if ([v33 length] && objc_msgSend(v34, "length"))
  {
    double v35 = [(RouteStepWaypointView *)self primaryCenterYConstraint];
    [v35 setActive:0];

    v36 = [(RouteStepWaypointView *)self primaryTopConstraint];
    [v36 setActive:1];

    double v37 = [(RouteStepWaypointView *)self secondaryTopConstraint];
    [v37 setActive:1];

    BOOL v38 = [(RouteStepWaypointView *)self shouldUseTextToBottomConstraint];
    v39 = [(RouteStepWaypointView *)self textToBottomConstraint];
    v40 = v39;
    BOOL v41 = v38;
  }
  else
  {
    v42 = [(RouteStepWaypointView *)self primaryTopConstraint];
    [v42 setActive:0];

    v43 = [(RouteStepWaypointView *)self secondaryTopConstraint];
    [v43 setActive:0];

    v44 = [(RouteStepWaypointView *)self primaryCenterYConstraint];
    [v44 setActive:1];

    v39 = [(RouteStepWaypointView *)self textToBottomConstraint];
    v40 = v39;
    BOOL v41 = 0;
  }
  [v39 setActive:v41];

  v45 = [(RouteStepWaypointView *)self primaryTextLabel];
  [v45 setAttributedText:v33];

  v46 = [(RouteStepWaypointView *)self secondaryTextLabel];
  [v46 setAttributedText:v34];

  v47 = [v4 pinImage];
  v48 = [(RouteStepWaypointView *)self pinImageView];
  [v48 setImage:v47];
}

- (BOOL)shouldUseTextToBottomConstraint
{
  return self->_shouldUseTextToBottomConstraint;
}

- (UIImageView)pinImageView
{
  return self->_pinImageView;
}

- (void)setPinImageView:(id)a3
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

- (NSLayoutConstraint)primaryTopConstraint
{
  return self->_primaryTopConstraint;
}

- (void)setPrimaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTopConstraint
{
  return self->_secondaryTopConstraint;
}

- (void)setSecondaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryCenterYConstraint
{
  return self->_primaryCenterYConstraint;
}

- (void)setPrimaryCenterYConstraint:(id)a3
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
  objc_storeStrong((id *)&self->_primaryCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_containerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);

  objc_storeStrong((id *)&self->_pinImageView, 0);
}

@end