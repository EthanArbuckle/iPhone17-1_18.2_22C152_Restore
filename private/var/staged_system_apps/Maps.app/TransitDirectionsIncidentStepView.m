@interface TransitDirectionsIncidentStepView
- (TransitDirectionsIncidentCellDelegate)delegate;
- (TransitDirectionsIncidentStepView)initWithFrame:(CGRect)a3;
- (id)_incidentItem;
- (void)_tapped;
- (void)_updateNavigationStateAlpha:(double)a3;
- (void)configureWithItem:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TransitDirectionsIncidentStepView

- (TransitDirectionsIncidentStepView)initWithFrame:(CGRect)a3
{
  v96.receiver = self;
  v96.super_class = (Class)TransitDirectionsIncidentStepView;
  v3 = -[TransitDirectionsStepView initWithFrame:](&v96, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TransitDirectionsIncidentStepView *)v3 setBackgroundColor:v4];

    [(TransitDirectionsIncidentStepView *)v3 setOpaque:0];
    [(TransitDirectionsIncidentStepView *)v3 setAccessibilityIdentifier:@"TransitDirectionsIncidentStep"];
    id v5 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = v9;

    [(UIView *)v3->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = +[UIColor systemBlueColor];
    v12 = [v11 colorWithAlphaComponent:0.119999997];
    [(UIView *)v3->_backgroundView setBackgroundColor:v12];

    [(UIView *)v3->_backgroundView _setContinuousCornerRadius:10.0];
    [(TransitDirectionsIncidentStepView *)v3 addSubview:v3->_backgroundView];
    v95 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleBody];
    id v13 = objc_alloc((Class)UIImageView);
    v14 = +[UIImage systemImageNamed:@"chevron.forward" withConfiguration:v95];
    v15 = (UIImageView *)[v13 initWithImage:v14];
    chevronImageView = v3->_chevronImageView;
    v3->_chevronImageView = v15;

    [(UIImageView *)v3->_chevronImageView setAccessibilityIdentifier:@"ChevronImageView"];
    [(UIImageView *)v3->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)v3->_chevronImageView setTintColor:v17];

    LODWORD(v18) = 1148846080;
    [(UIImageView *)v3->_chevronImageView setContentHuggingPriority:0 forAxis:v18];
    LODWORD(v19) = 1148846080;
    [(UIImageView *)v3->_chevronImageView setContentHuggingPriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UIImageView *)v3->_chevronImageView setContentCompressionResistancePriority:0 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UIImageView *)v3->_chevronImageView setContentCompressionResistancePriority:1 forAxis:v21];
    [(TransitDirectionsIncidentStepView *)v3 addSubview:v3->_chevronImageView];
    v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v3->_label;
    v3->_label = v22;

    [(UILabel *)v3->_label setAccessibilityIdentifier:@"Label"];
    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v3->_label setFont:v24];

    [(UILabel *)v3->_label setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_label setLineBreakMode:4];
    LODWORD(v25) = 1132003328;
    [(UILabel *)v3->_label setContentHuggingPriority:0 forAxis:v25];
    LODWORD(v26) = 1144750080;
    [(UILabel *)v3->_label setContentHuggingPriority:1 forAxis:v26];
    [(TransitDirectionsIncidentStepView *)v3 addSubview:v3->_label];
    v27 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    imageView = v3->_imageView;
    v3->_imageView = v27;

    [(MKArtworkImageView *)v3->_imageView setAccessibilityIdentifier:@"ImageView"];
    [(MKArtworkImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v29) = 1148846080;
    [(MKArtworkImageView *)v3->_imageView setContentHuggingPriority:0 forAxis:v29];
    LODWORD(v30) = 1148846080;
    [(MKArtworkImageView *)v3->_imageView setContentHuggingPriority:1 forAxis:v30];
    LODWORD(v31) = 1148846080;
    [(MKArtworkImageView *)v3->_imageView setContentCompressionResistancePriority:0 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(MKArtworkImageView *)v3->_imageView setContentCompressionResistancePriority:1 forAxis:v32];
    [(TransitDirectionsIncidentStepView *)v3 addSubview:v3->_imageView];
    v33 = [(UILabel *)v3->_label leadingAnchor];
    v34 = [(MKArtworkImageView *)v3->_imageView trailingAnchor];
    uint64_t v35 = [v33 constraintEqualToAnchor:v34 constant:8.0];
    artworkShowingLabelConstraint = v3->_artworkShowingLabelConstraint;
    v3->_artworkShowingLabelConstraint = (NSLayoutConstraint *)v35;

    v37 = [(UILabel *)v3->_label leadingAnchor];
    v38 = [(UIView *)v3->_backgroundView leadingAnchor];
    uint64_t v39 = [v37 constraintEqualToAnchor:v38 constant:12.0];
    artworkHiddenLabelConstraint = v3->_artworkHiddenLabelConstraint;
    v3->_artworkHiddenLabelConstraint = (NSLayoutConstraint *)v39;

    v41 = [(UIImageView *)v3->_chevronImageView leadingAnchor];
    v42 = [(UILabel *)v3->_label trailingAnchor];
    uint64_t v43 = [v41 constraintEqualToAnchor:v42 constant:8.0];
    chevronShowingLabelConstraint = v3->_chevronShowingLabelConstraint;
    v3->_chevronShowingLabelConstraint = (NSLayoutConstraint *)v43;

    v45 = [(UIView *)v3->_backgroundView trailingAnchor];
    v46 = [(UILabel *)v3->_label trailingAnchor];
    uint64_t v47 = [v45 constraintEqualToAnchor:v46 constant:12.0];
    chevronHiddenLabelConstraint = v3->_chevronHiddenLabelConstraint;
    v3->_chevronHiddenLabelConstraint = (NSLayoutConstraint *)v47;

    v93 = [(UIView *)v3->_backgroundView topAnchor];
    v94 = [(TransitDirectionsStepView *)v3 contentLayoutGuide];
    v92 = [v94 topAnchor];
    v91 = [v93 constraintEqualToAnchor:v92];
    v97[0] = v91;
    v89 = [(UIView *)v3->_backgroundView leadingAnchor];
    v90 = [(TransitDirectionsStepView *)v3 contentLayoutGuide];
    v88 = [v90 leadingAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v97[1] = v87;
    v86 = [(TransitDirectionsStepView *)v3 contentLayoutGuide];
    v85 = [v86 trailingAnchor];
    v84 = [(UIView *)v3->_backgroundView trailingAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v97[2] = v83;
    v82 = [(TransitDirectionsStepView *)v3 contentLayoutGuide];
    v81 = [v82 bottomAnchor];
    v80 = [(UIView *)v3->_backgroundView bottomAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v97[3] = v79;
    v78 = [(UIView *)v3->_backgroundView heightAnchor];
    v77 = [v78 constraintGreaterThanOrEqualToConstant:44.0];
    v97[4] = v77;
    v76 = [(UIImageView *)v3->_chevronImageView centerYAnchor];
    v75 = [(UIView *)v3->_backgroundView centerYAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v97[5] = v74;
    v73 = [(UIView *)v3->_backgroundView trailingAnchor];
    v72 = [(UIImageView *)v3->_chevronImageView trailingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72 constant:11.0];
    v97[6] = v71;
    v70 = [(MKArtworkImageView *)v3->_imageView leadingAnchor];
    v69 = [(UIView *)v3->_backgroundView leadingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69 constant:12.0];
    v97[7] = v68;
    v67 = [(MKArtworkImageView *)v3->_imageView centerYAnchor];
    v66 = [(UIView *)v3->_backgroundView centerYAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v97[8] = v65;
    v97[9] = v3->_artworkShowingLabelConstraint;
    v64 = [(UILabel *)v3->_label topAnchor];
    v63 = [(UIView *)v3->_backgroundView topAnchor];
    v62 = [v64 constraintEqualToAnchor:v63 constant:8.0];
    v97[10] = v62;
    v61 = [(UILabel *)v3->_label leadingAnchor];
    v49 = [(MKArtworkImageView *)v3->_imageView trailingAnchor];
    v50 = [v61 constraintEqualToAnchor:v49 constant:8.0];
    v97[11] = v50;
    v51 = [(UILabel *)v3->_label centerYAnchor];
    v52 = [(UIView *)v3->_backgroundView centerYAnchor];
    v53 = [v51 constraintEqualToAnchor:v52];
    v97[12] = v53;
    v97[13] = v3->_chevronShowingLabelConstraint;
    v54 = [(UIView *)v3->_backgroundView bottomAnchor];
    v55 = [(UILabel *)v3->_label bottomAnchor];
    v56 = [v54 constraintEqualToAnchor:v55 constant:8.0];
    v97[14] = v56;
    v57 = +[NSArray arrayWithObjects:v97 count:15];
    +[NSLayoutConstraint activateConstraints:v57];

    v58 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"_tapped"];
    tapGesture = v3->_tapGesture;
    v3->_tapGesture = v58;

    [(TransitDirectionsIncidentStepView *)v3 addGestureRecognizer:v3->_tapGesture];
  }
  return v3;
}

- (id)_incidentItem
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->super._transitListItem;
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)configureWithItem:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)TransitDirectionsIncidentStepView;
  [(TransitDirectionsStepView *)&v33 configureWithItem:v4];
  if ([v4 type] != (id)13)
  {

    id v4 = 0;
  }
  double v30 = [(TransitDirectionsIncidentStepView *)self _incidentItem];
  double v29 = [v30 incidentMessage];
  id v5 = [v29 advisory];
  id v6 = objc_alloc((Class)MKServerFormattedString);
  v7 = [v5 titleString];
  id v8 = [v6 initWithComposedString:v7];

  NSAttributedStringKey v34 = NSFontAttributeName;
  v9 = [(UILabel *)self->_label font];
  uint64_t v35 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  v28 = v8;
  v11 = [v8 multiPartAttributedStringWithAttributes:v10];

  v12 = [v11 attributedString];
  [(UILabel *)self->_label setAttributedText:v12];

  id v13 = [v5 artwork];
  id v14 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v13 shieldSize:3];
  [(MKArtworkImageView *)self->_imageView setImageSource:v14];
  v15 = [(MKArtworkImageView *)self->_imageView image];
  BOOL v16 = v15 != 0;
  BOOL v17 = v15 == 0;

  [(MKArtworkImageView *)self->_imageView setHidden:v17];
  [(NSLayoutConstraint *)self->_artworkShowingLabelConstraint setActive:v16];
  [(NSLayoutConstraint *)self->_artworkHiddenLabelConstraint setActive:v17];
  id v18 = [v5 isClickable];
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:v18];
  [(UIImageView *)self->_chevronImageView setHidden:v18 ^ 1];
  [(NSLayoutConstraint *)self->_chevronShowingLabelConstraint setActive:v18];
  [(NSLayoutConstraint *)self->_chevronHiddenLabelConstraint setActive:v18 ^ 1];
  if (v18) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 0;
  }
  [(UILabel *)self->_label setNumberOfLines:v19];
  double v20 = [(MKArtworkImageView *)self->_imageView image];
  double v21 = [v20 _maps_mostCommonColor];
  v22 = [v21 colorWithAlphaComponent:0.200000003];
  v23 = v22;
  if (v22)
  {
    id v24 = v22;
  }
  else
  {
    id v24 = +[UIColor tertiarySystemFillColor];
  }
  double v25 = v24;

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10052944C;
  v31[3] = &unk_1012EDC88;
  id v32 = v25;
  id v26 = v25;
  v27 = +[UIColor colorWithDynamicProvider:v31];
  [(UIView *)self->_backgroundView setBackgroundColor:v27];
}

- (void)_tapped
{
  id v8 = [(TransitDirectionsIncidentStepView *)self _incidentItem];
  v3 = [v8 incidentMessage];
  id v4 = [v3 advisory];
  unsigned int v5 = [v4 isClickable];

  if (v5)
  {
    id v6 = [(TransitDirectionsIncidentStepView *)self delegate];
    v7 = [v3 advisory];
    [v6 transitDirectionsCell:self didTapAdvisory:v7];
  }
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsIncidentStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  [(MKArtworkImageView *)self->_imageView setAlpha:a3];
  [(UILabel *)self->_label setAlpha:a3];
  [(UIImageView *)self->_chevronImageView setAlpha:a3];
}

- (TransitDirectionsIncidentCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitDirectionsIncidentCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chevronHiddenLabelConstraint, 0);
  objc_storeStrong((id *)&self->_chevronShowingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_artworkHiddenLabelConstraint, 0);
  objc_storeStrong((id *)&self->_artworkShowingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end