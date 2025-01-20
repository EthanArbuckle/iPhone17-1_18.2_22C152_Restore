@interface RouteAnnotationCell
- (RouteAnnotationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)iconImageView;
- (UILabel)detailsLabel;
- (UILabel)metadataLabel;
- (UIStackView)stackView;
- (void)setDetailsLabel:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setMetadataLabel:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation RouteAnnotationCell

- (RouteAnnotationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v82.receiver = self;
  v82.super_class = (Class)RouteAnnotationCell;
  v4 = [(RouteAnnotationCell *)&v82 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(RouteAnnotationCell *)v4 setBackgroundColor:v5];

    v6 = +[UIColor clearColor];
    v7 = [(RouteAnnotationCell *)v4 contentView];
    [v7 setBackgroundColor:v6];

    v8 = [[AutolayoutImageView alloc] initWithImage:0];
    [(RouteAnnotationCell *)v4 setIconImageView:v8];

    v9 = [(RouteAnnotationCell *)v4 iconImageView];
    LODWORD(v10) = 1148846080;
    [v9 setContentCompressionResistancePriority:0 forAxis:v10];

    id v11 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(RouteAnnotationCell *)v4 setDetailsLabel:v15];

    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v17 = [(RouteAnnotationCell *)v4 detailsLabel];
    [v17 setFont:v16];

    v18 = [(RouteAnnotationCell *)v4 detailsLabel];
    [v18 setNumberOfLines:0];

    v19 = [(RouteAnnotationCell *)v4 detailsLabel];
    LODWORD(v20) = 1132068864;
    [v19 setContentHuggingPriority:0 forAxis:v20];

    v21 = [(RouteAnnotationCell *)v4 detailsLabel];
    LODWORD(v22) = 1144766464;
    [v21 setContentCompressionResistancePriority:0 forAxis:v22];

    id v23 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(RouteAnnotationCell *)v4 setMetadataLabel:v23];

    v24 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v25 = [(RouteAnnotationCell *)v4 metadataLabel];
    [v25 setFont:v24];

    v26 = +[UIColor secondaryLabelColor];
    v27 = [(RouteAnnotationCell *)v4 metadataLabel];
    [v27 setTextColor:v26];

    v28 = [(RouteAnnotationCell *)v4 metadataLabel];
    [v28 setNumberOfLines:0];

    v29 = [(RouteAnnotationCell *)v4 metadataLabel];
    LODWORD(v30) = 1132068864;
    [v29 setContentHuggingPriority:0 forAxis:v30];

    v31 = [(RouteAnnotationCell *)v4 metadataLabel];
    LODWORD(v32) = 1144766464;
    [v31 setContentCompressionResistancePriority:0 forAxis:v32];

    id v33 = objc_alloc((Class)UIStackView);
    v34 = [(RouteAnnotationCell *)v4 detailsLabel];
    v85[0] = v34;
    v35 = [(RouteAnnotationCell *)v4 metadataLabel];
    v85[1] = v35;
    v36 = +[NSArray arrayWithObjects:v85 count:2];
    id v37 = [v33 initWithArrangedSubviews:v36];

    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v37 setAxis:1];
    [v37 setDistribution:0];
    [v37 setAlignment:0];
    [v37 setBaselineRelativeArrangement:1];
    LODWORD(v38) = 1132068864;
    [v37 setContentHuggingPriority:0 forAxis:v38];
    LODWORD(v39) = 1144750080;
    [v37 setContentCompressionResistancePriority:0 forAxis:v39];
    +[DynamicTypeWizard autoscaleStackView:v37 spacing:&stru_1013155A0 withFontProvider:28.0];
    id v40 = objc_alloc((Class)UIStackView);
    v41 = [(RouteAnnotationCell *)v4 iconImageView];
    v84[0] = v41;
    v84[1] = v37;
    v80 = v37;
    v42 = +[NSArray arrayWithObjects:v84 count:2];
    id v43 = [v40 initWithArrangedSubviews:v42];
    [(RouteAnnotationCell *)v4 setStackView:v43];

    v44 = [(RouteAnnotationCell *)v4 stackView];
    [v44 setTranslatesAutoresizingMaskIntoConstraints:0];

    v45 = [(RouteAnnotationCell *)v4 stackView];
    [v45 setAxis:0];

    v46 = [(RouteAnnotationCell *)v4 stackView];
    [v46 setDistribution:0];

    v47 = [(RouteAnnotationCell *)v4 stackView];
    [v47 setAlignment:1];

    v48 = [(RouteAnnotationCell *)v4 stackView];
    [v48 setSpacing:10.0];

    v49 = [(RouteAnnotationCell *)v4 stackView];
    LODWORD(v50) = 1132068864;
    [v49 setContentHuggingPriority:0 forAxis:v50];

    v51 = [(RouteAnnotationCell *)v4 stackView];
    LODWORD(v52) = 1144750080;
    [v51 setContentCompressionResistancePriority:0 forAxis:v52];

    v53 = [(RouteAnnotationCell *)v4 contentView];
    v54 = [(RouteAnnotationCell *)v4 stackView];
    [v53 addSubview:v54];

    id v81 = objc_alloc_init((Class)NSMutableArray);
    v78 = [v37 firstBaselineAnchor];
    v79 = [(RouteAnnotationCell *)v4 contentView];
    v77 = [v79 topAnchor];
    v76 = [v78 constraintEqualToAnchor:v77];
    v75 = +[DynamicTypeWizard autoscaledConstraint:v76 constant:&stru_1013155C0 withFontProvider:32.0];
    v83[0] = v75;
    v74 = [(RouteAnnotationCell *)v4 stackView];
    v72 = [v74 leadingAnchor];
    v73 = [(RouteAnnotationCell *)v4 contentView];
    v71 = [v73 leadingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:16.0];
    v83[1] = v70;
    v69 = [(RouteAnnotationCell *)v4 contentView];
    v68 = [v69 trailingAnchor];
    v55 = [(RouteAnnotationCell *)v4 stackView];
    v56 = [v55 trailingAnchor];
    v57 = [v68 constraintEqualToAnchor:v56 constant:16.0];
    v83[2] = v57;
    v58 = [(RouteAnnotationCell *)v4 contentView];
    v59 = [v58 bottomAnchor];
    v60 = [(RouteAnnotationCell *)v4 stackView];
    v61 = [v60 bottomAnchor];
    v62 = [v59 constraintEqualToSystemSpacingBelowAnchor:v61 multiplier:1.0];
    v83[3] = v62;
    v63 = +[NSArray arrayWithObjects:v83 count:4];
    [v81 addObjectsFromArray:v63];

    v64 = [(RouteAnnotationCell *)v4 iconImageView];
    v65 = [v64 widthAnchor];
    v66 = [v65 constraintEqualToConstant:30.0];
    [v81 addObject:v66];

    +[NSLayoutConstraint activateConstraints:v81];
  }
  return v4;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)detailsLabel
{
  return self->_detailsLabel;
}

- (void)setDetailsLabel:(id)a3
{
}

- (UILabel)metadataLabel
{
  return self->_metadataLabel;
}

- (void)setMetadataLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_detailsLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end