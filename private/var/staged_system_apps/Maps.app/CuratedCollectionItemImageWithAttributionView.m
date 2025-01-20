@interface CuratedCollectionItemImageWithAttributionView
- (CuratedCollectionItemImageWithAttributionView)initWithCoder:(id)a3;
- (CuratedCollectionItemImageWithAttributionView)initWithFrame:(CGRect)a3;
- (NSString)attributionString;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)attributionLabel;
- (UIVisualEffectView)attributionBackgroundView;
- (void)_commonInit;
- (void)setAttributionBackgroundView:(id)a3;
- (void)setAttributionLabel:(id)a3;
- (void)setAttributionString:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation CuratedCollectionItemImageWithAttributionView

- (CuratedCollectionItemImageWithAttributionView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CuratedCollectionItemImageWithAttributionView;
  v3 = -[CuratedCollectionItemImageWithAttributionView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(CuratedCollectionItemImageWithAttributionView *)v3 setAccessibilityIdentifier:v5];

    [(CuratedCollectionItemImageWithAttributionView *)v3 _commonInit];
  }
  return v3;
}

- (CuratedCollectionItemImageWithAttributionView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionItemImageWithAttributionView;
  v3 = [(CuratedCollectionItemImageWithAttributionView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(CuratedCollectionItemImageWithAttributionView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [(CuratedCollectionItemImageWithAttributionView *)self theme];
  v4 = [v3 imageBackgroundColor];
  [(CuratedCollectionItemImageWithAttributionView *)self setBackgroundColor:v4];

  id v5 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionItemImageWithAttributionView *)self setImageView:v9];

  v10 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  [v11 setContentMode:2];

  v12 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  [v12 setAccessibilityIdentifier:@"ImageView"];

  v13 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  [(CuratedCollectionItemImageWithAttributionView *)self addSubview:v13];

  v14 = +[UIApplication sharedApplication];
  id v15 = [v14 userInterfaceLayoutDirection];

  if (v15 == (id)1) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  v98 = +[UIColorEffect colorEffectSaturate:1.0];
  v97 = +[UIBlurEffect effectWithBlurRadius:10.0];
  v17 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.200000003];
  v96 = +[UIVisualEffect effectCompositingColor:v17];

  v100[0] = v97;
  v100[1] = v98;
  v100[2] = v96;
  v18 = +[NSArray arrayWithObjects:v100 count:3];
  v95 = +[UIVisualEffect effectCombiningEffects:v18];

  id v19 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v95];
  [(CuratedCollectionItemImageWithAttributionView *)self setAttributionBackgroundView:v19];

  v20 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  [v21 _setCornerRadius:1 continuous:v16 maskedCorners:10.0];

  v22 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  [v22 setHidden:1];

  v23 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  [(CuratedCollectionItemImageWithAttributionView *)self addSubview:v23];

  id v24 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CuratedCollectionItemImageWithAttributionView *)self setAttributionLabel:v24];

  v25 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  v26 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  LODWORD(v27) = 1144750080;
  [v26 setContentHuggingPriority:0 forAxis:v27];

  v28 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  LODWORD(v29) = 1144750080;
  [v28 setContentHuggingPriority:1 forAxis:v29];

  v30 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  [v30 setOverrideUserInterfaceStyle:1];

  v31 = +[UIColor systemGray5Color];
  v32 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  [v32 setTextColor:v31];

  v33 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  +[DynamicTypeWizard autorefreshLabel:v33 withFontProvider:&stru_1013213E0];

  v34 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  [v34 setAccessibilityIdentifier:@"AttributionLabel"];

  v35 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v36 = [v35 contentView];
  v37 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  [v36 addSubview:v37];

  v94 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  v93 = [v94 topAnchor];
  v92 = [(CuratedCollectionItemImageWithAttributionView *)self topAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v99[0] = v91;
  v90 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  v89 = [v90 leadingAnchor];
  v88 = [(CuratedCollectionItemImageWithAttributionView *)self leadingAnchor];
  v87 = [v89 constraintEqualToAnchor:v88];
  v99[1] = v87;
  v86 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  v85 = [v86 trailingAnchor];
  v84 = [(CuratedCollectionItemImageWithAttributionView *)self trailingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v99[2] = v83;
  v82 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
  v81 = [v82 bottomAnchor];
  v80 = [(CuratedCollectionItemImageWithAttributionView *)self bottomAnchor];
  v79 = [v81 constraintEqualToAnchor:v80];
  v99[3] = v79;
  v78 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v77 = [v78 topAnchor];
  v76 = [(CuratedCollectionItemImageWithAttributionView *)self topAnchor];
  v75 = [v77 constraintGreaterThanOrEqualToAnchor:v76];
  v99[4] = v75;
  v74 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v73 = [v74 leadingAnchor];
  v72 = [(CuratedCollectionItemImageWithAttributionView *)self leadingAnchor];
  v71 = [v73 constraintGreaterThanOrEqualToAnchor:v72];
  v99[5] = v71;
  v70 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v69 = [v70 trailingAnchor];
  v68 = [(CuratedCollectionItemImageWithAttributionView *)self trailingAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v99[6] = v67;
  v66 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v65 = [v66 bottomAnchor];
  v64 = [(CuratedCollectionItemImageWithAttributionView *)self bottomAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v99[7] = v63;
  v62 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  v59 = [v62 topAnchor];
  v61 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v60 = [v61 contentView];
  v58 = [v60 topAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:3.0];
  v99[8] = v57;
  v56 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  v53 = [v56 leadingAnchor];
  v55 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v54 = [v55 contentView];
  v52 = [v54 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52 constant:5.0];
  v99[9] = v51;
  v50 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v49 = [v50 contentView];
  v48 = [v49 trailingAnchor];
  v38 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  v39 = [v38 trailingAnchor];
  v40 = [v48 constraintEqualToAnchor:v39 constant:5.0];
  v99[10] = v40;
  v41 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
  v42 = [v41 contentView];
  v43 = [v42 bottomAnchor];
  v44 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
  v45 = [v44 bottomAnchor];
  v46 = [v43 constraintEqualToAnchor:v45 constant:3.0];
  v99[11] = v46;
  v47 = +[NSArray arrayWithObjects:v99 count:12];
  +[NSLayoutConstraint activateConstraints:v47];
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    image = self->_image;
    objc_super v7 = [(CuratedCollectionItemImageWithAttributionView *)self imageView];
    [v7 setImage:image];

    id v5 = v8;
  }
}

- (void)setAttributionString:(id)a3
{
  p_attributionString = &self->_attributionString;
  id v10 = a3;
  if (!-[NSString isEqualToString:](*p_attributionString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_attributionString, a3);
    BOOL v6 = [(NSString *)*p_attributionString length] == 0;
    objc_super v7 = [(CuratedCollectionItemImageWithAttributionView *)self attributionBackgroundView];
    [v7 setHidden:v6];

    v8 = *p_attributionString;
    id v9 = [(CuratedCollectionItemImageWithAttributionView *)self attributionLabel];
    [v9 setText:v8];
  }
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)attributionString
{
  return self->_attributionString;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIVisualEffectView)attributionBackgroundView
{
  return self->_attributionBackgroundView;
}

- (void)setAttributionBackgroundView:(id)a3
{
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionLabel, 0);
  objc_storeStrong((id *)&self->_attributionBackgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_attributionString, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end